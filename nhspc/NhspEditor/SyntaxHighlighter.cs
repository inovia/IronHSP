using System.Collections.Generic;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace NhspEditor
{
    public static class SyntaxHighlighter
    {
        private static readonly HashSet<string> Directives = new HashSet<string>
        {
            "#assembly","#reference","#using","#namespace","#endnamespace","#include",
            "#class","#endclass","#struct","#endstruct","#interface","#endinterface",
            "#enum","#endenum","#delegate",
            "#func","#endfunc","#init","#endinit","#field",
            "#property","#endproperty","#get","#endget","#set","#endset",
            "#event","#endevent","#indexer","#endindexer",
            "#operator","#endoperator","#destructor","#enddestructor",
            "#main","#endmain","#dllimport","#dllfunc","#attribute","#access"
        };

        private static readonly HashSet<string> Keywords = new HashSet<string>
        {
            "if","else","elseif","endif","repeat","loop","while","wend",
            "for","to","step","next","foreach","in","switch","case","default","endswitch",
            "break","continue","return","throw","try","catch","finally","endtry","when",
            "lock","endlock","using","endusing",
            "public","private","protected","static","virtual","override","abstract","sealed",
            "const","readonly","ref","out","params","new","dim","print","sleep",
            "and","or","not","is","as","typeof","null","nullptr"
        };

        private static readonly HashSet<string> Types = new HashSet<string>
        {
            "int","int64","long","short","ushort","uint","ulong",
            "double","float","string","bool","byte","sbyte","char",
            "void","var","object","intptr","uintptr"
        };

        private static readonly Color DirectiveColor = Color.FromArgb(86, 156, 214);   // blue
        private static readonly Color KeywordColor = Color.FromArgb(197, 134, 192);     // purple
        private static readonly Color TypeColor = Color.FromArgb(78, 201, 176);         // teal
        private static readonly Color StringColor = Color.FromArgb(206, 145, 120);      // orange
        private static readonly Color CommentColor = Color.FromArgb(106, 153, 85);      // green
        private static readonly Color NumberColor = Color.FromArgb(181, 206, 168);      // light green
        private static readonly Color DefaultColor = Color.FromArgb(212, 212, 212);     // light gray
        private static readonly Color BgColor = Color.FromArgb(30, 30, 30);             // dark bg

        public static void ApplyColors(RichTextBox rtb)
        {
            rtb.BackColor = BgColor;
            rtb.ForeColor = DefaultColor;
            rtb.Font = new Font("Consolas", 10f);
        }

        public static void Highlight(RichTextBox rtb)
        {
            int selStart = rtb.SelectionStart;
            int selLen = rtb.SelectionLength;
            rtb.SuspendLayout();

            // Reset all to default
            rtb.SelectAll();
            rtb.SelectionColor = DefaultColor;

            string text = rtb.Text;

            // Comments: ; or //
            HighlightPattern(rtb, text, @";[^\n]*", CommentColor);
            HighlightPattern(rtb, text, @"//[^\n]*", CommentColor);

            // Strings
            HighlightPattern(rtb, text, @"\$""(?:[^""\\]|\\.)*""", StringColor);  // interpolated
            HighlightPattern(rtb, text, @"""(?:[^""\\]|\\.)*""", StringColor);

            // Numbers
            HighlightPattern(rtb, text, @"\b(0[xX][0-9a-fA-F]+|\$[0-9a-fA-F]+)\b", NumberColor);
            HighlightPattern(rtb, text, @"\b\d+\.?\d*\b", NumberColor);

            // Directives: #keyword
            HighlightPattern(rtb, text, @"#[a-zA-Z]+", DirectiveColor, true);

            // Keywords and types (word boundary)
            HighlightWords(rtb, text, Keywords, KeywordColor);
            HighlightWords(rtb, text, Types, TypeColor);

            rtb.SelectionStart = selStart;
            rtb.SelectionLength = selLen;
            rtb.ResumeLayout();
        }

        private static void HighlightPattern(RichTextBox rtb, string text, string pattern, Color color, bool checkDirective = false)
        {
            foreach (Match m in Regex.Matches(text, pattern))
            {
                if (checkDirective && !Directives.Contains(m.Value.ToLowerInvariant())) continue;
                rtb.Select(m.Index, m.Length);
                rtb.SelectionColor = color;
            }
        }

        private static void HighlightWords(RichTextBox rtb, string text, HashSet<string> words, Color color)
        {
            foreach (Match m in Regex.Matches(text, @"\b[a-zA-Z_]\w*\b"))
            {
                if (words.Contains(m.Value.ToLowerInvariant()))
                {
                    rtb.Select(m.Index, m.Length);
                    rtb.SelectionColor = color;
                }
            }
        }
    }
}
