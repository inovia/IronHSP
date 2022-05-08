;----------------------------------------------------------------
; �W���C�X�e�B�b�N���̓��W���[��2
; jstick���߂�stick���ߌ݊��ŃW���C�X�e�B�b�N�Ή��ɂ��܂�
; (mod_joystick�̏�ʌ݊��Ƃ��Ă��g�p�ł��܂�)
;  MIA 2004 / onitama 2005,2020
;  �g�p�Ɋւ��鐧���͂���܂���B�����R�ɂ��g�����������B
;----------------------------------------------------------------
;2020/4 �C��
;jstick���߂�stick���߂ƌ݊��ɂ��āA�L�[�{�[�h�̒l���擾����悤�ɂ��܂����B
;stick���߂�jstick���߂ɒu�������邾���ŃW���C�X�e�B�b�N�Ή��ɂȂ�܂��B
;�ujstick �ϐ�,�g���K�[�w��,�|�[�g�ԍ��v�̏����Ŏg�p�ł��܂��B
;
;�G���[�̏����Ǝ������A�ɂ��Ή����Ă��܂��B
;(�G���[���������Ă���Ԃ́A�ϐ��umodjoy_err�v��1�ɂȂ�܂��B)
;�ϐ��umodjoy_err�v��0�̊Ԃ̓W���C�X�e�B�b�N�̒l�����ɂ����܂��B
;(��������jstick���߂�jstick_org���߂ɒu�������܂���)

#module "joy"

#const BORDER_LOW   32768 - 4096
#const BORDER_HIGH  32768 + 4096

#uselib "winmm.dll"
#func _joyGetPosEx "joyGetPosEx" int, var

#deffunc joyGetPosEx array p1, int p2
	p1.15=0:p1=52,255
	_joyGetPosEx p2,p1
	return

#deffunc jstick_org var p1, int p2

	;	jstick �ϐ�,�|�[�g�ԍ�
	;	(stick���ߌ݊��̒l��ϐ��ɕԂ�)
	;
	if modjoy_err@ : goto *jstick_resume
	;
	jdata.15=0:jdata=52,255
	_joyGetPosEx p2,jdata
	if stat!=0 : goto *jstick_err
	res=(jdata.8)<<4
	if jdata.2<BORDER_LOW : res|=1
	if jdata.2>BORDER_HIGH : res|=4
	if jdata.3<BORDER_LOW : res|=2
	if jdata.3>BORDER_HIGH : res|=8
	p1=res
	return
*jstick_resume
	_joyGetPosEx p2,jdata
	if stat!=0 : goto *jstick_err
	p1=0
	modjoy_err@=0
	return
*jstick_err
	p1=0
	modjoy_err@=1
	return

#deffunc jstick var _p1, int _p2, int _p3

	;	jstick �ϐ�,�|�[�g�ԍ�
	;	(stick���ߌ݊��̒l��ϐ��ɕԂ�)
	;
	stick@hsp key_now,$3ffff
	jstick_org jkey,_p3
	key_now|=jkey
	trg_key=key_now^last_key&key_now
	last_key=key_now
	_p1 = (last_key & _p2) + ( trg_key & (0xfffff ^ _p2) )
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

