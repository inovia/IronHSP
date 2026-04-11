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
        }

        private Token Current => _pos < _tokens.Count ? _tokens[_pos] : new Token(TokenKind.EOF, "", 0, 0);
        private Token Peek(int offset = 1) => _pos + offset < _tokens.Count ? _tokens[_pos + offset] : new Token(TokenKind.EOF, "", 0, 0);
        private Token Advance() { var t = Current; _pos++; return t; }
        private bool Match(TokenKind kind) => Current.Kind == kind;
        private bool MatchKW(string kw) => Current.Kind == TokenKind.Keyword && Current.Text == kw;
        private bool MatchType() => Current.Kind == TokenKind.TypeName;

        private Token Expect(TokenKind kind, string msg)
        {
            if (Match(kind)) return Advance();
            _diag.Error(Current.Line, Current.Column, msg);
            return Current;
        }

        private void SkipEOL() { while (Match(TokenKind.EOL)) Advance(); }

        // ======== Top Level ========

        public CompilationUnit ParseCompilationUnit()
        {
            var unit = new CompilationUnit();
            SkipEOL();
            while (!Match(TokenKind.EOF))
            {
                if (Match(TokenKind.Hash))
                {
                    Advance();
                    if (MatchKW("assembly"))
                    {
                        Advance();
                        unit.AssemblyName = Expect(TokenKind.StringLiteral, "Expected assembly name").Text;
                        if (Match(TokenKind.Comma)) { Advance(); if (MatchKW("exe")) { unit.OutputType = "exe"; Advance(); } }
                    }
                    else if (MatchKW("reference")) { Advance(); unit.References.Add(Expect(TokenKind.StringLiteral, "Expected ref").Text); }
                    else if (MatchKW("using")) { Advance(); unit.Usings.Add(Expect(TokenKind.StringLiteral, "Expected ns").Text); }
                    else if (MatchKW("class")) { unit.Classes.Add(ParseClass()); }
                    else { _diag.Error(Current.Line, Current.Column, $"Unknown directive: {Current.Text}"); Advance(); }
                }
                else { Advance(); }
                SkipEOL();
            }
            if (string.IsNullOrEmpty(unit.AssemblyName))
                _diag.Error(1, 1, "Missing #assembly directive");
            return unit;
        }

        // ======== Class ========

        private ClassDeclaration ParseClass()
        {
            var cls = new ClassDeclaration { Line = Current.Line };
            Advance(); // "class"
            cls.Name = Expect(TokenKind.Identifier, "Expected class name").Text;

            // Inheritance: : BaseClass, IFace1, IFace2
            if (Match(TokenKind.Colon))
            {
                Advance();
                string first = ReadTypeName();
                // First could be base class or interface
                cls.BaseClass = first;
                while (Match(TokenKind.Comma))
                {
                    Advance();
                    string next = ReadTypeName();
                    // Check if next starts with 'I' (convention for interface) - simplified
                    cls.Interfaces.Add(next);
                }
            }
            SkipEOL();

            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (Match(TokenKind.Hash))
                {
                    Advance();
                    if (MatchKW("endclass")) { Advance(); break; }
                    if (MatchKW("access")) { Advance(); cls.DefaultAccess = Advance().Text; }
                    else if (MatchKW("field")) { cls.Fields.Add(ParseField(cls.DefaultAccess)); }
                    else if (MatchKW("func")) { cls.Methods.Add(ParseMethod(cls.DefaultAccess)); }
                    else { _diag.Error(Current.Line, Current.Column, $"Unexpected: #{Current.Text}"); Advance(); }
                }
                else { Advance(); }
            }
            return cls;
        }

        private FieldDeclaration ParseField(string defAccess)
        {
            var f = new FieldDeclaration { Line = Current.Line };
            Advance(); // "field"
            f.Name = Expect(TokenKind.Identifier, "Expected field name").Text;
            if (MatchKW("as")) { Advance(); f.TypeName = ReadTypeName(); }
            else { f.TypeName = "int"; }
            if (Match(TokenKind.Comma)) { Advance(); f.Access = Advance().Text; }
            else { f.Access = defAccess; }
            return f;
        }

        private MethodDeclaration ParseMethod(string defAccess)
        {
            var m = new MethodDeclaration { Line = Current.Line };
            Advance(); // "func"
            m.Name = Expect(TokenKind.Identifier, "Expected method name").Text;

            // Parameters and modifiers on same line
            while (!Match(TokenKind.EOL) && !Match(TokenKind.EOF))
            {
                if (MatchKW("as")) { Advance(); m.ReturnType = ReadTypeName(); continue; }
                if (Match(TokenKind.Comma))
                {
                    Advance();
                    while (MatchKW("public") || MatchKW("private") || MatchKW("static") || MatchKW("virtual") || MatchKW("override"))
                    {
                        string mod = Advance().Text;
                        if (mod == "public" || mod == "private") m.Access = mod;
                        if (mod == "static") m.IsStatic = true;
                        if (Match(TokenKind.Comma)) Advance();
                    }
                    continue;
                }
                if (MatchType() || (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.Identifier))
                {
                    var p = new ParameterDeclaration { Line = Current.Line };
                    p.TypeName = ReadTypeName();
                    p.Name = Expect(TokenKind.Identifier, "Expected param name").Text;
                    m.Parameters.Add(p);
                    continue;
                }
                break;
            }
            if (m.Access == null) m.Access = defAccess;
            SkipEOL();

            // Body
            m.Body = ParseBlock("endfunc");
            return m;
        }

        // ======== Statements ========

        private List<Statement> ParseBlock(string endKeyword)
        {
            var stmts = new List<Statement>();
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (MatchKW(endKeyword)) { Advance(); break; }
                if (MatchKW("else") || MatchKW("elseif") || MatchKW("endif")) break; // caller handles
                if (MatchKW("loop") || MatchKW("wend")) break;
                var stmt = ParseStatement();
                if (stmt != null) stmts.Add(stmt);
            }
            return stmts;
        }

        private Statement ParseStatement()
        {
            // dim x as int [= expr]
            if (MatchKW("dim")) return ParseDim();

            // return [expr]
            if (MatchKW("return"))
            {
                Advance();
                Expression val = null;
                if (!Match(TokenKind.EOL) && !Match(TokenKind.EOF)) val = ParseExpression();
                return new ReturnStatement { Value = val, Line = Current.Line };
            }

            // if condition { ... } [else { ... }]
            if (MatchKW("if")) return ParseIf();

            // repeat [count] ... loop
            if (MatchKW("repeat")) return ParseRepeat();

            // while condition ... wend
            if (MatchKW("while")) return ParseWhile();

            // break / continue
            if (MatchKW("break")) { Advance(); return new BreakStatement { Line = Current.Line }; }
            if (MatchKW("continue")) { Advance(); return new ContinueStatement { Line = Current.Line }; }

            // Assignment: identifier = expr  or  identifier += expr
            if (Current.Kind == TokenKind.Identifier && IsAssignOp(Peek()))
            {
                return ParseAssignment();
            }

            // Expression statement (method calls, etc.)
            var expr = ParseExpression();
            if (expr != null) return new ExpressionStatement { Expr = expr, Line = Current.Line };

            Advance();
            return null;
        }

        private bool IsAssignOp(Token t)
        {
            return t.Kind == TokenKind.Equals || t.Kind == TokenKind.PlusEqual ||
                   t.Kind == TokenKind.MinusEqual || t.Kind == TokenKind.StarEqual ||
                   t.Kind == TokenKind.SlashEqual;
        }

        private Statement ParseDim()
        {
            Advance(); // "dim"
            var decl = new LocalVarDeclaration { Line = Current.Line };
            decl.Name = Expect(TokenKind.Identifier, "Expected variable name").Text;
            if (MatchKW("as")) { Advance(); decl.TypeName = ReadTypeName(); }
            if (Match(TokenKind.Equals)) { Advance(); decl.Initializer = ParseExpression(); }
            return decl;
        }

        private Statement ParseAssignment()
        {
            var stmt = new AssignmentStatement { Line = Current.Line };
            stmt.VariableName = Advance().Text;
            stmt.Operator = Advance().Text; // =, +=, etc.
            stmt.Value = ParseExpression();
            return stmt;
        }

        private IfStatement ParseIf()
        {
            Advance(); // "if"
            var ifStmt = new IfStatement { Line = Current.Line };
            ifStmt.Condition = ParseExpression();

            // Block style: if cond { ... } else { ... }
            if (Match(TokenKind.LBrace))
            {
                Advance();
                SkipEOL();
                while (!Match(TokenKind.RBrace) && !Match(TokenKind.EOF))
                {
                    SkipEOL();
                    if (Match(TokenKind.RBrace)) break;
                    var s = ParseStatement();
                    if (s != null) ifStmt.ThenBody.Add(s);
                    SkipEOL();
                }
                if (Match(TokenKind.RBrace)) Advance();
                SkipEOL();

                // elseif / else
                while (MatchKW("elseif"))
                {
                    Advance();
                    var clause = new ElseIfClause { Condition = ParseExpression() };
                    if (Match(TokenKind.LBrace))
                    {
                        Advance(); SkipEOL();
                        while (!Match(TokenKind.RBrace) && !Match(TokenKind.EOF))
                        {
                            SkipEOL(); if (Match(TokenKind.RBrace)) break;
                            var s = ParseStatement(); if (s != null) clause.Body.Add(s); SkipEOL();
                        }
                        if (Match(TokenKind.RBrace)) Advance();
                    }
                    ifStmt.ElseIfs.Add(clause);
                    SkipEOL();
                }
                if (MatchKW("else"))
                {
                    Advance();
                    if (Match(TokenKind.LBrace))
                    {
                        Advance(); SkipEOL();
                        while (!Match(TokenKind.RBrace) && !Match(TokenKind.EOF))
                        {
                            SkipEOL(); if (Match(TokenKind.RBrace)) break;
                            var s = ParseStatement(); if (s != null) ifStmt.ElseBody.Add(s); SkipEOL();
                        }
                        if (Match(TokenKind.RBrace)) Advance();
                    }
                }
            }
            else
            {
                // Single-line if: if cond : stmt  (or multi-line with endif)
                SkipEOL();
                ifStmt.ThenBody = ParseBlock("endif");
                // Check for else
                if (MatchKW("else")) { Advance(); SkipEOL(); ifStmt.ElseBody = ParseBlock("endif"); }
                if (MatchKW("endif")) Advance();
            }
            return ifStmt;
        }

        private RepeatStatement ParseRepeat()
        {
            Advance(); // "repeat"
            var stmt = new RepeatStatement { Line = Current.Line };
            if (!Match(TokenKind.EOL) && !Match(TokenKind.EOF))
                stmt.Count = ParseExpression();
            SkipEOL();
            stmt.Body = ParseBlock("loop");
            if (MatchKW("loop")) Advance();
            return stmt;
        }

        private WhileStatement ParseWhile()
        {
            Advance(); // "while"
            var stmt = new WhileStatement { Line = Current.Line };
            stmt.Condition = ParseExpression();
            SkipEOL();
            stmt.Body = ParseBlock("wend");
            if (MatchKW("wend")) Advance();
            return stmt;
        }

        // ======== Expressions (precedence climbing) ========

        private Expression ParseExpression() => ParseOr();

        private Expression ParseOr()
        {
            var left = ParseAnd();
            while (Match(TokenKind.PipePipe) || MatchKW("or"))
            { Advance(); left = new BinaryExpr { Left = left, Operator = "||", Right = ParseAnd() }; }
            return left;
        }

        private Expression ParseAnd()
        {
            var left = ParseEquality();
            while (Match(TokenKind.AmpAmp) || MatchKW("and"))
            { Advance(); left = new BinaryExpr { Left = left, Operator = "&&", Right = ParseEquality() }; }
            return left;
        }

        private Expression ParseEquality()
        {
            var left = ParseComparison();
            while (Match(TokenKind.EqualEqual) || Match(TokenKind.BangEqual))
            { string op = Advance().Text; left = new BinaryExpr { Left = left, Operator = op, Right = ParseComparison() }; }
            return left;
        }

        private Expression ParseComparison()
        {
            var left = ParseAddSub();
            while (Match(TokenKind.Less) || Match(TokenKind.Greater) || Match(TokenKind.LessEqual) || Match(TokenKind.GreaterEqual))
            { string op = Advance().Text; left = new BinaryExpr { Left = left, Operator = op, Right = ParseAddSub() }; }
            return left;
        }

        private Expression ParseAddSub()
        {
            var left = ParseMulDiv();
            while (Match(TokenKind.Plus) || Match(TokenKind.Minus))
            { string op = Advance().Text; left = new BinaryExpr { Left = left, Operator = op, Right = ParseMulDiv() }; }
            return left;
        }

        private Expression ParseMulDiv()
        {
            var left = ParseUnary();
            while (Match(TokenKind.Star) || Match(TokenKind.Slash) || Match(TokenKind.Percent))
            { string op = Advance().Text; left = new BinaryExpr { Left = left, Operator = op, Right = ParseUnary() }; }
            return left;
        }

        private Expression ParseUnary()
        {
            if (Match(TokenKind.Minus))
            { Advance(); return new UnaryExpr { Operator = "-", Operand = ParseUnary() }; }
            if (Match(TokenKind.Bang) || MatchKW("not"))
            { Advance(); return new UnaryExpr { Operator = "!", Operand = ParseUnary() }; }
            return ParseCallOrPrimary();
        }

        private Expression ParseCallOrPrimary()
        {
            var expr = ParsePrimary();

            // Function call: identifier(args)
            if (expr is IdentifierExpr ident && Match(TokenKind.LParen))
            {
                Advance();
                var call = new CallExpr { MethodName = ident.Name, Line = ident.Line };
                if (!Match(TokenKind.RParen))
                {
                    call.Arguments.Add(ParseExpression());
                    while (Match(TokenKind.Comma)) { Advance(); call.Arguments.Add(ParseExpression()); }
                }
                Expect(TokenKind.RParen, "Expected ')'");
                return call;
            }
            return expr;
        }

        private Expression ParsePrimary()
        {
            if (Match(TokenKind.IntLiteral))
            { var t = Advance(); return new IntLiteralExpr { Value = int.Parse(t.Text), Line = t.Line }; }
            if (Match(TokenKind.DoubleLiteral))
            { var t = Advance(); return new DoubleLiteralExpr { Value = double.Parse(t.Text), Line = t.Line }; }
            if (Match(TokenKind.StringLiteral))
            { var t = Advance(); return new StringLiteralExpr { Value = t.Text, Line = t.Line }; }
            if (Match(TokenKind.BoolLiteral))
            { var t = Advance(); return new BoolLiteralExpr { Value = t.Text == "true", Line = t.Line }; }
            if (MatchKW("cnt"))
            { Advance(); return new CntExpr { Line = Current.Line }; }
            if (Current.Kind == TokenKind.Identifier)
            { var t = Advance(); return new IdentifierExpr { Name = t.Text, Line = t.Line }; }
            if (Match(TokenKind.LParen))
            { Advance(); var e = ParseExpression(); Expect(TokenKind.RParen, "Expected ')'"); return e; }
            return null;
        }

        private string ReadTypeName()
        {
            if (MatchType()) return Advance().Text;
            if (Current.Kind == TokenKind.Identifier) return Advance().Text;
            _diag.Error(Current.Line, Current.Column, "Expected type name");
            return "void";
        }
    }
}
