//
//  nhspdap.exe — DAP adapter for HSP3 (hsp3net) runtime.
//
//  Bridges VS Code's Debug Adapter Protocol (JSON-RPC over stdio,
//  Content-Length framed) to hsp3debug_dap.dll's line-delimited JSON
//  over a named pipe \\.\pipe\hsp3dap_<pid>.
//
//  Launch flow:
//    1. VS Code spawns nhspdap.exe as the DAP server (type:"hsp3net")
//    2. VS Code sends {initialize}
//    3. VS Code sends {launch, program:"foo.ax", ...}
//    4. nhspdap spawns hsp3cl_net_dbg_64.exe with hsp3debug_dap.dll
//       as hsp3debug.dll in its cwd, and connects to the named pipe.
//    5. DLL sends {"evt":"ready"} → nhspdap sends {initialized} to VS Code
//    6. VS Code sets breakpoints → nhspdap forwards as {cmd:"set_bp"}
//    7. VS Code {configurationDone} → nhspdap sends {cmd:"continue"}
//    8. BP hit → DLL {"evt":"stopped"} → nhspdap {event: stopped} to VS Code
//    9. User inspects vars / steps / continues — full DAP round-trips.
//
//  MVP (Phase 1 scaffold):
//    - initialize / launch / disconnect / threads / configurationDone only.
//    - Breakpoint + step + vars + callstack wired in Phase 2+.
//

using System;
using System.Threading;

namespace NhspDap {
    internal static class Program {
        private static int Main(string[] args) {
            try {
                var session = new DapSession();
                session.Run();
                return 0;
            } catch (Exception ex) {
                Console.Error.WriteLine("nhspdap fatal: " + ex);
                return 1;
            }
        }
    }
}
