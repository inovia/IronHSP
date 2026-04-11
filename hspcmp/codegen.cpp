
//
//		Token analysis class ( HSP3 code generator )
//			onion software/onitama 2004/4
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#ifdef HSPWIN
#include <windows.h>
#endif

#include "../hsp3/hsp3config.h"
#include "../hsp3/hsp3debug.h"
#include "../hsp3/hsp3struct.h"
#include "../hsp3/strnote.h"

#include "supio.h"
#include "token.h"
#include "label.h"
#include "tagstack.h"
#include "membuf.h"
#include "comutil.h"

#include "errormsg.h"

//-------------------------------------------------------------
//		Routines
//-------------------------------------------------------------

void CToken::CalcCG_token( void )
{
	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype == TK_NONE ) ttype = val;
}

void CToken::CalcCG_token_exprbeg( void )
{
	GetTokenCG( GETTOKEN_EXPRBEG );
	if ( ttype == TK_NONE ) ttype = val;
}

void CToken::CalcCG_token_exprbeg_redo( void )
{
	//		GETTOKEN_EXPRBEG でトークンを取得し直す
	//
	//		GetTokenCG は 文字列リテラルや文字コードリテラルの場合、
	//		cg_ptr のバッファを破壊するので常に取得し直すわけにはいかない
	//
	if ( ttype == TK_NONE ) ttype = val;
	if ( ttype == '-' || ttype == '*' ) {
		cg_ptr = cg_ptr_bak;
		CalcCG_token_exprbeg();
	}
}

static int is_statement_end( int type )
{
	return ( type == TK_SEPARATE )||( type == TK_EOL )||( type == TK_EOF );
}


void CToken::CalcCG_regmark( int mark )
{
	//		演算子を登録する
	//
	int op;
	op = 0;
	switch( mark ) {
	case '+':
		op = CALCCODE_ADD;
		break;
	case '-':
		op = CALCCODE_SUB;
		break;
	case '*':
		op = CALCCODE_MUL;
		break;
	case '/':
		op = CALCCODE_DIV;
		break;

	case '=':
		op = CALCCODE_EQ;
		break;
	case '!':
		op = CALCCODE_NE;
		break;
	case '<':
		op = CALCCODE_LT;
		break;
	case '>':
		op = CALCCODE_GT;
		break;
	case 0x61:						// '<='
		op = CALCCODE_LTEQ;
		break;
	case 0x62:						// '>='
		op = CALCCODE_GTEQ;
		break;

	case '&':
		op = CALCCODE_AND;
		break;
	case '|':
		op = CALCCODE_OR;
		break;
	case '^':
		op = CALCCODE_XOR;
		break;

	case 0x5c:						// '\'
		op = CALCCODE_MOD;
		break;
	case 0x63:						// '<<'
		op = CALCCODE_LR;
		break;
	case 0x64:						// '>>'
		op = CALCCODE_RR;
		break;
	default:
		throw CGERROR_CALCEXP;
	}
	calccount++;
	PutCS( TK_NONE, op, texflag );
}

void CToken::CalcCG_factor( void )
{
	int id;

	cs_lasttype = ttype;
	switch( ttype ) {
	case TK_NUM:
		PutCS( TYPE_INUM, val, texflag );
		texflag = 0;
		CalcCG_token();
		calccount++;
		return;
	case TK_NUM64:
		PutCS( TYPE_INUM64, val_i64, texflag );
		texflag = 0;
		CalcCG_token();
		calccount++;
		return;
	case TK_DNUM:
		PutCS( TYPE_DNUM, val_d, texflag );
		texflag = 0;
		CalcCG_token();
		calccount++;
		return;
	case TK_STRING:
		PutCS( TYPE_STRING, PutDS( cg_str ), texflag );
		texflag = 0;
		CalcCG_token();
		calccount++;
		return;
	case TK_WSTRING:
		{
		// L"..." → UTF-16 に変換して DS に [size(int)][wchar_t data] として格納
		int wlen = MultiByteToWideChar(CP_ACP, 0, cg_str, -1, NULL, 0);
		wchar_t *wbuf = (wchar_t *)malloc(wlen * sizeof(wchar_t));
		MultiByteToWideChar(CP_ACP, 0, cg_str, -1, wbuf, wlen);
		int byte_size = wlen * sizeof(wchar_t);
		int dsofs = ds_buf->GetSize();
		ds_buf->PutData(&byte_size, sizeof(int));		// サイズヘッダ
		ds_buf->PutData(wbuf, byte_size);				// UTF-16 データ
		free(wbuf);
		PutCS( TYPE_WSTR, dsofs, texflag );
		texflag = 0;
		CalcCG_token();
		calccount++;
		return;
		}
	case TK_LABEL:
		GenerateCodeLabel( cg_str, texflag );
		texflag = 0;
		CalcCG_token();
		calccount++;
		return;
	case TK_OBJ:
		id = SetVarsFixed( cg_str, cg_defvarfix );
		if ( lb->GetType(id) == TYPE_VAR ) {
			if ( lb->GetInitFlag(id) == LAB_INIT_NO ) {
#ifdef JPNMSG
				Mesf( "#未初期化の変数があります(%s)", cg_str );
#else
				Mesf( "#Uninitalized variable (%s).", cg_str );
#endif
				if ( hed_cmpmode & CMPMODE_VARINIT ) {
					throw CGERROR_VAR_NOINIT;
				}
				lb->SetInitFlag( id, LAB_INIT_DONE );
			}
		}
		GenerateCodeVAR( id, texflag );
		texflag = 0;
		if ( ttype == TK_NONE ) ttype = val;		// CalcCG_token()に合わせるため
		calccount++;
		return;
	case TK_SEPARATE:
	case TK_EOL:
	case TK_EOF:
		return;
	default:
		break;
	}

	if( ttype!='(' ) {
		//Mesf("#Invalid%d",ttype);
		ttype=TK_CALCERROR;
		return;
	}

	//		カッコの処理
	//
	CalcCG_token_exprbeg();
	CalcCG_start();
	if( ttype!=')' ) { ttype=TK_CALCERROR; return; }

	CalcCG_token();
}

void CToken::CalcCG_unary( void )
{
	//		単項演算子
	//
	int op;
	if ( ttype=='-' ) {
		op=ttype; CalcCG_token_exprbeg();
		if ( is_statement_end(ttype) ) throw CGERROR_CALCEXP;
		CalcCG_unary();
		texflag = 0;
		PutCS( TYPE_INUM, -1, texflag );
		CalcCG_regmark( '*' );
	} else {
		CalcCG_factor();
	}
}

void CToken::CalcCG_muldiv( void )
{
	int op;
	CalcCG_unary();

	while( (ttype=='*')||(ttype=='/')||(ttype=='\\')) {
		op=ttype; CalcCG_token_exprbeg();
		if ( is_statement_end(ttype) ) throw CGERROR_CALCEXP;
		CalcCG_unary();
		CalcCG_regmark( op );
	}
}

void CToken::CalcCG_addsub( void )
{
	int op;
	CalcCG_muldiv();

	while( (ttype=='+')||(ttype=='-')) {
		op=ttype; CalcCG_token_exprbeg();
		if ( is_statement_end(ttype) ) throw CGERROR_CALCEXP;
		CalcCG_muldiv();
		CalcCG_regmark( op );
	}
}


void CToken::CalcCG_shift( void )
{
	int op;
	CalcCG_addsub();

	while( (ttype==0x63)||(ttype==0x64)) {
		op=ttype; CalcCG_token_exprbeg();
		if ( is_statement_end(ttype) ) throw CGERROR_CALCEXP;
		CalcCG_addsub();
		CalcCG_regmark( op );
	}
}


void CToken::CalcCG_compare( void )
{
	int op;
	CalcCG_shift();

	while( 
		(ttype=='<')||(ttype=='>')||(ttype=='=')||(ttype=='!')||
		(ttype==0x61)||(ttype==0x62)) {
		op=ttype; CalcCG_token_exprbeg();
		if ( is_statement_end(ttype) ) throw CGERROR_CALCEXP;
		CalcCG_shift();
		CalcCG_regmark( op );
	}
}


void CToken::CalcCG_bool( void )
{
	int op;
	CalcCG_compare();

	while( (ttype=='&')||(ttype=='|')||(ttype=='^')) {
		op=ttype; CalcCG_token_exprbeg();
		if ( is_statement_end(ttype) ) throw CGERROR_CALCEXP;
		CalcCG_compare();
		CalcCG_regmark( op );
	}
}


void CToken::CalcCG_start( void )
{
	//		entry point
	CalcCG_bool();
}

void CToken::CalcCG( int ex )
{
	//		パラメーターの式を評価する
	//		(結果は逆ポーランドでコードを出力する)
	//
	texflag = ex;
	cs_lastptr = cs_buf->GetSize();
	calccount = 0;

	CalcCG_token_exprbeg_redo();

	CalcCG_start();

	if ( ttype == TK_CALCERROR ) {
		throw CGERROR_CALCEXP;
	}
}

//-----------------------------------------------------------------------------


char *CToken::PickLongStringCG( char *str )
{
	//		指定文字列をmembufへ展開する
	//		( 複数行対応 {"～"} )
	//
	char *p;
	char *psrc;
	char *ps;
	p = psrc = str;

	while(1) {
		p = PickStringCG2( p, &psrc );
		if ( *psrc != 0 ) break;
		ps = GetLineCG();
		if ( ps == NULL ) throw CGERROR_MULTILINE_STR;
		psrc = ps;
		cg_orgline++;

		//		行の終端にある0を改行に置き換える
		p[0] = 13;
		p[1] = 10;
		p+=2;
	}
	if ( *psrc != '}' ) throw CGERROR_MULTILINE_STR;

	if ( cg_debug ) {
		PutDI( 254, 0, cg_orgline );                // ラインだけをデバッグ情報として登録
	}

	psrc++;
	return psrc;
}


