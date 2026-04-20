//
//  DocCommentParser.cs — parse HSP-style doc comments and attach them to
//  the symbol they precede.
//
//  Recognised forms (same convention as NHSP's .nhsp doc comments):
//
//    ;;; ダイアログを表示する
//    ;;; @param msg メッセージ本文
//    ;;; @param title タイトル (省略可)
//    ;;; @return 押されたボタン
//    #deffunc show_dialog str msg, str title
//
//    /// 同上。/// で書いても良い。
//    /// @param ...
//    #defcfunc compute_sum int a, int b
//
//  A doc block = contiguous lines starting with ;;; or ///. It attaches to
//  the NEXT non-blank line if that line declares a symbol (`#deffunc`,
//  `#defcfunc`, `#func`, `#cfunc`, `#cfuncd`, `#cfuncf`, `#cfuncst`,
//  `#comfunc`, `#modfunc`, `#modcfunc`, `#const`, `#define`, `#enum`).
//

using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace HspLanguageServer {
    internal static class DocCommentParser {
        // Match one of the decl keywords after optional leading whitespace.
        // Capture the user-visible name (the identifier right after the
        // keyword — skipping optional `global`).
        //
        // Covers:
        //   - # directives: deffunc/defcfunc/func/cfunc/cfuncd/cfuncf/cfuncst/
        //     comfunc/modfunc/modcfunc/const/define/enum
        //   - variable declaration commands: dim/sdim/ddim/ldim/dim64/
        //     wdim/dimtype (these don't take `global` modifier)
        private static readonly Regex DeclRx = new Regex(
            @"^\s*(#(?:deffunc|defcfunc|func|cfunc|cfuncd|cfuncf|cfuncst|comfunc|modfunc|modcfunc|const|define|enum)|dim|sdim|ddim|ldim|dim64|wdim|dimtype)\s+(?:global\s+)?([A-Za-z_][A-Za-z_0-9]*)",
            RegexOptions.Compiled);

        // Implicit variable declaration via bare `name = value` assignment.
        // HSP creates the variable on first assignment. hspcmp emits ONE
        // dvar entry at that first-use line, so the ±2 line check in
        // AttachDocsToSymbol naturally attributes docs to the first
        // assignment only (re-assignments further down are silently skipped).
        //
        // Rejects:
        //   - `x == 10` (comparison — `=(?!=)`)
        //   - `arr(0) = 1` (array element; identifier is followed by `(`)
        //   - Non-identifier line starts
        private static readonly Regex VarAssignRx = new Regex(
            @"^\s*([A-Za-z_][A-Za-z_0-9]*)\s*=(?!=)",
            RegexOptions.Compiled);

        // Parse the source and annotate matching symbols in-place. Only
        // annotates symbols whose `File` basename matches `sourceBaseName`,
        // so workspace-wide lookups that touched other files aren't clobbered.
        public static void Parse(string text, string sourceBaseName,
                                 Dictionary<string, List<HspSymbol>> symbols) {
            if (string.IsNullOrEmpty(text) || symbols == null) return;

            var lines = text.Split('\n');
            var docBuf = new List<string>();

            for (int i = 0; i < lines.Length; i++) {
                string raw = lines[i].TrimEnd('\r');
                string trimmed = raw.TrimStart();

                if (trimmed.StartsWith(";;;")) {
                    docBuf.Add(StripMarker(trimmed, ";;;"));
                    continue;
                }
                if (trimmed.StartsWith("///")) {
                    docBuf.Add(StripMarker(trimmed, "///"));
                    continue;
                }
                // Empty line: keep docBuf in case declaration comes next.
                // (Some authors put a blank line between doc and decl; if
                //  we reset here, those docs get dropped. Tolerate 1 blank.)
                if (trimmed.Length == 0) continue;

                // Regular comment (single ; or //): also tolerated as
                // interleaved — skip without resetting.
                if (trimmed.StartsWith(";") || trimmed.StartsWith("//")) {
                    // NOT a doc marker (we handled ;;; and /// above), so
                    // treat as plain comment and pass through.
                    continue;
                }

                // See if this line declares a symbol. Try explicit decls first
                // (more specific), then fall back to bare-assignment form.
                if (docBuf.Count > 0) {
                    string name = null;
                    var m = DeclRx.Match(raw);
                    if (m.Success) {
                        name = m.Groups[2].Value;
                    } else {
                        var ma = VarAssignRx.Match(raw);
                        if (ma.Success) name = ma.Groups[1].Value;
                    }
                    if (name != null) {
                        AttachDocsToSymbol(symbols, name, sourceBaseName,
                                           declLine: i + 1, docLines: docBuf);
                    }
                }

                // Any non-doc, non-blank line resets the doc buffer (whether
                // it was a declaration or something else).
                docBuf.Clear();
            }
        }

        private static string StripMarker(string trimmed, string marker) {
            // Drop the marker prefix; trim one leading space so "/// foo"
            // becomes "foo" (matches MSDN / JSDoc convention).
            int p = marker.Length;
            if (p < trimmed.Length && trimmed[p] == ' ') p++;
            return trimmed.Substring(p);
        }

        private static void AttachDocsToSymbol(Dictionary<string, List<HspSymbol>> symbols,
                                               string name, string sourceBaseName,
                                               int declLine, List<string> docLines) {
            string key = name.ToLowerInvariant();
            if (!symbols.TryGetValue(key, out var list)) return;

            // Find the symbol entry whose file matches AND line is close to
            // the declaration (compiler-emitted line numbers can differ from
            // source line by 1 for multi-line parsing; accept ±2).
            foreach (var sym in list) {
                string symFile = sym.File ?? "";
                int slash = symFile.LastIndexOfAny(new[] { '/', '\\' });
                string symBase = slash >= 0 ? symFile.Substring(slash + 1) : symFile;
                if (!string.Equals(symBase, sourceBaseName, StringComparison.OrdinalIgnoreCase)) continue;
                if (Math.Abs(sym.Line - declLine) > 2) continue;

                // Split docLines into description / @param / @return.
                var desc = new StringBuilder();
                var paramList = new List<HspDocParam>();
                string ret = null;
                foreach (var dl in docLines) {
                    if (dl.StartsWith("@param") || dl.StartsWith("@arg")) {
                        // "@param <name> <description...>"
                        int sp1 = FindAny(dl, 0, ' ', '\t');
                        if (sp1 < 0) continue;
                        int sp2 = FindAny(dl, sp1 + 1, ' ', '\t');
                        if (sp2 < 0) {
                            paramList.Add(new HspDocParam { Name = dl.Substring(sp1 + 1), Description = "" });
                        } else {
                            paramList.Add(new HspDocParam {
                                Name = dl.Substring(sp1 + 1, sp2 - sp1 - 1),
                                Description = dl.Substring(sp2 + 1).Trim(),
                            });
                        }
                    } else if (dl.StartsWith("@return") || dl.StartsWith("@returns")) {
                        int sp = FindAny(dl, 0, ' ', '\t');
                        ret = sp < 0 ? "" : dl.Substring(sp + 1).Trim();
                    } else {
                        if (desc.Length > 0) desc.Append('\n');
                        desc.Append(dl);
                    }
                }
                sym.DocDescription = desc.ToString();
                sym.DocParams = paramList;
                sym.DocReturn = ret;
                return;  // attach to the first matching entry only
            }
        }

        private static int FindAny(string s, int start, char c1, char c2) {
            for (int i = start; i < s.Length; i++) {
                if (s[i] == c1 || s[i] == c2) return i;
            }
            return -1;
        }
    }
}
