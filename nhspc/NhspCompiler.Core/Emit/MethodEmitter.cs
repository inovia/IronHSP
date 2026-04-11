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
        private ILGenerator _il;
        private Dictionary<string, int> _paramIndex; // name -> arg index

        public MethodEmitter(MethodDeclaration method, TypeBuilder type, DiagnosticBag diag)
        {
            _method = method;
            _type = type;
            _diag = diag;
        }

        public void Emit()
        {
            var retType = AssemblyEmitter.ResolveType(_method.ReturnType) ?? typeof(void);

            var paramTypes = new List<Type>();
            _paramIndex = new Dictionary<string, int>();
            int argOffset = _method.IsStatic ? 0 : 1; // instance methods have 'this' at arg 0

            for (int i = 0; i < _method.Parameters.Count; i++)
            {
                var pt = AssemblyEmitter.ResolveType(_method.Parameters[i].TypeName);
                if (pt == null)
                {
                    _diag.Error(_method.Line, 0, $"Unknown parameter type: {_method.Parameters[i].TypeName}");
                    pt = typeof(object);
                }
                paramTypes.Add(pt);
                _paramIndex[_method.Parameters[i].Name] = i + argOffset;
            }

            var attr = MethodAttributes.HideBySig;
            if (_method.Access == "public") attr |= MethodAttributes.Public;
            else if (_method.Access == "private") attr |= MethodAttributes.Private;
            if (_method.IsStatic) attr |= MethodAttributes.Static;

            var mb = _type.DefineMethod(_method.Name, attr, retType, paramTypes.ToArray());

            // Set parameter names
            for (int i = 0; i < _method.Parameters.Count; i++)
            {
                mb.DefineParameter(i + 1, ParameterAttributes.None, _method.Parameters[i].Name);
            }

            _il = mb.GetILGenerator();

            foreach (var stmt in _method.Body)
            {
                EmitStatement(stmt);
            }

            // Ensure method has a return
            if (retType == typeof(void))
            {
                _il.Emit(OpCodes.Ret);
            }
        }

        private void EmitStatement(Statement stmt)
        {
            if (stmt is ReturnStatement ret)
            {
                if (ret.Value != null)
                {
                    EmitExpression(ret.Value);
                }
                _il.Emit(OpCodes.Ret);
            }
        }

        private void EmitExpression(Expression expr)
        {
            if (expr is IntLiteralExpr intLit)
            {
                _il.Emit(OpCodes.Ldc_I4, intLit.Value);
            }
            else if (expr is StringLiteralExpr strLit)
            {
                _il.Emit(OpCodes.Ldstr, strLit.Value);
            }
            else if (expr is IdentifierExpr ident)
            {
                if (_paramIndex.TryGetValue(ident.Name, out int idx))
                {
                    _il.Emit(OpCodes.Ldarg, idx);
                }
                else
                {
                    _diag.Error(ident.Line, 0, $"Unknown identifier: {ident.Name}");
                    _il.Emit(OpCodes.Ldc_I4_0); // fallback
                }
            }
            else if (expr is BinaryExpr bin)
            {
                EmitExpression(bin.Left);
                EmitExpression(bin.Right);

                // Check if this is string concatenation
                bool leftIsString = IsStringExpression(bin.Left);
                bool rightIsString = IsStringExpression(bin.Right);

                if (bin.Operator == "+" && (leftIsString || rightIsString))
                {
                    // String.Concat(object, object)
                    if (!leftIsString)
                    {
                        // Need to box and ToString the left
                        // For simplicity, use String.Concat(string, string) with ToString
                    }
                    var concatMethod = typeof(string).GetMethod("Concat", new[] { typeof(string), typeof(string) });
                    _il.Emit(OpCodes.Call, concatMethod);
                }
                else
                {
                    switch (bin.Operator)
                    {
                        case "+": _il.Emit(OpCodes.Add); break;
                        case "-": _il.Emit(OpCodes.Sub); break;
                        case "*": _il.Emit(OpCodes.Mul); break;
                        case "/": _il.Emit(OpCodes.Div); break;
                    }
                }
            }
        }

        private bool IsStringExpression(Expression expr)
        {
            if (expr is StringLiteralExpr) return true;
            if (expr is IdentifierExpr ident && _paramIndex.ContainsKey(ident.Name))
            {
                int idx = _paramIndex[ident.Name];
                int paramIdx = _method.IsStatic ? idx : idx - 1;
                if (paramIdx >= 0 && paramIdx < _method.Parameters.Count)
                {
                    return _method.Parameters[paramIdx].TypeName == "string";
                }
            }
            if (expr is BinaryExpr bin && bin.Operator == "+")
            {
                return IsStringExpression(bin.Left) || IsStringExpression(bin.Right);
            }
            return false;
        }
    }
}
