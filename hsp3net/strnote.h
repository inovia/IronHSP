
//	strnote.cpp functions

#ifndef __strnote_h
#define __strnote_h

#define STRNOTE_FIND_MATCH 0	// ���S��v
#define STRNOTE_FIND_FIRST 1	// �O����v
#define STRNOTE_FIND_INSTR 2	// ������v

//  class
class CStrNote {
public:
	CStrNote();
	~CStrNote();

	void Select( char *str );
	int GetSize( void );
	char *GetStr( void );
	int GetMaxLine( void );
	int GetLine( char *nres, int line );
	int GetLine( char *nres, int line, int max );
	int PutLine( char *nstr, int line, int ovr );
	char *GetLineDirect( int line );
	void ResumeLineDirect( void );
	int FindLine( char *nstr, int mode );

private:
	int nnget( char *nbase, int line );
	int FindLineSub( char *nstr, int mode );

	char *base;
	int lastcr;
	char *nn;
	char *lastnn;
	char lastcode;
	char *baseline;
	char nulltmp[4];
};

#endif
