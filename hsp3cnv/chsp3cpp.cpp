
//
//			HSP3 script generator
//			onion software/onitama 2008/5
//
#include <stdio.h>
#include <string.h>
#include <math.h>

#include "supio.h"
#include "chsp3cpp.h"

#define VARSET_MOD		// �V�����A����������ɕϊ�

/*------------------------------------------------------------*/

void CHsp3Cpp::MakeCppStyleString( char *str, char *dst )
{
	//		C++�̃G�X�P�[�v���g�p����������𐶐�����
	//		str : ���̕�����
	//		dst : �o�͐�
	//
	char *p;
	char *pdst;
	char a1;
	p = str;
	pdst = dst;
	while(1) {
		a1 = *p++;
		if ( a1 == 0 ) break;
		if ( a1 == 13 ) {
			*pdst++ = '\\';
			a1='r';
		}
		if ( a1 == 10 ) {
			*pdst++ = '\\';
			a1='n';
		}
		if ( a1 == '\t' ) {
			*pdst++ = '\\';
			a1='t';
		}
		if ( a1 == '\\' ) {
			*pdst++ = '\\';
		}
		if ( a1 == 0x22 ) {
			*pdst++ = '\\';
			a1 = 0x22;
		}
		*pdst++ = a1;
	}
	*pdst++ = 0;
}
	

char *CHsp3Cpp::GetDS_cpp( int offset )
{
	//		DS���當������擾����(�t�H�[�}�b�g�ςݕ�����)
	//
	MakeCppStyleString( GetDS(offset), strtmp );
	return strtmp;
}


void CHsp3Cpp::MakeCPPVarName( char *outbuf, int varid )
{
	//		�ϐ�����outbuf�ɃR�s�[����
	//
	int i;
	unsigned char *mm;
	char *sptr;

	if ( mem_di_val == NULL ) {						// �ϐ�����񂪂Ȃ��ꍇ
		sprintf( outbuf, "%s%d", CPPHED_HSPVAR, varid );
		return;
	}

	mm = mem_di_val + ( varid * 6 );
	i = (mm[3]<<16)+(mm[2]<<8)+mm[1];
	sprintf( outbuf, "%s%s", CPPHED_HSPVAR,  GetDS( i ) );

	while(1) {
		sptr = strstr2( outbuf, "@" );
		if ( sptr == NULL ) break;
		*sptr = 'M';
	}
}


int CHsp3Cpp::MakeImmidiateCPPName( char *mes, int type, int val, char *opt )
{
	//		���l(int,double,str)��ǉ�
	//		(�ǉ��ł��Ȃ��^�̏ꍇ��-1��Ԃ�)
	//
	int i;
	i = MakeImmidiateName( mes, type, val );
	if ( i == 0 ) return 0;
	switch( type ) {
	case TYPE_VAR:
		MakeCPPVarName( mes, val );
		//sprintf( mes, "%s%s", CPPHED_HSPVAR, GetHSPVarName(val) );
		if ( opt != NULL ) strcat( mes, opt );
		break;
	case TYPE_STRUCT:
		{
		STRUCTPRM *prm;
		prm = GetMInfo( val );
		switch( prm->mptype ) {
		case MPTYPE_LOCALVAR:
			sprintf( mes, "LocalPrm(%d)", prmcnv_locvar[val - curprmindex] );
			break;
		case MPTYPE_SINGLEVAR:
			sprintf( mes, "FuncPrmVA(%d)", val - curprmindex + curprmlocal );
			break;
		default:
			sprintf( mes, "FuncPrm(%d)", val - curprmindex + curprmlocal );
			break;
		}
		break;
		}
	case TYPE_LABEL:
		sprintf( mes, "*L%04d", val );
		break;
	default:
		strcpy( mes, GetHSPName( type, val ) );
		if ( opt != NULL ) strcat( mes, opt );
		if ( *mes == 0 ) return -1;
		break;
	}
	return 0;
}


void CHsp3Cpp::MakeCPPTask( char *funcdef, int nexttask )
{
	//		�^�X�N�̋�؂�
	//			funcdef=�V�����֐���`
	//			nextttask=���̃^�X�N(���x��ID)
	//
	if ( tasknum ) {
		if ( nexttask >= 0 ) {
			OutLine( "TaskSwitch(%d);\r\n", nexttask );
		}
		OutMes( "}\r\n\r\n" );
	}
	OutMes( "%s {\r\n", funcdef );
	tasknum++;
}


void CHsp3Cpp::MakeCPPTask( int nexttask )
{
	//		�P���^�X�N�̐���
	//
	char mes[256];
	sprintf( mes,"static void L%04d( void )", nexttask );
	MakeCPPTask( mes, nexttask );
}


void CHsp3Cpp::MakeCPPTask2( int nexttask, int newtask )
{
	//		�P���^�X�N�̐���
	//
	char mes[256];
	sprintf( mes,"static void L%04d( void )", newtask );
	MakeCPPTask( mes, nexttask );
}


void CHsp3Cpp::MakeCPPProgramInfoFuncParam( int structid )
{
	//		��`���߃p�����[�^�[����
	//		structid : �p�����[�^�[ID
	//
	STRUCTDAT *fnc;
	STRUCTPRM *prm;
	int i,max,locnum;
	fnc = GetFInfo( structid );
	prm = GetMInfo( fnc->prmindex );
	max = fnc->prmmax;
	curprmindex = fnc->prmindex;
	locnum = 0;

	for(i=0;i<max;i++) {
		prmcnv_locvar[i] = -1;
		switch( prm->mptype ) {
		case MPTYPE_VAR:
			//out->PutStr( "var" );
			break;
		case MPTYPE_STRING:
		case MPTYPE_LOCALSTRING:
			//out->PutStr( "str" );
			break;
		case MPTYPE_DNUM:
			//out->PutStr( "double" );
			break;
		case MPTYPE_INUM:
			//out->PutStr( "int" );
			break;
		case MPTYPE_LABEL:
			//out->PutStr( "label" );
			break;
		case MPTYPE_LOCALVAR:
			//out->PutStr( "local" );
			prmcnv_locvar[i] = locnum;
			locnum++;
			break;
		case MPTYPE_ARRAYVAR:
			//out->PutStr( "array" );
			break;
		case MPTYPE_SINGLEVAR:
			//out->PutStr( "var" );
			break;
		default:
			break;
		}
		prm++;
	}

	fnc->size = locnum;		// size���ڂɃ��[�J���ϐ��̐������Ă���(runtime�ŕK�v)
	curprmlocal = locnum;
}


