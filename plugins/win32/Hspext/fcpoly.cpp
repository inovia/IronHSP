//
//		Polygon draw lib (full color)
//			onion software/onitama 2001/6
//
#include <stdio.h>
#include <windows.h>
#include <math.h>
#include "fcpoly.h"

//		Settings
//
int resY0, resY1;	// ���������͈�(����)min,max

static		SCANDATA *scanData;
static		char *lpDest;		// �`���ʂ̃o�b�t�@
static		int nDestWByte;		// �`����W��byte��
static		int nDestWidth;		// �`����W��
static		int nDestWidth2;	// �`����W��(VRAM�p)
static		int nDestHeight;	// �`����W����
static		int DestSize;		// �`���ʃo�b�t�@�̃T�C�Y

static		char *lpTex;		// �e�N�X�`���̃o�b�t�@
static		int curtex;			// current texID
static		int nTexWidth;		// �e�N�X�`����
static		int nTexWByte;		// �e�N�X�`����byte��
static		int nTexHeight;		// �e�N�X�`������

static		unsigned char ck1;	// �J���[�L�[1
static		unsigned char ck2;	// �J���[�L�[2
static		unsigned char ck3;	// �J���[�L�[3

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

void hgiof_init( void )
{
	//		Setup system valiables
	//
	HDC hdc;
	int dispx,dispy;

	hdc=GetDC(NULL);
	dispx = GetSystemMetrics( SM_CXSCREEN );
	dispy = GetSystemMetrics( SM_CYSCREEN );
	ReleaseDC(NULL,hdc);

	//		�o�b�t�@������
	//
	lpDest = NULL;
	lpTex = NULL;
	scanData = (SCANDATA *)malloc( sizeof( SCANDATA ) * dispy );

	//		�J���[�L�[������
	//
	ck1 = 0; ck2 = 0; ck3 = 0;

	//		�e�N�X�`����񏉊���
	//
	TexInit();
}

void hgiof_term( void )
{
	if ( scanData != NULL ) { free( scanData ); scanData = NULL; }
	lpDest = NULL;
	TexTerm();
}


void SetPolyDest( void *dest, int sx, int sy )
{
	lpDest = (char *)dest;
	nDestWidth = sx;
	nDestWByte = ((sx*3)+3)&~3;
	nDestWidth2 = ((sx)+3)&~3;
	nDestHeight = sy;
	DestSize = nDestWByte * sy * 3;
}


void SetPolyColorKey( int color )
{
	ck1 = (unsigned char)(color>>16);
	ck2 = (unsigned char)(color>>8);
	ck3 = (unsigned char)(color);
}

/*------------------------------------------------------------*/
/*
		Polygon Draw Routines
*/
/*------------------------------------------------------------*/

