
#ifndef __mod_layer_fade__
#define __mod_layer_fade__

#module "mod_layer_fade"

;
;	�t�F�[�h�C���E�A�E�g���W���[��(HSP3.6b3�ȍ~)
;


#deffunc fadein

	;	�t�F�[�h�C��
	;
	_fadeadd=-_fadespeed
	return

#deffunc fadeout

	;	�t�F�[�h�A�E�g
	;
	_fadeadd=_fadespeed
	return

#deffunc fadespeed int _p1

	;	�t�F�[�h�X�s�[�h�ݒ�
	;
	_fadespeed=_p1
	if _fadespeed<=0 : _fadespeed=8
	return

#deffunc fadecolor int _p1

	;	�t�F�[�h�F�ݒ�
	;
	_fadecolor=_p1
	return

#deffunc layer_fade int _p1

	;	�t�F�[�h�C���E�A�E�g������
	;	�X�N���[�����C���[�Ƀ��W���[����o�^���܂�
	;	layer_fade _prm1
	;
	pos 0,0:sx=ginfo_sx:sy=ginfo_sy
	layerobj sx,sy,objlayer_max,*layer_main
	_fadecolor=0
	_fadeprm=255
	_fadespeed=8
	_fadeadd=-8
	return

*layer_main
	if lparam=objlayer_cmddraw : goto *layer_draw
	return
*layer_draw
	if _fadeprm<=0&_fadespeed=0 : return

	rgbcolor _fadecolor
	_fadeprm+=_fadeadd
	if _fadeprm<0 {
		_fadeprm=0
		_fadeadd=0
	}
	if _fadeprm>=255 {
		_fadeprm=255
		_fadeadd=0
		boxf
		return
	}
	gmode 3,,,_fadeprm
	grect sx/2,sy/2,0,sx,sy
	return


#global
#endif

