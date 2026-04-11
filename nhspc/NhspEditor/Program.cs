using System;
using System.Windows.Forms;

namespace NhspEditor
{
    static class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            var form = new MainForm();
            if (args.Length > 0) form.OpenFile(args[0]);
            Application.Run(form);
        }
    }
}
