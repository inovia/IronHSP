using System;
using System.Diagnostics;
using System.IO;
using Microsoft.VisualStudio;
using Microsoft.VisualStudio.Shell;
using Microsoft.VisualStudio.Shell.Interop;
using Microsoft.VisualStudio.Text;
using Microsoft.VisualStudio.Text.Editor;

namespace NhspVsLanguageClient
{
    // Compiles the active .nhsp document with nhspc.exe and then either
    // launches the resulting managed exe under the VS debugger (F5) or
    // starts it standalone (Ctrl+F5).
    //
    // All stages write to the "NHSP" output pane so failures are visible
    // even without a solution.
    internal static class NhspDebugLauncher
    {
        // Stable GUID for our output pane so toggling between sessions reuses it.
        private static readonly Guid OutputPaneGuid = new Guid("A1F3A3E1-99CE-4B8A-9B83-3BFF3D5A81D1");

        // VS Managed (CLR) debug engine. Works for both CLR2 and CLR4 assemblies.
        // LaunchDebugTargets4 rejects Guid.Empty with E_INVALIDARG (0x80070057),
        // so we have to pick an engine explicitly.
        private static readonly Guid ManagedEngineGuid = new Guid("449EC4CC-30D2-4032-9256-EE18EB41B62B");

        // Guid of the Output tool window ({SID_SVsOutputWindow}).
        private static readonly Guid OutputToolWindowGuid = new Guid("34e76e81-ee4a-11d0-ae2e-00a0c90fffc3");

        private static IVsOutputWindowPane _pane;

        // Entry point used by the Open-Folder LaunchDebugTarget provider when
        // the user picks "Current Document" from the toolbar startup dropdown
        // (or presses F5 / uses Debug menu). Workspace infra delivers this
        // call on the UI thread already.
        public static void LaunchFilePublic(string srcPath, bool debug)
        {
            ThreadHelper.ThrowIfNotOnUIThread();
            if (string.IsNullOrEmpty(srcPath) || !System.IO.File.Exists(srcPath))
            {
                Log("NHSP: file not found: " + srcPath);
                return;
            }
            LaunchFile(srcPath, debug);
        }

        private static void LaunchFile(string srcPath, bool debug)
        {
            ThreadHelper.ThrowIfNotOnUIThread();
            string compilerPath = LocateCompiler();
            if (compilerPath == null)
            {
                Log("NHSP: nhspc.exe not found next to the extension DLL.");
                return;
            }
            string outDir = Path.Combine(Path.GetTempPath(), "nhspc-debug");
            Directory.CreateDirectory(outDir);
            string outExe = Path.Combine(outDir, Path.GetFileNameWithoutExtension(srcPath) + ".exe");

            Log("NHSP: compiling " + srcPath);
            Log("      -> " + outExe);

            int exit = RunCompiler(compilerPath, srcPath, outExe);
            if (exit != 0 || !File.Exists(outExe))
            {
                Log("NHSP: compile failed (exit " + exit + ").");
                return;
            }
            Log("NHSP: compile succeeded.");

            if (debug) LaunchDebugger(outExe);
            else LaunchStandalone(outExe);
        }

        private static int RunCompiler(string compilerPath, string src, string outExe)
        {
            var psi = new ProcessStartInfo(compilerPath)
            {
                Arguments = "\"" + src + "\" -o \"" + outExe + "\" -debug",
                UseShellExecute = false,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                CreateNoWindow = true,
                WorkingDirectory = Path.GetDirectoryName(src) ?? "",
            };
            try
            {
                using (var p = Process.Start(psi))
                {
                    string stdout = p.StandardOutput.ReadToEnd();
                    string stderr = p.StandardError.ReadToEnd();
                    p.WaitForExit();
                    if (!string.IsNullOrEmpty(stdout)) Log(stdout.TrimEnd());
                    if (!string.IsNullOrEmpty(stderr)) Log(stderr.TrimEnd());
                    return p.ExitCode;
                }
            }
            catch (Exception e)
            {
                Log("NHSP: compiler invocation failed: " + e.Message);
                return -1;
            }
        }

        private static void LaunchDebugger(string exe)
        {
            ThreadHelper.ThrowIfNotOnUIThread();
            var debugger = Package.GetGlobalService(typeof(SVsShellDebugger)) as IVsDebugger4;
            if (debugger == null) { Log("NHSP: IVsDebugger4 service unavailable."); return; }

            var info = new VsDebugTargetInfo4
            {
                dlo = (uint)DEBUG_LAUNCH_OPERATION.DLO_CreateProcess,
                bstrExe = exe,
                bstrCurDir = Path.GetDirectoryName(exe),
                guidLaunchDebugEngine = ManagedEngineGuid,
                LaunchFlags = (uint)__VSDBGLAUNCHFLAGS.DBGLAUNCH_StopDebuggingOnEnd,
            };
            var results = new VsDebugTargetProcessInfo[1];
            try
            {
                debugger.LaunchDebugTargets4(1, new[] { info }, results);
            }
            catch (Exception e)
            {
                Log("NHSP: LaunchDebugTargets4 failed: " + e.Message);
            }
        }

        private static void LaunchStandalone(string exe)
        {
            try
            {
                Process.Start(new ProcessStartInfo(exe)
                {
                    UseShellExecute = true,
                    WorkingDirectory = Path.GetDirectoryName(exe),
                });
            }
            catch (Exception e)
            {
                Log("NHSP: run failed: " + e.Message);
            }
        }

        private static string LocateCompiler()
        {
            string here = Path.GetDirectoryName(typeof(NhspDebugLauncher).Assembly.Location);
            if (string.IsNullOrEmpty(here)) return null;
            string c = Path.Combine(here, "nhspc.exe");
            return File.Exists(c) ? c : null;
        }

        private static void Log(string msg)
        {
            ThreadHelper.ThrowIfNotOnUIThread();
            if (_pane == null)
            {
                var outWin = Package.GetGlobalService(typeof(SVsOutputWindow)) as IVsOutputWindow;
                if (outWin == null) { Debug.WriteLine("[NHSP] " + msg); return; }
                var guid = OutputPaneGuid;
                outWin.CreatePane(ref guid, "NHSP", 1, 1);
                outWin.GetPane(ref guid, out _pane);
                ShowOutputToolWindow();
            }
            if (_pane != null)
            {
                _pane.Activate();
                _pane.OutputStringThreadSafe(msg + Environment.NewLine);
            }
        }

        // Force the Output tool window itself to be visible. Activating our
        // pane alone doesn't unhide the window if the user has closed it, so
        // we grab the shell-level frame and Show() it once per session.
        private static void ShowOutputToolWindow()
        {
            ThreadHelper.ThrowIfNotOnUIThread();
            var uiShell = Package.GetGlobalService(typeof(SVsUIShell)) as IVsUIShell;
            if (uiShell == null) return;
            Guid outputWin = OutputToolWindowGuid;
            IVsWindowFrame frame;
            if (uiShell.FindToolWindow((uint)__VSFINDTOOLWIN.FTW_fForceCreate, ref outputWin, out frame) == VSConstants.S_OK
                && frame != null)
            {
                frame.Show();
            }
        }
    }
}
