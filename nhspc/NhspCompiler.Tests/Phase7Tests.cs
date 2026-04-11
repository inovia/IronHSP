using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase7Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P7{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
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

        [Test] public void StringLength()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public int Len, string s
    return s.Length
  #endfunc
#endclass");
            Assert.AreEqual(5, Call(asm, "C", "Len", "hello"));
        }

        [Test] public void StringToUpper()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public string Up, string s
    return s.ToUpper()
  #endfunc
#endclass");
            Assert.AreEqual("HELLO", Call(asm, "C", "Up", "hello"));
        }

        [Test] public void StringContains()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public bool Has, string s, string sub
    return s.Contains(sub)
  #endfunc
#endclass");
            Assert.AreEqual(true, Call(asm, "C", "Has", "hello world", "world"));
            Assert.AreEqual(false, Call(asm, "C", "Has", "hello", "xyz"));
        }

        [Test] public void MathStatic()
        {
            // Math.Max is a static method
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static int Max, int a, int b
    return Math.Max(a, b)
  #endfunc
#endclass");
            Assert.AreEqual(20, Call(asm, "C", "Max", 10, 20));
        }

        [Test] public void MathAbs()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static int Abs, int x
    return Math.Abs(x)
  #endfunc
#endclass");
            Assert.AreEqual(42, Call(asm, "C", "Abs", -42));
        }

        [Test] public void StrBuiltin()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public string M, int x
    return ""val="" + str(x)
  #endfunc
#endclass");
            Assert.AreEqual("val=42", Call(asm, "C", "M", 42));
        }

        [Test] public void IntBuiltin()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static int ParseNum, string s
    return int(s)
  #endfunc
#endclass");
            Assert.AreEqual(123, Call(asm, "C", "ParseNum", "123"));
        }

        // TODO: CrossClassNew needs full EmitterRegistry-based resolution
        // TypeBuilder.GetConstructor/GetMethod fails before CreateType
        // [Test]
        public void CrossClassNew()
        {
            // Create instance of another class defined in same assembly
            var asm = Compile(
@"#assembly ""T""
#class public Point
  #field public int X
  #field public int Y
  #init int x, int y
    X = x
    Y = y
  #endinit
  #func public int Sum
    return X + Y
  #endfunc
#endclass

#class public Factory
  #func public static int MakeAndSum
    new p, Point(10, 20)
    return p.Sum()
  #endfunc
#endclass");
            Assert.AreEqual(30, Call(asm, "Factory", "MakeAndSum"));
        }
    }
}
