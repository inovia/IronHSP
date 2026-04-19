using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
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
        // #include-resolved auxiliary units (transitive), each with the absolute
        // file path it came from. Stored separately from Unit so diagnostics keep
        // their original line numbers against the open document.
        public List<AuxUnit> Aux;
    }

    internal sealed class AuxUnit
    {
        public string AbsolutePath;
        public CompilationUnit Unit;
    }

    internal sealed class LspServer
    {
        private readonly Stream _input;
        private readonly Stream _output;
        private readonly Dictionary<string, DocumentEntry> _docs = new Dictionary<string, DocumentEntry>();
        // Workspace-wide parsed units, keyed by absolute file path (OrdinalIgnoreCase
        // to match Windows semantics). Populated once on `initialized` and refreshed
        // whenever a document is opened/changed.
        private readonly Dictionary<string, CompilationUnit> _workspaceUnits
            = new Dictionary<string, CompilationUnit>(StringComparer.OrdinalIgnoreCase);
        private readonly List<string> _workspaceRoots = new List<string>();
        // Docs extracted from `<DllName>.xml` files that sit next to referenced
        // assemblies. Key = simple identifier ("User", "Greet"), value = already-
        // rendered Markdown. Multiple assemblies can contribute entries; last
        // write wins (rare in practice).
        private readonly Dictionary<string, string> _referencedDocs
            = new Dictionary<string, string>(StringComparer.Ordinal);
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
                    CaptureWorkspaceRoots(@params);
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
                    // Workspace scan is deferred until after the client is ready so
                    // the initialize handshake stays snappy. Large workspaces are
                    // still indexed synchronously here — acceptable since `.nhsp`
                    // files are tiny and file count is bounded for real projects.
                    ScanWorkspace();
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

                // Resolve #include transitively so hover/completion/definition
                // can see symbols in the included files. Failed reads are silently
                // ignored — the main document's diagnostics must not regress.
                entry.Aux = LoadIncludes(entry.Unit, uri);

                // Keep the workspace cache in sync with the open document —
                // without this, edits wouldn't surface until the user restarts.
                RefreshWorkspaceUnit(uri, entry.Unit);

                // Phase C: pull XML docs from any `<Dll>.xml` sibling of
                // `#reference`d assemblies into `_referencedDocs`.
                LoadReferencedXmlDocs(entry.Unit, uri);
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

        // Walk `unit.Includes` recursively and parse each included .nhsp file.
        // Paths are resolved relative to the including file. Cycles are broken
        // by the `seen` set. Parse errors in aux files are dropped (main doc
        // diagnostics are authoritative).
        private static List<AuxUnit> LoadIncludes(CompilationUnit unit, string uri)
        {
            var result = new List<AuxUnit>();
            string baseFile = UriToPath(uri);
            if (baseFile == null) return result;
            var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { Path.GetFullPath(baseFile) };
            LoadIncludesRec(unit, Path.GetDirectoryName(baseFile) ?? ".", seen, result);
            return result;
        }

        private static void LoadIncludesRec(CompilationUnit unit, string baseDir,
            HashSet<string> seen, List<AuxUnit> result)
        {
            if (unit?.Includes == null) return;
            foreach (var inc in unit.Includes)
            {
                string path;
                try { path = Path.GetFullPath(Path.Combine(baseDir, inc)); }
                catch { continue; }
                if (!seen.Add(path)) continue;
                if (!File.Exists(path)) continue;
                string src;
                try { src = File.ReadAllText(path); }
                catch { continue; }

                CompilationUnit child = null;
                try
                {
                    var bag = new DiagnosticBag();
                    var tokens = new Lexer(src, path).Tokenize();
                    child = new Parser(tokens, bag).ParseCompilationUnit();
                }
                catch { continue; }
                if (child == null) continue;

                result.Add(new AuxUnit { AbsolutePath = path, Unit = child });
                LoadIncludesRec(child, Path.GetDirectoryName(path) ?? ".", seen, result);
            }
        }

        private static string UriToPath(string uri)
        {
            if (string.IsNullOrEmpty(uri)) return null;
            try
            {
                var u = new Uri(uri);
                return u.IsFile ? u.LocalPath : null;
            }
            catch { return null; }
        }

        // Enumerate the main unit + include-resolved units + workspace-wide units.
        // Workspace units are deduped against the doc's own absolute path and any
        // aux paths so we don't return the same file twice (which would double up
        // completion candidates).
        private IEnumerable<CompilationUnit> AllUnits(DocumentEntry doc)
        {
            var seenPaths = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            string docPath = null;
            // The caller owns the URI → path conversion context, but for dedup we
            // need the doc's path. We can recover it from the _docs map if needed;
            // here we just skip dedup for the main doc (it's always first).
            if (doc?.Unit != null) yield return doc.Unit;
            if (doc?.Aux != null)
            {
                foreach (var a in doc.Aux)
                {
                    seenPaths.Add(a.AbsolutePath);
                    yield return a.Unit;
                }
            }
            // Locate the document's own path so workspace-wide results don't return it again.
            foreach (var kv in _docs)
            {
                if (ReferenceEquals(kv.Value, doc))
                {
                    docPath = UriToPath(kv.Key);
                    if (docPath != null) seenPaths.Add(Path.GetFullPath(docPath));
                    break;
                }
            }
            foreach (var kv in _workspaceUnits)
            {
                if (seenPaths.Contains(kv.Key)) continue;
                yield return kv.Value;
            }
        }

        // ============ workspace scan (Phase B) ============

        // Pull rootUri / rootPath / workspaceFolders out of initialize params.
        private void CaptureWorkspaceRoots(JToken @params)
        {
            if (@params == null) return;
            var roots = new List<string>();

            var folders = @params["workspaceFolders"];
            if (folders is JArray arr)
            {
                foreach (var f in arr)
                {
                    string uri = (string)f?["uri"];
                    string p = UriToPath(uri);
                    if (p != null) roots.Add(p);
                }
            }
            string rootUri = (string)@params["rootUri"];
            if (rootUri != null)
            {
                string p = UriToPath(rootUri);
                if (p != null && !roots.Contains(p, StringComparer.OrdinalIgnoreCase))
                    roots.Add(p);
            }
            string rootPath = (string)@params["rootPath"];
            if (!string.IsNullOrEmpty(rootPath) && !roots.Contains(rootPath, StringComparer.OrdinalIgnoreCase))
                roots.Add(rootPath);

            _workspaceRoots.Clear();
            _workspaceRoots.AddRange(roots);
        }

        // Scan each workspace root for `*.nhsp` and store their parsed units.
        // Parse errors are swallowed — broken files simply don't contribute symbols.
        private void ScanWorkspace()
        {
            _workspaceUnits.Clear();
            foreach (var root in _workspaceRoots)
            {
                if (!Directory.Exists(root)) continue;
                string[] files;
                try { files = Directory.GetFiles(root, "*.nhsp", SearchOption.AllDirectories); }
                catch { continue; }
                foreach (var path in files)
                {
                    string key = Path.GetFullPath(path);
                    string text;
                    try { text = File.ReadAllText(path); }
                    catch { continue; }
                    CompilationUnit unit = null;
                    try
                    {
                        var bag = new DiagnosticBag();
                        var toks = new Lexer(text, path).Tokenize();
                        unit = new Parser(toks, bag).ParseCompilationUnit();
                    }
                    catch { continue; }
                    if (unit != null) _workspaceUnits[key] = unit;
                }
            }
        }

        // Refresh the workspace cache for a single file after it's been edited.
        private void RefreshWorkspaceUnit(string uri, CompilationUnit unit)
        {
            string path = UriToPath(uri);
            if (path == null || unit == null) return;
            _workspaceUnits[Path.GetFullPath(path)] = unit;
        }

        // ============ Phase C: referenced-assembly XML docs ============

        // For each `#reference "path.dll"` in the unit, look for a sibling
        // `path.xml` and ingest its `<member>` entries into `_referencedDocs`.
        private void LoadReferencedXmlDocs(CompilationUnit unit, string uri)
        {
            if (unit?.References == null) return;
            string baseDir = null;
            string docPath = UriToPath(uri);
            if (docPath != null) baseDir = Path.GetDirectoryName(docPath);

            foreach (var refPath in unit.References)
            {
                string dllPath = refPath;
                if (baseDir != null && !Path.IsPathRooted(dllPath))
                    dllPath = Path.Combine(baseDir, dllPath);
                string xmlPath = Path.ChangeExtension(dllPath, ".xml");
                if (!File.Exists(xmlPath)) continue;
                try { IngestXmlDoc(xmlPath); }
                catch { /* ignore malformed XML */ }
            }
        }

        private void IngestXmlDoc(string xmlPath)
        {
            var xd = new XmlDocument();
            xd.Load(xmlPath);
            var members = xd.SelectNodes("/doc/members/member");
            if (members == null) return;

            foreach (XmlNode m in members)
            {
                string id = m.Attributes?["name"]?.Value;
                if (string.IsNullOrEmpty(id) || id.Length < 3 || id[1] != ':') continue;

                // Strip prefix and any `(paramlist)` suffix.
                string bare = id.Substring(2);
                int paren = bare.IndexOf('(');
                if (paren >= 0) bare = bare.Substring(0, paren);
                int dot = bare.LastIndexOf('.');
                string simple = dot >= 0 ? bare.Substring(dot + 1) : bare;
                if (simple == "#ctor") simple = dot >= 0 ? bare.Substring(0, dot) : bare;

                string summary = m.SelectSingleNode("summary")?.InnerText?.Trim();
                var parms = m.SelectNodes("param");
                string returns = m.SelectSingleNode("returns")?.InnerText?.Trim();

                var sb = new StringBuilder();
                sb.Append("```\n").Append(id).Append("\n```");
                if (!string.IsNullOrEmpty(summary)) sb.Append("\n\n").Append(summary);
                if (parms != null && parms.Count > 0)
                {
                    sb.Append("\n\n**Parameters**\n");
                    foreach (XmlNode p in parms)
                    {
                        string n = p.Attributes?["name"]?.Value ?? "";
                        sb.Append("\n- **`").Append(n).Append("`** — ").Append(p.InnerText.Trim());
                    }
                }
                if (!string.IsNullOrEmpty(returns))
                    sb.Append("\n\n**Returns** — ").Append(returns);

                // Last write wins — fine, since duplicate simple names across
                // multiple referenced DLLs are rare.
                _referencedDocs[simple] = sb.ToString();
            }
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

            var added = new HashSet<string>(StringComparer.Ordinal);
            foreach (var unit in AllUnits(doc))
            {
                foreach (var cls in unit.Classes)
                    if (added.Add("C:" + cls.Name))
                        items.Add(MakeCompletionItem(cls.Name, "class", CompletionKindClass, cls.Documentation));
                foreach (var iface in unit.Interfaces)
                    if (added.Add("I:" + iface.Name))
                        items.Add(MakeCompletionItem(iface.Name, "interface", CompletionKindInterface, iface.Documentation));
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

        private static JObject MakeCompletionItem(string label, string detail, int kind, string documentation = null)
        {
            var item = new JObject
            {
                ["label"] = label,
                ["kind"] = kind,
                ["detail"] = detail ?? ""
            };
            if (!string.IsNullOrWhiteSpace(documentation))
            {
                // Flatten doc to a plain markdown string for CompletionItem.
                // (MarkupContent works fine here — VS/VSCode both render it in
                // the completion details popup. The hover popup is the one
                // with MarkupContent rendering issues in VS 2022.)
                var sb = new StringBuilder();
                sb.Append("```\n").Append(detail ?? label).Append("\n```\n\n");
                sb.Append(documentation.Replace("@param ", "\n@param ")
                                       .Replace("@return ", "\n@return "));
                item["documentation"] = new JObject
                {
                    ["kind"] = "markdown",
                    ["value"] = sb.ToString()
                };
            }
            return item;
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

            JToken contents = HoverContents(tok.Value, doc);
            if (contents == null) return null;

            return new JObject
            {
                ["contents"] = contents,
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

        // Build the LSP `Hover.contents` payload as `MarkupContent`
        // (`{ kind: "markdown", value: ... }`). VS 2022's LSP client renders
        // this with syntax highlighting and markdown formatting — unlike
        // `MarkedString[]` which is treated as plain text (raw `**` leaks).
        private JToken HoverContents(Token t, DocumentEntry doc)
        {
            if (t.Kind == TokenKind.TypeName)
            {
                if (NhspCompiler.Core.Lexing.Keywords.TypeAliases.TryGetValue(t.Text, out string clr))
                    return BuildHover($"{t.Text} → {clr}", null);
            }
            if (t.Kind == TokenKind.Keyword)
                return MarkupContentObject($"**{t.Text}** — NHSP keyword");
            if (t.Kind == TokenKind.Identifier)
            {
                foreach (var unit in AllUnits(doc))
                {
                    foreach (var cls in unit.Classes)
                    {
                        if (cls.Name == t.Text)
                            return BuildHover($"{(cls.IsStruct ? "struct" : "class")} {cls.Name}", cls.Documentation);

                        foreach (var m in cls.Methods)
                            if (m.Name == t.Text)
                                return BuildHover(FormatMethodSig(cls, m), m.Documentation);

                        foreach (var f in cls.Fields)
                            if (f.Name == t.Text)
                                return BuildHover($"{f.TypeName} {cls.Name}.{f.Name}", f.Documentation);

                        foreach (var p in cls.Properties)
                            if (p.Name == t.Text)
                                return BuildHover($"{p.TypeName} {cls.Name}.{p.Name} {{ get; set; }}", p.Documentation);
                    }
                    foreach (var iface in unit.Interfaces)
                        if (iface.Name == t.Text)
                            return BuildHover($"interface {iface.Name}", iface.Documentation);
                    foreach (var en in unit.Enums)
                        if (en.Name == t.Text)
                            return BuildHover($"enum {en.Name}", en.Documentation);
                    foreach (var del in unit.Delegates)
                        if (del.Name == t.Text)
                            return BuildHover($"delegate {del.ReturnType} {del.Name}(...)", del.Documentation);
                }

                // Phase C fallback: referenced-assembly XML docs. Each entry is
                // already a full markdown block (with its own code fence).
                if (_referencedDocs.TryGetValue(t.Text, out string refDoc))
                    return MarkupContentObject(refDoc);
            }
            return null;
        }

        // Build the hover body as plain text wrapped in MarkupContent {kind:"plaintext"}.
        //
        // Why plaintext and not markdown: VS 2022's built-in LSP client silently
        // drops the trailing portion of MarkupContent markdown — users see only
        // the first code-block section, no summary/param/return body. With
        // plaintext the entire content renders reliably in both VS 2022 and
        // VS Code. We lose bold/monospace coloring but gain the full doc text.
        //
        // Visual structure without markdown: use blank lines + ASCII arrows
        // ("→", "─") for separators and indentation to group param/return info.
        private static JToken BuildHover(string signature, string doc)
        {
            var sb = new StringBuilder();
            if (!string.IsNullOrEmpty(signature))
                sb.Append(signature);

            if (!string.IsNullOrWhiteSpace(doc))
            {
                var summary = new StringBuilder();
                var paramLines = new List<string>();
                string returnLine = null;

                foreach (var raw in doc.Split('\n'))
                {
                    string line = raw.TrimEnd();
                    string trim = line.TrimStart();
                    if (trim.StartsWith("@param ", StringComparison.Ordinal))
                    {
                        string rest = trim.Substring("@param ".Length).TrimStart();
                        int sp = rest.IndexOf(' ');
                        if (sp > 0)
                            paramLines.Add($"    {rest.Substring(0, sp)} — {rest.Substring(sp + 1).TrimStart()}");
                        else
                            paramLines.Add($"    {rest}");
                    }
                    else if (trim.StartsWith("@return ", StringComparison.Ordinal))
                        returnLine = trim.Substring("@return ".Length).TrimStart();
                    else if (trim.Equals("@return", StringComparison.Ordinal))
                        returnLine = "";
                    else
                        summary.AppendLine(line);
                }

                string summaryStr = summary.ToString().Trim();
                if (summaryStr.Length > 0)
                {
                    if (sb.Length > 0) sb.Append("\n\n");
                    sb.Append(summaryStr);
                }
                if (paramLines.Count > 0)
                {
                    if (sb.Length > 0) sb.Append("\n\n");
                    sb.Append("Parameters:\n").Append(string.Join("\n", paramLines));
                }
                if (returnLine != null)
                {
                    if (sb.Length > 0) sb.Append("\n\n");
                    sb.Append("Returns: ").Append(returnLine);
                }
            }
            if (sb.Length == 0) return null;
            return new JObject { ["kind"] = "plaintext", ["value"] = sb.ToString() };
        }

        private static JObject MarkupContentObject(string markdown) =>
            new JObject { ["kind"] = "markdown", ["value"] = markdown };

        private static string FormatMethodSig(ClassDeclaration cls, MethodDeclaration m)
        {
            var sb = new StringBuilder();
            sb.Append(m.ReturnType).Append(' ').Append(cls.Name).Append('.').Append(m.Name).Append('(');
            for (int i = 0; i < m.Parameters.Count; i++)
            {
                if (i > 0) sb.Append(", ");
                var p = m.Parameters[i];
                if (p.IsRef) sb.Append("ref ");
                if (p.IsOut) sb.Append("out ");
                sb.Append(p.TypeName).Append(' ').Append(p.Name);
            }
            sb.Append(')');
            return sb.ToString();
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
            string mainUri = (string)@params["textDocument"]["uri"];

            // Main document first.
            var hit = FindDef(doc.Unit, name, mainUri);
            if (hit != null) return hit;

            // Included auxiliary files — return a file:// URI pointing at them.
            var seenPaths = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            string mainPath = UriToPath(mainUri);
            if (mainPath != null) seenPaths.Add(Path.GetFullPath(mainPath));
            if (doc.Aux != null)
            {
                foreach (var a in doc.Aux)
                {
                    seenPaths.Add(a.AbsolutePath);
                    string auxUri = PathToUri(a.AbsolutePath);
                    hit = FindDef(a.Unit, name, auxUri);
                    if (hit != null) return hit;
                }
            }
            // Workspace-wide — covers files the user hasn't included.
            foreach (var kv in _workspaceUnits)
            {
                if (seenPaths.Contains(kv.Key)) continue;
                hit = FindDef(kv.Value, name, PathToUri(kv.Key));
                if (hit != null) return hit;
            }
            return null;
        }

        private static JObject FindDef(CompilationUnit unit, string name, string uri)
        {
            foreach (var cls in unit.Classes)
            {
                if (cls.Name == name) return MakeLocation(uri, cls.Line, cls.Column, name.Length);
                foreach (var m in cls.Methods)
                    if (m.Name == name) return MakeLocation(uri, m.Line, m.Column, name.Length);
                foreach (var f in cls.Fields)
                    if (f.Name == name) return MakeLocation(uri, f.Line, f.Column, name.Length);
                foreach (var p in cls.Properties)
                    if (p.Name == name) return MakeLocation(uri, p.Line, p.Column, name.Length);
            }
            foreach (var iface in unit.Interfaces)
                if (iface.Name == name) return MakeLocation(uri, iface.Line, iface.Column, name.Length);
            foreach (var en in unit.Enums)
                if (en.Name == name) return MakeLocation(uri, en.Line, en.Column, name.Length);
            foreach (var del in unit.Delegates)
                if (del.Name == name) return MakeLocation(uri, del.Line, del.Column, name.Length);
            return null;
        }

        private static string PathToUri(string path)
        {
            if (string.IsNullOrEmpty(path)) return null;
            try { return new Uri(path).AbsoluteUri; }
            catch { return null; }
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
            string json = obj.ToString(Newtonsoft.Json.Formatting.None);
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
