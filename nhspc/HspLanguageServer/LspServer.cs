//
//  LspServer.cs — JSON-RPC LSP dispatcher for HSP3.
//
//  Handles a compact subset of the LSP spec sufficient to give VS Code:
//    - diagnostics (textDocument/publishDiagnostics, pushed on save)
//    - go to definition (textDocument/definition)
//    - hover tooltip (textDocument/hover)
//    - outline (textDocument/documentSymbol)
//    - completion (textDocument/completion)
//
//  Parsing is delegated to the real hspcmp64 via HspcmpRunner.
//

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Newtonsoft.Json.Linq;

namespace HspLanguageServer {
    internal sealed class LspServer {
        private readonly Stream _input;
        private readonly Stream _output;
        private readonly object _writeLock = new object();
        private readonly Dictionary<string, HspDocument> _docs =
            new Dictionary<string, HspDocument>(StringComparer.OrdinalIgnoreCase);
        private readonly HspcmpRunner _runner = new HspcmpRunner();
        private bool _shutdown;
        // Built-in command/function names from hspcmp -lk. Populated lazily on
        // first semanticTokens request; fall back to a hardcoded subset if
        // hspcmp is unavailable.
        private HashSet<string> _builtins;

        // HSP3 built-in keywords; surfaced in completion alongside user symbols.
        private static readonly string[] HspKeywords = new[] {
            "if", "else", "repeat", "loop", "continue", "break", "return",
            "gosub", "goto", "on", "exgoto", "end", "stop", "wait", "await",
            "foreach", "switch", "case", "default", "swbreak", "swend",
            "mes", "print", "pos", "color", "font", "boxf", "line", "pset",
            "circle", "picload", "picsave", "redraw", "gsel", "screen", "buffer",
            "title", "cls", "dialog", "exec", "strlen", "strrep", "strmid",
            "instr", "getstr", "split", "strf", "peek", "poke", "lpoke",
            "wpoke", "wpeek", "lpeek", "memcpy", "memset", "dim", "sdim",
            "ddim", "ldim", "dimtype", "dim64", "newcom", "delcom", "newmod",
            "delmod", "mref", "varptr", "dup", "dupptr", "int", "double", "str",
            "abs", "sqrt", "log", "exp", "sin", "cos", "tan", "atan",
            "limit", "rnd", "randomize", "atoi", "atof",
        };

        public LspServer(Stream input, Stream output) {
            _input = input;
            _output = output;

            // Auto-detect hspcmp64.exe — prefer one bundled near this assembly,
            // then fall back to package/win32/ in the dev tree.
            string here = Path.GetDirectoryName(typeof(Program).Assembly.Location);
            var candidates = new[] {
                Path.Combine(here, "hspcmp64.exe"),
                Path.GetFullPath(Path.Combine(here, "..", "..", "..", "..", "..", "package", "win32", "hspcmp64.exe")),
            };
            foreach (var c in candidates) {
                if (File.Exists(c)) { _runner.HspcmpPath = c; break; }
            }
        }

        public void Run() {
            while (true) {
                JObject msg;
                try { msg = ReadMessage(); }
                catch (EndOfStreamException) { return; }
                if (msg == null) return;

                string method = (string)msg["method"];
                JToken id = msg["id"];
                JToken ps = msg["params"];

                try {
                    if (id != null) HandleRequest(id, method, ps);
                    else HandleNotification(method, ps);
                } catch (Exception ex) {
                    Console.Error.WriteLine("hspls error: " + ex);
                    if (id != null) SendError(id, -32603, ex.Message);
                }

                if (_shutdown && method == "exit") return;
            }
        }

        // ================ Dispatch ================