//-----------------------------------------------------
//  Calc Polygon ScanLine Data
//
static void ScanLine(POLY4 *lpPolyData,  // �|���S���f�[�^
			  SCANDATA *lpScanData, // �G�b�W���W�̃X�L�����f�[�^
			  int nScrWidth, // �`���ʕ�
			  int nScrHeight, // �`���ʍ���
			  int *lpnStartY, // �`����J�n���� Y ���W(out)
			  int *lpnEndY // �`����I������ Y ���W(out)
			  )
{
	int i,y,v1y,v2y,endY;
	IAXIS2 *fv1;
	IAXIS2 *fv2;
	IAXIS2 *ftmp;

	// �`��J�n�ʒu�A�I���ʒu������
	*lpnStartY = nScrHeight;
	*lpnEndY = -1;
	
	// �X�L�����f�[�^������
	for(i=0;i< nScrHeight;i++){
		lpScanData[i].minX = nScrWidth;
		lpScanData[i].maxX = -1;
	}
	
	// �|���S���̊e�Ӗ��ɃX�L��������
	for(i=0;i< POLY4N;i++){

		// ���_�ԍ��Z�b�g
		fv1 = &lpPolyData->v[i];
		if ( (i+1)<POLY4N ) { fv2=fv1+1; } else { fv2=&lpPolyData->v[0]; }

		// ���_ V1 �� V2 �� y ����������(�������̎�)
		if( fv1->y == fv2->y ){

			y = fv1->y;
			
			// �͈͊O�̎��̓`�F�b�N���Ȃ�
			if((y <  nScrHeight )&&( y >= 0)){
				
				// �X�^�[�g�ʒu�v�Z
				*lpnStartY = min(y,*lpnStartY);
				*lpnEndY = max(y,*lpnEndY);
				
				// ���_ V1 �̕������ɂȂ�悤�ɂ���
				if( fv1->x > fv2->x ){
					ftmp = fv1;
					fv1 = fv2;
					fv2 = ftmp;
				}
				
				// Max �� Min �̌v�Z
				if((y >=0 )&&( y <  nScrHeight)){
					
					if( fv1->x <  lpScanData[y].minX){
						lpScanData[y].minX = fv1->x;
						lpScanData[y].minTx = fv1->tx;
						lpScanData[y].minTy = fv1->ty;
					}
					
					if( fv2->x > lpScanData[y].maxX){
						lpScanData[y].maxX = fv2->x;
						lpScanData[y].maxTx = fv2->tx;
						lpScanData[y].maxTy = fv2->ty;
					}
				}
			}
		}
		else{ // ���_ v1 �� v2 �� y ���W���قȂ�ꍇ
			
			// ���_ V1 �̕�����ɂȂ�悤�ɂ���
			if( fv1->y > fv2->y ) {
				ftmp = fv1;
				fv1 = fv2;
				fv2 = ftmp;
			}
			
			v1y = fv1->y;
			v2y = fv2->y;
			
			// �͈͊O�̎��̓`�F�b�N���Ȃ�
			if((v1y <  nScrHeight )||( v2y >= 0)){
				
				// �X�^�[�g�ʒu�v�Z
				*lpnStartY = min(v1y,*lpnStartY);
				*lpnEndY = max(v2y,*lpnEndY);
				
				// y �� 1 �����������̕`����W�ł� x �̕ψʂ�
				// �e�N�X�`�����W�ł� x �� y �̕ψʂ��v�Z
				
				double x,dx;  // �`����W�v�Z�p
				double dd;
				double tx,ty,tdx,tdy; // �e�N�X�`�����W�v�Z�p
				
				//x �����̕ψʌv�Z
				dd = 1.0f / (double)(v2y-v1y);
				dx = (double)( fv2->x - fv1->x )*dd;
				// �e�N�X�`�����W�̕ψʌv�Z
				tdx = (double)(fv2->tx - fv1->tx)*dd;
				tdy = (double)(fv2->ty - fv1->ty)*dd;
				
				// �����`����W�Z�b�g
				x = (double)fv1->x;
				
				// �����e�N�X�`�����W�Z�b�g
				tx = (double)fv1->tx; 
				ty = (double)fv1->ty;
				
				// �T�[�`�͈͌v�Z
				endY = min(nScrHeight-1,v2y);
				
				// �ォ�珇�ɃT�[�`�J�n
				for(y = v1y; y <= endY; y++){
					
					// Max �� Min �̌v�Z
					if(y>=0){
						
						if( x < lpScanData[y].minX){
							lpScanData[y].minX = (int)x;
							lpScanData[y].minTx = (int)tx;
							lpScanData[y].minTy = (int)ty;
						}
						
						if( x > lpScanData[y].maxX){
							lpScanData[y].maxX = (int)x;
							lpScanData[y].maxTx = (int)tx;
							lpScanData[y].maxTy = (int)ty;
						}
						
					}
					
					// ���W�ړ�
					x += dx;
					tx += tdx;
					ty += tdy;
				}
			}
		}
	}
	
	// �X�^�[�g�ʒu�v�Z
	*lpnStartY = max(0,*lpnStartY);
	*lpnEndY = min(nScrHeight-1,*lpnEndY);
}


