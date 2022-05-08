//
//		Sound manager (directX8)
//			onitama 2006/6
//
#include <stdio.h>
#define STRICT
#include <windows.h>
#include <dsound.h>
#include <math.h>
#include <ks.h>
#include <ksmedia.h>

#include "dxsnd.h"
#include "../supio.h"

#define RELEASE(x) 	if(x){x->Release();x=NULL;}

//#define USE_OGGVORBIS				// OGG�g�p�t���O

#ifdef USE_OGGVORBIS
#include "ogg/odxt.h"
#endif

//		Struct
//
typedef struct
{
short flag;			// enable flag
short volume;		// volume(0�`-10000)
short pan;			// pan(-10000�`10000)
short speed;		// speed
int loopptr;		// loop pointer
LPDIRECTSOUNDBUFFER lpSoundBuffer;	// DxBuffer
char *fname;		// file name (optional)

} SNDINF;

//		Data
//
static		int sndflg;
static		LPDIRECTSOUND8	lpDirectSound;
static		LPDIRECTSOUNDBUFFER lpPrimaryBuffer;
static		SNDINF *sndinf;

#define OGGFLAG_NONE 0
#define OGGFLAG_PLAYING 1

#ifdef USE_OGGVORBIS
static		ODXT	odxt;		//	ODXT handle
static		int		oggflag;
#endif

/*------------------------------------------------------------*/
/*
		support routines
*/
/*------------------------------------------------------------*/

//�`�����N�擾
static long GetChunk( unsigned char *pSrcData, unsigned char **ppDstData, unsigned long *pSize )
{
	long DataSize = 0;

	// �`�����N�T�C�Y�擾
	DataSize = *( (long *)pSrcData );
	pSrcData += 4;

	// �f�[�^��M�p�o�b�t�@����
	(*ppDstData) = new unsigned char [ DataSize ];

	// �`�����N�f�[�^�擾
	memcpy( (*ppDstData), pSrcData, DataSize );

	if ( pSize != NULL) *pSize = DataSize;

	return DataSize + 4;
}


//WAVE�f�[�^�`�F�b�N
static long CheckWaveData( unsigned char *pFormat, void *pwf )
{
	WAVEFORMATEXTENSIBLE *_pwf = (WAVEFORMATEXTENSIBLE *)pwf;

	long result = -1;

	// �t�H�[�}�b�g���擾
	unsigned short *format = (unsigned short *)pFormat;

	ZeroMemory( _pwf, sizeof(WAVEFORMATEXTENSIBLE) );

	//=================================================
	// �t�H�[�}�b�g���Ƃɏ����킯
	//=================================================
	switch ( *format )
	{
	//-------------------------------------------------
	// PCM
	//-------------------------------------------------
	case WAVE_FORMAT_PCM:
		_pwf->Format.wFormatTag		= *((unsigned short *)pFormat);	pFormat += 2;
		_pwf->Format.nChannels			= *((unsigned short *)pFormat);	pFormat += 2;
		_pwf->Format.nSamplesPerSec	= *((unsigned long *)pFormat);		pFormat += 4;
		_pwf->Format.nAvgBytesPerSec	= *((unsigned long *)pFormat);		pFormat += 4;
		_pwf->Format.nBlockAlign		= *((unsigned short *)pFormat);	pFormat += 2;
		_pwf->Format.wBitsPerSample	= *((unsigned short *)pFormat);
		_pwf->Format.cbSize			= 0;
		result = 0;
		break;
	//-------------------------------------------------
	// �}���`�`�����l�� �E�F�[�u �t�H�[�}�b�g
	//-------------------------------------------------
	case WAVE_FORMAT_EXTENSIBLE:
		*_pwf = *((WAVEFORMATEXTENSIBLE *)pFormat);
		result = 1;
		break;
	//-------------------------------------------------
	// ���kWAVE
	//-------------------------------------------------
	default:
		_pwf->Format.wFormatTag		= *((unsigned short *)pFormat);	pFormat += 2;
		_pwf->Format.nChannels			= *((unsigned short *)pFormat);	pFormat += 2;
		_pwf->Format.nSamplesPerSec	= *((unsigned long *)pFormat);		pFormat += 4;
		_pwf->Format.nAvgBytesPerSec	= *((unsigned long *)pFormat);		pFormat += 4;
		_pwf->Format.nBlockAlign		= *((unsigned short *)pFormat);	pFormat += 2;
		_pwf->Format.wBitsPerSample	= *((unsigned short *)pFormat);	pFormat += 2;
		_pwf->Format.cbSize			= *((unsigned short *)pFormat);
		result = 2;
	}

	return result;
}

