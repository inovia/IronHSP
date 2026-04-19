using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace NhspVsLanguageClient
{
    // Flat in-file symbol model for the navigation bar. We parse classes/
    // structs/interfaces/enums as top-level "types" and their #func/#field/
    // #init/etc. members. nhsp declarations are line-based so a small regex
    // pass over the snapshot is enough — no need to reuse nhspls for this.
    internal sealed class NhspSymbol
    {
        public string Kind;
        public string Name;
        public string Display;
        public int StartLine;    // 0-based, inclusive
        public int EndLine;      // 0-based, inclusive
        public List<NhspSymbol> Members = new List<NhspSymbol>();
    }

    internal static class NhspSymbolParser
    {
        private static readonly HashSet<string> Modifiers = new HashSet<string>
        {
            "public", "internal", "private", "protected",
            "abstract", "sealed", "static", "partial",
            "virtual", "override", "readonly", "new", "const",
        };

        private static readonly Regex TypeStartRe = new Regex(
            @"^\s*#(class|struct|interface|enum)\b(.*)$",
            RegexOptions.Compiled);
        private static readonly Regex TypeEndRe = new Regex(
            @"^\s*#end(class|struct|interface|enum)\b",
            RegexOptions.Compiled);
        private static readonly Regex MemberRe = new Regex(
            @"^\s*#(func|defcfunc|field|property|event|init|dispose|const|indexer|operator)\b(.*)$",
            RegexOptions.Compiled);

        public static List<NhspSymbol> Parse(string text)
        {
            var result = new List<NhspSymbol>();
            if (string.IsNullOrEmpty(text)) return result;

            string[] lines = text.Split('\n');
            NhspSymbol current = null;

            for (int i = 0; i < lines.Length; i++)
            {
                string line = lines[i];
                if (current != null && TypeEndRe.IsMatch(line))
                {
                    current.EndLine = i;
                    current = null;
                    continue;
                }

                var tm = TypeStartRe.Match(line);
                if (tm.Success && current == null)
                {
                    string kind = tm.Groups[1].Value;
                    string name = ExtractTrailingName(tm.Groups[2].Value);
                    if (!string.IsNullOrEmpty(name))
                    {
                        current = new NhspSymbol
                        {
                            Kind = kind,
                            Name = name,
                            Display = name,
                            StartLine = i,
                            EndLine = i,
                        };
                        result.Add(current);
                    }
                    continue;
                }

                if (current != null)
                {
                    var mm = MemberRe.Match(line);
                    if (mm.Success)
                    {
                        var sym = MakeMember(mm.Groups[1].Value, mm.Groups[2].Value, i);
                        if (sym != null) current.Members.Add(sym);
                    }
                }
            }

            // Unterminated type: let it span to EOF.
            if (current != null) current.EndLine = lines.Length - 1;
            return result;
        }

        // For `#class public Foo ...` → "Foo". Skip all keyword-ish tokens and
        // return the first identifier that isn't a known modifier.
        private static string ExtractTrailingName(string tail)
        {
            foreach (var tok in Tokenize(tail))
            {
                if (!Modifiers.Contains(tok.ToLowerInvariant()) && IsIdent(tok))
                    return tok;
            }
            return null;
        }

        private static NhspSymbol MakeMember(string kind, string tail, int line)
        {
            // `#func public static string Greet, int x`  → name "Greet"
            // `#field public string Name`                → name "Name"
            // `#init string name, int id`                 → synthetic "<init>"
            // `#dispose`                                  → synthetic "<dispose>"
            string name;
            string display;
            switch (kind)
            {
                case "init":
                    name = "<init>"; display = "(init)"; break;
                case "dispose":
                    name = "<dispose>"; display = "(dispose)"; break;
                case "indexer":
                    name = "<indexer>"; display = "this[]"; break;
                case "operator":
                {
                    // `#operator public static Vec2 +, Vec2 a, Vec2 b` → "operator +"
                    var toks = Tokenize(tail);
                    string op = null;
                    foreach (var t in toks)
                    {
                        if (!Modifiers.Contains(t.ToLowerInvariant()) && !IsIdent(t)) { op = t; break; }
                    }
                    name = "operator " + (op ?? "?");
                    display = name;
                    break;
                }
                default:
                {
                    // Skip modifiers and the type name, then take the identifier.
                    var toks = Tokenize(tail);
                    int idx = 0;
                    while (idx < toks.Count && Modifiers.Contains(toks[idx].ToLowerInvariant())) idx++;
                    // First non-modifier is (usually) a type name; next is the member name.
                    if (idx + 1 < toks.Count && IsIdent(toks[idx + 1]))
                    { name = toks[idx + 1]; }
                    else if (idx < toks.Count && IsIdent(toks[idx]))
                    { name = toks[idx]; }
                    else name = null;
                    display = name;
                    break;
                }
            }
            if (name == null) return null;
            return new NhspSymbol
            {
                Kind = kind,
                Name = name,
                Display = display,
                StartLine = line,
                EndLine = line,
            };
        }

        private static List<string> Tokenize(string s)
        {
            var result = new List<string>();
            int i = 0;
            while (i < s.Length)
            {
                char c = s[i];
                if (char.IsWhiteSpace(c) || c == ',') { i++; continue; }
                if (char.IsLetter(c) || c == '_')
                {
                    int start = i;
                    while (i < s.Length && (char.IsLetterOrDigit(s[i]) || s[i] == '_')) i++;
                    result.Add(s.Substring(start, i - start));
                }
                else
                {
                    // non-identifier punctuation token (for operators etc.)
                    int start = i;
                    while (i < s.Length && !char.IsWhiteSpace(s[i]) && s[i] != ',' && !char.IsLetterOrDigit(s[i]) && s[i] != '_')
                        i++;
                    if (i > start) result.Add(s.Substring(start, i - start));
                    else i++;
                }
            }
            return result;
        }

        private static bool IsIdent(string s)
        {
            if (string.IsNullOrEmpty(s)) return false;
            if (!(char.IsLetter(s[0]) || s[0] == '_')) return false;
            for (int i = 1; i < s.Length; i++)
                if (!(char.IsLetterOrDigit(s[i]) || s[i] == '_')) return false;
            return true;
        }
    }
}
