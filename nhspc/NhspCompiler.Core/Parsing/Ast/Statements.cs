namespace NhspCompiler.Core.Parsing.Ast
{
    public abstract class Statement : AstNode { }

    public class ReturnStatement : Statement
    {
        public Expression Value { get; set; } // null = void return
    }

    public class ExpressionStatement : Statement
    {
        public Expression Expr { get; set; }
    }
}
