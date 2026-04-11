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
        internal readonly ClassDeclaration _cls;
        private readonly InterfaceDeclaration _iface;
        private readonly ModuleBuilder _module;
        private readonly DiagnosticBag _diag;
        internal readonly AssemblyEmitter _asmEmitter;
        private readonly bool _isInterface;

        public TypeBuilder TypeBuilder { get; private set; }
        public Dictionary<string, FieldBuilder> Fields { get; } = new Dictionary<string, FieldBuilder>();
        public Dictionary<string, MethodBuilder> Methods { get; } = new Dictionary<string, MethodBuilder>();

        // Resolve a field including inherited fields from base TypeBuilder
        public FieldInfo ResolveField(string name)
        {
            if (Fields.TryGetValue(name, out var fb)) return fb;
            // Check parent TypeEmitter's fields (via assembly's TypeRegistry)
            var baseType = TypeBuilder?.BaseType;
            if (baseType is TypeBuilder baseTB && _asmEmitter != null)
            {
                // Find the parent TypeEmitter's Fields dictionary
                foreach (var kvp in _asmEmitter.TypeRegistry)
                {
                    if (kvp.Value == baseTB)
                    {
                        // We need a lookup from TypeBuilder to TypeEmitter
                        // Use the FieldBuilder stored by parent
                        break;
                    }
                }
                // Fallback: search FieldBuilders defined on the base TypeBuilder
                // TypeBuilder stores defined fields internally - use reflection on the builder
                // For simplicity, store parent reference
                if (_parentEmitter != null)
                    return _parentEmitter.ResolveField(name);
            }
            else if (baseType != null && !(baseType is TypeBuilder))
            {
                var baseField = baseType.GetField(name, BindingFlags.Public | BindingFlags.Instance);
                if (baseField != null) return baseField;
            }
            return null;
        }

        public TypeEmitter ParentEmitter { set { _parentEmitter = value; } }
        private TypeEmitter _parentEmitter;

        public TypeEmitter(ClassDeclaration cls, ModuleBuilder module, DiagnosticBag diag, AssemblyEmitter asmEmitter, bool isInterface)
        {
            _cls = cls;
            _module = module;
            _diag = diag;
            _asmEmitter = asmEmitter;
            _isInterface = false;
        }

        public TypeEmitter(InterfaceDeclaration iface, ModuleBuilder module, DiagnosticBag diag, AssemblyEmitter asmEmitter, bool isInterface)
        {
            _iface = iface;
            _module = module;
            _diag = diag;
            _asmEmitter = asmEmitter;
            _isInterface = true;
        }

        // Pass 1: Define the type (name, base, interfaces)
        public void DefineType()
        {
            if (_isInterface)
            {
                var attr = TypeAttributes.Interface | TypeAttributes.Abstract | TypeAttributes.Public;
                TypeBuilder = _module.DefineType(_iface.Name, attr);
                _asmEmitter.TypeRegistry[_iface.Name] = TypeBuilder;
            }
            else
            {
                var attr = TypeAttributes.Class;
                if (_cls.DefaultAccess == "public") attr |= TypeAttributes.Public;

                Type baseType = typeof(object);
                if (_cls.BaseClass != null)
                {
                    var resolved = _asmEmitter.ResolveType(_cls.BaseClass);
                    if (resolved != null)
                    {
                        if (resolved.IsInterface || (resolved is TypeBuilder rtb && rtb.IsInterface))
                        {
                            // First "base" is actually an interface
                            _cls.Interfaces.Insert(0, _cls.BaseClass);
                            _cls.BaseClass = null;
                        }
                        else
                        {
                            baseType = resolved;
                        }
                    }
                }

                TypeBuilder = _module.DefineType(_cls.Name, attr, baseType);

                // Implement interfaces
                foreach (var ifaceName in _cls.Interfaces)
                {
                    var ifaceType = _asmEmitter.ResolveType(ifaceName);
                    if (ifaceType != null)
                        TypeBuilder.AddInterfaceImplementation(ifaceType);
                    else
                        _diag.Error(_cls.Line, 0, $"Interface not found: {ifaceName}");
                }

                _asmEmitter.TypeRegistry[_cls.Name] = TypeBuilder;
            }
        }

        // Pass 2: Emit members
        public void EmitMembers()
        {
            if (_isInterface)
            {
                EmitInterfaceMembers();
            }
            else
            {
                EmitClassMembers();
            }
        }

        // Pass 3: Finalize
        public void FinalizeType()
        {
            TypeBuilder.CreateType();
        }

        private void EmitInterfaceMembers()
        {
            foreach (var sig in _iface.Methods)
            {
                var retType = _asmEmitter.ResolveType(sig.ReturnType) ?? typeof(void);
                var paramTypes = new List<Type>();
                foreach (var p in sig.Parameters)
                    paramTypes.Add(_asmEmitter.ResolveType(p.TypeName) ?? typeof(object));

                var mb = TypeBuilder.DefineMethod(sig.Name,
                    MethodAttributes.Public | MethodAttributes.Abstract | MethodAttributes.Virtual | MethodAttributes.HideBySig | MethodAttributes.NewSlot,
                    retType, paramTypes.ToArray());

                for (int i = 0; i < sig.Parameters.Count; i++)
                    mb.DefineParameter(i + 1, ParameterAttributes.None, sig.Parameters[i].Name);

                Methods[sig.Name] = mb;
            }
        }

        private void EmitClassMembers()
        {
            Type baseType = TypeBuilder.BaseType ?? typeof(object);

            // Fields
            foreach (var field in _cls.Fields)
            {
                var ft = _asmEmitter.ResolveType(field.TypeName);
                if (ft == null) { _diag.Error(field.Line, 0, $"Unknown type: {field.TypeName}"); continue; }
                var fa = field.Access == "private" ? FieldAttributes.Private : FieldAttributes.Public;
                Fields[field.Name] = TypeBuilder.DefineField(field.Name, ft, fa);
            }

            // Pre-define methods
            var methodEmitters = new List<MethodEmitter>();
            foreach (var method in _cls.Methods)
            {
                var me = new MethodEmitter(method, TypeBuilder, _diag, this);
                me.DefineMethod(_asmEmitter);
                if (me.Builder != null) Methods[method.Name] = me.Builder;
                methodEmitters.Add(me);
            }

            // Resolve base default constructor
            // For TypeBuilder base types, use DefineDefaultConstructor or emit manually
            if (baseType is TypeBuilder baseTB)
            {
                // Find the default ctor defined on the base TypeBuilder
                // We need to look in the asmEmitter's TypeRegistry
                // For now, just define a constructor that calls Object..ctor
                _baseDefaultCtor = typeof(object).GetConstructor(Type.EmptyTypes);
            }
            else
            {
                _baseDefaultCtor = baseType.GetConstructor(Type.EmptyTypes) ?? typeof(object).GetConstructor(Type.EmptyTypes);
            }

            // Constructors
            if (_cls.Constructors.Count == 0)
            {
                var ctor = TypeBuilder.DefineConstructor(MethodAttributes.Public, CallingConventions.Standard, Type.EmptyTypes);
                var il = ctor.GetILGenerator();
                il.Emit(OpCodes.Ldarg_0);
                il.Emit(OpCodes.Call, _baseDefaultCtor);
                il.Emit(OpCodes.Ret);
            }
            else
            {
                foreach (var ctorDecl in _cls.Constructors)
                    EmitConstructor(ctorDecl, baseType);
            }

            // Emit method bodies
            foreach (var me in methodEmitters)
                me.EmitBody();

            // Properties
            foreach (var prop in _cls.Properties)
                EmitProperty(prop);
        }

        private ConstructorInfo _baseDefaultCtor;

        public void SetBaseConstructor(ConstructorInfo baseCtor)
        {
            _baseDefaultCtor = baseCtor;
        }

        private void EmitConstructor(ConstructorDeclaration decl, Type baseType)
        {
            var paramTypes = new List<Type>();
            var paramNames = new List<string>();
            foreach (var p in decl.Parameters)
            {
                paramTypes.Add(_asmEmitter.ResolveType(p.TypeName) ?? typeof(object));
                paramNames.Add(p.Name);
            }

            var access = decl.Access == "private" ? MethodAttributes.Private : MethodAttributes.Public;
            var ctor = TypeBuilder.DefineConstructor(access, CallingConventions.Standard, paramTypes.ToArray());
            for (int i = 0; i < paramNames.Count; i++)
                ctor.DefineParameter(i + 1, ParameterAttributes.None, paramNames[i]);

            var il = ctor.GetILGenerator();
            il.Emit(OpCodes.Ldarg_0);
            // Use pre-resolved base constructor or fallback to Object
            var baseCtor2 = _baseDefaultCtor ?? typeof(object).GetConstructor(Type.EmptyTypes);
            il.Emit(OpCodes.Call, baseCtor2);

            var paramIndex = new Dictionary<string, int>();
            for (int i = 0; i < paramNames.Count; i++)
                paramIndex[paramNames[i]] = i + 1;

            var bodyEmitter = new ConstructorBodyEmitter(il, paramIndex, _diag, this, decl.Parameters);
            foreach (var stmt in decl.Body)
                bodyEmitter.EmitStatement(stmt);

            il.Emit(OpCodes.Ret);
        }

        private void EmitProperty(PropertyDeclaration prop)
        {
            var propType = _asmEmitter.ResolveType(prop.TypeName) ?? typeof(object);
            var pb = TypeBuilder.DefineProperty(prop.Name, PropertyAttributes.None, propType, null);

            if (prop.GetterBody != null)
            {
                var getter = TypeBuilder.DefineMethod("get_" + prop.Name,
                    MethodAttributes.Public | MethodAttributes.SpecialName | MethodAttributes.HideBySig,
                    propType, Type.EmptyTypes);
                var il = getter.GetILGenerator();
                var emitter = new ConstructorBodyEmitter(il, new Dictionary<string, int>(), _diag, this, new List<ParameterDeclaration>());
                foreach (var stmt in prop.GetterBody) emitter.EmitStatement(stmt);
                if (propType == typeof(int) || propType == typeof(bool)) il.Emit(OpCodes.Ldc_I4_0);
                else if (propType == typeof(string)) il.Emit(OpCodes.Ldstr, "");
                else il.Emit(OpCodes.Ldnull);
                il.Emit(OpCodes.Ret);
                pb.SetGetMethod(getter);
            }

            if (prop.SetterBody != null)
            {
                var setter = TypeBuilder.DefineMethod("set_" + prop.Name,
                    MethodAttributes.Public | MethodAttributes.SpecialName | MethodAttributes.HideBySig,
                    null, new[] { propType });
                setter.DefineParameter(1, ParameterAttributes.None, "value");
                var il = setter.GetILGenerator();
                var paramIdx = new Dictionary<string, int> { { "value", 1 } };
                var emitter = new ConstructorBodyEmitter(il, paramIdx, _diag, this, new List<ParameterDeclaration>());
                foreach (var stmt in prop.SetterBody) emitter.EmitStatement(stmt);
                il.Emit(OpCodes.Ret);
                pb.SetSetMethod(setter);
            }
        }
    }

    internal class ConstructorBodyEmitter
    {
        private readonly ILGenerator _il;
        private readonly Dictionary<string, int> _paramIndex;
        private readonly DiagnosticBag _diag;
        private readonly TypeEmitter _te;
        private readonly Dictionary<string, LocalBuilder> _locals = new Dictionary<string, LocalBuilder>();
        private readonly List<ParameterDeclaration> _params;

        public ConstructorBodyEmitter(ILGenerator il, Dictionary<string, int> pi, DiagnosticBag diag, TypeEmitter te, List<ParameterDeclaration> parms)
        { _il = il; _paramIndex = pi; _diag = diag; _te = te; _params = parms; }

        public void EmitStatement(Statement stmt)
        {
            if (stmt is ReturnStatement ret) { if (ret.Value != null) EmitExpr(ret.Value); _il.Emit(OpCodes.Ret); }
            else if (stmt is AssignmentStatement a)
            {
                var fb = _te.ResolveField(a.VariableName);
                if (fb != null)
                { _il.Emit(OpCodes.Ldarg_0); EmitExpr(a.Value); _il.Emit(OpCodes.Stfld, fb); }
                else if (_locals.TryGetValue(a.VariableName, out var loc))
                { EmitExpr(a.Value); _il.Emit(OpCodes.Stloc, loc); }
                else { var vt = Infer(a.Value); var nl = _il.DeclareLocal(vt); _locals[a.VariableName] = nl; EmitExpr(a.Value); _il.Emit(OpCodes.Stloc, nl); }
            }
            else if (stmt is LocalVarDeclaration d)
            {
                var vt = d.TypeName != null ? (AssemblyEmitter.ResolveTypeStatic(d.TypeName) ?? typeof(int)) : typeof(int);
                var loc = _il.DeclareLocal(vt); _locals[d.Name] = loc;
                if (d.Initializer != null) { EmitExpr(d.Initializer); _il.Emit(OpCodes.Stloc, loc); }
            }
        }

        public void EmitExpr(Expression e)
        {
            if (e is IntLiteralExpr i) _il.Emit(OpCodes.Ldc_I4, i.Value);
            else if (e is StringLiteralExpr s) _il.Emit(OpCodes.Ldstr, s.Value);
            else if (e is BoolLiteralExpr b) _il.Emit(b.Value ? OpCodes.Ldc_I4_1 : OpCodes.Ldc_I4_0);
            else if (e is IdentifierExpr id)
            {
                if (_locals.TryGetValue(id.Name, out var loc)) _il.Emit(OpCodes.Ldloc, loc);
                else if (_paramIndex.TryGetValue(id.Name, out int idx)) _il.Emit(OpCodes.Ldarg, idx);
                else if (_te.ResolveField(id.Name) != null) { _il.Emit(OpCodes.Ldarg_0); _il.Emit(OpCodes.Ldfld, _te.ResolveField(id.Name)); }
                else _il.Emit(OpCodes.Ldc_I4_0);
            }
            else if (e is BinaryExpr bin)
            {
                EmitExpr(bin.Left); EmitExpr(bin.Right);
                if (bin.Operator == "+" && (Infer(bin.Left) == typeof(string) || Infer(bin.Right) == typeof(string)))
                    _il.Emit(OpCodes.Call, typeof(string).GetMethod("Concat", new[] { typeof(string), typeof(string) }));
                else switch (bin.Operator) { case "+": _il.Emit(OpCodes.Add); break; case "-": _il.Emit(OpCodes.Sub); break;
                    case "*": _il.Emit(OpCodes.Mul); break; case "/": _il.Emit(OpCodes.Div); break; }
            }
            else if (e is ThisExpr) _il.Emit(OpCodes.Ldarg_0);
        }

        private Type Infer(Expression e)
        {
            if (e is StringLiteralExpr) return typeof(string);
            if (e is IntLiteralExpr) return typeof(int);
            if (e is BoolLiteralExpr) return typeof(bool);
            if (e is IdentifierExpr id && _te.Fields.TryGetValue(id.Name, out var fb)) return fb.FieldType;
            return typeof(int);
        }
    }
}
