;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.3
%note
llmod3.hsp,misc.hsp���C���N���[�h����

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www5b.biglobe.ne.jp/~diamond/hsp/hsp2file.htm



%index
tooltip
�c�[���`�b�v��t����
%group
�I�u�W�F�N�g���䖽��
%prm
n1,n2,n3
n1 :  button,input,treebox�Ȃǂ�ID
n2 : �c�[���`�b�v��ɕ\�����镶����
n3 : �c�[���`�b�v�̔w�i�F (IE3.0�ȏ�)
%inst
�I�u�W�F�N�g�Ƀc�[���`�b�v��t���܂��B
�c�[���`�b�v�Ƃ̓}�E�X�J�[�\����button�Ȃǂ̃I�u�W�F�N�g��ň�莞�Ԓ�~�����Ƃ��Ɍ���鏬���ȃE�B���h�E�ł��B
%sample
	button "test",label	: btn_id=0
	tooltip btn_id,"�e�X�g���܂�"
*label
	stop



%index
strtoint
������𐔒l�ɕϊ�
%group
�I�u�W�F�N�g���䖽��
%prm
s1,n2
s1 : ���l�ɕϊ����镶����
n2 : �(2�`36)
%inst
������𐔒l�ɕϊ����܂��B
%sample
	strtoint "111101",2	;2�i���Ƃ݂Ȃ��ĕϊ�
	mes stat

	strtoint "0x1F"		;�擪��"0x"����16�i���Ƃ݂Ȃ����(Base�ȗ���)
	mes stat

	strtoint "0376"		;�擪��"0"����8�i���Ƃ݂Ȃ����(Base�ȗ���)
	mes stat

	strtoint "23413",7	;7�i���Ƃ݂Ȃ��ĕϊ�
	mes stat

	strtoint "za",36	;36�i���Ƃ݂Ȃ��ĕϊ�
	mes stat
stop







%index
btnimg
button�ɉ摜��\�����
%group
�I�u�W�F�N�g���䖽��
%prm
n1, n2, n3, n4, n5, n6
n1 : �C���[�W��\�����{�^����ID(0�`63)
n2 : �C���[�W���`�悳��Ă���E�B���h�E��ID(0�`7)
n3 : �C���[�W�̈ʒu
n4 : �C���[�W�̈ʒu
n5 : �C���[�W�̕�
n6 : �C���[�W�̍���

%inst
button�ɉ摜��\����܂��B

%sample
	buffer 1
	picload "mybmp.bmp"	;�E�B���h�EID 1 �Ƀr�b�g�}�b�v��\��
	bmp_w=winx:bmp_h=winy
	gsel 0
	button "",*label : btn_id=0
^
	;�E�B���h�EID 1��(0,0)-(bmp_w,bmp_h)�͈̔͂̉摜���{�^���ɕ`�悷��
	btnimg btn_id,1,0,0,bmp_w,bmp_h
*label
stop