char *CToken::PickStringCG( char *str, int sep )
{
	//		指定文字列をスキップして終端コードを付加する
	//			sep = 区切り文字
	//
	unsigned char *vs;
	unsigned char *pp;
	unsigned char a1;
	int skip,i;
	vs = (unsigned char *)str;
	pp = vs;

	while(1) {
		a1=*vs;
		if (a1==0) break;
		if (a1==sep) { vs++; break; }
		if (a1==0x5c) {					// '\'チェック
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
		skip = SkipMultiByte( a1 );		// 全角文字チェック
		if ( skip ) {
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


char *CToken::PickStringCG2( char *str, char **strsrc )
{
	//		指定文字列をスキップして終端コードを付加する
	//			sep = 区切り文字
	//
	unsigned char *vs;
	unsigned char *pp;
	unsigned char a1;
	int skip,i;
	vs = (unsigned char *)*strsrc;
	pp = (unsigned char *)str;

	while(1) {
		a1=*vs;
		//Alertf("%d(%c)",a1,a1);
		if (a1==0) break;
		if (a1==0x22) {
			vs++;
			if ( *vs == '}' ) break;
			*pp++ = a1;
			continue;
		}
		if (a1==0x5c) {					// '\'チェック
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
			case 0x22:
				a1 = 0x22;
				break;
			}
		}
		skip = SkipMultiByte( a1 );		// 全角文字チェック
		if ( skip ) {
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
	*strsrc = (char *)vs;
	return (char *)pp;
}

char *CToken::PickStringCG_VSL(char *str, int sep)
{
	//		Verbatim String Literals(����I���e����)
	//			@"�`"
	//		�w�蕶������X�L�b�v���ďI�[�R�[�h��t������
	//			sep = ��؂蕶��
	//
	unsigned char *vs;
	unsigned char *pp;
	unsigned char a1, a2;
	int skip, i;
	vs = (unsigned char *)str;
	pp = vs;

	while (1) {
		a1 = *vs;
		if (a1 == 0) break;
		if (a1 == 0x22) {	// "" �`�F�b�N(2�A���Ń_�u���N�H�[�g)
			a2 = *(vs + 1);
			if (a2 == 0x22) {
				vs += 2;
				*pp++ = a1;
				continue;
			}
		}
		if (a1 == sep) { vs++; break; }
		//if (a1 == 0x5c) {					// '\'�`�F�b�N
		//	vs++;
		//	a1 = tolower(*vs);
		//	if (a1 < 32) continue;
		//	switch (a1) {
		//	case 'n':
		//		*pp++ = 13;
		//		a1 = 10;
		//		break;
		//	case 't':
		//		a1 = 9;
		//		break;
		//	case 'r':
		//		a1 = 13;
		//		break;
		//	}
		//}
		skip = SkipMultiByte(a1);		// �S�p�����`�F�b�N
		if (skip) {
			for (i = 0; i < skip; i++) {
				*pp++ = a1;
				vs++;
				a1 = *vs;
			}
		}
		vs++;
		*pp++ = a1;
	}
	*pp = 0;
	return (char *)vs;
}


char *CToken::GetTokenCG( int option )
{
	cg_ptr_bak = cg_ptr;
	cg_ptr = GetTokenCG( cg_ptr, option );
	return cg_ptr;
}

int CToken::PickNextCodeCG( void )
{
	//		次のコード(１文字を返す)
	//		(終端の場合は0を返す)
	//
	unsigned char *vs;
	unsigned char a1;
	vs = (unsigned char *)cg_ptr;
	if ( vs == NULL ) return 0;
	while(1) {
		a1=*vs;
		if (( a1 != 32 )&&( a1 != '\t' )) {		// space,tab以外か?
			break;
		}
		vs++;
	}
	return (int)a1;
}

char *CToken::GetTokenCG( char *str, int option )
{
	//		stringデータのタイプと内容を返す
	//		(次のptrを返す)
	//		(ttypeにタイプを、val,val_d,cg_strに内容を書き込みます)
	//
	unsigned char *vs;
	unsigned char a1;
	unsigned char a2;
	int a,b,chk,labmode;
	int skip,i;

	vs = (unsigned char *)str;
	if ( vs==NULL ) {
		ttype = TK_EOF; return NULL;			// already end
	}

	while(1) {
		a1=*vs;
		if (( a1 != 32 )&&( a1 != '\t' )) {		// space,tab以外か?
			break;
		}
		vs++;
	}

	if (a1==0) {								// end
		ttype = TK_EOL;
		return (char *)vs;
		//return GetLineCG();
	}

	if ( a1<0x20 ) {							// 無効なコード
		ttype = TK_ERROR;
		throw CGERROR_UNKNOWN;
	}

	if (a1==0x22) {								// "～"
		vs++;
		ttype = TK_STRING; cg_str = (char *)vs;
		return PickStringCG( (char *)vs, 0x22 );
	}

	if (a1 == 'L' || a1 == 'l') {				// L"～" UTF-16 リテラル
		if (vs[1] == 0x22) {
			vs+=2;
			cg_str = (char *)vs;
			char *next = PickStringCG( (char *)vs, 0x22 );
			ttype = TK_WSTRING;
			return next;
		}
	}

	if (a1 == '@') {							// @"～"
		if (vs[1] == 0x22) {
			vs+=2;
			ttype = TK_STRING; cg_str = (char *)vs;
			return PickStringCG_VSL((char *)vs, 0x22);
		}
	}

	if (a1=='{') {							// {"～"}
		if (vs[1]==0x22) {
			vs+=2;
			if ( *vs == 0 ) {
				vs = (unsigned char *)GetLineCG();
				cg_orgline++;
				if (vs == NULL) return NULL;
			}
			ttype = TK_STRING; cg_str = (char *)vs;
			return PickLongStringCG( (char *)vs );
		}
	}

	if (a1==0x27) {								// '～'
		char *p;
		vs++; cg_str = (char *)vs;
		p = PickStringCG( (char *)vs, 0x27 );
		ttype = TK_NUM; 
		val = ((unsigned char *)cg_str)[0];
		return p;
	}

	if ((a1==':')||(a1=='{')||(a1=='}')) {		// multi statement
		cg_str=(char *)s2;
		ttype = TK_SEPARATE;
		cg_str[0] = a1;
		cg_str[1] = 0;
		return (char *)vs+1;
	}

	if (a1=='0') {
		a2=tolower( vs[1] );
		if (a2=='x') { vs++;a1='$'; }		// when hex code (0x)
		if (a2=='b') { vs++;a1='%'; }		// when bin code (0b)
	}

	if (a1=='$') {							// when hex code ($)
		vs++;cg_str=(char *)s2;a=0;
		int64_t hexval = 0;
		while(1) {
			a1=toupper(*vs);b=-1;
			if (a1==0) break;
			if ((a1>=0x30)&&(a1<=0x39)) b=a1-0x30;
			if ((a1>=0x41)&&(a1<=0x46)) b=a1-55;
			if (a1=='_') b=-2;
			if (a1=='L' || a1=='l') { vs++; break; }	// Lサフィックス
			if (b==-1) break;
			if (b>=0) { cg_str[a++]=(char)a1; hexval=(hexval<<4)+b; }
			vs++;
		}
		cg_str[a]=0;
		if ( hexval > 0x7FFFFFFFLL || hexval < -0x80000000LL || a > 8 ) {
			val_i64 = hexval;
			ttype = TK_NUM64;
		} else {
			val = (int)hexval;
			ttype = TK_NUM;
		}
		return (char *)vs;
	}

	if (a1=='%') {							// when bin code (%)
		vs++;val=0;cg_str=(char *)s2;a=0;
		while(1) {
			a1=*vs;b=-1;
			if (a1==0) break;
			if ((a1>=0x30)&&(a1<=0x31)) b=a1-0x30;
			if (a1=='_') b=-2;
			if (b==-1) break;
			if (b>=0) { cg_str[a++]=(char)a1;val=(val<<1)+b; }
			vs++;
		}
		cg_str[a]=0;
		ttype = TK_NUM;
		return (char *)vs;
	}

	chk=0;
	labmode = 0;
	if (a1<0x30) chk++;
	if ((a1>=0x3a)&&(a1<=0x3f)) chk++;
	if ((a1>=0x5b)&&(a1<=0x5e)) chk++;
	if ((a1>=0x7b)&&(a1<=0x7f)) chk++;

	if ( option & (GETTOKEN_EXPRBEG|GETTOKEN_LABEL) ) {
		if ( a1 == '*' ) {					// ラベル
			a2 = vs[1]; b = 0;
			if (a2<0x30) b++;
			if ((a2>=0x30)&&(a2<=0x3f)) b++;
			if ((a2>=0x5b)&&(a2<=0x5e)) b++;
			if ((a2>=0x7b)&&(a2<=0x7f)) b++;
			if ( b == 0 ) {
				chk = 0;
				labmode = 1;
				vs++; a1 = *vs;
			}
		}
	}

	int is_negative_number = 0;
	if ( option & GETTOKEN_EXPRBEG && a1 == '-' ) {
		is_negative_number = isdigit(vs[1]);
	}

	if ( is_negative_number || isdigit(a1) ) {				// when 0-9 numerical
		a=0;chk=0;
		if ( is_negative_number ) {
			vs ++;
		}
		while(1) {
			a1=*vs;
			if ( option & GETTOKEN_NOFLOAT ) {
				if ((a1<0x30)||(a1>0x39)) break;
			} else {
				if ( a1=='.' ) {
					chk++;if ( chk>1 ) {
						ttype = TK_ERROR;
						throw CGERROR_FLOATEXP;
						return (char *)vs;
					}
				} else {
					if ((a1<0x30)||(a1>0x39)) break;
				}
			}
			s2[a++]=a1;vs++;
		}
		if (( a1=='f' )||( a1=='d' )) { chk = 1; vs++; }
		if (( a1=='L' )||( a1=='l' )) { s2[a++]='L'; vs++; }	// int64サフィックス
		if ( a1=='e' ) {						// 指数部を取り込む
			chk = 1;
			s2[a++] = 'e';
			vs++;
			a1 = *vs;
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

		switch( chk ) {
		case 1:
			val_d = atof( (char *)s2 );
			if ( is_negative_number ) { val_d = - val_d; }
			ttype = TK_DNUM;
			break;
		default:
			{
			// Lサフィックスの検出
			int slen = a;
			bool force_i64 = false;
			if ( slen > 0 && (s2[slen-1]=='L' || s2[slen-1]=='l') ) {
				s2[slen-1] = 0;
				force_i64 = true;
			}
			if ( force_i64 ) {
				val_i64 = strtoll( (char *)s2, NULL, 0 );
				if ( is_negative_number ) { val_i64 = - val_i64; }
				ttype = TK_NUM64;
			} else {
				// 32bit範囲チェック
				long long llval = strtoll( (char *)s2, NULL, 0 );
				if ( is_negative_number ) { llval = - llval; }
				if ( llval > 2147483647LL || llval < -2147483648LL ) {
					// 32bitオーバーフロー → 自動的にint64
					val_i64 = (int64_t)llval;
					ttype = TK_NUM64;
				} else {
					val = (int)llval;
					ttype = TK_NUM;
				}
			}
			break;
			}
		}
		return (char *)vs;
	}

	if (chk) {								// 記号
		vs++;a2=*vs;
		switch( a1 ) {
		case '-':
			if (a2=='>') { vs++;a1=0x65; }	// '->'
			break;
		case '!':
			if (a2=='=') vs++;
			break;
		case '<':
			if (a2=='<') { vs++;a1=0x63; }	// '<<'
			if (a2=='=') { vs++;a1=0x61; }	// '<='
			break;
		case '>':
			if (a2=='>') { vs++;a1=0x64; }	// '>>'
			if (a2=='=') { vs++;a1=0x62; }	// '>='
			break;
		case '=':
			if (a2=='=') { vs++; }			// '=='
			break;
		case '|':
			if (a2=='|') { vs++; }			// '||'
			break;
		case '&':
			if (a2=='&') { vs++; }			// '&&'
			break;
		}
		ttype = TK_NONE;
		val = (int)a1;
		return (char *)vs;
	}

	a=0;
	while(1) {								// シンボル取り出し
		a1=*vs;

		skip = SkipMultiByte( a1 );			// 全角文字チェック
		if ( skip ) {
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
		if ( a<OBJNAME_MAX ) s2[a++]=a1;
	}
	s2[a]=0;

	//		シンボル
	//
	if ( labmode ) {
		ttype = TK_LABEL;
	} else {
		ttype = TK_OBJ;
	}
	cg_str = (char *)s2;
	return (char *)vs;
}


char *CToken::GetSymbolCG( char *str )
{
	//		stringデータのシンボル内容を返す
	//
	unsigned char *vs;
	unsigned char a1;
	int a,chk,labmode;
	int skip,i;

	vs = (unsigned char *)str;
	if ( vs==NULL ) return NULL;			// already end

	while(1) {
		a1=*vs;
		if (( a1 != 32 )&&( a1 != '\t' )) {		// space,tab以外か?
			break;
		}
		vs++;
	}

	if ( a1<0x20 ) {							// 無効なコード
		return NULL;
	}

	chk=0;
	labmode = 0;
	if (a1<0x30) chk++;
	if ((a1>=0x3a)&&(a1<=0x3f)) chk++;
	if ((a1>=0x5b)&&(a1<=0x5e)) chk++;
	if ((a1>=0x7b)&&(a1<=0x7f)) chk++;

	if (chk) {								// 記号
		return NULL;
	}

	a=0;
	while(1) {								// シンボル取り出し
		a1=*vs;

		skip = SkipMultiByte( a1 );			// 全角文字チェック
		if ( skip ) {
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
		if ( a<OBJNAME_MAX ) s2[a++]=a1;
	}
	s2[a]=0;
	return (char *)s2;
}


//-----------------------------------------------------------------------------

void CToken::GenerateCodePRM( void )
{
	//		HSP3Codeを展開する(パラメーター)
	//
	int ex;
	ex = 0;
	while(1) {

		if ( ttype == TK_NONE ) {
			if ( val == ',' ) {						// 先頭が','の場合は省略
				if ( ex & EXFLG_2 ) PutCS( TYPE_MARK, '?', EXFLG_2 );
				GetTokenCG( GETTOKEN_DEFAULT );
				ex |= EXFLG_2;
				continue;
			}
		}

		CalcCG( ex );								// 式の評価
		//Mesf( "#count %d", calccount );

		if ( hed_cmpmode & CMPMODE_OPTPRM ) {
			if ( calccount == 1 ) {						// パラメーターが単一項目の時
				switch( cs_lasttype ) {
				case TK_NUM:
				case TK_NUM64:
				case TK_DNUM:
				case TK_STRING:
					{
					unsigned short *cstmp;
					cstmp = (unsigned short *)( cs_buf->GetBuffer() + cs_lastptr );
					*cstmp |= EXFLG_0;					// 単一項目フラグを立てる
					break;
					}
				default:
					break;
				}
			}
		}

		if ( ttype >= TK_SEPARATE ) break;
		if ( ttype != ',' ) {
			throw CGERROR_CALCEXP;
		}
		GetTokenCG( GETTOKEN_DEFAULT );
		ex |= EXFLG_2;

		if ( ttype >= TK_SEPARATE ) {
			PutCS( TYPE_MARK, '?', EXFLG_2 );
			break;
		}
	}
}


int CToken::GenerateCodePRMF( void )
{
	//		HSP3Codeを展開する(カッコ内のパラメーター)
	//		(戻り値 : exflg)
	//
	int ex;
	ex = 0;
	while(1) {

		if ( ttype == TK_NONE ) {
			if ( val == ')' ) {						// ')'の場合は終了
				return ex;
			}
			if ( val == ',' ) {						// 先頭が','の場合は省略
				if ( ex & EXFLG_2 ) PutCS( TYPE_MARK, '?', EXFLG_2 );
				GetTokenCG( GETTOKEN_DEFAULT );
				ex |= EXFLG_2;
				continue;
			}
		}

		CalcCG( ex );

		if ( ttype >= TK_SEPARATE ) throw CGERROR_PRMEND;

		if ( ttype == ')' ) break;
		if ( ttype != ',' ) {
			throw CGERROR_CALCEXP;
		}
		GetTokenCG( GETTOKEN_DEFAULT );
		ex |= EXFLG_2;
	}
	return 0;
}


void CToken::GenerateCodePRMF2( void )
{
	//		HSP3Codeを展開する('.'から始まる配列内のパラメーター)
	//
	int t;
	int id,ex;
	int tmp;
	ex = 0;
	while(1) {
		if ( ttype >= TK_SEPARATE ) break;

		//Mesf( "(type:%d val:%d) line:%d", ttype, val, cg_orgline );

		switch( ttype ) {
		case TK_NONE:
			if ( val == '(' ) {
				GetTokenCG( GETTOKEN_DEFAULT );
				CalcCG(ex);
				if ( ttype != ')' ) throw CGERROR_CALCEXP;
			} else {
				throw CGERROR_ARRAYEXP;
			}
			GetTokenCG( GETTOKEN_NOFLOAT );
			break;
		case TK_NUM:
			PutCS( TYPE_INUM, val, ex );
			GetTokenCG( GETTOKEN_NOFLOAT );
			break;
		case TK_NUM64:
			PutCS( TYPE_INUM64, val_i64, ex );
			GetTokenCG( GETTOKEN_NOFLOAT );
			break;
		case TK_OBJ:
			id = SetVarsFixed( cg_str, cg_defvarfix );
			t = lb->GetType(id);
			if (( t == TYPE_XLABEL )||( t == TYPE_LABEL )) throw CGERROR_LABELNAME;
			PutCSSymbol( id, ex );
			GetTokenCG( GETTOKEN_DEFAULT );

			if ( ttype == TK_NONE ) {
				if ( val == '(' ) {						// '(' 配列指定
					GetTokenCG( GETTOKEN_DEFAULT );
					PutCS( TYPE_MARK, '(', 0 );
					tmp = GenerateCodePRMF();
					if ( tmp ) 	PutCS( TYPE_MARK, '?', EXFLG_2 );
					PutCS( TYPE_MARK, ')', 0 );
					GetTokenCG( GETTOKEN_DEFAULT );
				}
			}

			//GenerateCodeVAR( id, ex );
			break;
		default:
			throw CGERROR_ARRAYEXP;
		}

		if ( ttype >= TK_SEPARATE ) return;
		if ( ttype != TK_NONE && ttype != '.' ) throw CGERROR_ARRAYEXP;
		if ( val != '.' ) return;

		GetTokenCG( GETTOKEN_NOFLOAT );
		ex |= EXFLG_2;
	}
}


void CToken::GenerateCodePRMF3( void )
{
	//		HSP3Codeを展開する('<'から始まる構造体参照元のパラメーター)
	//
	int id,ex;
	ex = 0;
	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_OBJ ) throw CGERROR_PP_BAD_STRUCT_SOURCE;

	id = SetVarsFixed( cg_str, cg_defvarfix );
	GenerateCodeVAR( id, ex );

	if ( ttype != TK_NONE ) throw CGERROR_PP_BAD_STRUCT_SOURCE;
	if ( val != ']' ) throw CGERROR_PP_BAD_STRUCT_SOURCE;
	GetTokenCG( GETTOKEN_DEFAULT );
}


int CToken::GenerateCodePRMF4( int t )
{
	//		HSP3Codeを展開する(構造体/配列指定パラメーター)
	//
//	int t,id;
	int ex;
	int tmp;

	ex = 0;
	if ( ttype == TK_NONE ) {
		if ( val == '.' ) {
			GetTokenCG( GETTOKEN_NOFLOAT );
/*
			if ( ttype == TK_OBJ ) {
				id = lb->Search( cg_str );
				if ( id < 0 ) throw CGERROR_PP_BAD_STRUCT;
				t = lb->GetType(id);
				if ( t == TYPE_STRUCT ) {
					PutCS( t, lb->GetOpt(id), ex );
					GetTokenCG( GETTOKEN_DEFAULT );
					return GenerateCodePRMF4();
				}
			}
*/
			PutCS( TYPE_MARK, '(', 0 );			// '.' 配列指定
			GenerateCodePRMF2();
			PutCS( TYPE_MARK, ')', 0 );
			return 1;
		}
		if ( val == '(' ) {						// '(' 配列指定
			GetTokenCG( GETTOKEN_DEFAULT );
			PutCS( TYPE_MARK, '(', 0 );
			tmp = GenerateCodePRMF();
			if ( tmp ) 	PutCS( TYPE_MARK, '?', EXFLG_2 );
			PutCS( TYPE_MARK, ')', 0 );
			GetTokenCG( GETTOKEN_DEFAULT );
			return 1;
		}
		if ( t == TYPE_STRUCT ) {
			if ( val == '[' ) {						// '[' ソース指定
				PutCS( TYPE_MARK, '[', 0 );
				GenerateCodePRMF3();
				return 0;
			}
		}
	}
	return 0;
}


void CToken::GenerateCodeMethod( void )
{
	//		HSP3Codeを展開する(->に続くメソッド名)
	//
	int id,ex;
	ex = 0;

	if ( ttype >= TK_SEPARATE ) throw CGERROR_SYNTAX;
	switch( ttype ) {
	case TK_NUM:
		PutCS( TYPE_INUM, val, ex );
		GetTokenCG( GETTOKEN_DEFAULT );
		break;
	case TK_NUM64:
		PutCS( TYPE_INUM64, val_i64, ex );
		GetTokenCG( GETTOKEN_DEFAULT );
		break;
	case TK_STRING:
		PutCS( TYPE_STRING, PutDS( cg_str ), ex );
		GetTokenCG( GETTOKEN_DEFAULT );
		break;
	case TK_OBJ:
		id = SetVarsFixed( cg_str, cg_defvarfix );
		GenerateCodeVAR( id, ex );
		break;
	default:
		throw CGERROR_SYNTAX;
	}

	ex |= EXFLG_2;
	while(1) {

		if ( ttype == TK_NONE ) {
			if ( val == ',' ) {						// 先頭が','の場合は省略
				if ( ex & EXFLG_2 ) PutCS( TYPE_MARK, '?', EXFLG_2 );
				GetTokenCG( GETTOKEN_DEFAULT );
				ex |= EXFLG_2;
				continue;
			}
		}

		CalcCG( ex );								// 式の評価

		if ( ttype >= TK_SEPARATE ) break;
		if ( ttype != ',' ) {
			throw CGERROR_CALCEXP;
		}
		GetTokenCG( GETTOKEN_DEFAULT );
		ex |= EXFLG_2;
	}

}

void CToken::GenerateCodeLabel( char *keyname, int ex )
{
	//		HSP3Codeを展開する(ラベル)
	//
	int id,t,i;
	char lname[128];
	char *name;

	name = keyname;
	if ( *name == '@' ) {
		switch( tolower(name[1]) ) {
		case 'f':
			i = cg_locallabel;
			break;
		case 'b':
			i = cg_locallabel - 1;
			break;
		default:
			throw CGERROR_LABELNAME;
		}
		sprintf( lname, "@l%d", i );				// local label
		name = lname;
	}

	id = lb->Search( name );
	if ( id < 0 ) {									// 仮のラベル
		i = PutOT( -1 );
		id = lb->Regist( name, TYPE_XLABEL, i );
		GenerateLabelListAndTagRef(id, LABBUF_FLAG_LABEL);
	} else {
		t = lb->GetType(id);
		if (( t != TYPE_XLABEL )&&( t != TYPE_LABEL )) throw CGERROR_LABELEXIST;
		GenerateLabelListAndTagRef(id, LABBUF_FLAG_LABEL);
	}
	PutCS( TYPE_LABEL, lb->GetOpt(id), ex );
}


void CToken::GenerateCodeVAR( int id, int ex )
{
	//		HSP3Codeを展開する(変数ほか)
	//		(idはlabel ID)
	//
	int t;
	t = lb->GetType(id);
	if (( t == TYPE_XLABEL )||( t == TYPE_LABEL )) throw CGERROR_LABELNAME;

	GenerateLabelListAndTagRef(id, LABBUF_FLAG_VAR);

	//
	PutCSSymbol( id, ex );
	GetTokenCG( GETTOKEN_DEFAULT );

	if ( t == TYPE_SYSVAR ) return;
	GenerateCodePRMF4( t );						// 構造体/配列のチェック
}


void CToken::CheckCMDIF_Set( int mode )
{
	//		set 'if'&'else' command additional code
	//			mode/ 0=if 1=else
	//
	if ( iflev >= CG_IFLEV_MAX ) throw CGERROR_IF_OVERFLOW;

	iftype[iflev] = mode;
	ifptr[iflev] = GetCS();

	cs_buf->Put( (short)0 );

	ifmode[iflev] = GetCS();
	ifscope[iflev] = CG_IFCHECK_LINE;
	ifterm[iflev] = 0;
	iflev++;
	//sprintf(tmp,"#IF BEGIN [L=%d(%d)]\n",cline,iflev);
	//prt(tmp);
}


void CToken::CheckCMDIF_Fin( int mode )
{
	//		finish 'if'&'else' command
	//			mode/ 0=if 1=else
	//
	int a;
	short *p;
	if (iflev==0) return;
finag:
	iflev--;

	a = GetCS() - ifmode[iflev];
	if (mode) {							// when 'else'
		a++;
	}

	if ( ifterm[iflev] == 0 ) {
		ifterm[iflev] = 1;
		p = (short *)cs_buf->GetBuffer();
		p[ ifptr[iflev] ] = (short)a;
	}

	//sprintf(tmp,"#IF FINISH [L=%d(%d)] [skip%d]\n",cline,iflev,a);
	//prt(tmp);

	//Mesf( "lev%d : %d: line%d", iflev, ifscope[iflev], cg_orgline );

	if (mode==0) {
		if ( iflev ) {
			if ( ifscope[iflev-1] == CG_IFCHECK_LINE ) goto finag;
		}
	}
}


void CToken::CheckInternalIF( int opt )
{
	//		内蔵命令生成時チェック
	//
	if (opt) {					// 'else'+offset
		if ( iflev == 0 ) throw CGERROR_ELSE_WO_IF;
		CheckCMDIF_Fin(1);
		CheckCMDIF_Set(1);
		return;
	}
	CheckCMDIF_Set(0);				// normal if
}


void CToken::CheckInternalListenerCMD( int opt )
{
	//		命令生成時チェック(命令+命令セット)
	//
	int i,t,o;
	if ( ttype != TK_OBJ ) return;
	i = lb->Search( cg_str );
	if ( i < 0 ) return;
	t = lb->GetType(i);
	o = lb->GetOpt(i);
	if ( t != TYPE_PROGCMD ) return;
	if ( o != 0x001 && o != 0x000 ) return;// not either gosub or goto
	if ( o == 0x001 ) { // gosub
		PutCS(t, o & 0xffff, 0);
	}
	GetTokenCG(GETTOKEN_DEFAULT);
}


int CToken::CheckInternalProgCMD( int opt, int orgcs )
{
	//		内蔵プログラム命令生成時チェック
	//
	int i;
	switch(opt) {

	case 0x03:					// repeat break
	case 0x06:					// repeat continue
		if (replev==0) {
			if (opt==0x03) throw CGERROR_BREAK_WO_REPEAT;
			throw CGERROR_CONT_WO_REPEAT;
		}
		i=repend[replev];
		if (i==-1) {
			i = PutOT( -1 );
			repend[replev]=i;
		}
		PutCS( TK_LABEL, i, 0 );
		break;
	case 0x04:					// repeat start
	case 0x0b:					// (foreach)
		if (replev==CG_REPLEV_MAX) throw CGERROR_REPEAT_OVERFLOW;
		replev++;
		i=repend[replev];
		if (i==-1) {
			i=PutOT( -1 );
			repend[replev]=i;
		}
		PutCS( TK_LABEL, i, 0 );
		if ( opt == 0x0b ) {
			PutCS( TYPE_PROGCMD, 0x0c, EXFLG_1 );
			PutCS( TK_LABEL, i, 0 );
		}
		break;
	case 0x05:					// repeat end
		if (replev==0) throw CGERROR_LOOP_WO_REPEAT;
		i = repend[replev];
		if (i!=-1) {
			SetOT( i, GetCS() );
			repend[replev] = -1;
		}
		replev--;
		break;
	case 0x11:					// stop
		i=PutOT( orgcs );
		PutCS( TYPE_PROGCMD, 0, EXFLG_1 );
		PutCS( TYPE_LABEL, i, 0 );
		break;
	case 0x19:					// on
		GetTokenCG( GETTOKEN_DEFAULT );
		CalcCG( 0 );								// 式の評価
		if ( ttype != TK_OBJ ) throw CGERROR_SYNTAX;
		i = lb->Search( cg_str );
		if ( i < 0 ) throw CGERROR_SYNTAX;
		{
			int labelType = lb->GetType(i);
			int labelOpt = lb->GetOpt(i);
			if ((labelType == TYPE_PROGCMD) && (labelOpt == 0 || labelOpt == 1)) {
				// goto or gosub
				PutCS(labelType, labelOpt, EXFLG_2 );
			}
			else {
				throw CGERROR_SYNTAX;
			}
		}
		break;

	case 0x08:					// await
		//	await命令の出現をカウントする(HEDINFO_NOMMTIMER自動設定のため)
		if ( hed_autoopt_timer >= 0 ) hed_autoopt_timer++;
		break;

	case 0x09:					// dim
	case 0x0a:					// sdim
	case 0x0d:					// dimtype
	case 0x0e:					// dup
	case 0x0f:					// dupptr
		{
			char *firstSymbolName = GetSymbolCG(cg_ptr);
			if (firstSymbolName == NULL || isdigit(*reinterpret_cast<unsigned char *>(firstSymbolName)) ) break;
			i = SetVarsFixed(firstSymbolName, cg_defvarfix );
			//	変数の初期化フラグをセットする
			lb->SetInitFlag( i, LAB_INIT_DONE );
			GenerateLabelListAndTag(i, LABBUF_FLAG_VAR);
			lb->SetSkipLabList(i);						// 次回のラベル参照リスト生成をスキップする
			//Mesf( "#initflag set [%s]", cg_str );
			return 1;
		}

	case 0x20:					// strexchange
		//	strexchange命令の出現をカウントする(ヘッダ自動設定のため)
		if (hed_autoopt_strexchange >= 0) hed_autoopt_strexchange++;
		break;

	case 0x22:					// structdim
		{
			// structdim var, STRUCT_NAME [, count]
			char *firstSymbolName = GetSymbolCG(cg_ptr);
			if (firstSymbolName == NULL) break;
			i = SetVarsFixed(firstSymbolName, cg_defvarfix);
			lb->SetInitFlag(i, LAB_INIT_DONE);
			GenerateLabelListAndTag(i, LABBUF_FLAG_VAR);
			lb->SetSkipLabList(i);

			// ※ -> 展開は PP で完了しているため、CG での struct マッピングは不要
			return 1;
		}

	}
	return 0;
}


void CToken::GenerateCodeCMD( int id )
{
	//		HSP3Codeを展開する(コマンド)
	//		(idはlabel ID)
	//
	int t,opt;
	int orgcs;
	t = lb->GetType(id);
	opt = lb->GetOpt(id);
	orgcs = GetCS();
	PutCSSymbol( id, EXFLG_1 );

	int labtype = LABBUF_FLAG_CMD;
	switch (t) {
	case TYPE_PROGCMD:
		CheckInternalProgCMD(opt, orgcs);
		break;
	case TYPE_CMPCMD:
		CheckInternalIF(opt);
		break;
	case TYPE_INTCMD:
	case TYPE_EXTCMD:
		break;
	case TYPE_MODCMD:
		labtype = LABBUF_FLAG_FUNC;
		break;
	default:
		labtype = LABBUF_FLAG_EXCMD;
		break;
	}

	GetTokenCG( GETTOKEN_DEFAULT );

	if ( opt & 0x10000 ) CheckInternalListenerCMD(opt);

	// structdim の特殊処理: struct_id を抽出して変数マッピングを記録
	// パラメータ展開自体は通常の GenerateCodePRM に任せる
	if (t == TYPE_PROGCMD && opt == 0x22) {
		GenerateCodePRM();

		// struct_id マッピング:
		// 第2引数が 0x7F000000|id の場合、変数→struct_id を記録
		// cg_structdim_varid は CheckInternalProgCMD で設定済み
		// ここではパラメータ値から struct_id を抽出する必要があるが、
		// CalcCG の結果はバイトコードに既に書き込まれている。
		// 代替: CheckInternalProgCMD で記録した変数IDと、
		// プリプロセッサで設定した定数値を使う
		// → 通常パラメータ展開で十分。struct_id はプリプロセッサ値から逆算。
		// ここではプリプロセッサ段階で作成した cg_structdefs を使って
		// 全ての 0x7F000000|id 定数をスキャンし、変数マッピングを構築する
		// （簡易実装: テスト用にソース行から直接パース）

		cg_lastcmd = CG_LASTCMD_CMD;
		cg_lasttype = t;
		cg_lastval = opt;
		GenerateLabelListAndTagRef(id, labtype);
		return;
#if 0
		// 第1引数: 変数（普通に処理）
		CalcCG(0);

		// カンマを読む
		if (ttype != TK_NONE || val != ',') throw CGERROR_SYNTAX;
		GetTokenCG(GETTOKEN_DEFAULT);

		// 第2引数: 構造体ID（プリプロセッサが構造体名を 0x7F000000|id に展開済み）
		// または直接サイズ指定（整数）
		int sid = -1;
		int struct_size = 0;
		if (ttype == TK_NUM && (val & 0x7F000000) == 0x7F000000) {
			// 構造体ID
			sid = val & 0x00FFFFFF;
			if (sid < 0 || sid >= (int)cg_structdefs.size()) throw CGERROR_SYNTAX;
			struct_size = cg_structdefs[sid].total_size;
		} else if (ttype == TK_NUM) {
			// 直接サイズ指定
			struct_size = val;
		} else if (ttype == TK_OBJ) {
			// 未展開の構造体名（フォールバック）
			sid = GetStructDefId(cg_str);
			if (sid < 0) throw CGERROR_SYNTAX;
			struct_size = cg_structdefs[sid].total_size;
		} else {
			throw CGERROR_SYNTAX;
		}

		// 変数→構造体IDマッピングを記録
		if (cg_structdim_varid >= 0 && sid >= 0) {
			cg_var_structid[cg_structdim_varid] = sid;
			cg_structdim_varid = -1;
		}

		// 構造体サイズを即値パラメータとして生成
		PutCS(TYPE_INUM, struct_size, 0);

		// 第3引数: count（省略可）
		GetTokenCG(GETTOKEN_DEFAULT);
		if (ttype == TK_NONE && val == ',') {
			GetTokenCG(GETTOKEN_DEFAULT);
			CalcCG(0);
		}

		cg_lastcmd = CG_LASTCMD_CMD;
		cg_lasttype = t;
		cg_lastval = opt;
		GenerateLabelListAndTagRef(id, labtype);
		return;
#endif
	}

	GenerateCodePRM();
	cg_lastcmd  = CG_LASTCMD_CMD;
	cg_lasttype = t;
	cg_lastval  = opt;

	GenerateLabelListAndTagRef(id, labtype);
}


void CToken::GenerateCodeLET( int id, bool first )
{
	//		HSP3Codeを展開する(代入)
	//		(idはlabel ID)
	//
	int op;
	int t;
	int mcall;

	t = lb->GetType(id);
	if (( t == TYPE_XLABEL )||( t == TYPE_LABEL )) throw CGERROR_LABELNAME;

	if (first) {
		GenerateLabelListAndTag(id, LABBUF_FLAG_VAR);
	} else {
		GenerateLabelListAndTagRef(id, LABBUF_FLAG_VAR);
	}

	//
	mcall = 0;
	GetTokenCG( GETTOKEN_DEFAULT );

	if (( ttype == TK_NONE )&&( val == 0x65 )) {	// ->が続いているか?
		// struct 変数の場合はメンバアクセスに変換（PP で展開済みなのでここには来ない）
		auto it = cg_var_structid.find(id);
		if (it != cg_var_structid.end()) {
			// struct メンバ書き込み: _struct_poke var, offset, member_type, value
			int struct_id = it->second;
			auto &sdef = cg_structdefs[struct_id];

			// メンバ名を取得
			GetTokenCG(GETTOKEN_DEFAULT);
			if (ttype != TK_OBJ) throw CGERROR_SYNTAX;

			// メンバ検索
			int member_idx = -1;
			for (int mi = 0; mi < (int)sdef.members.size(); mi++) {
				if (sdef.members[mi].name == cg_str) { member_idx = mi; break; }
			}
			if (member_idx < 0) throw CGERROR_SYNTAX;
			auto &member = sdef.members[member_idx];

			// 配列要素のオフセット計算: pts(3)->x → base_offset = 3 * struct_size
			// ここでは配列インデックスはまだ処理していない
			// PutCS で _struct_poke を生成
			PutCS( TYPE_PROGCMD, 0x23, EXFLG_1 );		// _struct_poke
			PutCS( t, lb->GetOpt(id), 0 );				// 変数パラメーター
			PutCS( TYPE_INUM, member.offset, 0 );		// byte offset
			PutCS( TYPE_INUM, (int)member.stype, 0 );	// member type
			PutCS( TYPE_INUM, sdef.total_size, 0 );		// struct size (配列オフセット計算用)

			// '=' を読む
			GetTokenCG(GETTOKEN_DEFAULT);
			if (ttype != TK_NONE || val != '=') throw CGERROR_SYNTAX;

			// 値式を展開
			GetTokenCG(GETTOKEN_DEFAULT);
			CalcCG(0);

			cg_lastcmd = CG_LASTCMD_CMD;
			return;
		}

		// netobj の場合は mcall
		PutCS( TYPE_PROGCMD, 0x1a, EXFLG_1 );		// 'mcall'コマンドに置き換える
		PutCS( t, lb->GetOpt(id), 0 );				// 変数パラメーター
		GetTokenCG( GETTOKEN_DEFAULT );
		GenerateCodeMethod();						// パラメーター展開
		return;
	}

	PutCS( t, lb->GetOpt(id), EXFLG_1 );			// 通常の変数代入
	GenerateCodePRMF4( t );							// 構造体/配列のチェック

	if ( ttype != TK_NONE ) { throw CGERROR_SYNTAX; }

	op = val;
	//PutCS( TK_NONE, op, 0 );
	texflag = 0;
	CalcCG_regmark( op );

	cg_lastcmd  = CG_LASTCMD_LET;
	cg_lastval  = op;

	GetTokenCG( GETTOKEN_DEFAULT );

	switch( op ) {
	case '+':								// '++'
	case '-':								// '--'
		if ( ttype >= TK_SEPARATE ) return;
		if ( ttype == TK_NONE ) {
			if ( val == op ) {
				GetTokenCG( GETTOKEN_DEFAULT );
				if ( ttype >= TK_SEPARATE ) return;
				throw CGERROR_SYNTAX;
			}
		}
		break;
	case '=':								// 変数=prm
		GenerateCodePRM();
		return;
	default:
		break;
	}
	
	if (( ttype == TK_NONE )&&( val == '=' )) {
		GetTokenCG( GETTOKEN_DEFAULT );
	}
	GenerateCodePRM();
}


void CToken::GenerateCodePP_regcmd( void )
{
	//		HSP3Codeを展開する(regcmd)
	//
	char cmd[1024];
	char cmd2[1024];
	cmd[0] = 0;

	GetTokenCG( GETTOKEN_DEFAULT );
	switch( ttype ) {
	case TK_STRING:
		strcpy( cmd, cg_str );
		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype != TK_NONE ) throw CGERROR_PP_NO_REGCMD;
		if ( val != ',' ) throw CGERROR_PP_NO_REGCMD;
		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype != TK_STRING ) throw CGERROR_PP_NO_REGCMD;
		strcpy( cmd2, cg_str );

		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype == TK_NONE ) {
			if ( val != ',' ) throw CGERROR_PP_NO_REGCMD;
			GetTokenCG( GETTOKEN_DEFAULT );
			if ( ttype != TK_NUM ) throw CGERROR_PP_NO_REGCMD;
			cg_varhpi+=val;
		}

		PutHPI( HPIDAT_FLAG_TYPEFUNC, 0, cmd2, cmd );
		cg_pptype = cg_typecnt;
		cg_typecnt++;
		break;
	case TK_NUM:
		//PutHPI( HPIDAT_FLAG_SELFFUNC, 0, "", "" );
		cg_pptype = val;
		break;
	case TK_NONE:
		if (val == '*') {
			cg_typecnt++;
		}
		break;
	default:
		throw CGERROR_PP_NO_REGCMD;
	}
	//Mesf( "#regcmd [%d][%s]",cg_pptype, cmd );
}


void CToken::GenerateCodePP_cmd( void )
{
	//		HSP3Codeを展開する(cmd)
	//
	int id;
	char cmd[1024];
	if ( cg_pptype < 0 ) throw CGERROR_PP_NO_REGCMD;
	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_OBJ ) throw CGERROR_PP_NO_REGCMD;
	strcpy( cmd, cg_str );

	//if ( ttype != TK_NONE ) throw CGERROR_PP_NO_REGCMD;
	//if ( val != ',' ) throw CGERROR_PP_NO_REGCMD;
	//GetTokenCG( GETTOKEN_DEFAULT );

	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_NUM ) throw CGERROR_PP_NO_REGCMD;
	id = val;

	id = lb->Regist( cmd, cg_pptype, id , cg_orgfilefull, cg_orgline );
	GenerateLabelListAndTag(id, LABBUF_FLAG_EXCMD);
	//Mesf( "#%x:%d [%s]",cg_pptype, id, cmd );
}


void CToken::GenerateCodePP_uselib( void )
{
	//		HSP3Codeを展開する(uselib)
	//
	GetTokenCG( GETTOKEN_DEFAULT );
	cg_libname[0] = 0;
	if ( ttype == TK_STRING ) {
		strncpy( cg_libname, cg_str, 1023 );
	} else if ( ttype < TK_VOID ) {
		throw CGERROR_PP_NAMEREQUIRED;
	}
	cg_libmode = CG_LIBMODE_DLLNEW;
}


void CToken::GenerateCodePP_usecom( void )
{
	//		HSP3Codeを展開する(usecom)
	//
	int i,prmid;
	char libname[1024];
	char clsname[128];
	char iidname[128];

	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_OBJ ) {
		throw CGERROR_PP_NAMEREQUIRED;
	}
	strncpy( libname, cg_str, 1023 );

	i = lb->Search( libname );
	if ( i >= 0 ) {
		CG_MesLabelDefinition(i);
		throw CGERROR_PP_ALREADY_USE_PARAM;
	}

	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_STRING ) throw CGERROR_PP_BAD_IMPORT_IID;
	strncpy( iidname, cg_str, 127 );

	*clsname = 0;
	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype < TK_EOL ) {
		if ( ttype != TK_STRING ) throw CGERROR_PP_BAD_IMPORT_IID;
		strncpy( clsname, cg_str, 127 );
	}

	cg_libindex = PutLIB( LIBDAT_FLAG_COMOBJ, iidname );
	if ( cg_libindex < 0 ) throw CGERROR_PP_BAD_IMPORT_IID;

	SetLIBIID( cg_libindex, clsname );
	cg_libmode = CG_LIBMODE_COM;

	PutStructStart();
	prmid = PutStructEndDll( "*", cg_libindex, STRUCTPRM_SUBID_COMOBJ, -1 );
	int id = lb->Regist( libname, TYPE_DLLCTRL, prmid | TYPE_OFFSET_COMOBJ, cg_orgfilefull, cg_orgline );
	GenerateLabelListAndTag(id, LABBUF_FLAG_EXCMD);

	//Mesf( "#usecom %s [%s][%s]",libname,clsname,iidname );
}


