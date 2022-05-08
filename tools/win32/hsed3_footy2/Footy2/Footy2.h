/*=============================================================================
Footy2.h
Footy�e�L�X�g�G�f�B�^�R���g���[���Q

Footy�̊֐����g�p���邽�߂̒�`��ǉ�����w�b�_�t�@�C���ł��B
# Windows Mobile�p�ɃR���p�C������Ƃ���UNDER_CE���v���v���Z�X�錾���܂��B

(C)2004-2009 ShinjiWatanabe
=============================================================================*/

#ifndef _FOOTY2_DLL_H_
#define _FOOTY2_DLL_H_

//�K�v�ȃt�@�C���̃C���N���[�h�A�G�N�X�|�[�g�錾///////////////////////////////
#include <windows.h>

#undef FOOTYEXPORT
#define FOOTYEXPORT(x)	extern "C" __declspec(dllexport) x __stdcall

//Unicode�p�̐錾//////////////////////////////////////////////////////////////
#ifdef _UNICODE
#	define Footy2AddEmphasis	Footy2AddEmphasisW
#	define Footy2SetText		Footy2SetTextW
#	define Footy2SetSelText		Footy2SetSelTextW
#	define Footy2GetTextLength	Footy2GetTextLengthW
#	define Footy2GetLine		Footy2GetLineW
#	define Footy2SetLine		Footy2SetLineW
#	define Footy2GetLineLength	Footy2GetLineLengthW
#	define Footy2TextFromFile	Footy2TextFromFileW
#	define Footy2SaveToFile		Footy2SaveToFileW
#	define Footy2SetFontFace	Footy2SetFontFaceW
#	define Footy2Search			Footy2SearchW
#	define Footy2GetText		Footy2GetTextW
#	define Footy2GetSelText		Footy2GetSelTextW
#	define Footy2GetSelLength	Footy2GetSelLengthW
#	define Footy2SetBackgroundImage	Footy2SetBackgroundImageW
#else	/*! _UNICODE*/
#	define Footy2AddEmphasis	Footy2AddEmphasisA
#	define Footy2SetText		Footy2SetTextA
#	define Footy2SetSelText		Footy2SetSelTextA
#	define Footy2GetTextLength	Footy2GetTextLengthA
#	define Footy2GetLine		Footy2GetLineA
#	define Footy2SetLine		Footy2SetLineA
#	define Footy2GetLineLength	Footy2GetLineLengthA
#	define Footy2TextFromFile	Footy2TextFromFileA
#	define Footy2SaveToFile		Footy2SaveToFileA
#	define Footy2SetFontFace	Footy2SetFontFaceA
#	define Footy2Search			Footy2SearchA
#	define Footy2GetText		Footy2GetTextA
#	define Footy2GetSelText		Footy2GetSelTextA
#	define Footy2GetSelLength	Footy2GetSelLengthA
#	define Footy2SetBackgroundImage	Footy2SetBackgroundImageA
#endif	/*_UNICODE*/

//�֐��|�C���^�ƃR�[���o�b�N�ݒ�///////////////////////////////////////////////
typedef void (__stdcall *Footy2FuncFocus)(int nID,void* pData,int nViewID,bool bFocused);
typedef void (__stdcall *Footy2FuncMoveCaret)(int nID,void* pData,size_t nCaretLine,size_t nCaretColumn);
typedef void (__stdcall *Footy2FuncTextModified)(int nID,void* pData,int nCause);
typedef void (__stdcall *Footy2FuncInsertModeChanged)(int nID,void* pData,bool bInsertMode);
FOOTYEXPORT(int) Footy2SetFuncFocus(int nID,Footy2FuncFocus pFunc,void *pData);
FOOTYEXPORT(int) Footy2SetFuncMoveCaret(int nID,Footy2FuncMoveCaret pFunc,void *pData);
FOOTYEXPORT(int) Footy2SetFuncTextModified(int nID,Footy2FuncTextModified pFunc,void *pData);
FOOTYEXPORT(int) Footy2SetFuncInsertModeChanged(int nID,Footy2FuncInsertModeChanged pFunc,void *pData);

//�֗��ȃ}�N��/////////////////////////////////////////////////////////////////
#define PERMIT_LEVEL(x)		(1 << (x))

//�萔�̐錾///////////////////////////////////////////////////////////////////

