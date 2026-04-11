using System;
using System.Reflection;
using System.Reflection.Emit;
using System.Collections.Generic;
using NhspCompiler.Core.Parsing.Ast;
using NhspCompiler.Core.Diagnostics;

namespace NhspCompiler.Core.Emit
{
    public class TypeEmitter
    {
        private readonly ClassDeclaration _cls;
        private readonly ModuleBuilder _module;
        private readonly DiagnosticBag _diag;
        public TypeBuilder TypeBuilder { get; private set; }
        public Dictionary<string, FieldBuilder> Fields { get; } = new Dictionary<string, FieldBuilder>();
        public Dictionary<string, MethodBuilder> Methods { get; } = new Dictionary<string, MethodBuilder>();

        public TypeEmitter(ClassDeclaration cls, ModuleBuilder module, DiagnosticBag diag)
        {
            _cls = cls;
            _module = module;
            _diag = diag;
        }

        public void Emit()
        {
            var attr = TypeAttributes.Class;
            if (_cls.DefaultAccess == "public") attr |= TypeAttributes.Public;

            Type baseType = typeof(object);
            if (_cls.BaseClass != null)
                baseType = AssemblyEmitter.ResolveType(_cls.BaseClass) ?? typeof(object);

            TypeBuilder = _module.DefineType(_cls.Name, attr, baseType);

            // Fields
            foreach (var field in _cls.Fields)
            {
                var ft = AssemblyEmitter.ResolveType(field.TypeName);
                if (ft == null) { _diag.Error(field.Line, 0, $"Unknown type: {field.TypeName}"); continue; }
                var fa = field.Access == "private" ? FieldAttributes.Private : FieldAttributes.Public;
                Fields[field.Name] = TypeBuilder.DefineField(field.Name, ft, fa);
            }

            // Pre-define methods (so they can be referenced by each other)
            var methodEmitters = new List<MethodEmitter>();
            foreach (var method in _cls.Methods)
            {
                var me = new MethodEmitter(method, TypeBuilder, _diag, this);
                me.DefineMethod();
                if (me.Builder != null) Methods[method.Name] = me.Builder;
                methodEmitters.Add(me);
            }

            // Constructors
            if (_cls.Constructors.Count == 0)
            {
                // Default constructor
                var ctor = TypeBuilder.DefineConstructor(MethodAttributes.Public, CallingConventions.Standard, Type.EmptyTypes);
                var il = ctor.GetILGenerator();
                il.Emit(OpCodes.Ldarg_0);
                il.Emit(OpCodes.Call, baseType.GetConstructor(Type.EmptyTypes) ?? typeof(object).GetConstructor(Type.EmptyTypes));
                il.Emit(OpCodes.Ret);
            }
            else
            {
                foreach (var ctorDecl in _cls.Constructors)
                {
                    EmitConstructor(ctorDecl, baseType);
                }
            }

            // Emit method bodies
            foreach (var me in methodEmitters)
                me.EmitBody();

            // Properties
            foreach (var prop in _cls.Properties)
                EmitProperty(prop);

            TypeBuilder.CreateType();
        }

        private void EmitConstructor(ConstructorDeclaration decl, Type baseType)
        {
            var paramTypes = new List<Type>();
            var paramNames = new List<string>();
            foreach (var p in decl.Parameters)
            {
                var pt = AssemblyEmitter.ResolveType(p.TypeName) ?? typeof(object);
                paramTypes.Add(pt);
                paramNames.Add(p.Name);
            }

            var access = decl.Access == "private" ? MethodAttributes.Private : MethodAttributes.Public;
            var ctor = TypeBuilder.DefineConstructor(access, CallingConventions.Standard, paramTypes.ToArray());
            for (int i = 0; i < paramNames.Count; i++)
                ctor.DefineParameter(i + 1, ParameterAttributes.None, paramNames[i]);

            var il = ctor.GetILGenerator();

            // Call base constructor
            il.Emit(OpCodes.Ldarg_0);
            il.Emit(OpCodes.Call, baseType.GetConstructor(Type.EmptyTypes) ?? typeof(object).GetConstructor(Type.EmptyTypes));

            // Create a temporary MethodEmitter-like context for the body
            var paramIndex = new Dictionary<string, int>();
            for (int i = 0; i < paramNames.Count; i++)
                paramIndex[paramNames[i]] = i + 1; // +1 for this

            var ctorEmitter = new ConstructorBodyEmitter(il, paramIndex, _diag, this, decl.Parameters);
            foreach (var stmt in decl.Body)
                ctorEmitter.EmitStatement(stmt);

            il.Emit(OpCodes.Ret);
        }

