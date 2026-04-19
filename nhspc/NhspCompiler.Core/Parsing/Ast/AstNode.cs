namespace NhspCompiler.Core.Parsing.Ast
{
    public abstract class AstNode
    {
        public int Line { get; set; }
        public int Column { get; set; }

        // C# `///` / Rust `;;;` style doc comment collected immediately above this
        // declaration by the parser. Raw text with `\n` between lines; supports
        // `@param name desc` and `@return desc` tags (not parsed structurally —
        // the LSP renders them for hover / completion).
        public string Documentation { get; set; }
    }
}
