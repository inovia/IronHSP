using System.Collections.Generic;
using NhspCompiler.Core.Lexing;
using NhspCompiler.Core.Parsing.Ast;
using NhspCompiler.Core.Diagnostics;

namespace NhspCompiler.Core.Parsing
{
    public class Parser
    {
        private readonly List<Token> _tokens;
        private readonly DiagnosticBag _diag;
        private int _pos;

        public Parser(List<Token> tokens, DiagnosticBag diag)
        {
            _tokens = tokens;
            _diag = diag;
            _pos = 0;
        }

        private Token Current => _pos < _tokens.Count ? _tokens[_pos] : new Token(TokenKind.EOF, "", 0, 0);
        private Token Peek(int offset = 0) => _pos + offset < _tokens.Count ? _tokens[_pos + offset] : new Token(TokenKind.EOF, "", 0, 0);

        private Token Advance()
        {
            var t = Current;
            _pos++;
            return t;
        }

        private bool Match(TokenKind kind) => Current.Kind == kind;
        private bool MatchKeyword(string kw) => Current.Kind == TokenKind.Keyword && Current.Text == kw;
        private bool MatchType() => Current.Kind == TokenKind.TypeName;

        private Token Expect(TokenKind kind, string msg)
        {
            if (Current.Kind == kind) return Advance();
            _diag.Error(Current.Line, Current.Column, msg);
            return Current;
        }

        private Token ExpectKeyword(string kw, string msg)
        {
            if (MatchKeyword(kw)) return Advance();
            _diag.Error(Current.Line, Current.Column, msg);
            return Current;
        }

        private void SkipEOL()
        {
            while (Match(TokenKind.EOL)) Advance();
        }

        public CompilationUnit ParseCompilationUnit()
        {
            var unit = new CompilationUnit();
            SkipEOL();

            while (!Match(TokenKind.EOF))
            {
                if (Match(TokenKind.Hash))
                {
                    Advance(); // skip #
                    if (MatchKeyword("assembly"))
                    {
                        Advance();
                        unit.AssemblyName = Expect(TokenKind.StringLiteral, "Expected assembly name").Text;
                        // optional: , exe
                        if (Match(TokenKind.Comma))
                        {
                            Advance();
                            if (MatchKeyword("exe")) { unit.OutputType = "exe"; Advance(); }
                        }
                    }
                    else if (MatchKeyword("reference"))
                    {
                        Advance();
                        unit.References.Add(Expect(TokenKind.StringLiteral, "Expected reference path").Text);
                    }
                    else if (MatchKeyword("using"))
                    {
                        Advance();
                        unit.Usings.Add(Expect(TokenKind.StringLiteral, "Expected namespace").Text);
                    }
                    else if (MatchKeyword("class"))
                    {
                        unit.Classes.Add(ParseClass());
                    }
                    else
                    {
                        _diag.Error(Current.Line, Current.Column, $"Unknown directive: {Current.Text}");
                        Advance();
                    }
                }
                else
                {
                    Advance(); // skip unknown
                }
                SkipEOL();
            }

            if (string.IsNullOrEmpty(unit.AssemblyName))
            {
                _diag.Error(1, 1, "Missing #assembly directive");
            }
            return unit;
        }

        private ClassDeclaration ParseClass()
        {
            var cls = new ClassDeclaration();
            Advance(); // skip "class"
            cls.Name = Expect(TokenKind.Identifier, "Expected class name").Text;
            cls.Line = Current.Line;
            SkipEOL();

            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (Match(TokenKind.Hash))
                {
                    Advance();
                    if (MatchKeyword("endclass")) { Advance(); break; }
                    if (MatchKeyword("access"))
                    {
                        Advance();
                        cls.DefaultAccess = Advance().Text;
                    }
                    else if (MatchKeyword("field"))
                    {
                        cls.Fields.Add(ParseField(cls.DefaultAccess));
                    }
                    else if (MatchKeyword("func"))
                    {
                        cls.Methods.Add(ParseMethod(cls.DefaultAccess));
                    }
                    else
                    {
                        _diag.Error(Current.Line, Current.Column, $"Unexpected directive in class: {Current.Text}");
                        Advance();
                    }
                }
                else
                {
                    Advance();
                }
            }
            return cls;
        }

