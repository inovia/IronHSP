%dll
mod_fontdlg

%author
onitama

%note
mod_fontdlg.as���C���N���[�h���邱�ƁB

%type
���[�U�[�g������

%group
��ʐ��䖽��

%port
Win
Cli
%ver
3.3
%date
2009/08/01
%index
fontdlg
�t�H���g�I���_�C�A���O���J��

%prm
p1, p2
p1 : �߂�l���i�[���鐔�l�^�z��ϐ�
p2 = 0�`(0) : �I�v�V����

%inst
�t�H���g�I���_�C�A���O���J���܂��B
�t�H���g����refstr�ɁA���̑��̏���p1�Ŏw�肵���z��ϐ��ɑ������܂��B

p2�ɂ̓I�v�V�������w�肵�܂��B0x100���w�肷��ƁA�ł��������E�����E�����F���w��ł���悤�ɂȂ�܂��B

����ɏI�������ꍇ�Astat�ɂ�0�ȊO���Ԃ�܂��B�L�����Z�����ꂽ�ꍇ��G���[�����������ꍇ��stat��0���Ԃ�܂��B

%sample
#include "mod_fontdlg.as"
	dim result, 8
	fontdlg result, 0

	if stat != 0 {
		mes "�t�H���g�� : " + refstr
		mes "�t�H���g�T�C�Y�iHSP�ŗ��p����_���T�C�Y�j�F" + result(0)
		mes "�t�H���g���� : " + result(1)
		pos 40 : mes "0 = �ʏ�\n1 = ����\n2 = �Α�\n3 = �����Α�"
		pos  0 : mes "�t�H���g�T�C�Y�ipt�j : " + result(2)
		mes "�t�H���g�J���[�i�ԁj : " + result(3)
		mes "�t�H���g�J���[�i�΁j : " + result(4)
		mes "�t�H���g�J���[�i�j : " + result(5)
		mes "�����̗L�� : " + result(6)
		mes "�ł��������̗L�� : " + result(7)
	}
	stop

%href
font
dialog
