using System;
using System.Reflection;
using System.Reflection.Emit;
using System.Collections.Generic;
using NhspCompiler.Core.Parsing.Ast;
using NhspCompiler.Core.Diagnostics;

namespace NhspCompiler.Core.Emit
{
    public class MethodEmitter
    {
        private readonly MethodDeclaration _method;
        private readonly TypeBuilder _type;
        private readonly DiagnosticBag _diag;
        private readonly TypeEmitter _typeEmitter;
        private ILGenerator _il;
        private Dictionary<string, int> _paramIndex;
        private Dictionary<string, LocalBuilder> _locals;
        private Stack<(Label breakLabel, Label continueLabel)> _loopStack;
        private LocalBuilder _cntLocal;
        public MethodBuilder Builder { get; private set; }
        private Type _retType;

        public MethodEmitter(MethodDeclaration method, TypeBuilder type, DiagnosticBag diag, TypeEmitter typeEmitter)
        {
            _method = method;
            _type = type;
            _diag = diag;
            _typeEmitter = typeEmitter;
        }

        // Pass 1: Define the method signature (so other methods can reference it)
        public void DefineMethod()
        {
            _retType = AssemblyEmitter.ResolveType(_method.ReturnType) ?? typeof(void);
            var paramTypes = new List<Type>();
            _paramIndex = new Dictionary<string, int>();
            int argOff = _method.IsStatic ? 0 : 1;

            for (int i = 0; i < _method.Parameters.Count; i++)
            {
                var pt = AssemblyEmitter.ResolveType(_method.Parameters[i].TypeName) ?? typeof(object);
                paramTypes.Add(pt);
                _paramIndex[_method.Parameters[i].Name] = i + argOff;
            }

            var attr = MethodAttributes.HideBySig;
            if (_method.Access == "public") attr |= MethodAttributes.Public;
            else if (_method.Access == "private") attr |= MethodAttributes.Private;
            if (_method.IsStatic) attr |= MethodAttributes.Static;
            if (_method.IsVirtual) attr |= MethodAttributes.Virtual | MethodAttributes.NewSlot;
            if (_method.IsOverride) attr |= MethodAttributes.Virtual;

            Builder = _type.DefineMethod(_method.Name, attr, _retType, paramTypes.ToArray());
            for (int i = 0; i < _method.Parameters.Count; i++)
                Builder.DefineParameter(i + 1, ParameterAttributes.None, _method.Parameters[i].Name);
        }

        // Pass 2: Emit the method body
        public void EmitBody()
        {
            _locals = new Dictionary<string, LocalBuilder>();
            _loopStack = new Stack<(Label, Label)>();
            _il = Builder.GetILGenerator();

            foreach (var stmt in _method.Body)
                EmitStatement(stmt);

            if (_retType == typeof(void))
            {
                _il.Emit(OpCodes.Ret);
            }
            else
            {
                if (_retType == typeof(int) || _retType == typeof(bool))
                    _il.Emit(OpCodes.Ldc_I4_0);
                else if (_retType == typeof(long))
                    _il.Emit(OpCodes.Ldc_I8, 0L);
                else if (_retType == typeof(double))
                    _il.Emit(OpCodes.Ldc_R8, 0.0);
                else if (_retType == typeof(float))
                    _il.Emit(OpCodes.Ldc_R4, 0.0f);
                else if (_retType == typeof(string))
                    _il.Emit(OpCodes.Ldstr, "");
                else
                    _il.Emit(OpCodes.Ldnull);
                _il.Emit(OpCodes.Ret);
            }
        }

        // ======== Statements ========

        private void EmitStatement(Statement stmt)
        {
            if (stmt is ReturnStatement ret) EmitReturn(ret);
            else if (stmt is LocalVarDeclaration decl) EmitLocalDecl(decl);
            else if (stmt is AssignmentStatement assign) EmitAssignment(assign);
            else if (stmt is IfStatement ifStmt) EmitIf(ifStmt);
            else if (stmt is RepeatStatement rep) EmitRepeat(rep);
            else if (stmt is WhileStatement wh) EmitWhile(wh);
            else if (stmt is BreakStatement) EmitBreak();
            else if (stmt is ContinueStatement) EmitContinue();
            else if (stmt is ExpressionStatement exprS)
            {
                EmitExpression(exprS.Expr);
                // Pop result if not void
                _il.Emit(OpCodes.Pop);
            }
        }