void DrawPolygonF4( POLY4 *lpPolyData )
{
	int x,y; // ���[�v�p
	int nStartY,nEndY; // �`��J�n���J�n���� Y ���W�A�I�����W
	int maxX,minX;  // �G�b�W���W�̍ő�ŏ��l
//	char *p;
	short color1;
	unsigned char color2;

	DWORD dwScanData,dwDest; // �G�b�W�̍��W�f�[�^�Ɠ]����̃x�[�X�A�h���X
//	int x0,x1,x2,y0,y1,y2;

	short alpha,alphaop,ialpha;
	short cc1,cc2,cc3,a1,a2,a3;
	unsigned char *up;

	// ���\����
/*
	x0 = lpPolyData->v[0].x;
	x1 = lpPolyData->v[1].x;
	x2 = lpPolyData->v[2].x;
	y0 = lpPolyData->v[0].y;
	y1 = lpPolyData->v[1].y;
	y2 = lpPolyData->v[2].y;
	if ( (x0 - x1) * (y1 - y2) - (x1 - x2) * (y0 - y1) >= 0 ) return;
*/
	// �G�b�W�̍��W�̃X�L����
	ScanLine(lpPolyData, scanData,nDestWidth,nDestHeight,&nStartY,&nEndY);
	
	// �͈͊O�Ȃ�`�悵�Ȃ�
	if(nStartY >= nDestHeight || nEndY < 0) { resY0 = resY1 = -1; return; }

	resY0 = nStartY;
	resY1 = nEndY;

	// Fill Color
	color1 = (short)(lpPolyData->color & 0xffff);
	color2 = (unsigned char)((lpPolyData->color & 0xff0000 ) >>16 );

	// �]����o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�Z�b�g
	// �]����o�b�t�@(DIB)�͏㉺�����]���Ă���̂ɒ���((nDestHeight-1-nStartY)�̏�)

	dwDest = (DWORD)lpDest + (DWORD)((nDestHeight-1-nStartY)*nDestWByte);
	dwScanData = (DWORD)scanData + (DWORD)(nStartY*sizeof(SCANDATA));
	
	//	�����ݒ�𔻒�
	//
	if ( lpPolyData->alpha != 0x100 ) {
		alphaop = lpPolyData->alpha>>8;
		alpha = lpPolyData->alpha & 255;
		cc1 = ((color1 & 0xff) * alpha )>>8;
		cc2 = (((color1>>8)&0xff) * alpha )>>8;
		cc3 = ((short)(color2) * alpha )>>8;

		if ( alphaop == 0 ) goto f4_blend;
		if ( alphaop == 2 ) goto f4_modulate;
		if ( alphaop == 3 ) goto f4_substract;
	}

	// nStartY ���� nEndY �܂ŏォ�珇�ɕ`��
	for(y = nStartY; y < nEndY; y++){
	
		// �G�b�W��(�]����摜(dwDest)��ł�)���W�Z�b�g
		minX = *(int *)(dwScanData);
		maxX = *(int *)(dwScanData+4);

		if(minX < 0) minX = 0;
		if(maxX >= 0){

			// ������E�ɉ��ɕ`�悵�Ă���
			maxX = min(nDestWidth-1,maxX);
			up = (unsigned char *)dwDest + minX*3;
			for(x = minX; x < maxX; x++){
	
			// �R�s�[
			*(short *)up = color1;
			up[2] = color2; up+=3;
	
			}
		}
		// �o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�X�V
		dwDest -= nDestWByte;
		dwScanData += sizeof(SCANDATA);
	}
	return;

f4_blend:
	ialpha = 0xff - alpha;
	for(y = nStartY; y < nEndY; y++){
		minX = *(int *)(dwScanData);
		maxX = *(int *)(dwScanData+4);
		if(minX < 0) minX = 0;
		if(maxX >= 0){
			maxX = min(nDestWidth-1,maxX);
			up = (unsigned char *)dwDest + minX*3;
			for(x = minX; x < maxX; x++){
				a1=((((short)up[0])*ialpha)>>8)+cc1;
				a2=((((short)up[1])*ialpha)>>8)+cc2;
				a3=((((short)up[2])*ialpha)>>8)+cc3;
				up[0]=(unsigned char)a1;
				up[1]=(unsigned char)a2;
				up[2]=(unsigned char)a3;
				up+=3;
			}
		}
		dwDest -= nDestWByte;
		dwScanData += sizeof(SCANDATA);
	}
	return;

f4_modulate:
	for(y = nStartY; y < nEndY; y++){
		minX = *(int *)(dwScanData);
		maxX = *(int *)(dwScanData+4);
		if(minX < 0) minX = 0;
		if(maxX >= 0){
			maxX = min(nDestWidth-1,maxX);
			up = (unsigned char *)dwDest + minX*3;
			for(x = minX; x < maxX; x++){
				a1=cc1+(short)up[0];if (a1>255) a1=255;
				a2=cc2+(short)up[1];if (a2>255) a2=255;
				a3=cc3+(short)up[2];if (a3>255) a3=255;
				up[0]=(unsigned char)a1;
				up[1]=(unsigned char)a2;
				up[2]=(unsigned char)a3;
				up+=3;
			}
		}
		dwDest -= nDestWByte;
		dwScanData += sizeof(SCANDATA);
	}
	return;
f4_substract:
	for(y = nStartY; y < nEndY; y++){
		minX = *(int *)(dwScanData);
		maxX = *(int *)(dwScanData+4);
		if(minX < 0) minX = 0;
		if(maxX >= 0){
			maxX = min(nDestWidth-1,maxX);
			up = (unsigned char *)dwDest + minX*3;
			for(x = minX; x < maxX; x++){
				a1=(short)up[0]-cc1;if (a1<0) a1=0;
				a2=(short)up[1]-cc2;if (a2<0) a2=0;
				a3=(short)up[2]-cc3;if (a3<0) a3=0;
				up[0]=(unsigned char)a1;
				up[1]=(unsigned char)a2;
				up[2]=(unsigned char)a3;
				up+=3;
			}
		}
		dwDest -= nDestWByte;
		dwScanData += sizeof(SCANDATA);
	}
	return;


}


