using System.Collections.Generic;

namespace NhspCompiler.Core.Lexing
{
    public static class Keywords
    {
        public static readonly HashSet<string> All = new HashSet<string>
        {
            "assembly", "class", "endclass", "interface", "endinterface",
            "access", "field", "func", "endfunc", "init", "endinit",
            "property", "endproperty", "get", "endget", "set", "endset",
            "return", "if", "else", "repeat", "loop", "break", "continue",
            "public", "private", "protected", "static", "virtual", "override", "abstract",
            "as", "dim", "newobj", "mcall",
            "namespace", "endnamespace",
            "using", "reference",
            "main", "endmain",
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
            { "short",  "System.Int16" },
            { "long",   "System.Int64" },
            { "object", "System.Object" },
        };

        public static bool IsKeyword(string word) => All.Contains(word);
        public static bool IsTypeName(string word) => TypeAliases.ContainsKey(word);
    }
}
