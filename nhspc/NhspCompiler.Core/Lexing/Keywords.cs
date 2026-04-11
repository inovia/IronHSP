using System.Collections.Generic;

namespace NhspCompiler.Core.Lexing
{
    public static class Keywords
    {
        public static readonly HashSet<string> All = new HashSet<string>
        {
            "assembly", "class", "endclass", "interface", "endinterface",
            "struct", "endstruct", "delegate",
            "access", "field", "func", "endfunc", "init", "endinit",
            "property", "endproperty", "endget", "endset",
            "return", "as", "dim", "newobj", "mcall",
            "if", "else", "elseif", "endif",
            "repeat", "loop", "while", "wend", "for", "to", "step", "next",
            "break", "continue", "print",
            "try", "catch", "finally", "endtry", "throw",
            "lock", "endlock", "sleep",
            "public", "private", "protected", "static", "virtual", "override", "abstract",
            "ref", "out", "const", "readonly",
            "sealed", "params", "is", "as", "when",
            "destructor", "enddestructor",
            "event", "endevent", "indexer", "endindexer", "operator", "endoperator",
            "enum", "endenum",
            "switch", "case", "default", "endswitch",
            "foreach", "in",
            "new", "dllimport", "dllfunc", "attribute",
            "namespace", "endnamespace", "using", "endusing", "reference",
            "include",
            "main", "endmain",
            "typeof",
            "and", "or", "not",  // alternative logical operators
        };

        public static readonly Dictionary<string, string> TypeAliases = new Dictionary<string, string>
        {
            { "int",    "System.Int32" },
            { "int64",  "System.Int64" },
            { "double", "System.Double" },
            { "float",  "System.Single" },
            { "string", "System.String" },
            { "bool",   "System.Boolean" },
            { "void",   "System.Void" },
            { "var",    "System.Object" },
            { "byte",   "System.Byte" },
            { "sbyte",  "System.SByte" },
            { "short",  "System.Int16" },
            { "ushort", "System.UInt16" },
            { "uint",   "System.UInt32" },
            { "ulong",  "System.UInt64" },
            { "long",   "System.Int64" },
            { "object", "System.Object" },
            { "char",   "System.Char" },
            { "intptr", "System.IntPtr" },
            { "uintptr","System.UIntPtr" },
        };

        public static bool IsKeyword(string word) => All.Contains(word);
        public static bool IsTypeName(string word) => TypeAliases.ContainsKey(word);
    }
}