        private void HandleRequest(JToken id, string method, JToken ps) {
            switch (method) {
                case "initialize":
                    SendResult(id, BuildInitializeResult());
                    break;
                case "shutdown":
                    _shutdown = true;
                    SendResult(id, null);
                    break;
                case "textDocument/definition":
                    SendResult(id, HandleDefinition(ps));
                    break;
                case "textDocument/hover":
                    SendResult(id, HandleHover(ps));
                    break;
                case "textDocument/documentSymbol":
                    SendResult(id, HandleDocumentSymbol(ps));
                    break;
                case "textDocument/completion":
                    SendResult(id, HandleCompletion(ps));
                    break;
                case "textDocument/semanticTokens/full":
                    SendResult(id, HandleSemanticTokens(ps));
                    break;
                default:
                    SendResult(id, null);
                    break;
            }
        }

        private void HandleNotification(string method, JToken ps) {
            switch (method) {
                case "initialized":
                    break;
                case "exit":
                    _shutdown = true;
                    break;
                case "textDocument/didOpen":
                    OnDidOpen(ps);
                    break;
                case "textDocument/didChange":
                    OnDidChange(ps);
                    break;
                case "textDocument/didSave":
                    OnDidSave(ps);
                    break;
                case "textDocument/didClose":
                    OnDidClose(ps);
                    break;
            }
        }

        // Semantic token legend. VS Code maps tokenType index → name at decode
        // time, so the order here IS the ABI. Don't reorder without bumping
        // the corresponding indices in EmitToken().
        private static readonly string[] TokenTypes = new[] {
            "function",  // 0: user-defined #deffunc / #defcfunc
            "method",    // 1: external DLL (#func / #cfunc in .as)
            "macro",     // 2: HSP3 built-in command / function
            "variable",  // 3: (reserved for future use)
            "keyword",   // 4: control flow (if/else/repeat/…)
        };
        private const int TYPE_FUNCTION = 0;
        private const int TYPE_METHOD   = 1;
        private const int TYPE_MACRO    = 2;
        private const int TYPE_KEYWORD  = 4;

        // Control-flow words. These get `keyword` colour even though hspcmp
        // lists them as `dmac` / `sys|func` — they read as language keywords
        // to the human eye.
        private static readonly HashSet<string> ControlKeywords = new HashSet<string>(
            StringComparer.OrdinalIgnoreCase) {
            "if", "else", "repeat", "loop", "continue", "break", "return",
            "gosub", "goto", "on", "exgoto", "end", "stop", "wait", "await",
            "foreach", "switch", "case", "default", "swbreak", "swend",
            "and", "or", "xor", "not",
        };

        private JObject BuildInitializeResult() {
            return new JObject {
                ["capabilities"] = new JObject {
                    ["textDocumentSync"] = 1,  // full sync
                    ["definitionProvider"] = true,
                    ["hoverProvider"] = true,
                    ["documentSymbolProvider"] = true,
                    ["completionProvider"] = new JObject {
                        ["triggerCharacters"] = new JArray { "#", "@" },
                    },
                    ["semanticTokensProvider"] = new JObject {
                        ["legend"] = new JObject {
                            ["tokenTypes"] = new JArray(TokenTypes),
                            ["tokenModifiers"] = new JArray(),
                        },
                        ["full"] = true,
                    },
                },
                ["serverInfo"] = new JObject {
                    ["name"] = "hspls",
                    ["version"] = "0.1.0",
                },
            };
        }

        // ================ Document lifecycle ================

        private void OnDidOpen(JToken ps) {
            string uri = (string)ps["textDocument"]["uri"];
            string text = (string)ps["textDocument"]["text"];
            ReparseDoc(uri, text);
        }

        private void OnDidChange(JToken ps) {
            string uri = (string)ps["textDocument"]["uri"];
            var changes = ps["contentChanges"] as JArray;
            if (changes == null || changes.Count == 0) return;
            // With textDocumentSync=Full, the only change is the full new text.
            string text = (string)changes[changes.Count - 1]["text"];
            if (_docs.TryGetValue(uri, out var doc)) doc.Text = text;
            // Reparse on every change so hover / outline / diagnostics stay
            // in sync with the editor buffer. hspcmp is fast enough (<100 ms
            // on typical files) that this is fine for keystroke-level events.
            ReparseDoc(uri, text);
        }

        private void OnDidSave(JToken ps) {
            string uri = (string)ps["textDocument"]["uri"];
            if (_docs.TryGetValue(uri, out var doc)) {
                ReparseDoc(uri, doc.Text);
            }
        }

