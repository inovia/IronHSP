
//
//	hspvar_comobj.cpp header
//
#ifndef __hspvar_netobj_h
#define __hspvar_netobj_h


#ifndef HSP_COM_UNSUPPORTED		//�iCOM �T�|�[�g�Ȃ��ł̃r���h���̓t�@�C���S�̂𖳎��j



#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <objbase.h>

#ifdef __cplusplus
extern "C" {
#endif

#define TYPE_NETOBJ 8
	using NativePointer = void*;

	void HspVarNetobj_Init(HspVarProc *p);

#ifdef __cplusplus
}
#endif


#endif	// !defined( HSP_COM_UNSUPPORTED )


#endif	// __hspvar_comobj_h
