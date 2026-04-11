using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using NhspCompiler.Core;

namespace NhspEditor
{
    public class MainForm : Form
    {
        private RichTextBox _editor;
        private RichTextBox _lineNumbers;
        private ListBox _errorList;
        private SplitContainer _mainSplit;
        private ToolStrip _toolbar;
        private StatusStrip _statusBar;
        private ToolStripStatusLabel _statusLabel;
        private ToolStripStatusLabel _posLabel;
        private string _currentFile;
        private bool _modified;
        private Timer _highlightTimer;

        public MainForm()
        {
            InitializeComponents();
            NewFile();
        }

        private void InitializeComponents()
        {
            Text = "NHSP Editor";
            Size = new Size(1000, 700);
            StartPosition = FormStartPosition.CenterScreen;
            Icon = SystemIcons.Application;

            // Menu
            var menu = new MenuStrip();
            var fileMenu = new ToolStripMenuItem("ファイル(&F)");
            fileMenu.DropDownItems.Add(new ToolStripMenuItem("新規(&N)", null, (s, e) => NewFile()) { ShortcutKeys = Keys.Control | Keys.N });
            fileMenu.DropDownItems.Add(new ToolStripMenuItem("開く(&O)...", null, (s, e) => OpenFileDialog()) { ShortcutKeys = Keys.Control | Keys.O });
            fileMenu.DropDownItems.Add(new ToolStripMenuItem("上書き保存(&S)", null, (s, e) => SaveFile()) { ShortcutKeys = Keys.Control | Keys.S });
            fileMenu.DropDownItems.Add(new ToolStripMenuItem("名前を付けて保存(&A)...", null, (s, e) => SaveFileAs()));
            fileMenu.DropDownItems.Add(new ToolStripSeparator());
            fileMenu.DropDownItems.Add(new ToolStripMenuItem("終了(&X)", null, (s, e) => Close()));
            menu.Items.Add(fileMenu);

            var buildMenu = new ToolStripMenuItem("ビルド(&B)");
            buildMenu.DropDownItems.Add(new ToolStripMenuItem("コンパイル(&C)", null, (s, e) => Compile(false)) { ShortcutKeys = Keys.F5 });
            buildMenu.DropDownItems.Add(new ToolStripMenuItem("デバッグビルド(&D)", null, (s, e) => Compile(true)) { ShortcutKeys = Keys.Control | Keys.F5 });
            buildMenu.DropDownItems.Add(new ToolStripMenuItem("コンパイル && 実行(&R)", null, (s, e) => CompileAndRun()) { ShortcutKeys = Keys.F6 });
            menu.Items.Add(buildMenu);
            Controls.Add(menu);
            MainMenuStrip = menu;

            // Toolbar
            _toolbar = new ToolStrip();
            _toolbar.Items.Add(new ToolStripButton("新規", null, (s, e) => NewFile()) { ToolTipText = "新規 (Ctrl+N)" });
            _toolbar.Items.Add(new ToolStripButton("開く", null, (s, e) => OpenFileDialog()) { ToolTipText = "開く (Ctrl+O)" });
            _toolbar.Items.Add(new ToolStripButton("保存", null, (s, e) => SaveFile()) { ToolTipText = "保存 (Ctrl+S)" });
            _toolbar.Items.Add(new ToolStripSeparator());
            _toolbar.Items.Add(new ToolStripButton("コンパイル (F5)", null, (s, e) => Compile(false)) { ToolTipText = "コンパイル" });
            _toolbar.Items.Add(new ToolStripButton("デバッグビルド", null, (s, e) => Compile(true)) { ToolTipText = "デバッグ情報付き (Ctrl+F5)" });
            _toolbar.Items.Add(new ToolStripButton("実行 (F6)", null, (s, e) => CompileAndRun()) { ToolTipText = "コンパイル && 実行" });
            Controls.Add(_toolbar);

            // Status bar
            _statusBar = new StatusStrip();
            _statusLabel = new ToolStripStatusLabel("準備完了") { Spring = true, TextAlign = ContentAlignment.MiddleLeft };
            _posLabel = new ToolStripStatusLabel("行: 1  列: 1");
            _statusBar.Items.Add(_statusLabel);
            _statusBar.Items.Add(_posLabel);
            Controls.Add(_statusBar);

            // Main split: editor (top) | errors (bottom)
            _mainSplit = new SplitContainer
            {
                Dock = DockStyle.Fill,
                Orientation = Orientation.Horizontal,
                SplitterDistance = 480,
                Panel2MinSize = 80
            };

            // Editor panel with line numbers
            var editorPanel = new Panel { Dock = DockStyle.Fill };

            _lineNumbers = new RichTextBox
            {
                Width = 50,
                Dock = DockStyle.Left,
                ReadOnly = true,
                BackColor = Color.FromArgb(40, 40, 40),
                ForeColor = Color.FromArgb(130, 130, 130),
                Font = new Font("Consolas", 10f),
                BorderStyle = BorderStyle.None,
                ScrollBars = RichTextBoxScrollBars.None,
                Cursor = Cursors.Default,
                WordWrap = false
            };

            _editor = new RichTextBox
            {
                Dock = DockStyle.Fill,
                AcceptsTab = true,
                WordWrap = false,
                BorderStyle = BorderStyle.None,
                ScrollBars = RichTextBoxScrollBars.Both,
                DetectUrls = false,
                Font = new Font("Consolas", 10f)
            };
            SyntaxHighlighter.ApplyColors(_editor);

            _editor.TextChanged += (s, e) =>
            {
                _modified = true;
                UpdateTitle();
                _highlightTimer.Stop();
                _highlightTimer.Start();
            };
            _editor.SelectionChanged += (s, e) => UpdateCursorPos();
            _editor.VScroll += (s, e) => UpdateLineNumbers();
            _editor.Resize += (s, e) => UpdateLineNumbers();

            editorPanel.Controls.Add(_editor);
            editorPanel.Controls.Add(_lineNumbers);
            _mainSplit.Panel1.Controls.Add(editorPanel);

            // Error list
            _errorList = new ListBox
            {
                Dock = DockStyle.Fill,
                BackColor = Color.FromArgb(30, 30, 30),
                ForeColor = Color.FromArgb(212, 212, 212),
                Font = new Font("Consolas", 9f),
                BorderStyle = BorderStyle.None
            };
            _errorList.DoubleClick += ErrorList_DoubleClick;

            var errorLabel = new Label
            {
                Text = " エラー一覧",
                Dock = DockStyle.Top,
                Height = 20,
                BackColor = Color.FromArgb(45, 45, 45),
                ForeColor = Color.FromArgb(200, 200, 200),
                Font = new Font("Meiryo UI", 8.5f)
            };
            _mainSplit.Panel2.Controls.Add(_errorList);
            _mainSplit.Panel2.Controls.Add(errorLabel);

            Controls.Add(_mainSplit);

            // Highlight timer (delay to avoid per-keystroke highlighting)
            _highlightTimer = new Timer { Interval = 500 };
            _highlightTimer.Tick += (s, e) =>
            {
                _highlightTimer.Stop();
                SyntaxHighlighter.Highlight(_editor);
                UpdateLineNumbers();
            };
        }

