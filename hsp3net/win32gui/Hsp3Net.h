#pragma once

#include <msclr\marshal.h>
#include <msclr\marshal_cppstd.h>

using namespace msclr::interop;
using namespace System;
using namespace System::Collections;
using namespace System::Collections::Generic;
using namespace System::Runtime::InteropServices;
using namespace System::Reflection;
using namespace System::Text;
using namespace System::CodeDom::Compiler;

namespace tv::hsp::net
{
	public ref class NetClass
	{
	public:
		Assembly ^Assembly;
		Type ^Class;
		Object ^Instance;

		NetClass();

		NetClass(Type ^t);
	};

	public ref class Hsp3Net
	{
	private:
		System::Collections::Generic::Stack<Exception^> ^_ExceptionStack = gcnew System::Collections::Generic::Stack<Exception^>();
		String ^_LastCompileError = "";
		HashSet<Assembly^> ^_AssemblySet = gcnew HashSet<Assembly^>();
		Dictionary<String^, Assembly^> ^_AssemblyDic = gcnew Dictionary<String^, Assembly^>();
		HashSet<NetClass^> ^_NetClassSet = gcnew HashSet<NetClass^>();

	public:
		/// <summary>
		/// �z����쐬���܂�
		/// </summary>
		/// <param name="classType">�쐬����^</param>
		/// <param name="rank_length">�������A�v�f��</param>
		/// <returns></returns>
	
		NetClass ^CreateArray(NetClass ^classType, ... array<int> ^rank_length);

		/// <summary>
		/// �z��ɒl���Z�b�g���܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <param name="setValue"></param>
		/// <param name="index"></param>
		/// <returns></returns>
		bool SetArrayValue(NetClass ^nc, NetClass ^setValue, ... array<int> ^index);

		/// <summary>
		/// �z��ɒl���擾���܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <param name="setValue"></param>
		/// <param name="index"></param>
		/// <returns></returns>
		NetClass ^GetArrayValue(NetClass ^nc, ... array<int> ^index);

		/// <summary>
		/// �v�f�����擾
		/// </summary>
		/// <param name="nc"></param>
		/// <param name="rank"></param>
		/// <returns></returns>
		int GetArrayLength(NetClass ^nc, int dimention);

	public:
		NetClass ^ConvertCast(NetClass ^before, NetClass ^afterType);

	private:
		NetClass ^CreateInternal(Object ^obj);

	public:
		NetClass ^CreateString(String ^value);

	public:
		NetClass ^CreateBool(bool value);

		NetClass ^CreateBoolByString(String ^value);

		NetClass ^CreateBoolByInt32(int value);

	public:
		NetClass ^CreateChar(Char value);

		NetClass ^CreateCharByString(String ^value);

		NetClass ^CreateCharByInt32(int value);

	public:
		NetClass ^CreateFloat(float value);

		NetClass ^CreateFloatByString(String ^value);

		NetClass ^CreateDouble(double value);

		NetClass ^CreateDoubleByString(String ^value);

		NetClass ^CreateDecimal(Decimal value);

		NetClass ^CreateDecimalByString(String ^value);

	public:
		NetClass ^CreateUInt8(Byte value);

		NetClass ^CreateUInt8ByString(String ^value);

		NetClass ^CreateInt8(SByte value);

		NetClass ^CreateInt8ByString(String ^value);

	public:
		NetClass ^CreateUInt16(UInt16 value);

		NetClass ^CreateUInt16ByString(String ^value);

		NetClass ^CreateInt16(short value);

		NetClass ^CreateInt16ByString(String ^value);

	public:
		NetClass ^CreateUInt32(UInt32 value);

		NetClass ^CreateUInt32ByString(String ^value);

		NetClass ^CreateInt32(int value);

		NetClass ^CreateInt32ByString(String ^value);

	public:
		NetClass ^CreateUInt64(UInt64 value);

		NetClass ^CreateUInt64ByString(String ^value);

		NetClass ^CreateInt64(Int64 value);

		NetClass ^CreateInt64ByString(String ^value);

	public:
		NetClass ^CreateIntPtr(IntPtr value);

		NetClass ^CreateIntPtrByString(String ^value);

		NetClass ^CreateIntPtrByInt32(int value);

		NetClass ^CreateIntPtrByInt64(Int64 value);

	public:
		NetClass ^CreateUIntPtr(UIntPtr value);

		NetClass ^CreateUIntPtrByString(String ^value);

		NetClass ^CreateUIntPtrByUInt32(UInt32 value);

		NetClass ^CreateUIntPtrByUInt64(UInt64 value);

	public:
		NetClass ^GetEnumMember(NetClass ^nc, String ^enumName, String ^memberName);


	public:

		/// <summary>
		/// �t�B�[���h�ϐ��̒l���擾���܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <param name="name"></param>
		/// <returns></returns>

		NetClass ^GetFieldValue(NetClass ^nc, String ^name);

		/// <summary>
		/// �v���p�e�B�̒l���擾���܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <param name="name"></param>
		/// <param name="index">�C���f�N�T���g���ꍇ�̂ݎw��</param>
		/// <returns></returns>
		NetClass ^GetPropertyValue(NetClass ^nc, String ^name, array<NetClass^> ^index);

		/// <summary>
		/// �t�B�[���h�ϐ��ɒl��ݒ肵�܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <param name="name"></param>
		/// <returns></returns>
		bool SetFieldValue(NetClass ^nc, String ^name, NetClass ^setValue);

		/// <summary>
		/// �v���p�e�B�ɒl��ݒ肵�܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <param name="name"></param>
		/// <param name="index">�C���f�N�T���g���ꍇ�̂ݎw��</param>
		/// <returns></returns>
		bool SetPropertyValue(NetClass ^nc, String ^name, NetClass ^setValue, array<NetClass^> ^index);


	private:
		static NetClass ^_TypeBool = gcnew NetClass(bool::typeid);
	public:
		NetClass ^GetTypeBool();

	private:
		static NetClass ^_TypeUInt8 = gcnew NetClass(Byte::typeid);
	public:
		NetClass ^GetTypeUInt8();

	private:
		static NetClass ^_TypeInt8 = gcnew NetClass(SByte::typeid);
	public:
		NetClass ^GetTypeInt8();

	private:
		static NetClass ^_TypeUInt16 = gcnew NetClass(UInt16::typeid);
	public:
		NetClass ^GetTypeUInt16();

	private:
		static NetClass ^_TypeInt16 = gcnew NetClass(short::typeid);
	public:
		NetClass ^GetTypeInt16();

	private:
		static NetClass ^_TypeUInt32 = gcnew NetClass(UInt32::typeid);
	public:
		NetClass ^GetTypeUInt32();

	private:
		static NetClass ^_TypeInt32 = gcnew NetClass(int::typeid);
	public:
		NetClass ^GetTypeInt32();

	private:
		static NetClass ^_TypeUInt64 = gcnew NetClass(UInt64::typeid);
	public:
		NetClass ^GetTypeUInt64();

	private:
		static NetClass ^_TypeInt64 = gcnew NetClass(Int64::typeid);
	public:
		NetClass ^GetTypeInt64();

	private:
		static NetClass ^_TypeUIntPtr = gcnew NetClass(UIntPtr::typeid);
	public:
		NetClass ^GetTypeUIntPtr();

	private:
		static NetClass ^_TypeIntPtr = gcnew NetClass(IntPtr::typeid);
	public:
		NetClass ^GetTypeIntPtr();

	private:
		static NetClass ^_TypeChar = gcnew NetClass(Char::typeid);
	public:
		NetClass ^GetTypeChar();

	private:
		static NetClass ^_TypeFloat = gcnew NetClass(float::typeid);
	public:
		NetClass ^GetTypeFloat();

	private:
		static NetClass ^_TypeDouble = gcnew NetClass(double::typeid);
	public:
		NetClass ^GetTypeDouble();

	private:
		static NetClass ^_TypeDecimal = gcnew NetClass(Decimal::typeid);
	public:
		NetClass ^GetTypeDecimal();

		generic<typename T>
		NetClass ^GetTypeGeneric();

	public:
		NetClass ^GetTypeByString(String ^assyName, String ^className);

		NetClass ^GetTypeByString(Assembly ^assy, String ^className);

	private:
		static NetClass ^_TypeString = gcnew NetClass(String::typeid);
	public:
		NetClass ^GetTypeString();

	public:

		/// <summary>
		/// ref, out �p�����[�^��t�^���܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <returns></returns>
		NetClass ^AssignParamsRefOut(NetClass ^nc);

		/// <summary>
		/// �z�� [] �p�����[�^��t�^���܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <returns></returns>
		NetClass ^AssignParamsArray(NetClass ^nc, int rank);

		/// <summary>
		/// unsafe �|�C���^ * �p�����[�^��t�^���܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <returns></returns>
		NetClass ^AssignParamsUnsafePointer(NetClass ^nc);

		/// <summary>
		/// Generic �p�����[�^��t�^���܂�
		/// </summary>
		/// <param name="nc"></param>
		/// <returns></returns>
		NetClass ^AssignParamsGeneric(NetClass ^nc, ... array<NetClass^> ^genericList);

	public:
		NetClass ^CreateInstance(Assembly ^assy, String ^className, array<NetClass^> ^genericList, bool bStaticMethod, ... array<NetClass^> ^prms);

		NetClass ^CreateInstance(String ^assyName, String ^className, array<NetClass^> ^genericList, bool bStaticMethod, ... array<NetClass^> ^prms);

	public:
		Assembly ^LoadAssemblyByGAC_ShortName(String ^name);

		Assembly ^LoadAssemblyByGAC_FullName(String ^name);

		Assembly ^LoadAssemblyByFile(String ^path);

	public:
		Assembly ^LoadAssemblyBySource(String ^CSharpSource, String ^outputName, ... array<String^> ^prms);

	public:
		NetClass ^InvokeMethod(NetClass ^nc, String ^methodName, array<NetClass^> ^genericList, ... array<NetClass^> ^prms);

	private:
		MethodInfo ^MakeGenericInternal(NetClass ^nc, String ^methodName, array<NetClass^> ^genericList, ... array<NetClass^> ^prms);

	public:
		String ^ToStringAssembly(NetClass ^nc);

		String ^ToStringClass(NetClass ^nc);

		String ^ToStringInstance(NetClass ^nc);

	public:

		/// <summary>
		/// �ŐV�̔���������O�X�^�b�N���擾���A�����񉻂������̂�Ԃ��܂�
		/// </summary>
		/// <returns>��O�X�^�b�N����̏ꍇ��null��Ԃ��܂�</returns>
		String ^PopLastExceptionToString();

		/// <summary>
		/// �Ō�Ɏ��s�����R���p�C���G���[���擾���܂�
		/// </summary>
		/// <returns></returns>
		String ^GetLastCompileErrorToString();
	};
}

