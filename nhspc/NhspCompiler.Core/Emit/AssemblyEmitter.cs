using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using NhspCompiler.Core.Parsing.Ast;
using NhspCompiler.Core.Diagnostics;
using NhspCompiler.Core.Lexing;

namespace NhspCompiler.Core.Emit
{
    public partial class AssemblyEmitter
    {
        private readonly CompilationUnit _unit;
        private readonly DiagnosticBag _diag;
        private readonly string _outputPath;
        private readonly string _sourceFile;

        public System.Diagnostics.SymbolStore.ISymbolDocumentWriter DebugDocument { get; private set; }

        public Dictionary<string, TypeBuilder> TypeRegistry { get; } = new Dictionary<string, TypeBuilder>();
        public Dictionary<string, TypeEmitter> EmitterRegistry { get; } = new Dictionary<string, TypeEmitter>();

        private readonly bool _emitDebug;

        public AssemblyEmitter(CompilationUnit unit, DiagnosticBag diag, string outputPath, string sourceFile = null, bool emitDebug = false)
        {
            _unit = unit;
            _diag = diag;
            _outputPath = outputPath;
            _sourceFile = sourceFile;
            _emitDebug = emitDebug;
        }

        public bool Emit()
        {
            try
            {
                string asmName = _unit.AssemblyName;
                string fileName = System.IO.Path.GetFileName(_outputPath);

                var asmBuilder = AppDomain.CurrentDomain.DefineDynamicAssembly(
                    new AssemblyName(asmName),
                    AssemblyBuilderAccess.RunAndSave,
                    System.IO.Path.GetDirectoryName(System.IO.Path.GetFullPath(_outputPath)));

                var modBuilder = asmBuilder.DefineDynamicModule(asmName, fileName, _emitDebug);

                // Debug info (PDB)
                if (_emitDebug)
                {
                    System.Diagnostics.SymbolStore.ISymbolDocumentWriter debugDoc = null;
                    if (!string.IsNullOrEmpty(_sourceFile) && _sourceFile != "<string>")
                    {
                        string fullSourcePath = System.IO.Path.GetFullPath(_sourceFile);
                        debugDoc = modBuilder.DefineDocument(
                            fullSourcePath,
                            System.Diagnostics.SymbolStore.SymDocumentType.Text,
                            Guid.Empty, Guid.Empty);
                    }
                    DebugDocument = debugDoc;

                    var debugAttrCtor = typeof(System.Diagnostics.DebuggableAttribute).GetConstructor(
                        new[] { typeof(System.Diagnostics.DebuggableAttribute.DebuggingModes) });
                    asmBuilder.SetCustomAttribute(new CustomAttributeBuilder(debugAttrCtor,
                        new object[] {
                            System.Diagnostics.DebuggableAttribute.DebuggingModes.Default |
                            System.Diagnostics.DebuggableAttribute.DebuggingModes.DisableOptimizations }));
                }

                // Pass 1: Define all types (interfaces first, then classes)
                var interfaceEmitters = new List<TypeEmitter>();
                var classEmitters = new List<TypeEmitter>();

                // Interfaces
                foreach (var iface in _unit.Interfaces)
                {
                    var te = new TypeEmitter(iface, modBuilder, _diag, this, isInterface: true);
                    te.DefineType();
                    interfaceEmitters.Add(te);
                }

                // Classes
                foreach (var cls in _unit.Classes)
                {
                    var te = new TypeEmitter(cls, modBuilder, _diag, this, isInterface: false);
                    te.DefineType();
                    classEmitters.Add(te);
                }

                // Link parent emitters for inheritance
                var emitterMap = new Dictionary<string, TypeEmitter>();
                foreach (var te in classEmitters)
                    emitterMap[te.TypeBuilder.Name] = te;
                foreach (var te in classEmitters)
                {
                    var baseName = te.TypeBuilder.BaseType?.Name;
                    if (baseName != null && emitterMap.TryGetValue(baseName, out var parentTE))
                        te.ParentEmitter = parentTE;
                }

                // Pass 2: Emit members (interfaces first)
                foreach (var te in interfaceEmitters)
                    te.EmitMembers();
                foreach (var te in classEmitters)
                    te.EmitMembers();

                // Pass 3: CreateType (interfaces first, then classes in dependency order)
                foreach (var te in interfaceEmitters)
                    te.FinalizeType();

                // Sort classes: base classes before derived classes
                var finalized = new HashSet<string>();
                var remaining = new List<TypeEmitter>(classEmitters);
                int maxIter = remaining.Count * remaining.Count + 1;
                while (remaining.Count > 0 && maxIter-- > 0)
                {
                    for (int i = remaining.Count - 1; i >= 0; i--)
                    {
                        var te = remaining[i];
                        var baseName = te.TypeBuilder.BaseType?.Name;
                        // Can finalize if base is not a local type, or if it's already finalized
                        if (baseName == null || baseName == "Object" ||
                            !TypeRegistry.ContainsKey(baseName) || finalized.Contains(baseName))
                        {
                            te.FinalizeType();
                            finalized.Add(te.TypeBuilder.Name);
                            remaining.RemoveAt(i);
                        }
                    }
                }
                foreach (var te in remaining)
                    te.FinalizeType(); // fallback

                // Entry point (#main block → static void Main)
                if (_unit.MainBody != null)
                {
                    var mainType = modBuilder.DefineType("__Program",
                        TypeAttributes.Class | TypeAttributes.Public, typeof(object));
                    var mainMethod = mainType.DefineMethod("Main",
                        MethodAttributes.Public | MethodAttributes.Static | MethodAttributes.HideBySig,
                        typeof(void), Type.EmptyTypes);

                    // Create a minimal MethodEmitter-like IL generator for Main body
                    var il = mainMethod.GetILGenerator();
                    var mainEmitter = new MainBodyEmitter(il, _diag, this);
                    foreach (var stmt in _unit.MainBody)
                        mainEmitter.EmitStatement(stmt);
                    il.Emit(OpCodes.Ret);

                    mainType.CreateType();
                    asmBuilder.SetEntryPoint(mainMethod);
                }

                asmBuilder.Save(fileName);
                return !_diag.HasErrors;
            }
            catch (Exception ex)
            {
                _diag.Error(0, 0, $"Emit failed: {ex.Message}\n{ex.StackTrace}");
                return false;
            }
        }