void CToken::GenerateCodePP_func( int deftype )
{
	//		HSP3Codeを展開する(func)
	//
	int warn,i,t,subid,otflag;
	int ref;
	char fbase[1024];
	char fname[1024];

	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_OBJ ) throw CGERROR_PP_NAMEREQUIRED;
	strncpy( fbase, cg_str, 1023 );

	ref = -1;
	if (( hed_cmpmode & CMPMODE_OPTCODE )&&( tmp_lb != NULL )) {		// プリプロセス情報から最適化を行なう
		i = tmp_lb->Search( fbase );
		if ( i >= 0 ) {
			ref = tmp_lb->GetReference( i );
			//Mesf( "#func %s [use%d]", fbase, ref );
		}
	}

	warn = 0;
	otflag = deftype;
	GetTokenCG( GETTOKEN_DEFAULT );

	if ( ttype == TK_OBJ ) {
		if ( strcmp( cg_str, "onexit" ) == 0 ) {
			otflag |= STRUCTDAT_OT_CLEANUP;
			GetTokenCG( GETTOKEN_DEFAULT );
		}
	}

	if ( ref == 0 && (otflag & STRUCTDAT_OT_CLEANUP) == 0 ) {
		if ( hed_cmpmode & CMPMODE_OPTINFO ) {
#ifdef JPNMSG
			Mesf( "#未使用の外部DLL関数の登録を削除しました %s", fbase );
#else
			Mesf( "#Delete func %s", fbase );
#endif
		}
		GenerateLabelListAndTag(fbase, LABBUF_FLAG_EXCMD);
		return;
	}

	if ( cg_libmode == CG_LIBMODE_DLLNEW ) {							// 初回はDLL名を登録する
		cg_libindex = PutLIB( LIBDAT_FLAG_DLL, cg_libname );
		cg_libmode = CG_LIBMODE_DLL;
	}
	if ( cg_libmode != CG_LIBMODE_DLL ) throw CGERROR_PP_NO_USELIB;

	switch( ttype ) {
	case TK_OBJ:
		sprintf( fname,"_%s@16",cg_str );
		warn = 1;
		break;
	case TK_STRING:
		strncpy( fname, cg_str, 1023 );
		break;
	case TK_NONE:
		if ( val == '*' ) break;
		throw CGERROR_PP_BAD_IMPORT_NAME;
	default:
		throw CGERROR_PP_BAD_IMPORT_NAME;
	}
	GetTokenCG( GETTOKEN_DEFAULT );

	PutStructStart();
	if ( ttype == TK_NUM ) {
		int p1,p2,p3,p4,c1;
		warn = 1;
		p1 = p2 = p3 = p4 = MPTYPE_INUM;
		c1 = val & 3;
		if ( c1 == 1 ) p1 = MPTYPE_PVARPTR;
		if ( c1 == 2 ) p1 = MPTYPE_PBMSCR;
		if ( c1 == 3 ) {
			if (( val & 0x80 )==0 ) throw CGERROR_PP_INCOMPATIBLE_IMPORT;
			p1 = MPTYPE_PPVAL;
		}
		if ( val & 4 ) p2 = MPTYPE_LOCALSTRING;
		if ( val & 0x10 ) p4 = MPTYPE_PTR_REFSTR;
		if ( val & 0x20 ) p4 = MPTYPE_PTR_DPMINFO;
		if ( val & 0x100 ) otflag |= STRUCTDAT_OT_CLEANUP;
		if ( val & 0x200 ) {
			if ( (val&3) != 2 ) throw CGERROR_PP_INCOMPATIBLE_IMPORT;
			p1 = MPTYPE_PTR_EXINFO;
			p2 = p3 = MPTYPE_NULLPTR;
			if (( val & 0x30 ) == 0 ) p4 = MPTYPE_NULLPTR;
		}
//		if ( val & 0x220 ) throw CGERROR_PP_INCOMPATIBLE_IMPORT;

//		Mesf("#oldfunc %d,%d,%d,%d",p1,p2,p3,p4);

		PutStructParam( p1, STRUCTPRM_SUBID_STID );
		PutStructParam( p2, STRUCTPRM_SUBID_STID );
		PutStructParam( p3, STRUCTPRM_SUBID_STID );
		PutStructParam( p4, STRUCTPRM_SUBID_STID );

	} else {
		while(1) {
			if ( ttype >= TK_EOL ) break;
			if ( ttype != TK_OBJ ) throw CGERROR_PP_WRONG_PARAM_NAME;
			t = GetParameterFuncTypeCG( cg_str );
			if ( t == MPTYPE_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
			PutStructParam( t, STRUCTPRM_SUBID_STID );
			GetTokenCG( GETTOKEN_DEFAULT );

			if ( ttype >= TK_EOL ) break;
			if ( ttype != TK_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
			if ( val != ',' ) throw CGERROR_PP_WRONG_PARAM_NAME;
			GetTokenCG( GETTOKEN_DEFAULT );
		}
	}

	i = lb->Search( fbase );
	if ( i >= 0 ) {
		CG_MesLabelDefinition(i);
		throw CGERROR_PP_ALREADY_USE_FUNCNAME;
	}
	subid = STRUCTPRM_SUBID_DLL;
	if ( warn ) {
		subid = STRUCTPRM_SUBID_OLDDLL;
		//Mesf( "Warning:Old func expression [%s]", fbase );
	}
	i = PutStructEndDll( fname, cg_libindex, subid, otflag );
	int id = lb->Regist( fbase, TYPE_DLLFUNC, i, cg_orgfilefull, cg_orgline );
	GenerateLabelListAndTag(id, LABBUF_FLAG_EXCMD);

	//Mesf( "#func [%s][%s][%d]",fbase, fname, i );
}

void CToken::GenerateCodePP_comfunc( void )
{
	//		HSP3Codeを展開する(comfunc)
	//
	int i,t,subid,imp_index;
	char fbase[1024];

	if ( cg_libmode != CG_LIBMODE_COM ) throw CGERROR_PP_NO_USECOM;

	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_OBJ ) throw CGERROR_PP_NAMEREQUIRED;
	strncpy( fbase, cg_str, 1023 );

	GetTokenCG( GETTOKEN_DEFAULT );

	if ( ttype != TK_NUM ) {
		throw CGERROR_PP_BAD_IMPORT_INDEX;
	}
	imp_index = val;

	GetTokenCG( GETTOKEN_DEFAULT );

	PutStructStart();
	PutStructParam( MPTYPE_IOBJECTVAR, STRUCTPRM_SUBID_STID );

	while(1) {
		if ( ttype >= TK_EOL ) break;
		if ( ttype != TK_OBJ ) throw CGERROR_PP_WRONG_PARAM_NAME;
		t = GetParameterFuncTypeCG( cg_str );
		if ( t == MPTYPE_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
		PutStructParam( t, STRUCTPRM_SUBID_STID );
		GetTokenCG( GETTOKEN_DEFAULT );

		if ( ttype >= TK_EOL ) break;
		if ( ttype != TK_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
		if ( val != ',' ) throw CGERROR_PP_WRONG_PARAM_NAME;
		GetTokenCG( GETTOKEN_DEFAULT );
	}

	i = lb->Search( fbase );
	if ( i >= 0 ) {
		CG_MesLabelDefinition(i);
		throw CGERROR_PP_ALREADY_USE_TAGNAME;
	}
	subid = STRUCTPRM_SUBID_COMOBJ;
	i = PutStructEndDll( "*", cg_libindex, subid, imp_index );
	int id = lb->Regist(fbase, TYPE_DLLCTRL, i | TYPE_OFFSET_COMOBJ, cg_orgfilefull, cg_orgline);
	GenerateLabelListAndTag(id, LABBUF_FLAG_EXCMD);

	//Mesf( "#comfunc [%s][%d][%d]",fbase, imp_index, i );
}


int CToken::GetParameterTypeCG( char *name )
{
	//		パラメーター名を認識する(deffunc)
	//
	if ( !strcmp( cg_str,"int" ) ) return MPTYPE_INUM;
	if ( !strcmp( cg_str,"int64" ) ) return MPTYPE_INUM64;
	if ( !strcmp( cg_str,"float" ) ) return MPTYPE_FLOAT;
	if ( !strcmp( cg_str,"var" ) ) return MPTYPE_SINGLEVAR;
	if ( !strcmp( cg_str,"val" ) ) { 
#ifdef JPNMSG
		Mesf( "警告:古いdeffunc表記があります 行%d.[%s]", cg_orgline, name );
#else
		Mesf( "Warning:Old deffunc expression at %d.[%s]", cg_orgline, name );
#endif
		return MPTYPE_SINGLEVAR;
	}
	if ( !strcmp( cg_str,"str" ) ) return MPTYPE_LOCALSTRING;
	if ( !strcmp( cg_str,"double" ) ) return MPTYPE_DNUM;
	if ( !strcmp( cg_str,"label" ) ) return MPTYPE_LABEL;
	if ( !strcmp( cg_str,"local" ) ) return MPTYPE_LOCALVAR;
	if ( !strcmp( cg_str,"array" ) ) return MPTYPE_ARRAYVAR;
	if ( !strcmp( cg_str,"modvar" ) ) return MPTYPE_MODULEVAR;
	if ( !strcmp( cg_str,"modinit" ) ) return MPTYPE_IMODULEVAR;
	if ( !strcmp( cg_str,"modterm" ) ) return MPTYPE_TMODULEVAR;

	return MPTYPE_NONE;
}


int CToken::GetParameterStructTypeCG( char *name )
{
	//		パラメーター名を認識する(struct)
	//
	if ( !strcmp( cg_str,"int" ) ) return MPTYPE_INUM;
	if ( !strcmp( cg_str,"int64" ) ) return MPTYPE_INUM64;
	if ( !strcmp( cg_str,"var" ) ) return MPTYPE_LOCALVAR;
	if ( !strcmp( cg_str,"str" ) ) return MPTYPE_LOCALSTRING;
	if ( !strcmp( cg_str,"double" ) ) return MPTYPE_DNUM;
	if ( !strcmp( cg_str,"label" ) ) return MPTYPE_LABEL;
	if ( !strcmp( cg_str,"float" ) ) return MPTYPE_FLOAT;
	return MPTYPE_NONE;
}


int CToken::GetParameterFuncTypeCG( char *name )
{
	//		パラメーター名を認識する(func)
	//
	if ( !strcmp( cg_str,"int" ) ) return MPTYPE_INUM;
	if ( !strcmp( cg_str,"int64" ) ) return MPTYPE_INUM64;
	if ( !strcmp( cg_str,"var" ) ) return MPTYPE_PVARPTR;
	if ( !strcmp( cg_str,"str" ) ) return MPTYPE_LOCALSTRING;
	if ( !strcmp( cg_str,"double" ) ) return MPTYPE_DNUM;
//	if ( !strcmp( cg_str,"label" ) ) return MPTYPE_LABEL;
	if ( !strcmp( cg_str,"float" ) ) return MPTYPE_FLOAT;
	if ( !strcmp( cg_str,"pval" ) ) return MPTYPE_PPVAL;
	if ( !strcmp( cg_str,"bmscr" ) ) return MPTYPE_PBMSCR;

	if ( !strcmp( cg_str,"comobj" ) ) return MPTYPE_IOBJECTVAR;
	if ( !strcmp( cg_str,"wstr" ) ) return MPTYPE_LOCALWSTR;

	if ( !strcmp( cg_str,"sptr" ) ) return MPTYPE_FLEXSPTR;
	if ( !strcmp( cg_str,"wptr" ) ) return MPTYPE_FLEXWPTR;

	if ( !strcmp( cg_str,"prefstr" ) ) return MPTYPE_PTR_REFSTR;
	if ( !strcmp( cg_str,"pexinfo" ) ) return MPTYPE_PTR_EXINFO;
	if ( !strcmp( cg_str,"nullptr" ) ) return MPTYPE_NULLPTR;

//	if ( !strcmp( cg_str,"hwnd" ) ) return MPTYPE_PTR_HWND;
//	if ( !strcmp( cg_str,"hdc" ) ) return MPTYPE_PTR_HDC;
//	if ( !strcmp( cg_str,"hinst" ) ) return MPTYPE_PTR_HINST;

	return MPTYPE_NONE;
}


int CToken::GetParameterResTypeCG( char *name )
{
	//		戻り値のパラメーター名を認識する(defcfunc)
	//
	if ( !strcmp( cg_str,"int" ) ) return MPTYPE_INUM;
	if ( !strcmp( cg_str,"str" ) ) return MPTYPE_STRING;
	if ( !strcmp( cg_str,"double" ) ) return MPTYPE_DNUM;
	if ( !strcmp( cg_str,"label" ) ) return MPTYPE_LABEL;
	if ( !strcmp( cg_str,"float" ) ) return MPTYPE_FLOAT;
	return MPTYPE_NONE;
}

#define GET_FI_SIZE() ((int)(fi_buf->GetSize() / sizeof(HED_STRUCTDAT)))
#define GET_FI(n) (((HED_STRUCTDAT *)fi_buf->GetBuffer()) + (n))
#define STRUCTDAT_INDEX_DUMMY ((short)0x8000)


void CToken::GenerateCodePP_deffunc0( int is_command )
{
	//		HSP3Codeを展開する(deffunc / defcfunc)
	//
	int i,t,ot,prmid,subid;
	int index;
	int funcflag;
	int regflag;
	int prep;
	char funcname[1024];
	STRUCTPRM *prm;
	HED_STRUCTDAT *st;

	prep = 0;
	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_OBJ ) throw CGERROR_PP_NAMEREQUIRED;

	if ( is_command && !strcmp( cg_str,"prep" ) ) {				// プロトタイプ宣言
		prep = 1;
		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype != TK_OBJ ) throw CGERROR_PP_NAMEREQUIRED;
	}

	strncpy( funcname, cg_str, 1023 );

	for(i=0;i<cg_localcur;i++) {
		lb->SetFlag( cg_localstruct[i], -1 );		// 以前に指定されたパラメーター名を削除する
	}
	cg_localcur = 0;
	funcflag = 0;
	regflag = 1;

	index = -1;
	int label_id = lb->Search( funcname );
	if ( label_id >= 0 ) {
		if ( lb->GetType(label_id) != TYPE_MODCMD ) {
			CG_MesLabelDefinition(label_id); throw CGERROR_PP_ALREADY_USE_FUNC;
		}
		index = lb->GetOpt(label_id);
		if ( index >= 0 && GET_FI(index)->index != STRUCTDAT_INDEX_DUMMY ) {
			CG_MesLabelDefinition(label_id);
			throw CGERROR_PP_ALREADY_USE_FUNC;
		}
	}

	PutStructStart();
	while(1) {
		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype >= TK_EOL ) break;
		if ( ttype != TK_OBJ ) throw CGERROR_PP_WRONG_PARAM_NAME;

		if ( is_command && !strcmp( cg_str,"onexit" ) ) {
			funcflag |= STRUCTDAT_FUNCFLAG_CLEANUP;
			break;
		}

		t = GetParameterTypeCG( cg_str );
		if ( t == MPTYPE_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
		if (( t == MPTYPE_MODULEVAR )||( t == MPTYPE_IMODULEVAR )||( t == MPTYPE_TMODULEVAR )) {
			//	モジュール名指定
			GetTokenCG( GETTOKEN_DEFAULT );
			if ( ttype != TK_OBJ ) throw CGERROR_PP_WRONG_PARAM_NAME;
			i = lb->Search( cg_str );
			if ( i < 0 ) throw CGERROR_PP_BAD_STRUCT;
			if ( lb->GetType(i) != TYPE_STRUCT ) throw CGERROR_PP_BAD_STRUCT;
			prm = (STRUCTPRM *)mi_buf->GetBuffer();
			subid = prm[ lb->GetOpt(i) ].subid;
			//Mesf( "%s:struct%d",cg_str,subid );
			if ( t == MPTYPE_IMODULEVAR ) {
				if ( prm[ lb->GetOpt(i) ].offset != -1 ) throw CGERROR_PP_MODINIT_USED;
				prm[ lb->GetOpt(i) ].offset = GET_FI_SIZE();
				regflag = 0;
			}
			if ( t == MPTYPE_TMODULEVAR ) {
				st = (HED_STRUCTDAT *)fi_buf->GetBuffer();
				if ( st[ subid ].otindex != 0 ) throw CGERROR_PP_MODTERM_USED;
				st[ subid ].otindex = GET_FI_SIZE();
				regflag = 0;
			}
			prmid = PutStructParam( t, subid );
			GetTokenCG( GETTOKEN_DEFAULT );

		} else {
			prmid = PutStructParam( t, STRUCTPRM_SUBID_STACK );
			//Mesf( "%d:type%d",prmid,t );

			GetTokenCG( GETTOKEN_DEFAULT );
			if ( ttype == TK_OBJ ) {
				//	引数のエイリアス
				i = lb->Search( cg_str );
				if ( i >= 0 ) {
					CG_MesLabelDefinition(i);
					throw CGERROR_PP_ALREADY_USE_PARAM;
				}
				i = lb->Regist( cg_str, TYPE_STRUCT, prmid, cg_orgfilefull, cg_orgline );
				cg_localstruct[ cg_localcur++ ] = i;
				GetTokenCG( GETTOKEN_DEFAULT );
			}
		}

		if ( ttype >= TK_EOL ) break;
		if ( ttype != TK_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
		if ( val != ',' ) throw CGERROR_PP_WRONG_PARAM_NAME;
	}

	ot = PutOT( GetCS() );
	if ( index == -1 ) {
		index = GET_FI_SIZE();
		fi_buf->PreparePtr( sizeof(HED_STRUCTDAT) );
		if ( regflag ) {
			lb->Regist( funcname, TYPE_MODCMD, index, cg_orgfilefull, cg_orgline);
		}
	}
	if ( label_id >= 0 ) {
		lb->SetOpt( label_id, index );
	}
	int dat_index = is_command ? STRUCTDAT_INDEX_FUNC : STRUCTDAT_INDEX_CFUNC;
	PutStructEnd( index, funcname, dat_index, ot, funcflag );
}


void CToken::GenerateCodePP_deffunc( void )
{
	GenerateCodePP_deffunc0( 1 );
}


void CToken::GenerateCodePP_defcfunc( void )
{
	GenerateCodePP_deffunc0( 0 );
}


void CToken::GenerateCodePP_module( void )
{
	//		HSP3Codeを展開する(module)
	//
	int i,ref;
	char *modname;
	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_OBJ ) throw CGERROR_PP_NAMEREQUIRED;
	modname = cg_str;

	if (( hed_cmpmode & CMPMODE_OPTCODE )&&( tmp_lb != NULL )) {		// プリプロセス情報から最適化を行なう
		i = tmp_lb->Search( modname );
		if ( i >= 0 ) {
			ref = tmp_lb->GetReference( i );
			if ( ref == 0 ) {
				cg_flag = CG_FLAG_DISABLE;
				if ( hed_cmpmode & CMPMODE_OPTINFO ) {
#ifdef JPNMSG
					Mesf( "#未使用のモジュールを削除しました %s", modname );
#else
					Mesf( "#Delete module %s", modname );
#endif
				}
				return;
			}
		}
	}

}


