;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.3
%note
llmod3.hsp���C���N���[�h����B�K�v�ɉ�����listview.hsp,progbox.hsp,trackbox.hsp,treebox.hsp,udbtn.hsp���C���N���[�h����

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www5b.biglobe.ne.jp/~diamond/hsp/hsp2file.htm



%index
listview
���X�g�r���[�̍쐬
%group
�I�u�W�F�N�g���䖽��
%prm
n1,n2,n3
n1 : ��
n2 : ����
n3 : �X�^�C��

%inst
���X�g�r���[���쐬���܂��B
���X�g�r���[�́AExplorer�̉E���ɂ���l�ȃI�u�W�F�N�g�ł��B
���̖��߂��Ăяo������Astat�Ƀ��X�g�r���[��ID���������܂��B
^p
�X�^�C��
�X�^�C���͈ȉ��̒l�𑫂��āA�����̃X�^�C�����w�肷�邱�Ƃ��ł��܂��B
0           �傫���A�C�R���\��
1           �ڍו\��
2           �������A�C�R���\��
3           ���X�g�\��
4           �����I���ł��Ȃ��悤�ɂ���
8           listview���I������Ă��Ȃ��Ƃ��ł��A�I������Ă���A�C�e���̐F��ς���
$10         �����ŃA�C�e�����\�[�g����
$20         �~���ŃA�C�e�����\�[�g����
$40         �Z�b�g�����C���[�W���X�g��listview�������ɏ������Ȃ�(������listview�œ����C���[�W���g���ꍇ�Ɏw�肷��)
$80         �A�C�R���\���̂Ƃ��A�A�C�e���̃e�L�X�g��܂�Ԃ��Ȃ�(�f�t�H���g�ł̓e�L�X�g�͒����Ɛ܂�Ԃ����)
$100        ?
$800        ?
$2000       �X�N���[���o�[�����Ȃ�
$4000       ���̖��O��\�����镔����t���Ȃ�
^
�ȉ��̃X�^�C����comctl32.dll�̃o�[�W�����ɂ���Ă͗L���ɂȂ�Ȃ��ꍇ������܂��B
$10000      ���X�g�\�����Ɍr����t����
$40000      �`�F�b�N�{�b�N�X��t����
$100000     ���̖��O��\�����鏊���h���b�O&�h���b�v�ł���
$200000     ���X�g�\�����ɃA�C�e�����I�����ꂽ�Ƃ��T�u�A�C�e�����F��ς���
$400000     �A�C�e���̏�Ƀ}�E�X�|�C���^�������Ƃ��J�[�\�����w�̌`�ɂ���
$800000     �A�C�e���N���b�N���ꂽ�Ƃ��J�[�\�����w�̌`�ɂ���
$1000000    �X�N���[���o�[�𕽂�ȃX�^�C���ɕς���
$8000000    $400000,$800000�̃X�^�C�����w�肵���Ƃ��A�A�C�e���̏�Ƀ}�E�X�|�C���^������Ɖ�������
$10000000   $400000,$800000�̃X�^�C�����w�肵���Ƃ��A��������
^p
^
���`�F�b�N�{�b�N�X��t�����Ƃ��̃X�^�C���ŁA�A�C�e�����`�F�b�N����Ă��邩�𒲂ׂ�Ƃ��͈ȉ��̂悤�ɂ��Ă�������
^
	;list_id : listview��ID
	;idx : �A�C�e���̃C���f�b�N�X
	prm=list_id,4140,idx,61440
	sendmsg prm
	chk=stat>>12-1
	if chk : dialog ""+idx+"�Ԗڂ̃A�C�e���̓`�F�b�N����Ă��܂�"
^
�`�F�b�N���͂�������A�����肵�����Ƃ��͈ȉ��̂悤�ɂ��܂��B
^
	dim lvi,9
	idx = 0			;idx�Ԗڂ̃A�C�e��
	if uncheck != 0 {
		lvi = 8,0,0,1<<12,$f000
	} else {
		lvi = 8,0,0,2<<12,$f000
	}
	prm = list_id,4139,idx : getptr prm.3,lvi : sendmsg prm
^
��listview��HSP�W�����߂�cls��screen���߂ł͏�������܂���B_cls�܂���_clrobj���g�p���Ă��������B

%href
listadd
listdel
listaddcl
listdelcl
listsel
listget
listmax
listicon
listhit
sel_listview




%index
listadd
���X�g�r���[�ɃA�C�e����ǉ�
%group
�I�u�W�F�N�g���䖽��
%prm
n1,"s2",n3,n4,n5,n6
n1 : �A�C�e���̈ʒu
s2 : �A�C�e���̃e�L�X�g
n3 : ���̔ԍ�
n4 : �A�C�R���ԍ�
n5 : �A�C�e���̏��
n6 : �A�C�e���Ɏ������鐔�l

%inst
���X�g�r���[��n1�Ԗڂ̈ʒu�ɃA�C�e�����������܂��B
n3�ɂ͉��Ԗڂ̗��ɒǉ����邩���w�肷��C���f�b�N�X�An4�ɂ̓A�C�R���ԍ��An5�ɂ̓A�C�e���̏�Ԃ����܂��B
^
���ւ̒ǉ��́Alistaddcl�ŗ���ǉ����Ă���Ƃ��̂ݗL���ł��B
�܂��A�C�R���ԍ��́Alisticon�ŃA�C�R����ǉ����Ă���ꍇ�̂ݗL���ɂȂ�A���֒ǉ�����Ƃ��̓A�C�R���ԍ��͖�������܂��B
^
n6�ɒl�����ăA�C�e���ɂ��̐��l���������邱�Ƃ��ł��܂��B
���̖��߂��Ăяo������Astat�ɒǉ������A�C�e���̃C���f�b�N�X���������܂��B(-1�Ȃ�G���[)
^
�A�C�e���̏��
listview�̃A�C�e���̏�Ԃɂ́A�ȉ��̂��̂�����܂��B
^p
���                     ���l
�t�H�[�J�X�������Ă���   1
�I������Ă���           2
�؂���ꂽ���         4
�n�C���C�g               8
^p
���n�C���C�g��listsel�őI����Ԃ��������Ȃ��ƌ��ɖ߂�܂���B

%href
listdel
listsel
listaddcl
listdelcl
listview
%sample
listadd 3,"new item",0,15
^
listadd 0,"new sub item",1,0,1




%index
listdel
���X�g�r���[�̃A�C�e��������
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : �A�C�e���̃C���f�b�N�X

%inst
n1�Ԗڂ̃A�C�e�����������܂��B
n1��-1�ɂ���ƑS�ẴA�C�e�����������܂��B

%href
listadd
listview




%index
listaddcl
���X�g�r���[�ɗ���ǉ�
%group
�I�u�W�F�N�g���䖽��
%prm
n1,"s2",n3,n4
n1 : ���̃C���f�b�N�X
s2 : ���̖��O
n3 : ���̕�
n4 : ���̖��O�̈ʒu

%inst
����ǉ����܂��B
n3���ȗ������Ƃ��̃f�t�H���g�l��100�ł��B
^
^p
n4�̒l
0    ����
1    �E��
2    ����

%href
listdelcl
listview




%index
listdelcl
��������
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : ���̃C���f�b�N�X

%inst
n1�Ԗڂ̗����������܂��B

%href
listaddcl
listview




%index
listsel
���X�g�r���[�̃A�C�e����I��
%group
�I�u�W�F�N�g���䖽��
%prm
n1,n2
n1 : �A�C�e���̃C���f�b�N�X
n2 : �I����Ԃ̃^�C�v

%inst
n1�Ԗڂ̃A�C�e����I�����܂��B
n2��-1�ɂ���ƑI����Ԃ��������܂��B
n2���ȗ�����ƃt�H�[�J�X�����킹�āA�I����Ԃɂ��܂��B
^
^p
���                     ���l
�t�H�[�J�X�������Ă���   1
�I������Ă���           2
�؂���ꂽ���         4
�n�C���C�g               8
^p

%href
listadd
listview




%index
listget
���X�g�r���[�̃A�C�e�����擾
%group
�I�u�W�F�N�g���䖽��
%prm
v1,n2,n3,n4
v1 : �擾�������̂�����ϐ�
n2 : �A�C�e���̃C���f�b�N�X
n3 : �擾�������
n4 : �擾����A�C�e���̏��

%inst
��ɃA�C�e���̃C���f�b�N�X���擾���܂��B
n3�ňȉ��̒l��������Ǝ擾������̂��ς���Ă��܂��B
^
^p
n3�̒l                               n4�̒l
1   n2�̏�̃A�C�e����index���擾    0 or �擾����A�C�e���̏��
2   n2�̉��̃A�C�e����index���擾    0 or �擾����A�C�e���̏��
3   n2�̍��̃A�C�e����index���擾    0 or �擾����A�C�e���̏��
4   n2�̉E�̃A�C�e����index���擾    0 or �擾����A�C�e���̏��
5   n2�̃e�L�X�g�擾                 �ϐ��̃T�C�Y or -1
6   n2�̃A�C�e���Ɏ��������l���擾   0 or 1
^p
^
n3��5�ɂ����Ƃ���stat�ɃA�C�e���Ɏ��������l������܂��B
n3��5�ɂ����Ƃ�n4��-1�ɂ���ƁAv1�ɓ����Ă��镶������g���ăA�C�e���̃e�L�X�g���Đݒ�ł��܂��B
n3��6�ɂ����Ƃ�n4��1�ɂ���ƁAv1�ɓ����Ă���l���g���ăA�C�e���Ɏ��������l���Đݒ�ł��܂��B
^
n4���ȉ��̒l�ɂ����n4�Ŏw�肵����Ԃ̃A�C�e����(n2+1)�Ԗڂ̃A�C�e������n3�Ŏw�肵�������Ɍ������Č������܂��B(n3��0�ɂ���ƕ����͎w�肵�܂���)
n4�̏�Ԃ̃A�C�e�����������v1�ɃA�C�e���̃C���f�b�N�X���������܂��B
������Ȃ������ꍇ��v1��-1���������܂��B
n2��-1�ɂ���Ɛ擪�̃A�C�e�����猟�����܂��B
^
^p
n4�̒l
0    ��Ԃ͎w�肵�Ȃ�
1    �t�H�[�J�X�������Ă���
2    �I������Ă���
4    �؂���ꂽ���
8    �n�C���C�g
^p

%href
listadd
listview

%sample
	#include "llmod3.hsp"
	#include "listview.hsp"
	listview winx-6,winy/2,1
	lv=stat
	listaddcl 0,"name"
	repeat 30 : listadd cnt,"�A�C�e�� No."+cnt : loop
	button "check",*check
	alloc bf,1024*32 : bf=""
	mesbox bf,winx-6,winy-csry-26
	_objsel lv
	stop
*check
	bf="" : notesel bf : start=-1	;�擪���猟��
	repeat -1
		listget chk,start,0,2	;�I����Ԃ̃A�C�e����T��
		if chk=-1 : break	;������Ȃ��ꍇ-1����������
		listget s,chk,5		;���������A�C�e���̃e�L�X�g���擾
		noteadd s+"�͑I������Ă��܂�"
		start=chk
	loop
	objprm 1,bf
	stop




%index
listicon
���X�g�r���[�̃A�C�R����ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
v1,n2,n3
v1 : �A�C�R�������������l�ϐ�(get_icon�Ŏ擾��������)
n2 : �A�C�R���̐�
n3 : �Z�b�g����A�C�R���̑召
%inst
���X�g�r���[�̃A�C�e���̃A�C�R����ݒ肵�܂��B
�A�C�R�����Z�b�g����ɂ́Aimg���W���[�����K�v�ł��B
^
���K���Alistview.hsp�����img.hsp���C���N���[�h���Ă��������B
^
n3��0�ɂ���Ƒ傫���A�C�R����\������Ƃ��̃A�C�R�����Z�b�g���An3��1�ɂ���Ə������A�C�R����\������Ƃ��̃A�C�R�����Z�b�g���܂��B
^
���̖��߂��Ăяo������A��stat�ɃZ�b�g�����A�C�R���ɂ��Ă̏�񂪓��������ʂȒl���������܂��B(�C���[�W���X�g�ƌĂ΂����̂ł��B)
^
listview��treebox�ƈ���āA_clrobj�Ȃǂ�listview�����������ƁA�A�C�R�����Z�b�g���ď�����������������I�ɊJ������̂ŁA
	destroy_imglist 'listicon���s���stat�ɑ�����ꂽ�l'
�����s����K�v�͂���܂���B
�������Alistview�̃X�^�C����'�Z�b�g�����C���[�W���X�g��listview�������ɏ������Ȃ�'���w�肵�Ă���ꍇ�́A�������͎����I�ɊJ������܂���B���̂Ƃ��́A
	destroy_imglist 'listicon���s���stat�ɑ�����ꂽ�l'
�����s���Ă��������B

%href
listadd
listview

%sample
	#include "llmod3.hsp"
	#include "img.hsp"	;listicon���g�����͕K�v(listview.hsp���O��)
	#include "listview.hsp"
	;�܂����X�g�r���[���쐬
	listview 300,200,1|2|4|$20
^
	;shell32.dll��3�Ԗڂ�4�Ԗڂ̃A�C�R��(��������)���g��
	;(*get_icon�ɂ��Ă�img.hsp�̐�����ǂ�ł��������B)
	filename="shell32.dll"
	get_icon icons.0,filename,3,1
	get_icon icons.1,filename,4,1
^
	listicon icons,2
	img_id=stat	;�Z�b�g�����A�C�R���ɂ��Ă̏�񂪓��������ʂȒl
^
	;�A�C�e����ǉ�
	;0�s�ڂ�0�Ԗڂ̗��ɃA�C�R���ԍ�1�̃A�C�R����t�����A�C�e����ǉ�
	listadd 0,"folder 1",0,1
	itm1=stat




%index
listmax
���X�g�r���[�̃A�C�e���̐����擾
%group
�I�u�W�F�N�g���䖽��
%prm
v1,n2
v1 : ���X�g�r���[���̃A�C�e���̐������鐔�l�ϐ�
n2 : �t���O

%inst
���X�g�r���[���̃A�C�e���̐����擾���܂��B
n2��1�ɂ���ƃ��X�g�r���[���Ɋ��S�Ɍ����Ă���A�C�e���̐����擾���܂��B

%href
listview




%index
listhit
�}�E�X�̉��ɂ���A�C�e�����擾
%group
�I�u�W�F�N�g���䖽��
%inst
�}�E�X�̉��ɂ���A�C�e���̃C���f�b�N�X���擾���܂��B
^
stat�Ƀ}�E�X�̉��ɂ���A�C�e���̃C���f�b�N�X���������܂��B
�}�E�X�̉��ɃA�C�e�����������-1���������܂��B

%href
listadd
listview




%index
sel_listview
���삷�郊�X�g�r���[��I��
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : ���X�g�r���[��ID

%inst
���̖��ߎg�p���n1�Ŏw�肵�����X�g�r���[�ɑ΂��Ċe������s���܂��B
���X�g�r���[�V�K�ɍ쐬����ƁA�����I�ɂ��̃��X�g�r���[���e����̑ΏۂɂȂ�܂��B
�����̃��X�g�r���[���쐬�����Ƃ��́A���̖��߂ő��삷�郊�X�g�r���[��I�����Ă��������B

%href
listview


%index
progbox
�v���O���X�{�b�N�X�̍쐬
%group
�g�����o�͐��䖽��
%prm
n1,n2,n3
n1 : ��
n2 : ����
n3 : �X�^�C��

%inst
�v���O���X�{�b�N�X���쐬���܂��B
�v���O���X�{�b�N�X�́A�i���󋵂�\������̂ɕ֗��ł��B
^
�X�^�C��(comctl32.dll�̃o�[�W������4.70�ȏ�łȂ���Ζ����ł�)
^p
n4�̒l
1    �i�ݕ����X���[�Y�ɂȂ�܂��B
4    �����ɖڐ��肪�i�݂܂��B
^p
���̖��߂��Ăяo������Astat�Ƀv���O���X�{�b�N�X��ID���������܂��B
^
��progbox��HSP�W�����߂�cls��screen���߂ł͏�������܂���B_cls�܂���_clrobj���g�p���Ă��������B

%href
progbox
progrng
progset
sel_progbox




%index
sel_progbox
���삷��v���O���X�{�b�N�X��I��
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : �v���O���X�{�b�N�X��ID
%inst
���̖��ߎg�p���n1�Ŏw�肵���v���O���X�{�b�N�X�ɑ΂��Ċe������s���܂��B
�v���O���X�{�b�N�X�V�K�ɍ쐬����ƁA�����I�ɂ��̃v���O���X�{�b�N�X���e����̑ΏۂɂȂ�܂��B
�����̃v���O���X�{�b�N�X���쐬�����Ƃ��́A���̖��߂ő��삷��v���O���X�{�b�N�X��I�����Ă��������B

%href
progbox



%index
progrng
�v���O���X�{�b�N�X�͈̔͂�ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
n1,n2,n3
n1 : �ŏ��l
n2 : �ő�l
n3 : �ő�l�̊g���t���O

%inst
�v���O���X�{�b�N�X�͈̔͂̐ݒ�����܂��B
�ݒ�ł���l�́A�ŏ��l��0�ȏ�A�ő�l��65535�ȉ��ł��B
n3��1��������ƍő�l��$ffffffff�܂łɂȂ�܂��B���������̐ݒ��comctl32.dll�̃o�[�W������4.70�ȏ�łȂ���Ζ����ł��B
^
���̖��߂��Ăяo�������stat�̒l
�ȑO�Z�b�g���Ă����͈� [ �ŏ��l | (�ő�l<<16)]�̌`�� (n3=0�̂Ƃ��̂�)

%href
progbox



%index
progset
�v���O���X�{�b�N�X�̊e�ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
n1,n2
n1 : �Z�b�g����l
n2 : �Z�b�g����^�C�v

%inst
�v���O���X�{�b�N�X�̊e�ݒ���s���܂��B
�Z�b�g����^�C�v�͈ȉ��̒ʂ�ł��B
^p
�ړI                 n1�̒l          n2�̒l   progset���s���stat�̒l
�i�܂���             0               0        �i�܂���O�̈ʒu
�i�܂���ʂ̃Z�b�g   �i�܂����      0        �ȑO�Z�b�g�����i�܂����
�ʒu���Z�b�g         �Z�b�g����ʒu  1        �Z�b�g����O�̈ʒu
����̗ʂ𑝉������� �����������    2        ����������O�̈ʒu
^
(�ȉ��̂��̂�comctl32.dll�̃o�[�W������4.70�ȏ�łȂ���Ζ����ł�)
�ڐ���̐F           �F              3        �Z�b�g����O�̐F
�ڐ���̌��̐F     �F              4        �Z�b�g����O�̐F
(�F��   r|(g<<8)|(g<<16)   �̌`��)
(�l�� 0 �ɂȂ��Ă��鏊�͏ȗ��ł���)
^p
stat�̒l��'�Z�b�g����O�̐F'�ƂȂ��Ă��鏊�́A�Z�b�g����O�̐F���V�X�e���̃f�t�H���g�̐F�������ꍇ -16777216($ff000000)��stat�ɑ������܂��B�܂��A�F���Z�b�g����Ƃ���$ff000000���g���ƃV�X�e���̃f�t�H���g�̐F�ɐݒ�ł��܂��B

%href
progrng
progbox
%sample
	progbox 300,20		;��300,����20�̃v���O���X�{�b�N�X�����
	progrng 0,200		;�͈͂�0����200
^
*lp
	progset			;�ڐ����i�܂���
		;
		;
	goto lp


%index
trackbox
�g���b�N�{�b�N�X�̍쐬
%group
���ߊT�v
%prm
n1,n2,n3
n1 : ��
n2 : ����
n3 : �X�^�C��

%inst
�g���b�N�{�b�N�X���쐬���܂��B
�g���b�N�{�b�N�X�Ƃ͂܂݂��������I�u�W�F�N�g�ł��B
���܂����I��͈͂̒����琔�l�𓾂����Ƃ��ȂǂɎg���̂ɕ֗��ł��B
^
���̖��߂��Ăяo������Astat�Ƀg���b�N�{�b�N�X��ID���������܂��B
^
trackbox�̃X�^�C��(n4)�͈ȉ��̒l��g�ݍ��킹�Ď����Ƃ��ł��܂��B
�Ⴆ�΁A
	n4=2|8|$100	;�܂��� n4=2+8+$100
	trackbox 200,70,n4
�Ȃ琂���ŗ����ɖڐ��肪�t���A�c�[���`�b�v�����X�^�C���ɂȂ�܂��B
^p
n4�̒l
0       ����
1       �����Ŗڐ����t����
2       ����
4       '����'�̂Ƃ�  �ڐ�����㑤�ɕt����
        '����'�̂Ƃ�  �ڐ���������ɕt����
8       �ڐ���𗼑��ɕt����
$10     �ڐ����t���Ȃ�
$20     �܂݂̕����ɑI��̈��t����
$40     $20 �̃X�^�C���̂Ƃ��A�܂݂������Ă��I��̈���Œ肵���܂܂ɂ���
$80     �܂݂Ȃ�
$100    �܂݂��N���b�N����Ă���Ƃ��c�[���`�b�v��t����(���̃X�^�C����
        comctl32.dll�̃o�[�W�����ɂ���Ă͌��ʂ��Ȃ��ꍇ������܂��B)
^p
^
��trackbox��HSP�W�����߂�cls��screen���߂ł͏�������܂���B_cls�܂���_clrobj���g�p���Ă��������B

%href
trackpos
trackrng
trackmrk
tracksel
sel_trackbox




%index
sel_trackbox
���삷��g���b�N�{�b�N�X��I��
%group
���ߊT�v
%prm
n1
n1 : �g���b�N�{�b�N�X��ID
%inst
���̖��ߎg�p���n1�Ŏw�肵���g���b�N�{�b�N�X�ɑ΂��Ċe������s���܂��B
�g���b�N�{�b�N�X�V�K�ɍ쐬����ƁA�����I�ɂ��̃g���b�N�{�b�N�X���e����̑ΏۂɂȂ�܂��B
�����̃g���b�N�{�b�N�X���쐬�����Ƃ��́A���̖��߂ő��삷��g���b�N�{�b�N�X��I�����Ă��������B

%href
trackbox



%index
trackpos
�g���b�N�{�b�N�X�̂܂݂̈ʒu�̐ݒ�Ǝ擾
%group
���ߊT�v
%prm
n1,n2
n1 : �ݒ肷��ʒu
n2 : �ʒu���擾����t���O

%inst
�g���b�N�{�b�N�X�̂܂݂̈ʒu��ݒ肵�܂��B
n2��1�ɂ���Ƃ܂݂̈ʒu���擾���܂��B
^
���̖��߂��Ăяo�������stat�̒l
n2��1�ɂ����stat�ɂ܂݂̈ʒu���������܂��B
����ȊO��stat��0�ɂȂ�܂��B

%href
trackrng
trackbox



%index
trackrng
�g���b�N�{�b�N�X�͈̔͂̐ݒ�Ǝ擾
%group
���ߊT�v
%prm
n1,n2,n3
n1 : �ŏ��l
n2 : �ő�l
n3 : �͈͂��擾����t���O

%inst
�g���b�N�{�b�N�X�͈̔͂�ݒ�A�擾���܂��B
n3��1�ɂ���Ɛݒ�͈͂̒l���擾���܂��B
^
���̖��߂��Ăяo�������stat�̒l
n3��1�ɂ��āAn1��1�ɂ����trackbox�̍ŏ��ʒu�An2��1�ɂ���ƍő�ʒu��stat�ɑ������܂��B
����ȊO��stat��0�ɂȂ�܂��B

%href
trackpos
trackbox



%index
trackmrk
�g���b�N�{�b�N�X�̖ڐ���̐ݒ�Ǝ擾
%group
���ߊT�v
%prm
n1,n2
n1 : �ڐ��������ʒu
n2 : �t���O

%inst
�g���b�N�{�b�N�X�̖ڐ���̈ʒu��ݒ�A�擾���܂��B
^
n2�̒l  �@�\
0       n1�Ŏw�肵���ʒu�ɖڐ����t���܂��B
1       �t�����Ă���ڐ���̐����擾���܂��B
2       �Ԋu��n1�Ŏw�肵���l�ɂ��Ėڐ���t���܂��B�������A�g���b�N�{�b�N�X�̃X�^�C����'�����Ŗڐ����t����'(1)�ɂ����Ƃ��̂ݗL���ł��B
3       n1�Ԗڂ̖ڐ���̈ʒu���擾���܂��B
4       �t�����Ă���ڐ�������ׂăN���A���܂��B

%href
trackbox




%index
tracksel
�g���b�N�{�b�N�X�̑I��͈͂̐ݒ�Ǝ擾
%group
���ߊT�v
%prm
n1,n2,n3
n1 : �ŏ��l
n2 : �ő�l
n3 : �t���O

%inst
�g���b�N�{�b�N�X�̑I��͈͂�ݒ�A�擾���܂��B
�������A�g���b�N�{�b�N�X�쐬����'�܂݂̕����ɑI��̈��t����'($20)�Ƃ���
�X�^�C�����w�肵�Ă���ꍇ�Ɍ���܂��B
^p
n3��0�ɂ����n1-n2�͈̔͂�I�����܂��B
n3��1�ɂ���ƊJ�n�ʒu(n1�̒l)�݂̂��Z�b�g���܂��B
n3��2�ɂ���ƏI���ʒu(n2�̒l)�݂̂��Z�b�g���܂��B
n3��3�ɂ���ƑI��͈͂��N���A���܂��B
^p
���̖��߂��Ăяo�������stat�̒l
n1�An2���Ƃ���0����ƑI���J�n�ʒu��stat�ɑ������܂��B
n1�An2���Ƃ���1����ƑI���I���ʒu��stat�ɑ������܂��B

%href
trackbox


%index
treemax
�c���[�{�b�N�X�̃A�C�e���̐����擾
%group
�I�u�W�F�N�g���䖽��
%prm
v1,n2
v1 : �c���[�{�b�N�X���̃A�C�e���̐������鐔�l�ϐ�
n2 : �t���O

%inst
�c���[�{�b�N�X���̃A�C�e���̐����擾���܂��B
n2��1�ɂ���ƃc���[�{�b�N�X���Ɋ��S�Ɍ����Ă���A�C�e���̐����擾���܂��B

%href
treebox



%index
treesel
�c���[�{�b�N�X�̃A�C�e����I��
%group
�I�u�W�F�N�g���䖽��
%prm
n1,n2
n1 : �A�C�e����ID
n2 : �I����Ԃ̃^�C�v

%inst
n1�Ŏw�肵���A�C�e����I�����܂��B
n2��$10�𑫂��ƃA�C�e�����q�������Ă���Ƃ��A���̃A�C�e�������k���܂��B
n2��$20�𑫂��ƃA�C�e�����q�������Ă���Ƃ��A���̃A�C�e����W�J���܂��B
^
^p
n2�̒l   �I�����
0        ���ʂ̃^�C�v
1        DragDrop��target�̂悤�ȃ^�C�v
2        item��擪�Ɏ����Ă����đI��(�Ƃ̊��ł͂Ȃ�Ȃ��悤��... tom)
+$10     �W�J
+$20     ���k
+$30     �t�̏�Ԃɂ���
^p

%href
treebox
treeadd




%index
treedel
�c���[�{�b�N�X�̃A�C�e��������
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : �A�C�e����ID

%inst
n1�Ŏw�肵���A�C�e�����������܂��B

%href
treeadd
treebox




%index
treesort
�c���[�{�b�N�X�̃A�C�e�����\�[�g
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : �A�C�e����ID

%inst
n1�Ŏw�肵���A�C�e���̎q���\�[�g���܂��B
n1���ȗ�����ƃg�b�v�̃A�C�e�����\�[�g���܂��B

%href
treeadd
treebox



%index
treeicon
�c���[�{�b�N�X�̃A�C�R����ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
v1,n2
v1 : �A�C�R�������������l�ϐ�(get_icon�Ŏ擾��������)
n2 : �A�C�R���̐�

%inst
�c���[�{�b�N�X�̃A�C�e���̃A�C�R����ݒ肵�܂��B
�A�C�R�����Z�b�g����ɂ́Aimg���W���[�����K�v�ł��B
^
���K���Atreebox.hsp�����img.hsp���C���N���[�h���Ă��������B
^
���̖��ߎ��s���stat�ɃZ�b�g�����A�C�R���ɂ��Ă̏�񂪓��������ʂȒl���Ԃ���܂��B(�C���[�W���X�g�ƌĂ΂����̂ł��B)
treebox������Ȃ��Ȃ���treebox�����������Ƃ��͂Ȃ�ׂ�
	destroy_imglist 'treeicon���s���stat�ɑ�����ꂽ�l'
�����s���Ă��������B
(�A�C�R�����Z�b�g����ƃ�����������܂��Bdestroy_imglist�����s���邱�ƂŃZ�b�g���ď�������������J�����܂��B)
treebox���܂����邤����destroy_imglist�����s����ƁA�Z�b�g���ꂽ�A�C�R���͖����ɂȂ�܂��B

%href
treeadd
treebox
%sample
#include "llmod3.hsp"
#include "img.hsp"	;treeicon���g�����͕K�v(treebox.hsp���O��)
#include "treebox.hsp"
^
treebox 300,200,1|2|4|$20
^
filename="shell32.dll"
get_icon icons.0,filename,3,1
get_icon icons.1,filename,4,1
treeicon icons,2
img_id=stat	;�Z�b�g�����A�C�R���ɂ��Ă̏�񂪓��������ʂȒl
^
treeadd 0,"folder 1",,0,1
itm1=stat




%index
treehit
�}�E�X�̉��ɂ���A�C�e�����擾
%group
�I�u�W�F�N�g���䖽��
%inst
�}�E�X�̉��ɂ���A�C�e����ID���擾���܂��B
^
stat�Ƀ}�E�X�̉��ɂ���A�C�e����ID���������܂��B
�}�E�X�̉��ɃA�C�e�����������0���������܂��B

%href
treebox



%index
sel_treebox
���삷��c���[�{�b�N�X��I��
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : �c���[�{�b�N�X��ID

%inst
���̖��ߎg�p���n1�Ŏw�肵���c���[�{�b�N�X�ɑ΂��Ċe������s���܂��B
�V�K�Ƀc���[�{�b�N�X���쐬����ƁA�����I�ɂ��̃c���[�{�b�N�X���e����̑ΏۂɂȂ�܂��B
�����̃c���[�{�b�N�X���쐬�����Ƃ��́A���̖��߂ő��삷��c���[�{�b�N�X��I�����Ă��������B

%href
treebox




%index
treeget
�c���[�{�b�N�X�̊e�����擾
%group
�I�u�W�F�N�g���䖽��
%prm
v1,n2,n3,n4
v1 : �擾�������̂�����ϐ�
n2 : �擾����^�C�v
n3 : n2�ɂ���ĕς��
n4 : n2�ɂ���ĕς��

%inst
��ɃA�C�e����ID���擾���܂��B
n2�ňȉ��̒l��������Ǝ擾������̂��ς���Ă��܂��B
^
^p
n2�̒l                               n3�̒l        n4�̒l
0   �I������Ă��鱲�т�ID���擾     0             0
1   ���̱��т�ID(�������x��)���擾   �A�C�e����ID  0
2   �O�̱��т�ID(�������x��)���擾   �A�C�e����ID  0
3   �e���т�ID���擾                 �A�C�e����ID  0
4   ��Ԗڂ̎q�ǂ౲�т�ID���擾     �A�C�e����ID  0
5   �ŏ��Ɍ����Ă��鱲�т�ID���擾   �A�C�e����ID  0
6   �A�C�e���̃e�L�X�g�擾           �A�C�e����ID  �ϐ��̃T�C�Y or -1
7   �A�C�e���Ɏ��������l���擾       �A�C�e����ID  0 or 1
-1  ���[�g���擾                     0             0
^p
^
�l��0�̏��͏ȗ��ł��܂��B
n2��6�̏ꍇ�An4�ɉ������܂Ŏ擾���邩�w�肵�܂��B63�����ȓ��Ȃ�ȗ��ł��܂��B
n2��6�̂Ƃ���stat��treeadd�ŃA�C�e���Ɏ��������l���������܂��B
^
n2��6�ɂ����Ƃ�n4��-1�ɂ���ƁAv1�ɓ����Ă��镶������g���ăA�C�e���̃e�L�X�g���Đݒ�ł��܂��B
n2��7�ɂ����Ƃ�n4��1�ɂ���ƁAv1�ɓ����Ă���l���g���ăA�C�e���Ɏ��������l���Đݒ�ł��܂��B

%href
treeadd
treebox



%index
treeadd
treebox�ɃA�C�e����ǉ�
%group
�I�u�W�F�N�g���䖽��
%prm
n1,"s2",n3,n4,n5,n6
n1 : �e�A�C�e����ID
s2 : �A�C�e���̃e�L�X�g
n3 : �A�C�e���̒ǉ��̎d��
n4 : �A�C�e�������k���Ă��鎞�̃A�C�R���ԍ�
n5 : �A�C�e�����W�J���Ă��鎞�̃A�C�R���ԍ�
n6 : �A�C�e���Ɏ������鐔�l

%inst
�c���[�{�b�N�X��n1��e�ɂ��ăA�C�e���������܂��B
n1��0��������ƈ�Ԗڂ̃A�C�e���ɂȂ�܂��B
n3�ɂ͂ǂ̂悤�ɃA�C�e����ǉ����邩�An4�ɂ͎��k���Ă��鎞�̃A�C�R���ԍ�(0����)�An5�ɂ͓W�J���Ă���Ƃ��̃A�C�R���ԍ�(0����)�����܂��B
^
�ǂ̂悤�ɒǉ����邩�́A1�Ő擪�̎q�Ƃ��Ēǉ��A0�܂���2�ň�ԍŌ�̎q�Ƃ��Ēǉ��A3�Ń\�[�g���Ēǉ��A�ƂȂ�܂��B
�A�C�R����treeicon�ŃZ�b�g���܂��B
^
n6�ɒl�����ăA�C�e���ɂ��̐��l���������邱�Ƃ��ł��܂��B
n6�Őݒ肵�����l��treeget�Ŏ擾�ł��܂��B
^
���̖��߂��Ăяo������Astat�ɒǉ������A�C�e����ID���������܂��B(0�Ȃ�G���[)

%href
treedel
treeicon
treeget
treesel
treebox

%sample
treeadd itm3,"new item",3,0,1
new_itm_id=stat




%index
treebox
treebox�̍쐬
%group
�I�u�W�F�N�g���䖽��
%prm
n1,n2,n3
n1 : ��
n2 : ����
n3 : �X�^�C��

%inst
�c���[�{�b�N�X���쐬���܂��B
�c���[�{�b�N�X�Ƃ̓G�N�X�v���[���[�̍����ɂ���悤�Ȃ��̂ł��B
�X�^�C���͈ȉ��̒l��g�ݍ��킹�Ďg�����Ƃ��ł��܂��B
^p
n3�̒l
1       �A�C�e�����q�����Ƃ�'+','-'�̃}�[�N���t��
2       �A�C�e���ƃA�C�e�����q��������
4       �ŏ��̃A�C�e���ɐ����t��(2���w�肳��Ă���Ƃ��̂�)
8       �����̐����͎g��Ȃ��ŉ������B
$10     �����̐����͎g��Ȃ��ŉ������B
$20     �c���[�{�b�N�X���I������Ă��Ȃ��Ƃ��ɂ��I������Ă���A�C�e����������悤�ɐF���t��
$40     ���悭������Ȃ�(tom)
$80     �A�C�e�����c���[�{�b�N�X����͂ݏo�Ă��Ă��c�[���`�b�v�����Ȃ�
���ȉ��̃X�^�C����comctl32.dll�̃o�[�W�����ɂ���Ă͎g�p�ł��Ȃ����̂�����܂��B
$100    ���ڂɃ`�F�b�N�{�b�N�X���t��
$200    �}�E�X���A�C�e���̏�ɗ���Ɖ������t��
$400    �}�E�X�ŃN���b�N���ꂽ�A�C�e���݂̂��W�J�����
$800    ���悭������Ȃ�(tom)
$1000   �X�^�C��2 ���w�肳��Ă��Ȃ��Ƃ��A�I�����ꂽ�A�C�e���̔w�i���ς��
$2000   �A�C�e�����c���[�{�b�N�X���Ɏ��܂�Ȃ����ł��A�X�N���[���o�[���t���Ȃ�
$4000   ���悭������Ȃ�(tom)
$8000   �����X�N���[���o�[���t���Ȃ�
^p
^
���̖��߂��Ăяo������Astat�Ƀc���[�{�b�N�X��ID���������܂��B
^
��treebox��HSP�W�����߂�cls��screen���߂ł͏�������܂���B_cls�܂���_clrobj���g�p���Ă��������B

%href
treeadd
treedel
treesel
treeget
treemax
treesort
treeicon
treehit
sel_treebox


%index
udbtn
�A�b�v�_�E���{�^���̍쐬
%group
���ߊT�v
%prm
n1,n2,n3,n4
n1 : ��
n2 : ����
n3 : �X�^�C��
n4 : �A�b�v�_�E���{�^����t����I�u�W�F�N�g��ID

%inst
�A�b�v�_�E���{�^�����쐬���܂��B
�A�b�v�_�E���{�^���Ƃ͖��{�^�����������I�u�W�F�N�g�ł��B
input���̓��̓{�b�N�X���琔�l�𓾂����Ƃ��ȂǂɎg���ƕ֗��ł��B
(�ꉞbutton���ɂ��t���邱�Ƃ͂ł��܂��B)
n4�ɂ�button�Ȃǂ̃I�u�W�F�N�g��ID�����܂��B
^
���̖��߂��Ăяo������Astat�ɃA�b�v�_�E���{�^����ID���������܂��B

udbtn�̃X�^�C��(n4)�͈ȉ��̒l��g�ݍ��킹�Ď����Ƃ��ł��܂��B
^p
n4�̒l  �X�^�C��
1       �ŏ��A�ő�l�ɒB�����Ƃ��ɐ܂�Ԃ�
4       �I�u�W�F�N�g�̉E���ɕt����
8       �I�u�W�F�N�g�̍����ɕt����
$20     �����L�[�Ő��l��ς�����悤�ɂ���
$40     �����^�C�v
$80     �������J���}�ŋ�؂�Ȃ�
^
��udbtn��HSP�W�����߂�cls��screen���߂ł͏�������܂���B_cls�܂���_clrobj���g�p���Ă��������B

%href
udset
udget
sel_udbtn




%index
sel_udbtn
���삷��A�b�v�_�E���{�^���̑I��
%group
���ߊT�v
%prm
n1
n1 : �A�b�v�_�E���{�^����ID
%inst
���̖��ߎg�p���n1�Ŏw�肵���A�b�v�_�E���{�^���ɑ΂��Ċe������s���܂��B
�A�b�v�_�E���{�^���V�K�ɍ쐬����ƁA�����I�ɂ��̃A�b�v�_�E���{�^�����e����̑ΏۂɂȂ�܂��B
�����̃A�b�v�_�E���{�^�����쐬�����Ƃ��́A���̖��߂ő��삷��A�b�v�_�E���{�b�N�X��I�����Ă��������B

%href
udbtn



%index
udset
�A�b�v�_�E���{�^���̐ݒ�
%group
���ߊT�v
%prm
n1,n2,n3
n1 : �Z�b�g����^�C�v
n2 : n1�ɂ���ĕς��
n3 : n1�ɂ���ĕς��

%inst
�A�b�v�_�E���{�^���̐ݒ�����܂��B
�ݒ肷����̂�n1�̒l�ɂ���ĈقȂ�܂��B
^p
n1�̒l
0       �A�b�v�_�E���{�^���̑����ݒ肵�܂��B
       n2�ɃI�u�W�F�N�g��ID���w�肵�܂��B
^
1       �A�b�v�_�E���{�^���͈̔͂�ݒ肵�܂��B
       n2�ɍŏ��l(0����$7FFF�܂�),n3�ɍő�l(0����$7FFF�܂�)���w�肵�܂��B
^
2       �A�b�v�_�E���{�^���̈ʒu��ݒ肵�܂��B
       n2�ɃA�b�v�_�E���{�^���̈ʒu���w�肵�܂��B
^
3       �A�b�v�_�E���{�^���̐��l��16�i�ŕ\�����܂��B
       n2���ȗ������16�i�ɂȂ�A0�ȊO�̒l�������10�i�ɖ߂�܂��B
^
4       �A�b�v�_�E���{�^���̑����ʂ�ω������鎞�Ԃ�ݒ肵�܂��B
       n2�ɐݒ肷�鐔�An3�ɐݒ肷�鎞�ԁA�����ʂ����������l�ϐ��̃|�C���^���w�肵�܂��B
	(��)
		udbtn 100,100
		;�ŏ���1���A3�b���10���A6�b���50������������悤�ɂ���
		a=0,1,	3,10,  6,50
		getptr p,a
		udset 4,3,p		;�ݒ肷�鎞�Ԃ�3��
^p
���̖��߂��Ăяo�������stat�̒l
n1�̒l    stat�̒l
 0        �Z�b�g����O�̑����ID
 1        0
 2        �Z�b�g����O�̈ʒu
 3        �Z�b�g����O�̕\���^�C�v
 4        �Z�b�g�����������ꍇ��1�A���s�����ꍇ��0

%href
udget
udbtn



%index
udget
�A�b�v�_�E���{�^���̊e����̎擾
%group
���ߊT�v
%prm
n1
n1 : �擾����^�C�v
%inst
�A�b�v�_�E���{�^���̊e������擾���܂��B
�擾������̂�n1�̒l�ɂ���ĈقȂ�܂��B
�e����stat�ɑ������܂��B
^p
n1�̒l
0       �A�b�v�_�E���{�^���̑�����擾���܂��B
1       �A�b�v�_�E���{�^���͈̔͂��擾���܂��B
       stat�̒l�� ' �ŏ��l | (�ő�l<<16) ' �̌`���ɂȂ��Ă��܂��B
2       �A�b�v�_�E���{�^���̈ʒu���擾���܂��B
3       �A�b�v�_�E���{�^���̐��l�̕\���̎d�����擾���܂��B
^p
%href
udset
udbtn


