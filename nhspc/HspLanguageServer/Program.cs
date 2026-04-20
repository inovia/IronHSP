//
//  hspls.exe — LSP server for HSP3 (.hsp files).
//
//  Delegates parsing to the real `hspcmp64.exe` compiler via its -ll / -lv /
//  -ls flags, which emit `<kind> <name> <line>:<file>` per symbol, plus the
//  standard diagnostic lines (`foo.hsp(N) : error C : message`).
//
//  Transport: JSON-RPC 2.0 over stdio with Content-Length framing (same as
//  the NhspLanguageServer companion for .nhsp files).
//

using System;

namespace HspLanguageServer {
    internal static class Program {
        private static int Main(string[] args) {
            // Use binary stdio so byte counts stay accurate (LSP framing).
            using (var stdin  = Console.OpenStandardInput())
            using (var stdout = Console.OpenStandardOutput()) {
                try {
                    var server = new LspServer(stdin, stdout);
                    server.Run();
                    return 0;
                } catch (Exception ex) {
                    Console.Error.WriteLine("hspls fatal: " + ex);
                    return 1;
                }
            }
        }
    }
}