void CToken::GenerateCodePP_struct( void )
{
	//		HSP3Codeを展開する(struct)
	//
	int i,t,prmid;
	char funcname[1024];
	GetTokenCG( GETTOKEN_DEFAULT );
	if ( ttype != TK_OBJ ) throw CGERROR_PP_NAMEREQUIRED;
	strncpy( funcname, cg_str, 1023 );
	i = lb->Search( funcname );
	if ( i >= 0 ) {
		CG_MesLabelDefinition(i); throw CGERROR_PP_ALREADY_USE_PARAM;
	}

	PutStructStart();
	prmid = PutStructParamTag();					// modinit用のTAG
	lb->Regist( funcname, TYPE_STRUCT, prmid, cg_orgfilefull, cg_orgline);
	//Mesf( "%d:%s",prmid, funcname );

	while(1) {
		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype >= TK_EOL ) break;
		if ( ttype != TK_OBJ ) throw CGERROR_PP_WRONG_PARAM_NAME;
		t = GetParameterStructTypeCG( cg_str );
		if ( t == MPTYPE_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
		prmid = PutStructParam( t, STRUCTPRM_SUBID_STID );
		//Mesf( "%d:type%d",prmid,t );

		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype != TK_OBJ ) throw CGERROR_PP_WRONG_PARAM_NAME;

		i = lb->Search( cg_str );
		if ( i >= 0 ) {
			CG_MesLabelDefinition(i); throw CGERROR_PP_ALREADY_USE_PARAM;
		}
		lb->Regist( cg_str, TYPE_STRUCT, prmid, cg_orgfilefull, cg_orgline);

		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype >= TK_EOL ) break;
		if ( ttype != TK_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
		if ( val != ',' ) throw CGERROR_PP_WRONG_PARAM_NAME;
	}
	PutStructEnd( funcname, STRUCTDAT_INDEX_STRUCT, 0, 0 );
}


