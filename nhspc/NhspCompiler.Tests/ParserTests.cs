using System.Linq;
using NhspCompiler.Core.Lexing;
using NhspCompiler.Core.Parsing;
using NhspCompiler.Core.Parsing.Ast;
using NhspCompiler.Core.Diagnostics;

namespace NhspCompiler.Tests
{
    public class ParserTests
    {
        private CompilationUnit Parse(string src)
        {
            var tokens = new Lexer(src).Tokenize();
            var diag = new DiagnosticBag();
            var unit = new Parser(tokens, diag).ParseCompilationUnit();
            Assert.IsFalse(diag.HasErrors, "Parser errors: " + string.Join("; ", diag.Items.Select(d => d.Message)));
            return unit;
        }

        [Test]
        public void ParseMinimalClass()
        {
            var unit = Parse("#assembly \"T\"\n#class Foo\n  #access public\n  #func Bar as int, public\n    return 42\n  endfunc\n#endclass");
            Assert.AreEqual("T", unit.AssemblyName);
            Assert.AreEqual(1, unit.Classes.Count);
            Assert.AreEqual("Foo", unit.Classes[0].Name);
            Assert.AreEqual(1, unit.Classes[0].Methods.Count);
            Assert.AreEqual("Bar", unit.Classes[0].Methods[0].Name);
            Assert.AreEqual("int", unit.Classes[0].Methods[0].ReturnType);
        }

        [Test]
        public void ParseLocalVar()
        {
            var unit = Parse("#assembly \"T\"\n#class C\n  #access public\n  #func M as int, public\n    dim x as int\n    x = 10\n    return x\n  endfunc\n#endclass");
            var body = unit.Classes[0].Methods[0].Body;
            Assert.IsTrue(body[0] is LocalVarDeclaration);
            Assert.IsTrue(body[1] is AssignmentStatement);
            Assert.IsTrue(body[2] is ReturnStatement);
        }

        [Test]
        public void ParseIfElse()
        {
            var unit = Parse("#assembly \"T\"\n#class C\n  #access public\n  #func M int x as int, public\n    if x > 0 {\n      return 1\n    } else {\n      return 0\n    }\n  endfunc\n#endclass");
            var body = unit.Classes[0].Methods[0].Body;
            Assert.IsTrue(body[0] is IfStatement);
            var ifStmt = (IfStatement)body[0];
            Assert.AreEqual(1, ifStmt.ThenBody.Count);
            Assert.AreEqual(1, ifStmt.ElseBody.Count);
        }

        [Test]
        public void ParseRepeatLoop()
        {
            var unit = Parse("#assembly \"T\"\n#class C\n  #access public\n  #func M as int, public\n    dim sum as int\n    sum = 0\n    repeat 10\n      sum += cnt\n    loop\n    return sum\n  endfunc\n#endclass");
            var body = unit.Classes[0].Methods[0].Body;
            Assert.IsTrue(body[2] is RepeatStatement);
        }

        [Test]
        public void ParseWhile()
        {
            var unit = Parse("#assembly \"T\"\n#class C\n  #access public\n  #func M int n as int, public\n    dim i as int\n    i = 0\n    while i < n\n      i += 1\n    wend\n    return i\n  endfunc\n#endclass");
            var body = unit.Classes[0].Methods[0].Body;
            Assert.IsTrue(body[2] is WhileStatement);
        }

        [Test]
        public void ParseExpressionPrecedence()
        {
            var tokens = new Lexer("return 1 + 2 * 3").Tokenize();
            var diag = new DiagnosticBag();
            // Parse just the expression part (skip 'return')
            // Use a full compilation unit wrapper
            var unit = Parse("#assembly \"T\"\n#class C\n  #access public\n  #func M as int, public\n    return 1 + 2 * 3\n  endfunc\n#endclass");
            var ret = (ReturnStatement)unit.Classes[0].Methods[0].Body[0];
            // Should be: (1) + (2 * 3) = BinaryExpr(+, 1, BinaryExpr(*, 2, 3))
            Assert.IsTrue(ret.Value is BinaryExpr);
            var bin = (BinaryExpr)ret.Value;
            Assert.AreEqual("+", bin.Operator);
            Assert.IsTrue(bin.Right is BinaryExpr);
            Assert.AreEqual("*", ((BinaryExpr)bin.Right).Operator);
        }
    }
}
