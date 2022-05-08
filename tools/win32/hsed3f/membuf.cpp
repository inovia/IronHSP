
//
//		Memory buffer class
//			onion software/onitama 2002/2
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "membuf.h"

//-------------------------------------------------------------
//		Routines
//-------------------------------------------------------------

void CMemBuf::InitMemBuf( int sz )
{
	//	�o�b�t�@������
	size = sz;
	if ( size<0x1000 ) {
		size = 0x1000;
	} else if ( size<0x4000 ) {
		size = 0x4000;
	} else {
		size = 0x10000;
	}
	limit_size = size;
	mem_buf = (char *)malloc( limit_size );
	mem_buf[0] = 0;
	name[0] = 0;
	cur = 0;
	//	Index�o�b�t�@������
	idxflag = 0;
	idxmax = -1;
	curidx = 0;
	idxbuf = NULL;
}


void CMemBuf::InitIndexBuf( int sz )
{
	//	Index�o�b�t�@������
	idxflag = 1;
	idxmax = sz;
	curidx = 0;
	idxbuf = (int *)malloc( sizeof(int)*sz );
}


char *CMemBuf::PreparePtr( int sz )
{
	//	�o�b�t�@�g���`�F�b�N
	//	(sz�T�C�Y���������݉\�ȃo�b�t�@��Ԃ�)
	//		(return:���Ƃ̃o�b�t�@�擪ptr)
	//
	int i;
	char *p;
	if ( (cur+sz) < size ) {
		p = mem_buf + cur;
		cur += sz;
		return p;
	}
	//	expand buffer (VC��realloc�͕|���̂Ŏg��Ȃ�)
	i = size;
	while( i<=(cur+sz) ) i+=limit_size;
	p = (char *)malloc( i );
	memcpy( p, mem_buf, size );
	free( mem_buf );
	size = i;
	mem_buf = p;
	p = mem_buf + cur;
	cur += sz;
	return p;
}


void CMemBuf::RegistIndex( int val )
{
	//	�C���f�b�N�X��o�^
	int *p;
	if ( idxflag==0 ) return;
	idxbuf[ curidx++ ]= val;
	if ( curidx >= idxmax ) {
		idxmax+=256;
		p = (int *)malloc( sizeof(int)*idxmax );
		memcpy( p, idxbuf, sizeof(int)*curidx );
		free( idxbuf );
		idxbuf = p;
	}
}


void CMemBuf::Index( void )
{
	RegistIndex( cur );
}


void CMemBuf::Put( int data )
{
	int *p;
	p = (int *)PreparePtr( sizeof(int) );
	*p = data;
}


void CMemBuf::Put( short data )
{
	short *p;
	p = (short *)PreparePtr( sizeof(short) );
	*p = data;
}


void CMemBuf::Put( char data )
{
	char *p;
	p = PreparePtr( 1 );
	*p = data;
}


void CMemBuf::Put( unsigned char data )
{
	unsigned char *p;
	p = (unsigned char *) PreparePtr( 1 );
	*p = data;
}


void CMemBuf::Put( float data )
{
	float *p;
	p = (float *)PreparePtr( sizeof(float) );
	*p = data;
}


void CMemBuf::Put( double data )
{
	double *p;
	p = (double *)PreparePtr( sizeof(double) );
	*p = data;
}


void CMemBuf::PutStr( char *data )
{
	char *p;
	p = PreparePtr( strlen(data) );
	strcpy( p, data );
}


void CMemBuf::PutStrBlock( char *data )
{
	char *p;
	p = PreparePtr( strlen(data)+1 );
	strcpy( p, data );
}


void CMemBuf::PutCR( void )
{
	char *p;
	p = PreparePtr( 2 );
	*p++ = 13; *p++ = 10;
}


void CMemBuf::PutData( void *data, int sz )
{
	char *p;
	p = PreparePtr( sz );
	memcpy( p, (char *)data, sz );
}


int CMemBuf::PutFile( char *fname )
{
	//		�o�b�t�@�Ɏw��t�@�C���̓��e��ǉ�
	//		(return:�t�@�C���T�C�Y(-1=error))
	//
	char *p;
	int length;
	FILE *ff;

	ff=fopen( fname,"rb" );
	if (ff==NULL) return -1;
	fseek( ff,0,SEEK_END );
	length=(int)ftell( ff );			// normal file size
	fclose(ff);

	p = PreparePtr( length+1 );
	ff=fopen( fname,"rb" );
	fread( p, 1, length, ff );
	fclose(ff);
	p[length]=0;
	
	strcpy( name,fname );
	return length;
}


//-------------------------------------------------------------
//		Interfaces
//-------------------------------------------------------------

CMemBuf::CMemBuf( void )
{
	//		��̃o�b�t�@��������(64K)
	//
	InitMemBuf( 0x10000 );
}


CMemBuf::CMemBuf( int sz )
{
	//		�w��T�C�Y�̃o�b�t�@��������(64K)
	//
	InitMemBuf( sz );
}


CMemBuf::~CMemBuf( void )
{
	if ( mem_buf != NULL ) {
		free( mem_buf );
		mem_buf = NULL;
	}
	if ( idxbuf != NULL ) {
		free( idxbuf );
		idxbuf = NULL;
	}
}


void CMemBuf::AddIndexBuffer( void )
{
	InitIndexBuf( 256 );
}


void CMemBuf::AddIndexBuffer( int sz )
{
	InitIndexBuf( sz );
}


char *CMemBuf::GetBuffer( void )
{
	return mem_buf;
}


int CMemBuf::GetBufferSize( void )
{
	return size;
}


int *CMemBuf::GetIndexBuffer( void )
{
	return idxbuf;
}


void CMemBuf::SetIndex( int idx, int val )
{
	if ( idxflag==0 ) return;
	idxbuf[idx] = val;
}


int CMemBuf::GetIndex( int idx )
{
	if ( idxflag==0 ) return -1;
	return idxbuf[idx];
}


int CMemBuf::GetIndexBufferSize( void )
{
	if ( idxflag==0 ) return -1;
	return curidx;
}


int CMemBuf::SearchIndexValue( int val )
{
	int i;
	int j;
	if ( idxflag==0 ) return -1;
	j = -1;
	for(i=0;i<cur;i++) {
		if ( idxbuf[i] == val ) j=i;
	}
	return j;
}


int CMemBuf::SaveFile( char *fname )
{
	//		�o�b�t�@���t�@�C���ɃZ�[�u
	//		(return:�t�@�C���T�C�Y(-1=error))
	//
	FILE *fp;
	int flen;
	fp=fopen(fname,"wb");
	if (fp==NULL) return -1;
	flen = fwrite( mem_buf, 1, cur, fp );
	fclose(fp);
	strcpy( name,fname );
	return flen;
}


char *CMemBuf::GetFileName( void )
{
	//		�t�@�C�������擾
	//
	return name;
}


