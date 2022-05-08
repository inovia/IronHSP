
#include <windows.h>
#include <process.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
//#include <tchar.h>

#include "czhttp.h"

#pragma comment( lib,"Wininet.lib" )

void CzHttp::Terminate( void )
{
	//	Delete Session
	if ( pt != NULL ) {
		free( pt );	pt = NULL;
	}
	if ( hSession != NULL ) {
		InternetCloseHandle( hSession );
		hSession = NULL;
	}
	errstr.clear();
	req_url.clear();
	req_path.clear();
	down_path.clear();
	req_header.clear();

	ClearVarData();
}


void CzHttp::Reset( void )
{
	// Initalize
	//
	char *agent;
	Terminate();

	agent = str_agent;
	if ( agent == NULL ) agent = "HSPInet(HSP3.6; Windows)";

	if ( proxy_url != "" ) {
		char *local_prm = NULL;
		if ( proxy_local ) local_prm = "<local>";
		hSession = InternetOpen( agent, INTERNET_OPEN_TYPE_PROXY, proxy_url.c_str(), local_prm, 0 );
	} else {
		hSession = InternetOpen( agent, INTERNET_OPEN_TYPE_DIRECT, NULL, NULL, 0 );
	}
	if ( hSession == NULL ) {
		mode = CZHTTP_MODE_NONE;
		SetError( "�������Ɏ��s���܂���" ); return;
	}

	username = "anonymous";
	userpass = "aaa@aaa.com";
	ftp_port = INTERNET_DEFAULT_FTP_PORT;
	ftp_flag = 0;

	// Reset Value
	mode = CZHTTP_MODE_READY;
}


CzHttp::CzHttp( void )
{
	//	�R���X�g���N�^
	//
	str_agent = NULL;
	pt = NULL;
	mode = CZHTTP_MODE_NONE;
	hSession = NULL;
	proxy_local = 0;
	proxy_url.clear();
	req_header.clear();
	vardata = NULL;

	//	�ڑ��\��?
	if( InternetAttemptConnect(0) ){
		SetError( "�l�b�g�ڑ����m�F�ł��܂���ł���" ); return;
	}

	//	���������s��
	Reset();
}


CzHttp::~CzHttp( void )
{
	//	�f�X�g���N�^
	//
	Terminate();
	if ( str_agent != NULL ) { free( str_agent ); str_agent = NULL; }
}


//--------------------------------------------------------------//
//				External functions
//--------------------------------------------------------------//

