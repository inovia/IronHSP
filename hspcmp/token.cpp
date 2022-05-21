
//
//		Token analysis class
//			onion software/onitama 2002/2
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>
#include <math.h>
#include <assert.h>

#include "../hsp3/hsp3config.h"
#include "supio.h"
#include "token.h"
#include "label.h"
#include "tagstack.h"
#include "membuf.h"
#include "strnote.h"
#include "ahtobj.h"

#define s3size 0x8000

//-------------------------------------------------------------
//		Routines
//-------------------------------------------------------------

void CToken::Mes( char *mes )
{
	//		���b�Z�[�W�o�^
	//
	errbuf->PutStr( mes );
	errbuf->PutStr( "\r\n" );
}


void CToken::Mesf( char *format, ...)
{
	//		���b�Z�[�W�o�^
	//		(�t�H�[�}�b�g�t��)
	//
	char textbf[1024];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);
	errbuf->PutStr( textbf );
	errbuf->PutStr( "\r\n" );
}


void CToken::Error( char *mes )
{
	//		�G���[���b�Z�[�W�o�^
	//
	char tmp[256];
	sprintf( tmp, "#Error:%s\r\n", mes );
	errbuf->PutStr( tmp );
}


void CToken::LineError( char *mes, int line, char *fname )
{
	//		�G���[���b�Z�[�W�o�^(line/filename)
	//
	char tmp[256];
	sprintf( tmp, "#Error:%s in line %d [%s]\r\n", mes, line, fname );
	errbuf->PutStr( tmp );
}


void CToken::SetErrorBuf( CMemBuf *buf )
{
	//		�G���[���b�Z�[�W�o�b�t�@�o�^
	//
	errbuf = buf;
}


void CToken::SetPackfileOut( CMemBuf *pack )
{
	//		packfile�o�̓o�b�t�@�o�^
	//
	packbuf = pack;
	packbuf->PutStr( ";\r\n;\tsource generated packfile\r\n;\r\n" );
}


void CToken::SetError( char *mes )
{
	//		�G���[���b�Z�[�W���o�^
	//
	strcpy( errtmp, mes );
}


int CToken::AddPackfile( char *name, int mode )
{
	//		packfile�o��
	//			0=name/1=+name/2=other
	//
	CStrNote note;
	int i,max;
	char packadd[1024];
	char tmp[1024];
	char *s;

	strcpy( packadd, name );
	strcase( packadd );
	if ( mode<2 ) {
		note.Select( packbuf->GetBuffer() );
		max = note.GetMaxLine();
		for( i=0;i<max;i++ ) {
			note.GetLine( tmp, i );
			s = tmp;if ( *s=='+' ) s++;
			if ( tstrcmp( s, packadd )) return -1;
		}
		if ( mode==1 ) packbuf->PutStr( "+" );
	}
	packbuf->PutStr( packadd );
	packbuf->PutStr( "\r\n" );
	return 0;
}


//-------------------------------------------------------------
//		Interfaces
//-------------------------------------------------------------

CToken::CToken( void )
{
	s3 = (unsigned char *)malloc( s3size );
	lb = new CLabel;
	tmp_lb = NULL;
	hed_cmpmode = CMPMODE_OPTCODE | CMPMODE_OPTPRM | CMPMODE_SKIPJPSPC;
	tstack = new CTagStack;
	errbuf = NULL;
	packbuf = NULL;
	ahtmodel = NULL;
	ahtbuf = NULL;
	scnvbuf = NULL;
	ResetCompiler();
}


CToken::CToken( char *buf )
{
	s3 = (unsigned char *)malloc( s3size );
	lb = new CLabel;
	tmp_lb = NULL;
	hed_cmpmode = CMPMODE_OPTCODE | CMPMODE_OPTPRM | CMPMODE_SKIPJPSPC;
	tstack = new CTagStack;
	errbuf = NULL;
	packbuf = NULL;
	ahtmodel = NULL;
	ahtbuf = NULL;
	scnvbuf = NULL;
	ResetCompiler();
}


CToken::~CToken( void )
{
	if ( scnvbuf!=NULL ) InitSCNV(-1);

	if ( tstack!=NULL ) { delete tstack; tstack = NULL; }
	if ( lb!=NULL ) { delete lb; lb = NULL; }
	if ( s3 != NULL ) { free( s3 );s3 = NULL; }
//	buffer = NULL;
}


CLabel *CToken::GetLabelInfo( void )
{
	//		���x�������o��
	//		(CLabel *���擾�����炻����ŁAdelete���邱��)
	//
	CLabel *res;
	res = lb;
	lb = NULL;
	return res;
}


void CToken::SetLabelInfo( CLabel *lbinfo )
{
	//		���x�����ݒ�
	//
	tmp_lb = lbinfo;
}


void CToken::ResetCompiler( void )
{
//	buffer = buf;
//	wp = (unsigned char *)buf;
	line = 1;
	fpbit = 256.0;
	incinf = 0;
	swsp = 0; swmode = 0; swlevel = 0;
	SetModuleName( "" ); modgc = 0;
	search_path[0] = 0;
	lb->Reset();
	fileadd = 0;

	//		reset header info
	hed_option = 0;
	hed_runtime[0] = 0;
	hed_autoopt_timer = 0;
	hed_autoopt_strexchange = 0;
	pp_utf8 = 0;
}


void CToken::SetAHT( AHTMODEL *aht )
{
	ahtmodel = aht;
}


void CToken::SetAHTBuffer( CMemBuf *aht )
{
	ahtbuf = aht;
}


void CToken::SetLook( char *buf )
{
	wp = (unsigned char *)buf;
}


char *CToken::GetLook( void )
{
	return (char *)wp;
}


char *CToken::GetLookResult( void )
{
	return (char *)s2;
}


int CToken::GetLookResultInt( void )
{
	return val;
}


void CToken::Pickstr( bool isVSL )
{
	//		Strings pick sub
	//
	int a=0;
	unsigned char a1;
	int skip, i;
	while(1) {

pickag:
		a1=(unsigned char)*wp;
#if 0
		if (a1>=0x81) {
			if (a1<0xa0) {				// s-jis code
				s3[a++]=a1;wp++;
				s3[a++]=*wp;wp++;
				continue;
			}
			else if (a1>=0xe0) {		// s-jis code2
				s3[a++]=a1;wp++;
				s3[a++]=*wp;wp++;
				continue;
			}
		}
#endif

		if (!isVSL && a1==0x5c) {					// '\' extra control
			wp++;a1=tolower(*wp);
			switch(a1) {
				case 'n':
					s3[a++]=13;a1=10;
					break;
				case 't':
					a1=9;
					break;
				case 'r':
					s3[a++]=13;wp++;
					goto pickag;
				case 0x22:
					s3[a++]=a1;wp++;
					goto pickag;
			}
		}
		if (a1==0) { wp=NULL;break; }
#ifdef HSPLINUX
		if (a1==10) {
			wp++;
			line++;
			break;
		}
#endif
		if (a1==13) {
			wp++;if ( *wp==10 ) wp++;
			line++;
			break;
		}
		if (a1==0x22) {
			wp++;
			if ( *wp == 0 ) wp=NULL;
			break;
		}

#if 0
		s3[a++] = a1; wp++;
#else
		skip = SkipMultiByte(a1);	// �S�p�����`�F�b�N
		for (i = 0; i <= skip; i++) {
			s3[a++] = a1; wp++;
			a1 = *wp;
		}	
#endif

	}
	s3[a]=0;
}


char *CToken::Pickstr2( char *str )
{
	//		Strings pick sub '�`'
	//
	unsigned char *vs;
	unsigned char *pp;
	unsigned char a1;
	int skip,i;
	vs = (unsigned char *)str;
	pp = s3;

	while(1) {
		a1=*vs;
		if (a1==0) break;
		if (a1==0x27) { vs++; break; }
		if (a1==0x5c) {					// '\'�`�F�b�N
			vs++;
			a1 = tolower( *vs );
			if ( a1 < 32 ) continue;
			switch( a1 ) {
			case 'n':
				*pp++ = 13;
				a1 = 10;
				break;
			case 't':
				a1 = 9;
				break;
			case 'r':
				a1 = 13;
				break;
			}
		}

		skip = SkipMultiByte( a1 );
		if ( skip ) {					// �S�p�����`�F�b�N
			for(i=0;i<skip;i++) {
				*pp++ = a1;
				vs++;
				a1=*vs;
			}
		}
		vs++;
		*pp++ = a1;
	}
	*pp = 0;
	return (char *)vs;
}


int CToken::CheckModuleName( char *name )
{
	int a;
	unsigned char *p;
	unsigned char a1;

	a = 0;
	p = (unsigned char *)name;
	while(1) {								// normal object name
		a1=*p;
		if (a1==0) { return 0; }
		if (a1<0x30) break;
		if ((a1>=0x3a)&&(a1<=0x3f)) break;
		if ((a1>=0x5b)&&(a1<=0x5e)) break;
		if ((a1>=0x7b)&&(a1<=0x7f)) break;

		p++;
		p += SkipMultiByte( a1 );		// �S�p�����`�F�b�N
	}
	return -1;
}


int CToken::GetToken( void )
{
	//
	//	get new word from wp ( result:s3 )
	//			result : word type
	//
	int rval;
	int a,b;
	int minmode;
	unsigned char a1,a2,an;
	int fpflag;
//	int *fpival;
	unsigned char *wp_bak;
	int ft_bak;

	if (wp==NULL) return TK_NONE;

	a = 0;
	minmode = 0;
	rval=TK_OBJ;

	while(1) {
		a1=*wp;

#ifdef HSPWIN
		if ( a1 == 0x81 ) {
			if ( wp[1] == 0x40 ) {	// �S�p�X�y�[�X�͖���
				if ( hed_cmpmode & CMPMODE_SKIPJPSPC ) {
					wp+=2; continue;
				}
			}
		}
#endif

		if ((a1!=32)&&(a1!=9)) break;	// Skip Space & Tab
		wp++;
	}

	if (a1==0) { wp=NULL;return TK_NONE; }		// End of Source
	if (a1==13) {					// Line Break
		wp++;if (*wp==10) wp++;
		line++;
		return TK_NONE;
	}
	if (a1==10) {					// Unix Line Break
		wp++;
		line++;
		return TK_NONE;
	}

	//	Check Extra Character
	if (a1<0x30) rval=TK_NONE;
	if ((a1>=0x3a)&&(a1<=0x3f)) rval=TK_NONE;
	if ((a1>=0x5b)&&(a1<=0x5e)) rval=TK_NONE;
	if ((a1>=0x7b)&&(a1<=0x7f)) rval=TK_NONE;

	if (a1==':') {   // multi statement
		wp++;
		return TK_SEPARATE;
	}

	if (a1=='0') {
		a2=wp[1];
		if (a2=='x') { wp++;a1='$'; }		// when hex code (0x)
		if (a2=='b') { wp++;a1='%'; }		// when bin code (0b)
	}
	if (a1=='$') {							// when hex code ($)
		wp++;val=0;
		while(1) {
			a1=toupper(*wp);b=-1;
			if (a1==0) { wp=NULL;break; }
			if ((a1>=0x30)&&(a1<=0x39)) b=a1-0x30;
			if ((a1>=0x41)&&(a1<=0x46)) b=a1-55;
			if (a1=='_') b=-2;
			if (b==-1) break;
			if (b>=0) { s3[a++]=a1;val=(val<<4)+b; }
			wp++;
		}
		s3[a]=0;
		return TK_NUM;
	}

	if (a1=='%') {							// when bin code (%)
		wp++;val=0;
		while(1) {
			a1=*wp;b=-1;
			if (a1==0) { wp=NULL;break; }
			if ((a1>=0x30)&&(a1<=0x31)) b=a1-0x30;
			if (a1=='_') b=-2;
			if (b==-1) break;
			if (b>=0) { s3[a++]=a1;val=(val<<1)+b; }
			wp++;
		}
		s3[a]=0;
		return TK_NUM;
	}
/*
	if (a1=='-') {							// minus operator (-)
		wp++;an=*wp;
		if ((an<0x30)||(an>0x39)) {
			s3[0]=a1;s3[1]=0;
			return a1;
		}
		minmode++;
		a1=an;						// �������l�Ȃ�΂��̂܂܌p��
	}
*/		
	if ((a1>=0x30)&&(a1<=0x39)) {			// when 0-9 numerical
		fpflag = 0;
		ft_bak = 0;
		while(1) {
			a1=*wp;
			if (a1==0) { wp=NULL;break; }
			if (a1=='.') {
				if ( fpflag ) {
					break;
				}
				a2=*(wp+1);
				if ((a2<0x30)||(a2>0x39)) break;
				wp_bak = wp;
				ft_bak = a;
				fpflag = 3;
				//fpflag = -1;
				s3[a++]=a1;wp++;
				continue;
			}
			if ((a1<0x30)||(a1>0x39)) break;
			s3[a++]=a1;
			wp++;
		}
		s3[a]=0;
		if ( wp != NULL ) {
			if ( *wp=='k' ) { fpflag=1;wp++; }
			if ( *wp=='f' ) { fpflag=2;wp++; }
			if ( *wp=='d' ) { fpflag=3;wp++; }
			if ( *wp=='e' ) { fpflag=4;wp++; }
		}

		if ( fpflag<0 ) {				// �����l�łȂ����́u.�v�܂łŏI���
			s3[ft_bak] = 0;
			wp = wp_bak;
			fpflag = 0;
		}

		switch( fpflag ) {
		case 0:					// �ʏ�̐���
			val=atoi_allow_overflow((char *)s3);
			if ( minmode ) val=-val;
			break;
		case 1:					// int�Œ菬��
			val_d = atof( (char *)s3 );
			val = (int)( val_d * fpbit );
			if ( minmode ) val=-val;
			break;
		case 2:					// int�`����float�l��Ԃ�
#if 0
			val_f = (float)atof( (char *)s3 );
			if ( minmode ) val_f=-val_f;
			fpival = (int *)&val_f;
			val = *fpival;
			break;
#endif
			val_d = atof((char*)s3);
			if (minmode) val_d = -val_d;
			return TK_DNUM;
		case 4:					// double�l(�w���\�L)
			s3[a++]='e';
			a1 = *wp;
			if (( a1=='-' )||( a1=='+' )) {
				s3[a++] = a1;
				wp++;
			}
			while(1) {
				a1=*wp;
				if ((a1<0x30)||(a1>0x39)) break;
				s3[a++]=a1;wp++;
			}
			s3[a]=0;
		case 3:					// double�l
			val_d = atof( (char *)s3 );
			if ( minmode ) val_d=-val_d;
			return TK_DNUM;
		}
		return TK_NUM;
	}

	if (a1 == '@') {							// @"�`"
		a2 = wp[1];
		if (a2 == 0x22) {						// "
			wp += 2; Pickstr(true);
			return TK_STRING;
		}
	}

	if (a1==0x22) {							// when "string"
		wp++;Pickstr();
		return TK_STRING;
	}

	if (a1==0x27) {							// when 'char'
		wp++;
		wp = (unsigned char *)Pickstr2( (char *)wp );
		val=*(unsigned char *)s3;
		return TK_NUM;
	}

	if (rval==TK_NONE) {					// token code
		wp++;an=*wp;
		if (a1=='!') {
			if (an=='=') wp++;
		}
/*
		else if (a1=='<') {
			if (an=='<') { wp++;a1=0x63; }	// '<<'
			if (an=='=') { wp++;a1=0x61; }	// '<='
		}
		else if (a1=='>') {
			if (an=='>') { wp++;a1=0x64; }	// '>>'
			if (an=='=') { wp++;a1=0x62; }	// '>='
		}
*/
		else if (a1=='=') {
			if (an=='=') { wp++; }			// '=='
		}
		else if (a1=='|') {
			if (an=='|') { wp++; }			// '||'
		}
		else if (a1=='&') {
			if (an=='&') { wp++; }			// '&&'
		}
		s3[0]=a1;s3[1]=0;
		return a1;
	}

	while(1) {								// normal object name
		int skip,i;
		a1=*wp;
		if (a1==0) { wp=NULL;break; }
		if (a1<0x30) break;
		if ((a1>=0x3a)&&(a1<=0x3f)) break;
		if ((a1>=0x5b)&&(a1<=0x5e)) break;
		if ((a1>=0x7b)&&(a1<=0x7f)) break;

		if ( a>=OBJNAME_MAX ) break;

		skip = SkipMultiByte( a1 );	// �S�p�����`�F�b�N
		if ( skip ) {
#ifdef HSPWIN
			if ( hed_cmpmode & CMPMODE_SKIPJPSPC ) {
				if ( a1 == 0x81 ) {
					if ( wp[1] == 0x40 ) {	// �S�p�X�y�[�X�͏I�[�Ƃ��ď���
						break;
					}
				}
			}
#endif
			for(i=0;i<skip;i++) {
				s3[a++]=a1;wp++;a1=*wp;
			}
		}
		s3[a++]=a1;wp++;
	}
	s3[a]=0;
	return TK_OBJ;
}