void CHsp3Cpp::MakeCPPLabel( void )
{
	//		���x���𐶐�
	//
	int otmax;
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
				MakeCPPTask( labindex );
			} else {
				MakeCPPTask( labindex );
				OutMes( "\t// " );
				MakeProgramInfoFuncParam( GetOTInfo( labindex ) );
				MakeCPPProgramInfoFuncParam( GetOTInfo( labindex ) );
			}
		}
		labindex++;
	}
}


int	CHsp3Cpp::GetVarFixedType( int varid )
{
	//		�ϐ����Œ�^�C�v�����ׂ�
	//		( LAB_TYPEFIX_* ���Ԃ� )
	//
	int i;
	unsigned char *mm;
	char *sptr;

	if ( mem_di_val == NULL ) {						// �ϐ�����񂪂Ȃ��ꍇ
		return LAB_TYPEFIX_NONE;
	}

	mm = mem_di_val + ( varid * 6 );
	i = (mm[3]<<16)+(mm[2]<<8)+mm[1];
	sptr = GetDS( i );

	if ( sptr[1] == '_' ) {
		switch( sptr[0] ) {
		case 'I':
			return LAB_TYPEFIX_INT;					// int�^�Œ�
		case 'D':
			return LAB_TYPEFIX_DOUBLE;				// double�^�Œ�
		}
	}

	return LAB_TYPEFIX_NONE;						// �ʏ�̃^�C�v
}


int CHsp3Cpp::GetCPPExpressionSub( CMemBuf *eout )
{
	//		C/C++�̌v�Z���t�H�[�}�b�g�Ńp�����[�^�[��W�J����(�P����)
	//		eout : �o�͐�
	//		ret  : vflag(�ϐ����ڂ̏ꍇ��1)
	//
	char mes[8192];								// �W�J����鎮�̍ő啶����
	int op;
	int vflag;

	*mes = 0;
	vflag = 0;
	curprm_type = cstype;
	curprm_val = csval;

	switch(cstype) {
		case TYPE_MARK:
			//		�L��(�X�^�b�N������o���ĉ��Z)
			//
			op = csval;
			sprintf( mes,"Calc%s(); ", GetHSPOperator2(op) );
			eout->PutStr( mes );
			getCS();
			break;
		case TYPE_VAR:
			{
			//		�ϐ����X�^�b�N�ɐς�
			//
			CMemBuf arname;
			int va;
			char varname[256];
			MakeImmidiateCPPName( varname, cstype, csval );
			getCS();
			//		�z��v�f��t������
			va = MakeCPPVarExpression( &arname, true );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes,"PushVar(%s,%d); ", varname, va );
			eout->PutStr( mes );
			vflag = 1;
			break;
			}
		case TYPE_DNUM:
			{
			//		�������l���X�^�b�N�ɐς�
			//
			sprintf( mes,"Push%s(%f); ", GetHSPCmdTypeName(cstype), GetDSf(csval) );
			eout->PutStr( mes );
			getCS();
			break;
			}
		case TYPE_INUM:
		case TYPE_LABEL:
			//		���l���X�^�b�N�ɐς�
			//
			sprintf( mes,"Push%s(%d); ", GetHSPCmdTypeName(cstype), csval );
			eout->PutStr( mes );
			getCS();
			break;
		case TYPE_STRUCT:
			{
			//		�p�����[�^�[���X�^�b�N�ɐς�
			//
			CMemBuf arname;
			int prmid;
			int va;
			STRUCTPRM *prm;
			prm = GetMInfo( csval );
			switch( prm->mptype ) {
			case MPTYPE_LOCALVAR:
				prmid = prmcnv_locvar[csval - curprmindex];
				getCS();
				va = MakeCPPVarExpression( &arname, true );
				eout->PutStr( arname.GetBuffer() );
				sprintf( mes,"PushFuncPrm(%d,%d); ", prmid, va );
				vflag = 1;
				break;
			case MPTYPE_VAR:
			case MPTYPE_ARRAYVAR:
			case MPTYPE_SINGLEVAR:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				va = MakeCPPVarExpression( &arname, true );
				eout->PutStr( arname.GetBuffer() );
				sprintf( mes,"PushFuncPrm(%d,%d); ", prmid, va );
				vflag = 1;
				break;
			case MPTYPE_DNUM:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrmD(%d); ", prmid );
				break;
			case MPTYPE_INUM:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrmI(%d); ", prmid );
				break;

			default:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrm(%d); ", prmid );
				break;
			}
			eout->PutStr( mes );
			break;
			}
		case TYPE_STRING:
			//		��������X�^�b�N�ɐς�
			//
			sprintf( mes,"Push%s(\"%s\"); ", GetHSPCmdTypeName(cstype), GetDS_cpp( csval ) );
			eout->PutStr( mes );
			getCS();
			break;
		case TYPE_MODCMD:
			{
			//		���W���[���֐��Ăяo��
			//
			int va;
			int fnctype;
			int fncval;
			CMemBuf arname;
			fnctype = cstype;
			fncval = csval;
			getCS();
			//		������t������
			eout->PutStr( "PushFuncEnd(); " );
			va = MakeCPPVarExpression( &arname );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes, "Push%s(%d,%d); ", GetHSPCmdTypeName(fnctype), fncval, va );
			eout->PutStr( mes );
			break;
			}
		case TYPE_SYSVAR:
			//		�V�X�e���ϐ��Ƃ��ēW�J����
			//
			sprintf( mes,"Push%s(%d,0); ", GetHSPCmdTypeName(cstype), csval );
			eout->PutStr( mes );
			getCS();
			break;
		default:
			{
			//		�֐��Ƃ��ēW�J����
			//
			int va;
			int fnctype;
			int fncval;
			CMemBuf arname;
			fnctype = cstype;
			fncval = csval;
			getCS();
			//		������t������
			eout->PutStr( "PushFuncEnd(); " );
			va = MakeCPPVarExpression( &arname );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes, "Push%s(%d,%d); ", GetHSPCmdTypeName(fnctype), fncval, va );
			eout->PutStr( mes );
			break;
			}
	}
	return vflag;
}