int CzHttp::Exec( void )
{
	//	���t���[�����s
	//
	static char hdr[] = "Content-Type: application/x-www-form-urlencoded\r\n";
	std::string req_name;
	char *name;
	BOOL res;
	int flagmode = 0;

	switch( mode ) {
	case CZHTTP_MODE_REQUEST:			// http�ɐڑ�
		req_name = req_url;
		req_name += req_path;
		hService = InternetOpenUrl( hSession, req_name.c_str(), req_header.c_str(), -1L, 0, INTERNET_FLAG_RELOAD );
		if ( hService == NULL ) {
			SetError( "������URL���w�肳��܂���" );
			break;
		}
		mode = CZHTTP_MODE_REQSEND;
	case CZHTTP_MODE_REQSEND:
		name = (char *)down_path.c_str();
		if ( name[0] == 0 ) name = (char *)req_path.c_str();
		fp = fopen( name, "wb");
		if ( fp == NULL ) {
			SetError( "�_�E�����[�h�t�@�C�����쐬�ł��܂���" );
			break;
		}
		size = 0;
		mode = CZHTTP_MODE_DATAWAIT;
	case CZHTTP_MODE_DATAWAIT:
		{
		DWORD dwBytesRead = INETBUF_MAX;
		if ( InternetReadFile( hService, buf, INETBUF_MAX, &dwBytesRead ) == 0 ) {
			fclose( fp );
			InternetCloseHandle( hService );
			SetError( "�_�E�����[�h���ɃG���[���������܂���" );
			break;
		}
		if( dwBytesRead == 0 ) {
			mode = CZHTTP_MODE_DATAEND;
			break;
		}
		fwrite( buf, dwBytesRead, 1, fp );
		size += dwBytesRead;
		break;
		}
	case CZHTTP_MODE_DATAEND:
		fclose( fp );
		InternetCloseHandle( hService );
		mode = CZHTTP_MODE_READY;
		break;



	case CZHTTP_MODE_VARREQUEST:
		
		if (strncmp(req_url.c_str(), "https://", strlen("https://")) == 0){
			varport = INTERNET_DEFAULT_HTTPS_PORT;
			flagmode= INTERNET_FLAG_RELOAD|INTERNET_FLAG_NO_UI|INTERNET_FLAG_SECURE;
		}else{
			flagmode = INTERNET_FLAG_RELOAD|INTERNET_FLAG_NO_UI;
		}

		req_name = req_url2;
		req_name += req_path;

		// HTTP�ɐڑ�
		hHttpSession = ::InternetConnectA( hSession, varserver.c_str(), varport, NULL, NULL, INTERNET_SERVICE_HTTP, 0, 0 );
		if ( hHttpSession == NULL ) {
			SetError( "�����ȃT�[�o�[���w�肳��܂���" );
			break;
		}

		// HTTP�v���̍쐬
		hHttpRequest = ::HttpOpenRequestA( hHttpSession, varstr.c_str(), req_name.c_str(), HTTP_VERSION, NULL, NULL, flagmode, 0 );
		if ( hHttpSession == NULL ) {
			SetError( "������URL���w�肳��܂���" );
			break;
		}
		mode = CZHTTP_MODE_VARREQSEND;
		// FALL THROUGH
	case CZHTTP_MODE_VARREQSEND:

		// �쐬����HTTP�v���̔��s
		if ( postdata != NULL ) {
			std::string header;
			header = hdr;
			header += req_header;
			res = ::HttpSendRequestA( hHttpRequest, header.c_str(), -1L, postdata, (int)postsize/*strlen(postdata)*/ );
		} else {
			res = ::HttpSendRequestA( hHttpRequest, req_header.c_str(), -1L, NULL, 0 );
		}
		if ( res == false ) {
			InternetCloseHandle( hHttpSession );
			SetError( "���N�G�X�g���ł��܂���ł���" );
			break;
		}
		// HTTP�w�b�_
		HttpQueryInfo( hHttpRequest, HTTP_QUERY_RAW_HEADERS_CRLF, resphead, resphead_size, 0 );
		varsize = 0x40000;
		ClearVarData();
		vardata = (char *)malloc( varsize );
		size = 0;
		mode = CZHTTP_MODE_VARDATAWAIT;
		// FALL THROUGH
	case CZHTTP_MODE_VARDATAWAIT:
		{
		DWORD dwBytesRead;
		int needed_size = size + INETBUF_MAX + 1;
		if ( needed_size > varsize ) {
			while ( needed_size > varsize ) {
				varsize *= 2;
			}
			vardata = (char *)realloc( vardata, varsize );
		}
		if ( InternetReadFile( hHttpRequest, vardata+size, INETBUF_MAX, &dwBytesRead ) == 0 ) {
			InternetCloseHandle( hHttpRequest );
			InternetCloseHandle( hHttpSession );
			SetError( "�_�E�����[�h���ɃG���[���������܂���" );
			break;
		}
		size += dwBytesRead;
		if( dwBytesRead == 0 ) {
			mode = CZHTTP_MODE_VARDATAEND;
			vardata[size] = 0;
			break;
		}
		break;
		}
	case CZHTTP_MODE_VARDATAEND:
		InternetCloseHandle( hHttpRequest );
		InternetCloseHandle( hHttpSession );
		mode = CZHTTP_MODE_READY;
		break;



	case CZHTTP_MODE_INFOREQ:
		req_name = req_url;
		req_name += req_path;
		hService = InternetOpenUrl( hSession, req_name.c_str(), req_header.c_str(), -1L, 0, 0 );
		if ( hService == NULL ) {
			SetError( "������URL���w�肳��܂���" );
			break;
		}
		mode = CZHTTP_MODE_INFORECV;
	case CZHTTP_MODE_INFORECV:
		{
		DWORD dwSize = INETBUF_MAX;
		buf[0] = 0;
		HttpQueryInfo( hService, HTTP_QUERY_RAW_HEADERS_CRLF, buf, &dwSize, 0 );
		InternetCloseHandle( hService );
		mode = CZHTTP_MODE_READY;
		break;
		}

	case CZHTTP_MODE_FTPREADY:
		return 2;

	case CZHTTP_MODE_FTPDIR:
		{
		char tx[512];
		char dname[64];
		char *fname;
		SYSTEMTIME t;

		fname = finddata.cFileName;
		if( finddata.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
			strcpy( dname, "<DIR>" );
        }
        else{
			sprintf( dname, "%d", finddata.nFileSizeLow );
        }
		FileTimeToSystemTime( &finddata.ftLastWriteTime,&t );
		sprintf( tx, "\"%s\",%s,%4d/%02d/%02d,%02d:%02d:%02d\r\n", fname, dname, t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond );
		AddFlexBuf( tx, (int)strlen(tx) );
		if ( !InternetFindNextFile( hFtpEnum, &finddata ) ) {
			InternetCloseHandle( hFtpEnum );
			mode = CZHTTP_MODE_FTPREADY;
		}
		break;
		}

	case CZHTTP_MODE_FTPREAD:
		break;
	case CZHTTP_MODE_FTPWRITE:
		break;
	case CZHTTP_MODE_FTPCMD:
		{
		char tx[1024];
	    DWORD dwBytesRead;
		if( InternetReadFile( hResponse, buf, 1024, &dwBytesRead ) ){
			AddFlexBuf( tx, dwBytesRead );
		}
		if ( dwBytesRead == 0 ) {
			InternetCloseHandle( hResponse );
			mode = CZHTTP_MODE_FTPREADY;
		}
		break;
		}
	case CZHTTP_MODE_FTPRESULT:
		GetFtpResponse();
		break;

	case CZHTTP_MODE_ERROR:
		return -1;
	default:
		return 1;
	}
	return 0;
}


