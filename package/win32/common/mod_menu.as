
; ���j���[�o�[�쐬���W���[��
; http://quasiquote.org/hspwiki/
;       thanks ���傭�� ����
;               http://yokohama.cool.ne.jp/chokuto/urawaza/menu1.html
;               http://yokohama.cool.ne.jp/chokuto/urawaza/menu2.html

#ifndef __mod_menu__
#define __mod_menu__

#module "menumod"

; DLL�̃��[�h�Ɗ֐��̐錾�E�������Ȃ�
#uselib "user32.dll"
#func CreateMenu         "CreateMenu"
#func CreatePopupMenu    "CreatePopupMenu"
#func AppendMenu         "AppendMenuA"           int, int, int, str
#func SetMenu            "SetMenu"               int, int
#func DrawMenuBar        "DrawMenuBar"           int
#func PostMessage        "PostMessageA"          int, int, sptr, sptr

; �E�B���h�E���b�Z�[�W���`
#const global WM_CLOSE                          0x0010
#const global WM_COMMAND                        0x0111

#deffunc newmenu var _p1, int _p2
	;
	;	�V�������j���[�n���h�����擾����
	;
	;	newmenu p1,p2
	;		p1 : ���ʂ��i�[����ϐ���
	;		p2 : 0=���j���[���ڗp / 1=�|�b�v�A�b�v���ڗp
	;
	if _p2=0 : CreateMenu
	if _p2=1 : CreatePopupMenu
	_p1 = stat
	return

#deffunc addmenu int _p1, str _p2, int _p3, int _p4
	;
	;	���j���[���ڂ�ǉ�����
	;
	;	addmenu p1,p2,p3,p4
	;		p1 : ���j���[�n���h��
	;		p2 : ���j���[������
	;		p3 : ���j���[�A�C�e��ID�l
	;		p4 : ���j���[���ڑ���
	;
        AppendMenu _p1, _p4, _p3, _p2
	return

#deffunc applymenu int _p1
	;
	;	���j���[���E�B���h�E�Ɋ��蓖�Ă�
	;
	;	applymenu p1
	;		p1 : ���j���[�n���h��
	;
        SetMenu hwnd, _p1      ; ���j���[���E�B���h�E�Ɋ��蓖�Ă�
        DrawMenuBar hwnd         ; ���j���[���ĕ`��
	return

#global

#endif

