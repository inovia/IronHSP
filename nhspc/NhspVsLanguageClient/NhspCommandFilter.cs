using System;
using Microsoft.VisualStudio;
using Microsoft.VisualStudio.OLE.Interop;
using Microsoft.VisualStudio.Text.Editor;

namespace NhspVsLanguageClient
{
    // IOleCommandTarget chain filter attached to every .nhsp text view.
    // Intercepts VSStd97 Start / StartNoDebug (F5 / Ctrl+F5) so the user can
    // build and debug the current .nhsp file directly — no solution needed.
    internal sealed class NhspCommandFilter : IOleCommandTarget
    {
        private readonly IWpfTextView _view;
        public IOleCommandTarget Next;

        public NhspCommandFilter(IWpfTextView view) { _view = view; }

        public int QueryStatus(ref Guid pguidCmdGroup, uint cCmds, OLECMD[] prgCmds, IntPtr pCmdText)
        {
            if (pguidCmdGroup == VSConstants.GUID_VSStandardCommandSet97 && cCmds == 1)
            {
                uint id = prgCmds[0].cmdID;
                if (id == (uint)VSConstants.VSStd97CmdID.Start ||
                    id == (uint)VSConstants.VSStd97CmdID.StartNoDebug)
                {
                    prgCmds[0].cmdf = (uint)(OLECMDF.OLECMDF_SUPPORTED | OLECMDF.OLECMDF_ENABLED);
                    return VSConstants.S_OK;
                }
            }
            if (Next != null)
                return Next.QueryStatus(ref pguidCmdGroup, cCmds, prgCmds, pCmdText);
            return (int)Constants.OLECMDERR_E_UNKNOWNGROUP;
        }

        public int Exec(ref Guid pguidCmdGroup, uint nCmdID, uint nCmdexecopt, IntPtr pvaIn, IntPtr pvaOut)
        {
            if (pguidCmdGroup == VSConstants.GUID_VSStandardCommandSet97)
            {
                if (nCmdID == (uint)VSConstants.VSStd97CmdID.Start)
                {
                    NhspDebugLauncher.Launch(_view, debug: true);
                    return VSConstants.S_OK;
                }
                if (nCmdID == (uint)VSConstants.VSStd97CmdID.StartNoDebug)
                {
                    NhspDebugLauncher.Launch(_view, debug: false);
                    return VSConstants.S_OK;
                }
            }
            if (Next != null)
                return Next.Exec(ref pguidCmdGroup, nCmdID, nCmdexecopt, pvaIn, pvaOut);
            return (int)Constants.OLECMDERR_E_UNKNOWNGROUP;
        }
    }
}
