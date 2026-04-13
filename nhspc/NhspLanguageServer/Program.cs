using System;
using System.IO;
using System.Text;

namespace NhspLanguageServer
{
    // nhspls — minimal LSP server for NHSP.
    //
    // Phase C-1 scope: diagnostics only (real-time syntax error squiggles).
    // Future phases: completion, hover, go-to-definition.
    //
    // Wire format: JSON-RPC 2.0 over stdio with HTTP-style headers
    // (Content-Length: N\r\n\r\n<utf-8 json>).
    static class Program
    {
        static int Main(string[] args)
        {
            // Force binary stdio so JSON byte counts stay accurate.
            // (Default text streams may translate newlines on Windows.)
            using (var stdin  = Console.OpenStandardInput())
            using (var stdout = Console.OpenStandardOutput())
            {
                try
                {
                    var server = new LspServer(stdin, stdout);
                    server.Run();
                    return 0;
                }
                catch (Exception ex)
                {
                    // Last-ditch crash log to stderr — VS Code surfaces this in the LSP output.
                    Console.Error.WriteLine("nhspls fatal: " + ex);
                    return 1;
                }
            }
        }
    }
}
