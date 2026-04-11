using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase2Tests
    {
        private static int _counter = 0;

        private object CompileAndCall(string sourceTemplate, string className, string methodName, params object[] args)
        {
            // Replace assembly name with unique one to avoid caching
            string uid = $"P2_{_counter++}_{Guid.NewGuid():N}".Substring(0, 20);
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
        public void LocalVariable()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func M as int, public\n    dim x as int\n    x = 42\n    return x\n  endfunc\n#endclass",
                "C", "M");
            Assert.AreEqual(42, r);
        }

        [Test]
        public void AutoDeclareVariable()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func M as int, public\n    x = 100\n    return x\n  endfunc\n#endclass",
                "C", "M");
            Assert.AreEqual(100, r);
        }

        [Test]
        public void CompoundAssignment()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func M as int, public\n    dim x as int\n    x = 10\n    x += 5\n    x -= 3\n    x *= 2\n    return x\n  endfunc\n#endclass",
                "C", "M");
            Assert.AreEqual(24, r);
        }

        [Test]
        public void IfThenElse()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Max int a, int b as int, public\n    if a > b {\n      return a\n    } else {\n      return b\n    }\n  endfunc\n#endclass",
                "C", "Max", 10, 20);
            Assert.AreEqual(20, r);
        }

        [Test]
        public void IfThenElse2()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Max int a, int b as int, public\n    if a > b {\n      return a\n    } else {\n      return b\n    }\n  endfunc\n#endclass",
                "C", "Max", 30, 5);
            Assert.AreEqual(30, r);
        }

        [Test]
        public void RepeatLoop()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Sum int n as int, public\n    dim total as int\n    total = 0\n    repeat n\n      total += cnt\n    loop\n    return total\n  endfunc\n#endclass",
                "C", "Sum", 5);
            Assert.AreEqual(10, r);
        }

        [Test]
        public void WhileLoop()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func CountDown int n as int, public\n    dim i as int\n    i = n\n    while i > 0\n      i -= 1\n    wend\n    return i\n  endfunc\n#endclass",
                "C", "CountDown", 10);
            Assert.AreEqual(0, r);
        }

        [Test]
        public void BreakInRepeat()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func M as int, public\n    dim last as int\n    last = 0\n    repeat 100\n      if cnt == 5 {\n        break\n      }\n      last = cnt\n    loop\n    return last\n  endfunc\n#endclass",
                "C", "M");
            Assert.AreEqual(4, r);
        }

        [Test]
        public void Comparison()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func IsPos int x as bool, public\n    return x > 0\n  endfunc\n#endclass",
                "C", "IsPos", 5);
            Assert.AreEqual(true, r);
        }

        [Test]
        public void ComparisonFalse()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func IsPos int x as bool, public\n    return x > 0\n  endfunc\n#endclass",
                "C", "IsPos", -3);
            Assert.AreEqual(false, r);
        }

        [Test]
        public void LogicalAnd()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func InRange int x as bool, public\n    return x >= 0 && x < 10\n  endfunc\n#endclass",
                "C", "InRange", 5);
            Assert.AreEqual(true, r);
        }

        [Test]
        public void LogicalAndFalse()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func InRange int x as bool, public\n    return x >= 0 && x < 10\n  endfunc\n#endclass",
                "C", "InRange", 15);
            Assert.AreEqual(false, r);
        }

        [Test]
        public void Arithmetic()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Calc as int, public\n    return 2 + 3 * 4 - 1\n  endfunc\n#endclass",
                "C", "Calc");
            Assert.AreEqual(13, r);
        }

        [Test]
        public void Modulo()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Mod int a, int b as int, public\n    return a % b\n  endfunc\n#endclass",
                "C", "Mod", 17, 5);
            Assert.AreEqual(2, r);
        }

        [Test]
        public void Negation()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Neg int x as int, public\n    return -x\n  endfunc\n#endclass",
                "C", "Neg", 42);
            Assert.AreEqual(-42, r);
        }

        [Test]
        public void FibonacciWhile()
        {
            var r = CompileAndCall(
                "#assembly \"T\"\n#class C\n  #access public\n  #func Fib int n as int, public\n    dim a as int\n    dim b as int\n    dim tmp as int\n    a = 0\n    b = 1\n    dim i as int\n    i = 0\n    while i < n\n      tmp = a + b\n      a = b\n      b = tmp\n      i += 1\n    wend\n    return a\n  endfunc\n#endclass",
                "C", "Fib", 10);
            Assert.AreEqual(55, r);
        }
    }
}
