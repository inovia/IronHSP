
//
//			HSP3 manager class
//			onion software/onitama 2008/4
//
#include <stdio.h>
#include <stdarg.h>
#include <windows.h>
#include "supio.h"
#include "chsp3.h"

#define DELCLASS(o)	if (o) { delete (o); (o)=NULL; }

/*------------------------------------------------------------*/
/*
		constructor
*/
/*------------------------------------------------------------*/

#include "../hspcmp/hspcmd.cpp"

/*------------------------------------------------------------*/

/*
  Parser
 */


CHsp3Parser::CHsp3Parser( void )
{
	buf = new CMemBuf;
	lb = new CLabel;
	lb->RegistList( hsp_prestr, "" );

	mem_cs = NULL;
	mem_ds = NULL;
	mem_ot = NULL;
	dinfo = NULL;
	linfo = NULL;
	finfo = NULL;
	finfo2 = NULL;
	minfo = NULL;
	hpidat = NULL;
	ot_info = NULL;
}


CHsp3Parser::~CHsp3Parser( void )
{
	DeleteObjectHeader();
	delete lb;
	delete buf;
}


void CHsp3Parser::DeleteObjectHeader( void )
{
	//		HSP�w�b�_�[����j������
	//
	DELCLASS( mem_cs );
	DELCLASS( mem_ds );
	DELCLASS( mem_ot );
	DELCLASS( dinfo );
	DELCLASS( linfo );
	DELCLASS( finfo );
	DELCLASS( finfo2 );
	DELCLASS( minfo );
	DELCLASS( hpidat );
	DELCLASS( ot_info );
}


void CHsp3Parser::NewObjectHeader( void )
{
	//		�V�K��HSP�w�b�_�[�����쐬����
	//
	hsphed = (HSPHED *)buf->GetBuffer();
	mem_cs = new CMemBuf( 0x1000 );
	mem_ds = new CMemBuf( 0x1000 );
	mem_ot = new CMemBuf( 0x1000 );
	dinfo = new CMemBuf( 0x1000 );
	linfo = new CMemBuf( 0x1000 );
	finfo = new CMemBuf( 0x1000 );
	finfo2 = new CMemBuf( 0x1000 );
	minfo = new CMemBuf( 0x1000 );
	hpidat = new CMemBuf( 0x1000 );
	orgname[0]=0;
}


int CHsp3Parser::LoadObjectFile( char *fname )
{
	//		ax�t�@�C�������[�h����
	//
	char *baseptr;

	if ( buf->PutFile( fname ) < 0 ) return -1;

	strcpy( orgname, fname );
	hsphed = (HSPHED *)buf->GetBuffer();
	baseptr = (char *)buf->GetBuffer();

	if ((hsphed->h1!='H')||(hsphed->h2!='S')||(hsphed->h3!='P')||(hsphed->h4!='3')) {
		return -2;
	}
	//if ( hsphed->version < vercode ) {
	//	return -3;
	//}

	mem_cs = new CMemBuf( 0x1000 );
	mem_cs->PutData( baseptr+hsphed->pt_cs, hsphed->max_cs );
	mem_ds = new CMemBuf( 0x1000 );
	mem_ds->PutData( baseptr+hsphed->pt_ds, hsphed->max_ds );
	mem_ot = new CMemBuf( 0x1000 );
	mem_ot->PutData( baseptr+hsphed->pt_ot, hsphed->max_ot );
	dinfo = new CMemBuf( 0x1000 );
	dinfo->PutData( baseptr+hsphed->pt_dinfo, hsphed->max_dinfo );
	linfo = new CMemBuf( 0x1000 );
	linfo->PutData( baseptr+hsphed->pt_linfo, hsphed->max_linfo );
	finfo = new CMemBuf( 0x1000 );
	finfo->PutData( baseptr+hsphed->pt_finfo, hsphed->max_finfo );
	finfo2 = new CMemBuf( 0x1000 );
	finfo2->PutData( baseptr+hsphed->pt_finfo2, hsphed->max_finfo2 );
	minfo = new CMemBuf( 0x1000 );
	minfo->PutData( baseptr+hsphed->pt_minfo, hsphed->max_minfo );
	hpidat = new CMemBuf( 0x1000 );
	hpidat->PutData( baseptr+hsphed->pt_hpidat, hsphed->max_hpi );

	UpdateValueName();				// �ϐ����̃f�o�b�O������������
	MakeOTInfo();					// OT������������

	return 0;
}



int CHsp3Parser::UpdateValueName( void )
{
	//		mem_di_val���X�V
	//
	unsigned char *mem_di;
	unsigned char ofs;
	int cl,a;

	mem_di_val = NULL;
	if ( dinfo->GetSize() == 0 ) {
		return -1;
	}
	mem_di = (unsigned char *)dinfo->GetBuffer();
	if ( mem_di[0]==255) return -1;
	cl=0;a=0;
	while(1) {
		ofs=mem_di[a++];
		switch( ofs ) {
		case 252:
			a+=2;
			break;
		case 253:
			mem_di_val=&mem_di[a-1];
			return 0;
		case 254:
			cl=(mem_di[a+4]<<8)+mem_di[a+3];
			a+=5;
			break;
		case 255:
			return -1;
		default:
			cl++;
			break;
		}
	}
	return cl;
}



