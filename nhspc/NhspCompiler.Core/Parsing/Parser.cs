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
        private string _pendingDllImport; // DLL name for next #func
        private string _pendingDllCharSet; // CharSet for next #dllfunc
        private string _pendingDllCallingConvention; // CallingConvention for next #dllfunc
        private bool _pendingDllSetLastError;
        private bool _pendingDllExactSpelling;
        private List<AttributeDeclaration> _pendingAttributes = new List<AttributeDeclaration>();

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

        private bool MatchEOL() => Match(TokenKind.EOL) || Match(TokenKind.Colon);
        private void SkipEOL() { while (MatchEOL()) Advance(); }

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
                    else if (MatchKW("attribute"))
                    {
                        _pendingAttributes.Add(ParseAttribute());
                    }
                    else if (MatchKW("interface"))
                    {
                        var iface = ParseInterface();
                        iface.Attributes.AddRange(_pendingAttributes);
                        _pendingAttributes.Clear();
                        if (_currentNamespace != null) iface.Name = _currentNamespace + "." + iface.Name;
                        unit.Interfaces.Add(iface);
                    }
                    else if (MatchKW("include"))
                    {
                        Advance();
                        unit.Includes.Add(Expect(TokenKind.StringLiteral, "Expected filename").Text);
                    }
                    else if (MatchKW("enum"))
                    {
                        var en = ParseEnum();
                        if (_currentNamespace != null) en.Name = _currentNamespace + "." + en.Name;
                        unit.Enums.Add(en);
                    }
                    else if (MatchKW("struct"))
                    {
                        var cls = ParseStruct();
                        if (_currentNamespace != null) cls.Name = _currentNamespace + "." + cls.Name;
                        cls.Attributes.AddRange(_pendingAttributes);
                        _pendingAttributes.Clear();
                        unit.Classes.Add(cls); // structs go in Classes list with IsStruct=true
                    }
                    else if (MatchKW("delegate"))
                    {
                        var del = ParseDelegate();
                        if (_currentNamespace != null) del.Name = _currentNamespace + "." + del.Name;
                        unit.Delegates.Add(del);
                    }
                    else if (MatchKW("class"))
                    {
                        var cls = ParseClass();
                        if (_currentNamespace != null) cls.Name = _currentNamespace + "." + cls.Name;
                        cls.Attributes.AddRange(_pendingAttributes);
                        _pendingAttributes.Clear();
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

            // Leading modifiers: #class public sealed ClassName
            while (IsModifierKeyword() || MatchKW("sealed") || MatchKW("abstract"))
            {
                string mod = Advance().Text;
                if (mod == "public" || mod == "private") cls.DefaultAccess = mod;
                else if (mod == "sealed") cls.IsSealed = true;
                else if (mod == "abstract") cls.IsAbstract = true;
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

            var pendingFieldAttrsC = new List<ParameterAttribute>();
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                // Bracket attributes before #field in class body
                if (Match(TokenKind.LBracket))
                {
                    pendingFieldAttrsC.Add(ParseBracketAttribute());
                    continue;
                }
                if (Match(TokenKind.Hash))
                {
                    Advance();
                    if (MatchKW("endclass")) { Advance(); break; }
                    if (MatchKW("access")) { Advance(); cls.DefaultAccess = Advance().Text; }
                    else if (MatchKW("dllimport"))
                    {
                        Advance();
                        _pendingDllImport = Expect(TokenKind.StringLiteral, "Expected DLL name").Text;
                        _pendingDllCharSet = null;
                        _pendingDllCallingConvention = null;
                        _pendingDllSetLastError = false;
                        _pendingDllExactSpelling = false;
                        // Options: , CharSet = Unicode, SetLastError = true, CallingConvention = Cdecl, ExactSpelling = true
                        while (Match(TokenKind.Comma))
                        {
                            Advance();
                            if (Current.Kind == TokenKind.Identifier)
                            {
                                string optName = Advance().Text;
                                if (Match(TokenKind.Equals)) Advance(); // skip =
                                string optVal = "";
                                if (Current.Kind == TokenKind.Identifier || Current.Kind == TokenKind.Keyword)
                                    optVal = Advance().Text;
                                else if (Match(TokenKind.StringLiteral))
                                    optVal = Advance().Text;
                                switch (optName.ToLowerInvariant())
                                {
                                    case "charset": _pendingDllCharSet = optVal; break;
                                    case "callingconvention": _pendingDllCallingConvention = optVal; break;
                                    case "setlasterror": _pendingDllSetLastError = optVal.ToLowerInvariant() == "true"; break;
                                    case "exactspelling": _pendingDllExactSpelling = optVal.ToLowerInvariant() == "true"; break;
                                }
                            }
                            else break;
                        }
                    }
                    else if (MatchKW("dllfunc"))
                    {
                        var m = ParseDllFunc(cls.DefaultAccess);
                        m.DllImportName = _pendingDllImport;
                        m.DllImportCharSet = _pendingDllCharSet;
                        m.DllImportCallingConvention = _pendingDllCallingConvention;
                        m.DllImportSetLastError = _pendingDllSetLastError;
                        m.DllImportExactSpelling = _pendingDllExactSpelling;
                        cls.Methods.Add(m);
                    }
                    else if (MatchKW("attribute"))
                    {
                        _pendingAttributes.Add(ParseAttribute());
                    }
                    else if (MatchKW("field"))
                    {
                        var f = ParseField(cls.DefaultAccess);
                        if (pendingFieldAttrsC.Count > 0)
                        {
                            f.Attributes.InsertRange(0, pendingFieldAttrsC);
                            foreach (var a2 in pendingFieldAttrsC)
                            {
                                if (a2.Name.ToLowerInvariant() == "fieldoffset" && a2.Arguments.Count > 0)
                                    if (int.TryParse(a2.Arguments[0], out int off)) f.FieldOffset = off;
                            }
                            pendingFieldAttrsC.Clear();
                        }
                        cls.Fields.Add(f);
                    }
                    else if (MatchKW("func"))
                    {
                        cls.Methods.Add(ParseMethod(cls.DefaultAccess));
                    }
                    else if (MatchKW("destructor"))
                    {
                        Advance(); SkipEOL();
                        cls.DestructorBody = ParseBlock("enddestructor");
                    }
                    else if (MatchKW("init"))
                    {
                        // Peek ahead for "static" (don't advance "init" yet - ParseConstructor does it)
                        if (Peek().Kind == TokenKind.Keyword && Peek().Text == "static")
                        {
                            Advance(); // skip "init"
                            Advance(); // skip "static"
                            SkipEOL();
                            cls.HasStaticConstructor = true;
                            cls.StaticConstructorBody = ParseBlock("endinit");
                        }
                        else { cls.Constructors.Add(ParseConstructor(cls.DefaultAccess)); }
                    }
                    else if (MatchKW("property")) { cls.Properties.Add(ParseProperty(cls.DefaultAccess)); }
                    else if (MatchKW("event")) { cls.Events.Add(ParseEvent(cls.DefaultAccess)); }
                    else if (MatchKW("indexer")) { cls.Indexers.Add(ParseIndexer(cls.DefaultAccess)); }
                    else if (MatchKW("operator")) { cls.Operators.Add(ParseOperator()); }
                    else if (MatchKW("class"))
                    {
                        var nested = ParseClass();
                        cls.NestedClasses.Add(nested);
                    }
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

            // Parse [attributes] before field: [MarshalAs LPWStr] [FieldOffset 0]
            while (Match(TokenKind.LBracket))
            {
                f.Attributes.Add(ParseBracketAttribute());
            }

            // #field [access/modifiers] [type] Name  [= value]
            while (IsModifierKeyword() || MatchKW("const") || MatchKW("readonly") || MatchKW("static"))
            {
                string mod = Advance().Text;
                if (mod == "public" || mod == "private" || mod == "protected") f.Access = mod;
                else if (mod == "static") f.IsStatic = true;
                else if (mod == "const") f.IsConst = true;
                else if (mod == "readonly") f.IsReadonly = true;
            }

            // type + name, or just name
            if (IsTypeFollowedByIdentifier())
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

            // Const initializer: = value
            if (Match(TokenKind.Equals))
            {
                Advance();
                f.ConstValue = ParseExpression();
            }

            // [FieldOffset N] from attributes
            foreach (var attr in f.Attributes)
            {
                if (attr.Name.ToLowerInvariant() == "fieldoffset" && attr.Arguments.Count > 0)
                {
                    if (int.TryParse(attr.Arguments[0], out int offset))
                        f.FieldOffset = offset;
                }
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

            // Parameters: , [attrs] [ref|out|params] type name ...
            ParseParameterList(m.Parameters);
            if (m.Access == null) m.Access = defAccess;

            // Abstract methods have no body
            if (m.IsAbstract)
            {
                SkipEOL();
                return m;
            }
            SkipEOL();

            m.Body = ParseBlock("endfunc");
            return m;
        }

        private bool IsModifierKeyword()
        {
            return MatchKW("public") || MatchKW("private") || MatchKW("protected") ||
                   MatchKW("static") || MatchKW("virtual") || MatchKW("override") ||
                   MatchKW("abstract") || MatchKW("sealed");
        }

        private bool IsKnownType()
        {
            // Check if current identifier is a known type (in TypeAliases or registered)
            if (Current.Kind == TokenKind.Identifier &&
                Lexing.Keywords.TypeAliases.ContainsKey(Current.Text.ToLowerInvariant()))
                return true;
            // Generic type pattern: Identifier< - but only if followed by type args and > then identifier
            if (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.Less)
                return true;
            return false;
        }

        // Check if current position starts with a type name followed by an identifier (for dim, field, etc.)
        private bool IsTypeFollowedByIdentifier()
        {
            int save = _pos;
            bool result = false;

            // Try to scan past the type name, then check if next is Identifier
            if (MatchType() || (Current.Kind == TokenKind.Identifier &&
                (Lexing.Keywords.TypeAliases.ContainsKey(Current.Text.ToLowerInvariant()) ||
                 Peek().Kind == TokenKind.Less ||
                 Peek().Kind == TokenKind.Identifier)))  // ClassName varName pattern
            {
                _pos++; // skip type name

                // Skip generic args: <...>
                if (_pos < _tokens.Count && _tokens[_pos].Kind == TokenKind.Less)
                {
                    _pos++; int depth = 1;
                    while (_pos < _tokens.Count && depth > 0)
                    {
                        if (_tokens[_pos].Kind == TokenKind.Less) depth++;
                        else if (_tokens[_pos].Kind == TokenKind.Greater) depth--;
                        _pos++;
                    }
                }

                // Skip ? (Nullable)
                if (_pos < _tokens.Count && _tokens[_pos].Kind == TokenKind.Question)
                    _pos++;

                // Skip [] (array, possibly multiple)
                while (_pos + 1 < _tokens.Count && _tokens[_pos].Kind == TokenKind.LBracket && _tokens[_pos + 1].Kind == TokenKind.RBracket)
                    _pos += 2;

                result = _pos < _tokens.Count && _tokens[_pos].Kind == TokenKind.Identifier;
            }

            _pos = save;
            return result;
        }

        private void ApplyModifier(MethodDeclaration m, string mod)
        {
            if (mod == "public" || mod == "private" || mod == "protected") m.Access = mod;
            if (mod == "static") m.IsStatic = true;
            if (mod == "virtual") m.IsVirtual = true;
            if (mod == "override") m.IsOverride = true;
            if (mod == "abstract") m.IsAbstract = true;
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

            // dim省略形: TypeName varName = expr (C#風)
            // 例: string s = "hello", int n = 42, List<int> nums = new List<int>()
            if (IsTypeFollowedByIdentifier() && !IsMethodCallPattern())
                return ParseDimImplicit();

            // return [expr]
            if (MatchKW("return"))
            {
                Advance();
                Expression val = null;
                if (!MatchEOL() && !Match(TokenKind.EOF)) val = ParseExpression();
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

            // lock expr ... endlock
            if (MatchKW("lock"))
            {
                Advance();
                var lockStmt = new LockStatement { Line = Current.Line, Target = ParseExpression() };
                SkipEOL();
                lockStmt.Body = ParseBlock("endlock");
                return lockStmt;
            }

            // try ... catch ... endtry
            if (MatchKW("try")) return ParseTryCatch();
            if (Match(TokenKind.Hash) && Peek().Text == "try") { Advance(); return ParseTryCatch(); }

            // throw [expr]
            if (MatchKW("throw"))
            {
                Advance();
                Expression val = null;
                if (!MatchEOL() && !Match(TokenKind.EOF))
                    val = ParseExpression();
                return new ThrowStatement { Value = val, Line = Current.Line };
            }

            // sleep ms
            if (MatchKW("sleep"))
            {
                Advance();
                return new ExpressionStatement
                {
                    Expr = new CallExpr { MethodName = "__sleep", Arguments = { ParseExpression() }, Line = Current.Line },
                    Line = Current.Line
                };
            }

            // print expr
            if (MatchKW("print"))
            {
                Advance();
                return new PrintStatement { Value = ParseExpression(), Line = Current.Line };
            }

            // switch expr ... endswitch
            if (MatchKW("switch")) return ParseSwitch();

            // foreach [type] var in collection ... next
            if (MatchKW("foreach")) return ParseForeach();

            // using var = expr ... endusing
            if (MatchKW("using") && Peek().Kind == TokenKind.Identifier) return ParseUsingStmt();

            // break / continue
            if (MatchKW("break")) { Advance(); return new BreakStatement { Line = Current.Line }; }
            if (MatchKW("continue")) { Advance(); return new ContinueStatement { Line = Current.Line }; }

            // identifier++ / identifier--
            if (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.PlusPlus)
            {
                string name = Advance().Text; Advance(); // skip ++
                return new IncrementStatement { VariableName = name, IsIncrement = true, Line = Current.Line };
            }
            if (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.MinusMinus)
            {
                string name = Advance().Text; Advance(); // skip --
                return new IncrementStatement { VariableName = name, IsIncrement = false, Line = Current.Line };
            }

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
                   t.Kind == TokenKind.SlashEqual || t.Kind == TokenKind.AmpEqual ||
                   t.Kind == TokenKind.PipeEqual || t.Kind == TokenKind.CaretEqual;
        }

        // Distinguish "int x = 1" (decl) from "Console.Write(x)" (expr)
        // Returns true if this looks like a method call / member access rather than a declaration
        private bool IsMethodCallPattern()
        {
            // If current is an identifier followed by "." it's a member access (Console.Write etc), not a decl
            if (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.Dot) return true;
            return false;
        }

        // dim省略形: TypeName varName [= expr]
        private Statement ParseDimImplicit()
        {
            var decl = new LocalVarDeclaration { Line = Current.Line };
            decl.TypeName = ReadTypeName();
            decl.Name = Expect(TokenKind.Identifier, "Expected variable name").Text;

            // Array size: int arr, 10
            if (Match(TokenKind.Comma))
            {
                Advance();
                if (Match(TokenKind.IntLiteral))
                    decl.ArraySize = int.Parse(Advance().Text);
            }
            // Initializer: int x = expr
            if (Match(TokenKind.Equals)) { Advance(); decl.Initializer = ParseExpression(); }
            return decl;
        }

        private Statement ParseDim()
        {
            Advance(); // "dim"
            var decl = new LocalVarDeclaration { Line = Current.Line };

            // New syntax: dim type name [, size]
            // Also: dim name = expr (type inferred)
            if (IsTypeFollowedByIdentifier())
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
            if (!MatchEOL() && !Match(TokenKind.EOF))
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

            // First catch [Type varName] [when (cond)]
            if (IsTryKW("catch"))
            {
                ConsumeTryKW();
                if (Current.Kind == TokenKind.Identifier || MatchType())
                {
                    if ((MatchType() || Current.Kind == TokenKind.Identifier) && Peek().Kind == TokenKind.Identifier)
                    { stmt.CatchTypeName = ReadTypeName(); stmt.CatchVarName = Advance().Text; }
                    else if (Current.Kind == TokenKind.Identifier)
                    { stmt.CatchVarName = Advance().Text; }
                }
                if (MatchKW("when")) { Advance(); stmt.CatchWhen = ParseExpression(); }
                SkipEOL();
                stmt.CatchBody = ParseTryBlock();
            }

            // Additional catch blocks
            while (IsTryKW("catch"))
            {
                var clause = new CatchClause { Line = Current.Line };
                ConsumeTryKW();
                if (Current.Kind == TokenKind.Identifier || MatchType())
                {
                    if ((MatchType() || Current.Kind == TokenKind.Identifier) && Peek().Kind == TokenKind.Identifier)
                    { clause.CatchTypeName = ReadTypeName(); clause.CatchVarName = Advance().Text; }
                    else if (Current.Kind == TokenKind.Identifier)
                    { clause.CatchVarName = Advance().Text; }
                }
                if (MatchKW("when")) { Advance(); clause.WhenFilter = ParseExpression(); }
                SkipEOL();
                clause.Body = ParseTryBlock();
                stmt.AdditionalCatches.Add(clause);
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
                    if (MatchEOL() || Match(TokenKind.EOF)) break;
                    args.Add(ParseExpression());
                }
            }

            // Generate: dim varName = new TypeName(args)
            var newExpr = new NewObjectExpr { TypeName = typeName, Arguments = args, Line = Current.Line };
            return new LocalVarDeclaration { Name = varName, Initializer = newExpr, Line = Current.Line };
        }

        // ======== Expressions (precedence climbing) ========

        private Expression ParseExpression() => ParseTernary();

        private Expression ParseTernary()
        {
            var expr = ParseNullCoalesce();
            if (Match(TokenKind.Question))
            {
                Advance();
                var trueExpr = ParseExpression();
                Expect(TokenKind.Colon, "Expected ':' in ternary");
                var falseExpr = ParseExpression();
                return new TernaryExpr { Condition = expr, TrueExpr = trueExpr, FalseExpr = falseExpr, Line = expr.Line };
            }
            return expr;
        }

        private Expression ParseNullCoalesce()
        {
            var left = ParseOr();
            while (Match(TokenKind.QuestionQuestion))
            { Advance(); left = new BinaryExpr { Left = left, Operator = "??", Right = ParseOr() }; }
            return left;
        }

        private Expression ParseOr()
        {
            var left = ParseAnd();
            while (Match(TokenKind.PipePipe) || MatchKW("or"))
            { Advance(); left = new BinaryExpr { Left = left, Operator = "||", Right = ParseAnd() }; }
            return left;
        }

        private Expression ParseAnd()
        {
            var left = ParseBitwiseOr();
            while (Match(TokenKind.AmpAmp) || MatchKW("and"))
            { Advance(); left = new BinaryExpr { Left = left, Operator = "&&", Right = ParseBitwiseOr() }; }
            return left;
        }

        private Expression ParseBitwiseOr()
        {
            var left = ParseBitwiseXor();
            while (Match(TokenKind.Pipe))
            { Advance(); left = new BinaryExpr { Left = left, Operator = "|", Right = ParseBitwiseXor() }; }
            return left;
        }

        private Expression ParseBitwiseXor()
        {
            var left = ParseBitwiseAnd();
            while (Match(TokenKind.Caret))
            { Advance(); left = new BinaryExpr { Left = left, Operator = "^", Right = ParseBitwiseAnd() }; }
            return left;
        }

        private Expression ParseBitwiseAnd()
        {
            var left = ParseEquality();
            while (Match(TokenKind.Amp))
            { Advance(); left = new BinaryExpr { Left = left, Operator = "&", Right = ParseEquality() }; }
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
            var left = ParseShift();
            while (Match(TokenKind.Less) || Match(TokenKind.Greater) || Match(TokenKind.LessEqual) || Match(TokenKind.GreaterEqual)
                || MatchKW("is") || MatchKW("as"))
            {
                if (MatchKW("is"))
                {
                    Advance();
                    string tn = ReadTypeName();
                    left = new IsExpr { Value = left, TypeName = tn, Line = left.Line };
                }
                else if (MatchKW("as"))
                {
                    Advance();
                    string tn = ReadTypeName();
                    left = new AsExpr { Value = left, TypeName = tn, Line = left.Line };
                }
                else
                {
                    string op = Advance().Text;
                    left = new BinaryExpr { Left = left, Operator = op, Right = ParseShift() };
                }
            }
            return left;
        }

        private Expression ParseShift()
        {
            var left = ParseAddSub();
            while (Match(TokenKind.LessLess) || Match(TokenKind.GreaterGreater))
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
            if (Match(TokenKind.Tilde))
            { Advance(); return new UnaryExpr { Operator = "~", Operand = ParseUnary() }; }
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
            // typeof(TypeName)
            if (MatchKW("typeof") && Peek().Kind == TokenKind.LParen)
            {
                Advance(); Advance(); // skip typeof (
                string tn = ReadTypeName();
                Expect(TokenKind.RParen, "Expected ')'");
                return new TypeofExpr { TypeName = tn, Line = Current.Line };
            }
            // Interpolated string $"Hello {name}"
            if (Match(TokenKind.InterpolatedString))
            {
                var t = Advance();
                return new InterpolatedStringExpr { RawText = t.Text, Line = t.Line };
            }
            // Type name as function call: int(x), str(x), double(x)
            if (MatchType() && Peek().Kind == TokenKind.LParen)
            {
                var t = Advance();
                return new IdentifierExpr { Name = t.Text, Line = t.Line };
            }
            // new TypeName(args) in expression context
            if (MatchKW("new"))
            {
                Advance();
                string tn = ReadTypeName();
                var args = new System.Collections.Generic.List<Expression>();
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
                return new NewObjectExpr { TypeName = tn, Arguments = args, Line = Current.Line };
            }
            if (Current.Kind == TokenKind.Identifier && Current.Text == "this")
            { Advance(); return new ThisExpr { Line = Current.Line }; }
            if (Current.Kind == TokenKind.Identifier)
            { var t = Advance(); return new IdentifierExpr { Name = t.Text, Line = t.Line }; }
            if (Match(TokenKind.LParen))
            { Advance(); var e = ParseExpression(); Expect(TokenKind.RParen, "Expected ')'"); return e; }
            return null;
        }

        private MethodDeclaration ParseDllFunc(string defAccess)
        {
            var m = new MethodDeclaration { Line = Current.Line, IsStatic = true };
            Advance(); // "dllfunc"

            // Same header as #func: [modifiers] [returnType] Name [, params]
            while (IsModifierKeyword()) ApplyModifier(m, Advance().Text);
            m.IsStatic = true; // always static for P/Invoke

            if (MatchType() && Peek().Kind == TokenKind.Identifier)
            { m.ReturnType = ReadTypeName(); m.Name = Advance().Text; }
            else if (IsKnownType() && Peek().Kind == TokenKind.Identifier)
            { m.ReturnType = ReadTypeName(); m.Name = Advance().Text; }
            else if (Current.Kind == TokenKind.Identifier)
            { m.Name = Advance().Text; }

            // Optional EntryPoint: "EntryPointName" or "#123" (ordinal)
            if (Match(TokenKind.StringLiteral))
            {
                m.DllImportEntryPoint = Advance().Text;
            }

            // Parameters: , [attrs] [ref|out] type name ...
            ParseParameterList(m.Parameters);
            if (m.Access == null) m.Access = defAccess;
            // No body - P/Invoke declaration only
            return m;
        }

        private AttributeDeclaration ParseAttribute()
        {
            Advance(); // "attribute"
            var attr = new AttributeDeclaration { Line = Current.Line };
            attr.Name = Expect(TokenKind.Identifier, "Expected attribute name").Text;
            // Arguments: , "value" [, "value2"]
            while (Match(TokenKind.Comma))
            {
                Advance();
                if (Match(TokenKind.StringLiteral))
                    attr.Arguments.Add(Advance().Text);
                else if (Match(TokenKind.Identifier))
                    attr.Arguments.Add(Advance().Text);
                else if (Match(TokenKind.IntLiteral))
                    attr.Arguments.Add(Advance().Text);
                else break;
            }
            return attr;
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

                        // Params: , [attrs] [ref|out] type name ...
                        ParseParameterList(sig.Parameters);
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

            // Parameters: [attrs] [ref|out] type name ...
            ParseParameterList(ctor.Parameters);
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

        // ======== Shared Parameter Parsing ========

        private void ParseParameterList(List<ParameterDeclaration> parameters)
        {
            while (!MatchEOL() && !Match(TokenKind.EOF))
            {
                if (Match(TokenKind.Comma)) { Advance(); }
                if (MatchEOL() || Match(TokenKind.EOF)) break;

                // [Attributes] before param
                var attrs = new List<ParameterAttribute>();
                while (Match(TokenKind.LBracket))
                {
                    attrs.Add(ParseBracketAttribute());
                }

                // ref / out / in / params
                bool isRef = false, isOut = false, isIn = false, isParams = false;
                if (MatchKW("ref")) { Advance(); isRef = true; }
                else if (MatchKW("out")) { Advance(); isOut = true; }
                else if (MatchKW("params")) { Advance(); isParams = true; }
                // [In] attribute sets isIn
                foreach (var a in attrs)
                {
                    if (a.Name.ToLowerInvariant() == "in") isIn = true;
                    if (a.Name.ToLowerInvariant() == "out") isOut = true;
                }

                if (MatchType() || (Current.Kind == TokenKind.Identifier && Peek().Kind == TokenKind.Identifier))
                {
                    var p = new ParameterDeclaration { Line = Current.Line };
                    p.TypeName = ReadTypeName();
                    p.Name = Expect(TokenKind.Identifier, "Expected param name").Text;
                    p.IsRef = isRef;
                    p.IsOut = isOut;
                    p.IsIn = isIn;
                    p.IsParams = isParams;
                    p.Attributes = attrs;
                    // Default value: type name = value
                    if (Match(TokenKind.Equals))
                    {
                        Advance();
                        p.DefaultValue = ParseExpression();
                    }
                    parameters.Add(p);
                    continue;
                }
                break;
            }
        }

        private ParameterAttribute ParseBracketAttribute()
        {
            Advance(); // skip [
            var attr = new ParameterAttribute { Line = Current.Line };
            if (Current.Kind == TokenKind.Identifier || Current.Kind == TokenKind.Keyword)
                attr.Name = Advance().Text;
            else
                attr.Name = Expect(TokenKind.Identifier, "Expected attribute name").Text;

            // Arguments: space-separated or comma-separated values
            while (!Match(TokenKind.RBracket) && !MatchEOL() && !Match(TokenKind.EOF))
            {
                if (Match(TokenKind.Comma)) Advance();
                if (Match(TokenKind.RBracket)) break;
                if (Match(TokenKind.StringLiteral))
                    attr.Arguments.Add(Advance().Text);
                else if (Match(TokenKind.IntLiteral))
                    attr.Arguments.Add(Advance().Text);
                else if (Current.Kind == TokenKind.Identifier || Current.Kind == TokenKind.Keyword)
                    attr.Arguments.Add(Advance().Text);
                else if (Match(TokenKind.Dot))
                {
                    // Handle UnmanagedType.LPWStr style
                    Advance();
                    if (Current.Kind == TokenKind.Identifier)
                        attr.Arguments.Add(Advance().Text);
                }
                else break;
            }
            if (Match(TokenKind.RBracket)) Advance();
            return attr;
        }

        // ======== #struct ========

        private ClassDeclaration ParseStruct()
        {
            var cls = new ClassDeclaration { Line = Current.Line, IsStruct = true, LayoutKind = "Sequential" };
            Advance(); // "struct"

            // Leading modifiers
            while (IsModifierKeyword())
            {
                string mod = Advance().Text;
                if (mod == "public" || mod == "private") cls.DefaultAccess = mod;
            }

            cls.Name = Expect(TokenKind.Identifier, "Expected struct name").Text;

            // Options: , Sequential/Explicit/Auto, Pack = N, Size = N, CharSet = Unicode
            while (Match(TokenKind.Comma))
            {
                Advance();
                if (Current.Kind == TokenKind.Identifier || Current.Kind == TokenKind.Keyword)
                {
                    string optName = Current.Text;
                    // Check if it's a LayoutKind value
                    if (optName == "Sequential" || optName == "Explicit" || optName == "Auto")
                    {
                        cls.LayoutKind = Advance().Text;
                        continue;
                    }
                    Advance(); // consume option name
                    if (Match(TokenKind.Equals)) Advance(); // skip =
                    string optVal = "";
                    if (Current.Kind == TokenKind.Identifier || Current.Kind == TokenKind.Keyword)
                        optVal = Advance().Text;
                    else if (Match(TokenKind.IntLiteral))
                        optVal = Advance().Text;
                    else if (Match(TokenKind.StringLiteral))
                        optVal = Advance().Text;

                    switch (optName.ToLowerInvariant())
                    {
                        case "pack": int.TryParse(optVal, out int pk); cls.Pack = pk; break;
                        case "size": int.TryParse(optVal, out int sz); cls.Size = sz; break;
                        case "charset": cls.StructCharSet = optVal; break;
                    }
                }
                else break;
            }
            SkipEOL();

            // Struct body: fields, methods, constructors
            var pendingFieldAttrs = new List<ParameterAttribute>();
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                // Bracket attributes before #field: [FieldOffset 0] #field ...
                if (Match(TokenKind.LBracket))
                {
                    pendingFieldAttrs.Add(ParseBracketAttribute());
                    continue;
                }
                if (Match(TokenKind.Hash))
                {
                    Advance();
                    if (MatchKW("endstruct")) { Advance(); break; }
                    if (MatchKW("field"))
                    {
                        var f = ParseField(cls.DefaultAccess);
                        // Prepend any pending bracket attributes
                        if (pendingFieldAttrs.Count > 0)
                        {
                            f.Attributes.InsertRange(0, pendingFieldAttrs);
                            // Re-check FieldOffset from prepended attrs
                            foreach (var attr in pendingFieldAttrs)
                            {
                                if (attr.Name.ToLowerInvariant() == "fieldoffset" && attr.Arguments.Count > 0)
                                {
                                    if (int.TryParse(attr.Arguments[0], out int offset))
                                        f.FieldOffset = offset;
                                }
                            }
                            pendingFieldAttrs.Clear();
                        }
                        cls.Fields.Add(f);
                    }
                    else if (MatchKW("func")) { cls.Methods.Add(ParseMethod(cls.DefaultAccess)); }
                    else if (MatchKW("init")) { cls.Constructors.Add(ParseConstructor(cls.DefaultAccess)); }
                    else if (MatchKW("attribute")) { _pendingAttributes.Add(ParseAttribute()); }
                    else { _diag.Error(Current.Line, Current.Column, $"Unexpected in struct: #{Current.Text}"); Advance(); }
                }
                else { Advance(); }
            }
            return cls;
        }

        // ======== #delegate ========

        private DelegateDeclaration ParseDelegate()
        {
            var del = new DelegateDeclaration { Line = Current.Line };
            Advance(); // "delegate"

            // Modifiers
            while (IsModifierKeyword())
            {
                string mod = Advance().Text;
                if (mod == "public" || mod == "private") del.Access = mod;
            }

            // Return type + name
            if ((MatchType() || IsKnownType()) && Peek().Kind == TokenKind.Identifier)
            {
                del.ReturnType = ReadTypeName();
                del.Name = Expect(TokenKind.Identifier, "Expected delegate name").Text;
            }
            else if (Current.Kind == TokenKind.Identifier)
            {
                del.Name = Advance().Text;
            }

            // Parameters
            ParseParameterList(del.Parameters);
            return del;
        }

        // ======== #event ========
        private EventDeclaration ParseEvent(string defAccess)
        {
            var ev = new EventDeclaration { Line = Current.Line, Access = defAccess };
            Advance(); // "event"
            while (IsModifierKeyword()) { string mod = Advance().Text; if (mod == "public" || mod == "private") ev.Access = mod; }
            ev.TypeName = ReadTypeName();
            ev.Name = Expect(TokenKind.Identifier, "Expected event name").Text;
            return ev;
        }

        // ======== #indexer ========
        private IndexerDeclaration ParseIndexer(string defAccess)
        {
            var idx = new IndexerDeclaration { Line = Current.Line, Access = defAccess };
            Advance(); // "indexer"
            while (IsModifierKeyword()) { string mod = Advance().Text; if (mod == "public" || mod == "private") idx.Access = mod; }
            idx.TypeName = ReadTypeName();
            // Parameters: , type name [, type name]
            ParseParameterList(idx.Parameters);
            SkipEOL();

            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (MatchKW("endindexer")) { Advance(); break; }
                if (Match(TokenKind.Hash))
                {
                    Advance();
                    if (MatchKW("endindexer")) { Advance(); break; }
                    if (MatchKW("get") || (Current.Kind == TokenKind.Identifier && Current.Text == "get"))
                    { Advance(); SkipEOL(); idx.GetterBody = ParseBlock("endget"); if (MatchKW("endget")) Advance(); }
                    else if (MatchKW("set") || (Current.Kind == TokenKind.Identifier && Current.Text == "set"))
                    { Advance(); SkipEOL(); idx.SetterBody = ParseBlock("endset"); if (MatchKW("endset")) Advance(); }
                    else { Advance(); }
                }
                else { Advance(); }
            }
            return idx;
        }

        // ======== #operator ========
        private OperatorDeclaration ParseOperator()
        {
            var op = new OperatorDeclaration { Line = Current.Line };
            Advance(); // "operator"

            // Return type
            if ((MatchType() || IsKnownType()) && Peek().Kind != TokenKind.EOL && Peek().Kind != TokenKind.EOF)
            {
                op.ReturnType = ReadTypeName();
            }
            else { op.ReturnType = "int"; }

            // Operator symbol: +, -, *, /, ==, !=, <, >, implicit, explicit
            if (Current.Kind == TokenKind.Identifier)
                op.Operator = Advance().Text; // implicit, explicit
            else
                op.Operator = Advance().Text; // +, -, etc.

            // Parameters
            ParseParameterList(op.Parameters);
            SkipEOL();
            op.Body = ParseBlock("endoperator");
            return op;
        }

        // ======== #enum ========
        private EnumDeclaration ParseEnum()
        {
            var en = new EnumDeclaration { Line = Current.Line };
            Advance(); // "enum"
            while (IsModifierKeyword()) { string mod = Advance().Text; if (mod == "public" || mod == "private") en.Access = mod; }
            en.Name = Expect(TokenKind.Identifier, "Expected enum name").Text;
            SkipEOL();

            int nextVal = 0;
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (Match(TokenKind.Hash) && Peek().Text == "endenum") { Advance(); Advance(); break; }
                if (MatchKW("endenum")) { Advance(); break; }
                if (Current.Kind == TokenKind.Identifier)
                {
                    var mem = new EnumMemberDeclaration { Name = Advance().Text, Line = Current.Line };
                    if (Match(TokenKind.Equals))
                    {
                        Advance();
                        if (Match(TokenKind.IntLiteral)) { mem.Value = int.Parse(Advance().Text); nextVal = mem.Value.Value + 1; }
                    }
                    else { mem.Value = nextVal++; }
                    en.Members.Add(mem);
                    if (Match(TokenKind.Comma)) Advance(); // optional comma between members
                }
                else { Advance(); }
            }
            return en;
        }

        // ======== switch / case ========
        private SwitchStatement ParseSwitch()
        {
            Advance(); // "switch"
            var stmt = new SwitchStatement { Line = Current.Line, Value = ParseExpression() };
            SkipEOL();

            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (MatchKW("endswitch")) { Advance(); break; }
                if (Match(TokenKind.Hash) && Peek().Text == "endswitch") { Advance(); Advance(); break; }
                if (MatchKW("case"))
                {
                    Advance();
                    var clause = new CaseClause { Value = ParseExpression(), Line = Current.Line };
                    SkipEOL();
                    clause.Body = ParseSwitchBody();
                    stmt.Cases.Add(clause);
                }
                else if (MatchKW("default"))
                {
                    Advance(); SkipEOL();
                    stmt.DefaultBody = ParseSwitchBody();
                }
                else { Advance(); }
            }
            return stmt;
        }

        private List<Statement> ParseSwitchBody()
        {
            var stmts = new List<Statement>();
            while (!Match(TokenKind.EOF))
            {
                SkipEOL();
                if (MatchKW("case") || MatchKW("default") || MatchKW("endswitch")) break;
                if (Match(TokenKind.Hash) && Peek().Text == "endswitch") break;
                var s = ParseStatement();
                if (s != null) stmts.Add(s);
            }
            return stmts;
        }

        // ======== foreach ========
        private ForeachStatement ParseForeach()
        {
            Advance(); // "foreach"
            var stmt = new ForeachStatement { Line = Current.Line };

            // foreach [type] varName in collection
            if ((MatchType() || IsKnownType()) && Peek().Kind == TokenKind.Identifier)
            {
                stmt.VarType = ReadTypeName();
                stmt.VarName = Expect(TokenKind.Identifier, "Expected variable name").Text;
            }
            else
            {
                stmt.VarName = Expect(TokenKind.Identifier, "Expected variable name").Text;
            }
            if (MatchKW("in")) Advance();
            stmt.Collection = ParseExpression();
            SkipEOL();
            stmt.Body = ParseBlock("next");
            if (MatchKW("next")) Advance();
            return stmt;
        }

        // ======== using statement ========
        private UsingStatement ParseUsingStmt()
        {
            Advance(); // "using"
            var stmt = new UsingStatement { Line = Current.Line };
            stmt.VarName = Expect(TokenKind.Identifier, "Expected variable name").Text;
            Expect(TokenKind.Equals, "Expected '='");
            stmt.Initializer = ParseExpression();
            SkipEOL();
            stmt.Body = ParseBlock("endusing");
            return stmt;
        }

        private string ReadTypeName()
        {
            string name;
            if (MatchType()) name = Advance().Text;
            else if (Current.Kind == TokenKind.Identifier) name = Advance().Text;
            else { _diag.Error(Current.Line, Current.Column, "Expected type name"); return "void"; }

            // Generic type: List<int>, Dictionary<string, int>
            if (Match(TokenKind.Less))
            {
                Advance(); // skip <
                name += "<";
                name += ReadTypeName();
                while (Match(TokenKind.Comma))
                {
                    Advance();
                    name += ",";
                    name += ReadTypeName();
                }
                if (Match(TokenKind.Greater)) Advance();
                name += ">";
            }

            // Nullable: int? → Nullable<int>
            if (Match(TokenKind.Question))
            {
                Advance();
                name = "Nullable<" + name + ">";
            }

            // Array type: int[], string[], int[][] (jagged)
            while (Match(TokenKind.LBracket) && Peek().Kind == TokenKind.RBracket)
            {
                Advance(); Advance(); // skip []
                name += "[]";
            }
            return name;
        }
    }
}
