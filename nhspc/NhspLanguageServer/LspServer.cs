using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NhspCompiler.Core;
using NhspCompiler.Core.Diagnostics;
using NhspCompiler.Core.Lexing;
using NhspCompiler.Core.Parsing;
using NhspCompiler.Core.Parsing.Ast;

namespace NhspLanguageServer
{
    // One parsed snapshot of a document. We cache it so completion / hover /
    // definition / documentSymbol can all read the same lex+parse pass without
    // re-running it on every cursor move.
    internal sealed class DocumentEntry
    {
        public string Text;
        public List<Token> Tokens;
        public CompilationUnit Unit;
    }

    internal sealed class LspServer
    {
        private readonly Stream _input;
        private readonly Stream _output;
        private readonly Dictionary<string, DocumentEntry> _docs = new Dictionary<string, DocumentEntry>();
        private bool _shutdown;

        public LspServer(Stream input, Stream output)
        {
            _input = input;
            _output = output;
        }

        public void Run()
        {
            while (true)
            {
                JObject msg;
                try { msg = ReadMessage(); }
                catch (EndOfStreamException) { return; }
                if (msg == null) return;

                string method = (string)msg["method"];
                JToken id = msg["id"];
                JToken @params = msg["params"];

                try
                {
                    if (id != null) HandleRequest(id, method, @params);
                    else HandleNotification(method, @params);
                }
                catch (Exception ex)
                {
                    // Surface unexpected errors, but keep the server alive.
                    Console.Error.WriteLine("nhspls handler error: " + ex);
                    if (id != null) SendError(id, -32603, ex.Message);
                }

                if (_shutdown && method == "exit") return;
            }
        }

        // ============ Dispatch ============

        private void HandleRequest(JToken id, string method, JToken @params)
        {
            switch (method)
            {
                case "initialize":
                    SendResult(id, BuildInitializeResult());
                    break;
                case "shutdown":
                    _shutdown = true;
                    SendResult(id, null);
                    break;
                case "textDocument/documentSymbol":
                    SendResult(id, HandleDocumentSymbol(@params));
                    break;
                case "textDocument/completion":
                    SendResult(id, HandleCompletion(@params));
                    break;
                case "textDocument/hover":
                    SendResult(id, HandleHover(@params));
                    break;
                case "textDocument/definition":
                    SendResult(id, HandleDefinition(@params));
                    break;
                default:
                    // Methods we don't implement yet — return empty result.
                    SendResult(id, null);
                    break;
            }
        }

        private void HandleNotification(string method, JToken @params)
        {
            switch (method)
            {
                case "initialized":
                    break;
                case "textDocument/didOpen":
                    {
                        var td = @params["textDocument"];
                        string uri = (string)td["uri"];
                        string text = (string)td["text"];
                        UpdateDocument(uri, text);
                    }
                    break;
                case "textDocument/didChange":
                    {
                        string uri = (string)@params["textDocument"]["uri"];
                        // We declare textDocumentSync = Full (1), so each change carries
                        // the entire new document text in contentChanges[0].text.
                        var changes = (JArray)@params["contentChanges"];
                        if (changes != null && changes.Count > 0)
                        {
                            string text = (string)changes[changes.Count - 1]["text"];
                            UpdateDocument(uri, text);
                        }
                    }
                    break;
                case "textDocument/didClose":
                    {
                        string uri = (string)@params["textDocument"]["uri"];
                        _docs.Remove(uri);
                        // Clear diagnostics for the closed file so old squiggles disappear.
                        PublishDiagnostics(uri, new List<JObject>());
                    }
                    break;
                case "exit":
                    _shutdown = true;
                    break;
            }
        }

        // ============ Document store ============

        private void UpdateDocument(string uri, string text)
        {
            var entry = new DocumentEntry { Text = text ?? string.Empty };
            var bag = new DiagnosticBag();
            try
            {
                var lexer = new Lexer(entry.Text, "<lsp>");
                entry.Tokens = lexer.Tokenize();
                var parser = new Parser(entry.Tokens, bag);
                entry.Unit = parser.ParseCompilationUnit();
            }
            catch (Exception ex)
            {
                bag.Error(1, 1, "internal: " + ex.Message);
            }
            _docs[uri] = entry;

            var diags = new List<JObject>();
            foreach (var d in bag.Items) diags.Add(ToLspDiagnostic(d));
            PublishDiagnostics(uri, diags);
        }

        private DocumentEntry GetDoc(JToken @params)
        {
            string uri = (string)@params?["textDocument"]?["uri"];
            if (uri == null) return null;
            DocumentEntry e;
            return _docs.TryGetValue(uri, out e) ? e : null;
        }

