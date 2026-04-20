//
//  DebuggeeBridge.cs — named-pipe client to hsp3debug_dap.dll.
//
//  Wire format (line-delimited JSON, UTF-8, LF-terminated):
//    DLL → us:   {"evt":"ready"} / {"evt":"stopped",...} / {"evt":"terminated",...}
//    us → DLL:   {"cmd":"set_bp","file":...,"lines":[...]}
//                {"cmd":"continue"|"step_over"|"step_in"|"step_out"|"pause"}
//                {"cmd":"get_vars"} → {"resp":"vars","items":[...]}
//                {"cmd":"get_callstack"} → {"resp":"callstack","frames":[...]}
//                {"cmd":"disconnect"}
//
//  This class owns the read thread; events raised via EventReceived get
//  dispatched to DapSession on that thread.
//

using System;
using System.IO;
using System.IO.Pipes;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace NhspDap {
    internal sealed class DebuggeeBridge : IDisposable {
        // Two simplex pipes: evt (server→us), cmd (us→server). See
        // hsp3debug_dap.cpp for the rationale (concurrent R/W on a duplex
        // handle is unreliable under /clr mixed-mode).
        private NamedPipeClientStream _evtPipe;
        private NamedPipeClientStream _cmdPipe;
        private StreamWriter _writer;
        private StreamReader _reader;
        private Thread _readerThread;
        private readonly object _writeLock = new object();
        private volatile bool _disposed;

        public event Action<JObject> EventReceived;
        public event Action Disconnected;

        // Single in-flight request slot. The adapter handles one DAP variables /
        // stackTrace request at a time (they're serial from VS Code's side
        // anyway), so a single TCS is enough for MVP.
        private readonly object _respLock = new object();
        private TaskCompletionSource<JObject> _pendingResp;

        // Blocks until both pipe servers (DLL) accept their connection.
        // The DLL creates the pipes during debugini(), so the runtime
        // must be spawned before we call this.
        public void Connect(int pid, int timeoutMs = 10000) {
            string evtName = "hsp3dap_" + pid + "_evt";
            string cmdName = "hsp3dap_" + pid + "_cmd";
            _evtPipe = new NamedPipeClientStream(".", evtName, PipeDirection.In);
            _cmdPipe = new NamedPipeClientStream(".", cmdName, PipeDirection.Out);
            _evtPipe.Connect(timeoutMs);
            _cmdPipe.Connect(timeoutMs);
            var utf8 = new UTF8Encoding(false);
            _writer = new StreamWriter(_cmdPipe, utf8) { NewLine = "\n", AutoFlush = true };
            // detectEncodingFromByteOrderMarks=false: the DLL never emits a
            // BOM; leaving the default true lets StreamReader swallow the
            // first 2–3 bytes as a non-existent BOM and misalign the stream.
            _reader = new StreamReader(_evtPipe, utf8, detectEncodingFromByteOrderMarks: false);
            _readerThread = new Thread(ReadLoop) { IsBackground = true, Name = "DebuggeeBridge-Reader" };
            _readerThread.Start();
        }

        public void Send(JObject cmd) {
            if (_disposed) return;
            string line = cmd.ToString(Newtonsoft.Json.Formatting.None);
            lock (_writeLock) {
                try { _writer.WriteLine(line); } catch { /* pipe closed */ }
            }
        }

        // Send a command and block until the DLL answers with a "resp" message.
        // Returns null on timeout or pipe error. Only one SendRequest can be
        // in flight at a time.
        public JObject SendRequest(JObject cmd, int timeoutMs = 2000) {
            TaskCompletionSource<JObject> tcs;
            lock (_respLock) {
                if (_pendingResp != null) return null;
                tcs = new TaskCompletionSource<JObject>();
                _pendingResp = tcs;
            }
            try {
                Send(cmd);
                return tcs.Task.Wait(timeoutMs) ? tcs.Task.Result : null;
            } finally {
                lock (_respLock) {
                    if (_pendingResp == tcs) _pendingResp = null;
                }
            }
        }

        private void ReadLoop() {
            try {
                string line;
                while ((line = _reader.ReadLine()) != null) {
                    if (_disposed) break;
                    JObject obj;
                    try { obj = JObject.Parse(line); }
                    catch { continue; }
                    // CRITICAL: isolate each handler in its own try/catch so
                    // one bad event / one slow VS Code response cannot kill
                    // the reader thread and drop every subsequent event.
                    try {
                        DapTrace.Log("BRG " + (line.Length > 200 ? line.Substring(0, 200) + "..." : line));
                        if (obj["evt"] != null) {
                            EventReceived?.Invoke(obj);
                        } else if (obj["resp"] != null) {
                            TaskCompletionSource<JObject> tcs;
                            lock (_respLock) { tcs = _pendingResp; _pendingResp = null; }
                            tcs?.TrySetResult(obj);
                        }
                    } catch (Exception ex) {
                        DapTrace.Log("bridge handler error: " + ex);
                    }
                }
            } catch (IOException) {
                // pipe closed — normal shutdown path
            } catch (Exception ex) {
                Console.Error.WriteLine("bridge reader crashed: " + ex);
            } finally {
                if (!_disposed) Disconnected?.Invoke();
            }
        }

        public void Dispose() {
            _disposed = true;
            try { _evtPipe?.Close(); } catch { }
            try { _cmdPipe?.Close(); } catch { }
            try { _reader?.Dispose(); } catch { }
            try { _writer?.Dispose(); } catch { }
        }
    }
}
