using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase2Tests
    {
        private static int _c;
        private object Call(string src, string cls, string method, params object[] args)
        {
            string uid = $"P2{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            var asm = Assembly.LoadFrom(r.OutputPath);
            var o = Activator.CreateInstance(asm.GetType(cls));
            return asm.GetType(cls).GetMethod(method).Invoke(o, args);
        }

        [Test] public void LocalVariable() => Assert.AreEqual(42, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M\n    dim int x\n    x = 42\n    return x\n  endfunc\n#endclass", "C", "M"));

        [Test] public void AutoDeclare() => Assert.AreEqual(100, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M\n    x = 100\n    return x\n  endfunc\n#endclass", "C", "M"));

        [Test] public void CompoundAssign() => Assert.AreEqual(24, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M\n    dim int x\n    x = 10\n    x += 5\n    x -= 3\n    x *= 2\n    return x\n  endfunc\n#endclass", "C", "M"));

        [Test] public void IfElse() => Assert.AreEqual(20, Call(
            "#assembly \"T\"\n#class public C\n  #func public int Max, int a, int b\n    if a > b {\n      return a\n    } else {\n      return b\n    }\n  endfunc\n#endclass", "C", "Max", 10, 20));

        [Test] public void IfElse2() => Assert.AreEqual(30, Call(
            "#assembly \"T\"\n#class public C\n  #func public int Max, int a, int b\n    if a > b {\n      return a\n    } else {\n      return b\n    }\n  endfunc\n#endclass", "C", "Max", 30, 5));

        [Test] public void RepeatLoop() => Assert.AreEqual(10, Call(
            "#assembly \"T\"\n#class public C\n  #func public int Sum, int n\n    dim int total\n    total = 0\n    repeat n\n      total += cnt\n    loop\n    return total\n  endfunc\n#endclass", "C", "Sum", 5));

        [Test] public void WhileLoop() => Assert.AreEqual(0, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M, int n\n    dim int i\n    i = n\n    while i > 0\n      i -= 1\n    wend\n    return i\n  endfunc\n#endclass", "C", "M", 10));

        [Test] public void BreakInRepeat() => Assert.AreEqual(4, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M\n    dim int last\n    last = 0\n    repeat 100\n      if cnt == 5 {\n        break\n      }\n      last = cnt\n    loop\n    return last\n  endfunc\n#endclass", "C", "M"));

        [Test] public void Comparison() => Assert.AreEqual(true, Call(
            "#assembly \"T\"\n#class public C\n  #func public bool M, int x\n    return x > 0\n  endfunc\n#endclass", "C", "M", 5));

        [Test] public void ComparisonFalse() => Assert.AreEqual(false, Call(
            "#assembly \"T\"\n#class public C\n  #func public bool M, int x\n    return x > 0\n  endfunc\n#endclass", "C", "M", -3));

        [Test] public void LogicalAnd() => Assert.AreEqual(true, Call(
            "#assembly \"T\"\n#class public C\n  #func public bool M, int x\n    return x >= 0 && x < 10\n  endfunc\n#endclass", "C", "M", 5));

        [Test] public void LogicalAndFalse() => Assert.AreEqual(false, Call(
            "#assembly \"T\"\n#class public C\n  #func public bool M, int x\n    return x >= 0 && x < 10\n  endfunc\n#endclass", "C", "M", 15));

        [Test] public void Arithmetic() => Assert.AreEqual(13, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M\n    return 2 + 3 * 4 - 1\n  endfunc\n#endclass", "C", "M"));

        [Test] public void Modulo() => Assert.AreEqual(2, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M, int a, int b\n    return a % b\n  endfunc\n#endclass", "C", "M", 17, 5));

        [Test] public void Negation() => Assert.AreEqual(-42, Call(
            "#assembly \"T\"\n#class public C\n  #func public int M, int x\n    return -x\n  endfunc\n#endclass", "C", "M", 42));

        [Test] public void Fibonacci() => Assert.AreEqual(55, Call(
            "#assembly \"T\"\n#class public C\n  #func public int Fib, int n\n    dim int a\n    dim int b\n    dim int tmp\n    a = 0\n    b = 1\n    dim int i\n    i = 0\n    while i < n\n      tmp = a + b\n      a = b\n      b = tmp\n      i += 1\n    wend\n    return a\n  endfunc\n#endclass", "C", "Fib", 10));
    }
}
