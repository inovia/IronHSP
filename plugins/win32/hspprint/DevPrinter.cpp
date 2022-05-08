/**
 *	@file	DevPrinter.h
 */
#ifdef	WIN32

#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <assert.h>

#include "DevPrinter.h"

#define DEBUGPRINTF printf

//	�񋓂������v�����^�I�u�W�F�N�g�^�C�v��
#define	DEV_PRINTE_ENUM	PRINTER_ENUM_LOCAL|PRINTER_ENUM_CONNECTIONS

static int dev_printe_enum = DEV_PRINTE_ENUM;

/**
 *	@brief	�K��̃v�����^���擾(Windows2000�ȍ~�p)
 *	@param[in]	pName	�v�����^�����R�s�[�����
 */
bool DevGetDefaultPrinter( char *pName ) {
	DWORD dwSize = 512;
	GetDefaultPrinter( pName, &dwSize);
	return true;
}

/**
 *	@brief	�v�����^�擾�t���O�̐ݒ�
 *	@param[in]	printe_prm	PRINTER_ENUM_*�̒l
 */
void DevSetPrinterFlags(int printe_prm) {

	if ( printe_prm <= 0 ) {
		dev_printe_enum = DEV_PRINTE_ENUM;
		return;
	}
	dev_printe_enum = printe_prm;
}

/**
 *	@brief	�v�����^���擾
 *	@return	�v�����^��
 */
int DevGetNumPrinter(void)
{
	//	���[�J���v�����^���擾
	DWORD	dwSize = 0;
	DWORD	dwCount = 0;
	::EnumPrinters( dev_printe_enum , NULL, 2, NULL, 0, &dwSize, &dwCount );

	BYTE*	pPrinter = new BYTE[dwSize];
	assert( pPrinter != NULL );
	BOOL	Ret = ::EnumPrinters( dev_printe_enum , NULL, 2, pPrinter, dwSize, &dwSize, &dwCount );
	assert( Ret != 0 );

#ifdef	_DEBUG
	char	PrinterName[1024], DeviceName[1024], DriverName[1024];
	PRINTER_INFO_2*	pPI2 = (PRINTER_INFO_2*)pPrinter;
	for( DWORD i = 0; i < dwCount; i++ ){
		strcpy( PrinterName, pPI2->pPrinterName );
		strcpy( DeviceName, pPI2->pPrinterName );
		strcpy( DriverName, pPI2->pDriverName );
		DEBUGPRINTF( "PrinterNo = %d, PrinterName = '%s', DriverName = '%s'.\n", i, PrinterName, DriverName );
		pPI2++;
	}
#endif

	//	���
	delete []pPrinter;

	return dwCount;
}

bool DevGetEnumPrinterNameByNo( int No, char* pName )
{
	//	���[�J���v�����^���擾
	DWORD	dwSize = 0;
	DWORD	dwCount = 0;
	::EnumPrinters( dev_printe_enum , NULL, 2, NULL, 0, &dwSize, &dwCount );

	BYTE*	pPrinter = new BYTE[dwSize];
	assert( pPrinter != NULL );
	BOOL	Ret = ::EnumPrinters( dev_printe_enum , NULL, 2, pPrinter, dwSize, &dwSize, &dwCount );
	assert( Ret != 0 );

	bool	bRet = false;
	PRINTER_INFO_2*	pPI2 = (PRINTER_INFO_2*)pPrinter;
	for( DWORD i = 0; i < dwCount; i++ ){
		if( i == No ){
			strcpy( pName, pPI2->pPrinterName );
			bRet = true;
		}
		pPI2++;
	}

	//	���
	delete []pPrinter;

	return bRet;
}

/**
 *	@brief	�v�����^���擾
 *	@param[in]	*pName	�v�����^�����擾����o�b�t�@�A�h���X
 *	@return		�����܂ꂽ�o�C�g�T�C�Y
 */
