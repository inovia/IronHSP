using System;
using System.Reflection;
using System.Reflection.Emit;
using System.Collections.Generic;
using System.Linq;
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
        public void DefineMethod(AssemblyEmitter asmEmitter = null)
        {
            _retType = (asmEmitter != null ? asmEmitter.ResolveType(_method.ReturnType) : AssemblyEmitter.ResolveTypeStatic(_method.ReturnType)) ?? typeof(void);
            var paramTypes = new List<Type>();
            _paramIndex = new Dictionary<string, int>();
            int argOff = _method.IsStatic ? 0 : 1;

            for (int i = 0; i < _method.Parameters.Count; i++)
            {
                var pt = AssemblyEmitter.ResolveTypeStatic(_method.Parameters[i].TypeName) ?? typeof(object);
                paramTypes.Add(pt);
                _paramIndex[_method.Parameters[i].Name] = i + argOff;
            }

            var attr = MethodAttributes.HideBySig;
            if (_method.Access == "public") attr |= MethodAttributes.Public;
            else if (_method.Access == "private") attr |= MethodAttributes.Private;
            if (_method.IsStatic) attr |= MethodAttributes.Static;
            if (_method.IsVirtual) attr |= MethodAttributes.Virtual | MethodAttributes.NewSlot;
            if (_method.IsOverride) attr |= MethodAttributes.Virtual;

            // Auto-detect interface implementation
            // Use ClassDeclaration's Interfaces list (from parser) instead of TypeBuilder reflection
            if (!_method.IsStatic && !_method.IsVirtual && !_method.IsOverride &&
                _typeEmitter != null && _typeEmitter._asmEmitter != null)
            {
                // Collect all interface names this class implements
                var ifaceNames = new HashSet<string>();
                if (_typeEmitter._cls != null)
                {
                    foreach (var iname in _typeEmitter._cls.Interfaces)
                        ifaceNames.Add(iname);
                }
                // Check if this method is defined in any implemented interface
                foreach (var iname in ifaceNames)
                {
                    if (_typeEmitter._asmEmitter.TypeRegistry.TryGetValue(iname, out var ifaceTB))
                    {
                        // Check if interface has a method with same name (via our Methods dict)
                        // Search classEmitters is complex, so check ifaceTB attributes
                        if (ifaceTB.IsInterface)
                        {
                            attr |= MethodAttributes.Virtual | MethodAttributes.Final | MethodAttributes.NewSlot;
                            break;
                        }
                    }
                    else
                    {
                        // External interface
                        var ifaceType = _typeEmitter._asmEmitter.ResolveType(iname);
                        if (ifaceType != null && ifaceType.IsInterface && ifaceType.GetMethod(_method.Name) != null)
                        {
                            attr |= MethodAttributes.Virtual | MethodAttributes.Final | MethodAttributes.NewSlot;
                            break;
                        }
                    }
                }
            }

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

        private void MarkDebugPoint(AstNode node)
        {
            if (_typeEmitter?._asmEmitter?.DebugDocument != null && node.Line > 0)
            {
                _il.MarkSequencePoint(_typeEmitter._asmEmitter.DebugDocument,
                    node.Line, node.Column > 0 ? node.Column : 1,
                    node.Line, node.Column > 0 ? node.Column + 1 : 100);
            }
        }

        private void EmitStatement(Statement stmt)
        {
            MarkDebugPoint(stmt);
            if (stmt is ReturnStatement ret) EmitReturn(ret);
            else if (stmt is LocalVarDeclaration decl) EmitLocalDecl(decl);
            else if (stmt is AssignmentStatement assign) EmitAssignment(assign);
            else if (stmt is IfStatement ifStmt) EmitIf(ifStmt);
            else if (stmt is RepeatStatement rep) EmitRepeat(rep);
            else if (stmt is WhileStatement wh) EmitWhile(wh);
            else if (stmt is TryCatchStatement tryStmt) EmitTryCatch(tryStmt);
            else if (stmt is ThrowStatement throwStmt) EmitThrow(throwStmt);
            else if (stmt is PrintStatement printStmt) EmitPrint(printStmt);
            else if (stmt is ForStatement forStmt) EmitFor(forStmt);
            else if (stmt is IndexAssignStatement ia) EmitIndexAssign(ia);
            else if (stmt is BreakStatement) EmitBreak();
            else if (stmt is ContinueStatement) EmitContinue();
            else if (stmt is ExpressionStatement exprS)
            {
                EmitExpression(exprS.Expr);
                // Pop result if not void
                var retType = InferType(exprS.Expr);
                if (retType != typeof(void))
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
            if (decl.Initializer is NewObjectExpr newObj)
            {
                // Infer from new expression
                varType = AssemblyEmitter.ResolveTypeStatic(newObj.TypeName);
                if (varType == null && _typeEmitter?._asmEmitter != null)
                    varType = _typeEmitter._asmEmitter.ResolveType(newObj.TypeName);
                varType = varType ?? typeof(object);
            }
            else if (decl.TypeName != null)
            {
                varType = AssemblyEmitter.ResolveTypeStatic(decl.TypeName) ?? typeof(object);
            }
            else if (decl.Initializer != null)
            {
                varType = InferType(decl.Initializer);
            }
            else
            {
                varType = typeof(int);
            }

            // Check if it's array dimension: dim arr as int, 10  (ArraySize > 0)
            if (decl.ArraySize > 0)
            {
                varType = varType.MakeArrayType();
                var local = _il.DeclareLocal(varType);
                _locals[decl.Name] = local;
                _il.Emit(OpCodes.Ldc_I4, decl.ArraySize);
                _il.Emit(OpCodes.Newarr, varType.GetElementType());
                _il.Emit(OpCodes.Stloc, local);
                return;
            }

            var loc = _il.DeclareLocal(varType);
            _locals[decl.Name] = loc;

            if (decl.Initializer != null)
            {
                EmitExpression(decl.Initializer);
                _il.Emit(OpCodes.Stloc, loc);
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
            else if (_typeEmitter != null && _typeEmitter.ResolveField(assign.VariableName) is FieldInfo fb2 && fb2 != null)
            {
                _il.Emit(OpCodes.Ldarg_0);
                if (assign.Operator != "=")
                {
                    _il.Emit(OpCodes.Ldarg_0);
                    _il.Emit(OpCodes.Ldfld, fb2);
                    EmitExpression(assign.Value);
                    EmitCompoundOp(assign.Operator);
                }
                else
                {
                    EmitExpression(assign.Value);
                }
                _il.Emit(OpCodes.Stfld, fb2);
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

        private void EmitTryCatch(TryCatchStatement stmt)
        {
            var catchType = typeof(Exception);
            if (stmt.CatchTypeName != null)
            {
                var resolved = AssemblyEmitter.ResolveTypeStatic(stmt.CatchTypeName);
                if (resolved == null) resolved = AssemblyEmitter.ResolveTypeStatic("System." + stmt.CatchTypeName);
                if (resolved != null) catchType = resolved;
            }

            _il.BeginExceptionBlock();

            // Try body
            foreach (var s in stmt.TryBody) EmitStatement(s);

            // Catch
            if (stmt.CatchBody.Count > 0)
            {
                _il.BeginCatchBlock(catchType);

                if (stmt.CatchVarName != null)
                {
                    // Store exception in local variable
                    var exLocal = _il.DeclareLocal(catchType);
                    _locals[stmt.CatchVarName] = exLocal;
                    _il.Emit(OpCodes.Stloc, exLocal);
                }
                else
                {
                    _il.Emit(OpCodes.Pop); // discard exception
                }

                foreach (var s in stmt.CatchBody) EmitStatement(s);
            }

            // Finally
            if (stmt.FinallyBody != null && stmt.FinallyBody.Count > 0)
            {
                _il.BeginFinallyBlock();
                foreach (var s in stmt.FinallyBody) EmitStatement(s);
            }

            _il.EndExceptionBlock();
        }

        private void EmitThrow(ThrowStatement stmt)
        {
            if (stmt.Value != null)
            {
                EmitExpression(stmt.Value);
                _il.Emit(OpCodes.Throw);
            }
            else
            {
                _il.Emit(OpCodes.Rethrow);
            }
        }

        private void EmitPrint(PrintStatement stmt)
        {
            if (stmt.Value != null)
            {
                var valType = InferType(stmt.Value);
                EmitExpression(stmt.Value);

                // Console.WriteLine overload selection
                MethodInfo writeMethod;
                if (valType == typeof(string))
                    writeMethod = typeof(Console).GetMethod("WriteLine", new[] { typeof(string) });
                else if (valType == typeof(int))
                    writeMethod = typeof(Console).GetMethod("WriteLine", new[] { typeof(int) });
                else if (valType == typeof(double))
                    writeMethod = typeof(Console).GetMethod("WriteLine", new[] { typeof(double) });
                else if (valType == typeof(bool))
                    writeMethod = typeof(Console).GetMethod("WriteLine", new[] { typeof(bool) });
                else
                    writeMethod = typeof(Console).GetMethod("WriteLine", new[] { typeof(object) });

                _il.Emit(OpCodes.Call, writeMethod);
            }
            else
            {
                _il.Emit(OpCodes.Call, typeof(Console).GetMethod("WriteLine", Type.EmptyTypes));
            }
        }

        private void EmitFor(ForStatement forStmt)
        {
            // for i = start to end [step N]
            var loopStart = _il.DefineLabel();
            var loopEnd = _il.DefineLabel();
            var continueLabel = _il.DefineLabel();

            // Declare/get loop var
            if (!_locals.TryGetValue(forStmt.VarName, out var loopVar))
            {
                loopVar = _il.DeclareLocal(typeof(int));
                _locals[forStmt.VarName] = loopVar;
            }

            // i = start
            EmitExpression(forStmt.Start);
            _il.Emit(OpCodes.Stloc, loopVar);

            // end value
            var endVar = _il.DeclareLocal(typeof(int));
            EmitExpression(forStmt.End);
            _il.Emit(OpCodes.Stloc, endVar);

            _loopStack.Push((loopEnd, continueLabel));

            _il.MarkLabel(loopStart);
            // Check: i <= end (for step > 0)
            _il.Emit(OpCodes.Ldloc, loopVar);
            _il.Emit(OpCodes.Ldloc, endVar);
            _il.Emit(OpCodes.Bgt, loopEnd);

            // Body
            foreach (var s in forStmt.Body) EmitStatement(s);

            // Continue: i += step
            _il.MarkLabel(continueLabel);
            _il.Emit(OpCodes.Ldloc, loopVar);
            if (forStmt.Step != null)
                EmitExpression(forStmt.Step);
            else
                _il.Emit(OpCodes.Ldc_I4_1);
            _il.Emit(OpCodes.Add);
            _il.Emit(OpCodes.Stloc, loopVar);
            _il.Emit(OpCodes.Br, loopStart);

            _il.MarkLabel(loopEnd);
            _loopStack.Pop();
        }

        private void EmitIndexAssign(IndexAssignStatement ia)
        {
            // arr(i) = value → arr[i] = value
            if (_locals.TryGetValue(ia.ArrayName, out var arrLocal))
            {
                _il.Emit(OpCodes.Ldloc, arrLocal);
                EmitExpression(ia.Index);
                EmitExpression(ia.Value);
                var elemType = arrLocal.LocalType.GetElementType();
                if (elemType == typeof(int)) _il.Emit(OpCodes.Stelem_I4);
                else if (elemType == typeof(string)) _il.Emit(OpCodes.Stelem_Ref);
                else if (elemType == typeof(double)) _il.Emit(OpCodes.Stelem_R8);
                else _il.Emit(OpCodes.Stelem_Ref);
            }
            else
            {
                _diag.Error(ia.Line, 0, $"Unknown array: {ia.ArrayName}");
            }
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
            else if (expr is NewObjectExpr newObj) { EmitNewObject(newObj); }
            else if (expr is IndexExpr idx) { EmitIndexAccess(idx); }
            else if (expr is ThisExpr) { _il.Emit(OpCodes.Ldarg_0); }
            else if (expr is MemberAccessExpr mem)
            {
                EmitExpression(mem.Target);
                var targetType = InferType(mem.Target);
                if (targetType != null)
                {
                    // Property
                    var prop = targetType.GetProperty(mem.MemberName);
                    if (prop != null)
                    {
                        var getter = prop.GetGetMethod();
                        _il.Emit(targetType.IsValueType ? OpCodes.Call : OpCodes.Callvirt, getter);
                        return;
                    }
                    // Field
                    var fi = targetType.GetField(mem.MemberName);
                    if (fi != null) { _il.Emit(OpCodes.Ldfld, fi); return; }
                    // Local TypeBuilder field
                    if (mem.Target is ThisExpr && _typeEmitter != null)
                    {
                        var resolved = _typeEmitter.ResolveField(mem.MemberName);
                        if (resolved != null) { _il.Emit(OpCodes.Ldfld, resolved); return; }
                    }
                }
                _diag.Warning(mem.Line, 0, $"Member '{mem.MemberName}' not resolved on {targetType?.Name}");
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
            else if (_typeEmitter != null && _typeEmitter.ResolveField(name) is FieldInfo fld && fld != null)
            {
                _il.Emit(OpCodes.Ldarg_0);
                _il.Emit(OpCodes.Ldfld, fld);
            }
            else
            {
                // Could be a static type reference (Console, Math, etc.) - no emit needed
                var resolvedType = AssemblyEmitter.ResolveTypeStatic(name);
                if (resolvedType == null) resolvedType = AssemblyEmitter.ResolveTypeStatic("System." + name);
                if (resolvedType != null) return; // static type ref - nothing to push
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
            // Array index access: arr(i) → emit as array element load
            if (call.Target == null && _locals.TryGetValue(call.MethodName, out var arrLocal2)
                && arrLocal2.LocalType.IsArray && call.Arguments.Count == 1)
            {
                _il.Emit(OpCodes.Ldloc, arrLocal2);
                EmitExpression(call.Arguments[0]);
                var elemType = arrLocal2.LocalType.GetElementType();
                if (elemType == typeof(int)) _il.Emit(OpCodes.Ldelem_I4);
                else if (elemType == typeof(double)) _il.Emit(OpCodes.Ldelem_R8);
                else _il.Emit(OpCodes.Ldelem_Ref);
                return;
            }

            // Built-in functions
            if (call.Target == null)
            {
                if (call.MethodName == "str" && call.Arguments.Count > 0)
                { EmitStringify(call.Arguments[0]); return; }
                if (call.MethodName == "int" && call.Arguments.Count > 0)
                {
                    EmitExpression(call.Arguments[0]);
                    var st = InferType(call.Arguments[0]);
                    if (st == typeof(double) || st == typeof(float))
                        _il.Emit(OpCodes.Conv_I4);
                    else if (st == typeof(string))
                    {
                        _il.Emit(OpCodes.Call, typeof(int).GetMethod("Parse", new[] { typeof(string) }));
                    }
                    return;
                }
                if ((call.MethodName == "double" || call.MethodName == "float") && call.Arguments.Count > 0)
                {
                    EmitExpression(call.Arguments[0]);
                    var st = InferType(call.Arguments[0]);
                    if (st == typeof(int) || st == typeof(long))
                        _il.Emit(OpCodes.Conv_R8);
                    else if (st == typeof(string))
                        _il.Emit(OpCodes.Call, typeof(double).GetMethod("Parse", new[] { typeof(string) }));
                    return;
                }
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
                var targetType = InferType(call.Target);
                bool isStaticCall = false;

                // Check if target is a static type reference (nothing to push)
                if (call.Target is IdentifierExpr targetId)
                {
                    var st = AssemblyEmitter.ResolveTypeStatic(targetId.Name);
                    if (st == null) st = AssemblyEmitter.ResolveTypeStatic("System." + targetId.Name);
                    if (st != null) { targetType = st; isStaticCall = true; }
                }

                if (!isStaticCall)
                    EmitExpression(call.Target);
                foreach (var arg in call.Arguments) EmitExpression(arg);
                if (targetType != null)
                {
                    // TypeBuilder: MUST use EmitterRegistry (GetMethod fails before CreateType)
                    if (targetType is TypeBuilder && _typeEmitter?._asmEmitter != null)
                    {
                        if (_typeEmitter._asmEmitter.EmitterRegistry.TryGetValue(targetType.Name, out var te2))
                        {
                            if (te2.Methods.TryGetValue(call.MethodName, out var mb2))
                            {
                                _il.Emit(mb2.IsStatic ? OpCodes.Call : OpCodes.Callvirt, mb2);
                                return;
                            }
                        }
                    }
                    else
                    {
                        var mi = ResolveMethod(targetType, call.MethodName, call.Arguments);
                        if (mi != null)
                        {
                            _il.Emit((mi.IsStatic || targetType.IsValueType) ? OpCodes.Call : OpCodes.Callvirt, mi);
                            return;
                        }
                    }
                }
                _diag.Warning(call.Line, 0, $"Method '{call.MethodName}' not resolved on {targetType?.Name}");
                return;
            }

            foreach (var arg in call.Arguments) EmitExpression(arg);
            _diag.Warning(call.Line, 0, $"Method call '{call.MethodName}' not resolved");
            if (call.Arguments.Count == 0) _il.Emit(OpCodes.Ldc_I4_0);
        }

        private MethodInfo ResolveMethod(Type type, string name, List<Expression> args)
        {
            var argTypes = new Type[args.Count];
            for (int i = 0; i < args.Count; i++)
                argTypes[i] = InferType(args[i]);

            // 1. Exact match by name + arg types
            MethodInfo mi = null;
            try { mi = type.GetMethod(name, argTypes); } catch { }
            if (mi != null) return mi;

            // 2. Match by name + arg count (handles implicit conversions)
            try
            {
                var candidates = type.GetMethods().Where(m =>
                    m.Name == name && m.GetParameters().Length == args.Count).ToArray();
                if (candidates.Length == 1) return candidates[0];
                if (candidates.Length > 1)
                {
                    // Try to find best match by checking assignability
                    foreach (var c in candidates)
                    {
                        var ps = c.GetParameters();
                        bool ok = true;
                        for (int i = 0; i < ps.Length; i++)
                        {
                            if (!ps[i].ParameterType.IsAssignableFrom(argTypes[i]) &&
                                !(argTypes[i] == typeof(int) && ps[i].ParameterType == typeof(long)) &&
                                !(argTypes[i] == typeof(int) && ps[i].ParameterType == typeof(double)))
                            { ok = false; break; }
                        }
                        if (ok) return c;
                    }
                    return candidates[0]; // fallback to first
                }
            }
            catch { }

            // 3. Name only (single overload)
            try { mi = type.GetMethod(name); } catch { }
            return mi;
        }

        private void EmitNewObject(NewObjectExpr newObj)
        {
            // Resolve type: local TypeRegistry first, then global
            Type type = null;
            if (_typeEmitter?._asmEmitter != null)
                type = _typeEmitter._asmEmitter.ResolveType(newObj.TypeName);
            if (type == null)
                type = AssemblyEmitter.ResolveTypeStatic(newObj.TypeName);
            if (type == null)
            {
                _diag.Error(newObj.Line, 0, $"Type not found: {newObj.TypeName}");
                _il.Emit(OpCodes.Ldnull);
                return;
            }

            // Array creation: dim arr as int, 10 → new int[10]
            if (type.IsArray)
            {
                EmitExpression(newObj.Arguments[0]);
                _il.Emit(OpCodes.Newarr, type.GetElementType());
                return;
            }

            // Constructor args
            var argTypes = new Type[newObj.Arguments.Count];
            for (int i = 0; i < newObj.Arguments.Count; i++)
            {
                EmitExpression(newObj.Arguments[i]);
                argTypes[i] = InferType(newObj.Arguments[i]);
            }

            ConstructorInfo ctor = null;

            // TypeBuilder: MUST use EmitterRegistry first
            if (ctor == null && type is TypeBuilder && _typeEmitter?._asmEmitter != null)
            {
                if (_typeEmitter._asmEmitter.EmitterRegistry.TryGetValue(type.Name, out var te))
                {
                    // Match constructor by parameter count
                    // (GetParameters() fails on TypeBuilder before CreateType)
                    foreach (var cb in te.Constructors)
                    {
                        // Use ConstructorParamCounts stored alongside
                        int cbParamCount = te.ConstructorParamCounts[te.Constructors.IndexOf(cb)];
                        if (cbParamCount == argTypes.Length)
                        {
                            ctor = cb;
                            break;
                        }
                    }
                    if (ctor == null && newObj.Arguments.Count == 0 && te.Constructors.Count > 0)
                        ctor = te.Constructors[0];
                }
            }

            // Fallback: regular .NET type (not TypeBuilder)
            if (ctor == null && !(type is TypeBuilder))
            {
                try { ctor = type.GetConstructor(argTypes); } catch { }
                if (ctor == null) try { ctor = type.GetConstructor(Type.EmptyTypes); } catch { }
            }

            if (ctor != null)
            {
                _il.Emit(OpCodes.Newobj, ctor);
            }
            else
            {
                _diag.Error(newObj.Line, 0, $"Constructor not found: {newObj.TypeName}({string.Join(",", argTypes.Select(t2 => t2.Name))}) isTB={type is TypeBuilder}");
                _il.Emit(OpCodes.Ldnull);
            }
        }

        private void EmitIndexAccess(IndexExpr idx)
        {
            EmitExpression(idx.Target);
            EmitExpression(idx.Index);
            var arrType = InferType(idx.Target);
            if (arrType != null && arrType.IsArray)
            {
                var elemType = arrType.GetElementType();
                if (elemType == typeof(int)) _il.Emit(OpCodes.Ldelem_I4);
                else if (elemType == typeof(double)) _il.Emit(OpCodes.Ldelem_R8);
                else if (elemType == typeof(string)) _il.Emit(OpCodes.Ldelem_Ref);
                else _il.Emit(OpCodes.Ldelem_Ref);
            }
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
                        return AssemblyEmitter.ResolveTypeStatic(_method.Parameters[pi].TypeName) ?? typeof(object);
                }
                if (_typeEmitter != null && _typeEmitter.ResolveField(id.Name) is FieldInfo fld2)
                    return fld2.FieldType;
                // Static type reference: local TypeRegistry first, then global
                Type resolvedType = null;
                if (_typeEmitter?._asmEmitter != null)
                    resolvedType = _typeEmitter._asmEmitter.ResolveType(id.Name);
                if (resolvedType == null) resolvedType = AssemblyEmitter.ResolveTypeStatic(id.Name);
                if (resolvedType == null) resolvedType = AssemblyEmitter.ResolveTypeStatic("System." + id.Name);
                if (resolvedType != null) return resolvedType;
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
            if (expr is NewObjectExpr newObj)
            {
                var t = AssemblyEmitter.ResolveTypeStatic(newObj.TypeName);
                if (t == null && _typeEmitter?._asmEmitter != null)
                    t = _typeEmitter._asmEmitter.ResolveType(newObj.TypeName);
                return t ?? typeof(object);
            }
            if (expr is IndexExpr idxExpr)
            {
                var arrType = InferType(idxExpr.Target);
                if (arrType != null && arrType.IsArray)
                    return arrType.GetElementType();
            }
            if (expr is CallExpr callExpr)
            {
                if (callExpr.Target == null)
                {
                    if (callExpr.MethodName == "str") return typeof(string);
                    if (callExpr.MethodName == "int") return typeof(int);
                    if (callExpr.MethodName == "double") return typeof(double);
                    if (_typeEmitter != null && _typeEmitter.Methods.TryGetValue(callExpr.MethodName, out var cmb))
                        return cmb.ReturnType;
                }
                if (callExpr.Target != null)
                {
                    var targetType = InferType(callExpr.Target);
                    if (targetType != null)
                    {
                        MethodInfo mi = null;
                        try { mi = targetType.GetMethod(callExpr.MethodName); } catch { }
                        if (mi == null)
                        {
                            // Fallback: match by name + arg count
                            try
                            {
                                var candidates = targetType.GetMethods()
                                    .Where(m => m.Name == callExpr.MethodName && m.GetParameters().Length == callExpr.Arguments.Count)
                                    .ToArray();
                                if (candidates.Length > 0) mi = candidates[0];
                            }
                            catch { }
                        }
                        if (mi != null) return mi.ReturnType;
                    }
                }
            }
            return typeof(int);
        }

        private bool IsStringExpression(Expression expr)
        {
            return InferType(expr) == typeof(string);
        }
    }
}