        private void EmitReturn(ReturnStatement ret)
        {
            if (ret.Value != null) EmitExpression(ret.Value);
            _il.Emit(OpCodes.Ret);
        }

        private void EmitLocalDecl(LocalVarDeclaration decl)
        {
            Type varType;
            if (decl.TypeName != null)
            {
                varType = AssemblyEmitter.ResolveType(decl.TypeName) ?? typeof(object);
            }
            else if (decl.Initializer != null)
            {
                varType = InferType(decl.Initializer);
            }
            else
            {
                varType = typeof(int); // default
            }

            var local = _il.DeclareLocal(varType);
            _locals[decl.Name] = local;

            if (decl.Initializer != null)
            {
                EmitExpression(decl.Initializer);
                _il.Emit(OpCodes.Stloc, local);
            }
        }

        private void EmitAssignment(AssignmentStatement assign)
        {
            if (_locals.TryGetValue(assign.VariableName, out var local))
            {
                if (assign.Operator != "=")
                {
                    _il.Emit(OpCodes.Ldloc, local);
                    EmitExpression(assign.Value);
                    EmitCompoundOp(assign.Operator);
                }
                else
                {
                    EmitExpression(assign.Value);
                }
                _il.Emit(OpCodes.Stloc, local);
            }
            else if (_typeEmitter != null && _typeEmitter.Fields.TryGetValue(assign.VariableName, out var fb))
            {
                // Field assignment
                _il.Emit(OpCodes.Ldarg_0); // this
                if (assign.Operator != "=")
                {
                    _il.Emit(OpCodes.Ldarg_0);
                    _il.Emit(OpCodes.Ldfld, fb);
                    EmitExpression(assign.Value);
                    EmitCompoundOp(assign.Operator);
                }
                else
                {
                    EmitExpression(assign.Value);
                }
                _il.Emit(OpCodes.Stfld, fb);
            }
            else
            {
                // Auto-declare local
                var varType = InferType(assign.Value);
                var newLocal = _il.DeclareLocal(varType);
                _locals[assign.VariableName] = newLocal;
                EmitExpression(assign.Value);
                _il.Emit(OpCodes.Stloc, newLocal);
            }
        }

        private void EmitCompoundOp(string op)
        {
            switch (op) {
                case "+=": _il.Emit(OpCodes.Add); break;
                case "-=": _il.Emit(OpCodes.Sub); break;
                case "*=": _il.Emit(OpCodes.Mul); break;
                case "/=": _il.Emit(OpCodes.Div); break;
            }
        }

        private void EmitIf(IfStatement ifStmt)
        {
            var endLabel = _il.DefineLabel();
            var elseLabel = _il.DefineLabel();

            // condition
            EmitExpression(ifStmt.Condition);
            _il.Emit(OpCodes.Brfalse, ifStmt.ElseIfs.Count > 0 || ifStmt.ElseBody.Count > 0 ? elseLabel : endLabel);

            // then
            foreach (var s in ifStmt.ThenBody) EmitStatement(s);
            _il.Emit(OpCodes.Br, endLabel);

            // elseif
            for (int i = 0; i < ifStmt.ElseIfs.Count; i++)
            {
                _il.MarkLabel(elseLabel);
                elseLabel = _il.DefineLabel();
                EmitExpression(ifStmt.ElseIfs[i].Condition);
                bool hasMore = i + 1 < ifStmt.ElseIfs.Count || ifStmt.ElseBody.Count > 0;
                _il.Emit(OpCodes.Brfalse, hasMore ? elseLabel : endLabel);
                foreach (var s in ifStmt.ElseIfs[i].Body) EmitStatement(s);
                _il.Emit(OpCodes.Br, endLabel);
            }

            // else
            _il.MarkLabel(elseLabel);
            foreach (var s in ifStmt.ElseBody) EmitStatement(s);

            _il.MarkLabel(endLabel);
        }

