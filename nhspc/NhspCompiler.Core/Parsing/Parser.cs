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
        private string _currentNamespace;

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
                    else if (MatchKW("namespace"))
                    {
                        Advance();
                        _currentNamespace = Expect(TokenKind.StringLiteral, "Expected namespace").Text;
                    }
                    else if (MatchKW("endnamespace"))
                    {
                        Advance();
                        _currentNamespace = null;
                    }
                    else if (MatchKW("interface"))
                    {
                        var iface = ParseInterface();
                        if (_currentNamespace != null) iface.Name = _currentNamespace + "." + iface.Name;
                        unit.Interfaces.Add(iface);
                    }
                    else if (MatchKW("class"))
                    {
                        var cls = ParseClass();
                        if (_currentNamespace != null) cls.Name = _currentNamespace + "." + cls.Name;
                        unit.Classes.Add(cls);
                    }
                    else if (MatchKW("main"))
                    {
                        Advance(); SkipEOL();
                        unit.MainBody = ParseBlock("endmain");
                        if (unit.OutputType == "dll") unit.OutputType = "exe";
                    }
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

            // Leading modifiers: #class public ClassName
            while (IsModifierKeyword())
            {
                string mod = Advance().Text;
                if (mod == "public" || mod == "private") cls.DefaultAccess = mod;
            }

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
                    else if (MatchKW("init")) { cls.Constructors.Add(ParseConstructor(cls.DefaultAccess)); }
                    else if (MatchKW("property")) { cls.Properties.Add(ParseProperty(cls.DefaultAccess)); }
                    else { _diag.Error(Current.Line, Current.Column, $"Unexpected: #{Current.Text}"); Advance(); }
                }
                else { Advance(); }
            }
            return cls;
        }

        private FieldDeclaration ParseField(string defAccess)
        {
            var f = new FieldDeclaration { Line = Current.Line, Access = defAccess };
            Advance(); // "field"

            // #field [access] [type] Name  or  #field Name as type [, access]
            while (IsModifierKeyword())
            {
                string mod = Advance().Text;
                if (mod == "public" || mod == "private" || mod == "protected") f.Access = mod;
            }

            // type + name, or just name
            if ((MatchType() || IsKnownType()) && Peek().Kind == TokenKind.Identifier)
            {
                f.TypeName = ReadTypeName();
                f.Name = Expect(TokenKind.Identifier, "Expected field name").Text;
            }
            else
            {
                f.Name = Expect(TokenKind.Identifier, "Expected field name").Text;
                // old: as type
                if (MatchKW("as")) { Advance(); f.TypeName = ReadTypeName(); }
                else { f.TypeName = "int"; }
            }
            return f;
        }

        private MethodDeclaration ParseMethod(string defAccess)
        {
            var m = new MethodDeclaration { Line = Current.Line };
            Advance(); // "func"

            // New syntax: #func [modifiers...] [returnType] Name [, params...]
            // Old syntax: #func Name [params...] [as ReturnType] [, modifiers...]
            // Detection: if next tokens are modifiers or type before identifier, use new syntax

            // Consume leading modifiers
            while (IsModifierKeyword())
            {
                ApplyModifier(m, Advance().Text);
            }

            // Next: returnType Name  OR  just Name (void)
            // returnType is present if: current is a type/typename AND next is identifier
            if (MatchType() && Peek().Kind == TokenKind.Identifier)
            {
                m.ReturnType = ReadTypeName();
                m.Name = Expect(TokenKind.Identifier, "Expected method name").Text;
            }
            else if (IsKnownType() && Peek().Kind == TokenKind.Identifier)
            {
                m.ReturnType = ReadTypeName();
                m.Name = Expect(TokenKind.Identifier, "Expected method name").Text;
            }
            else if (Current.Kind == TokenKind.Identifier)
            {
                // No return type → void
                m.Name = Advance().Text;
            }
            else
            {
                m.Name = Expect(TokenKind.Identifier, "Expected method name").Text;
            }

            // Parameters: , type name [, type name] ...
            while (!Match(TokenKind.EOL) && !Match(TokenKind.EOF))
            {
                if (Match(TokenKind.Comma)) { Advance(); }
                if (Match(TokenKind.EOL) || Match(TokenKind.EOF)) break;
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

            m.Body = ParseBlock("endfunc");
            return m;
        }

        private bool IsModifierKeyword()
        {
            return MatchKW("public") || MatchKW("private") || MatchKW("protected") ||
                   MatchKW("static") || MatchKW("virtual") || MatchKW("override") || MatchKW("abstract");
        }

        private bool IsKnownType()
        {
            // Check if current identifier is a known type (in TypeAliases or registered)
            return Current.Kind == TokenKind.Identifier &&
                   Lexing.Keywords.TypeAliases.ContainsKey(Current.Text.ToLowerInvariant());
        }

        private void ApplyModifier(MethodDeclaration m, string mod)
        {
            if (mod == "public" || mod == "private" || mod == "protected") m.Access = mod;
            if (mod == "static") m.IsStatic = true;
            if (mod == "virtual") m.IsVirtual = true;
            if (mod == "override") m.IsOverride = true;
        }

        // ======== Statements ========

        // Check for #keyword pattern (Hash + Keyword)
        private bool MatchHashKW(string kw)
        {
            return Match(TokenKind.Hash) && Peek().Kind == TokenKind.Keyword && Peek().Text == kw;
        }

        private void AdvanceHashKW()
        {
            Advance(); // skip #
            Advance(); // skip keyword
        }

        private List<Statement> ParseBlock(string endKeyword)
        {
            var stmts = new List<Statement>();
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (MatchHashKW(endKeyword)) { AdvanceHashKW(); break; }
                if (MatchKW(endKeyword)) { Advance(); break; }
                if (MatchKW("else") || MatchKW("elseif") || MatchKW("endif")) break;
                if (MatchKW("loop") || MatchKW("wend") || MatchKW("next")) break;
                if (MatchKW("catch") || MatchKW("finally") || MatchKW("endtry")) break;
                if (MatchHashKW("catch") || MatchHashKW("finally") || MatchHashKW("endtry")) break;
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

            // for var = start to end [step N] ... next
            if (MatchKW("for")) return ParseFor();

            // new var, TypeName [, args...]  or  dim var = new TypeName(args)
            if (MatchKW("new")) return ParseNew();

            // try ... catch ... endtry (also via #try from Hash context)
            if (MatchKW("try")) return ParseTryCatch();
            if (Match(TokenKind.Hash) && Peek().Text == "try") { Advance(); return ParseTryCatch(); }

            // throw [expr]
            if (MatchKW("throw"))
            {
                Advance();
                Expression val = null;
                if (!Match(TokenKind.EOL) && !Match(TokenKind.EOF))
                    val = ParseExpression();
                return new ThrowStatement { Value = val, Line = Current.Line };
            }

            // print expr
            if (MatchKW("print"))
            {
                Advance();
                return new PrintStatement { Value = ParseExpression(), Line = Current.Line };
            }

            // break / continue
            if (MatchKW("break")) { Advance(); return new BreakStatement { Line = Current.Line }; }
            if (MatchKW("continue")) { Advance(); return new ContinueStatement { Line = Current.Line }; }

            // Array element assignment: arr(i) = expr
            if (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.LParen)
            {
                // Lookahead: name ( expr ) = expr ?
                int save = _pos;
                string name = Advance().Text;
                if (Match(TokenKind.LParen))
                {
                    Advance();
                    var idx = ParseExpression();
                    if (Match(TokenKind.RParen))
                    {
                        Advance();
                        if (Match(TokenKind.Equals))
                        {
                            Advance();
                            var val = ParseExpression();
                            return new IndexAssignStatement { ArrayName = name, Index = idx, Value = val, Line = Current.Line };
                        }
                    }
                }
                // Not an array assign, restore position
                _pos = save;
            }

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

            // New syntax: dim type name [, size]
            // Also: dim name = expr (type inferred)
            if ((MatchType() || IsKnownType()) && Peek().Kind == TokenKind.Identifier)
            {
                decl.TypeName = ReadTypeName();
                decl.Name = Expect(TokenKind.Identifier, "Expected variable name").Text;
            }
            else
            {
                decl.Name = Expect(TokenKind.Identifier, "Expected variable name").Text;
            }

            // Array size: dim int arr, 10
            if (Match(TokenKind.Comma))
            {
                Advance();
                if (Match(TokenKind.IntLiteral))
                    decl.ArraySize = int.Parse(Advance().Text);
            }
            // Initializer: dim x = expr
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

        private TryCatchStatement ParseTryCatch()
        {
            Advance(); // "try"
            SkipEOL();
            var stmt = new TryCatchStatement { Line = Current.Line };

            // Parse try body until catch/finally/endtry
            stmt.TryBody = ParseTryBlock();

            // catch [Type varName]
            if (IsTryKW("catch"))
            {
                ConsumeTryKW(); // consume catch (with optional #)
                if (Current.Kind == TokenKind.Identifier || MatchType())
                {
                    if (MatchType() && Peek().Kind == TokenKind.Identifier)
                    { stmt.CatchTypeName = ReadTypeName(); stmt.CatchVarName = Advance().Text; }
                    else if (Current.Kind == TokenKind.Identifier)
                    { stmt.CatchVarName = Advance().Text; }
                }
                SkipEOL();
                stmt.CatchBody = ParseTryBlock();
            }

            if (IsTryKW("finally"))
            {
                ConsumeTryKW(); SkipEOL();
                stmt.FinallyBody = ParseTryBlock();
            }

            if (IsTryKW("endtry")) ConsumeTryKW();
            return stmt;
        }

        private bool IsTryKW(string kw)
        {
            return MatchKW(kw) || MatchHashKW(kw);
        }

        private void ConsumeTryKW()
        {
            if (Match(TokenKind.Hash)) Advance(); // skip optional #
            Advance(); // skip keyword
        }

        // Parse statements until catch/finally/endtry is seen (without consuming it)
        private List<Statement> ParseTryBlock()
        {
            var stmts = new List<Statement>();
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (IsTryKW("catch") || IsTryKW("finally") || IsTryKW("endtry")) break;
                if (MatchHashKW("endfunc") || MatchHashKW("endclass")) break; // safety
                var s = ParseStatement();
                if (s != null) stmts.Add(s);
            }
            return stmts;
        }

        private ForStatement ParseFor()
        {
            Advance(); // "for"
            var stmt = new ForStatement { Line = Current.Line };
            stmt.VarName = Expect(TokenKind.Identifier, "Expected loop variable").Text;
            Expect(TokenKind.Equals, "Expected '='");
            stmt.Start = ParseExpression();
            if (MatchKW("to")) Advance();
            stmt.End = ParseExpression();
            if (MatchKW("step")) { Advance(); stmt.Step = ParseExpression(); }
            SkipEOL();
            stmt.Body = ParseBlock("next");
            if (MatchKW("next")) Advance();
            return stmt;
        }

        private Statement ParseNew()
        {
            // new var, TypeName(args...)  or  new var, TypeName, args...
            Advance(); // "new"
            string varName = Expect(TokenKind.Identifier, "Expected variable name").Text;
            if (Match(TokenKind.Comma)) Advance();
            string typeName = ReadTypeName();

            var args = new System.Collections.Generic.List<Expression>();
            // args: (expr, expr, ...) or , expr, expr
            if (Match(TokenKind.LParen))
            {
                Advance();
                if (!Match(TokenKind.RParen))
                {
                    args.Add(ParseExpression());
                    while (Match(TokenKind.Comma)) { Advance(); args.Add(ParseExpression()); }
                }
                Expect(TokenKind.RParen, "Expected ')'");
            }
            else
            {
                while (Match(TokenKind.Comma))
                {
                    Advance();
                    if (Match(TokenKind.EOL) || Match(TokenKind.EOF)) break;
                    args.Add(ParseExpression());
                }
            }

            // Generate: dim varName = new TypeName(args)
            var newExpr = new NewObjectExpr { TypeName = typeName, Arguments = args, Line = Current.Line };
            return new LocalVarDeclaration { Name = varName, Initializer = newExpr, Line = Current.Line };
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
            // HSP compatibility: single = in expression context is treated as ==
            while (Match(TokenKind.EqualEqual) || Match(TokenKind.BangEqual) || Match(TokenKind.Equals))
            {
                string op = Advance().Text;
                if (op == "=") op = "=="; // HSP style: = is == in expressions
                left = new BinaryExpr { Left = left, Operator = op, Right = ParseComparison() };
            }
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

            // Chain: member access (.) and calls (())
            while (true)
            {
                if (Match(TokenKind.Dot))
                {
                    Advance();
                    string member = Expect(TokenKind.Identifier, "Expected member name").Text;
                    if (Match(TokenKind.LParen))
                    {
                        // Method call: expr.Method(args)
                        Advance();
                        var call = new CallExpr { Target = expr, MethodName = member, Line = expr.Line };
                        if (!Match(TokenKind.RParen))
                        {
                            call.Arguments.Add(ParseExpression());
                            while (Match(TokenKind.Comma)) { Advance(); call.Arguments.Add(ParseExpression()); }
                        }
                        Expect(TokenKind.RParen, "Expected ')'");
                        expr = call;
                    }
                    else
                    {
                        // Member access: expr.Field
                        expr = new MemberAccessExpr { Target = expr, MemberName = member, Line = expr.Line };
                    }
                    continue;
                }

                // Function call without dot: name(args)
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
                    expr = call;
                    continue;
                }
                break;
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
            // Type name as function call: int(x), str(x), double(x)
            if (MatchType() && Peek().Kind == TokenKind.LParen)
            {
                var t = Advance();
                return new IdentifierExpr { Name = t.Text, Line = t.Line };
            }
            if (Current.Kind == TokenKind.Identifier && Current.Text == "this")
            { Advance(); return new ThisExpr { Line = Current.Line }; }
            if (Current.Kind == TokenKind.Identifier)
            { var t = Advance(); return new IdentifierExpr { Name = t.Text, Line = t.Line }; }
            if (Match(TokenKind.LParen))
            { Advance(); var e = ParseExpression(); Expect(TokenKind.RParen, "Expected ')'"); return e; }
            return null;
        }

        private InterfaceDeclaration ParseInterface()
        {
            var iface = new InterfaceDeclaration { Line = Current.Line };
            Advance(); // "interface"
            iface.Name = Expect(TokenKind.Identifier, "Expected interface name").Text;
            SkipEOL();

            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (Match(TokenKind.Hash))
                {
                    Advance();
                    if (MatchKW("endinterface")) { Advance(); break; }
                    if (MatchKW("func"))
                    {
                        Advance();
                        var sig = new MethodSignature { Line = Current.Line };

                        // Same syntax as #func: [returnType] Name [, params]
                        if (MatchType() && Peek().Kind == TokenKind.Identifier)
                        {
                            sig.ReturnType = ReadTypeName();
                            sig.Name = Expect(TokenKind.Identifier, "Expected method name").Text;
                        }
                        else if (IsKnownType() && Peek().Kind == TokenKind.Identifier)
                        {
                            sig.ReturnType = ReadTypeName();
                            sig.Name = Expect(TokenKind.Identifier, "Expected method name").Text;
                        }
                        else
                        {
                            sig.Name = Expect(TokenKind.Identifier, "Expected method name").Text;
                        }

                        // Params: , type name [, type name]
                        while (!Match(TokenKind.EOL) && !Match(TokenKind.EOF))
                        {
                            if (Match(TokenKind.Comma)) { Advance(); continue; }
                            if (MatchType() || (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.Identifier))
                            {
                                var p = new ParameterDeclaration { Line = Current.Line };
                                p.TypeName = ReadTypeName();
                                p.Name = Expect(TokenKind.Identifier, "Expected param name").Text;
                                sig.Parameters.Add(p);
                                continue;
                            }
                            break;
                        }
                        iface.Methods.Add(sig);
                    }
                    else { Advance(); }
                }
                else { Advance(); }
            }
            return iface;
        }

        private ConstructorDeclaration ParseConstructor(string defAccess)
        {
            var ctor = new ConstructorDeclaration { Line = Current.Line, Access = defAccess };
            Advance(); // "init"

            // #init [access] [type name [, type name] ...]
            while (IsModifierKeyword())
            {
                string mod = Advance().Text;
                if (mod == "public" || mod == "private") ctor.Access = mod;
            }

            // Parameters: type name [, type name] ...
            while (!Match(TokenKind.EOL) && !Match(TokenKind.EOF))
            {
                if (Match(TokenKind.Comma)) { Advance(); continue; }
                if (MatchType() || (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.Identifier))
                {
                    var p = new ParameterDeclaration { Line = Current.Line };
                    p.TypeName = ReadTypeName();
                    p.Name = Expect(TokenKind.Identifier, "Expected param name").Text;
                    ctor.Parameters.Add(p);
                    continue;
                }
                break;
            }
            SkipEOL();
            ctor.Body = ParseBlock("endinit");
            return ctor;
        }

        private PropertyDeclaration ParseProperty(string defAccess)
        {
            var prop = new PropertyDeclaration { Line = Current.Line, Access = defAccess };
            Advance(); // "property"
            prop.Name = Expect(TokenKind.Identifier, "Expected property name").Text;
            if (MatchKW("as")) { Advance(); prop.TypeName = ReadTypeName(); }
            else prop.TypeName = "int";

            // Modifiers
            while (Match(TokenKind.Comma))
            {
                Advance();
                if (MatchKW("public") || MatchKW("private")) prop.Access = Advance().Text;
            }
            SkipEOL();

            // get/set blocks
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (MatchKW("endproperty")) { Advance(); break; }
                if (Match(TokenKind.Hash))
                {
                    Advance();
                    if (MatchKW("get") || (Current.Kind == TokenKind.Identifier && Current.Text == "get"))
                    {
                        Advance(); SkipEOL();
                        prop.GetterBody = ParseBlock("endget");
                        if (MatchKW("endget")) Advance();
                    }
                    else if (MatchKW("set") || (Current.Kind == TokenKind.Identifier && Current.Text == "set"))
                    {
                        Advance(); SkipEOL();
                        prop.SetterBody = ParseBlock("endset");
                        if (MatchKW("endset")) Advance();
                    }
                    else { Advance(); }
                }
                else { Advance(); }
            }
            return prop;
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