void CzHttp::ClearVarData( void )
{
	if ( vardata == NULL ) return;
	free( vardata );
	vardata = NULL;
}


char *CzHttp::GetError( void )
{
	// �G���[������̃|�C���^���擾
	//
	return (char *)errstr.c_str();
}


int CzHttp::RequestFile( char *path )
{
	// �T�[�o�[�Ƀt�@�C����v��
	//
	if ( mode != CZHTTP_MODE_READY ) {
		return -1;
	}
	req_path = path;
	mode = CZHTTP_MODE_REQUEST;
	return 0;
}

int CzHttp::GetRespHead( char *buff, LPDWORD size ){
	resphead = buff;
	resphead_size = size;
	return 0;
}

char *CzHttp::RequestFileInfo( char *path )
{
	// �T�[�o�[�Ƀt�@�C������v��
	//
	std::string req_name;
	DWORD dwSize = INETBUF_MAX;

	if ( mode != CZHTTP_MODE_READY ) {
		return NULL;
	}
	req_name = req_url;
	req_name += path;

	hService = InternetOpenUrl( hSession, req_name.c_str(), req_header.c_str(), -1L, 0, 0 );
	if ( hService == NULL ) return NULL;

	buf[0] = 0;
	HttpQueryInfo( hService, HTTP_QUERY_RAW_HEADERS_CRLF, buf, &dwSize, 0 );
	InternetCloseHandle( hService );
	return buf;
}


void CzHttp::SetURL( char *url )
{
	// �T�[�o�[��URL��ݒ�
	//
	req_url = url;
}


void CzHttp::SetLocalName( char *name )
{
	// �T�[�o�[��URL��ݒ�
	//
	down_path = name;
}


int CzHttp::GetSize( void )
{
	// �擾�t�@�C���̃T�C�Y��Ԃ�
	//
	if ( mode != CZHTTP_MODE_READY ) return 0;
	return size;
}


char *CzHttp::GetData( void )
{
	// �擾�t�@�C���f�[�^�ւ̃|�C���^��Ԃ�
	//
	if ( mode != CZHTTP_MODE_READY ) return NULL;
	return pt;
}


void CzHttp::SetProxy( char *url, int port, int local )
{
	// PROXY�T�[�o�[�̐ݒ�
	//	(URL��NULL���w�肷���PROXY�����ƂȂ�)
	//
	if ( url == NULL ) {
		proxy_url.clear();
	} else {
		char tmp[128];
		sprintf( tmp, "%s:%d", url, port );
		proxy_local = local;
		proxy_url = tmp;
	}
	Reset();
}


void CzHttp::SetAgent( char *agent )
{
	// �G�[�W�F���g�̐ݒ�
	//	(URL��NULL���w�肷��ƃf�t�H���g�ɂȂ�)
	//
	if ( str_agent != NULL ) { free( str_agent ); str_agent = NULL; }
	if ( agent == NULL ) str_agent = agent; else {
		str_agent = (char *)malloc( strlen( agent ) + 1 );
		strcpy( str_agent, agent );
	}
	Reset();
}