void CHsp3Parser::MakeOTInfo( void )
{
	//		ot_info���X�V
	//		(ot_info�ɂ�FInfo��ID������)
	//		(�ʏ탉�x���̏ꍇ�́Aot_info��-1�ɂȂ�)
	//
	int i,maxot;
	int *oi;
	int *ot;
	int maxfnc;
	const STRUCTDAT *fnc;
	maxot = GetOTCount();
	ot_info = new CMemBuf( maxot * sizeof(int) );
	oi = (int *)ot_info->GetBuffer();
	ot = (int *)mem_ot->GetBuffer();
	for(i=0;i<maxot;i++) { oi[i]=-1; }
	maxfnc = GetFInfoCount();
	for(i=0;i<maxfnc;i++) {
		fnc = GetFInfo(i);
		switch( fnc->index ) {
		case STRUCTDAT_INDEX_FUNC:					// ��`����
		case STRUCTDAT_INDEX_CFUNC:					// ��`�֐�
			oi[fnc->otindex] = i;
			break;
		}
	}
}

const LIBDAT * CHsp3Parser::GetLInfo( int index ) const
{
	//		linfo����l���擾����
	//
	LIBDAT *baseptr;
	baseptr = (LIBDAT *)linfo->GetBuffer();
	baseptr += index;
	return baseptr;
}


const STRUCTDAT *CHsp3Parser::GetFInfo( int index ) const
{
	//		finfo����l���擾����
	//
	STRUCTDAT *baseptr;
	baseptr = (STRUCTDAT *)finfo->GetBuffer();
	baseptr += index;
	return baseptr;
}

const STRUCTPRM *CHsp3Parser::GetMInfo( int index ) const
{
	//		minfo����l���擾����
	//
	STRUCTPRM *baseptr;
	baseptr = (STRUCTPRM *)minfo->GetBuffer();
	baseptr += index;
	return baseptr;
}

const HSPHED *CHsp3Parser::GetHSPHed( void ) const
{
	//		�w�b�_�[���擾����
	//
	return hsphed;
}


int CHsp3Parser::GetOTCount( void ) const
{
	//		OT��index�ʂ𓾂�
	//
	return ( mem_ot->GetSize() / sizeof( int ) );
}


int CHsp3Parser::GetLInfoCount( void ) const
{
	//		linfo��index�ʂ𓾂�
	//
	return ( linfo->GetSize() / sizeof( LIBDAT ) );
}

int CHsp3Parser::GetFInfoCount( void ) const{

	//		finfo��index�ʂ𓾂�
	//
	return ( finfo->GetSize() / sizeof( STRUCTDAT ) );
}


int CHsp3Parser::GetMInfoCount( void ) const
{
	//		minfo��index�ʂ𓾂�
	//
	return ( minfo->GetSize() / sizeof( STRUCTDAT ) );
}



/*------------------------------------------------------------*/

void CHsp3Parser::initCS( void *ptr )
{
	//		�ǂݎ���cs�|�C���^��������
	//
	mcs = (unsigned short *)ptr;
}


int CHsp3Parser::getCS( void )
{
	//		�R�}���h���P�ǂݎ��
	//		(ver3.0�ȍ~�p)
	//
	register unsigned short a;
	mcs_last=mcs;
	a=*mcs++;
	exflag = a & (EXFLG_1|EXFLG_2);
	cstype = a & CSTYPE;
	if ( a & 0x8000 ) {
		//	 32bit val code
		//
		csval = (int)*((int *)mcs);
		mcs+=2;
	} else {
		// 16bit val code
		csval = (int)(*mcs++);
	}
	return csval;
}

int CHsp3Parser::getEXFLG( void ) const
{
	//		���̃R�}���h��EXFLAG��ǂݎ��
	//
	unsigned short a;
	a=*mcs;
	return (int)( a & (EXFLG_1|EXFLG_2));
}

int CHsp3Parser::getNextCS( int *type ) const
{
	//		���̃R�}���h��TYPE,VAL��ǂݎ��
	//
	unsigned short a;
	a=*mcs;
	*type = a & CSTYPE;
	if ( a & 0x8000 ) {
		//	 32bit val code
		//
		return (int)*((int *)mcs);
	}
	// 16bit val code
	return (int)(mcs[1]);
}

const char *CHsp3Parser::GetDS( int offset ) const
{
	//		DS���當������擾����
	//
	char *baseptr;
	baseptr = mem_ds->GetBuffer();
	baseptr += offset;
	return baseptr;
}


double CHsp3Parser::GetDSf( int offset ) const
{
	//		DS����double�l���擾����
	//
	const char *ptr;
	ptr = GetDS( offset );
	return *(const double *)ptr;
}


