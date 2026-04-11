using System;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using NhspCompiler.Core;

namespace NhspCompiler.Tests
{
    public class Phase15Tests
    {
        private static int _c;
        private Assembly Compile(string src)
        {
            string uid = $"P15{_c++}_{Guid.NewGuid():N}".Substring(0, 21);
            src = src.Replace("\"T\"", $"\"{uid}\"");
            var r = new CompilerDriver().CompileFromString(src, Path.Combine(Path.GetTempPath(), $"{uid}.dll"));
            if (!r.Success) throw new Exception("Compile:\n" + string.Join("\n", r.Diagnostics.Items));
            return Assembly.LoadFrom(r.OutputPath);
        }

        private object Call(Assembly asm, string typeName, string methodName, params object[] args)
        {
            var t = asm.GetType(typeName);
            if (t == null) throw new Exception($"Type not found: {typeName}");
            var inst = Activator.CreateInstance(t);
            var m = t.GetMethod(methodName);
            if (m == null) throw new Exception($"Method not found: {methodName}");
            return m.Invoke(inst, args);
        }

        // ===== ref / out =====

        [Test]
        public void RefParameter()
        {
            var asm = Compile(@"
#assembly ""T""
#class public MathUtil
  #func public static void AddTen, ref int value
    value = value + 10
  #endfunc
#endclass");
            var t = asm.GetType("MathUtil");
            var m = t.GetMethod("AddTen");
            Assert.IsNotNull(m, "AddTen");
            var p = m.GetParameters();
            Assert.IsTrue(p[0].ParameterType.IsByRef, "Should be ByRef");
            // Call with ref
            var args = new object[] { 5 };
            m.Invoke(null, args);
            Assert.AreEqual(15, (int)args[0], "ref result");
        }

        [Test]
        public void OutParameter()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Parser
  #func public static void Parse, string s, out int result
    result = 42
  #endfunc
#endclass");
            var t = asm.GetType("Parser");
            var m = t.GetMethod("Parse");
            var p = m.GetParameters();
            Assert.IsTrue(p[1].ParameterType.IsByRef, "out should be ByRef");
            Assert.IsTrue(p[1].IsOut, "Should have Out attribute");
            var args = new object[] { "test", 0 };
            m.Invoke(null, args);
            Assert.AreEqual(42, (int)args[1], "out result");
        }

        // ===== struct =====

