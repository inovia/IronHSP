using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase12Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P12{_c++}_{Guid.NewGuid():N}".Substring(0, 21);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            return Assembly.LoadFrom(r.OutputPath);
        }
        private object Call(Assembly asm, string cls, string method, params object[] args)
        {
            var t = asm.GetType(cls); Assert.IsNotNull(t, cls);
            var mi = t.GetMethod(method); Assert.IsNotNull(mi, method);
            var obj = mi.IsStatic ? null : Activator.CreateInstance(t);
            return mi.Invoke(obj, args);
        }

        [Test] public void TryCatchBasic()
        {
            var asm = Compile(
"#assembly \"T\"\n#class public C\n  #func public static int SafeDiv, int a, int b\n    dim int result\n    result = 0\n    try\n      result = a / b\n    catch ex\n      result = -1\n    endtry\n    return result\n  #endfunc\n#endclass");
            Assert.AreEqual(5, Call(asm, "C", "SafeDiv", 10, 2));
            Assert.AreEqual(-1, Call(asm, "C", "SafeDiv", 10, 0));
        }

        [Test] public void TryCatchNested()
        {
            var asm = Compile(
"#assembly \"T\"\n#class public C\n  #func public static int Test\n    dim int x\n    x = 0\n    try\n      x = 10 / 0\n    catch e\n      x = 42\n    endtry\n    return x\n  #endfunc\n#endclass");
            Assert.AreEqual(42, Call(asm, "C", "Test"));
        }

        [Test] public void Namespace()
        {
            var asm = Compile(
"#assembly \"T\"\n#namespace \"MyApp.Core\"\n#class public Util\n  #func public static int One\n    return 1\n  #endfunc\n#endclass\n#endnamespace");
            var t = asm.GetType("MyApp.Core.Util");
            Assert.IsNotNull(t, "MyApp.Core.Util");
            Assert.AreEqual(1, t.GetMethod("One").Invoke(null, null));
        }

        [Test] public void NamespaceMultiple()
        {
            var asm = Compile(
"#assembly \"T\"\n#namespace \"App.Models\"\n#class public Item\n  #field public string Name\n  #init string name\n    Name = name\n  #endinit\n  #func public string GetName\n    return Name\n  #endfunc\n#endclass\n#endnamespace\n\n#namespace \"App.Services\"\n#class public Svc\n  #func public static int Count\n    return 42\n  #endfunc\n#endclass\n#endnamespace");
            Assert.IsNotNull(asm.GetType("App.Models.Item"));
            Assert.AreEqual(42, asm.GetType("App.Services.Svc").GetMethod("Count").Invoke(null, null));
        }
    }
}
