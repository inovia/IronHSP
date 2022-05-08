
//
//	HSP3 debug support
//	(�G���[��������уf�o�b�O�x��)
//	onion software/onitama 2004/6
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hsp3config.h"
#include "hsp3code.h"
#include "supio.h"

/*------------------------------------------------------------*/
/*
		system data
*/
/*------------------------------------------------------------*/


/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

#ifdef HSPDEBUG

static char *err_jp[]={
	"",												// 0
	"�V�X�e���G���[���������܂���",					// 1
	"���@���Ԉ���Ă��܂�",							// 2
	"�p�����[�^�̒l���ُ�ł�",						// 3
	"�v�Z���ŃG���[���������܂���",					// 4
	"�p�����[�^�̏ȗ��͂ł��܂���",					// 5
	"�p�����[�^�̌^���Ⴂ�܂�",						// 6
	"�z��̗v�f�������ł�",							// 7
	"�L���ȃ��x�����w�肳��Ă��܂���",				// 8
	"�T�u���[�`���⃋�[�v�̃l�X�g���[�����܂�",		// 9
	"�T�u���[�`���O��return�͖����ł�",				// 10
	"repeat�O�ł�loop�͖����ł�",					// 11
	"�t�@�C����������Ȃ��������Ȗ��O�ł�",		// 12
	"�摜�t�@�C��������܂���",						// 13
	"�O���t�@�C���Ăяo�����̃G���[�ł�",			// 14
	"�v�Z���ŃJ�b�R�̋L�q���Ⴂ�܂�",				// 15
	"�p�����[�^�̐����������܂�",					// 16
	"�����񎮂ň����镶�������z���܂���",			// 17
	"����ł��Ȃ��ϐ������w�肵�Ă��܂�",			// 18
	"0�ŏ��Z���܂���",								// 19
	"�o�b�t�@�I�[�o�[�t���[���������܂���",			// 20
	"�T�|�[�g����Ȃ��@�\��I�����܂���",			// 21
	"�v�Z���̃J�b�R���[�����܂�",					// 22
	"�ϐ������w�肳��Ă��܂���",					// 23
	"�����ȊO���w�肳��Ă��܂�",					// 24
	"�z��̗v�f�������Ԉ���Ă��܂�",				// 25
	"�������̊m�ۂ��ł��܂���ł���",				// 26
	"�^�C�v�̏������Ɏ��s���܂���",					// 27
	"�֐��Ɉ������ݒ肳��Ă��܂���",				// 28
	"�X�^�b�N�̈�̃I�[�o�[�t���[�ł�",				// 29
	"�����Ȗ��O���p�����[�^�[�Ɏw�肳��Ă��܂�",	// 30
	"�قȂ�^�����z��ϐ��ɑ�����܂���",			// 31
	"�֐��̃p�����[�^�[�L�q���s���ł�",				// 32
	"�I�u�W�F�N�g�����������܂�",					// 33
	"�z��E�֐��Ƃ��Ďg�p�ł��Ȃ��^�ł�",			// 34
	"���W���[���ϐ����w�肳��Ă��܂���",			// 35
	"���W���[���ϐ��̎w�肪�����ł�",				// 36
	"�ϐ��^�̕ϊ��Ɏ��s���܂���",					// 37
	"�O��DLL�̌Ăяo���Ɏ��s���܂���",				// 38
	"�O���I�u�W�F�N�g�̌Ăяo���Ɏ��s���܂���",		// 39
	"�֐��̖߂�l���ݒ肳��Ă��܂���",				// 40
	"�֐��𖽗߂Ƃ��ċL�q���Ă��܂��B\n(HSP2����֐������ꂽ���O���g�p���Ă���\��������܂�)",			// 41
	"�R�[���o�b�N���Ŏg�p�ł��Ȃ����߂ł�",			// 42
	"*"
};

static char *err[]={
	"",									// 0
	"Unknown system error",				// 1
	"Syntax error",						// 2
	"Illegal function call",			// 3
	"Wrong expression",					// 4
	"Default parameter not allowed",	// 5
	"Type mismatch",					// 6
	"Array overflow",					// 7
	"Not a label object",				// 8
	"Too many nesting",					// 9
	"Return without gosub",				// 10
	"Loop without repeat",				// 11
	"File I/O error",					// 12
	"Picture file missing",				// 13
	"External execute error",			// 14
	"Priority error",					// 15
	"Too many parameters",				// 16
	"Temporary buffer overflow",		// 17
	"Wrong valiable name",				// 18
	"Divided by zero",					// 19
	"Buffer Overflow",					// 20
	"Unsupported function",				// 21
	"Expression too complex",			// 22
	"Variable required",				// 23
	"Integer value required",			// 24
	"Bad array expression",				// 25
	"Out of memory",					// 26
	"Type initalization failed",		// 27
	"No Function parameters",			// 28
	"Stack overflow",					// 29
	"Invalid parameter name",			// 30
	"Invalid type of array",			// 31
	"Invalid function parameter",		// 32
	"Too many window objects",			// 33
	"Invalid Array/Function",			// 34
	"Structure required",				// 35
	"Illegal structure call",			// 36
	"Invalid type of variable",			// 37
	"DLL call failed",					// 38
	"External COM call failed",			// 39
	"No function result",				// 40
	"Invalid syntax for function",		// 41
	"function not allowed in callback",	// 42
	"*"
};

char *hspd_geterror( HSPERROR error )
{
	if ((error<0)||(error>=HSPERR_MAX)) return "";

	HSPCTX *ctx = code_getctx();
	int lang = ctx->language;

	if (lang== HSPCTX_LANGUAGE_JP) return err_jp[error];
	return err[error];
}

#else

static char errmsg[256];

char *hspd_geterror( HSPERROR error )
{
	HSPCTX* ctx = code_getctx();
	int lang = ctx->language;

	if (lang == 1) {
		sprintf(errmsg, "�����G���[���������܂���(%d)", (int)error);
		return errmsg;
	}
	sprintf( errmsg, "Internal Error(%d)", (int)error );
	return errmsg;
}

#endif



