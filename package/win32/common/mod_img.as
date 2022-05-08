
#ifndef __mod_img__
#define __mod_img__

#module "mod_imgctx"

#define IID_IImgCtx   "{3050f3d7-98b5-11cf-bb82-00aa00bdce0b}"
#define CLSID_IImgCtx "{3050f3d6-98b5-11cf-bb82-00aa00bdce0b}"

#usecom  ImgCtx IID_IImgCtx CLSID_IImgCtx
#comfunc IImgCtx_Load 3 wstr,int
#comfunc IImgCtx_GetStateInfo 8 var,var,int
#comfunc IImgCtx_Draw 10 int,var
#comfunc IImgCtx_StretchBlt 12 int,int,int,int,int,int,int,int,int,int

#deffunc imgload str _p1

	;
	;	ImgCtx�𗘗p���ĉ摜�t�@�C����ǂݍ��݂܂�
	;	imgload "�t�@�C����"
	;	(BMP,JPEG,GIF,ICO,PNG�t�H�[�}�b�g��ǂݍ��݉\)
	;
	fname=_p1
	fpath=getpath( fname,32 )
	if fpath="" : fname = dir_cur + "\\" + fname
	;
	newcom pImage,ImgCtx
	IImgCtx_Load pImage,fname,0

	dim size,4
	repeat
		IImgCtx_GetStateInfo pImage,flg,size,1
		if ( flg & 0x00200000 )==0 : break
		wait 4
	loop

	IImgCtx_GetStateInfo pImage,flg,size,0
	rect=0,0,size(0),size(1)
	IImgCtx_Draw pImage,hdc,rect
	redraw 1

	delcom pImage
	return

#global

#endif


