;
;	post effect header for HGIMG4
;
#ifndef __posthsp3gp__
#define __posthsp3gp__

#module "posthsp3gp"

#define global POSTID_NONE (0)
#define global POSTID_SEPIA (1)
#define global POSTID_GRAY (2)
#define global POSTID_BLUR (3)
#define global POSTID_BLUR2 (4)
#define global POSTID_MOSAIC (5)
#define global POSTID_CONTRAST (6)
#define global POSTID_SOBEL (7)
#define global POSTID_CRT (8)
#define global POSTID_OLDFILM (9)
#define global POSTID_GLOW (10)
#define global POSTID_GLOW2 (11)
#define global POSTID_GLOW3 (12)
#define global POSTID_CUTOFF (13)
#define global POSTID_LENGTH (14)

; �`�悷��o�b�t�@ID
#define global POST_SRC (1)

; ���������̃I�v�V����
#define global POST_RESET_OWNDRAW (1)
#define global POST_RESET_POSTLAYER (2)

#deffunc post_select int _p1

	;	�|�X�g�G�t�F�N�gID���w��
	;	(post_select 0�`10)
	;
	if postid=_p1 : return
	postid=_p1
	gosub *setup_post
	return

#deffunc post_reset int _p1

	;	�|�X�g�G�t�F�N�g������
	;	(�ŏ��ɂP�񂾂����s)
	;	(�ȍ~��buffer ID1�ɕ`�悷�邱��)
	;
	postid = -1
	postid_max = POSTID_LENGTH
	postopt = _p1
	bufid_main = 1			; �`��Ώۃo�b�t�@
	bufid_effect = 64		; �G�t�F�N�g�p�o�b�t�@
	postname=""
	sx=ginfo_sx:sy=ginfo_sy

	postlayer = objlayer_bg
	if postopt&POST_RESET_POSTLAYER : postlayer = objlayer_posteff
	layerobj sx,sy,postlayer,*post_draw
	return

#deffunc post_setprm double _p1, double _p2, int _p3

	;	�|�X�g�G�t�F�N�gID���Ƃ̐ݒ�
	;	(post_setprm ����prm,����prm)
	;
	if postid<0 : return
	postopt_p1 = _p1
	postopt_p2 = _p2
	postopt_p3 = _p3
	gosub post_optsub
	return

#deffunc post_getname var _p1

	;	�|�X�g�G�t�F�N�g�����擾
	;	(post_getname �ϐ���)
	;
	_p1 = postname
	return

#deffunc post_getmaxid var _p1

	;	�|�X�g�G�t�F�N�gID�ő�l���擾
	;	(post_getmaxid �ϐ���)
	;
	_p1 = postid_max
	return

#deffunc post_drawstart

	;	�|�X�g�G�t�F�N�g�p�̉�ʕ`��J�n
	;
	gsel POST_SRC
	redraw 0
	return

#deffunc post_drawend

	;	�|�X�g�G�t�F�N�g�p�̉�ʕ`��I��
	;
	redraw 1
	gosub post_worksub
	if postopt&POST_RESET_OWNDRAW : return

	gsel 0
	redraw 0
	redraw 1

	return


*setup_post
	;	�|�X�g�G�t�F�N�g������
	gsel 0
	postname="None"
	post_prmsub = *setup_postsub
	post_optsub = *setup_postsub
	post_worksub = *setup_postsub

	if postid=0 : gosub *setup_none
	if postid=1 : gosub *setup_sepia
	if postid=2 : gosub *setup_gray
	if postid=3 : gosub *setup_blur
	if postid=4 : gosub *setup_blur2
	if postid=5 : gosub *setup_mosaic
	if postid=6 : gosub *setup_contrast
	if postid=7 : gosub *setup_sobel
	if postid=8 : gosub *setup_crt
	if postid=9 : gosub *setup_oldfilm
	if postid=10 : gosub *setup_glow
	if postid=11 : gosub *setup_glow2
	if postid=12 : gosub *setup_glow3
	if postid=13 : gosub *setup_cutoff

	gsel 0
	return

*post_draw
	;	�|�X�g�G�t�F�N�g�����s����ʂ��X�V����
	;	(buffer ID1�̓��e�����C����ʂɔ��f������)
	;
	if lparam != objlayer_cmddraw : return
	;
	if postid<0 : return
	gosub post_prmsub		; �|�X�g�G�t�F�N�g�`��J�n
	return


*setup_postsub
	return

*exec_copybuf
	;	buffer1 -> ���C����ʂɃV�F�[�_�[�`��
	pos 0,0:gmode 0
	celput bufid_main
	return

*setup_none
	;	�t�B���^�[�Ȃ�
	buffer bufid_main,sx,sy,screen_offscreen
	post_prmsub = *exec_copybuf
	return

*setup_sepia
	;	�Z�s�A�t�B���^�[
	postname="Sepia Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_sepia.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	post_prmsub = *exec_copybuf
	return

*setup_gray
	;	�����t�B���^�[
	postname="Gray Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_grayscale.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	post_prmsub = *exec_copybuf
	return

*setup_blur
	;	�ڂ����t�B���^�[
	postname="Blur Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_blur.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	post_prmsub = *exec_blur
	post_optsub = *opt_blur
	blur_level=4.0
	blur_base=1.0/sx
	gpgetmat blur_mat, bufid_main, GPGETMAT_OPT_SCRMAT
	return

*opt_blur
	blur_level = postopt_p1
	return

*exec_blur
	;	�p�����[�^�[�X�V
	dd=blur_level*blur_level
	gpmatprm1 blur_mat, "u_length", blur_base*blur_level
	gosub *exec_copybuf
	return

*setup_mosaic
	;	���U�C�N�t�B���^�[
	postname="Mosaic Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_mosaic.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	gfilter 2
	post_prmsub = *exec_copybuf
	return

*setup_sobel
	;	�֊s���o�t�B���^�[
	postname="Sobel Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_sobel.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	post_prmsub = *exec_copybuf
	gpgetmat sobel_mat, bufid_main, GPGETMAT_OPT_SCRMAT
	gpmatprm1 sobel_mat, "u_width", 0.5/sx
	gpmatprm1 sobel_mat, "u_height", 0.5/sy
	return

*setup_oldfilm
	;	�Â��t�B�����t�B���^�[
	postname="Old Film Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_oldfilm.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	post_prmsub = *exec_oldfilm
	gpgetmat oldfilm_mat, bufid_main, GPGETMAT_OPT_SCRMAT
	gpmatprm1 oldfilm_mat, "u_sepiaValue", 0.8
	gpmatprm1 oldfilm_mat, "u_noiseValue", 0.4
	gpmatprm1 oldfilm_mat, "u_scratchValue", 0.4
	gpmatprm1 oldfilm_mat, "u_innerVignetting", 0.9
	gpmatprm1 oldfilm_mat, "u_outerVignetting", 0.9
	return

*exec_oldfilm
	;	�p�����[�^�[�X�V
	getreq etime,SYSREQ_TIMER
	gpmatprm1 oldfilm_mat, "u_elapsedTime", etime
	dd=double(rnd(32768))
	gpmatprm1 oldfilm_mat, "u_random", dd / 32768
	gosub *exec_copybuf
	return

*setup_glow
	;	�O���[�t�B���^�[
	postname="Glow Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_bright.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	gpgetmat glow_cutoff, bufid_main, GPGETMAT_OPT_SCRMAT

	gpusershader "res/shaders/sprite.vert", "res/shaders/p_blur.frag", ""
	buffer bufid_effect,sx/4,sy/4,screen_offscreen + screen_usergcopy
	gfilter 2

	buffer bufid_effect+1,sx/8,sy/8,screen_offscreen + screen_usergcopy
	gfilter 2

	buffer bufid_effect+2,sx/16,sy/16,screen_offscreen + screen_usergcopy
	gfilter 2
	post_prmsub = *exec_glow
	post_optsub = *opt_glow
	post_worksub = *exec_glowwork
	gpgetmat glow_mat, bufid_effect+1, GPGETMAT_OPT_SCRMAT
	glow_rate=64
	glow_bright=0.3
	return

*opt_glow
	glow_rate=0+postopt_p1
	glow_bright=postopt_p2
	return

*exec_glowwork
	;	buffer1 -> buffer2�ɏk�����ăR�s�[
	gpmatprm1 glow_cutoff, "u_brightness", glow_bright
	gsel bufid_effect
	redraw 0
	gfilter 2
	pos 0,0:gmode 0
	gzoom sx/4,sy/4, bufid_main, 0,0, sx,sy
	redraw 1

	glow_base=1.0/(sx/4)
	gpmatprm1 glow_mat, "u_length", glow_base

	gsel bufid_effect+1
	redraw 0
	gfilter 2
	pos 0,0:gmode 0
	gzoom sx/8,sy/8, bufid_effect, 0,0, sx/4,sy/4
	redraw 1

	glow_base=1.0/(sx/8)
	gpmatprm1 glow_mat, "u_length", glow_base

	gsel bufid_effect+2
	redraw 0
	gfilter 2
	pos 0,0:gmode 0
	gzoom sx/16,sy/16, bufid_effect+1, 0,0, sx/8,sy/8
	redraw 1
	return

*exec_glow
	;	buffer1��2���������ĕ`��
	rgbcolor 0:boxf
	pos 0,0:gmode 3,,,64
	gpmatprm1 glow_cutoff, "u_brightness", 0.0
	celput bufid_main

	gfilter 2
	pos 0,0:gmode 5,,,glow_rate
	gzoom sx,sy, bufid_effect+2, 0,0, sx/16,sy/16
	pos 0,0:gmode 5,,,glow_rate/2
	gzoom sx,sy, bufid_effect+1, 0,0, sx/8,sy/8
	return


*setup_crt
	;	�u���E���ǃt�B���^�[
	postname="CRT Filter"
	celload "res/crtmask.png",bufid_effect	; �I�[�o�[���C�摜
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_crtmonitor.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	post_prmsub = *exec_crt
	post_optsub = *opt_crt
	gpgetmat crt_mat, bufid_main, GPGETMAT_OPT_SCRMAT
	crt_curvex=0.5		; X�����̘p�ȗ�
	crt_curvey=0.4		; Y�����̘p�ȗ�
	gpmatprm1 crt_mat, "u_curvex", crt_curvex
	gpmatprm1 crt_mat, "u_curvey", crt_curvey
	return

*opt_crt
	crt_curvex=postopt_p1		; X�����̘p�ȗ�
	crt_curvey=postopt_p2		; Y�����̘p�ȗ�
	return

*exec_crt
	gosub *exec_copybuf
	;	�I�[�o�[���C��`��
	pos 0,0:gmode 1
	gzoom sx,sy,bufid_effect,0,0,960,640
	return

*setup_contrast
	;	�R���g���X�g�t�B���^�[
	postname="Contrast Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_contrast.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	post_prmsub = *exec_copybuf
	post_optsub = *opt_contrast
	gpgetmat cont_mat, bufid_main, GPGETMAT_OPT_SCRMAT
	contrast_level=2.0		; �R���g���X�g�������l
	contrast_bright=-0.2		; �R���g���X�g���邳
	gpmatprm1 cont_mat, "u_contrast", contrast_level
	gpmatprm1 cont_mat, "u_brightness", contrast_bright
	return
*opt_contrast
	contrast_level=postopt_p1	; �R���g���X�g�������l
	contrast_bright=postopt_p1	; �R���g���X�g���邳
	return


*setup_blur2
	;	�K�E�X�ڂ����t�B���^�[(���i��)
	;	(�����ڂ������|���邱�Ƃ��ł��܂����������d���Ȃ�܂�)
	postname="Blur Filter 2"
	buffer bufid_main,sx,sy,screen_offscreen
	gfilter 2
	sx2=sx:sy2=sy
	gpusershader "res/shaders/p_blur2.vert", "res/shaders/p_blur2.frag", ""
	buffer bufid_effect,sx2,sy2,screen_offscreen + screen_usergcopy
	gfilter 2
	buffer bufid_effect+1,sx2,sy2,screen_offscreen + screen_usergcopy
	gfilter 2
	post_worksub = *exec_blur2
	post_optsub = *opt_blur2
	gpgetmat blur_mat, bufid_effect, GPGETMAT_OPT_SCRMAT
	gpgetmat blur_mat2, bufid_effect+1, GPGETMAT_OPT_SCRMAT

	blur_level=6.0			; �ڂ������x(1.0�`10.0���x)
	blur_stepx=1.0/sx2
	blur_stepy=1.0/sy2
	
	return

*opt_blur2
	blur_level=postopt_p1
	return

*exec_blur2
	;	�p�����[�^�[�X�V
	dd=blur_level
	gsel bufid_effect
	redraw 0:pos 0,0:gmode 0
	gfilter 2
	gzoom sx2,sy2,bufid_main,0,0,sx,sy:redraw 1

*exec_blur_loop
	;	buffer1 -> buffer2�ɃR�s�[
	gpmatprm1 blur_mat, "u_length", blur_stepx*dd
	gpmatprm1 blur_mat, "u_length2", 0.0
	gsel bufid_effect+1
	redraw 0:gfilter 2:pos 0,0:gmode 0:celput bufid_effect:redraw 1
	dd-=1.0

	if dd<=1.0 : post_prmsub = *exec_blur_done : return

	;	buffer2 -> buffer1�ɃR�s�[
	gpmatprm1 blur_mat2, "u_length", 0.0
	gpmatprm1 blur_mat2, "u_length2", blur_stepy*dd
	gsel bufid_effect
	redraw 0:gfilter 2:pos 0,0:gmode 0:celput bufid_effect+1:redraw 1
	dd-=1.0

	if dd<=1.0 : post_prmsub = *exec_blur_done2 : return

	goto *exec_blur_loop

*exec_blur_done2
	;	buffer1 -> buffer0�ɃR�s�[
	gpmatprm1 blur_mat, "u_length", 0.0
	gpmatprm1 blur_mat, "u_length2", blur_stepx*dd
	gfilter 2
	pos 0,0:gmode 0
	gzoom sx,sy,bufid_effect,0,0,sx2,sy2
	return

*exec_blur_done
	;	buffer2 -> buffer0�ɃR�s�[
	gpmatprm1 blur_mat2, "u_length", blur_stepy*dd
	gpmatprm1 blur_mat2, "u_length2", 0.0
	gfilter 2
	pos 0,0:gmode 0
	gzoom sx,sy,bufid_effect+1,0,0,sx2,sy2
	return


*setup_glow2
	;	�O���[�t�B���^�[2
	postname="Glow Filter2"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_cutoff.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	gfilter 2
	gpgetmat glow_cutoff, bufid_main, GPGETMAT_OPT_SCRMAT

	sx2=sx:sy2=sy
	gpusershader "res/shaders/p_blur2.vert", "res/shaders/p_blur2.frag", ""
	buffer bufid_effect,sx2,sy2,screen_offscreen + screen_usergcopy
	gfilter 2
	buffer bufid_effect+1,sx2,sy2,screen_offscreen + screen_usergcopy
	gfilter 2
	post_worksub = *exec_glow2
	post_optsub = *opt_glow2
	gpgetmat blur_mat, bufid_effect, GPGETMAT_OPT_SCRMAT
	gpgetmat blur_mat2, bufid_effect+1, GPGETMAT_OPT_SCRMAT

	blur_level=10.0			; �ڂ������x(1.0�`10.0���x)
	blur_stepx=1.0/sx2
	blur_stepy=1.0/sy2
	glow_rate=160
	cutoff_rate=0.3
	glow_gmode=5
	return

*setup_glow3
	;	�O���[�t�B���^�[3
	gosub *setup_glow2
	postname="Glow Filter3"
	glow_rate=128
	cutoff_rate=0.5
	glow_gmode=3
	return

*opt_glow2
	glow_rate=0+postopt_p1
	cutoff_rate=postopt_p2
	if postopt_p3>0 : blur_level=0.0+postopt_p3
	return

*exec_glow2
	dd=blur_level
	gsel bufid_effect
	gpmatprm1 glow_cutoff, "u_ratio", cutoff_rate
	redraw 0:pos 0,0:gmode 0
	gzoom sx2,sy2,bufid_main,0,0,sx,sy:redraw 1
	gpmatprm1 glow_cutoff, "u_ratio", 0.0

*exec_glow_loop
	;	buffer1 -> buffer2�ɃR�s�[
	gpmatprm1 blur_mat, "u_length", blur_stepx*dd
	gpmatprm1 blur_mat, "u_length2", 0.0
	gsel bufid_effect+1:redraw 0:pos 0,0:gmode 0:celput bufid_effect:redraw 1
	dd-=1.0

	if dd<=1.0 : post_prmsub = *exec_glow_done : return

	;	buffer2 -> buffer1�ɃR�s�[
	gpmatprm1 blur_mat2, "u_length", 0.0
	gpmatprm1 blur_mat2, "u_length2", blur_stepy*dd
	gsel bufid_effect:redraw 0:pos 0,0:gmode 0:celput bufid_effect+1:redraw 1
	dd-=1.0

	if dd<=1.0 : post_prmsub = *exec_glow_done2 : return

	goto *exec_glow_loop

*exec_glow_done2
	;	buffer1 -> buffer0�ɃR�s�[
	gpmatprm1 blur_mat, "u_length", 0.0
	gpmatprm1 blur_mat, "u_length2", blur_stepx*dd
	pos 0,0:gmode 0
	celput bufid_main
	gmode glow_gmode,,,glow_rate:pos 0,0
	gzoom sx,sy,bufid_effect,0,0,sx2,sy2
	pos 0,0:gmode glow_gmode,,,glow_rate:celput bufid_main
	return

*exec_glow_done
	;	buffer2 -> buffer0�ɃR�s�[
	gpmatprm1 blur_mat2, "u_length", blur_stepy*dd
	gpmatprm1 blur_mat2, "u_length2", 0.0
	pos 0,0:gmode 0
	celput bufid_main
	gmode glow_gmode,,,glow_rate:pos 0,0
	gzoom sx,sy,bufid_effect+1,0,0,sx2,sy2
	pos 0,0:gmode glow_gmode,,,glow_rate:celput bufid_main
	return


*setup_cutoff
	;	�J�b�g�I�t�t�B���^�[
	postname="Cutoff Filter"
	gpusershader "res/shaders/sprite.vert", "res/shaders/p_cutoff.frag", ""
	buffer bufid_main,sx,sy,screen_offscreen + screen_usergcopy
	post_prmsub = *exec_copybuf
	post_optsub = *opt_cutoff
	gpgetmat glow_cutoff, bufid_main, GPGETMAT_OPT_SCRMAT
	gpmatprm1 glow_cutoff, "u_ratio", 0.8
	return

*opt_cutoff
	gpmatprm1 glow_cutoff, "u_ratio", postopt_p1
	return



#global

#endif
