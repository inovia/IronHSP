
//
//	hsp3r.cpp header
//
#ifndef __hsp3r_h
#define __hsp3r_h

#include "../hsp3/hsp3debug.h"
#include "../hsp3/hsp3struct.h"
#include "../hsp3/hsp3code.h"
#include "../hsp3/stack.h"
#include "hspvar_util.h"

#define HSP3_AXTYPE_NONE 0
#define HSP3_AXTYPE_ENCRYPT 1

//	HSP3r class
//
class Hsp3r {
public:
	//	Functions
	//
	Hsp3r( void );
	~Hsp3r( void );
	void Dispose( void );						// HSP3R�̔j��
	int Reset( int ext_vars, int ext_hpi );		// HSP3R�̏��������s�Ȃ�
	void SetPackValue( int sum, int dec );		// packfile�p�̐ݒ�f�[�^��n��
	void SetFileName( char *name );				// ax�t�@�C�������w�肷��
	void SetFInfo( STRUCTDAT *finfo, int finfo_max );	// FInfo�ݒ�

	//	Data
	//
	HSPHED hsphed;
	HSPCTX hspctx;
	char *axname;
	char *axfile;
	int	maxvar;
	int max_varhpi;
	int hsp_sum, hsp_dec;

private:
};


#endif