        public Type ResolveType(string typeName)
        {
            // Check local type registry first
            if (TypeRegistry.TryGetValue(typeName, out var tb))
                return tb;

            // Resolve nhsp type aliases
            if (Keywords.TypeAliases.TryGetValue(typeName, out string dotnetName))
                return Type.GetType(dotnetName);

            // Try direct .NET type name
            var t = Type.GetType(typeName);
            if (t != null) return t;

            // Search loaded assemblies
            foreach (var asm in AppDomain.CurrentDomain.GetAssemblies())
            {
                t = asm.GetType(typeName, false);
                if (t != null) return t;
            }
            return null;
        }

    }

    // IL emitter for #main body (no class context)
    internal class MainBodyEmitter
    {
        private readonly ILGenerator _il;
        private readonly DiagnosticBag _diag;
        private readonly AssemblyEmitter _asm;
        private readonly Dictionary<string, LocalBuilder> _locals = new Dictionary<string, LocalBuilder>();

        public MainBodyEmitter(ILGenerator il, DiagnosticBag diag, AssemblyEmitter asm)
        { _il = il; _diag = diag; _asm = asm; }

        public void EmitStatement(Parsing.Ast.Statement stmt)
        {
            if (stmt is Parsing.Ast.LocalVarDeclaration decl)
            {
                Type vt = typeof(int);
                if (decl.TypeName != null) vt = _asm.ResolveType(decl.TypeName) ?? typeof(int);
                if (decl.Initializer is Parsing.Ast.NewObjectExpr newObj)
                    vt = _asm.ResolveType(newObj.TypeName) ?? typeof(object);

                if (decl.ArraySize > 0)
                {
                    vt = vt.MakeArrayType();
                    var loc = _il.DeclareLocal(vt);
                    _locals[decl.Name] = loc;
                    _il.Emit(OpCodes.Ldc_I4, decl.ArraySize);
                    _il.Emit(OpCodes.Newarr, vt.GetElementType());
                    _il.Emit(OpCodes.Stloc, loc);
                    return;
                }

                var local = _il.DeclareLocal(vt);
                _locals[decl.Name] = local;
                if (decl.Initializer != null) { EmitExpr(decl.Initializer); _il.Emit(OpCodes.Stloc, local); }
            }
            else if (stmt is Parsing.Ast.AssignmentStatement assign)
            {
                if (_locals.TryGetValue(assign.VariableName, out var loc))
                {
                    if (assign.Operator != "=") { _il.Emit(OpCodes.Ldloc, loc); EmitExpr(assign.Value); EmitOp(assign.Operator); }
                    else EmitExpr(assign.Value);
                    _il.Emit(OpCodes.Stloc, loc);
                }
                else
                {
                    var vt = InferType(assign.Value);
                    var nl = _il.DeclareLocal(vt);
                    _locals[assign.VariableName] = nl;
                    EmitExpr(assign.Value);
                    _il.Emit(OpCodes.Stloc, nl);
                }
            }
            else if (stmt is Parsing.Ast.ExpressionStatement es)
            {
                EmitExpr(es.Expr);
                _il.Emit(OpCodes.Pop);
            }
            else if (stmt is Parsing.Ast.ReturnStatement) { _il.Emit(OpCodes.Ret); }
        }

