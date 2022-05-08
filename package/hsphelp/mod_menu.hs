%ver
3.3
%date
2009/08/01
%author
onitama�ithanks ���傭�� ����j

%dll
mod_menu

%note
mod_menu.as���C���N���[�h���邱�ƁB

%port
Win
Let

%url
http://yokohama.cool.ne.jp/chokuto/urawaza/api/AppendMenu.html

%type
���[�U�[�g������

%group
���j���[�o�[�쐬


%index
addmenu
���j���[���ڂ�ǉ�����

%prm
p1, p2, p3, p4
p1 : ���j���[�n���h��
p2 : ���j���[������
p3 : ���j���[�A�C�e��ID�l
p4 : ���j���[���ڑ���

%inst
newmenu�ō쐬�������j���[�ɍ��ڂ�ǉ����܂��B
���j���[�̍쐬�Ɏ��s�����stat��0���Ԃ�܂��B
^
p1�ɂ͍��ڂ�ǉ����郁�j���[�̃n���h�����w�肵�܂��B
^
p2�ɂ̓��j���[�A�C�e���ɕ\�����镶������w�肵�܂��B���p��&�ɑ����Ĕ��p�A���t�@�x�b�g���L�q����ƁA�V���[�g�J�b�g�L�[�Ƃ��Ċ��蓖�Ă邱�Ƃ��ł��܂��B
^
p3�ɂ̓��j���[�A�C�e����ID���w�肵�܂��Bp4��0x0010���w�肵���ꍇ�́A�h���b�v�_�E�����j���[�܂��̓T�u���j���[�̃n���h�����w�肵�܂��B
^
p4�ɂ̓��j���[�A�C�e���̃I�v�V�������w�肵�܂��B�I�v�V�����͉��Z���邢��OR���Z�őg�ݍ��킹�Ďg�p�ł��܂��B
html{
<table border="1">
<caption>addmenu���߂̑�4�p�����[�^�i�ꕔ�j</caption>
<tr><td>0x0000</td><td>�f�t�H���g�\��</td></tr>
<tr><td>0x0003</td><td>�D�F�\���E�I��s��</td></tr>
<tr><td>0x0008</td><td>�A�C�e���Ƀ`�F�b�N�}�[�N��t����</td></tr>
<tr><td>0x0010</td><td>�h���b�v�_�E�����j���[�܂��̓T�u���j���[���J���A�C�e����ǉ�</td></tr>
<tr><td>0x0800</td><td>�Z�p���[�^�i��؂���j��\��</td></tr>
</table>
}html

%sample
#include "mod_menu.as"
#define CMD_A		1
#define CMD_B		2
#define CMD_D		3
#define CMD_QUIT	4

	oncmd gosub *OnCommand, WM_COMMAND	//  ���b�Z�[�W���荞��
	// ���j���[C�����̃T�u���j���[�쐬
	newmenu hsubmenu2, 1
	addmenu hsubmenu2, "���j���[D(&D)", CMD_D
	// �T�u���j���[�쐬
	newmenu hsubmenu, 1
	addmenu hsubmenu, "���j���[A(&A)", CMD_A, 0x0003    	// �D�F�\���E�I��s��
	addmenu hsubmenu, "���j���[B(&B)", CMD_B, 0x0008    	// �`�F�b�N�}�[�N�t��
	addmenu hsubmenu, "���j���[C(&C)", hsubmenu2, 0x0010	// �T�u���j���[����
	addmenu hsubmenu, "", 0, 0x0800                     	// �Z�p���[�^
	addmenu hsubmenu, "�I��(&Q)", CMD_QUIT
	// �g�b�v���j���[�쐬
	newmenu hmenu, 0
	addmenu hmenu, "���j���[(&M)", hsubmenu, 0x10

	applymenu hmenu
	stop

//���b�Z�[�W�̏���
*OnCommand
	cmd = wparam & 0xFFFF
	switch cmd
		case CMD_A	// ���j���[A�͎g�p�s��
		case CMD_QUIT
			dialog "�I�����I������܂���"
			end
		case CMD_B
			dialog "���j���[B���I������܂���"
			swbreak
		case CMD_D
			dialog "���j���[D���I������܂���"
			swbreak
	swend
	return

%href
newmenu
applymenu
%index
applymenu
���j���[���E�B���h�E�Ɋ��蓖�Ă�

%prm
p1
p1 : ���j���[�n���h��

%inst
newmenu�ō쐬�������j���[�����ݑI������Ă���E�B���h�E�Ɋ��蓖�Ă܂��B�K�����j���[�쐬�I����Ɏ��s���Ă��������B

%sample
// newmenu�̃T���v���X�N���v�g���Q��

%href
addmenu
newmenu
%index
newmenu
�V�������j���[�n���h�����擾����

%prm
p1, p2
p1 : ���ʂ��i�[����ϐ���
p2 : ��ނ̎w��

%inst
�V�������j���[���쐬���A���̃n���h����p1�֑�����܂��B
p2�ō쐬���郁�j���[�̎�ނ��w�肵�܂��B0�Ȃ�΃��j���[���ڗp�A1�Ȃ�΃|�b�v�A�b�v���ڗp�̃��j���[���쐬����܂��B

%sample
#include "mod_menu.as"
#define CMD_QUIT 1
	oncmd gosub *OnCommand, WM_COMMAND	//  ���b�Z�[�W���荞��
	// �T�u���j���[�쐬
	newmenu hsubmenu, 1
	addmenu hsubmenu, "�I��(&Q)", CMD_QUIT
	// �g�b�v���j���[�쐬
	newmenu hmenu, 0
	addmenu hmenu, "���j���[(&M)", hsubmenu, 0x10

	applymenu hmenu
	stop

//���b�Z�[�W�̏���
*OnCommand
	cmd = wparam & 0xFFFF
	if cmd == CMD_QUIT : end
	return

%href
addmenu
applymenu
