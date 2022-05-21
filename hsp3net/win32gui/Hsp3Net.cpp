#include "Hsp3Net.h"

namespace tv::hsp::net
{
	NetClass::NetClass()
	{

	}

	NetClass::NetClass(Type ^t)
	{
		Class = t;
		Assembly = Class->Assembly;
		Instance = nullptr;
	}

	NetClass ^Hsp3Net::CreateArray(NetClass ^classType, ... array<int> ^rank_length)
	{
		try
		{
			NetClass ^ncRet = gcnew NetClass();
			ncRet->Instance = Array::CreateInstance(classType->Class, rank_length);
			ncRet->Class = ncRet->Instance->GetType();
			ncRet->Assembly = ncRet->Class->Assembly;
			return ncRet;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	bool Hsp3Net::SetArrayValue(NetClass ^nc, NetClass ^setValue, ... array<int> ^index)
	{
		try
		{
			if (!nc->Class->IsArray)
			{
				return false;
			}
			auto array_Renamed = dynamic_cast<Array^>(nc->Instance);
			array_Renamed->SetValue(setValue->Instance, index);
			return true;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return false;
	}

	NetClass ^Hsp3Net::GetArrayValue(NetClass ^nc, ... array<int> ^index)
	{
		try
		{
			if (!nc->Class->IsArray)
			{
				return nullptr;
			}
			auto array_Renamed = dynamic_cast<Array^>(nc->Instance);

			NetClass ^ncRet = gcnew NetClass();
			ncRet->Instance = array_Renamed->GetValue(index);
			ncRet->Class = ncRet->Instance->GetType();
			ncRet->Assembly = ncRet->Class->Assembly;
			return ncRet;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	int Hsp3Net::GetArrayLength(NetClass ^nc, int dimention)
	{
		try
		{
			if (!nc->Class->IsArray)
			{
				return 0;
			}
			auto array_Renamed = dynamic_cast<Array^>(nc->Instance);
			return array_Renamed->GetLength(dimention);
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return 0;
	}

	NetClass ^Hsp3Net::ConvertCast(NetClass ^before, NetClass ^afterType)
	{
		try
		{
			auto newtype = gcnew NetClass();
			newtype->Instance = Convert::ChangeType(before->Instance, afterType->Class);
			newtype->Class = newtype->Instance->GetType();
			newtype->Assembly = newtype->Class->Assembly;
			return newtype;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateInternal(Object ^obj)
	{
		try
		{
			auto type = obj->GetType();

			NetClass ^nc = gcnew NetClass();
			nc->Assembly = type->Assembly;
			nc->Class = type;
			nc->Instance = obj;
			return nc;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateString(String ^value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateBool(bool value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateBoolByString(String ^value)
	{
		bool val;
		if (bool::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateBoolByInt32(int value)
	{
		return CreateBool(value != 0);
	}

	NetClass ^Hsp3Net::CreateChar(Char value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateCharByString(String ^value)
	{
		Char val;
		if (Char::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateCharByInt32(int value)
	{
		try
		{
			return CreateCharByString(Char::ConvertFromUtf32(value));
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateFloat(float value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateFloatByString(String ^value)
	{
		float val;
		if (float::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateDouble(double value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateDoubleByString(String ^value)
	{
		double val;
		if (double::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateDecimal(Decimal value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateDecimalByString(String ^value)
	{
		Decimal val;
		if (Decimal::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateUInt8(Byte value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateUInt8ByString(String ^value)
	{
		Byte val;
		if (Byte::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateInt8(SByte value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateInt8ByString(String ^value)
	{
		SByte val;
		if (SByte::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateUInt16(UInt16 value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateUInt16ByString(String ^value)
	{
		UInt16 val;
		if (UInt16::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateInt16(short value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateInt16ByString(String ^value)
	{
		short val;
		if (short::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateUInt32(UInt32 value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateUInt32ByString(String ^value)
	{
		UInt32 val;
		if (UInt32::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateInt32(int value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateInt32ByString(String ^value)
	{
		int val;
		if (int::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateUInt64(UInt64 value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateUInt64ByString(String ^value)
	{
		UInt64 val;
		if (UInt64::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateInt64(Int64 value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateInt64ByString(String ^value)
	{
		Int64 val;
		if (Int64::TryParse(value, val))
		{
			return CreateInternal(val);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateIntPtr(IntPtr value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateIntPtrByString(String ^value)
	{
		IntPtr val = IntPtr::Zero;
		if (IntPtr::Size == 8)
		{
			Int64 nVal;
			if (Int64::TryParse(value, nVal))
			{
				val = IntPtr(nVal);
			}
		}
		else
		{
			int nVal;
			if (int::TryParse(value, nVal))
			{
				val = IntPtr(nVal);
			}
		}

		if (val == IntPtr::Zero)
		{
			return nullptr;
		}

		return CreateIntPtr(val);
	}

	NetClass ^Hsp3Net::CreateIntPtrByInt32(int value)
	{
		try
		{
			return CreateIntPtr(IntPtr(value));
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateIntPtrByInt64(Int64 value)
	{
		try
		{
			return CreateIntPtr(IntPtr(value));
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateUIntPtr(UIntPtr value)
	{
		return CreateInternal(value);
	}

	NetClass ^Hsp3Net::CreateUIntPtrByString(String ^value)
	{
		UIntPtr val = UIntPtr::Zero;
		if (UIntPtr::Size == 8)
		{
			UInt64 uVal;
			if (UInt64::TryParse(value, uVal))
			{
				val = UIntPtr(uVal);
			}
		}
		else
		{
			UInt32 uVal;
			if (UInt32::TryParse(value, uVal))
			{
				val = UIntPtr(uVal);
			}
		}

		if (val == UIntPtr::Zero)
		{
			return nullptr;
		}

		return CreateUIntPtr(val);
	}

	NetClass ^Hsp3Net::CreateUIntPtrByUInt32(UInt32 value)
	{
		try
		{
			return CreateUIntPtr(UIntPtr(value));
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateUIntPtrByUInt64(UInt64 value)
	{
		try
		{
			return CreateUIntPtr(UIntPtr(value));
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::GetEnumMember(NetClass ^nc, String ^enumName, String ^memberName)
	{
		// �r�b�g�t���O�̂悤��
		// ������enum�̃����o�����w�肷��Ƃ��́A A,B  �݂����J���}��؂�ɂ���

		try
		{
			auto type = nc->Assembly->GetType(enumName);
			if (type == nullptr)
			{
				// �Z�����O�ł������i���`�T���Ȃ̂ŁA���傢���ʊ������邪�j
				for each (auto t in nc->Assembly->GetTypes())
				{
					if (enumName->Equals(t->Name))
					{
						type = t;
						break;
					}
				}
			}

			auto item = Enum::Parse(type, memberName);

			// �߂�l
			NetClass ^ncRet = gcnew NetClass();
			ncRet->Assembly = nc->Assembly;
			ncRet->Class = type;
			ncRet->Instance = item;
			return ncRet;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::GetFieldValue(NetClass ^nc, String ^name)
	{
		try
		{
			auto fInfo = nc->Class->GetField(name);

			NetClass ^ncRet = gcnew NetClass();
			ncRet->Instance = fInfo->GetValue(nc->Instance);
			ncRet->Class = ncRet->Instance->GetType();
			ncRet->Assembly = ncRet->Class->Assembly;
			return ncRet;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	// �C���f�N�T�� nullptr �w��\
	NetClass ^Hsp3Net::GetPropertyValue(NetClass ^nc, String ^name, array<NetClass^> ^index)
	{
		try
		{
			auto pInfo = nc->Class->GetProperty(name);

			NetClass ^ncRet = gcnew NetClass();
			if (index != nullptr)
			{
				// �C���f�N�T�͐����łȂ��Ă��悢�̂ŁAobject�Ŏ󂯂�
				auto objIndex = gcnew array<Object^>(index->Length);
				for (int i = 0; i < index->Length; i++)
				{
					objIndex[i] = index[i]->Instance;
				}
				ncRet->Instance = pInfo->GetValue(nc->Instance, objIndex);
			}
			else
			{
				ncRet->Instance = pInfo->GetValue(nc->Instance, nullptr);
			}

			ncRet->Class = ncRet->Instance->GetType();
			ncRet->Assembly = ncRet->Class->Assembly;
			return ncRet;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	bool Hsp3Net::SetFieldValue(NetClass ^nc, String ^name, NetClass ^setValue)
	{
		try
		{
			auto fInfo = nc->Class->GetField(name);
			fInfo->SetValue(nc->Instance, setValue->Instance);
			return true;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return false;
	}

	// �C���f�N�T�� nullptr �w��\
	bool Hsp3Net::SetPropertyValue(NetClass ^nc, String ^name, NetClass ^setValue, array<NetClass^> ^index)
	{
		try
		{
			auto pInfo = nc->Class->GetProperty(name);

			if (index != nullptr)
			{
				// �C���f�N�T�͐����łȂ��Ă��悢�̂ŁAobject�Ŏ󂯂�
				auto objIndex = gcnew array<Object^>(index->Length);
				for (int i = 0; i < index->Length; i++)
				{
					objIndex[i] = index[i]->Instance;
				}
				pInfo->SetValue(nc->Instance, setValue->Instance, objIndex);
			}
			else
			{
				pInfo->SetValue(nc->Instance, setValue->Instance, nullptr);
			}
			return true;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return false;
	}

	NetClass ^Hsp3Net::GetTypeBool()
	{
		return _TypeBool;
	}

	NetClass ^Hsp3Net::GetTypeUInt8()
	{
		return _TypeUInt8;
	}

	NetClass ^Hsp3Net::GetTypeInt8()
	{
		return _TypeInt8;
	}

	NetClass ^Hsp3Net::GetTypeUInt16()
	{
		return _TypeUInt16;
	}

	NetClass ^Hsp3Net::GetTypeInt16()
	{
		return _TypeInt16;
	}

	NetClass ^Hsp3Net::GetTypeUInt32()
	{
		return _TypeUInt32;
	}

	NetClass ^Hsp3Net::GetTypeInt32()
	{
		return _TypeInt32;
	}

	NetClass ^Hsp3Net::GetTypeUInt64()
	{
		return _TypeUInt64;
	}

	NetClass ^Hsp3Net::GetTypeInt64()
	{
		return _TypeInt64;
	}

	NetClass ^Hsp3Net::GetTypeUIntPtr()
	{
		return _TypeUIntPtr;
	}

	NetClass ^Hsp3Net::GetTypeIntPtr()
	{
		return _TypeIntPtr;
	}

	NetClass ^Hsp3Net::GetTypeChar()
	{
		return _TypeChar;
	}

	NetClass ^Hsp3Net::GetTypeFloat()
	{
		return _TypeFloat;
	}

	NetClass ^Hsp3Net::GetTypeDouble()
	{
		return _TypeDouble;
	}

	NetClass ^Hsp3Net::GetTypeDecimal()
	{
		return _TypeDecimal;
	}

	generic<typename T>
		NetClass ^Hsp3Net::GetTypeGeneric()
		{
			return gcnew NetClass(T::typeid);
		}

		NetClass ^Hsp3Net::GetTypeByString(String ^assyName, String ^className)
		{
			Assembly ^assy;
			if (_AssemblyDic->TryGetValue(assyName, assy))
			{
				return GetTypeByString(assy, className);
			}
			return nullptr;
		}

		NetClass ^Hsp3Net::GetTypeByString(Assembly ^assy, String ^className)
		{
			// �t���l�[�������󂯕t���Ȃ�
			auto type = assy->GetType(className);
			if (type == nullptr)
			{
				// �Z�����O�ł������i���`�T���Ȃ̂ŁA���傢���ʊ������邪�j
				for each (auto t in assy->GetTypes())
				{
					if (className->Equals(t->Name))
					{
						type = t;
						break;
					}
				}
			}

			if (type == nullptr)
			{
				return nullptr;
			}

			return gcnew NetClass(type);
		}

		NetClass ^Hsp3Net::GetTypeString()
		{
			return _TypeString;
		}


	NetClass ^Hsp3Net::AssignParamsRefOut(NetClass ^nc)
	{
		try
		{
			if (nc != nullptr && nc->Class != nullptr)
			{
				nc->Class = nc->Class->MakeByRefType();
				return nc;
			}
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}

		return nullptr;
	}

	// rank = �z��̎��� (�f�t�H���g = 1)
	NetClass ^Hsp3Net::AssignParamsArray(NetClass ^nc, int rank/* = 1*/)
	{
		try
		{
			if (nc != nullptr && nc->Class != nullptr)
			{
				nc->Class = nc->Class->MakeArrayType(rank);
				return nc;
			}
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::AssignParamsUnsafePointer(NetClass ^nc)
	{
		try
		{
			if (nc != nullptr && nc->Class != nullptr)
			{
				nc->Class = nc->Class->MakePointerType();
				return nc;
			}
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::AssignParamsGeneric(NetClass ^nc, ... array<NetClass^> ^genericList)
	{
		try
		{
			if (nc != nullptr && nc->Class != nullptr)
			{
				List<Type^> ^listTypes = gcnew List<Type^>();
				for each (auto t in genericList)
				{
					listTypes->Add(t->Class);
				}
				nc->Class = nc->Class->MakeGenericType(listTypes->ToArray());
				return nc;
			}
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateInstance(Assembly ^assy, String ^className, array<NetClass^> ^genericList, bool bStaticMethod, ... array<NetClass^> ^prms)
	{
		try
		{
			// Type�����擾
			NetClass ^nc = GetTypeByString(assy, className);
			if (nc == nullptr)
			{
				return nullptr;
			}

			// �W�F�l���b�N�N���X�̏ꍇ�́AType�������ւ�
			if (genericList != nullptr)
			{
				nc = AssignParamsGeneric(nc, genericList);
			}

			// �ÓI�N���X�łȂ��Ȃ�C���X�^���X��
			if (!bStaticMethod)
			{
				List<Object^> ^listParams = gcnew List<Object^>();
				for each (auto p in prms)
				{
					listParams->Add(p->Instance);
				}

				nc->Instance = Activator::CreateInstance(nc->Class, listParams->ToArray());
			}

			_NetClassSet->Add(nc);
			return nc;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::CreateInstance(String ^assyName, String ^className, array<NetClass^> ^genericList, bool bStaticMethod, ... array<NetClass^> ^prms)
	{
		Assembly ^assy;
		if (_AssemblyDic->TryGetValue(assyName, assy))
		{
			return CreateInstance(assy, className, genericList, bStaticMethod, prms);
		}
		return nullptr;
	}

	Assembly ^Hsp3Net::LoadAssemblyByGAC_ShortName(String ^name)
	{
		try
		{
			Assembly ^assy = Assembly::LoadWithPartialName(name);
			if (assy != nullptr)
			{
				_AssemblySet->Add(assy);

				auto assyName = assy->GetName()->Name;
				_AssemblyDic[assyName] = assy;
				return assy;
			}
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	Assembly ^Hsp3Net::LoadAssemblyByGAC_FullName(String ^name)
	{
		try
		{
			Assembly ^assy = Assembly::Load(name);
			if (assy != nullptr)
			{
				_AssemblySet->Add(assy);

				auto assyName = assy->GetName()->Name;
				_AssemblyDic[assyName] = assy;
				return assy;
			}
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	Assembly ^Hsp3Net::LoadAssemblyByFile(String ^path)
	{
		try
		{
			Assembly ^assy = Assembly::UnsafeLoadFrom(path);
			if (assy != nullptr)
			{
				_AssemblySet->Add(assy);

				auto assyName = assy->GetName()->Name;
				_AssemblyDic[assyName] = assy;
				return assy;
			}
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	Assembly ^Hsp3Net::LoadAssemblyBySource(String ^CSharpSource, String ^outputName, ... array<String^> ^prms)
	{
		try
		{
			//�R���p�C������
			CodeDomProvider ^cp = gcnew Microsoft::CSharp::CSharpCodeProvider();
			CompilerParameters ^cps = gcnew CompilerParameters();
			CompilerResults ^cres;

			//���������ŏo�͂𐶐�
			cps->GenerateInMemory = true;
			for each (auto asy in prms)
			{
				cps->ReferencedAssemblies->Add(asy); // System.Windows.Forms.dll �ȂǎQ�Ƃ������A�Z���u��
			}

			// �o�͖��i�t���Ȃ��ƓK���Ȗ��O�ɂȂ邾���j
			if (outputName != nullptr)
			{
				cps->OutputAssembly = outputName;
			}

			//�R���p�C��
			cres = cp->CompileAssemblyFromSource(cps, CSharpSource);

			if (cres->Errors->Count > 0)
			{
				StringBuilder ^sbError = gcnew StringBuilder();
				for each (CompilerError ^err in cres->Errors)
				{
					sbError->AppendLine(err->ToString());
				}
				_LastCompileError = sbError->ToString();
				return nullptr;
			}

			// �R���p�C�������A�Z���u�����擾
			Assembly ^assy = cres->CompiledAssembly;
			_AssemblySet->Add(assy);

			auto assyName = assy->GetName()->Name;
			_AssemblyDic[assyName] = assy;
			return assy;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	NetClass ^Hsp3Net::InvokeMethod(NetClass ^nc, String ^methodName, array<NetClass^> ^genericList, ... array<NetClass^> ^prms)
	{
		try
		{
			// �����̃��\�b�h����ʂ��邽�߂ɁA������Type��n��
			List<Type^> ^listTypes = gcnew List<Type^>();
			for each (auto p in prms)
			{
				listTypes->Add(p->Class);
			}

			// �W�F�l���b�N���\�b�h�̏ꍇ�́A���̂܂܎��Ȃ����ۂ�
			MethodInfo ^method = nullptr;
			if (genericList != nullptr)
			{
				method = MakeGenericInternal(nc, methodName, genericList, prms);
			}
			else
			{
				// �W�F�l���b�N�łȂ��Ȃ炱�����ł悵
				method = nc->Class->GetMethod(methodName, listTypes->ToArray());
			}

			// ����
			array<Object^> ^arrayParams = gcnew array<Object^>(prms->Length);
			for (int i = 0; i < arrayParams->Length; i++)
			{
				arrayParams[i] = prms[i]->Instance;
			}

			// ���s
			auto ret = method->Invoke(nc->Instance, arrayParams);

			// ref, out ����
			for (int i = 0; i < prms->Length; i++)
			{
				if (prms[i] != nullptr && prms[i]->Class != nullptr && prms[i]->Class->IsByRef)
				{
					prms[i]->Instance = arrayParams[i];
				}
			}

			// �߂�l
			NetClass ^ncRet = gcnew NetClass();
			if (ret != nullptr) // �߂�l��void����null���Ԃ�B��O���Ƌ�ʂ������̂ŁAreturn null �Ƃ͂��Ȃ��B
			{
				ncRet->Class = ret->GetType();
				ncRet->Assembly = ncRet->Class->Assembly;
				ncRet->Instance = ret;
			}
			return ncRet;
		}
		catch (Exception ^ex)
		{
			_ExceptionStack->Push(ex);
		}
		return nullptr;
	}

	MethodInfo ^Hsp3Net::MakeGenericInternal(NetClass ^nc, String ^methodName, array<NetClass^> ^genericList, ... array<NetClass^> ^prms)
	{
		try
		{
			// �p�����[�^�̐�
			int paramNum = prms->Length;

			// �W�F�l���b�N�̐�
			int genericNum = genericList->Length;

			// �W�F�l���b�N�̃I�[�o�[���[�h�`�F�b�N�p�i�D�揇�ʂ̉����j

			// �ō��|�C���g
			int topPoints = 0;

			// �ō��|�C���g���l�������ۂ̃��\�b�h
			MethodInfo ^topMethod = nullptr;

			// �N���X�������\�b�h�ꗗ��T��
			for each (auto m in nc->Class->GetMethods())
			{
				// ���\�b�h�̃p�����[�^
				auto methodParams = m->GetParameters();

				// ���\�b�h���A�W�F�l���b�N���\�b�h���A
				// �p�����[�^�̐��A�W�F�l���b�N�̐�����v
				if (methodName->Equals(m->Name) && m->IsGenericMethod && paramNum == methodParams->Length && genericNum == m->GetGenericArguments()->Length)
				{
					// �����̌^�̈�v���`�F�b�N����i�����A��₱�������j

					//public void Message<T>(T a, string b)
					//{
					//    MessageBox.Show("A");
					//}

					//public void Message<T>(T a, T b)
					//{
					//    MessageBox.Show("B");
					//}

					// �Ƃ�����`���������ꍇ�AMessage<string>("1", "2");
					// ���ĂԂƁA"A" �̕����D�悳���B
					// �Ƃ����킯�ŁA�W�F�l���b�N�̕����D��x���Ⴂ�̂�
					// ������l������B�Ƃ�܃|�C���g���Ƃ���B

					// �W�F�l���b�N�����ɐς�ł���
					Dictionary<String^, Type^> ^dicGenericStr2RealType = gcnew Dictionary<String^, Type^>();
					auto gas = m->GetGenericArguments();
					for (int i = 0; i < gas->Length; i++)
					{
						dicGenericStr2RealType[gas[i]->Name] = genericList[i]->Class;
					}

					// �����̌^���W�F�l���b�N���������������(�^�̊m��j
					int nPoints = 0;
					for (int i = 0; i < methodParams->Length; i++)
					{
						// ���S��v
						if (methodParams->GetType()->Equals(prms[i]->Class))
						{
							// ����N���X
							nPoints++;
							continue;
						}
						else if (methodParams->GetType()->IsSubclassOf(prms[i]->Class))
						{
							// �h���N���X�H
							nPoints++;
							continue;
						}

						// �W�F�l���b�N��������{���̌^����������
						Type ^newType;
						if (!dicGenericStr2RealType->TryGetValue(methodParams[i]->ParameterType->Name, newType))
						{
							// �W�F�l���b�N�̈�������Ȃ�
							// ���S��v�����Ȃ������̂ŁA�����I��
							nPoints = -1;
							break;
						}

						// �W�F�l���b�N�̌^�����������ǁA�^�������
						if (newType->Equals(prms[i]->Class))
						{
							// �{���̌^�Ƃ͈�v�����i���ǁA�|�C���g�͉��Z���Ȃ��j
							continue;
						}
						else if (newType->IsSubclassOf(prms[i]->Class))
						{
							// �h���N���X�i���ǁA�|�C���g�͉��Z���Ȃ��j
							continue;
						}

						// ��v���Ȃ������̂ŁA�����I��
						nPoints = -1;
						break;
					}

					// ��v���Ȃ������̂Ŏ�
					if (nPoints == -1)
					{
						continue;
					}

					// ���_�X�V�H
					if (topPoints <= nPoints)
					{
						topPoints = nPoints;
						topMethod = m;
					}
				}
			}

			// ���S�������Ȃ��ƌĂׂȂ�
			array<Type^> ^arrayTypes = gcnew array<Type^>(genericList->Length);
			for (int i = 0; i < arrayTypes->Length; i++)
			{
				arrayTypes[i] = genericList[i]->Class;
			}
			return topMethod->MakeGenericMethod(arrayTypes);
		}
		catch (Exception ^e1)
		{
			return nullptr;
		}
	}

	String ^Hsp3Net::ToStringAssembly(NetClass ^nc)
	{
		if (nc != nullptr && nc->Assembly != nullptr)
		{
			return nc->Assembly->ToString();
		}
		return nullptr;
	}

	String ^Hsp3Net::ToStringClass(NetClass ^nc)
	{
		if (nc != nullptr && nc->Class != nullptr)
		{
			return nc->Class->ToString();
		}
		return nullptr;
	}

	String ^Hsp3Net::ToStringInstance(NetClass ^nc)
	{
		if (nc != nullptr && nc->Instance != nullptr)
		{
			return nc->Instance->ToString();
		}
		return nullptr;
	}

	String ^Hsp3Net::PopLastExceptionToString()
	{
		try
		{
			auto exp = _ExceptionStack->Pop();
			return exp == nullptr ? "" : exp->ToString();
		}
		catch (Exception ^e1)
		{
			// ���΂ɐς܂�ŗǂ�
			return nullptr;
		}
	}

	String ^Hsp3Net::GetLastCompileErrorToString()
	{
		return _LastCompileError;
	}

}
