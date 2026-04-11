namespace NhspCompiler.Core.Parsing.Ast
{
    public abstract class Expression : AstNode { }

    public class IntLiteralExpr : Expression
    {
        public int Value { get; set; }
    }

    public class StringLiteralExpr : Expression
    {
        public string Value { get; set; }
    }

    public class IdentifierExpr : Expression
    {
        public string Name { get; set; }
    }

    public class BinaryExpr : Expression
    {
        public Expression Left { get; set; }
        public string Operator { get; set; } // "+", "-", "*", "/"
        public Expression Right { get; set; }
    }
}
