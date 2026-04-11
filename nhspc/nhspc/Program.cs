using System;
using NhspCompiler.Core;

namespace nhspc
{
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("nhspc - Net HSP Compiler (Phase 1)");
                Console.WriteLine("Usage: nhspc <input.nhsp> [-o <output>]");
                return 1;
            }

            string inputPath = null;
            string outputPath = null;

            for (int i = 0; i < args.Length; i++)
            {
                if (args[i] == "-o" && i + 1 < args.Length)
                {
                    outputPath = args[++i];
                }
                else if (!args[i].StartsWith("-"))
                {
                    inputPath = args[i];
                }
            }

            if (inputPath == null)
            {
                Console.Error.WriteLine("Error: No input file specified.");
                return 1;
            }

            var driver = new CompilerDriver();
            var result = driver.Compile(inputPath, outputPath);

            foreach (var d in result.Diagnostics.Items)
            {
                var stream = d.Severity == NhspCompiler.Core.Diagnostics.Severity.Error
                    ? Console.Error : Console.Out;
                stream.WriteLine($"{inputPath}{d}");
            }

            if (result.Success)
            {
                Console.WriteLine($"Compiled successfully: {result.OutputPath}");
                return 0;
            }
            else
            {
                Console.Error.WriteLine("Compilation failed.");
                return 1;
            }
        }
    }
}