int CHsp3Cpp::AnalysisCPPCalcInt( int prm1, int prm2, int op )
{
	//		���Z���ʂ�Ԃ�(int)
	//
	switch( op ) {
	case CALCCODE_ADD:
		return (prm1 + prm2);
	case CALCCODE_SUB:
		return (prm1 - prm2);
	case CALCCODE_MUL:
		return (prm1 * prm2);
	case CALCCODE_DIV:
		if ( prm2 == 0 ) {
			OutMes( "// Error 0 Divide\r\n" );
			return 0;
		}
		return (prm1 / prm2);
	case CALCCODE_MOD:
		if ( prm2 == 0 ) {
			OutMes( "// Error 0 Divide\r\n" );
			return 0;
		}
		return (prm1 % prm2);
	case CALCCODE_AND:
		return (prm1 & prm2);
	case CALCCODE_OR:
		return (prm1 | prm2);
	case CALCCODE_XOR:
		return (prm1 ^ prm2);
	case CALCCODE_EQ:
		return (prm1 == prm2);
	case CALCCODE_NE:
		return (prm1 != prm2);
	case CALCCODE_GT:
		return (prm1 > prm2);
	case CALCCODE_LT:
		return (prm1 < prm2);
	case CALCCODE_GTEQ:
		return (prm1 >= prm2);
	case CALCCODE_LTEQ:
		return (prm1 <= prm2);
	case CALCCODE_RR:
		return (prm1 >> prm2);
	case CALCCODE_LR:
		return (prm1 << prm2);
	default:
		break;
	}
	OutMes( "// Unexpect calc\r\n" );
	return 0;
}


double CHsp3Cpp::AnalysisCPPCalcDouble( double prm1, double prm2, int op, int *result )
{
	//		���Z���ʂ�Ԃ�(double)
	//
	*result = TYPE_DNUM;
	switch( op ) {
	case CALCCODE_ADD:
		return (prm1 + prm2);
	case CALCCODE_SUB:
		return (prm1 - prm2);
	case CALCCODE_MUL:
		return (prm1 * prm2);
	case CALCCODE_DIV:
		if ( prm2 == 0.0 ) {
			OutMes( "// Error 0 Divide\r\n" );
			return 0;
		}
		return (prm1 / prm2);
	case CALCCODE_MOD:
		if ( prm2 == 0.0 ) {
			OutMes( "// Error 0 Divide\r\n" );
			return 0;
		}
		return ( fmod( prm1, prm2 ) );
	case CALCCODE_EQ:
		*result = TYPE_INUM;
		return (double)(prm1 == prm2);
	case CALCCODE_NE:
		*result = TYPE_INUM;
		return (double)(prm1 != prm2);
	case CALCCODE_GT:
		*result = TYPE_INUM;
		return (double)(prm1 > prm2);
	case CALCCODE_LT:
		*result = TYPE_INUM;
		return (double)(prm1 < prm2);
	case CALCCODE_GTEQ:
		*result = TYPE_INUM;
		return (double)(prm1 >= prm2);
	case CALCCODE_LTEQ:
		*result = TYPE_INUM;
		return (double)(prm1 <= prm2);
	default:
		break;
	}
	OutMes( "// Unexpect calc\r\n" );
	return 0;
}


int CHsp3Cpp::AnalysisCPPCalcParam( PRMAINFO *cp1, PRMAINFO *cp2, CMemBuf *eout, int op )
{
	//		cp1,cp2�̓��e���牉�Z���\�����ׂ�
	//		( �Ԓl : 0=�s�\/1=�\(���Z���s�Ȃ�cp2�Ɋi�[����) )
	//
	char mes[8192];
	int cpival,cpfact,res;
	double cpdval,cpdfact;
	double *dptr;

	if ( cp1->lasttype != cp2->lasttype ) return 0;
	switch( cp2->lasttype ) {
	case TYPE_INUM:
		cpival = cp2->lastval;
		cpfact = cp1->lastval;
		cp2->lastval = AnalysisCPPCalcInt( cpival, cpfact, op );
		cp2->num = eout->GetSize();							// �������܂��o�b�t�@�ʒu���X�V
		sprintf( mes, "PushInt(%d);/*OPT*/ ", cp2->lastval );
		eout->PutStr( mes );
		eout->Put( 0 );
		break;
	case TYPE_DNUM:
		cpdval = GetDSf(cp2->lastval);
		cpdfact = GetDSf(cp1->lastval);
		cpdval = AnalysisCPPCalcDouble( cpdval, cpdfact, op, &res );
		cp2->num = eout->GetSize();							// �������܂��o�b�t�@�ʒu���X�V
		*mes = 0;
		switch( res ) {
		case TYPE_INUM:
			cpival = (int)cpdval;
			cp2->lastval = cpival;
			cp2->lasttype = TYPE_INUM;
			sprintf( mes, "PushInt(%d);/*OPT*/ ", cpival );
			break;
		case TYPE_DNUM:
			dptr = (double *)GetDS( cp2->lastval );
			*dptr = cpdval;
			sprintf( mes, "PushDouble(%f);/*OPT*/ ", cpdval );
			break;
		default:
			break;
		}
		eout->PutStr( mes );
		eout->Put( 0 );
		break;
	default:
		return 0;
	}
	return -1;
}


