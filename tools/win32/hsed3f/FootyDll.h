/*================================================================
Footy�e�L�X�g�G�f�B�^�R���g���[���p�w�b�_

���̃w�b�_�t�@�C�����g�p����t�@�C���ŃC���N���[�h���Ă��������B
#include "FootyDll.h"

�����Ӂ�
���̃t�@�C����ҏW����Ƒz�����o���Ȃ����Ƃ��N�����Ă��܂��\����
��������Ȃ������肵�Ȃ��ł��Ȃ��̂ŁA���ƂȂ����g���Ă��������B

Copyright(C)2003-2004 ShinjiWatanabe
================================================================*/

#ifndef _FOOTY_DLL_H_
#define _FOOTY_DLL_H_

//�G�N�X�|�[�g
#ifndef FOOTYEXPORT
	#define FOOTYEXPORT	extern "C" __declspec(dllexport)
#endif

//�K�v�ȃt�@�C���̃C���N���[�h
#include <windows.h>
#include <tchar.h>

//UNICODE�ł͌��ݐ������ł��B
#ifdef _UNICODE
	#undef _UNICODE
#endif
#ifdef UNICODE
	#undef UNICODE
#endif

//�ÓI�����N���C�u������p�֐�
#ifdef FOOTYSTATIC
	FOOTYEXPORT bool FootyStart(HINSTANCE hInstance);
	FOOTYEXPORT void FootySetCursor(int OnLine,int OnUrl);
	FOOTYEXPORT void FootyEnd();
#endif

//�֗��ȃ}�N��//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define ONLYLEVEL(x)		(1 << (23 + (x)))									/*FootyAddEmphasis�p*/

//���b�Z�[�W�p�̒萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define	FE_CHANGE			WM_USER+1000										/*�ύX���������Ƃ��ɑ����܂��B*/
#define		FECH_SB			0													/*�V���O���o�C�g�������}�����ꂽ�Ƃ�*/
#define		FECH_IME		1													/*�h�l�d�ɂ�镶����*/
#define		FECH_RETURN		2													/*���s*/
#define		FECH_BS			3													/*�o�b�N�X�y�[�X*/
#define		FECH_DEL		4													/*Delete�L�[*/
#define		FECH_PASTE		5													/*�\��t��*/
#define		FECH_CUT		6													/*�J�b�g*/
#define		FECH_UNDO		7													/*�A���h�D*/
#define		FECH_REDO		8													/*���h�D*/
#define		FECH_TAB		9													/*�^�u�������ꂽ*/
#define		FECH_SETSEL		10													/*FootySetSelText����*/
#define		FECH_SETTEXT	11													/*FootySetText����*/
#define		FECH_INDENT		12													/*�C���f���g�������s��ꂽ�Ƃ�*/
#define		FECH_REINDENT	13													/*�t�C���f���g�������s��ꂽ�Ƃ�*/
#define		FECH_OLE		14													/*OLE DnD���s��ꂽ�Ƃ�*/

#define	FE_MOUSEMOVE		WM_USER+1001										/*�}�E�X���������ꂽ�Ƃ��ɔ������܂��B*/
#define		FEMM_NONE		0													/*�ʏ�̏�Ԃł��B*/
#define		FEMM_ONLN		1													/*�s�ԍ���ɂ���܂��B*/
#define		FEMM_ONRL		2													/*���[����ɂ���܂��B*/
#define		FEMM_DRAG		3													/*�h���b�O���ł��B*/
#define		FEMM_DRAGLN		4													/*�s�ԍ����h���b�O���ł��B*/
#define		FEMM_ON_URL		5													/*�t�q�k��ɂ���܂��B*/
#define		FEMM_ON_MAIL	6													/*���[���A�h���X��ɂ���܂��B*/

#define FE_CONTEXTMENU		WM_USER+1002										/*�R���e�L�X�g���j���[�̌Ăяo���v��*/

