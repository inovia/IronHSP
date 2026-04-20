//
//  DapSession.cs — one DAP session (VS Code ⇄ nhspdap ⇄ runtime).
//
//  Handles DAP request routing. Phase 1 MVP: launch flow + threads only.
//  Breakpoint / step / variables / stackTrace wired in later phases.
//

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Threading;
using Newtonsoft.Json.Linq;

namespace NhspDap {
    internal sealed class DapSession {
        private readonly DapIo _io = new DapIo();
        private readonly DebuggeeBridge _bridge = new DebuggeeBridge();
        private Process _runtime;
        private int _seq = 1;
        private bool _configDone;
        private readonly Dictionary<string, List<int>> _pendingBps = new Dictionary<string, List<int>>();

        public void Run() {
            _bridge.EventReceived += OnBridgeEvent;

            while (true) {
                JObject msg;
                try { msg = _io.ReadMessage(); }
                catch (IOException) { break; }
                if (msg == null) break;
                string type = (string)msg["type"];
                if (type == "request") HandleRequest(msg);
            }
            Cleanup();
        }

        // ---------- DAP request dispatch ----------
        private void HandleRequest(JObject req) {
            string cmd = (string)req["command"];
            int reqSeq = (int)req["seq"];
            switch (cmd) {
                case "initialize":       Initialize(req, reqSeq); break;
                case "launch":           Launch(req, reqSeq); break;
                case "setBreakpoints":   SetBreakpoints(req, reqSeq); break;
                case "configurationDone":ConfigurationDone(req, reqSeq); break;
                case "threads":          Threads(req, reqSeq); break;
                case "stackTrace":       StackTrace(req, reqSeq); break;
                case "scopes":           Scopes(req, reqSeq); break;
                case "variables":        Variables(req, reqSeq); break;
                case "continue":         SendSimple("continue"); RespondEmpty(req, reqSeq, new JObject {["allThreadsContinued"] = true}); break;
                case "next":             SendSimple("step_over"); RespondEmpty(req, reqSeq); break;
                case "stepIn":           SendSimple("step_in"); RespondEmpty(req, reqSeq); break;
                case "stepOut":          SendSimple("step_out"); RespondEmpty(req, reqSeq); break;
                case "pause":            SendSimple("pause"); RespondEmpty(req, reqSeq); break;
                case "disconnect":       Disconnect(req, reqSeq); break;
                default:                 RespondEmpty(req, reqSeq); break;
            }
        }

        private void Initialize(JObject req, int reqSeq) {
            var body = new JObject {
                ["supportsConfigurationDoneRequest"] = true,
                ["supportsEvaluateForHovers"] = false,  // wired later
                ["supportsStepBack"] = false,
                ["supportsSetVariable"] = false,
                ["supportsRestartRequest"] = false,
                ["supportTerminateDebuggee"] = true,
            };
            Respond(req, reqSeq, body);
        }

        private void Launch(JObject req, int reqSeq) {
            var args = (JObject)req["arguments"];
            string program = (string)args["program"];
            string runtime = (string)args["runtime"];  // optional override
            var argv = args["args"] as JArray;
            string cwd = (string)args["cwd"] ?? Path.GetDirectoryName(Path.GetFullPath(program));

            if (string.IsNullOrEmpty(runtime)) {
                runtime = LocateRuntime();
                if (runtime == null) {
                    Respond(req, reqSeq, null, success: false,
                        message: "hsp3cl_net_dbg_64.exe が見つかりません。launch.json の runtime を設定してください。");
                    return;
                }
            }

            // Ensure hsp3debug_dap_64.dll is staged as hsp3debug.dll next to the
            // runtime so LoadLibraryA("hsp3debug.dll") succeeds.
            try { StageDebugDll(runtime); }
            catch (Exception ex) {
                Respond(req, reqSeq, null, success: false,
                    message: "hsp3debug.dll の配置に失敗: " + ex.Message);
                return;
            }

            // Launch runtime
            var psi = new ProcessStartInfo {
                FileName = runtime,
                Arguments = QuoteArgs(program, argv),
                WorkingDirectory = cwd,
                UseShellExecute = false,
                CreateNoWindow = false,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
            };
            _runtime = Process.Start(psi);
            _runtime.EnableRaisingEvents = true;
            _runtime.OutputDataReceived += (s, e) => { if (e.Data != null) SendOutputEvent("stdout", e.Data + "\n"); };
            _runtime.ErrorDataReceived  += (s, e) => { if (e.Data != null) SendOutputEvent("stderr", e.Data + "\n"); };
            _runtime.Exited             += (s, e) => SendTerminatedEvent();
            _runtime.BeginOutputReadLine();
            _runtime.BeginErrorReadLine();

            // Connect to the DLL pipe (DLL created it in debugini)
            try {
                _bridge.Connect(_runtime.Id);
            } catch (Exception ex) {
                Respond(req, reqSeq, null, success: false, message: "bridge connect failed: " + ex.Message);
                return;
            }

            Respond(req, reqSeq, new JObject());
            // After launch, VS Code sends setBreakpoints for each file,
            // then configurationDone. We emit 'initialized' to trigger that.
            SendEvent("initialized", new JObject());
        }