        private void EmitRepeat(RepeatStatement rep)
        {
            var loopStart = _il.DefineLabel();
            var loopEnd = _il.DefineLabel();
            var continueLabel = _il.DefineLabel();

            // cnt local
            _cntLocal = _il.DeclareLocal(typeof(int));
            _il.Emit(OpCodes.Ldc_I4_0);
            _il.Emit(OpCodes.Stloc, _cntLocal);

            // max count (if specified)
            LocalBuilder maxLocal = null;
            if (rep.Count != null)
            {
                maxLocal = _il.DeclareLocal(typeof(int));
                EmitExpression(rep.Count);
                _il.Emit(OpCodes.Stloc, maxLocal);
            }

            _loopStack.Push((loopEnd, continueLabel));

            _il.MarkLabel(loopStart);

            // Check count
            if (maxLocal != null)
            {
                _il.Emit(OpCodes.Ldloc, _cntLocal);
                _il.Emit(OpCodes.Ldloc, maxLocal);
                _il.Emit(OpCodes.Bge, loopEnd);
            }

            // Body
            foreach (var s in rep.Body) EmitStatement(s);

            // continue point: increment cnt
            _il.MarkLabel(continueLabel);
            _il.Emit(OpCodes.Ldloc, _cntLocal);
            _il.Emit(OpCodes.Ldc_I4_1);
            _il.Emit(OpCodes.Add);
            _il.Emit(OpCodes.Stloc, _cntLocal);
            _il.Emit(OpCodes.Br, loopStart);

            _il.MarkLabel(loopEnd);
            _loopStack.Pop();
        }

        private void EmitWhile(WhileStatement wh)
        {
            var loopStart = _il.DefineLabel();
            var loopEnd = _il.DefineLabel();
            var continueLabel = loopStart;

            _loopStack.Push((loopEnd, continueLabel));

            _il.MarkLabel(loopStart);
            EmitExpression(wh.Condition);
            _il.Emit(OpCodes.Brfalse, loopEnd);

            foreach (var s in wh.Body) EmitStatement(s);
            _il.Emit(OpCodes.Br, loopStart);

            _il.MarkLabel(loopEnd);
            _loopStack.Pop();
        }

        private void EmitBreak()
        {
            if (_loopStack.Count > 0)
                _il.Emit(OpCodes.Br, _loopStack.Peek().breakLabel);
        }

        private void EmitContinue()
        {
            if (_loopStack.Count > 0)
                _il.Emit(OpCodes.Br, _loopStack.Peek().continueLabel);
        }

        // ======== Expressions ========

        private void EmitExpression(Expression expr)
        {
            if (expr == null) { _il.Emit(OpCodes.Ldc_I4_0); return; }

            if (expr is IntLiteralExpr intLit) { _il.Emit(OpCodes.Ldc_I4, intLit.Value); }
            else if (expr is DoubleLiteralExpr dblLit) { _il.Emit(OpCodes.Ldc_R8, dblLit.Value); }
            else if (expr is StringLiteralExpr strLit) { _il.Emit(OpCodes.Ldstr, strLit.Value); }
            else if (expr is BoolLiteralExpr boolLit) { _il.Emit(boolLit.Value ? OpCodes.Ldc_I4_1 : OpCodes.Ldc_I4_0); }
            else if (expr is CntExpr)
            {
                if (_cntLocal != null) _il.Emit(OpCodes.Ldloc, _cntLocal);
                else _il.Emit(OpCodes.Ldc_I4_0);
            }
            else if (expr is IdentifierExpr ident) { EmitLoad(ident.Name, ident.Line); }
            else if (expr is UnaryExpr unary) { EmitUnary(unary); }
            else if (expr is BinaryExpr bin) { EmitBinary(bin); }
            else if (expr is CallExpr call) { EmitCall(call); }
            else if (expr is ThisExpr) { _il.Emit(OpCodes.Ldarg_0); }
            else if (expr is MemberAccessExpr mem)
            {
                EmitExpression(mem.Target);
                // Try to resolve field on the type
                if (mem.Target is ThisExpr && _typeEmitter != null && _typeEmitter.Fields.TryGetValue(mem.MemberName, out var fb))
                    _il.Emit(OpCodes.Ldfld, fb);
                else
                    _diag.Warning(mem.Line, 0, $"Member access '{mem.MemberName}' not fully resolved");
            }
            else { _il.Emit(OpCodes.Ldc_I4_0); }
        }

