
//
//		Advanced Function Plugin for HSP
//				onion software/onitama 1998
//

#include <windows.h>
#include <io.h>
#include <string.h>
#include <winbase.h>
#include <winuser.h>
#include <shlobj.h>


#include "hspdll.h"


/*------------------------------------------------------------*/
/*
		application capture functions
*/
/*------------------------------------------------------------*/

#define SHIFTKEY 0x10
#define CTRLKEY 0x11
#define ALTKEY 0x12

static	HWND tarhw=NULL;
static	int stobj, objcnt;
static	char wtitle[256];
static	int lastk1,lastk2;


static BOOL CALLBACK cbWins( HWND hwnd, LPARAM lParam )
{
	int a;
	char a1;
	char namtmp[256];

	objcnt++;
	if (objcnt<stobj) return TRUE;
	GetWindowText( hwnd,namtmp,256 );
	a=0;
	while(1) {
		a1=wtitle[a];if (a1==0) break;
		if (a1!=namtmp[a]) return TRUE;
		a++;
	}
	tarhw=hwnd;
	return FALSE;
}

static BOOL CALLBACK cbChild( HWND hwnd, LPARAM lParam )
{
	int a;
	char a1;
	char namtmp[256];

	objcnt++;
	if (objcnt<stobj) return TRUE;
	GetClassName( hwnd,namtmp,256 );

	if (wtitle[0]!=0) {
		a=0;
		while(1) {
			a1=toupper(namtmp[a]);if (a1==0) break;
			if ( a1!=toupper(wtitle[a]) ) return TRUE;
			a++;
		}
	}
	tarhw=hwnd;
	return FALSE;
}


EXPORT BOOL WINAPI aplsel ( BMSCR *bm, char *p1, int p2, char *p3 )
{
	//		select window object (type$16)
	//			aplsel "winname"
	//
	tarhw=NULL;
	objcnt=0;stobj=p2+1;
	strcpy( wtitle,p1 );
	EnumWindows( (WNDENUMPROC) &cbWins, 0 );
	if (tarhw==NULL) return -1;
	//SetForegroundWindow( tarhw );
	GetWindowText( tarhw,p3,64 );
	return 0;
}


EXPORT BOOL WINAPI aplact ( int p1, int p2, int p3, char *p4 )
{
	//		select window object (type$10)
	//			aplactive
	//
	if (tarhw==NULL) return -1;
	SetForegroundWindow( tarhw );
	GetWindowText( tarhw,p4,64 );
	return 0;
}


EXPORT BOOL WINAPI aplobj ( BMSCR *bm, char *p1, int p2, char *p3 )
{
	//		select child window object (type$16)
	//			aplobj "winname"
	//
	HWND oldhw;
	if (tarhw==NULL) return -1;
	objcnt=0;stobj=p2+1;
	strcpy( wtitle,p1 );
	oldhw=tarhw;
	EnumChildWindows( tarhw, (WNDENUMPROC) &cbChild, 0 );
	SetFocus( tarhw );
	if (tarhw==oldhw) return -1;
	GetClassName( tarhw,p3,64 );
	return 0;
}


static HWND GetFocusWindow( void )
{
	HWND hw;
	if (tarhw!=NULL) return tarhw;
	hw=GetFocus();
	if (hw!=NULL) return hw;
	hw=GetActiveWindow();
	if (hw!=NULL) return hw;
	hw=GetForegroundWindow();
	return hw;
}


EXPORT BOOL WINAPI aplget ( char *p1, int p2, int p3, int p4 )
{
	//		get window text from current object (type1)
	//			aplget var,maxstr
	//
	HWND tt;
	int len;
	len=p2;
	if (len==0) len=64;

	tt=tarhw;
	if (tt==NULL) tt=GetForegroundWindow();

	GetWindowText( tt,p1,len );
	return 0;
}


