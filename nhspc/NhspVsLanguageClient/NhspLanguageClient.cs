using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.VisualStudio.LanguageServer.Client;
using Microsoft.VisualStudio.Threading;
using Microsoft.VisualStudio.Utilities;

namespace NhspVsLanguageClient
{
    // MEF-exported language client. VS 2022 instantiates this on demand when
    // a buffer with content type "nhsp" opens, calls ActivateAsync to get the
    // stdin/stdout streams of the language server, then drives the LSP
    // protocol on top of them.
    [ContentType(NhspContentDefinition.ContentTypeName)]
    [Export(typeof(ILanguageClient))]
    public sealed class NhspLanguageClient : ILanguageClient
    {
        public string Name => "NHSP Language Server";
        public IEnumerable<string> ConfigurationSections => null;
        public object InitializationOptions => null;
        public IEnumerable<string> FilesToWatch => null;
        public bool ShowNotificationOnInitializeFailed => true;

        public event AsyncEventHandler<EventArgs> StartAsync;
#pragma warning disable CS0067 // event never raised — required by interface
        public event AsyncEventHandler<EventArgs> StopAsync;
#pragma warning restore CS0067

        public async Task<Connection> ActivateAsync(CancellationToken token)
        {
            string serverPath = LocateServer();
            if (serverPath == null)
                throw new FileNotFoundException(
                    "nhspls.exe not found next to NhspVsLanguageClient.dll. " +
                    "Re-install the NHSP Language Support extension or copy nhspls.exe " +
                    "into the extension folder.");

            var psi = new ProcessStartInfo(serverPath)
            {
                RedirectStandardInput = true,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                UseShellExecute = false,
                CreateNoWindow = true,
                WorkingDirectory = Path.GetDirectoryName(serverPath)
            };

            var proc = new Process { StartInfo = psi };
            if (!proc.Start())
                throw new InvalidOperationException("Failed to start nhspls.exe");

            // Drain stderr to the debug pane so server crash logs are visible.
            _ = Task.Run(async () =>
            {
                try
                {
                    string line;
                    while ((line = await proc.StandardError.ReadLineAsync().ConfigureAwait(false)) != null)
                        Debug.WriteLine("[nhspls stderr] " + line);
                }
                catch { /* ignore */ }
            });

            return new Connection(proc.StandardOutput.BaseStream, proc.StandardInput.BaseStream);
        }

        public async Task OnLoadedAsync()
        {
            if (StartAsync != null)
                await StartAsync.InvokeAsync(this, EventArgs.Empty).ConfigureAwait(false);
        }

        public Task OnServerInitializedAsync() => Task.CompletedTask;

        public Task<InitializationFailureContext> OnServerInitializeFailedAsync(ILanguageClientInitializationInfo info)
        {
            return Task.FromResult(new InitializationFailureContext
            {
                FailureMessage = "NHSP language server failed to initialize: " + info?.StatusMessage
            });
        }

        // Look for nhspls.exe next to this DLL (the standard install location).
        private static string LocateServer()
        {
            string here = Path.GetDirectoryName(typeof(NhspLanguageClient).Assembly.Location) ?? ".";
            string[] candidates =
            {
                Path.Combine(here, "nhspls.exe"),
                Path.Combine(here, "Server", "nhspls.exe"),
            };
            foreach (var c in candidates)
                if (File.Exists(c)) return c;
            return null;
        }
    }
}
