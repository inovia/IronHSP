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

        public List<Token> Tokenize()
        {
            var tokens = new List<Token>();
            while (_pos < _source.Length)
            {
                SkipWhitespace();
                if (_pos >= _source.Length) break;

                char c = _source[_pos];

                // Comment: ; to end of line
                if (c == ';')
                {
                    SkipToEndOfLine();
                    continue;
                }

                // Newline
                if (c == '\n')
                {
                    tokens.Add(new Token(TokenKind.EOL, "\\n", _line, _col));
                    _pos++;
                    _line++;
                    _col = 1;
                    continue;
                }
                if (c == '\r')
                {
                    _pos++;
                    if (_pos < _source.Length && _source[_pos] == '\n') _pos++;
                    tokens.Add(new Token(TokenKind.EOL, "\\n", _line, _col));
                    _line++;
                    _col = 1;
                    continue;
                }

                // String literal
                if (c == '"')
                {
                    tokens.Add(ReadString());
                    continue;
                }

                // Number
                if (char.IsDigit(c))
                {
                    tokens.Add(ReadNumber());
                    continue;
                }

                // Identifier / Keyword / TypeName
                if (char.IsLetter(c) || c == '_')
                {
                    tokens.Add(ReadIdentifier());
                    continue;
                }

                // Symbols
                int startCol = _col;
                switch (c)
                {
                    case '#': tokens.Add(Sym(TokenKind.Hash, "#")); break;
                    case ',': tokens.Add(Sym(TokenKind.Comma, ",")); break;
                    case '(': tokens.Add(Sym(TokenKind.LParen, "(")); break;
                    case ')': tokens.Add(Sym(TokenKind.RParen, ")")); break;
                    case '+': tokens.Add(Sym(TokenKind.Plus, "+")); break;
                    case '-': tokens.Add(Sym(TokenKind.Minus, "-")); break;
                    case '*': tokens.Add(Sym(TokenKind.Star, "*")); break;
                    case '/': tokens.Add(Sym(TokenKind.Slash, "/")); break;
                    case '=': tokens.Add(Sym(TokenKind.Equals, "=")); break;
                    case '.': tokens.Add(Sym(TokenKind.Dot, ".")); break;
                    default:
                        _pos++; _col++;
                        break;
                }
            }
            tokens.Add(new Token(TokenKind.EOF, "", _line, _col));
            return tokens;
        }

        private Token Sym(TokenKind kind, string text)
        {
            var tok = new Token(kind, text, _line, _col);
            _pos++;
            _col++;
            return tok;
        }

        private void SkipWhitespace()
        {
            while (_pos < _source.Length)
            {
                char c = _source[_pos];
                if (c == ' ' || c == '\t') { _pos++; _col++; }
                else break;
            }
        }

        private void SkipToEndOfLine()
        {
            while (_pos < _source.Length && _source[_pos] != '\n' && _source[_pos] != '\r')
            {
                _pos++; _col++;
            }
        }

        private Token ReadString()
        {
            int startCol = _col;
            _pos++; _col++; // skip opening "
            var sb = new StringBuilder();
            while (_pos < _source.Length && _source[_pos] != '"' && _source[_pos] != '\n')
            {
                if (_source[_pos] == '\\' && _pos + 1 < _source.Length)
                {
                    _pos++; _col++;
                    switch (_source[_pos])
                    {
                        case 'n': sb.Append('\n'); break;
                        case 't': sb.Append('\t'); break;
                        case '\\': sb.Append('\\'); break;
                        case '"': sb.Append('"'); break;
                        default: sb.Append('\\'); sb.Append(_source[_pos]); break;
                    }
                }
                else
                {
                    sb.Append(_source[_pos]);
                }
                _pos++; _col++;
            }
            if (_pos < _source.Length && _source[_pos] == '"') { _pos++; _col++; }
            return new Token(TokenKind.StringLiteral, sb.ToString(), _line, startCol);
        }

        private Token ReadNumber()
        {
            int startCol = _col;
            var sb = new StringBuilder();
            bool hasDot = false;
            while (_pos < _source.Length && (char.IsDigit(_source[_pos]) || _source[_pos] == '.'))
            {
                if (_source[_pos] == '.')
                {
                    if (hasDot) break;
                    hasDot = true;
                }
                sb.Append(_source[_pos]);
                _pos++; _col++;
            }
            var kind = hasDot ? TokenKind.DoubleLiteral : TokenKind.IntLiteral;
            return new Token(kind, sb.ToString(), _line, startCol);
        }

        private Token ReadIdentifier()
        {
            int startCol = _col;
            var sb = new StringBuilder();
            while (_pos < _source.Length && (char.IsLetterOrDigit(_source[_pos]) || _source[_pos] == '_'))
            {
                sb.Append(_source[_pos]);
                _pos++; _col++;
            }
            string word = sb.ToString();
            string lower = word.ToLowerInvariant();

            if (Keywords.IsTypeName(lower))
                return new Token(TokenKind.TypeName, lower, _line, startCol);
            if (Keywords.IsKeyword(lower))
                return new Token(TokenKind.Keyword, lower, _line, startCol);

            return new Token(TokenKind.Identifier, word, _line, startCol);
        }
    }
}