        public void OpenFile(string path)
        {
            try
            {
                _editor.Text = File.ReadAllText(path);
                _currentFile = path;
                _modified = false;
                UpdateTitle();
                SyntaxHighlighter.Highlight(_editor);
                UpdateLineNumbers();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"ファイルを開けません: {ex.Message}", "エラー", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void NewFile()
        {
            _editor.Text = "#assembly \"MyApp\"\n\n#class public Program\n  #func public static int Main\n    print \"Hello NHSP!\"\n    return 0\n  #endfunc\n#endclass\n";
            _currentFile = null;
            _modified = false;
            UpdateTitle();
            SyntaxHighlighter.Highlight(_editor);
            UpdateLineNumbers();
        }

        private void OpenFileDialog()
        {
            using (var dlg = new OpenFileDialog())
            {
                dlg.Filter = "NHSP Files (*.nhsp)|*.nhsp|All Files (*.*)|*.*";
                if (dlg.ShowDialog() == DialogResult.OK) OpenFile(dlg.FileName);
            }
        }

        private void SaveFile()
        {
            if (_currentFile == null) { SaveFileAs(); return; }
            File.WriteAllText(_currentFile, _editor.Text);
            _modified = false;
            UpdateTitle();
            _statusLabel.Text = "保存しました: " + Path.GetFileName(_currentFile);
        }

        private void SaveFileAs()
        {
            using (var dlg = new SaveFileDialog())
            {
                dlg.Filter = "NHSP Files (*.nhsp)|*.nhsp|All Files (*.*)|*.*";
                if (_currentFile != null) dlg.FileName = Path.GetFileName(_currentFile);
                if (dlg.ShowDialog() == DialogResult.OK)
                {
                    _currentFile = dlg.FileName;
                    SaveFile();
                }
            }
        }

        private void Compile(bool debug)
        {
            if (_currentFile == null) SaveFileAs();
            if (_currentFile == null) return;
            SaveFile();

            _errorList.Items.Clear();
            var driver = new CompilerDriver();
            driver.Options.EmitDebugInfo = debug;

            string ext = _editor.Text.Contains("#main") ? ".exe" : ".dll";
            string outPath = Path.ChangeExtension(_currentFile, ext);

            var result = driver.Compile(_currentFile, outPath);
            foreach (var d in result.Diagnostics.Items)
                _errorList.Items.Add(d.ToString());

            if (result.Success)
            {
                _statusLabel.Text = $"コンパイル成功: {Path.GetFileName(outPath)}" + (debug ? " (Debug)" : "");
                _errorList.Items.Add($"--- コンパイル成功: {outPath} ---");
            }
            else
            {
                _statusLabel.Text = $"コンパイル失敗: {result.Diagnostics.Items.Count} エラー";
            }
        }

        private void CompileAndRun()
        {
            Compile(false);
            if (_currentFile == null) return;

            string exePath = Path.ChangeExtension(_currentFile, ".exe");
            if (!File.Exists(exePath))
            {
                _statusLabel.Text = "EXE が見つかりません。#main ブロックを追加してください。";
                return;
            }

            try
            {
                System.Diagnostics.Process.Start(exePath);
                _statusLabel.Text = "実行中: " + Path.GetFileName(exePath);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"実行エラー: {ex.Message}", "エラー", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ErrorList_DoubleClick(object sender, EventArgs e)
        {
            if (_errorList.SelectedItem == null) return;
            string item = _errorList.SelectedItem.ToString();
            // Parse (line,col): ...
            var m = System.Text.RegularExpressions.Regex.Match(item, @"\((\d+),(\d+)\)");
            if (m.Success)
            {
                int line = int.Parse(m.Groups[1].Value) - 1;
                if (line >= 0 && line < _editor.Lines.Length)
                {
                    int charIndex = _editor.GetFirstCharIndexFromLine(line);
                    _editor.Select(charIndex, _editor.Lines[line].Length);
                    _editor.ScrollToCaret();
                    _editor.Focus();
                }
            }
        }

        private void UpdateLineNumbers()
        {
            int firstLine = _editor.GetLineFromCharIndex(_editor.GetCharIndexFromPosition(new Point(0, 0)));
            int lastLine = _editor.GetLineFromCharIndex(_editor.GetCharIndexFromPosition(new Point(0, _editor.ClientSize.Height)));
            int totalLines = _editor.Lines.Length;

            var sb = new System.Text.StringBuilder();
            for (int i = firstLine; i <= Math.Min(lastLine + 1, totalLines); i++)
                sb.AppendLine((i + 1).ToString());

            if (_lineNumbers.Text != sb.ToString())
            {
                _lineNumbers.Text = sb.ToString();
                _lineNumbers.SelectAll();
                _lineNumbers.SelectionAlignment = HorizontalAlignment.Right;
                _lineNumbers.DeselectAll();
            }
        }

        private void UpdateCursorPos()
        {
            int idx = _editor.SelectionStart;
            int line = _editor.GetLineFromCharIndex(idx);
            int col = idx - _editor.GetFirstCharIndexFromLine(line);
            _posLabel.Text = $"行: {line + 1}  列: {col + 1}";
        }

        private void UpdateTitle()
        {
            string fname = _currentFile != null ? Path.GetFileName(_currentFile) : "無題";
            Text = $"{fname}{(_modified ? " *" : "")} - NHSP Editor";
        }

        protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
        {
            if (keyData == Keys.F5) { Compile(false); return true; }
            if (keyData == (Keys.Control | Keys.F5)) { Compile(true); return true; }
            if (keyData == Keys.F6) { CompileAndRun(); return true; }
            return base.ProcessCmdKey(ref msg, keyData);
        }
    }
}