EXPORT BOOL WINAPI apledit ( int *p1, int p2, int p3, char *p4 )
{
	//		get "Edit" control window status (type$11)
	//			apledit var,statno,line#
	//
	HWND tt;
	int a,prm;
	tt=tarhw;
	if (tt==NULL) tt=GetForegroundWindow();
	if (p2==0) {
		SendMessage( tt,EM_GETSEL , (WPARAM)p1, (LPARAM)&a );
		a=a-(*p1);
		return -a;
	}
	else {
		if (p2>1) prm=EM_LINELENGTH; else prm=EM_GETLINECOUNT;
		*p1=(int)SendMessage( tt,prm , p3, 0 );
	}
	return 0;
}


static void _sendstr( char *p1 )
{
	//		Win9x�p
	LPARAM lprm;
	HWND hw;
	char mes[1024];
	char a1;
	int a;

	strcpy( mes, p1 );
	hw=GetFocusWindow();
	lprm=1;
	a=0;
	while(1) {
		a1=mes[a];if (a1==0) break;
		PostMessage( hw,WM_CHAR, a1, lprm );
		a++;
	}
}

static void _sendstr2( char *p1 )
{
	//		Win2000�ȍ~�p
	LPARAM lprm;
	HWND hw;
	unsigned char mes[1024];
	unsigned char a1;
	int acode;
	int a;

	strcpy( (char *)mes, p1 );

	hw=GetFocusWindow();
	lprm=1;
	a=0;
	while(1) {
		a1=mes[a];if (a1==0) break;
		if ( a1 & 0x80 ) {
			acode = (int)mes[a+1];
			acode = (acode<<8) | a1;
			PostMessage( hw,WM_CHAR, acode, 0 );
			a+=2;
		} else {
			PostMessage( hw,WM_CHAR, a1, lprm );
			a++;
		}
	}
}


EXPORT BOOL WINAPI aplstr ( BMSCR *bm, char *p1, int p2, int p3 )
{
	//		send key event (type6)
	//			aplkey "strings"
	//
	DWORD version;
	version = GetVersion();
	if ( LOBYTE(LOWORD(version)) > 4 ) {
		_sendstr2( p1 );
		return 0;
	}
	_sendstr( p1 );
	return 0;
}


EXPORT BOOL WINAPI aplkeyd ( BMSCR *bm, int p1, int p2, int p3 )
{
	//		send key event(keydown) (type2)
	//			aplkeyd keycode, mode
	//			mode : 1=shift / 2=ctrl / 4=alt
	//
	int code;
	//int vkey;
	int spkey;
	LPARAM lprm;
	HWND hw;
	BYTE kb[256];

	hw=GetFocusWindow();
	code=p1;spkey=p2;
	lastk1=p1;lastk2=p2;

	//vkey=VkKeyScan(p1);
	//spkey=(vkey>>8)|p2;
	//code=vkey & 0xff;

	lprm=1;if (spkey&4) lprm|=0x20000000;

	if (spkey) {
		GetKeyboardState(kb);
		if (spkey&1) {
			PostMessage( hw,WM_KEYDOWN, SHIFTKEY,lprm );
			kb[SHIFTKEY]=0x81;
		}
		if (spkey&2) {
			PostMessage( hw,WM_KEYDOWN, CTRLKEY,lprm );
			kb[CTRLKEY]=0x81;
		}
		if (spkey&4) {
			PostMessage( hw,WM_SYSKEYDOWN, ALTKEY,lprm );
			kb[ALTKEY]=0x81;
		}
		SetKeyboardState(kb);
	}

	if (spkey&4) {
		PostMessage( hw,WM_SYSKEYDOWN, code, lprm );
	}
	else {
		if (code) PostMessage( hw,WM_KEYDOWN, code, lprm );
	}
	return 0;
}



