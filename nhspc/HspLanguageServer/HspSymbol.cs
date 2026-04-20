using System;
using System.Collections.Generic;

namespace HspLanguageServer {
    // One symbol as reported by hspcmp's -ll / -lv / -ls listings.
    //
    //   dfnc — #deffunc / #defcfunc (user-defined function)
    //   dlab — *label (user-defined label)
    //   dvar — variable (introduced by first assignment or dim/sdim/ddim)
    //   dmac — #define / #const / #enum / module name
    //
    // Kind strings are kept as-is from the hspcmp output so the LSP layer can
    // map them to DocumentSymbol kinds.
    internal sealed class HspSymbol {
        public string Kind;    // "dfnc" / "dlab" / "dvar" / "dmac"
        public string Name;
        public int Line;       // 1-based source line
        public string File;    // basename as emitted by hspcmp
        public string AbsPath; // resolved against the run cwd if possible

        // Doc comment fields (populated by DocCommentParser when the symbol
        // declaration is preceded by a contiguous block of ;;; or /// lines).
        public string DocDescription;            // free-form intro
        public List<HspDocParam> DocParams;      // @param entries in order
        public string DocReturn;                 // @return text

        // Parameter list extracted from the declaration syntax itself (used
        // by signatureHelp). Populated only for function-like symbols.
        public List<HspSigParam> SigParams;
    }

    internal sealed class HspSigParam {
        public string Type;   // e.g. "int", "double", "str", "var", empty for #func w/o type tag
        public string Name;   // e.g. "_a" for #deffunc; "" for #func with anonymous params
    }

    internal sealed class HspDocParam {
        public string Name;
        public string Description;
    }

    // A parsed snapshot of a single .hsp / .as file after an hspcmp run.
    internal sealed class HspDocument {
        public string Uri;
        public string AbsPath;
        public string Text;
        // Symbols declared in this specific file (filtered from hspcmp's
        // workspace-wide listing).
        public readonly List<HspSymbol> LocalSymbols = new List<HspSymbol>();
        // Full workspace symbol table (copy, for completion/definition).
        public Dictionary<string, List<HspSymbol>> WorkspaceSymbols =
            new Dictionary<string, List<HspSymbol>>(StringComparer.OrdinalIgnoreCase);
        // Diagnostics parsed from hspcmp stderr/stdout.
        public readonly List<HspDiagnostic> Diagnostics = new List<HspDiagnostic>();
    }

    internal sealed class HspDiagnostic {
        public string File;   // basename from compiler output
        public int Line;      // 1-based
        public string Code;   // "error 2"
        public string Message;
        public int Severity;  // 1=error, 2=warning
    }
}
