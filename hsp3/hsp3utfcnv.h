
//
//	hsp3utfcnv.cpp header
//
#ifndef __hsp3utfcnv_h
#define __hsp3utfcnv_h

#include <stdio.h>

//------------------------------------------------------------//
/*
	windows UTF8,UTF-16 / File 関連のユーティリティ
*/
//------------------------------------------------------------//

#ifdef HSPWIN

//	Wide/Multibyte conversion
//
int hsp3_to_utf16(void* out, char* in, int bufsize);
int utf16_to_hsp3(char* out, void* in, int bufsize);


#ifdef HSPUTF8
#define HSPAPICHAR wchar_t
#define HSPCHAR char

//
//	unicode functions
//

HSPAPICHAR *chartoapichar( const char*,HSPAPICHAR** );
void freehac( HSPAPICHAR** );
HSPCHAR *apichartohspchar( const HSPAPICHAR*,HSPCHAR** );
void freehc( HSPCHAR** );
HSPAPICHAR *ansichartoapichar(const char*, HSPAPICHAR**);
char *apichartoansichar(const HSPAPICHAR*, char**);
void freeac(char**);

#else

#define HSPAPICHAR char
#define HSPCHAR char

//
//	ansi functions (dummy)
//

HSPAPICHAR *chartoapichar( const HSPCHAR*,HSPAPICHAR** );
void freehac( HSPAPICHAR** );
HSPCHAR *apichartohspchar( const HSPAPICHAR*,HSPCHAR** );
void freehc( HSPCHAR** );
HSPAPICHAR *ansichartoapichar(const char *, HSPAPICHAR **);
char *apichartoansichar(const HSPAPICHAR *, char **);
void freeac(char **);

#endif
#endif

//	---- 非 Windows 環境向けの HSPCHAR/HSPAPICHAR/freeac スタブ ----
//	Android (HSPNDK) / iOS (HSPIOS) / Linux 等では ANSI/UTF-16 変換は不要なので、
//	char/char で定義し、変換関数は no-op (code_getads はそのまま UTF-8 を返す)。
#if !defined(HSPWIN) && defined(HSPUTF8)
#ifndef HSPCHAR
#define HSPAPICHAR char
#define HSPCHAR    char
static inline HSPAPICHAR *chartoapichar( const char *s, HSPAPICHAR **out )
{ if (out) *out = (HSPAPICHAR*)s; return (HSPAPICHAR*)s; }
static inline void        freehac( HSPAPICHAR ** ) {}
static inline HSPCHAR    *apichartohspchar( const HSPAPICHAR *s, HSPCHAR **out )
{ if (out) *out = (HSPCHAR*)s; return (HSPCHAR*)s; }
static inline void        freehc( HSPCHAR ** ) {}
static inline HSPAPICHAR *ansichartoapichar( const char *s, HSPAPICHAR **out )
{ if (out) *out = (HSPAPICHAR*)s; return (HSPAPICHAR*)s; }
static inline char       *apichartoansichar( const HSPAPICHAR *s, char **out )
{ if (out) *out = (char*)s; return (char*)s; }
static inline void        freeac( char ** ) {}
#endif
#endif

//		String Service
//
int hsp3_to_utf8(void* out, char* in, int bufsize);
int utf8_to_hsp3(void* out, char* in, int bufsize);
int StrCopyLetter(char* source, char* dest);

//
//		File Service
//
FILE* hsp3_fopen(char* name, int offset=0);
FILE* hsp3_fopenwrite(char* name, int offset=-1);
void hsp3_fclose(FILE* ptr);
int hsp3_flength(char* name);
int hsp3_fread(FILE* ptr, void* mem, int size);
int hsp3_fseek(FILE* ptr, int offset, int whence);
int hsp3_binsave(char* fname8, void* mem, int msize, int seekofs=-1);
int hsp3_rawload(char* name, void* mem, int size, int seekofs);

#endif
