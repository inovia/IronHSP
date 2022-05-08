/**
 *	@brief
 *	@file	DevPrinter.h
 *	@date
 *	@author	
 */
#ifndef	_DEVPRINTER_H_
#define	_DEVPRINTER_H_
#ifdef	WIN32

/**
 *	@brief	�v�����^�h�L�������g�\����
 */
typedef struct _DEVPRINTERDOC{
	void*	pDevMode;
	HDC		hDC;
	int		HorzRes;			//	�s�N�Z���P�ʂ̉�ʂ̕�
	int		VertRes;			//	�s�N�Z���P�ʂ̍���
	int		HorzSize;			//	mm�P�ʂ̕�
	int		VertSize;			//	mm�P�ʂ̍���
	int		PhysicalWidth;		//	����f�o�C�X�p�ł��B�y�[�W�̕����I�ȕ�
	int		PhysicalHeight;		//	����f�o�C�X�p�ł��B�y�[�W�̕����I�ȍ���
	int		PhysicalOffsetX;	//	����f�o�C�X�p�ł��B�����I�ȃy�[�W�̍��[�������\�̈�̍��[�܂ł̋������f�o�C�X�P��
	int		PhysicalOffsetY;	//	����f�o�C�X�p�ł��B�����I�ȃy�[�W�̏�[�������\�̈�̏�[�܂ł̋������f�o�C�X�P��
}DEVPRINTERDOC, *LPDEVPRINTERDOC;

extern int DevGetNumPrinter(void);
extern bool DevGetEnumPrinterNameByNo( int No, char* pName );
extern int DevGetEnumPrinterName( char* pName );
extern int DevGetEnumPrinterDriverName( char* pName );
extern bool DevGetPrinterInfo( DEVPRINTERDOC* pPrinterDoc, const int PrinterNo );
extern bool DevStartDocPrinter( DEVPRINTERDOC* pPrinterDoc, const int PrinterNo, const char* pDocName );
extern bool DevStartPagePrinter( DEVPRINTERDOC* pPrinterDoc );	
extern bool DevEndPagePrinter( DEVPRINTERDOC* pPrinterDoc );
extern bool DevEndDocPrinter( DEVPRINTERDOC* pPrinterDoc );
extern void DevAbortDocPrinter( DEVPRINTERDOC* pPrinterDoc );
extern bool DevPrintBitmapPrinter( const int PrinterNo, const char* pDocName, int DstX, int DstY, int DstW, int DstH, const BITMAPINFO* pBitmapInfo, const void* pBits, int SrcX, int SrcY, int SrcW, int SrcH );
extern void DevSetPrinterFlags(int printe_prm);
extern bool DevGetDefaultPrinter( char *pName );
extern bool DevGetPrinterProperty( DEVPRINTERDOC* pPrinterDoc, const int PrinterNo );


#endif	//	WIN32
#endif
