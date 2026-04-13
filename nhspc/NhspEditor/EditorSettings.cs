using System;
using System.IO;

namespace NhspEditor
{
    internal sealed class EditorSettings
    {
        private static readonly string SettingsPath = Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
            "NhspEditor", "settings.ini");

        public string Platform { get; set; } = "anycpu";
        public string RunArguments { get; set; } = "";
        public string Target { get; set; } = "auto";        // auto | exe | dll
        public string Subsystem { get; set; } = "console";  // console | windows

        public static EditorSettings Default { get; } = Load();

        private static EditorSettings Load()
        {
            var s = new EditorSettings();
            try
            {
                if (!File.Exists(SettingsPath)) return s;
                foreach (var line in File.ReadAllLines(SettingsPath))
                {
                    int eq = line.IndexOf('=');
                    if (eq <= 0) continue;
                    string k = line.Substring(0, eq).Trim();
                    string v = line.Substring(eq + 1);
                    if (k == "Platform") s.Platform = v;
                    else if (k == "RunArguments") s.RunArguments = v;
                    else if (k == "Target") s.Target = v;
                    else if (k == "Subsystem") s.Subsystem = v;
                }
            }
            catch { }
            return s;
        }

        public void Save()
        {
            try
            {
                Directory.CreateDirectory(Path.GetDirectoryName(SettingsPath));
                File.WriteAllLines(SettingsPath, new[]
                {
                    "Platform=" + (Platform ?? ""),
                    "RunArguments=" + (RunArguments ?? ""),
                    "Target=" + (Target ?? ""),
                    "Subsystem=" + (Subsystem ?? ""),
                });
            }
            catch { }
        }
    }
}
