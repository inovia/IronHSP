
#module "sprmod"

#define global ROT4096 0.00153398078125

;
;	�W�����߂ɂ��ȈՃX�v���C�g���W���[��
;

#deffunc init_sprite int _p1, int _p2, int max

	;	�X�v���C�g������
	;
	sprsx=_p1:sprsy=_p2
	dim sprflg,max
	dim sprx,max
	dim spry,max
	dim sprpx,max
	dim sprpy,max
	dim sprchr,max
	dim sprrot,max
	sprbuf=3
	sprgmode=2
	sprhx=sprsx/2
	sprhy=sprsy/2
	return

#deffunc opt_sprite int _p1, int _p2

	;	�X�v���C�g�\���ݒ�ύX
	;	opt_sprite �o�b�t�@ID, �R�s�[���[�h
	;
	sprbuf=_p1
	sprgmode=_p2
	return

#deffunc set_sprite int id, int _p1, int _p2, int _p3

	;	�X�v���C�g�ݒ�
	;
	sprflg.id=1
	sprx.id=_p1
	spry.id=_p2
	sprchr.id=_p3
	return

#deffunc draw_sprite int id, int _p1, int _p2, int _p3

	;	�X�v���C�g�\��
	;
	gmode sprgmode,sprsx,sprsy,256
	;
	foreach sprflg
	if sprflg.cnt=0 : continue
		if sprrot.cnt=0 {
			;	��]�Ȃ�
			pos sprx.cnt-sprhx,spry.cnt-sprhy
			gcopy sprbuf,0,(sprchr.cnt>>2)*sprsy
		} else {
			;	4096�ň��]�Ƃ���\��
			pos sprx.cnt,spry.cnt
			grotate sprbuf,0,(sprchr.cnt>>2)*sprsy,ROT4096*sprrot.cnt
		}
	loop
	return


#deffunc move_sprite1_init

	foreach sprflg
	set_sprite cnt,rnd(640),rnd(480)+480+sprhy,0
	sprpx.cnt=rnd(4096)
	sprpy.cnt=rnd(4)-4
	sprchr.cnt=rnd(64)
	loop
	return

#deffunc move_sprite1

	foreach sprflg
	if sprflg(cnt)=0 : continue

	sprx.cnt+=sin(ROT4096*sprpx.cnt)*4
	spry.cnt+=sprpy.cnt
	sprpx.cnt+=64
	if spry.cnt<-sprhy : spry.cnt=480+sprhy
	sprchr.cnt=(sprchr.cnt+1)&63

	loop
	return


#deffunc move_sprite2_init

	foreach sprflg
	set_sprite cnt,120,480+sprhy+cnt*240,0
	sprchr.cnt=cnt<<2
	loop
	return

#deffunc move_sprite2

	foreach sprflg
	if sprflg(cnt)=0 : continue
	spry.cnt-=1
	loop

	return

#global

