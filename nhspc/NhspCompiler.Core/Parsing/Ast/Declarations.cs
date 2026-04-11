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
        public List<DelegateDeclaration> Delegates { get; set; } = new List<DelegateDeclaration>();
        public List<EnumDeclaration> Enums { get; set; } = new List<EnumDeclaration>();
        public List<string> Includes { get; set; } = new List<string>();
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

    public class EnumDeclaration : AstNode
    {
        public string Name { get; set; }
        public string Access { get; set; } = "public";
        public string UnderlyingType { get; set; } = "int";
        public List<EnumMemberDeclaration> Members { get; set; } = new List<EnumMemberDeclaration>();
    }

    public class EnumMemberDeclaration : AstNode
    {
        public string Name { get; set; }
        public int? Value { get; set; } // null = auto-increment
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
        public List<EventDeclaration> Events { get; set; } = new List<EventDeclaration>();
        public List<IndexerDeclaration> Indexers { get; set; } = new List<IndexerDeclaration>();
        public List<OperatorDeclaration> Operators { get; set; } = new List<OperatorDeclaration>();
        public List<ClassDeclaration> NestedClasses { get; set; } = new List<ClassDeclaration>();

        public bool IsSealed { get; set; }
        public bool IsAbstract { get; set; }
        public bool HasStaticConstructor { get; set; }
        public List<Statement> StaticConstructorBody { get; set; }

        // Struct support
        public bool IsStruct { get; set; }
        public string LayoutKind { get; set; } // "Sequential", "Explicit", "Auto" (null = auto for class)
        public int Pack { get; set; } // 0 = default
        public int Size { get; set; } // 0 = default
        public string StructCharSet { get; set; } // "Ansi", "Unicode", "Auto", null = default
    }

    public class FieldDeclaration : AstNode
    {
        public string Name { get; set; }
        public string TypeName { get; set; }
        public string Access { get; set; } = "public";
        public bool IsConst { get; set; }
        public bool IsReadonly { get; set; }
        public bool IsStatic { get; set; }
        public Expression ConstValue { get; set; } // for const fields
        public List<ParameterAttribute> Attributes { get; set; } = new List<ParameterAttribute>(); // [MarshalAs] etc.
        public int FieldOffset { get; set; } = -1; // for Explicit layout structs (-1 = not set)
    }

    public class ParameterDeclaration : AstNode
    {
        public string TypeName { get; set; }
        public string Name { get; set; }
        public bool IsRef { get; set; }
        public bool IsOut { get; set; }
        public bool IsIn { get; set; }
        public bool IsParams { get; set; }
        public Expression DefaultValue { get; set; } // null = no default
        public List<ParameterAttribute> Attributes { get; set; } = new List<ParameterAttribute>(); // [MarshalAs] etc.
    }

    // Attribute on a parameter or field: [MarshalAs LPWStr] [In] [Out] etc.
    public class ParameterAttribute : AstNode
    {
        public string Name { get; set; } // "MarshalAs", "In", "Out"
        public List<string> Arguments { get; set; } = new List<string>();
    }

    public class MethodDeclaration : AstNode
    {
        public string Name { get; set; }
        public string ReturnType { get; set; } = "void";
        public string Access { get; set; } = "public";
        public bool IsStatic { get; set; }
        public bool IsVirtual { get; set; }
        public bool IsOverride { get; set; }
        public bool IsAbstract { get; set; }
        public List<ParameterDeclaration> Parameters { get; set; } = new List<ParameterDeclaration>();
        public List<Statement> Body { get; set; } = new List<Statement>();

        // P/Invoke
        public string DllImportName { get; set; } // null = not P/Invoke
        public string DllImportEntryPoint { get; set; } // null = same as Name
        public string DllImportCharSet { get; set; } // "Ansi", "Unicode", "Auto" (null = Auto)
        public string DllImportCallingConvention { get; set; } // "StdCall", "Cdecl", etc. (null = StdCall)
        public bool DllImportSetLastError { get; set; }
        public bool DllImportExactSpelling { get; set; }
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

    public class DelegateDeclaration : AstNode
    {
        public string Name { get; set; }
        public string ReturnType { get; set; } = "void";
        public string Access { get; set; } = "public";
        public List<ParameterDeclaration> Parameters { get; set; } = new List<ParameterDeclaration>();
    }

    public class EventDeclaration : AstNode
    {
        public string Name { get; set; }
        public string TypeName { get; set; } // delegate type
        public string Access { get; set; } = "public";
    }

    public class IndexerDeclaration : AstNode
    {
        public string TypeName { get; set; }
        public string Access { get; set; } = "public";
        public List<ParameterDeclaration> Parameters { get; set; } = new List<ParameterDeclaration>();
        public List<Statement> GetterBody { get; set; }
        public List<Statement> SetterBody { get; set; }
    }

    public class OperatorDeclaration : AstNode
    {
        public string Operator { get; set; } // "+", "-", "*", "/", "==", "!=", "implicit", "explicit"
        public string ReturnType { get; set; }
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
