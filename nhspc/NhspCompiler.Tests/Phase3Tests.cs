using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase3Tests
    {
        private static int _c;

        private Assembly CompileAsm(string src)
        {
            string uid = $"P3_{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
            src = src.Replace("#assembly \"T\"", $"#assembly \"{uid}\"");
            var driver = new CompilerDriver();
            string outPath = Path.Combine(Path.GetTempPath(), $"{uid}.dll");
            var result = driver.CompileFromString(src, outPath);
            if (!result.Success)
                throw new Exception("Compile failed:\n" + string.Join("\n", result.Diagnostics.Items));
            return Assembly.LoadFrom(outPath);
        }

        private object Call(Assembly asm, string cls, string method, params object[] args)
        {
            var type = asm.GetType(cls);
            Assert.IsNotNull(type, $"Type {cls}");
            var obj = Activator.CreateInstance(type);
            var m = type.GetMethod(method);
            Assert.IsNotNull(m, $"Method {method}");
            return m.Invoke(obj, args);
        }

        private object Create(Assembly asm, string cls, params object[] args)
        {
            var type = asm.GetType(cls);
            Assert.IsNotNull(type, $"Type {cls}");
            return Activator.CreateInstance(type, args);
        }

        [Test]
        public void FieldReadWrite()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Counter
  #access public
  #field Count as int

  #func Increment, public
    Count += 1
  endfunc

  #func GetCount as int, public
    return Count
  endfunc
#endclass");
            var obj = Create(asm, "Counter");
            var type = obj.GetType();
            type.GetMethod("Increment").Invoke(obj, null);
            type.GetMethod("Increment").Invoke(obj, null);
            type.GetMethod("Increment").Invoke(obj, null);
            var count = type.GetMethod("GetCount").Invoke(obj, null);
            Assert.AreEqual(3, count);
        }

        [Test]
        public void ConstructorWithParams()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Person
  #access public
  #field Name as string
  #field Age as int

  #init string name, int age
    Name = name
    Age = age
  endinit

  #func GetName as string, public
    return Name
  endfunc

  #func GetAge as int, public
    return Age
  endfunc
#endclass");
            var obj = Create(asm, "Person", "Taro", 25);
            var type = obj.GetType();
            Assert.AreEqual("Taro", type.GetMethod("GetName").Invoke(obj, null));
            Assert.AreEqual(25, type.GetMethod("GetAge").Invoke(obj, null));
        }

        [Test]
        public void DefaultConstructor()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Foo
  #access public
  #field Value as int

  #func GetValue as int, public
    return Value
  endfunc
#endclass");
            var obj = Create(asm, "Foo");
            Assert.AreEqual(0, obj.GetType().GetMethod("GetValue").Invoke(obj, null));
        }

        [Test]
        public void PropertyGetter()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Rect
  #access public
  #field Width as int
  #field Height as int

  #init int w, int h
    Width = w
    Height = h
  endinit

  #property Area as int, public
    #get
      return Width * Height
    endget
  endproperty
#endclass");
            var obj = Create(asm, "Rect", 10, 5);
            var area = obj.GetType().GetProperty("Area").GetValue(obj);
            Assert.AreEqual(50, area);
        }

        [Test]
        public void MethodCallsOtherMethod()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Calc
  #access public

  #func Square int x as int, public
    return x * x
  endfunc

  #func SumOfSquares int a, int b as int, public
    return Square(a) + Square(b)
  endfunc
#endclass");
            var r = Call(asm, "Calc", "SumOfSquares", 3, 4);
            Assert.AreEqual(25, r); // 9 + 16
        }

        [Test]
        public void FieldStringConcat()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Greeter
  #access public
  #field Prefix as string

  #init string prefix
    Prefix = prefix
  endinit

  #func Greet string name as string, public
    return Prefix + name + ""!""
  endfunc
#endclass");
            var obj = Create(asm, "Greeter", "Hello, ");
            var r = obj.GetType().GetMethod("Greet").Invoke(obj, new object[] { "World" });
            Assert.AreEqual("Hello, World!", r);
        }

        [Test]
        public void MultipleConstructors()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Point
  #access public
  #field X as int
  #field Y as int

  #init
    X = 0
    Y = 0
  endinit

  #init int x, int y
    X = x
    Y = y
  endinit

  #func Sum as int, public
    return X + Y
  endfunc
#endclass");
            // Default constructor
            var obj1 = Create(asm, "Point");
            Assert.AreEqual(0, obj1.GetType().GetMethod("Sum").Invoke(obj1, null));

            // Parameterized constructor
            var obj2 = Create(asm, "Point", 10, 20);
            Assert.AreEqual(30, obj2.GetType().GetMethod("Sum").Invoke(obj2, null));
        }

        [Test]
        public void FieldWithMethodChain()
        {
            // A class that accumulates values
            var asm = CompileAsm(@"
#assembly ""T""
#class Accumulator
  #access public
  #field Total as int

  #func Add int x, public
    Total += x
  endfunc

  #func GetTotal as int, public
    return Total
  endfunc
#endclass");
            var obj = Create(asm, "Accumulator");
            var type = obj.GetType();
            type.GetMethod("Add").Invoke(obj, new object[] { 10 });
            type.GetMethod("Add").Invoke(obj, new object[] { 20 });
            type.GetMethod("Add").Invoke(obj, new object[] { 30 });
            Assert.AreEqual(60, type.GetMethod("GetTotal").Invoke(obj, null));
        }
    }
}