int DevGetEnumPrinterName( char* pName )
{
	//	���[�J���v�����^���擾
	DWORD	dwSize = 0;
	DWORD	dwCount = 0;
	::EnumPrinters( dev_printe_enum , NULL, 2, NULL, 0, &dwSize, &dwCount );

	BYTE*	pPrinter = new BYTE[dwSize];
	assert( pPrinter != NULL );
	BOOL	Ret = ::EnumPrinters( dev_printe_enum , NULL, 2, pPrinter, dwSize, &dwSize, &dwCount );
	assert( Ret != 0 );

	dwSize = 0;
	PRINTER_INFO_2*	pPI2 = (PRINTER_INFO_2*)pPrinter;
	for( DWORD i = 0; i < dwCount; i++ ){
		char	TmpName[1024];
		strcpy( TmpName, pPI2->pPrinterName );
		const DWORD	dwLength = (DWORD)::strlen(TmpName);
		if( pName != NULL )	::strcpy( &pName[dwSize], TmpName );
		dwSize += dwLength;
		if( i == dwCount-1 ){
			dwSize++;	//	Null
		}else{
			if( pName != NULL )	::strcpy( &pName[dwSize], "\r\n" );
			dwSize += 2;	//	���s�R�[�h
		}
		pPI2++;
	}

	//	���
	delete []pPrinter;

	return dwSize;
}

/**
 *	@brief	�v�����^�h���C�o���擾
 *	@param[in]	*pName	�v�����^�h���C�o�����擾����o�b�t�@�A�h���X
 *	@return		�����܂ꂽ�o�C�g�T�C�Y
 */
int DevGetEnumPrinterDriverName( char* pName )
{
	//	���[�J���v�����^���擾
	DWORD	dwSize = 0;
	DWORD	dwCount = 0;
	::EnumPrinters( dev_printe_enum , NULL, 2, NULL, 0, &dwSize, &dwCount );

	BYTE*	pPrinter = new BYTE[dwSize];
	assert( pPrinter != NULL );
	BOOL	Ret = ::EnumPrinters( dev_printe_enum , NULL, 2, pPrinter, dwSize, &dwSize, &dwCount );
	assert( Ret != 0 );

	dwSize = 0;
	PRINTER_INFO_2*	pPI2 = (PRINTER_INFO_2*)pPrinter;
	for( DWORD i = 0; i < dwCount; i++ ){
		char	TmpName[1024];
		strcpy( TmpName, pPI2->pDriverName );
		const DWORD	dwLength = (DWORD)::strlen(TmpName);
		if( pName != NULL )	::strcpy( &pName[dwSize], TmpName );
		dwSize += dwLength;
		if( i == dwCount-1 ){
			dwSize++;	//	Null
		}else{
			if( pName != NULL )	::strcpy( &pName[dwSize], "\r\n" );
			dwSize += 2;	//	���s�R�[�h
		}
		pPI2++;
	}

	//	���
	delete []pPrinter;

	return dwSize;
}

/**
 *	@brief	�v�����^�f�o�C�X�R���e�L�X�g���擾
 *	@param[out]	pPrinterDoc
 *	@param[in]	PrinterNo		�v�����^�ԍ�
 *	@retval	true	����
 *	@retval	false	���s
 */
