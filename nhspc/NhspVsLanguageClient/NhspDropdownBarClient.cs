using System;
using Microsoft.VisualStudio;
using Microsoft.VisualStudio.Shell;
using Microsoft.VisualStudio.Text;
using Microsoft.VisualStudio.Text.Editor;
using Microsoft.VisualStudio.TextManager.Interop;

namespace NhspVsLanguageClient
{
    // Two-combo navigation bar shown above the .nhsp editor. Left combo lists
    // all types (#class/#struct/#interface/#enum) in the file; right combo lists
    // members of whatever type currently contains the caret. Picking an entry
    // jumps the caret to its declaration line.
    internal sealed class NhspDropdownBarClient : IVsDropdownBarClient
    {
        private const int TypeCombo = 0;
        private const int MemberCombo = 1;

        private readonly IVsTextView _vsView;
        private readonly IWpfTextView _wpfView;

        private IVsDropdownBar _bar;
        private System.Collections.Generic.List<NhspSymbol> _types = new System.Collections.Generic.List<NhspSymbol>();
        private int _activeType = -1;
        private int _activeMember = -1;
        private bool _parseDirty = true;

        public NhspDropdownBarClient(IVsTextView vsView, IWpfTextView wpfView)
        {
            _vsView = vsView;
            _wpfView = wpfView;
            _wpfView.Caret.PositionChanged += (_, __) => UpdateSelection();
            _wpfView.TextBuffer.Changed += (_, __) => { _parseDirty = true; UpdateSelection(); };
        }

        private void EnsureParsed()
        {
            if (!_parseDirty) return;
            _types = NhspSymbolParser.Parse(_wpfView.TextSnapshot.GetText());
            _parseDirty = false;
        }

        private void UpdateSelection()
        {
            try
            {
                EnsureParsed();
                int line = _wpfView.Caret.Position.BufferPosition.GetContainingLine().LineNumber;
                int t = -1, m = -1;
                for (int i = 0; i < _types.Count; i++)
                {
                    var ty = _types[i];
                    if (line >= ty.StartLine && line <= ty.EndLine) { t = i; break; }
                }
                if (t < 0)
                {
                    // Pick nearest preceding type if caret is between types.
                    for (int i = 0; i < _types.Count; i++)
                        if (_types[i].StartLine <= line) t = i;
                }
                if (t >= 0)
                {
                    var members = _types[t].Members;
                    for (int i = 0; i < members.Count; i++)
                        if (members[i].StartLine <= line) m = i;
                }

                bool changedType = t != _activeType;
                _activeType = t;
                _activeMember = m;
                if (_bar != null)
                {
                    if (changedType) _bar.RefreshCombo(MemberCombo, m >= 0 ? m : 0);
                    _bar.RefreshCombo(TypeCombo, t >= 0 ? t : 0);
                    _bar.RefreshCombo(MemberCombo, m >= 0 ? m : 0);
                }
            }
            catch { /* never break the editor */ }
        }

        // ===== IVsDropdownBarClient =====

        public int GetComboAttributes(int iCombo, out uint pcEntries, out uint puEntryType, out IntPtr phImgList)
        {
            EnsureParsed();
            // ENTRY_TEXT (0x1) only — plain text entries, no image/attribute
            // flags, so VS doesn't invoke GetEntryAttributes/GetEntryImage.
            puEntryType = 1;
            phImgList = IntPtr.Zero;
            if (iCombo == TypeCombo) pcEntries = (uint)_types.Count;
            else if (iCombo == MemberCombo)
                pcEntries = (uint)(_activeType >= 0 && _activeType < _types.Count ? _types[_activeType].Members.Count : 0);
            else pcEntries = 0;
            return VSConstants.S_OK;
        }

        public int GetComboTipText(int iCombo, out string pbstrText)
        {
            pbstrText = iCombo == TypeCombo ? "Type" : "Member";
            return VSConstants.S_OK;
        }

        public int GetEntryAttributes(int iCombo, int iIndex, out uint pAttr)
        {
            // FONTATTR_PLAIN = 0; no bold/italic/grey. Hardcoded because the
            // enum name differs across VS SDK versions (FONTATTR vs FONT_ATTR).
            pAttr = 0;
            return VSConstants.S_OK;
        }

        public int GetEntryImage(int iCombo, int iIndex, out int piImgIndex)
        {
            piImgIndex = 0;
            return VSConstants.S_OK;
        }

        public int GetEntryText(int iCombo, int iIndex, out string ppszText)
        {
            ppszText = "";
            try
            {
                EnsureParsed();
                if (iCombo == TypeCombo && iIndex >= 0 && iIndex < _types.Count)
                    ppszText = _types[iIndex].Display ?? _types[iIndex].Name ?? "";
                else if (iCombo == MemberCombo && _activeType >= 0 && _activeType < _types.Count)
                {
                    var ms = _types[_activeType].Members;
                    if (iIndex >= 0 && iIndex < ms.Count)
                        ppszText = ms[iIndex].Display ?? ms[iIndex].Name ?? "";
                }
            }
            catch { }
            return VSConstants.S_OK;
        }

        public int OnComboGetFocus(int iCombo) => VSConstants.S_OK;

        public int OnItemChosen(int iCombo, int iIndex)
        {
            ThreadHelper.ThrowIfNotOnUIThread();
            try
            {
                EnsureParsed();
                int line = -1;
                if (iCombo == TypeCombo && iIndex >= 0 && iIndex < _types.Count)
                {
                    line = _types[iIndex].StartLine;
                    // Changing the type changes which members are listed.
                    if (iIndex != _activeType)
                    {
                        _activeType = iIndex;
                        _activeMember = -1;
                        _bar?.RefreshCombo(MemberCombo, 0);
                    }
                }
                else if (iCombo == MemberCombo && _activeType >= 0 && _activeType < _types.Count)
                {
                    var ms = _types[_activeType].Members;
                    if (iIndex >= 0 && iIndex < ms.Count) line = ms[iIndex].StartLine;
                }
                if (line >= 0) NavigateTo(line);
            }
            catch { }
            return VSConstants.S_OK;
        }

        public int OnItemSelected(int iCombo, int iIndex) => VSConstants.S_OK;

        public int SetDropdownBar(IVsDropdownBar pDropdownBar)
        {
            _bar = pDropdownBar;
            EnsureParsed();
            UpdateSelection();
            return VSConstants.S_OK;
        }

        private void NavigateTo(int line)
        {
            try
            {
                _vsView.SetCaretPos(line, 0);
                _vsView.CenterLines(line, 1);
                _vsView.EnsureSpanVisible(new TextSpan
                {
                    iStartLine = line,
                    iStartIndex = 0,
                    iEndLine = line,
                    iEndIndex = 0,
                });
            }
            catch { }
        }
    }
}