int CToken::PeekToken( void )
{
	// �߂��̂� wp �̂݁B
	// s3, val, val_f, val_d �Ȃǂ͖߂���Ȃ�
	unsigned char *wp_bak = wp;
	int result = GetToken();
	wp = wp_bak;
	return result;
}

//-----------------------------------------------------------------------------

void CToken::Calc_token( void )
{
	lasttoken = (char *)wp;
	ttype = GetToken();
}

void CToken::Calc_factor( CALCVAR &v )
{
	CALCVAR v1;
	int id,type;
	char *ptr_dval;
	if ( ttype==TK_NUM ) {
		v=(CALCVAR)val;
		Calc_token();
		return;
	}
	if ( ttype==TK_DNUM ) {
		v=(CALCVAR)val_d;
		Calc_token();
		return;
	}
	if ( ttype==TK_OBJ ) {
		id = lb->Search( (char *)s3 );
		if ( id == -1 ) { ttype=TK_CALCERROR; return; }
		type = lb->GetType( id );
		if ( type != LAB_TYPE_PPVAL ) { ttype=TK_CALCERROR; return; }
			ptr_dval = lb->GetData2( id );
			if ( ptr_dval == NULL ) {
				v = (CALCVAR)lb->GetOpt( id );
			} else {
				v = *(CALCVAR *)ptr_dval;
			}
		Calc_token();
		return;
	}
	if( ttype!='(' ) { ttype=TK_ERROR; return; }
	Calc_token();
	Calc_start(v1); 
	if( ttype!=')' ) { ttype=TK_CALCERROR; return; }
	Calc_token();
	v=v1;
}

void CToken::Calc_unary( CALCVAR &v )
{
	CALCVAR v1;
	int op;
	if ( ttype=='-' ) {
		op=ttype; Calc_token();
		Calc_unary(v1);
		v1 = -v1;
	} else {
		Calc_factor(v1);
	}
	v=v1;
}

void CToken::Calc_muldiv( CALCVAR &v )
{
	CALCVAR v1,v2;
	int op;
	Calc_unary(v1);
	while( (ttype=='*')||(ttype=='/')||(ttype==0x5c)) {
		op=ttype; Calc_token();
		Calc_unary(v2);
		if (op=='*') v1*=v2;
		else if (op=='/') {
			if ( v2==0.0 ) { ttype=TK_CALCERROR; return; }
			v1/=v2;
		} else if (op==0x5c) {
			if ( (int)v2==0 ) { ttype=TK_CALCERROR; return; }
			v1 = fmod( v1, v2 );
		}
	}
	v=v1;
}

void CToken::Calc_addsub( CALCVAR &v )
{
	CALCVAR v1,v2;
	int op;
	Calc_muldiv(v1);
	while( (ttype=='+')||(ttype=='-')) {
		op=ttype; Calc_token();
		Calc_muldiv(v2);
		if (op=='+') v1+=v2;
		else if (op=='-') v1-=v2;
	}
	v=v1;
}


void CToken::Calc_compare( CALCVAR &v )
{
	CALCVAR v1,v2;
	int v1i,v2i,op;
	Calc_addsub(v1);
	while( (ttype=='<')||(ttype=='>')||(ttype=='=')) {
		op=ttype; 
		if (op=='=') {
			Calc_token();
			Calc_addsub(v2);
			v1i = v1==v2;
			v1=(CALCVAR)v1i; continue;
		}
		if (op=='<') {
			if ( *wp=='=' ) {
				wp++;
				Calc_token();Calc_addsub(v2);
				v1i=(v1<=v2); v1=(CALCVAR)v1i; continue;
			}
			if ( *wp=='<' ) {
				wp++;
				Calc_token();Calc_addsub(v2);
				v1i = (int)v1;
				v2i = (int)v2;
				v1i<<=v2i;
				v1=(CALCVAR)v1i; continue;
			}
			Calc_token();
			Calc_addsub(v2);
			v1i=(v1<v2);
			v1=(CALCVAR)v1i; continue;
		}
		if (op=='>') {
			if ( *wp=='=' ) {
				wp++;
				Calc_token();Calc_addsub(v2);
				v1i=(v1>=v2);
				v1=(CALCVAR)v1i; continue;
			}
			if ( *wp=='>' ) {
				wp++;
				Calc_token();Calc_addsub(v2);
				v1i = (int)v1;
				v2i = (int)v2;
				v1i>>=v2i;
				v1=(CALCVAR)v1i; continue;
			}
			Calc_token();
			Calc_addsub(v2);
			v1i=(v1>v2);
			v1=(CALCVAR)v1i; continue;
		}
		v1=(CALCVAR)v1i;
	}
	v=v1;
}


void CToken::Calc_bool2( CALCVAR &v )
{
	CALCVAR v1,v2;
	int v1i,v2i;
	Calc_compare(v1);
	while( ttype=='!') {
		Calc_token();
		Calc_compare(v2);
		v1i = (int)v1;
		v2i = (int)v2;
		v1i = v1i != v2i;
		v1=(CALCVAR)v1i;
	}
	v=v1;
}


void CToken::Calc_bool( CALCVAR &v )
{
	CALCVAR v1,v2;
	int op,v1i,v2i;
	Calc_bool2(v1);
	while( (ttype=='&')||(ttype=='|')||(ttype=='^')) {
		op=ttype; Calc_token();
		Calc_bool2(v2);
		v1i = (int)v1;
		v2i = (int)v2;
		if (op=='&') v1i&=v2i;
		else if (op=='|') v1i|=v2i;
		else if (op=='^') v1i^=v2i;
		v1=(CALCVAR)v1i;
	}
	v=v1;
}


void CToken::Calc_start( CALCVAR &v )
{
	//		entry point
	Calc_bool(v);
}

int CToken::Calc( CALCVAR &val )
{
	CALCVAR v;
	Calc_token();
	Calc_start( v );
	if ( ttype == TK_CALCERROR ) {
		SetError("abnormal calculation");
		return -1;
	}
	if (ttype != TK_NONE) {
		SetError("expression syntax error");
		return -1;
	}
	if ( wp==NULL ) { val = v; return 0; }
	if ( *wp==0 ) { val = v; return 0; }
	SetError("expression syntax error");
	return -1;
}

//-----------------------------------------------------------------------------

char *CToken::ExpandStr( char *str, int opt )
{
	//		�w�蕶�����membuf�֓W�J����
	//			opt:0=�s���܂ŃX�L�b�v/1="�܂�/2='�܂�/3="�܂Œ���I���e������������
	//
	int a;
	unsigned char *vs;
	unsigned char a1,a2;
	unsigned char sep;
	int skip,i;
	vs = (unsigned char *)str;
	a = 0;
	sep = 0;
	if ((opt==1)||(opt==3)) sep=0x22;
	if (opt==2) sep=0x27;
	s3[a++]=sep;

	while(1) {
		a1=*vs;
		if (a1==0) break;
		if ((opt == 3) && (a1 == 0x22)) {	// "" �`�F�b�N(2�A���Ń_�u���N�H�[�g)
			a2 = *(vs + 1);
			if (a2 == 0x22) {
				vs += 2;
				s3[a++] = 0x5c;
				s3[a++] = 0x22;
				continue;
			}
		}
		if (a1==sep) { vs++;break; }
		if ((a1<32)&&(a1!=9)) break;
		s3[a++]=a1;vs++;

		if (a1 == 0x5c) {					// '\'�`�F�b�N
			if (opt == 3)
				s3[a++] = 0x5c;
			else
				s3[a++] = *vs++;
		}

		skip = SkipMultiByte( a1 );	// �S�p�����`�F�b�N
		if ( skip ) {
			for( i=0;i<skip;i++ ) {
				s3[a++] = *vs++;
			}
		}
	}
	s3[a++]=sep;
	s3[a]=0;
	if ( opt!=0 ) {
		if (wrtbuf!=NULL) wrtbuf->PutData( s3, a );
	}
	return (char *)vs;
}


char *CToken::ExpandAhtStr( char *str )
{
	//		�R�����g��W�J����
	//		( ;;�ɑ���AHT�w�蕶����p )
	//
	unsigned char *vs;
	unsigned char a1;
	vs = (unsigned char *)str;

	while(1) {
		a1=*vs;
		if (a1==0) break;
		if ((a1<32)&&(a1!=9)) break;
		vs++;
	}
	return (char *)vs;
}


char *CToken::ExpandStrEx( char *str )
{
	//		�w�蕶�����membuf�֓W�J����
	//		( �����s�Ή� {"�`"} )
	//
	int a;
	unsigned char *vs;
	unsigned char a1;
	int skip,i;
	vs = (unsigned char *)str;
	a = 0;
	//s3[a++]=0x22;

	while(1) {
		a1=*vs;
		if (a1==0) {
			//s3[a++]=13; s3[a++]=10;
			break;
		}
		if (a1==13) {
			s3[a++]=0x5c; s3[a++]='n';
			vs++;
			if (*vs==10) { vs++; }
			continue;
		}
#ifdef HSPLINUX
		if (a1==10) {
			s3[a++]=0x5c; s3[a++]='n';
			vs++;
			continue;
		}
#endif
//		if ((a1<32)&&(a1!=9)) break;
		if (a1==0x22) {
			if (vs[1]=='}') {
				s3[a++]=0x22; s3[a++]='}';
				mulstr=LMODE_ON; vs+=2; break;
			}
			s3[a++]=0x5c; s3[a++]=0x22;
			vs++;
			continue;
		}
		s3[a++]=a1;vs++;
		if (a1==0x5c) {					// '\'�`�F�b�N
			if (*vs>=32) { s3[a++] = *vs; vs++; }
		}

		skip = SkipMultiByte( a1 );	// �S�p�����`�F�b�N
		if ( skip ) {
			for(i=0;i<skip;i++) {
				s3[a++] = *vs++;
			}
		}

	}
	//s3[a++]=0x22;
	s3[a]=0;
	if (wrtbuf!=NULL) { wrtbuf->PutData( s3, a ); }
	return (char *)vs;
}

char *CToken::ExpandStrEx_VSL(char *str)
{
	//		�w�蕶�����membuf�֓W�J����
	//		( �����s�Ή� {{{"�`"}}} )
	//
	int a;
	unsigned char *vs;
	unsigned char a1;
	int skip, i;
	vs = (unsigned char *)str;
	a = 0;
	//s3[a++]=0x22;

	while (1) {
		a1 = *vs;
		if (a1 == 0) {
			//s3[a++]=13; s3[a++]=10;
			break;
		}
		if (a1 == 13) {
			s3[a++] = 0x5c; s3[a++] = 'n';
			vs++;
			if (*vs == 10) { vs++; }
			continue;
		}
#ifdef HSPLINUX
		if (a1 == 10) {
			s3[a++] = 0x5c; s3[a++] = 'n';
			vs++;
			continue;
		}
#endif
		//		if ((a1<32)&&(a1!=9)) break;

		// ����� "}}} �����A�]���݊��� "} �Ƃ��ďo��
		if (a1 == 0x22) {						// " 
			if ((vs[1] == '}') && (vs[2] == '}') && (vs[3] == '}')) {
				s3[a++] = 0x22; s3[a++] = '}';	// "}
				mulstr = LMODE_ON; vs += 4; break;
			}
			s3[a++] = 0x5c; s3[a++] = 0x22;		// \"
			vs++;
			continue;
		}
		s3[a++] = a1; vs++;
		if (a1 == 0x5c) {					// '\'�`�F�b�N
			if (*vs >= 32) { s3[a++] = *vs; vs++; }
		}

		skip = SkipMultiByte(a1);	// �S�p�����`�F�b�N
		if (skip) {
			for (i = 0; i < skip; i++) {
				s3[a++] = *vs++;
			}
		}

	}
	//s3[a++]=0x22;
	s3[a] = 0;
	if (wrtbuf != NULL) { wrtbuf->PutData(s3, a); }
	return (char *)vs;
}


char *CToken::ExpandStrComment( char *str, int opt )
{
	//		/*�`*/ �R�����g��W�J����
	//
	int a;
	unsigned char *vs;
	unsigned char a1;
	vs = (unsigned char *)str;
	a = 0;

	while(1) {
		a1=*vs;
		if (a1==0) {
			//s3[a++]=13; s3[a++]=10;
			break;
		}
		if (a1=='*') {
			if (vs[1]=='/') {
				mulstr=LMODE_ON; vs+=2; break;
			}
			vs++;
			continue;
		}
		vs++;
		vs+=SkipMultiByte( a1 );	// �S�p�����`�F�b�N
	}
	s3[a]=0;
	if ( opt==0 ) if (wrtbuf!=NULL) wrtbuf->PutData( s3, a );
	return (char *)vs;
}


