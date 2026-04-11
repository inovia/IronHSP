using System.Collections.Generic;

namespace NhspCompiler.Core.Parsing.Ast
{
    public abstract class Statement : AstNode { }

    public class ReturnStatement : Statement
    {
        public Expression Value { get; set; }
    }

    public class ExpressionStatement : Statement
    {
        public Expression Expr { get; set; }
    }

    public class LocalVarDeclaration : Statement
    {
        public string Name { get; set; }
        public string TypeName { get; set; } // null = infer from initializer
        public Expression Initializer { get; set; } // null = default
        public int ArraySize { get; set; } // > 0 = array declaration
    }

    public class AssignmentStatement : Statement
    {
        public string VariableName { get; set; }
        public string Operator { get; set; } // "=", "+=", "-=", "*=", "/="
        public Expression Value { get; set; }
    }

    public class IfStatement : Statement
    {
        public Expression Condition { get; set; }
        public List<Statement> ThenBody { get; set; } = new List<Statement>();
        public List<ElseIfClause> ElseIfs { get; set; } = new List<ElseIfClause>();
        public List<Statement> ElseBody { get; set; } = new List<Statement>();
    }

    public class ElseIfClause : AstNode
    {
        public Expression Condition { get; set; }
        public List<Statement> Body { get; set; } = new List<Statement>();
    }

    public class RepeatStatement : Statement
    {
        public Expression Count { get; set; } // null = infinite
        public List<Statement> Body { get; set; } = new List<Statement>();
    }

    public class WhileStatement : Statement
    {
        public Expression Condition { get; set; }
        public List<Statement> Body { get; set; } = new List<Statement>();
    }

    public class BreakStatement : Statement { }
    public class ContinueStatement : Statement { }

    public class ForStatement : Statement
    {
        public string VarName { get; set; }
        public Expression Start { get; set; }
        public Expression End { get; set; }
        public Expression Step { get; set; } // null = 1
        public List<Statement> Body { get; set; } = new List<Statement>();
    }

    public class FieldAssignStatement : Statement
    {
        public string FieldName { get; set; }
        public string Operator { get; set; } = "=";
        public Expression Value { get; set; }
    }

    public class PrintStatement : Statement
    {
        public Expression Value { get; set; }
    }

    // arr(i) = expr
    public class IndexAssignStatement : Statement
    {
        public string ArrayName { get; set; }
        public Expression Index { get; set; }
        public Expression Value { get; set; }
    }
}
