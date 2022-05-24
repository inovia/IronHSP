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

	public:
		NetClass ^CreateObject(Object ^obj);

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
		Assembly ^LoadAssemblyByCsSource(String ^CSharpSource, String ^outputName, ... array<String^> ^prms);
	public:
		Assembly ^LoadAssemblyByVbSource(String ^VBSource, String ^outputName, ... array<String^> ^prms);

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
	
	// �Ǘ����̃l�C�e�B�u�|�C���^��Set(�S��)
	static HashSet<IntPtr>^ _NativePtrAllSet;

	// �Ǘ����̃l�C�e�B�u�|�C���^��Set(�J�����g�X�R�[�v�̂�)
	static HashSet<IntPtr>^ _NativePtrCurrentScopeSet;

	// �X�R�[�v�P�ʂ̃l�C�e�B�u�|�C���^�̃X�^�b�N
	static System::Collections::Generic::Stack<HashSet<IntPtr>^>^ _NativePtrCurrentScopeStack;

public:

	// �l�C�e�B�u�|�C���^���擾���܂�
	// �@Free()����܂ŁAGC�������Ȃ��Ȃ�܂�
	// �@�K�؂ɊJ�����Ȃ���΁A���������[�N�̌��������܂�
	// �@�@�����C���X�^���X�Ŗ{�֐���2�x���s�����ꍇ�A�A�h���X�͕ʂɐ�������܂�
	// �@�@���̏ꍇ�A�I�����ȊO�������藧�Ă��Ȃ��Ȃ�܂��̂ŁA���[�N���܂��B
	static void* CreateNativePtr(tv::hsp::net::NetClass^ nc)
	{
		// �S�̂ƃJ�����g�X�R�[�v�ɒǉ�
		IntPtr ptr = (IntPtr)GCHandle::Alloc(nc);
		_NativePtrAllSet->Add(ptr);
		_NativePtrCurrentScopeSet->Add(ptr);
		return (void*)ptr;
	}

	// �l�C�e�B�u�|�C���^����NetClass���������܂�
	static tv::hsp::net::NetClass^ GetNativePtrToNetClass(void* ptr)
	{
		try
		{
			IntPtr intPtr = IntPtr(ptr);

			// �Ǘ��O�̃|�C���^��n����.NET�������ʂ̂Ń`�F�b�N
			if (!_NativePtrAllSet->Contains(intPtr))
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
			if (!_NativePtrAllSet->Contains(intPtr))
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
			if (!_NativePtrAllSet->Contains(intPtr))
				return false;

			auto gch = GCHandle::FromIntPtr(intPtr);

			if (!gch.IsAllocated)
				return false;

			gch.Free();

			_NativePtrAllSet->Remove(intPtr);
			_NativePtrCurrentScopeSet->Remove(intPtr);
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
			for each (auto intPtr in _NativePtrAllSet)
			{
				auto gch = GCHandle::FromIntPtr(intPtr);
				gch.Free();
			}

			_NativePtrAllSet->Clear();
			_NativePtrCurrentScopeSet->Clear();
			return true;
		}
		catch (Exception^ex1)
		{
			return false;
		}
	}

	static bool PushNativePtrCurrentStack()
	{
		// ���݂̏�Ԃ��X�^�b�N�ɐς�ŁA���݂̃J�����g���N���A
		_NativePtrCurrentScopeStack->Push(
			gcnew HashSet<IntPtr>( _NativePtrCurrentScopeSet));
		_NativePtrCurrentScopeSet->Clear();
		return true;
	}

	static bool PopNativePtrCurrentStack(... array<IntPtr> ^prms)
	{
		// ���݂̃J�����g�̎Q�Ƃ��폜���A�X�^�b�N����J�����g�𕜌�����
		// �폜����ۂ́A�����Ŏw�肳�ꂽ���̂͏��O����
		try
		{
			// �폜�ΏۊO�͈����Ŏw�肳��Ă���̂ŁA�\�ߔ����Ă���
			for each (auto intPtr in prms)
			{
				_NativePtrCurrentScopeSet->Remove(intPtr);
			}

			// ���݂̃X�R�[�v�ɂ���Q�Ƃ����
			for each (auto intPtr in _NativePtrCurrentScopeSet)
			{
				try
				{
					// �Ǘ��O�̃|�C���^��n����.NET�������ʂ̂Ń`�F�b�N
					if (!_NativePtrAllSet->Contains(intPtr))
						continue;

					// ���
					auto gch = GCHandle::FromIntPtr(intPtr);
					gch.Free();

					// �S�̂��甲���Ă���
					_NativePtrAllSet->Remove(intPtr);
				}
				catch (Exception^ ex2)
				{
					// 
				}
			}

			// �X�^�b�N�̊����߂�
			_NativePtrCurrentScopeSet->Clear();
			_NativePtrCurrentScopeSet = _NativePtrCurrentScopeStack->Pop();
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
		_NativePtrAllSet = gcnew HashSet<IntPtr>();
		_NativePtrCurrentScopeSet = gcnew HashSet<IntPtr>();
		_NativePtrCurrentScopeStack = gcnew System::Collections::Generic::Stack<HashSet<IntPtr>^>();
	}
};