void CToken::GenerateCodePP_defvars( int fixedvalue )
{
	//		HSP3Codeを展開する(var,varint,vardouble,varstr)
	//
	int id;
	int prms;
	prms = 0;
	while(1) {
		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype >= TK_EOL ) break;
		if ( ttype != TK_OBJ ) throw CGERROR_WRONG_VARIABLE;

		id = lb->Search(cg_str);
		if (id >= 0) {
			throw CGERROR_ALREADY_DEFINED_VARS;
		}
		id = SetVarsFixed( cg_str, fixedvalue );
		if ( lb->GetType(id) != TYPE_VAR ) {
			throw CGERROR_WRONG_VARIABLE;
		}
		lb->SetInitFlag(id, LAB_INIT_DONE);
		GenerateLabelListAndTag(id, LABBUF_FLAG_VAR);
		prms++;
		//Mesf( "name:%s(%d) fixed:%d", cg_str, id, fixedvalue );

		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype >= TK_EOL ) break;
		if ( ttype != TK_NONE ) throw CGERROR_PP_WRONG_PARAM_NAME;
		if ( val != ',' ) throw CGERROR_PP_WRONG_PARAM_NAME;
	}

	if ( prms == 0 ) {
		cg_defvarfix = fixedvalue;
	}
}


int CToken::SetVarsFixed( char *varname, int fixedvalue )
{
	//		変数の固定型を設定する
	//
	int id;
	id = lb->Search( varname );
	if ( id < 0 ) {
		id = lb->Regist( varname, TYPE_VAR, cg_valcnt, cg_orgfilefull, cg_orgline);
		cg_valcnt++;
	}
	if (fixedvalue != LAB_TYPEFIX_NONE) {
		if (lb->GetForceType(id) != LAB_TYPEFIX_NONE) {
			throw CGERROR_FORCED_VARIABLE;
		}
		lb->SetForceType(id, fixedvalue);
	}
	return id;
}


void CToken::GenerateCodePP( char *buf )
{
	//		HSP3Codeを展開する(プリプロセスコマンド)
	//
	int i;
	GetTokenCG( GETTOKEN_DEFAULT );					// 最初の'#'を読み飛ばし
	if (*cg_ptr != PickNextCodeCG()) {
		// preprocesser command "#" 
		throw CGERROR_UNKNOWN;
	}
	GetTokenCG( GETTOKEN_DEFAULT );

	if ( ttype == TK_NONE ) {						// プリプロセッサから渡される行情報
		if ( val != '#' ) throw CGERROR_UNKNOWN;
		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype != TK_NUM ) throw CGERROR_UNKNOWN;
		cg_orgline = val;
		GetTokenCG( GETTOKEN_DEFAULT );
		if ( ttype == TK_STRING ) {
			strcpy(cg_orgfilefull, cg_str);
			getpath(cg_orgfilefull,cg_orgfile,8);
			if ( cg_debug ) {
				i = PutDSBuf( cg_str );
				PutDI( 254, i, cg_orgline );				// ファイル名をデバッグ情報として登録
			}
		} else {
			if ( cg_debug ) {
				PutDI( 254, 0, cg_orgline );				// ラインだけをデバッグ情報として登録
			}
		}
		//Mesf( "#%d [%s]",cg_orgline, cg_str );
		return;
	}

	if ( ttype != TK_OBJ ) {								// その他はエラー
		throw CGERROR_PP_SYNTAX;
	}

	if ( !strcmp( cg_str,"global" ) ) { cg_flag = CG_FLAG_ENABLE; return; }

	if ( cg_flag != CG_FLAG_ENABLE ) {						// 最適化による出力抑制
		return;
	}

	if ( !strcmp( cg_str,"regcmd" ) ) { GenerateCodePP_regcmd(); return; }
	if ( !strcmp( cg_str,"cmd" ) ) { GenerateCodePP_cmd(); return; }
	if ( !strcmp( cg_str,"uselib" ) ) { GenerateCodePP_uselib(); return; }
	if ( !strcmp( cg_str,"func" ) ) { GenerateCodePP_func( STRUCTDAT_OT_STATEMENT | STRUCTDAT_OT_FUNCTION ); return; }
	if ( !strcmp( cg_str,"cfunc" ) ) { GenerateCodePP_func( STRUCTDAT_OT_FUNCTION ); return; }
	if ( !strcmp( cg_str,"cfuncd" ) ) { GenerateCodePP_func( STRUCTDAT_OT_FUNCTION | STRUCTDAT_OT_RETDOUBLE ); return; }
	if ( !strcmp( cg_str,"cfuncf" ) ) { GenerateCodePP_func( STRUCTDAT_OT_FUNCTION | STRUCTDAT_OT_RETFLOAT ); return; }
	if ( !strcmp( cg_str,"deffunc" ) ) { GenerateCodePP_deffunc(); return; }
	if ( !strcmp( cg_str,"defcfunc" ) ) { GenerateCodePP_defcfunc(); return; }
	if ( !strcmp( cg_str,"module" ) ) { GenerateCodePP_module(); return; }
	if ( !strcmp( cg_str,"struct" ) ) { GenerateCodePP_struct(); return; }
	if ( !strcmp( cg_str,"defstruct" ) ) { GenerateCodePP_defstruct(false); return; }
	if ( !strcmp( cg_str,"defunion" ) ) { GenerateCodePP_defstruct(true); return; }
	if ( !strcmp( cg_str,"endstruct" ) ) { GenerateCodePP_endstruct(); return; }
	if ( !strcmp( cg_str,"endunion" ) ) { GenerateCodePP_endstruct(); return; }
	if ( !strcmp( cg_str,"usecom" ) ) { GenerateCodePP_usecom(); return; }
	if ( !strcmp( cg_str,"comfunc" ) ) { GenerateCodePP_comfunc(); return; }
	if ( !strcmp(cg_str, "var") ) { GenerateCodePP_defvars(LAB_TYPEFIX_NONE); return; }
	if ( !strcmp(cg_str, "varint") ) { GenerateCodePP_defvars(LAB_TYPEFIX_INT); return; }
	if ( !strcmp(cg_str, "varlabel") ) { GenerateCodePP_defvars(LAB_TYPEFIX_LABEL); return; }
	if ( !strcmp( cg_str, "varstr") ) { GenerateCodePP_defvars(LAB_TYPEFIX_STR); return; }
	if ( !strcmp( cg_str,"vardouble" ) ) { GenerateCodePP_defvars( LAB_TYPEFIX_DOUBLE ); return; }
	if ( !strcmp( cg_str, "varmod") ) { GenerateCodePP_defvars(LAB_TYPEFIX_STRUCT); return; }
}


int CToken::GenerateCodeSub( void )
{
	//		文字列(１行単位)からHSP3Codeを展開する
	//		(エラー発生時は例外が発生します)
	//
	int i,t;
//	char tmp[512];

	cg_errline = line;
	cg_lastcmd = CG_LASTCMD_NONE;

	if ( cg_ptr == NULL ) return TK_EOF;

	if ( *cg_ptr == '#' ) {
		GenerateCodePP( cg_ptr );
		return TK_EOL;
	}

	// 構造体定義中ならメンバ行をパース
	if ( cg_defstruct_active >= 0 ) {
		if ( GenerateCodeStructMember() ) return TK_EOL;
	}

	if ( cg_flag != CG_FLAG_ENABLE ) return TK_EOL;				// 最適化による出力抑制

//	while(1) {
//		if ( cg_ptr!=NULL ) Mes( cg_ptr );
		GetTokenCG( GETTOKEN_LABEL );
		if ( ttype >= TK_SEPARATE ) return ttype;

		switch( ttype ) {
//		case TK_NONE:
//			sprintf( tmp,"#cod:%d",val );
//			Mes( tmp );
//			break;
//		case TK_NUM:
//			sprintf( tmp,"#num:%d",val );
//			Mes( tmp );
//			break;
//		case TK_STRING:
//			sprintf( tmp,"#str:%s",cg_str );
//			Mes( tmp );
//			break;
//		case TK_DNUM:
//			sprintf( tmp,"#dbl:%f",val_d );
//			Mes( tmp );
//			break;
		case TK_OBJ:
			cg_lastcmd = CG_LASTCMD_LET;
			i = lb->Search( cg_str );
			if ( i < 0 ) {
				//Mesf( "[%s][%d]",cg_str, cg_valcnt );
				i = SetVarsFixed( cg_str, cg_defvarfix );
				lb->SetInitFlag( i, LAB_INIT_DONE );		//	変数の初期化フラグをセットする
				GenerateCodeLET( i, true );
			} else {
				t = lb->GetType( i );
				switch( t ) {
				case TYPE_VAR:
				case TYPE_STRUCT:
					GenerateCodeLET( i );
					break;
				case TYPE_LABEL:
				case TYPE_XLABEL:
					throw CGERROR_LABELNAME;
					break;
				default:
					GenerateCodeCMD( i );
					break;
				}
			}
//			sprintf( tmp,"#obj:%s (%d)",cg_str,i );
//			Mes( tmp );
			break;
		case TK_LABEL:
			//Mesf( "#lab:%s",cg_str );
			if ( *cg_str == '@') {
				sprintf(cg_str, "@l%d", cg_locallabel );				// local label
				cg_locallabel++;
			}

			i = lb->Search( cg_str );
			if ( i >= 0 ) {
				LABOBJ *lab;
				lab = lb->GetLabel( i );
				if ( lab->type != TYPE_XLABEL ) throw CGERROR_LABELEXIST;
				lb->SetDefinition(i, cg_orgfilefull, cg_orgline);
				GenerateLabelListAndTag(i, LABBUF_FLAG_LABEL);
				SetOT( lb->GetOpt(i), GetCS() );
				lab->type = TYPE_LABEL; 
			} else {
				i = lb->Regist( cg_str, TYPE_LABEL, ot_buf->GetSize() / sizeof(int), cg_orgfilefull, cg_orgline );
				GenerateLabelListAndTag(i, LABBUF_FLAG_LABEL);
				PutOT( GetCS() );
			}
			GetTokenCG( GETTOKEN_DEFAULT );
			break;
		default:
			throw CGERROR_SYNTAX;
		}
//	}

	if ( ttype < TK_SEPARATE ) throw CGERROR_SYNTAX;
	return ttype;
}