int CHsp3Cpp::GetCPPExpression( CMemBuf *eout, int *result )
{
	//		C/C++�̌v�Z���t�H�[�}�b�g�Ńp�����[�^�[��W�J����
	//		eout : �o�͐�
	//		result : ���ʂ̊i�[��(-2=��͂Ȃ�/-1=�������̌v�Z��/other=�P��̃p�����[�^�[type)
	//		�Ԓl   : 0=�I�[(p����)/1=�I�[(p�Ȃ�)/2=�֐�����p�ȗ�/-1=�ȗ��l
	//
	int i;
	int res, bufcur;
	int tres;
	int prms;
	int expres;
	PRMAINFO calcprm[MAX_CALCINFO];				// ���Z�p�����[�^�[�̓��e�ێ�
	CMemBuf calcbuf;							// ���Z�p�����[�^�[�̈ꎞ�ێ�
	PRMAINFO *cp;
	PRMAINFO *cp1;
	PRMAINFO *cp2;
	char *pbuf;

	*result = -2;
	prms = 0;
	curprm_stack = 0;

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

	//		���Z�p�����[�^�[(�v�Z��)����͂���
	//
	res = 0;
	tres = cstype;

	while(1) {
		if ( mcs > mcs_end ) {
			res = 1;			// �f�[�^�I�[�`�F�b�N
			break;
		}

		switch(cstype) {
		case TYPE_MARK:
			//		�L��(�I�[�̃`�F�b�N)
			//
			if ( csval == ')' ) {					// �����̏I���}�[�N
				exflag |= EXFLG_2;
				res = 2;
				//OutLine( "/*end*/" );
				break;
			}
		default:
			//		�P�ꍀ�ڂ̉��
			//
			if ( tres >= 0 ) {
				if ( tres != cstype ) { tres = -1; }
			}
			bufcur = calcbuf.GetSize();				// �������܂��o�b�t�@�ʒu
			cp = &calcprm[prms];
			cp->num = bufcur;
			cp->lasttype = cstype;
			cp->lastval = csval;

			//OutLine( "/*#%d t:%d v:%d*/",prms,cstype,csval );
			expres = GetCPPExpressionSub( &calcbuf );
			if ( expres == 0 ) {
				tres = -1;
			}
			calcbuf.Put( 0 );

			if (( curprm_type == TYPE_MARK )&&( prms >= 2 )) {
				//	���ۂɃX�^�b�N���e�Ɖ��Z�ł��邩�m�F���āA�\�Ȃ�΂܂Ƃ߂�
				cp1 = &calcprm[prms-1];
				cp2 = &calcprm[prms-2];
				if ( AnalysisCPPCalcParam( cp1, cp2, &calcbuf, curprm_val )) {
					prms--;					// cp2�������c���ăX�^�b�N���k�߂�
					break;
				}
			}

			prms++;
			break;
		}

		if ( exflag ) {								// �p�����[�^�[�I�[�`�F�b�N
			exflag&=~EXFLG_2;
			break;
		}
	}

	//		�ŏI�I�ȓ��e���o�͂���
	//
	cp = &calcprm[0];
	pbuf = calcbuf.GetBuffer();
	for(i=0;i<prms;i++) {
		eout->PutStr( pbuf + cp->num );
		cp++;
	}

	*result = tres;
	//OutLine( "/*res%d*/",tres );
	curprm_stack = prms;
	return res;
}


void CHsp3Cpp::OutputCPPParam( void )
{
	//		MakeCPPParam�Ńg���[�X�����p�����[�^�[���o�͂���
	//		(�p�����[�^�[���t���œo�^����)
	//		(stack��pop���Đ���ȏ��ԂɂȂ�悤��)
	//
	int i;
	int len;
	char *p;

	if ( prmbuf == NULL ) return;
	i = maxprms;
	while(1) {
		if ( i == 0 ) break;
		i--;
		p = prmbuf->GetBuffer() + prmbuf->GetIndex(i);
		len = (int)strlen( p );
		if ( len ) {
			int a1;
			char lnbuf[4096];
			strsp_ini();
			while(1) {
				a1 = strsp_get( p, lnbuf, 0, 4090 );
				OutLine( "%s\r\n", lnbuf );
				if ( a1 == 0 ) break;
			}
		}
	}
	DisposeCPPParam();
}


void CHsp3Cpp::DisposeCPPParam( void )
{
	//	�g���[�X�����p�����[�^�[��j������
	//
	if ( prmbuf == NULL ) return;
	delete prmbuf;								// �o�b�t�@��j������
	prmbuf = NULL;
}


int CHsp3Cpp::MakeCPPParam( int addprm )
{
	//		�p�����[�^�[�̃g���[�X
	//		( �Ԓl�́A�p�����[�^�[�� )
	//		( maxprms, prma�Ɍ��ʂ�Ԃ� )
	//		( ���ۂ̏o�͂́AOutputCPPParam�ōs�Ȃ� )
	//		( addprm��-1�̏ꍇ�́A�P��̕ϐ�(�`VAP,�`PAP)�𐶐����Ȃ� )
	//
	int i;
	int prm;
	int result;
	int curidx;
	char *p;
	PRMAINFO *curp;

	prm = 0;
	curp = prma;

	prmbuf = new CMemBuf;
	prmbuf->AddIndexBuffer();

	int j;
	if ( addprm > 0 ) {
		for(j=0;j<addprm;j++) {
			if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
			if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N
			if ( prm ) {
				prmbuf->Put(0);
			}
			prmbuf->RegistIndex( prmbuf->GetSize() );
			GetCPPExpressionSub( prmbuf );
			curp->num = 1;
			curp->lasttype = curprm_type;
			curp->lastval = curprm_val;
			curp++;
			prm++;
		}
	}

	while(1) {
		if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
		if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N
		if ( prm ) {
			prmbuf->Put(0);
		}
		curidx = prmbuf->GetIndexBufferSize();
		prmbuf->RegistIndex( prmbuf->GetSize() );
		i = GetCPPExpression( prmbuf, &result );
		if ( i > 0 ) break;
		if ( i < -1 ) return i;
		if ( i == -1 ) {
			prmbuf->PutStr( "PushDefault();" );
		}
		curp->num = curprm_stack;
		curp->lasttype = curprm_type;
		curp->lastval = curprm_val;
		curp++;

		if ( addprm >= 0 ) {
			switch( result ) {			// �P�ꍀ�ŕϐ����w�肳��Ă����ꍇ�̃`�F�b�N
			case TYPE_VAR:
				p = prmbuf->GetBuffer() + prmbuf->GetIndex( curidx );
				p = strstr2rev( p, "PushVa" );
				if ( p != NULL ) {
					p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAP�ɒ���
				}
				break;
			case TYPE_STRUCT:
				p = prmbuf->GetBuffer() + prmbuf->GetIndex( curidx );
				p = strstr2rev( p, "PushFuncPrm" );
				if ( p != NULL ) {
					p[9] = 'A'; p[10] = 'P';		// PushFuncPrm -> PushFuncPAP�ɒ���
				}
				break;
			default:
				break;
			}
		}
		prm++;
	}

	maxprms = prm;
	return prm;
}


