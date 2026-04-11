using System.Collections.Generic;

namespace NhspCompiler.Core.Parsing.Ast
{
    public class CompilationUnit : AstNode
    {
        public string AssemblyName { get; set; }
        public string OutputType { get; set; } = "dll"; // dll or exe
        public List<string> References { get; set; } = new List<string>();
        public List<string> Usings { get; set; } = new List<string>();
        public List<InterfaceDeclaration> Interfaces { get; set; } = new List<InterfaceDeclaration>();
        public List<ClassDeclaration> Classes { get; set; } = new List<ClassDeclaration>();
        public List<Statement> MainBody { get; set; } // null = no entry point (DLL)
    }

    public class InterfaceDeclaration : AstNode
    {
        public string Name { get; set; }
        public string Access { get; set; } = "public";
        public List<AttributeDeclaration> Attributes { get; set; } = new List<AttributeDeclaration>();
        public List<MethodSignature> Methods { get; set; } = new List<MethodSignature>();
    }

    public class MethodSignature : AstNode
    {
        public string Name { get; set; }
        public string ReturnType { get; set; } = "void";
        public List<ParameterDeclaration> Parameters { get; set; } = new List<ParameterDeclaration>();
    }

    public class ClassDeclaration : AstNode
    {
        public string Name { get; set; }
        public string BaseClass { get; set; }
        public List<string> Interfaces { get; set; } = new List<string>();
        public string DefaultAccess { get; set; } = "public";
        public List<AttributeDeclaration> Attributes { get; set; } = new List<AttributeDeclaration>();
        public List<FieldDeclaration> Fields { get; set; } = new List<FieldDeclaration>();
        public List<ConstructorDeclaration> Constructors { get; set; } = new List<ConstructorDeclaration>();
        public List<MethodDeclaration> Methods { get; set; } = new List<MethodDeclaration>();
        public List<PropertyDeclaration> Properties { get; set; } = new List<PropertyDeclaration>();
    }

    public class FieldDeclaration : AstNode
    {
        public string Name { get; set; }
        public string TypeName { get; set; }
        public string Access { get; set; } = "public";
    }

    public class ParameterDeclaration : AstNode
    {
        public string TypeName { get; set; }
        public string Name { get; set; }
    }

    public class MethodDeclaration : AstNode
    {
        public string Name { get; set; }
        public string ReturnType { get; set; } = "void";
        public string Access { get; set; } = "public";
        public bool IsStatic { get; set; }
        public bool IsVirtual { get; set; }
        public bool IsOverride { get; set; }
        public List<ParameterDeclaration> Parameters { get; set; } = new List<ParameterDeclaration>();
        public List<Statement> Body { get; set; } = new List<Statement>();

        // P/Invoke
        public string DllImportName { get; set; } // null = not P/Invoke
        public string DllImportEntryPoint { get; set; } // null = same as Name
    }

    // Attribute on class/interface
    public class AttributeDeclaration : AstNode
    {
        public string Name { get; set; } // "Guid", "ClassInterface", etc.
        public List<string> Arguments { get; set; } = new List<string>();
    }

    public class ConstructorDeclaration : AstNode
    {
        public string Access { get; set; } = "public";
        public List<ParameterDeclaration> Parameters { get; set; } = new List<ParameterDeclaration>();
        public List<Statement> Body { get; set; } = new List<Statement>();
    }

    public class PropertyDeclaration : AstNode
    {
        public string Name { get; set; }
        public string TypeName { get; set; }
        public string Access { get; set; } = "public";
        public List<Statement> GetterBody { get; set; }
        public List<Statement> SetterBody { get; set; }
    }
}
