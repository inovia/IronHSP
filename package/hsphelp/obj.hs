%group
�I�u�W�F�N�g���䖽��

%type
���[�U�[�g������

%note
obj.as���C���N���[�h���邱�ƁB

%author
onitama

%dll
obj

%port
Win
%ver
3.3
%date
2009/08/01
%index
getobjsize
�I�u�W�F�N�g�̃T�C�Y�ƈʒu�擾

%prm
p1, p2
p1 : �I�u�W�F�N�g�̃T�C�Y�A�ʒu���擾���邽�߂̐��l�^�z��ϐ�
p2 : �I�u�W�F�N�gID

%inst
�I�u�W�F�N�g�̃T�C�Y�ƈʒu���擾���܂��B
p2�ɂ�button��listview�Ȃǎ擾����I�u�W�F�N�g��ID���w�肵�܂��B

p1�ɂ̓I�u�W�F�N�g�̃T�C�Y�E�ʒu���ȉ��̂悤�ɑ������܂��B
	p1(0)	��
	p1(1)	����
	p1(2)	�����x���W
	p1(3)	�����y���W
	p1(4)	�E����x���W
	p1(5)	�E����y���W
�e���W�̓E�B���h�E���W�n�ł��B

%sample
#include "obj.as"
	button "�T���v��", *dummy
	getobjsize size, stat
	mes "�{�^���̕��@�F" + size(0)
	mes "�{�^���̍����F" + size(1)
*dummy
	stop

%href
resizeobj

%index
resizeobj
�I�u�W�F�N�g�̃T�C�Y�ύX

%prm
p1, p2, p3
p1 : �I�u�W�F�N�gID
p2 : �T�C�Y�E�ʒu�����������l�^�z��ϐ�
p3 : �ʒu�E�T�C�Y��ύX���Ȃ����ǂ����̃t���O

%inst
IDp1�̃I�u�W�F�N�g�̃T�C�Y��ύX���܂��B
p2�ɂ͕�,����,x���W,y���W�̏��ɑ�����Ă����܂��B

p3��1�ɂ���ƈʒu��ς����ɃT�C�Y�����ύX���܂��B
p3��2�ɂ���ƃT�C�Y��ς����Ɉʒu�����ύX���܂��B

%sample
#include "obj.as"
	button "width*2", *wx2
	button "height*2", *hx2
	input s, 100, 20
	ipt_id = stat		// �I�u�W�F�N�gID��ϐ��֑��
	// ����40�A������30�ɂ���(0, 80)�Ɉړ�����
	s = 40, 30, 0, 80
	resizeobj ipt_id, s
	stop
*wx2
	; ����2�{�ɂ���
	getobjsize s, ipt_id
	s(0) *= 2
	resizeobj ipt_id, s
	stop
*hx2
	; ������2�{�ɂ���
	getobjsize s, ipt_id
	s(1) *= 2
	resizeobj ipt_id, s
	stop

%href
getobjsize
%index
objgray
�I�u�W�F�N�g�̎g�p�A�s�ݒ�

%prm
p1, p2
p1 : �I�u�W�F�N�gID
p2 : �g�p�ɂ��邩�s�ɂ��邩�̃t���O

%inst
button�Ȃǂ̃I�u�W�F�N�g���g�p�ɂ�����A�s�ɂ����肵�܂��B
p1�ɂ�button��listview�Ȃǂ�ID�������܂��B

p2��0�ɂ���ƃI�u�W�F�N�g���g�p�ł��Ȃ���Ԃɂ��A1�ɂ���Ǝg�p�ł����Ԃɂ��܂��B
p2��-1�ɂ���Ƃ��̃I�u�W�F�N�g���g�p���s���𒲂ׂ܂��B

%sample
#include "obj.as"
	button "�����Ȃ��{�^��", *dummy
	objgray stat, 0
*dummy
	stop
%index
p_scrwnd
�X�N���[�����W�n���E�B���h�E���W�n�ɕϊ�

%prm
p1
p1 : �X�N���[�����W�n�����������l�^�z��ϐ�

%inst
�X�N���[�����W�n���E�B���h�E���W�n�ɕϊ����܂��B
p1(0)��x���W�Ap1(1)��y���W�������Ă����܂��B
�`��ΏۂƂȂ��Ă���E�B���h�E����ɂ��܂��B

%sample
#include "obj.as"
	scr_pos = ginfo_mx, ginfo_my
	p_scrwnd scr_pos
	message  = "�}�E�X�|�C���^�̃X�N���[�����W��" + ginfo_mx + "," + ginfo_my + "�ł��B\n"
	message += "�}�E�X�|�C���^�̃E�B���h�E���W��" + scr_pos(0) + "," + scr_pos(1) + "�ł��B\n"
	message += "�V�X�e���ϐ�mousex,mousey��" + mousex + "," + mousey + "�ł��B"
	dialog message
	stop

