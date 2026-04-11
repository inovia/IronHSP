using System;
using System.Collections.Generic;
using System.Reflection;

namespace NhspCompiler.Tests
{
    // Minimal test framework (no NuGet dependency)
    [AttributeUsage(AttributeTargets.Method)]
    public class TestAttribute : Attribute { }

    public static class Assert
    {
        public static void AreEqual(object expected, object actual, string msg = null)
        {
            if (!Equals(expected, actual))
                throw new Exception($"ASSERT FAIL: expected={expected}, actual={actual}" + (msg != null ? $" ({msg})" : ""));
        }

        public static void IsTrue(bool condition, string msg = null)
        {
            if (!condition) throw new Exception($"ASSERT FAIL: expected true" + (msg != null ? $" ({msg})" : ""));
        }

        public static void IsFalse(bool condition, string msg = null)
        {
            if (condition) throw new Exception($"ASSERT FAIL: expected false" + (msg != null ? $" ({msg})" : ""));
        }

        public static void IsNotNull(object obj, string msg = null)
        {
            if (obj == null) throw new Exception($"ASSERT FAIL: expected non-null" + (msg != null ? $" ({msg})" : ""));
        }
    }

    public class TestRunner
    {
        static int Main(string[] args)
        {
            int pass = 0, fail = 0;
            var testClasses = new Type[]
            {
                typeof(LexerTests),
                typeof(ParserTests),
                typeof(EmitTests),
                typeof(Phase2Tests),
                typeof(Phase3Tests),
                typeof(Phase4Tests),
                typeof(Phase5Tests),
                typeof(Phase6Tests),
                typeof(Phase7Tests),
                typeof(Phase8Tests),
                typeof(Phase9Tests),
            };

            foreach (var cls in testClasses)
            {
                var instance = Activator.CreateInstance(cls);
                foreach (var method in cls.GetMethods())
                {
                    if (method.GetCustomAttribute<TestAttribute>() == null) continue;
                    string name = $"{cls.Name}.{method.Name}";
                    try
                    {
                        method.Invoke(instance, null);
                        Console.WriteLine($"  [PASS] {name}");
                        pass++;
                    }
                    catch (Exception ex)
                    {
                        var inner = ex.InnerException ?? ex;
                        Console.WriteLine($"  [FAIL] {name}: {inner.Message}");
                        fail++;
                    }
                }
            }

            Console.WriteLine($"\n  Results: {pass} passed, {fail} failed / {pass + fail} total");
            return fail > 0 ? 1 : 0;
        }
    }
}
