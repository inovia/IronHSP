using System.Collections.Generic;

namespace NhspCompiler.Core.Parsing.Ast
{
    public abstract class Expression : AstNode { }

    public class IntLiteralExpr : Expression
    {
        public int Value { get; set; }
    }

    public class DoubleLiteralExpr : Expression
    {
        public double Value { get; set; }
    }

    public class StringLiteralExpr : Expression
    {
        public string Value { get; set; }
    }

    public class BoolLiteralExpr : Expression
    {
        public bool Value { get; set; }
    }

    public class IdentifierExpr : Expression
    {
        public string Name { get; set; }
    }

    public class BinaryExpr : Expression
    {
        public Expression Left { get; set; }
        public string Operator { get; set; } // +, -, *, /, %, ==, !=, <, >, <=, >=, &&, ||
        public Expression Right { get; set; }
    }

    public class UnaryExpr : Expression
    {
        public string Operator { get; set; } // -, !
        public Expression Operand { get; set; }
    }

    public class CallExpr : Expression
    {
        public string MethodName { get; set; }
        public Expression Target { get; set; } // null = local/static call
        public List<Expression> Arguments { get; set; } = new List<Expression>();
    }

    // cnt (repeat counter)
    public class CntExpr : Expression { }

    // Member access: obj.Field or this.Field
    public class MemberAccessExpr : Expression
    {
        public Expression Target { get; set; }
        public string MemberName { get; set; }
    }

    // new object creation: newobj(ClassName, args...)
    public class NewObjectExpr : Expression
    {
        public string TypeName { get; set; }
        public List<Expression> Arguments { get; set; } = new List<Expression>();
    }

    // this reference
    public class ThisExpr : Expression { }
}