        private static (int line, int col) GetPos(JToken @params)
        {
            // LSP positions are 0-based; nhspc's tokens/AST use 1-based.
            var pos = @params?["position"];
            int line = pos?["line"]?.Value<int>() ?? 0;
            int ch = pos?["character"]?.Value<int>() ?? 0;
            return (line + 1, ch + 1);
        }

        private static JObject ToLspDiagnostic(Diagnostic d)
        {
            // nhspc lines are 1-based, columns 1-based; LSP wants 0-based.
            int line = Math.Max(0, d.Line - 1);
            int col = Math.Max(0, d.Column - 1);
            int severity = d.Severity == Severity.Error ? 1
                         : d.Severity == Severity.Warning ? 2
                         : 3; // Info / Hint fold into Information
            return new JObject
            {
                ["range"] = new JObject
                {
                    ["start"] = new JObject { ["line"] = line, ["character"] = col },
                    ["end"]   = new JObject { ["line"] = line, ["character"] = col + 1 }
                },
                ["severity"] = severity,
                ["source"] = "nhspc",
                ["message"] = d.Message ?? string.Empty
            };
        }

        private void PublishDiagnostics(string uri, List<JObject> diagnostics)
        {
            var arr = new JArray();
            foreach (var d in diagnostics) arr.Add(d);
            var notif = new JObject
            {
                ["jsonrpc"] = "2.0",
                ["method"] = "textDocument/publishDiagnostics",
                ["params"] = new JObject
                {
                    ["uri"] = uri,
                    ["diagnostics"] = arr
                }
            };
            WriteMessage(notif);
        }

        // ============ initialize result ============

        private static JObject BuildInitializeResult()
        {
            return new JObject
            {
                ["capabilities"] = new JObject
                {
                    // 1 = Full document sync (client sends entire doc on each change)
                    ["textDocumentSync"] = 1,
                    ["documentSymbolProvider"] = true,
                    ["definitionProvider"] = true,
                    ["hoverProvider"] = true,
                    ["completionProvider"] = new JObject
                    {
                        ["triggerCharacters"] = new JArray("#", ".")
                    },
                },
                ["serverInfo"] = new JObject
                {
                    ["name"] = "nhspls",
                    ["version"] = "0.2.0"
                }
            };
        }

        // ============ documentSymbol ============

        private JArray HandleDocumentSymbol(JToken @params)
        {
            var doc = GetDoc(@params);
            var result = new JArray();
            if (doc?.Unit == null) return result;

            // Class members → DocumentSymbol[] hierarchy. The line/col we have
            // points at the declaration keyword; for a "selection range" we use
            // the same point-range to keep things simple.
            foreach (var cls in doc.Unit.Classes)
                result.Add(BuildClassSymbol(cls));
            foreach (var iface in doc.Unit.Interfaces)
                result.Add(BuildInterfaceSymbol(iface));
            foreach (var en in doc.Unit.Enums)
                result.Add(BuildPlainSymbol(en.Name, SymbolKindEnum, en.Line, en.Column));
            foreach (var del in doc.Unit.Delegates)
                result.Add(BuildPlainSymbol(del.Name, SymbolKindFunction, del.Line, del.Column));

            return result;
        }

        // LSP SymbolKind values
        private const int SymbolKindClass = 5;
        private const int SymbolKindMethod = 6;
        private const int SymbolKindProperty = 7;
        private const int SymbolKindField = 8;
        private const int SymbolKindConstructor = 9;
        private const int SymbolKindEnum = 10;
        private const int SymbolKindInterface = 11;
        private const int SymbolKindFunction = 12;
        private const int SymbolKindEvent = 24;
        private const int SymbolKindOperator = 25;

        private static JObject BuildClassSymbol(ClassDeclaration cls)
        {
            var children = new JArray();
            foreach (var f in cls.Fields)
                children.Add(BuildPlainSymbol(f.Name, SymbolKindField, f.Line, f.Column));
            foreach (var c in cls.Constructors)
                children.Add(BuildPlainSymbol(cls.Name, SymbolKindConstructor, c.Line, c.Column));
            foreach (var m in cls.Methods)
                children.Add(BuildPlainSymbol(m.Name, SymbolKindMethod, m.Line, m.Column));
            foreach (var p in cls.Properties)
                children.Add(BuildPlainSymbol(p.Name, SymbolKindProperty, p.Line, p.Column));
            foreach (var ev in cls.Events)
                children.Add(BuildPlainSymbol(ev.Name, SymbolKindEvent, ev.Line, ev.Column));
            foreach (var op in cls.Operators)
                children.Add(BuildPlainSymbol(op.Operator ?? "op", SymbolKindOperator, op.Line, op.Column));
            foreach (var nest in cls.NestedClasses)
                children.Add(BuildClassSymbol(nest));

            int kind = cls.IsStruct ? SymbolKindClass : SymbolKindClass;
            var sym = BuildPlainSymbol(cls.Name ?? "<class>", kind, cls.Line, cls.Column);
            sym["children"] = children;
            return sym;
        }

