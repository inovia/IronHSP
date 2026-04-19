using NhspCompiler.Core.Lexing;

namespace NhspCompiler.Tests
{
    public class LexerTests
    {
        [Test]
        public void TokenizeSimple()
        {
            var lexer = new Lexer("dim int x");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.Keyword, tokens[0].Kind, "dim");
            Assert.AreEqual(TokenKind.TypeName, tokens[1].Kind, "int");
            Assert.AreEqual(TokenKind.Identifier, tokens[2].Kind, "x");
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
        public void TokenizeHex0x()
        {
            var lexer = new Lexer("x = 0xFF");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.IntLiteral, tokens[2].Kind);
            Assert.AreEqual("255", tokens[2].Text);
        }

        [Test]
        public void TokenizeHexDollar()
        {
            var lexer = new Lexer("x = $1A");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.IntLiteral, tokens[2].Kind);
            Assert.AreEqual("26", tokens[2].Text);
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

        [Test]
        public void TokenizeDocCommentTripleSemi()
        {
            var lexer = new Lexer(";;; summary text\n#class Foo");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.DocComment, tokens[0].Kind);
            Assert.AreEqual("summary text", tokens[0].Text);
        }

        [Test]
        public void TokenizeDocCommentTripleSlash()
        {
            var lexer = new Lexer("/// summary text\n#class Foo");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.DocComment, tokens[0].Kind);
            Assert.AreEqual("summary text", tokens[0].Text);
        }

        [Test]
        public void TokenizeDocCommentOnlyAtLineStart()
        {
            // `x = 1 ;;; trailing` — `;;;` after code is a plain comment, not doc.
            var lexer = new Lexer("x = 1 ;;; not a doc\n");
            var tokens = lexer.Tokenize();
            foreach (var t in tokens)
                Assert.IsFalse(t.Kind == TokenKind.DocComment, "trailing ;;; must not be a DocComment");
        }

        [Test]
        public void TokenizeDocCommentStripsMarker()
        {
            // `;;` (only 2) is plain; `;;;;` (4+) is still a doc with the content after the marker.
            var lexer = new Lexer(";;;;  leading-ws kept-after-one-space\n");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.DocComment, tokens[0].Kind);
            Assert.AreEqual(" leading-ws kept-after-one-space", tokens[0].Text);
        }

        [Test]
        public void TokenizeDocCommentWithTags()
        {
            var lexer = new Lexer(";;; @param id user id\n;;; @return name\n");
            var tokens = lexer.Tokenize();
            Assert.AreEqual(TokenKind.DocComment, tokens[0].Kind);
            Assert.AreEqual("@param id user id", tokens[0].Text);
            // tokens[1] is EOL, tokens[2] is next DocComment
            Assert.AreEqual(TokenKind.EOL, tokens[1].Kind);
            Assert.AreEqual(TokenKind.DocComment, tokens[2].Kind);
            Assert.AreEqual("@return name", tokens[2].Text);
        }
    }
}