int CHsp3Parser::GetOT( int index ) const
{
	//		OT����l���擾����
	//
	int *baseptr;
	baseptr = (int *)mem_ot->GetBuffer();
	return baseptr[index];
}

int CHsp3Parser::GetOTInfo( int index ) const
{
	int *oi;
	oi = (int *)ot_info->GetBuffer();
	return oi[index];
}


std::string CHsp3Parser::GetHSPVarName( int varid ) const
{
	//		�ϐ������擾
	//
	char hspvarmp[16];
	int i;
	unsigned char *mm;

	if ( mem_di_val == NULL ) {						// �ϐ�����񂪂Ȃ��ꍇ
		sprintf( hspvarmp, "_HspVar%d", varid );
		return hspvarmp;
	}
	mm = mem_di_val + ( varid * 6 );
	i = (mm[3]<<16)+(mm[2]<<8)+mm[1];
	return GetDS( i );
}


/*------------------------------------------------------------*/

std::string CHsp3Parser::GetHSPName( int type, int val ) const
{
	//		type,val�ɑΉ�����HSP�o�^���𓾂�
	//
	int max,i;
	LABOBJ *lobj;
	max = lb->GetNumEntry();
	for(i=0;i<max;i++) {
		lobj = lb->GetLabel(i);
		if ( lobj->type == type ) {
			if ( lobj->opt == val ) {
				return lobj->name;
			}
		}
	}

	switch( type ) {
	case TYPE_MODCMD:
		{
		const STRUCTDAT *fnc;
		fnc = GetFInfo( val );
		if ( fnc->index == STRUCTDAT_INDEX_FUNC ) return GetDS( fnc->nameidx );
		if ( fnc->index == STRUCTDAT_INDEX_CFUNC ) return GetDS( fnc->nameidx );
		break;
		}
	case TYPE_DLLFUNC:
		{
		const STRUCTDAT *fnc;
		fnc = GetFInfo( val );
		return GetDS( fnc->nameidx );
		}
	default:
		break;
	}

	return "";
}


std::string CHsp3Parser::GetHSPOperator( int val )
{
	//		HSP�̉��Z�q�𕶎���(�L��)�ŕԂ�
	//
	switch( val ) {
	case CALCCODE_ADD:
		return "+";
	case CALCCODE_SUB:
		return "-";
	case CALCCODE_MUL:
		return "*";
	case CALCCODE_DIV:
		return "/";
	case CALCCODE_MOD:
		return "%";
	case CALCCODE_AND:
		return "&";
	case CALCCODE_OR:
		return "|";
	case CALCCODE_XOR:
		return "^";
	case CALCCODE_EQ:
		return "=";
	case CALCCODE_NE:
		return "!=";
	case CALCCODE_GT:
		return ">";
	case CALCCODE_LT:
		return "<";
	case CALCCODE_GTEQ:
		return ">=";
	case CALCCODE_LTEQ:
		return "<=";
	case CALCCODE_RR:
		return ">>";
	case CALCCODE_LR:
		return "<<";
	}
	char hspoptmp[4];
	hspoptmp[0] = (char)val;
	hspoptmp[1] = 0;
	return hspoptmp;
}


std::string CHsp3Parser::GetHSPOperator2( int val )
{
	//		HSP�̉��Z�q�𕶎���(���\�b�h)�ŕԂ�
	//
	switch( val ) {
	case CALCCODE_ADD:
		return "AddI";
	case CALCCODE_SUB:
		return "SubI";
	case CALCCODE_MUL:
		return "MulI";
	case CALCCODE_DIV:
		return "DivI";
	case CALCCODE_MOD:
		return "ModI";
	case CALCCODE_AND:
		return "AndI";
	case CALCCODE_OR:
		return "OrI";
	case CALCCODE_XOR:
		return "XorI";
	case CALCCODE_EQ:
		return "EqI";
	case CALCCODE_NE:
		return "NeI";
	case CALCCODE_GT:
		return "GtI";
	case CALCCODE_LT:
		return "LtI";
	case CALCCODE_GTEQ:
		return "GtEqI";
	case CALCCODE_LTEQ:
		return "LtEqI";
	case CALCCODE_RR:
		return "RrI";
	case CALCCODE_LR:
		return "LrI";
	}
	return "";
}


std::string CHsp3Parser::GetHSPVarTypeName( int type )
{
	//		HSP�̃^�C�v�l�𕶎���ŕԂ�
	//
	switch( type ) {
	case HSPVAR_FLAG_LABEL:
		return "label";
	case HSPVAR_FLAG_STR:
		return "str";
	case HSPVAR_FLAG_DOUBLE:
		return "double";
	case HSPVAR_FLAG_INT:
		return "int";
	case HSPVAR_FLAG_STRUCT:
		return "module";
	case HSPVAR_FLAG_COMSTRUCT:
		return "comst";
	}
	return "";
}


