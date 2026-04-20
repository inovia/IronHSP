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
using Newtonsoft.Json.Linq;

namespace NhspDap {
    internal sealed class DebuggeeBridge : IDisposable {
        private NamedPipeClientStream _pipe;
        private StreamWriter _writer;
        private StreamReader _reader;
        private Thread _readerThread;
        private readonly object _writeLock = new object();
        private volatile bool _disposed;

        public event Action<JObject> EventReceived;
        public event Action<JObject> ResponseReceived;
        public event Action Disconnected;

        // Blocks until the pipe server (DLL) accepts the connection.
        // The DLL creates the pipe during debugini() — so the runtime
        // must be spawned before we call this.
        public void Connect(int pid, int timeoutMs = 10000) {
            string name = "hsp3dap_" + pid;
            _pipe = new NamedPipeClientStream(".", name, PipeDirection.InOut,
                PipeOptions.Asynchronous);
            _pipe.Connect(timeoutMs);
            _writer = new StreamWriter(_pipe, new UTF8Encoding(false)) { NewLine = "\n", AutoFlush = true };
            _reader = new StreamReader(_pipe, new UTF8Encoding(false));
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

        private void ReadLoop() {
            try {
                string line;
                while ((line = _reader.ReadLine()) != null) {
                    if (_disposed) break;
                    JObject obj;
                    try { obj = JObject.Parse(line); }
                    catch { continue; }
                    if (obj["evt"] != null) EventReceived?.Invoke(obj);
                    else if (obj["resp"] != null) ResponseReceived?.Invoke(obj);
                }
            } catch (IOException) {
                // pipe closed
            } finally {
                if (!_disposed) Disconnected?.Invoke();
            }
        }

        public void Dispose() {
            _disposed = true;
            try { _pipe?.Close(); } catch { }
            try { _reader?.Dispose(); } catch { }
            try { _writer?.Dispose(); } catch { }
        }
    }
}
