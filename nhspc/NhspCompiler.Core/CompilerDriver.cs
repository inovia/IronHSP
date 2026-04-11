using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core.Lexing;
using NhspCompiler.Core.Parsing;
using NhspCompiler.Core.Emit;
using NhspCompiler.Core.Diagnostics;

namespace NhspCompiler.Core
{
    public class CompilationResult
    {
        public bool Success { get; set; }
        public DiagnosticBag Diagnostics { get; set; }
        public string OutputPath { get; set; }
    }

    public class CompilerOptions
    {
        public bool EmitDebugInfo { get; set; } = false;
    }

    public class CompilerDriver
    {
        public CompilerOptions Options { get; set; } = new CompilerOptions();

        public CompilationResult Compile(string sourcePath, string outputPath = null)
        {
            var diag = new DiagnosticBag();
            if (!File.Exists(sourcePath))
            {
                diag.Error(0, 0, $"Source file not found: {sourcePath}");
                return new CompilationResult { Success = false, Diagnostics = diag };
            }
            return CompileSource(File.ReadAllText(sourcePath), sourcePath, outputPath, diag);
        }

        public CompilationResult CompileFromString(string source, string outputPath)
        {
            return CompileSource(source, "<string>", outputPath, new DiagnosticBag());
        }

        private CompilationResult CompileSource(string source, string fileName, string outputPath, DiagnosticBag diag)
        {
            var lexer = new Lexer(source, fileName);
            var tokens = lexer.Tokenize();
            var parser = new Parser(tokens, diag);
            var unit = parser.ParseCompilationUnit();
            if (diag.HasErrors)
                return new CompilationResult { Success = false, Diagnostics = diag };

            // Load referenced assemblies
            foreach (var refPath in unit.References)
            {
                try
                {
                    string fullPath = refPath;
                    if (!File.Exists(fullPath))
                    {
                        // Search in .NET Framework directory
                        string fwDir = System.Runtime.InteropServices.RuntimeEnvironment.GetRuntimeDirectory();
                        fullPath = Path.Combine(fwDir, refPath);
                    }
                    if (File.Exists(fullPath))
                        Assembly.LoadFrom(fullPath);
                    else
                        diag.Warning(0, 0, $"Reference not found: {refPath}");
                }
                catch (Exception ex)
                {
                    diag.Warning(0, 0, $"Failed to load reference {refPath}: {ex.Message}");
                }
            }

            if (string.IsNullOrEmpty(outputPath))
            {
                string ext = unit.OutputType == "exe" ? ".exe" : ".dll";
                outputPath = Path.Combine(
                    Path.GetDirectoryName(Path.GetFullPath(fileName)) ?? ".",
                    unit.AssemblyName + ext);
            }

            var emitter = new AssemblyEmitter(unit, diag, outputPath, fileName, Options.EmitDebugInfo);
            bool ok = emitter.Emit();

            return new CompilationResult
            {
                Success = ok && !diag.HasErrors,
                Diagnostics = diag,
                OutputPath = outputPath
            };
        }
    }
}
