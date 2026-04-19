using System;
using Microsoft.VisualStudio;
using Microsoft.VisualStudio.OLE.Interop;

namespace NhspVsLanguageClient
{
    // Shell-level command target installed via IVsRegisterPriorityCommandTarget.
    //
    // The per-view NhspCommandFilter catches F5 / Ctrl+F5 when the editor has
    // keyboard focus, but the Debug toolbar button routes commands directly to
    // the Debug package without going through the active view's filter chain.
    // A priority target runs before normal package routing, so it's the only
    // place we can intercept the toolbar click (and incidentally also covers
    // the menu / keyboard paths, so the view filter becomes a fallback).
    //
    // We only claim the command when the active document is a .nhsp file — if
    // the user has a solution focused, normal Debug routing still runs and
    // builds the startup project as usual.
    internal sealed class NhspGlobalCommandTarget : IOleCommandTarget
    {
        public int QueryStatus(ref Guid pguidCmdGroup, uint cCmds, OLECMD[] prgCmds, IntPtr pCmdText)
        {
            if (pguidCmdGroup == VSConstants.GUID_VSStandardCommandSet97 && cCmds == 1)
            {
                uint id = prgCmds[0].cmdID;
                if ((id == (uint)VSConstants.VSStd97CmdID.Start ||
                     id == (uint)VSConstants.VSStd97CmdID.StartNoDebug) &&
                    NhspDebugLauncher.IsActiveDocNhsp())
                {
                    prgCmds[0].cmdf = (uint)(OLECMDF.OLECMDF_SUPPORTED | OLECMDF.OLECMDF_ENABLED);
                    return VSConstants.S_OK;
                }
            }
            return (int)Constants.OLECMDERR_E_NOTSUPPORTED;
        }

        public int Exec(ref Guid pguidCmdGroup, uint nCmdID, uint nCmdexecopt, IntPtr pvaIn, IntPtr pvaOut)
        {
            if (pguidCmdGroup == VSConstants.GUID_VSStandardCommandSet97 &&
                NhspDebugLauncher.IsActiveDocNhsp())
            {
                if (nCmdID == (uint)VSConstants.VSStd97CmdID.Start)
                {
                    NhspDebugLauncher.LaunchActive(debug: true);
                    return VSConstants.S_OK;
                }
                if (nCmdID == (uint)VSConstants.VSStd97CmdID.StartNoDebug)
                {
                    NhspDebugLauncher.LaunchActive(debug: false);
                    return VSConstants.S_OK;
                }
            }
            return (int)Constants.OLECMDERR_E_NOTSUPPORTED;
        }
    }
}