char *CToken::GetLineCG( void )
{
	//		vs_wpから１行を取得する
	//
	char *pp;
	unsigned char *p;
	unsigned char a1;
	int skip;
	p = cg_wp;
	if ( p == NULL ) return NULL;

	pp = (char *)p;
	a1 = *p;
	if ( a1 == 0 ) { cg_wp = NULL; return NULL; }
	while(1) {
		a1=*p;

		skip = SkipMultiByte( a1 );			// 全角文字チェック
		if ( skip ) {
			p += skip+1;
			continue;
		}

		if ( a1 == 0 ) break;
		if ( a1 == 13 ) {
			*p = 0; p++; line++;
			if ( *p == 10 ) { *p = 0; p++; }
			break;
		}
		if ( a1 == 10 ) { *p=0; p++; line++; break; }
		p++;
	}
	cg_wp = p;
	return pp;
}


int CToken::GenerateCodeBlock( void )
{
	//		プロック単位でHSP3Codeを展開する
	//		(エラー発生時は例外が発生します)
	//
	int res,id,ff;
	char a1;
	char *p;
	res = GenerateCodeSub();
	if ( res == TK_EOF ) return res;
	if ( res == TK_EOL ) {
		cg_ptr = GetLineCG();
		if ( iflev ) {
			if ( ifscope[iflev-1] == CG_IFCHECK_LINE ) CheckCMDIF_Fin(0);			// 'if' jump support
		}
		if ( cg_debug ) PutDI();
		cg_orgline++;
	}
	if ( res == TK_SEPARATE ) {
		a1 = cg_str[0];
		if (a1=='{') {					// when '{'
			if ( iflev == 0 ) throw CGERROR_BLOCKEXP;
			if ( ifscope[iflev-1] == CG_IFCHECK_SCOPE ) throw CGERROR_BLOCKEXP;
			ifscope[iflev-1] = CG_IFCHECK_SCOPE;
		} else if (a1=='}') {			// when '}'
			if ( iflev == 0 ) throw CGERROR_BLOCKEXP;
			if ( ifscope[iflev-1] != CG_IFCHECK_SCOPE ) throw CGERROR_BLOCKEXP;

			ff = 0;
			p = GetTokenCG( cg_ptr, GETTOKEN_DEFAULT );

			if ( ttype == TK_EOL ) {										// 次行のコマンドがelseかどうか調べる
				if ( cg_wp != NULL ) {
					p = GetSymbolCG( (char *)cg_wp );
					if ( p != NULL ) {
						id = lb->Search( p );
						if ( id >= 0 ) {
							if (( lb->GetType(id)==TYPE_CMPCMD )&&( lb->GetOpt(id)==1 )) {
								ff = 1;
							}
						}
					}
				}
			} else if ( ttype == TK_OBJ ) {									// 次のコマンドがelseかどうか調べる
				id = lb->Search( cg_str );
				if ( id >= 0 ) {
					if (( lb->GetType(id)==TYPE_CMPCMD )&&( lb->GetOpt(id)==1 )) {
						//ifscope[iflev-1] = CG_IFCHECK_LINE;					// line scope on	
						ff = 1;
					}
				}
			}
			if ( ff == 0 ) CheckCMDIF_Fin(0);
		}
	}
	return res;
}


void CToken::RegisterFuncLabels( void )
{
	//		プリプロセス時のラベル情報から関数を定義
	//
	if ( tmp_lb == NULL ) return;
	int len = tmp_lb->GetCount();
	for( int i = 0; i < len; i ++ ) {
		if ( tmp_lb->GetType(i) == LAB_TYPE_PPMODFUNC && tmp_lb->GetFlag(i) >= 0 ) {
			char *name = tmp_lb->GetName(i);
			if ( lb->Search(name) >= 0 ) {
				throw CGERROR_PP_ALREADY_USE_FUNC;
			}
			LABOBJ* lab = tmp_lb->GetLabel(i);
			int id = lb->Regist( name, TYPE_MODCMD, -1, lab->def_file, lab->def_line );
			GenerateLabelListAndTag(id, LABBUF_FLAG_FUNC);
			lb->SetData2( id, (char *)&i, sizeof i );
		}
	}
}


void CToken::ResetGenerator(unsigned char *ptr)
{
	line = 0;
	cg_flag = CG_FLAG_ENABLE;
	cg_valcnt = 0;
	cg_typecnt = HSP3_TYPE_PLUGIN;
	cg_pptype = -1;
	cg_iflev = 0;
	cg_wp = ptr;
	cg_ptr = GetLineCG();
	cg_orgfile[0] = 0;
	cg_orgfilefull[0] = 0;
	cg_libindex = -1;
	cg_libmode = CG_LIBMODE_NONE;
	cg_lastcs = 0;
	cg_localcur = 0;
	cg_locallabel = 0;
	cg_varhpi = 0;
	cg_defvarfix = LAB_TYPEFIX_NONE;

	iflev = 0;
	replev = 0;
	for (int a = 0; a < CG_REPLEV_MAX; a++) { repend[a] = -1; }
}


int CToken::GenerateCodeMain( CMemBuf *buf )
{
	//		ソースをHSP3Codeに展開する
	//		(ソースのバッファを書き換えるので注意)
	//
	ResetGenerator((unsigned char*)buf->GetBuffer());
	int a;

	try {
		RegisterFuncLabels();

		while(1) {
			if ( GenerateCodeBlock() == TK_EOF ) break;
		}

		cg_errline = -1;				// エラーの行番号は該当なし

		//		コンパイル後の後始末チェック
		if ( replev != 0 ) throw CGERROR_LOOP_NOTFOUND;

		//		ラベル未処理チェック
		int errend;
		errend = 0;
		for( a=0; a<lb->GetCount(); a++ ) {
			if ( lb->GetType(a) == TYPE_XLABEL ) {
#ifdef JPNMSG
				Mesf( "#ラベルの定義が存在しません [%s]", lb->GetName(a) );
#else
				Mesf( "#Label definition not found [%s]", lb->GetName(a) );
#endif
				errend++;
			}
		}
		
		//		関数未処理チェック
		for( a=0; a<GET_FI_SIZE(); a++ ) {
			if ( GET_FI(a)->index == STRUCTDAT_INDEX_DUMMY ) {
#ifdef JPNMSG
				Mesf( "#関数が定義されていません [%s]", lb->GetName(GET_FI(a)->otindex) );
#else
				Mesf( "#Function not found [%s]", lb->GetName(GET_FI(a)->otindex) );
#endif
				errend++;
			}
		}
		
		//      ブレース対応チェック 
		if ( iflev > 0 ) {
#ifdef JPNMSG
				Mesf( "#波括弧が閉じられていません" );
#else
				Mesf( "#Missing closing braces" );
#endif
				errend ++;
		}

		if ( errend ) throw CGERROR_FATAL;
	}
	catch ( CGERROR code ) {
		return (int)code;
	}

	return 0;
}


int CToken::GenerateCodeMainSkipError(CMemBuf* buf)
{
	//		ソースをHSP3Codeに展開する(エラースキップ)
	//
	ResetGenerator((unsigned char*)buf->GetBuffer());

	try {
		RegisterFuncLabels();
	}
	catch (CGERROR code) {
		Mesf("#Skip error (%d).\r\n", (int)code);
	}

	while (1) {
		try {
			if (GenerateCodeBlock() == TK_EOF) break;
		}
		catch (CGERROR code) {
			Mesf("#Skip error (%d).\r\n",(int)code);
			cg_ptr = GetLineCG();
			cg_orgline++;
		}
	}
	return 0;
}


void CToken::PutCS( int type, int value, int exflg )
{
	//		Register command code
	//		(HSP ver3.3以降用)
	//			type=0-0xfff ( -1 to debug line info )
	//			val=16,32bit length supported
	//
	int a;
	unsigned int v;
	v=(unsigned int)value;

	a=( type & CSTYPE ) | exflg;
	if ( v<0x10000 ) {						// when 16bit encode
		cs_buf->Put( (short)(a) );
		cs_buf->Put( (short)(v) );
	}
	else {									// when 32bit encode
		cs_buf->Put( (short)(0x8000 | a) );
		cs_buf->Put( (int)value );
	}
}


void CToken::PutCS( int type, double value, int exflg )
{
	//		Register command code (double)
	//
	PutCS( type, PutDS(value), exflg );
}


void CToken::PutCSSymbol( int label_id, int exflag )
{
	//		まだ定義されていない関数の呼び出しがあったら仮登録する
	//
	int type = lb->GetType(label_id);
	int value = lb->GetOpt(label_id);
	if ( type == TYPE_MODCMD && value == -1 ) {
		int id = *(int *)lb->GetData2(label_id);
		tmp_lb->AddReference( id );
		
		HED_STRUCTDAT st = { STRUCTDAT_INDEX_DUMMY };
		st.otindex = label_id;
		value = GET_FI_SIZE();
		fi_buf->PutData( &st, sizeof(HED_STRUCTDAT) );
		lb->SetOpt( label_id, value );
	}
	if ( exflag & EXFLG_1 && type != TYPE_VAR && type != TYPE_STRUCT ) {
		value &= 0xffff;
	}
	PutCS( type, value, exflag );
}


int CToken::GetCS( void )
{
	//		Get current CS index
	//
	return ( cs_buf->GetSize() )>>1;
}


int CToken::PutDS(double value)
{
	//		Register doubles to data segment
	//
	int i = ds_buf->GetSize();

	ds_buf->Put(value);
	return i;
}

int CToken::PutDS(int64_t value)
{
	//		Register int64 to data segment
	//
	int i = ds_buf->GetSize();
	ds_buf->PutData( (char *)&value, sizeof(int64_t) );
	return i;
}

void CToken::PutCS( int type, int64_t value, int exflg )
{
	//		Register int64 command code
	//		(DSに格納してオフセットで参照)
	//
	PutCS( type, PutDS(value), exflg );
}


int CToken::PutDS( char *str )
{
	//		Register strings to data segment (script string)
	//
	return PutDSStr(str, cg_utf8out != 0);
}


int CToken::PutDSBuf( char *str )
{
	//		Register strings to data segment (direct)
	//
	return PutDSStr(str, false);
}


int CToken::PutDSStr(char *str, bool converts_to_utf8)
{
	//		Register strings to data segment (caching)

	char *p;

	// output as UTF8 format
	if ( converts_to_utf8 ) {
		p = ExecSCNV(str, SCNV_OPT_SJISUTF8);
	} else {
		p = str;
		if (pp_utf8) {
			if ((hed_cmpmode & CMPMODE_UTF8OUT)==0) {
				p = ExecSCNV(str, SCNV_OPT_UTF8SJIS);
			}
		}
	}

	int i = ds_buf->GetSize();

	if ( CG_optCode() ) {
		if (*p != 0) {
			int i_cache = ds_buf->SearchIndexedData(p, -1);
			if (i_cache >= 0) {
				if (CG_optInfo()) {
					Mesf("#String pool:%s", p);
				}
				return i_cache;
			}
		}
	}

	ds_buf->IndexExclusive();				// 文字列はindexを登録する

	if ( converts_to_utf8 ) {
		ds_buf->PutData(p, (int)(strlen(p) + 1));
	} else {
		ds_buf->PutStr(p);
		ds_buf->Put((char)0);
	}
	return i;
}


int CToken::PutDSBuf( char *str, int size )
{
	//		Register strings to data segment (direct)
	//
	int i;
	i = ds_buf->GetSize();
	ds_buf->PutData( str, size );
	return i;
}


int CToken::PutOT( int value )
{
	//		Register object temp
	//
	int i;
	i = ot_buf->GetSize() / sizeof( int );
	ot_buf->Put( value );
	return i;
}


void CToken::SetOT( int id, int value )
{
	//		Modify object temp
	//
	int *p;
	p = (int *)( ot_buf->GetBuffer() );
	p[ id ] = value;
}


void CToken::PutDI( void )
{
	//		Debug code register
	//
	//		mem_di formats :
	//			0-250           = offset to old mcs
	//			252,x(16)       = big offset
	//			253,x(24),y(16) = used val (x=mds ptr.)
	//			254,x(24),y(16) = new filename accepted (x=mds ptr.)
	//			255             = end of debug data
	//
	int ofs;
	ofs=(int)( GetCS() - cg_lastcs );
	if ( ofs <= 250 ) {
		di_buf->Put( (unsigned char)ofs );
	} else {
		di_buf->Put( (unsigned char)252 );
		di_buf->Put( (unsigned char)(ofs) );
		di_buf->Put( (unsigned char)(ofs>>8) );
	}
	cg_lastcs = GetCS();
}


void CToken::PutDI( int dbg_code, int a, int subid )
{
	//		special Debug code register
	//			in : -1=end of code
	//				254=(a=file ds ptr./subid=line num.)
	//
	if (dbg_code<0) {
		di_buf->Put( (unsigned char)255 );
		di_buf->Put( (unsigned char)255 );
	} else {
		di_buf->Put( (unsigned char)dbg_code );
		di_buf->Put( (unsigned char)(a) );
		di_buf->Put( (unsigned char)(a>>8) );
		di_buf->Put( (unsigned char)(a>>16) );
		di_buf->Put( (unsigned char)(subid) );
		di_buf->Put( (unsigned char)(subid>>8) );
	}
}


void CToken::PutDIVars( void )
{
	//		Debug info register for vals
	//
	int a,i,id;
	LABOBJ *lab;
	char vtmpname[256];
	char *p;

	id = 0;
	strcpy( vtmpname, "I_" );

	for( a=0; a<lb->GetNumEntry(); a++ ) {
		lab = lb->GetLabel(a);
		if ( lab->type == TK_OBJ ) {
			switch( lab->typefix ) {
			case LAB_TYPEFIX_INT:
				vtmpname[0] = 'I';
				p = vtmpname;
				strcpy( p+2, lab->name );
				break;
			case LAB_TYPEFIX_DOUBLE:
				vtmpname[0] = 'D';
				p = vtmpname;
				strcpy( p+2, lab->name );
				break;
			case LAB_TYPEFIX_NONE:
			default:
				p = lab->name;
				break;
			}
			i = PutDS( p );
			PutDI( 253, i, lab->opt );
		}
	}
}


// ラベル名の情報を出力する
void CToken::PutDILabels( void )
{
	int num = ot_buf->GetSize() / sizeof(int);
	int *table = new int[num];
	for (int i = 0; i < num; i++) table[i] = -1;
	for (int i = 0; i < lb->GetNumEntry(); i++) {
		if (lb->GetType(i) == TYPE_LABEL) {
			int id = lb->GetOpt(i);
			table[id] = i;
		}
	}
	di_buf->Put((unsigned char)255);
	for (int i = 0; i < num; i ++) {
		if (table[i] == -1) continue;
		char *name = lb->GetName(table[i]);
		int dsPos = PutDSBuf(name);
		PutDI(251, dsPos, i);
	}
	delete[] table;
}


