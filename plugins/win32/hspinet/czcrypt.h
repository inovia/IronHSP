//
//	cz crypt header
//
#ifndef __czcrypt_h
#define __czcrypt_h

typedef struct {
	short	year;		// �N
	char	month;		// ��
	char	day;		// ��

	char	hour;		// ��
	char	min;		// ��
	char	sec;		// �b
	char	msec;		// �~���b

	char	rnd[8];		// �����l
} OURGUID;


class CzCrypt {
public:
	CzCrypt();
	~CzCrypt();

	int				DataSet( char *ptr, int size );			// ��ƃo�b�t�@��ݒ肷��
	int				DataLoad( char *file );					// �t�@�C���̓��e�����[�h���ăo�b�t�@�Ƃ���
	int				DataSave( char *file );					// �o�b�t�@�̓��e���t�@�C���ɏ����o��
	int				Encrypt( void );						// �o�b�t�@���Í���
	int				Decrypt( void );						// �o�b�t�@�𕜍���
	int				GetSize( void );						// �o�b�t�@�T�C�Y���擾
	char*			GetData( void );						// �o�b�t�@�ւ̃|�C���^���擾
	void			SetGUID( OURGUID *guid );				// �Í�/�����̂��߂̃R�[�h��GUID����ݒ肷��
	void			SetSeed( int seed1, int seed2 );		// �Í�/�����̂��߂̃R�[�h��SEED����ݒ肷��
	void			MakeGUID( OURGUID *guid );				// GUID��V�K�ɍ쐬����

	int				GetCRC32( void );						// CRC32�l���擾
	void			GetMD5( char *res );					// MD5�l���擾
	void			GetMD5ext( char *res, char *buf, int size );	// MD5�l���擾

	int				EncodeBASE64( char *dstptr, char *srcptr, int size );
	int				DecodeBASE64( char *dstptr, char *srcptr, int size );
	int				GetBASE64Size( int size );
	int				EncodeRC4( char *ptr, char *key, int size );
	int				DecodeRC4( char *ptr, char *key, int size );


private:
	//		private data
	//
	char*			buffer;									// ����Ώۃf�[�^
	int				size;									// ����Ώۃf�[�^�T�C�Y

	char			randtable[128];							// �Í�/�����p�����e�[�u��


	unsigned int	r_s1,r_s2,r_s3;
	double			rnd_d1,rnd_d2,rnd_d3;

	//		private function
	//
	void			initrnd( int seed );
	double			makernd( void );
	int				makerndi( void );
};


#endif