#define FE_CARETMOVE		WM_USER+1003										/*�J�[�\�����������ꂽ*/
#define		FECM_COMMAND	0													/*�R�}���h�ɂ���ē������ꂽ*/
#define		FECM_KEY		1													/*�L�[�̓���*/
#define		FECM_MOUSE		2													/*�}�E�X�̓���*/
#define		FECM_OLE		3													/*OLE�֘A*/

#define FE_SELCHANGE		WM_USER+1004										/*�I����Ԃ��ύX���ꂽ*/
#define FE_INSCHANGE		WM_USER+1005

//�}�[�N�p�̒萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_MARK_NONE			0													/*�����Ȃ�*/
#define F_MARK_BB			1													/*���_�ł��B*/
#define F_MARK_RB			2													/*�Ԃ��_�ł��B*/
#define F_MARK_GB			3													/*�΂̖_�ł��B*/

//�����P��̒萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define EMP_INVALIDITY		0													/*����*/
#define EMP_WORD			1													/*�P�������*/
#define EMP_LINE_AFTER		2													/*����ȍ~�`�s��*/
#define EMP_LINE_BETWEEN	3													/*��̕����̊ԁi����s�Ɍ���E��̕�������w��j*/
#define EMP_MULTI_BETWEEN	4													/*��̕����̊ԁi�����s�ɂ킽��E��̕�������w��E�ő��g�܂Łj*/

//�}�[�N�萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_SC_TAB			0													/*�^�u����*/
#define F_SC_HALFSPACE		1													/*���p�X�y�[�X*/
#define F_SC_NORMALSPACE	2													/*�S�p�X�y�[�X*/
#define F_SC_UNDERLINE		3													/*�J�[�\�����A���_�[���C��*/
#define F_SC_CRLF			4													/*CRLF���s*/
#define F_SC_EOF			5													/*[EOF]*/

//�F�w��p�萔�萔/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_SC_DEFAULT		6													/*�ʏ핶����*/
#define F_SC_LINENUM		7													/*�s�ԍ��\��������*/
#define F_SC_LINENUMBORDER	8													/*�s�ԍ��ƃG�f�B�^�̋��E��*/
#define F_SC_CARETLINE		9													/*�s�ԍ��ɕ\������L�����b�g�ʒu�̐F*/
#define F_SC_RULER_TXT		10													/*���[���[�̕����F*/
#define F_SC_RULER_BK		11													/*���[���[�̔w�i�F*/
#define F_SC_RULER_LINE		12													/*���[���[�̐��̐F*/
#define F_SC_CARETPOS		13													/*���[���[�ɕ\������L�����b�g�ʒu�̐F*/
#define F_SC_URL			14													/*�N���b�J�u��URL�̐F*/
#define F_SC_MAIL			15													/*�N���b�J�u�����[���A�h���X�̐F*/
#define F_SC_HIGHLIGHT_TXT	16													/*�����\��������̕����F*/
#define F_SC_HIGHLIGHT_BK	17													/*�����\��������̔w�i�F*/
#define F_SC_BACKGROUND		18													/*�w�i�F*/
#define F_SC_URL_UNDER		19													/*URL����*/
#define F_SC_MAIL_UNDER		20													/*���[������*/

//�����\���p�萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_SE_BOLD			1													/*�����ɂ���*/
#define F_SE_NON_BS			2													/*�啶���Ə���������ʂ��Ȃ�*/
#define F_SE_INDEPENDENCE_A	4													/*�Ɨ�����������̂�*/
#define F_SE_INDEPENDENCE_B	8													/*�Ɨ�����������̂�*/
#define F_SE_INDEPENDENCE_C	16													/*�Ɨ�����������̂�*/
#define F_SE_INDEPENDENCE_D	32													/*�Ɨ�����������̂�*/
#define F_SE_HEAD			64													/*�s���ɂ���Ƃ��̂�*/