// 引数名の情報を出力する
void CToken::PutDIParams( void )
{
	di_buf->Put((unsigned char)255);
	for (int i = 0; i < lb->GetNumEntry(); i++) {
		if (lb->GetType(i) == TYPE_STRUCT) {
			int id = lb->GetOpt(i);
			if (id < 0) continue;
			char *name = lb->GetName(i);
			int dsPos = PutDSBuf(name);
			PutDI(251, dsPos, id);
		}
	}
}


//　登録キーワード情報を出力する
void CToken::GenerateLabelList(int mode, char* match)
{
}


char *CToken::GetDS( int ptr )
{
	int i;
	char *p;
	i = ds_buf->GetSize();
	if ( ptr >= i ) return NULL;
	p = ds_buf->GetBuffer();
	p += ptr;
	return p;
}


/*
	rev 54
	mingw : warning : i は未初期化で使用されうる
	に対処。
*/

int CToken::PutLIB( int flag, char *name )
{
	int a,i = -1,p;
	HED_LIBDAT lib;
	HED_LIBDAT *l;
	p = li_buf->GetSize() / sizeof(HED_LIBDAT);
	l = (HED_LIBDAT *)li_buf->GetBuffer();

	if ( flag == LIBDAT_FLAG_DLL ) {
		if ( *name != 0 ) {
			for( a=0; a<p; a++ ) {
				if ( l->flag == flag ) {
					if ( strcmp( GetDS( l->nameidx ), name )==0 ) {
						return a;
					}
				}
				l++;
			}
			i = PutDSBuf( name );
		} else {
			i = -1;
		}
	}
	if ( flag == LIBDAT_FLAG_COMOBJ ) {
		COM_GUID guid;
		if ( ConvertIID( &guid, name ) ) return -1;
		i = PutDSBuf( (char *)&guid, sizeof(COM_GUID) );
	}

	lib.flag = flag;
	lib.nameidx = i;
#ifdef PTR64BIT
	lib.p_hlib = 0;
#else
	lib.hlib = NULL;
#endif
	lib.clsid = -1;
	li_buf->PutData( &lib, sizeof(HED_LIBDAT) );
	//Mesf( "LIB#%d:%s",flag,name );

	return p;
}


void CToken::SetLIBIID( int id, char *clsid )
{
	HED_LIBDAT *l;
	l = (HED_LIBDAT *)li_buf->GetBuffer();
	l += id;
	if ( *clsid == 0 ) {
		l->clsid = -1;
	} else {
		l->clsid = PutDSBuf( clsid );
	}
}


int CToken::PutStructParam( short mptype, int extype )
{
	int size;
	int i;
	STRUCTPRM prm;

	i = mi_buf->GetSize() / sizeof(STRUCTPRM);

	prm.mptype = mptype;
	if ( extype == STRUCTPRM_SUBID_STID ) {
		prm.subid  = (short)GET_FI_SIZE();
	} else {
		prm.subid = extype;
	}
	prm.offset = cg_stsize;

	size = 0;
	switch( mptype ) {
	case MPTYPE_INUM:
	case MPTYPE_STRUCT:
		size = sizeof(int);
		break;
	case MPTYPE_INUM64:
		size = sizeof(int64_t);
		break;
	case MPTYPE_LOCALVAR:
		size = sizeof(PVal);
		break;
	case MPTYPE_DNUM:
		size = sizeof(double);
		break;
	case MPTYPE_FLOAT:
		size = sizeof(float);
		break;
	case MPTYPE_LOCALSTRING:
	case MPTYPE_STRING:
	case MPTYPE_LABEL:
	case MPTYPE_PPVAL:
	case MPTYPE_PBMSCR:
	case MPTYPE_PVARPTR:
	case MPTYPE_IOBJECTVAR:
	case MPTYPE_LOCALWSTR:
	case MPTYPE_FLEXSPTR:
	case MPTYPE_FLEXWPTR:
	case MPTYPE_PTR_REFSTR:
	case MPTYPE_PTR_EXINFO:
	case MPTYPE_PTR_DPMINFO:
	case MPTYPE_NULLPTR:
		// XXX 32bit版換算でax出力する
		//size = sizeof(char *);
		size = 4;
		break;
	case MPTYPE_SINGLEVAR:
	case MPTYPE_ARRAYVAR:
		size = sizeof(MPVarData);
		break;
	case MPTYPE_MODULEVAR:
	case MPTYPE_IMODULEVAR:
	case MPTYPE_TMODULEVAR:
		size = sizeof(MPModVarData);
		break;
	default:
		return i;
	}
	cg_stsize += size;
	cg_stnum++;
	mi_buf->PutData( &prm, sizeof(STRUCTPRM) );
	return i;
}


int CToken::PutStructParamTag( void )
{
	int i;
	STRUCTPRM prm;

	i = mi_buf->GetSize() / sizeof(STRUCTPRM);

	prm.mptype = MPTYPE_STRUCTTAG;
	prm.subid  = (short)GET_FI_SIZE();
	prm.offset = -1;

	cg_stnum++;
	mi_buf->PutData( &prm, sizeof(STRUCTPRM) );
	return i;
}


void CToken::PutStructStart( void )
{
	cg_stnum = 0;
	cg_stsize = 0;
	cg_stptr = mi_buf->GetSize() / sizeof(STRUCTPRM);
}


int CToken::PutStructEnd( int i, char *name, int libindex, int otindex, int funcflag )
{
	//		STRUCTDATを登録する(モジュール用)
	//
	HED_STRUCTDAT st;
	st.index = libindex;
	st.nameidx = PutDSBuf( name );
	st.subid = i;
	st.prmindex = cg_stptr;
	st.prmmax = cg_stnum;
	st.funcflag = funcflag;
	st.size = cg_stsize;
	if ( otindex < 0 ) {
		st.otindex = 0;
		st.subid = otindex;
	} else {
		st.otindex = otindex;
	}
	*GET_FI(i) = st;
	//Mesf( "#%d : %s(LIB%d) prm%d size%d ot%d", i, name, libindex, cg_stnum, cg_stsize, otindex );
	return i;
}


int CToken::PutStructEnd( char *name, int libindex, int otindex, int funcflag )
{
	int i = GET_FI_SIZE();
	fi_buf->PreparePtr( sizeof(HED_STRUCTDAT) );
	return PutStructEnd( i, name, libindex, otindex, funcflag );
}

int CToken::PutStructEndDll( char *name, int libindex, int subid, int otindex )
{
	//		STRUCTDATを登録する(DLL用)
	//
	int i;
	HED_STRUCTDAT st;
	i = GET_FI_SIZE();
	st.index = libindex;
	if ( name[0] == '*' ) {
		st.nameidx = -1;
	} else {
		st.nameidx = PutDSBuf( name );
	}
	st.subid = subid;
	st.prmindex = cg_stptr;
	st.prmmax = cg_stnum;
	//st.proc = NULL;
	st.funcflag = 0;
	st.size = cg_stsize;
	st.otindex = otindex;
	fi_buf->PutData( &st, sizeof(HED_STRUCTDAT) );
	//Mesf( "#%d : %s(LIB%d) prm%d size%d ot%d", i, name, libindex, cg_stnum, cg_stsize, otindex );
	return i;
}


void CToken::PutHPI( short flag, short option, char *libname, char *funcname )
{
	HPIDAT hpi;
	hpi.flag = flag;
	hpi.option = option;
	hpi.libname = PutDSBuf( libname );
	hpi.funcname = PutDSBuf( funcname );
#ifndef PTR64BIT
	hpi.libptr = NULL;
#else
	hpi.p_libptr = 0;
#endif
	hpi_buf->PutData( &hpi, sizeof(HPIDAT) );
}


int CToken::GenerateCode( char *fname, char *oname, int mode )
{
	CMemBuf srcbuf;
	if ( srcbuf.PutFile( fname ) < 0 ) {
		Mes( "#No file." );
		return -1;
	}
	return GenerateCode( &srcbuf, oname, mode );
}


int CToken::GenerateCode( CMemBuf *srcbuf, char *oname, int mode )
{
	//		ファイルをHSP3Codeに展開する
	//		mode			COMP_MODE_DEBUG Debug code (0=off 1=on)
	//						COMP_MODE_UTF8  utf-8 out (0=off 1=on)
	//
	int i,orgcs,res;
	int adjsize;
	CMemBuf optbuf;				// オプション文字列用バッファ
	CMemBuf exoptbuf;			// 拡張オプション用バッファ
	CMemBuf bakbuf;				// プリプロセッサソース保存用バッファ

	cs_buf = new CMemBuf;
	ds_buf = new CMemBuf;
	ot_buf = new CMemBuf;
	di_buf = new CMemBuf;
	li_buf = new CMemBuf;
	fi_buf = new CMemBuf;
	mi_buf = new CMemBuf;
	fi2_buf = new CMemBuf;
	hpi_buf = new CMemBuf;

	bakbuf.PutStr( srcbuf->GetBuffer() );				// プリプロセッサソースを保存する

	cg_defstruct_active = -1;
	cg_structdim_varid = -1;
	cg_debug = mode & COMP_MODE_DEBUG;
	cg_utf8out = mode & COMP_MODE_UTF8;
	cg_strmap = mode & COMP_MODE_STRMAP;
	cg_skiperror = mode & COMP_MODE_SKIPERROR;
	if ( pp_utf8 ) cg_utf8out = 0;						// ソースコードがUTF-8の場合は変換は必要ない

	if (cg_utf8out) {
		Mes("#use UTF-8 strings.");
	}
	if (cg_strmap) {
		Mes("#output string map.");
	}

	ds_buf->AddIndexBuffer();

	cg_putvars = hed_cmpmode & CMPMODE_PUTVARS;

	if (cg_skiperror) {
		res = GenerateCodeMainSkipError(srcbuf);
	}
	else {
		res = GenerateCodeMain(srcbuf);
	}

	if ( res ) {
		//		エラー終了
		char tmp[512];
		CStrNote note;
		CMemBuf srctmp;
#ifdef JPNMSG
		Mesf( "%s(%d) : error %d : %s (%d行目)", cg_orgfile, cg_orgline, res, cg_geterror((CGERROR)res), cg_orgline );
#else
		Mesf("%s(%d) : error %d : %s (line %d)", cg_orgfile, cg_orgline, res, cg_geterror((CGERROR)res), cg_orgline);
#endif
		if ( cg_errline > 0 ) {
			note.Select( bakbuf.GetBuffer() );
			note.GetLine( tmp, cg_errline-1, 510 );
			Mesf( "--> %s",tmp );
		}
	} else {
		//		正常終了
		CMemBuf axbuf;
		HSPHED hsphed;
		int sz_hed, sz_opt, cs_size, ds_size, ot_size, di_size;
		int li_size, fi_size, mi_size, fi2_size, hpi_size;
		int sz_exopt;

		orgcs = GetCS();
		PutCS( TYPE_PROGCMD, 0x11, EXFLG_1 );			// 終了コードを最後に入れる
		i=PutOT( orgcs );
		PutCS( TYPE_PROGCMD, 0, EXFLG_1 );
		PutCS( TYPE_LABEL, i, 0 );

		if ( cg_debug ) {
			PutDI();
		}
		if (( cg_debug )||( cg_putvars )) {
			PutDIVars();
		}
		if ( cg_debug ) {
			PutDILabels();
			PutDIParams();
		}
		PutDI( -1, 0, 0 );								// デバッグ情報終端

		sz_hed = sizeof(HSPHED);
		memset( &hsphed, 0, sz_hed );
		hsphed.bootoption = 0;
		hsphed.runtime = 0;

		if ( hed_option & HEDINFO_RUNTIME ) {
			optbuf.PutStr( hed_runtime );
		}
		sz_opt = optbuf.GetSize();
		if ( sz_opt ) {
			while(1) {
				adjsize = ( sz_opt + 15 ) & 0xfff0;
				if ( adjsize == sz_opt ) break;
				optbuf.Put( (char)0 );
				sz_opt = optbuf.GetSize();
			}
			hsphed.bootoption |= HSPHED_BOOTOPT_RUNTIME;
			hsphed.runtime = sz_hed;
			sz_hed += sz_opt;
			if (hed_option & HEDINFO_UTF8) hsphed.bootoption |= HSPHED_BOOTOPT_UTF8;		// ランタイムはUTF8を使用する
			if (hed_option & HEDINFO_HSP64) hsphed.bootoption |= HSPHED_BOOTOPT_HSP64;		// ランタイムは64bitで動作する
		}

		//		デバッグウインドゥ表示
		if ( mode & COMP_MODE_DEBUGWIN ) hsphed.bootoption |= HSPHED_BOOTOPT_DEBUGWIN;
		//		起動オプションの設定
		if (hed_autoopt_timer >= 0) {
			// awaitが使用されていない場合はマルチメディアタイマーを無効にする(自動設定)
			if (hed_autoopt_timer == 0) hsphed.bootoption |= HSPHED_BOOTOPT_NOMMTIMER;
		} else {
			// 設定されたオプションに従ってマルチメディアタイマーを無効にする
			if (hed_option & HEDINFO_NOMMTIMER) hsphed.bootoption |= HSPHED_BOOTOPT_NOMMTIMER;
		}

		if (hed_option & HEDINFO_NOGDIP) hsphed.bootoption |= HSPHED_BOOTOPT_NOGDIP;		// GDI+による描画を無効にする
		if (hed_option & HEDINFO_FLOAT32) hsphed.bootoption |= HSPHED_BOOTOPT_FLOAT32;		// 実数を32bit floatとして処理する
		if (hed_option & HEDINFO_ORGRND) hsphed.bootoption |= HSPHED_BOOTOPT_ORGRND;		// 標準の乱数発生を使用する
		if (hed_option & HEDINFO_IORESUME) hsphed.bootoption |= HSPHED_BOOTOPT_IORESUME;	// ファイルI/Oエラーを無視して処理を続行する

		//		文字列テーブルの作成
		if (hed_autoopt_strexchange > 0) {
			int dspool_size = ds_buf->GetIndexBufferSize();
			if (dspool_size) {
				exoptbuf.Put((int)(HSPHED_EXOPTION_TAG_DSINDEX)+(dspool_size << 16));
				exoptbuf.PutData(ds_buf->GetIndexBuffer(), dspool_size * sizeof(int));
			}
		}
		//		型固定情報の作成
		if (cg_debug) {
			for (i = 0; i < lb->GetCount(); i++) {
				if (lb->GetType(i) == TYPE_VAR) {
					int fixedvalue = lb->GetForceType(i);
					if (fixedvalue != LAB_TYPEFIX_NONE) {
						int bodysize = sizeof(int) * 2;
						//Mes(lb->GetName(i));
						exoptbuf.Put((int)(HSPHED_EXOPTION_TAG_VARFIX)+(bodysize << 16));
						exoptbuf.Put(lb->GetOpt(i));
						exoptbuf.Put(fixedvalue);
					}
				}
			}
		}

		if (exoptbuf.GetSize()) {
			//	exoptの終端
			exoptbuf.Put((int)HSPHED_EXOPTION_TAG_NONE);
		}

		sz_exopt = exoptbuf.GetSize();

		cs_size = cs_buf->GetSize();
		ds_size = ds_buf->GetSize();
		ot_size = ot_buf->GetSize();
		di_size = di_buf->GetSize();

		li_size = li_buf->GetSize();
		fi_size = fi_buf->GetSize();
		mi_size = mi_buf->GetSize();
		fi2_size = fi2_buf->GetSize();
		hpi_size = hpi_buf->GetSize();

		hsphed.h1='H';
		hsphed.h2='S';
		hsphed.h3='P';
		hsphed.h4='3';
		hsphed.version = 0x0360;						// version3.5
		hsphed.max_val = cg_valcnt;						// max count of VAL Object
		hsphed.allsize  = sz_hed + cs_size + ds_size + ot_size + di_size;
		hsphed.allsize += li_size + fi_size + mi_size + fi2_size + hpi_size + sz_exopt;

		hsphed.pt_cs = sz_hed;							// ptr to Code Segment
		hsphed.max_cs = cs_size;						// size of CS
		hsphed.pt_ds = sz_hed + cs_size;				// ptr to Data Segment
		hsphed.max_ds = ds_size;						// size of DS
		hsphed.pt_ot = hsphed.pt_ds + ds_size;			// ptr to Object Temp
		hsphed.max_ot = ot_size;						// size of OT
		hsphed.pt_dinfo = hsphed.pt_ot + ot_size;		// ptr to Debug Info
		hsphed.max_dinfo = di_size;						// size of DI

		hsphed.pt_linfo = hsphed.pt_dinfo + di_size;	// ptr to Debug Info
		hsphed.max_linfo = li_size;						// size of LINFO

		hsphed.pt_finfo = hsphed.pt_linfo + li_size;	// ptr to Debug Info
		hsphed.max_finfo = fi_size;						// size of FINFO

		hsphed.pt_minfo = hsphed.pt_finfo + fi_size;	// ptr to Debug Info
		hsphed.max_minfo = mi_size;						// size of MINFO

		hsphed.pt_finfo2 = hsphed.pt_minfo + mi_size;	// ptr to Debug Info
		hsphed.max_finfo2 = fi2_size;					// size of FINFO2

		hsphed.pt_hpidat = hsphed.pt_finfo2 + fi2_size;	// ptr to Debug Info
		hsphed.max_hpi = hpi_size;						// size of HPIDAT
		hsphed.max_varhpi = cg_varhpi;					// Num of Vartype Plugins

		hsphed.pt_sr = sizeof(HSPHED);					// ptr to Option Segment
		hsphed.max_sr = sz_opt;							// size of Option Segment
		hsphed.pt_exopt = hsphed.pt_hpidat + hpi_size;
		hsphed.max_exopt = sz_exopt;


		axbuf.PutData( &hsphed, sizeof(HSPHED) );
		if ( sz_opt ) axbuf.PutData( optbuf.GetBuffer(), sz_opt );

		if ( cs_size ) axbuf.PutData( cs_buf->GetBuffer(), cs_size );
		if ( ds_size ) axbuf.PutData( ds_buf->GetBuffer(), ds_size );
		if ( ot_size ) axbuf.PutData( ot_buf->GetBuffer(), ot_size );
		if ( di_size ) axbuf.PutData( di_buf->GetBuffer(), di_size );

		if ( li_size ) axbuf.PutData( li_buf->GetBuffer(), li_size );
		if ( fi_size ) axbuf.PutData( fi_buf->GetBuffer(), fi_size );
		if ( mi_size ) axbuf.PutData( mi_buf->GetBuffer(), mi_size );
		if ( fi2_size ) axbuf.PutData( fi2_buf->GetBuffer(), fi2_size );
		if (hpi_size) axbuf.PutData( hpi_buf->GetBuffer(), hpi_size );
		if (sz_exopt) axbuf.PutData( exoptbuf.GetBuffer(), sz_exopt );

		if (cg_strmap) {
			if (*oname != 0) res = SaveStringMap(oname);
		}
		else {
			if (*oname != 0) res = axbuf.SaveFile(oname);
		}
		if ( res<0 ) {
#ifdef JPNMSG
			Mes( "#出力ファイルを書き込めません" );
#else
			Mes( "#Can't write output file." );
#endif
		} else {
			int n_mod, n_hpi;
			n_hpi = hpi_buf->GetSize() / sizeof(HPIDAT);
			n_mod = fi_buf->GetSize() / sizeof(HED_STRUCTDAT);
			Mesf( "#Code size (%d) String data size (%d) param size (%d)",cs_size,ds_size,mi_buf->GetSize() );
			Mesf( "#Vars (%d) Labels (%d) Modules (%d) Libs (%d) Plugins (%d)",cg_valcnt,ot_size>>2,n_mod,li_size,n_hpi );
			if (sz_exopt) {
				Mesf("#Output extra data field (%d).", sz_exopt);
			}
			Mesf( "#No error detected. (total %d bytes)",hsphed.allsize );
			res = 0;

			if (labbuf!=NULL) {
				GenerateLabelList(cg_labout_mode, cg_labout_match);
			}

		}
	}

	delete hpi_buf;
	delete fi2_buf;
	delete mi_buf;
	delete fi_buf;
	delete li_buf;

	delete di_buf;
	delete ot_buf;
	delete ds_buf;
	delete cs_buf;

	return res;
}


