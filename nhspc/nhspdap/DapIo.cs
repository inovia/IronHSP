//
//  DapIo.cs — Content-Length framed JSON-RPC over stdio.
//
//  The DAP wire format is identical to LSP:
//    Content-Length: N\r\n
//    \r\n
//    {...JSON of length N...}
//
//  This class wraps Console.OpenStandardInput/Output for synchronous
//  read/write. DAP messages are serialized with Newtonsoft.Json.
//

using System;
using System.IO;
using System.Text;
using Newtonsoft.Json.Linq;

namespace NhspDap {
    internal sealed class DapIo {
        private readonly Stream _in;
        private readonly Stream _out;
        private readonly object _writeLock = new object();

        public DapIo() {
            _in = Console.OpenStandardInput();
            _out = Console.OpenStandardOutput();
        }

        public JObject ReadMessage() {
            int contentLength = -1;
            while (true) {
                string header = ReadHeaderLine();
                if (header == null) return null; // EOF
                if (header.Length == 0) break;
                int colon = header.IndexOf(':');
                if (colon < 0) continue;
                string name = header.Substring(0, colon).Trim();
                string value = header.Substring(colon + 1).Trim();
                if (string.Equals(name, "Content-Length", StringComparison.OrdinalIgnoreCase))
                    contentLength = int.Parse(value);
            }
            if (contentLength <= 0) return null;
            byte[] buf = new byte[contentLength];
            int read = 0;
            while (read < contentLength) {
                int n = _in.Read(buf, read, contentLength - read);
                if (n <= 0) return null;
                read += n;
            }
            return JObject.Parse(Encoding.UTF8.GetString(buf));
        }

        public void WriteMessage(JObject obj) {
            string body = obj.ToString(Newtonsoft.Json.Formatting.None);
            byte[] payload = Encoding.UTF8.GetBytes(body);
            byte[] header = Encoding.ASCII.GetBytes(
                "Content-Length: " + payload.Length + "\r\n\r\n");
            lock (_writeLock) {
                _out.Write(header, 0, header.Length);
                _out.Write(payload, 0, payload.Length);
                _out.Flush();
            }
        }

        private string ReadHeaderLine() {
            var sb = new StringBuilder();
            int prev = -1;
            while (true) {
                int c = _in.ReadByte();
                if (c < 0) return sb.Length == 0 ? null : sb.ToString();
                if (prev == '\r' && c == '\n') {
                    sb.Length -= 1; // drop \r
                    return sb.ToString();
                }
                sb.Append((char)c);
                prev = c;
            }
        }
    }
}
