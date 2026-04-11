using System;
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

                foreach (var cls in _unit.Classes)
                {
                    var typeEmitter = new TypeEmitter(cls, modBuilder, _diag);
                    typeEmitter.Emit();
                }

                asmBuilder.Save(fileName);
                return !_diag.HasErrors;
            }
            catch (Exception ex)
            {
                _diag.Error(0, 0, $"Emit failed: {ex.Message}");
                return false;
            }
        }

        public static Type ResolveType(string typeName)
        {
            // Resolve nhsp type aliases
            if (Keywords.TypeAliases.TryGetValue(typeName, out string dotnetName))
            {
                return Type.GetType(dotnetName);
            }
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
}