        public void EmitExpr(Parsing.Ast.Expression e)
        {
            if (e is Parsing.Ast.IntLiteralExpr i) _il.Emit(OpCodes.Ldc_I4, i.Value);
            else if (e is Parsing.Ast.StringLiteralExpr s) _il.Emit(OpCodes.Ldstr, s.Value);
            else if (e is Parsing.Ast.BoolLiteralExpr b) _il.Emit(b.Value ? OpCodes.Ldc_I4_1 : OpCodes.Ldc_I4_0);
            else if (e is Parsing.Ast.IdentifierExpr id)
            {
                if (_locals.TryGetValue(id.Name, out var loc)) _il.Emit(OpCodes.Ldloc, loc);
                else _il.Emit(OpCodes.Ldc_I4_0);
            }
            else if (e is Parsing.Ast.NewObjectExpr newObj)
            {
                var type = _asm.ResolveType(newObj.TypeName);
                if (type != null)
                {
                    var argTypes = new Type[newObj.Arguments.Count];
                    for (int j = 0; j < newObj.Arguments.Count; j++)
                    { EmitExpr(newObj.Arguments[j]); argTypes[j] = InferType(newObj.Arguments[j]); }
                    var ctor = type.GetConstructor(argTypes) ?? type.GetConstructor(Type.EmptyTypes);
                    if (ctor != null) _il.Emit(OpCodes.Newobj, ctor);
                    else _il.Emit(OpCodes.Ldnull);
                }
                else _il.Emit(OpCodes.Ldnull);
            }
            else if (e is Parsing.Ast.CallExpr call)
            {
                if (call.Target != null)
                {
                    EmitExpr(call.Target);
                    foreach (var a in call.Arguments) EmitExpr(a);
                    var targetType = InferType(call.Target);
                    var mi = targetType?.GetMethod(call.MethodName);
                    if (mi != null) _il.Emit(OpCodes.Callvirt, mi);
                }
                else if (call.MethodName == "str" && call.Arguments.Count > 0)
                {
                    EmitExpr(call.Arguments[0]);
                    var et = InferType(call.Arguments[0]);
                    if (et.IsValueType) _il.Emit(OpCodes.Box, et);
                    _il.Emit(OpCodes.Callvirt, typeof(object).GetMethod("ToString", Type.EmptyTypes));
                }
            }
            else if (e is Parsing.Ast.BinaryExpr bin)
            {
                bool isStr = InferType(bin.Left) == typeof(string) || InferType(bin.Right) == typeof(string);
                EmitExpr(bin.Left);
                EmitExpr(bin.Right);
                if (bin.Operator == "+" && isStr)
                    _il.Emit(OpCodes.Call, typeof(string).GetMethod("Concat", new[] { typeof(string), typeof(string) }));
                else EmitBinOp(bin.Operator);
            }
            else if (e is Parsing.Ast.MemberAccessExpr mem)
            {
                EmitExpr(mem.Target);
                var tt = InferType(mem.Target);
                if (tt != null)
                {
                    var pi = tt.GetProperty(mem.MemberName);
                    if (pi != null) _il.Emit(OpCodes.Callvirt, pi.GetGetMethod());
                    else { var fi = tt.GetField(mem.MemberName); if (fi != null) _il.Emit(OpCodes.Ldfld, fi); }
                }
            }
        }

