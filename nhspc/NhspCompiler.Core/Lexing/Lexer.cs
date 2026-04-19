using System.Collections.Generic;
using System.Text;

namespace NhspCompiler.Core.Lexing
{
    public class Lexer
    {
        private readonly string _source;
        private readonly string _fileName;
        private int _pos;
        private int _line;
        private int _col;

        public Lexer(string source, string fileName = "<input>")
        {
            _source = source;
            _fileName = fileName;
            _pos = 0;
            _line = 1;
            _col = 1;
        }

        private char Cur => _pos < _source.Length ? _source[_pos] : '\0';
        private char Next => _pos + 1 < _source.Length ? _source[_pos + 1] : '\0';

        public List<Token> Tokenize()
        {
            var tokens = new List<Token>();
            while (_pos < _source.Length)
            {
                SkipWhitespace();
                if (_pos >= _source.Length) break;

                // Doc comment (only at start of line): ;;; ... or /// ...
                // Plain comment: ; ... or // ...
                if (Cur == ';' || (Cur == '/' && Next == '/'))
                {
                    if (TryReadDocComment(tokens)) continue;
                    SkipToEndOfLine(); continue;
                }

                // Line continuation: \ + newline → skip (HSP compatible)
                if (Cur == '\\' && (_pos + 1 < _source.Length) &&
                    (Next == '\n' || Next == '\r'))
                {
                    _pos++; _col++; // skip backslash
                    if (Cur == '\r') _pos++;
                    if (Cur == '\n') _pos++;
                    _line++; _col = 1;
                    continue;
                }

                // Newline
                if (Cur == '\n')
                {
                    tokens.Add(new Token(TokenKind.EOL, "\\n", _line, _col));
                    _pos++; _line++; _col = 1;
                    continue;
                }
                if (Cur == '\r')
                {
                    _pos++;
                    if (Cur == '\n') _pos++;
                    tokens.Add(new Token(TokenKind.EOL, "\\n", _line, _col));
                    _line++; _col = 1;
                    continue;
                }

                // String literal
                if (Cur == '"') { tokens.Add(ReadString()); continue; }

                // Interpolated string: $"..." → expand to string concat tokens
                if (Cur == '$' && Next == '"') { ReadInterpolatedStringExpanded(tokens); continue; }

                // Hex: $FF or 0xFF
                if (Cur == '$' && IsHexDigit(Next)) { tokens.Add(ReadHex('$')); continue; }
                if (Cur == '0' && (Next == 'x' || Next == 'X')) { tokens.Add(ReadHex('0')); continue; }

                // Number
                if (char.IsDigit(Cur)) { tokens.Add(ReadNumber()); continue; }

                // Identifier / Keyword / TypeName / Bool
                if (char.IsLetter(Cur) || Cur == '_') { tokens.Add(ReadIdentifier()); continue; }

                // Multi-char operators (order matters: longer match first)
                int sc = _col;
                if (Cur == '=' && Next == '=') { tokens.Add(Sym2(TokenKind.EqualEqual, "==")); continue; }
                if (Cur == '!' && Next == '=') { tokens.Add(Sym2(TokenKind.BangEqual, "!=")); continue; }
                if (Cur == '<' && Next == '<') { tokens.Add(Sym2(TokenKind.LessLess, "<<")); continue; }
                if (Cur == '<' && Next == '=') { tokens.Add(Sym2(TokenKind.LessEqual, "<=")); continue; }
                if (Cur == '>' && Next == '>') { tokens.Add(Sym2(TokenKind.GreaterGreater, ">>")); continue; }
                if (Cur == '>' && Next == '=') { tokens.Add(Sym2(TokenKind.GreaterEqual, ">=")); continue; }
                if (Cur == '&' && Next == '&') { tokens.Add(Sym2(TokenKind.AmpAmp, "&&")); continue; }
                if (Cur == '&' && Next == '=') { tokens.Add(Sym2(TokenKind.AmpEqual, "&=")); continue; }
                if (Cur == '|' && Next == '|') { tokens.Add(Sym2(TokenKind.PipePipe, "||")); continue; }
                if (Cur == '|' && Next == '=') { tokens.Add(Sym2(TokenKind.PipeEqual, "|=")); continue; }
                if (Cur == '^' && Next == '=') { tokens.Add(Sym2(TokenKind.CaretEqual, "^=")); continue; }
                if (Cur == '+' && Next == '+') { tokens.Add(Sym2(TokenKind.PlusPlus, "++")); continue; }
                if (Cur == '+' && Next == '=') { tokens.Add(Sym2(TokenKind.PlusEqual, "+=")); continue; }
                if (Cur == '-' && Next == '-') { tokens.Add(Sym2(TokenKind.MinusMinus, "--")); continue; }
                if (Cur == '-' && Next == '=') { tokens.Add(Sym2(TokenKind.MinusEqual, "-=")); continue; }
                if (Cur == '*' && Next == '=') { tokens.Add(Sym2(TokenKind.StarEqual, "*=")); continue; }
                if (Cur == '/' && Next == '=') { tokens.Add(Sym2(TokenKind.SlashEqual, "/=")); continue; }
                if (Cur == '?' && Next == '?') { tokens.Add(Sym2(TokenKind.QuestionQuestion, "??")); continue; }

                // Single-char symbols
                switch (Cur)
                {
                    case '#': tokens.Add(Sym1(TokenKind.Hash)); break;
                    case ',': tokens.Add(Sym1(TokenKind.Comma)); break;
                    case '(': tokens.Add(Sym1(TokenKind.LParen)); break;
                    case ')': tokens.Add(Sym1(TokenKind.RParen)); break;
                    case '{': tokens.Add(Sym1(TokenKind.LBrace)); break;
                    case '}': tokens.Add(Sym1(TokenKind.RBrace)); break;
                    case '[': tokens.Add(Sym1(TokenKind.LBracket)); break;
                    case ']': tokens.Add(Sym1(TokenKind.RBracket)); break;
                    case '+': tokens.Add(Sym1(TokenKind.Plus)); break;
                    case '-': tokens.Add(Sym1(TokenKind.Minus)); break;
                    case '*': tokens.Add(Sym1(TokenKind.Star)); break;
                    case '/': tokens.Add(Sym1(TokenKind.Slash)); break;
                    case '%': tokens.Add(Sym1(TokenKind.Percent)); break;
                    case '=': tokens.Add(Sym1(TokenKind.Equals)); break;
                    case '.': tokens.Add(Sym1(TokenKind.Dot)); break;
                    case '!': tokens.Add(Sym1(TokenKind.Bang)); break;
                    case '<': tokens.Add(Sym1(TokenKind.Less)); break;
                    case '>': tokens.Add(Sym1(TokenKind.Greater)); break;
                    case ':': tokens.Add(Sym1(TokenKind.Colon)); break;
                    case '&': tokens.Add(Sym1(TokenKind.Amp)); break;
                    case '|': tokens.Add(Sym1(TokenKind.Pipe)); break;
                    case '^': tokens.Add(Sym1(TokenKind.Caret)); break;
                    case '~': tokens.Add(Sym1(TokenKind.Tilde)); break;
                    case '?': tokens.Add(Sym1(TokenKind.Question)); break;
                    default: _pos++; _col++; break;
                }
            }
            tokens.Add(new Token(TokenKind.EOF, "", _line, _col));
            return tokens;
        }