enum UrlType									//!< URL�^�C�v
{
	URLTYPE_HTTP,								//!< http
	URLTYPE_HTTPS,								//!< https
	URLTYPE_FTP,								//!< ftp
	URLTYPE_MAIL,								//!< ���[���A�h���X
	URLTYPE_LABEL,								//!< ���x�� by Tetr@pod
	URLTYPE_FUNC,								//!< ���߁E�֐� by Tetr@pod
};

enum ViewMode
{
	VIEWMODE_NORMAL,							//!< �V���O�����[�h
	VIEWMODE_VERTICAL,							//!< �c����
	VIEWMODE_HORIZONTAL,						//!< ������
	VIEWMODE_QUAD,								//!< �l����
	VIEWMODE_INVISIBLE,							//!< ��\��
};

enum EmpMode
{
	EMP_INVALIDITY,								//!< ����
	EMP_WORD,									//!< �P�������
	EMP_LINE_AFTER,								//!< ����ȍ~�`�s��
	EMP_LINE_BETWEEN,							//!< ��̕����̊ԁi����s�Ɍ���E��̕�������w��j
	EMP_MULTI_BETWEEN,							//!< ��̕����̊ԁi�����s�ɂ킽��E��̕�������w��j
};

enum ColorPos
{
	CP_TEXT,									//!< �ʏ�̕���
	CP_BACKGROUND,								//!< �w�i�F
	CP_CRLF,									//!< ���s�}�[�N
	CP_HALFSPACE,								//!< ���p�X�y�[�X
	CP_NORMALSPACE,								//!< �S�p�X�y�[�X
	CP_TAB,										//!< �^�u����
	CP_EOF,										//!< [EOF]
	CP_UNDERLINE,								//!< �L�����b�g�̉��̃A���_�[���C��
	CP_LINENUMBORDER,							//!< �s�ԍ��ƃe�L�X�g�G�f�B�^�̋��E��
	CP_LINENUMTEXT,								//!< �s�ԍ��e�L�X�g
	CP_CARETLINE,								//!< �s�ԍ��̈�ɂ�����L�����b�g�ʒu����
	CP_RULERBACKGROUND,							//!< ���[���[�̔w�i�F
	CP_RULERTEXT,								//!< ���[���[�̃e�L�X�g
	CP_RULERLINE,								//!< ���[���[��̐�
	CP_CARETPOS,								//!< ���[���[�ɂ�����L�����b�g�ʒu����
	CP_URLTEXT,									//!< URL����
	CP_URLUNDERLINE,							//!< URL���ɕ\�������A���_�[���C��
	CP_MAILTEXT,								//!< ���[���A�h���X����
	CP_MAILUNDERLINE,							//!< ���[�����ɕ\�������A���_�[���C��
	CP_LABELTEXT,								//!< ���x������ by Tetr@pod
	CP_LABELUNDERLINE,							//!< ���x�����ɕ\�������A���_�[���C�� by Tetr@pod

	CP_FUNCTEXT1,								//!< ���߁E�֐�����1 by Tetr@pod
	CP_FUNCTEXT2,								//!< ���߁E�֐�����2 by Tetr@pod
	CP_FUNCTEXT3,								//!< ���߁E�֐�����3 by Tetr@pod
	CP_FUNCTEXT4,								//!< ���߁E�֐�����4 by Tetr@pod
	CP_FUNCTEXT5,								//!< ���߁E�֐�����5 by Tetr@pod
	CP_FUNCTEXT6,								//!< ���߁E�֐�����6 by Tetr@pod
	CP_FUNCTEXT7,								//!< ���߁E�֐�����7 by Tetr@pod
	CP_FUNCTEXT8,								//!< ���߁E�֐�����8 by Tetr@pod

	CP_HIGHLIGHTTEXT,							//!< �n�C���C�g�e�L�X�g
	CP_HIGHLIGHTBACKGROUND,						//!< �n�C���C�g�w�i�F
};

//! ���s�R�[�h
enum LineMode
{
	LM_AUTOMATIC,								//!< ����
	LM_CRLF,									//!< CrLf�R�[�h
	LM_CR,										//!< Cr�R�[�h
	LM_LF,										//!< Lf�R�[�h
	LM_ERROR,									//!< �G���[���ʗp�F�߂�l��p�ł�
};

//! �L�����N�^�Z�b�g
enum CharSetMode
{
	CSM_AUTOMATIC,								//!< �������[�h(�ʏ�͂�����g�p����)
#ifndef UNDER_CE
	CSM_PLATFORM,								//!< �v���b�g�t�H�[���ˑ�
#endif	/*not defined UNDER_CE*/

	// ���{��
	CSM_SHIFT_JIS_2004,							//!< ShiftJIS��JIS X 0213:2004�g��(WindowsVista�W��)
	CSM_EUC_JIS_2004,							//!< EUC-JP��JIS X 0213:2004�g��
	CSM_ISO_2022_JP_2004,						//!< JIS�R�[�h��JIS X 0213:2004�g��

	// ISO 8859
	CSM_ISO8859_1,								//!< �����[���b�p(Latin1)
	CSM_ISO8859_2,								//!< �����[���b�p(Latin2)
	CSM_ISO8859_3,								//!< �G�X�y�����g�ꑼ(Latin3)
	CSM_ISO8859_4,								//!< �k���[���b�p(Latin4)
	CSM_ISO8859_5,								//!< �L����
	CSM_ISO8859_6,								//!< �A���r�A
	CSM_ISO8859_7,								//!< �M���V��
	CSM_ISO8859_8,								//!< �w�u���C
	CSM_ISO8859_9,								//!< �g���R(Latin5)
	CSM_ISO8859_10,								//!< �k��(Latin6)
	CSM_ISO8859_11,								//!< �^�C
	/*ISO8859-12��1997�N�ɔj������܂���*/
	CSM_ISO8859_13,								//!< �o���g�����̌���
	CSM_ISO8859_14,								//!< �P���g��
	CSM_ISO8859_15,								//!< ISO 8859-1�̕ό`��
	CSM_ISO8859_16,								//!< ���새�[���b�p

	// Unicode
	CSM_UTF8,									//!< BOM����UTF8
	CSM_UTF8_BOM,								//!< BOM�t��UTF8
	CSM_UTF16_LE,								//!< BOM����UTF16���g���G���f�B�A��
	CSM_UTF16_LE_BOM,							//!< BOM�t��UTF16���g���G���f�B�A��
	CSM_UTF16_BE,								//!< BOM����UTF16�r�b�O�G���f�B�A��
	CSM_UTF16_BE_BOM,							//!< BOM�t��UTF16�r�b�O�G���f�B�A��
	CSM_UTF32_LE,								//!< BOM����UTF32���g���G���f�B�A��
	CSM_UTF32_LE_BOM,							//!< BOM�t��UTF32���g���G���f�B�A��
	CSM_UTF32_BE,								//!< BOM����UTF32�r�b�O�G���f�B�A��
	CSM_UTF32_BE_BOM,							//!< BOM�t��UTF32�r�b�O�G���f�B�A��
	
	// ���������p(�g�p���Ȃ��ł�������)
	CSM_ERROR,									//!< �G���[
};

//! �t�H���g
enum FontMode
{
	FFM_ANSI_CHARSET,							//!< ANSI����
	FFM_BALTIC_CHARSET,							//!< �o���g����
	FFM_BIG5_CHARSET,							//!< �ɑ̎������ꕶ��
	FFM_EASTEUROPE_CHARSET,						//!< �����[���b�p����
	FFM_GB2312_CHARSET,							//!< �ȑ̒����ꕶ��
	FFM_GREEK_CHARSET,							//!< �M���V������
	FFM_HANGUL_CHARSET,							//!< �n���O������
	FFM_RUSSIAN_CHARSET,						//!< �L��������
	FFM_SHIFTJIS_CHARSET,						//!< ���{��
	FFM_TURKISH_CHARSET,						//!< �g���R��
	FFM_VIETNAMESE_CHARSET,						//!< �x�g�i����
	FFM_ARABIC_CHARSET,							//!< �A���r�A��
	FFM_HEBREW_CHARSET,							//!< �w�u���C��
	FFM_THAI_CHARSET,							//!< �^�C��
	FFM_DEFAULT_CHARSET,						//!< �f�t�H���g(�ǉ�����) by inovia							
	//!< �^�C��
	// ���������p(�g�p���Ȃ��ł�������)
	FFM_NUM_FONTS								//!< �t�H���g�̐�
};

//! �s�A�C�R��
enum LineIcons
{
	LINEICON_NONE				=	0x00000000,

	LINEICON_ATTACH				=	0x00000001,
	LINEICON_BACK				=	0x00000002,
	LINEICON_CHECKED			=	0x00000004,
	LINEICON_UNCHECKED			=	0x00000008,
	LINEICON_CANCEL				=	0x00000010,
	LINEICON_CLOCK				=	0x00000020,
	LINEICON_CONTENTS			=	0x00000040,
	LINEICON_DB_CANCEL			=	0x00000080,
	LINEICON_DB_DELETE			=	0x00000100,
	LINEICON_DB_FIRST			=	0x00000200,
	LINEICON_DB_EDIT			=	0x00000400,
	LINEICON_DB_INSERT			=	0x00000800,
	LINEICON_DB_LAST			=	0x00001000,
	LINEICON_DB_NEXT			=	0x00002000,
	LINEICON_DB_POST			=	0x00004000,
	LINEICON_DB_PREVIOUS		=	0x00008000,
	LINEICON_DB_REFRESH			=	0x00010000,
	LINEICON_DELETE				=	0x00020000,
	LINEICON_EXECUTE			=	0x00040000,
	LINEICON_FAVORITE			=	0x00080000,
	LINEICON_BLUE				=	0x00100000,
	LINEICON_GREEN				=	0x00200000,
	LINEICON_RED				=	0x00400000,
	LINEICON_FORWARD			=	0x00800000,
	LINEICON_HELP				=	0x01000000,
	LINEICON_INFORMATION		=	0x02000000,
	LINEICON_KEY				=	0x04000000,
	LINEICON_LOCK				=	0x08000000,
	LINEICON_RECORD				=	0x10000000,
	LINEICON_TICK				=	0x20000000,
	LINEICON_TIPS				=	0x40000000,
	LINEICON_WARNING			=	0x80000000,
};


//! �����\�����[�h
enum EmpType
{
	EMPFLAG_BOLD				=	0x00000001,	//!< �����ɂ���
	EMPFLAG_NON_CS				=	0x00000002,	//!< �啶���Ə���������ʂ��Ȃ�
	EMPFLAG_HEAD				=	0x00000004,	//!< ���ɂ���Ƃ��̂�
};

//! �G�f�B�^�}�[�N�\���A��\���̐ݒ�
enum EditorMarks
{
	EDM_HALF_SPACE				=	0x00000001,	//!< ���p�X�y�[�X��\�����邩
	EDM_FULL_SPACE				=	0x00000002,	//!< �S�p�X�y�[�X��\�����邩
	EDM_TAB						=	0x00000004,	//!< �^�u�}�[�N��\�����邩
	EDM_LINE					=	0x00000008,	//!< ���s�}�[�N��\�����邩
	EDM_EOF						=	0x00000010,	//!< [EOF]�}�[�N��\�����邩
	
	EDM_SHOW_ALL				=	0xFFFFFFFF,	//!< �S�ĕ\������
	EDM_SHOW_NONE				=	0x00000000,	//!< �����\�����Ȃ�
};


//! �����t���O
enum SearchFlags
{
	SEARCH_FROMCURSOR			=	0x00000001,	//!< ���݂̃J�[�\���ʒu���猟������
	SEARCH_BACK					=	0x00000002,	//!< �������Ɍ������������s����
	SEARCH_REGEXP				=	0x00000004,	//!< ���K�\���𗘗p����(������)
	SEARCH_NOT_REFRESH			=	0x00000008,	//!< �������ʂ��ĕ`�悵�Ȃ�
	SEARCH_BEEP_ON_404			=	0x00000010,	//!< ������Ȃ������Ƃ��Ƀr�[�v�����Ȃ炷
	SEARCH_NOT_ADJUST_VIEW		=	0x00000020,	//!< ���������Ƃ��ɃL�����b�g�ʒu�փX�N���[���o�[��ǐ������Ȃ�
	SEARCH_HIGHLIGHT			=	0x00000040,	//!< ����������������n�C���C�g�\�����܂�(������)
	SEARCH_IGNORECASE			=	0x00000040,	//!< �啶������������ʂ��Ȃ�
};

//! �Ɨ����x��
enum IndependentFlags
{
	// ASCII�L���p�t���O
	EMP_IND_PARENTHESIS			=	0x00000001,	//!< �O��Ɋۊ���()�����邱�Ƃ�������
	EMP_IND_BRACE				=	0x00000002,	//!< �O��ɒ�����{}�����邱�Ƃ�������
	EMP_IND_ANGLE_BRACKET		=	0x00000004,	//!< �O��ɎR�`����<>�����邱�Ƃ�������
	EMP_IND_SQUARE_BRACKET		=	0x00000008,	//!< �O��Ɋe����[]�����邱�Ƃ�������
	EMP_IND_QUOTATION			=	0x00000010,	//!< �O��ɃR�[�e�[�V����'"�����邱�Ƃ�������
	EMP_IND_UNDERBAR			=	0x00000020,	//!< �O��ɃA���_�[�o�[_�����邱�Ƃ�������
	EMP_IND_OPERATORS			=	0x00000040,	//!< �O��ɉ��Z�q + - * / % ^ = �����邱�Ƃ�������
	EMP_IND_OTHER_ASCII_SIGN	=	0x00000080,	//!< �O�q�̂��̂������S�Ă�ASCII�L�� # ! $ & | \ @ ? , . : ; ~
	
	// ASCII��������w�肷��t���O
	EMP_IND_NUMBER				=	0x00000100,	//!< �O��ɐ�����������
	EMP_IND_CAPITAL_ALPHABET	=	0x00000200,	//!< �O��ɑ啶���A���t�@�x�b�g��������
	EMP_IND_SMALL_ALPHABET		=	0x00000400,	//!< �O��ɏ������A���t�@�x�b�g��������
	
	// �󔒂��w�肷��t���O
	EMP_IND_SPACE				=	0x00001000,	//!< �O��ɔ��p�X�y�[�X��������
	EMP_IND_FULL_SPACE			=	0x00002000,	//!< �O��ɑS�p�X�y�[�X��������
	EMP_IND_TAB					=	0x00004000,	//!< �O��Ƀ^�u��������

	// ���̂ق��̕�����
	EMP_IND_JAPANESE			=	0x00010000,	//!< ���{��
	EMP_IND_KOREAN				=	0x00020000,	//!< �؍���
	EMP_IND_EASTUROPE			=	0x00040000,	//!< �����[���b�p

	EMP_IND_OTHERS				=	0x80000000,	//!< ��L�ȊO

	// �ȗ��`(��ɂ������g�p����Ǝw�肪�y�ł�)
	EMP_IND_ASCII_SIGN			=	0x000000FF,	//!< �S�Ă�ASCII�L�����������
	EMP_IND_ASCII_LETTER		=	0x00000F00,	//!< �S�Ă�ASCII������������(�����ƃA���t�@�x�b�g)
	EMP_IND_BLANKS				=	0x0000F000,	//!< �S�Ă̋󔒕������������
	EMP_IND_OTHER_CHARSETS		=	0xFFFF0000,	//!< �S�ẴL�����N�^�Z�b�g��������
	EMP_IND_ALLOW_ALL			=	0xFFFFFFFF	//!< ���ł�OK
};

//! �܂�Ԃ����[�h
enum LapelMode
{
	LAPELFLAG_ALL				=	0xFFFFFFFF,	//!< �ȉ��̃t���O�S�Ă�I������
	LAPELFLAG_NONE				=	0x00000000,	//!< �����L���ɂ��Ȃ�
	LAPELFLAG_WORDBREAK			=	0x00000001,	//!< �p�����[�h���b�v
	LAPELFLAG_JPN_PERIOD		=	0x00000002,	//!< ���{��̋�Ǔ_�Ɋւ���֑�����
	LAPELFLAG_JPN_QUOTATION		=	0x00000004,	//!< ���{��̃J�M���ʂɊւ���֑�����
};

//! ���l�擾
enum SetMetricsCode
{
	SM_LAPEL_COLUMN,							//!< �܂�Ԃ��ʒu(����)
	SM_LAPEL_MODE,								//!< �܂�Ԃ����[�h
	SM_MARK_VISIBLE,							//!< �}�[�N�̕\�����
	SM_LINENUM_WIDTH,							//!< ���[�̍s�ԍ��̕�(�s�N�Z���A-1�Ńf�t�H���g)
	SM_RULER_HEIGHT,							//!< ��̃��[���[�̍���(�s�N�Z���A-1�Ńf�t�H���g)
	SM_UNDERLINE_VISIBLE,						//!< �s�����̕\�����
	SM_TAB_WIDTH,								//!< �^�u�̉���
	SM_REDOREM,									//!< REDO�\�ȉ�(�擾�̂�)
	SM_UNDOREM,									//!< UNDO�\�ȉ�(�擾�̂�)
	SM_MARGIN_HEIGHT,							//!< �s�}�[�W��(onitama�ǉ�)
};

//! �e�L�X�g���ҏW���ꂽ����
enum TextModifiedCause
{
	MODIFIED_CAUSE_CHAR,						//!< ���������͂��ꂽ(IME�I�t)
	MODIFIED_CAUSE_IME,							//!< ���������͂��ꂽ(IME�I��)
	MODIFIED_CAUSE_DELETE,						//!< Delete�L�[���������ꂽ
	MODIFIED_CAUSE_BACKSPACE,					//!< BackSpace���������ꂽ
	MODIFIED_CAUSE_ENTER,						//!< Enter�L�[���������ꂽ
	MODIFIED_CAUSE_UNDO,						//!< ���ɖ߂����������s���ꂽ
	MODIFIED_CAUSE_REDO,						//!< ��蒼�����������s���ꂽ
	MODIFIED_CAUSE_CUT,							//!< �؂��菈�������s���ꂽ
	MODIFIED_CAUSE_PASTE,						//!< �\��t�����������s���ꂽ
	MODIFIED_CAUSE_INDENT,						//!< �C���f���g���ꂽ
	MODIFIED_CAUSE_UNINDENT,					//!< �t�C���f���g���ꂽ
	MODIFIED_CAUSE_TAB,							//!< �^�u�L�[��������āA�^�u�������}�����ꂽ
	MODIFIED_CAUSE_SETSELTEXT,					//!< Footy2SetSelText()�����s���ꂽ
};

//! �G���[�R�[�h
enum ErrCode
{
	FOOTY2ERR_NONE				=	0,			//!< �֐�����������
	FOOTY2ERR_ARGUMENT			=	-1,			//!< ������������
	FOOTY2ERR_NOID				=	-2,			//!< ID��������Ȃ�
	FOOTY2ERR_MEMORY			=	-3,			//!< �������[�s��
	FOOTY2ERR_NOUNDO			=	-4,			//!< �A���h�D��񂪂���ȑO�Ɍ�����Ȃ�
	FOOTY2ERR_NOTSELECTED		=	-5,			//!< �I������Ă��Ȃ�
	FOOTY2ERR_UNKNOWN			=	-6,			//!< �s���ȃG���[
	FOOTY2ERR_NOTYET			=	-7,			//!< ������(���߂�Ȃ���)
	FOOTY2ERR_404				=	-8,			//!< �t�@�C����������Ȃ��A���������񂪌�����Ȃ�
	FOOTY2ERR_NOACTIVE			=	-9,			//!< �A�N�e�B�u�ȃr���[�͑��݂��܂���
	FOOTY2ERR_ENCODER			=	-10,		//!< �����R�[�h�̃G���R�[�_��������܂���(�t�@�C���̃G���R�[�h�`�����s���ł��A�o�C�i���Ƃ�)
};


//�֐��̐錾///////////////////////////////////////////////////////////////////

/*�J�n�E�I���֐�(DLL���g�p���Ă���Ƃ��͌Ăяo���K�v�͂���܂���I)*/
#ifdef FOOTYSTATIC
	FOOTYEXPORT(void) Footy2Start(HINSTANCE hInstance);
	FOOTYEXPORT(void) Footy2End();
#endif	/*FOOTYSTATIC*/

//�o�[�W�����֘A
FOOTYEXPORT(int) GetFooty2Ver();								//!< Footy�̃o�[�W�������擾���܂��B
FOOTYEXPORT(int) GetFooty2BetaVer();							//!< Footy�̃��o�[�W�������擾���܂��B

//�E�B���h�E�֘A
FOOTYEXPORT(int) Footy2Create(HWND hWnd,int x,int y,
							  int dx,int dy,int nMode);			//!< Footy���쐬���܂��B
FOOTYEXPORT(int) Footy2ChangeParent(int nID, HWND hWnd,
							  int x,int y, int dx,int dy);		//!< �e�E�B���h�E��ύX���܂�
FOOTYEXPORT(int) Footy2Delete(int nID);							//!< �m�ۂ��ꂽID�̃f�[�^���������ă������̈���m�ۂ��܂��B
FOOTYEXPORT(int) Footy2Move(int nID,int x,int y,int dx,int dy);	//!< Footy�E�B���h�E���ړ����܂��B
FOOTYEXPORT(int) Footy2ChangeView(int nID,int nView);			//!< �r���[���[�h�̕ύX
FOOTYEXPORT(int) Footy2SetFocus(int nID,int nViewID);			//!< �t�H�[�J�X�ݒ�
FOOTYEXPORT(HWND) Footy2GetWnd(int nID,int nViewID);			//!< Footy�̃E�B���h�E�n���h�����擾���܂�
FOOTYEXPORT(HWND) Footy2GetWndVSplit(int nID);					//!< �c�����p�o�[�̃E�B���h�E�n���h�����擾
FOOTYEXPORT(HWND) Footy2GetWndHSplit(int nID);					//!< �������p�o�[�̃E�B���h�E�n���h�����擾
FOOTYEXPORT(int) Footy2GetActiveView(int nID);					//!< �A�N�e�B�u�ȃr���[���擾
FOOTYEXPORT(int) Footy2Refresh(int nID);						//!< �ĕ`�揈��

//�ҏW�n
FOOTYEXPORT(int) Footy2Copy(int nID);							//!< �N���b�v�{�[�h�փR�s�[
FOOTYEXPORT(int) Footy2Cut(int nID);							//!< �N���b�v�{�[�h�փJ�b�g
FOOTYEXPORT(int) Footy2Paste(int nID);							//!< �N���b�v�{�[�h����y�[�X�g
FOOTYEXPORT(int) Footy2Undo(int nID);							//!< �A���h�D
FOOTYEXPORT(int) Footy2Redo(int nID);							//!< ���h�D
FOOTYEXPORT(bool) Footy2IsEdited(int nID);						//!< �I������Ă��邩�ǂ������擾���܂�
FOOTYEXPORT(int) Footy2SelectAll(int nID,bool bRefresh = true);	//!< �S�đI��
FOOTYEXPORT(int) Footy2ShiftLock(int nID,bool bLocked);			//!< �V�t�g���b�N���s�����ǂ���
FOOTYEXPORT(bool) Footy2IsShiftLocked(int nID);					//!< �V�t�g���b�N���s���Ă��邩�ǂ����擾����
FOOTYEXPORT(int) Footy2SetReadOnly( int nID, bool bReadOnly );	//!< �ҏW�֎~��Ԃɂ��܂�
FOOTYEXPORT(bool) Footy2IsReadOnly( int nID );					//!< �ҏW�֎~��ԂȂ̂��ǂ������擾���܂�

//�����n
#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2SearchA(int nID,const char *szText,int nFlags);
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2SearchW(int nID,const wchar_t* szText,int nFlags);

// �t�@�C���ҏW
FOOTYEXPORT(int) Footy2CreateNew(int nID);
#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2TextFromFileA(int nID,const char* szPath,int nCharSets);
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2TextFromFileW(int nID,const wchar_t* szPath,int nCharSets);
#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2SaveToFileA(int nID,const char* szPath,int nCharSets,int nLineMode);
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2SaveToFileW(int nID,const wchar_t* szPath,int nCharSets,int nLineMode);
FOOTYEXPORT(int) Footy2GetCharSet(int nID);
FOOTYEXPORT(int) Footy2GetLineCode(int nID);

//�����񏈗�
#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2SetSelTextA(int nID,const char *pString);//!< �I�𕶎�����Z�b�g
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2SetSelTextW(int nID,const wchar_t* pString);

#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2GetSelTextA(int nID, char *pString, int nLineMode, int nSize);
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2GetSelTextW(int nID, wchar_t* pString, int nLineMode, int nSize);

#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2SetTextA(int nID,const char *pString);	//!< ������Z�b�g
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2SetTextW(int nID,const wchar_t* pString);

#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2GetTextLengthA(int nID,int nLineMode);	//!< �����񒷂��擾
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2GetTextLengthW(int nID,int nLineMode);


#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2GetSelLengthA(int nID, int nLineMode);	//!< �I�𕶎��񒷂����擾
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2GetSelLengthW(int nID, int nLineMode);		//!< �I�𕶎��񒷂����擾


#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2GetTextA(int nID,char *pString,int nLineMode,int nSize);/*������擾*/
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2GetTextW(int nID,wchar_t* pString,int nLineMode,int nSize);

#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2GetLineA(int nID,char *pString,size_t nLine,int nSize);
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(const wchar_t*) Footy2GetLineW(int nID,size_t nLine);

#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2SetLineA(int nID,size_t nLine,const char *pString,bool bRedraw);
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2SetLineW(int nID,size_t nLine,const wchar_t* pString,bool bRedraw);

#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2GetLineLengthA(int nID,size_t nLine);	/*�s���Ƃ̒����擾*/
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2GetLineLengthW(int nID,size_t nLine);

FOOTYEXPORT(int) Footy2GetLines(int nID);

//�L�����b�g�E�I���n
FOOTYEXPORT(int) Footy2GetCaretPosition(int nID,size_t *pCaretLine,size_t *pCaretPos);
FOOTYEXPORT(int) Footy2SetCaretPosition(int nID,size_t nCaretLine,size_t nCaretPos,bool bRefresh = true);
FOOTYEXPORT(int) Footy2GetSel(int nID,size_t *pStartLine,size_t *pStartPos,size_t *pEndLine,size_t *pEndPos);
FOOTYEXPORT(int) Footy2SetSel(int nID,size_t nStartLine,size_t nStartPos,size_t nEndLine,size_t nEndPos,bool bRefresh = true);

//�\��
#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2AddEmphasisA(int nID,const char *pString1,const char *pString2,
		int nType,int nFlags,int nLevel,int nPermission,int nIndependence,COLORREF nColor);
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2AddEmphasisW(int nID,const wchar_t* pString1,const wchar_t* pString2,
	int nType,int nFlags,int nLevel,int nPermission,int nIndependence,COLORREF nColor);
FOOTYEXPORT(int) Footy2FlushEmphasis(int nID);
FOOTYEXPORT(int) Footy2ClearEmphasis(int nID);
FOOTYEXPORT(int) Footy2SetFontSize(int nID,int nPoint,bool bRefresh = true);
#ifndef UNDER_CE
	FOOTYEXPORT(int) Footy2SetFontFaceA(int nID,int nFontMode,const char *pString,bool bRefresh = true);
#endif	/*not defined UNDER_CE*/
FOOTYEXPORT(int) Footy2SetFontFaceW(int nID,int nFontMode,const wchar_t* pString,bool bRefresh = true);
FOOTYEXPORT(int) Footy2SetLineIcon(int nID,size_t nLine,int nIcons,bool bRefresh = true);
FOOTYEXPORT(int) Footy2GetLineIcon(int nID,size_t nLine,int *pIcons);
FOOTYEXPORT(int) Footy2SetForceFont(int nID, int flag);	// �t�H���g�̋����g�p by inovia
FOOTYEXPORT(int) Footy2SetSpeedDraw(int nID, int flag);	// �����`���ON�ɂ��� by inovia
//�ݒ�֘A
FOOTYEXPORT(int) Footy2SetLapel(int nID,int nColumns,int nMode,bool bRefresh = true);
FOOTYEXPORT(int) Footy2SetMetrics(int nID,int nObject,int nValue,bool bRefresh = true);
FOOTYEXPORT(int) Footy2GetMetrics(int nID,int nObject,int *pValue);
FOOTYEXPORT(int) Footy2SetColor(int nID,int nPosition,COLORREF nColor,bool bRefresh = true);
FOOTYEXPORT(int) Footy2GetVisibleColumns(int nID,int nViewID);	//!< ���݃r���[�ŕ\�����Ă��錅�����擾
FOOTYEXPORT(int) Footy2GetVisibleLines(int nID,int nViewID);	//!< ���݃r���[�ŕ\�����Ă���s�����擾

FOOTYEXPORT(int) Footy2SetUnderlineDraw(int nID, bool bFlag);	// �t�H�[�J�X���O�ꂽ�Ƃ����A���_�[�o�[��`�悷�邩�ǂ����H

FOOTYEXPORT(int) Footy2SetBackgroundImageA(int nID, const char *pPath, bool bRefresh);
FOOTYEXPORT(int) Footy2SetBackgroundImageW(int nID, const wchar_t *pPath, bool bRefresh);
FOOTYEXPORT(int) Footy2ClearBackgroundImage(int nID, bool bRefresh);
FOOTYEXPORT(int) Footy2SetBackgroundImageColor(int nID, COLORREF color);
#endif	/*_FOOTY2_DLL_H_*/

/*[EOF]*/
