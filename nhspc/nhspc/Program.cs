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
                Console.WriteLine("Usage: nhspc <input.nhsp> [options]");
                Console.WriteLine("Options:");
                Console.WriteLine("  -o <file>          Output file path");
                Console.WriteLine("  -debug             Emit debug info (PDB)");
                Console.WriteLine("  -platform <plat>   Target platform: anycpu (default), x86, x64, anycpu32");
                Console.WriteLine("  -target <kind>     Output kind: dll | exe (overrides #main auto-detect)");
                Console.WriteLine("  -subsystem <sub>   Subsystem for EXE: console (default) | windows");
                Console.WriteLine("  -r <assembly>      Add reference assembly (repeatable)");
                Console.WriteLine("  -win32icon <ico>   Embed a .ico file as the application icon");
                Console.WriteLine("  -xmldoc [path]     Emit .NET XML documentation file next to the output");
                Console.WriteLine("                     (path optional; defaults to <output>.xml)");
                return 1;
            }

            string inputPath = null;
            string outputPath = null;
            bool debug = false;
            TargetPlatform platform = TargetPlatform.AnyCpu;
            string forceTarget = null;
            SubsystemKind subsystem = SubsystemKind.Default;
            var extraRefs = new System.Collections.Generic.List<string>();
            string win32Icon = null;
            string xmlDocPath = null; // null = no XML, "" = default path, non-empty = explicit

            for (int i = 0; i < args.Length; i++)
            {
                if (args[i] == "-o" && i + 1 < args.Length)
                    outputPath = args[++i];
                else if (args[i] == "-debug")
                    debug = true;
                else if (args[i] == "-platform" && i + 1 < args.Length)
                {
                    string p = args[++i].ToLowerInvariant();
                    switch (p)
                    {
                        case "anycpu": platform = TargetPlatform.AnyCpu; break;
                        case "x86": platform = TargetPlatform.X86; break;
                        case "x64": platform = TargetPlatform.X64; break;
                        case "anycpu32":
                        case "anycpu32bitpreferred":
                        case "prefer32":
                            platform = TargetPlatform.AnyCpu32BitPreferred; break;
                        default:
                            Console.Error.WriteLine($"Error: Unknown platform '{p}'. Use anycpu | x86 | x64 | anycpu32.");
                            return 1;
                    }
                }
                else if (args[i] == "-target" && i + 1 < args.Length)
                {
                    string t = args[++i].ToLowerInvariant();
                    if (t != "exe" && t != "dll")
                    {
                        Console.Error.WriteLine($"Error: Unknown target '{t}'. Use exe | dll.");
                        return 1;
                    }
                    forceTarget = t;
                }
                else if (args[i] == "-subsystem" && i + 1 < args.Length)
                {
                    string s = args[++i].ToLowerInvariant();
                    switch (s)
                    {
                        case "console": subsystem = SubsystemKind.Console; break;
                        case "windows": subsystem = SubsystemKind.Windows; break;
                        default:
                            Console.Error.WriteLine($"Error: Unknown subsystem '{s}'. Use console | windows.");
                            return 1;
                    }
                }
                else if ((args[i] == "-r" || args[i] == "-reference") && i + 1 < args.Length)
                    extraRefs.Add(args[++i]);
                else if (args[i] == "-win32icon" && i + 1 < args.Length)
                    win32Icon = args[++i];
                else if (args[i] == "-xmldoc")
                {
                    // Optional next arg: explicit path (if not another flag and not the input file).
                    if (i + 1 < args.Length && !args[i + 1].StartsWith("-") &&
                        args[i + 1].EndsWith(".xml", System.StringComparison.OrdinalIgnoreCase))
                        xmlDocPath = args[++i];
                    else
                        xmlDocPath = ""; // empty = derive from output
                }
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
            driver.Options.Platform = platform;
            driver.Options.ForceOutputType = forceTarget;
            driver.Options.Subsystem = subsystem;
            driver.Options.ExtraReferences.AddRange(extraRefs);
            driver.Options.Win32IconPath = win32Icon;
            driver.Options.XmlDocPath = xmlDocPath;
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
                Console.WriteLine($"Platform: {platform}");
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