EXPORT BOOL WINAPI aplkeyu ( BMSCR *bm, int p1, int p2, int p3 )
{
	//		send key event(keyup) (type2)
	//			aplkeyd keycode, mode
	//			mode : 1=shift / 2=ctrl / 4=alt
	//
	int code;
	//int vkey;
	int spkey;
	LPARAM lprm;
	HWND hw;
	BYTE kb[256];

	hw=GetFocusWindow();
	code=p1;spkey=p2;
	if (code==0) { code=lastk1;spkey=lastk2; }

	//vkey=VkKeyScan(p1);
	//spkey=(vkey>>8)|p2;
	//code=vkey & 0xff;

	lprm=1;if (spkey&4) lprm|=0x20000000;
	lprm|=0xd0000000;

	if (spkey&4) {
		PostMessage( hw,WM_SYSKEYUP, code, lprm );
	}
	else {
		if (code) PostMessage( hw,WM_KEYUP, code, lprm );
	}

	if (spkey) {
		GetKeyboardState(kb);
		if (spkey&1) {
			PostMessage( hw,WM_KEYUP, SHIFTKEY,lprm );
			kb[SHIFTKEY]=0;
		}
		if (spkey&2) {
			PostMessage( hw,WM_KEYUP, CTRLKEY,lprm );
			kb[CTRLKEY]=0;
		}
		if (spkey&4) {
			lprm&=0xdfffffff;
			PostMessage( hw,WM_KEYUP, ALTKEY,lprm );
			//PostMessage( hw,WM_SYSKEYUP, ALTKEY,lprm );
			kb[ALTKEY]=0;
		}
		SetKeyboardState(kb);
	}
	return 0;
}


EXPORT BOOL WINAPI aplkey ( BMSCR *bm, int p1, int p2, int p3 )
{
	//		send key event(up/down) (type2)
	//			aplkeyd keycode, mode
	//			mode : 1=shift / 2=ctrl / 4=alt
	//
	aplkeyd( bm,p1,p2,p3 );
	aplkeyu( bm,0,0,0 );
	return 0;
}


EXPORT BOOL WINAPI aplfocus ( BMSCR *bm, int p1, int p2, int p3 )
{
	//		focus fix off (type2)
	//
	tarhw=NULL;
	//tarhw=GetForegroundWindow();
	//tarhw=GetFocus();
	return 0;
}


/*------------------------------------------------------------*/
/*
		DOS prompt capture functions
*/
/*------------------------------------------------------------*/

static int dosp_mode;
static char *dosp_buf;
static HANDLE hPipe1Read, hPipe1Write;
static HANDLE hPipe2Read, hPipe2Write;
static HANDLE hPipe3Read, hPipe3Write;
static HANDLE hStdIn, hStdOut, hStdErr;
static STARTUPINFO si;
static PROCESS_INFORMATION pi;
static char StdIn[16];

EXPORT BOOL WINAPI pipeexec( char *p1, char *p2, int p3, int p4 )
{
	//		process execute with pipe (type5)
	//			pipeexec buf, "command-line", hide_sw
	//
	int result;

	// Make StdOut Pipe
	CreatePipe(&hPipe1Read, &hPipe1Write, NULL, 4096);
	DuplicateHandle(GetCurrentProcess(), hPipe1Write, GetCurrentProcess(), &hStdOut, 0, true, DUPLICATE_CLOSE_SOURCE | DUPLICATE_SAME_ACCESS);

	// Make StdIn Pipe
	CreatePipe(&hPipe2Read, &hPipe2Write, NULL, 65536);
	DuplicateHandle(GetCurrentProcess(), hPipe2Read, GetCurrentProcess(), &hStdIn, 0, true, DUPLICATE_CLOSE_SOURCE | DUPLICATE_SAME_ACCESS);

	// Make StdErr Pipe
	CreatePipe(&hPipe3Read, &hPipe3Write, NULL, 4096);
	DuplicateHandle(GetCurrentProcess(), hPipe3Write, GetCurrentProcess(), &hStdErr, 0, true, DUPLICATE_CLOSE_SOURCE | DUPLICATE_SAME_ACCESS);

	// Intialize StartupInfo
	memset(&si, 0, sizeof(si));
	si.cb = sizeof(si);

	if ( p3 ) {
		si.dwFlags = STARTF_USESTDHANDLES;
	}
	else {
		si.dwFlags = STARTF_USESTDHANDLES | STARTF_USESHOWWINDOW;
		si.wShowWindow = SW_HIDE;
	}

	si.hStdInput = hStdIn;
	si.hStdOutput = hStdOut;
	si.hStdError = hStdErr;

	*StdIn = 0;
	strcat ( StdIn, "\x1a" );	 // EOF

	result = CreateProcess( NULL, p2, NULL, NULL, TRUE, NORMAL_PRIORITY_CLASS | CREATE_NO_WINDOW, NULL, NULL, &si, &pi );
	dosp_buf = p1;

	if ( result ) {
		dosp_mode = 0;
	}
	else {
		dosp_mode = -1;
	}

	return dosp_mode;
}



