using System;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase14Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P14{_c++}_{Guid.NewGuid():N}".Substring(0, 21);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            return Assembly.LoadFrom(r.OutputPath);
        }

        [Test] public void PInvokeCompiles()
        {
            var asm = Compile(
"#assembly \"T\"\n#class public NativeApi\n  #dllimport \"kernel32.dll\"\n  #dllfunc public static int GetTickCount\n#endclass");
            var t = asm.GetType("NativeApi");
            Assert.IsNotNull(t, "NativeApi");
            var m = t.GetMethod("GetTickCount");
            Assert.IsNotNull(m, "GetTickCount");
            Assert.IsTrue(m.IsStatic, "Should be static");
            // Actually call it
            var result = (int)m.Invoke(null, null);
            Assert.IsTrue(result > 0, "GetTickCount > 0");
        }

        [Test] public void PInvokeWithParams()
        {
            var asm = Compile(
"#assembly \"T\"\n#class public NativeApi\n  #dllimport \"kernel32.dll\"\n  #dllfunc public static int GetCurrentProcessId\n#endclass");
            var t = asm.GetType("NativeApi");
            var m = t.GetMethod("GetCurrentProcessId");
            Assert.IsNotNull(m, "GetCurrentProcessId");
            var pid = (int)m.Invoke(null, null);
            Assert.IsTrue(pid > 0, "PID > 0");
        }

        [Test] public void GuidAttribute()
        {
            var asm = Compile(
"#assembly \"T\"\n#attribute Guid, \"EAA4976A-45C3-4BC5-BC0B-E474F4C3C83F\"\n#class public MyClass\n  #func public static int One\n    return 1\n  #endfunc\n#endclass");
            var t = asm.GetType("MyClass");
            Assert.IsNotNull(t, "MyClass");
            var guidAttr = t.GetCustomAttribute<GuidAttribute>();
            Assert.IsNotNull(guidAttr, "GuidAttribute");
            Assert.AreEqual("EAA4976A-45C3-4BC5-BC0B-E474F4C3C83F", guidAttr.Value.ToUpperInvariant());
        }

        [Test] public void ComVisibleAttribute()
        {
            var asm = Compile(
"#assembly \"T\"\n#attribute ComVisible, \"true\"\n#class public VisibleClass\n  #func public static int Two\n    return 2\n  #endfunc\n#endclass");
            var t = asm.GetType("VisibleClass");
            var cvAttr = t.GetCustomAttribute<ComVisibleAttribute>();
            Assert.IsNotNull(cvAttr, "ComVisibleAttribute");
            Assert.IsTrue(cvAttr.Value, "ComVisible = true");
        }

        [Test] public void ClassInterfaceAttribute()
        {
            var asm = Compile(
"#assembly \"T\"\n#attribute ClassInterface, \"None\"\n#class public ComClass\n  #func public static int Three\n    return 3\n  #endfunc\n#endclass");
            var t = asm.GetType("ComClass");
            var ciAttr = t.GetCustomAttribute<ClassInterfaceAttribute>();
            Assert.IsNotNull(ciAttr, "ClassInterfaceAttribute");
            Assert.AreEqual(ClassInterfaceType.None, ciAttr.Value);
        }

        [Test] public void InterfaceGuidAttribute()
        {
            var asm = Compile(
"#assembly \"T\"\n#attribute Guid, \"7BD20046-DF8C-44A6-8F6B-687FAA26FA71\"\n#attribute InterfaceType, \"InterfaceIsIDispatch\"\n#interface IMyEvents\n  #func OnEvent\n#endinterface\n\n#class public Dummy\n  #func public static int X\n    return 0\n  #endfunc\n#endclass");
            var iface = asm.GetType("IMyEvents");
            Assert.IsNotNull(iface, "IMyEvents");
            var guidAttr = iface.GetCustomAttribute<GuidAttribute>();
            Assert.IsNotNull(guidAttr, "Interface GuidAttribute");
            var itAttr = iface.GetCustomAttribute<InterfaceTypeAttribute>();
            Assert.IsNotNull(itAttr, "InterfaceTypeAttribute");
        }

        [Test] public void FullComPattern()
        {
            // Full COM class pattern like C# example
            var asm = Compile(
@"#assembly ""T""

#attribute Guid, ""EAA4976A-45C3-4BC5-BC0B-E474F4C3C83F""
#interface ComInterface
  #func string Hello
#endinterface

#attribute Guid, ""7BD20046-DF8C-44A6-8F6B-687FAA26FA71""
#attribute InterfaceType, ""InterfaceIsIDispatch""
#interface ComEvents
#endinterface

#attribute Guid, ""0D53A3E8-E51A-49C7-944E-E72A2064F938""
#attribute ClassInterface, ""None""
#attribute ComVisible, ""true""
#class public ComClass1 : ComInterface
  #func public string Hello
    return ""Hello COM!""
  #endfunc
#endclass");
            var t = asm.GetType("ComClass1");
            Assert.IsNotNull(t);
            Assert.IsNotNull(t.GetCustomAttribute<GuidAttribute>());
            Assert.IsNotNull(t.GetCustomAttribute<ClassInterfaceAttribute>());
            Assert.IsNotNull(t.GetCustomAttribute<ComVisibleAttribute>());

            var iface = asm.GetType("ComInterface");
            Assert.IsNotNull(iface);
            Assert.IsNotNull(iface.GetCustomAttribute<GuidAttribute>());
        }
    }
}
