%ver
3.6
%date
2020/06/04
%group
���o�͐��䖽��

%type
���[�U�[�g������

%note
mod_joystick2.as���C���N���[�h���邱�ƁB

%author
MIA / onitama

%dll
mod_joystick2

%port
Win
%index
joyGetPosEx
�W���C�X�e�B�b�N�̓��͂��擾����

%prm
p1, p2
p1 : ���͏�Ԃ������鐔�l�^�z��ϐ�
p2 : �|�[�g�ԍ�

%inst
�W���C�X�e�B�b�N�̓��͂��擾���܂��B
�z��ϐ�p1�ɂ͈ȉ��̏�񂪑������܂��B

	data(0) = ��� 52  ������܂�
	data(1) = ��� 255 ������܂�
	data(2) = �� 1 ���̏�ԁi���ʂ̃W���C�X�e�B�b�N�� X ���j
	data(3) = �� 2 ���̏�ԁi���ʂ̃W���C�X�e�B�b�N�� Y ���j
	data(4) = �� 3 ���̏�ԁi�X���b�g�����j
	data(5) = �� 4 ���̏��
	data(6) = �� 5 ���̏��
	data(7) = �� 6 ���̏��
	data(8) = �{�^���̏�ԁi�ő�32�{�^���j
	data(9) = �����ɉ�����Ă���{�^���̐�
	data(10) = POV �X�C�b�`�̏��
	data(11) = �\�����1
	data(12) = �\�����2

�V�X�e���ϐ�stat��0�ł���Γ��͂͐���ł��B

%sample
	repeat
		redraw 0
		color 255,255,255 : boxf : color 0,0,0
		joyGetPosEx data, 0
		pos 0,0 : mes "stat = " + stat
		repeat 13 : mes data(cnt) : loop
		redraw 1 : await 30
	loop

%href
jstick

%index
jstick
stick���ߌ݊��̒l���擾����

%prm
p1, p2, p3
p1 : �������ϐ�
p2 : ��g���K�[�^�C�v�L�[�w��
p3 : �|�[�g�ԍ�

%inst
stick���ߌ݊��̒l��ϐ��ɕԂ��܂��B
stick���߂ɂ��L�[�{�[�h�̎擾�������ɍs���A�W���C�X�e�B�b�N�ƃL�[�{�[�h�̓��͂ɓ����ɑΉ����܂��B
p1,p2�Ŏw�肳�ꂽ�p�����[�^�[�́Astick���߂Ɠ����@�\�������܂��B
�G���[�����������ꍇ�́A�ȍ~�̎擾���L�����Z������A�ēx�ڑ����ꂽ�ꍇ�Ɏ擾���ĊJ���܂��B
�g�p����ꍇ�́A�u#include "mod_joystick2.as"�v���L�q���Ă��������B
(�]���́umod_joystick.as�v���w�肵���ꍇ�́A�ȑO�̌Â��d�l�œ��삵�܂��B)

%href
joyGetPosEx
stick