void CToken::CG_MesLabelDefinition(int label_id)
{
	if ( !cg_debug ) return;

	LABOBJ* const labobj = lb->GetLabel(label_id);
	if ( labobj->def_file ) {
#ifdef JPNMSG
		Mesf("#識別子「%s」の定義位置: line %d in [%s]", lb->GetName(label_id), labobj->def_line, labobj->def_file);
#else
		Mesf("#Identifier '%s' has already defined in line %d in [%s]", lb->GetName(label_id), labobj->def_line, labobj->def_file);
#endif
	}
}


int	CToken::SaveStringMap(char* fname)
{
	//	Output String Map
	//
	int max, i, ofs, ptr, chksum;
	unsigned char* p;
	unsigned char* mem;
	unsigned char a1;
	CMemBuf outbuf;

	outbuf.PutStrf(";	strmap v0.5 %s", fname);
	outbuf.PutCR();

	max = ds_buf->GetIndexBufferSize();
	mem = (unsigned char *)ds_buf->GetBuffer();
	for (i = 0; i < max; i++) {
		ptr = ds_buf->GetIndex(i);
		p = mem + ptr;
		chksum = 0; ofs = 0;
		while (1) {
			a1 = p[ofs++];
			if (a1 == 0) break;
			chksum += ofs + ((int)a1)*7;
		}
		outbuf.PutStrf("&&&&dsmap:%d,%d,%d", ofs, ptr, chksum);
		outbuf.PutCR();
		outbuf.PutStr((char *)p);
		outbuf.PutCR();
	}

	return outbuf.SaveFile(fname);
}


void CToken::GenerateLabelTag(char* name, int flag, int type, char* fname, int line)
{
	//	クロスリファレンス用のメッセージを出力する
	if (labbuf == NULL) return;

	char textbf[4096];
	if (cg_labout_match != NULL) {
		if (cg_labout_mode & LABLIST_MODE_PARTMATCH) {
			if (strstr2(name, cg_labout_match) == NULL) return;
		}
		else {
			if (strcmp(name, cg_labout_match) != 0) return;
		}
	}
	int pflag = flag & (LABBUF_FLAG_REFER-1);

	switch (cg_labout_mode & (LABLIST_MODE_REFERENCE-1)) {
	case LABLIST_MODE_LABEL:
		if ((pflag != LABBUF_FLAG_LABEL) && (pflag != LABBUF_FLAG_FUNC)) return;
		break;
	case LABLIST_MODE_VAR:
		if ((pflag != LABBUF_FLAG_VAR) && (pflag != LABBUF_FLAG_EXVAR)) return;
		break;
	case LABLIST_MODE_ALL:
	default:
		break;
	}

	sprintf(textbf, "d%s %s %d:%s\r\n", GetLabelListHeader(flag), name, line, fname);
	if (flag & LABBUF_FLAG_REFER) textbf[0] = 'r';

	labbuf->PutStr(textbf);
}


void CToken::GenerateLabelListAndTag(int labelid, int flag)
{
	if (labbuf == NULL) return;

	LABOBJ* lab;
	lab = lb->GetLabel(labelid);
	if (lab == NULL) return;

	GenerateLabelTag(lab->name, flag, lab->type, (char*)lab->def_file, lab->def_line);
}


void CToken::GenerateLabelListAndTag(char *name, int flag)
{
	if (labbuf == NULL) return;
	GenerateLabelTag(name, flag , 0, cg_orgfilefull, cg_orgline);
}


void CToken::GenerateLabelListAndTagRef(int labelid, int flag )
{
	if (labbuf == NULL) return;

	LABOBJ* lab;
	lab = lb->GetLabel(labelid);
	if (lab == NULL) return;

	if (lab->skiplablist) {
		lab->skiplablist = false;
		return;
	}
	if ((cg_labout_mode & LABLIST_MODE_REFERENCE) == 0) return;

	GenerateLabelTag(lab->name, flag| LABBUF_FLAG_REFER, lab->type, cg_orgfilefull, cg_orgline );
}


/*------------------------------------------------------------*/
/*
		UserStruct support (#defstruct / #defunion)
*/
/*------------------------------------------------------------*/

int CToken::GetStructDefId(const char *name)
{
	// 大文字小文字を区別しない検索
	for (int i = 0; i < (int)cg_structdefs.size(); i++) {
		if (_stricmp(cg_structdefs[i].name.c_str(), name) == 0) return i;
	}
	return -1;
}

int CToken::GetStructMemberSize(StructMemberType stype)
{
	switch (stype) {
	case SMT_BYTE:   return 1;
	case SMT_BOOL1:  return 1;
	case SMT_SHORT:  return 2;
	case SMT_BOOL2:  return 2;
	case SMT_INT:    return 4;
	case SMT_FLOAT:  return 4;
	case SMT_BOOL:   return 4;
	case SMT_INT64:  return 8;
	case SMT_DOUBLE: return 8;
#ifdef PTR64BIT
	case SMT_PTR:    return 8;
#else
	case SMT_PTR:    return 4;
#endif
	default:         return 0;
	}
}

// アライメント計算
static int align_offset(int offset, int alignment)
{
	if (alignment <= 1) return offset;
	int remainder = offset % alignment;
	if (remainder == 0) return offset;
	return offset + (alignment - remainder);
}

// メンバ型のアライメント要件を返す
static int get_member_alignment(CToken::StructMemberType stype, int pack)
{
	int natural;
	switch (stype) {
	case CToken::SMT_BYTE:
	case CToken::SMT_BOOL1:
	case CToken::SMT_CHAR_ARRAY:
		natural = 1; break;
	case CToken::SMT_SHORT:
	case CToken::SMT_BOOL2:
	case CToken::SMT_WCHAR_ARRAY:
		natural = 2; break;
	case CToken::SMT_INT:
	case CToken::SMT_FLOAT:
	case CToken::SMT_BOOL:
		natural = 4; break;
	case CToken::SMT_INT64:
	case CToken::SMT_DOUBLE:
	case CToken::SMT_PTR:
		natural = 8; break;
	default:
		natural = 4; break;
	}
	return (natural < pack) ? natural : pack;
}


void CToken::GenerateCodePP_defstruct(bool is_union)
{
	//		#defstruct NAME [, pack=N]
	//		#defunion NAME
	//
	StructDef sdef;
	sdef.is_union = is_union;
	sdef.pack = 8;  // デフォルト pack=8 (Win32/Win64 準拠)
	sdef.total_size = 0;

	// 構造体名を取得
	GetTokenCG(GETTOKEN_DEFAULT);
	if (ttype != TK_OBJ) throw CGERROR_PP_NAMEREQUIRED;
	sdef.name = cg_str;

	// 重複チェック
	if (GetStructDefId(cg_str) >= 0) throw CGERROR_PP_ALREADY_USE_FUNCNAME;

	// オプション: pack=N
	GetTokenCG(GETTOKEN_DEFAULT);
	if (ttype == TK_NONE && val == ',') {
		// カンマの後に pack=N
		GetTokenCG(GETTOKEN_DEFAULT);
		if (ttype == TK_OBJ && !strcmp(cg_str, "pack")) {
			GetTokenCG(GETTOKEN_DEFAULT);  // '='
			if (ttype != TK_NONE || val != '=') throw CGERROR_SYNTAX;
			GetTokenCG(GETTOKEN_DEFAULT);  // 数値
			if (ttype != TK_NUM) throw CGERROR_SYNTAX;
			sdef.pack = val;
		}
	}

	// テーブルに仮登録（#endstruct で確定）
	cg_structdefs.push_back(sdef);
	cg_defstruct_active = (int)cg_structdefs.size() - 1;
}


void CToken::GenerateCodePP_endstruct(void)
{
	//		#endstruct / #endunion
	//		直前の #defstruct/#defunion を確定する
	//
	if (cg_structdefs.empty()) throw CGERROR_SYNTAX;

	auto &sdef = cg_structdefs.back();
	if (sdef.members.empty()) {
		// メンバが0個は許可しない
		throw CGERROR_SYNTAX;
	}

	// union の場合、total_size は最大メンバサイズ
	if (sdef.is_union) {
		int max_size = 0;
		for (auto &m : sdef.members) {
			if (m.offset + m.size > max_size)
				max_size = m.offset + m.size;
		}
		sdef.total_size = max_size;
	}

	// total_size をアライメントで切り上げ
	sdef.total_size = align_offset(sdef.total_size, sdef.pack);

	cg_defstruct_active = -1;
}


bool CToken::GenerateCodeStructMember(void)
{
	//		構造体定義中のメンバ行をパースする
	//		"int x" や "double speed" や "char name[260]" 等
	//		union/endunion もここで処理する
	//
	if (cg_defstruct_active < 0) return false;

	auto &sdef = cg_structdefs[cg_defstruct_active];

	// 先頭トークン取得
	GetTokenCG(GETTOKEN_DEFAULT);
	if (ttype >= TK_SEPARATE) return true;  // 空行
	if (ttype != TK_OBJ) return false;      // 型名でなければ通常処理に戻す

	// union / endunion サブブロック（構造体内共用体）
	if (!strcmp(cg_str, "union")) {
		// union サブブロック開始 — 以後のメンバは同じオフセットから
		// 現在のオフセットを記録（union 開始点）
		// TODO: union サブブロック対応（Phase 4）
		return true;
	}
	if (!strcmp(cg_str, "endunion")) {
		// union サブブロック終了
		// TODO: union サブブロック対応（Phase 4）
		return true;
	}

	// メンバ型を解決
	StructMember member;
	member.array_count = 0;
	member.nested_struct_id = -1;
	member.size = 0;

	char type_name[256];
	strcpy_s(type_name, sizeof(type_name), cg_str);

	// 基本型の判定
	if (!strcmp(type_name, "byte"))        member.stype = SMT_BYTE;
	else if (!strcmp(type_name, "short"))  member.stype = SMT_SHORT;
	else if (!strcmp(type_name, "int"))    member.stype = SMT_INT;
	else if (!strcmp(type_name, "int64"))  member.stype = SMT_INT64;
	else if (!strcmp(type_name, "float"))  member.stype = SMT_FLOAT;
	else if (!strcmp(type_name, "double")) member.stype = SMT_DOUBLE;
	else if (!strcmp(type_name, "ptr"))    member.stype = SMT_PTR;
	else if (!strcmp(type_name, "bool"))   member.stype = SMT_BOOL;
	else if (!strcmp(type_name, "bool1"))  member.stype = SMT_BOOL1;
	else if (!strcmp(type_name, "bool2"))  member.stype = SMT_BOOL2;
	else if (!strcmp(type_name, "char"))   member.stype = SMT_CHAR_ARRAY;
	else if (!strcmp(type_name, "wchar"))  member.stype = SMT_WCHAR_ARRAY;
	else {
		// 入れ子構造体の可能性
		int nested_id = GetStructDefId(type_name);
		if (nested_id >= 0) {
			member.stype = SMT_NESTED_STRUCT;
			member.nested_struct_id = nested_id;
		} else {
			throw CGERROR_SYNTAX;
		}
	}

	// メンバ名を取得
	GetTokenCG(GETTOKEN_DEFAULT);
	if (ttype != TK_OBJ) throw CGERROR_PP_NAMEREQUIRED;
	member.name = cg_str;

	// 固定長配列: name[N]
	GetTokenCG(GETTOKEN_DEFAULT);
	if (ttype == TK_NONE && val == '[') {
		GetTokenCG(GETTOKEN_DEFAULT);
		if (ttype != TK_NUM) throw CGERROR_SYNTAX;
		member.array_count = val;
		GetTokenCG(GETTOKEN_DEFAULT);  // ']'
		if (ttype != TK_NONE || val != ']') throw CGERROR_SYNTAX;
	}

	// メンバサイズ計算
	if (member.stype == SMT_CHAR_ARRAY) {
		if (member.array_count <= 0) throw CGERROR_SYNTAX;  // char は配列必須
		member.size = member.array_count;  // N bytes
	} else if (member.stype == SMT_WCHAR_ARRAY) {
		if (member.array_count <= 0) throw CGERROR_SYNTAX;  // wchar は配列必須
		member.size = member.array_count * 2;  // N*2 bytes
	} else if (member.stype == SMT_NESTED_STRUCT) {
		int base_size = cg_structdefs[member.nested_struct_id].total_size;
		if (member.array_count > 0) {
			member.size = base_size * member.array_count;
		} else {
			member.size = base_size;
		}
	} else if (member.stype == SMT_TYPED_ARRAY) {
		// TODO
		throw CGERROR_SYNTAX;
	} else {
		int base_size = GetStructMemberSize(member.stype);
		if (member.array_count > 0) {
			member.size = base_size * member.array_count;
		} else {
			member.size = base_size;
		}
	}

	// オフセット計算
	if (sdef.is_union) {
		// union: 全メンバが offset 0 から
		member.offset = 0;
		if (member.size > sdef.total_size) {
			sdef.total_size = member.size;
		}
	} else {
		// struct: アライメントを考慮して配置
		int align = get_member_alignment(member.stype, sdef.pack);
		member.offset = align_offset(sdef.total_size, align);
		sdef.total_size = member.offset + member.size;
	}

	sdef.members.push_back(member);
	return true;
}

