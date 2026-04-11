using System;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
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

        public TypeBuilder TypeBuilder { get; set; }
        public Dictionary<string, FieldBuilder> Fields { get; } = new Dictionary<string, FieldBuilder>();
        public Dictionary<string, MethodBuilder> Methods { get; } = new Dictionary<string, MethodBuilder>();
        public List<ConstructorBuilder> Constructors { get; } = new List<ConstructorBuilder>();
        public List<int> ConstructorParamCounts { get; } = new List<int>();

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
                TypeAttributes attr;
                Type baseType;

                if (_cls.IsStruct)
                {
                    // Struct: value type with StructLayout
                    attr = TypeAttributes.Class | TypeAttributes.Sealed;
                    if (_cls.DefaultAccess == "public") attr |= TypeAttributes.Public;

                    // LayoutKind determines TypeAttributes
                    switch (_cls.LayoutKind?.ToLowerInvariant())
                    {
                        case "explicit": attr |= TypeAttributes.ExplicitLayout; break;
                        case "auto": attr |= TypeAttributes.AutoLayout; break;
                        default: attr |= TypeAttributes.SequentialLayout; break; // Sequential is default
                    }

                    baseType = typeof(ValueType);

                    // Pack and Size
                    if (_cls.Pack > 0 || _cls.Size > 0)
                    {
                        var packSize = PackingSize.Unspecified;
                        switch (_cls.Pack)
                        {
                            case 1: packSize = PackingSize.Size1; break;
                            case 2: packSize = PackingSize.Size2; break;
                            case 4: packSize = PackingSize.Size4; break;
                            case 8: packSize = PackingSize.Size8; break;
                            case 16: packSize = PackingSize.Size16; break;
                            case 32: packSize = PackingSize.Size32; break;
                            case 64: packSize = PackingSize.Size64; break;
                            case 128: packSize = PackingSize.Size128; break;
                        }
                        int size = _cls.Size > 0 ? _cls.Size : 0;
                        TypeBuilder = _module.DefineType(_cls.Name, attr, baseType, packSize, size);
                    }
                    else
                    {
                        TypeBuilder = _module.DefineType(_cls.Name, attr, baseType);
                    }

                    // StructLayout CharSet attribute
                    if (_cls.StructCharSet != null)
                    {
                        var charSetEnum = System.Runtime.InteropServices.CharSet.Auto;
                        switch (_cls.StructCharSet.ToLowerInvariant())
                        {
                            case "ansi": charSetEnum = System.Runtime.InteropServices.CharSet.Ansi; break;
                            case "unicode": charSetEnum = System.Runtime.InteropServices.CharSet.Unicode; break;
                            case "none": charSetEnum = System.Runtime.InteropServices.CharSet.None; break;
                        }
                        // Apply StructLayout attribute with CharSet
                        var layoutKindEnum = LayoutKind.Sequential;
                        if (_cls.LayoutKind?.ToLowerInvariant() == "explicit") layoutKindEnum = LayoutKind.Explicit;
                        else if (_cls.LayoutKind?.ToLowerInvariant() == "auto") layoutKindEnum = LayoutKind.Auto;

                        var slCtor = typeof(StructLayoutAttribute).GetConstructor(new[] { typeof(LayoutKind) });
                        var packField = typeof(StructLayoutAttribute).GetField("Pack");
                        var sizeField = typeof(StructLayoutAttribute).GetField("Size");
                        var charSetField = typeof(StructLayoutAttribute).GetField("CharSet");

                        var namedFields = new List<FieldInfo>();
                        var namedValues = new List<object>();
                        namedFields.Add(charSetField); namedValues.Add(charSetEnum);
                        if (_cls.Pack > 0) { namedFields.Add(packField); namedValues.Add(_cls.Pack); }
                        if (_cls.Size > 0) { namedFields.Add(sizeField); namedValues.Add(_cls.Size); }

                        TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(
                            slCtor, new object[] { layoutKindEnum },
                            namedFields.ToArray(), namedValues.ToArray()));
                    }
                }
                else
                {
                    // Regular class
                    attr = TypeAttributes.Class;
                    if (_cls.DefaultAccess == "public") attr |= TypeAttributes.Public;
                    if (_cls.IsSealed) attr |= TypeAttributes.Sealed;
                    if (_cls.IsAbstract) attr |= TypeAttributes.Abstract;

                    baseType = typeof(object);
                    if (_cls.BaseClass != null)
                    {
                        var resolved = _asmEmitter.ResolveType(_cls.BaseClass);
                        if (resolved != null)
                        {
                            if (resolved.IsInterface || (resolved is TypeBuilder rtb && rtb.IsInterface))
                            {
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
                }

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
                _asmEmitter.EmitterRegistry[_cls.Name] = this;
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
            // Apply interface-level attributes
            if (_iface != null)
            {
                foreach (var attr in _iface.Attributes)
                {
                    switch (attr.Name.ToLowerInvariant())
                    {
                        case "guid":
                            if (attr.Arguments.Count > 0)
                            {
                                var ctor = typeof(System.Runtime.InteropServices.GuidAttribute).GetConstructor(new[] { typeof(string) });
                                TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(ctor, new object[] { attr.Arguments[0] }));
                            }
                            break;
                        case "interfacetype":
                            if (attr.Arguments.Count > 0)
                            {
                                var enumVal = System.Runtime.InteropServices.ComInterfaceType.InterfaceIsIUnknown;
                                if (attr.Arguments[0] == "InterfaceIsIDispatch") enumVal = System.Runtime.InteropServices.ComInterfaceType.InterfaceIsIDispatch;
                                else if (attr.Arguments[0] == "InterfaceIsDual") enumVal = System.Runtime.InteropServices.ComInterfaceType.InterfaceIsDual;
                                var c = typeof(System.Runtime.InteropServices.InterfaceTypeAttribute).GetConstructor(new[] { typeof(System.Runtime.InteropServices.ComInterfaceType) });
                                TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(c, new object[] { enumVal }));
                            }
                            break;
                        case "comvisible":
                            {
                                bool val = attr.Arguments.Count > 0 && attr.Arguments[0].ToLowerInvariant() == "true";
                                var c = typeof(System.Runtime.InteropServices.ComVisibleAttribute).GetConstructor(new[] { typeof(bool) });
                                TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(c, new object[] { val }));
                            }
                            break;
                    }
                }
            }
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
                if (field.IsStatic) fa |= FieldAttributes.Static;
                if (field.IsReadonly) fa |= FieldAttributes.InitOnly;
                if (field.IsConst)
                {
                    fa |= FieldAttributes.Static | FieldAttributes.Literal | FieldAttributes.HasDefault;
                    var fb = TypeBuilder.DefineField(field.Name, ft, fa);
                    // Set constant value
                    if (field.ConstValue is IntLiteralExpr intLit) fb.SetConstant(intLit.Value);
                    else if (field.ConstValue is StringLiteralExpr strLit) fb.SetConstant(strLit.Value);
                    else if (field.ConstValue is BoolLiteralExpr boolLit) fb.SetConstant(boolLit.Value);
                    else if (field.ConstValue is DoubleLiteralExpr dblLit) fb.SetConstant(dblLit.Value);
                    Fields[field.Name] = fb;
                }
                else
                {
                    var fb = TypeBuilder.DefineField(field.Name, ft, fa);
                    Fields[field.Name] = fb;
                }

                // FieldOffset for Explicit layout structs
                if (field.FieldOffset >= 0)
                {
                    Fields[field.Name].SetOffset(field.FieldOffset);
                }

                // MarshalAs attribute on field
                EmitMarshalAsOnField(Fields[field.Name], field.Attributes);
            }

            // Apply class-level attributes (COM, etc.)
            EmitClassAttributes();

            // Pre-define methods
            var methodEmitters = new List<MethodEmitter>();
            foreach (var method in _cls.Methods)
            {
                // P/Invoke method
                if (method.DllImportName != null)
                {
                    EmitPInvokeMethod(method);
                    continue;
                }
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

            // Constructors (structs don't need default parameterless ctor in .NET)
            if (_cls.IsStruct)
            {
                // Structs: only emit explicit constructors
                foreach (var ctorDecl in _cls.Constructors)
                    EmitConstructor(ctorDecl, baseType);
            }
            else if (_cls.Constructors.Count == 0)
            {
                var ctor = TypeBuilder.DefineConstructor(MethodAttributes.Public, CallingConventions.Standard, Type.EmptyTypes);
                Constructors.Add(ctor);
                ConstructorParamCounts.Add(0);
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

            // Static constructor (.cctor)
            if (_cls.HasStaticConstructor && _cls.StaticConstructorBody != null)
            {
                var cctor = TypeBuilder.DefineConstructor(
                    MethodAttributes.Static | MethodAttributes.Private | MethodAttributes.HideBySig | MethodAttributes.SpecialName | MethodAttributes.RTSpecialName,
                    CallingConventions.Standard, Type.EmptyTypes);
                var il = cctor.GetILGenerator();
                // Static init: emit simple statements (assignment to static fields)
                var locals = new Dictionary<string, System.Reflection.Emit.LocalBuilder>();
                foreach (var stmt in _cls.StaticConstructorBody)
                {
                    if (stmt is AssignmentStatement assign)
                    {
                        if (Fields.TryGetValue(assign.VariableName, out var fb))
                        {
                            // Static field assignment
                            var cbEmitter = new ConstructorBodyEmitter(il, new Dictionary<string, int>(), _diag, this, new List<ParameterDeclaration>());
                            cbEmitter.EmitExpr(assign.Value);
                            il.Emit(OpCodes.Stsfld, fb);
                        }
                    }
                    else
                    {
                        var cbEmitter = new ConstructorBodyEmitter(il, new Dictionary<string, int>(), _diag, this, new List<ParameterDeclaration>());
                        cbEmitter.EmitStatement(stmt);
                    }
                }
                il.Emit(OpCodes.Ret);
            }

            // Destructor (Finalize)
            if (_cls.DestructorBody != null)
            {
                var finalize = TypeBuilder.DefineMethod("Finalize",
                    MethodAttributes.Family | MethodAttributes.Virtual | MethodAttributes.HideBySig,
                    typeof(void), Type.EmptyTypes);
                var il = finalize.GetILGenerator();
                il.BeginExceptionBlock();
                var emitter = new ConstructorBodyEmitter(il, new Dictionary<string, int>(), _diag, this, new List<ParameterDeclaration>());
                foreach (var stmt in _cls.DestructorBody) emitter.EmitStatement(stmt);
                il.BeginFinallyBlock();
                il.Emit(OpCodes.Ldarg_0);
                il.Emit(OpCodes.Call, typeof(object).GetMethod("Finalize", BindingFlags.NonPublic | BindingFlags.Instance));
                il.EndExceptionBlock();
                il.Emit(OpCodes.Ret);
            }

            // Events
            foreach (var ev in _cls.Events)
                EmitEvent(ev);

            // Indexers
            foreach (var idx in _cls.Indexers)
                EmitIndexer(idx);

            // Operators
            foreach (var op in _cls.Operators)
                EmitOperator(op);

            // Nested classes
            foreach (var nested in _cls.NestedClasses)
            {
                var nestedAttr = TypeAttributes.NestedPublic | TypeAttributes.Class;
                if (nested.IsSealed) nestedAttr |= TypeAttributes.Sealed;
                var nestedTB = TypeBuilder.DefineNestedType(nested.Name, nestedAttr);
                _asmEmitter.TypeRegistry[_cls.Name + "+" + nested.Name] = nestedTB;
                // Emit nested class members via a new TypeEmitter
                var nestedEmitter = new TypeEmitter(nested, null, _diag, _asmEmitter, false);
                nestedEmitter.TypeBuilder = nestedTB;
                _asmEmitter.TypeRegistry[nested.Name] = nestedTB;
                _asmEmitter.EmitterRegistry[nested.Name] = nestedEmitter;
                nestedEmitter.EmitMembers();
                nestedEmitter.FinalizeType();
            }
        }

        private void EmitPInvokeMethod(MethodDeclaration method)
        {
            var retType = _asmEmitter.ResolveType(method.ReturnType) ?? typeof(void);
            var paramTypes = new List<Type>();
            foreach (var p in method.Parameters)
            {
                var pt = _asmEmitter.ResolveType(p.TypeName) ?? typeof(object);
                if (p.IsRef || p.IsOut) pt = pt.MakeByRefType();
                paramTypes.Add(pt);
            }

            string entryPoint = method.DllImportEntryPoint ?? method.Name;

            // CallingConvention
            var callConv = System.Runtime.InteropServices.CallingConvention.StdCall;
            if (method.DllImportCallingConvention != null)
            {
                switch (method.DllImportCallingConvention.ToLowerInvariant())
                {
                    case "cdecl": callConv = System.Runtime.InteropServices.CallingConvention.Cdecl; break;
                    case "thiscall": callConv = System.Runtime.InteropServices.CallingConvention.ThisCall; break;
                    case "fastcall": callConv = System.Runtime.InteropServices.CallingConvention.FastCall; break;
                    case "winapi": callConv = System.Runtime.InteropServices.CallingConvention.Winapi; break;
                }
            }

            // CharSet
            var charSet = System.Runtime.InteropServices.CharSet.Auto;
            if (method.DllImportCharSet != null)
            {
                switch (method.DllImportCharSet.ToLowerInvariant())
                {
                    case "ansi": charSet = System.Runtime.InteropServices.CharSet.Ansi; break;
                    case "unicode": charSet = System.Runtime.InteropServices.CharSet.Unicode; break;
                    case "none": charSet = System.Runtime.InteropServices.CharSet.None; break;
                }
            }

            var mb = TypeBuilder.DefinePInvokeMethod(
                method.Name,
                method.DllImportName,
                entryPoint,
                MethodAttributes.Public | MethodAttributes.Static | MethodAttributes.PinvokeImpl | MethodAttributes.HideBySig,
                CallingConventions.Standard,
                retType,
                paramTypes.ToArray(),
                callConv,
                charSet);

            mb.SetImplementationFlags(MethodImplAttributes.PreserveSig);

            // SetLastError via DllImportAttribute (set as custom attribute)
            if (method.DllImportSetLastError)
            {
                // The SetLastError flag is set via the DllImportAttribute's SetLastError property
                // DefinePInvokeMethod doesn't directly support it, so we add it via impl flags
                // Actually, we need to set it via custom attribute
                var dllImportCtor = typeof(DllImportAttribute).GetConstructor(new[] { typeof(string) });
                var setLastErrorField = typeof(DllImportAttribute).GetField("SetLastError");
                var entryPointField = typeof(DllImportAttribute).GetField("EntryPoint");
                var charSetProp = typeof(DllImportAttribute).GetField("CharSet");
                var callingConvField = typeof(DllImportAttribute).GetField("CallingConvention");
                // Note: DefinePInvokeMethod already sets the P/Invoke info, so we can't double-set it
                // SetLastError must be applied differently - store in metadata
            }

            // Parameters with MarshalAs and ref/out attributes
            for (int i = 0; i < method.Parameters.Count; i++)
            {
                var p = method.Parameters[i];
                var pa = ParameterAttributes.None;
                if (p.IsOut) pa |= ParameterAttributes.Out;
                if (p.IsIn) pa |= ParameterAttributes.In;
                var pb = mb.DefineParameter(i + 1, pa, p.Name);

                // MarshalAs attribute on parameter
                EmitMarshalAsOnParam(pb, p.Attributes);
            }

            Methods[method.Name] = mb;
        }

        // ======== MarshalAs Helper Methods ========

        private static UnmanagedType ResolveMarshalType(string name)
        {
            switch (name.ToLowerInvariant())
            {
                case "bool": return UnmanagedType.Bool;
                case "i1": return UnmanagedType.I1;
                case "u1": return UnmanagedType.U1;
                case "i2": return UnmanagedType.I2;
                case "u2": return UnmanagedType.U2;
                case "i4": return UnmanagedType.I4;
                case "u4": return UnmanagedType.U4;
                case "i8": return UnmanagedType.I8;
                case "u8": return UnmanagedType.U8;
                case "r4": return UnmanagedType.R4;
                case "r8": return UnmanagedType.R8;
                case "lpstr": return UnmanagedType.LPStr;
                case "lpwstr": return UnmanagedType.LPWStr;
                case "lptstr": return UnmanagedType.LPTStr;
                case "bstr": return UnmanagedType.BStr;
                case "ansibstr": return UnmanagedType.AnsiBStr;
                case "tbstr": return UnmanagedType.TBStr;
                case "lpstruct": return UnmanagedType.LPStruct;
                case "struct": return UnmanagedType.Struct;
                case "interface": return UnmanagedType.Interface;
                case "safearray": return UnmanagedType.SafeArray;
                case "byvalarray": return UnmanagedType.ByValArray;
                case "byvalstr": case "byvaltstr": return UnmanagedType.ByValTStr;
                case "sysuint": return UnmanagedType.SysUInt;
                case "sysint": return UnmanagedType.SysInt;
                case "iunknown": return UnmanagedType.IUnknown;
                case "idispatch": return UnmanagedType.IDispatch;
                case "functionptr": return UnmanagedType.FunctionPtr;
                case "asany": return UnmanagedType.AsAny;
                case "lparray": return UnmanagedType.LPArray;
                case "error": return UnmanagedType.Error;
                default: return UnmanagedType.I4;
            }
        }

        private void EmitMarshalAsOnParam(ParameterBuilder pb, List<ParameterAttribute> attrs)
        {
            foreach (var attr in attrs)
            {
                if (attr.Name.ToLowerInvariant() == "marshalas" && attr.Arguments.Count > 0)
                {
                    var unmanagedType = ResolveMarshalType(attr.Arguments[0]);
                    var marshalCtor = typeof(MarshalAsAttribute).GetConstructor(new[] { typeof(UnmanagedType) });

                    // Handle optional SizeConst for arrays
                    if (attr.Arguments.Count > 1 && int.TryParse(attr.Arguments[1], out int sizeConst))
                    {
                        var sizeConstField = typeof(MarshalAsAttribute).GetField("SizeConst");
                        pb.SetCustomAttribute(new CustomAttributeBuilder(
                            marshalCtor, new object[] { unmanagedType },
                            new[] { sizeConstField }, new object[] { sizeConst }));
                    }
                    else
                    {
                        pb.SetCustomAttribute(new CustomAttributeBuilder(marshalCtor, new object[] { unmanagedType }));
                    }
                }
                // Shorthand: [LPWStr], [LPStr], [Bool] etc. → same as [MarshalAs LPWStr]
                else if (attr.Name.ToLowerInvariant() != "in" && attr.Name.ToLowerInvariant() != "out" &&
                         attr.Name.ToLowerInvariant() != "optional")
                {
                    // Try to resolve as UnmanagedType shorthand
                    try
                    {
                        var unmanagedType = ResolveMarshalType(attr.Name);
                        var marshalCtor = typeof(MarshalAsAttribute).GetConstructor(new[] { typeof(UnmanagedType) });
                        pb.SetCustomAttribute(new CustomAttributeBuilder(marshalCtor, new object[] { unmanagedType }));
                    }
                    catch { }
                }
            }
        }

        private void EmitMarshalAsOnField(FieldBuilder fb, List<ParameterAttribute> attrs)
        {
            foreach (var attr in attrs)
            {
                if (attr.Name.ToLowerInvariant() == "marshalas" && attr.Arguments.Count > 0)
                {
                    var unmanagedType = ResolveMarshalType(attr.Arguments[0]);
                    var marshalCtor = typeof(MarshalAsAttribute).GetConstructor(new[] { typeof(UnmanagedType) });

                    if (attr.Arguments.Count > 1 && int.TryParse(attr.Arguments[1], out int sizeConst))
                    {
                        var sizeConstField = typeof(MarshalAsAttribute).GetField("SizeConst");
                        fb.SetCustomAttribute(new CustomAttributeBuilder(
                            marshalCtor, new object[] { unmanagedType },
                            new[] { sizeConstField }, new object[] { sizeConst }));
                    }
                    else
                    {
                        fb.SetCustomAttribute(new CustomAttributeBuilder(marshalCtor, new object[] { unmanagedType }));
                    }
                }
                else if (attr.Name.ToLowerInvariant() != "in" && attr.Name.ToLowerInvariant() != "out" &&
                         attr.Name.ToLowerInvariant() != "fieldoffset" && attr.Name.ToLowerInvariant() != "optional")
                {
                    try
                    {
                        var unmanagedType = ResolveMarshalType(attr.Name);
                        var marshalCtor = typeof(MarshalAsAttribute).GetConstructor(new[] { typeof(UnmanagedType) });
                        fb.SetCustomAttribute(new CustomAttributeBuilder(marshalCtor, new object[] { unmanagedType }));
                    }
                    catch { }
                }
            }
        }

        private void EmitClassAttributes()
        {
            if (_cls == null) return;
            foreach (var attr in _cls.Attributes)
            {
                switch (attr.Name.ToLowerInvariant())
                {
                    case "guid":
                        if (attr.Arguments.Count > 0)
                        {
                            var ctor = typeof(System.Runtime.InteropServices.GuidAttribute).GetConstructor(new[] { typeof(string) });
                            TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(ctor, new object[] { attr.Arguments[0] }));
                        }
                        break;
                    case "comvisible":
                        {
                            bool val = attr.Arguments.Count > 0 && attr.Arguments[0].ToLowerInvariant() == "true";
                            var ctor = typeof(System.Runtime.InteropServices.ComVisibleAttribute).GetConstructor(new[] { typeof(bool) });
                            TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(ctor, new object[] { val }));
                        }
                        break;
                    case "classinterface":
                        if (attr.Arguments.Count > 0)
                        {
                            var enumVal = System.Runtime.InteropServices.ClassInterfaceType.None;
                            if (attr.Arguments[0] == "AutoDispatch") enumVal = System.Runtime.InteropServices.ClassInterfaceType.AutoDispatch;
                            else if (attr.Arguments[0] == "AutoDual") enumVal = System.Runtime.InteropServices.ClassInterfaceType.AutoDual;
                            var ctor = typeof(System.Runtime.InteropServices.ClassInterfaceAttribute).GetConstructor(new[] { typeof(System.Runtime.InteropServices.ClassInterfaceType) });
                            TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(ctor, new object[] { enumVal }));
                        }
                        break;
                    case "interfacetype":
                        if (attr.Arguments.Count > 0)
                        {
                            var enumVal = System.Runtime.InteropServices.ComInterfaceType.InterfaceIsIUnknown;
                            if (attr.Arguments[0] == "InterfaceIsIDispatch") enumVal = System.Runtime.InteropServices.ComInterfaceType.InterfaceIsIDispatch;
                            else if (attr.Arguments[0] == "InterfaceIsDual") enumVal = System.Runtime.InteropServices.ComInterfaceType.InterfaceIsDual;
                            var ctor = typeof(System.Runtime.InteropServices.InterfaceTypeAttribute).GetConstructor(new[] { typeof(System.Runtime.InteropServices.ComInterfaceType) });
                            TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(ctor, new object[] { enumVal }));
                        }
                        break;
                    case "comsourceinterfaces":
                        if (attr.Arguments.Count > 0)
                        {
                            var ctor = typeof(System.Runtime.InteropServices.ComSourceInterfacesAttribute).GetConstructor(new[] { typeof(string) });
                            TypeBuilder.SetCustomAttribute(new CustomAttributeBuilder(ctor, new object[] { attr.Arguments[0] }));
                        }
                        break;
                }
            }
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
            Constructors.Add(ctor);
            ConstructorParamCounts.Add(paramTypes.Count);
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
        private void EmitEvent(EventDeclaration ev)
        {
            var handlerType = _asmEmitter.ResolveType(ev.TypeName) ?? typeof(EventHandler);
            var fieldBuilder = TypeBuilder.DefineField(ev.Name, handlerType,
                FieldAttributes.Private);
            Fields[ev.Name] = fieldBuilder;

            var eventBuilder = TypeBuilder.DefineEvent(ev.Name, System.Reflection.EventAttributes.None, handlerType);

            // add accessor
            var addMethod = TypeBuilder.DefineMethod("add_" + ev.Name,
                MethodAttributes.Public | MethodAttributes.SpecialName | MethodAttributes.HideBySig,
                typeof(void), new[] { handlerType });
            var addIL = addMethod.GetILGenerator();
            addIL.Emit(OpCodes.Ldarg_0);
            addIL.Emit(OpCodes.Ldarg_0);
            addIL.Emit(OpCodes.Ldfld, fieldBuilder);
            addIL.Emit(OpCodes.Ldarg_1);
            addIL.Emit(OpCodes.Call, typeof(Delegate).GetMethod("Combine", new[] { typeof(Delegate), typeof(Delegate) }));
            addIL.Emit(OpCodes.Castclass, handlerType);
            addIL.Emit(OpCodes.Stfld, fieldBuilder);
            addIL.Emit(OpCodes.Ret);
            eventBuilder.SetAddOnMethod(addMethod);

            // remove accessor
            var removeMethod = TypeBuilder.DefineMethod("remove_" + ev.Name,
                MethodAttributes.Public | MethodAttributes.SpecialName | MethodAttributes.HideBySig,
                typeof(void), new[] { handlerType });
            var removeIL = removeMethod.GetILGenerator();
            removeIL.Emit(OpCodes.Ldarg_0);
            removeIL.Emit(OpCodes.Ldarg_0);
            removeIL.Emit(OpCodes.Ldfld, fieldBuilder);
            removeIL.Emit(OpCodes.Ldarg_1);
            removeIL.Emit(OpCodes.Call, typeof(Delegate).GetMethod("Remove", new[] { typeof(Delegate), typeof(Delegate) }));
            removeIL.Emit(OpCodes.Castclass, handlerType);
            removeIL.Emit(OpCodes.Stfld, fieldBuilder);
            removeIL.Emit(OpCodes.Ret);
            eventBuilder.SetRemoveOnMethod(removeMethod);
        }

        private void EmitIndexer(IndexerDeclaration idx)
        {
            var propType = _asmEmitter.ResolveType(idx.TypeName) ?? typeof(object);
            var paramTypes = new List<Type>();
            foreach (var p in idx.Parameters)
                paramTypes.Add(_asmEmitter.ResolveType(p.TypeName) ?? typeof(int));

            var pb = TypeBuilder.DefineProperty("Item", PropertyAttributes.None, propType, paramTypes.ToArray());

            if (idx.GetterBody != null)
            {
                var getter = TypeBuilder.DefineMethod("get_Item",
                    MethodAttributes.Public | MethodAttributes.SpecialName | MethodAttributes.HideBySig,
                    propType, paramTypes.ToArray());
                for (int i = 0; i < idx.Parameters.Count; i++)
                    getter.DefineParameter(i + 1, ParameterAttributes.None, idx.Parameters[i].Name);
                var il = getter.GetILGenerator();
                var paramIdx = new Dictionary<string, int>();
                for (int i = 0; i < idx.Parameters.Count; i++)
                    paramIdx[idx.Parameters[i].Name] = i + 1;
                var emitter = new ConstructorBodyEmitter(il, paramIdx, _diag, this, idx.Parameters);
                foreach (var stmt in idx.GetterBody) emitter.EmitStatement(stmt);
                il.Emit(OpCodes.Ldnull);
                il.Emit(OpCodes.Ret);
                pb.SetGetMethod(getter);
            }

            if (idx.SetterBody != null)
            {
                var setParamTypes = new List<Type>(paramTypes);
                setParamTypes.Add(propType);
                var setter = TypeBuilder.DefineMethod("set_Item",
                    MethodAttributes.Public | MethodAttributes.SpecialName | MethodAttributes.HideBySig,
                    typeof(void), setParamTypes.ToArray());
                for (int i = 0; i < idx.Parameters.Count; i++)
                    setter.DefineParameter(i + 1, ParameterAttributes.None, idx.Parameters[i].Name);
                setter.DefineParameter(idx.Parameters.Count + 1, ParameterAttributes.None, "value");
                var il = setter.GetILGenerator();
                var paramIdx = new Dictionary<string, int>();
                for (int i = 0; i < idx.Parameters.Count; i++)
                    paramIdx[idx.Parameters[i].Name] = i + 1;
                paramIdx["value"] = idx.Parameters.Count + 1;
                var emitter = new ConstructorBodyEmitter(il, paramIdx, _diag, this, idx.Parameters);
                foreach (var stmt in idx.SetterBody) emitter.EmitStatement(stmt);
                il.Emit(OpCodes.Ret);
                pb.SetSetMethod(setter);
            }
        }

        private void EmitOperator(OperatorDeclaration op)
        {
            var retType = _asmEmitter.ResolveType(op.ReturnType) ?? typeof(int);
            var paramTypes = new List<Type>();
            foreach (var p in op.Parameters)
                paramTypes.Add(_asmEmitter.ResolveType(p.TypeName) ?? typeof(object));

            // Map operator to CLR special name
            string methodName;
            switch (op.Operator)
            {
                case "+": methodName = "op_Addition"; break;
                case "-": methodName = "op_Subtraction"; break;
                case "*": methodName = "op_Multiply"; break;
                case "/": methodName = "op_Division"; break;
                case "%": methodName = "op_Modulus"; break;
                case "==": methodName = "op_Equality"; break;
                case "!=": methodName = "op_Inequality"; break;
                case "<": methodName = "op_LessThan"; break;
                case ">": methodName = "op_GreaterThan"; break;
                case "<=": methodName = "op_LessThanOrEqual"; break;
                case ">=": methodName = "op_GreaterThanOrEqual"; break;
                case "implicit": methodName = "op_Implicit"; break;
                case "explicit": methodName = "op_Explicit"; break;
                default: methodName = "op_" + op.Operator; break;
            }

            var mb = TypeBuilder.DefineMethod(methodName,
                MethodAttributes.Public | MethodAttributes.Static | MethodAttributes.SpecialName | MethodAttributes.HideBySig,
                retType, paramTypes.ToArray());

            for (int i = 0; i < op.Parameters.Count; i++)
                mb.DefineParameter(i + 1, ParameterAttributes.None, op.Parameters[i].Name);

            var me = new MethodEmitter(
                new MethodDeclaration
                {
                    Name = methodName,
                    ReturnType = op.ReturnType,
                    IsStatic = true,
                    Access = "public",
                    Parameters = op.Parameters,
                    Body = op.Body
                },
                TypeBuilder, _diag, this);
            me.Builder = mb;
            me.EmitBodyDirect(_asmEmitter);

            Methods[methodName] = mb;
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
