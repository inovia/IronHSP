using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase4Tests
    {
        private static int _c;

        private Assembly CompileAsm(string src)
        {
            string uid = $"P4_{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
            src = src.Replace("#assembly \"T\"", $"#assembly \"{uid}\"");
            var driver = new CompilerDriver();
            string outPath = Path.Combine(Path.GetTempPath(), $"{uid}.dll");
            var result = driver.CompileFromString(src, outPath);
            if (!result.Success)
                throw new Exception("Compile failed:\n" + string.Join("\n", result.Diagnostics.Items));
            return Assembly.LoadFrom(outPath);
        }

        [Test]
        public void Inheritance()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Animal
  #access public
  #field Name as string
  #init string name
    Name = name
  endinit
  #func Speak as string, public, virtual
    return Name + "" says ...""
  endfunc
#endclass

#class Dog : Animal
  #access public
  #init string name
    Name = name
  endinit
  #func Speak as string, public, override
    return Name + "" says Woof!""
  endfunc
#endclass");
            var dogType = asm.GetType("Dog");
            Assert.IsNotNull(dogType, "Dog type");
            Assert.IsTrue(dogType.BaseType.Name == "Animal", "Dog inherits Animal");

            var dog = Activator.CreateInstance(dogType, "Rex");
            var result = dogType.GetMethod("Speak").Invoke(dog, null);
            Assert.AreEqual("Rex says Woof!", result);
        }

        [Test]
        public void InheritedField()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Base
  #access public
  #field Value as int
  #func GetValue as int, public
    return Value
  endfunc
#endclass

#class Derived : Base
  #access public
  #init int v
    Value = v
  endinit
  #func GetDouble as int, public
    return Value * 2
  endfunc
#endclass");
            var derivedType = asm.GetType("Derived");
            var obj = Activator.CreateInstance(derivedType, 21);
            Assert.AreEqual(42, derivedType.GetMethod("GetDouble").Invoke(obj, null));
            Assert.AreEqual(21, derivedType.GetMethod("GetValue").Invoke(obj, null));
        }

        [Test]
        public void InterfaceDefinition()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#interface IGreeter
  #func Greet string name as string
#endinterface

#class HelloGreeter : IGreeter
  #access public
  #func Greet string name as string, public
    return ""Hello, "" + name + ""!""
  endfunc
#endclass");
            var type = asm.GetType("HelloGreeter");
            Assert.IsNotNull(type, "HelloGreeter");

            // Check interface implementation
            var ifaceType = asm.GetType("IGreeter");
            Assert.IsNotNull(ifaceType, "IGreeter");
            Assert.IsTrue(ifaceType.IsInterface, "IGreeter is interface");
            Assert.IsTrue(ifaceType.IsAssignableFrom(type), "HelloGreeter implements IGreeter");

            var obj = Activator.CreateInstance(type);
            Assert.AreEqual("Hello, World!", type.GetMethod("Greet").Invoke(obj, new object[] { "World" }));
        }

        [Test]
        public void VirtualOverride()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#class Shape
  #access public
  #func Area as int, public, virtual
    return 0
  endfunc
#endclass

#class Square : Shape
  #access public
  #field Side as int
  #init int side
    Side = side
  endinit
  #func Area as int, public, override
    return Side * Side
  endfunc
#endclass");
            var squareType = asm.GetType("Square");
            var sq = Activator.CreateInstance(squareType, 5);
            // Call via base type reference (polymorphism)
            var shapeType = asm.GetType("Shape");
            var areaMethod = shapeType.GetMethod("Area");
            Assert.AreEqual(25, areaMethod.Invoke(sq, null));
        }

        [Test]
        public void MultipleInterfaces()
        {
            var asm = CompileAsm(@"
#assembly ""T""
#interface INameable
  #func GetName as string
#endinterface

#interface ICountable
  #func GetCount as int
#endinterface

#class NamedCounter : INameable, ICountable
  #access public
  #field Name as string
  #field Count as int

  #init string name, int count
    Name = name
    Count = count
  endinit

  #func GetName as string, public
    return Name
  endfunc

  #func GetCount as int, public
    return Count
  endfunc
#endclass");
            var type = asm.GetType("NamedCounter");
            var iName = asm.GetType("INameable");
            var iCount = asm.GetType("ICountable");
            Assert.IsTrue(iName.IsAssignableFrom(type), "implements INameable");
            Assert.IsTrue(iCount.IsAssignableFrom(type), "implements ICountable");

            var obj = Activator.CreateInstance(type, "Test", 42);
            Assert.AreEqual("Test", type.GetMethod("GetName").Invoke(obj, null));
            Assert.AreEqual(42, type.GetMethod("GetCount").Invoke(obj, null));
        }
    }
}