public ref class GlobalAccess
{
public:
	// HSP����.NET�𑀍삷��N���X
	static tv::hsp::net::Hsp3Net^ g_Hsp3Net;

private:
	// �Ǘ����̃l�C�e�B�u�|�C���^��Set
	static HashSet<IntPtr>^ _NativePtrSet;

public:

	// �l�C�e�B�u�|�C���^���擾���܂�
	// �@Free()����܂ŁAGC�������Ȃ��Ȃ�܂�
	// �@�K�؂ɊJ�����Ȃ���΁A���������[�N�̌��������܂�
	// �@�@�����C���X�^���X�Ŗ{�֐���2�x���s�����ꍇ�A�A�h���X�͕ʂɐ�������܂�
	// �@�@���̏ꍇ�A�I�����ȊO�������藧�Ă��Ȃ��Ȃ�܂��̂ŁA���[�N���܂��B
	static void* CreateNativePtr(tv::hsp::net::NetClass^ nc)
	{
		IntPtr ptr = (IntPtr)GCHandle::Alloc(nc);
		_NativePtrSet->Add(ptr);
		return (void*)ptr;
	}

	// �l�C�e�B�u�|�C���^����NetClass���������܂�
	static tv::hsp::net::NetClass^ GetNativePtrToNetClass(void* ptr)
	{
		try
		{
			IntPtr intPtr = IntPtr(ptr);

			// �Ǘ��O�̃|�C���^��n����.NET�������ʂ̂Ń`�F�b�N
			if (!_NativePtrSet->Contains(intPtr))
				return nullptr;

			auto gch = GCHandle::FromIntPtr(intPtr);
			return (tv::hsp::net::NetClass^)gch.Target;
		}
		catch (Exception^ex1)
		{
			return nullptr;
		}
	}

	// �����Ă���|�C���^�H
	static bool IsActiveNativePtr(void* ptr)
	{
		try
		{
			IntPtr intPtr = IntPtr(ptr);

			// �Ǘ��O�̃|�C���^��n����.NET�������ʂ̂Ń`�F�b�N
			if (!_NativePtrSet->Contains(intPtr))
				return false;

			auto gch = GCHandle::FromIntPtr(intPtr);
			return gch.IsAllocated;
		}
		catch (Exception^ex1)
		{
			return false;
		}
	}

	// CreateNativePtr()�����ۂ̃|�C���^��������܂�
	//�@�@GC�̑Ώۂɖ߂�܂�
	static bool Free(void* ptr)
	{
		try
		{
			IntPtr intPtr = IntPtr(ptr);

			// �Ǘ��O�̃|�C���^��n����.NET�������ʂ̂Ń`�F�b�N
			if (!_NativePtrSet->Contains(intPtr))
				return false;

			auto gch = GCHandle::FromIntPtr(intPtr);

			if (!gch.IsAllocated)
				return false;

			gch.Free();

			_NativePtrSet->Remove(intPtr);
			return true;
		}
		catch (Exception^ex1)
		{
			return false;
		}
	}

	// �S�폜�i�I�����j
	static bool DestroyAll()
	{
		try
		{
			for each (auto intPtr in _NativePtrSet)
			{
				auto gch = GCHandle::FromIntPtr(intPtr);
				gch.Free();
			}

			_NativePtrSet->Clear();
			return true;
		}
		catch (Exception^ex1)
		{
			return false;
		}
	}

private:
	static GlobalAccess() 
	{
		g_Hsp3Net = gcnew tv::hsp::net::Hsp3Net();
		_NativePtrSet = gcnew HashSet<IntPtr>();
	}
};