char *CToken::ExpandHex( char *str, int *val )
{
	//		16�i���������membuf�֓W�J����
	//
	int a,b,num;
	unsigned char *vs;
	unsigned char a1;
	vs = (unsigned char *)str;

	s3[0]='$'; a=1; num=0;
	while(1) {
		a1=toupper(*vs);b=-1;
		if ((a1>=0x30)&&(a1<=0x39)) b=a1-0x30;
		if ((a1>=0x41)&&(a1<=0x46)) b=a1-55;
		if (a1=='_') b=-2;
		if (b==-1) break;
		if (b>=0) { s3[a++]=a1;num=(num<<4)+b; }
		vs++;
	}
	s3[a]=0;
	if (wrtbuf!=NULL) wrtbuf->PutData( s3, a );
	*val = num;
	return (char *)vs;
}


char *CToken::ExpandBin( char *str, int *val )
{
	//		2�i���������membuf�֓W�J����
	//
	int a,b,num;
	unsigned char *vs;
	unsigned char a1;
	vs = (unsigned char *)str;

	s3[0]='%'; a=1; num=0;
	while(1) {
			a1=*vs;b=-1;
			if ((a1>=0x30)&&(a1<=0x31)) b=a1-0x30;
			if (a1=='_') b=-2;
			if (b==-1) break;
			if (b>=0) { s3[a++]=a1;num=(num<<1)+b; }
			vs++;
		}
	s3[a]=0;
	if (wrtbuf!=NULL) wrtbuf->PutData( s3, a );
	return (char *)vs;
}


char *CToken::ExpandToken( char *str, int *type, int ppmode )
{
	//		string�f�[�^��membuf�֓W�J����
	//			ppmode : 0=�ʏ�A1=�v���v���Z�b�T��
	//
	int a,chk,id,ltype,opt;
	int flcnt;
	unsigned char *vs;
	unsigned char *vs_bak;
	unsigned char a1;
	unsigned char a2;
	unsigned char *vs_modbrk;
	char cnvstr[80];
	char fixname[256];
	char *macptr;

	vs = (unsigned char *)str;
	if ( vs==NULL ) {
		*type = TK_EOF;return NULL;			// already end
	}

	a1=*vs;
	if (a1==0) {							// end
		*type = TK_EOF;
		return NULL;
	}
	if (a1==10) {							// Unix���s
		vs++;
		if (wrtbuf!=NULL) wrtbuf->PutStr( "\r\n" );
		*type = TK_EOL;
		return (char *)vs;
	}
	if (a1==13) {							// ���s
		vs++;if ( *vs==10 ) vs++;
		if (wrtbuf!=NULL) wrtbuf->PutStr( "\r\n" );
		*type = TK_EOL;
		return (char *)vs;
	}
	if (a1==';') {							// �R�����g
		*type = TK_VOID;
		*vs=0;
		vs++;
		if ( *vs == ';' ) {
			vs++;
			if ( ahtmodel != NULL ) {
				ahtkeyword = (char *)vs;
			}
		}
		return ExpandStr( (char *)vs, 0 );
	}
	if (a1=='/') {							// C�R�����g
		if (vs[1]=='/') {
			*type = TK_VOID;
			*vs=0;
			return ExpandStr( (char *)vs+2, 0 );
		}
		if (vs[1]=='*') {
			mulstr = LMODE_COMMENT;
			*type = TK_VOID;
			*vs=0;
			return ExpandStrComment( (char *)vs+2, 0 );
		}
	}
	if (a1==0x22) {							// "�`"
		*type = TK_STRING;
		return ExpandStr( (char *)vs+1, 1 );
	}
	if (a1==0x27) {							// '�`'
		*type = TK_STRING;
		return ExpandStr( (char *)vs+1, 2 );
	}
	if (a1 == '@') {						// @"�`"
		if (vs[1] == 0x22) {
			*type = TK_STRING;
			return ExpandStr((char *)vs + 2, 3);
		}
	}
	if (a1=='{') {														// {"�`"}
		if (vs[1]==0x22) {
			if (wrtbuf != NULL) wrtbuf->PutStr("{\"");
			mulstr = LMODE_STR;
			*type = TK_STRING;
			return ExpandStrEx((char *)vs + 2);
		}
		else if ((vs[1] == '{') && (vs[2] == '{') && vs[3] == 0x22) {	// {{{"�`"}}}
			if (wrtbuf != NULL) wrtbuf->PutStr("{\"");
			mulstr = LMODE_STR_VSL;
			*type = TK_STRING;
			return ExpandStrEx_VSL((char *)vs + 4);
		}
	}

	if (a1=='0') {
		a2=vs[1];
		if (a2=='x') { vs++;a1='$'; }		// when hex code (0x)
		if (a2=='b') { vs++;a1='%'; }		// when bin code (0b)
	}
	if (a1=='$') {							// when hex code ($)
		*type = TK_OBJ;
		return ExpandHex( (char *)vs+1, &a );
	}

	if (a1=='%') {							// when bin code (%)
		*type = TK_OBJ;
		return ExpandBin( (char *)vs+1, &a );
	}
	
	if (a1<0x30) {							// space,tab
		*type = TK_CODE;
		vs++;
		if (wrtbuf!=NULL) wrtbuf->Put( (char)a1 );
		return (char *)vs;
	}

#ifdef HSPWIN
	if ( hed_cmpmode & CMPMODE_SKIPJPSPC ) {
		if ( a1 == 0x81 && vs[1] == 0x40 ) {	// �S�p�X�y�[�X�𔼊p�X�y�[�X�ɕϊ�����
			*type = TK_CODE;
			vs+=2;
			if (wrtbuf!=NULL) {
				wrtbuf->Put( (char)0x20 );
			}
			return (char *)vs;
		}
	}
#endif

	chk=0;
	if ((a1>=0x3a)&&(a1<=0x3f)) chk++;
	if ((a1>=0x5b)&&(a1<=0x5e)) chk++;
	if ((a1>=0x7b)&&(a1<=0x7f)) chk++;

	if (chk) {
		vs++;
		if (wrtbuf!=NULL) wrtbuf->Put( (char)a1 );		// �L��
		*type = a1;
		return (char *)vs;
	}

	if ((a1>=0x30)&&(a1<=0x39)) {			// when 0-9 numerical
		a=0; flcnt=0;
		while(1) {
			a1=*vs;
			if ( a1 == '.' ) {
				flcnt++;if ( flcnt>1 ) break;
			} else {
				if ((a1<0x30)||(a1>0x39)) break;
			}
			s2[a++]=a1;vs++;
		}
		if (( a1=='k' )||( a1=='f' )||( a1=='d' )) { s2[a++]=a1; vs++; }
		if ( a1 == 'e' ) {
			s2[a++]=a1; vs++;
			a1=*vs;
			if (( a1=='-' )||( a1=='+' )) {
				s2[a++] = a1;
				vs++;
			}
			while(1) {
				a1=*vs;
				if ((a1<0x30)||(a1>0x39)) break;
				s2[a++]=a1;vs++;
			}
		}

		s2[a]=0;
		if (wrtbuf!=NULL) wrtbuf->PutData( s2, a );
		*type = TK_OBJ;
		return (char *)vs;
	}

	a=0;
	vs_modbrk = NULL;

/*
	if ( ppmode ) {					// �v���v���Z�b�T����#���܂߂ăL�[���[�h�Ƃ���
		s2[a++]='#';
	}
*/

	//		���p�X�y�[�X�̌��o
	//
#ifdef HSPWIN
	if (( hed_cmpmode & CMPMODE_SKIPJPSPC ) == 0 ) {
		if ( strncmp( (char *)s2,"�@",2 )==0 ) {
			SetError("SJIS space code error");
			*type = TK_ERROR; return (char *)vs;
		}
	}
#endif


	//	 �V���{�����o��
	//
	while(1) {
		int skip,i;
		a1=*vs;
		//if ((a1>='A')&&(a1<='Z')) a1+=0x20;		// to lower case

		skip = SkipMultiByte( a1 );					// �S�p�����`�F�b�N
		if ( skip ) {

#ifdef HSPWIN
			if ( hed_cmpmode & CMPMODE_SKIPJPSPC ) {
				if ( a1 == 0x81 && vs[1] == 0x40 ) {	// �S�p�X�y�[�X�͏I�[�Ɣ��f
					break;
				}
			}
#endif
			for(i=0;i<(skip+1);i++) {
				if ( a<OBJNAME_MAX ) {
					s2[a++]=a1;
					vs++;
					a1=*vs;
				} else {
					vs++;
				}
			}
			continue;

		}

		chk=0;
		if (a1<0x30) chk++;
		if ((a1>=0x3a)&&(a1<=0x3f)) chk++;
		if ((a1>=0x5b)&&(a1<=0x5e)) chk++;
		if ((a1>=0x7b)&&(a1<=0x7f)) chk++;
		if ( chk ) break;
		vs++;

//		if ( a1=='@' ) if ( *vs==0 ) {
//			vs_modbrk = s2+a;
//		}
		if ( a<OBJNAME_MAX ) s2[a++]=a1;

	}
	s2[a]=0;

	if ( *s2=='@' ) {
		if (wrtbuf!=NULL) wrtbuf->PutData( s2, a );
		*type = TK_CODE;
		return (char *)vs;
	}


	//		�V���{������
	//
	strcase2( (char *)s2, fixname );

	
	//	if ( vs_modbrk != NULL ) *vs_modbrk = 0;
	FixModuleName( (char *)s2 );
	AddModuleName( fixname );

	id = lb->SearchLocal( (char *)s2, fixname );
	if ( id!=-1 ) {
		ltype = lb->GetType(id);
		switch( ltype ) {
		case LAB_TYPE_PPVAL:
			{
			//		const�}�N���W�J
			char *ptr_dval;
			ptr_dval = lb->GetData2( id );
			if ( ptr_dval == NULL ) {
				sprintf( cnvstr, "%d", lb->GetOpt(id) );
			} else {
				sprintf( cnvstr, "%f", *(CALCVAR *)ptr_dval );
			}
			chk = ReplaceLineBuf( str, (char *)vs, cnvstr, 0, NULL );
			break;
			}
		case LAB_TYPE_PPINTMAC:
			//		�����}�N��
			//

			if ( ppmode ) {			//	�v���v���Z�b�T���͂��̂܂ܓW�J
				if (wrtbuf!=NULL) {
					FixModuleName( (char *)s2 );
					wrtbuf->PutStr( (char *)s2 );
				}
				*type = TK_OBJ;
				return (char *)vs;
			}

		case LAB_TYPE_PPMAC:
			//		�}�N���W�J
			//
			vs_bak = vs;
			while(1) {		// �����space/tab������
				a1=*vs_bak;if ((a1!=32)&&(a1!=9)) break;
				vs_bak++;
			}
			opt = lb->GetOpt(id);
			if (( a1 == '=' )&&( opt & PRM_MASK ) ) {	// �}�N���ɑ�����悤�Ƃ����ꍇ�̃G���[
				SetError("Reserved word syntax error");
				*type = TK_ERROR; return (char *)vs;
			}
			//	
			macptr = lb->GetData(id);
			if ( macptr == NULL ) { *cnvstr=0; macptr=cnvstr; }
			chk = ReplaceLineBuf( str, (char *)vs, macptr, opt, (MACDEF *)lb->GetData2(id) );
			break;
		case LAB_TYPE_PPDLLFUNC:
			//		���W���[�����t���W�J�L�[���[�h
			if (wrtbuf!=NULL) {
//				AddModuleName( (char *)s2 );
				if ( lb->GetEternal(id) ) {
					FixModuleName( (char *)s2 );
					wrtbuf->PutStr( (char *)s2 );
				} else {
					wrtbuf->PutStr( fixname );
				}
			}
			*type = TK_OBJ;
			if ( *modname == 0 ) {
				lb->AddReference( id );
			} else {
				int i;
				i = lb->Search( GetModuleName() );
				if ( lb->SearchRelation( id, i ) == 0 ) {
					lb->AddRelation( id, i );
				}
			}
			return (char *)vs;
			break;
		case LAB_TYPE_COMVAR:
			//		COM�L�[���[�h��W�J
			if (wrtbuf!=NULL) {
				if ( lb->GetEternal(id) ) {
					FixModuleName( (char *)s2 );
					wrtbuf->PutStr( (char *)s2 );
				} else {
					wrtbuf->PutStr( fixname );
				}
			}
			*type = TK_OBJ;
			lb->AddReference( id );
			return (char *)vs;

		case LAB_TYPE_PPMODFUNC:
		default:
			//		�ʏ�L�[���[�h�͂��̂܂ܓW�J
			if (wrtbuf!=NULL) {
				if ( !lb->GetEternal(id) ) { // local func
					strcpy((char*)s2, lb->GetName(id));
				}
				FixModuleName( (char *)s2 );
				wrtbuf->PutStr( (char *)s2 );
			}
			*type = TK_OBJ;
			lb->AddReference( id );
			return (char *)vs;
		}
		if ( chk ) { *type = TK_ERROR; return str; }
		*type = TK_OBJ;
		return str;
	}

	//		�o�^����Ă��Ȃ��L�[���[�h��W�J
	//
	if (wrtbuf!=NULL) {
//		AddModuleName( (char *)s2 );
		if ( strcmp( (char *)s2, fixname ) ) {
			//	���Œ�`����Ă���֐��̌Ăяo���̂��߂�
			//	���W���[������@�����Ă��Ȃ����ʎq�̈ʒu���L�^����
			undefined_symbol_t sym;
			sym.pos = wrtbuf->GetSize();
			sym.len_include_modname = (int)strlen( fixname );
			sym.len = (int)strlen( (char *)s2 );
			undefined_symbols.push_back( sym );
		}
		wrtbuf->PutStr( fixname );
//		wrtbuf->Put( '?' );
	}
	*type = TK_OBJ;
	return (char *)vs;
}


char *CToken::SkipLine( char *str, int *pline )
{
	//		str������s�܂ł��X�L�b�v����
	//		( �s���Ɂu\�v�Ŏ��s��ڑ� )
	//
	unsigned char *vs;
	unsigned char a1;
	unsigned char a2;
	vs = (unsigned char *)str;
	a2=0;
	while(1) {
		a1=*vs;
		if (a1==0) break;
		if (a1==13) {
			pline[0]++;
			vs++;if ( *vs==10 ) vs++;
			if ( a2!=0x5c ) break;
			continue;
		}
		if (a1==10) {
			pline[0]++;
			vs++;
			if ( a2!=0x5c ) break;
			continue;
		}
		if ((a1<32)&&(a1!=9)) break;
		vs++;a2=a1;
	}
	return (char *)vs;
}


char *CToken::SendLineBuf( char *str )
{
	//		�P�s���̃f�[�^��linebuf�ɓ]��
	//
	char *p;
	char *w;
	char a1;
	p = str;
	w = linebuf;
	while(1) {
		a1 = *p;if ( a1==0 ) break;
		p++;
		if ( a1 == 10 ) break;
		if ( a1 == 13 ) {
			if ( *p==10 ) p++;
			break;
		}
		*w++=a1;
	}
	*w=0;
	return p;
}