void DrawPolygonTex( POLY4 *lpPolyData )
{
	int i2,x,y; // ���[�v�p
	int nStartY,nEndY; // �`��J�n���J�n���� Y ���W�A�I�����W
	int maxX,minX;  // �G�b�W���W�̍ő�ŏ��l
//	int x0,x1,x2,y0,y1,y2;
	char *p;
	char *srcp;
	char d1,d2,d3;
	DWORD tx,ty,tdx,tdy; 

	short alpha,alphaop,ialpha,a1,a2,a3;
	unsigned char *up;
	unsigned char *usrcp;

	DWORD dwTexSize; // �e�N�X�`���̃T�C�Y
	DWORD dwScanData,dwDest; // �G�b�W�̍��W�f�[�^�Ɠ]����̃x�[�X�A�h���X

	//		Texture select
	//if ( lpPolyData->tex != curtex ) ChangeTex( lpPolyData->tex );

	// ���\����
/*
	x0 = lpPolyData->v[0].x;
	x1 = lpPolyData->v[1].x;
	x2 = lpPolyData->v[3].x;
	y0 = lpPolyData->v[0].y;
	y1 = lpPolyData->v[1].y;
	y2 = lpPolyData->v[3].y;
	if ( (x0 - x1) * (y1 - y2) - (x1 - x2) * (y0 - y1) >= 0 ) return;
*/
	// �G�b�W�̍��W�̃X�L����
	dwTexSize = (DWORD)(nTexHeight*nTexWByte);
	ScanLine( lpPolyData, scanData, nDestWidth, nDestHeight, &nStartY, &nEndY );
	
	// �͈͊O�Ȃ�`�悵�Ȃ�
	if(nStartY >= nDestHeight || nEndY < 0) { resY0 = resY1 = -1; return; }

	resY0 = nStartY;
	resY1 = nEndY;

	// �]����o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�Z�b�g
	// �]����o�b�t�@(DIB)�͏㉺�����]���Ă���̂ɒ���((nDestHeight-1-nStartY)�̏�)
	p = (char *)lpDest + ((nDestHeight-1-nStartY)*nDestWByte);
	dwDest = (DWORD)p;
	dwScanData = (DWORD)scanData + (DWORD)(nStartY*sizeof(SCANDATA));

	//	�����ݒ�𔻒�
	//
	if ( lpPolyData->alpha != 0x100 ) {
		alphaop = lpPolyData->alpha>>8;
		alpha = lpPolyData->alpha & 255;
		if ( alphaop == 0 ) goto p4_blend;
		if ( alphaop == 2 ) goto p4_modulate;
		if ( alphaop == 3 ) goto p4_substract;
	}
	if ( lpPolyData->attr & NODE_ATTR_COLKEY ) goto p4trans;

	//
	//	�����F�Ȃ��`��
	//
	//
	// nStartY ���� nEndY �܂ŏォ�珇�ɕ`��
	for(y = nStartY; y < nEndY; y++){
	
	// �G�b�W��(�]����摜(dwDest)��ł�)���W�Z�b�g
	minX = *(LPLONG)(dwScanData);
	maxX = *(LPLONG)(dwScanData+4);

	if(maxX >= 0){
	
	// �e�N�X�`�����W�v�Z�p�ϐ�(16 bit �Œ菭��)
	
	tx = *(LPLONG)(dwScanData+8);
	ty = *(LPLONG)(dwScanData+12);
	tx <<= 16; 
	ty <<= 16;
	
	// �`����W�� x  �� 1 �����������̃e�N�X�`�����W�ł�
	// x �� y �̕ψʂ��v�Z
	if(maxX != minX){ 
	
	i2 = 0x10000 / (maxX-minX); // DWORD -> WORD �ϊ�
	tdx = ((*(LPLONG)(dwScanData+16)-*(LPLONG)(dwScanData+8)))*i2;
	tdy = ((*(LPLONG)(dwScanData+20)-*(LPLONG)(dwScanData+12)))*i2;

	}
	else { // ��_�̎�
	tdx = 0;
	tdy = 0;
	}
	
	// �����G�b�W(minX)�� 0 ��菬�����Ȃ� 0 �ɂȂ�܂ŉ�

	while(minX < 0){
	minX++;
	tx += tdx;
	ty += tdy;
	}
	
	// ������E�ɉ��ɕ`�悵�Ă���
	maxX = min(nDestWidth-1,maxX);
	p = (char *)(dwDest) + minX*3;
	for(x = minX; x < maxX; x++){
	
	// �e�N�X�`���f�[�^��ǂݍ��ޓ_���v�Z
	//dwReadPoint = (DWORD)(nTexHeight-1-(ty>>5))*nTexWidth+(tx>>5);
	//dwReadPoint = (DWORD)(nTexHeight-1-(ty>>16))*nTexWidth+(tx>>16);
	//dwReadPoint = (DWORD)((ty>>16))*nTexWByte+((tx>>16)*3);
//	i2 = ((tx>>16)*3);
	i2 = ((ty>>16)*nTexWByte)+((tx>>16)*3);
	
	// �R�s�[
	if( i2 < (int)dwTexSize) {
		srcp = (char *)lpTex + i2;
		*(short *)p = *(short *)srcp; p+=2; srcp+=2;
		*p++ = *srcp++;
	}
	
	// �e�N�X�`�����W�ړ�
	tx += tdx;
	ty += tdy;
	}
	}
	
	// �o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�X�V
	dwDest -= nDestWByte;
	dwScanData += sizeof(SCANDATA);
	}

	return;

p4trans:
	//
	//	�����F����`��
	//
	//
	// nStartY ���� nEndY �܂ŏォ�珇�ɕ`��
	for(y = nStartY; y < nEndY; y++){
	
	// �G�b�W��(�]����摜(dwDest)��ł�)���W�Z�b�g
	minX = *(LPLONG)(dwScanData);
	maxX = *(LPLONG)(dwScanData+4);

	if(maxX >= 0){

		// �e�N�X�`�����W�v�Z�p�ϐ�(16 bit �Œ菭��)
	
		tx = *(LPLONG)(dwScanData+8);
		ty = *(LPLONG)(dwScanData+12);
		tx <<= 16; 
		ty <<= 16;
	
		// �`����W�� x  �� 1 �����������̃e�N�X�`�����W�ł�
		// x �� y �̕ψʂ��v�Z
		if(maxX != minX){ 
	
			i2 = 0x10000 / (maxX-minX); // DWORD -> WORD �ϊ�
			tdx = ((*(LPLONG)(dwScanData+16)-*(LPLONG)(dwScanData+8)))*i2;
			tdy = ((*(LPLONG)(dwScanData+20)-*(LPLONG)(dwScanData+12)))*i2;

		}
		else { // ��_�̎�
			tdx = 0;
			tdy = 0;
		}
	
		// �����G�b�W(minX)�� 0 ��菬�����Ȃ� 0 �ɂȂ�܂ŉ�

		while(minX < 0){
			minX++;
			tx += tdx;
			ty += tdy;
		}
	
		// ������E�ɉ��ɕ`�悵�Ă���
		maxX = min(nDestWidth-1,maxX);
		p = (char *)(dwDest + minX*3);
		for(x = minX; x < maxX; x++) {

			// �e�N�X�`���f�[�^��ǂݍ��ޓ_���v�Z
			i2 = ((ty>>16)*nTexWByte)+((tx>>16)*3);
	
			// �R�s�[
			if( i2 < (int)dwTexSize) {
				srcp = (char *)lpTex + i2;
				d1=*srcp++;
				d2=*srcp++;
				d3=*srcp++;
				if ( d1|d2|d3 ) {
					p[0] = d1;
					p[1] = d2;
					p[2] = d3;
				}
				p+=3;
			}
		
			// �e�N�X�`�����W�ړ�
			tx += tdx;
			ty += tdy;
		}
	}
	
	// �o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�X�V
	dwDest -= nDestWByte;
	dwScanData += sizeof(SCANDATA);
	}
	return;

p4_blend:
	//
	//	�`��(BLEND)
	//
	//
	if ( lpPolyData->attr & NODE_ATTR_COLKEY ) goto p4_tblend;

	ialpha = 0xff - alpha;
	for(y = nStartY; y < nEndY; y++){
		minX = *(LPLONG)(dwScanData);
		maxX = *(LPLONG)(dwScanData+4);
		if(maxX >= 0){
		tx = *(LPLONG)(dwScanData+8);
		ty = *(LPLONG)(dwScanData+12);
		tx <<= 16; 
		ty <<= 16;
		if(maxX != minX){ 
			i2 = 0x10000 / (maxX-minX); // DWORD -> WORD �ϊ�
			tdx = ((*(LPLONG)(dwScanData+16)-*(LPLONG)(dwScanData+8)))*i2;
			tdy = ((*(LPLONG)(dwScanData+20)-*(LPLONG)(dwScanData+12)))*i2;
		}
		else {
			tdx = 0;
			tdy = 0;
		}
		while(minX < 0){
			minX++;
			tx += tdx;
			ty += tdy;
		}
		maxX = min(nDestWidth-1,maxX);
		up = (unsigned char *)(dwDest + minX*3);
		for(x = minX; x < maxX; x++) {
			i2 = ((ty>>16)*nTexWByte)+((tx>>16)*3);
			if( i2 < (int)dwTexSize) {
				usrcp = (unsigned char *)lpTex + i2;
				a1=((((short)usrcp[0])*alpha)+(((short)up[0])*ialpha))>>8;
				a2=((((short)usrcp[1])*alpha)+(((short)up[1])*ialpha))>>8;
				a3=((((short)usrcp[2])*alpha)+(((short)up[2])*ialpha))>>8;
				*up++=(unsigned char)a1;*up++=(unsigned char)a2;*up++=(unsigned char)a3;
			}
			tx += tdx;
			ty += tdy;
		}
	}
	dwDest -= nDestWByte;
	dwScanData += sizeof(SCANDATA);
	}
	return;

p4_tblend:
	//
	//	�����F����`��(BLEND)
	//
	//
	ialpha = 0xff - alpha;
	for(y = nStartY; y < nEndY; y++){
		minX = *(LPLONG)(dwScanData);
		maxX = *(LPLONG)(dwScanData+4);
		if(maxX >= 0){
		tx = *(LPLONG)(dwScanData+8);
		ty = *(LPLONG)(dwScanData+12);
		tx <<= 16; 
		ty <<= 16;
		if(maxX != minX){ 
			i2 = 0x10000 / (maxX-minX); // DWORD -> WORD �ϊ�
			tdx = ((*(LPLONG)(dwScanData+16)-*(LPLONG)(dwScanData+8)))*i2;
			tdy = ((*(LPLONG)(dwScanData+20)-*(LPLONG)(dwScanData+12)))*i2;
		}
		else {
			tdx = 0;
			tdy = 0;
		}
		while(minX < 0){
			minX++;
			tx += tdx;
			ty += tdy;
		}
		maxX = min(nDestWidth-1,maxX);
		up = (unsigned char *)(dwDest + minX*3);
		for(x = minX; x < maxX; x++) {
			i2 = ((ty>>16)*nTexWByte)+((tx>>16)*3);
			if( i2 < (int)dwTexSize) {
				usrcp = (unsigned char *)lpTex + i2;
				if (( usrcp[0]==ck1 )&&( usrcp[1]==ck2 )&&( usrcp[2]==ck2 )) {
					up+=3;
				} else {
					a1=((((short)usrcp[0])*alpha)+(((short)up[0])*ialpha))>>8;
					a2=((((short)usrcp[1])*alpha)+(((short)up[1])*ialpha))>>8;
					a3=((((short)usrcp[2])*alpha)+(((short)up[2])*ialpha))>>8;
					*up++=(unsigned char)a1;*up++=(unsigned char)a2;*up++=(unsigned char)a3;
				}
			}
			tx += tdx;
			ty += tdy;
		}
	}
	dwDest -= nDestWByte;
	dwScanData += sizeof(SCANDATA);
	}
	return;

p4_modulate:
	//
	//	�`��(MODULATE)
	//
	//
	for(y = nStartY; y < nEndY; y++){
		minX = *(LPLONG)(dwScanData);
		maxX = *(LPLONG)(dwScanData+4);
		if(maxX >= 0){
		tx = *(LPLONG)(dwScanData+8);
		ty = *(LPLONG)(dwScanData+12);
		tx <<= 16; 
		ty <<= 16;
		if(maxX != minX){ 
			i2 = 0x10000 / (maxX-minX); // DWORD -> WORD �ϊ�
			tdx = ((*(LPLONG)(dwScanData+16)-*(LPLONG)(dwScanData+8)))*i2;
			tdy = ((*(LPLONG)(dwScanData+20)-*(LPLONG)(dwScanData+12)))*i2;
		}
		else {
			tdx = 0;
			tdy = 0;
		}
		while(minX < 0){
			minX++;
			tx += tdx;
			ty += tdy;
		}
		maxX = min(nDestWidth-1,maxX);
		up = (unsigned char *)(dwDest + minX*3);
		for(x = minX; x < maxX; x++) {
			i2 = ((ty>>16)*nTexWByte)+((tx>>16)*3);
			if( i2 < (int)dwTexSize) {
				usrcp = (unsigned char *)lpTex + i2;
				a1=((((short)usrcp[0])*alpha)>>8)+(short)up[0];
				if (a1>255) a1=255;
				a2=((((short)usrcp[1])*alpha)>>8)+(short)up[1];
				if (a2>255) a2=255;
				a3=((((short)usrcp[2])*alpha)>>8)+(short)up[2];
				if (a3>255) a3=255;
				*up++=(unsigned char)a1;*up++=(unsigned char)a2;*up++=(unsigned char)a3;
			}
			tx += tdx;
			ty += tdy;
		}
	}
	dwDest -= nDestWByte;
	dwScanData += sizeof(SCANDATA);
	}
	return;

p4_substract:
	//
	//	�`��(MODULATE)
	//
	//
	for(y = nStartY; y < nEndY; y++){
		minX = *(LPLONG)(dwScanData);
		maxX = *(LPLONG)(dwScanData+4);
		if(maxX >= 0){
		tx = *(LPLONG)(dwScanData+8);
		ty = *(LPLONG)(dwScanData+12);
		tx <<= 16; 
		ty <<= 16;
		if(maxX != minX){ 
			i2 = 0x10000 / (maxX-minX); // DWORD -> WORD �ϊ�
			tdx = ((*(LPLONG)(dwScanData+16)-*(LPLONG)(dwScanData+8)))*i2;
			tdy = ((*(LPLONG)(dwScanData+20)-*(LPLONG)(dwScanData+12)))*i2;
		}
		else {
			tdx = 0;
			tdy = 0;
		}
		while(minX < 0){
			minX++;
			tx += tdx;
			ty += tdy;
		}
		maxX = min(nDestWidth-1,maxX);
		up = (unsigned char *)(dwDest + minX*3);
		for(x = minX; x < maxX; x++) {
			i2 = ((ty>>16)*nTexWByte)+((tx>>16)*3);
			if( i2 < (int)dwTexSize) {
				usrcp = (unsigned char *)lpTex + i2;
				a1=(short)up[0]-((((short)usrcp[0])*alpha)>>8);
				if (a1<0) a1=0;
				a2=(short)up[1]-((((short)usrcp[1])*alpha)>>8);
				if (a2<0) a2=0;
				a3=(short)up[2]-((((short)usrcp[2])*alpha)>>8);
				if (a3<0) a3=0;
				*up++=(unsigned char)a1;*up++=(unsigned char)a2;*up++=(unsigned char)a3;
			}
			tx += tdx;
			ty += tdy;
		}
	}
	dwDest -= nDestWByte;
	dwScanData += sizeof(SCANDATA);
	}
	return;
}