std::string CHsp3Parser::GetHSPCmdTypeName( int type )
{
	//		HSP�̃R�}���h�^�C�v�l�𕶎���ŕԂ�
	//
	switch( type ) {
	case TYPE_MARK:
		return "Mark";
	case TYPE_VAR:
		return "Var";
	case TYPE_STRING:
		return "Str";
	case TYPE_DNUM:
		return "Double";
	case TYPE_INUM:
		return "Int";
	case TYPE_STRUCT:
		return "Module";
	case TYPE_XLABEL:
		return "Label";
	case TYPE_LABEL:
		return "Label";
	case TYPE_INTCMD:
		return "Intcmd";
	case TYPE_EXTCMD:
		return "Extcmd";
	case TYPE_EXTSYSVAR:
		return "Extvar";
	case TYPE_CMPCMD:
		return "Cmp";
	case TYPE_MODCMD:
		return "Modcmd";
	case TYPE_INTFUNC:
		return "Intfunc";
	case TYPE_SYSVAR:
		return "Sysvar";
	case TYPE_PROGCMD:
		return "Prgcmd";
	case TYPE_DLLFUNC:
		return "Dllfunc";
	case TYPE_DLLCTRL:
		return "Dllcmd";
	case TYPE_USERDEF:
		return "Usrfunc";
	}
	return "";
}


/*------------------------------------------------------------*/
/*
		constructor
*/
/*------------------------------------------------------------*/

CHsp3::CHsp3( void )
{
	out = new CMemBuf;
	out2 = new CMemBuf;
}


CHsp3::~CHsp3( void )
{
	delete out2;
	delete out;
}


/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/


void CHsp3::GetContext( MCSCONTEXT *ctx ) const
{
	//		�R���e�L�X�g���擾
	//		(ctx�ɏ�������)
	//
	ctx->mcs = mcs;
	ctx->mcs_last = mcs_last;
	ctx->cstype = cstype;
	ctx->csval = csval;
	ctx->exflag = exflag;
}


void CHsp3::SetContext( MCSCONTEXT *ctx )
{
	//		�R���e�L�X�g��ݒ�
	//		(ctx�̓��e��ݒ�)
	//
	mcs = ctx->mcs;
	mcs_last = ctx->mcs_last;
	cstype = ctx->cstype;
	csval = ctx->csval;
	exflag = ctx->exflag;
}


int CHsp3::LoadObjectFile( char *fname )
{
	CHsp3Parser::LoadObjectFile(fname);

	//	�g���[�X�p�̏����ݒ�
	//
	int i;
	initCS( mem_cs->GetBuffer() );
	mcs_start = ( unsigned short * )( mem_cs->GetBuffer() );
	mcs_end = ( unsigned short * )( mem_cs->GetBuffer() + hsphed->max_cs );
	getCS();
	exflag = 0;
	iflevel = 0;
	for( i=0;i<MAX_IFLEVEL;i++ ) { ifmode[i]=0; ifptr[i]=0; }
	SetIndent( 0 );

	return 0;
}

/*------------------------------------------------------------*/

int CHsp3::SaveOutBuf( char *fname )
{
	//		�o�̓o�b�t�@���Z�[�u����
	//
	return ( out->SaveFile( fname ) );
}


int CHsp3::SaveOutBuf2( char *fname )
{
	//		�o�̓o�b�t�@2���Z�[�u����
	//
	return ( out2->SaveFile( fname ) );
}


char *CHsp3::GetOutBuf( void )
{
	//		�o�̓o�b�t�@�̐擪�|�C���^�𓾂�
	//
	return ( out->GetBuffer() );
}


void CHsp3::MakeObjectInfo( void )
{
	//		�ǂݍ��񂾃I�u�W�F�N�g�t�@�C���̏����o��(���ʂ͏o�̓o�b�t�@��)
	//
	char mes[512];

	sprintf( mes,"Original File : %s\n", orgname );
	out->PutStr( mes );
	sprintf( mes,"Code Segment Size : %d\n", mem_cs->GetSize() );
	out->PutStr( mes );
	sprintf( mes,"Data Segment Size : %d\n", mem_ds->GetSize() );
	out->PutStr( mes );
	sprintf( mes,"Object Temp Size : %d\n", mem_ot->GetSize() );
	out->PutStr( mes );
	sprintf( mes,"LibInfo(%d) FInfo(%d) MInfo(%d)\n", GetLInfoCount(), GetFInfoCount(), GetMInfoCount() );
	out->PutStr( mes );

	out->PutStr( "--------------------------------------------\n" );

	{	//	LInfo�̕\��(DLL�C���|�[�g���)
		int i,max;
		const LIBDAT *lib;
		max = GetLInfoCount();
		for(i=0;i<max;i++) {
			lib = GetLInfo(i);
			sprintf( mes,"LInfo#%d : flag=%x name=%s clsid=%x\n", i, lib->flag, GetDS(lib->nameidx), lib->clsid );
			out->PutStr( mes );
		}
	}

	{	//	FInfo�̕\��(�g�����ߏ��)
		int i,max;
		const STRUCTDAT *fnc;
		const char *p;
		max = GetFInfoCount();
		for(i=0;i<max;i++) {
			fnc = GetFInfo(i);
			if ( fnc->nameidx < 0 ) p = ""; else p = GetDS( fnc->nameidx );
			sprintf( mes,"FInfo#%d : index=%d ot=%d subid=%d name=%s param=%d\n", i, fnc->index, fnc->otindex, fnc->subid, p, fnc->prmmax );
			out->PutStr( mes );
		}
	}
/*
	{	//	Ot�̕\��(���g�p)
		int i,max,otv;
		max = GetOTCount();
		for(i=0;i<max;i++) {
			otv = GetOT(i);
			sprintf( mes,"Ot#%d : value=%x\n", i, otv );
			out->PutStr( mes );
		}
	}
*/
/*
	{	//	MInfo�̕\��(���g�p)
		int i,max;
		MODDAT *mod;
		max = GetMInfoCount();
		for(i=0;i<max;i++) {
			mod = GetMInfo(i);
			sprintf( mes,"MInfo#%d : flag=%x name=%s\n", i, mod->flag, mod->name );
			out->PutStr( mes );
		}
	}
*/
	out->PutStr( "--------------------------------------------\n" );
}