void CzHttp::SetHeader( char *header )
{
	// �w�b�_������̐ݒ�
	//
	req_header = header;
}


void CzHttp::SetUserName( char *name )
{
	// ���[�U�[���̐ݒ�
	//
	username = name;
}


void CzHttp::SetUserPassword( char *pass )
{
	// �p�X���[�h�̐ݒ�
	//
	userpass = pass;
}


void CzHttp::SetFtpPort( int port )
{
	// �|�[�g�̐ݒ�
	//
	ftp_port = port;
}


void CzHttp::SetFtpFlag( int flag )
{
	// �p�b�V�u���[�h�̐ݒ�
	//
	if ( flag ) {
		ftp_flag = INTERNET_FLAG_PASSIVE;
	} else {
		ftp_flag = 0;
	}
}


void CzHttp::ResetFlexBuf( int defsize )
{
	if ( pt != NULL ) {	free( pt );	}
	pt = (char *)malloc( defsize );
	pt_size = defsize;
	pt_cur = 0;
}


void CzHttp::AllocFlexBuf( int size )
{
	char *p;
	if ( pt_size >= size ) return;
	p = (char *)malloc( size );
	memcpy( p, pt, pt_size );
	free( pt );
	pt_size = size;
	pt = p;
}


void CzHttp::AddFlexBuf( char *data, int size )
{
	int i;
	int req_size;
	i = pt_cur + size + 1;
	if ( i > pt_size ) {
		req_size = ( i + 0x0fff ) & 0x7ffff000;
		AllocFlexBuf( req_size );
	}
	memcpy( pt + pt_cur, data, size );
	pt_cur += size;
	pt[ pt_cur ] = 0;									// Terminate
}



void CzHttp::SetVarServerFromURL( void )
{
	char *p;
	char a1;
	char tmp[8];
	p = (char *)req_url.c_str();
	varserver.clear();
	tmp[1] = 0;
	varport = INTERNET_DEFAULT_HTTP_PORT;

	while(1)				// '//'��T��
	{
		a1 = *p++;
		if ( a1 == 0 ) return;
		if ( a1 == '/' ) {
			if ( *p == '/' ) { p++; break; }
		}
	}
	while(1) {				// '/'�܂ł����o��
		a1 = *p;
		if ( a1 == 0 ) break;
		p++;
		if ( a1 == '/' ) break;
		if ( a1 == ':' ) {
			//	�|�[�g�ԍ������o��
			int i = 0;
			while(isdigit(p[i])) {
				i ++;
			}
			if (p[i] == '/' || p[i] == 0) {
				if (i != 0) varport = atoi(p);
				p += i;
				if (*p == '/') p ++;
				break;
			}
		}
		tmp[0] = a1;
		varserver += tmp;
	}

	req_url2 = "/";

	while(1) {				// �Ō�܂Ŏ��o��
		a1 = *p++;
		if ( a1 == 0 ) break;
		tmp[0] = a1;
		req_url2 += tmp;
	}

}


void CzHttp::SetVarRequestGet( char *path )
{
	// �T�[�o�[�Ƀt�@�C����v��(GET)
	//
	if ( mode != CZHTTP_MODE_READY ) {
		return;
	}
	SetVarServerFromURL();
	varstr = "GET";
	req_path = path;
	postdata = NULL;
	mode = CZHTTP_MODE_VARREQUEST;
}


void CzHttp::SetVarRequestPost( char *path, char *post )
{
	// �T�[�o�[�Ƀt�@�C����v��(POST)
	//
	if ( mode != CZHTTP_MODE_READY ) {
		return;
	}
	SetVarServerFromURL();
	varstr = "POST";
	req_path = path;
	postdata = post;
	postsize = (int)strlen(postdata);
	mode = CZHTTP_MODE_VARREQUEST;
}

void CzHttp::SetVarRequestPost2( char *path, char *post, int size )
{
	// �T�[�o�[�Ƀt�@�C����v��(POST)
	//
	if ( mode != CZHTTP_MODE_READY ) {
		return;
	}
	SetVarServerFromURL();
	varstr = "POST";
	req_path = path;
	postdata = post;
	postsize = size;
	mode = CZHTTP_MODE_VARREQUEST;
}

