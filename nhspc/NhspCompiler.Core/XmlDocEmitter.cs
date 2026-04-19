using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using NhspCompiler.Core.Parsing.Ast;

namespace NhspCompiler.Core
{
    // Emits a Visual-Studio-compatible XML documentation file next to a compiled
    // DLL/EXE. The format follows the Microsoft C# XML doc spec: `<members>` list
    // with `<member name="..."/>` entries keyed by the ECMA-335 ID string
    // (T: for types, M: for methods, F: for fields, P: for properties).
    //
    // nhspc's doc comments aren't XML; they use `;;;` / `///` with `@param` /
    // `@return` tags. We translate the tag-based form to the XML form so Visual
    // Studio / JetBrains IDEs can pick it up automatically from a referenced DLL.
    public static class XmlDocEmitter
    {
        public static void Emit(CompilationUnit unit, string outputPath)
        {
            var settings = new XmlWriterSettings
            {
                Indent = true,
                IndentChars = "    ",
                OmitXmlDeclaration = false,
                Encoding = Encoding.UTF8
            };

            using (var w = XmlWriter.Create(outputPath, settings))
            {
                w.WriteStartDocument();
                w.WriteStartElement("doc");

                // <assembly><name>...</name></assembly>
                w.WriteStartElement("assembly");
                w.WriteElementString("name", unit.AssemblyName ?? "Assembly");
                w.WriteEndElement();

                w.WriteStartElement("members");

                foreach (var cls in unit.Classes)
                    WriteClass(w, cls);
                foreach (var iface in unit.Interfaces)
                    WriteInterface(w, iface);
                foreach (var en in unit.Enums)
                    WriteMember(w, "T:" + en.Name, en.Documentation);
                foreach (var del in unit.Delegates)
                    WriteMember(w, "T:" + del.Name, del.Documentation);

                w.WriteEndElement(); // members
                w.WriteEndElement(); // doc
                w.WriteEndDocument();
            }
        }

        private static void WriteClass(XmlWriter w, ClassDeclaration cls)
        {
            WriteMember(w, "T:" + cls.Name, cls.Documentation);
            foreach (var f in cls.Fields)
                WriteMember(w, "F:" + cls.Name + "." + f.Name, f.Documentation);
            foreach (var p in cls.Properties)
                WriteMember(w, "P:" + cls.Name + "." + p.Name, p.Documentation);
            foreach (var m in cls.Methods)
                WriteMember(w, "M:" + cls.Name + "." + m.Name + FormatParams(m.Parameters), m.Documentation, m.Parameters);
            foreach (var c in cls.Constructors)
                WriteMember(w, "M:" + cls.Name + ".#ctor" + FormatParams(c.Parameters), c.Documentation, c.Parameters);
            foreach (var e in cls.Events)
                WriteMember(w, "E:" + cls.Name + "." + e.Name, e.Documentation);
        }

        private static void WriteInterface(XmlWriter w, InterfaceDeclaration iface)
        {
            WriteMember(w, "T:" + iface.Name, iface.Documentation);
        }

        private static string FormatParams(List<ParameterDeclaration> ps)
        {
            if (ps == null || ps.Count == 0) return "";
            var sb = new StringBuilder("(");
            for (int i = 0; i < ps.Count; i++)
            {
                if (i > 0) sb.Append(',');
                sb.Append(ClrTypeName(ps[i].TypeName));
            }
            sb.Append(')');
            return sb.ToString();
        }

        // Map nhspc type aliases to CLR fully-qualified names for XML doc IDs.
        private static string ClrTypeName(string t)
        {
            if (string.IsNullOrEmpty(t)) return "System.Object";
            if (NhspCompiler.Core.Lexing.Keywords.TypeAliases.TryGetValue(
                    t.ToLowerInvariant(), out string clr))
                return clr;
            return t;
        }

        // Writes one `<member name="...">` with summary / params / returns if the
        // doc comment has content. Empty docs are skipped entirely.
        private static void WriteMember(XmlWriter w, string id, string doc,
            List<ParameterDeclaration> parameters = null)
        {
            if (string.IsNullOrWhiteSpace(doc)) return;

            w.WriteStartElement("member");
            w.WriteAttributeString("name", id);

            var parsed = ParseDoc(doc);
            if (!string.IsNullOrWhiteSpace(parsed.Summary))
            {
                w.WriteStartElement("summary");
                w.WriteString(parsed.Summary.Trim());
                w.WriteEndElement();
            }
            foreach (var kv in parsed.Params)
            {
                w.WriteStartElement("param");
                w.WriteAttributeString("name", kv.Key);
                w.WriteString(kv.Value);
                w.WriteEndElement();
            }
            if (parsed.Returns != null)
            {
                w.WriteStartElement("returns");
                w.WriteString(parsed.Returns);
                w.WriteEndElement();
            }

            w.WriteEndElement();
        }

        private struct ParsedDoc
        {
            public string Summary;
            public List<KeyValuePair<string, string>> Params;
            public string Returns;
        }

        private static ParsedDoc ParseDoc(string doc)
        {
            var r = new ParsedDoc { Params = new List<KeyValuePair<string, string>>() };
            var sum = new StringBuilder();
            foreach (var raw in doc.Split('\n'))
            {
                string line = raw.TrimEnd();
                string trim = line.TrimStart();
                if (trim.StartsWith("@param "))
                {
                    string rest = trim.Substring("@param ".Length).TrimStart();
                    int sp = rest.IndexOf(' ');
                    if (sp > 0)
                        r.Params.Add(new KeyValuePair<string, string>(
                            rest.Substring(0, sp), rest.Substring(sp + 1).TrimStart()));
                    else
                        r.Params.Add(new KeyValuePair<string, string>(rest, ""));
                }
                else if (trim.StartsWith("@return "))
                    r.Returns = trim.Substring("@return ".Length).TrimStart();
                else if (trim == "@return")
                    r.Returns = "";
                else
                    sum.AppendLine(line);
            }
            r.Summary = sum.ToString().Trim();
            return r;
        }
    }
}
