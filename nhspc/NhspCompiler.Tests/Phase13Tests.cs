using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase13Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P13{_c++}_{Guid.NewGuid():N}".Substring(0, 21);
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

        [Test] public void LockBasic()
        {
            // lock should compile and work (Monitor.Enter/Exit)
            var asm = Compile(
"#assembly \"T\"\n#class public C\n  #field public int Count\n  #func public IncrementSafe\n    lock this\n      Count += 1\n    endlock\n  #endfunc\n  #func public int GetCount\n    return Count\n  #endfunc\n#endclass");
            var t = asm.GetType("C");
            var obj = Activator.CreateInstance(t);
            t.GetMethod("IncrementSafe").Invoke(obj, null);
            t.GetMethod("IncrementSafe").Invoke(obj, null);
            t.GetMethod("IncrementSafe").Invoke(obj, null);
            Assert.AreEqual(3, t.GetMethod("GetCount").Invoke(obj, null));
        }

        [Test] public void SleepCompiles()
        {
            // sleep should compile (Thread.Sleep)
            var asm = Compile(
"#assembly \"T\"\n#class public C\n  #func public static int Test\n    sleep 1\n    return 42\n  #endfunc\n#endclass");
            Assert.AreEqual(42, Call(asm, "C", "Test"));
        }

        [Test] public void ThreadSafeCounter()
        {
            // A counter class with lock - verify it compiles correctly
            var asm = Compile(
@"#assembly ""T""
#class public SafeCounter
  #field public int Value

  #func public Add, int n
    lock this
      Value += n
    endlock
  #endfunc

  #func public int Get
    dim int result
    lock this
      result = Value
    endlock
    return result
  #endfunc
#endclass");
            var t = asm.GetType("SafeCounter");
            var obj = Activator.CreateInstance(t);
            t.GetMethod("Add").Invoke(obj, new object[] { 10 });
            t.GetMethod("Add").Invoke(obj, new object[] { 20 });
            Assert.AreEqual(30, t.GetMethod("Get").Invoke(obj, null));
        }
    }
}
