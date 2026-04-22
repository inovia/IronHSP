// -------------------------------------------------------------------------------
// 
// 		�c�w���C�u����		�W���b���C�u�����g�p�R�[�h
// 
// 				Ver 3.24f
// 
// -------------------------------------------------------------------------------

// �c�w���C�u�����쐬���p��`
#define DX_MAKE

// �C���N���[�h ------------------------------------------------------------------
#include "DxCompileConfig.h"

#ifndef DX_NON_NAMESPACE
#ifdef DX_NON_USING_NAMESPACE_DXLIB

using namespace DxLib ;

#endif // DX_NON_USING_NAMESPACE_DXLIB
#endif // DX_NON_NAMESPACE

#include "DxUseCLib.h"
#include "DxLib.h"
#include "DxStatic.h"
#include "DxFile.h"
#include "DxChar.h"
#include "DxBaseFunc.h"
#include "DxSystem.h"
#include "DxMemory.h"
#include "DxLog.h"

#ifndef DX_NON_MOVIE
#ifndef DX_NON_DSHOW_MP3
#ifndef DX_NON_DSHOW_MOVIE
#include "Windows/DxWinAPI.h"
#include "Windows/DxGuid.h"
#endif // DX_NON_MOVIE
#endif // DX_NON_DSHOW_MP3
#endif // DX_NON_DSHOW_MOVIE

#include <setjmp.h>
#include <stdarg.h>
#include <stdio.h>

#ifdef __ANDROID__
#include <wchar.h>
#endif

#ifndef DX_NON_BULLET_PHYSICS
	#include "btBulletDynamicsCommon.h"
#endif

#ifndef DX_NON_TIFFREAD
#include "tiff.h"
#include "tiffio.h"
#endif

#ifndef DX_NON_PNGREAD
	#include "png.h"
//  #include "pngpriv.h"
	#include "zlib.h"
#elif !defined(DX_NON_MODEL)
	// DX_NON_PNGREAD=1 でも MQOZ_ZIP_uncompress が zlib を必要とする場合 (Tier 4d fix)
	#include "zlib.h"
#endif

#ifndef DX_NON_JPEGREAD
	#ifdef DX_GCC_COMPILE
	typedef unsigned char boolean;
	#endif	
	#ifdef BC_COMPILER
	typedef unsigned char boolean;
	#endif	
	extern "C"
	{
	#include "jpeglib.h"
	}
#endif

//namespace DxLib
//{

// �\���̌^�錾 ------------------------------------------------------------------

// �֐��v���g�^�C�v�錾 ----------------------------------------------------------

// extern int LoadPngImage( STREAMDATA *Src, BASEIMAGE *BaseImage ) ;
// extern int LoadJpegImage( STREAMDATA *Src, BASEIMAGE *BaseImage ) ;
// extern int NS_SaveBaseImageToPng( const char *pFilePath, BASEIMAGE *BaseImage, int CompressionLevel ) ;
// extern int NS_SaveBaseImageToJpeg( const char *pFilePath, BASEIMAGE *BaseImage, int Quality ) ;
// extern int NS_SRand( int Seed ) ;
// extern int NS_GetRand( int RandMax ) ;

// �v���O���� --------------------------------------------------------------------








// �ėp�f�[�^�ǂݍ��ݏ�������̂s�h�e�e�摜�ǂݍ��݂̂��߂̃v���O����

#ifndef DX_NON_TIFFREAD

// �ėp�f�[�^�ǂݍ��ݏ�������̓ǂݍ��݂����邽�߂̃f�[�^�^
typedef struct tagTIFFHANDLE
{
	STREAMDATA *Data ;
	LONGLONG DataSize ;
} TIFFHANDLE ;

// �ėp�f�[�^�ǂݎ�菈������f�[�^��ǂݍ��ރR�[���o�b�N�֐�
tmsize_t TIFFReadProc( thandle_t fd, void *buf, tmsize_t size )
{
	TIFFHANDLE *THnd ;
	tmsize_t Result ;

	THnd = ( TIFFHANDLE * )fd ;

	// �T�C�Y�̒���
	if( ( tmsize_t )( THnd->DataSize - STTELL( THnd->Data ) ) < size )
	{
		size = ( tmsize_t )( THnd->DataSize - STTELL( THnd->Data ) ) ;
	}
	if( size == 0 )
	{
		return 0 ;
	}

	Result = ( tmsize_t )STREAD( buf, 1, ( size_t )size, THnd->Data ) ;

	return Result ;
}

// �ėp�f�[�^�ǂݎ�菈������̏������݂ɂ͔�Ή�
tmsize_t TIFFWriteProc( thandle_t /* fd */, void * /* buf */, tmsize_t size )
{
	return size ;
}

// �ėp�f�[�^�ǂݎ�菈���̃V�[�N���s���R�[���o�b�N�֐�
toff_t   TIFFSeekProc_     ( thandle_t fd, toff_t offset, int whence )
{
	TIFFHANDLE *THnd ;

	THnd = ( TIFFHANDLE * )fd ;

	switch( whence )
	{
	case SEEK_CUR :
		STSEEK( THnd->Data, ( LONGLONG )offset, SEEK_CUR ) ;
		break ;

	case SEEK_END:
		STSEEK( THnd->Data, ( LONGLONG )offset, SEEK_END ) ;
		break ;

	case SEEK_SET:
	default:
		STSEEK( THnd->Data, ( LONGLONG )offset, SEEK_SET ) ;
		break ;
	}

	return ( toff_t )STTELL( THnd->Data ) ;
}

// �ėp�f�[�^�ǂݍ��ݏ����̃t�@�C�������R�[���o�b�N�֐�
int      TIFFCloseProc_    ( thandle_t /*fd*/ )
{
	// �t�@�C������鏈���͂s�h�e�e�ǂݍ��݊O�ōs���̂ŉ������Ȃ�
	return 0 ;
}


// �ėp�f�[�^�ǂݍ��ݏ����̃f�[�^�T�C�Y���擾����R�[���o�b�N�֐�
toff_t   TIFFSizeProc_     ( thandle_t fd )
{
	TIFFHANDLE *THnd ;

	THnd = ( TIFFHANDLE * )fd ;

	return ( toff_t )THnd->DataSize ;
}

int      TIFFMapFileProc_  ( thandle_t /*fd*/, void ** /*base*/, toff_t* /*size*/)
{
	return 0 ;
}

void     TIFFUnmapFileProc_( thandle_t /*fd*/, void* /*base*/, toff_t /*size*/)
{
	return ;
}


// �s�h�e�e�摜�̓ǂ݂���
extern int LoadTiffImage( STREAMDATA *Src, BASEIMAGE *BaseImage, int GetFormatOnly )
{
	TIFFHANDLE    THnd ;
	LONGLONG      FilePoint ;
	TIFF         *Conv ;
    uint16        bits_per_sample ;
    uint16        samples_per_pixel ;
    uint16        photometric ;
    uint32        width      = 0 ;
    uint32        height     = 0 ;
    uint32        rows_strip = 0 ;
    uint32       *strip      = NULL ;
    uint32       *src ;
	BYTE          *dest ;
	int           x ;
	int           y ;
	int           dest_y ;
	int           line_no ;
	int           valid_line ;
	uint32        pixel;
	unsigned char checkhead[ 2 ] ;

	// �ėp�f�[�^�ǂݎ�菈������f�[�^��ǂݍ��ނ��߂̏���
	THnd.Data = Src ;
	FilePoint = STTELL( Src ) ;
	STSEEK( Src, 0, SEEK_END ) ;
	THnd.DataSize = ( LONGLONG )STTELL( Src ) ;
	STSEEK( Src, FilePoint, SEEK_SET ) ;

	// �t�@�C���t�H�[�}�b�g�̊ȈՃ`�F�b�N
	STREAD( checkhead, 2, 1, Src ) ;
	if( ( checkhead[ 0 ] != 0x49 || checkhead[ 1 ] != 0x49 ) &&
		( checkhead[ 0 ] != 0x4d || checkhead[ 1 ] != 0x4d ) )
	{
		return -1 ;
	}
	STSEEK( Src, -2, SEEK_CUR ) ;

	// TIFF�t�@�C���̃I�[�v��
	Conv = TIFFClientOpen(
		"Read",
		"r",
		&THnd,
		TIFFReadProc,
		TIFFWriteProc,
		TIFFSeekProc_,
		TIFFCloseProc_,
		TIFFSizeProc_,
		TIFFMapFileProc_,
		TIFFUnmapFileProc_
	) ;

	// �I�[�v���Ɏ��s�����炱���ŏI��
	if( Conv == NULL )
	{
		return -1 ;
	}

	// �摜�̏����擾
	TIFFGetField( Conv, TIFFTAG_IMAGELENGTH,     &height ) ;
	TIFFGetField( Conv, TIFFTAG_IMAGEWIDTH,      &width ) ;
	TIFFGetField( Conv, TIFFTAG_ROWSPERSTRIP,    &rows_strip ) ;
	TIFFGetField( Conv, TIFFTAG_BITSPERSAMPLE,   &bits_per_sample ) ;
	TIFFGetField( Conv, TIFFTAG_SAMPLESPERPIXEL, &samples_per_pixel ) ;
	TIFFGetField( Conv, TIFFTAG_PHOTOMETRIC,     &photometric ) ;

	if( GetFormatOnly == FALSE )
	{
		// �P�X�g���b�v���̉摜�f�[�^���i�[���郁�����̈�̊m��
		strip = ( uint32 * )DXALLOC( sizeof( uint32 ) * ( width * rows_strip ) ) ;

		// BASEIMAGE ���̉摜�f�[�^���i�[���郁�����̈�̊m��
		BaseImage->GraphData = DXALLOC( width * height * 4 ) ;
		if( BaseImage->GraphData == NULL )
		{
			goto ERR ;
		}
	}
	else
	{
		BaseImage->GraphData = NULL ;
	}

	// �摜�̕��ƍ�����ۑ�
	BaseImage->Width  = ( int )width ;
	BaseImage->Height = ( int )height ;

	// �s�b�`�̕ۑ�
	BaseImage->Pitch  = ( int )width * 4 ;

	// ���󂷂ׂĂ� RGBA8 �t�H�[�}�b�g�Ƃ��ēǂݍ���
	NS_CreateARGB8ColorData( &BaseImage->ColorData ) ;

	if( GetFormatOnly == FALSE )
	{
		// �摜�̓ǂݍ���
		for( line_no = 0; line_no < ( int )height; line_no += rows_strip )
		{
			// �P�X�g���b�v�̏���ǂݍ���
			if( !TIFFReadRGBAStrip( Conv, ( uint32 )line_no, strip ) )
			{
				goto ERR ;
			}

			// �L���ȃ��C�����擾
			valid_line = ( int )rows_strip ;
			if( line_no + rows_strip > height )
			{
				valid_line = ( int )( height - line_no ) ;
			}

			// �摜���� BASEIMAGE ���̉摜�i�[�̈�ɓ]��
			for( y = 0; y < valid_line ; y++ )
			{
				// �o�͐�̉摜�ł̂x���W���Z�o
				dest_y = line_no + ( ( valid_line - y ) - 1 ) ;

				// �]�����A�h���X�̎Z�o
				src    = strip + ( width * y ) ;

				// �]����A�h���X�̎Z�o
				dest   = ( BYTE * )BaseImage->GraphData + 4 * width * dest_y ;

				// �P���C�����̃s�N�Z������ BASEIMAGE ���ɓ]��
				for( x = 0; x < ( int )width; x++, dest += 4 )
				{
					pixel = src[ x ] ;
					dest[ 0 ] = ( BYTE )TIFFGetB( pixel ) ;
					dest[ 1 ] = ( BYTE )TIFFGetG( pixel ) ;
					dest[ 2 ] = ( BYTE )TIFFGetR( pixel ) ;
					dest[ 3 ] = ( BYTE )TIFFGetA( pixel ) ;
				}
			}
		}
	}

	// TIFF�t�@�C���̃N���[�Y
	TIFFClose( Conv ) ;

	// �P�X�g���b�v���̉摜�f�[�^���i�[���郁�����̈�̉��
	DXFREE( strip );

	// �I��
	return 0 ;

ERR :
	if( BaseImage->GraphData )
	{
		DXFREE( BaseImage->GraphData ) ;
		BaseImage->GraphData = NULL ;
	}

	if( strip )
	{
		DXFREE( strip ) ;
		strip = NULL ;
	}

	TIFFClose( Conv ) ;
	Conv = NULL ;

	// �G���[�I��
	return -1 ;
}

#endif // DX_NON_TIFFREAD










// �ėp�f�[�^�ǂݍ��ݏ�������̂o�m�f�摜�ǂݍ��݂̂��߂̃v���O����

#ifndef DX_NON_PNGREAD

// �ėp�f�[�^�ǂݍ��ݏ�������̓ǂݍ��݂����邽�߂̃f�[�^�^
typedef struct tagPNGGENERAL
{
	STREAMDATA *Data ;
	unsigned int DataSize ;
} PNGGENERAL ;

// �ėp�f�[�^�ǂݍ��ݏ�������f�[�^��ǂݍ��ރR�[���o�b�N�֐�
static void png_general_read_data(png_structp png_ptr, png_bytep data, png_size_t length)
{
	PNGGENERAL *PGen ;

//	PGen = (PNGGENERAL *)/*CVT_PTR*/(png_ptr->io_ptr) ;
	PGen = (PNGGENERAL *)png_get_io_ptr(png_ptr) ;

	// �c��̃T�C�Y������Ȃ�������G���[
	if( PGen->DataSize - ( int )STTELL( PGen->Data ) < length )
	{
		png_error(png_ptr, "Read Error");
	}
	else
	{
		STREAD( data, length, 1, PGen->Data ) ;
	}
}

// �ėp�f�[�^�ǂݍ��ݏ�������̓ǂݍ��݂�ݒ肷��֐�
int png_general_read_set( png_structp png_ptr, PNGGENERAL *PGen, STREAMDATA *Data )
{
	PGen->Data = Data ;

	// ���݂̃t�@�C���|�C���^����I�[�܂ł̃T�C�Y���擾����
	{
		long pos ;
		pos = ( long )STTELL( PGen->Data ) ;
		STSEEK( PGen->Data, 0, STREAM_SEEKTYPE_END ) ;
		PGen->DataSize = ( unsigned int )STTELL( PGen->Data ) - pos ;
		STSEEK( PGen->Data, pos, STREAM_SEEKTYPE_SET ) ;
	}

	// �R�[���o�b�N�֐��̃Z�b�g
	png_set_read_fn( png_ptr, PGen, png_general_read_data ) ;

	// �I��
	return 0 ;
}

// �o�m�f�摜�̓ǂ݂���
extern int LoadPngImage( STREAMDATA *Src, BASEIMAGE *BaseImage, int GetFormatOnly )
{
	png_bytep *row_pointers;
	size_t row, rowbytes ;
	BYTE *GData ;
	PNGGENERAL PGen ;
	png_structp png_ptr;
	png_infop info_ptr;
	unsigned int sig_read = 0;
	png_uint_32 width, height;
	int bit_depth, color_type, interlace_type;
	void *ImageData = NULL ;
//	int i ;
	png_bytep BufPoint ;
	BYTE Check[ 8 ] ;

	// �ŏ��̂W�o�C�g��PNG�t�@�C�����ǂ������`�F�b�N
	STREAD( Check, 8, 1, Src ) ;
	STSEEK( Src, 0, STREAM_SEEKTYPE_SET ) ;
	if( Check[ 0 ] != 0x89 || Check[ 1 ] != 0x50 || Check[ 2 ] != 0x4E || Check[ 3 ] != 0x47 ||
		Check[ 4 ] != 0x0D || Check[ 5 ] != 0x0A || Check[ 6 ] != 0x1A || Check[ 7 ] != 0x0A )
	{
		return -1 ;
	}

	// �o�m�f�Ǘ����̍쐬
	png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL ) ;
	if( png_ptr == NULL ) return -1 ;

	// �摜���\���̂̍쐬
	if( ( info_ptr = png_create_info_struct( png_ptr ) ) == NULL ) 
	{
		png_destroy_read_struct(&png_ptr, (png_infopp)NULL, (png_infopp)NULL);
		return -1 ;
	}

	// �G���[���̏����Z�b�g�A�b�v����я���
	if( setjmp( png_jmpbuf( png_ptr ) ) )
	{
		png_destroy_read_struct( &png_ptr, &info_ptr, (png_infopp)NULL );
		return -1 ;
	}

	// �ėp�f�[�^�ǂݍ��ݏ�������ǂݍ��ޏꍇ�̐ݒ���s��
	png_general_read_set( png_ptr, &PGen, Src ) ;

	// �ݒ菈���S
	png_set_sig_bytes(		png_ptr, ( int )sig_read ) ;										// �悭�킩�疳������(��)
	png_read_info(			png_ptr, info_ptr );												// �摜���𓾂�
	png_get_IHDR(			png_ptr, info_ptr, &width, &height, &bit_depth, &color_type,		// �摜�̊�{�X�e�[�^�X���擾����
							&interlace_type, NULL, NULL ) ;
	png_set_strip_16(		png_ptr ) ;															// �P�U�r�b�g�̉摜�ł��W�r�b�g�Ŏ��[����悤�ɐݒ�
//	if( BmpFlag == TRUE )										png_set_strip_alpha( png_ptr ) ;// �A���t�@�`�����l������
	png_set_packing(		png_ptr ) ;															// �P�o�C�g�ȉ��̃p���b�g�摜���o�C�g�P�ʂœW�J����悤�w��
	png_set_packswap(		png_ptr ) ;															// �悭�킩�疳������

//	if( color_type == PNG_COLOR_TYPE_PALETTE )					png_set_expand( png_ptr ) ;		// �p���b�g�g�p�摜�f�[�^�̎����W�J�w��

	png_set_bgr(			png_ptr ) ;															// �J���[�z����q�f�a����a�f�q�ɔ��]

	// �ύX�����ݒ�𔽉f������
	png_read_update_info(	png_ptr, info_ptr ) ;

	// �P���C��������ɕK�v�ȃf�[�^�ʂ𓾂�
	rowbytes = png_get_rowbytes( png_ptr, info_ptr ) ;

	if( GetFormatOnly == FALSE )
	{
		// �O���t�B�b�N�f�[�^���i�[���郁�����̈���쐬����
		{
			png_bytep BufP ;

			row_pointers = ( png_bytep * )DXALLOC( height * sizeof( png_bytep * ) ) ;
			if( row_pointers == NULL )
			{
				png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp)NULL);
				return -1 ;
			}

			BufPoint = ( png_bytep )png_malloc( png_ptr, rowbytes * height ) ;
			if( BufPoint == NULL )
			{
				DXFREE( row_pointers ) ;
				png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp)NULL);
				return -1 ;
			}

			BufP = BufPoint ;
			for( row = 0; row < height; row++, BufP += rowbytes )
			{
				row_pointers[ row ] = BufP ;
			}
		}

		// �摜�f�[�^�̓ǂݍ���
		png_read_image( png_ptr, row_pointers ) ;

		// ���ۂɎg���O���t�B�b�N�f�[�^�̈�̍쐬�E�]��
		ImageData = DXALLOC( rowbytes * height ) ;
		if( ImageData == NULL )
		{
			png_free( png_ptr, BufPoint ) ;
			DXFREE( row_pointers ) ;
			png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp)NULL);
			return -1 ;
		}
		GData = ( BYTE * )ImageData ;
		for (row = 0; row < height; row++, GData += rowbytes )
			_MEMCPY( GData, row_pointers[row], rowbytes ) ;

		// �������̉��
		png_free( png_ptr, BufPoint ) ;
		DXFREE( row_pointers ) ;

		// �ǂݍ��ݏ����̏I��
		png_read_end( png_ptr, info_ptr ) ;
	}

	// BASEIMAGE �f�[�^�̏����Z�b�g����
	{
		BaseImage->Width		= ( int )width ;
		BaseImage->Height		= ( int )height ;
		BaseImage->Pitch		= ( int )rowbytes ;
		BaseImage->GraphData	= ImageData ;

		// �J���[�����Z�b�g����
		if( color_type == PNG_COLOR_TYPE_PALETTE )
		{
			png_colorp SrcPalette ;
			int PaletteNum ;
			int i ;
			COLORPALETTEDATA *Palette ;
			
			// �p���b�g�J���[�̏ꍇ
			NS_CreatePaletteColorData( &BaseImage->ColorData ) ;

			// �p���b�g���擾
			png_get_PLTE( png_ptr, info_ptr, &SrcPalette, &PaletteNum ) ;

			// �p���b�g�̐����Q�T�U�ȏゾ�����ꍇ�͂Q�T�U�ɕ␳
			if( PaletteNum > 256 ) PaletteNum = 256 ;

			// �p���b�g�̃R�s�[
			Palette = BaseImage->ColorData.Palette ;
			for( i = 0 ; i < PaletteNum ; i ++, Palette ++, SrcPalette ++ )
			{
				Palette->Blue  = SrcPalette->blue ;
				Palette->Green = SrcPalette->green ;
				Palette->Red   = SrcPalette->red ;
				Palette->Alpha = 0 ;
			}

			// �A���t�@�`�����l���p���b�g������ꍇ�̓f�[�^��ǂݍ���
			if( png_get_valid( png_ptr, info_ptr, PNG_INFO_tRNS ) )
			{
				png_bytep trans ;
				png_color_16p trans_values ;
				int num_trans ;

				png_get_tRNS( png_ptr, info_ptr, &trans, &num_trans, &trans_values ) ;

				Palette = BaseImage->ColorData.Palette ;
				for( i = 0 ; i < num_trans ; i ++ )
				{
					Palette[ i ].Alpha = trans[ i ] ;
				}
				if( num_trans < PaletteNum )
				{
					for( i = num_trans ; i < PaletteNum ; i ++ )
					{
						Palette[ i ].Alpha = 255 ;
					}
				}

				// �A���t�@�`�����l������p���b�g�ɂ���
				BaseImage->ColorData.AlphaLoc   = 24 ;
				BaseImage->ColorData.AlphaMask  = 0xff000000 ;
				BaseImage->ColorData.AlphaWidth = 8 ;
			}
		}
		else
		if( color_type == PNG_COLOR_TYPE_GRAY )
		{
			// ���ߐF��񂪂���ꍇ�̓A���t�@�`�����l�����摜�ɂ���
			if( png_get_valid( png_ptr, info_ptr, PNG_INFO_tRNS ) )
			{
				png_bytep trans ;
				png_color_16p trans_values ;
				int num_trans ;
				int i, j ;

				// ���ߐF���擾
				png_get_tRNS( png_ptr, info_ptr, &trans, &num_trans, &trans_values ) ;

				// �A���t�@�`�����l������ɂ���
				NS_CreateFullColorData( &BaseImage->ColorData ) ;
				BaseImage->ColorData.ColorBitDepth	= 32 ;
				BaseImage->ColorData.PixelByte		= 4 ;
				BaseImage->ColorData.AlphaLoc		= 24 ;
				BaseImage->ColorData.AlphaWidth		= 8 ;
				BaseImage->ColorData.AlphaMask		= 0xff000000 ;

				// �O���[�X�P�[���摜�� 32�r�b�g�A���t�@�`�����l�����摜�ɕϊ�
				BYTE *OldGraphData = ( BYTE * )BaseImage->GraphData ;
				BYTE *NewGraphData ;
				BaseImage->Pitch		= BaseImage->Width * 4 ;
				BaseImage->GraphData	= DXALLOC( BaseImage->Pitch * BaseImage->Height ) ;
				if( BaseImage->GraphData == NULL )
				{
					png_destroy_read_struct( &png_ptr, &info_ptr, ( png_infopp )NULL ) ;
					DXFREE( OldGraphData ) ;
					return -1 ;
				}
				NewGraphData = ( BYTE * )BaseImage->GraphData ;

				BYTE *SrcBase  = OldGraphData ;
				BYTE *DestBase = NewGraphData ;

				// �����O���[�X�P�[���Ȃ̂ɂP�s�N�Z���Q�o�C�g���������ʂW�r�b�g�������g�p����
				if( rowbytes / 2 >= width )
				{
					for( i = 0 ; i < BaseImage->Height; i ++, SrcBase += rowbytes, DestBase += BaseImage->Pitch )
					{
						BYTE *SrcB = SrcBase ;
						BYTE *Dest = DestBase ;
						for( j = 0 ; j < BaseImage->Width ; j ++, SrcB += 2, Dest += 4 )
						{
							Dest[ 0 ] = SrcB[ 1 ] ;
							Dest[ 1 ] = SrcB[ 1 ] ;
							Dest[ 2 ] = SrcB[ 1 ] ;

							if( SrcB[ 1 ] == trans_values->blue &&
								SrcB[ 1 ] == trans_values->green &&
								SrcB[ 1 ] == trans_values->red )
							{
								Dest[ 3 ] = 0 ;
							}
							else
							{
								Dest[ 3 ] = 255 ;
							}
						}
					}
				}
				else
				{
					for( i = 0 ; i < BaseImage->Height; i ++, SrcBase += rowbytes, DestBase += BaseImage->Pitch )
					{
						BYTE *SrcB = SrcBase ;
						BYTE *Dest = DestBase ;
						for( j = 0 ; j < BaseImage->Width ; j ++, SrcB += 1, Dest += 4 )
						{
							Dest[ 0 ] = SrcB[ 0 ] ;
							Dest[ 1 ] = SrcB[ 0 ] ;
							Dest[ 2 ] = SrcB[ 0 ] ;

							if( SrcB[ 0 ] == trans_values->blue &&
								SrcB[ 0 ] == trans_values->green &&
								SrcB[ 0 ] == trans_values->red )
							{
								Dest[ 3 ] = 0 ;
							}
							else
							{
								Dest[ 3 ] = 255 ;
							}
						}
					}
				}

				DXFREE( OldGraphData ) ;
				OldGraphData = NULL ;
			}
			else
			{
				// �����O���[�X�P�[���Ȃ̂ɂP�s�N�Z���Q�o�C�g���������ʂW�r�b�g�������g�p����
				if( rowbytes / 2 >= width )
				{
					BaseImage->ColorData.ColorBitDepth	= 16 ;
					BaseImage->ColorData.PixelByte		= 2 ;

					BaseImage->ColorData.NoneMask		= 0x000000ff ;

					BaseImage->ColorData.AlphaLoc		= 0 ;
					BaseImage->ColorData.AlphaMask		= 0 ;
					BaseImage->ColorData.AlphaWidth		= 0 ;

					BaseImage->ColorData.RedLoc			= 8 ;
					BaseImage->ColorData.RedMask		= 0x0000ff00 ;
					BaseImage->ColorData.RedWidth		= 8 ;

					BaseImage->ColorData.GreenLoc		= 8 ;
					BaseImage->ColorData.GreenMask		= 0x0000ff00 ;
					BaseImage->ColorData.GreenWidth		= 8 ;

					BaseImage->ColorData.BlueLoc		= 8  ;
					BaseImage->ColorData.BlueMask		= 0x0000ff00 ;
					BaseImage->ColorData.BlueWidth		= 8 ;
				}
				else
				{
					NS_CreateGrayColorData( &BaseImage->ColorData ) ;
				}
			}
		}
		else
		if( color_type == PNG_COLOR_TYPE_GRAY_ALPHA )
		{
			BYTE *NewBuffer ;
			BYTE *SrcB ;
			BYTE *Dest ;
			DWORD Pitch ;
			DWORD i ;
			DWORD j ;

			Pitch            = 4 * width ;
			BaseImage->Pitch = ( int )Pitch ;
			NS_CreateARGB8ColorData( &BaseImage->ColorData ) ;

			if( GetFormatOnly == FALSE )
			{
				NewBuffer = ( BYTE * )DXALLOC( Pitch * height ) ;
				if( NewBuffer == NULL )
				{
					png_destroy_read_struct( &png_ptr, &info_ptr, ( png_infopp )NULL ) ;
					DXFREE( ImageData ) ;
					return -1 ;
				}
				BaseImage->GraphData	= NewBuffer ;

				SrcB = ( BYTE * )ImageData ;
				Dest = NewBuffer ;

				// �P�s�N�Z���Q�o�C�g�̏ꍇ�͂P�s�N�Z���ڂ͋P�x�A�Q�o�C�g�ڂ̓A���t�@�l
				if( rowbytes / 2 >= width )
				{
					for( i = 0 ; i < height ; i ++ )
					{
						for( j = 0 ; j < width ; j ++ )
						{
							Dest[ 0 ] = SrcB[ 0 ] ;
							Dest[ 1 ] = SrcB[ 0 ] ;
							Dest[ 2 ] = SrcB[ 0 ] ;
							Dest[ 3 ] = SrcB[ 1 ] ;
							Dest += 4 ;
							SrcB += 2 ;
						}

						SrcB += rowbytes - width * 2 ;
					}
				}
				else
				{
					for( i = 0 ; i < height ; i ++ )
					{
						for( j = 0 ; j < width ; j ++ )
						{
							Dest[ 0 ] = 255 ;
							Dest[ 1 ] = 255 ;
							Dest[ 2 ] = 255 ;
							Dest[ 3 ] = *SrcB ;
							Dest += 4 ;
							SrcB ++ ;
						}

						SrcB += rowbytes - width ;
					}
				}

				DXFREE( ImageData ) ;
			}
		}
		else
		{
//			if( info_ptr->channels == 4 )
			if( png_get_channels( png_ptr, info_ptr ) == 4 )
			{
				NS_CreateFullColorData( &BaseImage->ColorData ) ;
				BaseImage->ColorData.ColorBitDepth	= 32 ;
				BaseImage->ColorData.PixelByte		= 4 ;
				BaseImage->ColorData.AlphaLoc		= 24 ;
				BaseImage->ColorData.AlphaWidth		= 8 ;
				BaseImage->ColorData.AlphaMask		= 0xff000000 ;
			}
			else
			// ���ߐF��񂪂���ꍇ�̓A���t�@�`�����l�����摜�ɂ���
			if( png_get_valid( png_ptr, info_ptr, PNG_INFO_tRNS ) )
			{
				png_bytep trans ;
				png_color_16p trans_values ;
				int num_trans ;
				int i, j ;

				// ���ߐF���擾
				png_get_tRNS( png_ptr, info_ptr, &trans, &num_trans, &trans_values ) ;

				// �A���t�@�`�����l������ɂ���
				NS_CreateFullColorData( &BaseImage->ColorData ) ;
				BaseImage->ColorData.ColorBitDepth	= 32 ;
				BaseImage->ColorData.PixelByte		= 4 ;
				BaseImage->ColorData.AlphaLoc		= 24 ;
				BaseImage->ColorData.AlphaWidth		= 8 ;
				BaseImage->ColorData.AlphaMask		= 0xff000000 ;

				// 24�r�b�g�J���[�摜�� 32�r�b�g�A���t�@�`�����l�����摜�ɕϊ�
				BYTE *OldGraphData = ( BYTE * )BaseImage->GraphData ;
				BYTE *NewGraphData ;
				BaseImage->Pitch		= BaseImage->Width * 4 ;
				BaseImage->GraphData	= DXALLOC( BaseImage->Pitch * BaseImage->Height ) ;
				if( BaseImage->GraphData == NULL )
				{
					png_destroy_read_struct( &png_ptr, &info_ptr, ( png_infopp )NULL ) ;
					DXFREE( OldGraphData ) ;
					return -1 ;
				}
				NewGraphData = ( BYTE * )BaseImage->GraphData ;

				BYTE *SrcBase  = OldGraphData ;
				BYTE *DestBase = NewGraphData ;
				for( i = 0 ; i < BaseImage->Height; i ++, SrcBase += rowbytes, DestBase += BaseImage->Pitch )
				{
					BYTE *SrcB = SrcBase ;
					BYTE *Dest = DestBase ;
					for( j = 0 ; j < BaseImage->Width ; j ++, SrcB += 3, Dest += 4 )
					{
						Dest[ 0 ] = SrcB[ 0 ] ;
						Dest[ 1 ] = SrcB[ 1 ] ;
						Dest[ 2 ] = SrcB[ 2 ] ;

						if( SrcB[ 0 ] == trans_values->blue &&
							SrcB[ 1 ] == trans_values->green &&
							SrcB[ 2 ] == trans_values->red )
						{
							Dest[ 3 ] = 0 ;
						}
						else
						{
							Dest[ 3 ] = 255 ;
						}
					}
				}

				DXFREE( OldGraphData ) ;
				OldGraphData = NULL ;
			}
			else
			// ����ȊO�̏ꍇ�͒ʏ�̃t���J���[�摜
			{
				NS_CreateFullColorData( &BaseImage->ColorData ) ;
			}
		}
	}

	// �ǂݍ��ݏ����p�\���̂̔j��
	png_destroy_read_struct( &png_ptr, &info_ptr, ( png_infopp )NULL ) ;

	// �I��
	return 0;
}


// �o�m�f�摜�̓ǂ݂���( ������ )
#define READ_4BYTE( x )				( ( ( ( BYTE * )( x ) )[ 0 ] << 24 ) | ( ( ( BYTE * )( x ) )[ 1 ] << 16 ) | ( ( ( BYTE * )( x ) )[ 2 ] << 8 ) | ( ( ( BYTE * )( x ) )[ 3 ]  ) )

#define PAETH_CODE( x )	up = UpP[ x ] ;\
						\
						upleft = UpLeftP[ x ] ;\
						left = LeftP[ x ] ;\
						\
						up_upleft  = up - upleft ;\
						left_upleft = left - upleft ;\
						\
						abs_up_upleft = up_upleft  < 0 ? -up_upleft  : up_upleft ;\
						abs_left_upleft = left_upleft < 0 ? -left_upleft : left_upleft ;\
						abs_up_upleft_left_upleft = ( up_upleft + left_upleft ) < 0 ? -( up_upleft + left_upleft ) : up_upleft + left_upleft ;\
						\
						result = ( abs_up_upleft <= abs_left_upleft && abs_up_upleft <= abs_up_upleft_left_upleft ) ? left : ( abs_left_upleft <= abs_up_upleft_left_upleft ) ? up : upleft ;

#define BYTE_FILTER_CODE	\
						TmpP = SrcP ;\
						switch( SrcP[ -1 ] )\
						{\
						case 0 :\
							break ;\
\
						case 1 :\
							TmpP += 1 ;\
							for( j = 1 ; j < SrcPitch - 1 ; j ++, TmpP += 1 )\
							{\
								TmpP[ 0 ] = ( BYTE )( ( int )TmpP[ 0 ] + ( int )( ( TmpP - 1 )[ 0 ] ) ) ;\
							}\
							break ;\
\
						case 2 :\
							if( i != 0 )\
							{\
								for( j = 0 ; j < SrcPitch - 1 ; j ++, TmpP += 1 )\
								{\
									TmpP[ 0 ] = ( BYTE )( ( int )TmpP[ 0 ] + ( int )( ( TmpP - SrcPitch )[ 0 ] ) ) ;\
								}\
							}\
							break ;\
\
						case 3 :\
							if( i == 0 )\
							{\
								TmpP += 1 ;\
								for( j = 1 ; j < SrcPitch - 1 ; j ++, TmpP += 1 )\
								{\
									TmpP[ 0 ] = ( BYTE )( ( int )TmpP[ 0 ] + ( int )( ( TmpP - 1 )[ 0 ] ) ) ;\
								}\
							}\
							else\
							{\
								TmpP[ 0 ] = ( BYTE )( ( int )TmpP[ 0 ] + ( ( TmpP - SrcPitch )[ 0 ] ) / 2 ) ;\
\
								TmpP += 1 ;\
								for( j = 1 ; j < SrcPitch - 1 ; j ++, TmpP += 1 )\
								{\
									TmpP[ 0 ] = ( BYTE )( ( int )TmpP[ 0 ] + ( ( TmpP - 1 )[ 0 ] + ( TmpP - SrcPitch )[ 0 ] ) / 2 ) ;\
								}\
							}\
							break ;\
\
						case 4 :\
						{\
							if( i == 0 )\
							{\
								TmpP += 1 ;\
								for( j = 1 ; j < SrcPitch - 1 ; j ++, TmpP += 1 )\
								{\
									TmpP[ 0 ] = ( BYTE )( ( int )TmpP[ 0 ] + ( int )( ( TmpP - 1 )[ 0 ] ) ) ;\
								}\
							}\
							else\
							{\
								int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;\
\
								TmpP[ 0 ] = ( BYTE )( ( int )TmpP[ 0 ] + ( TmpP - SrcPitch )[ 0 ] ) ;\
								TmpP += 1 ;\
\
								for( j = 1 ; j < SrcPitch - 1 ; j ++, TmpP += 1 )\
								{\
									BYTE *UpP = TmpP - SrcPitch ;\
									BYTE *UpLeftP = TmpP - SrcPitch - 1 ;\
									BYTE *LeftP = TmpP - 1 ;\
\
									{\
										PAETH_CODE( 0 )\
\
										TmpP[ 0 ] = ( BYTE )( ( int )TmpP[ 0 ] + result ) ;\
									}\
								}\
							}\
						}\
						break ;\
						}