        private Token Sym1(TokenKind kind)
        {
            var t = new Token(kind, Cur.ToString(), _line, _col);
            _pos++; _col++;
            return t;
        }

        private Token Sym2(TokenKind kind, string text)
        {
            var t = new Token(kind, text, _line, _col);
            _pos += 2; _col += 2;
            return t;
        }

        private void SkipWhitespace()
        {
            while (_pos < _source.Length && (Cur == ' ' || Cur == '\t')) { _pos++; _col++; }
        }

        private void SkipToEndOfLine()
        {
            while (_pos < _source.Length && Cur != '\n' && Cur != '\r') { _pos++; _col++; }
        }

        // `;;;` / `///` are doc comments only when first non-whitespace on the line.
        // Uses Current token list: if the previous token is EOL or list is empty, we're at line head.
        private bool TryReadDocComment(List<Token> tokens)
        {
            bool atLineStart = tokens.Count == 0 || tokens[tokens.Count - 1].Kind == TokenKind.EOL;
            if (!atLineStart) return false;

            int startPos = _pos, startCol = _col, startLine = _line;

            // Detect ;;; (3+) or /// (exactly 3, since // is plain and /**/ handled elsewhere)
            int markerLen = 0;
            if (Cur == ';')
            {
                int semi = 0;
                while (_pos + semi < _source.Length && _source[_pos + semi] == ';') semi++;
                if (semi < 3) return false;
                markerLen = semi;
            }
            else if (Cur == '/' && Next == '/')
            {
                int slash = 0;
                while (_pos + slash < _source.Length && _source[_pos + slash] == '/') slash++;
                if (slash < 3) return false;
                markerLen = slash;
            }
            else return false;

            _pos += markerLen; _col += markerLen;

            // Optional single leading space
            if (_pos < _source.Length && Cur == ' ') { _pos++; _col++; }

            var sb = new StringBuilder();
            while (_pos < _source.Length && Cur != '\n' && Cur != '\r')
            { sb.Append(Cur); _pos++; _col++; }

            tokens.Add(new Token(TokenKind.DocComment, sb.ToString(), startLine, startCol));
            return true;
        }

