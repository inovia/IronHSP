namespace NhspCompiler.Core.Lexing
{
    public enum TokenKind
    {
        // Literals
        IntLiteral,
        DoubleLiteral,
        StringLiteral,
        BoolLiteral,

        // Identifiers & Keywords
        Identifier,
        Keyword,
        TypeName,

        // Symbols
        Hash,           // #
        Comma,          // ,
        LParen,         // (
        RParen,         // )
        LBrace,         // {
        RBrace,         // }
        Plus,           // +
        Minus,          // -
        Star,           // *
        Slash,          // /
        Percent,        // %
        Equals,         // =
        Dot,            // .
        Bang,           // !
        Colon,          // :

        // Comparison
        EqualEqual,     // ==
        BangEqual,      // !=
        Less,           // <
        Greater,        // >
        LessEqual,      // <=
        GreaterEqual,   // >=

        // Logical
        AmpAmp,         // &&
        PipePipe,       // ||

        // Compound assignment
        PlusEqual,      // +=
        MinusEqual,     // -=
        StarEqual,      // *=
        SlashEqual,     // /=

        // Special
        EOL,
        EOF,
    }

    public struct Token
    {
        public TokenKind Kind;
        public string Text;
        public int Line;
        public int Column;

        public Token(TokenKind kind, string text, int line, int column)
        {
            Kind = kind;
            Text = text;
            Line = line;
            Column = column;
        }

        public override string ToString() => $"[{Kind} \"{Text}\" L{Line}:{Column}]";
    }
}