extern int LoadPngImage_Fast( STREAMDATA *Src, BASEIMAGE *BaseImage, int GetFormatOnly )
{
	size_t FileBytes ;
	BYTE *SrcP = NULL ;
	BYTE *TmpP = NULL ;
	BYTE *DestP = NULL ;
	BYTE *IHDR = NULL ;
	BYTE *tRNS = NULL ;
	DWORD tRNSBytes = 0 ;
	BYTE *IDAT = NULL ;
	DWORD IDATBytes = 0 ;
	BYTE *PLTE = NULL ;
	DWORD PLTEBytes = 0 ;
	DWORD PLTECount = 0 ;
	BYTE *FilterImage = NULL ;
	DWORD FilterImageBytes ;
	DWORD FilterImagePitch ;
	DWORD ChunkBytes ;
	int IsLoop = 1 ;
	BYTE BitDepth ;
	DWORD PixelBits ;
	BYTE ColorType ;
	BYTE CompressionMethod ;
	BYTE FilterMethod ;
	BYTE InterlaceMethod ;
	z_stream ZStream ;
	int ZStreamInit = 0 ;
	int status = Z_OK ;
	DWORD i ;
	BYTE tr = 0, tg = 0, tb = 0 ;
	static BYTE Table1bit[ 2 ] = { 0, 255 } ;
	static BYTE Table2bit[ 4 ] = { 0, 85, 170, 255 } ;
	static BYTE Table4bit[ 16 ] = { 0, 17, 34, 51, 68, 85, 102, 119, 136, 153, 170, 187, 204, 221, 238, 255 } ;

	// �������ɓǂݍ��܂ꂽ�f�[�^�ł͂Ȃ��ꍇ�͏������Ȃ�
	if( GetMemStreamDataShredStruct()->Read != Src->ReadShred.Read )
	{
		return -1 ;
	}

	// �������̓ǂݍ��܂ꂽ�f�[�^�̃A�h���X���擾
	SrcP = *( ( BYTE ** )Src->DataPoint ) ;
	FileBytes = *( ( size_t * )( ( BYTE ** )Src->DataPoint + 1 ) ) ;

	// �ŏ��̂W�o�C�g��PNG�t�@�C�����ǂ������`�F�b�N
	if( FileBytes < 8 ||
		SrcP[ 0 ] != 0x89 || SrcP[ 1 ] != 0x50 || SrcP[ 2 ] != 0x4E || SrcP[ 3 ] != 0x47 ||
		SrcP[ 4 ] != 0x0D || SrcP[ 5 ] != 0x0A || SrcP[ 6 ] != 0x1A || SrcP[ 7 ] != 0x0A )
	{
		return -1 ;
	}

	// �e�`�����N�����o
	SrcP += 8 ;
	while( IsLoop )
	{
		ChunkBytes = READ_4BYTE( SrcP ) ;
		switch( *( ( DWORD * )( SrcP + 4 ) ) )
		{
		case 0x52444849 :	// IHDR
			if( IHDR != NULL )
			{
				goto ERR ;
			}
			IHDR = SrcP + 8 ;
			break ;

		case 0x54414449 :	// IDAT
			IDAT = SrcP + 8 ;
			IDATBytes = ChunkBytes ;
			break ;

		case 0x45544C50 :	// PLTE
			if( PLTE != NULL )
			{
				return -1 ;
			}
			PLTE = SrcP + 8 ;
			PLTEBytes = ChunkBytes ;
			break ;

		case 0x534E5274 :	// tRNS
			tRNS = SrcP + 8 ;
			tRNSBytes = ChunkBytes ;
			break ;

		case 0x444E4549 :	// IEND
			IsLoop = 0 ;
			break ;

		case 0x74585469 :	// iTXt
		case 0x74584574 :	// tEXt
		case 0x7458547A :	// zTXt
		case 0x454D4974 :	// tIME
			break ;

		default :
			break ;
		}

		SrcP += ChunkBytes + 12 ;
	}

	// �K�{�`�����N������������G���[
	if( IHDR == NULL || IDAT == NULL )
	{
		goto ERR ;
	}

	// �w�b�_�ǂݍ���
	BaseImage->Width  = ( int )READ_4BYTE( IHDR + 0 ) ;
	BaseImage->Height = ( int )READ_4BYTE( IHDR + 4 ) ;
	BitDepth = IHDR[ 8 ] ;
	ColorType = IHDR[ 9 ] ;
	CompressionMethod = IHDR[ 10 ] ;
	FilterMethod = IHDR[ 11 ] ;
	InterlaceMethod = IHDR[ 12 ] ;

	// �C���^�[���[�X�ɂ͔�Ή�
	if( InterlaceMethod != 0 )
	{
		goto ERR ;
	}

	// ���k���@�� Deflate �̂ݑΉ�
	if( CompressionMethod != 0 )
	{
		goto ERR ;
	}

	// �W���̃t�B���^�[��@�̂ݑΉ�
	if( FilterMethod != 0 )
	{
		goto ERR ;
	}

	// �Ή����Ă���J���[�^�C�v�� 2( RGB ) �� 6( RGBA ) �̂�
	switch( ColorType )
	{
	case 0 :	// GRAY
		if( BitDepth != 1 && BitDepth != 2 && BitDepth != 4 && BitDepth != 8 && BitDepth != 16 )
		{
			goto ERR ;
		}
		PixelBits = BitDepth ;
		if( tRNS != NULL )
		{
			NS_CreateARGB8ColorData( &BaseImage->ColorData ) ;
			if( BitDepth == 16 )
			{
				tg = tRNS[ 0 ] ;
			}
			else
			{
				tg = tRNS[ 1 ] ;
			}
		}
		else
		{
			NS_CreateGrayColorData( &BaseImage->ColorData ) ;
		}
		break ;

	case 2 :	// RGB
		if( BitDepth != 8 && BitDepth != 16 )
		{
			goto ERR ;
		}

		if( tRNS != NULL )
		{
			PixelBits = BitDepth * 3 ;
			NS_CreateARGB8ColorData( &BaseImage->ColorData ) ;
			if( BitDepth == 8 )
			{
				tr = tRNS[ 1 ] ;
				tg = tRNS[ 3 ] ;
				tb = tRNS[ 5 ] ;
			}
			else
			{
				tr = tRNS[ 0 ] ;
				tg = tRNS[ 2 ] ;
				tb = tRNS[ 4 ] ;
			}
		}
		else
		{
			PixelBits = BitDepth * 3 ;
			NS_CreateFullColorData( &BaseImage->ColorData ) ;
		}
		break ;

	case 3 :	// PLT
		PixelBits = BitDepth ;
		if( PLTE == NULL )
		{
			goto ERR ;
		}
		PLTECount = PLTEBytes / 3 ;
		NS_CreatePal8ColorData( &BaseImage->ColorData, tRNS != NULL ? TRUE : FALSE ) ;
		BaseImage->ColorData.MaxPaletteNo = ( int )( PLTECount - 1 ) ;
		for( i = 0 ; i < PLTECount ; i ++ )
		{
			BaseImage->ColorData.Palette[ i ].Red   = PLTE[ 0 ] ;
			BaseImage->ColorData.Palette[ i ].Green = PLTE[ 1 ] ;
			BaseImage->ColorData.Palette[ i ].Blue  = PLTE[ 2 ] ;
			PLTE += 3 ;
		}
		if( tRNS != NULL )
		{
			for( i = 0 ; i < tRNSBytes ; i ++ )
			{
				BaseImage->ColorData.Palette[ i ].Alpha = tRNS[ i ] ;
			}
			for( ; i < 256 ; i ++ )
			{
				BaseImage->ColorData.Palette[ i ].Alpha = 255 ;
			}
		}
		else
		{
			for( i = 0 ; i < 256 ; i ++ )
			{
				BaseImage->ColorData.Palette[ i ].Alpha = 0 ;
			}
		}
		break ;

	case 4 :	// GRAY + A
		if( BitDepth != 8 && BitDepth != 16 )
		{
			goto ERR ;
		}
		PixelBits = BitDepth * 2 ;
		NS_CreateARGB8ColorData( &BaseImage->ColorData ) ;
		break ;

	case 6 :	// RGBA
		if( BitDepth != 8 && BitDepth != 16 )
		{
			goto ERR ;
		}
		PixelBits = BitDepth * 4 ;
		NS_CreateARGB8ColorData( &BaseImage->ColorData ) ;
		break ;

	default :
		goto ERR ;
	}

	// �s�b�`�̌v�Z
	BaseImage->Pitch = BaseImage->Width * BaseImage->ColorData.PixelByte ;

	if( GetFormatOnly == FALSE )
	{
		// �摜�ۑ��p�̃o�b�t�@���m��
		BaseImage->GraphData = DXALLOC( BaseImage->Pitch * BaseImage->Height ) ;
		if( BaseImage->GraphData == NULL )
		{
			goto ERR ;
		}

		// �t�B���^�[�C���[�W�̃o�b�t�@���m��
		FilterImagePitch = ( BaseImage->Width * PixelBits + 7 ) / 8 + 1 ;
		FilterImageBytes = ( DWORD )( FilterImagePitch * BaseImage->Height ) ;
		FilterImage = ( BYTE * )DXALLOC( FilterImageBytes ) ;
		if( FilterImage == NULL )
		{
			goto ERR ;
		}

		// ���k�f�[�^�̉𓀏���
		_MEMSET( &ZStream, 0, sizeof( ZStream ) ) ;
		if( inflateInit( &ZStream ) != Z_OK )
		{
			goto ERR ;
		}
		ZStreamInit = 1 ;
		ZStream.next_out = FilterImage ;
		ZStream.avail_out = FilterImageBytes ;

		// ���k�f�[�^�̉�
		SrcP = *( ( BYTE ** )Src->DataPoint ) + 8 ;
		IsLoop = 1 ;
		while( IsLoop )
		{
			ChunkBytes = READ_4BYTE( SrcP ) ;
			switch( *( ( DWORD * )( SrcP + 4 ) ) )
			{
			case 0x54414449 :	// IDAT
				IDAT = SrcP + 8 ;
				IDATBytes = ChunkBytes ;

				// IDAT�f�[�^�̉�
				ZStream.next_in = IDAT ;
				ZStream.avail_in = IDATBytes ;
				status = inflate( &ZStream, Z_NO_FLUSH ) ;
				if( status != Z_OK && status != Z_STREAM_END )
				{
					goto ERR ;
				}
				if( status == Z_STREAM_END )
				{
					IsLoop = 0 ;
				}
				break ;

			case 0x444E4549 :	// IEND
				IsLoop = 0 ;
				break ;

			default :
				break ;
			}

			SrcP += ChunkBytes + 12 ;
		}

		// ���k�f�[�^������Ă��Ȃ�������G���[
		if( status != Z_STREAM_END || ZStream.total_out != FilterImageBytes )
		{
			goto ERR ;
		}

		// �𓀏����̌�n��
		inflateEnd( &ZStream ) ;
		_MEMSET( &ZStream, 0, sizeof( ZStream ) ) ;
		ZStreamInit = 0 ;

		// �t�B���^�[������
		{
			DWORD Width = ( DWORD )BaseImage->Width ;
			DWORD Height = ( DWORD )BaseImage->Height ;
			DWORD DestPitch = ( DWORD )BaseImage->Pitch ;
			DWORD SrcPitch = FilterImagePitch ;
			DWORD SrcAddPitch = SrcPitch - Width * PixelBits / 8 ;
			DWORD DestAddPitch = DestPitch - Width * BaseImage->ColorData.PixelByte ;
			DWORD i, j ;

			SrcP  = FilterImage + 1 ;
			DestP = ( BYTE * )BaseImage->GraphData ;
			switch( ColorType )
			{
			case 0 :	// GRAY
			case 3 :	// PLTE
				if( tRNS != NULL && ColorType == 0 )
				{
					if( BitDepth == 1 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							BYTE_FILTER_CODE

							for( j = 0 ;; )
							{
								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] >> 7 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table1bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 6 ) & 0x1 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table1bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 5 ) & 0x1 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table1bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 4 ) & 0x1 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table1bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 3 ) & 0x1 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table1bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 2 ) & 0x1 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table1bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 1 ) & 0x1 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table1bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] & 0x1 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table1bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								SrcP ++ ;
							}
						}
					}
					else
					if( BitDepth == 2 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							BYTE_FILTER_CODE

							for( j = 0 ;; )
							{
								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] >> 6 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table2bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 4 ) & 0x3 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table2bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 2 ) & 0x3 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table2bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] & 0x3 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table2bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								SrcP ++ ;
							}
						}
					}
					else
					if( BitDepth == 4 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							BYTE_FILTER_CODE

							for( j = 0 ;; )
							{
								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] >> 4 ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table4bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] & 0xf ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								DestP[ 0 ] = Table4bit[ DestP[ 0 ] ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP += 4 ;
								j ++ ;

								SrcP ++ ;
							}
						}
					}
					else
					if( BitDepth == 8 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							switch( SrcP[ -1 ] )
							{
							case 0 :
								for( j = 0 ; j < Width ; j ++, SrcP += 1, DestP += 4 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								}
								break ;

							case 1 :
								DestP[ 0 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;

								SrcP += 1 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 4 )
								{
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								}
								break ;

							case 2 :
								if( i == 0 )
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 1, DestP += 4 )
									{
										DestP[ 0 ] = SrcP[ 0 ] ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								else
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 1, DestP += 4 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								break ;

							case 3 :
								if( i == 0 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;

									SrcP += 1 ;
									DestP += 4 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 4 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 4 )[ 0 ] / 2 ) ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								else
								{
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;

									SrcP += 1 ;
									DestP += 4 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 4 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								break ;

							case 4 :
								if( i == 0 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;

									SrcP += 1 ;
									DestP += 4 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 4 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								else
								{
									int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 0 ] ) ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									SrcP += 1 ;
									DestP += 4 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 4 )
									{
										BYTE *UpP = DestP - DestPitch ;
										BYTE *UpLeftP = DestP - DestPitch - 4 ;
										BYTE *LeftP = DestP - 4 ;

										{
											PAETH_CODE( 0 )

											DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
											DestP[ 1 ] = DestP[ 0 ] ;
											DestP[ 2 ] = DestP[ 0 ] ;
											DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
										}
									}
								}
								break ;
							}
						}
					}
					else
					if( BitDepth == 16 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							switch( SrcP[ -1 ] )
							{
							case 0 :
								for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								}
								break ;

							case 1 :
								DestP[ 0 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = DestP[ 0 ] ;
								DestP[ 2 ] = DestP[ 0 ] ;
								DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;

								SrcP += 2 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
								{
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
								}
								break ;

							case 2 :
								if( i == 0 )
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
									{
										DestP[ 0 ] = SrcP[ 0 ] ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								else
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								break ;

							case 3 :
								if( i == 0 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;

									SrcP += 2 ;
									DestP += 4 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 4 )[ 0 ] / 2 ) ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								else
								{
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;

									SrcP += 2 ;
									DestP += 4 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								break ;

							case 4 :
								if( i == 0 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;

									SrcP += 2 ;
									DestP += 4 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
										DestP[ 1 ] = DestP[ 0 ] ;
										DestP[ 2 ] = DestP[ 0 ] ;
										DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									}
								}
								else
								{
									int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 0 ] ) ;
									DestP[ 1 ] = DestP[ 0 ] ;
									DestP[ 2 ] = DestP[ 0 ] ;
									DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
									SrcP += 2 ;
									DestP += 4 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
									{
										BYTE *UpP = DestP - DestPitch ;
										BYTE *UpLeftP = DestP - DestPitch - 4 ;
										BYTE *LeftP = DestP - 4 ;

										{
											PAETH_CODE( 0 )

											DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
											DestP[ 1 ] = DestP[ 0 ] ;
											DestP[ 2 ] = DestP[ 0 ] ;
											DestP[ 3 ] = DestP[ 0 ] == tg ? 0 : 255 ;
										}
									}
								}
							break ;
							}
						}
					}
				}
				else
				{
					if( BitDepth == 1 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							BYTE_FILTER_CODE

							for( j = 0 ;; )
							{
								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] >> 7 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 6 ) & 0x1 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 5 ) & 0x1 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 4 ) & 0x1 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 3 ) & 0x1 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 2 ) & 0x1 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 1 ) & 0x1 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] & 0x1 ;
								DestP ++ ;
								j ++ ;

								SrcP ++ ;
							}
						}
					}
					else
					if( BitDepth == 2 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							BYTE_FILTER_CODE

							for( j = 0 ;; )
							{
								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] >> 6 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 4 ) & 0x3 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = ( SrcP[ 0 ] >> 2 ) & 0x3 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] & 0x3 ;
								DestP ++ ;
								j ++ ;

								SrcP ++ ;
							}
						}
					}
					else
					if( BitDepth == 4 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							BYTE_FILTER_CODE

							for( j = 0 ;; )
							{
								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] >> 4 ;
								DestP ++ ;
								j ++ ;

								if( j >= Width ) break ;
								DestP[ 0 ] = SrcP[ 0 ] & 0xf ;
								DestP ++ ;
								j ++ ;

								SrcP ++ ;
							}
						}
					}
					else
					if( BitDepth == 8 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							switch( SrcP[ -1 ] )
							{
							case 0 :
								for( j = 0 ; j < Width ; j ++, SrcP += 1, DestP += 1 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
								}
								break ;

							case 1 :
								DestP[ 0 ] = SrcP[ 0 ] ;

								SrcP += 1 ;
								DestP += 1 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 1 )
								{
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 1 )[ 0 ] ) ) ;
								}
								break ;

							case 2 :
								if( i == 0 )
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 1, DestP += 1 )
									{
										DestP[ 0 ] = SrcP[ 0 ] ;
									}
								}
								else
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 1, DestP += 1 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
									}
								}
								break ;

							case 3 :
								if( i == 0 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;

									SrcP += 1 ;
									DestP += 1 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 1 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 1 )[ 0 ] / 2 ) ;
									}
								}
								else
								{
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;

									SrcP += 1 ;
									DestP += 1 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 1 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 1 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									}
								}
								break ;

							case 4 :
								if( i == 0 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;

									SrcP += 1 ;
									DestP += 1 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 1 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 1 )[ 0 ] ) ) ;
									}
								}
								else
								{
									int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 0 ] ) ;
									SrcP += 1 ;
									DestP += 1 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 1, DestP += 1 )
									{
										BYTE *UpP = DestP - DestPitch ;
										BYTE *UpLeftP = DestP - DestPitch - 1 ;
										BYTE *LeftP = DestP - 1 ;

										{
											PAETH_CODE( 0 )

											DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
										}
									}
								}
								break ;
							}
						}
					}
					else
					if( BitDepth == 16 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							switch( SrcP[ -1 ] )
							{
							case 0 :
								for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 1 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
								}
								break ;

							case 1 :
								DestP[ 0 ] = SrcP[ 0 ] ;

								SrcP += 2 ;
								DestP += 1 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 1 )
								{
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 1 )[ 0 ] ) ) ;
								}
								break ;

							case 2 :
								if( i == 0 )
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 1 )
									{
										DestP[ 0 ] = SrcP[ 0 ] ;
									}
								}
								else
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 1 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
									}
								}
								break ;

							case 3 :
								if( i == 0 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;

									SrcP += 2 ;
									DestP += 1 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 1 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 1 )[ 0 ] / 2 ) ;
									}
								}
								else
								{
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;

									SrcP += 2 ;
									DestP += 1 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 1 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 1 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									}
								}
								break ;

							case 4 :
								if( i == 0 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;

									SrcP += 2 ;
									DestP += 1 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 1 )
									{
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 1 )[ 0 ] ) ) ;
									}
								}
								else
								{
									int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 0 ] ) ;
									SrcP += 2 ;
									DestP += 1 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 1 )
									{
										BYTE *UpP = DestP - DestPitch ;
										BYTE *UpLeftP = DestP - DestPitch - 1 ;
										BYTE *LeftP = DestP - 1 ;

										{
											PAETH_CODE( 0 )

											DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
										}
									}
								}
							break ;
							}
						}
					}
				}
				break ;

			case 2 :	// RGB
				if( tRNS != NULL )
				{
					if( BitDepth == 8 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							switch( SrcP[ -1 ] )
							{
							case 0 :
								for( j = 0 ; j < Width ; j ++, SrcP += 3, DestP += 4 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 1 ] ;
									DestP[ 0 ] = SrcP[ 2 ] ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}
								}
								break ;

							case 1 :
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 1 ] ;
								DestP[ 0 ] = SrcP[ 2 ] ;
								if( DestP[ 2 ] == tr &&
									DestP[ 1 ] == tg &&
									DestP[ 0 ] == tb )
								{
									DestP[ 3 ] = 0 ;
								}
								else
								{
									DestP[ 3 ] = 255 ;
								}

								SrcP += 3 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 2 ] ) ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - 4 )[ 1 ] ) ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}
								}
								break ;

							case 2 :
								if( i == 0 )
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 3, DestP += 4 )
									{
										DestP[ 2 ] = SrcP[ 0 ] ;
										DestP[ 1 ] = SrcP[ 1 ] ;
										DestP[ 0 ] = SrcP[ 2 ] ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								else
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 3, DestP += 4 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 2 ] ) ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - DestPitch )[ 1 ] ) ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								break ;

							case 3 :
								if( i == 0 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 1 ] ;
									DestP[ 0 ] = SrcP[ 2 ] ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}

									SrcP += 3 ;
									DestP += 4 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 4 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 4 )[ 2 ] / 2 ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( DestP - 4 )[ 1 ] / 2 ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - 4 )[ 0 ] / 2 ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								else
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}

									SrcP += 3 ;
									DestP += 4 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 4 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 2 ] + ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - 4 )[ 1 ] + ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - 4 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								break ;

							case 4 :
								if( i == 0 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 1 ] ;
									DestP[ 0 ] = SrcP[ 2 ] ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}

									SrcP += 3 ;
									DestP += 4 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 4 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 2 ] ) ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - 4 )[ 1 ] ) ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								else
								{
									int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 2 ] ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( DestP - DestPitch )[ 1 ] ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - DestPitch )[ 0 ] ) ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}
									SrcP += 3 ;
									DestP += 4 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 4 )
									{
										BYTE *UpP = DestP - DestPitch ;
										BYTE *UpLeftP = DestP - DestPitch - 4 ;
										BYTE *LeftP = DestP - 4 ;
										PAETH_CODE( 2 )	DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
										PAETH_CODE( 1 )	DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + result ) ;
										PAETH_CODE( 0 )	DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + result ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								break ;
							}
						}
					}
					else
					if( BitDepth == 16 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							switch( SrcP[ -1 ] )
							{
							case 0 :
								for( j = 0 ; j < Width ; j ++, SrcP += 6, DestP += 4 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 2 ] ;
									DestP[ 0 ] = SrcP[ 4 ] ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}
								}
								break ;

							case 1 :
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 2 ] ;
								DestP[ 0 ] = SrcP[ 4 ] ;
								if( DestP[ 2 ] == tr &&
									DestP[ 1 ] == tg &&
									DestP[ 0 ] == tb )
								{
									DestP[ 3 ] = 0 ;
								}
								else
								{
									DestP[ 3 ] = 255 ;
								}

								SrcP += 6 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 2 ] ) ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 1 ] ) ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}
								}
								break ;

							case 2 :
								if( i == 0 )
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 6, DestP += 4 )
									{
										DestP[ 2 ] = SrcP[ 0 ] ;
										DestP[ 1 ] = SrcP[ 2 ] ;
										DestP[ 0 ] = SrcP[ 4 ] ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								else
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 6, DestP += 4 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 2 ] ) ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - DestPitch )[ 1 ] ) ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								break ;

							case 3 :
								if( i == 0 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 2 ] ;
									DestP[ 0 ] = SrcP[ 4 ] ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}

									SrcP += 6 ;
									DestP += 4 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 4 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 4 )[ 2 ] / 2 ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - 4 )[ 1 ] / 2 ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( DestP - 4 )[ 0 ] / 2 ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								else
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}

									SrcP += 6 ;
									DestP += 4 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 4 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 2 ] + ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - 4 )[ 1 ] + ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( ( DestP - 4 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								break ;

							case 4 :
								if( i == 0 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 2 ] ;
									DestP[ 0 ] = SrcP[ 4 ] ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}

									SrcP += 6 ;
									DestP += 4 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 4 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 2 ] ) ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 1 ] ) ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								else
								{
									int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 2 ] ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - DestPitch )[ 1 ] ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( DestP - DestPitch )[ 0 ] ) ;
									if( DestP[ 2 ] == tr &&
										DestP[ 1 ] == tg &&
										DestP[ 0 ] == tb )
									{
										DestP[ 3 ] = 0 ;
									}
									else
									{
										DestP[ 3 ] = 255 ;
									}
									SrcP += 6 ;
									DestP += 4 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 4 )
									{
										BYTE *UpP = DestP - DestPitch ;
										BYTE *UpLeftP = DestP - DestPitch - 4 ;
										BYTE *LeftP = DestP - 4 ;
										PAETH_CODE( 2 )	DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
										PAETH_CODE( 1 )	DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + result ) ;
										PAETH_CODE( 0 )	DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + result ) ;
										if( DestP[ 2 ] == tr &&
											DestP[ 1 ] == tg &&
											DestP[ 0 ] == tb )
										{
											DestP[ 3 ] = 0 ;
										}
										else
										{
											DestP[ 3 ] = 255 ;
										}
									}
								}
								break ;
							}
						}
					}
				}
				else
				{
					if( BitDepth == 8 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							switch( SrcP[ -1 ] )
							{
							case 0 :
								for( j = 0 ; j < Width ; j ++, SrcP += 3, DestP += 3 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 1 ] ;
									DestP[ 0 ] = SrcP[ 2 ] ;
								}
								break ;

							case 1 :
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 1 ] ;
								DestP[ 0 ] = SrcP[ 2 ] ;

								SrcP += 3 ;
								DestP += 3 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 3 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 3 )[ 2 ] ) ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - 3 )[ 1 ] ) ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 3 )[ 0 ] ) ) ;
								}
								break ;

							case 2 :
								if( i == 0 )
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 3, DestP += 3 )
									{
										DestP[ 2 ] = SrcP[ 0 ] ;
										DestP[ 1 ] = SrcP[ 1 ] ;
										DestP[ 0 ] = SrcP[ 2 ] ;
									}
								}
								else
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 3, DestP += 3 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 2 ] ) ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - DestPitch )[ 1 ] ) ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
									}
								}
								break ;

							case 3 :
								if( i == 0 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 1 ] ;
									DestP[ 0 ] = SrcP[ 2 ] ;

									SrcP += 3 ;
									DestP += 3 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 3 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 3 )[ 2 ] / 2 ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( DestP - 3 )[ 1 ] / 2 ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - 3 )[ 0 ] / 2 ) ;
									}
								}
								else
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;

									SrcP += 3 ;
									DestP += 3 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 3 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 3 )[ 2 ] + ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - 3 )[ 1 ] + ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - 3 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									}
								}
								break ;

							case 4 :
								if( i == 0 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 1 ] ;
									DestP[ 0 ] = SrcP[ 2 ] ;

									SrcP += 3 ;
									DestP += 3 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 3 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 3 )[ 2 ] ) ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - 3 )[ 1 ] ) ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 3 )[ 0 ] ) ) ;
									}
								}
								else
								{
									int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 2 ] ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( DestP - DestPitch )[ 1 ] ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - DestPitch )[ 0 ] ) ;
									SrcP += 3 ;
									DestP += 3 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 3, DestP += 3 )
									{
										BYTE *UpP = DestP - DestPitch ;
										BYTE *UpLeftP = DestP - DestPitch - 3 ;
										BYTE *LeftP = DestP - 3 ;
										PAETH_CODE( 2 )	DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
										PAETH_CODE( 1 )	DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + result ) ;
										PAETH_CODE( 0 )	DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + result ) ;
									}
								}
								break ;
							}
						}
					}
					else
					if( BitDepth == 16 )
					{
						for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
						{
							switch( SrcP[ -1 ] )
							{
							case 0 :
								for( j = 0 ; j < Width ; j ++, SrcP += 6, DestP += 3 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 2 ] ;
									DestP[ 0 ] = SrcP[ 4 ] ;
								}
								break ;

							case 1 :
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 2 ] ;
								DestP[ 0 ] = SrcP[ 4 ] ;

								SrcP += 6 ;
								DestP += 3 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 3 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 3 )[ 2 ] ) ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 3 )[ 1 ] ) ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - 3 )[ 0 ] ) ) ;
								}
								break ;

							case 2 :
								if( i == 0 )
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 6, DestP += 3 )
									{
										DestP[ 2 ] = SrcP[ 0 ] ;
										DestP[ 1 ] = SrcP[ 2 ] ;
										DestP[ 0 ] = SrcP[ 4 ] ;
									}
								}
								else
								{
									for( j = 0 ; j < Width ; j ++, SrcP += 6, DestP += 3 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 2 ] ) ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - DestPitch )[ 1 ] ) ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
									}
								}
								break ;

							case 3 :
								if( i == 0 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 2 ] ;
									DestP[ 0 ] = SrcP[ 4 ] ;

									SrcP += 6 ;
									DestP += 3 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 3 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 3 )[ 2 ] / 2 ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - 3 )[ 1 ] / 2 ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( DestP - 3 )[ 0 ] / 2 ) ;
									}
								}
								else
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;

									SrcP += 6 ;
									DestP += 3 ;
									for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 3 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 3 )[ 2 ] + ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - 3 )[ 1 ] + ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( ( DestP - 3 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									}
								}
								break ;

							case 4 :
								if( i == 0 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 2 ] ;
									DestP[ 0 ] = SrcP[ 4 ] ;

									SrcP += 6 ;
									DestP += 3 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 3 )
									{
										DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 3 )[ 2 ] ) ) ;
										DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 3 )[ 1 ] ) ) ;
										DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - 3 )[ 0 ] ) ) ;
									}
								}
								else
								{
									int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 2 ] ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - DestPitch )[ 1 ] ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( DestP - DestPitch )[ 0 ] ) ;
									SrcP += 6 ;
									DestP += 3 ;

									for( j = 1 ; j < Width ; j ++, SrcP += 6, DestP += 3 )
									{
										BYTE *UpP = DestP - DestPitch ;
										BYTE *UpLeftP = DestP - DestPitch - 3 ;
										BYTE *LeftP = DestP - 3 ;
										PAETH_CODE( 2 )	DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
										PAETH_CODE( 1 )	DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + result ) ;
										PAETH_CODE( 0 )	DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + result ) ;
									}
								}
								break ;
							}
						}
					}
				}
				break ;

			case 4 :	// GRAY + A
				if( BitDepth == 8 )
				{
					for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
					{
						switch( SrcP[ -1 ] )
						{
						case 0 :
							for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
							{
								DestP[ 0 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 0 ] ;
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 3 ] = SrcP[ 1 ] ;
							}
							break ;

						case 1 :
							DestP[ 0 ] = SrcP[ 0 ] ;
							DestP[ 1 ] = SrcP[ 0 ] ;
							DestP[ 2 ] = SrcP[ 0 ] ;
							DestP[ 3 ] = SrcP[ 1 ] ;

							SrcP += 2 ;
							DestP += 4 ;

							for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
							{
								DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - 4 )[ 3 ] ) ) ;
							}
							break ;

						case 2 :
							if( i == 0 )
							{
								for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 0 ] ;
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 3 ] = SrcP[ 1 ] ;
								}
							}
							else
							{
								for( j = 0 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
								{
									DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - DestPitch )[ 3 ] ) ) ;
								}
							}
							break ;

						case 3 :
							if( i == 0 )
							{
								DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = SrcP[ 0 ] ;
								DestP[ 3 ] = SrcP[ 1 ] ;

								SrcP += 2 ;
								DestP += 4 ;
								for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
								{
									DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 4 )[ 0 ] / 2 ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( DestP - 4 )[ 3 ] / 2 ) ;
								}
							}
							else
							{
								DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - DestPitch )[ 3 ] ) / 2 ) ;

								SrcP += 2 ;
								DestP += 4 ;
								for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
								{
									DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - 4 )[ 3 ] + ( DestP - DestPitch )[ 3 ] ) / 2 ) ;
								}
							}
							break ;

						case 4 :
							if( i == 0 )
							{
								DestP[ 0 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 0 ] ;
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 3 ] = SrcP[ 1 ] ;

								SrcP += 2 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
								{
									DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - 4 )[ 3 ] ) ) ;
								}
							}
							else
							{
								int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

								DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 0 ] ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( DestP - DestPitch )[ 3 ] ) ;
								SrcP += 2 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 2, DestP += 4 )
								{
									BYTE *UpP = DestP - DestPitch ;
									BYTE *UpLeftP = DestP - DestPitch - 4 ;
									BYTE *LeftP = DestP - 4 ;
									{
										PAETH_CODE( 0 )

										DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
									}
									{
										PAETH_CODE( 3 )

										DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 1 ] + result ) ;
									}
								}
							}
							break ;
						}
					}
				}
				else
				if( BitDepth == 16 )
				{
					for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
					{
						switch( SrcP[ -1 ] )
						{
						case 0 :
							for( j = 0 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
							{
								DestP[ 0 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 0 ] ;
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 3 ] = SrcP[ 2 ] ;
							}
							break ;

						case 1 :
							DestP[ 0 ] = SrcP[ 0 ] ;
							DestP[ 1 ] = SrcP[ 0 ] ;
							DestP[ 2 ] = SrcP[ 0 ] ;
							DestP[ 3 ] = SrcP[ 2 ] ;

							SrcP += 4 ;
							DestP += 4 ;

							for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
							{
								DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 3 ] ) ) ;
							}
							break ;

						case 2 :
							if( i == 0 )
							{
								for( j = 0 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 0 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 0 ] ;
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 3 ] = SrcP[ 2 ] ;
								}
							}
							else
							{
								for( j = 0 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - DestPitch )[ 3 ] ) ) ;
								}
							}
							break ;

						case 3 :
							if( i == 0 )
							{
								DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = SrcP[ 0 ] ;
								DestP[ 3 ] = SrcP[ 2 ] ;

								SrcP += 4 ;
								DestP += 4 ;
								for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 4 )[ 0 ] / 2 ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - 4 )[ 3 ] / 2 ) ;
								}
							}
							else
							{
								DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - DestPitch )[ 3 ] ) / 2 ) ;

								SrcP += 4 ;
								DestP += 4 ;
								for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - 4 )[ 3 ] + ( DestP - DestPitch )[ 3 ] ) / 2 ) ;
								}
							}
							break ;

						case 4 :
							if( i == 0 )
							{
								DestP[ 0 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 0 ] ;
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 3 ] = SrcP[ 2 ] ;

								SrcP += 4 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 3 ] ) ) ;
								}
							}
							else
							{
								int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

								DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 0 ] ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - DestPitch )[ 3 ] ) ;
								SrcP += 4 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									BYTE *UpP = DestP - DestPitch ;
									BYTE *UpLeftP = DestP - DestPitch - 4 ;
									BYTE *LeftP = DestP - 4 ;
									{
										PAETH_CODE( 0 )

										DestP[ 2 ] = DestP[ 1 ] = DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
									}
									{
										PAETH_CODE( 3 )

										DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 2 ] + result ) ;
									}
								}
							}
							break ;
						}
					}
				}
				break ;

			case 6 :	// RGBA
				if( BitDepth == 8 )
				{
					for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
					{
						switch( SrcP[ -1 ] )
						{
						case 0 :
							for( j = 0 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
							{
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 1 ] ;
								DestP[ 0 ] = SrcP[ 2 ] ;
								DestP[ 3 ] = SrcP[ 3 ] ;
							}
							break ;

						case 1 :
							DestP[ 2 ] = SrcP[ 0 ] ;
							DestP[ 1 ] = SrcP[ 1 ] ;
							DestP[ 0 ] = SrcP[ 2 ] ;
							DestP[ 3 ] = SrcP[ 3 ] ;

							SrcP += 4 ;
							DestP += 4 ;

							for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
							{
								DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 2 ] ) ) ;
								DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - 4 )[ 1 ] ) ) ;
								DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 3 ] + ( int )( ( DestP - 4 )[ 3 ] ) ) ;
							}
							break ;

						case 2 :
							if( i == 0 )
							{
								for( j = 0 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 1 ] ;
									DestP[ 0 ] = SrcP[ 2 ] ;
									DestP[ 3 ] = SrcP[ 3 ] ;
								}
							}
							else
							{
								for( j = 0 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 2 ] ) ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - DestPitch )[ 1 ] ) ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 3 ] + ( int )( ( DestP - DestPitch )[ 3 ] ) ) ;
								}
							}
							break ;

						case 3 :
							if( i == 0 )
							{
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 1 ] ;
								DestP[ 0 ] = SrcP[ 2 ] ;
								DestP[ 3 ] = SrcP[ 3 ] ;

								SrcP += 4 ;
								DestP += 4 ;
								for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 2 ] ) / 2 ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - 4 )[ 1 ] ) / 2 ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - 4 )[ 0 ] ) / 2 ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 3 ] + ( ( DestP - 4 )[ 3 ] ) / 2 ) ;
								}
							}
							else
							{
								DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
								DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
								DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 3 ] + ( ( DestP - DestPitch )[ 3 ] ) / 2 ) ;

								SrcP += 4 ;
								DestP += 4 ;
								for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 2 ] + ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( ( DestP - 4 )[ 1 ] + ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - 4 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 3 ] + ( ( DestP - 4 )[ 3 ] + ( DestP - DestPitch )[ 3 ] ) / 2 ) ;
								}
							}
							break ;

						case 4 :
							if( i == 0 )
							{
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 1 ] ;
								DestP[ 0 ] = SrcP[ 2 ] ;
								DestP[ 3 ] = SrcP[ 3 ] ;

								SrcP += 4 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 2 ] ) ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( int )( ( DestP - 4 )[ 1 ] ) ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 3 ] + ( int )( ( DestP - 4 )[ 3 ] ) ) ;
								}
							}
							else
							{
								int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

								DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 2 ] ) ;
								DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + ( DestP - DestPitch )[ 1 ] ) ;
								DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - DestPitch )[ 0 ] ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 3 ] + ( DestP - DestPitch )[ 3 ] ) ;
								SrcP += 4 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 4, DestP += 4 )
								{
									BYTE *UpP = DestP - DestPitch ;
									BYTE *UpLeftP = DestP - DestPitch - 4 ;
									BYTE *LeftP = DestP - 4 ;
									PAETH_CODE( 2 )	DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
									PAETH_CODE( 1 )	DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 1 ] + result ) ;
									PAETH_CODE( 0 )	DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 2 ] + result ) ;
									PAETH_CODE( 3 )	DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 3 ] + result ) ;
								}
							}
							break ;
						}
					}
				}
				else
				if( BitDepth == 16 )
				{
					for( i = 0 ; i < Height ; i ++, SrcP += SrcAddPitch, DestP += DestAddPitch )
					{
						switch( SrcP[ -1 ] )
						{
						case 0 :
							for( j = 0 ; j < Width ; j ++, SrcP += 8, DestP += 4 )
							{
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 2 ] ;
								DestP[ 0 ] = SrcP[ 4 ] ;
								DestP[ 3 ] = SrcP[ 6 ] ;
							}
							break ;

						case 1 :
							DestP[ 2 ] = SrcP[ 0 ] ;
							DestP[ 1 ] = SrcP[ 2 ] ;
							DestP[ 0 ] = SrcP[ 4 ] ;
							DestP[ 3 ] = SrcP[ 6 ] ;

							SrcP += 8 ;
							DestP += 4 ;

							for( j = 1 ; j < Width ; j ++, SrcP += 8, DestP += 4 )
							{
								DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 2 ] ) ) ;
								DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 1 ] ) ) ;
								DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 6 ] + ( int )( ( DestP - 4 )[ 3 ] ) ) ;
							}
							break ;

						case 2 :
							if( i == 0 )
							{
								for( j = 0 ; j < Width ; j ++, SrcP += 8, DestP += 4 )
								{
									DestP[ 2 ] = SrcP[ 0 ] ;
									DestP[ 1 ] = SrcP[ 2 ] ;
									DestP[ 0 ] = SrcP[ 4 ] ;
									DestP[ 3 ] = SrcP[ 6 ] ;
								}
							}
							else
							{
								for( j = 0 ; j < Width ; j ++, SrcP += 8, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - DestPitch )[ 2 ] ) ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - DestPitch )[ 1 ] ) ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - DestPitch )[ 0 ] ) ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 6 ] + ( int )( ( DestP - DestPitch )[ 3 ] ) ) ;
								}
							}
							break ;

						case 3 :
							if( i == 0 )
							{
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 2 ] ;
								DestP[ 0 ] = SrcP[ 4 ] ;
								DestP[ 3 ] = SrcP[ 6 ] ;

								SrcP += 8 ;
								DestP += 4 ;
								for( j = 1 ; j < Width ; j ++, SrcP += 8, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - 4 )[ 2 ] / 2 ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - 4 )[ 1 ] / 2 ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( DestP - 4 )[ 0 ] / 2 ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 6 ] + ( DestP - 4 )[ 3 ] / 2 ) ;
								}
							}
							else
							{
								DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
								DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
								DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 6 ] + ( ( DestP - DestPitch )[ 3 ] ) / 2 ) ;

								SrcP += 8 ;
								DestP += 4 ;
								for( j = 1 ; j < Width ; j ++, SrcP += 8, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( ( DestP - 4 )[ 2 ] + ( DestP - DestPitch )[ 2 ] ) / 2 ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( ( DestP - 4 )[ 1 ] + ( DestP - DestPitch )[ 1 ] ) / 2 ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( ( DestP - 4 )[ 0 ] + ( DestP - DestPitch )[ 0 ] ) / 2 ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 6 ] + ( ( DestP - 4 )[ 3 ] + ( DestP - DestPitch )[ 3 ] ) / 2 ) ;
								}
							}
							break ;

						case 4 :
							if( i == 0 )
							{
								DestP[ 2 ] = SrcP[ 0 ] ;
								DestP[ 1 ] = SrcP[ 2 ] ;
								DestP[ 0 ] = SrcP[ 4 ] ;
								DestP[ 3 ] = SrcP[ 6 ] ;

								SrcP += 8 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 8, DestP += 4 )
								{
									DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( int )( ( DestP - 4 )[ 2 ] ) ) ;
									DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( int )( ( DestP - 4 )[ 1 ] ) ) ;
									DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( int )( ( DestP - 4 )[ 0 ] ) ) ;
									DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 6 ] + ( int )( ( DestP - 4 )[ 3 ] ) ) ;
								}
							}
							else
							{
								int left, up, upleft, abs_up_upleft, abs_left_upleft, left_upleft, up_upleft, abs_up_upleft_left_upleft, result ;

								DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + ( DestP - DestPitch )[ 2 ] ) ;
								DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + ( DestP - DestPitch )[ 1 ] ) ;
								DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + ( DestP - DestPitch )[ 0 ] ) ;
								DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 6 ] + ( DestP - DestPitch )[ 3 ] ) ;
								SrcP += 8 ;
								DestP += 4 ;

								for( j = 1 ; j < Width ; j ++, SrcP += 8, DestP += 4 )
								{
									BYTE *UpP = DestP - DestPitch ;
									BYTE *UpLeftP = DestP - DestPitch - 4 ;
									BYTE *LeftP = DestP - 4 ;
									PAETH_CODE( 2 )	DestP[ 2 ] = ( BYTE )( ( int )SrcP[ 0 ] + result ) ;
									PAETH_CODE( 1 )	DestP[ 1 ] = ( BYTE )( ( int )SrcP[ 2 ] + result ) ;
									PAETH_CODE( 0 )	DestP[ 0 ] = ( BYTE )( ( int )SrcP[ 4 ] + result ) ;
									PAETH_CODE( 3 )	DestP[ 3 ] = ( BYTE )( ( int )SrcP[ 6 ] + result ) ;
								}
							}
							break ;
						}
					}
				}
				break ;
			}
		}

		if( FilterImage != NULL )
		{
			DXFREE( FilterImage ) ;
			FilterImage = NULL ;
		}
	}

	return 0 ;