static unsigned long GetWaveData( unsigned char *pData, unsigned char **ppMasterData, void *pwf )
{
	WAVEFORMATEXTENSIBLE *_pwf = (WAVEFORMATEXTENSIBLE *)pwf;

	unsigned char *pFormat	= NULL;
	unsigned long WaveData	= 0;
	unsigned long DataSize	= 0;
	unsigned long result	= 0;
	char Chunk[5]			= "";

	//--------------------------------------------------------
	// "RIFF"�̕�����
	//--------------------------------------------------------
	memcpy( Chunk, pData, 4 );
	pData += 4;
	if ( strcmp( "RIFF", Chunk ) ) goto EXIT_DATALOAD;

	//--------------------------------------------------------
	// RIFF�f�[�^�T�C�Y
	//--------------------------------------------------------
	pData += 4;

	//--------------------------------------------------------
	// "WAVE"�̕�����
	//--------------------------------------------------------
	memcpy( Chunk, pData, 4 );
	pData += 4;
	if ( strcmp( "WAVE", Chunk ) ) goto EXIT_DATALOAD;

	//========================================================
	// �`�����N���擾
	//========================================================
	while ( TRUE )
	{
		unsigned long size = 0;
		// �Ȃ�̃`�����N���ȁ`
		memcpy( Chunk, pData, 4 );
		pData += 4;

		//-------------------------------------------------
		// �t�H�[�}�b�g
		//-------------------------------------------------
		if ( strcmp( "fmt ", Chunk ) == 0 )
		{
			size += GetChunk( pData, &pFormat, NULL );
			pData += size;
		}
		//-------------------------------------------------
		// �f�[�^
		//-------------------------------------------------
		else if ( strcmp( "data", Chunk ) == 0 )
		{
			size += GetChunk( pData, &pData, &DataSize  );
			break;
		}
		//-------------------------------------------------
		// �킩���
		//-------------------------------------------------
		else
		{
			// �Ȃ�ł��Ⴄ�񂩂�
			size = *( (unsigned long *)pData );
			pData += 4 + size;
		}
	}

	//========================================================
	// WAVE�f�[�^�̒��g�m�F
	//========================================================
	WaveData = CheckWaveData( pFormat, _pwf );

	if ( WaveData == -1 ) goto EXIT_DATALOAD;

	(*ppMasterData) = new unsigned char [ DataSize ];
	memcpy( (*ppMasterData), pData, DataSize );
	result = DataSize;

	// �I��
EXIT_DATALOAD:
	if ( pData != NULL ) delete [] pData;
	if ( pFormat != NULL ) delete [] pFormat;

	return result;
}


static int GetEmptyEntry( void )
{
	int i;
	for(i=0;i<SNDINF_MAX;i++) {
		if ( sndinf[i].flag == SNDFLAG_NONE ) return i;
	}
	return -1;
}


static void ResetSndInf( SNDINF *snd )
{
	//	�e��f�t�H���g
	snd->volume = 0;
	snd->pan = 0;
	snd->speed = 0;
	snd->loopptr = -1;
}


static void StopOgg( void )
{
#ifdef USE_OGGVORBIS
	if ( oggflag != OGGFLAG_NONE ) {
		ODXT_Stop( odxt );
		ODXT_Destroy( odxt );
		oggflag = OGGFLAG_NONE;
	}
#endif
}


static void PlayOgg( SNDINF *snd )
{
#ifdef USE_OGGVORBIS
	StopOgg();
	odxt = ODXT_Create();
	ODXT_SetLoopPoint( odxt, snd->loopptr );
	ODXT_StartFname( odxt, snd->fname, 0 );
	ODXT_SetOutPan( odxt, snd->pan );
	ODXT_SetOutVol( odxt, snd->volume );
	oggflag = OGGFLAG_PLAYING;
#endif
}