/*------------------------------------------------------------*/
/*
		palette mode process
*/
/*------------------------------------------------------------*/

void DrawPolygonF4P( POLY4 *lpPolyData )
{
	int x,y; // ���[�v�p
	int nStartY,nEndY; // �`��J�n���J�n���� Y ���W�A�I�����W
	int maxX,minX;  // �G�b�W���W�̍ő�ŏ��l
//	char *p;
	unsigned char color1;

	DWORD dwScanData,dwDest; // �G�b�W�̍��W�f�[�^�Ɠ]����̃x�[�X�A�h���X
//	int x0,x1,x2,y0,y1,y2;

//	short alpha,alphaop,ialpha;
//	short cc1,cc2,cc3,a1,a2,a3;
	unsigned char *up;

	// �G�b�W�̍��W�̃X�L����
	ScanLine(lpPolyData, scanData,nDestWidth,nDestHeight,&nStartY,&nEndY);
	
	// �͈͊O�Ȃ�`�悵�Ȃ�
	if(nStartY >= nDestHeight || nEndY < 0) { resY0 = resY1 = -1; return; }

	resY0 = nStartY;
	resY1 = nEndY;

	// Fill Color
	color1 = (unsigned char)( lpPolyData->color & 0xff );

	// �]����o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�Z�b�g
	// �]����o�b�t�@(DIB)�͏㉺�����]���Ă���̂ɒ���((nDestHeight-1-nStartY)�̏�)

	dwDest = (DWORD)lpDest + (DWORD)((nDestHeight-1-nStartY)*nDestWidth2);
	dwScanData = (DWORD)scanData + (DWORD)(nStartY*sizeof(SCANDATA));

	// nStartY ���� nEndY �܂ŏォ�珇�ɕ`��
	for(y = nStartY; y < nEndY; y++){
	
		// �G�b�W��(�]����摜(dwDest)��ł�)���W�Z�b�g
		minX = *(int *)(dwScanData);
		maxX = *(int *)(dwScanData+4);

		if(minX < 0) minX = 0;
		if(maxX >= 0){

			// ������E�ɉ��ɕ`�悵�Ă���
			maxX = min(nDestWidth-1,maxX);
			up = (unsigned char *)dwDest + minX;
			for(x = minX; x < maxX; x++){
	
			// �R�s�[
			*up++ = color1;
	
			}
		}
		// �o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�X�V
		dwDest -= nDestWidth2;
		dwScanData += sizeof(SCANDATA);
	}
}