        private void OnDidClose(JToken ps) {
            string uri = (string)ps["textDocument"]["uri"];
            _docs.Remove(uri);
            // Also clear diagnostics so VS Code drops the squiggles.
            PublishDiagnostics(uri, new List<HspDiagnostic>());
        }

        private void ReparseDoc(string uri, string text) {
            string absPath = UriToPath(uri);
            if (string.IsNullOrEmpty(absPath)) return;
            string cwd = Path.GetDirectoryName(absPath);

            var doc = new HspDocument {
                Uri = uri,
                AbsPath = absPath,
                Text = text,
            };

            // Write buffer to a side-car temp file in the SAME directory (so
            // relative #includes still resolve from cwd) and point hspcmp at
            // that file. We never touch the user's real source file.
            string tempPath = null;
            try {
                string tempName = Path.GetFileNameWithoutExtension(absPath) + ".__hspls.hsp";
                tempPath = Path.Combine(cwd, tempName);
                File.WriteAllText(tempPath, text ?? "", new UTF8Encoding(false));
            } catch (Exception ex) {
                Console.Error.WriteLine("hspls temp write failed: " + ex.Message);
                tempPath = absPath;  // fall back to the on-disk version
            }

            var symbols = new Dictionary<string, List<HspSymbol>>(StringComparer.OrdinalIgnoreCase);
            var diags = new List<HspDiagnostic>();
            _runner.Run(tempPath, cwd, symbols, diags);

            // Rewrite emitted file paths that point at the temp sidecar back to
            // the real source, so VS Code links to the user's editor buffer.
            if (tempPath != absPath) {
                string tempName = Path.GetFileName(tempPath);
                string realName = Path.GetFileName(absPath);
                foreach (var kv in symbols) {
                    foreach (var s in kv.Value) {
                        if (string.Equals(Path.GetFileName(s.File ?? ""), tempName, StringComparison.OrdinalIgnoreCase)) {
                            s.File = realName;
                            s.AbsPath = absPath;
                        }
                    }
                }
                foreach (var d in diags) {
                    if (string.Equals(Path.GetFileName(d.File ?? ""), tempName, StringComparison.OrdinalIgnoreCase)) {
                        d.File = realName;
                    }
                }
                try { File.Delete(tempPath); } catch { }
            }

            // Scan the source text for `;;;` / `///` doc comments and attach
            // them to the declaration they precede. Must run AFTER the temp→
            // real filename rewrite so basenames compare correctly.
            DocCommentParser.Parse(text ?? "", Path.GetFileName(absPath), symbols);

            doc.WorkspaceSymbols = symbols;
            // hspcmp may emit s.File as basename or absolute path depending on
            // how the argument was passed. Normalise to basename on both sides.
            string baseName = Path.GetFileName(absPath);
            foreach (var kv in symbols) {
                foreach (var s in kv.Value) {
                    string symFile = Path.GetFileName(s.File ?? "");
                    if (string.Equals(symFile, baseName, StringComparison.OrdinalIgnoreCase)) {
                        doc.LocalSymbols.Add(s);
                    }
                }
            }
            doc.Diagnostics.AddRange(diags);
            _docs[uri] = doc;

            PublishDiagnostics(uri, diags);
        }

        private void PublishDiagnostics(string uri, List<HspDiagnostic> diags) {
            // Only publish diagnostics whose file matches this document —
            // hspcmp reports errors from #include files against their own paths.
            string baseName;
            try { baseName = Path.GetFileName(UriToPath(uri) ?? ""); }
            catch { baseName = ""; }

            var arr = new JArray();
            foreach (var d in diags) {
                if (!string.IsNullOrEmpty(baseName) &&
                    !string.Equals(Path.GetFileName(d.File ?? ""), baseName, StringComparison.OrdinalIgnoreCase))
                    continue;
                arr.Add(new JObject {
                    ["range"] = new JObject {
                        ["start"] = new JObject { ["line"] = d.Line - 1, ["character"] = 0 },
                        ["end"]   = new JObject { ["line"] = d.Line - 1, ["character"] = 200 },
                    },
                    ["severity"] = d.Severity,
                    ["code"] = d.Code,
                    ["source"] = "hspcmp",
                    ["message"] = d.Message,
                });
            }
            SendNotification("textDocument/publishDiagnostics", new JObject {
                ["uri"] = uri,
                ["diagnostics"] = arr,
            });
        }