void CHsp3::OutMes( char *format, ... )
{
	//		outbuf�ɕ�������o��(printf�݊�)(4096�����܂�)
	//
	char textbf[4096];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);
	out->PutStr( textbf );
}


void CHsp3::OutLine( char *format, ... )
{
	//		outbuf�ɕ�������o��(printf�݊�)(4096�����܂�)
	//
	char textbf[4096];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);

	for(int i=0;i<=indent;i++) { out->PutStr("\t"); }
	out->PutStr( textbf );
}


void CHsp3::OutLineBuf( CMemBuf *outbuf, char *format, ... )
{
	//		outbuf�ɕ�������o��(printf�݊�)(4096�����܂�)
	//
	char textbf[4096];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);

	for(int i=0;i<=indent;i++) { outbuf->PutStr("\t"); }
	outbuf->PutStr( textbf );
}


void CHsp3::OutCR( void )
{
	out->PutCR();
}


void CHsp3::SetIndent( int val )
{
	indent = val;
}


/*------------------------------------------------------------*/


void CHsp3::MakeProgramInfoFuncParam( int structid )
{
	//		��`���߃p�����[�^�[�����̃e�X�g
	//		structid : �p�����[�^�[ID
	//
	char mes[256];
	const STRUCTDAT *fnc;
	const STRUCTPRM *prm;
	int i,max;
	fnc = GetFInfo( structid );

	switch( fnc->index ) {
	case STRUCTDAT_INDEX_FUNC:					// ��`����
		out->PutStr( "#deffunc" );
		break;
	case STRUCTDAT_INDEX_CFUNC:					// ��`�֐�
		out->PutStr( "#defcfunc" );
		break;
	}
	sprintf( mes," %s ", GetDS(fnc->nameidx) );
	out->PutStr( mes );

	prm = GetMInfo( fnc->prmindex );
	max = fnc->prmmax;
	for(i=0;i<max;i++) {
		if ( i ) out->PutStr( ", " );
		switch( prm->mptype ) {
		case MPTYPE_VAR:
			out->PutStr( "var" );
			break;
		case MPTYPE_STRING:
		case MPTYPE_LOCALSTRING:
			out->PutStr( "str" );
			break;
		case MPTYPE_DNUM:
			out->PutStr( "double" );
			break;
		case MPTYPE_INUM:
			out->PutStr( "int" );
			break;
		case MPTYPE_LABEL:
			out->PutStr( "label" );
			break;
		case MPTYPE_LOCALVAR:
			out->PutStr( "local" );
			break;
		case MPTYPE_ARRAYVAR:
			out->PutStr( "array" );
			break;
		case MPTYPE_SINGLEVAR:
			out->PutStr( "var" );
			break;
		default:
			sprintf( mes, "???(%d)", prm->mptype );
			out->PutStr( mes );
			break;
		}
		sprintf( mes," _prm%d", fnc->prmindex + i );
		out->PutStr( mes );
		prm++;
	}
	out->PutCR();
}


void CHsp3::MakeProgramInfoLabel( void )
{
	//		���x���𐶐��̃e�X�g
	//
	int otmax;
	char mes[256];
	int labindex;
	int myot;

	otmax = GetOTCount();
	if ( otmax == 0 ) return;
	myot = (int)(mcs_last - mcs_start);

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( myot == GetOT( labindex ) ) {
			if ( GetOTInfo( labindex ) == -1 ) {
				sprintf( mes,"*L%04x\n", labindex );
				out->PutStr( mes );
			} else {
				MakeProgramInfoFuncParam( GetOTInfo( labindex ) );
			}
		}
		labindex++;
	}
}


