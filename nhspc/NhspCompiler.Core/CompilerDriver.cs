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
            // Preprocess #include directives (only for real files, not in-memory strings)
            if (fileName != "<string>" && source.Contains("#include"))
                source = PreprocessIncludes(source, fileName);

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
        private string PreprocessIncludes(string source, string fileName)
        {
            var sb = new System.Text.StringBuilder();
            string baseDir = Path.GetDirectoryName(Path.GetFullPath(fileName)) ?? ".";
            foreach (var line in source.Split('\n'))
            {
                var trimmed = line.Trim();
                if (trimmed.StartsWith("#include"))
                {
                    // Extract filename from #include "file.nhsp"
                    int q1 = trimmed.IndexOf('"');
                    int q2 = trimmed.LastIndexOf('"');
                    if (q1 >= 0 && q2 > q1)
                    {
                        string incFile = trimmed.Substring(q1 + 1, q2 - q1 - 1);
                        string incPath = Path.Combine(baseDir, incFile);
                        if (File.Exists(incPath))
                        {
                            sb.AppendLine(File.ReadAllText(incPath));
                            continue;
                        }
                    }
                }
                sb.AppendLine(line);
            }
            return sb.ToString();
        }
    }
}