        private void EmitProperty(PropertyDeclaration prop)
        {
            var propType = AssemblyEmitter.ResolveType(prop.TypeName) ?? typeof(object);
            var pb = TypeBuilder.DefineProperty(prop.Name, PropertyAttributes.None, propType, null);

            if (prop.GetterBody != null)
            {
                var getAttr = MethodAttributes.Public | MethodAttributes.SpecialName | MethodAttributes.HideBySig;
                var getter = TypeBuilder.DefineMethod("get_" + prop.Name, getAttr, propType, Type.EmptyTypes);
                var il = getter.GetILGenerator();

                var getEmitter = new ConstructorBodyEmitter(il, new Dictionary<string, int>(), _diag, this, new List<ParameterDeclaration>());
                foreach (var stmt in prop.GetterBody)
                    getEmitter.EmitStatement(stmt);

                // Default return
                if (propType == typeof(int)) il.Emit(OpCodes.Ldc_I4_0);
                else if (propType == typeof(string)) il.Emit(OpCodes.Ldstr, "");
                else if (propType == typeof(bool)) il.Emit(OpCodes.Ldc_I4_0);
                else il.Emit(OpCodes.Ldnull);
                il.Emit(OpCodes.Ret);

                pb.SetGetMethod(getter);
            }

            if (prop.SetterBody != null)
            {
                var setAttr = MethodAttributes.Public | MethodAttributes.SpecialName | MethodAttributes.HideBySig;
                var setter = TypeBuilder.DefineMethod("set_" + prop.Name, setAttr, null, new[] { propType });
                setter.DefineParameter(1, ParameterAttributes.None, "value");
                var il = setter.GetILGenerator();

                var paramIdx = new Dictionary<string, int> { { "value", 1 } };
                var setEmitter = new ConstructorBodyEmitter(il, paramIdx, _diag, this, new List<ParameterDeclaration>());
                foreach (var stmt in prop.SetterBody)
                    setEmitter.EmitStatement(stmt);

                il.Emit(OpCodes.Ret);
                pb.SetSetMethod(setter);
            }
        }
    }

    // Simplified body emitter for constructors and property accessors
    // Reuses the same expression/statement emission as MethodEmitter
    internal class ConstructorBodyEmitter
    {
        private readonly ILGenerator _il;
        private readonly Dictionary<string, int> _paramIndex;
        private readonly DiagnosticBag _diag;
        private readonly TypeEmitter _typeEmitter;
        private readonly Dictionary<string, LocalBuilder> _locals = new Dictionary<string, LocalBuilder>();
        private readonly List<ParameterDeclaration> _params;

        public ConstructorBodyEmitter(ILGenerator il, Dictionary<string, int> paramIndex,
            DiagnosticBag diag, TypeEmitter typeEmitter, List<ParameterDeclaration> parms)
        {
            _il = il;
            _paramIndex = paramIndex;
            _diag = diag;
            _typeEmitter = typeEmitter;
            _params = parms;
        }