static void PlayOggPos( SNDINF *snd, int pos )
{
#ifdef USE_OGGVORBIS
	StopOgg();
	odxt = ODXT_Create();
	ODXT_SetLoopPoint( odxt, snd->loopptr );
	ODXT_StartFname( odxt, snd->fname, pos );
	ODXT_SetOutPan( odxt, snd->pan );
	ODXT_SetOutVol( odxt, snd->volume );
	oggflag = OGGFLAG_PLAYING;
#endif
}


static int OggStat( void )
{
#ifdef USE_OGGVORBIS
	if ( oggflag != OGGFLAG_NONE ) {
		if ( ODXT_GetStat( odxt ) == ODXT_STAT_PLAY ) return 1;
	}
#endif
	return 0;
}


/*------------------------------------------------------------*/
/*
		Main process
*/
/*------------------------------------------------------------*/

int SndInit( HWND hWnd )
{
	HRESULT hr;

	sndflg = -1;

	// DirectSound����
	hr = CoCreateInstance(
		CLSID_DirectSound8,
		NULL, 
		CLSCTX_INPROC,
		IID_IDirectSound8,
		(void **)&lpDirectSound );
	if FAILED( hr ) return -1;

	// ������
	hr = lpDirectSound->Initialize( NULL );
	if FAILED( hr ) return -2;

	// �������x���̐ݒ�
	hr = lpDirectSound->SetCooperativeLevel( hWnd, DSSCL_PRIORITY );
	if FAILED( hr ) {
		hr = lpDirectSound->SetCooperativeLevel( hWnd, DSSCL_NORMAL );
		if FAILED( hr ) return -3;
	}

	// �v���C�}���T�E���h�o�b�t�@����
	DSBUFFERDESC desc = { sizeof(DSBUFFERDESC) };
	desc.dwFlags = DSBCAPS_PRIMARYBUFFER	// �v���C�}���o�b�t�@�����
        | DSBCAPS_CTRLVOLUME				// �{�����[���̕ύX��L���ɂ���
        | DSBCAPS_CTRLPAN;					// �p����L���ɂ���

	hr = lpDirectSound->CreateSoundBuffer( &desc, &lpPrimaryBuffer, NULL );
	if FAILED( hr ) return -4;

	sndinf = (SNDINF *)malloc( sizeof(SNDINF) * SNDINF_MAX );
	for(int i=0;i<SNDINF_MAX;i++) {
		sndinf[i].flag = SNDFLAG_NONE;
	}

	// Initalize OGG lib.
#ifdef USE_OGGVORBIS
	ODXT_INIT_PARAM	param;
	param.lpDS = lpDirectSound;
	param.use_software_soundbuffer = FALSE;
	param.focus_sound              = TRUE;
	ODXT_Init(&param);
	oggflag = OGGFLAG_NONE;
#endif

	sndflg = 0;

	return 0;
}


void SndTerm( void )
{
	if ( sndflg == 0 ) {
		//	�I������
		SndStopAll();
		SndReset();
#ifdef USE_OGGVORBIS
		ODXT_Finish();
#endif
		lpPrimaryBuffer->Release();
		lpDirectSound->Release();
		free( sndinf );
	}
}


void SndReset( void )
{
	int i;
	if ( sndflg ) return;
	for(i=0;i<SNDINF_MAX;i++) {
		SndStop( i );
		SndDelete( i );
	}
}


void SndDelete( int id )
{
	SNDINF *snd;
	if ( sndflg ) return;
	if (( id < 0 )||( id >= SNDINF_MAX )) return;
	snd = &sndinf[id];
	if ( snd->flag & SNDFLAG_READY_WAV ) {
		snd->lpSoundBuffer->Release();
	}
	if ( snd->flag & SNDFLAG_READY_OGG ) {
		free( snd->fname );
	}
	snd->flag = SNDFLAG_NONE;
}


void SndSetVolume( int id, int vol )
{
	int type;
	SNDINF *snd;
	if ( sndflg ) return;
	if (( id < 0 )||( id >= SNDINF_MAX )) return;
	snd = &sndinf[id];
	snd->volume = vol;
	type = snd->flag & 15;
	switch( type ) {
	case SNDFLAG_READY_WAV:
		snd->lpSoundBuffer->SetVolume( snd->volume );
		break;
#ifdef USE_OGGVORBIS
	case SNDFLAG_READY_OGG:
		ODXT_SetOutVol( odxt, snd->volume );
		break;
#endif
	}
}


