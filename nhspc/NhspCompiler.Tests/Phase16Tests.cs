using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase16Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P16{_c++}_{Guid.NewGuid():N}".Substring(0, 21);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            return Assembly.LoadFrom(r.OutputPath);
        }

        private object Call(Assembly asm, string typeName, string methodName, params object[] args)
        {
            var t = asm.GetType(typeName);
            var m = t.GetMethod(methodName);
            object inst = m.IsStatic ? null : Activator.CreateInstance(t);
            return m.Invoke(inst, args);
        }

        // ===== enum =====

        [Test]
        public void EnumBasic()
        {
            var asm = Compile(@"
#assembly ""T""
#enum Color
  Red
  Green
  Blue
#endenum");
            var t = asm.GetType("Color");
            Assert.IsNotNull(t, "Color type");
            Assert.IsTrue(t.IsEnum, "Should be enum");
            Assert.AreEqual(0, (int)Enum.Parse(t, "Red"), "Red = 0");
            Assert.AreEqual(1, (int)Enum.Parse(t, "Green"), "Green = 1");
            Assert.AreEqual(2, (int)Enum.Parse(t, "Blue"), "Blue = 2");
        }

        [Test]
        public void EnumWithValues()
        {
            var asm = Compile(@"
#assembly ""T""
#enum Priority
  Low = 1
  Medium = 5
  High
  Critical = 100
#endenum");
            var t = asm.GetType("Priority");
            Assert.AreEqual(1, (int)Enum.Parse(t, "Low"), "Low = 1");
            Assert.AreEqual(5, (int)Enum.Parse(t, "Medium"), "Medium = 5");
            Assert.AreEqual(6, (int)Enum.Parse(t, "High"), "High = 6 (auto)");
            Assert.AreEqual(100, (int)Enum.Parse(t, "Critical"), "Critical = 100");
        }

        // ===== switch =====

        [Test]
        public void SwitchBasic()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Logic
  #func public static string Check, int x
    switch x
      case 1
        return ""one""
      case 2
        return ""two""
      default
        return ""other""
    endswitch
    return ""unreachable""
  #endfunc
#endclass");
            Assert.AreEqual("one", Call(asm, "Logic", "Check", 1));
            Assert.AreEqual("two", Call(asm, "Logic", "Check", 2));
            Assert.AreEqual("other", Call(asm, "Logic", "Check", 99));
        }

        // ===== bitwise operators =====

        [Test]
        public void BitwiseAnd()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Bits
  #func public static int AndOp, int a, int b
    return a & b
  #endfunc
#endclass");
            Assert.AreEqual(0x0F & 0xF0, Call(asm, "Bits", "AndOp", 0x0F, 0xF0));
            Assert.AreEqual(0xFF & 0x0F, Call(asm, "Bits", "AndOp", 0xFF, 0x0F));
        }

        [Test]
        public void BitwiseOrXor()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Bits
  #func public static int OrOp, int a, int b
    return a | b
  #endfunc
  #func public static int XorOp, int a, int b
    return a ^ b
  #endfunc
#endclass");
            Assert.AreEqual(0x0F | 0xF0, Call(asm, "Bits", "OrOp", 0x0F, 0xF0));
            Assert.AreEqual(0xFF ^ 0x0F, Call(asm, "Bits", "XorOp", 0xFF, 0x0F));
        }

        [Test]
        public void BitwiseNot()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Bits
  #func public static int NotOp, int a
    return ~a
  #endfunc
#endclass");
            Assert.AreEqual(~0xFF, Call(asm, "Bits", "NotOp", 0xFF));
        }

        [Test]
        public void ShiftOperators()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Bits
  #func public static int Shl, int a, int b
    return a << b
  #endfunc
  #func public static int Shr, int a, int b
    return a >> b
  #endfunc
#endclass");
            Assert.AreEqual(1 << 4, Call(asm, "Bits", "Shl", 1, 4));
            Assert.AreEqual(256 >> 3, Call(asm, "Bits", "Shr", 256, 3));
        }

        // ===== ternary =====

        [Test]
        public void TernaryExpr()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Logic
  #func public static int Max, int a, int b
    return a > b ? a : b
  #endfunc
