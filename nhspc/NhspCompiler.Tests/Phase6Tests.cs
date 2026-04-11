using System;
using System.IO;
using System.Reflection;
using System.Diagnostics;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase6Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P6{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            return Assembly.LoadFrom(r.OutputPath);
        }

        private string CompileExe(string src)
        {
            string uid = $"P6E{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            string outPath = Path.Combine(Path.GetTempPath(), $"{uid}.exe");
            var r = new CompilerDriver().CompileFromString(src, outPath);
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            return outPath;
        }

        [Test] public void StaticMethod()
        {
            var asm = Compile(
@"#assembly ""T""
#class public MathUtil
  #func public static int Square, int x
    return x * x
  #endfunc
#endclass");
            var t = asm.GetType("MathUtil");
            var m = t.GetMethod("Square");
            Assert.IsTrue(m.IsStatic, "Should be static");
            Assert.AreEqual(25, m.Invoke(null, new object[] { 5 }));
        }

        [Test] public void StaticFieldAccess()
        {
            // Static methods can call other static methods
            var asm = Compile(
@"#assembly ""T""
#class public Util
  #func public static int Dbl, int x
    return x * 2
  #endfunc
  #func public static int Quad, int x
    return Dbl(Dbl(x))
  #endfunc
#endclass");
            Assert.AreEqual(20, asm.GetType("Util").GetMethod("Quad").Invoke(null, new object[] { 5 }));
        }

        [Test] public void ExeOutput()
        {
            var path = CompileExe(
@"#assembly ""T""
#class public Greeter
  #func public string Hello
    return ""Hi""
  #endfunc
#endclass

#main
  new g, Greeter()
#endmain");
            Assert.IsTrue(File.Exists(path), "EXE exists");
            // Verify it has an entry point
            var asm = Assembly.LoadFrom(path);
            Assert.IsNotNull(asm.EntryPoint, "Has entry point");
            Assert.AreEqual("Main", asm.EntryPoint.Name);
        }

        [Test] public void ReferenceSystemDll()
        {
            // Test that System.dll types are available (they are by default)
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static int Test
    return 42
  #endfunc
#endclass");
            Assert.AreEqual(42, asm.GetType("C").GetMethod("Test").Invoke(null, null));
        }

        [Test] public void NewObjectInMain()
        {
            var path = CompileExe(
@"#assembly ""T""
#class public Counter
  #field public int Value
  #init int v
    Value = v
  #endinit
  #func public int Get
    return Value
  #endfunc
#endclass

#main
  new c, Counter(42)
  x = c.Get()
#endmain");
            Assert.IsTrue(File.Exists(path));
            var asm = Assembly.LoadFrom(path);
            Assert.IsNotNull(asm.EntryPoint);
        }
    }
}