        // ================ LSP method handlers ================

        private JToken HandleDefinition(JToken ps) {
            if (!TryResolveSymbolAt(ps, out HspDocument doc, out string word, out _, out _))
                return null;

            if (!doc.WorkspaceSymbols.TryGetValue(word, out var hits)) return null;
            var results = new JArray();
            foreach (var s in hits) {
                if (string.IsNullOrEmpty(s.AbsPath)) continue;
                results.Add(new JObject {
                    ["uri"] = PathToUri(s.AbsPath),
                    ["range"] = new JObject {
                        ["start"] = new JObject { ["line"] = s.Line - 1, ["character"] = 0 },
                        ["end"]   = new JObject { ["line"] = s.Line - 1, ["character"] = 200 },
                    },
                });
            }
            return results;
        }

        private JToken HandleHover(JToken ps) {
            if (!TryResolveSymbolAt(ps, out HspDocument doc, out string word, out _, out _))
                return null;
            if (!doc.WorkspaceSymbols.TryGetValue(word, out var hits)) return null;

            var sb = new StringBuilder();
            foreach (var s in hits) {
                // Code-style signature line so VS Code picks up the hsp scope
                // for syntax highlight inside the hover.
                sb.Append("```hsp\n");
                sb.Append(KindLabel(s.Kind)).Append(" ").Append(s.Name).Append('\n');
                sb.Append("```\n");

                // Doc comment body (if any) as plain Markdown.
                if (!string.IsNullOrWhiteSpace(s.DocDescription)) {
                    sb.Append(s.DocDescription).Append("\n\n");
                }
                if (s.DocParams != null && s.DocParams.Count > 0) {
                    sb.Append("**Parameters:**  \n");
                    foreach (var p in s.DocParams) {
                        sb.Append("- `").Append(p.Name).Append("`");
                        if (!string.IsNullOrWhiteSpace(p.Description)) {
                            sb.Append(" &mdash; ").Append(p.Description);
                        }
                        sb.Append("  \n");
                    }
                    sb.Append('\n');
                }
                if (!string.IsNullOrWhiteSpace(s.DocReturn)) {
                    sb.Append("**Returns:** ").Append(s.DocReturn).Append("\n\n");
                }

                // Always end with the source location for navigation.
                sb.Append("_\u2014 ").Append(s.File).Append(':').Append(s.Line).Append("_\n\n");
            }

            return new JObject {
                ["contents"] = new JObject {
                    ["kind"] = "markdown",
                    ["value"] = sb.ToString().TrimEnd(),
                },
            };
        }

        private JToken HandleDocumentSymbol(JToken ps) {
            string uri = (string)ps["textDocument"]["uri"];
            if (!_docs.TryGetValue(uri, out var doc)) return new JArray();

            var arr = new JArray();
            foreach (var s in doc.LocalSymbols) {
                arr.Add(new JObject {
                    ["name"] = s.Name,
                    ["kind"] = KindToSymbolKind(s.Kind),
                    ["range"] = new JObject {
                        ["start"] = new JObject { ["line"] = s.Line - 1, ["character"] = 0 },
                        ["end"]   = new JObject { ["line"] = s.Line - 1, ["character"] = 200 },
                    },
                    ["selectionRange"] = new JObject {
                        ["start"] = new JObject { ["line"] = s.Line - 1, ["character"] = 0 },
                        ["end"]   = new JObject { ["line"] = s.Line - 1, ["character"] = 200 },
                    },
                });
            }
            return arr;
        }

