
//
//	csstack.cpp structures
//
#ifndef __csstack_h
#define __csstack_h

#include "membuf.h"

//	�v�Z���X�^�b�N�p�\����
//
typedef struct OPSTACK {
	int		type;
	int		val;
	char	*opt;
} OPSTACK;

#define OPSTACK_MAX 256		// �v�Z���X�^�b�N�̍ő吔

//  CsStack manager class
class CsStack {
public:
	CsStack();
	~CsStack();
	void Reset( void );
	OPSTACK *Push( int type, int val );
	void Pop( void );
	OPSTACK *Peek( void );
	OPSTACK *Peek2( void );
	void SetExStr( OPSTACK *opstack, char *exstr );
	int GetLevel( void ) { return oplev; };

private:
	//	data
	int oplev;
	OPSTACK opstack[OPSTACK_MAX];
	CMemBuf *buf;
};


#endif
