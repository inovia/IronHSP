//
//	cz http header
//
#ifndef __czhttp_h
#define __czhttp_h

#include <wininet.h>
#define INETBUF_MAX 4096000
#include <string>

enum {
CZHTTP_MODE_NONE = 0,
CZHTTP_MODE_READY,
CZHTTP_MODE_REQUEST,
CZHTTP_MODE_REQSEND,
CZHTTP_MODE_DATAWAIT,
CZHTTP_MODE_DATAEND,
CZHTTP_MODE_INFOREQ,
CZHTTP_MODE_INFORECV,
CZHTTP_MODE_FTPREADY,
CZHTTP_MODE_FTPDIR,
CZHTTP_MODE_FTPREAD,
CZHTTP_MODE_FTPWRITE,
CZHTTP_MODE_FTPCMD,
CZHTTP_MODE_FTPRESULT,
CZHTTP_MODE_ERROR,
CZHTTP_MODE_VARREQUEST,
CZHTTP_MODE_VARREQSEND,
CZHTTP_MODE_VARDATAWAIT,
CZHTTP_MODE_VARDATAEND,
CZHTTP_MODE_MAX
};

class CzHttp {
public:
	CzHttp();
	~CzHttp();
	void Terminate( void );
	void Reset( void );
	int Exec( void );									// ���t���[�����ƂɌĂ΂��
	int GetMode( void ) { return mode; };				// ���݂̃��[�h��Ԃ�
	char *GetError( void );								// �G���[������̃|�C���^���擾
	int RequestFile( char *path );						// �T�[�o�[�Ƀt�@�C����v��
	char *RequestFileInfo( char *path );				// �T�[�o�[�Ƀt�@�C������v��
	void SetURL( char *url );							// �T�[�o�[��URL��ݒ�
	void SetLocalName( char *name );					// �_�E�����[�h����ݒ�
	int GetSize( void );								// �擾�t�@�C���̃T�C�Y��Ԃ�
	char *GetData( void );								// �擾�t�@�C���f�[�^�ւ̃|�C���^��Ԃ�
	void SetAgent( char *agent );						// �G�[�W�F���g�̐ݒ�
	void SetProxy( char *url, int port, int local );	// �v���L�V�̐ݒ�
	void SetHeader( char *header );						// �w�b�_������̐ݒ�
	void SetUserName( char *name );						// ���[�U�[���̐ݒ�
	void SetUserPassword( char *pass );					// �p�X���[�h�̐ݒ�
	void SetFtpPort( int port );						// �|�[�g�̐ݒ�
	void SetFtpFlag( int flag );						// �p�b�V�u���[�h�̐ݒ�
	int GetRespHead( char *buf, LPDWORD size );			// ���X�|���X�w�b�_�̎擾

	void SetVarRequestGet( char *path );
	void SetVarRequestPost( char *path, char *post );
	void SetVarRequestPost2( char *path, char *post, int size );
	void SetVarRequestPut(char *path, char *post);
	void SetVarRequestPut2(char *path, char *post, int size);
	void SetVarRequestDelete(char *path);
	void ClearVarData( void );
	void SetVarServerFromURL( void );
	char *getVarData( void ) { return vardata; };
	int	getVarSize( void ) { return varsize; };

	int FtpConnect( void );								// FTP�ڑ�
	void FtpDisconnect( void );							// FTP�ؒf
	char *GetFtpResponse( void );						// FTP���X�|���X�ւ̃|�C���^��Ԃ�
	char *GetFtpCurrentDir( void );						// FTP�J�����g�f�B���N�g�������擾
	void SetFtpDir( char *name );						// FTP�J�����g�f�B���N�g����ύX
	void GetFtpDirList( void );							// FTP�J�����g�f�B���N�g�����e���擾
	int KillFtpDir( char *name );						// FTP�f�B���N�g���폜
	int MakeFtpDir( char *name );						// FTP�f�B���N�g���쐬
	int GetFtpFile( char *name, char *downname, int tmode );	// FTP�t�@�C���擾
	int PutFtpFile( char *name, char *downname, int tmode );	// FTP�t�@�C�����M
	int RenameFtpFile( char *name, char *newname );		// FTP�t�@�C�����l�[��
	int FtpSendCommand( char *cmd );					// FTP�R�}���h���M

	char *GetTempBuffer( void );						// �����o�b�t�@�ւ̃|�C���^��Ԃ�
	char *GetFlexBuffer( void ) { return pt; };			// �σo�b�t�@�ւ̃|�C���^��Ԃ�

	int UrlEncode( char *dst, int dstsize, char *src );	// URL�G���R�[�h
	int UrlDecode( char *dst, int dstsize, char *src );	// URL�f�R�[�h


private:
	void SetError( char *mes );	

	void ResetFlexBuf( int defsize );
	void AllocFlexBuf( int size );
	void AddFlexBuf( char *data, int size );
	int GetFlexBufSize( void ) { return pt_cur; };
	int CheckHexCode( int code );

	HINTERNET hSession;
	HINTERNET hService;
    HINTERNET hFtpEnum;
    HINTERNET hResponse;
    WIN32_FIND_DATA	finddata;

	HINTERNET hHttpSession;
	HINTERNET hHttpRequest;

	char *str_agent;		// User Agent (optonal)
	int mode;				// Current Mode
	int size;				// File Size

	char *pt;				// Memory Ptr
	int pt_cur;				// Flax Mem Size ( Current )
	int pt_size;			// Flax Mem Size ( Allocated )

	FILE *fp;
	int proxy_local;		// ProxyLocal flag
	int ftp_port;			// Ftp port
	int ftp_flag;			// Ftp flags

	std::string req_url;	// Request URL
	std::string req_url2;	// Request URL (for POST/GET)
	std::string req_path;	// Request PATH
	std::string down_path;	// Download PATH
	std::string proxy_url;	// Proxy URL
	std::string req_header;	// Request Header (optonal)
	std::string username;	// User Name string buffer
	std::string userpass;	// User Pass string buffer
	char buf[INETBUF_MAX];	// temp
	std::string errstr;		// Error string buffer

	std::string varserver;	// VarRequest server name
	std::string varstr;		// VarRequest request token

	INTERNET_PORT varport;	// VarRequest server port
	char *postdata;			// Post data
	int postsize;			// Post size
	char *vardata;			// Transfer destination
	int varsize;			// Transfer max size
	char *resphead;			
	LPDWORD resphead_size;
};


#endif