ERR :
	if( ZStreamInit )
	{
		inflateEnd( &ZStream ) ;
		_MEMSET( &ZStream, 0, sizeof( ZStream ) ) ;
		ZStreamInit = 0 ;
	}

	if( FilterImage != NULL )
	{
		DXFREE( FilterImage ) ;
		FilterImage = NULL ;
	}

	if( BaseImage->GraphData != NULL )
	{
		DXFREE( BaseImage->GraphData ) ;
		BaseImage->GraphData = NULL ;
	}

	return -1 ;
}
#undef PAETH_CODE
#undef READ_4BYTE


#ifndef DX_NON_SAVEFUNCTION

static void png_general_flush( png_structp /* png_ptr */ )
{
}

static void png_general_write_data(png_structp png_ptr, png_bytep data, png_size_t length)
{
	DWORD_PTR fp ;

	fp = ( DWORD_PTR )png_get_io_ptr( png_ptr ) ;

	WriteOnlyFileAccessWrite( fp, data, length ) ;
}

int png_general_write_set( png_structp png_ptr, DWORD_PTR fp )
{
	// �R�[���o�b�N�֐��̃Z�b�g
	png_set_write_fn( png_ptr, ( void * )fp, png_general_write_data, png_general_flush ) ;

	// �I��
	return 0 ;
}

