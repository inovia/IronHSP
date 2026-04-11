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
            Assert.IsFalse(diag.HasErrors, "Errors: " + string.Join("; ", diag.Items.Select(d => d.Message)));
            return unit;
        }

        [Test] public void MinimalClass()
        {
            var u = Parse("#assembly \"T\"\n#class public Foo\n  #func public int Bar\n    return 42\n  #endfunc\n#endclass");
            Assert.AreEqual("T", u.AssemblyName);
            Assert.AreEqual("Foo", u.Classes[0].Name);
            Assert.AreEqual("Bar", u.Classes[0].Methods[0].Name);
            Assert.AreEqual("int", u.Classes[0].Methods[0].ReturnType);
            Assert.AreEqual("public", u.Classes[0].Methods[0].Access);
        }

        [Test] public void LocalVar()
        {
            var u = Parse("#assembly \"T\"\n#class public C\n  #func public int M\n    dim int x\n    x = 10\n    return x\n  #endfunc\n#endclass");
            Assert.IsTrue(u.Classes[0].Methods[0].Body[0] is LocalVarDeclaration);
            Assert.IsTrue(u.Classes[0].Methods[0].Body[1] is AssignmentStatement);
        }

        [Test] public void IfElse()
        {
            var u = Parse("#assembly \"T\"\n#class public C\n  #func public int M, int x\n    if x > 0 {\n      return 1\n    } else {\n      return 0\n    }\n  #endfunc\n#endclass");
            Assert.IsTrue(u.Classes[0].Methods[0].Body[0] is IfStatement);
        }

        [Test] public void RepeatLoop()
        {
            var u = Parse("#assembly \"T\"\n#class public C\n  #func public int M\n    dim int s\n    s = 0\n    repeat 10\n      s += cnt\n    loop\n    return s\n  #endfunc\n#endclass");
            Assert.IsTrue(u.Classes[0].Methods[0].Body[2] is RepeatStatement);
        }

        [Test] public void WhileLoop()
        {
            var u = Parse("#assembly \"T\"\n#class public C\n  #func public int M, int n\n    dim int i\n    i = 0\n    while i < n\n      i += 1\n    wend\n    return i\n  #endfunc\n#endclass");
            Assert.IsTrue(u.Classes[0].Methods[0].Body[2] is WhileStatement);
        }

        [Test] public void Precedence()
        {
            var u = Parse("#assembly \"T\"\n#class public C\n  #func public int M\n    return 1 + 2 * 3\n  #endfunc\n#endclass");
            var ret = (ReturnStatement)u.Classes[0].Methods[0].Body[0];
            var bin = (BinaryExpr)ret.Value;
            Assert.AreEqual("+", bin.Operator);
            Assert.IsTrue(bin.Right is BinaryExpr);
            Assert.AreEqual("*", ((BinaryExpr)bin.Right).Operator);
        }
    }
}