        private static string QuoteArgs(string program, JArray argv) {
            var parts = new List<string> { "\"" + program + "\"" };
            if (argv != null) foreach (var t in argv) parts.Add("\"" + (string)t + "\"");
            return string.Join(" ", parts);
        }

        // Locate hsp3cl_net_dbg_64.exe by searching a few known locations.
        private static string LocateRuntime() {
            string here = Path.GetDirectoryName(typeof(Program).Assembly.Location);
            var candidates = new[] {
                Path.Combine(here, "hsp3cl_net_dbg_64.exe"),
                // Dev layout: .../nhspc/nhspdap/bin/Release/net48/
                // runtime:     .../hsp3net/Release_dbg/hsp3cl_net_dbg_64.exe
                Path.GetFullPath(Path.Combine(here, "..", "..", "..", "..", "..", "hsp3net", "Release_dbg", "hsp3cl_net_dbg_64.exe")),
            };
            foreach (var c in candidates) if (File.Exists(c)) return c;
            return null;
        }

        // Copy hsp3debug_dap_64.dll → hsp3debug.dll next to the runtime (idempotent,
        // skip if already present and up-to-date).
        private static void StageDebugDll(string runtimePath) {
            string runtimeDir = Path.GetDirectoryName(runtimePath);
            string target = Path.Combine(runtimeDir, "hsp3debug.dll");

            string here = Path.GetDirectoryName(typeof(Program).Assembly.Location);
            var candidates = new[] {
                Path.Combine(here, "hsp3debug_dap_64.dll"),
                Path.Combine(here, "hsp3debug.dll"),
                // Dev layout: plugins/win32/hsp3debug_dap/Release/hsp3debug_dap_64.dll
                Path.GetFullPath(Path.Combine(here, "..", "..", "..", "..", "..", "plugins", "win32", "hsp3debug_dap", "Release", "hsp3debug_dap_64.dll")),
            };
            string source = null;
            foreach (var c in candidates) if (File.Exists(c)) { source = c; break; }
            if (source == null) throw new FileNotFoundException("hsp3debug_dap_64.dll not found");

            // Skip copy if target is same file or already newer/same
            if (File.Exists(target)) {
                var si = new FileInfo(source); var ti = new FileInfo(target);
                if (si.Length == ti.Length && ti.LastWriteTimeUtc >= si.LastWriteTimeUtc) return;
            }
            File.Copy(source, target, overwrite: true);
        }

        private void SetBreakpoints(JObject req, int reqSeq) {
            var args = (JObject)req["arguments"];
            string path = (string)args["source"]?["path"];
            var bps = args["breakpoints"] as JArray;
            var lines = new List<int>();
            var verified = new JArray();
            if (bps != null) {
                foreach (var bp in bps) {
                    int line = (int)bp["line"];
                    lines.Add(line);
                    verified.Add(new JObject { ["verified"] = true, ["line"] = line });
                }
            }
            _pendingBps[path] = lines;

            // Forward to DLL
            var cmd = new JObject {
                ["cmd"] = "set_bp",
                ["file"] = path,
                ["lines"] = new JArray(lines),
            };
            _bridge.Send(cmd);
            Respond(req, reqSeq, new JObject { ["breakpoints"] = verified });
        }

