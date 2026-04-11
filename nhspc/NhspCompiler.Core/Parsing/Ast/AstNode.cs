namespace NhspCompiler.Core.Parsing.Ast
{
    public abstract class AstNode
    {
        public int Line { get; set; }
        public int Column { get; set; }
    }
}