int CHsp3Cpp::MakeCPPParamForVar( char *varname, int va, char *arrayname )
{
	//		�p�����[�^�[�̃g���[�X(�V�����W�J���@)
	//		( �Ԓl�́A�p�����[�^�[�� )
	//		( maxprms, prma�Ɍ��ʂ�Ԃ� )
	//		( ���ۂ̏o�͂́AOutputCPPParam�ōs�Ȃ� )
	//		( addprm��-1�̏ꍇ�́A�P��̕ϐ�(�`VAP,�`PAP)�𐶐����Ȃ� )
	//
	int i;
	int prm;
	int result;
	CMemBuf tmp;

	prm = 0;

		if ( exflag & EXFLG_1) return -1;		// �p�����[�^�[��I�[
		if ( mcs > mcs_end ) return -1;			// �f�[�^�I�[�`�F�b�N
		i = GetCPPExpression( &tmp, &result );
		if ( i > 0 ) return -1;
		if ( i < -1 ) return i;
		if ( i == -1 ) {
			OutLine( "PushInt(0);\r\n" );
		}

		if ( maxprms > 0 ) {
			OutLine( "PushVarOffset(%s);\r\n", varname );
		}

		OutLine( "%s\r\n",tmp.GetBuffer() );

		if ( maxprms == 0 ) {
			OutMes( arrayname );
			OutLine( "VarSet(%s,%d);\r\n", varname, va );
		} else {
			OutLine( "VarSet2(%s);\r\n", varname );
		}
		prm++;

	maxprms++;
	return prm;
}


int CHsp3Cpp::MakeCPPVarForHSP( void )
{
	//		�R�����g�p��HSP�`���̑�����쐬
	//		(�����ɑ���̎�ނ����ʂ��ĕԂ�)
	//		(retval:-1=�ʏ����A-2,-3=++or--�A���̑�=���Z�q)
	//
	int i;
	int op;
	char arbuf[VAREXP_BUFFER_MAX];
	i = GetHSPVarExpression( arbuf );
	if ( i ) { out->PutStr( arbuf ); }
	if ( cstype == TYPE_MARK ) {
		if ( csval == CALCCODE_EQ ) {
			out->PutStr( "=" );
			getCS();
			MakeProgramInfoParam2();
			return -1;
		}
		op = csval;
		getCS();
		if ( exflag & EXFLG_1) {		// ++ or --
			out->PutStr( GetHSPOperator(op) );
			out->PutStr( GetHSPOperator(op) );
			MakeProgramInfoParam2();
			if ( op == CALCCODE_ADD ) return -2;
			return -3;
		}
		out->PutStr( GetHSPOperator(op) );
		out->PutStr( "=" );
		//getCS();
		MakeProgramInfoParam2();
		return op;
	}
	Alert( "CHsp3:Var Syntax unknown." );
	return -4;
}


int CHsp3Cpp::MakeCPPVarExpression( CMemBuf *arname,  bool flag_array )
{
	//	�ϐ�������ɑ����p�����[�^�[(�z��)��W�J����
	//	arname : �z��ݒ�W�J�p�̃o�b�t�@
	//	flag_array : �z��ϐ��ݒ�t���O(true=�z��v�f��͒�)
	//	ret : 0=�z��Ȃ�/1�`=�z�񂠂�
	//
	int i;
	int prm;
	int tlen,len;
	int result;
	int curidx;
	CMemBuf tmpbuf;
	char *p;
	tmpbuf.AddIndexBuffer();

	if ( cstype == TYPE_MARK ) {
		if ( csval == '(' ) {
			getCS();
			prm = 1;
			while(1) {
				if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
				if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N
				if ( prm > 1 ) {
					tmpbuf.Put(0);
				}
				curidx = tmpbuf.GetIndexBufferSize();
				tmpbuf.RegistIndex( tmpbuf.GetSize() );
				i = GetCPPExpression( &tmpbuf, &result );
				if ( i < -1 ) return i;
				if ( i == -1 ) {
					tmpbuf.PutStr( "PushDefault();" );
				}

				if ( flag_array == false ) {
					switch( result ) {			// �P�ꍀ�ŕϐ����w�肳��Ă����ꍇ�̃`�F�b�N
					case TYPE_VAR:
						p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
						p = strstr2rev( p, "PushVa" );
						if ( p != NULL ) {
							p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAP�ɒ���
						}
						break;
					case TYPE_STRUCT:
						p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
						p = strstr2rev( p, "PushFuncPrm" );
						if ( p != NULL ) {
							p[9] = 'A'; p[10] = 'P';		// PushFuncPrm -> PushFuncPAP�ɒ���
						}
						break;
					default:
						break;
					}
				}
				if ( i > 0 ) break;
				prm++;
			}
			getCS();

			//		�p�����[�^�[���t���œo�^����
			//		(stack��pop���Đ���ȏ��ԂɂȂ�悤��)
			//
			i = tmpbuf.GetIndexBufferSize();
			tlen = 0;
			while(1) {
				if ( i == 0 ) break;
				i--;
				p = tmpbuf.GetBuffer() + tmpbuf.GetIndex(i);
				len = (int)strlen( p );
				if ( len ) {
					tlen += len;
					OutLineBuf( arname, "%s\r\n", p,tlen );
				}
			}
			if ( tlen == 0 ) return 0;
			return prm;
		}
	}
	return 0;
}