void DrawPolygonTexP( POLY4 *lpPolyData )
{
	int i2,x,y; // ���[�v�p
	int nStartY,nEndY; // �`��J�n���J�n���� Y ���W�A�I�����W
	int maxX,minX;  // �G�b�W���W�̍ő�ŏ��l
	char *p;
	char d1;
	DWORD tx,ty,tdx,tdy; 

	DWORD dwTexSize; // �e�N�X�`���̃T�C�Y
	DWORD dwScanData,dwDest; // �G�b�W�̍��W�f�[�^�Ɠ]����̃x�[�X�A�h���X

	// �G�b�W�̍��W�̃X�L����
	dwTexSize = (DWORD)(nTexHeight*nTexWidth);
	ScanLine( lpPolyData, scanData, nDestWidth, nDestHeight, &nStartY, &nEndY );
	
	// �͈͊O�Ȃ�`�悵�Ȃ�
	if(nStartY >= nDestHeight || nEndY < 0) { resY0 = resY1 = -1; return; }

	resY0 = nStartY;
	resY1 = nEndY;

	// �]����o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�Z�b�g
	// �]����o�b�t�@(DIB)�͏㉺�����]���Ă���̂ɒ���((nDestHeight-1-nStartY)�̏�)
	p = (char *)lpDest + ((nDestHeight-1-nStartY)*nDestWidth2);
	dwDest = (DWORD)p;
	dwScanData = (DWORD)scanData + (DWORD)(nStartY*sizeof(SCANDATA));

	//	�����ݒ�𔻒�
	//
	if ( lpPolyData->attr & NODE_ATTR_COLKEY ) goto p4transp;

	//
	//	�����F�Ȃ��`��
	//
	//
	// nStartY ���� nEndY �܂ŏォ�珇�ɕ`��
	for(y = nStartY; y < nEndY; y++){
	
	// �G�b�W��(�]����摜(dwDest)��ł�)���W�Z�b�g
	minX = *(LPLONG)(dwScanData);
	maxX = *(LPLONG)(dwScanData+4);

	if(maxX >= 0){
	
	// �e�N�X�`�����W�v�Z�p�ϐ�(16 bit �Œ菭��)
	
	tx = *(LPLONG)(dwScanData+8);
	ty = *(LPLONG)(dwScanData+12);
	tx <<= 16; 
	ty <<= 16;
	
	// �`����W�� x  �� 1 �����������̃e�N�X�`�����W�ł�
	// x �� y �̕ψʂ��v�Z
	if(maxX != minX){ 
	
	i2 = 0x10000 / (maxX-minX); // DWORD -> WORD �ϊ�
	tdx = ((*(LPLONG)(dwScanData+16)-*(LPLONG)(dwScanData+8)))*i2;
	tdy = ((*(LPLONG)(dwScanData+20)-*(LPLONG)(dwScanData+12)))*i2;

	}
	else { // ��_�̎�
	tdx = 0;
	tdy = 0;
	}
	
	// �����G�b�W(minX)�� 0 ��菬�����Ȃ� 0 �ɂȂ�܂ŉ�

	while(minX < 0){
	minX++;
	tx += tdx;
	ty += tdy;
	}
	
	// ������E�ɉ��ɕ`�悵�Ă���
	maxX = min(nDestWidth-1,maxX);
	p = (char *)(dwDest) + minX;
	for(x = minX; x < maxX; x++){
	
	// �e�N�X�`���f�[�^��ǂݍ��ޓ_���v�Z
	i2 = ((ty>>16)*nTexWidth)+(tx>>16);
	
	// �R�s�[
	if( i2 < (int)dwTexSize) {
		*p++ = lpTex[i2];
	}
	
	// �e�N�X�`�����W�ړ�
	tx += tdx;
	ty += tdy;
	}
	}
	
	// �o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�X�V
	dwDest -= nDestWidth2;
	dwScanData += sizeof(SCANDATA);
	}

	return;

p4transp:
	//
	//	�����F����`��
	//
	//
	// nStartY ���� nEndY �܂ŏォ�珇�ɕ`��
	for(y = nStartY; y < nEndY; y++){
	
	// �G�b�W��(�]����摜(dwDest)��ł�)���W�Z�b�g
	minX = *(LPLONG)(dwScanData);
	maxX = *(LPLONG)(dwScanData+4);

	if(maxX >= 0){

		// �e�N�X�`�����W�v�Z�p�ϐ�(16 bit �Œ菭��)
	
		tx = *(LPLONG)(dwScanData+8);
		ty = *(LPLONG)(dwScanData+12);
		tx <<= 16; 
		ty <<= 16;
	
		// �`����W�� x  �� 1 �����������̃e�N�X�`�����W�ł�
		// x �� y �̕ψʂ��v�Z
		if(maxX != minX){ 
	
			i2 = 0x10000 / (maxX-minX); // DWORD -> WORD �ϊ�
			tdx = ((*(LPLONG)(dwScanData+16)-*(LPLONG)(dwScanData+8)))*i2;
			tdy = ((*(LPLONG)(dwScanData+20)-*(LPLONG)(dwScanData+12)))*i2;

		}
		else { // ��_�̎�
			tdx = 0;
			tdy = 0;
		}
	
		// �����G�b�W(minX)�� 0 ��菬�����Ȃ� 0 �ɂȂ�܂ŉ�

		while(minX < 0){
			minX++;
			tx += tdx;
			ty += tdy;
		}
	
		// ������E�ɉ��ɕ`�悵�Ă���
		maxX = min(nDestWidth-1,maxX);
		p = (char *)(dwDest + minX);
		for(x = minX; x < maxX; x++) {

			// �e�N�X�`���f�[�^��ǂݍ��ޓ_���v�Z
			i2 = ((ty>>16)*nTexWidth)+(tx>>16);
	
			// �R�s�[
			if( i2 < (int)dwTexSize) {
				d1 = lpTex[i2];
				if ( d1 ) *p=d1;
				p++;
			}
		
			// �e�N�X�`�����W�ړ�
			tx += tdx;
			ty += tdy;
		}
	}
	
	// �o�b�t�@�ƃX�L�����f�[�^�̃x�[�X�A�h���X�X�V
	dwDest -= nDestWidth2;
	dwScanData += sizeof(SCANDATA);
	}
	return;
}


/*------------------------------------------------------------*/
/*
		texture process
*/
/*------------------------------------------------------------*/

static void TexInit( void )
{
	lpTex = NULL;
}


static void TexTerm( void )
{
}


void SetPolySource( void *src, int sx, int sy )
{
	lpTex = (char *)src;
	nTexWidth = sx;
	nTexWByte = ((nTexWidth*3)+3)&~3;
	nTexHeight = sy;
}