        private JToken HandleCompletion(JToken ps) {
            string uri = (string)ps["textDocument"]["uri"];
            if (!_docs.TryGetValue(uri, out var doc)) return new JArray();

            var items = new JArray();
            var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (var kv in doc.WorkspaceSymbols) {
                foreach (var s in kv.Value) {
                    if (!seen.Add(s.Name)) continue;
                    items.Add(new JObject {
                        ["label"] = s.Name,
                        ["kind"] = KindToCompletionKind(s.Kind),
                        ["detail"] = KindLabel(s.Kind),
                    });
                }
            }
            foreach (var kw in HspKeywords) {
                if (!seen.Add(kw)) continue;
                items.Add(new JObject {
                    ["label"] = kw,
                    ["kind"] = 14,  // keyword
                });
            }
            return items;
        }

        // ================ Semantic tokens ================

        private JToken HandleSemanticTokens(JToken ps) {
            string uri = (string)ps["textDocument"]["uri"];
            if (!_docs.TryGetValue(uri, out var doc)) return new JObject { ["data"] = new JArray() };

            // Lazy-populate the builtin set on first request.
            if (_builtins == null) _builtins = _runner.FetchBuiltins();

            var tokens = new List<(int line, int col, int len, int type)>();
            TokenizeHsp(doc.Text ?? "", doc.WorkspaceSymbols, tokens);

            // Delta-encode per LSP spec: [deltaLine, deltaStart, length, type, mod]
            var data = new JArray();
            int prevLine = 0, prevCol = 0;
            foreach (var t in tokens) {
                int dl = t.line - prevLine;
                int dc = dl == 0 ? t.col - prevCol : t.col;
                data.Add(dl); data.Add(dc); data.Add(t.len); data.Add(t.type); data.Add(0);
                prevLine = t.line;
                prevCol  = t.col;
            }
            return new JObject { ["data"] = data };
        }

        // Walks the source once, skipping comments and string literals, and
        // collects identifier tokens classified by lookup in the symbol table.
        private void TokenizeHsp(string text,
                                 Dictionary<string, List<HspSymbol>> syms,
                                 List<(int line, int col, int len, int type)> output) {
            var lines = text.Split('\n');
            bool inBlockComment = false;
            for (int li = 0; li < lines.Length; li++) {
                string line = lines[li].TrimEnd('\r');
                int p = 0;
                while (p < line.Length) {
                    if (inBlockComment) {
                        int ec = line.IndexOf("*/", p);
                        if (ec < 0) break;  // comment continues on next line
                        p = ec + 2;
                        inBlockComment = false;
                        continue;
                    }
                    char c = line[p];
                    if (char.IsWhiteSpace(c)) { p++; continue; }

                    // Line comments: ; or //
                    if (c == ';') break;
                    if (c == '/' && p + 1 < line.Length && line[p + 1] == '/') break;

                    // Block comment
                    if (c == '/' && p + 1 < line.Length && line[p + 1] == '*') {
                        inBlockComment = true; p += 2; continue;
                    }

                    // String literal
                    if (c == '"') {
                        p++;
                        while (p < line.Length && line[p] != '"') {
                            if (line[p] == '\\' && p + 1 < line.Length) p++;
                            p++;
                        }
                        if (p < line.Length) p++;  // past closing "
                        continue;
                    }

                    // Brace-quoted multi-line string {"..."} — skip opening
                    if (c == '{' && p + 1 < line.Length && line[p + 1] == '"') {
                        int ec = line.IndexOf("\"}", p + 2);
                        p = ec < 0 ? line.Length : ec + 2;
                        continue;
                    }

                    // Identifier (HSP: letter/underscore followed by letters,
                    // digits, underscores, and optionally @module).
                    if (char.IsLetter(c) || c == '_') {
                        int start = p;
                        while (p < line.Length &&
                               (char.IsLetterOrDigit(line[p]) || line[p] == '_' || line[p] == '@')) p++;
                        string word = line.Substring(start, p - start);
                        int type = ClassifyIdentifier(word, syms);
                        if (type >= 0) {
                            output.Add((li, start, word.Length, type));
                        }
                        continue;
                    }

                    p++;
                }
            }
        }