extern int SaveBaseImageToPngBase( const char *pFilePathW, const char *pFilePathA, BASEIMAGE *BaseImage, int CompressionLevel )
{
	DWORD_PTR fp ;
	png_structp png_ptr;
	png_infop   info_ptr;
	png_bytepp  buffer = NULL ;
	png_bytep   sample;
	int r, g, b, a, i, j;
	
	// �ۑ��p�̃t�@�C�����J��
	if( pFilePathW )
	{
		fp = WriteOnlyFileAccessOpenWCHAR( pFilePathW ) ;
	}
	else
	{
		char TempBuffer[ 1024 ] ;

		ConvString( pFilePathA, -1, CHAR_CHARCODEFORMAT, TempBuffer, sizeof( TempBuffer ), WCHAR_T_CHARCODEFORMAT ) ;
		fp = WriteOnlyFileAccessOpenWCHAR( TempBuffer ) ;
	}
	if( fp == 0 ) return -1;

	// �o�m�f�Ǘ����̍쐬
	png_ptr = png_create_write_struct( PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
	if( png_ptr == NULL ) return -1;

	// �摜���\���̂̍쐬
	info_ptr = png_create_info_struct(png_ptr);             // info_ptr�\���̂��m�ہE���������܂�
	if( info_ptr == NULL )
	{
		png_destroy_write_struct(&png_ptr, (png_infopp)NULL);
		return -1 ;
	}

	// �G���[���̏����Z�b�g�A�b�v����я���
	if( setjmp( png_jmpbuf( png_ptr ) ) )
	{
ERR:
		if( buffer )
		{
			for( i = 0; i < BaseImage->Height; i++ )
				if( buffer[i] ) DXFREE( buffer[i] );
			DXFREE( buffer );
		}
		if( fp ) WriteOnlyFileAccessClose( fp );
		png_destroy_write_struct( &png_ptr, &info_ptr );
		return -1 ;
	}

	png_general_write_set( png_ptr, fp ) ;

	// �J�����t�@�C���|�C���^���Z�b�g
//	png_init_io( png_ptr, fp );

	// �g�p����t�B���^�̃Z�b�g
	png_set_filter( png_ptr, 0, PNG_ALL_FILTERS );

	// ���k���x���̃Z�b�g
	png_set_compression_level( png_ptr, CompressionLevel );

	// IHDR�`�����N���̐ݒ�
	png_set_IHDR(
		png_ptr,
		info_ptr,
		( png_uint_32 )BaseImage->Width,
		( png_uint_32 )BaseImage->Height,
		8,
		BaseImage->ColorData.AlphaWidth ? PNG_COLOR_TYPE_RGBA : PNG_COLOR_TYPE_RGB,
		PNG_INTERLACE_NONE,
		PNG_COMPRESSION_TYPE_DEFAULT,
		PNG_FILTER_TYPE_DEFAULT
	) ;

	// �w�b�_�����̏����o��
	png_write_info( png_ptr, info_ptr );

	// ���k�p�f�[�^�̗p��
	{
		// �o�b�t�@�̊m��
		buffer = (png_bytepp)DXALLOC( sizeof( png_bytep ) * BaseImage->Height );
		if( buffer == NULL ) goto ERR;
		_MEMSET( buffer, 0, sizeof( png_bytep ) * BaseImage->Height );
		for( i = 0; i < BaseImage->Height; i++ )
		{
			buffer[i] = (png_bytep)DXALLOC( sizeof( png_byte ) * ( BaseImage->ColorData.AlphaWidth ? 4 : 3 ) * BaseImage->Width );
			if( buffer[i] == NULL ) goto ERR;
			sample = buffer[i];
			if( BaseImage->ColorData.AlphaWidth )
			{
				for( j = 0; j < BaseImage->Width; j ++, sample += 4 )
				{
					NS_GetPixelBaseImage( BaseImage, j, i, &r, &g, &b, &a );
					sample[0] = (png_byte)r;
					sample[1] = (png_byte)g;
					sample[2] = (png_byte)b;
					sample[3] = (png_byte)a;
				}
			}
			else
			{
				for( j = 0; j < BaseImage->Width; j ++, sample += 3 )
				{
					NS_GetPixelBaseImage( BaseImage, j, i, &r, &g, &b, &a );
					sample[0] = (png_byte)r;
					sample[1] = (png_byte)g;
					sample[2] = (png_byte)b;
				}
			}
		}
	}

	// �C���[�W�̏����o��
	png_write_image( png_ptr, buffer );

	// �t�b�_�����̏����o��
	png_write_end( png_ptr, info_ptr );

	// �\���̂̌�n��
	png_destroy_write_struct( &png_ptr, &info_ptr );

	// �t�@�C�������
	WriteOnlyFileAccessClose( fp ) ;

	// �������̉��
	for( i = 0; i < BaseImage->Height; i++ )
		if( buffer[i] ) DXFREE( buffer[i] );
	DXFREE( buffer );

	// ����I��
	return 0 ;
}

#endif // DX_NON_SAVEFUNCTION
#endif // DX_NON_PNGREAD








// �i�o�d�f������������ǂݍ��ނ��߂̃v���O����
#ifndef DX_NON_JPEGREAD

// (�w�� jdatasrc.c �̗��p)
#include "jpeglib.h"
#include "jerror.h"

// �i�o�d�f�ǂ݂��݃G���[���������[�`���p�\����
typedef struct my_error_mgr {
	struct jpeg_error_mgr pub;	// �W���G���[�f�[�^

	jmp_buf setjmp_buffer;		// �����O�W�����v�p�\����
} *my_error_ptr ;

// �G���[���ɌĂ΂��֐�
void my_error_exit( j_common_ptr cinfo )
{
	// cinfo->err�������W���G���[�f�[�^�̐擪�A�h���X��my_error_mgr�\���̂̐擪�A�h���X�ɕϊ�
	my_error_ptr myerr = (my_error_ptr) cinfo->err;

	// �����܂���悭�킩��܂���A�Ƃ肠�����G���[���b�Z�[�W�W���֐��H
	(*cinfo->err->output_message) (cinfo);

	// ���[�U�[�����߂��G���[�����R�[�h�̈ʒu�܂Ŕ��
	longjmp( myerr->setjmp_buffer, 1 ) ;
}


// �ėp�f�[�^�`���̓]���p�\����
typedef struct
{
	struct jpeg_source_mgr pub;		/* public fields */

	JOCTET *buffer;					/* start of buffer */
	boolean start_of_file;			/* have we gotten any data yet? */

	STREAMDATA *Data ;				// �ėp�f�[�^�`���ǂݍ��ݏ����p�\����
	int DataSize ;					// �f�[�^�̃T�C�Y
} my_source_general_mgr;

typedef my_source_general_mgr	*my_src_general_ptr;

#define INPUT_BUF_SIZE		(4096)	// ��Ɨp�o�b�t�@�̃T�C�Y

// �ǂݍ��ރ\�[�X������������֐�
METHODDEF(void)
init_source_general( j_decompress_ptr cinfo )
{
	my_src_general_ptr src = (my_src_general_ptr) cinfo->src;

	// �t�@�C���ǂݍ��݊J�n�̃t���O�𗧂Ă�
	src->start_of_file = TRUE;
}

// �f�[�^�o�b�t�@�Ƀf�[�^��]������
METHODDEF(boolean)
fill_input_buffer_general (j_decompress_ptr cinfo)
{
	my_src_general_ptr src = (my_src_general_ptr) cinfo->src;
	size_t nbytes;

	// �]������f�[�^�̗ʂ��R�s�[����
	nbytes = ( size_t )( ( src->DataSize - STTELL( src->Data ) < INPUT_BUF_SIZE ) ?
			 src->DataSize - STTELL( src->Data ) : INPUT_BUF_SIZE ) ;
	if( nbytes != 0 ) STREAD( src->buffer, nbytes, 1, src->Data ) ;

	// �ǂݍ��݂Ɏ��s������G���[
	if( nbytes <= 0 )
	{
		if (src->start_of_file)	/* Treat empty input file as fatal error */
			ERREXIT(cinfo, JERR_INPUT_EMPTY);
		WARNMS(cinfo, JWRN_JPEG_EOF);

		/* Insert a fake EOI marker */
	    src->buffer[0] = (JOCTET) 0xFF;
		src->buffer[1] = (JOCTET) JPEG_EOI;
		nbytes = 2;
	}

	// ���̑��̏���
	src->pub.next_input_byte = src->buffer;
	src->pub.bytes_in_buffer = nbytes;
	src->start_of_file = FALSE;

	return TRUE;
}

// �w�肳�ꂽ�T�C�Y�̃f�[�^���X�L�b�v���鏈��
METHODDEF(void)
skip_input_data_general( j_decompress_ptr cinfo, long num_bytes)
{
	my_src_general_ptr src = (my_src_general_ptr) cinfo->src;

	// �f�[�^�X�L�b�v����
	if( num_bytes > 0 )
	{
		while( num_bytes > (long) src->pub.bytes_in_buffer )
		{
			num_bytes -= (long) src->pub.bytes_in_buffer;
			(void) fill_input_buffer_general( cinfo ) ;
		}
		src->pub.next_input_byte += (size_t) num_bytes;
		src->pub.bytes_in_buffer -= (size_t) num_bytes;
	}
}

// �f�[�^�����Ƃ��̏���
METHODDEF(void)
term_source_general( j_decompress_ptr /*cinfo*/ )
{
  /* no work necessary here */
}

// �ėp�f�[�^�ǂݍ��ݏ�������f�[�^��ǂݍ��ނ悤�ɂ�����ۂ̐ݒ���s���֐�
GLOBAL(void)
jpeg_general_src (j_decompress_ptr cinfo, STREAMDATA *Data )
{
	my_src_general_ptr src;

	// �܂��i�o�d�f�f�[�^���ꎞ�I�Ɋi�[����o�b�t�@���m�ۂ��Ă��Ȃ�������m�ۂ���
	if (cinfo->src == NULL)
	{
		/* first time for this JPEG object? */
		cinfo->src = (struct jpeg_source_mgr *)
						(*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_PERMANENT,
						sizeof(my_source_general_mgr));
		src = (my_src_general_ptr) cinfo->src;
		src->buffer = (JOCTET *)
					(*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_PERMANENT,
					INPUT_BUF_SIZE * sizeof(JOCTET));
	}

	// �֐��|�C���^�Ȃǂ��Z�b�g����
	src = (my_src_general_ptr) cinfo->src;
	src->pub.init_source			= init_source_general ;
	src->pub.fill_input_buffer		= fill_input_buffer_general ;
	src->pub.skip_input_data		= skip_input_data_general ;
	src->pub.resync_to_restart		= jpeg_resync_to_restart ; /* use default method */
	src->pub.term_source			= term_source_general ;

	src->Data = Data ;

	// ���݂̃t�@�C���|�C���^����I�[�܂ł̃T�C�Y���擾����
	{
		long pos ;
		pos = ( long )STTELL( src->Data ) ;
		STSEEK( src->Data, 0, STREAM_SEEKTYPE_END ) ;
		src->DataSize = ( int )STTELL( src->Data ) - pos ;
		STSEEK( src->Data, pos, STREAM_SEEKTYPE_SET ) ;
	}

	src->pub.bytes_in_buffer = 0; /* forces fill_input_buffer on first read */
	src->pub.next_input_byte = NULL; /* until buffer loaded */
}

// �i�o�d�f�摜�̓ǂ݂���
extern int LoadJpegImage( STREAMDATA *Src, BASEIMAGE *BaseImage, int GetFormatOnly )
{
	return LoadJpegImageBase( Src, BaseImage, GetFormatOnly, FALSE, NULL, 0 ) ;
}
extern int LoadJpegImageBase( STREAMDATA *Src, BASEIMAGE *BaseImage, int GetFormatOnly, int GetExifOnly, void *ExifBuffer, size_t ExifBufferSize )
{
	struct jpeg_decompress_struct cinfo ;
	struct my_error_mgr jerr ;
	JSAMPARRAY buffer ;
	void *ImageData = NULL ;
	unsigned int InPitch ;
	unsigned int i ;
	unsigned int imgSize ;
	unsigned char *pImg ;
	unsigned int OutPitch ;
	unsigned char Check ;
	unsigned int PixelByte = 0 ;

	// �擪�̂P�o�C�g�� 0xFF �ł͂Ȃ�������JPEG�t�@�C���ł͂Ȃ�
	STREAD( &Check, 1, 1, Src ) ;
	STSEEK( Src, 0, STREAM_SEEKTYPE_SET ) ;
	if( Check != 0xff )
	{
		return -1 ;
	}
	
	// �ʏ�i�o�d�f�G���[���[�`���̃Z�b�g�A�b�v
	_MEMSET( &cinfo, 0, sizeof( cinfo ) );
	cinfo.err = jpeg_std_error(&jerr.pub);
	jerr.pub.error_exit = my_error_exit;
	if( setjmp( jerr.setjmp_buffer ) )
	{
		jpeg_destroy_decompress( &cinfo );
		return -1;
	}

	// cinfo���̃A���P�[�g�Ə��������s��
	jpeg_create_decompress(&cinfo);

	// �ėp�f�[�^�ǂݍ��ݏ�������f�[�^��ǂݍ��ސݒ���s��
	jpeg_general_src( &cinfo, Src ) ;

	// Exif �����擾���邽�߂̐ݒ���s��
	if( GetExifOnly == TRUE )
	{
		jpeg_save_markers( &cinfo, JPEG_APP0 + 1, 0xFFFF ) ;
	}

	// �i�o�d�f�t�@�C���̃p�����[�^���̓ǂ݂���
	(void)jpeg_read_header(&cinfo, TRUE);

	// Exif �����擾����ꍇ�͏����𕪊�
	if( GetExifOnly == TRUE )
	{
		int data_length ;

		// Exif��񂪂Ȃ�������G���[
		if( cinfo.marker_list == NULL ||
			cinfo.marker_list->marker != JPEG_APP0 + 1 ||
			cinfo.marker_list->data_length < 6 ||
			GETJOCTET( cinfo.marker_list->data[ 0 ] ) != 0x45 ||
			GETJOCTET( cinfo.marker_list->data[ 1 ] ) != 0x78 ||
			GETJOCTET( cinfo.marker_list->data[ 2 ] ) != 0x69 ||
			GETJOCTET( cinfo.marker_list->data[ 3 ] ) != 0x66 ||
			GETJOCTET( cinfo.marker_list->data[ 4 ] ) != 0 ||
			GETJOCTET( cinfo.marker_list->data[ 5 ] ) != 0 )
		{
			jpeg_destroy_decompress( &cinfo );
			return -1 ;
		}

		// ExifBuffer �� NULL �̏ꍇ�̓T�C�Y�̂ݕԂ�
		data_length = ( int )cinfo.marker_list->data_length ;
		if( ExifBuffer == NULL )
		{
			jpeg_destroy_decompress( &cinfo );
			return data_length ;
		}

		// ExifBufferSize �̃T�C�Y������Ȃ��ꍇ�̓G���[
		if( cinfo.marker_list->data_length > ExifBufferSize )
		{
			jpeg_destroy_decompress( &cinfo );
			return -1 ;
		}

		// Exif �����R�s�[
		_MEMCPY( ExifBuffer, cinfo.marker_list->data, cinfo.marker_list->data_length ) ;

		// Exif ���̃T�C�Y��Ԃ�
		jpeg_destroy_decompress( &cinfo );
		return data_length ;
	}

	if( GetFormatOnly == FALSE )
	{
		// �i�o�d�f�t�@�C���̉𓀂̊J�n
		(void)jpeg_start_decompress(&cinfo);

		// �P���C��������̃f�[�^�o�C�g�����v�Z
		PixelByte = ( unsigned int )( cinfo.output_components == 4 ? 3 : cinfo.output_components ) ;
		InPitch   = cinfo.output_width * cinfo.output_components ;
		OutPitch  = cinfo.output_width * PixelByte ;

		// �f�[�^�o�b�t�@�̊m��
		buffer = (*cinfo.mem->alloc_sarray)
					((j_common_ptr) &cinfo, JPOOL_IMAGE, InPitch, 1 );

		// �o�̓C���[�W�f�[�^�T�C�Y�̃Z�b�g�A�y�уf�[�^�̈�̊m��
		imgSize = cinfo.output_height * OutPitch ;
		if( ( ImageData = ( unsigned char * ) DXALLOC( imgSize ) ) == NULL )
		{
			jpeg_destroy_decompress( &cinfo );
			return -1 ;
		}
		
		// �摜�f�[�^�̓ǂ݂���
		pImg = ( unsigned char * )ImageData ; 
		while( cinfo.output_scanline < cinfo.output_height )
		{
			(void) jpeg_read_scanlines(&cinfo, buffer, 1);

			// �f�[�^���o�̓f�[�^�ɕϊ����āA�܂��͂��̂܂ܓ]��
			switch( cinfo.output_components )
			{
			case 1 :	// �O���[�X�P�[��
				for( i = 0 ; i < InPitch ; )
				{
					*pImg = *( buffer[0] + i ) ; pImg ++ ;
					i ++ ;
				}
				break ;

			case 3 :	// RGB
				for( i = 0 ; i < InPitch ; )
				{
					*pImg = *( buffer[0] + i + 2 ) ; pImg ++ ;
					*pImg = *( buffer[0] + i + 1 ) ; pImg ++ ;
					*pImg = *( buffer[0] + i     ) ; pImg ++ ;
					i += 3 ;
				}
				break ;

			case 4 :	// CMYK?
				for( i = 0 ; i < InPitch ; )
				{
					pImg[ 0 ] = ( unsigned char )( *( buffer[0] + i + 2 ) * *( buffer[0] + i + 3 ) / 255 ) ;
					pImg[ 1 ] = ( unsigned char )( *( buffer[0] + i + 1 ) * *( buffer[0] + i + 3 ) / 255 ) ;
					pImg[ 2 ] = ( unsigned char )( *( buffer[0] + i + 0 ) * *( buffer[0] + i + 3 ) / 255 ) ;
					pImg += 3 ;
					i += 4 ;
				}
				break ;
			}
		}

		// �𓀏����̏I��
		(void) jpeg_finish_decompress(&cinfo);

		BaseImage->Width     = ( int )cinfo.output_width ;
		BaseImage->Height    = ( int )cinfo.output_height ;
		BaseImage->Pitch     = ( int )OutPitch ;
	}
	else
	{
		BaseImage->Width     = ( int )cinfo.image_width ;
		BaseImage->Height    = ( int )cinfo.image_height ;
		BaseImage->Pitch     = 0 ;
	}

	// BASEIMAGE �\���̂̃f�[�^���l�߂�
	{
		BaseImage->GraphData = ImageData ;

		// �J���[�����Z�b�g����
		switch( PixelByte )
		{
		case 1 :
			NS_CreateGrayColorData( &BaseImage->ColorData ) ;
			break ;

		case 3 :
			NS_CreateFullColorData( &BaseImage->ColorData ) ;
			break ;
		}
	}

	// cinfo�\���̂̉��
	jpeg_destroy_decompress(&cinfo);

	// �I��
	return 0 ;
}

#ifndef DX_NON_SAVEFUNCTION

#define OUTPUT_BUF_SIZE  4096	/* choose an efficiently fwrite'able size */

/* Expanded data destination object for stdio output */

typedef struct {
  struct jpeg_destination_mgr pub; /* public fields */

  DWORD_PTR outfile;	/* target stream */
  JOCTET * buffer;		/* start of buffer */
} my_destination_mgr;

typedef my_destination_mgr * my_dest_ptr;

METHODDEF(void)
init_destination_general (j_compress_ptr cinfo)
{
  my_dest_ptr dest = (my_dest_ptr) cinfo->dest;

  /* Allocate the output buffer --- it will be released when done with image */
  dest->buffer = (JOCTET *)
      (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_IMAGE,
				  OUTPUT_BUF_SIZE * sizeof(JOCTET));

  dest->pub.next_output_byte = dest->buffer;
  dest->pub.free_in_buffer = OUTPUT_BUF_SIZE;
}

METHODDEF(boolean)
empty_output_buffer_general (j_compress_ptr cinfo)
{
  my_dest_ptr dest = (my_dest_ptr) cinfo->dest;

  WriteOnlyFileAccessWrite(dest->outfile, dest->buffer, OUTPUT_BUF_SIZE);

  dest->pub.next_output_byte = dest->buffer;
  dest->pub.free_in_buffer = OUTPUT_BUF_SIZE;

  return TRUE;
}

METHODDEF(void)
term_destination_general (j_compress_ptr cinfo)
{
  my_dest_ptr dest = (my_dest_ptr) cinfo->dest;
  size_t datacount = OUTPUT_BUF_SIZE - dest->pub.free_in_buffer;

  /* Write any data remaining in the buffer */
  if (datacount > 0) {
    WriteOnlyFileAccessWrite(dest->outfile, dest->buffer, datacount);
  }
}

GLOBAL(void)
jpeg_general_dest (j_compress_ptr cinfo, DWORD_PTR outfile)
{
   my_dest_ptr dest;

  /* The destination object is made permanent so that multiple JPEG images
   * can be written to the same file without re-executing jpeg_stdio_dest.
   * This makes it dangerous to use this manager and a different destination
   * manager serially with the same JPEG object, because their private object
   * sizes may be different.  Caveat programmer.
   */
  if (cinfo->dest == NULL) {	/* first time for this JPEG object? */
    cinfo->dest = (struct jpeg_destination_mgr *)
      (*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_PERMANENT,
				  sizeof(my_destination_mgr));
  }

  dest = (my_dest_ptr) cinfo->dest;
  dest->pub.init_destination = init_destination_general;
  dest->pub.empty_output_buffer = empty_output_buffer_general;
  dest->pub.term_destination = term_destination_general;
  dest->outfile = outfile;
}

extern int SaveBaseImageToJpegBase( const char *pFilePathW, const char *pFilePathA, BASEIMAGE *BaseImage, int Quality, int /*Sample2x1*/ )
{
	struct jpeg_compress_struct cinfo ;
	struct my_error_mgr jerr ;
	DWORD_PTR fp = 0;
	JSAMPARRAY buffer = 0;
	JSAMPROW sample;
	int i, j, r, g, b, a;

	// �ۑ��p�̃t�@�C�����J��
	if( pFilePathW )
	{
		fp = WriteOnlyFileAccessOpenWCHAR( pFilePathW ) ;
	}
	else
	{
		char TempBuffer[ 1024 ] ;

		ConvString( pFilePathA, -1, CHAR_CHARCODEFORMAT, TempBuffer, sizeof( TempBuffer ), WCHAR_T_CHARCODEFORMAT ) ;
		fp = WriteOnlyFileAccessOpenWCHAR( TempBuffer ) ;
	}
	if( fp == 0 ) return -1;

	// �ʏ�i�o�d�f�G���[���[�`���̃Z�b�g�A�b�v
	_MEMSET( &cinfo, 0, sizeof( cinfo ) );
	cinfo.err = jpeg_std_error(&jerr.pub);
	jerr.pub.error_exit = my_error_exit;
	if( setjmp( jerr.setjmp_buffer ) )
	{
ERR:
		if( buffer )
		{
			for( i = 0; i < BaseImage->Height; i++ )
				if( buffer[i] ) DXFREE( buffer[i] );
			DXFREE( buffer );
		}

		if( fp ) WriteOnlyFileAccessClose( fp );
		jpeg_destroy_compress( &cinfo );
		return -1;
	}

	// cinfo���̃A���P�[�g�Ə��������s��
	jpeg_create_compress( &cinfo );

	// �o�̓t�@�C���̃|�C���^���Z�b�g
	jpeg_general_dest( &cinfo, fp ) ;
//	jpeg_stdio_dest( &cinfo, fp );

	// �o�͉摜�̏���ݒ肷��
	cinfo.image_width      = ( JDIMENSION )BaseImage->Width;
	cinfo.image_height     = ( JDIMENSION )BaseImage->Height;
	cinfo.input_components = 3;
	cinfo.in_color_space   = JCS_RGB;
	jpeg_set_defaults( &cinfo );

	// �掿��ݒ�
	jpeg_set_quality( &cinfo, Quality, TRUE );

	// ���k�����J�n
	jpeg_start_compress( &cinfo, TRUE );

	// ���k�p�f�[�^�̗p��
	{
		// �o�b�t�@�̊m��
		buffer = (JSAMPARRAY)DXALLOC( sizeof( JSAMPROW ) * BaseImage->Height );
		if( buffer == NULL ) goto ERR;
		_MEMSET( buffer, 0, sizeof( JSAMPROW ) * BaseImage->Height );
		for( i = 0; i < BaseImage->Height; i++ )
		{
			buffer[i] = (JSAMPROW)DXALLOC( sizeof( JSAMPLE ) * 3 * BaseImage->Width );
			if( buffer[i] == NULL ) goto ERR;
			sample = buffer[i];
			for( j = 0; j < BaseImage->Width; j ++, sample += 3 )
			{
				NS_GetPixelBaseImage( BaseImage, j, i, &r, &g, &b, &a );
				sample[0] = (JSAMPLE)r;
				sample[1] = (JSAMPLE)g;
				sample[2] = (JSAMPLE)b;
			}
		}
	}

	// ���k
	jpeg_write_scanlines( &cinfo, buffer, ( JDIMENSION )BaseImage->Height );

	// ���k�I��
	jpeg_finish_compress( &cinfo );

	// ��n��
	jpeg_destroy_compress( &cinfo );

	// �t�@�C�������
	WriteOnlyFileAccessClose( fp );

	// �f�[�^�̉��
	for( i = 0; i < BaseImage->Height; i++ )
		DXFREE( buffer[i] );
	DXFREE( buffer );

	// ����I��
	return 0;
}

#endif // DX_NON_SAVEFUNCTION

#endif // DX_NON_JPEGREAD






#ifndef DX_NON_MERSENNE_TWISTER

//=====================================================================================
//   Copyright (C) 1997 - 2002, Makoto Matsumoto and Takuji Nishimura,
// 
// ���L�̃v���O�����͏��{�l�Ɛ����l���쐬���ꂽ�v���O���������� SYN�l ��
// �l�l�w���g�p������ǂ��s��ꂽ Mersenne Twister �@�^�����������v���O������
// �X�� BorlandC++ Compiler �ł��R���p�C���o����悤�ɂ����o�[�W����

/* Period parameters */
#define N 624
#define M 397
#define MATRIX_A 0x9908b0df   /* constant vector a */
#define UPPER_MASK 0x80000000 /* most significant w-r bits */
#define LOWER_MASK 0x7fffffff /* least significant r bits */

/* Tempering parameters */
#define TEMPERING_MASK_B 0x9d2c5680
#define TEMPERING_MASK_C 0xefc60000
#define TEMPERING_SHIFT_U(y)  (y >> 11)
#define TEMPERING_SHIFT_S(y)  (y << 7)
#define TEMPERING_SHIFT_T(y)  (y << 15)
#define TEMPERING_SHIFT_L(y)  (y >> 18)

/* Static member */
int mti;                   /* index number */
unsigned int mt[N + 1];   /* the array for the state vector */
unsigned int mtr[N];      /* the array for the random number */
unsigned int bInitialized = 0;
unsigned int bMMX = 0;

/* Prototype */
//#ifndef DX_NON_INLINE_ASM
//unsigned int CheckMMX(void);
//#endif
//void srandMT(unsigned long seed);
#ifdef DX_NON_INLINE_ASM
void generateMT_C(void);
#endif
//unsigned int randMT(void);


void srandMT(unsigned int seed)
{
    int i;

    for(i = 0; i < N; i++){
         mt[i] = seed & 0xffff0000;
         seed = 69069 * seed + 1;
         mt[i] |= (seed & 0xffff0000) >> 16;
         seed = 69069 * seed + 1;
    }

#ifndef DX_NON_INLINE_ASM
    bMMX = CheckMMX();
#else
	bMMX = 0;
#endif
    bInitialized = 1;
#ifndef DX_NON_INLINE_ASM
    generateMT();
#else
    generateMT_C();
#endif
}

#ifndef DX_NON_INLINE_ASM

#ifdef BC_COMPILER
	#define cpuid __emit__(0xf) ; __emit__(0xa2) ;
#else
	#define cpuid __asm __emit 0fh __asm __emit 0a2h
#endif

unsigned int CheckMMX(void)
{
    unsigned int flag = 0;
	
    _asm{
        push    edx
        push    ecx
        pushfd
        pop     eax
        xor     eax, 00200000h
        push    eax
        popfd
        pushfd
        pop     ebx
        cmp     eax, ebx
        jnz     non_mmx
        mov     eax, 0
	}
//		db 0fh
//		db 0a2h
        cpuid
	__asm{
        cmp     eax, 0
        jz      non_mmx
        mov     eax, 1
	}
//		db 0fh
//		db 0a2h
	    cpuid
    __asm{
        and     edx, 00800000h
        jz      non_mmx
        mov     flag, 1
        non_mmx:
        pop     ecx
        pop     edx
    }

    return(flag);
}

/* MMX version */
void MMX_generateMT(void)
{
    _asm{
#ifdef BC_COMPILER
//PMMX // Borland C++ 5.6.4 for Win32 Copyright (c) 1993, 2002 Borland	�ł͗v��Ȃ��Ȃ����悤�ł�
#endif
        mov         eax, MATRIX_A
        movd        mm4, eax
        punpckldq   mm4, mm4
        mov         eax, 1
        movd        mm5, eax
        punpckldq   mm5, mm5
        movq        mm6, mm5
        psllq       mm6, 31     /* UPPER_MASK */
        movq        mm7, mm6
        psubd       mm7, mm5    /* LOWER_MASK */

        lea         esi, mt
        add         esi, ((N-M)/2)*8
        mov         edi, esi
        add         edi, M*4
        
        mov         ecx, -((N-M)/2)
        /* 8clocks */
        movq        mm0, [esi+ecx*8]
        pand        mm0, mm6
        movq        mm1, [esi+ecx*8+4]
        movq        mm2, [edi+ecx*8]
        pand        mm1, mm7
    loop0:
        por         mm0, mm1
        movq        mm3, mm1
        psrld       mm0, 1
        pand        mm3, mm5
        pxor        mm2, mm0
        psubd       mm3, mm5
        movq        mm0, [esi+ecx*8+8]
        pandn       mm3, mm4
        movq        mm1, [esi+ecx*8+12]
        pxor        mm3, mm2
        movq        mm2, [edi+ecx*8+8]
        pand        mm0, mm6
        movq        [esi+ecx*8], mm3
        pand        mm1, mm7
        inc         ecx
        jnz         loop0
        /**/
        mov         eax, [esi]
        mov         ebx, [esi+4]
        and         eax, UPPER_MASK
        and         ebx, LOWER_MASK
        mov         edx, [edi]
        or          eax, ebx
        shr         eax, 1
        or          ebx, 0xfffffffe
        xor         eax, edx
        add         ebx, 1
        xor         eax, MATRIX_A
        and         ebx, MATRIX_A
        xor         ebx, eax
        mov         [esi], ebx
        /**/

        lea         esi, mt
        mov         eax, [esi] /* mt[N] = mt[0]; */
        add         esi, N*4
        mov         [esi], eax /* mt[N] = mt[0]; */

        mov         edi, esi
        sub         edi, (N-M)*4
        add         esi, 4
        add         edi, 4
        
        mov         ecx, -((M+1)/2) /* overrun */
        /* 8clocks */
        movq        mm0, [esi+ecx*8]
        pand        mm0, mm6
        movq        mm1, [esi+ecx*8+4]
        movq        mm2, [edi+ecx*8]
        pand        mm1, mm7
    loop1:
        por         mm0, mm1
        movq        mm3, mm1
        psrld       mm0, 1
        pand        mm3, mm5
        pxor        mm2, mm0
        psubd       mm3, mm5
        movq        mm0, [esi+ecx*8+8]
        pandn       mm3, mm4
        movq        mm1, [esi+ecx*8+12]
        pxor        mm3, mm2
        movq        mm2, [edi+ecx*8+8]
        pand        mm0, mm6
        movq        [esi+ecx*8], mm3
        pand        mm1, mm7
        inc         ecx
        jnz         loop1
        /**/

        push        ebp

        mov         eax, TEMPERING_MASK_B
        movd        mm6, eax
        punpckldq   mm6, mm6
        mov         eax, TEMPERING_MASK_C
        movd        mm7, eax
        punpckldq   mm7, mm7

        lea         esi, mt
        lea         edi, mtr
        add         esi, N*4
        add         edi, N*4
        mov         ecx, -N/2
        /* 17clocks */
        movq        mm0, [esi+ecx*8]
        movq        mm1, mm0
        psrld       mm0, 11
        pxor        mm0, mm1
        movq        mm2, [esi+ecx*8+8]
    loop2:
        movq        mm1, mm0
        pslld       mm0, 7
        movq        mm3, mm2
        psrld       mm2, 11
        pand        mm0, mm6
        pxor        mm2, mm3
        pxor        mm0, mm1
        movq        mm3, mm2
        pslld       mm2, 7
        movq        mm1, mm0
        pslld       mm0, 15
        pand        mm2, mm6
        pand        mm0, mm7
        pxor        mm2, mm3
        pxor        mm0, mm1
        movq        mm3, mm2
        pslld       mm2, 15
        movq        mm1, mm0
        pand        mm2, mm7
        psrld       mm0, 18
        pxor        mm2, mm3
        pxor        mm1, mm0
        movq        mm0, [esi+ecx*8+16]
        movq        mm3, mm2
        movq        [edi+ecx*8], mm1
        psrld       mm2, 18
        movq        mm1, mm0
        pxor        mm3, mm2
        movq        mm2, [esi+ecx*8+24]
        psrld       mm0, 11
        movq        [edi+ecx*8+8], mm3
        pxor        mm0, mm1
        add         ecx, 2
        jnz         loop2
        /**/

        pop         ebp
        emms
#ifdef BC_COMPILER
//PNOMMX // Borland C++ 5.6.4 for Win32 Copyright (c) 1993, 2002 Borland	�ł͗v��Ȃ��Ȃ����悤�ł�
#endif
    }
    mti = 0;
}

/* Non MMX version */
void generateMT(void)
{
    if(bMMX){
        MMX_generateMT();
        return;
    }

    _asm{
        lea     esi, mt
        add     esi, (N-M)*4
        mov     edi, esi
        add     edi, M*4
        
        mov     ecx, -(N-M)
        /* 8clocks */
        mov     eax, [esi+ecx*4]
        mov     ebx, [esi+ecx*4+4]
    loop0_a:
        and     eax, UPPER_MASK
        and     ebx, LOWER_MASK
        mov     edx, [edi+ecx*4]
        or      eax, ebx
        shr     eax, 1
        or      ebx, 0xfffffffe
        xor     eax, edx
        add     ebx, 1
        xor     eax, MATRIX_A
        and     ebx, MATRIX_A
        xor     ebx, eax
        mov     eax, [esi+ecx*4+4]
        mov     [esi+ecx*4], ebx
        mov     ebx, [esi+ecx*4+8]
        inc     ecx
        jnz     loop0_a
        /**/

        lea     esi, mt
        mov     eax, [esi] /* mt[N] = mt[0]; */
        add     esi, N*4
        mov     [esi], eax /* mt[N] = mt[0]; */
        mov     edi, esi
        sub     edi, (N-M)*4
        
        mov     ecx, -M
        /* 8clocks */
        mov     eax, [esi+ecx*4]
        mov     ebx, [esi+ecx*4+4]
    loop1_a:
        and     eax, UPPER_MASK
        and     ebx, LOWER_MASK
        mov     edx, [edi+ecx*4]
        or      eax, ebx
        shr     eax, 1
        or      ebx, 0xfffffffe
        xor     eax, edx
        add     ebx, 1
        xor     eax, MATRIX_A
        and     ebx, MATRIX_A
        xor     ebx, eax
        mov     eax, [esi+ecx*4+4]
        mov     [esi+ecx*4], ebx
        mov     ebx, [esi+ecx*4+8]
        inc     ecx
        jnz     loop1_a
        /**/

        push    ebp

        lea     esi, mt
        lea     edi, mtr
        add     esi, N*4
        add     edi, N*4
        mov     ecx, -N/2
        /* 17clocks */
        mov     eax, [esi+ecx*8]
    loop2_a:
        mov     edx, [esi+ecx*8+4]
        mov     ebx, eax
        shr     eax, 11
        mov     ebp, edx
        shr     edx, 11
        xor     eax, ebx
        xor     edx, ebp
        mov     ebx, eax
        shl     eax, 7
        mov     ebp, edx
        shl     edx, 7
        and     eax, TEMPERING_MASK_B
        and     edx, TEMPERING_MASK_B
        xor     eax, ebx
        xor     edx, ebp
        mov     ebx, eax
        shl     eax, 15
        mov     ebp, edx
        shl     edx, 15
        and     eax, TEMPERING_MASK_C
        and     edx, TEMPERING_MASK_C
        xor     eax, ebx
        xor     edx, ebp
        mov     ebx, eax
        shr     eax, 18
        mov     ebp, edx
        shr     edx, 18
        xor     eax, ebx
        xor     edx, ebp
        mov     [edi+ecx*8],   eax
        mov     [edi+ecx*8+4], edx
        mov     eax, [esi+ecx*8+8]
        inc     ecx
        jnz     loop2_a
        /**/

        pop     ebp
    }
    mti = 0;
}

#else

/* C version */
void generateMT_C(void)
{
    int kk;
    unsigned int y;
    static unsigned int mag01[2] = {0x0, MATRIX_A}; /* mag01[x] = x * MATRIX_A  for x=0,1 */
    
    for(kk = 0; kk < N - M; kk++){
        y = (mt[kk] & UPPER_MASK) | (mt[kk + 1] & LOWER_MASK);
        mt[kk] = mt[kk + M] ^ (y >> 1) ^ mag01[y & 0x1];
    }

    mt[N] = mt[0];

    for(; kk < N; kk++){
        y = (mt[kk] & UPPER_MASK) | (mt[kk + 1] & LOWER_MASK);
        mt[kk] = mt[kk + (M - N)] ^ (y >> 1) ^ mag01[y & 0x1];
    }

    for(kk = 0; kk < N; kk++){
        y = mt[kk];
        y ^= TEMPERING_SHIFT_U(y);
        y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
        y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
        y ^= TEMPERING_SHIFT_L(y);
        mtr[kk] = y;
    }
    mti = 0;
}

#endif


unsigned int randMT(void)
{
    if(mti >= N){
        if(!bInitialized) srandMT(4357);
#ifndef DX_NON_INLINE_ASM
        generateMT();
#else
		generateMT_C();
#endif
    }
    return mtr[mti++]; 
}
//=============================================================================

void generateMTData_C( MERSENNE_TWISTER_DATA *MTData )
{
    int kk;
    unsigned int y;
    static unsigned int mag01[2] = {0x0, MATRIX_A}; /* mag01[x] = x * MATRIX_A  for x=0,1 */
    
    for(kk = 0; kk < N - M; kk++){
        y = (MTData->mt[kk] & UPPER_MASK) | (MTData->mt[kk + 1] & LOWER_MASK);
        MTData->mt[kk] = MTData->mt[kk + M] ^ (y >> 1) ^ mag01[y & 0x1];
    }

    MTData->mt[N] = MTData->mt[0];

    for(; kk < N; kk++){
        y = (MTData->mt[kk] & UPPER_MASK) | (MTData->mt[kk + 1] & LOWER_MASK);
        MTData->mt[kk] = MTData->mt[kk + (M - N)] ^ (y >> 1) ^ mag01[y & 0x1];
    }

    for(kk = 0; kk < N; kk++){
        y = MTData->mt[kk];
        y ^= TEMPERING_SHIFT_U(y);
        y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
        y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
        y ^= TEMPERING_SHIFT_L(y);
        MTData->mtr[kk] = y;
    }
    MTData->mti = 0;
}

extern void initMTData( MERSENNE_TWISTER_DATA *MTData, unsigned int seed )
{
    int i;

    for(i = 0; i < N; i++){
         MTData->mt[i] = seed & 0xffff0000;
         seed = 69069 * seed + 1;
         MTData->mt[i] |= (seed & 0xffff0000) >> 16;
         seed = 69069 * seed + 1;
    }

    generateMTData_C( MTData );
}

extern unsigned int randMTData( MERSENNE_TWISTER_DATA *MTData )
{
    if( MTData->mti >= N ){
		generateMTData_C( MTData );
    }
    return MTData->mtr[MTData->mti++]; 
}

#endif // DX_NON_MERSENNE_TWISTER












extern int INT64DIV( const BYTE *Int64, int DivNum )
{
	return ( int )( *( ( LONGLONG * )Int64 ) / DivNum ) ;
}

extern DWORD UINT64DIV( const BYTE *UInt64, DWORD DivNum )
{
	return ( DWORD )( *( ( ULONGLONG * )UInt64 ) / DivNum ) ;
}

extern int INT64MOD( const BYTE *Int64, int ModNum )
{
	return ( int )( *( ( LONGLONG * )Int64 ) % ModNum ) ;
}

extern DWORD UINT64MOD( const BYTE *UInt64, DWORD ModNum )
{
	return ( DWORD )( *( ( ULONGLONG * )UInt64 ) % ModNum ) ;
}










#ifndef DX_NON_MODEL


// MQOZ�`������ ZIP ���k���ꂽ�f�[�^���𓀂���
int MQOZ_ZIP_uncompress( void *dest, size_t destLen, const void *source, size_t sourceLen )
{
	int result ;
	z_stream stream ;

	_MEMSET( &stream, 0, sizeof( z_stream ) ) ;
	stream.next_in   = ( Bytef * )source ;
	stream.avail_in  = ( uInt )sourceLen ;
	stream.next_out  = ( Bytef * )dest ;
	stream.avail_out = ( uInt )destLen ;

	inflateInit2( &stream, -MAX_WBITS ) ;
	result = inflate( &stream, Z_FINISH ) ;
	if( result != Z_STREAM_END && result != Z_OK )
	{
		return 0;
	}
	inflateEnd( &stream ) ;

	return stream.total_out ;
}


#endif // DX_NON_MODEL










#ifndef DX_NON_MOVIE
#ifndef DX_NON_DSHOW_MP3
#ifndef DX_NON_DSHOW_MOVIE

HRESULT SoundCallback_DSMP3(  D_IMediaSample * pSample, D_REFERENCE_TIME * /*StartTime*/, D_REFERENCE_TIME * /*StopTime*/, BOOL /*TypeChanged*/, void *CallbackData )
{
	SOUNDCONV_DSMP3 *dsmp3 = ( SOUNDCONV_DSMP3 * )( ( ( SOUNDCONV * ) CallbackData )->ConvFunctionBuffer ) ;
	BYTE *pBuffer ;
	long BufferLen ;

	// �o�b�t�@���������Ă����牽�������ɏI��
	if( dsmp3->PCMBuffer == NULL )
		return 0 ;

	// �T���v���̃f�[�^�T�C�Y���擾����
	pSample->GetPointer( &pBuffer ) ;
	BufferLen = pSample->GetActualDataLength() ;

	// �T���v�����o�b�t�@�Ɏ��܂�Ȃ��ꍇ�̓o�b�t�@�̃T�C�Y��傫������
	if( dsmp3->PCMValidDataSize + BufferLen > dsmp3->PCMBufferSize )
	{
		void *OldBuffer ;

		// ���܂ł̃o�b�t�@�̃T�C�Y��ۑ�
		OldBuffer = dsmp3->PCMBuffer ;

		// �o�b�t�@�̃T�C�Y���P�l�a���₷
		dsmp3->PCMBufferSize += 1 * 1024 * 1024 ;
		dsmp3->PCMBuffer = DXALLOC( dsmp3->PCMBufferSize ) ;

		// �m�ۂɎ��s������G���[
		if( dsmp3->PCMBuffer == NULL )
		{
			DXFREE( OldBuffer ) ;
			return 0 ;
		}

		// ���܂ł̃f�[�^��]��
		_MEMCPY( dsmp3->PCMBuffer, OldBuffer, dsmp3->PCMValidDataSize ) ;

		// ���܂ł̃o�b�t�@�����
		DXFREE( OldBuffer ) ;
	}

	_MEMCPY( ( BYTE * )dsmp3->PCMBuffer + dsmp3->PCMValidDataSize, pBuffer, ( size_t )BufferLen ) ;
	dsmp3->PCMValidDataSize += BufferLen ;
	return 0 ;
}

// �t�B���^�[�̎w������̍ŏ��̃s�����擾����
D_IPin *_GetFilterPin( D_IBaseFilter *Filter, D_PIN_DIRECTION Direction )
{
	D_IEnumPins *EnumPin ;
	D_IPin *Pin ;
	D_PIN_DIRECTION PinDir ;

	Filter->EnumPins( &EnumPin ) ;
	while( EnumPin->Next( 1, &Pin, NULL ) == S_OK )
	{
		Pin->QueryDirection( &PinDir ) ;
		if( PinDir == Direction )
		{
			EnumPin->Release() ;
			return Pin ;
		}
		Pin->Release() ;
	}
	EnumPin->Release() ;
	return NULL ;
}

// DirectShow���g����MP3�t�@�C�����R���o�[�g����Z�b�g�A�b�v�������s��( [��] -1:�G���[ )
extern int SetupSoundConvert_DSMP3( SOUNDCONV *SoundConv )
{
	SETUP_WIN_API

	D_CMediaType ccmt, cmt, csmpmt;
	D_CMemStream *MemStream = NULL ;
	D_CMemReader *MemReader = NULL ;
	D_IBaseFilter *NullRenderer = NULL ;
	D_CSampleGrabber *SampleGrabber = NULL ;
	D_IGraphBuilder *GraphBuilder = NULL ;
	D_IMediaControl *MediaControl = NULL ;
	D_IMediaFilter *MediaFilter = NULL ;
	D_IMediaEvent *MediaEvent = NULL ;

	SOUNDCONV_DSMP3 *dsmp3 = ( SOUNDCONV_DSMP3 * )SoundConv->ConvFunctionBuffer ;
	STREAMDATA *Stream = &SoundConv->Stream ;
	void *TempBuffer ;
	HRESULT hr ;
	WAVEFORMATEX *smpfmt;
	DWORD TempSize ;

	// �����o�ϐ�������
	_MEMSET( dsmp3, 0, sizeof( SOUNDCONV_DSMP3 ) ) ;

	// �t�@�C���̃T�C�Y���擾����
	Stream->ReadShred.Seek( Stream->DataPoint, 0, SEEK_END ) ;
	TempSize = ( DWORD )Stream->ReadShred.Tell( Stream->DataPoint ) ;
	Stream->ReadShred.Seek( Stream->DataPoint, 0, SEEK_SET ) ;

	// �t�@�C�����ۂ��Ɗi�[�ł��郁�����̈���擾���Ă����Ƀt�@�C�����ۂ��Ɠǂݍ���
	TempBuffer = DXALLOC( TempSize ) ;
	if( TempBuffer == NULL )
	{
		goto ERR ;
	}
	Stream->ReadShred.Read( TempBuffer, TempSize, 1, Stream->DataPoint ) ;

	// �������\�[�X�t�B���^�̏���
	MemStream = ( D_CMemStream * )D_CMemStream::CreateInstance( ( BYTE * )TempBuffer, TempSize ) ;
	if( MemStream == NULL )
	{
		DXST_LOGFILE_ADDA( "MP3\x95\xcf\x8a\xb7\x97\x70 D_CMemStream \x82\xcc\x8d\xec\x90\xac\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "MP3�ϊ��p D_CMemStream �̍쐬�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}
	hr = S_OK ;
	ccmt.majortype = MEDIATYPE_STREAM ;
	ccmt.subtype = D_MEDIASUBTYPE_MPEG1AUDIO ;
	MemReader = ( D_CMemReader * )D_CMemReader::CreateInstance( MemStream, &ccmt, &hr ) ;
	if( MemReader == NULL )
	{
		DXST_LOGFILE_ADDA( "MP3\x95\xcf\x8a\xb7\x97\x70 D_CMemReader \x82\xcc\x8d\xec\x90\xac\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "MP3�ϊ��p D_CMemReader �̍쐬�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}
	MemReader->AddRef() ;

	// Null�����_���[�t�B���^�̍쐬
	if( ( FAILED( WinAPIData.Win32Func.CoCreateInstanceFunc( CLSID_NULLRENDERER, 0, CLSCTX_INPROC_SERVER, IID_IBASEFILTER, ( void ** )&NullRenderer ) ) ) )
	{
		WinAPIData.Win32Func.CoInitializeExFunc( NULL, COINIT_APARTMENTTHREADED ) ;
		if( ( FAILED( WinAPIData.Win32Func.CoCreateInstanceFunc( CLSID_NULLRENDERER, 0, CLSCTX_INPROC_SERVER, IID_IBASEFILTER, ( void ** )&NullRenderer ) ) ) )
		{
			DXST_LOGFILE_ADDA( "MP3\x95\xcf\x8a\xb7\x97\x70 NullRender \x82\xcc\x8d\xec\x90\xac\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "MP3�ϊ��p NullRender �̍쐬�Ɏ��s���܂���" @*/ );
			goto ERR ;
		}
	}

	// �O���t�B�b�N�r���_�[�I�u�W�F�N�g�̍쐬
	if( ( FAILED( WinAPIData.Win32Func.CoCreateInstanceFunc( CLSID_FILTERGRAPH, NULL, CLSCTX_INPROC, IID_IGRAPHBUILDER, ( void ** )&GraphBuilder ) ) ) )
	{
		DXST_LOGFILE_ADDA( "MP3\x95\xcf\x8a\xb7\x97\x70 IGraphBuilder \x82\xcc\x8d\xec\x90\xac\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "MP3�ϊ��p IGraphBuilder �̍쐬�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �T���v���O���o�t�B���^����
	hr = TRUE ;
	SampleGrabber = ( D_CSampleGrabber * )D_CSampleGrabber::CreateInstance( NULL, &hr ) ;
	if( SampleGrabber == NULL )
	{
		DXST_LOGFILE_ADDA( "MP3\x95\xcf\x8a\xb7\x97\x70 D_CSampleGrabber \x82\xcc\x8d\xec\x90\xac\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "MP3�ϊ��p D_CSampleGrabber �̍쐬�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �T���v���O���o�t�B���^�̐ݒ�
	cmt.majortype = MEDIATYPE_AUDIO ;
	cmt.subtype = D_MEDIASUBTYPE_PCM ;
	hr = SampleGrabber->SetAcceptedMediaType( &cmt ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "\x83\x54\x83\x93\x83\x76\x83\x8b\x83\x4f\x83\x89\x83\x6f\x83\x74\x83\x42\x83\x8b\x83\x5e\x82\xcc\x83\x81\x83\x66\x83\x42\x83\x41\x83\x5e\x83\x43\x83\x76\x82\xcc\x90\xdd\x92\xe8\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "�T���v���O���o�t�B���^�̃��f�B�A�^�C�v�̐ݒ�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �T���v���O���o�t�B���^���O���t�ɒǉ�
	hr = GraphBuilder->AddFilter( SampleGrabber, L"SampleGrabber") ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "\x83\x54\x83\x93\x83\x76\x83\x8b\x83\x4f\x83\x89\x83\x6f\x83\x74\x83\x42\x83\x8b\x83\x5e\x82\xcc\x83\x4f\x83\x89\x83\x74\x82\xd6\x82\xcc\x92\xc7\x89\xc1\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "�T���v���O���o�t�B���^�̃O���t�ւ̒ǉ��Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �������\�[�X�t�B���^���O���t�ɒǉ�
	hr = GraphBuilder->AddFilter( MemReader, L"MemFile" ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "\x83\x81\x83\x82\x83\x8a\x83\x74\x83\x40\x83\x43\x83\x8b\x83\x74\x83\x42\x83\x8b\x83\x5e\x82\xcc\x83\x4f\x83\x89\x83\x74\x82\xd6\x82\xcc\x92\xc7\x89\xc1\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "�������t�@�C���t�B���^�̃O���t�ւ̒ǉ��Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �t�B���^�A��
	hr = GraphBuilder->Render( MemReader->GetPin( 0 ) ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "\x83\x4f\x83\x89\x83\x74\x82\xcc\x8d\x5c\x92\x7a\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "�O���t�̍\�z�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �k�������_���[�t�B���^���O���t�ɒǉ�
	hr = GraphBuilder->AddFilter( NullRenderer, L"File Renderer" ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "\x83\x6b\x83\x8b\x83\x8c\x83\x93\x83\x5f\x83\x89\x81\x5b\x83\x74\x83\x42\x83\x8b\x83\x5e\x82\xcc\x83\x4f\x83\x89\x83\x74\x82\xd6\x82\xcc\x92\xc7\x89\xc1\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "�k�������_���[�t�B���^�̃O���t�ւ̒ǉ��Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �k�������_���[�����̃����_���[�ƌ�������
	{
		D_IEnumFilters *EnumFilter ;
		D_IPin         *LastOutput = NULL ;
		D_IPin         *LastInput  = NULL ;
		D_IPin         *InputPin ;
		D_IPin         *OutputPin ;
		D_IBaseFilter  *TmpFilter ;

		// �t�B���^�[�̗�
		GraphBuilder->EnumFilters( &EnumFilter ) ;

		// �t�B���^�[�Q�̒����烌���_���[�t�B���^��{��
		while( EnumFilter->Next( 1, &TmpFilter, NULL ) == S_OK )
		{
			InputPin  = _GetFilterPin( TmpFilter, D_PINDIR_INPUT  ) ;
			OutputPin = _GetFilterPin( TmpFilter, D_PINDIR_OUTPUT ) ;

			// �o�͂̂Ȃ��t�B���^�[�̓����_���[�t�B���^�Ƃ������f
			if( InputPin != NULL && OutputPin == NULL )
			{
				// ���̓s���Ɍq����Ă���o�̓s�����擾����
				InputPin->ConnectedTo( &LastOutput ) ;
				if( LastOutput != NULL )
				{
					// ���݂̃����_���[�t�B���^�Əo�̓s���̐ڑ�������
					GraphBuilder->Disconnect( LastOutput ) ;
					GraphBuilder->Disconnect( InputPin ) ;

					// �񋓗p�Ɏ擾�����I�u�W�F�N�g�����
					InputPin->Release() ;
					TmpFilter->Release() ;
					break ;
				}
			}

			// �񋓗p�Ɏ擾�����I�u�W�F�N�g�����
			if( InputPin  ) InputPin->Release() ;
			if( OutputPin ) OutputPin->Release() ; 
			TmpFilter->Release() ;
		}

		// �񋓗p�C���^�[�t�F�C�X�̉��
		EnumFilter->Release() ;

		// �k�������_���[�̓��̓s�����擾
		LastInput = _GetFilterPin( NullRenderer, D_PINDIR_INPUT ) ;

		// �k�������_���[�̓��̓s���ƍŏ��Ƀ����_���[�Ɛڑ����Ă����o�̓s����ڑ�
		hr = GraphBuilder->Connect( LastOutput, LastInput ) ;

		// �ꎞ�I�ȃC���^�[�t�F�C�X�����
		LastOutput->Release() ;
		LastInput->Release() ;

		// �G���[����
		if( hr != S_OK )
		{
			DXST_LOGFILE_ADDA( "\x8a\xf9\x91\xb6\x83\x8c\x83\x93\x83\x5f\x83\x89\x81\x5b\x82\xf0Null\x83\x8c\x83\x93\x83\x5f\x83\x89\x81\x5b\x82\xc6\x8c\xf0\x8a\xb7\x82\xb7\x82\xe9\x8f\x88\x97\x9d\x82\xaa\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "���������_���[��Null�����_���[�ƌ������鏈�������s���܂���" @*/ );
			goto ERR ;
		}
	}

	// �I�[�f�B�I�t�H�[�}�b�g�̎擾
	_MEMSET( &csmpmt, 0, sizeof( csmpmt ) ) ;
	hr = SampleGrabber->GetConnectedMediaType( &csmpmt ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "\x89\xb9\x90\xba\x82\xaa\x8a\xdc\x82\xdc\x82\xea\x82\xc4\x82\xa2\x82\xc8\x82\xa2\x82\xa9\x81\x41\x83\x49\x81\x5b\x83\x66\x83\x42\x83\x49\x83\x74\x83\x48\x81\x5b\x83\x7d\x83\x62\x83\x67\x82\xcc\x8e\xe6\x93\xbe\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd\x81\x42"/*@ "�������܂܂�Ă��Ȃ����A�I�[�f�B�I�t�H�[�}�b�g�̎擾�Ɏ��s���܂����B" @*/ );
		goto ERR ;
	}
	if( csmpmt.formattype != FORMAT_WAVEFORMATEX )
	{
		DXST_LOGFILE_ADDA( "\x83\x54\x83\x7c\x81\x5b\x83\x67\x8a\x4f\x82\xcc\x83\x58\x83\x67\x83\x8a\x81\x5b\x83\x80\x83\x74\x83\x48\x81\x5b\x83\x7d\x83\x62\x83\x67\x82\xc5\x82\xb7\x81\x42"/*@ "�T�|�[�g�O�̃X�g���[���t�H�[�}�b�g�ł��B" @*/ );
		goto ERR ;;
	}
	smpfmt = ( WAVEFORMATEX * )csmpmt.pbFormat ;
	if( smpfmt->wFormatTag != WAVE_FORMAT_PCM )
	{
		DXST_LOGFILE_ADDA( "\x83\x54\x83\x7c\x81\x5b\x83\x67\x8a\x4f\x82\xcc\x83\x49\x81\x5b\x83\x66\x83\x42\x83\x49\x83\x74\x83\x48\x81\x5b\x83\x7d\x83\x62\x83\x67\x82\xc5\x82\xb7\x81\x42"/*@ "�T�|�[�g�O�̃I�[�f�B�I�t�H�[�}�b�g�ł��B" @*/ );
		goto ERR ;
	}
	SoundConv->OutFormat.cbSize = 0 ;
	SoundConv->OutFormat.wFormatTag			= smpfmt->wFormatTag ;
	SoundConv->OutFormat.nChannels			= smpfmt->nChannels ;
	SoundConv->OutFormat.nBlockAlign		= smpfmt->nBlockAlign ;
	SoundConv->OutFormat.nSamplesPerSec		= smpfmt->nSamplesPerSec ;
	SoundConv->OutFormat.nAvgBytesPerSec	= SoundConv->OutFormat.nBlockAlign * smpfmt->nSamplesPerSec ;
	SoundConv->OutFormat.wBitsPerSample		= ( WORD )( smpfmt->nBlockAlign * 8 / smpfmt->nChannels ) ;

	// �T���v�����O����
	hr = SampleGrabber->SetCallback( SoundCallback_DSMP3, SoundConv ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "\x83\x52\x81\x5b\x83\x8b\x83\x6f\x83\x62\x83\x4e\x8a\xd6\x90\x94\x82\xf0\x90\xdd\x92\xe8\x82\xc5\x82\xab\x82\xdc\x82\xb9\x82\xf1"/*@ "�R�[���o�b�N�֐���ݒ�ł��܂���" @*/ );
		goto ERR ;;
	}

	// �Ƃ肠�������f�[�^�̂P�O�{�T�C�Y�̃��������m�ۂ���
	dsmp3->PCMBufferSize = TempSize * 10 ;
	dsmp3->PCMBuffer = DXALLOC( dsmp3->PCMBufferSize ) ;
	if( dsmp3->PCMBuffer == NULL )
	{
		DXST_LOGFILE_ADDA( "PCM\x83\x66\x81\x5b\x83\x5e\x82\xf0\x8a\x69\x94\x5b\x82\xb7\x82\xe9\x83\x81\x83\x82\x83\x8a\x97\xcc\x88\xe6\x82\xcc\x8a\x6d\x95\xdb\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "PCM�f�[�^���i�[���郁�����̈�̊m�ۂɎ��s���܂���" @*/ );
		goto ERR ;
	}

	// �o�b�t�@���̗L���ȃf�[�^�̃T�C�Y��������
	dsmp3->PCMValidDataSize = 0 ;

	// ���f�B�A�t�B���^�[�̎擾
	hr = GraphBuilder->QueryInterface( IID_IMEDIAFILTER, ( void ** )&MediaFilter ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "IMediaFilter \x82\xcc\x8e\xe6\x93\xbe\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "IMediaFilter �̎擾�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �����\�[�X�𖳂���
	MediaFilter->SetSyncSource( NULL ) ;

	// ���f�B�A�R���g���[���̎擾
	hr = GraphBuilder->QueryInterface( IID_IMEDIACONTROL, ( void ** )&MediaControl ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "IMediaControl \x82\xcc\x8e\xe6\x93\xbe\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "IMediaControl �̎擾�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// ���f�B�A�C�x���g�̎擾
	hr = GraphBuilder->QueryInterface( IID_IMEDIAEVENT, ( void ** )&MediaEvent ) ;
	if( hr != S_OK )
	{
		DXST_LOGFILE_ADDA( "IMediaEvent \x82\xcc\x8e\xe6\x93\xbe\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "IMediaEvent �̎擾�Ɏ��s���܂���" @*/ );
		goto ERR ;
	}

	// �Đ��J�n
	MediaControl->Run() ;

	// �Đ����I������̂�҂�
	for(;;)
	{
		long EvCode ;

		if( NS_ProcessMessage() != 0 )
		{
			DXST_LOGFILE_ADDA( "MP3\x95\xcf\x8a\xb7\x82\xcc\x93\x72\x92\x86\x82\xc5\x83\x5c\x83\x74\x83\x67\x82\xaa\x8f\x49\x97\xb9\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "MP3�ϊ��̓r���Ń\�t�g���I�����܂���" @*/ );
			goto ERR ;
		}

		// �������]�������������烋�[�v�𔲂���
		if( MediaEvent->WaitForCompletion( 100, &EvCode ) == S_OK )
		{
			if( EvCode == D_EC_ERRORABORT )
			{
				DXST_LOGFILE_ADDA( "MP3\x95\xcf\x8a\xb7\x82\xcc\x93\x72\x92\x86\x82\xc5\x83\x47\x83\x89\x81\x5b\x82\xaa\x94\xad\x90\xb6\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "MP3�ϊ��̓r���ŃG���[���������܂���" @*/ );
				goto ERR ;
			}
			if( EvCode == D_EC_COMPLETE )
			{
				break ;
			}
		}
	}

	// �o�b�t�@���������Ă�����G���[
	if( dsmp3->PCMBuffer == NULL )
	{
		DXST_LOGFILE_ADDA( "PCM\x83\x66\x81\x5b\x83\x5e\x82\xf0\x8a\x69\x94\x5b\x82\xb7\x82\xe9\x83\x81\x83\x82\x83\x8a\x97\xcc\x88\xe6\x82\xcc\x8d\xc4\x8a\x6d\x95\xdb\x82\xc9\x8e\xb8\x94\x73\x82\xb5\x82\xdc\x82\xb5\x82\xbd"/*@ "PCM�f�[�^���i�[���郁�����̈�̍Ċm�ۂɎ��s���܂���" @*/ );
		goto ERR ;
	}

	// DirectShow ���g�p�����l�o�R�Đ��̈��ۑ�
	SoundConv->MethodType = SOUND_METHODTYPE_DSMP3 ;

	// �ϊ���̂o�b�l�f�[�^���ꎞ�I�ɕۑ����郁�����̈�̃T�C�Y�͂P�b
	SoundConv->DestDataSize = ( int )SoundConv->OutFormat.nAvgBytesPerSec ;

	// �e��C���^�[�t�F�C�X�ƃ������̉��
	if( MediaEvent   ){ MediaEvent->Release() ; MediaEvent = NULL ; }
	if( MediaFilter  ){ MediaFilter->Release() ; MediaFilter = NULL ; }
	if( MediaControl ){ MediaControl->Release() ; MediaControl = NULL ; }
	if( GraphBuilder ){ GraphBuilder->Release() ; GraphBuilder = NULL ; }
	if( SampleGrabber ){ SampleGrabber->DeleteInstance() ; SampleGrabber = NULL ; }
	if( NullRenderer ){ NullRenderer->Release() ; NullRenderer = NULL ; }
	if( MemStream ){ MemStream->DeleteInstance() ; MemStream = NULL ; }
	if( MemReader ){ MemReader->DeleteInstance() ; MemReader = NULL ; }
	if( TempBuffer ){ DXFREE( TempBuffer ) ; TempBuffer = NULL ; }

	// ����I��
	return 0 ;

ERR :
	if( MediaEvent   ){ MediaEvent->Release() ; MediaEvent = NULL ; }
	if( MediaFilter ){ MediaFilter->Release() ; MediaFilter = NULL ; }
	if( MediaControl ){ MediaControl->Release() ; MediaControl = NULL ; }
	if( GraphBuilder ){ GraphBuilder->Release() ; GraphBuilder = NULL ; }
	if( SampleGrabber ){ SampleGrabber->DeleteInstance() ; SampleGrabber = NULL ; }
	if( NullRenderer ){ NullRenderer->Release() ; NullRenderer = NULL ; }
	if( MemStream ){ MemStream->DeleteInstance() ; MemStream = NULL ; }
	if( MemReader ){ MemReader->DeleteInstance() ; MemReader = NULL ; }
	if( TempBuffer ){ DXFREE( TempBuffer ) ; TempBuffer = NULL ; }
	if( dsmp3->PCMBuffer ){ DXFREE( dsmp3->PCMBuffer ) ; dsmp3->PCMBuffer = NULL ; }

	// �G���[�I��
	return -1 ;
}

#endif // DX_NON_MOVIE
#endif // DX_NON_DSHOW_MP3
#endif // DX_NON_DSHOW_MOVIE




//}












