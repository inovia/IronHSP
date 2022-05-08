;
; HSPTV resource define and macros
;
#ifndef __hsptv_res__
#define __hsptv_res__

	; HSPTV�t�H���_�̃��\�[�X�ǂݍ��ݗp����
	;( HSP3Dish�̏ꍇ�́A���#include "hsp3dish.as"�������Ă������� )
	;
	goto *_skip_hsptv_res

#enum SE01=0
#enum SE02
#enum SE03
#enum SE04
#enum SE05
#enum SE06
#enum SE07
#enum SE08
#enum SE09
#enum SE10
#enum SE11
#enum SE12
#enum SE13
#enum SE14
#enum SE15

#enum SND01=20
#enum SND02
#enum SND03
#enum SND04
#enum SND05
#enum SND06
#enum SND07
#enum SND08
#enum SND09
#enum SND10
#enum SND11
#enum SND12
#enum SND13
#enum SND14
#enum SND15
#enum SND16
#enum SND17
#enum SND18
#enum SND19

#deffunc hsptv_resinit

	;	���\�[�X������
	;
#ifdef _HSP3DISH
	tvfolder=""
#else
	tvfolder=dir_tv
#endif
	return


#deffunc hsptv_se int _p1

	;
	;	���ʉ����܂Ƃ߂ēǂݍ���
	;	hsptv_se _p1
	;		_p1 : 1=�V���v�����ʉ�(SE01�`SE15)
	;		_p1 : 2=���A�����ʉ�(SND01�`SND19)
	;	(�ȍ~�� mmplay SE01 �ȂǂōĐ��ł��܂�)
	;
	hsptv_resinit
	if (_p1&2) {
		mmload tvfolder+"explos.wav",SND01
		mmload tvfolder+"inject.wav",SND02
		mmload tvfolder+"jp_dead.wav",SND03
		mmload tvfolder+"jp_jump.wav",SND04
		mmload tvfolder+"sel.wav",SND05
		mmload tvfolder+"se_aaa.wav",SND06
		mmload tvfolder+"se_block2.wav",SND07
		mmload tvfolder+"se_bom.wav",SND08
		mmload tvfolder+"se_break.wav",SND09
		mmload tvfolder+"se_break2.wav",SND10
		mmload tvfolder+"se_break3.wav",SND11
		mmload tvfolder+"se_click.wav",SND12
		mmload tvfolder+"se_foot.wav",SND13
		mmload tvfolder+"se_jump.wav",SND14
		mmload tvfolder+"se_jump2.wav",SND15
		mmload tvfolder+"se_puyo.wav",SND16
		mmload tvfolder+"se_shot.wav",SND17
		mmload tvfolder+"se_shot2.wav",SND18
		mmload tvfolder+"se_tyuiin.wav",SND19
	}

	if (_p1&1) {
		mmload tvfolder+"se01.wav",SE01
		mmload tvfolder+"se02.wav",SE02
		mmload tvfolder+"se03.wav",SE03
		mmload tvfolder+"se04.wav",SE04
		mmload tvfolder+"se05.wav",SE05
		mmload tvfolder+"se06.wav",SE06
		mmload tvfolder+"se07.wav",SE07
		mmload tvfolder+"se08.wav",SE08
		mmload tvfolder+"se09.wav",SE09
		mmload tvfolder+"se10.wav",SE10
		mmload tvfolder+"se11.wav",SE11
		mmload tvfolder+"se12.wav",SE12
		mmload tvfolder+"se13.wav",SE13
		mmload tvfolder+"se14.wav",SE14
		mmload tvfolder+"se15.wav",SE15
	}
	return


#deffunc hsptv_tamadot int _p1

	;
	;	�쉹�����2D�h�b�g�G�f�ނ�ǂݍ���
	;	hsptv_tamadot _p1
	;		_p1 : 0=64�~64 1=32�~32
	;	( tamadot �ɉ�ʃo�b�t�@ID���������܂� )
	;	( ceput tamadot,�ԍ� �ŕ\���ł���悤�ɂȂ�܂� )
	;
	hsptv_resinit
	if tamadot=0 : tamadot=ginfo_newid

	if (_p1=0) {
		celload tvfolder+"tamadot.png",tamadot
		tama_sx=64:tama_sy=64
	}
	if (_p1=1) {
		celload tvfolder+"tamadot2.png",tamadot
		tama_sx=32:tama_sy=32
	}
	celdiv tamadot,tama_sx,tama_sy
	return


#deffunc hsptv_tamane int _p1

	;
	;	�쉹�����2D�����G�f�ނ�ǂݍ���
	;	hsptv_tamane _p1
	;		_p1 : 0=256�~512�h�b�g�A1�`8=512�~1024�h�b�g
	;	( tamas �ɉ�ʃo�b�t�@ID���������܂� )
	;	( ceput tamas,�ԍ� �ŕ\���ł���悤�ɂȂ�܂� )
	;
	hsptv_resinit
	if tamas=0 : tamas=ginfo_newid

#ifdef _HSP3DISH
	fname="tamane_s"
#else
	fname="tamane_b"
#endif
	if (_p1=0) {
		celload tvfolder+fname,tamas
		celdiv tamas,256,512	; 256x512�h�b�g�ɋ�؂�
		return
	}
	if (_p1<1)|(_p1>8) : return
	celload tvfolder+fname+_p1,tamas
	return


#deffunc hsptv_tamasc int _p1

	;
	;	�쉹����񐧕��f�ނ�ǂݍ���
	;	hsptv_tamasc _p1
	;		_p1 : 1�`5(�o���G�[�V����)
	;	( tamasc �ɉ�ʃo�b�t�@ID���������܂� )
	;
	hsptv_resinit
	if tamasc=0 : tamasc=ginfo_newid
	if (_p1=0)  : return
	celload tvfolder+"tamane_school1_"+_p1+".png",tamasc
	return


#deffunc hsptv_keisc int _p1

	;
	;	�v��������񐧕��f�ނ�ǂݍ���
	;	hsptv_keisc _p1
	;		_p1 : 1�`5(�o���G�[�V����)
	;	( keisc �ɉ�ʃo�b�t�@ID���������܂� )
	;
	hsptv_resinit
	if keisc=0 : keisc=ginfo_newid
	if (_p1=0)  : return
	celload tvfolder+"kei_school1_"+_p1+".png",keisc
	return


#deffunc hsptv_tamawiz int _p1, local _hsptv_i

	;
	;	�쉹����񖂖@�g���f�ނ�ǂݍ���
	;	hsptv_tamawiz _p1
	;		_p1 : 1�`10(�o���G�[�V����)
	;	( tamawiz �ɉ�ʃo�b�t�@ID���������܂� )
	;
	hsptv_resinit
	if tamawiz=0 : tamawiz=ginfo_newid
	if (_p1=0)  : return
	_hsptv_i=_p1
	if _hsptv_i>5 {
		_hsptv_i=_hsptv_i-5
		celload tvfolder+"tamane_wizard2_"+_hsptv_i+".png",tamawiz
		return
	}
	celload tvfolder+"tamane_wizard1_"+_hsptv_i+".png",tamawiz
	return


#deffunc hsptv_keiknight int _p1, local _hsptv_i

	;
	;	�v���������R�m�g���f�ނ�ǂݍ���
	;	hsptv_keiknight _p1
	;		_p1 : 1�`10(�o���G�[�V����)
	;	( keiknight �ɉ�ʃo�b�t�@ID���������܂� )
	;
	hsptv_resinit
	if keiknight=0 : keiknight=ginfo_newid
	if (_p1=0)  : return
	_hsptv_i=_p1
	if _hsptv_i>5 {
		_hsptv_i=_hsptv_i-5
		celload tvfolder+"kei_knight2_"+_hsptv_i+".png",keiknight
		return
	}
	celload tvfolder+"kei_knight1_"+_hsptv_i+".png",keiknight
	return


*_skip_hsptv_res

#endif

