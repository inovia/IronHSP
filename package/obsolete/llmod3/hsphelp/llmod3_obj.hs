;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.3
%note
llmod3.hsp,obj.hsp���C���N���[�h����

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www5b.biglobe.ne.jp/~diamond/hsp/hsp2file.htm


%index
objgray
�I�u�W�F�N�g�̎g�p�A�s�ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
n1,n2
n1 : �I�u�W�F�N�g��ID
n2 : �g�p�ɂ��邩�s���邩�̃t���O

%inst
button�Ȃǂ̃I�u�W�F�N�g���g�p�ɂ�����A�s�ɂ����肵�܂��B
n1�ɂ�button��listview�Ȃǂ�ID�������܂��B
n2��0�ɂ���ƃI�u�W�F�N�g���g�p�ł��Ȃ���Ԃɂ��A1�ɂ���Ǝg�p�ł����Ԃɂ��܂��B
n2��-1�ɂ���Ƃ��̃I�u�W�F�N�g���g�p���s���𒲂ׂ܂��B
^p
���̖��߂��Ăяo�������stat�̒l
    1       �G���[����
    0,-1    �G���[
n2��-1�ɂ����Ƃ�
    1       �g�p��
    0       �g�p�s��



%index
p_wndscr
�E�B���h�E���W�n���X�N���[�����W�n�ɕϊ�
%group
�g�����o�͐��䖽��
%prm
v1
v1 : �E�B���h�E���W�n�����������l�ϐ�
%inst
�E�B���h�E���W�n���X�N���[�����W�n�ɕϊ����܂��B
v1��x���W�Ay���W�������Ă����܂��B
�`��ΏۂƂȂ��Ă���E�B���h����ɂ��܂��B

%href
p_scrwnd
%sample
	x=mousex,mousey
	p_wndscr x	;�E�B���h�E���W(100,30)���X�N���[�����W�ɕϊ�




%index
resizeobj
�I�u�W�F�N�g�̃T�C�Y�ύX
%group
�I�u�W�F�N�g���䖽��
%prm
n1,v2,n3
n1 : �I�u�W�F�N�g��ID
v2 : �T�C�Y�A�ʒu�����������l�ϐ�
n3 : �ʒu�A�T�C�Y��ύX���Ȃ����ǂ����̃t���O

%inst
�I�u�W�F�N�gn1�̃T�C�Y��ύX���܂��B
v2�ɂ͕��A�����Ax���W,y���\�̏��ɑ�����Ă����܂��B
n3��1�ɂ���ƈʒu��ς����ɃT�C�Y�����ύX���܂��B
n3��2�ɂ���ƃT�C�Y��ς����Ɉʒu�����ύX���܂��B

%href
getobjsize
%sample
	button "width*2",wx2
	button "height*2",hx2
	input s,100,20
	ipt_id=2
	;����40�A������30�ɂ���(0,80)�Ɉړ�����
	s=40,30,0,80
	resizeobj ipt_id,s
	stop
*wx2
	;����2�{�ɂ���
	getobjsize s,ipt_id
	s=s*2
	resizeobj ipt_id,s
	stop
*hx2
	;������2�{�ɂ���
	getobjsize s,ipt_id
	s.1=s.1*2
	resizeobj ipt_id,s
	stop




%index
getobjsize
�I�u�W�F�N�g�̃T�C�Y�ƈʒu�擾
%group
�I�u�W�F�N�g���䖽��
%prm
v1,n2
v1 : �I�u�W�F�N�g�̃T�C�Y�A�ʒu���擾���邽�߂̐��l�ϐ�
n2 : �I�u�W�F�N�g��ID

%inst
�I�u�W�F�N�g�̃T�C�Y�ƈʒu���擾���܂��B
n2�ɂ�button��listview�Ȃǂ�ID�������܂��B
v1�ɂ̓I�u�W�F�N�g�̃T�C�Y�A�ʒu���ȉ��̂悤�ɑ������܂��B
^p
v1.0	��
v1.1	����
v1.2	�����x���W
v1.3	�����y���W
v1.4	�E����x���W
v1.5	�E����y���W
^p
�e���W�̓E�B���h�E���W�n�ł��B

%href
resizeobj



%index
p_scrwnd
�X�N���[�����W�n���E�B���h�E���W�n�ɕϊ�
%group
�g�����o�͐��䖽��
%prm
v1
v1 : �X�N���[�����W�n�����������l�ϐ�

%inst
�X�N���[�����W�n���E�B���h�E���W�n�ɕϊ����܂��B
v1��x���W�Ay���W�������Ă����܂��B
�`��ΏۂƂȂ��Ă���E�B���h�E����ɂ��܂��B

%href
p_wndscr

%sample
	ginfo
	x=prmx,prmy
	p_scrwnd x	;�X�N���[�����W�n���E�B���h�E���W�n�ɕϊ�


