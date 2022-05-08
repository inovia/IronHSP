
//
//	ahtmodel.cpp structures
//
#ifndef __ahtmodel_h
#define __ahtmodel_h

#include "membuf.h"

#define AHTMODEL_FLAG_NONE 0
#define AHTMODEL_FLAG_READY 1
#define AHTMODEL_FLAG_ERROR -1

#define AHTMODEL_FLAG_NOLINK 0x100

#define AHTMODEL_FNMAX (260)

enum {
AHTTYPE_EDIT_INT = 0,		// ���͘g(����=int,sub=�ŏ�,sub2=�ő�)
AHTTYPE_EDIT_DOUBLE,		// ���͘g(����=double,sub=�ŏ�,sub2=�ő�)
AHTTYPE_EDIT_STRING,		// ���͘g(����=str,sub=������,sub2=option 'w' or 'm')
AHTTYPE_CBOX_STRING,		// �R���{�{�b�N�X(����=str,sub=�I����,sub2=�I�����e�L�X�g)
AHTTYPE_CHKB_INT,			// �`�F�b�N�{�b�N�X(0or1�Asub=�e�L�X�g)
AHTTYPE_COLS_INT,			// �F�I��(����=int)
AHTTYPE_FONT_STRING,		// �t�H���g�I��(����=str)
AHTTYPE_FILE_STRING,		// �t�@�C���I��(sub=�g���q,sub2=�I��)
AHTTYPE_EXTF_STRING,		// �O���c�[���N��(sub=�g���q,sub2=�c�[����)
AHTTYPE_PARTS_INT,			// �p�[�cID(sub=�N���X��,sub2=�Q�Ɩ�)
AHTTYPE_PARTS_PROP_STRING,	// �p�[�cID�̃v���p�e�B(sub=�v���p�e�B��,sub2=option 'm')
AHTTYPE_PARTS_OPT_STRING,	// �p�[�cID�̃I�v�V����(sub=�I�v�V������,sub2=option 'm')
AHTTYPE_EDIT_STRING2,		// ���͘g(����=str,sub=������,sub2=option 'w' or 'm')
AHTTYPE_MAX
};

#define AHTMODE_QUOTATION	1	// �_�u���N�H�[�g�ň͂�
#define AHTMODE_OUTPUT_PURE 2	// ahtout�o�͗p�N�H�[�g����
#define AHTMODE_READ_ONLY 4		// �C���s��
#define AHTMODE_WITH_ID 8		// �f�t�H���g��ID��t������
#define AHTMODE_OUTPUT_RAW 16	// �o�͗p�f�[�^���������Ȃ�

// AHT Object Data
typedef struct AHTOBJ
{
	//		Object data structure
	//
	int		cx, cy;			// Current Position
	int		page;			// Current Page
	int		next;			// Next Model ID (-1=none)
	int		prev;			// Next Model ID (-1=none)
	int		option1;		// Reserved
	int		option2;		// Reserved
	int		option3;		// Reserved
	int		option4;		// Reserved
} AHTOBJ;

// AHT�v���p�e�B���
class AHTPROP {
public:
	AHTPROP();
	~AHTPROP();
	void SetId( int val ) { id = val; };
	void SetMode( int mode ) { ahtmode |= mode; };
	void ClearMode( int mode ) { ahtmode &= ~mode; };
	void SetNewVal( char *data );
	char *GetValue( void );
	int GetValueInt( void );
	double GetValueDouble( void );
	char *GetOutValue( void );
	void SetOutValue( char *data );

	//	Data
	int id;
	short ahttype;		// property type (AHTTYPE_*)
	short ahtmode;		// AHT mode flag
	char *name;			// property name
	char *help;			// property name (help)
	char *defval;		// default value
	char *defval2;		// default value (sub)
	char *defval3;		// default value (sub2)
	char *newval;		// New value
	int nvsize;			// New value size
	char *outname;		// value for output
	char *orgname;		// property name (original)
};


// AHT���f�����
class AHTMODEL {
public:
	AHTMODEL();
	~AHTMODEL();

	//		Service
	void SetAHTOption( char *name, char *value );
	char *GetAHTOption( char *name );
	AHTPROP *AddProperty( void );
	AHTPROP *SetProperty( char *propname, char *name, char *value );
	AHTPROP *SetPropertyType( char *propname, int type );
	AHTPROP *SetPropertyDefault( char *propname, char *value );
	AHTPROP *SetPropertyDefaultInt( char *propname, int value );
	AHTPROP *SetPropertyDefaultStr( char *propname, char *value );
	AHTPROP *SetPropertyDefaultDouble( char *propname, double value );
	AHTPROP *GetProperty( char *propname );
	AHTPROP *GetPropertyFromAlias( char *propname );
	AHTPROP *GetProperty( int id ) { return mem_prop[id]; }
	int SetAHTPropertyString( char *propname, char *str );
	int GetPropertyID( char *propname );
	int GetPropertyPossibleLines( void );
	void UpdateProperty( void );

	//		for Property
	int SetProp( AHTPROP *prop, char *name, char *value );
	void SetPropName( AHTPROP *prop, char *value );
	void SetPropOrgName( AHTPROP *prop, char *value );
	void SetPropHelp( AHTPROP *prop, char *value );
	void SetPropDefval( AHTPROP *prop, char *value );
	void SetPropDefval2( AHTPROP *prop, char *value );
	void SetPropDefval3( AHTPROP *prop, char *value );

	//		Reference
	void SetId( int val ) { id = val; }
	void SetSource( char *filename );
	void SetSourcePath( char *filename );

	void SetName( char *name );
	void SetClass( char *name );
	void SetAuthor( char *name );
	void SetVersion( char *name );
	void SetIconFile( char *name );
	void SetIconId( int id );
	void SetStdBuffer( CMemBuf *buf );
	void TerminateExp( void ) { exp->Put(0); };
	void SetHelpKeyword( char *name );

	char *GetName( void );
	char *GetClass( void ) { return classname; }
	char *GetAuthor( void ) { return author; }
	char *GetVersion( void ) { return ver; }
	char *GetIconFile( void ) { return icon; }
	char *GetSource( void ) { return fname; }
	char *GetSourcePath( void ) { return fpath; }
	char *GetHelpKeyword( void ) { return helpkw; }

	int GetId( void ) { return id; }
	int GetFlag( void ) { return flag; }
	int GetPropCount( void ) { return prop_cnt; }
	int GetGlobalId( void ) { return global_id; }
	int GetGlobalId2( void );

	int GetIconId( void ) { return iconid; }

	int GetCurX( void ) { return obj.cx; };
	int GetCurY( void ) { return obj.cy; };
	int GetPage( void ) { return obj.page; };
	int GetNextID( void ) { return obj.next; };
	int GetPrevID( void ) { return obj.prev; };
	void SetCur( int x, int y ) { obj.cx=x; obj.cy=y; };
	void SetPage( int page ) { obj.page=page; };
	void SetNextID( int id );
	void SetPrevID( int id );

	void Mesf( char *format, ... );
	void SetFlag( int val ) { flag |= val; };
	void SetGlobalId( int val ) { global_id = val; };

	AHTOBJ *GetObj( void ) { return &obj; };
	void SetObj( AHTOBJ *val ) { obj = *val; };

	void ClearFindCheck( void ) { findcheck = false; };
	void SetFindCheck( void ) { findcheck = true; };
	bool GetFindCheck( void ) { return findcheck; };

private:
	//		Routines

	//		Data
	int id;					// ID
	int flag;				// flag
	bool findcheck;			// Check flag for find

	AHTOBJ obj;				// Object Info

	int prop_cnt;			// property count
	int mem_prop_size;		// property data size
	AHTPROP **mem_prop;		// property data

	CMemBuf *source;		// AHT source buffer
	CMemBuf *propstr;		// string buffer for property
	CMemBuf *exp;			// introduction string

	CMemBuf *stdbuf;		// message output buffer

	char name[128];			// display name
	char classname[128];	// model name (class)
	char author[32];		// author
	char ver[32];			// version
	char fpath[AHTMODEL_FNMAX];		// data path name
	char fname[AHTMODEL_FNMAX];		// data file name
	char helpkw[128];		// keyword for help
	AHTPROP	*refprop;		// reference prop for name

	char icon[32];			// icon filename (opt)
	int	iconid;				// icon ID
	int	global_id;			// Global ID
	int dummy;				// Dummy Data
	char s_glid[16];		// ID String Convert
	char s_flag[16];		// Flag String Convert
};

#endif