int CHsp3::GetHSPVarExpression( char *mes )
{
	//	�ϐ�������ɑ����p�����[�^�[(�z��)��W�J����
	//	mes : �z����e��mes�ɏo��
	//
	int i;
	int prm;
	if ( cstype == TYPE_MARK ) {
		if ( csval == '(' ) {
			CMemBuf arname;
			arname.PutStr( "(" );
			getCS();
			prm = 0;
			while(1) {
				if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
				if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N
				if ( prm ) arname.PutStr( ", " );
				i = GetHSPExpression( &arname );
				if ( i > 0 ) break;
				if ( i < -1 ) return i;
				prm++;
			}
			arname.PutStr( ")" );
			if ( arname.GetSize() < VAREXP_BUFFER_MAX ) {
				strcpy( mes, arname.GetBuffer() );
			} else {
				Alert( "CHsp3:Expression buffer overflow." );
				*mes = 0;
			}
			getCS();
			return 1;
		}
	}
	return 0;
}


int CHsp3::GetHSPExpression( CMemBuf *eout )
{
	//		HSP�̌v�Z���t�H�[�}�b�g�Ńp�����[�^�[��W�J����
	//		eout : �o�͐�
	//
	int i;
	int op;
	int res;
	CsStack st;
	OPSTACK *stm1;
	OPSTACK *stm2;
	char mes[8192];								// �W�J����鎮�̍ő啶����
	char mestmp[8192];							// �W�J����鎮�̍ő啶����
	char mm[4096];

	if (exflag&EXFLG_1) return 1;				// �p�����[�^�[�I�[
	if (exflag&EXFLG_2) {						// �p�����[�^�[��؂�(�f�t�H���g��)
		exflag^=EXFLG_2;
		return -1;
	}
	if ( cstype == TYPE_MARK ) {
		if ( csval == 63 ) {					// �p�����[�^�[�ȗ���('?')
			getCS();
			exflag&=~EXFLG_2;
			return -1;
		}
		if ( csval == ')' ) {					// �֐����̃p�����[�^�[�ȗ���
			exflag&=~EXFLG_2;
			return 2;
		}
	}

	*mes = 0;
	res = 0;

	while(1) {
		if ( mcs > mcs_end ) return 1;			// �f�[�^�I�[�`�F�b�N

		switch(cstype) {
		case TYPE_MARK:
			//		�L��(�X�^�b�N������o���ĉ��Z)
			//
			if ( csval == ')' ) {					// �����̏I���}�[�N
				exflag |= EXFLG_2;
				res = 2;
				break;
			}
			op = csval;
			stm1 = st.Peek2();
			stm2 = st.Peek();
			if ( stm1->type == -1 ) {				// (?)+(result)�̏ꍇ
				MakeImmidiateHSPName( mm, stm2->type, stm2->val, stm2->opt );
				strcpy( mestmp, mes );
				sprintf( mes,"(%s)%s%s", mestmp, GetHSPOperator(op).c_str(), mm );
			} else {
				if ( stm2->type == -1 ) {			// (result)+(?)�̏ꍇ
					MakeImmidiateHSPName( mm, stm1->type, stm1->val, stm1->opt );
					strcat( mes, GetHSPOperator(op).c_str() );
					strcat( mes, mm );
				} else {							// (?)+(?)�̏ꍇ
					MakeImmidiateHSPName( mm, stm1->type, stm1->val, stm1->opt );
					strcat( mes, mm );
					strcat( mes, GetHSPOperator(op).c_str() );
					MakeImmidiateHSPName( mm, stm2->type, stm2->val, stm2->opt );
					strcat( mes, mm );
				}
			}
			stm1->type = -1;
			st.Pop();
			getCS();
			break;
		case TYPE_VAR:
			//		�ϐ����X�^�b�N�ɐς�
			//
			stm1 = st.Push( cstype, csval );
			getCS();
			i = GetHSPVarExpression( mm );
			if ( i ) st.SetExStr( stm1, mm );
			break;
		case TYPE_INUM:
		case TYPE_STRING:
		case TYPE_DNUM:
		case TYPE_LABEL:
			//		���l���X�^�b�N�ɐς�
			//
			st.Push( cstype, csval );
			getCS();
			break;
		case TYPE_STRUCT:
			//		�p�����[�^�[
			//
			stm1 = st.Push( cstype, csval );
			getCS();
			i = GetHSPVarExpression( mm );
			if ( i ) st.SetExStr( stm1, mm );
			break;
		default:
			//		�֐��Ƃ��ēW�J����
			//
			stm1 = st.Push( cstype, csval );
			getCS();
			i = GetHSPVarExpression( mm );
			if ( i ) st.SetExStr( stm1, mm );
			break;
		}

		if ( exflag ) {								// �p�����[�^�[�I�[�`�F�b�N
			exflag&=~EXFLG_2;
			break;
		}
	}
	if ( st.GetLevel() > 1 ) {
		Alert( "Invalid end stack" ); return -5;
	}
	if ( st.GetLevel() == 1 ) {
			stm1 = st.Peek();
			if ( stm1->type != -1 ) {
				MakeImmidiateHSPName( mm, stm1->type, stm1->val, stm1->opt );
				strcat( mes, mm );
			}
	}
	eout->PutStr( mes );
	return res;
}