#define IS_CHAR_HEAD(str, pos) \
	is_sjis_char_head((unsigned char *)(str), (int)((pos) - (unsigned char *)(str)))

char *CToken::SendLineBufPP( char *str, int *lines )
{
	//		�P�s���̃f�[�^��linebuf�ɓ]��
	//			(�s����'\'�͌p�� lines�ɍs����Ԃ�)
	//
	unsigned char *p;
	unsigned char *w;
	unsigned char a1,a2;
	int ln;
	p = (unsigned char *)str;
	w = (unsigned char *)linebuf;
	a2 = 0; ln =0;
	while(1) {
		a1 = *p;if ( a1==0 ) break;
		p++;
		if ( a1 == 10 ) {
			if ( a2==0x5c && IS_CHAR_HEAD(str, p - 2) ) {
				ln++; w--; a2=0; continue;
			}
			break;
		}
		if ( a1 == 13 ) {
			if ( a2==0x5c && IS_CHAR_HEAD(str, p - 2) ) {
				if ( *p==10 ) p++;
				ln++; w--; a2=0; continue;
			}
			if ( *p==10 ) p++;
			break;
		}
		*w++=a1; a2=a1;
	}
	*w=0;
	*lines = ln;
	return (char *)p;
}

#undef IS_CHAR_HEAD


char *CToken::ExpandStrComment2( char *str )
{
	//		"*/" �ŏI�[���Ă��Ȃ��ꍇ�� NULL ��Ԃ�
	//
	int mulstr_bak = mulstr;
	mulstr = LMODE_COMMENT;
	char *result = ExpandStrComment( str, 1 );
	if ( mulstr == LMODE_COMMENT ) {
		result = NULL;
	}
	mulstr = mulstr_bak;
	return result;
}


int CToken::ReplaceLineBuf( char *str1, char *str2, char *repl, int opt, MACDEF *macdef )
{
	//		linebuf�̃L�[���[�h��u������
	//		(linetmp��j�󂵂܂�)
	//			str1 : �u���������L�[���[�h�擪(linebuf��)
	//			str2 : �u���������L�[���[�h��ptr(linebuf��)
	//			repl : �u�������L�[���[�h
	//			macopt : �}�N���Y���̐�
	//
	//		return : 0=ok/1=error
	//
	char *w;
	char *w2;
	char *p;
	char *endp;
	char *prm[32];
	char *prme[32];
	char *last;
	char *macbuf;
	char *macbuf2;
	char a1;
	char dummy[4];
	char mactmp[128];
	int i,flg,type,cnvfnc, tagid, stklevel;
	int macopt, ctype, noprm, kakko;

	i = 0; flg = 1; cnvfnc = 0; ctype = 0; kakko = 0;
	macopt = opt & PRM_MASK;
	if ( opt & PRM_FLAG_CTYPE ) ctype=1;
	*dummy = 0;
	strcpy( linetmp, str2 );
	wp = (unsigned char *)linetmp;
	if (( macopt )||( ctype )) {
		p = (char *)wp; type = GetToken();
		if ( ctype ) {
			if ( type!='(' ) {
#ifdef JPNMSG
				SetError("ctype�}�N���̒���ɂ́A�ۊ��ʂł�����ꂽ�������X�g���K�v�ł�");
#else
				SetError("C-Type macro syntax error");
#endif
				return 4;
			}
			p = (char *)wp; type = GetToken();
		}
		if ( type != TK_NONE ) {
			wp = (unsigned char *)p;
			prm[i]=p;
			while(1) {					// �}�N���p�����[�^�����o��
				p = (char *)wp; type = GetToken();
				if ( type==';' ) type = TK_SEPARATE;
				if ( type=='}' ) type = TK_SEPARATE;
				if ( type=='/' ) {		// C�R�����g??
					if (*wp=='/') { type = TK_SEPARATE; }
					if (*wp=='*') {
						char *start = (char *)wp-1;
						char *end = ExpandStrComment2( start+2 );
						if ( end == NULL ) {	// �͈̓R�����g�����̍s�܂ő����Ă���
							type = TK_SEPARATE;
						} else {
							wp = (unsigned char *)end;
						}
					}
				}
				if ( flg ) {
					flg=0;
					prm[i]=p;
					if ( type == TK_NONE ) {
						prme[i++]=p;
						break;
					}
				}
				if ( type==TK_SEPARATE ) {
					wp = (unsigned char *)p;
					prme[i++]=(char *)wp;
					break;
				}
				if ( wp==NULL ) {
					prme[i++]=NULL; break;
				}
				if ( type==',' ) {
					if ( kakko == 0 ) {	// �J�b�R�Ɉ͂܂�Ă���ꍇ�͖�������
						prme[i]=p;
						flg=1;i++;
					}
				}
				if ( ctype == 0 ) {		// �ʏ펞�̃J�b�R����
					if ( type=='(' ) kakko++;
					if ( type==')' ) kakko--;
				} else {				// C�^�C�v���̃J�b�R����
					if ( type=='(' ) { kakko++; ctype++; }
					if ( type==')' ) {
						kakko--;
						if ( ctype==1 ) {
							wp = (unsigned char *)p;
							prme[i++]=(char *)wp;
							while(1) {
								if ((*wp!=32)&&(*wp!=9)) break;
								wp++;
							}
							*wp = 32;		// ')'��space��
							break;
						}
						ctype--;
					}
				}
			}
		}

		if ( i>macopt ) {
			noprm=1;
			if (( ctype )&&( i==1 )&&( macopt==0 )&&( prm[0] == prme[0] )) noprm=0;
			if ( noprm ) {
#ifdef JPNMSG
				SetError("�}�N���̈������������܂�");
#else
				SetError("too many macro parameters");
#endif
				return 3;
			}
		}
		while(1) {					// �ȗ��p�����[�^��⊮
			if ( i>=macopt ) break;
			prm[i]=dummy; prme[i]=dummy;
			i++;
		}
//		{ int a;for(a=0;a<i;a++) {
//			sprintf( errtmp,"[%d][%s]",a,prm[a] );Alert( errtmp );
//		} }
	}
	last = (char *)wp;

	tagid = 0x10000;
	w = str1;
	wp = (unsigned char *)repl;
	while(1) {					// �}�N���u������
		if ( wp==NULL ) break;
		if ( w>=linetmp ) { SetError("macro buffer overflow"); return 4; }
		a1=*wp++;if (a1==0) break;
		if (a1=='%') {
			if (*wp=='%') { *w++=a1;wp++;continue; }
			type = GetToken();
			if ( type==TK_OBJ ) {			// ����R�}���h���x������
				macbuf = mactmp;
				*mactmp=0; a1 = tolower( (int)*s3 );
				switch( a1 ) {
				case 't':					// %t�^�O��
					tagid = tstack->GetTagID( (char *)(s3+1) );
					break;
				case 'i':
					tstack->GetTagUniqueName( tagid, mactmp );
					tstack->PushTag( tagid, mactmp );
					if ( s3[1]=='0' ) *mactmp=0;
					break;
				case 's':
					val = (int)(s3[1]-48);val--;
					if ( !( 0 <= val && val <= macopt - 1 ) ) {
						SetError("illegal macro parameter %s"); return 2;
					}
					w2 = mactmp;
					p = prm[val]; endp = prme[val];
					if ( p==endp ) {				// �l�ȗ���
						macbuf2 = macdef->data + macdef->index[val];
						while(1) {
							a1=*macbuf2++;if (a1==0) break;
							*w2++ = a1;
						}
					} else {
						while(1) {						// %num�}�N���W�J
							if ( p==endp ) break;
							a1 = *p++;if ( a1==0 ) break;
							*w2++ = a1;
						}
					}
					*w2=0;
					tstack->PushTag( tagid, mactmp );
					*mactmp=0;
					break;
				case 'n':
					tstack->GetTagUniqueName( tagid, mactmp );
					break;
				case 'p':
					stklevel = (int)(s3[1]-48);
					if (( stklevel<0 )||( stklevel>9 )) stklevel=0;
					macbuf = tstack->LookupTag( tagid, stklevel );
					break;
				case 'o':
					if ( s3[1]!='0' ) {
						macbuf = tstack->PopTag( tagid );
					} else {
						tstack->PopTag( tagid );
					}
					break;
				case 'c':
					mactmp[0]=0x0d; mactmp[1]=0x0a; mactmp[2]=0;
					break;
				default:
					macbuf = NULL;
					break;
				}
				if ( macbuf == NULL ) {
					sprintf( mactmp, "macro syntax error [%s]",tstack->GetTagName( tagid ) );
					SetError( mactmp ); return 2;
				}
				while(1) {					//mactmp�W�J
					a1 = *macbuf++;if ( a1==0 ) break;
					*w++ = a1;
				}
				if ( wp!=NULL ) {
					a1=*wp;if (a1==' ') wp++;	// �}�N�����space����
				}
				continue;
			}
			if ( type!=TK_NUM ) { SetError("macro parameter invalid"); return 1; }
			val--;
			if ( !( 0 <= val && val <= macopt - 1 ) ) {
				SetError("illegal macro parameter"); return 2;
			}
			p = prm[val]; endp = prme[val];
			if ( p==endp ) {				// �l�ȗ���
				macbuf = macdef->data + macdef->index[val];
				if ( *macbuf == 0 ) {
#ifdef JPNMSG
					SetError("�f�t�H���g�p�����[�^�̂Ȃ��}�N���̈����͏ȗ��ł��܂���");
#else
					SetError("no default parameter");
#endif
					return 5;
				}
				while(1) {
					a1=*macbuf++;if (a1==0) break;
					*w++ = a1;
				}
				continue;
			}
			while(1) {						// %num�}�N���W�J
				if ( p==endp ) break;
				a1 = *p++;if ( a1==0 ) break;
				*w++ = a1;
			}
			continue;
		}
		*w++ = a1;
	}
	*w = 0;
	if ( last!=NULL ) {
		if ( w + strlen(last) + 1 >= linetmp ) { SetError("macro buffer overflow"); return 4; }
		strcpy( w, last );
	}
	return 0;
}


