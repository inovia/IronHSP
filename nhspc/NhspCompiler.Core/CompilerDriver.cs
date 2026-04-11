using System.IO;
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

    public class CompilerDriver
    {
        public CompilationResult Compile(string sourcePath, string outputPath = null)
        {
            var diag = new DiagnosticBag();

            if (!File.Exists(sourcePath))
            {
                diag.Error(0, 0, $"Source file not found: {sourcePath}");
                return new CompilationResult { Success = false, Diagnostics = diag };
            }

            string source = File.ReadAllText(sourcePath);
            return CompileSource(source, sourcePath, outputPath, diag);
        }

        public CompilationResult CompileFromString(string source, string outputPath)
        {
            var diag = new DiagnosticBag();
            return CompileSource(source, "<string>", outputPath, diag);
        }

        private CompilationResult CompileSource(string source, string fileName, string outputPath, DiagnosticBag diag)
        {
            // Lexer
            var lexer = new Lexer(source, fileName);
            var tokens = lexer.Tokenize();

            // Parser
            var parser = new Parser(tokens, diag);
            var unit = parser.ParseCompilationUnit();
            if (diag.HasErrors)
            {
                return new CompilationResult { Success = false, Diagnostics = diag };
            }

            // Output path
            if (string.IsNullOrEmpty(outputPath))
            {
                string ext = unit.OutputType == "exe" ? ".exe" : ".dll";
                outputPath = Path.Combine(
                    Path.GetDirectoryName(Path.GetFullPath(fileName)) ?? ".",
                    unit.AssemblyName + ext);
            }

            // Emit
            var emitter = new AssemblyEmitter(unit, diag, outputPath);
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