bool DevGetPrinterInfo( DEVPRINTERDOC* pPrinterDoc, const int PrinterNo )
{
	assert( pPrinterDoc != NULL );

	char	PrinterName[1024], DeviceName[1024], DriverName[1024];
	{
		DWORD	dwSize = 0;
		DWORD	dwCount = 0;
		::EnumPrinters( dev_printe_enum , NULL, 2, NULL, 0, &dwSize, &dwCount );

		BYTE*	pPrinter = new BYTE[dwSize];
		assert( pPrinter != NULL );
		BOOL	Ret = ::EnumPrinters( dev_printe_enum , NULL, 2, pPrinter, dwSize, &dwSize, &dwCount );
		assert( Ret != 0 );

		bool	bFind = false;
		PRINTER_INFO_2*	pPI2 = (PRINTER_INFO_2*)pPrinter;
		for( DWORD i = 0; i < dwCount; i++ ){
			if( i == PrinterNo ){
				strcpy( PrinterName, pPI2->pPrinterName );
				strcpy( DeviceName, pPI2->pPrinterName );
				strcpy( DriverName, pPI2->pDriverName );
				bFind = true;
				break;
			}
			pPI2++;
		}

		delete []pPrinter;
		if( bFind == false )	return false;
	}

	//	�v�����^�I�[�v��
	HANDLE	hPrinter = NULL;
	BOOL	Ret = ::OpenPrinter( PrinterName, &hPrinter, NULL );
	assert( Ret != 0 );

	LONG	DevModeSize = ::DocumentProperties( NULL, hPrinter, NULL, NULL, NULL, 0 );
	BYTE*	pDevMode = new BYTE[DevModeSize];
	assert( pDevMode != NULL );
	LONG	lRet = ::DocumentProperties( NULL, hPrinter, NULL, (DEVMODE*)pDevMode, NULL, DM_OUT_BUFFER );
	assert( lRet == IDOK );

	//	�v�����^�N���[�Y
	BOOL	bRet = ::ClosePrinter( hPrinter );
	assert( bRet != 0 );

	//	�f�o�C�X�R���e�L�X�g�쐬
	HDC	hDC = ::CreateDC( DriverName, DeviceName, NULL, (DEVMODE*)pDevMode );
	assert( hDC != NULL );

	ZeroMemory( pPrinterDoc, sizeof(DEVPRINTERDOC) );
	pPrinterDoc->pDevMode = NULL;
	pPrinterDoc->hDC = NULL;
	pPrinterDoc->HorzRes = ::GetDeviceCaps( hDC, HORZRES );
	pPrinterDoc->VertRes = ::GetDeviceCaps( hDC, VERTRES );
	pPrinterDoc->HorzSize = ::GetDeviceCaps( hDC, HORZSIZE );
	pPrinterDoc->VertSize = ::GetDeviceCaps( hDC, VERTSIZE );
	pPrinterDoc->PhysicalWidth = ::GetDeviceCaps( hDC, PHYSICALWIDTH );
	pPrinterDoc->PhysicalHeight = ::GetDeviceCaps( hDC, PHYSICALHEIGHT );
	pPrinterDoc->PhysicalOffsetX = ::GetDeviceCaps( hDC, PHYSICALOFFSETX );
	pPrinterDoc->PhysicalOffsetY = ::GetDeviceCaps( hDC, PHYSICALOFFSETY );

	//	���
	::DeleteDC( hDC );
	delete	[]pDevMode;

	return true;
}

/**
 *	@brief	����W���u�J�n
 *	@param[out]	pPrinterDoc
 *	@param[in]	PrinterNo		�v�����^�ԍ�
 *	@param[in]	pDocName		����W���u�h�L�������g��
 */