        private static JObject BuildInterfaceSymbol(InterfaceDeclaration iface)
        {
            var children = new JArray();
            foreach (var m in iface.Methods)
                children.Add(BuildPlainSymbol(m.Name, SymbolKindMethod, m.Line, m.Column));
            var sym = BuildPlainSymbol(iface.Name ?? "<interface>", SymbolKindInterface, iface.Line, iface.Column);
            sym["children"] = children;
            return sym;
        }

        private static JObject BuildPlainSymbol(string name, int kind, int line, int col)
        {
            var range = MakePointRange(line, col, name?.Length ?? 1);
            return new JObject
            {
                ["name"] = name ?? "",
                ["kind"] = kind,
                ["range"] = range,
                ["selectionRange"] = range
            };
        }

        private static JObject MakePointRange(int line, int col, int length)
        {
            int l = Math.Max(0, line - 1);
            int c = Math.Max(0, col - 1);
            return new JObject
            {
                ["start"] = new JObject { ["line"] = l, ["character"] = c },
                ["end"] = new JObject { ["line"] = l, ["character"] = c + Math.Max(1, length) }
            };
        }

        // ============ completion ============

        private JArray HandleCompletion(JToken @params)
        {
            var doc = GetDoc(@params);
            var (line, col) = GetPos(@params);
            var items = new JArray();
            if (doc == null) return items;

            // Decide context: are we right after a '#' (directive)?
            bool afterHash = IsAfterHash(doc.Text, line, col);

            if (afterHash)
            {
                foreach (var d in DirectiveCompletions)
                    items.Add(MakeCompletionItem(d.label, d.detail, CompletionKindKeyword));
                return items;
            }

            // Default: keywords + types + user-defined classes/methods.
            foreach (var kw in NhspCompiler.Core.Lexing.Keywords.All)
                items.Add(MakeCompletionItem(kw, "keyword", CompletionKindKeyword));
            foreach (var t in NhspCompiler.Core.Lexing.Keywords.TypeAliases)
                items.Add(MakeCompletionItem(t.Key, t.Value, CompletionKindStruct));

            if (doc.Unit != null)
            {
                foreach (var cls in doc.Unit.Classes)
                    items.Add(MakeCompletionItem(cls.Name, "class", CompletionKindClass));
                foreach (var iface in doc.Unit.Interfaces)
                    items.Add(MakeCompletionItem(iface.Name, "interface", CompletionKindInterface));
            }
            return items;
        }

        // LSP CompletionItemKind
        private const int CompletionKindKeyword = 14;
        private const int CompletionKindClass = 7;
        private const int CompletionKindInterface = 8;
        private const int CompletionKindStruct = 22;

        private static readonly (string label, string detail)[] DirectiveCompletions = new (string, string)[]
        {
            ("assembly",      "#assembly \"Name\" [, exe]"),
            ("reference",     "#reference \"Lib.dll\""),
            ("namespace",     "#namespace \"NS\""),
            ("endnamespace",  "#endnamespace"),
            ("class",         "#class [modifiers] Name [: Base]"),
            ("endclass",      "#endclass"),
            ("interface",     "#interface Name"),
            ("endinterface",  "#endinterface"),
            ("struct",        "#struct [modifiers] Name"),
            ("endstruct",     "#endstruct"),
            ("enum",          "#enum Name"),
            ("endenum",       "#endenum"),
            ("delegate",      "#delegate [modifiers] [ret] Name [, params]"),
            ("func",          "#func [modifiers] [ret] Name [, params]"),
            ("endfunc",       "#endfunc"),
            ("init",          "#init [params]"),
            ("endinit",       "#endinit"),
            ("field",         "#field [modifiers] Type Name"),
            ("property",      "#property Name as Type"),
            ("endproperty",   "#endproperty"),
            ("event",         "#event [modifiers] DelegateType Name"),
            ("endevent",      "#endevent"),
            ("indexer",       "#indexer [modifiers] Type [, params]"),
            ("endindexer",    "#endindexer"),
            ("operator",      "#operator RetType Op, params"),
            ("endoperator",   "#endoperator"),
            ("destructor",    "#destructor"),
            ("enddestructor", "#enddestructor"),
            ("dllimport",     "#dllimport \"dll\""),
            ("dllfunc",       "#dllfunc [modifiers] [ret] Name [, params]"),
            ("attribute",     "#attribute Name, \"value\""),
            ("include",       "#include \"file.nhsp\""),
            ("main",          "#main"),
            ("endmain",       "#endmain"),
            ("version",       "#version \"1.0.0.0\" — AssemblyVersion"),
            ("fileversion",   "#fileversion \"1.0.0.0\" — AssemblyFileVersion"),
            ("infoversion",   "#infoversion \"1.0.0-rc1\" — AssemblyInformationalVersion"),
            ("title",         "#title \"App\" — AssemblyTitle / FileDescription"),
            ("description",   "#description \"...\" — AssemblyDescription"),
            ("company",       "#company \"...\" — AssemblyCompany"),
            ("product",       "#product \"...\" — AssemblyProduct"),
            ("copyright",     "#copyright \"...\" — AssemblyCopyright"),
            ("trademark",     "#trademark \"...\" — AssemblyTrademark"),
            ("icon",          "#icon \"logo.png\" — embed Win32 application icon"),
            ("manifest",      "#manifest \"app.manifest\" — embed Win32 manifest"),
        };

