#ifndef __MOD_PICFONT
#define __MOD_PICFONT

;0�`9�AA�`Z�Ȃǂ̊�{�I�ȕ����t�H���g���摜�Ŏ����A
;�����\�����邽�߂̃��W���[���ł��B
;����̕����t�H���g�𗘗p����ۂɎg�p���邱�Ƃ��ł��܂��B
;�����̃t�H���g���摜�ɕϊ�����T���v��(mkfont.hsp)���p�ӂ��Ă��܂��B

#module mod_picfont
#deffunc picfont int _p1, int _p2, int _p3, int _p4, int _p5

	;	picfont id, cx, cy, mode, offset
	;	(�摜���g�p�����t�H���g�\������)
	;	id : �t�H���g�摜�̂���o�b�t�@ID
	;	cx,cy : �t�H���g�P�����������XY�T�C�Y
	;	mode : �\�����̃��[�h(gmode�̃��[�h�l)
	;	(�����͔��p�p�����̂�)
	;
	sx=_p2:if sx=0 : sx=16
	sy=_p3:if sy=0 : sy=16
	mode=_p4:id=_p1
	ofsx=_p5
	return

#deffunc picfprt str _p1

	;	picfprt "message"
	;	(�摜���g�p�����t�H���g�\�����s�Ȃ��܂�)
	;	"message" : �\�����郁�b�Z�[�W
	;	�\�����W�́Apos�Ŏw�肵���ʒu����
	;
	x=ginfo_cx:xs=x
	y=ginfo_cy
	i=0:gmode mode,sx,sy
	st=_p1

	repeat
	a1=peek(st,i):i++:if a1=0 : break
	if a1=13 {
		a1=peek(st,i)
		if a1=10 : i++
		x=xs : y+=sy : continue	; ���s
	} else {
		by=a1/16*sy:bx=a1\16*sx
		pos x,y:gcopy id,bx,by
	}
	x+=sx+ofsx
	loop

	pos xs,y+sy
	return

#global
#endif

