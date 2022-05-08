;
; �X�e�[�^�X�o�[�쐬���W���[��
;
#ifndef __mod_stbar__
#define __mod_stbar__

#module stbar
#uselib "user32"
#func	GetWindowRect "GetWindowRect" int, var

#deffunc stbar_bye
	; �X�e�[�^�X�o�[�j��(�ʏ�͌Ă΂Ȃ��Ă�OK�ł�)
	act=ginfo_sel
	if act>=length(sthwnd) : return
	if sthwnd(act)=0 : return
	clrobj stbar(act)
	return

#deffunc stbar_ini
	; �X�e�[�^�X�o�[�쐬
	;
	act=ginfo_sel
	winobj "msctls_statusbar32","",0,$50000000
	stbar(act) = stat		; �X�e�[�^�X�o�[�̃I�u�W�F�N�gID
	if stbar(act)<0 : dialog "�X�e�[�^�X�o�[�쐬�Ɏ��s���܂���" : return
	sthwnd(act) = objinfo(stbar(act), 2)	; �X�e�[�^�X�o�[��hWnd
	dim stsize, 4 		; RECT�\����
	GetWindowRect sthwnd(act), stsize
	stbar_sx(act) = stsize(2) - stsize(0)	; �X�e�[�^�X�o�[�̕�
	stbar_sy(act) = stsize(3) - stsize(1)	; �X�e�[�^�X�o�[�̍���
	return

#deffunc stbar_text str _p1
	; �X�e�[�^�X�o�[�Ƀe�L�X�g��ݒ�
	act=ginfo_sel
	if act>=length(sthwnd) : return
	if sthwnd(act)=0 : return
	msg=_p1
	sendmsg sthwnd(act), 0x0401, 0, varptr(msg) ; SB_SETTEXT�𑗂�
	return

#deffunc stbar_resize
	; �X�e�[�^�X�o�[�̃��T�C�Y���b�Z�[�W(WM_SIZE)����
	act=ginfo_sel
	if act>=length(sthwnd) : return
	if sthwnd(act)=0 : return
	sendmsg sthwnd(act), 0x0005, 0, 0	 ; WM_SIZE�𑗂�
	return

#global
#endif