/*------------------------------------------------------------*/

void CHsp3Cpp::MakeCPPSubModCmd( int cmdtype, int cmdval )
{
	//		��`���߂ƃp�����[�^�[��W�J
	//
	int pnum;					// �p�����[�^�[�X�^�b�N��
	MCSCONTEXT ctxbak;

	OutLine( "// %s ", GetHSPName( cmdtype, cmdval ) );
	getCS();
	GetContext( &ctxbak );
	MakeProgramInfoParam2();
	SetContext( &ctxbak );

	pnum = MakeCPPParam();
	OutputCPPParam();
	OutLine( "PushLabel(%d);\r\n", curot );
	OutLine( "%s(%d,%d);\r\n", GetHSPCmdTypeName(cmdtype), cmdval, pnum );
}


void CHsp3Cpp::MakeCPPSubProgCmd( int cmdtype, int cmdval )
{
	//		�v���O�������䖽�߂�W�J
	//
	int pnum;
	PRMAINFO *prm;

	switch( cmdval ) {
	case 0x00:								// goto
		{
		MCSCONTEXT ctxbak;
		OutLine( "// goto " );
		getCS();
		GetContext( &ctxbak );
		MakeProgramInfoParam2();
		SetContext( &ctxbak );

		pnum = MakeCPPParam();
		prm = &prma[0];
		if (( pnum == 1 )&&( prm->num == 1 )&&( prm->lasttype == TYPE_LABEL )) {
			OutLine( "TaskSwitch(%d);\r\n", prm->lastval );
			DisposeCPPParam();
		} else {
			OutputCPPParam();
			OutLine( "%s(%d,%d);\r\n", GetHSPCmdTypeName(cmdtype), cmdval, pnum );
		}
		OutLine( "return;\r\n" );
		break;
		}

	case 0x02:								// return
	case 0x03:								// break
	case 0x05:								// loop
	case 0x0c:								// (hidden)foreach check
	case 0x10:								// end
	case 0x1b:								// assert
	case 0x11:								// stop
	case 0x19:								// on
		//		���return��t����
		//
		MakeCPPSub( cmdtype, cmdval );
		OutLine( "return;\r\n" );
		break;
	case 0x01:								// gosub
	case 0x18:								// exgoto
		//		gosub�̓W�J
		//
		{
		int pnum;
		OutLine( "// %s\r\n", GetHSPName(cmdtype,cmdval) );
		getCS();
		pnum = MakeCPPParam();
		OutputCPPParam();
		OutLine( "PushLabel(%d); %s(%d,%d); return;\r\n", curot, GetHSPCmdTypeName(cmdtype), cmdval, pnum+1 );
		MakeCPPTask2( -1, curot );
		curot++;
		break;
		}
	case 0x04:								// repeat
	case 0x0b:								// foreach
		//		repeat,foreach�̓W�J
		//
		{
		int pnum;
		OutLine( "// %s\r\n", GetHSPName(cmdtype,cmdval) );
		getCS();
		pnum = MakeCPPParam(1);
		OutputCPPParam();
		OutLine( "PushLabel(%d); %s(%d,%d); return;\r\n", curot, GetHSPCmdTypeName(cmdtype), cmdval, pnum+1 );
		MakeCPPTask( curot );
		curot++;
		break;
		}

	case 0x06:								// continue
		//		continue�̓W�J
		//
		{
		int pnum;
		OutLine( "// %s\r\n", GetHSPName(cmdtype,cmdval) );
		getCS();
		pnum = MakeCPPParam(1);
		OutputCPPParam();
		OutLine( "%s(%d,%d); return;\r\n", GetHSPCmdTypeName(cmdtype), cmdval, pnum );
		MakeCPPTask( curot );
		curot++;
		break;
		}

	case 0x07:								// wait
	case 0x08:								// await
	case 0x17:								// run
		//		�^�X�N����؂�
		//
		MakeCPPSub( cmdtype, cmdval );
		MakeCPPTask( curot );
		curot++;
		break;
	default:
		MakeCPPSub( cmdtype, cmdval );
		break;
	}
}


void CHsp3Cpp::MakeCPPSubExtCmd( int cmdtype, int cmdval )
{
	//		�g�����߂�W�J
	//
	int pnum;
	int btnopt;

	switch( cmdval ) {
	case 0x00:								// button
		{
		MCSCONTEXT ctxbak;
		OutLine( "// button " );
		getCS();
		btnopt = 0;
		if ( cstype == TYPE_PROGCMD ) {
			if ( csval <= 1 ) {
				btnopt = csval;
				OutLine( "%s ", GetHSPName( cstype, csval ) );
				getCS();
			}
		}
		GetContext( &ctxbak );
		MakeProgramInfoParam2();
		SetContext( &ctxbak );

		pnum = MakeCPPParam();
		OutputCPPParam();
		OutLine( "PushInt(%d); %s(%d,%d);\r\n", btnopt, GetHSPCmdTypeName(cmdtype), cmdval, pnum+1 );

		break;
		}

	default:
		MakeCPPSub( cmdtype, cmdval );
		break;
	}
}


void CHsp3Cpp::MakeCPPSub( int cmdtype, int cmdval )
{
	//		�ʏ햽�߂ƃp�����[�^�[��W�J
	//
	int pnum;
	MCSCONTEXT ctxbak;

	OutLine( "// %s ", GetHSPName( cmdtype, cmdval ) );
	getCS();
	GetContext( &ctxbak );
	MakeProgramInfoParam2();
	SetContext( &ctxbak );

	pnum = MakeCPPParam();

	//PRMAINFO *prm;
	//prm = &prma[0];
	//OutLine( "// %d, #%d type:%d val:%d\r\n", pnum, prm->num, prm->lasttype, prm->lastval );

	OutputCPPParam();
	OutLine( "%s(%d,%d);\r\n", GetHSPCmdTypeName(cmdtype), cmdval, pnum );

	if ( cmdtype == TYPE_EXTCMD ) {
		switch( cmdval ) {
		case 0x002:				// exec
		case 0x003:				// dialog
			//		�^�X�N����؂�
			//
			MakeCPPTask( curot );
			curot++;
			break;
		default:
			break;
		}
	}

}