        private int ClassifyIdentifier(string word,
                                       Dictionary<string, List<HspSymbol>> syms) {
            // Control-flow keywords get `keyword` colour.
            if (ControlKeywords.Contains(word)) return TYPE_KEYWORD;

            // Workspace symbols (user / library) take precedence over builtins.
            // hspcmp categorises entries as:
            //   dfnc — #deffunc / #defcfunc (user) OR imported #func from .as
            //   dmac — #define / #const / #enum AND (surprise) #func in .as
            //          is also listed under dmac since it registers a keyword
            // So we decide on the defining file's extension:
            //   hspdef.as → builtin macro (HSP runtime constant)
            //   other .as → external DLL method
            //   .hsp      → user-defined (function or macro)
            if (syms != null) {
                string key = word.ToLowerInvariant();
                if (syms.TryGetValue(key, out var hits)) {
                    foreach (var s in hits) {
                        string fname = Path.GetFileName(s.File ?? "");
                        bool isAsFile  = fname.EndsWith(".as", StringComparison.OrdinalIgnoreCase);
                        bool isHspdef  = string.Equals(fname, "hspdef.as", StringComparison.OrdinalIgnoreCase);

                        if (s.Kind == "dfnc") {
                            return (isAsFile && !isHspdef) ? TYPE_METHOD : TYPE_FUNCTION;
                        }
                        if (s.Kind == "dexc") {
                            // External DLL function (#func/#cfunc) — almost
                            // always in an .as file; if it isn't, still treat
                            // as library binding.
                            return TYPE_METHOD;
                        }
                        if (s.Kind == "dmac") {
                            if (isHspdef) return TYPE_MACRO;      // runtime constant
                            if (isAsFile) return TYPE_METHOD;      // #define alias in DLL binding
                            return TYPE_FUNCTION;                  // user #define / #const
                        }
                        // dvar / dlab / dmod intentionally fall through.
                    }
                }
            }

            // HSP runtime builtins (from hspcmp -lk).
            if (_builtins != null && _builtins.Contains(word)) return TYPE_MACRO;

            return -1;  // Let the TextMate grammar handle it.
        }

        // ================ Helpers ================

        private bool TryResolveSymbolAt(JToken ps,
                                        out HspDocument doc,
                                        out string word,
                                        out int line,
                                        out int col) {
            doc = null; word = null; line = 0; col = 0;
            string uri = (string)ps["textDocument"]["uri"];
            if (!_docs.TryGetValue(uri, out doc)) return false;
            line = (int)ps["position"]["line"];
            col  = (int)ps["position"]["character"];
            word = ExtractWordAt(doc.Text, line, col);
            return !string.IsNullOrEmpty(word);
        }

        // Extract the HSP identifier at (zero-based line, zero-based col).
        // Supports module refs via the `@` separator: `name@mod` → `name@mod`.
        private static string ExtractWordAt(string text, int line, int col) {
            if (text == null) return null;
            int pos = 0, curLine = 0;
            while (curLine < line && pos < text.Length) {
                if (text[pos] == '\n') curLine++;
                pos++;
            }
            int lineStart = pos;
            int cursor = lineStart + col;
            if (cursor >= text.Length) cursor = text.Length - 1;
            if (cursor < 0) return null;

            // Walk left until non-identifier character.
            int s = cursor;
            while (s > lineStart && IsIdentChar(text[s - 1])) s--;
            int e = cursor;
            while (e < text.Length && IsIdentChar(text[e])) e++;
            if (e <= s) return null;
            return text.Substring(s, e - s);
        }

        private static bool IsIdentChar(char c) {
            return char.IsLetterOrDigit(c) || c == '_' || c == '@';
        }

        private static string KindLabel(string kind) {
            switch (kind) {
                case "dfnc": return "(function)";
                case "dexc": return "(DLL function)";
                case "dlab": return "(label)";
                case "dvar": return "(variable)";
                case "dmac": return "(macro)";
                case "dmod": return "(module)";
                default:     return "(" + kind + ")";
            }
        }

