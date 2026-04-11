using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class EmitTests
    {
        private static int _counter = 0;

        private object CompileAndCall(string sourceTemplate, string className, string methodName, params object[] args)
        {
            string uid = $"E_{_counter++}_{Guid.NewGuid():N}".Substring(0, 20);
            string source = sourceTemplate.Replace("#assembly \"T\"", $"#assembly \"{uid}\"");

            var driver = new CompilerDriver();
            string outPath = Path.Combine(Path.GetTempPath(), $"{uid}.dll");
            var result = driver.CompileFromString(source, outPath);
            if (!result.Success)
            {
                string errors = string.Join("\n", result.Diagnostics.Items);
                throw new Exception($"Compile failed:\n{errors}");
            }
            var asm = Assembly.LoadFrom(outPath);
            var type = asm.GetType(className);
            Assert.IsNotNull(type, $"Type {className}");
            var obj = Activator.CreateInstance(type);
            var method = type.GetMethod(methodName);
            Assert.IsNotNull(method, $"Method {methodName}");
            return method.Invoke(obj, args);
        }

        [Test]
        public void ReturnStringLiteral()
        {
            Assert.AreEqual("hello", CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func M as string, public\n    return \"hello\"\n  endfunc\n#endclass",
                "C", "M"));
        }

        [Test]
        public void ReturnIntLiteral()
        {
            Assert.AreEqual(42, CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func M as int, public\n    return 42\n  endfunc\n#endclass",
                "C", "M"));
        }

        [Test]
        public void IntAddition()
        {
            Assert.AreEqual(30, CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Add int a, int b as int, public\n    return a + b\n  endfunc\n#endclass",
                "C", "Add", 10, 20));
        }

        [Test]
        public void StringConcat()
        {
            Assert.AreEqual("Hi, World!", CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Greet string name as string, public\n    return \"Hi, \" + name + \"!\"\n  endfunc\n#endclass",
                "C", "Greet", "World"));
        }
    }
}