        private static bool IsAfterHash(string text, int line, int col)
        {
            // line/col are 1-based. Find the start of the requested line and look
            // at the character immediately before the cursor.
            int idx = LineColToOffset(text, line, col);
            if (idx <= 0) return false;
            int p = idx - 1;
            // Allow a single identifier-char after '#' so "#cl|" still suggests directives.
            while (p > 0 && IsWordChar(text[p])) p--;
            return text[p] == '#';
        }

        private static bool IsWordChar(char c) =>
            (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '_';

        private static int LineColToOffset(string text, int line, int col)
        {
            if (string.IsNullOrEmpty(text)) return 0;
            int curLine = 1, curCol = 1, i = 0;
            while (i < text.Length)
            {
                if (curLine == line && curCol == col) return i;
                char ch = text[i];
                if (ch == '\n') { curLine++; curCol = 1; }
                else { curCol++; }
                i++;
                if (curLine == line && curCol == col) return i;
            }
            return text.Length;
        }

        private static JObject MakeCompletionItem(string label, string detail, int kind)
        {
            return new JObject
            {
                ["label"] = label,
                ["kind"] = kind,
                ["detail"] = detail ?? ""
            };
        }

        // ============ hover ============

        private JObject HandleHover(JToken @params)
        {
            var doc = GetDoc(@params);
            var (line, col) = GetPos(@params);
            if (doc == null) return null;

            // Find the token at or just before the cursor.
            var tok = TokenAt(doc, line, col);
            if (tok == null) return null;

            string md = HoverMarkdown(tok.Value, doc);
            if (md == null) return null;

            return new JObject
            {
                ["contents"] = new JObject
                {
                    ["kind"] = "markdown",
                    ["value"] = md
                },
                ["range"] = MakePointRange(tok.Value.Line, tok.Value.Column, tok.Value.Text?.Length ?? 1)
            };
        }

        private static Token? TokenAt(DocumentEntry doc, int line, int col)
        {
            if (doc.Tokens == null) return null;
            // Pick the token whose [col, col+len) range contains the cursor on the same line.
            for (int i = 0; i < doc.Tokens.Count; i++)
            {
                var t = doc.Tokens[i];
                if (t.Line != line) continue;
                int len = string.IsNullOrEmpty(t.Text) ? 1 : t.Text.Length;
                if (col >= t.Column && col <= t.Column + len) return t;
            }
            return null;
        }

        private static string HoverMarkdown(Token t, DocumentEntry doc)
        {
            if (t.Kind == TokenKind.TypeName)
            {
                if (NhspCompiler.Core.Lexing.Keywords.TypeAliases.TryGetValue(t.Text, out string clr))
                    return $"```\n{t.Text} → {clr}\n```";
            }
            if (t.Kind == TokenKind.Keyword)
                return $"**{t.Text}** &mdash; NHSP keyword";
            if (t.Kind == TokenKind.Identifier && doc.Unit != null)
            {
                // Look up user-defined symbol
                foreach (var cls in doc.Unit.Classes)
                {
                    if (cls.Name == t.Text)
                        return $"```\n{(cls.IsStruct ? "struct" : "class")} {cls.Name}\n```";
                    foreach (var m in cls.Methods)
                        if (m.Name == t.Text)
                            return $"```\n{m.ReturnType} {cls.Name}.{m.Name}(...)\n```";
                    foreach (var f in cls.Fields)
                        if (f.Name == t.Text)
                            return $"```\n{f.TypeName} {cls.Name}.{f.Name}\n```";
                }
                foreach (var iface in doc.Unit.Interfaces)
                    if (iface.Name == t.Text)
                        return $"```\ninterface {iface.Name}\n```";
                foreach (var en in doc.Unit.Enums)
                    if (en.Name == t.Text)
                        return $"```\nenum {en.Name}\n```";
            }
            return null;
        }

        // ============ definition ============

        private JToken HandleDefinition(JToken @params)
        {
            var doc = GetDoc(@params);
            var (line, col) = GetPos(@params);
            if (doc?.Unit == null) return null;
            var tok = TokenAt(doc, line, col);
            if (tok == null || tok.Value.Kind != TokenKind.Identifier) return null;

            string name = tok.Value.Text;
            string uri = (string)@params["textDocument"]["uri"];

            foreach (var cls in doc.Unit.Classes)
            {
                if (cls.Name == name) return MakeLocation(uri, cls.Line, cls.Column, name.Length);
                foreach (var m in cls.Methods)
                    if (m.Name == name) return MakeLocation(uri, m.Line, m.Column, name.Length);
                foreach (var f in cls.Fields)
                    if (f.Name == name) return MakeLocation(uri, f.Line, f.Column, name.Length);
                foreach (var p in cls.Properties)
                    if (p.Name == name) return MakeLocation(uri, p.Line, p.Column, name.Length);
            }
            foreach (var iface in doc.Unit.Interfaces)
                if (iface.Name == name) return MakeLocation(uri, iface.Line, iface.Column, name.Length);
            foreach (var en in doc.Unit.Enums)
                if (en.Name == name) return MakeLocation(uri, en.Line, en.Column, name.Length);
            foreach (var del in doc.Unit.Delegates)
                if (del.Name == name) return MakeLocation(uri, del.Line, del.Column, name.Length);
            return null;
        }

        private static JObject MakeLocation(string uri, int line, int col, int length)
        {
            return new JObject
            {
                ["uri"] = uri,
                ["range"] = MakePointRange(line, col, length)
            };
        }

        // ============ Wire format (JSON-RPC over stdio) ============

        private JObject ReadMessage()
        {
            // Parse Content-Length header, then read N bytes.
            int contentLength = -1;
            while (true)
            {
                string header = ReadHeaderLine();
                if (header == null) return null;
                if (header.Length == 0) break; // blank line = end of headers
                int colon = header.IndexOf(':');
                if (colon > 0)
                {
                    string name = header.Substring(0, colon).Trim();
                    string value = header.Substring(colon + 1).Trim();
                    if (string.Equals(name, "Content-Length", StringComparison.OrdinalIgnoreCase))
                        contentLength = int.Parse(value);
                }
            }
            if (contentLength <= 0) return null;

            byte[] buf = new byte[contentLength];
            int read = 0;
            while (read < contentLength)
            {
                int n = _input.Read(buf, read, contentLength - read);
                if (n <= 0) throw new EndOfStreamException();
                read += n;
            }
            string json = Encoding.UTF8.GetString(buf);
            return JObject.Parse(json);
        }

        private string ReadHeaderLine()
        {
            var sb = new StringBuilder();
            int prev = -1;
            while (true)
            {
                int b = _input.ReadByte();
                if (b < 0) return sb.Length == 0 ? null : sb.ToString();
                if (prev == '\r' && b == '\n')
                {
                    sb.Length -= 1; // drop the '\r'
                    return sb.ToString();
                }
                sb.Append((char)b);
                prev = b;
            }
        }

        private void WriteMessage(JObject obj)
        {
            string json = obj.ToString(Formatting.None);
            byte[] body = Encoding.UTF8.GetBytes(json);
            byte[] header = Encoding.ASCII.GetBytes("Content-Length: " + body.Length + "\r\n\r\n");
            _output.Write(header, 0, header.Length);
            _output.Write(body, 0, body.Length);
            _output.Flush();
        }

        private void SendResult(JToken id, JToken result)
        {
            var msg = new JObject
            {
                ["jsonrpc"] = "2.0",
                ["id"] = id,
                ["result"] = result ?? JValue.CreateNull()
            };
            WriteMessage(msg);
        }

        private void SendError(JToken id, int code, string message)
        {
            var msg = new JObject
            {
                ["jsonrpc"] = "2.0",
                ["id"] = id,
                ["error"] = new JObject
                {
                    ["code"] = code,
                    ["message"] = message ?? string.Empty
                }
            };
            WriteMessage(msg);
        }
    }
}
