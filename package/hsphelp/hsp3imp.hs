%dll
hsp3imp

%ver
3.3

%date
2009/08/01

%author
onitama

%url
http://hsp.tv/

%note
hsp3imp.as���C���N���[�h���邱�ƁB

%type
�g������

%group
�g�����o�͐��䖽��

%port
Win
%index
hspini 
HSP3IMP.DLL�̏�����

%prm
mode,xsize,ysize,handle
mode : ���������[�h($100=�q�E�B���h�E�Ƃ��ď�����)
       bit0 = window��\��(ON/OFF)
       bit1 = �J�����g�f�B���N�g���ύX�֎~(ON/OFF)

xsize  : HSP�̏������E�B���h�E�T�C�Y(X)
ysize  : HSP�̏������E�B���h�E�T�C�Y(Y)
handle : �e�̃E�B���h�E�n���h��(HWND)

%inst
HSP3IMP.DLL�����������܂��B
HSP3�̏������ƁA�I�u�W�F�N�g�t�@�C���̓ǂݍ��݂��s�Ȃ��܂��B
hspini�����s����O�ɁAhspprm���߂ɂ���Ċe��ݒ���s�Ȃ��Ă����K�v������܂��B

%index
hspbye
���������ꂽHSP3�̃C���X�^���X�̔j��

%prm

%inst
hspini���߂ɂ���ď��������ꂽHSP3�̃C���X�^���X��j�����܂��B
�Ō�ɕK�����s���āAHSP3�̏I���������s�Ȃ��K�v������܂��B

%index
hspexec
HSP3�̃^�X�N�̎��s

%prm

%inst
hspini���߂ɂ���ď��������ꂽHSP3�̃^�X�N�����s���܂��B
hspexec���߂́A���s�����R�[�h���I�����邩�A�G���[����������܂Ŗ߂��Ă��܂���B(���̊Ԃ́AHSP3�̃^�X�N�����삵�܂��B)
HSP3IMP.DLL�́A�����܂ł��V���O���^�X�N�Ƃ��ē��삷�邱�Ƃ�O��Ƃ��Ă���̂Œ��ӂ��Ă��������B

%index
hspprm
HSP3IMP.DLL�Ɋւ���ݒ�Ə��̎擾

%prm
p1,p2,p3,p4
p1         : �ݒ�܂��͎擾�̃��[�h
p2, p3, p4 : p1 �ɉ������p�����[�^�[

%inst
HSP3IMP.DLL�Ɋւ���ݒ肨��сA���̎擾���s�Ȃ��܂��B
p1�̒l�ɂ���āAp2�`p4�܂łɎw�肷����e���ς��܂��B
�ݒ肳���p�����[�^�[�́A�ȉ����Q�l�ɂ��Ă��������B

p1(mode)
-----------------------------------------------------------
    0        �e�E�B���h�E����̕\���I�t�Z�b�g�w��
             (p2,p3��X,Y�I�t�Z�b�g�l��ݒ肵�܂�)
    1        �N���p�����[�^�[�w��(HSPTV�ł̂ݎg�p���܂�)
0x100        HSPCTX�\���̂̃|�C���^���擾
             (���ʂ�p4�Ŏw�肳�ꂽ�A�h���X�ɏ������܂�܂�)
0x101        �g�����߂����������邽�߂̊֐��w��
             (p4��HSP3TYPEINFO�|�C���^�������Ƃ���֐���o�^���܂�)
0x102        HSP3�I�u�W�F�N�g�t�@�C�������w��
             (p4�Ƀt�@�C�������i�[����Ă���A�h���X��ݒ�)