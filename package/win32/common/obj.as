;
; HSP3.0 Utility macros and functions
;
#ifndef __obj__
#define __obj__

#module "llmod_obj"

#uselib "user32.dll"
#func _IsWindowEnabled "IsWindowEnabled" int
#func _EnableWindow "EnableWindow" int,int
#func _GetWindowRect "GetWindowRect" int,int
#func _MoveWindow "MoveWindow" int,int,int,int,int,int
#func _ScreenToClient "ScreenToClient" int,int

#deffunc objgray int v1,int v2

	;================================================================================
	; objgray n1,n2		�I�u�W�F�N�g�̎g�p�A�s�ݒ�
	;
	;  n1 : �I�u�W�F�N�g��ID
	;  n2 : �g�p�ɂ��邩�s���邩�̃t���O
	;================================================================================
	; button�Ȃǂ̃I�u�W�F�N�g���g�p�ɂ�����A�s�ɂ����肵�܂��B
	; n1�ɂ�button��listview�Ȃǂ�ID�������܂��B
	; n2��0�ɂ���ƃI�u�W�F�N�g���g�p�ł��Ȃ���Ԃɂ��A1�ɂ���Ǝg�p�ł���
	; ��Ԃɂ��܂��B
	; n2��-1�ɂ���Ƃ��̃I�u�W�F�N�g���g�p���s���𒲂ׂ܂��B
	;
	if v2<0 {
		_IsWindowEnabled objinfo_hwnd(v1)
	}else{
		_EnableWindow objinfo_hwnd(v1),v2
	}
	return stat


#deffunc p_scrwnd array v4

	;================================================================================
	; p_scrwnd v1			�X�N���[�����W�n���E�B���h�E���W�n�ɕϊ�
	;
	;  v1 : �X�N���[�����W�n�����������l�ϐ�
	;================================================================================
	;
	;<>����
	; �X�N���[�����W�n���E�B���h�E���W�n�ɕϊ����܂��B
	; v1��x���W�Ay���W�������Ă����܂��B
	; �`��ΏۂƂȂ��Ă���E�B���h����ɂ��܂��B
	;��)
	;	ginfo
	;	x=prmx,prmy
	;	p_scrwnd x	;�X�N���[�����W�n���E�B���h�E���W�n�ɕϊ�
	;
	mref bmscr,67
	prm=bmscr.13
	_ScreenToClient prm, varptr(v4)
	return


#deffunc getobjsize array v1,int v2

	;================================================================================
	; getobjsize v1,n2		�I�u�W�F�N�g�̃T�C�Y�ƈʒu�擾
	;
	;  v1 : �I�u�W�F�N�g�̃T�C�Y�A�ʒu���擾���邽�߂̐��l�ϐ�
	;  n2 : �I�u�W�F�N�g��ID
	;================================================================================
	;
	;<>����
	; �I�u�W�F�N�g�̃T�C�Y�ƈʒu���擾���܂��B
	; n2�ɂ�button��listview�Ȃǂ�ID�������܂��B
	; v1�ɂ̓I�u�W�F�N�g�̃T�C�Y�A�ʒu���ȉ��̂悤�ɑ������܂��B
	;	v1.0	��
	;	v1.1	����
	;	v1.2	�����x���W
	;	v1.3	�����y���W
	;	v1.4	�E����x���W
	;	v1.5	�E����y���W
	; �e���W�̓E�B���h�E���W�n�ł��B
	;
	;typedef struct _RECT {    // rc  
	;    LONG left; 
	;    LONG top; 
	;    LONG right; 
	;    LONG bottom; 
	;} RECT; 

	mref bmscr,67
	prm=bmscr.13
	v1.5=0

	_GetWindowRect objinfo_hwnd(v2), varptr(v1)+8
	res=stat
	v1=v1.4-v1.2 , v1.5-v1.3
	_ScreenToClient prm, varptr(v1)+8
	_ScreenToClient prm, varptr(v1)+16
	return res


#deffunc resizeobj int v1,array v2,int v3

	;================================================================================
	; resizeobj n1,v2,n3		�I�u�W�F�N�g�̃T�C�Y�ύX
	;
	;  n1 : �I�u�W�F�N�g��ID
	;  v2 : �T�C�Y�A�ʒu�����������l�ϐ�
	;  n3 : �ʒu�A�T�C�Y��ύX���Ȃ����ǂ����̃t���O
	;================================================================================
	;
	;<>����
	; �I�u�W�F�N�gn1�̃T�C�Y��ύX���܂��B
	; v2�ɂ͕��A�����Ax���W,y���\�̏��ɑ�����Ă����܂��B
	; n3��1�ɂ���ƈʒu��ς����ɃT�C�Y�����ύX���܂��B
	; n3��2�ɂ���ƃT�C�Y��ς����Ɉʒu�����ύX���܂��B
	;
	;��)
	;	button "width*2",wx2
	;	button "height*2",hx2
	;	input s,100,20
	;	ipt_id=2
	;	;����40�A������30�ɂ���(0,80)�Ɉړ�����
	;	s=40,30,0,80
	;	resizeobj ipt_id,s
	;	stop
	;*wx2
	;	;����2�{�ɂ���
	;	getobjsize s,ipt_id
	;	s=s*2
	;	resizeobj ipt_id,s
	;	stop
	;*hx2
	;	;������2�{�ɂ���
	;	getobjsize s,ipt_id
	;	s.1=s.1*2
	;	resizeobj ipt_id,s
	;	stop
	;
	sx=v2(0):sy=v2(1):x=v2(2):y=v2(3)
	if v3 {			
		getobjsize m,v1		;getobjsize��m.0����w,h,x,y����������
		if stat=-1 : return stat
		if v3=1 : x=m(2):y=m(3)		;�ʒu��ύX���Ȃ�
		if v3=2 : sx=m:sy=m(1)		;�T�C�Y��ύX���Ȃ�
	}
	_MoveWindow objinfo_hwnd(v1),x,y,sx,sy,1
	return stat


#global


#endif
