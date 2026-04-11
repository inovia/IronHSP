using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase3Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P3{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            return Assembly.LoadFrom(r.OutputPath);
        }

        [Test] public void FieldReadWrite()
        {
            var asm = Compile("#assembly \"T\"\n#class public Counter\n  #field public int Count\n  #func public Increment\n    Count += 1\n  #endfunc\n  #func public int GetCount\n    return Count\n  #endfunc\n#endclass");
            var o = Activator.CreateInstance(asm.GetType("Counter"));
            var t = o.GetType();
            t.GetMethod("Increment").Invoke(o, null);
            t.GetMethod("Increment").Invoke(o, null);
            t.GetMethod("Increment").Invoke(o, null);
            Assert.AreEqual(3, t.GetMethod("GetCount").Invoke(o, null));
        }

        [Test] public void ConstructorWithParams()
        {
            var asm = Compile("#assembly \"T\"\n#class public Person\n  #field public string Name\n  #field public int Age\n  #init string name, int age\n    Name = name\n    Age = age\n  #endinit\n  #func public string GetName\n    return Name\n  #endfunc\n  #func public int GetAge\n    return Age\n  #endfunc\n#endclass");
            var o = Activator.CreateInstance(asm.GetType("Person"), "Taro", 25);
            Assert.AreEqual("Taro", o.GetType().GetMethod("GetName").Invoke(o, null));
            Assert.AreEqual(25, o.GetType().GetMethod("GetAge").Invoke(o, null));
        }

        [Test] public void DefaultConstructor()
        {
            var asm = Compile("#assembly \"T\"\n#class public Foo\n  #field public int Value\n  #func public int GetValue\n    return Value\n  #endfunc\n#endclass");
            var o = Activator.CreateInstance(asm.GetType("Foo"));
            Assert.AreEqual(0, o.GetType().GetMethod("GetValue").Invoke(o, null));
        }

        [Test] public void PropertyGetter()
        {
            var asm = Compile("#assembly \"T\"\n#class public Rect\n  #field public int Width\n  #field public int Height\n  #init int w, int h\n    Width = w\n    Height = h\n  #endinit\n  #property Area as int, public\n    #get\n      return Width * Height\n    endget\n  endproperty\n#endclass");
            var o = Activator.CreateInstance(asm.GetType("Rect"), 10, 5);
            Assert.AreEqual(50, o.GetType().GetProperty("Area").GetValue(o));
        }

        [Test] public void MethodCallsOther()
        {
            var asm = Compile("#assembly \"T\"\n#class public Calc\n  #func public int Square, int x\n    return x * x\n  #endfunc\n  #func public int SumSq, int a, int b\n    return Square(a) + Square(b)\n  #endfunc\n#endclass");
            var o = Activator.CreateInstance(asm.GetType("Calc"));
            Assert.AreEqual(25, o.GetType().GetMethod("SumSq").Invoke(o, new object[] { 3, 4 }));
        }

        [Test] public void FieldStringConcat()
        {
            var asm = Compile("#assembly \"T\"\n#class public G\n  #field public string Prefix\n  #init string p\n    Prefix = p\n  #endinit\n  #func public string Greet, string name\n    return Prefix + name + \"!\"\n  #endfunc\n#endclass");
            var o = Activator.CreateInstance(asm.GetType("G"), "Hello, ");
            Assert.AreEqual("Hello, World!", o.GetType().GetMethod("Greet").Invoke(o, new object[] { "World" }));
        }

        [Test] public void MultipleCtors()
        {
            var asm = Compile("#assembly \"T\"\n#class public Pt\n  #field public int X\n  #field public int Y\n  #init\n    X = 0\n    Y = 0\n  #endinit\n  #init int x, int y\n    X = x\n    Y = y\n  #endinit\n  #func public int Sum\n    return X + Y\n  #endfunc\n#endclass");
            Assert.AreEqual(0, Activator.CreateInstance(asm.GetType("Pt")).GetType().GetMethod("Sum").Invoke(Activator.CreateInstance(asm.GetType("Pt")), null));
            var o2 = Activator.CreateInstance(asm.GetType("Pt"), 10, 20);
            Assert.AreEqual(30, o2.GetType().GetMethod("Sum").Invoke(o2, null));
        }

        [Test] public void Accumulator()
        {
            var asm = Compile("#assembly \"T\"\n#class public Acc\n  #field public int Total\n  #func public Add, int x\n    Total += x\n  #endfunc\n  #func public int Get\n    return Total\n  #endfunc\n#endclass");
            var o = Activator.CreateInstance(asm.GetType("Acc"));
            var t = o.GetType();
            t.GetMethod("Add").Invoke(o, new object[] { 10 });
            t.GetMethod("Add").Invoke(o, new object[] { 20 });
            t.GetMethod("Add").Invoke(o, new object[] { 30 });
            Assert.AreEqual(60, t.GetMethod("Get").Invoke(o, null));
        }
    }
}