int CHsp3Cpp::MakeCPPMain( void )
{
	//		�v���O�����̃g���[�X
	//
	int i;
	int op;
	int cmdtype, cmdval;
	char mes[4096];
	MCSCONTEXT ctxbak;
	int maxvar;

	//		������
	//
	tasknum = 0;
	MakeCPPTask( "void __HspEntry( void )" );

	OutMes( "\t// Var initalize\r\n" );
	maxvar = hsphed->max_val;
	for(i=0;i<maxvar;i++) {
		MakeCPPVarName( mes, i );
		OutMes( "\t%s = &mem_var[%d];\r\n", mes, i );
	}
	OutMes( "\r\n" );

	//		�R�[�h�̕ϊ�
	//
	while(1) {
		if ( mcs > mcs_end ) break;

		//		endif�̃`�F�b�N
		//
		if ( ifmode[iflevel]>=2 ) {		// if end
			if ( mcs_last>=ifptr[iflevel] ) {
				ifmode[iflevel] = 0;
				if ( iflevel == 0 ) { Alert( "Invalid endif." ); return -1; }
				i = iftaskid[iflevel];
				iflevel--;
				//SetIndent( iflevel );
				//OutLine( "}\n" );
				MakeCPPTask( i );
				continue;
			}
		}

		//		���x���`�F�b�N
		//
		MakeCPPLabel();

		//		�s���̃R�[�h
		//
		cmdtype = cstype;
		cmdval = csval;
		//MakeProgramInfoHSPName();
		//printf( "#%06x:CSTYPE%d VAL%d\n", mcs_last - mcs_start, cstype, csval );
		//Alert( mes );
		//out->PutStr( mes );

		//		�p�����[�^�[
		//
		switch( cmdtype ) {
		case TYPE_STRUCT:						// ��֕ϐ�(struct)
		case TYPE_VAR:							// �ϐ����
			{
			CMemBuf arname;
			int va,pnum;
			MakeImmidiateHSPName( mes, cmdtype, cmdval );
			OutLine( "// %s ", mes );
			getCS();
			GetContext( &ctxbak );
			op = MakeCPPVarForHSP();
			SetContext( &ctxbak );
			MakeImmidiateCPPName( mes, cmdtype, cmdval );
			va = MakeCPPVarExpression( &arname, true );
			getCS();

			switch( op ) {
			case -1:		// �ʏ�̑��
#ifdef VARSET_MOD
				maxprms = 0;
				while(1) {
					pnum = MakeCPPParamForVar( mes, va, arname.GetBuffer() );
					if ( pnum < 0 ) break;
				}
#else
				pnum = MakeCPPParam(-1);
				OutputCPPParam();
				OutMes( arname.GetBuffer() );
				if ( pnum <= 1 ) {
					OutLine( "VarSet(%s,%d);\r\n", mes, va );
				} else {
					OutLine( "VarSet(%s,%d,%d);\r\n", mes, va, pnum );
				}
#endif
				break;
			case -2:		// ++
				OutMes( arname.GetBuffer() );
				OutLine( "VarInc(%s,%d);\r\n", mes, va );
				break;
			case -3:		// --
				OutMes( arname.GetBuffer() );
				OutLine( "VarDec(%s,%d);\r\n", mes, va );
				break;
			case -4:		// �G���[
				break;
			default:		// ���Z�q�t�����
				pnum = MakeCPPParam(-1);
				OutputCPPParam();
				if ( pnum > 1 ) {
					Alert( "Too much parameters(VarCalc)." );
				}
				OutMes( arname.GetBuffer() );
				OutLine( "VarCalc(%s,%d,%d);\r\n", mes, va, op );
				break;
			}
			break;
			}
		case TYPE_CMPCMD:						// ��r����
			//	HSP�\�[�X�R�����g
			if ( cmdval == 0 ) {
				GetContext( &ctxbak );
				OutLine( "// if " );
				mcs++;
				getCS();
				MakeProgramInfoParam2();
				SetContext( &ctxbak );
			}
			// C�`���̏o��
			if ( cmdval == 0 ) {
				iflevel++;
				sprintf( mes, "if (HspIf()) { TaskSwitch(%d); return; }\r\n", curot );
				if ( iflevel >= MAX_IFLEVEL ) {
					Alert( "Stack(If) overflow." );
					return -2;
				}
				ifmode[iflevel] = 1;
				iftaskid[iflevel] = curot;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				ifmode[iflevel]++;
				curot++;
			} else {
				strcpy( mes, "// else\r\n" );
				ifmode[iflevel] = 3;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				//SetIndent( iflevel-1 );
				i = iftaskid[iflevel];
				MakeCPPTask2( curot, i );
				iftaskid[iflevel] = curot;
				curot++;
			}
			mcs++;
			getCS();
			MakeCPPParam();
			OutputCPPParam();
			OutLine( mes );
			//SetIndent( iflevel );
			break;
		case TYPE_PROGCMD:						// �v���O�������䖽��
			MakeCPPSubProgCmd( cmdtype, cmdval );
			break;
		case TYPE_EXTCMD:						// �g������
			MakeCPPSubExtCmd( cmdtype, cmdval );
			break;
		case TYPE_MODCMD:							// ��`����
			MakeCPPSubModCmd( cmdtype, cmdval );
			OutLine( "return;\r\n" );
			MakeCPPTask2( -1, curot );
			curot++;
			break;
		default:
			//		�ʏ햽��
			//
			MakeCPPSub( cmdtype, cmdval );
			break;
		}
	}

	OutMes( "}\r\n\r\n" );
	OutMes( "//-End of Source-------------------------------------------\r\n" );
	return 0;
}

/*------------------------------------------------------------*/