bool DevStartDocPrinter( DEVPRINTERDOC* pPrinterDoc, const int PrinterNo, const char* pDocName )
{
	assert( pPrinterDoc != NULL );

	char	PrinterName[1024], DeviceName[1024], DriverName[1024];
	{
		DWORD	dwSize = 0;
		DWORD	dwCount = 0;
		::EnumPrinters( dev_printe_enum , NULL, 2, NULL, 0, &dwSize, &dwCount );

		BYTE*	pPrinter = new BYTE[dwSize];
		assert( pPrinter != NULL );
		BOOL	Ret = ::EnumPrinters( dev_printe_enum , NULL, 2, pPrinter, dwSize, &dwSize, &dwCount );
		assert( Ret != 0 );

		bool	bFind = false;
		PRINTER_INFO_2*	pPI2 = (PRINTER_INFO_2*)pPrinter;
		for( DWORD i = 0; i < dwCount; i++ ){
			if( i == PrinterNo ){
				strcpy( PrinterName, pPI2->pPrinterName );
				strcpy( DeviceName, pPI2->pPrinterName );
				strcpy( DriverName, pPI2->pDriverName );
				bFind = true;
				break;
			}
			pPI2++;
		}

		delete []pPrinter;
		if( bFind == false )	return false;
	}

	//	�v�����^�I�[�v��
	HANDLE	hPrinter = NULL;
	BOOL	Ret = ::OpenPrinter( PrinterName, &hPrinter, NULL );
	assert( Ret != 0 );

	LONG	DevModeSize = ::DocumentProperties( NULL, hPrinter, NULL, NULL, NULL, 0 );
	BYTE*	pDevMode = new BYTE[DevModeSize];
	assert( pDevMode != NULL );
	LONG	lRet = ::DocumentProperties( NULL, hPrinter, NULL, (DEVMODE*)pDevMode, NULL, DM_OUT_BUFFER );
	assert( lRet == IDOK );

	//	�v�����^�N���[�Y
	BOOL	bRet = ::ClosePrinter( hPrinter );
	assert( bRet != 0 );

	//	�f�o�C�X�R���e�L�X�g�쐬
	HDC	hDC = ::CreateDC( DriverName, DeviceName, NULL, (DEVMODE*)pDevMode );
	assert( hDC != NULL );
	/*
	 *	PHYSICALWIDTH  = HORZRES + (PHYSICALOFFSETX * 2)
	 *	PHYSICALHEIGHT = VERTRES + (PHYSICALOFFSETY * 2)
	 */
	int HorzSize			= ::GetDeviceCaps( hDC, HORZSIZE );
	int VertSize			= ::GetDeviceCaps( hDC, VERTSIZE );
	int	HorzRes				= ::GetDeviceCaps( hDC, HORZRES );
	int	VertRes				= ::GetDeviceCaps( hDC, VERTRES );
	int	LogPixelsX			= ::GetDeviceCaps( hDC, LOGPIXELSX );
	int	LogPixelsY			= ::GetDeviceCaps( hDC, LOGPIXELSY );
	int PhysicalWidth		= ::GetDeviceCaps( hDC, PHYSICALWIDTH );
	int	PhysicalHeight 		= ::GetDeviceCaps( hDC, PHYSICALHEIGHT );
	int	PhysicalOffsetX 	= ::GetDeviceCaps( hDC, PHYSICALOFFSETX );
	int	PhysicalOffsetY		= ::GetDeviceCaps( hDC, PHYSICALOFFSETY );
#ifdef	_DEBUG
	DEBUGPRINTF( "Size( %d, %d )\n", HorzSize, VertSize );						//	�~�����[�g���imm�j�P�ʂ̉�ʂ̃T�C�Y
	DEBUGPRINTF( "Res( %d, %d )\n", HorzRes, VertRes );							//	�s�N�Z���P�ʂ̉�ʂ̃T�C�Y
	DEBUGPRINTF( "LogPixels( %d, %d )\n", LogPixelsX, LogPixelsY );				//	�_���C���`������̃s�N�Z����(DPI)
	DEBUGPRINTF( "PhysicalSize( %d, %d )\n", PhysicalWidth, PhysicalHeight );	//	
	DEBUGPRINTF( "PhysicalOffset( %d, %d )\n", PhysicalOffsetX, PhysicalOffsetY );
#endif

	ZeroMemory( pPrinterDoc, sizeof(DEVPRINTERDOC) );
	pPrinterDoc->pDevMode = pDevMode;
	pPrinterDoc->hDC = hDC;
	pPrinterDoc->HorzRes = HorzRes;
	pPrinterDoc->VertRes = VertRes;
	pPrinterDoc->PhysicalWidth = PhysicalWidth;
	pPrinterDoc->PhysicalHeight = PhysicalHeight;
	pPrinterDoc->PhysicalOffsetX = PhysicalOffsetX;
	pPrinterDoc->PhysicalOffsetY = PhysicalOffsetY;

	//	�h�L�������g�J�n
	DOCINFO	DocInfo;
	ZeroMemory( &DocInfo, sizeof(DOCINFO) );
	DocInfo.cbSize = sizeof(DOCINFO);
	DocInfo.lpszDocName = pDocName;
	int	iRet = StartDoc( hDC, &DocInfo );
	if( iRet == 0 ){
		DevAbortDocPrinter( pPrinterDoc );
		return false;
	}

	return true;
}

/**
 *	@brief	����y�[�W�J�n
 */
bool DevStartPagePrinter( DEVPRINTERDOC* pPrinterDoc )
{
	assert( pPrinterDoc != NULL );

	//	�v�����^�f�o�C�X�R���e�L�X�g���Z�b�g
	ResetDC( pPrinterDoc->hDC, (DEVMODE*)pPrinterDoc->pDevMode );

	//	����y�[�W�J�n
	int	iRet = StartPage(pPrinterDoc->hDC);
	if( iRet == 0 ){
		DevAbortDocPrinter( pPrinterDoc );
		return false;
	}

	return true;
}

/**
 *	@brief	����y�[�W�I��
 */
bool DevEndPagePrinter( DEVPRINTERDOC* pPrinterDoc )
{
	assert( pPrinterDoc != NULL );

	int	iRet = ::EndPage( pPrinterDoc->hDC );
	if( iRet == 0 ){
		DevAbortDocPrinter( pPrinterDoc );
		return false;
	}

	return true;
}

