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

    // Field assignment: Name = expr  or  this.Name = expr (within class method)
    public class FieldAssignStatement : Statement
    {
        public string FieldName { get; set; }
        public string Operator { get; set; } = "=";
        public Expression Value { get; set; }
    }
}
