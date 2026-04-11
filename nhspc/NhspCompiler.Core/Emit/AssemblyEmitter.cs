using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using NhspCompiler.Core.Parsing.Ast;
using NhspCompiler.Core.Diagnostics;
using NhspCompiler.Core.Lexing;

namespace NhspCompiler.Core.Emit
{
    public class AssemblyEmitter
    {
        private readonly CompilationUnit _unit;
        private readonly DiagnosticBag _diag;
        private readonly string _outputPath;

        // Type registry: maps type name to TypeBuilder (for cross-class references)
        public Dictionary<string, TypeBuilder> TypeRegistry { get; } = new Dictionary<string, TypeBuilder>();

        public AssemblyEmitter(CompilationUnit unit, DiagnosticBag diag, string outputPath)
        {
            _unit = unit;
            _diag = diag;
            _outputPath = outputPath;
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

                var modBuilder = asmBuilder.DefineDynamicModule(asmName, fileName);

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

                asmBuilder.Save(fileName);
                return !_diag.HasErrors;
            }
            catch (Exception ex)
            {
                _diag.Error(0, 0, $"Emit failed: {ex.Message}");
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