ppresult_t CToken::PP_SwitchStart( int sw )
{
	if ( swsp==0 ) { swflag = 1; swlevel = LMODE_ON; }
	if ( swsp >= SWSTACK_MAX ) {
		SetError("#if nested too deeply");
		return PPRESULT_ERROR;
	}
	swstack[swsp] = swflag;				// �L���t���O
	swstack2[swsp] = swmode;			// else���[�h
	swstack3[swsp] = swlevel;			// ON/OFF
	swsp++;
	swmode = 0;
	if ( swflag == 0 ) return PPRESULT_SUCCESS;
	if ( sw==0 ) { swlevel = LMODE_OFF; }
			else { swlevel = LMODE_ON; }
	mulstr = swlevel;
	if ( mulstr == LMODE_OFF ) swflag=0;
	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_SwitchEnd( void )
{
	if ( swsp == 0 ) {
		SetError("#endif without #if");
		return PPRESULT_ERROR;
	}
	swsp--;
	swflag = swstack[swsp];
	swmode = swstack2[swsp];
	swlevel = swstack3[swsp];
	if ( swflag ) mulstr = swlevel;
	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_SwitchReverse( void )
{
	if ( swsp == 0 ) {
		SetError("#else without #if");
		return PPRESULT_ERROR;
	}
	if ( swmode != 0 ) {
		SetError("#else after #else");
		return PPRESULT_ERROR;
	}
	if ( swstack[swsp-1] == 0 ) return PPRESULT_SUCCESS;	// ��̃X�^�b�N�������Ȃ疳��
	swmode = 1;
	if ( swlevel == LMODE_ON ) { swlevel = LMODE_OFF; } else { swlevel = LMODE_ON; }
	mulstr = swlevel;
	swflag ^= 1;
	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_Include( int is_addition )
{
	char *word = (char *)s3;
	char tmp_spath[HSP_MAX_PATH];
	int add_bak;
	if ( GetToken() != TK_STRING ) {
		if ( is_addition ) {
			SetError("invalid addition suffix");
		} else {
			SetError("invalid include suffix");
		}
		return PPRESULT_ERROR;
	}
	incinf++;
	if ( incinf > 32 ) {
		SetError("too many include level");
		return PPRESULT_ERROR;
	}
	strcpy( tmp_spath, search_path );
	if ( is_addition ) add_bak = SetAdditionMode( 1 );
	int res = ExpandFile( wrtbuf, word, word );
	if ( is_addition ) SetAdditionMode( add_bak );
	strcpy( search_path, tmp_spath );
	incinf--;
	if (res) {
		if ( is_addition && res == -1 ) return PPRESULT_SUCCESS;
		return PPRESULT_ERROR;
	}
	return PPRESULT_INCLUDED;
}


ppresult_t CToken::PP_Const( void )
{
	//		#const���
	//
	enum ConstType { Indeterminate, Double, Int };
	ConstType valuetype = ConstType::Indeterminate;

	char *word;
	int id, res, glmode;
	char keyword[256];
	char strtmp[512];
	CALCVAR cres;
	glmode = 0;
	word = (char *)s3;
	if ( GetToken() != TK_OBJ ) {
		sprintf( strtmp,"invalid symbol [%s]", word );
		SetError( strtmp ); return PPRESULT_ERROR;
	}

	strcase( word );
	if (tstrcmp(word,"global")) {		// global macro
		if ( GetToken() != TK_OBJ ) {
			SetError( "bad global syntax" ); return PPRESULT_ERROR;
		}
		glmode=1;
		strcase( word );
	}

	// �^�w��L�[���[�h
	if ( tstrcmp(word, "double") ) {
		valuetype = ConstType::Double;
	} else if ( tstrcmp(word, "int") ) {
		valuetype = ConstType::Int;
	}
	if (valuetype != ConstType::Indeterminate) {
		if ( GetToken() != TK_OBJ ) {
			SetError( "bad #const syntax" ); return PPRESULT_ERROR;
		}
		strcase(word);
	}

	strcpy( keyword, word );
	if ( glmode ) FixModuleName( keyword ); else AddModuleName( keyword );
	res = lb->Search( keyword );if ( res != -1 ) {
		SetErrorSymbolOverdefined(keyword, res);
		return PPRESULT_ERROR;
	}

	if ( Calc(cres) ) return PPRESULT_ERROR;

	//		AHT keyword check
	if ( ahtkeyword != NULL ) {

		if ( ahtbuf != NULL ) {						// AHT�o�͎�
			AHTPROP *prop;
			CALCVAR dbval;
			prop = ahtmodel->GetProperty( keyword );
			if ( prop != NULL ) {
				id = lb->Regist( keyword, LAB_TYPE_PPVAL, prop->GetValueInt() );
				if ( cres != floor( cres ) ) {
					dbval = prop->GetValueDouble();
					lb->SetData2( id, (char *)(&dbval), sizeof(CALCVAR) );
				}
				if ( glmode ) lb->SetEternal( id );
				return PPRESULT_SUCCESS;
			}
		} else {									// AHT�ǂݏo����
			if ( cres != floor( cres ) ) {
				ahtmodel->SetPropertyDefaultDouble( keyword, (double)cres );
			} else {
				ahtmodel->SetPropertyDefaultInt( keyword, (int)cres );
			}
			if ( ahtmodel->SetAHTPropertyString( keyword, ahtkeyword ) ) {
				SetError( "AHT parameter syntax error" ); return PPRESULT_ERROR;
			}
		}
	}


	id = lb->Regist( keyword, LAB_TYPE_PPVAL, (int)cres );
	if ( valuetype == ConstType::Double
		|| (valuetype == ConstType::Indeterminate && cres != floor(cres)) ) {
		lb->SetData2( id, (char *)(&cres), sizeof(CALCVAR) );
	}
	if ( glmode ) lb->SetEternal( id );

	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_Enum( void )
{
	//		#enum���
	//
	char *word;
	int id,res,glmode;
	CALCVAR cres;
	char keyword[256];
	char strtmp[512];
	glmode = 0;
	word = (char *)s3;
	if ( GetToken() != TK_OBJ ) {
		sprintf( strtmp,"invalid symbol [%s]", word );
		SetError( strtmp ); return PPRESULT_ERROR;
	}

	strcase( word );
	if (tstrcmp(word,"global")) {		// global macro
		if ( GetToken() != TK_OBJ ) {
			SetError( "bad global syntax" ); return PPRESULT_ERROR;
		}
		glmode=1;
		strcase( word );
	}

	strcpy( keyword, word );
	if ( glmode ) FixModuleName( keyword ); else AddModuleName( keyword );
	res = lb->Search( keyword );if ( res != -1 ) {
		SetErrorSymbolOverdefined(keyword, res);
		return PPRESULT_ERROR;
	}

	if ( GetToken() == '=' ) {
		if ( Calc( cres ) ) return PPRESULT_ERROR;
		enumgc = (int)cres;
	}
	res = enumgc++;
	id = lb->Regist( keyword, LAB_TYPE_PPVAL, res );
	if ( glmode ) lb->SetEternal( id );
	return PPRESULT_SUCCESS;
}


/*
	rev 54
	mingw : warning : ��r�͏�Ɂc
	�ɑΏ��B
*/

char *CToken::CheckValidWord( void )
{
	//		�s���܂łɃR�����g�����邩���ׂ�
	//			( return : �L��������̐擪�|�C���^ )
	//
	char *res;
	char *p;
	char *p2;
	unsigned char a1;
	int qqflg, qqchr;
	res = (char *)wp;
	if ( res == NULL ) return res;
	qqflg = 0;
	p = res;
	while(1) {
		a1 = *p;
		if ( a1==0 ) break;


		if ( qqflg==0 ) {						// �R�����g�����t���O
		
			if ( a1==0x22 ) { qqflg=1; qqchr=a1; }
			if ( a1==0x27 ) { qqflg=1; qqchr=a1; }
			if ( a1==';' ) {						// �R�����g
				*p = 0; break;
			}
			if ( a1=='/' ) {						// C�R�����g
				if (p[1]=='/') {
					*p = 0; break;
				}
				if (p[1]=='*') {
					mulstr = LMODE_COMMENT;
					p2 = ExpandStrComment( (char *)p+2, 1 );
					while(1) {
						if ( p>=p2 ) break;
						*p++=32;			// �R�����g������space��
					}
					continue;
				}
			}
		} else {								// �����񒆂̓R�����g��������
			if (a1==0x5c) {							// '\'�`�F�b�N
				p++; a1 = *p;
				if ( a1>=32 ) p++;
				continue;
			}
			if ( a1==qqchr ) qqflg=0;
		}
		
		p += SkipMultiByte( a1 );			// �S�p�����`�F�b�N
		p++;
	}
	return res;
}


ppresult_t CToken::PP_Define( void )
{
	//		#define���
	//
	char *word;
	char *wdata;
	int id,res,type,prms,flg,glmode,ctype;
	char a1;
	MACDEF *macdef;
	int macptr;
	char *macbuf;
	char keyword[256];
	char strtmp[512];

	glmode = 0; ctype = 0;
	word = (char *)s3;
	if ( GetToken() != TK_OBJ ) {
		sprintf( strtmp,"invalid symbol [%s]", word );
		SetError( strtmp ); return PPRESULT_ERROR;
	}

	strcase( word );
	if (tstrcmp(word,"global")) {		// global macro
		if ( GetToken() != TK_OBJ ) {
			SetError( "bad macro syntax" ); return PPRESULT_ERROR;
		}
		glmode=1;
		strcase( word );
	}
	if (tstrcmp(word,"ctype")) {		// C-type macro
		if ( GetToken() != TK_OBJ ) {
			SetError( "bad macro syntax" ); return PPRESULT_ERROR;
		}
		ctype=1;
		strcase( word );
		if (tstrcmp(word, "global")) {		// global macro
			if (GetToken() != TK_OBJ || glmode==1) {
				SetError("bad macro syntax"); return PPRESULT_ERROR;
			}
			glmode = 1;
			strcase(word);
		}
	}
	strcpy( keyword, word );
	if ( glmode ) FixModuleName( keyword ); else AddModuleName( keyword );
	res = lb->Search( keyword );if ( res != -1 ) {
		SetErrorSymbolOverdefined(keyword, res);
		return PPRESULT_ERROR;
	}
	
	//		skip space,tab code
	if ( wp==NULL ) a1=0;
	else {
		a1 = *wp;
		if (a1!='(') a1=0;
	}

	if ( a1==0 ) {					// no parameters
		prms = 0;
		if ( ctype ) prms|=PRM_FLAG_CTYPE;
		wdata = CheckValidWord();

		//		AHT keyword check
		if ( ahtkeyword != NULL ) {
			if ( ahtbuf != NULL ) {						// AHT�o�͎�
				AHTPROP *prop;
				prop = ahtmodel->GetProperty( keyword );
				if ( prop != NULL ) wdata = prop->GetOutValue();
			} else {									// AHT�ǂݍ��ݎ�
				AHTPROP *prop;
				prop = ahtmodel->SetPropertyDefault( keyword, wdata );
				if ( ahtmodel->SetAHTPropertyString( keyword, ahtkeyword ) ) {
					SetError( "AHT parameter syntax error" ); return PPRESULT_ERROR;
				}
				if ( prop->ahtmode & AHTMODE_OUTPUT_RAW ) {
					ahtmodel->SetPropertyDefaultStr( keyword, wdata );
				}
			}
		}

		id = lb->Regist( keyword, LAB_TYPE_PPMAC, prms );
		lb->SetData( id, wdata );
		if ( glmode ) lb->SetEternal( id );

		return PPRESULT_SUCCESS;
	}

	//		�p�����[�^��`�擾
	//
	macdef = (MACDEF *)linetmp;
	macdef->data[0] = 0;
	macptr = 1;				// �f�t�H���g�}�N���f�[�^�Q�ƃI�t�Z�b�g
	wp++;
	prms=0; flg=0;
	while(1) {
		if ( wp==NULL ) goto bad_macro_param_expr;
		a1 = *wp++;
		if ( a1==')' ) {
			if ( flg==0 ) goto bad_macro_param_expr;
			prms++;
			break;
		}
		switch( a1 ) {
		case 9:
		case 32:
			break;
		case ',':
			if ( flg==0 ) goto bad_macro_param_expr;
			prms++;flg=0;
			break;
		case '%':
			if ( flg!=0 ) goto bad_macro_param_expr;
			type = GetToken();
			if ( type != TK_NUM ) goto bad_macro_param_expr;
			if ( val != (prms+1) ) goto bad_macro_param_expr;
			flg = 1;
			macdef->index[prms] = 0;			// �f�t�H���g(�����l�Ȃ�)
			break;
		case '=':
			if ( flg!=1 ) goto bad_macro_param_expr;
			flg = 2;
			macdef->index[prms] = macptr;		// �����l�|�C���^�̐ݒ�
			type = GetToken();
			switch(type) {
			case TK_NUM:
#ifdef HSPWIN
				_itoa( val, word, 10 );
#else
				sprintf( word, "%d", val );
#endif
				break;
			case TK_DNUM:
				strcpy( word, (char *)s3 );
				break;
			case TK_STRING:
				sprintf( strtmp,"\"%s\"", word );
				strcpy( word, strtmp );
				break;
			case TK_OBJ:
				break;
			case '-':
				type = GetToken();
				if ( type == TK_DNUM ) {
					sprintf( strtmp,"-%s", s3 );
					strcpy( word, strtmp );
					break;
				}
				if ( type != TK_NUM ) {
					SetError("bad default value");
					return PPRESULT_ERROR;
				}
				//_itoa( val, word, 10 );
				sprintf( word,"-%d",val );
				break;
			default:
				SetError("bad default value");
				return PPRESULT_ERROR;
			}
			macbuf = (macdef->data) + macptr;
			res = (int)strlen( word );
			strcpy( macbuf, word );
			macptr+=res+1;
			break;
		default:
			goto bad_macro_param_expr;
		}
	}

	//		skip space,tab code
	if ( wp==NULL ) a1=0; else {
		while(1) {
			a1=*wp;if (a1==0) break;
			if ( (a1!=9)&&(a1!=32) ) break;
			wp++;
		}
	}
	if ( a1 == 0 ) { SetError("macro contains no data"); return PPRESULT_ERROR; }
	if ( ctype ) prms|=PRM_FLAG_CTYPE;

	//		�f�[�^��`
	id = lb->Regist( keyword, LAB_TYPE_PPMAC, prms );
	wdata = CheckValidWord();
	lb->SetData( id, wdata );
	lb->SetData2( id, (char *)macdef, macptr+sizeof(macdef->index) );
	if ( glmode ) lb->SetEternal( id );

	//sprintf( keyword,"[%d]-[%s]",id,wdata );Alert( keyword );
	return PPRESULT_SUCCESS;

bad_macro_param_expr:
	SetError("bad macro parameter expression");
	return PPRESULT_ERROR;
}


ppresult_t CToken::PP_Defcfunc( int mode )
{
	//		#defcfunc���
	//			mode : 0 = �ʏ�cfunc
	//			       1 = modcfunc
	//
	int i,id;
	char *word;
	char *mod;
	char fixname[128];
	int glmode, premode;

	word = (char *)s3;
	mod = GetModuleName();
	id = -1; glmode = 0; premode = LAB_TYPE_PPMODFUNC;

	i = GetToken();
	if ( i == TK_OBJ ) {
		strcase( word );
		if (tstrcmp(word,"local")) {		// local option
			if ( *mod == 0 ) { SetError("module name not found"); return PPRESULT_ERROR; }
			glmode = 1;
			i = GetToken();
		}
		if (tstrcmp(word,"prep")) {			// prepare option
			premode = LAB_TYPE_PP_PREMODFUNC;
			i = GetToken();
		}
	}

	strcase2( word, fixname );
	if ( i != TK_OBJ ) { SetError("invalid func name"); return PPRESULT_ERROR; }
	i = lb->Search( fixname );if ( i != -1 ) {
		if ( lb->GetFlag(i) != LAB_TYPE_PP_PREMODFUNC ) {
			SetErrorSymbolOverdefined(fixname, i); return PPRESULT_ERROR;
		}
		id = i;
	}

	if ( glmode ) AddModuleName( fixname );

	if ( premode == LAB_TYPE_PP_PREMODFUNC ) {
		wrtbuf->PutStrf( "#defcfunc prep %s ",fixname );
	} else {
		wrtbuf->PutStrf( "#defcfunc %s ",fixname );
	}

	if ( id == -1 ) {
		id = lb->Regist( fixname, premode, 0 );
		if ( glmode == 0 ) lb->SetEternal( id );
		if ( *mod != 0 ) { lb->AddRelation( mod, id ); }		// ���W���[�����x���Ɉˑ���ǉ�
	} else {
		lb->SetFlag( id, premode );
	}

	if ( mode ) {
		if ( mode == 1 ) {
			wrtbuf->PutStr( "modvar " );
		} else {
			wrtbuf->PutStr( "modinit " );
		}
		if ( *mod == 0 ) { SetError("module name not found"); return PPRESULT_ERROR; }
		wrtbuf->PutStr( mod );
		if ( wp != NULL ) wrtbuf->Put( ',' );
	}

	/*
	char resname[512];
	i = GetToken();
	if ( i != TK_OBJ ) { SetError("invalid result name"); return PPRESULT_ERROR; }
	strcpy( resname, word );
	*/

	while(1) {

		i = GetToken();
		if ( i == TK_OBJ ) {
			wrtbuf->PutStr( word );
		}
		if ( wp == NULL ) break;
		if ( i != TK_OBJ ) {
			SetError("invalid func param"); return PPRESULT_ERROR;
		}

		i = GetToken();
		if ( i == TK_OBJ ) {
			strcase2( word, fixname );
			AddModuleName( fixname );
			wrtbuf->Put( ' ' );
			wrtbuf->PutStr( fixname );
			i = GetToken();
		}
		if ( wp == NULL ) break;
		if ( i != ',' ) {
			SetError("invalid func param"); return PPRESULT_ERROR;
		}
		wrtbuf->Put( ',' );

	}

	//wrtbuf->PutStr( linebuf );
	wrtbuf->PutCR();
	//
	return PPRESULT_WROTE_LINE;
}


ppresult_t CToken::PP_Deffunc( int mode )
{
	//		#deffunc���
	//			mode : 0 = �ʏ�func
	//			       1 = modfunc
	//			       2 = modinit
	//			       3 = modterm
	int i,id;
	char *word;
	char *mod;
	char fixname[128];
	int glmode, premode;

	word = (char *)s3;
	mod = GetModuleName();
	id = -1; glmode = 0; premode = LAB_TYPE_PPMODFUNC;

	if ( mode < 2 ) {
		i = GetToken();
		if ( i == TK_OBJ ) {
			strcase( word );
			if (tstrcmp(word,"local")) {		// local option
				if ( *mod == 0 ) { SetError("module name not found"); return PPRESULT_ERROR; }
				glmode = 1;
				i = GetToken();
			}
			if (tstrcmp(word,"prep")) {			// prepare option
				premode = LAB_TYPE_PP_PREMODFUNC;
				i = GetToken();
			}
		}

		strcase2( word, fixname );
		if ( i != TK_OBJ ) { SetError("invalid func name"); return PPRESULT_ERROR; }
		i = lb->Search( fixname );if ( i != -1 ) {
			if ( lb->GetFlag(i) != LAB_TYPE_PP_PREMODFUNC ) {
				SetErrorSymbolOverdefined(fixname, i); return PPRESULT_ERROR;
			}
			id = i;
		}

		if ( glmode ) AddModuleName( fixname );

		if ( premode == LAB_TYPE_PP_PREMODFUNC ) {
			wrtbuf->PutStrf( "#deffunc prep %s ",fixname );
		} else {
			wrtbuf->PutStrf( "#deffunc %s ",fixname );
		}

		if ( id == -1 ) {
			id = lb->Regist( fixname, premode, 0 );
			if ( glmode == 0 ) lb->SetEternal( id );
			if ( *mod != 0 ) { lb->AddRelation( mod, id ); }		// ���W���[�����x���Ɉˑ���ǉ�
		} else {
			lb->SetFlag( id, premode );
		}

		if ( mode ) {
			wrtbuf->PutStr( "modvar " );
			if ( *mod == 0 ) { SetError("module name not found"); return PPRESULT_ERROR; }
			wrtbuf->PutStr( mod );
			if ( wp != NULL ) wrtbuf->Put( ',' );
		}

	} else {
		if ( mode == 2 ) {
			wrtbuf->PutStr( "#deffunc __init modinit " );
		} else {
			wrtbuf->PutStr( "#deffunc __term modterm " );
		}
		if ( *mod == 0 ) { SetError("module name not found"); return PPRESULT_ERROR; }
		wrtbuf->PutStr( mod );
		if ( wp != NULL ) wrtbuf->Put( ',' );
	}

	while(1) {

		i = GetToken();
		if ( i == TK_OBJ ) {
			wrtbuf->PutStr( word );
			strcase( word );
			if (tstrcmp(word,"onexit")) {							// onexit�͎Q�ƍς݂ɂ���
				lb->AddReference( id );
			}
		}

		if ( wp == NULL ) break;
		if ( i != TK_OBJ ) {
			SetError("invalid func param"); return PPRESULT_ERROR;
		}

		i = GetToken();
		if ( i == TK_OBJ ) {
			strcase2( word, fixname );
			AddModuleName( fixname );
			wrtbuf->Put( ' ' );
			wrtbuf->PutStr( fixname );
			i = GetToken();
		}
		if ( wp == NULL ) break;
		if ( i != ',' ) {
			SetError("invalid func param"); return PPRESULT_ERROR;
		}
		wrtbuf->Put( ',' );

	}

	//wrtbuf->PutStr( linebuf );
	wrtbuf->PutCR();
	//
	return PPRESULT_WROTE_LINE;
}


ppresult_t CToken::PP_Struct( void )
{
	//		#struct���
	//
	char *word;
	int i;
	int id,res,glmode;
	char keyword[256];
	char tagname[256];
	char strtmp[0x4000];
	glmode = 0;
	word = (char *)s3;
	if ( GetToken() != TK_OBJ ) {
		sprintf( strtmp,"invalid symbol [%s]", word );
		SetError( strtmp ); return PPRESULT_ERROR;
	}

	strcase( word );
	if (tstrcmp(word,"global")) {		// global macro
		if ( GetToken() != TK_OBJ ) {
			SetError( "bad global syntax" ); return PPRESULT_ERROR;
		}
		glmode=1;
		strcase( word );
	}

	strcpy( tagname, word );
	if ( glmode ) FixModuleName( tagname ); else AddModuleName( tagname );
	res = lb->Search( tagname );
	if ( res != -1 ) { SetErrorSymbolOverdefined(tagname, res); return PPRESULT_ERROR; }
	id = lb->Regist( tagname, LAB_TYPE_PPDLLFUNC, 0 );
	if ( glmode ) lb->SetEternal( id );

	wrtbuf->PutStrf( "#struct %s ",tagname );

	while(1) {

		i = GetToken();
		if ( wp == NULL ) break;
		if ( i != TK_OBJ ) { SetError("invalid struct param"); return PPRESULT_ERROR; }
		wrtbuf->PutStr( word );
		wrtbuf->Put( ' ' );

		i = GetToken();
		if ( i != TK_OBJ ) { SetError("invalid struct param"); return PPRESULT_ERROR; }

		sprintf( keyword,"%s_%s", tagname, word );
		if ( glmode ) FixModuleName( keyword ); else AddModuleName( keyword );
		res = lb->Search( keyword );
		if ( res != -1 ) { SetErrorSymbolOverdefined(keyword, res); return PPRESULT_ERROR; }
		id = lb->Regist( keyword, LAB_TYPE_PPDLLFUNC, 0 );
		if ( glmode ) lb->SetEternal( id );
		wrtbuf->PutStr( keyword );

		i = GetToken();
		if ( wp == NULL ) break;
		if ( i != ',' ) {
			SetError("invalid struct param"); return PPRESULT_ERROR;
		}
		wrtbuf->Put( ',' );

	}

	wrtbuf->PutCR();
	return PPRESULT_WROTE_LINE;
}


ppresult_t CToken::PP_Func( char *name )
{
	//		#func���
	//
	int i, id;
	int glmode;
	char *word;
	word = (char *)s3;
	i = GetToken();
	if ( i != TK_OBJ ) { SetError("invalid func name"); return PPRESULT_ERROR; }

	glmode = 0;
	strcase( word );
	if (tstrcmp(word,"global")) {		// global macro
		if ( GetToken() != TK_OBJ ) {
			SetError( "bad global syntax" ); return PPRESULT_ERROR;
		}
		glmode=1;
	}

	if ( glmode ) FixModuleName( word ); else AddModuleName( word );
	//AddModuleName( word );
	i = lb->Search( word );
	if ( i != -1 ) { SetErrorSymbolOverdefined(word, i); return PPRESULT_ERROR; }
	id = lb->Regist( word, LAB_TYPE_PPDLLFUNC, 0 );
	if ( glmode ) lb->SetEternal( id );
	//
	wrtbuf->PutStrf( "#%s %s%s",name, word, (char *)wp );
	wrtbuf->PutCR();
	//
	return PPRESULT_WROTE_LINE;
}


ppresult_t CToken::PP_Cmd( char *name )
{
	//		#cmd���
	//
	int i, id;
	char *word;
	word = (char *)s3;
	i = GetToken();
	if ( i != TK_OBJ ) { SetError("invalid func name"); return PPRESULT_ERROR; }
	i = lb->Search( word );
	if ( i != -1 ) { SetErrorSymbolOverdefined(word, i); return PPRESULT_ERROR; }

	id = lb->Regist( word, LAB_TYPE_PPINTMAC, 0 );		// �����}�N���Ƃ��Ē�`
	strcat( word, "@hsp" );
	lb->SetData( id, word );
	lb->SetEternal( id );

	//AddModuleName( word );
	//id = lb->Regist( word, LAB_TYPE_PPDLLFUNC, 0 );
	//lb->SetEternal( id );
	//
	wrtbuf->PutStrf( "#%s %s%s",name, word, (char *)wp );
	wrtbuf->PutCR();
	//
	return PPRESULT_WROTE_LINE;
}


ppresult_t CToken::PP_Usecom( void )
{
	//		#usecom���
	//
	int i, id;
	int glmode;
	char *word;
	word = (char *)s3;
	i = GetToken();
	if ( i != TK_OBJ ) { SetError("invalid COM symbol name"); return PPRESULT_ERROR; }

	glmode = 0;
	strcase( word );
	if (tstrcmp(word,"global")) {		// global macro
		if ( GetToken() != TK_OBJ ) {
			SetError( "bad global syntax" ); return PPRESULT_ERROR;
		}
		glmode=1;
	}

	i = lb->Search( word );
	if ( i != -1 ) { SetErrorSymbolOverdefined(word, i); return PPRESULT_ERROR; }
	if ( glmode ) FixModuleName( word ); else AddModuleName( word );
	id = lb->Regist( word, LAB_TYPE_COMVAR, 0 );
	if ( glmode ) lb->SetEternal( id );
	//
	wrtbuf->PutStrf( "#usecom %s%s",word, (char *)wp );
	wrtbuf->PutCR();
	//
	return PPRESULT_WROTE_LINE;
}


ppresult_t CToken::PP_Module( void )
{
	//		#module���
	//
	int res,i,id,fl;
	char *word;
	char tagname[MODNAME_MAX+1];
	//char tmp[0x4000];

	word = (char *)s3; fl = 0;
	i = GetToken();
	if (( i == TK_OBJ )||( i == TK_STRING )) fl=1;
	if ( i == TK_NONE ) { sprintf( word, "M%d", modgc ); modgc++; fl=1; }
	if ( fl == 0 ) { SetError("invalid module name"); return PPRESULT_ERROR; }
	if ( !IsGlobalMode() ) { SetError("not in global mode"); return PPRESULT_ERROR; }
	if ( CheckModuleName( word ) ) {
		SetError("bad module name"); return PPRESULT_ERROR;
	}
	sprintf( tagname, "%.*s", MODNAME_MAX, word );
	res = lb->Search( tagname );
	if ( res != -1 ) { SetErrorSymbolOverdefined(tagname, res); return PPRESULT_ERROR; }
	id = lb->Regist( tagname, LAB_TYPE_PPDLLFUNC, 0 );
	lb->SetEternal( id );
	SetModuleName( tagname );

	wrtbuf->PutStrf( "#module %s",tagname );
	wrtbuf->PutCR();
	wrtbuf->PutStrf( "goto@hsp *_%s_exit",tagname );
	wrtbuf->PutCR();

	if ( PeekToken() != TK_NONE ) {
	  wrtbuf->PutStrf( "#struct %s ",tagname );
	  while(1) {

		i = GetToken();
		if ( i != TK_OBJ ) { SetError("invalid module param"); return PPRESULT_ERROR; }
		AddModuleName( word );
		res = lb->Search(word);
		if ( res != -1 ) { SetErrorSymbolOverdefined(word, res); return PPRESULT_ERROR; }
		id = lb->Regist( word, LAB_TYPE_PPDLLFUNC, 0 );
		wrtbuf->PutStr( "var " );
		wrtbuf->PutStr( word );

		i = GetToken();
		if ( wp == NULL ) break;
		if ( i != ',' ) {
			SetError("invalid module param"); return PPRESULT_ERROR;
		}
		wrtbuf->Put( ',' );
	  }
	  wrtbuf->PutCR();
	}

	return PPRESULT_WROTE_LINES;
}


ppresult_t CToken::PP_Global( void )
{
	//		#global���
	//
	if ( IsGlobalMode() ) {
#ifdef JPNMSG
		SetError("#module �ƑΉ����Ă��Ȃ� #global ������܂�");
#else
		SetError("already in global mode");
#endif
		return PPRESULT_ERROR;
	}
	//
	wrtbuf->PutStrf( "*_%s_exit",GetModuleName() );
	wrtbuf->PutCR();
	wrtbuf->PutStr( "#global" );
	wrtbuf->PutCR();
	SetModuleName( "" );
	return PPRESULT_WROTE_LINES;
}


ppresult_t CToken::PP_Aht( void )
{
	//		#aht���
	//
	int i;
	char tmp[512];
	if ( ahtmodel == NULL ) return PPRESULT_SUCCESS;
	if ( ahtbuf != NULL ) return PPRESULT_SUCCESS;					// AHT�o�͎��͖�������

	i = GetToken();
	if ( i != TK_OBJ ) {
		SetError("invalid AHT option name"); return PPRESULT_ERROR;
	}
	strcpy2( tmp, (char *)s3, 512 );
	i = GetToken();
	if (( i != TK_STRING )&&( i != TK_NUM )) {
		SetError("invalid AHT option value"); return PPRESULT_ERROR;
	}
	ahtmodel->SetAHTOption( tmp, (char *)s3 );

	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_Ahtout( void )
{
	//		#ahtout���
	//
	if ( ahtmodel == NULL ) return PPRESULT_SUCCESS;
	if ( ahtbuf == NULL ) return PPRESULT_SUCCESS;
	if ( wp == NULL ) return PPRESULT_SUCCESS;

	ahtbuf->PutStr( (char *)wp );
	ahtbuf->PutCR();
	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_Ahtmes( void )
{
	//		#ahtmes���
	//
	int i;
	int addprm;

	if ( ahtmodel == NULL ) return PPRESULT_SUCCESS;
	if ( ahtbuf == NULL ) return PPRESULT_SUCCESS;
	if ( wp == NULL ) return PPRESULT_SUCCESS;
	addprm = 0;

	while(1) {

		if ( wp == NULL ) break;

		i = GetToken();
		if ( i == TK_NONE ) break;
		if (( i != TK_OBJ )&&( i != TK_NUM )&&( i != TK_STRING )) {
			SetError("illegal ahtmes parameter"); return PPRESULT_ERROR;
		}
		ahtbuf->PutStr( (char *)s3 );

		if ( wp == NULL ) {	addprm = 0; break; }

		i = GetToken();
		if ( i != '+' ) { SetError("invalid ahtmes format"); return PPRESULT_ERROR; }
		addprm++;

	}
	if ( addprm == 0 ) ahtbuf->PutCR();
	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_Pack( int mode )
{
	//		#pack,#epack���
	//			(mode:0=normal/1=encrypt)
	int i;
	if ( packbuf!=NULL ) {
		i = GetToken();
		if ( i != TK_STRING ) {
			SetError("invalid pack name"); return PPRESULT_ERROR;
		}
		AddPackfile( (char *)s3, mode );
	}
	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_PackOpt( void )
{
	//		#packopt���
	//
	int i;
	char tmp[1024];
	char optname[1024];
	if ( packbuf!=NULL ) {
		i = GetToken();
		if ( i != TK_OBJ ) {
			SetError("illegal option name"); return PPRESULT_ERROR;
		}
		strncpy( optname, (char *)s3, 128 );
		i = GetToken();
		if (( i != TK_OBJ )&&( i != TK_NUM )&&( i != TK_STRING )) {
			SetError("illegal option parameter"); return PPRESULT_ERROR;
		}
		sprintf( tmp, ";!%s=%s", optname, (char *)s3 );
		AddPackfile( tmp, 2 );
	}
	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_CmpOpt( void )
{
	//		#cmpopt���
	//
	int i;
	char optname[1024];

	i = GetToken();
	if ( i != TK_OBJ ) {
		SetError("illegal option name"); return PPRESULT_ERROR;
	}
	strcase2( (char *)s3, optname );

	i = GetToken();
	if ( i != TK_NUM ) {
		SetError("illegal option parameter"); return PPRESULT_ERROR;
	}

	i = 0;
	if (tstrcmp(optname,"ppout")) {			// preprocessor out sw
		i = CMPMODE_PPOUT;
	}
	if (tstrcmp(optname,"optcode")) {		// code optimization sw
		i = CMPMODE_OPTCODE;
	}
	if (tstrcmp(optname,"case")) {			// case sensitive sw
		i = CMPMODE_CASE;
	}
	if (tstrcmp(optname,"optinfo")) {		// optimization info sw
		i = CMPMODE_OPTINFO;
	}
	if (tstrcmp(optname,"varname")) {		// VAR name out sw
		i = CMPMODE_PUTVARS;
	}
	if (tstrcmp(optname,"varinit")) {		// VAR initalize check
		i = CMPMODE_VARINIT;
	}
	if (tstrcmp(optname,"optprm")) {		// parameter optimization sw
		i = CMPMODE_OPTPRM;
	}
	if (tstrcmp(optname,"skipjpspc")) {		// skip Japanese Space Code sw
		i = CMPMODE_SKIPJPSPC;
	}
	if (tstrcmp(optname,"utf8")) {			// UTF-8 string output sw
		i = CMPMODE_UTF8OUT;
	}

	if ( i == 0 ) {
		SetError("illegal option name"); return PPRESULT_ERROR;
	}

	if ( val ) {
		hed_cmpmode |= i;
	} else {
		hed_cmpmode &= ~i;
	}
	//Alertf("%s(%d)",optname,val);
	//wrtbuf->PutCR();
	return PPRESULT_SUCCESS;
}


ppresult_t CToken::PP_RuntimeOpt( void )
{
	//		#runtime���
	//
	int i;
	char tmp[1024];

	i = GetToken();
	if ( i != TK_STRING ) {
		SetError("illegal runtime name"); return PPRESULT_ERROR;
	}
	strncpy( hed_runtime, (char *)s3, sizeof hed_runtime );
	hed_runtime[sizeof hed_runtime - 1] = '\0';

	if ( packbuf!=NULL ) {
		sprintf( tmp, ";!runtime=%s.hrt", hed_runtime );
		AddPackfile( tmp, 2 );
	}

	hed_option |= HEDINFO_RUNTIME;

	sprintf(tmp, "\"%s\"", hed_runtime);
	RegistExtMacro("__runtime__", tmp);			// �����^�C�����}�N�����X�V

	return PPRESULT_SUCCESS;
}



ppresult_t CToken::PP_BootOpt(void)
{
	//		#bootopt���
	//
	int i;
	char optname[1024];

	i = GetToken();
	if (i != TK_OBJ) {
		SetError("illegal option name"); return PPRESULT_ERROR;
	}
	strcase2((char *)s3, optname);

	i = GetToken();
	if (i != TK_NUM) {
		SetError("illegal option parameter"); return PPRESULT_ERROR;
	}

	i = 0;
	if (tstrcmp(optname, "notimer")) {			// No MMTimer sw
		i = HEDINFO_NOMMTIMER;
		hed_autoopt_timer = -1;
	}
	if (tstrcmp(optname, "nogdip")) {			// No GDI+ sw
		i = HEDINFO_NOGDIP;
	}
	if (tstrcmp(optname, "float32")) {			// float32 sw
		i = HEDINFO_FLOAT32;
	}
	if (tstrcmp(optname, "orgrnd")) {			// standard random sw
		i = HEDINFO_ORGRND;
	}
	if (tstrcmp(optname, "utf8")) {				// UTF-8 string sw
		i = HEDINFO_UTF8;
	}
	if (tstrcmp(optname, "hsp64")) {			// 64bit runtime sw
		i = HEDINFO_HSP64;
	}
	if (tstrcmp(optname, "ioresume")) {			// File I/O resume sw
		i = HEDINFO_IORESUME;
	}

	if (i == 0) {
		SetError("illegal option name"); return PPRESULT_ERROR;
	}

	if (val) {
		hed_option |= i;
	}
	else {
		hed_option &= ~i;
	}
	return PPRESULT_SUCCESS;
}




void CToken::PreprocessCommentCheck( char *str )
{
	int qmode;
	unsigned char *vs;
	unsigned char a1;
	vs = (unsigned char *)str;
	qmode = 0;

	while(1) {
		a1=*vs++;
		if (a1==0) break;
		if ( qmode == 0 ) {
			if (( a1 == ';' )&&( *vs == ';' )) {
				vs++;
				ahtkeyword = (char *)vs;
			}
		}
		if (a1==0x22) qmode^=1;
		vs += SkipMultiByte( a1 );			// �S�p�����`�F�b�N
	}
}


ppresult_t CToken::PreprocessNM( char *str )
{
	//		�v���v���Z�X�̎��s(�}�N���W�J�Ȃ�)
	//
	char *word;
	int id,type;
	ppresult_t res;
	char fixname[128];

	word = (char *)s3;
	wp = (unsigned char *)str;
	unsigned char topUChar = *wp;
	*s3 = 0;

	if ( ahtmodel != NULL ) {
		PreprocessCommentCheck( str );
	}

	type = GetToken();
	if ( topUChar != *s3 ) return PPRESULT_UNKNOWN_DIRECTIVE;
	if ( type != TK_OBJ ) return PPRESULT_UNKNOWN_DIRECTIVE;

	//		�\�[�X�����R���g���[��
	//
	if (tstrcmp(word,"ifdef")) {		// generate control
		if ( mulstr == LMODE_OFF ) {
			res = PP_SwitchStart( 0 );
		} else {
			res = PPRESULT_ERROR; type = GetToken();
			if ( type == TK_OBJ ) {
				strcase2( word, fixname );
				AddModuleName( fixname );
				id = lb->SearchLocal( word, fixname );

				//id = lb->Search( word );
				res = PP_SwitchStart( (id!=-1) );
			}
		}
		return res;
	}
	if (tstrcmp(word,"ifndef")) {		// generate control
		if ( mulstr == LMODE_OFF ) {
			res = PP_SwitchStart( 0 );
		} else {
			res = PPRESULT_ERROR; type = GetToken();
			if ( type == TK_OBJ ) {
				strcase2( word, fixname );
				AddModuleName( fixname );
				id = lb->SearchLocal( word, fixname );

				//id = lb->Search( word );
				res = PP_SwitchStart( (id==-1) );
			}
		}
		return res;
	}
	if (tstrcmp(word,"else")) {			// generate control
		return PP_SwitchReverse();
	}
	if (tstrcmp(word,"endif")) {		// generate control
		return PP_SwitchEnd();
	}

	//		����ȍ~��#off���Ɏ��s���܂���
	//
	if ( mulstr == LMODE_OFF ) { return PPRESULT_UNKNOWN_DIRECTIVE; }

	if (tstrcmp(word,"define")) {		// keyword define
		return PP_Define();
	}

	if (tstrcmp(word,"undef")) {		// keyword terminate
		if ( GetToken() != TK_OBJ ) {
			SetError("invalid symbol");
			return PPRESULT_ERROR;
		}

		strcase2( word, fixname );
		AddModuleName( fixname );
		id = lb->SearchLocal( word, fixname );

		//id = lb->Search( word );
		if ( id >= 0 ) {
			lb->SetFlag( id, -1 );
		}
		return PPRESULT_SUCCESS;
	}

	return PPRESULT_UNKNOWN_DIRECTIVE;
}


ppresult_t CToken::Preprocess( char *str )
{
	//		�v���v���Z�X�̎��s
	//
	char *word;
	int type,a;
	ppresult_t res;
	CALCVAR cres;

	word = (char *)s3;
	*s3 = 0;
	wp = (unsigned char *)str;
	unsigned char topUChar = *wp;

	type = GetToken();
	if (topUChar != *s3) {
		type = TK_NONE;
	}
	//		�\�[�X�����R���g���[��
	//
	if (type == TK_OBJ) {
		if (tstrcmp(word, "if")) {			// generate control
			if (mulstr == LMODE_OFF) {
				res = PP_SwitchStart(0);
			}
			else {
				res = PPRESULT_SUCCESS;
				if (Calc(cres) == 0) {
					a = (int)cres;
					res = PP_SwitchStart(a);
				}
				else res = PPRESULT_ERROR;
			}
			return res;
		}

	}
	//		����ȍ~��#off���Ɏ��s���܂���
	//
	if (mulstr == LMODE_OFF) { return PPRESULT_SUCCESS; }

	//		�R�[�h�����R���g���[��
	//
	if (type == TK_OBJ) {
		if (tstrcmp(word, "include")) {		// text include
			res = PP_Include(0);
			return res;
		}
		if (tstrcmp(word, "addition")) {		// text include
			res = PP_Include(1);
			return res;
		}
		if (tstrcmp(word, "const")) {		// constant define
			res = PP_Const();
			return res;
		}
		if (tstrcmp(word, "enum")) {			// constant enum define
			res = PP_Enum();
			return res;
		}
		/*
			if (tstrcmp(word,"define")) {		// keyword define
				res = PP_Define();
				if ( res==6 ) SetError("bad macro parameter expression");
				return res;
			}
		*/
		if (tstrcmp(word, "module")) {		// module define
			res = PP_Module();
			return res;
		}
		if (tstrcmp(word, "global")) {		// module exit
			res = PP_Global();
			return res;
		}
		if (tstrcmp(word, "deffunc")) {		// module function
			res = PP_Deffunc(0);
			return res;
		}
		if (tstrcmp(word, "defcfunc")) {		// module function (1)
			res = PP_Defcfunc(0);
			return res;
		}
		if (tstrcmp(word, "modfunc")) {		// module function (2)
			res = PP_Deffunc(1);
			return res;
		}
		if (tstrcmp(word, "modcfunc")) {		// module function (2+)
			res = PP_Defcfunc(1);
			return res;
		}
		if (tstrcmp(word, "modinit")) {		// module function (3)
			res = PP_Deffunc(2);
			return res;
		}
		if (tstrcmp(word, "modterm")) {		// module function (4)
			res = PP_Deffunc(3);
			return res;
		}
		if (tstrcmp(word, "struct")) {		// struct define
			res = PP_Struct();
			return res;
		}
		if (tstrcmp(word, "func")) {			// DLL function
			res = PP_Func("func");
			return res;
		}
		if (tstrcmp(word, "cfunc")) {		// DLL function
			res = PP_Func("cfunc");
			return res;
		}
		if (tstrcmp(word, "cmd")) {			// DLL function (3.0)
			res = PP_Cmd("cmd");
			return res;
		}
		/*
			if (tstrcmp(word,"func2")) {		// DLL function (2)
				res = PP_Func( "func2" );
				return res;
			}
		*/
		if (tstrcmp(word, "comfunc")) {		// COM Object function
			res = PP_Func("comfunc");
			return res;
		}
		if (tstrcmp(word, "aht")) {			// AHT definition
			res = PP_Aht();
			return res;
		}
		if (tstrcmp(word, "ahtout")) {		// AHT command line output
			res = PP_Ahtout();
			return res;
		}
		if (tstrcmp(word, "ahtmes")) {		// AHT command line output (mes)
			res = PP_Ahtmes();
			return res;
		}
		if (tstrcmp(word, "pack")) {			// packfile process
			res = PP_Pack(0);
			return res;
		}
		if (tstrcmp(word, "epack")) {		// packfile process
			res = PP_Pack(1);
			return res;
		}
		if (tstrcmp(word, "packopt")) {		// packfile process
			res = PP_PackOpt();
			return res;
		}
		if (tstrcmp(word, "runtime")) {		// runtime process
			res = PP_RuntimeOpt();
			return res;
		}
		if (tstrcmp(word, "bootopt")) {		// boot option process
			res = PP_BootOpt();
			return res;
		}
		if (tstrcmp(word, "cmpopt")) {		// compile option process
			res = PP_CmpOpt();
			return res;
		}
		if (tstrcmp(word, "usecom")) {		// COM definition
			res = PP_Usecom();
			return res;
		}
	}
	//		�o�^�L�[���[�h�ȊO�̓R���p�C���ɓn��
	//
	wrtbuf->Put( (char)'#' );
	wrtbuf->PutStr( linebuf );
	wrtbuf->PutCR();
	//wrtbuf->PutStr( (char *)s3 );
	return PPRESULT_WROTE_LINE;
}


int CToken::ExpandTokens( char *vp, CMemBuf *buf, int *lineext, int is_preprocess_line )
{
	//		�}�N����W�J
	//
	*lineext = 0;				// 1�s->�����s�Ƀ}�N���W�J���ꂽ��?
	int macloop = 0;			// �}�N���W�J�������[�v�`�F�b�N�p�J�E���^
	while(1) {
		if ( mulstr == LMODE_OFF ) {				// �P�s����
			if ( wrtbuf!=NULL ) wrtbuf->PutCR();	// �s��CR/LF��ǉ�
			break;
		}

		// {"�`"}�̏���
		//
		if ( mulstr == LMODE_STR ) {
			wrtbuf = buf;
			vp = ExpandStrEx( vp );
			if ( *vp!=0 ) continue;
		}

		// {{{"�`"}}}�̏���
//
		if (mulstr == LMODE_STR_VSL) {
			wrtbuf = buf;
			vp = ExpandStrEx_VSL(vp);
			if (*vp != 0) continue;
		}

		// /*�`*/�̏���
		//
		if ( mulstr == LMODE_COMMENT ) {
			vp = ExpandStrComment( vp, 0 );
			if ( *vp!=0 ) continue;
		}

		char *vp_bak = vp;
		int type;
		vp = ExpandToken( vp, &type, is_preprocess_line );
		if ( type < 0 ) {
			return type;
		}
		if ( type == TK_EOL ) { (*lineext)++; }
		if ( type == TK_EOF ) {
			if ( wrtbuf!=NULL ) wrtbuf->PutCR();	// �s��CR/LF��ǉ�
			break;
		}
		if ( vp_bak == vp ) {
			macloop++;
			if ( macloop > 999 ) {
				SetError("Endless macro loop");
				return -1;
			}
		}
	}
	return 0;
}


int CToken::ExpandLine( CMemBuf *buf, CMemBuf *src, char *refname )
{
	//		string�f�[�^��membuf�֓W�J����
	//
	char *p = src->GetBuffer();
	int pline = 1;
	enumgc = 0;
	mulstr = LMODE_ON;
	*errtmp = 0;
	unsigned char a1;

	while(1) {
		RegistExtMacro( "__line__", pline );			// �s�ԍ��}�N�����X�V

		while(1) {
			a1 = *(unsigned char *)p;
			if ( a1 == ' ' || a1 == '\t' ) {
				p++; continue;
			}
#ifdef HSPWIN
			if ( hed_cmpmode & CMPMODE_SKIPJPSPC ) {
				if ( a1 == 0x81 && p[1] == 0x40 ) {		// �S�p�X�y�[�X�`�F�b�N
					p+=2; continue;
				}
			}
#endif
			break;
		}

		if ( *p==0 ) break;					// �I��(EOF)
		ahtkeyword = NULL;					// AHT�L�[���[�h�����Z�b�g����

		int is_preprocess_line = *p == '#' &&
		                         mulstr != LMODE_STR &&
		                         mulstr != LMODE_COMMENT;

		//		�s�f�[�^��linebuf�ɓW�J
		int mline;
		if ( is_preprocess_line ) {
			p = SendLineBufPP( p + 1, &mline );// �s���܂ł����o��('\'�p��)
			wrtbuf = NULL;
		} else {
			p = SendLineBuf( p );			// �s���܂ł����o��
			mline = 0;
			wrtbuf = buf;
		}

//		Mesf("%d:%s", pline, src->GetFileName() );
//		sprintf( mestmp,"%d:%s:%s(%d)", pline, src->GetFileName(), linebuf, is_preprocess_line );
//		Alert( mestmp );
//		buf->PutStr( mestmp );

		//		�}�N���W�J�O�ɏ��������v���v���Z�b�T
		if ( is_preprocess_line ) {
			ppresult_t res = PreprocessNM( linebuf );
			if ( res == PPRESULT_ERROR ) {
				LineError( errtmp, pline, refname );
				return 1;
			}
			if ( res == PPRESULT_SUCCESS ) {			// �v���v���Z�b�T�ŏ������ꂽ��
				mline++;
				pline += mline;
				for (int i = 0; i < mline; i++) {
					buf->PutCR();
				}
				continue;
			}
			assert( res == PPRESULT_UNKNOWN_DIRECTIVE );
		}

//		if ( wrtbuf!=NULL ) {
//			char ss[64];
//			sprintf( ss,"__%d:",pline );
//			wrtbuf->PutStr( ss );
//		}

		//		�}�N����W�J
		int lineext;			// 1�s->�����s�Ƀ}�N���W�J���ꂽ��?
		int res = ExpandTokens( linebuf, buf, &lineext, is_preprocess_line );
		if ( res ) {
			LineError( errtmp, pline, refname );
			return res;
		}

		//		�v���v���Z�b�T����
		if ( is_preprocess_line ) {
			wrtbuf = buf;
			ppresult_t res = Preprocess( linebuf );
			if ( res == PPRESULT_INCLUDED ) {			// include��̏���
				pline += 1+mline;

				char *fname_literal = to_hsp_string_literal( refname );
				RegistExtMacro( "__file__", fname_literal );			// �t�@�C�����}�N�����X�V

				wrtbuf = buf;
				wrtbuf->PutStrf( "##%d %s\r\n", pline-1, fname_literal );
				free( fname_literal );
				continue;
			}
			if ( res == PPRESULT_WROTE_LINES ) {			// �v���v���Z�X�ōs����������̏���
				pline += mline;
				wrtbuf->PutStrf( "##%d\r\n", pline );
				pline++;
				continue;
			}
			if ( res == PPRESULT_ERROR ) {
				LineError( errtmp, pline, refname );
				return 1;
			}
			pline += 1+mline;
			if ( res != PPRESULT_WROTE_LINE ) mline++;
			for (int i = 0; i < mline; i++) {
				buf->PutCR();
			}
			assert( res == PPRESULT_SUCCESS || res == PPRESULT_WROTE_LINE );
			continue;
		}

		//		�}�N���W�J��ɍs�����ς�����ꍇ�̏���
		pline += 1+mline;
		if ( lineext != mline ) {
			wrtbuf->PutStrf( "##%d\r\n", pline );
		}
	}
	return 0;
}


int CToken::ExpandFile( CMemBuf *buf, char *fname, char *refname )
{
	//		�\�[�X�t�@�C����membuf�֓W�J����
	//
	int res;
	char cname[HSP_MAX_PATH];
	char purename[HSP_MAX_PATH];
	char foldername[HSP_MAX_PATH];
	char refname_copy[HSP_MAX_PATH];
	CMemBuf fbuf;

	getpath( fname, purename, 8 );
	getpath( fname, foldername, 32 );
	if ( *foldername != 0 ) strcpy( search_path, foldername );

	if ( fbuf.PutFile( fname ) < 0 ) {
		strcpy( cname, common_path );strcat( cname, purename );
		if ( fbuf.PutFile( cname ) < 0 ) {
			strcpy( cname, search_path );strcat( cname, purename );
			if ( fbuf.PutFile( cname ) < 0 ) {
				strcpy( cname, common_path );strcat( cname, search_path );strcat( cname, purename );
				if ( fbuf.PutFile( cname ) < 0 ) {
					if ( fileadd == 0 ) {
#ifdef JPNMSG
						Mesf( "#�X�N���v�g�t�@�C����������܂��� [%s]", purename );
#else
						Mesf( "#Source file not found.[%s]", purename );
#endif
					}
					return -1;
				}
			}
		}
	}
	fbuf.Put( (char)0 );

	if ( fileadd ) {
		Mesf( "#Use file [%s]",purename );
	}

	char *fname_literal = to_hsp_string_literal( refname );
	RegistExtMacro( "__file__", fname_literal );			// �t�@�C�����}�N�����X�V

	buf->PutStrf( "##0 %s\r\n", fname_literal );
	free( fname_literal );

	strcpy2( refname_copy, refname, sizeof refname_copy );
	res = ExpandLine( buf, &fbuf, refname_copy );

	if ( res == 0 ) {
		//		�v���v���Z�X��`�F�b�N
		//
		res = tstack->StackCheck( linebuf );
		if ( res ) {
#ifdef JPNMSG
			Mesf( "#�X�^�b�N����ɂȂ��Ă��Ȃ��}�N���^�O��%d����܂� [%s]", res, refname_copy );
#else
			Mesf( "#%d unresolved macro(s).[%s]", res, refname_copy );
#endif
			Mes( linebuf );
		}
	}
	
	if ( res ) {

#ifdef JPNMSG
		Mes("#�d��ȃG���[�����o����Ă��܂�");
#else
		Mes( "#Fatal error reported." );
#endif
		return -2;
	}
	return 0;
}


int CToken::SetAdditionMode( int mode )
{
	//		Addition�ɂ��t�@�C���ǉ����[�h�ݒ�(1=on/0=off)
	//
	int i;
	i = fileadd;
	fileadd = mode;
	return i;
}


void CToken::SetCommonPath( char *path )
{
	if ( path==NULL ) { common_path[0]=0; return; }
	strcpy( common_path, path );
}


void CToken::FinishPreprocess( CMemBuf *buf )
{
	//	���Œ�`���ꂽ�֐�������ꍇ�A����ɏ���������
	//
	//	���̊֐��ł� foo@modname �� foo �ɏ���������Ȃǃo�b�t�@�T�C�Y���������Ȃ�ύX�����s��Ȃ�
	//
	int read_pos = 0;
	int write_pos = 0;
	size_t len = undefined_symbols.size();
	char *p = buf->GetBuffer();
	for ( size_t i = 0; i < len; i ++ ) {
		undefined_symbol_t sym = undefined_symbols[i];
		int pos = sym.pos;
		int len_include_modname = sym.len_include_modname;
		int len = sym.len;
		int id;
		memmove( p + write_pos, p + read_pos, pos - read_pos );
		write_pos += pos - read_pos;
		read_pos = pos;
		// @modname �����������O�̊֐������݂����炻��ɏ�������
		p[pos+len] = '\0';
		id = lb->Search( p + pos );
		if ( id >= 0 && lb->GetType(id) == LAB_TYPE_PPMODFUNC ) {
			memmove( p + write_pos, p + pos, len );
			write_pos += len;
			read_pos += len_include_modname;
		}
		p[pos+len] = '@';
	}
	memmove( p + write_pos, p + read_pos, buf->GetSize() - read_pos );
	buf->ReduceSize( buf->GetSize() - (read_pos - write_pos) );
}


int CToken::LabelRegist( char **list, int mode )
{
	//		���x������o�^
	//
	if ( mode ) {
		return lb->RegistList( list, "@hsp" );
	}
	return lb->RegistList( list, "" );
}


int CToken::LabelRegist2( char **list )
{
	//		���x������o�^(�}�N��)
	//
	return lb->RegistList2( list, "@hsp" );
}


int CToken::LabelRegist3( char **list )
{
	//		���x������o�^(�F�����p)
	//
	return lb->RegistList3( list );
}


int CToken::RegistExtMacroPath( char *keyword, char *str )
{
	//		�}�N�����O������o�^(path�p)
	//
	int id, res;
	char path[1024];
	char mm[512];
	unsigned char *p;
	unsigned char *src;
	unsigned char a1;

	p = (unsigned char *)path;
	src = (unsigned char *)str;
	while(1) {
		a1 = *src++;
		if ( a1 == 0 ) break;
		if ( a1 == 0x5c ) {	*p++=a1; }		// '\'�`�F�b�N
		if ( a1>=129 ) {					// �S�p�����`�F�b�N
			if (a1<=159) { *p++=a1;a1=*src++; }
			else if (a1>=224) { *p++=a1;a1=*src++; }
		}
		*p++ = a1;
	}
	*p = 0;	

	strcpy( mm, keyword );
	FixModuleName( mm );
	res = lb->Search( mm );if ( res != -1 ) {	// ���łɂ���ꍇ�͏㏑��
		lb->SetData( res, path );
		return -1;
	}
	//		�f�[�^��`
	id = lb->Regist( mm, LAB_TYPE_PPMAC, 0 );
	lb->SetData( id, path );
	lb->SetEternal( id );
	return 0;
}


int CToken::RegistExtMacro( char *keyword, char *str )
{
	//		�}�N�����O������o�^
	//
	int id, res;
	char mm[512];
	strcpy( mm, keyword );
	FixModuleName( mm );
	res = lb->Search( mm );if ( res != -1 ) {	// ���łɂ���ꍇ�͏㏑��
		lb->SetData( res, str );
		return -1;
	}
	//		�f�[�^��`
	id = lb->Regist( mm, LAB_TYPE_PPMAC, 0 );
	lb->SetData( id, str );
	lb->SetEternal( id );
	return 0;
}


int CToken::RegistExtMacro( char *keyword, int val )
{
	//		�}�N�����O������o�^(���l)
	//
	int id, res;
	char mm[512];
	strcpy( mm, keyword );
	FixModuleName( mm );
	res = lb->Search( mm );if ( res != -1 ) {	// ���łɂ���ꍇ�͏㏑��
		lb->SetOpt( res, val );
		return -1;
	}
	//		�f�[�^��`
	id = lb->Regist( mm, LAB_TYPE_PPVAL, val );
	lb->SetEternal( id );
	return 0;
}


int CToken::LabelDump( CMemBuf *out, int option )
{
	//		�o�^����Ă��郉�x������errbuf�ɓW�J
	//
	lb->DumpHSPLabel( linebuf, option, LINEBUF_MAX - 256 );
	out->PutStr( linebuf );
	return 0;
}


void CToken::SetModuleName( char *name )
{
	//		���W���[������ݒ�
	//
	if ( *name==0 ) {
		modname[0] = 0; return;
	}
	sprintf( modname, "@%.*s", MODNAME_MAX, name );
	strcase( modname+1 );
}


char *CToken::GetModuleName( void )
{
	//		���W���[�������擾
	//
	if ( *modname == 0 ) return modname;
	return modname+1;
}


void CToken::AddModuleName( char *str )
{
	//		�L�[���[�h�Ƀ��W���[������t��(���W���[���ˑ����x���p)
	//
	unsigned char a1;
	unsigned char *wp;
	wp=(unsigned char *)str;
	while(1) {
		a1=*wp;
		if (a1==0) break;
		if (a1=='@') {
			a1=wp[1];
			if (a1==0) *wp=0;
			return;
		}
		if (a1>=129) wp++;
		wp++;
	}
	if ( *modname==0 ) return;
	strcpy( (char *)wp, modname );
}


void CToken::FixModuleName( char *str )
{
	//		�L�[���[�h�̃��W���[�����𐳋K��(���W���[����ˑ����x���p)
	//
//	char *wp;
//	wp = str + ( strlen(str)-1 );
//	if ( *wp=='@' ) *wp=0;

	unsigned char a1;
	unsigned char *wp;
	wp=(unsigned char *)str;
	while(1) {
		a1=*wp;
		if (a1==0) break;
		if (a1=='@') {
			a1=wp[1];
			if (a1==0) *wp=0;
			return;
		}
		if (a1>=129) wp++;
		wp++;
	}
	
}


int CToken::IsGlobalMode( void )
{
	//		���W���[����(0)���A�O���[�o��(1)����Ԃ�
	//
	if ( *modname==0 ) return 1;
	return 0;
}


int CToken::GetLabelBufferSize( void )
{
	//		���x���o�b�t�@�T�C�Y�𓾂�
	//
	return lb->GetSymbolSize();
}


void CToken::InitSCNV( int size )
{
	//		�����R�[�h�ϊ��̏�����
	//		(size<0�̏ꍇ�̓�������j��)
	//
	if ( scnvbuf != NULL ) {
		free( scnvbuf );
		scnvbuf = NULL;
	}
	if ( size <= 0 ) return;
	scnvbuf = (char *)malloc(size);
	scnvsize = size;
}


char *CToken::ExecSCNV( char *srcbuf, int opt )
{
	//		�����R�[�h�ϊ�
	//
	//int ressize;
	int size;

	if ( scnvbuf == NULL ) InitSCNV( SCNVBUF_DEFAULTSIZE );

	size = (int)strlen( srcbuf );
	switch( opt ) {
	case SCNV_OPT_NONE:
		strcpy( scnvbuf, srcbuf );
		break;
	case SCNV_OPT_SJISUTF8:
#ifdef HSPWIN
		ConvSJis2Utf8( srcbuf, scnvbuf, scnvsize );
#else
		strcpy( scnvbuf, srcbuf );
#endif
		break;
	default:
		*scnvbuf = 0;
		break;
	}

	return scnvbuf;
}

void CToken::SetErrorSymbolOverdefined(char* keyword, int label_id)
{
	// ���ʎq�̑��d��`�G���[

	char strtmp[0x100];
#ifdef JPNMSG
	sprintf( strtmp,"��`�ς݂̎��ʎq�͎g�p�ł��܂��� [%s]", keyword );
#else
	sprintf( strtmp,"symbol in use [%s]", keyword );
#endif
	SetError(strtmp);
}


int CToken::CheckByteSJIS( unsigned char c )
{
	//	SJIS�̑S�p1�o�C�g�ڂ𔻒肷��
	//  (�߂�l�͈ȍ~�ɑ���byte��)
	if (((c>=0x81)&&(c<=0x9f))||((c>=0xe0)&&(c<=0xfc))) return 1;
	return 0;
}


int CToken::CheckByteUTF8( unsigned char c )
{
	//	UTF8�̑S�p1�o�C�g�ڂ𔻒肷��
	//  (�߂�l�͈ȍ~�ɑ���byte��)

	if ( c <= 0x7f ) return 0;

	if ((c >= 0xc2) && (c <= 0xdf)) return 1;
	if ((c >= 0xe0) && (c <= 0xef)) return 2;
	if ((c >= 0xf0) && (c <= 0xf7)) return 3;
	if ((c >= 0xf8) && (c <= 0xfb)) return 4;
	if ((c >= 0xfc) && (c <= 0xfd)) return 5;
	return 0;
}


int CToken::SkipMultiByte( unsigned char byte )
{
	//	�}���`�o�C�g�R�[�h��2byte�ڈȍ~���X�L�b�v����
	//  ( 1�o�C�g�ڂ�char��n���ƁA2byte�ڈȍ~�X�L�b�v����byte����Ԃ� )
	//	( pp_utf8�̃t���O�ɂ����UTF-8��SJIS�𔻒f���� )
	//
	if ( pp_utf8 ) {
		return CheckByteUTF8( byte );
	}
	return CheckByteSJIS( byte );
}

