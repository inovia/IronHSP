using System;
using System.IO;
using System.Reflection;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase4Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P4{_c++}_{Guid.NewGuid():N}".Substring(0, 20);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            return Assembly.LoadFrom(r.OutputPath);
        }

        [Test] public void Inheritance()
        {
            var asm = Compile(
@"#assembly ""T""
#class public Animal
  #field public string Name
  #init string name
    Name = name
  endinit
  #func public virtual string Speak
    return Name + "" says ...""
  endfunc
#endclass
#class public Dog : Animal
  #init string name
    Name = name
  endinit
  #func public override string Speak
    return Name + "" says Woof!""
  endfunc
#endclass");
            var dog = Activator.CreateInstance(asm.GetType("Dog"), "Rex");
            Assert.AreEqual("Rex says Woof!", dog.GetType().GetMethod("Speak").Invoke(dog, null));
        }

        [Test] public void InheritedField()
        {
            var asm = Compile(
@"#assembly ""T""
#class public Base
  #field public int Value
  #func public int GetValue
    return Value
  endfunc
#endclass
#class public Derived : Base
  #init int v
    Value = v
  endinit
  #func public int GetDouble
    return Value * 2
  endfunc
#endclass");
            var o = Activator.CreateInstance(asm.GetType("Derived"), 21);
            Assert.AreEqual(42, o.GetType().GetMethod("GetDouble").Invoke(o, null));
            Assert.AreEqual(21, o.GetType().GetMethod("GetValue").Invoke(o, null));
        }

        [Test] public void InterfaceImpl()
        {
            var asm = Compile(
@"#assembly ""T""
#interface IGreeter
  #func string Greet, string name
#endinterface
#class public HelloGreeter : IGreeter
  #func public string Greet, string name
    return ""Hello, "" + name + ""!""
  endfunc
#endclass");
            var t = asm.GetType("HelloGreeter");
            var iface = asm.GetType("IGreeter");
            Assert.IsTrue(iface.IsInterface);
            Assert.IsTrue(iface.IsAssignableFrom(t));
            Assert.AreEqual("Hello, World!", Activator.CreateInstance(t).GetType().GetMethod("Greet").Invoke(Activator.CreateInstance(t), new object[] { "World" }));
        }

        [Test] public void VirtualOverride()
        {
            var asm = Compile(
@"#assembly ""T""
#class public Shape
  #func public virtual int Area
    return 0
  endfunc
#endclass
#class public Square : Shape
  #field public int Side
  #init int side
    Side = side
  endinit
  #func public override int Area
    return Side * Side
  endfunc
#endclass");
            var sq = Activator.CreateInstance(asm.GetType("Square"), 5);
            Assert.AreEqual(25, asm.GetType("Shape").GetMethod("Area").Invoke(sq, null));
        }

        [Test] public void MultipleInterfaces()
        {
            var asm = Compile(
@"#assembly ""T""
#interface INameable
  #func string GetName
#endinterface
#interface ICountable
  #func int GetCount
#endinterface
#class public NC : INameable, ICountable
  #field public string Name
  #field public int Count
  #init string name, int count
    Name = name
    Count = count
  endinit
  #func public string GetName
    return Name
  endfunc
  #func public int GetCount
    return Count
  endfunc
#endclass");
            var t = asm.GetType("NC");
            Assert.IsTrue(asm.GetType("INameable").IsAssignableFrom(t));
            Assert.IsTrue(asm.GetType("ICountable").IsAssignableFrom(t));
            var o = Activator.CreateInstance(t, "X", 42);
            Assert.AreEqual("X", t.GetMethod("GetName").Invoke(o, null));
            Assert.AreEqual(42, t.GetMethod("GetCount").Invoke(o, null));
        }
    }
}