EXPORT BOOL WINAPI pipeget( PVAL2 *p1, int p2, int p3, int p4 )
{
	//		get process status (type$83)
	//			pipeget var
	//
	DWORD ReadCount = 0, ReadError = 0;
	DWORD WriteSize = 0;
	char *Buf;
	int bsize;
	Buf = p1->pt;
	bsize = (p1->len[1])<<2;
	BOOL bRetStdOut, bRetStdErr;

	switch( dosp_mode ) {
	case 0:
		CloseHandle(pi.hThread);
		CloseHandle(hStdOut);	// Close StdOutPut
		CloseHandle(hStdIn);	// Close StdInPut
		CloseHandle(hStdErr);	// Close StdError

		dosp_mode++;
		return -1;
	case 1:
	case 2:
		bRetStdOut = PeekNamedPipe(hPipe1Read, NULL, 0, NULL, &ReadCount, NULL);
		bRetStdErr = PeekNamedPipe(hPipe3Read, NULL, 0, NULL, &ReadError, NULL);
		if( !bRetStdOut && !bRetStdErr ) {
			dosp_mode += 2;
		} else {
			if( 0 < ReadCount ) {
				// StdOut��ǂ�
				ReadFile(hPipe1Read, Buf, min(bsize-1, ReadCount), &ReadCount, NULL) ;
				Buf[ReadCount] = 0;
				strcat( dosp_buf, Buf );
				return -2;
			} else if( 0 < ReadError ) {
				// StdErr��ǂ�
				ReadFile(hPipe3Read, Buf, min(bsize-1, ReadError), &ReadError, NULL) ;
				Buf[ReadError] = 0;
				strcat( dosp_buf, Buf );
				return -3;
			} else if( 0 == ReadCount && 0 == ReadError ) {
				if( WAIT_OBJECT_0 == WaitForSingleObject(pi.hProcess, 0) ) {
					dosp_mode += 2;
				}
			}
		}
		return -2;
	case 3:
		// StdInPut�𑗂�
		WriteFile(hPipe2Write, StdIn, strlen( StdIn ), &WriteSize, NULL); // EOF�𑗂�

		// ���Ƃ��܂�
		WaitForSingleObject(pi.hProcess, INFINITE);
		CloseHandle(pi.hProcess);
		CloseHandle(hPipe1Read);	  	// Close StdOut Pipe
		CloseHandle(hPipe2Write);		// Close StdIn Pipe
		CloseHandle(hPipe3Read);		// Close StdError Pipe
		dosp_mode = -1;
		return -4;
	default:
		break;
	}
	return 0;
}


EXPORT BOOL WINAPI pipeput( int p1, int p2, int p3, int p4 )
{
	//		send character to pipe (type0)
	//			pipeput code
	//
	DWORD dwWrite;
	char buf[16];
	buf[0] = p1;
	buf[1] = 0;
	WriteFile( hPipe2Write, buf, 1, &dwWrite, NULL);
	return 0;
}
