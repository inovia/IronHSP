using System;
using System.Reflection;
using System.Reflection.Emit;
using NhspCompiler.Core.Parsing.Ast;
using NhspCompiler.Core.Diagnostics;

namespace NhspCompiler.Core.Emit
{
    public class TypeEmitter
    {
        private readonly ClassDeclaration _cls;
        private readonly ModuleBuilder _module;
        private readonly DiagnosticBag _diag;

        public TypeEmitter(ClassDeclaration cls, ModuleBuilder module, DiagnosticBag diag)
        {
            _cls = cls;
            _module = module;
            _diag = diag;
        }

        public void Emit()
        {
            var attr = TypeAttributes.Class;
            if (_cls.DefaultAccess == "public") attr |= TypeAttributes.Public;

            Type baseType = typeof(object);
            if (_cls.BaseClass != null)
            {
                baseType = AssemblyEmitter.ResolveType(_cls.BaseClass) ?? typeof(object);
            }

            var typeBuilder = _module.DefineType(_cls.Name, attr, baseType);

            // Fields
            foreach (var field in _cls.Fields)
            {
                var fieldType = AssemblyEmitter.ResolveType(field.TypeName);
                if (fieldType == null)
                {
                    _diag.Error(field.Line, 0, $"Unknown field type: {field.TypeName}");
                    continue;
                }
                var fa = FieldAttributes.Public;
                if (field.Access == "private") fa = FieldAttributes.Private;
                typeBuilder.DefineField(field.Name, fieldType, fa);
            }

            // Default constructor
            var ctorBuilder = typeBuilder.DefineConstructor(
                MethodAttributes.Public, CallingConventions.Standard, Type.EmptyTypes);
            var ctorIL = ctorBuilder.GetILGenerator();
            ctorIL.Emit(OpCodes.Ldarg_0);
            ctorIL.Emit(OpCodes.Call, baseType.GetConstructor(Type.EmptyTypes) ?? typeof(object).GetConstructor(Type.EmptyTypes));
            ctorIL.Emit(OpCodes.Ret);

            // Methods
            foreach (var method in _cls.Methods)
            {
                var methodEmitter = new MethodEmitter(method, typeBuilder, _diag);
                methodEmitter.Emit();
            }

            typeBuilder.CreateType();
        }
    }
}