void CzHttp::SetVarRequestPut(char *path, char *post)
{
	// �T�[�o�[�Ƀt�@�C����v��(PUT)
	//
	if (mode != CZHTTP_MODE_READY) {
		return;
	}
	SetVarServerFromURL();
	varstr = "PUT";
	req_path = path;
	postdata = post;
	postsize = (int)strlen(postdata);
	mode = CZHTTP_MODE_VARREQUEST;
}

void CzHttp::SetVarRequestPut2(char *path, char *post, int size)
{
	// �T�[�o�[�Ƀt�@�C����v��(PUT)
	//
	if (mode != CZHTTP_MODE_READY) {
		return;
	}
	SetVarServerFromURL();
	varstr = "PUT";
	req_path = path;
	postdata = post;
	postsize = size;
	mode = CZHTTP_MODE_VARREQUEST;
}

void CzHttp::SetVarRequestDelete(char *path)
{
	// �T�[�o�[�Ƀt�@�C����v��(DELETE)
	//
	if (mode != CZHTTP_MODE_READY) {
		return;
	}
	SetVarServerFromURL();
	varstr = "DELETE";
	req_path = path;
	postdata = NULL;
	mode = CZHTTP_MODE_VARREQUEST;
}

//--------------------------------------------------------------//
//				FTP functions
//--------------------------------------------------------------//

int CzHttp::FtpConnect( void )
{
	// FTP�ڑ�
	//
	*buf = 0;
	if ( mode != CZHTTP_MODE_READY ) {
		return -1;
	}

	hService = InternetConnect( hSession,
                                req_url.c_str(),
                                ftp_port,
                                username.c_str(),
                                userpass.c_str(),
                                INTERNET_SERVICE_FTP,
                                ftp_flag,
                                0 );


	GetFtpResponse();
	if ( mode != CZHTTP_MODE_FTPREADY ) return -1;
	return 0;
}


void CzHttp::FtpDisconnect( void )
{
	// FTP�ؒf
	//
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return;
	}
	InternetCloseHandle( hService );
	mode = CZHTTP_MODE_READY;
}


char *CzHttp::GetFtpResponse( void )
{
	// FTP���X�|���X�ւ̃|�C���^��Ԃ�
	//
	DWORD dwSize = INETBUF_MAX;
	DWORD dwError;
	if ( InternetGetLastResponseInfo( &dwError, buf, &dwSize ) ) {
		mode = CZHTTP_MODE_FTPREADY;
	} else {
		InternetCloseHandle( hService );
		mode = CZHTTP_MODE_ERROR;
	}
	return buf;
}


char *CzHttp::GetFtpCurrentDir( void )
{
	// FTP�J�����g�f�B���N�g�����擾
	//
	DWORD dwSize = INETBUF_MAX;

	if ( mode != CZHTTP_MODE_FTPREADY ) {
		*buf = 0;
		return buf;
	}
	FtpGetCurrentDirectory( hService, buf, &dwSize );
	GetFtpResponse();	// ���ԓ���ւ�
	return buf;
}


void CzHttp::SetFtpDir( char *name )
{
	// FTP�J�����g�f�B���N�g����ύX
	//
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return;
	}
	FtpSetCurrentDirectory( hService, name );
	GetFtpResponse();
}


void CzHttp::GetFtpDirList( void )
{
	// FTP�J�����g�f�B���N�g�����e���擾
	//
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return;
	}
	ResetFlexBuf( 1024 );
    hFtpEnum = FtpFindFirstFile( hService, NULL, &finddata, INTERNET_FLAG_RELOAD | INTERNET_FLAG_DONT_CACHE, 0 );
	if ( hFtpEnum != NULL ) mode = CZHTTP_MODE_FTPDIR;
}


char *CzHttp::GetTempBuffer( void )
{
	// �����o�b�t�@�ւ̃|�C���^��Ԃ�
	//
	return buf;
}


int CzHttp::GetFtpFile( char *name, char *downname, int tmode )
{
	// FTP�t�@�C�����擾
	//
	int i;
	DWORD type;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	type = FTP_TRANSFER_TYPE_BINARY;
	if ( tmode ) type = FTP_TRANSFER_TYPE_ASCII;
	i = FtpGetFile( hService, name, downname, FALSE, FILE_ATTRIBUTE_ARCHIVE, type, 0 );
	GetFtpResponse();	// ���ԓ���ւ�
	if ( i == 0 ) return -1;
	return 0;
}