//�������\���E��\���؂�ւ�///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_CS_SHOW			0													/*�\��*/
#define F_CS_HIDE			1													/*��\��*/

//���l�ݒ�p�萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_SM_TAB			0													/*�^�u�̕�����*/
#define F_SM_RULER			1													/*���[���[�̍���*/
#define F_SM_LINENUM		2													/*�s�ԍ��\���̈�*/
#define F_SM_ROP2			3													/*SetROP2�Ŏg�p����l*/
#define F_SM_FN_WEIGHT		4													/*�����\���̑�����fnWeight�̒l*/
#define F_SM_WHEELSCROLL	5													/*�z�C�[���}�E�X�̃X�N���[���s*/
#define F_SM_LINESPACE		6													/*�s�ԃX�y�[�X*/
#define F_SM_CLICKABLE_MODE	7													/*�N���b�J�u�����[�h*/
#define F_SM_OLEMODE		8													/*OLE���[�h*/
#define F_SM_URLLINEMODE	9													/*URL�����̕`����@*/
#define F_SM_MAILLINEMODE	10													/*���[���A�h���X�����̕`����@*/
#define F_SM_BORDERLINEMODE	11													/*���E���̕`����@*/
#define F_SM_INSERTMODE		12													/*�}�����*/
#define F_SM_LINEMARGIN		13													/*�s�Ƃ̃}�[�W��*/
#define F_SM_OWNDRAWMODE	14													/*�I�[�i�[�h���[���[�h*/
#define F_SM_CREATESHOW		15													/*�������̕\���E��\����Ԃ̐؂�ւ�*/
#define F_SM_UNDONUM		16													/*�A���h�D�̎g�p�\��*/
#define F_SM_SELGETMODE		17													/*�I�����[�h*/
#define F_SM_SETSELMODE		18													/*�_�u���N���b�N�����Ƃ��̑I����@*/

//���l�擾�p�萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_GM_FONTWIDTH		0													/*�t�H���g��(���p)�s�N�Z��*/
#define F_GM_FONTHEIGHT		1													/*�t�H���g�����s�N�Z��*/
#define F_GM_UNDOREM		2													/*�A���h�D�̎c��g�p�\��*/
#define F_GM_REDOREM		3													/*���h�D�̎c��g�p��*/
#define F_GM_CARETPOS_X		4													/*�L�����b�g�̈ʒux���W*/
#define F_GM_CARETPOS_Y		5													/*�L�����b�g�̈ʒuy���W*/

//���s�R�[�h�萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define RETLINE_CRLF		1													/*�L�����b�W���^�[���{���C���t�B�[�h*/
#define RETLINE_CR			2													/*�L�����b�W���^�[���̂�*/
#define RETLINE_LF			3													/*���C���t�B�[�h�̂�*/
#define RETLINE_AUTO		4													/*�����o��*/

//���l�擾�p�萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define SELMODE_NORMAL		0													/*�ʏ탂�[�h*/
#define SELMODE_NUMALPHA	1													/*�A���t�@�x�b�g�Ɛ����𓯎��ɑI��*/

//�N���b�J�u�����[�h�萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_CM_ALLMODE		-1													/*�I�[�����[�h(�S�@�\��L����)*/
#define F_CM_MAIL			1													/*���[���A�h���X*/
#define F_CM_HTTP			2													/*http://*/
#define F_CM_HTTPS			4													/*https://*/
#define F_CM_FTP			8													/*ftp://*/

//OLE���[�h�萔////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_OLE_CUT			1													/*�J�b�g���[�h*/
#define F_OLE_COPY			2													/*�R�s�[���[�h*/
#define F_OLE_N_IN			4													/*�󂯓��ꋑ��*/
#define F_OLE_N_OUT			8													/*�o�͋���*/
#define F_OLE_CTRL			16													/*�R���g���[�����[�h*/

