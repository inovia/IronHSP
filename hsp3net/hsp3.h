
//
//	hsp3.cpp header
//
#ifndef __hsp3_h
#define __hsp3_h

#include "hsp3debug.h"
#include "hsp3struct.h"
#include "hsp3ext.h"
#include "hsp3code.h"

#define HSP3_AXTYPE_NONE 0
#define HSP3_AXTYPE_ENCRYPT 1

//	HSP3 class
//
class Hsp3 {
public:
	//	Functions
	//
	Hsp3( void );
	~Hsp3( void );
	void Dispose( void );						// HSP ax�̔j��
	int Reset( int mode );						// HSP ax�̏��������s�Ȃ�
	void SetPackValue( int sum, int dec );		// packfile�p�̐ݒ�f�[�^��n��
	void SetFileName( char *name );				// ax�t�@�C�������w�肷��
	void SetCommandLinePrm(char *prm);			// �R�}���h���C����������w�肷��
	void SetModuleFilePrm(char *prm);			// ���W���[���t�@�C������������w�肷��
	void SetHSPTVFolderPrm(char *prm);			// HSPTV�t�H���_����������w�肷��
	void SetHomeFolderPrm(char *prm);			// �z�[���t�H���_����������w�肷��

	//	Data
	//
	HSPCTX hspctx;
	char *axname;
	char *axfile;
	int	maxvar;
	int hsp_sum, hsp_dec;
	int axtype;									// ax�t�@�C���̐ݒ�(hsp3imp�p)

private:

	void *copy_DAT(char* ptr, size_t size);
	LIBDAT *copy_LIBDAT(HSPHED *hsphed, char *ptr, size_t size);
	STRUCTDAT *copy_STRUCTDAT(HSPHED *hsphed, char *ptr, size_t size);


};


#endif