int CHsp3::MakeImmidiateName( char *mes, int type, int val )
{
	//		���l(int,double,str)��ǉ�
	//		(�ǉ��ł��Ȃ��^�̏ꍇ��-1��Ԃ�)
	//
	switch( type ) {
	case TYPE_STRING:
		sprintf( mes, "\"%s\"", GetDS( val ) );
		break;
	case TYPE_DNUM:
		{
		double dval;
		dval = GetDSf(val);
		sprintf( mes, "%f", dval );
		break;
		}
	case TYPE_INUM:
		sprintf( mes, "%d", val );
		break;
	default:
		*mes = 0;
		return -1;
	}
	return 0;
}


int CHsp3::MakeImmidiateHSPName( char *mes, int type, int val, char *opt )
{
	//		���l(int,double,str)��ǉ�
	//		(�ǉ��ł��Ȃ��^�̏ꍇ��-1��Ԃ�)
	//
	int i;
	i = MakeImmidiateName( mes, type, val );
	if ( i == 0 ) return 0;
	switch( type ) {
	case TYPE_VAR:
		sprintf( mes, "%s", GetHSPVarName(val).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		break;
	case TYPE_STRUCT:
		{
		const STRUCTPRM *prm;
		prm = GetMInfo( val );
		if ( prm->subid != STRUCTPRM_SUBID_STACK ) {
			sprintf( mes, "_modprm%d", val );
		} else {
			sprintf( mes, "_prm%d", val );
		}
		break;
		}
	case TYPE_LABEL:
		sprintf( mes, "*L%04x", val );
		break;
	default:
		strcpy( mes, GetHSPName( type, val ).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		if ( *mes == 0 ) return -1;
		break;
	}
	return 0;
}


void CHsp3::MakeHspStyleString( char *str, CMemBuf *eout )
{
	//		HSP�̃G�X�P�[�v���g�p����������𐶐�����
	//		str  : ���̕�����
	//		eout : �o�͐�
	//
	char *p;
	char a1;
	p = str;
	eout->Put( (char)0x22 );
	while(1) {
		a1 = *p++;
		if ( a1 == 0 ) break;
		if ( a1 == 13 ) {
			if ( *p==10 ) p++;
			eout->Put( '\\' );
			a1='n';
		}
		if ( a1 == '\t' ) {
			eout->Put( '\\' );
			a1='t';
		}
		if ( a1 == '\\' ) {
			eout->Put( '\\' );
		}
		if ( a1 == 0x22 ) {
			eout->Put( '\\' );
			a1 = 0x22;
		}
		eout->Put( a1 );
	}
	eout->Put( (char)0x22 );
}


void CHsp3::MakeProgramInfoHSPName( bool putadr )
{
	//		HSP����ǉ�(�\��)
	//		putadr : �A�h���X�\��ON/OFF
	//
	char mes[4096];
	if ( putadr ) {
		sprintf( mes,"#%06x:", mcs - mcs_start );
		out->PutStr( mes );
	} else {
		out->PutStr( "        " );
	}
	switch( cstype ) {
	case TYPE_MARK:
		sprintf( mes, "Mark'%s'\n", GetHSPOperator( csval ).c_str() );
		break;
	case TYPE_VAR:
		sprintf( mes, "VAR:%d(%s)\n", csval, GetHSPVarName(csval).c_str() );
		break;
	case TYPE_STRING:
		sprintf( mes, "Str:%s\n", GetDS( csval ) );
		break;
	case TYPE_DNUM:
		{
		double dval;
		dval = GetDSf(csval);
		sprintf( mes, "Double:%f\n", dval );
		break;
		}
	case TYPE_INUM:
		sprintf( mes, "Int:%d\n", csval );
		break;
	case TYPE_STRUCT:
		sprintf( mes, "Struct:%d\n", csval );
		break;
	case TYPE_LABEL:
		sprintf( mes, "Label:%d\n", csval );
		break;
	case TYPE_PROGCMD:
	case TYPE_INTCMD:
	case TYPE_EXTCMD:
	case TYPE_INTFUNC:
		const char *p;
		p = GetHSPName( cstype, csval ).c_str();
		if ( *p == 0 ) {
			sprintf( mes, "cmd?:CSTYPE%d VAL%d\n", cstype, csval );
		} else {
			sprintf( mes, "Cmd:%s\n", p );
		}
		break;
	case TYPE_SYSVAR:
		sprintf( mes, "SysVar:%d\n", csval );
		break;
	case TYPE_EXTSYSVAR:
		sprintf( mes, "ExtSysVar:%d\n", csval );
		break;
	case TYPE_CMPCMD:
		sprintf( mes, "CMP:%d\n", csval );
		break;
	case TYPE_MODCMD:
		sprintf( mes, "Module:%d\n", csval );
		break;
	case TYPE_DLLFUNC:
		sprintf( mes, "DLLFUNC:%d\n", csval );
		break;
	case TYPE_DLLCTRL:
		sprintf( mes, "DLLCTRL:%d\n", csval );
		break;
	default:
		sprintf( mes, "???:CSTYPE%d VAL%d\n", cstype, csval );
		break;
	}
	out->PutStr( mes );
}


int CHsp3::MakeProgramInfoParam( void )
{
	//		�p�����[�^�[�̃g���[�X
	//
	int prm;
	//char mes[4096];

	prm = 0;
	while(1) {
		if ( mcs > mcs_end ) return -1;
		if ( exflag == EXFLG_1 ) break;		// �s��
		if ( exflag & EXFLG_2 ) {
			if (prm) {				// �p�����[�^�[��؂�
				out->PutStr( "        ----\n" );
			}
		}
		MakeProgramInfoHSPName( false );
		//sprintf( mes, "        CSTYPE%d VAL%d\n", cstype, csval );
		//out->PutStr( mes );
		prm++;
		getCS();
	}
	return 0;
}
	

int CHsp3::MakeProgramInfoParam2( void )
{
	//		�p�����[�^�[�̃g���[�X(�W�J����)
	//
	int i;
	int prm;
	//char mes[4096];

	prm = 0;
	while(1) {
		//sprintf( mes,"---%04x:%x:CSTYPE%d VAL%d\n", mcs - mcs_start, exflag, cstype, csval );
		//out->PutStr( mes );

		if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
		if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N

		if ( prm ) out->PutStr( ", " );
		i = GetHSPExpression( out );
		if ( i > 0 ) break;
		if ( i < -1 ) return i;
		prm++;
	}
	out->PutCR();
	return 0;
}


void CHsp3::MakeProgramInfo( void )
{
	//		�v���O�����̃g���[�X�e�X�g
	//
	int i;
	int op;
	int cmdtype, cmdval;
	char mes[4096];
	char arbuf[VAREXP_BUFFER_MAX];
	while(1) {
		if ( mcs > mcs_end ) break;

		//		endif�̃`�F�b�N
		//
		if ( ifmode[iflevel]==2 ) {		// if end
			if ( mcs_last>=ifptr[iflevel] ) {
				ifmode[iflevel] = 0;
				if ( iflevel == 0 ) { Alert( "Invalid endif." ); return; }
				iflevel--;
				out->PutStr( "endif\n" );
				continue;
			}
		}

		//		���x���`�F�b�N
		//
		MakeProgramInfoLabel();

		//		�s���̃R�[�h
		//
		cmdtype = cstype;
		cmdval = csval;
		//MakeProgramInfoHSPName();
		sprintf( mes,"#%06x:CSTYPE%d VAL%d\n", mcs_last - mcs_start, cstype, csval );
		//Alert( mes );
		out->PutStr( mes );

		//		�p�����[�^�[
		//
		switch( cmdtype ) {
		case TYPE_STRUCT:						// ��֕ϐ�(struct)
		case TYPE_VAR:							// �ϐ����
			MakeImmidiateHSPName( mes, cmdtype, cmdval );
			out->PutStr( mes );
			getCS();
			i = GetHSPVarExpression( arbuf );
			if ( i ) { out->PutStr( arbuf ); }

			if ( cstype == TYPE_MARK ) {
				if ( csval == CALCCODE_EQ ) {
					out->PutStr( "=" );
					getCS();
					MakeProgramInfoParam2();
					break;
				}
				op = csval;
				getCS();
				if ( exflag & EXFLG_1) {		// ++ or --
					out->PutStr( GetHSPOperator(op).c_str() );
					out->PutStr( GetHSPOperator(op).c_str() );
					MakeProgramInfoParam2();
					break;
				}
				out->PutStr( GetHSPOperator(op).c_str() );
				out->PutStr( "=" );
				//getCS();
				MakeProgramInfoParam2();
				break;
			}
			Alert( "CHsp3:Var Syntax unknown." );
			break;
		case TYPE_CMPCMD:						// ��r����
			if ( cmdval == 0 ) {
				out->PutStr( "if " );
				iflevel++;
				if ( iflevel >= MAX_IFLEVEL ) {
					Alert( "Stack(If) overflow." );
					return;
				}
				ifmode[iflevel] = 1;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				ifmode[iflevel]++;
			} else {
				out->PutStr( "} else {" );
				ifmode[iflevel] = 3;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
			}
			mcs++;
			getCS();
			MakeProgramInfoParam2();
			break;
		default:
			out->PutStr( GetHSPName( cstype, csval ).c_str() );
			out->PutStr( " " );
			getCS();
			MakeProgramInfoParam2();
			break;
		}
	}
	out->PutStr( "--------------------------------------------\n" );

}


/*------------------------------------------------------------*/


int CHsp3::MakeSource( int option, void *ref )
{
	MakeObjectInfo();
	MakeProgramInfo();
	return 0;
}