//�֑������萔/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_JPN_NONE			0													/*�Ȃ�*/
#define F_JPN_SOFT			1													/*�Â�*/
#define F_JPN_NORMAL		2													/*�ʏ�*/
#define F_JPN_HARD			3													/*������*/

//�I�[�i�[�h���[�p�̒萔///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_OD_NONE			0													/*����*/
#define F_OD_ALL			-1													/*�S��*/
#define F_OD_HALFSPACE		0x01												/*���p�X�y�[�X*/
#define F_OD_NORMALSPACE	0x02												/*�S�p�X�y�[�X*/
#define F_OD_TAB			0x04												/*�^�u����*/
#define F_OD_CRLF			0x08												/*���s*/
#define F_OD_EOF			0x10												/*[EOF]*/

#define ODT_FOOTY			1000												/*���ꂪFooty�ł��邱�Ƃ�����*/
#define ODS_HALFSPACE		0													/*���p�X�y�[�X*/
#define ODS_NORMALSPACE		1													/*�S�p�X�y�[�X*/
#define ODS_TAB				2													/*�^�u*/
#define ODS_CRLF			3													/*���s*/
#define ODS_EOF				4													/*[EOF]*/

//�߂�l�̒萔/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define F_RET_OK			-1													/*����*/
#define F_RET_FAILED		-2													/*���炩�̌�����DLL�����ŏ��������s����*/
#define F_RET_MEMORY		-3													/*�������s���ɂ���Ǝ��s*/
#define F_RET_PROGRAM		-4													/*�v���O��������n���ꂽ�������s���iID���̂����j*/
#define F_RET_OUTID			-5													/*�v���O��������n���ꂽID���s��*/
#define F_RET_CANCELED		-6													/*�L�����Z�����ꂽ*/
#define F_RET_CANNOTWRITE	-7													/*�������݋֎~��ԂɂȂ��Ă���*/
#define F_RET_OVER_MAX		-8													/*�����P����w�肵����*/
#define F_RET_OVER_LINE		-9													/*�����s�ɂ킽��P����w�肵����*/
#define F_RET_OVER_INTE		-10													/*���荞�݋��ɒP����w�肵����*/
#define F_RET_ALREADY		-11													/*���łɐ�������Ă���*/
#define F_RET_NSELECTING	-12													/*�I�����Ă��܂���B*/

//�֐��|�C���^/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef void (__stdcall *pFuncCaretMove)(int,void*,int);
typedef void (__stdcall *pFuncSelChange)(int,void*);
typedef void (__stdcall *pFuncInsChange)(int,void*,int);
typedef void (__stdcall *pFuncChange)(int,void*,int);
typedef void (__stdcall *pFuncContext)(int,void*);
typedef void (__stdcall *pFuncMouseMove)(int,void*,int);

//�֐�/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//�o�[�W�����֘A
FOOTYEXPORT int __stdcall GetFootyVer();										/*Footy�̃o�[�W�������擾���܂��B*/
FOOTYEXPORT int __stdcall GetFootyBetaVer();									/*Footy�̃��o�[�W�������擾���܂��B*/

//Footy��ID�Ǘ�
FOOTYEXPORT int __stdcall FootyRedim(int num);									/*Footy��ID���m�ۂ�����m�ۂ��Ȃ������肵�܂��B*/
FOOTYEXPORT int __stdcall FootyDelete(int id);									/*�m�ۂ��ꂽID�̃f�[�^���������ă������̈���m�ۂ��܂��B*/
FOOTYEXPORT int __stdcall FootyCreate(int id,HWND hWnd,int x,
									  int y,int dx,int dy);						/*Footy���쐬���܂��B*/