/**
 *	@brief	����W���u�I��
 */
bool DevEndDocPrinter( DEVPRINTERDOC* pPrinterDoc )
{
	assert( pPrinterDoc != NULL );

	int	iRet = ::EndDoc( pPrinterDoc->hDC );
	if( iRet == 0 ){
		DevAbortDocPrinter( pPrinterDoc );
		return false;
	}

	::DeleteDC( pPrinterDoc->hDC );
	delete	[]pPrinterDoc->pDevMode;
	pPrinterDoc->hDC = NULL;
	pPrinterDoc->pDevMode = NULL;

	return true;
}

/**
 *	@brief	���݂̈���W���u���~
 */
void DevAbortDocPrinter( DEVPRINTERDOC* pPrinterDoc )
{
	assert( pPrinterDoc != NULL );

	if( pPrinterDoc->hDC != NULL ){
		::DeleteDC( pPrinterDoc->hDC );
		pPrinterDoc->hDC = NULL;
	}
	if( pPrinterDoc->pDevMode != NULL ){
		delete	[]pPrinterDoc->pDevMode;
		pPrinterDoc->pDevMode = NULL;
	}
}

/**
 *	@brief	�r�b�g�}�b�v�]��
 */
bool DevPrintBitmapPrinter( const int PrinterNo, const char* pDocName, int DstX, int DstY, int DstW, int DstH, const BITMAPINFO* pBitmapInfo, const void* pBits, int SrcX, int SrcY, int SrcW, int SrcH )
{
	DEVPRINTERDOC	PrinterDoc;
	DevStartDocPrinter( &PrinterDoc, PrinterNo, pDocName );
	DevStartPagePrinter( &PrinterDoc );

	//	�r�b�g�}�b�v�]��
	int	iRet = ::StretchDIBits( PrinterDoc.hDC, DstX, DstY, DstW, DstH, SrcX, SrcY, SrcW, SrcH, pBits, pBitmapInfo, DIB_RGB_COLORS, SRCCOPY );

	DevEndPagePrinter( &PrinterDoc );
	DevEndDocPrinter( &PrinterDoc );

	return true;
}


/**
 *	@brief	�v�����^�f�o�C�X�R���e�L�X�g���擾
 *	@param[out]	pPrinterDoc
 *	@param[in]	PrinterNo		�v�����^�ԍ�
 *	@retval	true	����
 *	@retval	false	���s
 */
bool DevGetPrinterProperty( DEVPRINTERDOC* pPrinterDoc, const int PrinterNo )
{
	assert( pPrinterDoc != NULL );

	char	PrinterName[1024], DeviceName[1024], DriverName[1024];
	{
		DWORD	dwSize = 0;
		DWORD	dwCount = 0;
		::EnumPrinters( dev_printe_enum , NULL, 2, NULL, 0, &dwSize, &dwCount );

		BYTE*	pPrinter = new BYTE[dwSize];
		assert( pPrinter != NULL );
		BOOL	Ret = ::EnumPrinters( dev_printe_enum , NULL, 2, pPrinter, dwSize, &dwSize, &dwCount );
		assert( Ret != 0 );

		bool	bFind = false;
		PRINTER_INFO_2*	pPI2 = (PRINTER_INFO_2*)pPrinter;
		for( DWORD i = 0; i < dwCount; i++ ){
			if( i == PrinterNo ){
				strcpy( PrinterName, pPI2->pPrinterName );
				strcpy( DeviceName, pPI2->pPrinterName );
				strcpy( DriverName, pPI2->pDriverName );
				bFind = true;
				break;
			}
			pPI2++;
		}

		delete []pPrinter;
		if( bFind == false )	return false;
	}

	//	�v�����^�I�[�v��
	HANDLE	hPrinter = NULL;
	BOOL	Ret = ::OpenPrinter( PrinterName, &hPrinter, NULL );
	assert( Ret != 0 );

	::PrinterProperties( NULL, hPrinter);

	//	�v�����^�N���[�Y
	BOOL	bRet = ::ClosePrinter( hPrinter );
	assert( bRet != 0 );

	return true;
}




#endif	//	WIN32