int CzHttp::PutFtpFile( char *name, char *downname, int tmode )
{
	// FTP�t�@�C���𑗐M
	//
	int i;
	DWORD type;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	type = FTP_TRANSFER_TYPE_BINARY;
	if ( tmode ) type = FTP_TRANSFER_TYPE_ASCII;
	i = FtpPutFile( hService, downname, name, type, 0 );
	GetFtpResponse();	// ���ԓ���ւ�
	if ( i == 0 ) return -1;
	return 0;
}


int CzHttp::RenameFtpFile( char *name, char *newname )
{
	// FTP�t�@�C�������l�[��
	//
	int i;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	if ( newname == NULL ) {
		i = FtpDeleteFile( hService, name );
	} else {
		i = FtpRenameFile( hService, name, newname );
	}
	GetFtpResponse();	// ���ԓ���ւ�
	if ( i == 0 ) return -1;
	return 0;
}


int CzHttp::MakeFtpDir( char *name )
{
	// FTP�f�B���N�g���쐬
	//
	int i;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	i = FtpCreateDirectory( hService, name );
	GetFtpResponse();	// ���ԓ���ւ�
	if ( i == 0 ) return -1;
	return 0;
}


int CzHttp::KillFtpDir( char *name )
{
	// FTP�f�B���N�g���폜
	//
	int i;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	i = FtpRemoveDirectory( hService, name );
	GetFtpResponse();	// ���ԓ���ւ�
	if ( i == 0 ) return -1;
	return 0;
}


int CzHttp::FtpSendCommand( char *cmd )
{
	// FTP�R�}���h���M
	//
	int i;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	ResetFlexBuf( 1024 );
	i = FtpCommand( hService, TRUE, FTP_TRANSFER_TYPE_ASCII, cmd, 0, &hResponse );
	if ( i ) {
		mode = CZHTTP_MODE_FTPCMD;
		return 0;
	}
	return -1;
}


//--------------------------------------------------------------//
//				Utility functions
//--------------------------------------------------------------//

int CzHttp::UrlEncode( char *dst, int dstsize, char *src )
{
	//	URL�G���R�[�h
	//
	int len;
	unsigned char *p;
	unsigned char *wrt;
	int a1;
	p = (unsigned char *)src;
	wrt = (unsigned char *)dst;
	len =0;
	while(1) {
		if ( len >= (dstsize-1) ) break;
		a1 = *p++;
		if ( a1 == 0 ) break;
		if(isalnum(a1) || a1 == ',' ||a1 == '-' || a1 == '_') {
			wrt[len++] = a1;
		} else if (a1 == ' ') {
			wrt[len++] = '+';
		} else {
			wrt[len++] = '%';
			sprintf( (char *)&wrt[len], "%02X",a1 );
			len+=2;
		}
	}
	wrt[len] = 0;
	return len;
}


int CzHttp::UrlDecode( char *dst, int dstsize, char *src )
{
	//	URL�f�R�[�h
	//
	int len,val1,val2;
	unsigned char *p;
	unsigned char *wrt;
	int a1,a2;
	p = (unsigned char *)src;
	wrt = (unsigned char *)dst;
	len =0;
	while(1) {
		if ( len >= (dstsize-1) ) break;
		a1 = *p++;
		if ( a1 == 0 ) break;
		if( a1 == '%' ) {
			a1 = *p++;
			a2 = *p++;
			val1 = CheckHexCode( a1 );
			val2 = CheckHexCode( a2 );
			if (( val1 >= 0 )&&( val2 >= 0 )) {
				wrt[len++] = (val1<<4)+val2;
			} else {
				wrt[len++] = '%';
				wrt[len++] = a1;
				wrt[len++] = a2;
			}
		} else if (a1 == '+') {
			wrt[len++] = ' ';
		} else {
			wrt[len++] = a1;
		}
	}
	wrt[len] = 0;
	return len;
}


//--------------------------------------------------------------//
//				Internal functions
//--------------------------------------------------------------//

int CzHttp::CheckHexCode( int code )
{
	if (( code >= '0' )&&( code <='9' )) {
		return (code-'0');
	}
	if (( code >= 'a' )&&( code <='f' )) {
		return (code-'a'+10);
	}
	if (( code >= 'A' )&&( code <='F' )) {
		return (code-'A'+10);
	}
	return -1;
}


void CzHttp::SetError( char *mes )
{
	//	�G���[�������ݒ�
	//
	mode = CZHTTP_MODE_ERROR;
	errstr = mes;
}