void SndSetPan( int id, int pan )
{
	int type;
	SNDINF *snd;
	if ( sndflg ) return;
	if (( id < 0 )||( id >= SNDINF_MAX )) return;
	snd = &sndinf[id];
	snd->pan = pan;
	type = snd->flag & 15;
	switch( type ) {
	case SNDFLAG_READY_WAV:
		snd->lpSoundBuffer->SetPan( snd->pan );
		break;
#ifdef USE_OGGVORBIS
	case SNDFLAG_READY_OGG:
		ODXT_SetOutPan( odxt, snd->pan );
		break;
#endif
	}
}


void SndSetLoop( int id, int loop )
{
	SNDINF *snd;
	if ( sndflg ) return;
	if (( id < 0 )||( id >= SNDINF_MAX )) return;
	snd = &sndinf[id];
	if ( loop < 0 ) {
		snd->flag &= ~SNDFLAG_LOOP;
		snd->loopptr = -1;
		return;
	}
	snd->flag |= SNDFLAG_LOOP;
	snd->loopptr = loop;
}


int SndRegistWav( int newid, char *mem, int option )
{
	int id;
	SNDINF *snd;
	id = newid;
	if ( sndflg ) return -1;
	if ( id < 0 ) {
		id = GetEmptyEntry();
	} else {
		SndDelete( id );
	}
	if (( id < 0 )||( id >= SNDINF_MAX )) return -1;
	snd = &sndinf[id];

    DSBUFFERDESC desc = { sizeof(DSBUFFERDESC) };
    LPDIRECTSOUNDBUFFER lpTempBuff = NULL;
    LPDIRECTSOUNDBUFFER8 lpBuffer = NULL;
    LPBYTE lpData = NULL;
    WAVEFORMATEXTENSIBLE wf;
    DWORD DataSize;
    LPVOID lpSoundData1, lpSoundData2;
    DWORD size1, size2;
    bool result = false;
    HRESULT hr;

	DataSize = GetWaveData( (unsigned char *)mem, &lpData, &wf );
    if ( DataSize == 0 ) goto EXIT_LOAD;

    // DirectSoundBuffer�ݒ�
	desc.dwFlags = DSBCAPS_LOCSOFTWARE | DSBCAPS_CTRLPAN | DSBCAPS_CTRLVOLUME | /*DSBCAPS_CTRLFX |*/ DSBCAPS_GLOBALFOCUS;
	desc.dwBufferBytes = DataSize;
	desc.lpwfxFormat = &wf.Format;

    // DirectSoundBuffer����
    hr = lpDirectSound->CreateSoundBuffer( &desc, &lpTempBuff, NULL );
    if FAILED( hr ) goto EXIT_LOAD;

    // DirectSoundBuffer8�擾
    hr = lpTempBuff->QueryInterface( IID_IDirectSoundBuffer8, (void **)&lpBuffer );
    // DirectSoundBuffer�J��
    lpTempBuff->Release();

    if FAILED( hr ) goto EXIT_LOAD;

    // �o�b�t�@��������
    hr = lpBuffer->Lock(
                    0, DataSize,
                    &lpSoundData1, &size1,
                    &lpSoundData2, &size2,
                    DSBLOCK_ENTIREBUFFER
                );
    if FAILED( hr ) goto EXIT_LOAD;

    memcpy( lpSoundData1, lpData, DataSize );
    lpBuffer->Unlock( lpSoundData1, size1, lpSoundData2, size2 );
	snd->lpSoundBuffer = lpBuffer;

	snd->lpSoundBuffer->SetCurrentPosition( 0 );
	snd->lpSoundBuffer->SetVolume( 0 );
	snd->lpSoundBuffer->SetPan( 0 );
	snd->flag = SNDFLAG_READY_WAV;
	snd->flag |= option;
	ResetSndInf( snd );

	//Alertf( "DataSize %d (%d,%d)", DataSize, size1, size2 );
	//Alertf( "%dBit %.1lfKHz", wf.Format.wBitsPerSample, wf.Format.nSamplesPerSec/1000.0 );

	if ( lpData != NULL ) delete [] lpData;
	return id;

EXIT_LOAD:
    if ( lpData != NULL ) delete [] lpData;
	return -1;
}


