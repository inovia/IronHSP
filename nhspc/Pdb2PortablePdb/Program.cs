using System;
using System.IO;
using Microsoft.DiaSymReader.Tools;

namespace Pdb2PortablePdb
{
    /// <summary>
    /// Windows PDB を Portable PDB に変換するツール。
    /// nhspc -debug で生成した PDB を VS Code (coreclr) で使えるようにする。
    /// </summary>
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length < 1)
            {
                Console.WriteLine("Pdb2PortablePdb - Windows PDB to Portable PDB Converter");
                Console.WriteLine("Usage: Pdb2PortablePdb <assembly.exe|dll> [-o output.pdb]");
                Console.WriteLine();
                Console.WriteLine("Converts Windows PDB to Portable PDB for VS Code debugging.");
                Console.WriteLine("If -o is omitted, the original .pdb file is overwritten.");
                return 1;
            }

            string assemblyPath = Path.GetFullPath(args[0]);
            string outputPdb = null;

            for (int i = 1; i < args.Length; i++)
            {
                if (args[i] == "-o" && i + 1 < args.Length)
                    outputPdb = Path.GetFullPath(args[++i]);
            }

            if (!File.Exists(assemblyPath))
            {
                Console.Error.WriteLine("Error: File not found: " + assemblyPath);
                return 1;
            }

            string windowsPdb = Path.ChangeExtension(assemblyPath, ".pdb");
            if (!File.Exists(windowsPdb))
            {
                Console.Error.WriteLine("Error: PDB not found: " + windowsPdb);
                return 1;
            }

            if (outputPdb == null)
                outputPdb = windowsPdb;

            try
            {
                var converter = new PdbConverter();

                using (var peStream = File.OpenRead(assemblyPath))
                using (var pdbStream = File.OpenRead(windowsPdb))
                {
                    string tempFile = outputPdb + ".tmp";
                    using (var outStream = File.Create(tempFile))
                    {
                        converter.ConvertWindowsToPortable(peStream, pdbStream, outStream);
                    }

                    // Replace original
                    if (File.Exists(outputPdb) && outputPdb == windowsPdb)
                        File.Delete(outputPdb);
                    File.Move(tempFile, outputPdb);
                }

                Console.WriteLine("Converted: " + windowsPdb + " -> " + outputPdb + " (Portable PDB)");
                return 0;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Error: " + ex.Message);
                return 1;
            }
        }
    }
}