int CHsp3Cpp::MakeSource( int option, void *ref )
{
	//		C/C++�\�[�X���o�͂���
	//
	int i;
	int otmax;
	int labindex;
	int maxvar;
	char mes[4096];
	makeoption = option;

	OutMes( "//\r\n//\thsp3cnv(%s) generated source\r\n//\t[%s]\r\n//\r\n", HSP3CNV_VERSION, orgname );
	OutMes( "#include \"hsp3r.h\"\r\n" );
	OutMes( "\r\n#define _HSP3CNV_DATE %s\n#define _HSP3CNV_TIME %s\r\n", localinfo.CurrentDate(), localinfo.CurrentTime() );
	OutMes( "#define _HSP3CNV_MAXVAR %d\r\n", hsphed->max_val );
	OutMes( "#define _HSP3CNV_MAXHPI %d\r\n", hsphed->max_hpi );
	OutMes( "#define _HSP3CNV_VERSION 0x%x\r\n", hsphed->version );
	OutMes( "#define _HSP3CNV_BOOTOPT %d\r\n", hsphed->bootoption );
	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	maxvar = hsphed->max_val;
	for(i=0;i<maxvar;i++) {
		MakeCPPVarName( mes, i );
		OutMes( "static PVal *%s;\r\n", mes );
	}

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	otmax = GetOTCount();
	curot = otmax;

	i = MakeCPPMain();
	if ( i ) return i;

	//		�^�X�N(���x��)�e�[�u�����쐬����
	//
	OutMes( "\r\nCHSP3_TASK __HspTaskFunc[]={\r\n" );

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( GetOTInfo( labindex ) == -1 ) {
			OutMes( "(CHSP3_TASK) L%04d,\r\n", labindex );
		} else {
		STRUCTDAT *fnc;
			fnc = GetFInfo( GetOTInfo( labindex ) );
			switch( fnc->index ) {
			case STRUCTDAT_INDEX_FUNC:					// ��`����
			case STRUCTDAT_INDEX_CFUNC:					// ��`�֐�
				OutMes( "(CHSP3_TASK) L%04d,\t// %s\r\n", labindex,  GetDS(fnc->nameidx) );
				break;
			default:
				OutMes( "(CHSP3_TASK) 0,\r\n" );
				break;
			}

		}
		labindex++;
	}
	while(1) {
		if ( labindex>=curot ) break;
		OutMes( "(CHSP3_TASK) L%04d,\r\n", labindex );
		labindex++;
	}
	OutMes( "(CHSP3_TASK) 0,\r\n\r\n};\r\n" );

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	//		���W���[��(�֐�)�e�[�u�����쐬����
	//
	int stmax;
	int curst;
	STRUCTDAT *st;
	CMemBuf stname;
	char *pst;

	curst = 0;
	stmax = GetFInfoCount();
	if ( stmax ) {
		OutMes( "STRUCTDAT __HspFuncInfo[]={\r\n" );

		for(i=0;i<stmax;i++) {
			st = GetFInfo( i );
			pst = GetDS(st->nameidx);
			sprintf( mes, "\"%s\\0\"\\\r\n", pst );
			stname.PutData( mes, (int)strlen(mes) );
			OutMes( "\t{ %d,%d, %d,%d,%d,%d,%d, (void *)%d },\r\n",
				st->index, st->subid, st->prmindex, st->prmmax, curst, st->size, st->otindex, st->funcflag );
			curst += (int)strlen( pst )+1;
		}
		OutMes( "};\r\n\r\n" );
	}

	//		���C�u����(DLL)�e�[�u�����쐬����
	//
	int lbmax;
	LIBDAT *lb;

	lbmax = GetLInfoCount();
	if ( lbmax ) {
		OutMes( "LIBDAT __HspLibInfo[]={\r\n" );

		for(i=0;i<lbmax;i++) {
			lb = GetLInfo( i );
			pst = GetDS(lb->nameidx);
			sprintf( mes, "\"%s\\0\"\\\r\n", pst );
			stname.PutData( mes, (int)strlen(mes) );
			OutMes( "\t{ %d,%d, (void *)%d, %d },\r\n",
				lb->flag, curst, lb->hlib, lb->clsid );
			curst += (int)strlen( pst )+1;
		}
		OutMes( "};\r\n\r\n" );
	}

	//		�p�����[�^�[(MINFO)�e�[�u�����쐬����
	//
	int mimax;
	STRUCTPRM *mi;

	mimax = GetMInfoCount();
	if ( mimax ) {
		OutMes( "STRUCTPRM __HspPrmInfo[]={\r\n" );

		for(i=0;i<mimax;i++) {
			mi = GetMInfo( i );
			OutMes( "\t{ %d, %d, %d },\r\n", mi->mptype, mi->subid, mi->offset );
		}
		OutMes( "};\r\n\r\n" );
	}

	//		������e�[�u�����쐬����
	//
	if ( curst > 0 ) {
		stname.Put( (int)0 );
		OutMes( "char __HspDataName[]=%s;\r\n\r\n", stname.GetBuffer() );
	}

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	//		�������t�@���N�V�������쐬����
	//
	OutMes( "void __HspInit( Hsp3r *hsp3 ) {\r\n" );
	OutMes( "\thsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );\r\n" );
	if ( curst > 0 ) {
		OutMes( "\thsp3->SetDataName( __HspDataName );\r\n" );
	} else {
		OutMes( "\thsp3->SetDataName( 0 );\r\n" );
	}
	if ( stmax ) {
		OutMes( "\thsp3->SetFInfo( __HspFuncInfo, %d );\r\n", stmax * sizeof(STRUCTDAT) );
	} else {
		OutMes( "\thsp3->SetFInfo( 0, 0 );\r\n" );
	}
	if ( lbmax ) {
		OutMes( "\thsp3->SetLInfo( __HspLibInfo, %d );\r\n", lbmax * sizeof(LIBDAT) );
	} else {
		OutMes( "\thsp3->SetLInfo( 0, 0 );\r\n" );
	}
	if ( mimax ) {
		OutMes( "\thsp3->SetMInfo( __HspPrmInfo, %d );\r\n", mimax * sizeof(STRUCTPRM) );
	} else {
		OutMes( "\thsp3->SetMInfo( 0, 0 );\r\n" );
	}
	OutMes( "}\r\n" );

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	return 0;
}
