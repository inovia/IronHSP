//
//  Drives hspcmp64 as a subprocess and parses its listing output.
//
//  Why shell out instead of linking the parser as a library?
//    - hspcmp already exists and tracks HSP3 syntax exactly.
//    - Running `hspcmp64 -ll -lv -ls -i <file>` in the source directory
//      gives us every declared symbol plus any syntax errors with line
//      numbers — no need to reimplement the lexer.
//

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace HspLanguageServer {
    internal sealed class HspcmpRunner {
        public string HspcmpPath { get; set; }

        // Symbol listing lines are "<kind> <name> <line>:<file>".
        private static readonly Regex SymbolRx = new Regex(
            @"^(dfnc|dlab|dvar|dmac|dmod)\s+(\S+)\s+(\d+):(.+)$",
            RegexOptions.Compiled);

        // Diagnostic lines are "<file>(<line>) : <error|warning> <code> : <message>".
        private static readonly Regex DiagRx = new Regex(
            @"^(.+?)\((\d+)\)\s*:\s*(error|warning)\s+(\d+)\s*:\s*(.+)$",
            RegexOptions.Compiled);

        public bool Run(string sourceFile, string cwd,
                        Dictionary<string, List<HspSymbol>> symbols,
                        List<HspDiagnostic> diagnostics) {
            if (string.IsNullOrEmpty(HspcmpPath) || !File.Exists(HspcmpPath))
                return false;

            var psi = new ProcessStartInfo {
                FileName = HspcmpPath,
                // -i: read UTF-8 source
                // -d: emit debug info (keeps line numbers accurate)
                // -p: preprocess only — we don't want to emit .ax
                // -ll / -lv / -ls: list labels/funcs, vars, macros
                // -lr: include reference list
                // -lp: allow partial matches (unused but cheap)
                Arguments = "-ll -lv -ls -lr -d -i " + QuoteArg(sourceFile),
                WorkingDirectory = cwd,
                UseShellExecute = false,
                CreateNoWindow = true,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                StandardOutputEncoding = new UTF8Encoding(false),
                StandardErrorEncoding  = new UTF8Encoding(false),
            };

            string stdout, stderr;
            try {
                using (var p = Process.Start(psi)) {
                    stdout = p.StandardOutput.ReadToEnd();
                    stderr = p.StandardError.ReadToEnd();
                    if (!p.WaitForExit(5000)) {
                        try { p.Kill(); } catch { }
                        return false;
                    }
                }
            } catch {
                return false;
            }

            ParseStreams(stdout + "\n" + stderr, cwd, symbols, diagnostics);
            return true;
        }

        private void ParseStreams(string allOutput, string cwd,
                                  Dictionary<string, List<HspSymbol>> symbols,
                                  List<HspDiagnostic> diagnostics) {
            var lines = allOutput.Split('\n');
            foreach (var rawLine in lines) {
                var line = rawLine.TrimEnd('\r');
                if (line.Length == 0) continue;

                var sm = SymbolRx.Match(line);
                if (sm.Success) {
                    var sym = new HspSymbol {
                        Kind = sm.Groups[1].Value,
                        Name = sm.Groups[2].Value,
                        Line = int.Parse(sm.Groups[3].Value),
                        File = sm.Groups[4].Value.Trim(),
                    };
                    sym.AbsPath = ResolvePath(sym.File, cwd);
                    AddSymbol(symbols, sym);
                    continue;
                }

                var dm = DiagRx.Match(line);
                if (dm.Success) {
                    diagnostics.Add(new HspDiagnostic {
                        File = dm.Groups[1].Value.Trim(),
                        Line = int.Parse(dm.Groups[2].Value),
                        Severity = dm.Groups[3].Value == "error" ? 1 : 2,
                        Code = dm.Groups[3].Value + " " + dm.Groups[4].Value,
                        Message = dm.Groups[5].Value.Trim(),
                    });
                }
            }
        }

        private static void AddSymbol(Dictionary<string, List<HspSymbol>> map, HspSymbol sym) {
            // HSP is case-insensitive — lowercase key.
            string key = sym.Name.ToLowerInvariant();
            if (!map.TryGetValue(key, out var list)) {
                list = new List<HspSymbol>();
                map[key] = list;
            }
            list.Add(sym);
        }

        private static string ResolvePath(string file, string cwd) {
            if (string.IsNullOrEmpty(file)) return "";
            if (Path.IsPathRooted(file)) return file;
            try {
                string candidate = Path.Combine(cwd, file);
                if (File.Exists(candidate)) return Path.GetFullPath(candidate);
                // Fall back to searching common/ subfolder (hspdef.as etc.).
                string common = Path.Combine(cwd, "common", file);
                if (File.Exists(common)) return Path.GetFullPath(common);
            } catch { }
            return file;
        }

        private static string QuoteArg(string s) {
            if (string.IsNullOrEmpty(s)) return "\"\"";
            if (s.IndexOf(' ') < 0 && s.IndexOf('"') < 0) return s;
            return "\"" + s.Replace("\"", "\\\"") + "\"";
        }
    }
}