        private FieldDeclaration ParseField(string defaultAccess)
        {
            var field = new FieldDeclaration { Line = Current.Line };
            Advance(); // skip "field"
            field.Name = Expect(TokenKind.Identifier, "Expected field name").Text;
            ExpectKeyword("as", "Expected 'as'");
            field.TypeName = ReadTypeName();

            // optional: , access
            if (Match(TokenKind.Comma))
            {
                Advance();
                field.Access = Advance().Text;
            }
            else
            {
                field.Access = defaultAccess;
            }
            return field;
        }

        private MethodDeclaration ParseMethod(string defaultAccess)
        {
            var method = new MethodDeclaration { Line = Current.Line };
            Advance(); // skip "func"

            method.Name = Expect(TokenKind.Identifier, "Expected method name").Text;

            // Parameters: type name, type name, ...
            // Then optionally: as ReturnType
            // Then optionally: , public/private/static
            while (!Match(TokenKind.EOL) && !Match(TokenKind.EOF))
            {
                if (MatchKeyword("as"))
                {
                    Advance();
                    method.ReturnType = ReadTypeName();
                    continue;
                }
                if (Match(TokenKind.Comma))
                {
                    Advance();
                    // Modifiers after comma
                    while (MatchKeyword("public") || MatchKeyword("private") || MatchKeyword("static"))
                    {
                        string mod = Advance().Text;
                        if (mod == "public" || mod == "private") method.Access = mod;
                        if (mod == "static") method.IsStatic = true;
                        if (Match(TokenKind.Comma)) Advance();
                    }
                    continue;
                }

                // Parameter: TypeName Identifier
                if (MatchType() || Current.Kind == TokenKind.Identifier)
                {
                    var param = new ParameterDeclaration { Line = Current.Line };
                    param.TypeName = ReadTypeName();
                    param.Name = Expect(TokenKind.Identifier, "Expected parameter name").Text;
                    method.Parameters.Add(param);
                    if (Match(TokenKind.Comma) && !IsModifierAhead()) Advance();
                    continue;
                }
                break;
            }

            if (method.Access == null) method.Access = defaultAccess;
            SkipEOL();

            // Body
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (MatchKeyword("endfunc")) { Advance(); break; }
                var stmt = ParseStatement();
                if (stmt != null) method.Body.Add(stmt);
            }
            return method;
        }

        private bool IsModifierAhead()
        {
            var next = Peek(1);
            return next.Kind == TokenKind.Keyword &&
                (next.Text == "public" || next.Text == "private" || next.Text == "static");
        }

        private string ReadTypeName()
        {
            if (MatchType())
            {
                return Advance().Text;
            }
            if (Current.Kind == TokenKind.Identifier)
            {
                return Advance().Text;
            }
            _diag.Error(Current.Line, Current.Column, "Expected type name");
            return "void";
        }

        private Statement ParseStatement()
        {
            if (MatchKeyword("return"))
            {
                Advance();
                Expression val = null;
                if (!Match(TokenKind.EOL) && !Match(TokenKind.EOF))
                {
                    val = ParseExpression();
                }
                return new ReturnStatement { Value = val, Line = Current.Line };
            }

            // Default: expression statement
            var expr = ParseExpression();
            if (expr != null)
                return new ExpressionStatement { Expr = expr, Line = Current.Line };
            Advance(); // skip unrecognized
            return null;
        }

        private Expression ParseExpression()
        {
            return ParseAddSub();
        }

        private Expression ParseAddSub()
        {
            var left = ParsePrimary();
            while (Match(TokenKind.Plus) || Match(TokenKind.Minus))
            {
                string op = Advance().Text;
                var right = ParsePrimary();
                left = new BinaryExpr { Left = left, Operator = op, Right = right };
            }
            return left;
        }

        private Expression ParsePrimary()
        {
            if (Match(TokenKind.IntLiteral))
            {
                var tok = Advance();
                return new IntLiteralExpr { Value = int.Parse(tok.Text), Line = tok.Line };
            }
            if (Match(TokenKind.StringLiteral))
            {
                var tok = Advance();
                return new StringLiteralExpr { Value = tok.Text, Line = tok.Line };
            }
            if (Current.Kind == TokenKind.Identifier)
            {
                var tok = Advance();
                return new IdentifierExpr { Name = tok.Text, Line = tok.Line };
            }
            if (Match(TokenKind.LParen))
            {
                Advance();
                var expr = ParseExpression();
                Expect(TokenKind.RParen, "Expected ')'");
                return expr;
            }
            return null;
        }
    }
}
