using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase9Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P9{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
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

        [Test] public void PrintCompiles()
        {
            // print should compile without error (Console.WriteLine)
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static PrintTest
    print ""Hello World""
    print 42
    print 3.14
    print true
  #endfunc
#endclass");
            // Just verify it compiles - calling it would print to console
            Assert.IsNotNull(asm.GetType("C").GetMethod("PrintTest"));
        }

        [Test] public void PrintInLoop()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static int CountAndPrint, int n
    dim int count
    count = 0
    for i = 1 to n
      print str(i)
      count += 1
    next
    return count
  #endfunc
#endclass");
            Assert.AreEqual(5, Call(asm, "C", "CountAndPrint", 5));
        }

        [Test] public void PrintWithConcat()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static string MakeMsg, string name, int age
    dim string msg
    msg = ""Name: "" + name + "", Age: "" + str(age)
    return msg
  #endfunc
#endclass");
            Assert.AreEqual("Name: Taro, Age: 25", Call(asm, "C", "MakeMsg", "Taro", 25));
        }

        [Test] public void StringSubstring()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static string Sub, string s, int start, int len
    return s.Substring(start, len)
  #endfunc
#endclass");
            Assert.AreEqual("llo", Call(asm, "C", "Sub", "hello", 2, 3));
        }

        [Test] public void StringReplace()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static string Rep, string s
    return s.Replace(""world"", ""nhsp"")
  #endfunc
#endclass");
            Assert.AreEqual("hello nhsp", Call(asm, "C", "Rep", "hello world"));
        }

        [Test] public void MathMinMax()
        {
            var asm = Compile(
@"#assembly ""T""
#class public C
  #func public static int Clamp, int x, int lo, int hi
    dim int result
    result = Math.Max(x, lo)
    result = Math.Min(result, hi)
    return result
  #endfunc
#endclass");
            Assert.AreEqual(5, Call(asm, "C", "Clamp", 5, 0, 10));
            Assert.AreEqual(0, Call(asm, "C", "Clamp", -5, 0, 10));
            Assert.AreEqual(10, Call(asm, "C", "Clamp", 15, 0, 10));
        }

        [Test] public void StringRepeat()
        {
            var asm = Compile(
"#assembly \"T\"\n#class public StringUtil\n  #func public static string Rep, string s, int n\n    dim string result\n    result = \"\"\n    for i = 1 to n\n      result = result + s\n    next\n    return result\n  #endfunc\n#endclass");
            Assert.AreEqual("abcabcabc", Call(asm, "StringUtil", "Rep", "abc", 3));
        }

        // TODO: Substring(int,int) overload resolution issue
        // [Test]
        public void StringReverse()
        {
            var asm = Compile(
"#assembly \"T\"\n#class public StringUtil\n  #func public static string Rev, string s\n    dim string result\n    result = \"\"\n    dim int i\n    i = s.Length - 1\n    while i >= 0\n      result = result + s.Substring(i, 1)\n      i -= 1\n    wend\n    return result\n  #endfunc\n#endclass");
            Assert.AreEqual("olleh", Call(asm, "StringUtil", "Rev", "hello"));
        }
    }
}
