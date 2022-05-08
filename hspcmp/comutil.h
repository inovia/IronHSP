
//
//	comutil.cpp header
//
#ifndef __comutil_h
#define __comutil_h

typedef struct _COM_GUID {
	int		Data1;      // 4�o�C�g
	short   Data2;      // 2�o�C�g
	short   Data3;      // 2�o�C�g
	char	Data4[8];   // 1�o�C�g�~8
} COM_GUID;

int ConvertIID( COM_GUID *guid, char *name );

#endif