        private Token ReadString()
        {
            int startCol = _col;
            _pos++; _col++;
            var sb = new StringBuilder();
            while (_pos < _source.Length && Cur != '"' && Cur != '\n')
            {
                if (Cur == '\\' && _pos + 1 < _source.Length)
                {
                    _pos++; _col++;
                    switch (Cur) {
                        case 'n': sb.Append('\n'); break;
                        case 't': sb.Append('\t'); break;
                        case '\\': sb.Append('\\'); break;
                        case '"': sb.Append('"'); break;
                        default: sb.Append('\\'); sb.Append(Cur); break;
                    }
                }
                else { sb.Append(Cur); }
                _pos++; _col++;
            }
            if (_pos < _source.Length && Cur == '"') { _pos++; _col++; }
            return new Token(TokenKind.StringLiteral, sb.ToString(), _line, startCol);
        }

        private Token ReadNumber()
        {
            int startCol = _col;
            var sb = new StringBuilder();
            bool hasDot = false;
            while (_pos < _source.Length && (char.IsDigit(Cur) || Cur == '.'))
            {
                if (Cur == '.') { if (hasDot) break; hasDot = true; }
                sb.Append(Cur); _pos++; _col++;
            }
            return new Token(hasDot ? TokenKind.DoubleLiteral : TokenKind.IntLiteral, sb.ToString(), _line, startCol);
        }

