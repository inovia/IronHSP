
//
//	CHsp3cpp.cpp structures
//
#ifndef __CHsp3cpp_h
#define __CHsp3cpp_h

#include "chsp3.h"

#define CPPHED_HSPVAR "Var_"

//		CHSP3 Task callback function
//
typedef void (* CHSP3_TASK) (void);

//		Param analysis info
//
struct PRMAINFO {
	int	num;						// number of stack
	int lasttype;					// last value type(TYPE_*)
	int lastval;					// last value (int)
};

#define MAX_PRMAINFO 128			// �p�����[�^�[�ێ��o�b�t�@�ő吔
#define MAX_CALCINFO 512			// �p�����[�^�[���Z�X�^�b�N�̍ő吔

//	HSP3(.ax)->C++(.cpp) conversion class
//
class CHsp3Cpp : public CHsp3 {
public:

	int MakeSource( int option, void *ref );

private:
	//		Settings
	//
	int makeoption;
	int tasknum;
	int curot;						// �ǉ��p�̃^�X�N(���x��)�e�[�u��ID
	int curprmindex;				// ���݂̃p�����[�^�[�擪�C���f�b�N�X
	int curprmlocal;				// ���݂̃��[�J���ϐ��X�^�b�N��
	int prmcnv_locvar[64];			// �p�����[�^�[�ϊ��p�o�b�t�@(���[�J���ϐ��p)
	int curprm_type, curprm_val;	// �Ō�ɕ]������type,val�l
	int curprm_stack;				// �p�����[�^�[�X�^�b�N��

	CMemBuf *prmbuf;				// �p�����[�^�[��́E�ϊ��p�o�b�t�@
	int	maxprms;					// �p�����[�^�[��͌���(�S�p�����[�^�[��)
	PRMAINFO prma[MAX_PRMAINFO];	// �p�����[�^�[��͌���

	//		Internal Function
	//
	int MakeCPPMain( void );
	void MakeCPPLabel( void );
	void MakeCPPTask( int nexttask );
	void MakeCPPTask2( int nexttask, int newtask );
	void MakeCPPTask( char *funcdef, int nexttask=-1 );
	int MakeCPPParam( int addprm=0 );
	void MakeCppStyleString( char *str, char *dst );
	char *GetDS_cpp( int offset );

	void MakeCPPSub( int cmdtype, int cmdval );
	void MakeCPPSubModCmd( int cmdtype, int cmdval );
	void MakeCPPSubProgCmd( int cmdtype, int cmdval );
	void MakeCPPSubExtCmd( int cmdtype, int cmdval );
	void OutputCPPParam( void );
	void DisposeCPPParam( void );

	int GetCPPExpression( CMemBuf *eout, int *result );
	int GetCPPExpressionSub( CMemBuf *eout );
	int AnalysisCPPCalcParam( PRMAINFO *cp1, PRMAINFO *cp2, CMemBuf *eout, int op );
	int AnalysisCPPCalcInt( int prm1, int prm2, int op );
	double AnalysisCPPCalcDouble( double prm1, double prm2, int op, int *result );

	int MakeCPPVarForHSP( void );
	void MakeCPPVarName( char *outbuf, int varid );
	int MakeCPPVarExpression( CMemBuf *arname, bool flag_array = false );
	int MakeImmidiateCPPName( char *mes, int type, int val, char *opt=NULL );
	void MakeCPPProgramInfoFuncParam( int structid );
	int MakeCPPParamForVar( char *varname, int va, char *arrayname );

	int	GetVarFixedType( int varid );
};


#endif
