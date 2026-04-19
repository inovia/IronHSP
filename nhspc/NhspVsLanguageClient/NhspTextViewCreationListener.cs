using System.ComponentModel.Composition;
using Microsoft.VisualStudio;
using Microsoft.VisualStudio.Editor;
using Microsoft.VisualStudio.Shell;
using Microsoft.VisualStudio.Shell.Interop;
using Microsoft.VisualStudio.Text.Editor;
using Microsoft.VisualStudio.TextManager.Interop;
using Microsoft.VisualStudio.Utilities;

namespace NhspVsLanguageClient
{
    // Per-view MEF listener. Attaches the Type/Member navigation bar above
    // the editor. F5 / Ctrl+F5 / toolbar ▶ are handled entirely by the
    // Open-Folder Launch providers in NhspWorkspaceLaunch.cs, so this
    // listener no longer installs a command filter.
    [Export(typeof(IVsTextViewCreationListener))]
    [ContentType(NhspContentDefinition.ContentTypeName)]
    [TextViewRole(PredefinedTextViewRoles.Editable)]
    internal sealed class NhspTextViewCreationListener : IVsTextViewCreationListener
    {
        [Import] internal IVsEditorAdaptersFactoryService AdapterService = null;

        public void VsTextViewCreated(IVsTextView textViewAdapter)
        {
            var wpf = AdapterService?.GetWpfTextView(textViewAdapter);
            if (wpf == null) return;
            AttachDropdownBar(textViewAdapter, wpf);
        }

        private static void AttachDropdownBar(IVsTextView vsView, IWpfTextView wpfView)
        {
            var mgr = FindCodeWindowByEnumeration(vsView);
            if (mgr == null) return;

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
    }
}
