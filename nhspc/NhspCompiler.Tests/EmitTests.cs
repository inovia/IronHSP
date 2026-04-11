using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class EmitTests
    {
        private static int _c;
        private object Call(string src, string cls, string method, params object[] args)
        {
            string uid = $"E{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            var asm = Assembly.LoadFrom(r.OutputPath);
            var t = asm.GetType(cls); Assert.IsNotNull(t, cls);
            var o = Activator.CreateInstance(t);
            var m = t.GetMethod(method); Assert.IsNotNull(m, method);
            return m.Invoke(o, args);
        }

        [Test] public void ReturnString() => Assert.AreEqual("hello", Call(
            "#assembly \"T\"\n#class public C\n  #func public string M\n    return \"hello\"\n  #endfunc\n#endclass", "C", "M"));

        [Test] public void ReturnInt() => Assert.AreEqual(42, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M\n    return 42\n  #endfunc\n#endclass", "C", "M"));

        [Test] public void IntAdd() => Assert.AreEqual(30, Call(
            "#assembly \"T\"\n#class public C\n  #func public int Add, int a, int b\n    return a + b\n  #endfunc\n#endclass", "C", "Add", 10, 20));

        [Test] public void StringConcat() => Assert.AreEqual("Hi, World!", Call(
            "#assembly \"T\"\n#class public C\n  #func public string Greet, string name\n    return \"Hi, \" + name + \"!\"\n  #endfunc\n#endclass", "C", "Greet", "World"));
    }
}