//�E�B���h�E�֘A
FOOTYEXPORT int __stdcall FootySetFocus(int id);								/*Footy�Ƀt�H�[�J�X�����킹�܂��B*/
FOOTYEXPORT int __stdcall FootySetPos(int id,int x,int y,int dx,int dy);		/*Footy�̈ʒu�A�傫����ύX���܂��B*/
FOOTYEXPORT int __stdcall FootyRefresh(int id);									/*Footy���ĕ`�ʂ��܂��B*/
FOOTYEXPORT int __stdcall FootySetVisible(int id,bool v);						/*Footy�̕\���E��\����؂�ւ��܂��B*/
FOOTYEXPORT HWND __stdcall FootyGetWnd(int id);									/*Footy�̃E�B���h�E�n���h�����擾���܂��B*/

//�ҏW�֘A
FOOTYEXPORT int __stdcall FootyCopy(int id);									/*���ݑI�����Ă��镶�����N���b�v�{�[�h�փR�s�[���܂��B*/
FOOTYEXPORT int __stdcall FootyCut(int id);										/*���ݑI�����Ă��镶�����N���b�v�{�[�h�փR�s�[���č폜���܂��B*/
FOOTYEXPORT int __stdcall FootyPaste(int id);									/*�N���b�v�{�[�h���猻�݂̃L�����b�g�̈ʒu�ɓ\��t���܂��B*/
FOOTYEXPORT int __stdcall FootyUndo(int id);									/*�A���h�D�������s���܂��B*/
FOOTYEXPORT int __stdcall FootyRedo(int id);									/*���h�D�������s���܂��B*/
FOOTYEXPORT int __stdcall FootyIndent(int id);									/*�C���f���g�������s���܂��B*/
FOOTYEXPORT int __stdcall FootyUnIndent(int id);								/*�t�C���f���g�������s���܂��B*/
FOOTYEXPORT int __stdcall FootySelectAll(int id);								/*�S�đI���������s���܂��B*/

//�����f�[�^�̎擾�E�ݒ�
FOOTYEXPORT int __stdcall FootySetText(int id,const _TCHAR *pszText);			/*Footy�̃e�L�X�g�S�̂�ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootyGetTextLength(int id);							/*���ݕҏW���̃e�L�X�g�̃o�C�g���𓾂܂��B*/
FOOTYEXPORT int __stdcall FootyGetText(int id,_TCHAR *pOut,int ret=RETLINE_AUTO);/*���ݕҏW���̃e�L�X�g���擾���܂��B*/
FOOTYEXPORT int __stdcall FootyGetLines(int id);								/*���݂̑��s�����擾���܂��B*/
FOOTYEXPORT int __stdcall FootySetSelText(int id,const _TCHAR *pszText);		/*�I�𕶎���̐ݒ�*/
FOOTYEXPORT int __stdcall FootyGetSelText(int id,_TCHAR *pOut);					/*�I�𕶎���̎擾*/
FOOTYEXPORT const _TCHAR* __stdcall FootyGetLineData(int id,int line);			/*�w�肵���s�̓��e���擾*/
FOOTYEXPORT int __stdcall FootyGetLineLen(int id,int line);						/*�w�肵���s�̒������擾*/
FOOTYEXPORT int __stdcall FootyGetLineCode(int id);								/*���s�R�[�h�̎�ނ��擾*/

//�I���֘A
FOOTYEXPORT int __stdcall FootySetSelA(int id,int sLine,int sPos,
									   int eLine,int ePos);						/*�I����Ԃ�ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootyGetSelA(int id,int *psLine,int *psPos,
									   int *peLine,int *pePos);					/*�I����Ԃ̎擾*/
FOOTYEXPORT int __stdcall FootySetSelB(int id,int sPos,int ePos);				/*�I����Ԃ�ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootyGetSelB(int id,int *pStart,int *pEnd);			/*�I����Ԃ̎擾*/

