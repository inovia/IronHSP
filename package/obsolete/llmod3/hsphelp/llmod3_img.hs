;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.3
%note
llmod3.hsp,img.hsp���C���N���[�h����

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www5b.biglobe.ne.jp/~diamond/hsp/hsp2file.htm


%index
draw_icon
�A�C�R���̕`��
%group
�g�����o�͐��䖽��
%prm
n1,n2,n3,n4
n1 : �`�悷��A�C�R��(get_icon�Ŏ擾��������)
n2 : x���W
n3 : y���W
n4 : redraw���Ȃ����ǂ����̃t���O

%inst
n1�Ŏw�肵���A�C�R�������W(x,y)�ɕ`�悵�܂��B
���̖��߂��g�����т�redraw���s���܂��B�����̃A�C�R����`�悷��Ƃ��͌����������̂�n4��1�ɂ��āA�S�ẴA�C�R���������I������redraw�����s���Ă��������B

%href
get_icon
get_fileicon



%index
get_fileicon
�t�@�C���Ɏg�p����Ă���A�C�R���̎擾
%group
�g�����o�͐��䖽��
%prm
v1,"s2",n3
v1 : �擾�����A�C�R��������ϐ�
s2 : �t�@�C����
n3 : �擾�������

%inst
s2�Ɏw�肵���t�@�C���Ɏg����A�C�R�����擾���܂��B
^
^p
n3�̒l
0       s2�̃t�@�C���Ɏg���Ă���A�C�R��
1       s2�̃t�@�C���Ɏg���Ă��鏬�����A�C�R��
2       �c���[�r���[�őI������Ă���Ƃ��̃A�C�R��(s2���t�H���_�Ȃǂ̏ꍇ)
4       ���X�g�r���[�őI������Ă����Ԃ̃A�C�R��
8       �A�C�R���Ƀ����N�̃}�[�N��t����
$10     s2�̃t�@�C���Ɏg����A�C�R�����܂܂�Ă���t�@�C����
$20     s2�̃t�@�C�����\�������Ƃ��Ɏg���閼�O(s2��"B:\\"�Ȃǂ��g�����Ƃ�)
$40     s2�̃t�@�C���̎��
^
0,1,2,4,8�͑g�ݍ��킹�Ďg�����Ƃ��ł��܂��B

%href
get_icon
draw_icon



%index
get_icon
�A�C�R���̎擾
%group
�g�����o�͐��䖽��
%prm
v1,"s2",n3,n4
v1 : �擾�����A�C�R�������鐔�l�ϐ�
s2 : �A�C�R�����܂ރt�@�C����
n3 : �A�C�R���̔ԍ�
n4 : �������A�C�R�����擾���邩�ǂ����̃t���O

%inst
s2�Ɏw�肵���t�@�C������An3�Ԗڂ̃A�C�R�����擾���܂��B
����n3�Ԗڂ̃A�C�R�����������A�C�R���������Ă���Ƃ���n4��1�ɂ���Ə������A�C�R���̕����擾���܂��B
�擾�����A�C�R����draw_icon�ŕ`��ł��܂��B
�A�C�R���擾�Ɏ��s�����Ƃ��͕ϐ���0���������܂��B
^
n3��-1�ɂ���ƁAs2�������Ă���A�C�R���̐���stat�ɑ������܂��B
n3��-2�ɂ���ƁAs2�������Ă���A�C�R���S�Ă��擾���܂��B�������t�@�C��s2��16�ȏ�̃A�C�R���������Ă���Ƃ��́A�ϐ�v1��
	alloc v1,'�A�C�R���̐�'�~4
�Ƃ��Ċg�����Ă����Ȃ��ƃG���[�ɂȂ�܂��B

%href
draw_icon
get_fileicon