        private void EmitOp(string op)
        { switch (op) { case "+=": _il.Emit(OpCodes.Add); break; case "-=": _il.Emit(OpCodes.Sub); break; case "*=": _il.Emit(OpCodes.Mul); break; case "/=": _il.Emit(OpCodes.Div); break; } }

        private void EmitBinOp(string op)
        {
            switch (op)
            { case "+": _il.Emit(OpCodes.Add); break; case "-": _il.Emit(OpCodes.Sub); break;
              case "*": _il.Emit(OpCodes.Mul); break; case "/": _il.Emit(OpCodes.Div); break;
              case "==": _il.Emit(OpCodes.Ceq); break; case "<": _il.Emit(OpCodes.Clt); break;
              case ">": _il.Emit(OpCodes.Cgt); break; }
        }

        private Type InferType(Parsing.Ast.Expression e)
        {
            if (e is Parsing.Ast.StringLiteralExpr) return typeof(string);
            if (e is Parsing.Ast.IntLiteralExpr) return typeof(int);
            if (e is Parsing.Ast.BoolLiteralExpr) return typeof(bool);
            if (e is Parsing.Ast.IdentifierExpr id && _locals.TryGetValue(id.Name, out var loc)) return loc.LocalType;
            if (e is Parsing.Ast.NewObjectExpr n) return _asm.ResolveType(n.TypeName) ?? typeof(object);
            if (e is Parsing.Ast.CallExpr c && c.Target != null)
            {
                var tt = InferType(c.Target);
                var mi = tt?.GetMethod(c.MethodName);
                if (mi != null) return mi.ReturnType;
            }
            if (e is Parsing.Ast.MemberAccessExpr m)
            {
                var tt = InferType(m.Target);
                var pi = tt?.GetProperty(m.MemberName);
                if (pi != null) return pi.PropertyType;
                var fi = tt?.GetField(m.MemberName);
                if (fi != null) return fi.FieldType;
            }
            return typeof(int);
        }
    }

    public partial class AssemblyEmitter
    {
        // Static version for backward compatibility
        public static Type ResolveTypeStatic(string typeName)
        {
            if (Keywords.TypeAliases.TryGetValue(typeName, out string dotnetName))
                return Type.GetType(dotnetName);
            var t = Type.GetType(typeName);
            if (t != null) return t;
            foreach (var asm in AppDomain.CurrentDomain.GetAssemblies())
            {
                t = asm.GetType(typeName, false);
                if (t != null) return t;
            }
            return null;
        }
    }
}
