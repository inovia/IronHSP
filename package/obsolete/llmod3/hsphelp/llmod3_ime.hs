;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.3
%note
llmod3.hsp,ime.hsp���C���N���[�h����

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www5b.biglobe.ne.jp/~diamond/hsp/hsp2file.htm


%index
imeinit
IME�����擾
%group
�g�����o�͐��䖽��
%prm
v1,n2
v1 : IME����������ϐ�
n2 : mesbox��ID
%inst
IME�����擾���܂��B
n2��mesbox��ID�������܂��B
%href
imeopen
imestr
imesend
linesel
selget
%sample
	#include "llmod3.hsp"
	#include "ime.hsp"
^
	alloc buf,64*1024 : buf=""
	mesbox buf,winx,winy,1
	mb0_id=0
	imeinit mb0_ime,mb0_id



%index
imeopen
IME�E�B���h�E���J��
%group
�g�����o�͐��䖽��
%prm
v1,n2
v1 : imeinit�Ɏg�p�����ϐ�
n2 : �J�������邩�������t���O
%inst
imeinit�Ŏ擾����IME���J���܂��B
n2��1�ɂ����IME�E�B���h�E����邱�Ƃ��ł��܂��B
%href
imeinit
imestr
imesend
linesel
selget
%sample
	#include "llmod3.hsp"
	#include "ime.hsp"
^
	alloc buf,64*1024 : buf=""
	mesbox buf,winx,winy,1
	mb0_id=0
	imeinit mb0_ime,mb0_id
	imeopen mb0_ime



%index
imestr
IME�ɕ�����𑗂�
%group
�g�����o�͐��䖽��
%prm
v1,"s2"
v1 : imeinit�Ɏg�p�����ϐ�
s2 : IME�ɑ��镶����
%inst
IME�ɕ�����𑗂�܂��B
��������Ƀ^�u����s�������Ă͍s���܂���B
������ɂ͔��p����(�p���A����)�A�S�p����(�p���A�Ђ炪�ȁA�J�^�J�i)���g�p�ł��܂��B
%href
imeinit
imeopen
imesend
linesel
selget
%sample
	#include "llmod3.hsp"
	#include "ime.hsp"
^
	alloc buf,64*1024 : buf=""
	mesbox buf,winx,winy,1
	mb0_id=0
	imeinit mb0_ime,mb0_id
	imeopen mb0_ime			;IME���J��
	imestr  mb0_ime,"�����"		;������"�����"��IME�ɑ���



%index
imesend
IME�Ƀ��b�Z�[�W�𑗂�
%group
�g�����o�͐��䖽��
%prm
v1,n2,n3,n4
v1 : imeinit�Ɏg�p�����ϐ�
n2 : IME�ɑ��郁�b�Z�[�W
n3 : �p�����[�^1
n4 : �p�����[�^2
%inst
IME�փ��b�Z�[�W�𑗂�܂��B
^p
n2�̒l
0       ���E�B���h�E���J��
1       ���E�B���h�E�����
2       n3�y�[�W��n4�Ԗڂ̌���I��
3       ���E�B���h�E��n4�Ԗڂ̃y�[�W��\��
4       ����(0)�A�ϊ����s(1)�A�߂�(2)�A�L�����Z��(3)(���ʓ���n3�̒l)
5       ���E�B���h�E�̃T�C�Y��ς���(n3:0�`31)
%href
imeinit
imeopen
imestr
linesel
selget
%sample
	#include "llmod3.hsp"
	#include "ime.hsp"
^
	alloc buf,64*1024 : buf=""
	mesbox buf,winx,winy,1
	mb0_id=0
	imeinit mb0_ime,mb0_id
	imeopen mb0_ime			;IME���J��
^
	imestr  mb0_ime,"��ҿ���"	;������"��ҿ���"��IME�ɑ���
	imesend mb0_ime,4,1		;"��ҿ���"��ϊ����s
	imesend mb0_ime,4,0		;����
^
	imestr  mb0_ime,"�̂���"	;������"�̂���"��IME�ɑ���
	imesend mb0_ime,4,1		;"�̂���"��ϊ����s
	imesend mb0_ime,4,0		;����
^
	imestr	mb0_ime,"���"
	imesend mb0_ime,0		;���E�B���h�E���J��



%index
linesel
mesbox���̈�s��I��
%group
�g�����o�͐��䖽��
%prm
n1.n2
n1 : mesbox��ID
n2 : �I������s
%inst
mesbox n1 ����n2�s��I�����܂��Bn2��0���琔���܂��B
n2��-1�ɂ���ƃJ�[�\��������s��I�����܂��B
n2��-2�ɂ����mesbox���̕����S�Ă�I�����܂��B
%href
imeinit
imeopen
imestr
imesend
selget
%sample
	#include "llmod3.hsp"
	#include "ime.hsp"
^
	alloc buf,1024 : buf="123456\n7890"
	mesbox buf,300,200,1
	mb_id=0
	linesel mb_id,1		;1�s�ڂ�I��(7890���I�������)



%index
selget
mesbox���̑I�𕔕��̕�������擾
%group
�g�����o�͐��䖽��
%prm
v1,n2
v1 : mesbox���̑I������Ă��镔����������ϐ�
n2 : mesbox��ID
%inst
mesbox n2 �̑I������Ă��镔�����擾���܂��B
%href
imeinit
imeopen
imestr
imesend
linesel
%sample
	#include "llmod3.hsp"
	#include "ime.hsp"
^
	alloc buf,1024 : buf="123456\n7890"
	mesbox buf,300,200,1
	mb_id=0
	linesel mb_id,1
	selget line_buf,mb_id
	dialog line_buf

