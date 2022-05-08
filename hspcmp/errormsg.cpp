
//
//	HSP3 debug support
//	(�G���[���b�Z�[�W)
//	onion software/onitama 2004/6
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../hsp3/hsp3config.h"
#include "hsc3.h"
#include "errormsg.h"

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

#ifdef JPNMSG
static char *err[]={
	"",														// 0
	"���߂ł��Ȃ������R�[�h�ł�",							// 1
	"���@���Ԉ���Ă��܂�",									// 2
	"�����̋L�q���Ԉ���Ă��܂�",							// 3
	"�p�����[�^�[���̋L�q�������ł�",						// 4
	"�J�b�R�������Ă��܂���",							// 5
	"�z��̏������Ԉ���Ă��܂�",							// 6
	"���x�����͂��łɎg���Ă��܂�",						// 7
	"���x�����͎w��ł��܂���",								// 8
	"repeat�̃l�X�g���[�����܂�",							// 9
	"repeat���[�v�O��break���g�p����܂���",				// 10
	"repeat���[�v�O��continue���g�p����܂���",				// 11
	"repeat���[�v�łȂ��̂�loop���g�p����܂���",			// 12
	"repeat���[�v�������Ă��܂���",						// 13
	"else�̑O��if����������܂���",							// 14
	"{�������Ă��܂���",								// 15
	"if���߈ȊO��{�`}���g���Ă��܂�",						// 16
	"else���߂̈ʒu���s���ł�",								// 17
	"if���߂̊K�w���[�����܂�",								// 18
	"�v���I�ȃG���[�ł�",									// 19
	"�v���v���Z�b�T���߂����߂ł��܂���",					// 20
	"�R�}���h�o�^���̃G���[�ł�",							// 21
	"�v���v���Z�b�T�͕�����̂ݎ󂯕t���܂�",				// 22
	"�p�����[�^�[�����̎w�肪�Ԉ���Ă��܂�",				// 23
	"���C�u���������w�肳��Ă��܂���",						// 24
	"���߂Ƃ��Ē�`�ł��Ȃ����O�ł�",						// 25
	"�p�����[�^�[�������͎g�p����Ă��܂�",					// 26
	"���W���[���ϐ��̎Q�ƌ��������ł�",						// 27
	"���W���[���ϐ��̎w�肪�����ł�",						// 28
	"�O���֐��̃C���|�[�g���������ł�",						// 29
	"�g�����߂̖��O�͂��łɎg�p����Ă��܂�",				// 30
	"�݊����̂Ȃ��g�����߃^�C�v���g�p���Ă��܂�",			// 31
	"�R���X�g���N�^�͊��ɓo�^����Ă��܂�",					// 32
	"�f�X�g���N�^�͊��ɓo�^����Ă��܂�",					// 33
	"�����s������̏I�[�ł͂���܂���",						// 34
	"�^�O���͂��łɎg�p����Ă��܂�",						// 35
	"�C���^�[�t�F�[�X�����w�肳��Ă��܂���",				// 36
	"�C���|�[�g����C���f�b�N�X���w�肳��Ă��܂���",		// 37
	"�C���|�[�g����IID�����w�肳��Ă��܂���",				// 38
	"���������ϐ����g�p���悤�Ƃ��܂���",					// 39
	"�w��ł��Ȃ��ϐ����ł�",								// 40
	"*"
};
#else
static char *err[]={
	"",														// 0
	"Unknown code",											// 1
	"Syntax error",											// 2
	"Wrong expression (float)",								// 3
	"Wrong expression (parameter)",							// 4
	"Parameter not closed",									// 5
	"Wrong array expression",								// 6
	"Label name is already in use",							// 7
	"Reserved name for label",								// 8
	"Too many repeat level",								// 9
	"break without repeat command",							// 10
	"continue without repeat command",						// 11
	"loop without repeat command",							// 12
	"loop not found for repeat command",					// 13
	"Not match if and else pair",							// 14
	"Not match { and } pair",								// 15
	"Not allow { and } in here",							// 16
	"Illegal use of else command",							// 17
	"Too many If command level",							// 18
	"Fatal error occurs",									// 19
	"Preprocessor syntax error",							// 20
	"Error during register command",						// 21
	"Only strings are acceptable",							// 22
	"Wrong parameter name expression",						// 23
	"No library name to bind",								// 24
	"custom name already in use",							// 25
	"parameter name already in use",						// 26
	"Bad structure source expression",						// 27
	"Bad structure expression",								// 28
	"Bad import name",										// 29
	"External func name in use",							// 30
	"Incompatible type of import",							// 31
	"Initalizer already exists",							// 32
	"Terminator already exists",							// 33
	"Wrong multi line string expression",					// 34
	"Tag name already in use",								// 35
	"No interface name to bind",							// 36
	"No import index to bind",								// 37
	"No import IID to bind",								// 38
	"Uninitalized variable detected",						// 39
	"Wrong name for variable",								// 40
	"*"
};
#endif

char *cg_geterror( CGERROR error )
{
	if ((error<0)||(error>=CGERROR_MAX)) return err[0];
	return err[error];
}

