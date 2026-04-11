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
                Console.WriteLine("nhspc - Net HSP Compiler");
                Console.WriteLine("Usage: nhspc <input.nhsp> [-o <output>] [-debug]");
                Console.WriteLine("Options:");
                Console.WriteLine("  -o <file>   Output file path");
                Console.WriteLine("  -debug      Emit debug info (PDB)");
                return 1;
            }

            string inputPath = null;
            string outputPath = null;
            bool debug = false;

            for (int i = 0; i < args.Length; i++)
            {
                if (args[i] == "-o" && i + 1 < args.Length)
                    outputPath = args[++i];
                else if (args[i] == "-debug")
                    debug = true;
                else if (!args[i].StartsWith("-"))
                    inputPath = args[i];
            }

            if (inputPath == null)
            {
                Console.Error.WriteLine("Error: No input file specified.");
                return 1;
            }

            var driver = new CompilerDriver();
            driver.Options.EmitDebugInfo = debug;
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
                if (debug) Console.WriteLine("Debug info: enabled (PDB generated)");
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