        public void EmitStatement(Statement stmt)
        {
            if (stmt is ReturnStatement ret)
            {
                if (ret.Value != null) EmitExpression(ret.Value);
                _il.Emit(OpCodes.Ret);
            }
            else if (stmt is AssignmentStatement assign)
            {
                // Check if it's a field
                if (_typeEmitter.Fields.TryGetValue(assign.VariableName, out var fb))
                {
                    _il.Emit(OpCodes.Ldarg_0); // this
                    EmitExpression(assign.Value);
                    _il.Emit(OpCodes.Stfld, fb);
                }
                else if (_locals.TryGetValue(assign.VariableName, out var local))
                {
                    EmitExpression(assign.Value);
                    _il.Emit(OpCodes.Stloc, local);
                }
                else
                {
                    // Auto-declare local
                    var vt = InferType(assign.Value);
                    var newLocal = _il.DeclareLocal(vt);
                    _locals[assign.VariableName] = newLocal;
                    EmitExpression(assign.Value);
                    _il.Emit(OpCodes.Stloc, newLocal);
                }
            }
            else if (stmt is LocalVarDeclaration decl)
            {
                var vt = decl.TypeName != null ? (AssemblyEmitter.ResolveType(decl.TypeName) ?? typeof(int)) : typeof(int);
                var local = _il.DeclareLocal(vt);
                _locals[decl.Name] = local;
                if (decl.Initializer != null)
                {
                    EmitExpression(decl.Initializer);
                    _il.Emit(OpCodes.Stloc, local);
                }
            }
        }

        public void EmitExpression(Expression expr)
        {
            if (expr is IntLiteralExpr i) _il.Emit(OpCodes.Ldc_I4, i.Value);
            else if (expr is StringLiteralExpr s) _il.Emit(OpCodes.Ldstr, s.Value);
            else if (expr is BoolLiteralExpr b) _il.Emit(b.Value ? OpCodes.Ldc_I4_1 : OpCodes.Ldc_I4_0);
            else if (expr is IdentifierExpr id)
            {
                if (_locals.TryGetValue(id.Name, out var loc)) _il.Emit(OpCodes.Ldloc, loc);
                else if (_paramIndex.TryGetValue(id.Name, out int idx)) _il.Emit(OpCodes.Ldarg, idx);
                else if (_typeEmitter.Fields.ContainsKey(id.Name))
                {
                    _il.Emit(OpCodes.Ldarg_0);
                    _il.Emit(OpCodes.Ldfld, _typeEmitter.Fields[id.Name]);
                }
                else _il.Emit(OpCodes.Ldc_I4_0);
            }
            else if (expr is BinaryExpr bin)
            {
                EmitExpression(bin.Left);
                EmitExpression(bin.Right);
                switch (bin.Operator)
                {
                    case "+":
                        if (InferType(bin.Left) == typeof(string) || InferType(bin.Right) == typeof(string))
                            _il.Emit(OpCodes.Call, typeof(string).GetMethod("Concat", new[] { typeof(string), typeof(string) }));
                        else
                            _il.Emit(OpCodes.Add);
                        break;
                    case "-": _il.Emit(OpCodes.Sub); break;
                    case "*": _il.Emit(OpCodes.Mul); break;
                    case "/": _il.Emit(OpCodes.Div); break;
                }
            }
            else if (expr is ThisExpr) _il.Emit(OpCodes.Ldarg_0);
        }

        private Type InferType(Expression expr)
        {
            if (expr is StringLiteralExpr) return typeof(string);
            if (expr is IntLiteralExpr) return typeof(int);
            if (expr is BoolLiteralExpr) return typeof(bool);
            if (expr is IdentifierExpr id)
            {
                if (_typeEmitter.Fields.TryGetValue(id.Name, out var fb)) return fb.FieldType;
                if (_paramIndex.ContainsKey(id.Name))
                {
                    int idx = _paramIndex[id.Name];
                    int pi = idx - 1;
                    if (pi >= 0 && pi < _params.Count)
                        return AssemblyEmitter.ResolveType(_params[pi].TypeName) ?? typeof(object);
                }
            }
            return typeof(int);
        }
    }
}
