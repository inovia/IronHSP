
//
//		HSP3.0 plugin sample
//		onion software/onitama 2004/9
//

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include "hsp3plugin.h"

#include "hspvar_float.h"

 /*------------------------------------------------------------*/
/*
		controller
*/
/*------------------------------------------------------------*/

static float ref_fval;						// �Ԓl�̂��߂̕ϐ�
static double dp1;

static void *reffunc( int *type_res, int cmd )
{
	//		�֐��E�V�X�e���ϐ��̎��s���� (�l�̎Q�Ǝ��ɌĂ΂�܂�)
	//
	//			'('�Ŏn�܂邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) puterror( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) puterror( HSPERR_INVALID_FUNCPARAM );
	code_next();


	switch( cmd ) {							// �T�u�R�}���h���Ƃ̕���

	case 0x00:								// float�֐�

		dp1 = code_getd();					// �����l���擾(�f�t�H���g�Ȃ�)
		ref_fval = (float)dp1;				// �Ԓl��ݒ�
		break;

	default:
		puterror( HSPERR_UNSUPPORTED_FUNCTION );
	}

	//			'('�ŏI��邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) puterror( HSPERR_INVALID_FUNCPARAM );
	if ( *val != ')' ) puterror( HSPERR_INVALID_FUNCPARAM );
	code_next();

	*type_res = HspVarFloat_typeid();		// �Ԓl�̃^�C�v���w�肷��
	return (void *)&ref_fval;
}


/*------------------------------------------------------------*/

static int termfunc( int option )
{
	//		�I������ (�A�v���P�[�V�����I�����ɌĂ΂�܂�)
	//
	return 0;
}


/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

int WINAPI DllMain (HINSTANCE hInstance, DWORD fdwReason, PVOID pvReserved)
{
	//		DLL�G���g���[ (��������K�v�͂���܂���)
	//
	return TRUE;
}


EXPORT void WINAPI hsp3cmdinit( HSP3TYPEINFO *info )
{
	//		�v���O�C�������� (���s�E�I��������o�^���܂�)
	//
	hsp3sdk_init( info );		// SDK�̏�����(�ŏ��ɍs�Ȃ��ĉ�����)

	info->reffunc = reffunc;		// �Q�Ɗ֐�(reffunc)�̓o�^
	info->termfunc = termfunc;		// �I���֐�(termfunc)�̓o�^

	registvar( -1, HspVarFloat_Init );		// �V�����^�̒ǉ�
}

/*------------------------------------------------------------*/