//�J�[�\���֘A
FOOTYEXPORT int __stdcall FootyGetCaretLine(int id);							/*�L�����b�g�s���擾���܂��B*/
FOOTYEXPORT int __stdcall FootyGetCaretPos(int id);								/*�L�����b�g�����擾���܂��B(Tab���ꕶ���Ɗ��Z)*/
FOOTYEXPORT int __stdcall FootySetCaretLine(int id,int line);					/*�L�����b�g�s��ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootySetCaretPos(int id,int pos);						/*�L�����b�g����ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootyGetCaretThrough(int id);							/*�L�����b�g�ʒu��ʂ��ԍ��Ŏ擾���܂��B*/
FOOTYEXPORT int __stdcall FootySetCaretThrough(int id,int pos);					/*�L�����b�g�ʒu�𓙂��ԍ��Őݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootyGetCaretVPos(int id);							/*�L�����b�g�������ۂ̈ʒu�Ŏ擾���܂��B*/

//�}�[�N�E����
FOOTYEXPORT int __stdcall FootySetMark(int id,int line,int mark,
									   bool bRedraw=true);						/*�}�[�N���Z�b�g���܂��B*/
FOOTYEXPORT int __stdcall FootyGetMark(int id,int line);						/*�}�[�N���擾���܂��B*/
FOOTYEXPORT int __stdcall FootySetHighlight(int id,const _TCHAR *szString,
											bool bBS,bool bRedraw=true);		/*�n�C���C�g������ݒ肵�܂��B*/

FOOTYEXPORT int __stdcall FootyAddEmphasis(int id,const _TCHAR *szWord1,const _TCHAR *szWord2,int nType,
										   COLORREF color,int nStatus,int nLevel,
										   int nPLevel=0);						/*����������ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootyResetEmphasis(int id,bool bRedraw=true);			/*�����\����S�ĉ���*/


//�ݒ�֘A
FOOTYEXPORT int __stdcall FootyFontDialog(int id,_TCHAR *szFontName=NULL,
										  bool bRedraw=true);					/*�t�H���g�_�C�A���O��\�����A���̓��e�ɕ\����ύX���܂��B*/
FOOTYEXPORT int __stdcall FootySetFont(int id,const _TCHAR *szFontName,
									   int point,bool bRedraw=true);			/*�t�H���g��ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootySetColor(int id,int obj,COLORREF color,
										bool bRedraw=true);						/*�F��ύX���܂��i�}�[�N�p�萔����ѐF�w��萔���g�p�\�j*/
FOOTYEXPORT int __stdcall FootySetMarkVisible(int id,int obj,bool bVisible,
										      bool bRedraw=true);				/*�}�[�N�̕\���ݒ�����܂��B*/
FOOTYEXPORT int __stdcall FootySetMetrics(int id,int object,
										  int num,bool bRedraw=true);			/*���l��ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootyGetMetrics(int id,int object);					/*���l���擾���܂��B*/
FOOTYEXPORT int __stdcall FootyWriteEnable(int id,bool bEnable);				/*�����������\�ł��邩�ǂ����ݒ肵�܂��B*/
FOOTYEXPORT int __stdcall FootySetLapel(int id,bool bLapel,
										int JPNhyphenation,bool bRedraw=true);	/*�܂�Ԃ������ł��B*/


//�֐��|�C���^�o�^
FOOTYEXPORT int __stdcall FootyEventCaretMove(int id,pFuncCaretMove pFunc,void *pParam);
FOOTYEXPORT int __stdcall FootyEventSelChange(int id,pFuncSelChange pFunc,void *pParam);
FOOTYEXPORT int __stdcall FootyEventInsChange(int id,pFuncInsChange pFunc,void *pParam);
FOOTYEXPORT int __stdcall FootyEventChange(int id,pFuncChange pFunc,void *pParam);
FOOTYEXPORT int __stdcall FootyEventContextMenu(int id,pFuncContext pFunc,void *pParam);
FOOTYEXPORT int __stdcall FootyEventMouseMove(int id,pFuncMouseMove pFunc,void *pParam);


#endif

/*
 * FootyEditorControl for Win32 JapaneseEdition
 * Copyright(C)2002-2004 ShinjiWatanabe
 */