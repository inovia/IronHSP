;----------------------------------------------------------------
; �W���C�X�e�B�b�N���̓��W���[�� MIA 2004 / onitama 2005
;  �g�p�Ɋւ��鐧���͂���܂���B�����R�ɂ��g�����������B
;----------------------------------------------------------------
;2017/9/8 �C��
;�ꕔ��Windows 10���ɂ����āA;�W���C�X�e�B�b�N�擾���̃G���[�ɂ��A
;���̌�̓��삪�x���Ȃ邱�Ƃ����邽��
;�G���[�����������ꍇ�́A�ȍ~�̎擾���L�����Z������悤�ɏC�����܂���
;�G���[�����������ꍇ�́A�ϐ��umodjoy_err�v��1�ɂȂ�܂��B
;�ϐ��umodjoy_err�v��0�̊Ԃ̓W���C�X�e�B�b�N�̒l�����ɂ����܂��B

#module "joy"

#const BORDER_LOW   32768 - 4096
#const BORDER_HIGH  32768 + 4096

#uselib "winmm.dll"
#func _joyGetPosEx "joyGetPosEx" int, var

#deffunc joyGetPosEx array p1, int p2
	p1.15=0:p1=52,255
	_joyGetPosEx p2,p1
	return

#deffunc jstick var p1, int p2
	;	jstick �ϐ�,�|�[�g�ԍ�
	;	(stick���ߌ݊��̒l��ϐ��ɕԂ�)
	;
	if modjoy_err@ : p1=0 : return
	;
	jdata.15=0:jdata=52,255
	_joyGetPosEx p2,jdata
	if stat!=0 : p1=0 : modjoy_err@=1 : return
	res=(jdata.8)<<4
	if jdata.2<BORDER_LOW : res|=1
	if jdata.2>BORDER_HIGH : res|=4
	if jdata.3<BORDER_LOW : res|=2
	if jdata.3>BORDER_HIGH : res|=8
	p1=res
	return

#global


;----------------------------------------------------------------
; �T���v���R�[�h
;----------------------------------------------------------------
;----------------------------------------------------------------
; joyGetPosEx data, �|�[�g�ԍ�
;   stat = 0 �ł���Γ��͂͐���ł��B
;	data.0 = ��� 52  ������܂�
;	data.1 = ��� 255 ������܂�
;	data.2 = �� 1 ���̏�ԁi���ʂ̃W���C�X�e�B�b�N�� X ���j
;	data.3 = �� 2 ���̏�ԁi���ʂ̃W���C�X�e�B�b�N�� Y ���j
;	data.4 = �� 3 ���̏�ԁi�X���b�g�����j
;	data.5 = �� 4 ���̏��
;	data.6 = �� 5 ���̏��
;	data.7 = �� 6 ���̏��
;	data.8 = �{�^���̏�ԁi�ő�32�{�^���j
;	data.9 = �����ɉ�����Ă���{�^���̐�
;	data.10 = POV �X�C�b�`�̏��
;	data.11 = �\�����1
;	data.12 = �\�����2
;----------------------------------------------------------------
/*
	repeat
		redraw 0
		color 255,255,255 : boxf : color 0,0,0
		joyGetPosEx data, 0
		pos 0,0 : mes "stat = " + stat
		repeat 13 : mes data.cnt : loop
		redraw 1 : await 30
	loop
*/
