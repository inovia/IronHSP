;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.4
%note
obaq.as���C���N���[�h���邱�ƁB

%date
2014/04/24
%author
onitama
%dll
obaq
%url
http://hsp.tv/
%port
Win
%group
�g�����o�͐��䖽��


%index
qreset
OBAQ������
%inst
OBAQ�����A���ׂĂ̏�񂪏���������܂��B
qreset���߂ɂ�菉�������s�Ȃ��ƁA��ʑS�̂��͂ޕ�(�g)�������I�ɐݒ肳��܂��B
�ǂ̃T�C�Y��ʒu��ύX�������ꍇ�́Aqborder���߂ɂ��Đݒ���s�Ȃ��Ă��������B
qreset���s���ɁAHSP�̕`��ΏۂƂ��Đݒ肳��Ă����E�B���h�E���AOBAQ�ł��`��̑ΏۂƂȂ�܂��B
�`��̑ΏۂƂȂ�E�B���h�E��ύX����ꍇ�ɂ́Aqview���߂��g�p���Ă��������B
%href
qview
qborder
qterm


%index
qterm
OBAQ�I������
%inst
OBAQ�����A���ׂĂ̏���j�����܂��B
�v���O�����I�����Ȃǂɓ����ŌĂяo����܂��B
�ʏ�͌Ăяo���K�v�͂���܂���B
%href
qreset


%index
qexec
OBAQ�t���[������
%inst
�t���[�����Ƃ̕������Z�����s���܂��B
����ɂ��A���ׂẴI�u�W�F�N�g���W���X�V����܂��B
���C�����[�v�ł́A�K��qexec���߂ɂ��I�u�W�F�N�g�̈ړ��X�V���s�Ȃ��K�v������܂��B
�܂��A�����̕`��𗘗p����ꍇ�́Aqdraw���߂ɂ���ʂ̍X�V���K�v�ɂȂ�܂��B
%href
qdraw


%index
qdraw
OBAQ�`�揈��
%prm
mode
mode(0) : �f�o�b�O�\�����[�h�ݒ�(0=ON/1=OFF)
%inst
OBAQ�ɂ��I�u�W�F�N�g�̕`�揈�����s�Ȃ��܂��B
���ꂼ��̃I�u�W�F�N�g�ɐݒ肳�ꂽ�}�e���A���������ƂɁA�K�؂ȕ\�����s�Ȃ��܂��B
mode�̐ݒ�ɂ��A�f�o�b�O�\����ON/OFF��ݒ肷�邱�Ƃ��ł��܂��B
�f�o�b�O�\�����́A���C���[�t���[���ɂ��I�u�W�F�N�g�̌`��⒆�S�ʒu�A�O���[�v�Ȃǂ��m�F���邱�Ƃ��ł��܂��B
�\����E�C���h�D�̕ύX��A�\���{���A�\���ʒu�I�t�Z�b�g�̐ݒ��qview���߂��g�p���Ă��������B
qdraw���߂ɂ��`��́AWindows�̃V�X�e��API(GDI)�𗘗p���Ă��܂��̂ŁA
��ʃN���A�ƁAredraw���߂ɂ��X�V���s�Ȃ��K�v������܂��B
���̃V�X�e���ɂ��`��(DirectX��)���s�Ȃ��ꍇ�́Aqexec���߂ɂ��X�V�������s�Ȃ��Ă���A
�e�I�u�W�F�N�g�̕\���ʒu�����O�Ŏ擾���ĕ`����s�Ȃ��K�v������܂��B
(�\�����W�̕ϊ��p��qcnvaxis���߂�qgetaxis���߂��p�ӂ���Ă��܂��B)

%href
qview
qexec
qcnvaxis
qgetaxis


%index
qview
�r���[�ݒ�
%prm
zoomx,zoomy,ofsx,ofsy
zoomx(4.0) : X�����̃Y�[���{��(����)
zoomy(4.0) : Y�����̃Y�[���{��(����)
ofsx(0.0)  : X�����̕\���I�t�Z�b�g(����)
ofsy(0.0)  : Y�����̕\���I�t�Z�b�g(����)
%inst
qdraw���߂ɂ��`�悳���ۂ̕\���ݒ���s�Ȃ��܂��B
zoomx,zoomy�ɂ��\���{��(OBAQ�̓������W����ʂɔ��f������ۂ̔{��)��ݒ肵�܂��B
ofsx,ofsy�ɂ��A�\���ʒu�̃I�t�Z�b�g��ݒ肷�邱�Ƃ��ł��܂��B
�܂��Aqview���s���ɁAHSP�̕`��ΏۂƂ��Đݒ肳��Ă����E�B���h�E���A�`��̑ΏۂƂ��čĐݒ肳��܂��B

%href
qdraw
qreset


%index
qsetreq
�V�X�e�����N�G�X�g�ݒ�
%prm
reqid,val
reqid(0) : ���N�G�X�gID
val(0.0) : �ݒ�l(����)
%inst
OBAQ�ɑ΂��ėl�X�ȃV�X�e���ݒ���s�Ȃ��܂��B
reqid�l�Ŏw��ł���͈̂ȉ��̃V���{���ł��B
^p
	�V���{����        	���e
------------------------------------------------------------------------
	REQ_PHYSICS_RATE	1�t���[��������̕����v�Z��
	REQ_MAXOBJ		�I�u�W�F�N�g�ő吔(512�ȓ�)(*)
	REQ_MAXLOG		�R���W�������O�ő吔(*)
	REQ_DEFAULT_WEIGHT	�f�t�H���g�̏d��
	REQ_DEFAULT_MOMENT	�f�t�H���g�̃��[�����g
	REQ_DEFAULT_FRICTION	�f�t�H���g�̖��C

(*)�̃V���{���́Aqreset���ߎ��s�܂œ��e�����f����܂���B
^p

%href
qgetreq


%index
qgetreq
�V�X�e�����N�G�X�g�擾
%prm
var,reqid
var      : ���e���擾����ϐ�
reqid(0) : ���N�G�X�gID
%inst
OBAQ�̃V�X�e���ݒ�l���擾���܂��B
var�Ŏw�肳�ꂽ�ϐ��ɓ��e��ǂݏo���܂��B
var�̕ϐ��́A�����I�Ɏ����^�ɐݒ肳��܂��B
reqid�l�Ŏw��ł���͈̂ȉ��̃V���{���ł��B
^p
	�V���{����            �����l	���e
------------------------------------------------------------------------------
	REQ_PHYSICS_RATE	4	1�t���[��������̕����v�Z��
	REQ_MAXOBJ		512	�I�u�W�F�N�g�ő吔(512�ȓ�)(*)
	REQ_MAXLOG		256	�R���W�������O�ő吔(*)
	REQ_DEFAULT_WEIGHT	6.0	�f�t�H���g�̏d��
	REQ_DEFAULT_MOMENT	1200.0	�f�t�H���g�̃��[�����g
	REQ_DEFAULT_FRICTION	1.0	�f�t�H���g�̖��C

(*)�̃V���{���́Aqreset���ߎ��s�܂œ��e�����f����܂���B
^p

%href
qsetreq


%index
qborder
�O�ǂ�ݒ�
%prm
x1,y1,x2,y2
x1(-100) : ����X���W(����)
y1(-100) : ����Y���W(����)
x2(100)  : �E��X���W(����)
y2(100)  : �E��Y���W(����)
%inst
�W���I�ɐݒ肳��Ă���O�ǂ̃T�C�Y���Đݒ肵�܂��B
��ʂ̒�����(0,0)�Ƃ��āA����ƉE���̍��W(OBAQ�̓������W)���w�肵�Ă��������B
�O�ǂ́A�����ǂ̂Ȃ���Ԃŉ�ʓ��ɃI�u�W�F�N�g��z�u�����ۂɁA
��ʊO�܂ŗ�������̂�h�����߂̂��̂ł��B
%href
qreset


%index
qgravity
�d�͂�ݒ�
%prm
gx,gy
gx(0.0)   : X�����̏d��(����)
gy(0.005) : Y�����̏d��(����)
%inst
��Ԃ̏d�͂�ݒ肵�܂��B
�����l�́A(0,0.005)���ݒ肳��Ă��܂��B

%href
qreset


%index
qcnvaxis
X,Y���W�l��ϊ�
%prm
var_x,var_y,x,y,opt
var_x  : X���擾����ϐ�
var_y  : Y���擾����ϐ�
x(0.0) : �ϊ�����X���W(����)
y(0.0) : �ϊ�����Y���W(����)
opt(0) : �ϊ����[�h
%inst
X,Y���W�l���w�肳�ꂽ���@�ɏ]���ĕϊ����܂��B
�ϊ����̍��W��(x,y)�Ŏw�肷��ƁAvar_x,var_y�ɂ��ꂼ��ϊ��ς݂�X,Y���W�l���������܂��B
opt�Ŏw�肷��ϊ����[�h�́A�ȉ��̒l��I�Ԃ��Ƃ��ł��܂��B
^p
	�ϊ����[�h        	���e
------------------------------------------------------------------------
	0                       �������W����ʏ�̍��W�ɕϊ�
	1                       ��ʏ�̍��W��������W�ɕϊ�
^p
�ϊ����[�h0(�܂��͏ȗ���)�́A�������W��qdraw���߂ŕ\��������ʏ�̍��W�ɕϊ����܂��B(var_x,var_y�͐����^�ɐݒ肳��܂��B)
�ϊ����[�h1�́Aqdraw���߂ŕ\��������ʏ�̍��W��������W�ɕϊ����܂��B(var_x,var_y�͎����^�ɐݒ肳��܂��B)

%href
qgetaxis


%index
qgetaxis
�������W���擾
%prm
num,var_x,var_y,type
num(0) : �I�u�W�F�N�gID
var_x  : X���擾����ϐ�
var_y  : Y���擾����ϐ�
type(0): �擾�^�C�v
%inst
OBAQ�̃I�u�W�F�N�g�����������W�y�ѕ\���p�����[�^�[��ϐ��ɓǂݏo���܂��B
var_x,var_y�͐����^�Ƃ��Ď����I�ɐݒ肳��܂��B
type�Ŏw��ł�����e�͈ȉ��̒ʂ�ł��B
^p
	�擾�^�C�v        	���e
------------------------------------------------------------------------
	0                       �I�u�W�F�N�g�̍�����W
	1                       �I�u�W�F�N�g�̉E�����W
	2			�I�u�W�F�N�g��X,Y�T�C�Y(*)

(*)�̃V���{���́A�\����ʏ�ł̃T�C�Y(�h�b�g��)���Ԃ���܂�
^p

%href
qcnvaxis


%index
qdel
�I�u�W�F�N�g�폜
%prm
num
num(0) : �I�u�W�F�N�gID
%inst
�w�肳�ꂽ�I�u�W�F�N�g���폜���܂��B
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qaddpoly
qaddmodel


%index
qaddpoly
���p�`�I�u�W�F�N�g�ǉ�
%prm
var,shape,x,y,r,sx,sy,colsw,mygroup,exgroup,loggroup
var      : �I�u�W�F�N�gID���擾����ϐ�
shape(3) : ���_��
x(0.0)   : �z�uX���W(����)
y(0.0)   : �z�uY���W(����)
r(0.0)   : �z�u�p�x(����)(�P�ʂ̓��W�A��)
sx(10.0) : �z�uX�T�C�Y(����)
sy(10.0) : �z�uY�T�C�Y(����)
colsw(1) : �z�u�`�F�b�N�̃��[�h
mygroup(1)  : ������������R���W�����O���[�v
exgroup(0)  : �Փ˂����O����O���[�v
loggroup(0) : �R���W�������O���쐬����O���[�v
%inst
OBAQ�ɑ��p�`�I�u�W�F�N�g��ǉ����܂��B
shape�Ŏw�肳�ꂽ���_�����I�u�W�F�N�g����������܂��B
(shape�̒��_����3�ȏ�łȂ���΂Ȃ�܂���B)
(x,y)�Ŕz�u�̍��W���w�肵�܂��B(OBAQ�̓������W��ݒ肵�܂��B)
r�Ŕz�u�p�x(+���������v����ɂȂ�܂�)���w�肵�܂��B�P�ʂ̓��W�A���ƂȂ�܂��B
(sx,sy)�ŁA�z�u���̑傫�����w�肵�܂��B�f�t�H���g�ł́A(10,10)�̃T�C�Y���g�p����܂��B
mygroup,exgroup,loggroup�̓R���W����(�Փ�)�̌��o�̂��߂ɐݒ肳���O���[�v�l�ɂȂ�܂��B
�O���[�v�l�́A32bit�����ꂩ�̃r�b�g��1�̒l(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768�c)�ɂ���Ď�����܂��B
colsw�Ŕz�u�`�F�b�N�̃��[�h��I�����邱�Ƃ��ł��܂��B
^p
	���[�h        �l	���e
------------------------------------------------------------------------
	colsw_none     0        �o�����R���W�����`�F�b�N����
	colsw_active   1        �o����active��Ԃ̊�Ƃ̐ڐG�������
	colsw_all      2        �o����reserve��ԈȊO�̊�Ƃ̐ڐG�������
^p
�I�u�W�F�N�g������ɒǉ����ꂽ���ɂ́Avar�Ŏw�肳�ꂽ�ϐ��ɃI�u�W�F�N�gID�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
�o�^���̌��E�ŃI�u�W�F�N�g�̒ǉ����s�Ȃ��Ȃ������ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ���-1���������܂��B
�R���W����(�Փ�)���o�̂��߃I�u�W�F�N�g�̒ǉ����s�Ȃ��Ȃ������ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ���-2���������܂��B

%href
qaddmodel


%index
qaddmodel
���R�ݒ�I�u�W�F�N�g�ǉ�
%prm
var,shape_var,nvertex,x,y,r,sx,sy,colsw,mygroup,exgroup,loggroup
var      : �I�u�W�F�N�gID���擾����ϐ�
shape_var: �`��f�[�^���������z��ϐ�
nvertex(-1) : �`��f�[�^�̌�
x(0.0)   : �z�uX���W(����)
y(0.0)   : �z�uY���W(����)
r(0.0)   : �z�u�p�x(����)(�P�ʂ̓��W�A��)
sx(10.0) : �z�uX�T�C�Y(����)
sy(10.0) : �z�uY�T�C�Y(����)
colsw(1) : �z�u�`�F�b�N�̃��[�h
mygroup(1)  : ������������R���W�����O���[�v
exgroup(0)  : �Փ˂����O����O���[�v
loggroup(0) : �R���W�������O���쐬����O���[�v
%inst
OBAQ�Ɏ��R�ݒ肳�ꂽ�`��̃I�u�W�F�N�g��ǉ����܂��B
��ʓI�ȑ��p�`�́Aqaddpoly���߂ɂ���Đ������邱�Ƃ��ł��܂��B
qaddmodel���߂ł́A���_���ʂɎw�肷�邱�Ƃł�莩�R�Ȍ`��o�^���邱�Ƃ��ł��܂��B
shape_var�ɁA�`��f�[�^���������z��ϐ����w�肷��K�v������܂��B
�z��ϐ��ɂ́Ax1,y1,x2,y2�c�̏��Ԃɍ��W���i�[���Ă����Ă��������B
���W�́A�K�������(�����v���)�Ŏw�肵�A�ʖʑ̂łȂ���΂Ȃ�܂���B
1�̃I�u�W�F�N�g�ɕ����̓ʖʑ̂������邱�Ƃ��\�ł��B
���̏ꍇ�́A�����Ŏw�肷����W�̍Ō���A�ŏ��̍��W�Ɠ���ɂ��ĕ����`�ɂ�����ŁA
�V�����ʂȌ`�̍��W���w�肷��悤�ɂ��Ă��������B
^
nvertex�Ńf�[�^�̌�(���_�̌��ł͂���܂���)���w�肵�܂��B
nvertex���}�C�i�X�l���ȗ����ꂽ�ꍇ�́A�z��ɐݒ肳�ꂽ�v�f�����g�p����܂��B
�`��f�[�^���i�[�����z��ϐ��ɂ́A�����^�A�����^�̂ǂ��炩���g�p�ł��܂��B
�K��̒��_���𒴂���f�[�^���������Ƃ͂ł��܂���̂Œ��ӂ��Ă��������B�ڂ����́AOBAQ.DLL�̃}�j���A�����Q�Ƃ��Ă��������B
^p
	;	���R�Ȍ`��̃��f����ǉ�
	;
	model=-1.0,-1.0, -1.0,2.0, 2.0,1.0, 1.0,-1.0
	qaddmodel i,model,-1, 30,64,0
^p
(x,y)�Ŕz�u�̍��W���w�肵�܂��B(OBAQ�̓������W��ݒ肵�܂��B)
r�Ŕz�u�p�x(+���������v����ɂȂ�܂�)���w�肵�܂��B�P�ʂ̓��W�A���ƂȂ�܂��B
(sx,sy)�ŁA�z�u���̑傫�����w�肵�܂��B�f�t�H���g�ł́A(10,10)�̃T�C�Y���g�p����܂��B
mygroup,exgroup,loggroup�̓R���W����(�Փ�)�̌��o�̂��߂ɐݒ肳���O���[�v�l�ɂȂ�܂��B
�O���[�v�l�́A32bit�����ꂩ�̃r�b�g��1�̒l(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768�c)�ɂ���Ď�����܂��B
colsw�Ŕz�u�`�F�b�N�̃��[�h��I�����邱�Ƃ��ł��܂��B
^p
	���[�h        �l	���e
------------------------------------------------------------------------
	colsw_none     0        �o�����R���W�����`�F�b�N����
	colsw_active   1        �o����active��Ԃ̊�Ƃ̐ڐG�������
	colsw_all      2        �o����reserve��ԈȊO�̊�Ƃ̐ڐG�������
^p
�I�u�W�F�N�g������ɒǉ����ꂽ���ɂ́Avar�Ŏw�肳�ꂽ�ϐ��ɃI�u�W�F�N�gID�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
�o�^���̌��E�ŃI�u�W�F�N�g�̒ǉ����s�Ȃ��Ȃ������ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ���-1���������܂��B
�R���W����(�Փ�)���o�̂��߃I�u�W�F�N�g�̒ǉ����s�Ȃ��Ȃ������ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ���-2���������܂��B

%href
qaddpoly


%index
qtype
type�p�����[�^�[��ݒ�
%prm
num,type,option
num(0)    : �I�u�W�F�N�gID
type(0)   : �ݒ�l
option(0) : �ݒ�I�v�V����
%inst
�w�肵���I�u�W�F�N�g��type�p�����[�^�[��ݒ肵�܂��B
type�p�����[�^�[�ɂ́A�ȉ��̓��e���w�肷�邱�Ƃ��ł��܂��B
^p
	�}�N����        �l	���e
-----------------------------------------------------------
	type_normal	0	�ʏ�̃I�u�W�F�N�g
	type_inner	1	�ڐG����𔽓]�����I�u�W�F�N�g
	type_bindX	0x40	X����w�i�ɌŒ�
	type_bindY	0x80	Y����w�i�ɌŒ�
	type_bindR	0x100	��]���Œ�
	type_bind	0x1c0	�w�i�Ɋ��S�Œ�(���������Ȃ�)
	type_autowipe	0x100000  �{�[�_�[�͈͂��z�����玩���I�ɏ���
^p
type_inner�́A�O�ǂ��쐬����ۂɎg�p���܂��B
�f�t�H���g�̕�(qborder���߂ō쐬�����`��)�Ɏg�p����Ă��܂����A
���̗p�r�ȊO�ł͎g�p���Ȃ��悤���ӂ��Ă��������B
type_autowipe�́Aqborder���߂Őݒ肵���{�[�_�[�̈�(�g)�͈̔͂��o���I�u�W�F�N�g�������I�ɏ������邽�߂̃t���O�ł��B
^
option�ŁAtype�l�̐ݒ���@���w�肷�邱�Ƃ��ł��܂��B
^p
	option       	���e
------------------------------------------------------------------------
	0               type�l���Z�b�g(set)
	1               type�l��ǉ�(or)
	2               type�l�����O(not)
^p
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgettype
qborder


%index
qstat
stat�p�����[�^�[��ݒ�
%prm
num,stat,sleepcount
num(0)        : �I�u�W�F�N�gID
stat(0)       : �ݒ�l
sleepcount(0) : �X���[�v�J�E���g�l
%inst
�w�肵���I�u�W�F�N�g��stat�p�����[�^�[�A�y�уX���[�v�J�E���g�l��ݒ肵�܂��B
stat�p�����[�^�[�ɂ́A�ȉ��̓��e���w�肷�邱�Ƃ��ł��܂��B
^p
	�}�N����        �l	���e
-------------------------------------------------------------------
	stat_reserve 	0	���g�p�I�u�W�F�N�g
	stat_sleep 	1	�o���҂��I�u�W�F�N�g
	stat_active 	2	�o�����Ă���I�u�W�F�N�g
^p
option�ŁAtype�l�̐ݒ���@���w�肷�邱�Ƃ��ł��܂��B
�X���[�v�J�E���g�l�́Astat��stat_sleep���w�肵�Ă���ۂɎQ�Ƃ����l�ł��B
stat_sleep�ɂȂ��Ă���I�u�W�F�N�g�́A�X���[�v�J�E���g�l�̉񐔂����_�ł���
�o�����܂��B(�X���[�v�J�E���g�l��0�̏ꍇ�́A�o������������Ԃ��ێ����܂��B)
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetstat


%index
qpos
�ʒu�A�p�x�p�����[�^�[��ݒ�
%prm
num,x,y,angle
num(0)     : �I�u�W�F�N�gID
x(0.0)     : X���W�ݒ�l(����)
y(0.0)     : Y���W�ݒ�l(����)
angle(0.0) : �p�x�ݒ�l(����)(���W�A��)
%inst
�w�肵���I�u�W�F�N�g�̈ʒu�A�p�x�p�����[�^�[��ݒ肵�܂��B
(x,y)�ŃI�u�W�F�N�g�̊�ƂȂ�ʒu(���S���W)���w�肵�܂��B
angle�ŃI�u�W�F�N�g��]�p�x(+���������v����)���w�肵�܂��B�P�ʂ̓��W�A���ƂȂ�܂��B
OBAQ�ł́A��{�I�ɕ��̂𓮂����ꍇ�ł��A���ڕ��̂̍��W��
�ύX����̂ł͂Ȃ����������������ɗ͂���������Aqgetspeed���߂ɂ��
�����x��ݒ肷�邱�ƂŎ������Ă��������B
�����I�ɍ��W��ύX�����ꍇ�ɂ́A���������������ɂȂ�Ȃ��\��������܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetpos


%index
qspeed
���x�p�����[�^�[��ݒ�
%prm
num,px,py,pr,option
num(0)     : �I�u�W�F�N�gID
px(0.0) : X�����ݒ�l(����)
py(0.0) : Y�����ݒ�l(����)
pr(0.0) : ��]���x�p�����[�^�[(����)
option(0) : �ݒ�I�v�V����
%inst
�w�肵���I�u�W�F�N�g�̑��x�p�����[�^�[��ݒ肵�܂��B
(px,py)�ŃI�u�W�F�N�g��X,Y�����ɑ΂���ړ����x���w�肵�܂��B
pr�ŉ�]�ɑ΂��鑬�x���w�肵�܂��B
option�ŁA�ݒ���@���w�肷�邱�Ƃ��ł��܂��B
^p
	option       	���e
------------------------------------------------------------------------
	0               ���x�l�����Z(add)
	1               ���x�l�~�Q���㏑��(set)
	2               ���x�l���㏑��(set)
^p
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B
option(�ݒ�I�v�V����)�l��2�̏ꍇ�́A�w�肳�ꂽ�l���ݒ肳��܂��B
option(�ݒ�I�v�V����)�l��1�̏ꍇ�́A�w�肳�ꂽ�l�̂Q�{���ݒ肳��܂��̂Œ��ӂ��Ă��������B

%href
qgetspeed


%index
qweight
�d���Ȃǂ̃p�����[�^�[��ݒ�
%prm
num,weight,moment
num(0) : �I�u�W�F�N�gID
weight(6.0)    : �d���̒l(����)
moment(1200.0) : ���[�����g�l(����)
%inst
�w�肵���I�u�W�F�N�g�̏d���A���[�����g�A���C�Ȃǂ̃p�����[�^�[��ݒ肵�܂��B
weight(�d��)�́A���ar�̉~�ɕW���I�Ȕ�d�̏ꍇ�A
^p
	(r ^ 2) / 32.0
^p
���炢��ڈ��ɐݒ肵�Ă��������B
moment(���[�����g)�́A��]�̂��₷���Ɋւ��p�����[�^�[���ƍl���ĉ������B
^p
	���ar�̉~�ՁF weight * (r ^ 2) / 2.0
	�ӂ̒�����a, b�̒����` : weight * ((a ^ 2) + (b ^ 2)) / 12.0
^p
�̂悤�Ȓl��ڈ��ɐݒ肵�Ă��������B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetweight


%index
qdamper
�z�U�Ȃǂ̃p�����[�^�[��ݒ�
%prm
num,damper,friction
num(0) : �I�u�W�F�N�gID
damper(0.7)    : �z�U�p�����[�^�[�l(����)
friction(1.0)  : ���C��R�l(����)
%inst
�w�肵���I�u�W�F�N�g�̋z�U�A�Đ��A�d�͌W���Ȃǂ̃p�����[�^�[��ݒ肵�܂��B
damper(�z�U)�́A�ڐG�����ۂ̂���}����͂������Ă��܂��B
0.0����1.0�܂ł̒l��ݒ肷��悤�ɂ��Ă��������B(�͈̓`�F�b�N�͍s�Ȃ��܂���)
friction(���C)�́A���̓��m���ڐG�������Ɍ�������͂̌W���ɂȂ�܂��B
�ڐG���镨�̂�friction�Ə�Z�����l���Q�Ƃ���v�Z����܂��B
0.0����1.0�܂ł̒l��ݒ肷��悤�ɂ��Ă��������B(�͈̓`�F�b�N�͍s�Ȃ��܂���)
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetdamper


%index
qinertia
�Đ��Ȃǂ̃p�����[�^�[��ݒ�
%prm
num,inertia,gravity
num(0) : �I�u�W�F�N�gID
inertia(0.999) : �Đ��p�����[�^�[�l(����)
gravity(1.0)   : �I�u�W�F�N�g�̏d�͒l(����)
%inst
�w�肵���I�u�W�F�N�g�̑Đ��A�d�͌W���Ȃǂ̃p�����[�^�[��ݒ肵�܂��B
inertia(�Đ�)�́A0.0�ɋ߂Â��قǒ�R���������Ă˂��Ƃ肵��������
�Ȃ�܂��B0.0����1.0�܂ł̒l��ݒ肷��悤�ɂ��Ă��������B(�͈̓`�F�b�N�͍s�Ȃ��܂���)
gravity(�I�u�W�F�N�g�̏d��)�́A��Ԃɐݒ肳��Ă���d�͂ɏ�Z�����`��
�I�u�W�F�N�g�݂̂ɔ��f����܂��B
����̃I�u�W�F�N�g�����ɁA�قȂ�d�͂�^����ꍇ�Ɏg�p���܂��B
�����ɂ͂��肦�Ȃ��`�ŁA����̃I�u�W�F�N�g�����ɖ��d�͂┽�d�͂�^���邽�߁A�Q�[���Ȃǂ̃L�����N�^�[����ɗL���ł��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetinertia


%index
qgroup
�O���[�v�p�����[�^�[��ݒ�
%prm
num,mygroup,exgroup,loggroup
num(0)      : �I�u�W�F�N�gID
mygroup(1)  : ������������R���W�����O���[�v�l
exgroup(0)  : �Փ˂����O����O���[�v�l
loggroup(0) : �R���W�������O���쐬����O���[�v�l
%inst
�w�肵���I�u�W�F�N�g�̃O���[�v�p�����[�^�[��ݒ肵�܂��B
�O���[�v�p�����[�^�[�́A�Փ˂��鑊��I�u�W�F�N�g����肷��ꍇ�Ȃǂ̎��ʂɎg�p����܂��B
�O���[�v�l�́A32bit�����ꂩ�̃r�b�g��1�̒l(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768�c)�ɂ���Ď�����܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetgroup
qfind
qcollision


%index
qmat
�}�e���A���p�����[�^�[��ݒ�
%prm
num,type,id,subid
num(0)   : �I�u�W�F�N�gID
type(0)  : �}�e���A���^�C�v�l
id(0)    : �Q��id�l
subid(0) : �Q��subid�l
%inst
�w�肵���I�u�W�F�N�g�̃}�e���A���p�����[�^�[��ݒ肵�܂��B
�}�e���A���p�����[�^�[�́Aqdraw���߂ɂ��`�掞�ɔ��f����܂��B
�}�e���A���^�C�v�l�ɂ��A�\�����@��I�����邱�Ƃ��ł��܂��B
^p
	�^�C�v          �l	���e
-------------------------------------------------------------------
	mat_none	0	�������Ȃ�(��\��)
	mat_spr		1	�X�v���C�g
	mat_spr2	2	�X�v���C�g(�T�C�Y�ݒ�t��)
	mat_wire	3	���C���[�t���[��
	mat_wire2	4	���C���[�t���[��(�֊s�t��)
	mat_delay	0x1000	�ォ��`��
^p
�X�v���C�g�́A�`��S�̂��J�o�[����`�ŋ�`���\��t�����܂��B
���C���[�t���[���̏ꍇ�́A���ꂼ��̒��_����Ōq���܂��B
mat_spr�Amat_spr2��I�������ꍇ�́Aid�ɃX�v���C�g�Ƃ��ĕ\������
�摜�̃E�B���h�EID�Asubid�ɕ����摜No.���w�肵�܂��B
�E�B���h�EID�ƕ����摜No.�́Acelput���߂Ŏg�p�����p�����[�^�[��
���l�ŁA�f�ނƂȂ�摜��celdiv���߂ɂ���ĕ����������̂��Q�Ƃ��邱�Ƃ��ł��܂��B
mat_wire�܂��́Amat_wire2��I�������ꍇ�́Aid�Ń��C���[�̐F�R�[�h
(RGB���p�b�N����24bit�l)�Asubid�ŗ֊s�̐F�R�[�h��ݒ肵�܂��B
�}�e���A���^�C�v�l�ɁAmat_delay(0x1000)�����Z�����I�u�W�F�N�g�́A
�ォ��`�悳���悤�ɂȂ�܂��B
����́A���������g�����\���Ȃǂŗ��p���邱�Ƃ��ł��܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetmat
qmat2
qmat3


%index
qmat2
�}�e���A���ڍ׃p�����[�^�[��ݒ�
%prm
num,offsetx,offsety,zoomx,zoomy
num(0)   : �I�u�W�F�N�gID
offsetx(0) : X�����\���I�t�Z�b�g
offsety(0) : Y�����\���I�t�Z�b�g
zoomx(1.0) : X�����\���{��(����)
zoomy(1.0) : Y�����\���{��(����)
%inst
�w�肵���I�u�W�F�N�g�̃}�e���A���ڍ׃p�����[�^�[��ݒ肵�܂��B
�}�e���A���ڍ׃p�����[�^�[�́Aqdraw���߂ɂ��`�掞�ɔ��f����܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetmat2
qmat
qmat3


%index
qmat3
�}�e���A���\���p�����[�^�[��ݒ�
%prm
num,gmode,rate
num(0)   : �I�u�W�F�N�gID
gmode(0) : �R�s�[���[�h
rate(256): ���������[�g
%inst
�w�肵���I�u�W�F�N�g�̃}�e���A���\���p�����[�^�[��ݒ肵�܂��B
�}�e���A���\���p�����[�^�[�́Aqdraw���߂ɂ��`�掞�ɔ��f����܂��B
gmode�́A�X�v���C�g��`�悷��ۂ̃R�s�[���[�h���w�肵�܂��B
����́AHSP��gmode���߂Ŏw�肳��郂�[�h�l�Ɠ����ł��B
�܂��Arate(���������[�g)�����l��gmode���߂Ŏw�肳�ꂽ�ꍇ�Ɠ������ʂɂȂ�܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
gmode
qgetmat3
qmat
qmat2


%index
quser
���[�U�[��`�f�[�^��ݒ�
%prm
num,user1,user2,user3
num(0)   : �I�u�W�F�N�gID
user1(0) : ���[�U�[��`�f�[�^1
user2(0) : ���[�U�[��`�f�[�^2
user3(0) : ���[�U�[��`�f�[�^3
%inst
�w�肵���I�u�W�F�N�g�̃��[�U�[��`�f�[�^��ݒ肵�܂��B
���[�U�[��`�f�[�^�́A�I�u�W�F�N�g���Ƃɕۑ��\�Ȓl�ŁA���Ɏg�p���邩�̓��[�U�[�����R�Ɍ��߂邱�Ƃ��ł��܂��B
���[�U�[��`�f�[�^1�`3�́A�����^�̒l���i�[���邱�Ƃ��ł��܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetuser
quser2


%index
quser2
���[�U�[��`�f�[�^��ݒ�2
%prm
num,user4,user5,user6
num(0)     : �I�u�W�F�N�gID
user4(0.0) : ���[�U�[��`�f�[�^4(����)
user5(0.0) : ���[�U�[��`�f�[�^5(����)
user6(0.0) : ���[�U�[��`�f�[�^6(����)
%inst
�w�肵���I�u�W�F�N�g�̃��[�U�[��`�f�[�^��ݒ肵�܂��B
���[�U�[��`�f�[�^�́A�I�u�W�F�N�g���Ƃɕۑ��\�Ȓl�ŁA���Ɏg�p���邩�̓��[�U�[�����R�Ɍ��߂邱�Ƃ��ł��܂��B
���[�U�[��`�f�[�^4�`6�́A�����^�̒l���i�[���邱�Ƃ��ł��܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgetuser2
quser


%index
qfind
�I�u�W�F�N�g����
%prm
group,stat
group(-1) : ��������O���[�v�l
stat(0)   : stat�l�w��
%inst
�o�^����Ă���I�u�W�F�N�g��C�ӂ̏����Ō������܂��B
�ŏ��ɁAqfind���߂ŏ������w�肵����Aqnext���߂Ō��ʂ��󂯎��K�v������܂��B
group�Ō�������R���W�����O���[�v�l���w�肵�܂��B
group�̎w����ȗ����邩-1�̏ꍇ�́A���ׂẴO���[�v���ΏۂƂȂ�܂��B
(�������O���[�v�l��0�̃I�u�W�F�N�g�͏��O����܂�)
�����̃O���[�v���w�肷��ꍇ�́A���ꂼ��̃O���[�v�l�𑫂����l���w�肵�Ă��������B
stat���w�肷�邱�ƂŁA����̏�Ԃ������������邱�Ƃ��\�ł��B
stat��0�̏ꍇ�́A���ׂĂ̏�Ԃ��ΏۂƂȂ�܂��B
stat��stat_sleep(1)�܂���stat_active(2)���w�肵���ꍇ�́A�����l�����I�u�W�F�N�g�݂̂��ΏۂƂȂ�܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qnext


%index
qnext
�I�u�W�F�N�g�������ʎ擾
%prm
var
var : �������ʂ��擾����ϐ�
%inst
qfind���߂ɂ�錟���̌��ʂ��擾���܂��B
�ŏ��ɁAqfind���߂ŏ������w�肵����Aqnext���߂Ō��ʂ��󂯎��K�v������܂��B
var�Ŏw�肳�ꂽ�ϐ��ɃI�u�W�F�N�gID�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
qnext���߂����s���邲�ƂɁA�������ʂ����o�����Ƃ��ł��܂��B
�������ʂ��Ȃ��Ȃ����ꍇ�́A-1���������܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qfind


%index
qcollision
�R���W�����擾�J�n
%prm
num, target
num(0)     : �I�u�W�F�N�gID
target(-1) : �R���W�������擾����Ώۂ̃I�u�W�F�N�gID
%inst
�I�u�W�F�N�g���m�̃R���W����(�Փ�)�Ɋւ�����̎擾���J�n���܂��B
�ŏ��ɁAqcollision���߂ŃI�u�W�F�N�g���w�肵����Aqgetcol���߂Ō��ʂ��󂯎��K�v������܂��B
target�ŁA�R���W�������擾����Ώۂ̃I�u�W�F�N�gID���܂��B
target��-1���A�ȗ����ꂽ�ꍇ�́Anum�Ŏw�肳�ꂽ�I�u�W�F�N�g�Ɋւ�邷�ׂĂ̏�񂪎擾����܂��B
�R���W�����̎擾���s�Ȃ��ۂɂ́A�K���R���W�����O���[�v�̐ݒ���s�Ȃ��Ă����K�v������܂��B
num�Ŏw�肳�ꂽ�I�u�W�F�N�g�̃p�����[�^�[�ŁA�R���W�������O�쐬�O���[�v�ƂȂ��Ă�����̂������擾�����̂Œ��ӂ��Ă��������B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgroup
qgetcol
qgetcol2
qgetcol3


%index
qgetcol
�R���W�����擾
%prm
var_id,var_x,var_y
var_id : �I�u�W�F�N�gID���擾����ϐ�
var_x  : X���W���擾����ϐ�
var_y  : Y���W���擾����ϐ�
%inst
qcollision���߂ɂ�錟���̌��ʂ��擾���܂��B
�ŏ��ɁAqcollision���߂ŏ������w�肵����Aqgetcol���߂Ō��ʂ��󂯎��K�v������܂��B
����ɕK�v�ɉ����āAqgetcol2���߁Aqgetcol3���߂Œǉ��̏����擾���邱�Ƃ��\�ł��B
var_id�Ŏw�肳�ꂽ�ϐ��ɁA�R���W���������o���ꂽ�I�u�W�F�N�g��ID�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_x�Ŏw�肳�ꂽ�ϐ��ɁA�R���W���������o���ꂽX���W���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_y�Ŏw�肳�ꂽ�ϐ��ɁA�R���W���������o���ꂽY���W���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
qgetcol���߂����s���邲�ƂɁA�������ʂ����o�����Ƃ��ł��܂��B
�������ʂ��Ȃ��Ȃ����ꍇ�́A�I�u�W�F�N�gID�Ƃ���-1���������܂��B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qfind
qgetcol2
qgetcol3


%index
qgetcol2
�R���W�����ڍ׏��擾
%prm
var_depth,var_nx,var_ny
var_depth : �Փ˂̐[�����擾����ϐ�
var_nx    : �Փ˂�X�@�����擾����ϐ�
var_ny    : �Փ˂�Y�@�����擾����ϐ�
%inst
qcollision���߂ɂ�錟���̌��ʂ��擾���܂��B
�K���Aqgetcol���߂Ō��ʂ��󂯎������ŁA�����擾����悤�ɂ��Ă��������B
var_depth�Ŏw�肳�ꂽ�ϐ��ɁA�Փ˂̐[��(�ڐG�ʂɂ߂肱�񂾋���)���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_nx,var_ny�Ŏw�肳�ꂽ�ϐ��ɁA�Փˎ��̖@��(x,y)���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qfind
qgetcol
qgetcol3


%index
qgetcol3
�R���W�����ڍ׏��擾2
%prm
var_bound,var_slide
var_bound : �������x���擾����ϐ�
var_slide : �������x���擾����ϐ�
%inst
qcollision���߂ɂ�錟���̌��ʂ��擾���܂��B
�K���Aqgetcol���߂Ō��ʂ��󂯎������ŁA�����擾����悤�ɂ��Ă��������B
var_bound�Ŏw�肳�ꂽ�ϐ��ɁA�ڐG�ʂƐ����i�͂˂�j�����̑��x(�v���X�����߂肱�ݕ���)���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_slide�Ŏw�肳�ꂽ�ϐ��ɁA�ڐG�ʂƐ����i�Ђ�����j�����̑��x���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qfind
qgetcol
qgetcol2


%index
qgettype
type�p�����[�^�[���擾
%prm
num,var_type
num(0)    : �I�u�W�F�N�gID
var_type  : type�p�����[�^�[���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_type�Ŏw�肳�ꂽ�ϐ��ɁAtype�p�����[�^�[�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qtype


%index
qgetstat
stat�p�����[�^�[���擾
%prm
num,var_stat,var_sleepcount
num(0)        : �I�u�W�F�N�gID
var_stat      : stat�ݒ�l���擾����ϐ�
var_sleepcount: �X���[�v�J�E���g�l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_stat�Ŏw�肳�ꂽ�ϐ��ɁAstat�p�����[�^�[�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_sleepcount�Ŏw�肳�ꂽ�ϐ��ɁA�X���[�v�J�E���g�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
�X���[�v�J�E���g�l�́Aqstat�Őݒ肵���l�ł͂Ȃ��A�����̕����v�Z���s�񐔂ɉ������l�ɂȂ��Ă���̂Œ��ӂ��Ă��������B
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qstat


%index
qgetpos
�ʒu�A�p�x�p�����[�^�[���擾
%prm
num,var_x,var_y,var_angle
num(0)     : �I�u�W�F�N�gID
var_x      : X���W�ݒ�l���擾����ϐ�
var_y      : Y���W�ݒ�l���擾����ϐ�
var_angle  : �p�x�ݒ�l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_x�Ŏw�肳�ꂽ�ϐ��ɁAX���W�ݒ�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_y�Ŏw�肳�ꂽ�ϐ��ɁAY���W�ݒ�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_angle�Ŏw�肳�ꂽ�ϐ��ɁA�p�x�ݒ�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
�擾�����X,Y���W�́A��ʏ�̍��W�ł͂Ȃ�OBAQ���g�p����������W�l�Ȃ̂Œ��ӂ��Ă��������B
�������W�l����ʏ�̍��W�ɕϊ�����ꍇ�́Aqcnvaxis���߂��g�p���Ă��������B
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qpos
qcnvaxis


%index
qgetspeed
���x�p�����[�^�[���擾
%prm
num,var_px,var_py,var_pr
num(0) : �I�u�W�F�N�gID
var_px : X�������x�l���擾����ϐ�
var_py : Y�������x�l���擾����ϐ�
var_pr : ��]���x�l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_px�Ŏw�肳�ꂽ�ϐ��ɁAX�������x�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_py�Ŏw�肳�ꂽ�ϐ��ɁAY�������x�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_pr�Ŏw�肳�ꂽ�ϐ��ɁA��]���x�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qspeed


%index
qgetweight
�d���Ȃǂ̃p�����[�^�[���擾
%prm
num,var_weight,var_moment
num(0)     : �I�u�W�F�N�gID
var_weight : �d���̒l���擾����ϐ�
var_moment : ���[�����g�l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_weight�Ŏw�肳�ꂽ�ϐ��ɁA�d���̒l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_moment�Ŏw�肳�ꂽ�ϐ��ɁA���[�����g�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qweight


%index
qgetdamper
�z�U�Ȃǂ̃p�����[�^�[���擾
%prm
num,var_damper,var_friction
num(0) : �I�u�W�F�N�gID
var_damper   : �z�U�p�����[�^�[�l���擾����ϐ�
var_friction : ���C��R�l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_damper�Ŏw�肳�ꂽ�ϐ��ɁA�z�U�p�����[�^�[�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_friction�Ŏw�肳�ꂽ�ϐ��ɁA���C��R�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qdamper


%index
qgetinertia
�Đ��Ȃǂ̃p�����[�^�[���擾
%prm
num,var_inertia,var_gravity
num(0) : �I�u�W�F�N�gID
var_inertia : �Đ��p�����[�^�[�l���擾����ϐ�
var_gravity : �I�u�W�F�N�g�̏d�͒l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_inertia�Ŏw�肳�ꂽ�ϐ��ɁA�Đ��p�����[�^�[�l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_gravity�Ŏw�肳�ꂽ�ϐ��ɁA�I�u�W�F�N�g�̏d�͒l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qinertia


%index
qgetgroup
�O���[�v�p�����[�^�[���擾
%prm
num,var_mygroup,var_exgroup,var_loggroup
num(0)      : �I�u�W�F�N�gID
var_mygroup : ������������R���W�����O���[�v�l���擾����ϐ�
var_exgroup : �Փ˂����O����O���[�v�l���擾����ϐ�
var_loggroup: �R���W�������O���쐬����O���[�v�l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_mygroup�Ŏw�肳�ꂽ�ϐ��ɁA������������R���W�����O���[�v�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_exgroup�Ŏw�肳�ꂽ�ϐ��ɁA�Փ˂����O����O���[�v�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_loggroup�Ŏw�肳�ꂽ�ϐ��ɁA�R���W�������O���쐬����O���[�v�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qgroup
qfind
qcollision


%index
qgetmat
�}�e���A���p�����[�^�[���擾
%prm
num,var_type,var_id,var_subid
num(0)    : �I�u�W�F�N�gID
var_type  : �}�e���A���^�C�v�l���擾����ϐ�
var_id    : �Q��id�l���擾����ϐ�
var_subid : �Q��subid�l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_type�Ŏw�肳�ꂽ�ϐ��ɁA�}�e���A���^�C�v�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_id�Ŏw�肳�ꂽ�ϐ��ɁA�Q��id�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_subid�Ŏw�肳�ꂽ�ϐ��ɁA�Q��subid�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qmat
qgetmat2
qgetmat3


%index
qgetmat2
�}�e���A���ڍ׃p�����[�^�[���擾
%prm
num,var_offsetx,var_offsety,var_zoomx,var_zoomy
num(0)   : �I�u�W�F�N�gID
var_offsetx : X�����\���I�t�Z�b�g�l���擾����ϐ�
var_offsety : Y�����\���I�t�Z�b�g�l���擾����ϐ�
var_zoomx   : X�����\���{���l���擾����ϐ�
var_zoomy   : Y�����\���{���l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_offsetx�Ŏw�肳�ꂽ�ϐ��ɁAX�����\���I�t�Z�b�g�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_offsety�Ŏw�肳�ꂽ�ϐ��ɁAY�����\���I�t�Z�b�g�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_zoomx�Ŏw�肳�ꂽ�ϐ��ɁAX�����\���{���l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_zoomy�Ŏw�肳�ꂽ�ϐ��ɁAY�����\���{���l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qmat2
qgetmat
qgetmat3


%index
qgetmat3
�}�e���A���\���p�����[�^�[���擾
%prm
num,var_gmode,var_rate
num(0)   : �I�u�W�F�N�gID
var_gmode : �R�s�[���[�h�l���擾����ϐ�
var_rate  : ���������[�g�l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_gmode�Ŏw�肳�ꂽ�ϐ��ɁA�R�s�[���[�h�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_rate�Ŏw�肳�ꂽ�ϐ��ɁA���������[�g�l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qmat3
qgetmat
qgetmat2


%index
qgetuser
���[�U�[��`�f�[�^���擾
%prm
num,var_user1,var_user2,var_user3
num(0)   : �I�u�W�F�N�gID
var_user1 : ���[�U�[��`�f�[�^1�̒l���擾����ϐ�
var_user2 : ���[�U�[��`�f�[�^2�̒l���擾����ϐ�
var_user3 : ���[�U�[��`�f�[�^3�̒l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_user1�Ŏw�肳�ꂽ�ϐ��ɁA���[�U�[��`�f�[�^1�̒l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_user2�Ŏw�肳�ꂽ�ϐ��ɁA���[�U�[��`�f�[�^2�̒l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
var_user3�Ŏw�肳�ꂽ�ϐ��ɁA���[�U�[��`�f�[�^3�̒l���������܂��B(�ϐ��͎����I�ɐ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
quser
qgetuser2


%index
qgetuser2
���[�U�[��`�f�[�^���擾2
%prm
num,var_user4,var_user5,var_user6
num(0)     : �I�u�W�F�N�gID
var_user4 : ���[�U�[��`�f�[�^4�̒l���擾����ϐ�
var_user5 : ���[�U�[��`�f�[�^5�̒l���擾����ϐ�
var_user6 : ���[�U�[��`�f�[�^6�̒l���擾����ϐ�
%inst
�w�肵���I�u�W�F�N�g�̃p�����[�^�[��ϐ��Ɏ擾���܂��B
var_user4�Ŏw�肳�ꂽ�ϐ��ɁA���[�U�[��`�f�[�^4�̒l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_user5�Ŏw�肳�ꂽ�ϐ��ɁA���[�U�[��`�f�[�^5�̒l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
var_user6�Ŏw�肳�ꂽ�ϐ��ɁA���[�U�[��`�f�[�^6�̒l���������܂��B(�ϐ��͎����I�Ɏ����^�ƂȂ�܂��B)
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
quser2
qgetuser


%index
qpush
�C�ӂ̏ꏊ�ɗ͂�^����
%prm
num,xw,yw,ax,ay,sw
num(0)     : �I�u�W�F�N�gID
xw(0.0) : X���W(����)
yw(0.0) : Y���W(����)
ax(0.0) : X�����̗�(����)
ay(0.0) : Y�����̗�(����)
sw(1)   : �ݒ�I�v�V����
%inst
�w�肵���I�u�W�F�N�g�ɑ΂��āA(xw,yw)�̈ʒu����A(ax,ay)�̋����ŗ͂�^���܂��B
�^����ꂽ�͂ɉ����āA�I�u�W�F�N�g�̎p���⑬�x���ω����܂��B
sw�ŁA�ݒ���@���w�肷�邱�Ƃ��ł��܂��B
^p
	sw     	���e
--------------------------------------------------
	0       �I�u�W�F�N�g�̑��x�ɔ��f�����Ȃ�
	1       �I�u�W�F�N�g�̑��x�ɔ��f������
^p
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qblast


%index
qblast
�C�ӂ̏ꏊ������ˏ�ɗ͂�^����
%prm
xw,yw,power,near,far
xw(0.0)    : X���W(����)
yw(0.0)    : Y���W(����)
power(1.0) : �͂̑傫��(����)
near(1.0)  : ��ԋ߂�����(����)
far(9999.0): ��ԉ�������(����)
%inst
���ׂẴI�u�W�F�N�g�ɑ΂��ĔC�ӂ̏ꏊ������ˏ�ɗ͂�^���܂��B
(xw, yw)�𒆐S�Ƃ��āA�����ɔ���Ⴗ��͂��������܂��B
power�͋���1.0�̍ۂɉ����͂̑傫���ɂȂ�܂��B
near���߂��ʒu�́A����Ⴙ��near�Ɠ����͂̑傫���ƂȂ�܂��B
far��艓���ɂ���ꍇ�͉͗͂����܂���B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
qpush


%index
qgetversion
�o�[�W���������擾
%prm
var
var : �o�[�W���������擾����ϐ�
%inst
OBAQ�̃o�[�W���������擾���܂��B
var�Ŏw�肳�ꂽ�ϐ��ɕ�����Ƃ��ăo�[�W������񂪑������܂��B

%href


%index
qinner
���W���I�u�W�F�N�g���ɂ��邩���擾
%prm
var,x,y,num
var     : ���ʂ��擾����ϐ�
x(0.0)  : X���W(����)
y(0.0)  : Y���W(����)
num(-1) : �I�u�W�F�N�gID
%inst
(x,y)�Ŏw�肳�ꂽ���W���I�u�W�F�N�g�`��̓����ɂ��邩�𒲂ׂ܂��B
num�Œ��ׂ����I�u�W�F�N�g��ID���w�肵�܂��B
num���}�C�i�X�l���A�܂��͏ȗ����ꂽ�ꍇ�́A���ׂĂ̗L���ȃI�u�W�F�N�g�ɓn����
���W�������ɂ��邩�ǂ������`�F�b�N���܂��B
�����ɂ���ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ��ɃI�u�W�F�N�gID�l���������܂��B
�����ɂȂ��ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ���-1���������܂��B
var�Ŏw�肳�ꂽ�ϐ��́A�����I�ɐ����^�ƂȂ�܂��B
(x,y)�Ŏw�肷����W�́A��ʏ�̍��W�ł͂Ȃ�OBAQ���g�p����������W�l�ɂȂ�܂��B
��ʏ�̍��W���猋�ʂ��擾����ꍇ�́Acnvaxis���߂Ȃǂœ������W�l�ɕϊ���
�s�Ȃ��K�v������̂Œ��ӂ��Ă��������B
^
���s�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO�̒l���������܂��B

%href
cnvaxis


%index
qgetptr
�V�X�e���|�C���^�l�擾
%prm
var,option
var       : ���e���擾����ϐ�
option(0) : �I�v�V�����l
%inst
OBAQ�̃V�X�e���|�C���^�l���擾���܂��B
���̃V�X�e���|�C���^�l�́A�O���̃A�v���P�[�V������v���O�C��������OBAQ�̓����f�[�^�ɃA�N�Z�X���邽�߂Ɏg�p����܂��B
�ʏ�̎g�p�ł́A�V�X�e���|�C���^�l�͕K�v����܂���B
option�p�����[�^�[�ŃI�v�V�����l��ݒ肷�邱�Ƃ��ł��܂��B
���݁Aoption�p�����[�^�[��0�ȊO�̒l�͖����ɂȂ�܂��B

%href
hgobaq


