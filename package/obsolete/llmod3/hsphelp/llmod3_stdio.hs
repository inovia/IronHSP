;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.3
%note
llmod3.hsp���C���N���[�h����B�K�v�ɉ�����about.hsp,msgdlg.hsp,multiopen.hsp,console.hsp,unicode.hsp,dragdrop.hsp,input.hsp���C���N���[�h����

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www5b.biglobe.ne.jp/~diamond/hsp/hsp2file.htm


%index
about
�v���O�����̃o�[�W������\������_�C�A���O���쐬
%group
�g�����o�͐��䖽��
%prm
"s1","s2"
s1 : �A�v���P�[�V��������������������ϐ��܂��͕�����
s2 : ����Җ���������������ϐ��܂��͕�����

%inst
�v���O�����̃o�[�W������\�����鎞�ȂǂɎg����_�C�A���O��\�����܂��B
�A�v���P�[�V������s1��"my.exe���ް�ޮݏ��#my.exe ver 1.00"
�̂悤��#�ŋ�؂��'Microsoft my.exe ver 1.00'�Ƃ����\���������܂��B


%index
msgdlg
�g��dialog(type 0�`3 )
%group
�I�u�W�F�N�g���䖽��
%prm
"s1","s2",n3,n4
s1 : ���b�Z�[�W��������������ϐ��܂��͕�����
s2 : �^�C�g����������������ϐ��܂��͕�����
n3 : �^�C�v
n4 : �A�C�R���^�C�v

%inst
HSP��dialog���߂̊g���łł��B
^p
�^�C�v
 0 Ok
 1 Ok ��ݾ�
 2 ���~�@�Ď��s�@����
 3 �͂��@�������@��ݾ�
 4 �͂��@������
 5 �ĊJ���s ��ݾ�
^
�A�C�R���^�C�v
 0 �A�C�R������
 1 �G���[(x)
 2 �N�G�X�`�����}�[�N(?)
 3 �x��(!)
 4 ���(i)
 5 EXE�������Ă���A�C�R��
^
���̖��߂��Ăяo�������stat�̒l
�l �I�����ꂽ�{�^��
 1 Ok
 2 ��ݾ�
 3 ���~
 4 �Ď��s
 5 ����
 6 �͂�
 7 ������
-1 �G���[����
^p
�^�C�v�Ɉȉ��̒l��������ƃf�t�H���g�{�^�����ς����܂��B
    0       �{�^��1
    $100    �{�^��2
    $200    �{�^��3
�A�C�R���^�C�v�Ɉȉ��̒l��������ƃr�[�v�����ς����܂��B
    0       ������(�m�[�}��)
    $100    �x����

%sample
msgdlg "�����͂����ŏI�����܂����H","�v���O�����̏I��",3,5
if stat=6 : dialog "�͂��@���I������܂���"
if stat=7 : dialog "�������@���I������܂���"
if stat=2 : dialog "��ݾف@���I������܂���"


%index
multiopen
�����̃t�@�C�������擾
%group
�I�u�W�F�N�g���䖽��
%prm
v1,v2,n3,n4
v1 : �I�����ꂽ�t�@�C�������󂯎�邽�߂̕ϐ�
v2 : ���
n3 : �t�B���^�̃C���f�b�N�X(1����)
n4 : Read Only�{�b�N�X��t����

%inst
HSP��dialog(type 16,17)�ŕ����̃t�@�C����I���ł���悤�ɂ������̂ł��B
multiopen�Ăяo�����ɁAv1.0,v1.1�ɂ��ꂼ��v1,v2�̃T�C�Y�������Ă����܂��B
v2�ɂ͗�̂悤�Ȍ`���Ńt�B���^�������܂��B
n3���ȗ��A�܂��̓}�C�i�X�̒l���g�����Ƃ��̓���͔��l�Q�ƁB
n4��1�ɂ����ReadOnly�{�b�N�X��t���܂��B2�ɂ����ReadOnly�{�b�N�X���`�F�b�N������Ԃɂ��܂��B
^
���̖��߂��Ăяo�������stat�̒l
^p
0 �L�����Z�����ꂽ
1 �t�@�C�����I�������OK�{�^���������ꂽ
2 �t�@�C�����I�������OK�{�^���������ꂽ(ReadOnly���`�F�b�N����Ă���B�����������I������Ă��Ȃ��ꍇ�̂�)
^p
p3��0(�ȗ�)�ɂ���p1,p2�ɕ�����������p1���^�C�g���ɂȂ�Ap2�͏����t�H���_�ɂȂ�܂��B
p3���}�C�i�X�l�ɂ���ƕۑ�����t�@�C�����𓾂�Ƃ��Ɏg�����Ƃ��ł��܂��B(�����������I���͂ł��܂���)
^
�����̃t�@�C�����I�����ꂽ����notesel,notemax���g���Ē��ׂ܂��B
�t�@�C����������I������Ȃ������ꍇ�Ap1�ɂ̓t�@�C�����̃t���p�X���������Ap2�ɂ̓t�@�C���̊g���q���������܂��B
�t�@�C���������I�΂ꂽ�ꍇ�́Ap1��noteget�Ŏ擾�ł���`���Ńt�@�C���������������Ă��āAp2�ɂ͑I�����ꂽ�t�@�C��������t�H���_���������܂��B(p1�̃t�@�C������'\r'($0d)�ŋ�؂��Ă��܂��B)

%sample
	buf_size=512 : info_size=128
	alloc buf,buf_size
	alloc info,info_size
^
	buf="̧�ق��J��test title" : info="a:\\windows"
	multiopen buf,info

	buf=buf_size
	buf.1=info_size
	info="HSP2 ������̧��(*.hsp)|*.hsp|÷��̧��(*.txt)|*.txt|�S�Ă�̧��|*.*|"
	multiopen buf,info,1
	if stat=0 : mes "�L�����Z������܂���" : else {
		notesel buf
		notemax mx
		mes "�I�����ꂽ�t�@�C���� "+mx
		repeat mx
			noteget a,cnt
			mes a
		loop
		if mx=1 : mes "�g���q��"+info : else mes "�t�H���_ "+info
	}


%index
console_end
�R���\�[���E�B���h�E�����
%group
���ߊT�v
%inst
�R���\�[���E�B���h�E����܂��B
%href
console



%index
console
�R���\�[���E�B���h�E���쐬
%group
���ߊT�v
%inst
�R���\�[���E�B���h�E���쐬���܂��B

%href
console_end
gets
puts
console_color
console_pos




%index
puts
�R���\�[���ɕ��������������
%group
���ߊT�v
%prm
v1
v1 : �R���\�[���ɕ\�����镶���񂪓�����������ϐ�

%inst
�R���\�[���ɕ������\�����܂��B
(putz���g����v1�ɒ��ڕ�������g�p���邱�Ƃ��ł��܂��B)

%href
gets
console




%index
gets
�R���\�[�����當�����ǂݍ���
%group
���ߊT�v
%prm
v1,n2
v1 : �R���\�[������̕�������擾����ϐ�
n2 : �擾���镶���̐�

%inst
�R���\�[�����當������擾���܂��B
n2���ȗ������Ƃ��̒l��63�ł��B

%href
puts
console




%index
console_color
�R���\�[���̃e�L�X�g�̐F�ݒ�
%group
���ߊT�v
%prm
n1
n1 : �R���\�[���̕�����̐F

%inst
�R���\�[���ɕ\�����镶����̐F��ݒ肵�܂��B
n1�͈ȉ��̒l��g�ݍ��킹�Ďg���܂��B1+4���Ǝ��ɂȂ�܂��B
1+4+8�Ŗ��邢���ɂȂ�܂��B
^
^p
n1�̒l  �F
1       ��
2       ��
4       ��
8       ����
$10     ��(�w�i)
$20     ��(�w�i)
$40     ��(�w�i)
$80     ����(�w�i)
^p

%href
puts
console



%index
console_pos
�R���\�[���̕����\���ʒu�ݒ�
%group
���ߊT�v
%prm
n1,n2
n1 : x���W
n2 : y���W

%inst
�������\��������W��ݒ肵�܂��B

%href
puts
console


%index
to_uni
Unicode�֕ϊ�
%group
�����񑀍얽��
%prm
v1,v2,n3
v1 : Unicode���i�[����ϐ�
v2 : Unicode�ɕϊ����镶����ϐ�
n3 : Unicode�ɕϊ����镶����̒���

%inst
ANSI������(SJIS)��UNICODE�ɕϊ����܂��B
^
���̖��߂��Ăяo������Astat�Ƀo�b�t�@�ɏ������܂ꂽUnicode�����̐����������܂��B
0�Ȃ�G���[�ł��B
^
unicode�Ăяo�����stat�ɓ���l��'�o�b�t�@�ɏ������܂ꂽUnicode�����̐�'�́A1�o�C�g(���p)������1�����2�o�C�g(�S�p)������1�����Ɛ����܂��B
�Ⴆ��
	s="abc������"
�����ׂ�Unicode�ɕϊ��������Ƃ�stat�l��6+1(*�� +1�͍Ō�̕�����I�������Ԃ�)�B�ƂȂ�܂��B
^
n3��-1�ɂ���Ǝw�肵��������S�Ă�ϊ����܂��B
n3��0�ɂ����Unicode���i�[����̂ɕK�v�ȕϐ��̃T�C�Y��Ԃ��܂��B(�o�C�g�P��)

%href
from_uni

%sample
	s="Unicode�ɕϊ����镶����"
	strlen sl,s
	;alloc buf,(sl+1)*2	;���̏ꍇ(sl+1)*2��64�ɖ����Ȃ��̂�alloc�͕K�v�Ȃ�
	to_uni buf,s,sl+1
	usize=stat
	if usize=-1 : dialog "�G���[���������܂���"
	if usize=0 : dialog "�ϊ������s���܂���"
	if usize>0 : bsave "unicode.dat",buf,usize*2




%index
from_uni
Unicode����ANSI�ɕϊ�
%group
�����񑀍얽��
%prm
v1,v2,n3
v1 : Multibyte���i�[����ϐ�
v2 : Multibyte�ɕϊ�����Unicode�����񂪓����Ă���ϐ�
n3 : Multibyte�ɕϊ�����Unicode������̒���

%inst
UNICODE��ANSI������ɕϊ����܂��B
^
���̖��߂��Ăяo������Astat�Ƀo�b�t�@�ɏ������܂ꂽMultibyte�����̐����������܂��B
0�Ȃ�G���[�ł��B
^
���̖��߂��Ăяo�������stat�̒l�A'�o�b�t�@�ɏ������܂ꂽMultibyte�����̐�'��1�o�C�g(���p)������1�����2�o�C�g(�S�p)������2�����Ɛ����܂��B
^
'Multibyte�ɕϊ�����Unicode������̒���'��-1�ɂ���ƑS�ĕϊ����܂��B
'Multibyte�ɕϊ�����Unicode������̒���'��0�ɂ����Multibyte���i�[����̂ɕK�v�ȕϐ��̃T�C�Y��Ԃ��܂��B(�o�C�g�P��)

%href
to_uni

%sample
	exist "unicode.dat"
	bload "unicode.dat",uni,strsize
	buf=""
	from_uni buf,uni,-1
	mbsize=stat
	if mbsize=-1 : dialog "�G���[���������܂���"
	if mbsize=0 : dialog "�ϊ������s���܂���"
	if mbsize>0 : dialog buf


%index
dd_accept
�h���b�O&�h���b�v���ł���悤�ɂ���
%group
���ߊT�v
%prm
v1,v2,n3
v1 : �h���b�O&�h���b�v���ꂽ�t�@�C����������ϐ�
v2 : �h���b�O&�h���b�v���ꂽ�t�@�C����������ϐ�
n3 : �E�B���h�EID
%inst
n3�Ŏw�肵���E�B���h�E�Ƀh���b�O&�h���b�v(�ȉ�D&D)���ł���悤�ɂ��܂��B
�������A�E�B���h�EID 1�͐ݒ�ł��܂���B
dd_accept�����s������A�E�B���h�E�Ƀt�@�C����D&D������v1�Ŏw�肵���ϐ���D&D���ꂽ�t�@�C����������܂��B
v2�ɂ�D&D���ꂽ�t�@�C���̐��AD&D���ꂽ���W�A�E�B���h�EID���������܂��B
^
D&D���ꂽ�t�@�C������"\n"�ŋ�؂��Ă��܂�(D&D���ꂽ�t�@�C����1�̏ꍇ�ł�)�B
1�̃t�@�C���������o�������Ƃ��̓m�[�g�p�b�h���߂��g���ƕ֗��ł��B
^
dd_accept���s��́Av1,v2�ɐݒ肵���ϐ���alloc,dim,sdim�ȂǂɎg�p���Ȃ��ŉ������B

%href
dd_reject
%sample
	#include "llmod3.hsp"
	#include "dragdrop.hsp"
^
	alloc buf,1024*64	;�h���b�O&�h���b�v���ꂽ�t�@�C����������ϐ�
	dd_accept buf,a
^
*@
	wait 1
	if a {
		cls
		pos 0,0
		mes "�h���b�O&�h���b�v���ꂽ�t�@�C����:"+a
		mes "�h���b�O&�h���b�v���ꂽ�t�@�C���ʒu x:"+a.1+" y:"+a.2
		mes "�h���b�O&�h���b�v���ꂽ�E�B���h�EID :"+a.3
		mes buf
		a=0		; a�����Z�b�g���Ă�������
	}
	goto @b




%index
dd_reject
�h���b�O&�h���b�v���ł��Ȃ��悤�ɂ���
%group
�g�����o�͐��䖽��
%prm
n1,n2
n1 : �E�B���h�EID
n2 : �t���O
%inst
�h���b�O&�h���b�v���ł��Ȃ��悤�ɂ��܂��B
dd_accept�����s���Ă��Ȃ��ꍇ�ɂ͌��ʂ�����܂���B
n2��1�ɂ���Ƃ�����x�h���b�O&�h���b�v���ł���悤�ɂ��܂��B
%href
dd_accept



%index
keybd_event
�L�[�{�[�h����
%group
�g�����o�͐��䖽��
%prm
n1,n2,n3
n1 : �L�[�R�[�h
n2 : �L�[������t���O
n3 : �I�v�V����

%inst
�L�[�{�[�h������s���܂��B
n1�ɉ��������L�[�̃L�[�R�[�h���w�肵�܂��B
n2��0�ɂ��Ă��̖��߂����s�����n1��O����s�����Ƃ��Ɠ����L�[�R�[�h�A
n2��1�ɂ��Ă�����x���̖��߂����s���Ȃ��ƃL�[����������ƂɂȂ�܂���B
n2��-1�ɂ���Ɖ����ĕ��������ƂɂȂ�܂��B
n3�̃I�v�V�����̓X�N���[���V���b�g�L�[�������Ƃ��Ɏg�p���܂��Bn3��0�ɂ���ƃt���X�N���[���A1�ɂ���ƃA�N�e�B�u�ȃE�B���h�E���N���b�v�{�[�h�ɃR�s�[����܂��B
^
keybd_event�͑��̃v���O�����̃E�B���h�E���A�N�e�B�u�ȏꍇ�ł����s����܂��B
^
<>�L�[�R�[�h
�L�[�R�[�h��getkey�Ŏg�p������̂Ɠ����ł��B
�ق��ɂ��ȉ��̂悤�Ȃ��̂�����܂��B
^p
n1�̒l
44       �X�N���[���V���b�g
45       INS
46       DEL
106      �e���L�[��'*'
107      �e���L�[��'+'
108      �e���L�[��','
109      �e���L�[��'-'
110      �e���L�[��'.'
111      �e���L�[��'/'
^p
%sample
	#include "llmod3.hsp"
	#include "input.hsp"
^
	exec "notepad"
	s="ABCDEFG" : strlen L,s
^
	repeat L
		peek c,s,cnt
		keybd_event c,-1
	loop
^
	keybd_event 18,-1	;ALT
	keybd_event 'F',-1	;̧��(F)
	keybd_event 'O',-1	;�J��(O)
^
	keybd_event 'N',-1	;�Z�[�u�m�F�_�C�A���O�̂�����(N)
^
	s="INPUTnAS" : strlen L,s	;'n'�̓L�[�R�[�h��'.'(110)��\��
^
	;�����̃R�����g���O����SHIFT�����������ƂɂȂ�啶���ɂȂ�܂�
	;keybd_event 16
^
	repeat L
		peek c,s,cnt
		keybd_event c,-1
	loop
^
	;��̃R�����g���O�����Ƃ��͂����̃R�����g���O���Ă�������
	;keybd_event 16,1
^
	keybd_event 13,-1	;ENTER
^
	stop



%index
mouse_event
�}�E�X����
%group
�g�����o�͐��䖽��
%prm
n1,n2,n3
n1 : ����^�C�v
n2 : ���������̈ړ���
n3 : ���������̈ړ���

%inst
�}�E�X������s���܂��B
n1�Ɏw�肷��^�C�v�Ń}�E�X������s�����Ƃ��ł��܂��B
���������̈ړ��ʂ́A��ʍ�����E�ֈړ�������Ƃ������A���̋t����
���������̈ړ��ʂ́A��ʏォ�牺�ֈړ�������Ƃ������A���̋t����
�ł��邱�Ƃɒ��ӂ��Ă��������B
^
mouse_event��HSP�̃v���O�������A�N�e�B�u�łȂ��Ƃ��ł��}�E�X����ɉe�����܂��B
^
<>����^�C�v
n1�̒l�͈ȉ��̂��̂�g�ݍ��킹�Ďg�p���邱�Ƃ��ł��܂��B
^p
n1�̒l
$1       �}�E�X�ړ�
$2       ���̃{�^��������
$4       ���̃{�^�������
$8       �E�̃{�^��������
$10      �E�̃{�^�������
$20      ���̃{�^��������
$40      ���̃{�^�������
^p
%sample
	#include "llmod3.hsp"
	#include "input.hsp"
^
*lp
	movx=0 : movy=0
	getkey k,37 : if k : movx-	;���L�[
	getkey k,38 : if k : movy-	;���L�[
	getkey k,39 : if k : movx+	;���L�[
	getkey k,40 : if k : movy+	;���L�[
^
	;SHIFT�������ꂽ�獶�{�^��������
	getkey kSHIFT,16 : if kSHIFT : Lbtn=$2 : else Lbtn=0
	mouse_event $1+Lbtn, movx, movy
^
	;SHIFT�������ƃ}�E�X�̍��{�^�������������ƂɂȂ�k��1�ɂȂ�
	getkey k,1 : if k : pset mousex,mousey
^
	;SHIFT��������Ă��獶�{�^�������
	if kSHIFT : mouse_event $4
^
	await 1
	goto lp