        private void EmitLoad(string name, int line)
        {
            // cnt: repeat counter
            if (name == "cnt")
            {
                if (_cntLocal != null) _il.Emit(OpCodes.Ldloc, _cntLocal);
                else _il.Emit(OpCodes.Ldc_I4_0);
                return;
            }
            if (_locals.TryGetValue(name, out var local))
                _il.Emit(OpCodes.Ldloc, local);
            else if (_paramIndex.TryGetValue(name, out int idx))
                _il.Emit(OpCodes.Ldarg, idx);
            else if (_typeEmitter != null && _typeEmitter.Fields.TryGetValue(name, out var fb))
            {
                _il.Emit(OpCodes.Ldarg_0); // this
                _il.Emit(OpCodes.Ldfld, fb);
            }
            else
            {
                _diag.Error(line, 0, $"Unknown variable: {name}");
                _il.Emit(OpCodes.Ldc_I4_0);
            }
        }

        private void EmitUnary(UnaryExpr unary)
        {
            EmitExpression(unary.Operand);
            if (unary.Operator == "-") _il.Emit(OpCodes.Neg);
            else if (unary.Operator == "!")
            {
                _il.Emit(OpCodes.Ldc_I4_0);
                _il.Emit(OpCodes.Ceq);
            }
        }

        private void EmitBinary(BinaryExpr bin)
        {
            bool isString = IsStringExpression(bin.Left) || IsStringExpression(bin.Right);

            if (bin.Operator == "+" && isString)
            {
                // String concatenation via String.Concat
                EmitStringify(bin.Left);
                EmitStringify(bin.Right);
                _il.Emit(OpCodes.Call, typeof(string).GetMethod("Concat", new[] { typeof(string), typeof(string) }));
                return;
            }

            // Short-circuit && and ||
            if (bin.Operator == "&&")
            {
                var falseLabel = _il.DefineLabel();
                var endLabel = _il.DefineLabel();
                EmitExpression(bin.Left);
                _il.Emit(OpCodes.Brfalse, falseLabel);
                EmitExpression(bin.Right);
                _il.Emit(OpCodes.Br, endLabel);
                _il.MarkLabel(falseLabel);
                _il.Emit(OpCodes.Ldc_I4_0);
                _il.MarkLabel(endLabel);
                return;
            }
            if (bin.Operator == "||")
            {
                var trueLabel = _il.DefineLabel();
                var endLabel = _il.DefineLabel();
                EmitExpression(bin.Left);
                _il.Emit(OpCodes.Brtrue, trueLabel);
                EmitExpression(bin.Right);
                _il.Emit(OpCodes.Br, endLabel);
                _il.MarkLabel(trueLabel);
                _il.Emit(OpCodes.Ldc_I4_1);
                _il.MarkLabel(endLabel);
                return;
            }

            EmitExpression(bin.Left);
            EmitExpression(bin.Right);

            switch (bin.Operator)
            {
                case "+": _il.Emit(OpCodes.Add); break;
                case "-": _il.Emit(OpCodes.Sub); break;
                case "*": _il.Emit(OpCodes.Mul); break;
                case "/": _il.Emit(OpCodes.Div); break;
                case "%": _il.Emit(OpCodes.Rem); break;
                case "==": _il.Emit(OpCodes.Ceq); break;
                case "!=":
                    _il.Emit(OpCodes.Ceq);
                    _il.Emit(OpCodes.Ldc_I4_0);
                    _il.Emit(OpCodes.Ceq);
                    break;
                case "<": _il.Emit(OpCodes.Clt); break;
                case ">": _il.Emit(OpCodes.Cgt); break;
                case "<=":
                    _il.Emit(OpCodes.Cgt);
                    _il.Emit(OpCodes.Ldc_I4_0);
                    _il.Emit(OpCodes.Ceq);
                    break;
                case ">=":
                    _il.Emit(OpCodes.Clt);
                    _il.Emit(OpCodes.Ldc_I4_0);
                    _il.Emit(OpCodes.Ceq);
                    break;
            }
        }