        private static bool IsHexDigit(char c)
        {
            return (c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F');
        }

        private Token ReadHex(char prefix)
        {
            int startCol = _col;
            if (prefix == '$') { _pos++; _col++; } // skip $
            else { _pos += 2; _col += 2; } // skip 0x

            var sb = new StringBuilder();
            while (_pos < _source.Length && IsHexDigit(Cur))
            { sb.Append(Cur); _pos++; _col++; }

            int val = int.Parse(sb.ToString(), System.Globalization.NumberStyles.HexNumber);
            return new Token(TokenKind.IntLiteral, val.ToString(), _line, startCol);
        }

        private void ReadInterpolatedStringExpanded(List<Token> tokens)
        {
            int startLine = _line, startCol = _col;
            _pos += 2; _col += 2; // skip $"

            var sb = new StringBuilder();
            bool first = true;

            while (_pos < _source.Length && Cur != '"' && Cur != '\n')
            {
                if (Cur == '\\' && _pos + 1 < _source.Length)
                {
                    _pos++; _col++;
                    switch (Cur) {
                        case 'n': sb.Append('\n'); break;
                        case 't': sb.Append('\t'); break;
                        case '\\': sb.Append('\\'); break;
                        case '"': sb.Append('"'); break;
                        case '{': sb.Append('{'); break;
                        default: sb.Append('\\'); sb.Append(Cur); break;
                    }
                    _pos++; _col++;
                }
                else if (Cur == '{')
                {
                    // Flush text before {
                    if (sb.Length > 0 || first)
                    {
                        if (!first) tokens.Add(new Token(TokenKind.Plus, "+", _line, _col));
                        tokens.Add(new Token(TokenKind.StringLiteral, sb.ToString(), _line, _col));
                        sb.Clear();
                        first = false;
                    }
                    _pos++; _col++; // skip {

                    // Read expression inside { } and tokenize it
                    var exprSb = new StringBuilder();
                    int depth = 1;
                    while (_pos < _source.Length && depth > 0)
                    {
                        if (Cur == '{') depth++;
                        else if (Cur == '}') { depth--; if (depth == 0) break; }
                        exprSb.Append(Cur);
                        _pos++; _col++;
                    }
                    if (_pos < _source.Length && Cur == '}') { _pos++; _col++; } // skip }

                    // Tokenize the expression
                    string exprStr = exprSb.ToString().Trim();
                    if (exprStr.Length > 0)
                    {
                        if (!first) tokens.Add(new Token(TokenKind.Plus, "+", _line, _col));
                        first = false;

                        // Wrap in str() for auto-stringify if it's not already a string expression
                        var innerLexer = new Lexer(exprStr, _fileName);
                        var innerTokens = innerLexer.Tokenize();

                        // Check if the expression is already string-like
                        bool needStringify = true;
                        if (innerTokens.Count >= 2 && innerTokens[0].Kind == TokenKind.Identifier &&
                            innerTokens[0].Text == "str") needStringify = false;
                        if (innerTokens.Count >= 1 && innerTokens[0].Kind == TokenKind.StringLiteral) needStringify = false;

                        if (needStringify)
                        {
                            // Wrap: str( expr )
                            tokens.Add(new Token(TokenKind.Identifier, "str", _line, _col));
                            tokens.Add(new Token(TokenKind.LParen, "(", _line, _col));
                        }

                        // Add inner tokens (except EOF)
                        foreach (var t in innerTokens)
                        {
                            if (t.Kind != TokenKind.EOF) tokens.Add(t);
                        }

                        if (needStringify)
                        {
                            tokens.Add(new Token(TokenKind.RParen, ")", _line, _col));
                        }
                    }
                }
                else
                {
                    sb.Append(Cur);
                    _pos++; _col++;
                }
            }

            // Flush remaining text
            if (sb.Length > 0)
            {
                if (!first) tokens.Add(new Token(TokenKind.Plus, "+", _line, _col));
                tokens.Add(new Token(TokenKind.StringLiteral, sb.ToString(), _line, _col));
            }
            else if (first)
            {
                // Empty string $""
                tokens.Add(new Token(TokenKind.StringLiteral, "", _line, _col));
            }

            if (_pos < _source.Length && Cur == '"') { _pos++; _col++; }
        }

        private Token ReadIdentifier()
        {
            int startCol = _col;
            var sb = new StringBuilder();
            while (_pos < _source.Length && (char.IsLetterOrDigit(Cur) || Cur == '_'))
            { sb.Append(Cur); _pos++; _col++; }

            string word = sb.ToString();
            string lower = word.ToLowerInvariant();

            if (lower == "true" || lower == "false")
                return new Token(TokenKind.BoolLiteral, lower, _line, startCol);
            if (Keywords.IsTypeName(lower))
                return new Token(TokenKind.TypeName, lower, _line, startCol);
            if (Keywords.IsKeyword(lower))
                return new Token(TokenKind.Keyword, lower, _line, startCol);

            return new Token(TokenKind.Identifier, word, _line, startCol);
        }
    }
}