        [Test]
        public void StructBasic()
        {
            var asm = Compile(@"
#assembly ""T""
#struct public Point2D, Sequential
  #field public int X
  #field public int Y
#endstruct");
            var t = asm.GetType("Point2D");
            Assert.IsNotNull(t, "Point2D");
            Assert.IsTrue(t.IsValueType, "Should be value type");
            var x = t.GetField("X");
            var y = t.GetField("Y");
            Assert.IsNotNull(x, "X field");
            Assert.IsNotNull(y, "Y field");
        }

        [Test]
        public void StructWithPack()
        {
            var asm = Compile(@"
#assembly ""T""
#struct public SYSTEMTIME, Sequential, Pack = 2
  #field public ushort wYear
  #field public ushort wMonth
  #field public ushort wDayOfWeek
  #field public ushort wDay
  #field public ushort wHour
  #field public ushort wMinute
  #field public ushort wSecond
  #field public ushort wMilliseconds
#endstruct");
            var t = asm.GetType("SYSTEMTIME");
            Assert.IsTrue(t.IsValueType, "Should be value type");
            // Check struct layout
            var layoutAttr = t.StructLayoutAttribute;
            Assert.IsNotNull(layoutAttr, "StructLayout");
            Assert.AreEqual(LayoutKind.Sequential, layoutAttr.Value, "Sequential");
            Assert.AreEqual(2, layoutAttr.Pack, "Pack = 2");
            // Check field count
            var fields = t.GetFields(BindingFlags.Public | BindingFlags.Instance);
            Assert.AreEqual(8, fields.Length, "8 fields");
        }

        [Test]
        public void StructExplicitLayout()
        {
            var asm = Compile(@"
#assembly ""T""
#struct public Union, Explicit
  [FieldOffset 0] #field public int IntValue
  [FieldOffset 0] #field public float FloatValue
#endstruct");
            var t = asm.GetType("Union");
            Assert.IsTrue(t.IsValueType, "Should be value type");
            var layoutAttr = t.StructLayoutAttribute;
            Assert.AreEqual(LayoutKind.Explicit, layoutAttr.Value, "Explicit");
        }

        [Test]
        public void StructWithCharSet()
        {
            var asm = Compile(@"
#assembly ""T""
#struct public WinStruct, Sequential, CharSet = Unicode
  #field public int Id
  [MarshalAs ByValTStr, 256] #field public string Name
#endstruct");
            var t = asm.GetType("WinStruct");
            Assert.IsTrue(t.IsValueType, "Should be value type");
            var nameField = t.GetField("Name");
            Assert.IsNotNull(nameField, "Name field");
            // Check MarshalAs
            var marshalAttr = nameField.GetCustomAttribute<MarshalAsAttribute>();
            Assert.IsNotNull(marshalAttr, "MarshalAs on Name");
            Assert.AreEqual(UnmanagedType.ByValTStr, marshalAttr.Value, "ByValTStr");
            Assert.AreEqual(256, marshalAttr.SizeConst, "SizeConst 256");
        }

        // ===== const / readonly =====

        [Test]
        public void ConstField()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Config
  #field public const int MAX_PATH = 260
  #field public const string VERSION = ""1.0""
#endclass");
            var t = asm.GetType("Config");
            var maxPath = t.GetField("MAX_PATH");
            Assert.IsNotNull(maxPath, "MAX_PATH");
            Assert.IsTrue(maxPath.IsLiteral, "Should be literal (const)");
            Assert.AreEqual(260, (int)maxPath.GetRawConstantValue(), "MAX_PATH value");
            var version = t.GetField("VERSION");
            Assert.IsTrue(version.IsLiteral, "VERSION should be literal");
            Assert.AreEqual("1.0", (string)version.GetRawConstantValue(), "VERSION value");
        }

        [Test]
        public void ReadonlyField()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Config
  #field public readonly int MaxSize
  #init int size
    MaxSize = size
  #endinit
#endclass");
            var t = asm.GetType("Config");
            var f = t.GetField("MaxSize");
            Assert.IsNotNull(f, "MaxSize");
            Assert.IsTrue(f.IsInitOnly, "Should be InitOnly (readonly)");
            // Create instance
            var inst = Activator.CreateInstance(t, new object[] { 100 });
            Assert.AreEqual(100, (int)f.GetValue(inst), "readonly value");
        }

        // ===== delegate =====

        [Test]
        public void DelegateCompiles()
        {
            var asm = Compile(@"
#assembly ""T""
#delegate public int BinaryOp, int a, int b
#class public Calculator
  #func public static int Apply, BinaryOp op, int x, int y
    return op.Invoke(x, y)
  #endfunc
#endclass");
            var delegateType = asm.GetType("BinaryOp");
            Assert.IsNotNull(delegateType, "BinaryOp delegate");
            Assert.IsTrue(typeof(MulticastDelegate).IsAssignableFrom(delegateType), "Should be delegate");
            var invokeMethod = delegateType.GetMethod("Invoke");
            Assert.IsNotNull(invokeMethod, "Invoke method");
            Assert.AreEqual(typeof(int), invokeMethod.ReturnType, "Return type");
            Assert.AreEqual(2, invokeMethod.GetParameters().Length, "2 params");
        }

        // ===== IntPtr / new type aliases =====

        [Test]
        public void IntPtrTypeAlias()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Interop
  #func public static IntPtr GetZero
    return 0
  #endfunc
#endclass");
            // Just verify it compiles - IntPtr return type
            var t = asm.GetType("Interop");
            Assert.IsNotNull(t, "Interop");
        }

        [Test]
        public void UnsignedTypes()
        {
            var asm = Compile(@"
#assembly ""T""
#struct public TypeTest, Sequential
  #field public byte B
  #field public ushort US
  #field public uint UI
  #field public sbyte SB
  #field public char C
#endstruct");
            var t = asm.GetType("TypeTest");
            Assert.IsTrue(t.IsValueType, "value type");
            Assert.AreEqual(typeof(byte), t.GetField("B").FieldType, "byte");
            Assert.AreEqual(typeof(ushort), t.GetField("US").FieldType, "ushort");
            Assert.AreEqual(typeof(uint), t.GetField("UI").FieldType, "uint");
            Assert.AreEqual(typeof(sbyte), t.GetField("SB").FieldType, "sbyte");
            Assert.AreEqual(typeof(char), t.GetField("C").FieldType, "char");
        }

        // ===== #dllimport options =====

        [Test]
        public void DllImportWithCharSet()
        {
            var asm = Compile(@"
#assembly ""T""
#class public NativeApi
  #dllimport ""user32.dll"", CharSet = Unicode, SetLastError = true
  #dllfunc public static int MessageBoxW, IntPtr hWnd, string text, string caption, int type
#endclass");
            var t = asm.GetType("NativeApi");
            var m = t.GetMethod("MessageBoxW");
            Assert.IsNotNull(m, "MessageBoxW");
            Assert.IsTrue(m.IsStatic, "Static");
        }

        // ===== MarshalAs on parameters =====

        [Test]
        public void MarshalAsOnParam()
        {
            var asm = Compile(@"
#assembly ""T""
#class public NativeApi
  #dllimport ""kernel32.dll""
  #dllfunc public static int GetModuleFileName, IntPtr hModule, [LPStr] string buffer, int size
#endclass");
            var t = asm.GetType("NativeApi");
            var m = t.GetMethod("GetModuleFileName");
            Assert.IsNotNull(m, "GetModuleFileName");
            var p1 = m.GetParameters()[1];
            var marshalAttr = p1.GetCustomAttribute<MarshalAsAttribute>();
            Assert.IsNotNull(marshalAttr, "MarshalAs on buffer param");
            Assert.AreEqual(UnmanagedType.LPStr, marshalAttr.Value, "LPStr");
        }

        // ===== static field =====

        [Test]
        public void StaticField()
        {
            var asm = Compile(@"
#assembly ""T""
#class public Counter
  #field public static int Count
#endclass");
            var t = asm.GetType("Counter");
            var f = t.GetField("Count");
            Assert.IsNotNull(f, "Count");
            Assert.IsTrue(f.IsStatic, "Should be static");
        }

        // ===== DllImport CallingConvention =====

        [Test]
        public void DllImportCdecl()
        {
            var asm = Compile(@"
#assembly ""T""
#class public CLib
  #dllimport ""msvcrt.dll"", CallingConvention = Cdecl
  #dllfunc public static int puts, string str
#endclass");
            var t = asm.GetType("CLib");
            var m = t.GetMethod("puts");
            Assert.IsNotNull(m, "puts");
        }
    }
}