        private void ConfigurationDone(JObject req, int reqSeq) {
            _configDone = true;
            Respond(req, reqSeq, new JObject());
            // Kick off execution
            _bridge.Send(new JObject { ["cmd"] = "continue" });
        }

        private void Threads(JObject req, int reqSeq) {
            Respond(req, reqSeq, new JObject {
                ["threads"] = new JArray { new JObject { ["id"] = 1, ["name"] = "HSP main" } }
            });
        }

        private void StackTrace(JObject req, int reqSeq) {
            var resp = _bridge.SendRequest(new JObject { ["cmd"] = "get_callstack" });
            var frames = new JArray();
            if (resp?["frames"] is JArray arr) {
                int id = 1;
                foreach (var f in arr) {
                    frames.Add(new JObject {
                        ["id"] = id++,
                        ["name"] = (string)f["name"],
                        ["source"] = new JObject {
                            ["name"] = Path.GetFileName((string)f["file"] ?? ""),
                            ["path"] = (string)f["file"],
                        },
                        ["line"] = (int?)f["line"] ?? 0,
                        ["column"] = 1,
                    });
                }
            }
            Respond(req, reqSeq, new JObject {
                ["stackFrames"] = frames,
                ["totalFrames"] = frames.Count,
            });
        }

        private void Scopes(JObject req, int reqSeq) {
            // Single flat scope for now — HSP's variable list already contains
            // both globals and module-scoped vars.
            Respond(req, reqSeq, new JObject {
                ["scopes"] = new JArray {
                    new JObject {
                        ["name"] = "Variables",
                        ["variablesReference"] = 1,
                        ["expensive"] = false,
                    },
                }
            });
        }

        private void Variables(JObject req, int reqSeq) {
            var resp = _bridge.SendRequest(new JObject { ["cmd"] = "get_vars" });
            var vars = new JArray();
            if (resp?["items"] is JArray arr) {
                foreach (var v in arr) {
                    vars.Add(new JObject {
                        ["name"] = (string)v["name"],
                        ["type"] = (string)v["type"],
                        ["value"] = (string)v["value"],
                        ["variablesReference"] = 0,
                    });
                }
            }
            Respond(req, reqSeq, new JObject { ["variables"] = vars });
        }

        private void SendSimple(string cmd) {
            _bridge.Send(new JObject { ["cmd"] = cmd });
        }

        private void Disconnect(JObject req, int reqSeq) {
            try { _bridge.Send(new JObject { ["cmd"] = "disconnect" }); } catch { }
            Respond(req, reqSeq, new JObject());
            Cleanup();
        }

        // ---------- Bridge → DAP event translation ----------
        private void OnBridgeEvent(JObject evt) {
            string kind = (string)evt["evt"];
            if (kind == "stopped") {
                SendEvent("stopped", new JObject {
                    ["reason"] = (string)evt["reason"],
                    ["threadId"] = 1,
                    ["allThreadsStopped"] = true,
                });
            } else if (kind == "terminated") {
                SendTerminatedEvent();
            }
        }

        // ---------- DAP helpers ----------
        private void Respond(JObject req, int reqSeq, JObject body, bool success = true, string message = null) {
            var resp = new JObject {
                ["seq"] = _seq++,
                ["type"] = "response",
                ["request_seq"] = reqSeq,
                ["command"] = (string)req["command"],
                ["success"] = success,
            };
            if (message != null) resp["message"] = message;
            if (body != null) resp["body"] = body;
            _io.WriteMessage(resp);
        }

        private void RespondEmpty(JObject req, int reqSeq, JObject body = null) {
            Respond(req, reqSeq, body ?? new JObject());
        }

        private void SendEvent(string name, JObject body) {
            _io.WriteMessage(new JObject {
                ["seq"] = _seq++,
                ["type"] = "event",
                ["event"] = name,
                ["body"] = body,
            });
        }

        private void SendOutputEvent(string category, string output) {
            SendEvent("output", new JObject { ["category"] = category, ["output"] = output });
        }

        private void SendTerminatedEvent() {
            SendEvent("terminated", new JObject());
            SendEvent("exited", new JObject { ["exitCode"] = _runtime?.ExitCode ?? 0 });
        }

        private void Cleanup() {
            try { _bridge.Dispose(); } catch { }
            try { if (_runtime != null && !_runtime.HasExited) _runtime.Kill(); } catch { }
        }
    }
}
