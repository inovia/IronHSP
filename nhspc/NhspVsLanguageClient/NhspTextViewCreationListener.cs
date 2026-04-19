using System.ComponentModel.Composition;
using System.Threading;
using Microsoft.VisualStudio;
using Microsoft.VisualStudio.Editor;
using Microsoft.VisualStudio.OLE.Interop;
using Microsoft.VisualStudio.Shell;
using Microsoft.VisualStudio.Shell.Interop;
using Microsoft.VisualStudio.Text.Editor;
using Microsoft.VisualStudio.TextManager.Interop;
using Microsoft.VisualStudio.Utilities;

namespace NhspVsLanguageClient
{
    // MEF listener fired once per text view created on an .nhsp buffer.
    //   1. Installs a per-view NhspCommandFilter (catches F5 when the editor
    //      has keyboard focus — fast path).
    //   2. The first time any .nhsp view opens in this VS session, registers
    //      NhspGlobalCommandTarget with IVsRegisterPriorityCommandTarget so
    //      that the Debug toolbar button (which bypasses per-view filters)
    //      is also caught.
    //   3. Attaches a 2-combo navigation bar (Type / Member) to the code
    //      window hosting the view.
    [Export(typeof(IVsTextViewCreationListener))]
    [ContentType(NhspContentDefinition.ContentTypeName)]
    [TextViewRole(PredefinedTextViewRoles.Editable)]
    internal sealed class NhspTextViewCreationListener : IVsTextViewCreationListener
    {
        [Import] internal IVsEditorAdaptersFactoryService AdapterService = null;

        private static int _priorityTargetRegistered = 0;

        public void VsTextViewCreated(IVsTextView textViewAdapter)
        {
            if (Interlocked.CompareExchange(ref _priorityTargetRegistered, 1, 0) == 0)
                RegisterPriorityTarget();

            var wpf = AdapterService?.GetWpfTextView(textViewAdapter);
            if (wpf == null) return;

            var filter = new NhspCommandFilter(wpf);
            IOleCommandTarget next;
            textViewAdapter.AddCommandFilter(filter, out next);
            filter.Next = next;

            AttachDropdownBar(textViewAdapter, wpf);
        }

        private static void AttachDropdownBar(IVsTextView vsView, IWpfTextView wpfView)
        {
            var mgr = FindCodeWindowByEnumeration(vsView);
            if (mgr == null) return;

            // Replace any existing bar (e.g. added by a previous session that
            // forgot to clean up) so our two combos take over.
            IVsDropdownBar existing;
            if (mgr.GetDropdownBar(out existing) == VSConstants.S_OK && existing != null)
                mgr.RemoveDropdownBar();

            mgr.AddDropdownBar(2, new NhspDropdownBarClient(vsView, wpfView));
        }

        // IVsTextView does not implement IVsDropdownBarManager and does not
        // expose an IOleServiceProvider we can QueryService on (both casts
        // return null in VS 2022). Instead we enumerate the shell's open
        // document frames and pick the IVsCodeWindow whose primary/secondary
        // view matches — that code window *does* implement IVsDropdownBarManager.
        private static IVsDropdownBarManager FindCodeWindowByEnumeration(IVsTextView target)
        {
            ThreadHelper.ThrowIfNotOnUIThread();
            var uiShell = Package.GetGlobalService(typeof(SVsUIShell)) as IVsUIShell;
            if (uiShell == null) return null;

            IEnumWindowFrames winEnum;
            if (uiShell.GetDocumentWindowEnum(out winEnum) != VSConstants.S_OK || winEnum == null)
                return null;

            var frames = new IVsWindowFrame[1];
            uint fetched;
            while (winEnum.Next(1, frames, out fetched) == VSConstants.S_OK && fetched == 1)
            {
                object docViewObj;
                if (frames[0].GetProperty((int)__VSFPROPID.VSFPROPID_DocView, out docViewObj) != VSConstants.S_OK)
                    continue;
                var cw = docViewObj as IVsCodeWindow;
                if (cw == null) continue;

                IVsTextView primary, secondary;
                cw.GetPrimaryView(out primary);
                cw.GetSecondaryView(out secondary);
                if (primary == target || secondary == target)
                    return cw as IVsDropdownBarManager;
            }
            return null;
        }

        private static void RegisterPriorityTarget()
        {
            ThreadHelper.ThrowIfNotOnUIThread();
            var reg = Package.GetGlobalService(typeof(SVsRegisterPriorityCommandTarget))
                as IVsRegisterPriorityCommandTarget;
            if (reg == null) return;
            uint cookie;
            // Cookie intentionally leaked: the target is meant to live for
            // the entire VS session.
            reg.RegisterPriorityCommandTarget(0, new NhspGlobalCommandTarget(), out cookie);
        }
    }
}