int SndRegistOgg( int newid, char *fname, int option )
{
	int id;
	id = newid;
	if ( sndflg ) return -1;

#ifdef USE_OGGVORBIS
	SNDINF *snd;
	if ( id < 0 ) {
		id = GetEmptyEntry();
	} else {
		SndDelete( id );
	}
	if (( id < 0 )||( id >= SNDINF_MAX )) return -1;
	snd = &sndinf[id];
	snd->flag = SNDFLAG_READY_OGG;
	snd->flag |= option;
	snd->fname = (char *)malloc( strlen( fname ) + 1 );
	strcpy( snd->fname, fname );
#endif
	return 0;
}


void SndPlay( int id )
{
	int type;
	SNDINF *snd;
	if ( sndflg ) return;
	if (( id < 0 )||( id >= SNDINF_MAX )) return;

	snd = &sndinf[id];
	type = snd->flag & 15;
	switch( type ) {
	case SNDFLAG_READY_WAV:
		SndStop( id );
		snd->lpSoundBuffer->SetVolume( snd->volume );
		snd->lpSoundBuffer->SetPan( snd->pan );
		if ( snd->flag & SNDFLAG_LOOP ) {
			snd->lpSoundBuffer->Play( 0, 0, DSBPLAY_LOOPING );
		} else {
			snd->lpSoundBuffer->Play( 0, 0, 0 );
		}
		break;
	case SNDFLAG_READY_OGG:
		PlayOgg( snd );
		break;
	}
}


void SndPlayPos( int id, int pos )
{
	int type;
	SNDINF *snd;
	if ( sndflg ) return;
	if (( id < 0 )||( id >= SNDINF_MAX )) return;

	snd = &sndinf[id];
	type = snd->flag & 15;
	switch( type ) {
	case SNDFLAG_READY_WAV:
		SndStop( id );
		snd->lpSoundBuffer->SetVolume( snd->volume );
		snd->lpSoundBuffer->SetPan( snd->pan );
		if ( snd->flag & SNDFLAG_LOOP ) {
			snd->lpSoundBuffer->Play( 0, 0, DSBPLAY_LOOPING );
		} else {
			snd->lpSoundBuffer->Play( 0, 0, 0 );
		}
		snd->lpSoundBuffer->SetCurrentPosition( pos );
		break;
	case SNDFLAG_READY_OGG:
		PlayOggPos( snd, pos );
		break;
	}
}


void SndStopAll( void )
{
#ifdef USE_OGGVORBIS
		StopOgg();
#endif
	for(int i=0;i<SNDINF_MAX;i++) {
		SndStop( i );
	}
}


void SndStop( int id )
{
	int type;
	SNDINF *snd;
	if ( sndflg ) return;
	if (( id < 0 )||( id >= SNDINF_MAX )) return;
	snd = &sndinf[id];
	type = snd->flag & 15;
	switch( type ) {
	case SNDFLAG_READY_WAV:
		snd->lpSoundBuffer->Stop();
		snd->lpSoundBuffer->SetCurrentPosition( 0 );
		break;
	case SNDFLAG_READY_OGG:
		StopOgg();
		break;
	}
}


int SndGetStatus( int id, int option )
{
	int type;
	SNDINF *snd;
	if ( sndflg ) return 0;
	if (( id < 0 )||( id >= SNDINF_MAX )) return 0;
	snd = &sndinf[id];
	if ( option < 16 ) {
		short *p;
		p = (short *)snd;
		return (int)p[ option ];
	}

	type = snd->flag & 15;
	switch( type ) {
	case SNDFLAG_READY_WAV:
		{
		DWORD status = 0;
		snd->lpSoundBuffer->GetStatus( &status );
		if (status & DSBSTATUS_PLAYING) {
			return 1;
		}
		break;
		}
	case SNDFLAG_READY_OGG:
		return OggStat();
	}
	return 0;
}


double SndGetTime( int id, int option )
{
	int type;
	SNDINF *snd;
	if ( sndflg ) return (0.0);
	if (( id < 0 )||( id >= SNDINF_MAX )) return (0.0);
	snd = &sndinf[id];
	type = snd->flag & 15;
	if ( type != SNDFLAG_READY_OGG ) return (0.0);

#ifdef USE_OGGVORBIS
	if ( oggflag != OGGFLAG_NONE ) {
		switch( option ) {
		case 0:
			return ODXT_GetTime( odxt );
		case 1:
			return ODXT_GetTimeTotal( odxt );
		default:
			break;
		}
	}
#endif
	return (0.0);
}