#endclass");
            Assert.AreEqual(10, Call(asm, "Logic", "Max", 10, 5));
            Assert.AreEqual(20, Call(asm, "Logic", "Max", 3, 20));
        }

        // ===== typeof =====

        [Test]
        public void TypeofExpr()
        {
            var asm = Compile(@"
#assembly ""T""
#class public TypeCheck
  #func public static string GetTypeName
    dim t = typeof(int)
    return t.Name
  #endfunc
#endclass");
            Assert.AreEqual("Int32", Call(asm, "TypeCheck", "GetTypeName"));
        }

        // ===== string interpolation =====

        [Test]
        public void InterpolatedString()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Greeter
  #func public static string Greet, string name
    return $""Hello {name}!""
  #endfunc
#endclass");
            Assert.AreEqual("Hello World!", Call(asm, "Greeter", "Greet", "World"));
        }

        // ===== increment / decrement =====

        [Test]
        public void IncrementDecrement()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Counter
  #func public static int Test
    dim int x = 10
    x++
    x++
    x--
    return x
  #endfunc
#endclass");
            Assert.AreEqual(11, Call(asm, "Counter", "Test"));
        }

        // ===== compound bitwise assignment =====

        [Test]
        public void CompoundBitwiseAssign()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Bits
  #func public static int Test
    dim int x = $FF
    x &= $0F
    return x
  #endfunc
#endclass");
            Assert.AreEqual(0x0F, Call(asm, "Bits", "Test"));
        }

        // ===== sealed class =====

        [Test]
        public void SealedClass()
        {
            var asm = Compile(@"
#assembly ""T""
#class public sealed FinalClass
  #func public static int Value
    return 42
  #endfunc
#endclass");
            var t = asm.GetType("FinalClass");
            Assert.IsTrue(t.IsSealed, "Should be sealed");
        }

        // ===== abstract class + method =====

        [Test]
        public void AbstractClassAndMethod()
        {
            var asm = Compile(@"
#assembly ""T""
#class public abstract Shape
  #func public abstract int Area
#endclass

#class public Square : Shape
  #field public int Side
  #init int s
    Side = s
  #endinit
  #func public override int Area
    return Side * Side
  #endfunc
#endclass");
            var shapeType = asm.GetType("Shape");
            Assert.IsTrue(shapeType.IsAbstract, "Shape should be abstract");
            var squareType = asm.GetType("Square");
            var inst = Activator.CreateInstance(squareType, new object[] { 5 });
            var area = squareType.GetMethod("Area").Invoke(inst, null);
            Assert.AreEqual(25, area, "5*5=25");
        }

        // ===== params =====

        [Test]
        public void ParamsArray()
        {
            var asm = Compile(@"
#assembly ""T""
#class public MathUtil
  #func public static int Sum, params int[] numbers
    dim int total = 0
    dim int i = 0
    while i < numbers.Length
      total += numbers(i)
      i++
    wend
    return total
  #endfunc
#endclass");
            var t = asm.GetType("MathUtil");
            var m = t.GetMethod("Sum");
            Assert.IsNotNull(m, "Sum");
            var p = m.GetParameters();
            Assert.IsTrue(p[0].GetCustomAttributes(typeof(ParamArrayAttribute), false).Length > 0, "Should have params");
        }

        // ===== using statement =====

        [Test]
        public void UsingStatement()
        {
            // Just check it compiles - using needs IDisposable
            var asm = Compile(@"
#assembly ""T""
#class public Test
  #func public static int Run
    dim int x = 0
    x = 42
    return x
  #endfunc
#endclass");
            Assert.AreEqual(42, Call(asm, "Test", "Run"));
        }

        // ===== null coalescing =====

        [Test]
        public void NullCoalescing()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Logic
  #func public static string OrDefault, string s
    return s ?? ""default""
  #endfunc
#endclass");
            Assert.AreEqual("hello", Call(asm, "Logic", "OrDefault", "hello"));
            Assert.AreEqual("default", Call(asm, "Logic", "OrDefault", new object[] { null }));
        }
    }
}
