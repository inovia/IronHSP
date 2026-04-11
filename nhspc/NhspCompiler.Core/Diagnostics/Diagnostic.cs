using System.Collections.Generic;
using System.Linq;

namespace NhspCompiler.Core.Diagnostics
{
    public enum Severity { Error, Warning, Info }

    public class Diagnostic
    {
        public Severity Severity { get; set; }
        public int Line { get; set; }
        public int Column { get; set; }
        public string Message { get; set; }

        public override string ToString()
        {
            string sev = Severity == Severity.Error ? "error" : Severity == Severity.Warning ? "warning" : "info";
            return $"({Line},{Column}): {sev}: {Message}";
        }
    }

    public class DiagnosticBag
    {
        private readonly List<Diagnostic> _items = new List<Diagnostic>();

        public IReadOnlyList<Diagnostic> Items => _items;
        public bool HasErrors => _items.Any(d => d.Severity == Severity.Error);

        public void Error(int line, int col, string message)
        {
            _items.Add(new Diagnostic { Severity = Severity.Error, Line = line, Column = col, Message = message });
        }

        public void Warning(int line, int col, string message)
        {
            _items.Add(new Diagnostic { Severity = Severity.Warning, Line = line, Column = col, Message = message });
        }
    }
}