        private static int KindToSymbolKind(string kind) {
            // LSP SymbolKind values.
            switch (kind) {
                case "dfnc": return 12; // Function
                case "dexc": return 6;  // Method (external DLL)
                case "dlab": return 13; // Variable (closest for labels)
                case "dvar": return 13; // Variable
                case "dmac": return 14; // Constant
                case "dmod": return 2;  // Module
                default:     return 1;  // File
            }
        }

        private static int KindToCompletionKind(string kind) {
            // LSP CompletionItemKind values.
            switch (kind) {
                case "dfnc": return 3;  // Function
                case "dexc": return 2;  // Method
                case "dlab": return 20; // EnumMember (closest for label)
                case "dvar": return 6;  // Variable
                case "dmac": return 21; // Constant
                case "dmod": return 9;  // Module
                default:     return 1;  // Text
            }
        }

        private static string UriToPath(string uri) {
            if (string.IsNullOrEmpty(uri)) return null;
            try {
                var u = new Uri(uri);
                if (!u.IsFile) return null;
                string path = u.LocalPath;
                // VS Code sends Windows paths as file:///j%3A/foo — localPath
                // turns this into /j:/foo; trim the leading slash.
                if (path.Length >= 3 &&
                    (path[0] == '\\' || path[0] == '/') &&
                    char.IsLetter(path[1]) && path[2] == ':')
                    path = path.Substring(1);
                return path;
            } catch { return null; }
        }

        private static string PathToUri(string path) {
            try {
                return new Uri(Path.GetFullPath(path)).AbsoluteUri;
            } catch {
                return "file:///" + path.Replace('\\', '/');
            }
        }

        // ================ JSON-RPC plumbing ================

        private JObject ReadMessage() {
            int contentLength = -1;
            while (true) {
                string header = ReadHeaderLine();
                if (header == null) return null;
                if (header.Length == 0) break;
                int colon = header.IndexOf(':');
                if (colon < 0) continue;
                string name = header.Substring(0, colon).Trim();
                string value = header.Substring(colon + 1).Trim();
                if (string.Equals(name, "Content-Length", StringComparison.OrdinalIgnoreCase))
                    contentLength = int.Parse(value);
            }
            if (contentLength <= 0) return null;
            byte[] buf = new byte[contentLength];
            int read = 0;
            while (read < contentLength) {
                int n = _input.Read(buf, read, contentLength - read);
                if (n <= 0) throw new EndOfStreamException();
                read += n;
            }
            return JObject.Parse(Encoding.UTF8.GetString(buf));
        }

        private string ReadHeaderLine() {
            var sb = new StringBuilder();
            int prev = -1;
            while (true) {
                int c = _input.ReadByte();
                if (c < 0) return sb.Length == 0 ? null : sb.ToString();
                if (prev == '\r' && c == '\n') {
                    sb.Length -= 1;
                    return sb.ToString();
                }
                sb.Append((char)c);
                prev = c;
            }
        }

        private void WriteMessage(JObject obj) {
            byte[] body = Encoding.UTF8.GetBytes(obj.ToString(Newtonsoft.Json.Formatting.None));
            byte[] header = Encoding.ASCII.GetBytes("Content-Length: " + body.Length + "\r\n\r\n");
            lock (_writeLock) {
                _output.Write(header, 0, header.Length);
                _output.Write(body, 0, body.Length);
                _output.Flush();
            }
        }

        private void SendResult(JToken id, JToken result) {
            WriteMessage(new JObject {
                ["jsonrpc"] = "2.0",
                ["id"] = id,
                ["result"] = result ?? JValue.CreateNull(),
            });
        }

        private void SendError(JToken id, int code, string message) {
            WriteMessage(new JObject {
                ["jsonrpc"] = "2.0",
                ["id"] = id,
                ["error"] = new JObject { ["code"] = code, ["message"] = message ?? "" },
            });
        }

        private void SendNotification(string method, JToken @params) {
            WriteMessage(new JObject {
                ["jsonrpc"] = "2.0",
                ["method"] = method,
                ["params"] = @params,
            });
        }
    }
}