        private void EmitStringify(Expression expr)
        {
            if (IsStringExpression(expr))
            {
                EmitExpression(expr);
            }
            else
            {
                // Box and call ToString
                EmitExpression(expr);
                var exprType = InferType(expr);
                if (exprType.IsValueType)
                {
                    _il.Emit(OpCodes.Box, exprType);
                }
                _il.Emit(OpCodes.Callvirt, typeof(object).GetMethod("ToString", Type.EmptyTypes));
            }
        }

        private void EmitCall(CallExpr call)
        {
            // Built-in functions
            if (call.Target == null)
            {
                if (call.MethodName == "str" && call.Arguments.Count > 0)
                { EmitStringify(call.Arguments[0]); return; }
                if (call.MethodName == "int" && call.Arguments.Count > 0)
                { EmitExpression(call.Arguments[0]); return; }
            }

            // Method call on this type (same class)
            if (call.Target == null && _typeEmitter != null && _typeEmitter.Methods.TryGetValue(call.MethodName, out var mb))
            {
                if (!mb.IsStatic) _il.Emit(OpCodes.Ldarg_0); // this
                foreach (var arg in call.Arguments) EmitExpression(arg);
                _il.Emit(mb.IsStatic ? OpCodes.Call : OpCodes.Callvirt, mb);
                return;
            }

            // Member call: target.Method(args)
            if (call.Target != null)
            {
                EmitExpression(call.Target);
                foreach (var arg in call.Arguments) EmitExpression(arg);
                // Resolve method from target type... simplified for now
                // TODO: full type resolution
                _diag.Warning(call.Line, 0, $"External method call '{call.MethodName}' not yet fully resolved");
                return;
            }

            foreach (var arg in call.Arguments) EmitExpression(arg);
            _diag.Warning(call.Line, 0, $"Method call '{call.MethodName}' not resolved");
            if (call.Arguments.Count == 0) _il.Emit(OpCodes.Ldc_I4_0);
        }

        // ======== Type Inference ========

        private Type InferType(Expression expr)
        {
            if (expr is IntLiteralExpr) return typeof(int);
            if (expr is DoubleLiteralExpr) return typeof(double);
            if (expr is StringLiteralExpr) return typeof(string);
            if (expr is BoolLiteralExpr) return typeof(bool);
            if (expr is CntExpr) return typeof(int);
            if (expr is IdentifierExpr id)
            {
                if (_locals.TryGetValue(id.Name, out var loc)) return loc.LocalType;
                if (_paramIndex.TryGetValue(id.Name, out int idx))
                {
                    int pi = _method.IsStatic ? idx : idx - 1;
                    if (pi >= 0 && pi < _method.Parameters.Count)
                        return AssemblyEmitter.ResolveType(_method.Parameters[pi].TypeName) ?? typeof(object);
                }
                if (_typeEmitter != null && _typeEmitter.Fields.TryGetValue(id.Name, out var fb))
                    return fb.FieldType;
            }
            if (expr is BinaryExpr bin)
            {
                if (bin.Operator == "+" && (IsStringExpression(bin.Left) || IsStringExpression(bin.Right)))
                    return typeof(string);
                if (bin.Operator == "==" || bin.Operator == "!=" || bin.Operator == "<" ||
                    bin.Operator == ">" || bin.Operator == "<=" || bin.Operator == ">=" ||
                    bin.Operator == "&&" || bin.Operator == "||")
                    return typeof(bool);
                return InferType(bin.Left);
            }
            if (expr is UnaryExpr un)
            {
                if (un.Operator == "!") return typeof(bool);
                return InferType(un.Operand);
            }
            return typeof(int);
        }

        private bool IsStringExpression(Expression expr)
        {
            return InferType(expr) == typeof(string);
        }
    }
}
