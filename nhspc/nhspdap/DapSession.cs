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
using System.Linq;
using System.Threading;
using Newtonsoft.Json.Linq;

namespace NhspDap {
    internal sealed class DapSession {
        private readonly DapIo _io = new DapIo();
        private readonly DebuggeeBridge _bridge = new DebuggeeBridge();
        private Process _runtime;
        private int _seq = 1;
        private bool _configDone;
        private string _cwd;
        private readonly Dictionary<string, List<int>> _pendingBps = new Dictionary<string, List<int>>();
        // Maps basename (case-insensitive) → absolute path supplied via
        // setBreakpoints. Used to resolve the HSP runtime's relative fname
        // back to the full workspace path so VS Code can open the source.
        private readonly Dictionary<string, string> _sourcePaths =
            new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

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
                case "setVariable":      SetVariable(req, reqSeq); break;
                case "evaluate":         Evaluate(req, reqSeq); break;
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
                ["supportsEvaluateForHovers"] = true,
                ["supportsStepBack"] = false,
                ["supportsSetVariable"] = true,
                ["supportsRestartRequest"] = false,
                ["supportTerminateDebuggee"] = true,
            };
            Respond(req, reqSeq, body);
        }

        private void SetVariable(JObject req, int reqSeq) {
            var args = (JObject)req["arguments"];
            string name = (string)args["name"];
            string value = (string)args["value"];
            var cmd = new JObject {
                ["cmd"] = "set_var",
                ["name"] = name,
                ["value"] = value,
                ["indices"] = new JArray(),
            };
            var resp = _bridge.SendRequest(cmd);
            if (resp != null && (int?)resp["ok"] == 1) {
                Respond(req, reqSeq, new JObject { ["value"] = value });
            } else {
                string err = (string)resp?["error"] ?? "no_response";
                Respond(req, reqSeq, null, success: false, message: err);
            }
        }

        private void Evaluate(JObject req, int reqSeq) {
            var args = (JObject)req["arguments"];
            string expr = (string)args["expression"];
            string context = (string)args["context"] ?? "";

            // Assignment via `=` → send to DLL as evaluate command.
            if (expr.Contains("=")) {
                var cmd = new JObject { ["cmd"] = "evaluate", ["expr"] = expr };
                var resp = _bridge.SendRequest(cmd);
                if (resp != null && (int?)resp["ok"] == 1) {
                    Respond(req, reqSeq, new JObject {
                        ["result"] = (string)resp["result"] ?? "",
                        ["variablesReference"] = 0,
                    });
                } else {
                    string err = (string)resp?["error"] ?? "no_response";
                    Respond(req, reqSeq, null, success: false, message: err);
                }
                return;
            }

            // Read-only evaluation: look up the variable in current scope.
            // For MVP we fetch the whole variables list and filter by name.
            // Covers hover + watch simple cases; complex expressions NYI.
            var varsResp = _bridge.SendRequest(new JObject { ["cmd"] = "get_vars" });
            if (varsResp?["items"] is JArray arr) {
                string trimmed = expr.Trim();
                foreach (var v in arr) {
                    if (string.Equals((string)v["name"], trimmed, StringComparison.Ordinal)) {
                        Respond(req, reqSeq, new JObject {
                            ["result"] = (string)v["value"] ?? "",
                            ["type"] = (string)v["type"] ?? "",
                            ["variablesReference"] = 0,
                        });
                        return;
                    }
                }
            }
            Respond(req, reqSeq, null, success: false, message: "not_found: " + expr);
        }

        private void Launch(JObject req, int reqSeq) {
            var args = (JObject)req["arguments"];
            string program = (string)args["program"];
            string runtime = (string)args["runtime"];  // optional override
            var argv = args["args"] as JArray;
            string cwd = (string)args["cwd"] ?? Path.GetDirectoryName(Path.GetFullPath(program));
            _cwd = cwd;
            // Pre-register the program's directory for source resolution.
            if (!string.IsNullOrEmpty(program)) {
                string programDir = Path.GetDirectoryName(Path.GetFullPath(program));
                if (programDir != null && !string.IsNullOrEmpty(programDir)) {
                    _sourcePaths["__programDir__"] = programDir;
                }
            }

            if (string.IsNullOrEmpty(runtime)) {
                runtime = LocateRuntime();
                if (runtime == null) {
                    Respond(req, reqSeq, null, success: false,
                        message: "hsp3cl_net_dbg_64.exe が見つかりません。launch.json の runtime を設定してください。");
                    return;
                }
            }

            // If a sibling .hsp source exists and is newer than the .ax, or the
            // .ax is missing, auto-compile before launching. Without this, the
            // user would debug a stale .ax (source changes don't take effect,
            // breakpoints on new lines don't hit).
            if (!CompileIfNeeded(program, cwd, out string compileErr)) {
                SendOutputEvent("stderr", "hspcmp64 compile failed:\n" + compileErr + "\n");
                Respond(req, reqSeq, null, success: false,
                    message: "コンパイルエラー: " + compileErr.Split('\n').FirstOrDefault());
                return;
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
                // HSP runtime emits UTF-8 (HSPUTF8 defined); default console
                // encoding would garble non-ASCII `mes` output.
                StandardOutputEncoding = new System.Text.UTF8Encoding(false),
                StandardErrorEncoding = new System.Text.UTF8Encoding(false),
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

        // Auto-compile the source .hsp next to the .ax if needed.
        //
        //   - Source missing         → no-op (user supplied a standalone .ax)
        //   - .ax missing or stale   → run hspcmp64 -d -w -i <src>
        //   - compile fails          → return false + message via `error`
        //
        // The -w flag is required so the runtime loads hsp3debug.dll.
        private bool CompileIfNeeded(string program, string cwd, out string error) {
            error = null;
            if (string.IsNullOrEmpty(program)) return true;
            string srcPath = Path.ChangeExtension(program, ".hsp");
            if (!File.Exists(srcPath)) return true;

            if (File.Exists(program)) {
                var srcTime = File.GetLastWriteTimeUtc(srcPath);
                var axTime  = File.GetLastWriteTimeUtc(program);
                if (axTime > srcTime) return true;
            }

            string hspcmp = LocateHspcmp();
            if (hspcmp == null) {
                error = "hspcmp64.exe が見つかりません";
                return false;
            }

            // hspcmp64 は UTF-8 入力モード (-i) でもエラーメッセージ出力は
            // 実行環境の ANSI code page (日本語 Windows なら CP932) で出す。
            // UTF-8 と仮定して読むと「文法が間違っています」が化ける。
            var ansi = System.Text.Encoding.GetEncoding(
                System.Globalization.CultureInfo.CurrentCulture.TextInfo.ANSICodePage);
            var psi = new ProcessStartInfo {
                FileName = hspcmp,
                Arguments = "-d -w -i \"" + srcPath + "\"",
                WorkingDirectory = string.IsNullOrEmpty(cwd) ? Path.GetDirectoryName(srcPath) : cwd,
                UseShellExecute = false,
                CreateNoWindow = true,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                StandardOutputEncoding = ansi,
                StandardErrorEncoding  = ansi,
            };
            string stdout, stderr;
            int exitCode;
            try {
                using (var p = Process.Start(psi)) {
                    stdout = p.StandardOutput.ReadToEnd();
                    stderr = p.StandardError.ReadToEnd();
                    if (!p.WaitForExit(15000)) { p.Kill(); error = "hspcmp64 timed out"; return false; }
                    exitCode = p.ExitCode;
                }
            } catch (Exception ex) {
                error = "hspcmp64 failed to start: " + ex.Message;
                return false;
            }

            // hspcmp writes diagnostics to stdout (+stderr on some builds).
            // Success when the final line includes "No error detected" AND
            // exit code is 0.
            string allOutput = (stdout ?? "") + (stderr ?? "");
            SendOutputEvent("console", allOutput);

            if (exitCode != 0 || allOutput.Contains(" : error ")) {
                // Extract the first error line for the top-level message.
                var firstError = allOutput.Split('\n')
                    .FirstOrDefault(l => l.Contains(" : error ")) ?? allOutput;
                error = firstError.Trim();
                return false;
            }
            return true;
        }

        // Locate hspcmp64.exe relative to the adapter binary (dev tree layout).
        private static string LocateHspcmp() {
            string here = Path.GetDirectoryName(typeof(Program).Assembly.Location);
            var candidates = new[] {
                Path.Combine(here, "hspcmp64.exe"),
                // .../nhspc/nhspdap/bin/Release/net48/ → ../../../../../package/win32/
                Path.GetFullPath(Path.Combine(here, "..", "..", "..", "..", "..", "package", "win32", "hspcmp64.exe")),
                Path.GetFullPath(Path.Combine(here, "..", "..", "..", "..", "..", "hspcmp", "win32", "x64", "Release", "hspcmp64.exe")),
            };
            foreach (var c in candidates) if (File.Exists(c)) return c;
            return null;
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
            // Remember basename → absolute path so we can round-trip.
            if (!string.IsNullOrEmpty(path)) {
                _sourcePaths[Path.GetFileName(path)] = path;
            }

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
                    string runtimeFile = (string)f["file"] ?? "";
                    string absPath = ResolveSourcePath(runtimeFile);
                    frames.Add(new JObject {
                        ["id"] = id++,
                        ["name"] = (string)f["name"],
                        ["source"] = new JObject {
                            ["name"] = Path.GetFileName(absPath),
                            ["path"] = absPath,
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

        // Convert a possibly-relative filename from the HSP runtime into an
        // absolute path VS Code can open. Lookup order:
        //   1. Already absolute → return as-is
        //   2. Cached from a prior setBreakpoints for the same basename
        //   3. Resolve relative to cwd
        //   4. Resolve relative to program dir
        //   5. Fall back to the original string
        private string ResolveSourcePath(string file) {
            if (string.IsNullOrEmpty(file)) return "";
            if (Path.IsPathRooted(file)) return file;
            string basename = Path.GetFileName(file);
            if (_sourcePaths.TryGetValue(basename, out var hit)) return hit;
            if (!string.IsNullOrEmpty(_cwd)) {
                string candidate = Path.Combine(_cwd, file);
                if (File.Exists(candidate)) return Path.GetFullPath(candidate);
            }
            if (_sourcePaths.TryGetValue("__programDir__", out var progDir)) {
                string candidate = Path.Combine(progDir, file);
                if (File.Exists(candidate)) return Path.GetFullPath(candidate);
            }
            return file;
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
