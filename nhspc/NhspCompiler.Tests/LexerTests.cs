using NhspCompiler.Core.Lexing;

namespace NhspCompiler.Tests
{
    public class LexerTests
    {
        [Test]
        public void TokenizeSimple()
        {
            var lexer = new Lexer("dim x as int");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.Keyword, tokens[0].Kind, "dim");
            Assert.AreEqual(TokenKind.Identifier, tokens[1].Kind, "x");
            Assert.AreEqual(TokenKind.Keyword, tokens[2].Kind, "as");
            Assert.AreEqual(TokenKind.TypeName, tokens[3].Kind, "int");
        }

        [Test]
        public void TokenizeOperators()
        {
            var lexer = new Lexer("a == b != c <= d >= e && f || g");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.EqualEqual, tokens[1].Kind);
            Assert.AreEqual(TokenKind.BangEqual, tokens[3].Kind);
            Assert.AreEqual(TokenKind.LessEqual, tokens[5].Kind);
            Assert.AreEqual(TokenKind.GreaterEqual, tokens[7].Kind);
            Assert.AreEqual(TokenKind.AmpAmp, tokens[9].Kind);
            Assert.AreEqual(TokenKind.PipePipe, tokens[11].Kind);
        }

        [Test]
        public void TokenizeCompoundAssign()
        {
            var lexer = new Lexer("x += 1\ny -= 2\nz *= 3");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.PlusEqual, tokens[1].Kind);
            Assert.AreEqual(TokenKind.MinusEqual, tokens[5].Kind);
            Assert.AreEqual(TokenKind.StarEqual, tokens[9].Kind);
        }

        [Test]
        public void TokenizeBoolLiterals()
        {
            var lexer = new Lexer("true false");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.BoolLiteral, tokens[0].Kind);
            Assert.AreEqual("true", tokens[0].Text);
            Assert.AreEqual(TokenKind.BoolLiteral, tokens[1].Kind);
            Assert.AreEqual("false", tokens[1].Text);
        }

        [Test]
        public void TokenizeDoubleLiteral()
        {
            var lexer = new Lexer("3.14");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.DoubleLiteral, tokens[0].Kind);
            Assert.AreEqual("3.14", tokens[0].Text);
        }

        [Test]
        public void TokenizeComment()
        {
            var lexer = new Lexer("x = 1 ; comment\ny = 2 // another");
            var tokens = lexer.Tokenize();
            // x = 1 EOL y = 2 EOL EOF  (comments stripped)
            Assert.AreEqual(TokenKind.Identifier, tokens[0].Kind);
            Assert.AreEqual("x", tokens[0].Text);
        }
    }
}
