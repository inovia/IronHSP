;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;
%type
�g������
%ver
3.6
%note
hgimg4.as�܂���hgimg4dx.as���C���N���[�h���邱�ƁB
%date
2021/01/06
%author
onitama
%dll
hgimg4
%url
http://www.onionsoft.net/
%port
Win
%portinfo
Windows+OpenGL3.1�ȍ~/DirectX9�V�X�e����œ��삵�܂��B



%index
gpreset
HGIMG4�̏�����
%group
�g����ʐ��䖽��
%prm
option
option(0) : �������I�v�V����
%inst
HGIMG4�̏��������s�Ȃ��܂��B
�V�[�����č\�z����ꍇ�Ɏg�p���Ă��������B
option�Őݒ肵�����e�ɂ���ď������̓��e���ς��܂��B
^p
	�I�v�V�����l  ���e
	---------------------------------------------------------------
	    0         ���ׂẴI�u�W�F�N�g��j�����ď�����Ԃɖ߂�
	    1         �V�[���ɑ��݂���I�u�W�F�N�g�̂ݔj������
^p
%href


%index
gpdraw
�V�[�����̑S�I�u�W�F�N�g��`�悷��
%group
�g����ʐ��䖽��
%prm
option
option(0) : �`��I�v�V����
%inst
�V�[�����̃I�u�W�F�N�g�����ׂĕ`�悵�܂��B
option�p�����[�^�[���w�肷�邱�ƂŁA����ꂽ���ڂ̕`�悾�����s�Ȃ����Ƃ��ł��܂��B
^p
        �}�N����                      ���e
    --------------------------------------------------------------------
	GPDRAW_OPT_OBJUPDATE          �I�u�W�F�N�g�̎����ړ�����
	GPDRAW_OPT_DRAWSCENE          3D�V�[���`�揈��
	GPDRAW_OPT_DRAWSCENE_LATE     3D�V�[���`�揈��(OBJ_LATE)
	GPDRAW_OPT_DRAW2D             2D�X�v���C�g�`�揈��
	GPDRAW_OPT_DRAW2D_LATE        2D�X�v���C�g�`�揈��(OBJ_LATE)
^p
option�p�����[�^�[���ȗ������ꍇ�́A���ׂĂ̍��ڂ��I������Ă����ԂɂȂ�܂��B
�ʏ�́Aoption�p�����[�^�[���w�肵�Ȃ��Ă���肠��܂���B
�܂��A2D�̒��ڕ`�施�߂������g�p���āA�I�u�W�F�N�g�ɂ��`�悪�s�v�ȏꍇ�́Agpdraw���߂��L�q����K�v������܂���B
OBJ_LATE�̃��[�h�t���O�l���t�����ꂽ����(���������l���ݒ肳��Ă�����̂��܂�)�́A�s�����̃I�u�W�F�N�g������ɕ`�悷�邽�߁A���ڂ��������Ă��܂��B
�����̍��ڂ��u|�v�ŋ�؂��Ďw�肷�邱�Ƃ��ł��܂��B
^p
	��:
	gpdraw GPDRAW_OPT_DRAW2D|GPDRAW_OPT_DRAW2D_LATE
^p
��̗�ł́A2D�X�v���C�g�`�揈���A2D�X�v���C�g�`�揈��(OBJ_LATE)���������s���܂��B
����𗘗p����ƁA3D�V�[���`���2D�X�v���C�g�`��̊Ԃ�gcopy���߂ȂǕʂȕ`�施�߂ɂ��
�\�����s�Ȃ����Ƃ��\�ɂȂ�܂��B

%href


%index
gpusescene
�V�[���̐؂�ւ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I������V�[��ID
%inst
(����̃o�[�W�����ŃT�|�[�g���邽�߂̗\��L�[���[�h�ł��B�@�\�͌��݂܂���������Ă��܂���B)
%href


%index
gpsetprm
�I�u�W�F�N�g�̃R�A�p�����[�^�[�ݒ�
%group
�g����ʐ��䖽��
%prm
objid,prmid,value
objid(0) : �I�u�W�F�N�gID
prmid(0) : �R�A�p�����[�^�[ID
value(0) : �ݒ肷��l(�����l)
%inst
�I�u�W�F�N�g���Ƃɕێ�����Ă���R�A�p�����[�^�[��value�Ŏw�肳�ꂽ�l���㏑���ݒ肵�܂��B
�l���㏑���ł͂Ȃ��A�r�b�g�P�ʂ�ON,OFF���s�Ȃ������ꍇ�́Agpsetprmon/gpsetprmoff���߂��g�p���Ă��������B

�R�A�p�����[�^�[�́A32bit�����l�ŁA�l�X�ȏ����Ǘ����Ă��܂��B
�R�A�p�����[�^�[ID�Ƃ��Ďw��\�ȍ��ڂ͈ȉ��̒ʂ�ł��B
^p
	�}�N����             | ���e
	--------------------------------------------------------------
	PRMSET_FLAG            �I�u�W�F�N�g�o�^�t���O(*)
	PRMSET_MODE            ���[�h�t���O�l
	PRMSET_ID              �I�u�W�F�N�gID(*)
	PRMSET_ALPHA           �����x(���l)
	PRMSET_TIMER           �^�C�}�[�l
	PRMSET_MYGROUP         ���g�̃R���W�����O���[�v
	PRMSET_COLGROUP        �Փˌ��o����R���W�����O���[�v
	PRMSET_SHAPE           �`��ID(*)
	PRMSET_USEGPMAT        �}�e���A��ID
	PRMSET_COLILOG         �R���W�������OID(*)
	PRMSET_FADE            �t�F�[�h�p�����[�^�[
	PRMSET_SPRID           �\�[�X�o�b�t�@ID(�X�v���C�g�̂�)
	PRMSET_SPRCELID        �\�[�X�̃Z��ID(�X�v���C�g�̂�)
	PRMSET_SPRGMODE        �R�s�[���[�h(�X�v���C�g�̂�)

	(*)�̍��ڂ͓ǂݏo���̂�
^p
%href
gpgetprm
gpsetprmon
gpsetprmoff


%index
gpgetprm
�I�u�W�F�N�g�̃R�A�p�����[�^�[�擾
%group
�g����ʐ��䖽��
%prm
var,objid,prmid
var      : �l����������ϐ���
objid(0) : �I�u�W�F�N�gID
prmid(0) : �R�A�p�����[�^�[ID
%inst
�I�u�W�F�N�g���Ƃɕێ�����Ă���R�A�p�����[�^�[�ɒl���擾���܂��B
�R�A�p�����[�^�[�́A32bit�����l�ŁA�l�X�ȏ����Ǘ����Ă��܂��B
�R�A�p�����[�^�[ID�Ƃ��Ďw��\�ȍ��ڂ͈ȉ��̒ʂ�ł��B
^p
	�}�N����             | ���e
	--------------------------------------------------------------
	PRMSET_FLAG            �I�u�W�F�N�g�o�^�t���O(*)
	PRMSET_MODE            ���[�h�t���O�l
	PRMSET_ID              �I�u�W�F�N�gID(*)
	PRMSET_ALPHA           �����x(���l)
	PRMSET_TIMER           �^�C�}�[�l
	PRMSET_MYGROUP         ���g�̃R���W�����O���[�v
	PRMSET_COLGROUP        �Փˌ��o����R���W�����O���[�v
	PRMSET_SHAPE           �`��ID(*)
	PRMSET_USEGPMAT        �}�e���A��ID
	PRMSET_COLILOG         �R���W�������OID(*)
	PRMSET_FADE            �t�F�[�h�p�����[�^�[
	PRMSET_SPRID           �\�[�X�o�b�t�@ID(�X�v���C�g�̂�)
	PRMSET_SPRCELID        �\�[�X�̃Z��ID(�X�v���C�g�̂�)
	PRMSET_SPRGMODE        �R�s�[���[�h(�X�v���C�g�̂�)

	(*)�̍��ڂ͓ǂݏo���̂�
^p
%href
gpsetprm



%index
gppostefx
�|�X�g�G�t�F�N�g����
%group
�g����ʐ��䖽��
%prm
var
var     : �G�t�F�N�gID����������ϐ���
%inst
(����̃o�[�W�����ŃT�|�[�g���邽�߂̗\��L�[���[�h�ł��B�@�\�͌��݂܂���������Ă��܂���B)
%href


%index
gpuselight
���C�g�I�u�W�F�N�g�̓o�^
%group
�g����ʐ��䖽��
%prm
id,index
id(0) : �o�^���郉�C�g�I�u�W�F�N�g��ID
index=0�`9(0) : �o�^���郉�C�g�I�u�W�F�N�g�̃C���f�b�N�X
%inst
�w�肵�����C�g�I�u�W�F�N�g���J�����g���C�g�ɓo�^���܂��B
�K���A���C�g�Ƃ��ď���������Ă��郉�C�g�I�u�W�F�N�g���w�肷��K�v������܂��B
���C�g�I�u�W�F�N�g�́Agplight���߂ɂ���ď��������邱�Ƃ��ł��܂��B
�J�����g���C�g�ɂ́A�f�B���N�V���i�����C�g�E�|�C���g���C�g�E�X�|�b�g���C�g��3��ނ����ꂼ��ő�10�܂œo�^���邱�Ƃ��ł��܂��B
������Ԃł́A�J�����g���C�g�ɐݒ肪�ł��郉�C�g�́A�f�B���N�V���i�����C�g1�݂̂ƂȂ��Ă��܂��B�|�C���g���C�g�A�X�|�b�g���C�g�ȂǕ����̃��C�g���g�p����ꍇ�́Agpresetlight���߂ɂ���ăJ�����g���C�g�̌������炩���ߌ��߂Ă����K�v������܂��B
index�̒l�́A�����̃��C�g���J�����g���C�g�ɓo�^����ꍇ�Ɏg�p���܂��B1�ڂ̃��C�g��0�A2�ڂ̃��C�g��1�c�Ƃ����`��1�̎�ނɂ��ő�10�̃��C�g��ݒ肷�邱�Ƃ��\�ł��B
�J�����g���C�g�ɓo�^���邱�ƂŁA�ȍ~�ɐ�������郂�f���E�}�e���A���̓J�����g���C�g�̉e�����󂯂邱�ƂɂȂ�܂��B
���ɃI�u�W�F�N�g�ɐݒ肳��Ă��郉�C�g�̐ݒ��ύX����ꍇ�́Asetobjlight���߂��g�p���Ă��������B

%href
gpresetlight
gplight
gpusecamera
setobjlight


%index
gpusecamera
�J�����I�u�W�F�N�g�̐؂�ւ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I������J�����I�u�W�F�N�g��ID
%inst
�w�肵���m�[�h�I�u�W�F�N�g��L���ȃJ�����I�u�W�F�N�g�Ƃ��đI�����܂��B
�K���A�J�����Ƃ��ď���������Ă���m�[�h�I�u�W�F�N�g���w�肷��K�v������܂��B
�ȍ~�́A�؂�ւ���ꂽ�J���������_�Ƃ��ăV�[���̕`�悪�s�Ȃ��܂��B
%href
gpuselight


%index
gpmatprm
�}�e���A���̃p�����[�^�[�ݒ�
%group
�g����ʐ��䖽��
%prm
id,"name",x,y,z
id(0)  : �}�e���A��ID/�I�u�W�F�N�gID
"name" : �p�����[�^�[��
x(0.0) : X�̐ݒ�l(�����l)
y(0.0) : Y�̐ݒ�l(�����l)
z(0.0) : Z�̐ݒ�l(�����l)
%inst
�������ꂽ�}�e���A���̃V�F�[�_�[�p�����[�^�[��ݒ肵�܂��B
^p
	��:
	gpmatprm objid,"u_diffuseColor",1,0,0.5 ; �}�e���A���̃p�����[�^�[�ݒ�
^p
��̗�ł́Au_diffuseColor�Ƃ������̂̃p�����[�^�[��( 1.0, 0.0, 0.5 )�̃x�N�g���l��ݒ肵�܂��B
�V�F�[�_�[�p�����[�^�[�ɐݒ肷�鍀�ڂ̐��ɉ����āAgpmatprm1�Agpmatprm4���߂��p�ӂ���Ă��܂��B
(x,y,z)��3���ڂ�ݒ肷��ꍇ�́Agpmatprm���g�p���Ă��������B
%href
gpmat
gpmatprm1
gpmatprm4


%index
gpmatstate
�}�e���A���̃X�e�[�g�ݒ�
%group
�g����ʐ��䖽��
%prm
objid,"name","value"
id(0)   : �}�e���A��ID/�I�u�W�F�N�gID
"name"  : �ݒ荀�ږ�(������)
"value" : �ݒ�l(������)
%inst
�������ꂽ�}�e���A���̕\���X�e�[�g�ݒ��ύX���܂��B
������Ƃ���name�Ŏw�肳�ꂽ���ڂɑ΂��āAvalue�Ŏw�肳�ꂽ���e��ݒ肵�܂��B
���ږ��Ɛݒ���e�͂��ׂĕ�����ōs�Ȃ��̂Œ��ӂ��Ă��������B
���ږ��Ɛݒ���e�͂��ׂĕ�����ōs�Ȃ��̂Œ��ӂ��Ă��������B(���ږ��y�ѐݒ�l�͑啶������������ʂ��܂���B)
^p
	name             value
    --------------------------------------------------------------------
	"blend"          �v�����h�̗L��/�����؂�ւ�
	                         (true �܂��� false ���w��)
	"blendSrc"       �u�����h����I��(���L�Q��)
	"blendDst"       �u�����h���I��(���L�Q��)
	"cullFace"       �B�ʏ���(�J�����O)�̗L��/�����؂�ւ�
	                         (true �܂��� false ���w��)
	"cullFaceSide"   �B�ʏ���(�J�����O)�̖ʎw��
	"depthTest"      true �܂��� false
	                         (true �܂��� false ���w��)
	"depthWrite"     Z�o�b�t�@�������݂̗L��/�����؂�ւ�
	                         (true �܂��� false ���w��)
	"depthFunc"      Z�l��r���@��I��(���L�Q��)

	(*)blendSrc,blendDst�Őݒ�ł��镶����

	"ZERO"                     ���l(0)
	"ONE"                      ���l(1)
	"SRC_COLOR"                �������݌��J���[
	"ONE_MINUS_SRC_COLOR"      �������݌��J���[(���]�l)
	"DST_COLOR"                �������ݐ�J���[
	"ONE_MINUS_DST_COLOR"      �������ݐ�J���[(���]�l)
	"SRC_ALPHA"                �������݌���
	"ONE_MINUS_SRC_ALPHA"      �������݌���(���]�l)
	"DST_ALPHA"                �������ݐ惿
	"ONE_MINUS_DST_ALPHA"      �������ݐ惿(���]�l)
	"CONSTANT_ALPHA"           ���Œ�l
	"ONE_MINUS_CONSTANT_ALPHA" ���Œ�l(���]�l)
	"SRC_ALPHA_SATURATE"       �������݌������]�l

	(*)cullFaceSide�Őݒ�ł��镶����

	BACK             ���ʂ��J�����O
	FRONT            �\�ʂ��J�����O
	FRONT_AND_BACK   ���ʂ��J�����O

	(*)depthFunc�Őݒ�ł��镶����

	NEVER            ��ɋ���
	LESS             �������l�̎��̂݋���
	EQUAL            ����l�̂݋���
	LEQUAL           ���ꂩ�������l�̎��̂݋���
	GREATER          �傫���l�̎��̂݋���
	NOTEQUAL         ����łȂ��l�̂݋���
	GEQUAL           ���ꂩ�傫���l�̎��̂݋���
	ALWAYS           ��ɋ���
^p
%href


%index
gpviewport
�r���[�|�[�g�ݒ�
%group
�g����ʐ��䖽��
%prm
x,y,sx,sy
x(0)  : �r���[�|�[�g����X���W
y(0)  : �r���[�|�[�g����Y���W
sx    : �r���[�|�[�g��X�T�C�Y
sy    : �r���[�|�[�g��Y�T�C�Y
%inst
HGIMG4���`����s�Ȃ��̈�(�r���[�|�[�g)��ݒ肵�܂��B
�X�N���[�����W��(x,y)����(sx,sy)�Ŏw�肵���T�C�Y�̗̈�ɑ΂��ĕ`�悪�s�Ȃ��܂��B
sx,sy���ȗ�����ƁA���݂̕\��X,Y�T�C�Y���f�t�H���g�Ƃ��Ďw�肳��܂��B
%href


%index
setobjname
�I�u�W�F�N�g�̃m�[�h����ݒ肷��
%group
�g����ʐ��䖽��
%prm
objid,"name"
objid(0) : �I�u�W�F�N�g��ID
"name"   : �ݒ肳��閼��(������)
%inst
�m�[�h�I�u�W�F�N�g�Ɏw�肳�ꂽ���̂�ݒ肵�܂��B
���ׂẴm�[�h�I�u�W�F�N�g�́A�C�ӂɎw�肵�����̂�ݒ肷�邱�Ƃ��\�ł��B
%href
getobjname


%index
getobjname
�I�u�W�F�N�g�̃m�[�h�����擾����
%group
�g����ʐ��䖽��
%prm
var,objid
var      : ���ʂ���������ϐ���
objid(0) : �I�u�W�F�N�g��ID
%inst
�m�[�h�I�u�W�F�N�g�Ɏw�肳�ꂽ���̂��擾���܂��B
var�Ŏw�肳�ꂽ�ϐ��ɖ��̂�������^�Ƃ��đ������܂��B
���ׂẴm�[�h�I�u�W�F�N�g�́A�C�ӂɎw�肵�����̂��ݒ肳��Ă��܂��B
%href
setobjname


%index
gpcolormat
�J���[�}�e���A���̐���
%group
�g����ʐ��䖽��
%prm
var,color,opt
var      : �������ꂽ�}�e���A��ID����������ϐ���
color(0) : �}�e���A���J���[(24bitRGB�l)
opt(0)   : �}�e���A���I�v�V�����l
%inst
�w�肳�ꂽ�F�����J���[�}�e���A���̐������s�Ȃ��܂��B
color�p�����[�^�[�́A24bitRGB�l(0xRRGGBB�Ŏ������l)���w�肵�܂��B�ȗ������ꍇ�́A���F(0xffffff)���ݒ肳��܂��B
�}�e���A����Ǝ��ɐ������邱�Ƃɂ��A�ڍׂȎ����̐ݒ肪�\�ɂȂ�܂��B

^p
	��:
	gpcolormat mat_id,0xff00ff,GPOBJ_MATOPT_NOLIGHT
	gpbox id_model, 1, , mat_id
^p
��̗�ł́ARGB�J���[��0xff00ff(��)�́A���C�e�B���O���s�Ȃ�Ȃ��}�e���A�����������A�����̂̃m�[�h�I�u�W�F�N�g����������܂��B
opt�p�����[�^�[�ɂ��A�}�e���A���̐ݒ��ύX���邱�Ƃ��ł��܂��B
�����̐ݒ�́Agpmatstate���߂ŕʓr�ݒ肷�邱�Ƃ��\�ł��B
^p
        �}�N����                ���e
    -------------------------------------------------------------------
	GPOBJ_MATOPT_NOLIGHT    ���C�e�B���O���s�Ȃ�Ȃ�
	GPOBJ_MATOPT_NOMIPMAP   MIPMAP�𐶐����Ȃ�
	GPOBJ_MATOPT_NOCULL     �J�����O�𖳌��ɂ���
	GPOBJ_MATOPT_NOZTEST    Z�e�X�g�𖳌��ɂ���
	GPOBJ_MATOPT_NOZWRITE   Z�o�b�t�@�������݂𖳌��ɂ���
	GPOBJ_MATOPT_BLENDADD   �v�����h���[�h�����Z�ɐݒ肷��
^p
����Ƀ}�e���A���������ł��Ȃ������ꍇ�́A�G���[3(�p�����[�^�̒l���ُ�ł�)���������܂��B
�������������ꂽ�ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ��Ƀ}�e���A��ID(�����l)���������܂��B

%href
gptexmat
gpusermat


%index
gptexmat
�e�N�X�`���}�e���A���̐���
%group
�g����ʐ��䖽��
%prm
var,"file",opt
var     : �������ꂽ�}�e���A��ID����������ϐ���
"file"  : �ǂݍ��܂��e�N�X�`���t�@�C����
opt(0)  : �}�e���A���I�v�V�����l
%inst
�e�N�X�`��(�摜)�}�e���A���̐������s�Ȃ��܂��B
�}�e���A����Ǝ��ɐ������邱�Ƃɂ��A�ڍׂȎ����̐ݒ肪�\�ɂȂ�܂��B
^p
	��:
	gptexmat id_texmat, "res/qbox.png"	; �e�N�X�`���}�e���A���쐬
	gpbox id_model, 1, , id_texmat		; ���m�[�h��ǉ�
^p
��̗�ł́Ares�t�H���_����qbox.png���e�N�X�`���Ƃ��Ď������}�e���A�����������A�����̂̃m�[�h�I�u�W�F�N�g����������܂��B
opt�p�����[�^�[�ɂ��A�}�e���A���̐ݒ��ύX���邱�Ƃ��ł��܂��B
�����̐ݒ�́Agpmatstate���߂ŕʓr�ݒ肷�邱�Ƃ��\�ł��B
^p
        �}�N����                ���e
    -------------------------------------------------------------------
	GPOBJ_MATOPT_NOLIGHT    ���C�e�B���O���s�Ȃ�Ȃ�
	GPOBJ_MATOPT_NOMIPMAP   MIPMAP�𐶐����Ȃ�
	GPOBJ_MATOPT_NOCULL     �J�����O�𖳌��ɂ���
	GPOBJ_MATOPT_NOZTEST    Z�e�X�g�𖳌��ɂ���
	GPOBJ_MATOPT_NOZWRITE   Z�o�b�t�@�������݂𖳌��ɂ���
	GPOBJ_MATOPT_BLENDADD   �v�����h���[�h�����Z�ɐݒ肷��
	GPOBJ_MATOPT_SPECULAR   �����v�Z���ɃX�y�L�����[��K�p���܂�
	GPOBJ_MATOPT_MIRROR     ���]�����摜�Ƃ��ĕ\������
	GPOBJ_MATOPT_CUBEMAP    �L���[�u�}�b�v�Ƃ��Đݒ肷��
	GPOBJ_MATOPT_NODISCARD  ���`�����l���ɂ��s�N�Z���j���𖳌��ɂ���
^p
����Ƀ}�e���A���������ł��Ȃ������ꍇ�́A�G���[3(�p�����[�^�̒l���ُ�ł�)���������܂��B
�������������ꂽ�ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ��Ƀ}�e���A��ID(�����l)���������܂��B

%href
gpcolormat
gpusermat
gpscrmat


%index
gpscrmat
�I�t�X�N���[���e�N�X�`���}�e���A���̐���
%group
�g����ʐ��䖽��
%prm
var,id,opt
var     : �������ꂽ�}�e���A��ID����������ϐ���
id      : �Q�Ƃ����I�t�X�N���[���o�b�t�@ID
opt(0)  : �}�e���A���I�v�V�����l
%inst
�I�t�X�N���[���e�N�X�`���o�b�t�@���Q�Ƃ���}�e���A���𐶐����܂��B
�}�e���A����Ǝ��ɐ������邱�Ƃɂ��A�I�t�X�N���[���Ƀ����_�����O���ꂽ�摜�C���[�W���e�N�X�`���Ƃ��čė��p���邱�Ƃ��\�ɂȂ�܂��B
^p
	��:
	buffer id_render,512,512,screen_offscreen
	gpscrmat id_texmat, id_render, GPOBJ_MATOPT_NOLIGHT|GPOBJ_MATOPT_NOMIPMAP	; �e�N�X�`���}�e���A���쐬
	gpbox id_model, 1, , id_texmat		; ���m�[�h��ǉ�
^p
��̗�ł́Abuffer���߂ō쐬���ꂽ�I�t�X�N���[���e�N�X�`���o�b�t�@���Q�Ƃ��闧���̂̃m�[�h�I�u�W�F�N�g����������܂��B
opt�p�����[�^�[�ɂ��A�}�e���A���̐ݒ��ύX���邱�Ƃ��ł��܂��B
�����̐ݒ�́Agpmatstate���߂ŕʓr�ݒ肷�邱�Ƃ��\�ł��B
^p
        �}�N����                ���e
    -------------------------------------------------------------------
	GPOBJ_MATOPT_NOLIGHT    ���C�e�B���O���s�Ȃ�Ȃ�
	GPOBJ_MATOPT_NOMIPMAP   MIPMAP�𐶐����Ȃ�
	GPOBJ_MATOPT_NOCULL     �J�����O�𖳌��ɂ���
	GPOBJ_MATOPT_NOZTEST    Z�e�X�g�𖳌��ɂ���
	GPOBJ_MATOPT_NOZWRITE   Z�o�b�t�@�������݂𖳌��ɂ���
	GPOBJ_MATOPT_BLENDADD   �v�����h���[�h�����Z�ɐݒ肷��
	GPOBJ_MATOPT_SPECULAR   �����v�Z���ɃX�y�L�����[��K�p���܂�
	GPOBJ_MATOPT_MIRROR     ���]�����摜�Ƃ��ĕ\������
	GPOBJ_MATOPT_NODISCARD  ���`�����l���ɂ��s�N�Z���j���𖳌��ɂ���
^p
����Ƀ}�e���A���������ł��Ȃ������ꍇ�́A�G���[3(�p�����[�^�̒l���ُ�ł�)���������܂��B
�������������ꂽ�ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ��Ƀ}�e���A��ID(�����l)���������܂��B

%href
gpcolormat
gpusermat


%index
gpusermat
�J�X�^���}�e���A���̐���
%group
�g����ʐ��䖽��
%prm
var,"vsh","fsh","defs",color,opt
var       : �������ꂽ�}�e���A��ID����������ϐ���
"vsh"     : �o�[�e�b�N�X�V�F�[�_�[�t�@�C����
"fsh"     : �t���O�����g�V�F�[�_�[�t�@�C����
"defs"    : �ǉ��̃��x����`
color(-1) : �}�e���A���J���[(24bitRGB�l)
opt(0)    : �}�e���A���I�v�V�����l
%inst
�J�X�^���}�e���A���𐶐����܂��B
�J�X�^���}�e���A���́A�o�[�e�b�N�X�V�F�[�_�[�y�уt���O�����g�V�F�[�_�[���w�肵���Ǝ��̕`����s�Ȃ��܂��B
OpenGL�̃V�F�[�_�[����(GLSL)�ŋL�q���ꂽ�V�F�[�_�[�t�@�C�������A"vsh"�A"fsh"�p�����[�^�[�Ɏw�肵�܂��B
"defs"�p�����[�^�[�ɂ́A�V�F�[�_�[�R���p�C�����ɒǉ�����郉�x����`���L�q���܂��B
color�p�����[�^�[�Ńf�t�H���g�̃J���[��ݒ肷�邱�Ƃ��ł��܂��B�ȗ������ꍇ�́A���F(0xffffff)���ݒ肳��܂��B
"vsh","fsh","defs"�̃p�����[�^�[���ȗ������ꍇ�́Agpusershader�Őݒ肳�ꂽ���e���ݒ肳��܂��B
opt�p�����[�^�[�ɂ��A�}�e���A���̐ݒ��ύX���邱�Ƃ��ł��܂��B
�����̐ݒ�́Agpmatstate���߂ŕʓr�ݒ肷�邱�Ƃ��\�ł��B
^p
        �}�N����                ���e
    -------------------------------------------------------------------
	GPOBJ_MATOPT_NOLIGHT    ���C�e�B���O���s�Ȃ�Ȃ�
	GPOBJ_MATOPT_NOMIPMAP   MIPMAP�𐶐����Ȃ�
	GPOBJ_MATOPT_NOCULL     �J�����O�𖳌��ɂ���
	GPOBJ_MATOPT_NOZTEST    Z�e�X�g�𖳌��ɂ���
	GPOBJ_MATOPT_NOZWRITE   Z�o�b�t�@�������݂𖳌��ɂ���
	GPOBJ_MATOPT_BLENDADD   �v�����h���[�h�����Z�ɐݒ肷��
	GPOBJ_MATOPT_SPECULAR   �����v�Z���ɃX�y�L�����[��K�p���܂�
	GPOBJ_MATOPT_MIRROR     ���]�����摜�Ƃ��ĕ\������
	GPOBJ_MATOPT_CUBEMAP    �L���[�u�}�b�v�Ƃ��Đݒ肷��
	GPOBJ_MATOPT_NODISCARD  ���`�����l���ɂ��s�N�Z���j���𖳌��ɂ���
^p
����Ƀ}�e���A���������ł��Ȃ������ꍇ�́A�G���[3(�p�����[�^�̒l���ُ�ł�)���������܂��B
�������������ꂽ�ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ��Ƀ}�e���A��ID(�����l)���������܂��B
^
�J�X�^���}�e���A���ɂ��A�C�ӂ̃V�F�[�_�[���g���ĕ`��̂��ׂĂ��R���g���[�����邱�Ƃ��ł���悤�ɂȂ�܂��B
����́A�V�F�[�_�[�ɂ��Ă̒m��������㋉�Ҍ����̊g���@�\�ł��̂ŁA�ʏ�͎g�p����K�v�͂���܂���B
�J�X�^���}�e���A���𐶐������ꍇ�́Agpmatprm���߂ɂ���ăV�F�[�_�[�p�����[�^�[�ɓn�����߂̒l��ݒ肷�邱�Ƃ��ł��܂��B

%href
gpmatprm
gpcolormat
gptexmat
gpusershader
gpscrmat


%index
gpclone
�m�[�h�𕡐�
%group
�g����ʐ��䖽��
%prm
var,objid,eventid
var         : �������ꂽ�I�u�W�F�N�g��ID����������ϐ���
objid(0)    : �������̃I�u�W�F�N�gID
eventid(-1) : �C�x���gID
%inst
���ɑ��݂���I�u�W�F�N�g�Ɠ����ݒ�ŁA�V�����I�u�W�F�N�g�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
����̌`��A�p�����[�^�[�ݒ�(�����ݒ������)�������܂������W��p�x�Ȃǂ�V�����ݒ肷�邱�Ƃ��ł��܂��B
����̕��̂𕡐���������ꍇ�ɁA�ݒ��ǂݍ��݂����x���s�Ȃ���Ԃ��y�����������ɂ��Ȃ���܂��B
^p
	��:
	gpload id_model,"res/duck"	; ���f���ǂݍ���
	gpclone i, id_model		; �������̂��N���[��
^p
��̗�ł́Ares/duck.gpb�t�@�C���ɂ��3D���f���m�[�h(id_model)���N���[�����ĕϐ�i�ɐV�����I�u�W�F�N�gID�������܂��B
�N���[����ID�̊��蓖�ĂɎ��s�����ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ���-1���������܂��B
�C�x���gID��eventid�p�����[�^�[�Ɏw�肷�邱�ƂŁA�N���[����̃I�u�W�F�N�g�ɃC�x���g��K�p���邱�Ƃ��ł��܂��Beventid���}�C�i�X�l���A�ȗ����ꂽ�ꍇ�̓C�x���g�͐ݒ肳��܂���B
�����݂̃o�[�W�����ł́A�V�[�����ɑ��݂���\���\�ȃI�u�W�F�N�g�ȊO�̓N���[�����邱�Ƃ��ł��܂���̂Œ��ӂ��Ă��������B
%href
gpdraw


%index
gpnull
�k���m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var
var : �������ꂽ�I�u�W�F�N�gID����������ϐ���
%inst
��̃m�[�h�I�u�W�F�N�g(�k���m�[�h)�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�k���m�[�h�́A�J�����⃉�C�g�Ȃǃ��f�������K�v�̂Ȃ��m�[�h���쐬����ꍇ�ȂǂɎg�p���܂��B
�������ꂽ�m�[�h�́A���̃m�[�h�Ɠ��l��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
%href
gpcamera
gplight


%index
gpload
3D���f���m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,"file","name"
var     : �������ꂽ�I�u�W�F�N�gID����������ϐ���
"file"  : �ǂݍ��݂��s�Ȃ�gpb�t�@�C����
"name"  : �ǂݍ��ݑΏۂƂȂ�m�[�h��
"defs"  : �ǉ��̃��x����`
%inst
�t�@�C�������ꂽ3D���f���f�[�^(.gpb�t�@�C��)���m�[�h�Ƃ��Đ������܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
"file"�Ńt�H���_�y�уt�@�C�������w�肵�܂��B�u.gpb�v�Ȃǂ̊g���q�͎w�肷��K�v����܂���B
�t�@�C���̒��œ���̖��O���������m�[�h������ǂݍ��݂����ꍇ�́A"name"�Ŏw�肷�邱�Ƃ��ł��܂��B
"name"�̎w����ȗ������ꍇ�́A�t�@�C���Ɋ܂܂�Ă���K�w�\�������ׂēǂݍ��݃m�[�h�Ƃ��Đ������܂��B
�}�e���A���Ɋւ�����́A�u.material�v�t�@�C������ǂݍ��܂�܂��B�K���u.gpb�v�t�@�C���ƃZ�b�g�ŗp�ӂ���悤�ɂ��Ă��������B
"defs"�p�����[�^�[���w�肳�ꂽ�ꍇ�ɂ́A���ׂẴV�F�[�_�[�R���p�C�����Ɏw�肳�ꂽ���x����`���ǉ�����܂��B
^
�m�[�h�ɕ����ݒ���s�Ȃ��ꍇ�́Agppbind���߂��g�p���Ă��������B
3D���f���f�[�^�̐ڐG����́A�S�̂��ދ�(�o�E���f�B���O��)���g�p����܂��B
^
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^p
	��:
	gpload id_model,"res/duck"		; ���f���ǂݍ���
^p
��̗�ł́Ares�t�H���_���ɂ���duck.gpb�t�@�C����ǂݍ��݂܂��B
���̍ۂɁA�}�e���A����񂪏�����Ă���duck.material�t�@�C�����Q�Ƃ���܂��B
����ɁA�e�N�X�`�����K�v�ȏꍇ�́A�����t�H���_���̉摜�t�@�C�����ǂݍ��܂�܂��B�t�@�C���ǂݍ��ݎ��ɃG���[�����������ꍇ�ɂ́A�I�u�W�F�N�gID�Ƃ��ă}�C�i�X�l���������܂��B
����ɏڍׂȓǂݍ��ݎ��̃G���[�⃏�[�j���O�𒲂ׂ����ꍇ�́Agpgetlog���߂ɂ���ă��O�����W���邱�Ƃ��\�ł��B

^
gpload���߂œǂݍ��ނ��߂̃t�@�C��(.gpb�`��)�́Agameplay3D�ŕW���I�Ɏg�p����Ă���f�[�^�`���ł��B
HGIMG4�ł́A.gpb�`���𐶐����邽�߂�GPB�R���o�[�^�[(gpbconv.exe)��p�ӂ��Ă��܂��B
�ڂ����́AHGIMG4�}�j���A�����Q�Ƃ��Ă��������B
%href
gpgetlog
gpdraw
gppbind


%index
gpplate
�m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,sizex,sizey,color,matobj
var        : �������ꂽ�I�u�W�F�N�gID����������ϐ���
sizex(1)   : ���������X�T�C�Y
sizey(1)   : ���������Y�T�C�Y
color(-1)  : �}�e���A���J���[(24bitRGB�l)
matobj(-1) : �}�e���A��ID
%inst
�����ɗ�����1���̔�(�l�p�`)��3D���f���f�[�^�Ƃ��ăm�[�h�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
���f����X,Y�T�C�Y��sizex,sizey�p�����[�^�[�Ŏw�肷�邱�Ƃ��ł��܂��B
color�p�����[�^�[�Ń��f���̐F(�}�e���A���J���[)��24bitRGB�l(0xRRGGBB�Ŏ������l)�ɂ��w�肵�܂��B
color�p�����[�^�[���ȗ����ꂽ�ꍇ�́A���F(0xffffff)���g�p����܂��B
matobj�p�����[�^�[�ŁA�}�e���A��ID���w�肷�邱�Ƃ��ł��܂��B
gpcolormat���߂Ȃǂɂ��A���[�U�[�����������}�e���A�����g�p����ꍇ�͎w�肵�Ă��������B
matobj�p�����[�^�[���ȗ����ꂽ�ꍇ�́A�W���̃}�e���A�����g�p����܂��B
^
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^
�m�[�h�ɕ����ݒ���s�Ȃ��ꍇ�́Agppbind���߂��g�p���Ă��������B
�m�[�h�̐ڐG����́A���Ƃ̃��f���Ɠ����`�󂪎g�p����܂��B
%href
gpdraw
gppbind


%index
gpfloor
���m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,sizex,sizey,color,matobj
var     : �������ꂽ�I�u�W�F�N�gID����������ϐ���
sizex(1)   : ���������X�T�C�Y
sizey(1)   : ���������Y�T�C�Y
color(-1)  : �}�e���A���J���[(24bitRGB�l)
matobj(-1) : �}�e���A��ID
%inst
1���̏�(�l�p�`)��3D���f���f�[�^�Ƃ��ăm�[�h�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
���f����X,Y�T�C�Y��sizex,sizey�p�����[�^�[�Ŏw�肷�邱�Ƃ��ł��܂��B
color�p�����[�^�[�Ń��f���̐F(�}�e���A���J���[)��24bitRGB�l(0xRRGGBB�Ŏ������l)�ɂ��w�肵�܂��B
color�p�����[�^�[���ȗ����ꂽ�ꍇ�́A���F(0xffffff)���g�p����܂��B
matobj�p�����[�^�[�ŁA�}�e���A��ID���w�肷�邱�Ƃ��ł��܂��B
gpcolormat���߂Ȃǂɂ��A���[�U�[�����������}�e���A�����g�p����ꍇ�͎w�肵�Ă��������B
matobj�p�����[�^�[���ȗ����ꂽ�ꍇ�́A�W���̃}�e���A�����g�p����܂��B
^
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^
�m�[�h�ɕ����ݒ���s�Ȃ��ꍇ�́Agppbind���߂��g�p���Ă��������B
(�����f���͕W���ŁA�����ꏊ�ɌŒ肳�ꂽ�����������ݒ肳��܂�)
�m�[�h�̐ڐG����́A���Ƃ̃��f���Ɠ����`�󂪎g�p����܂��B
%href
gpdraw
gppbind


%index
gpbox
���m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,size,color,matobj
var     : �������ꂽ�I�u�W�F�N�gID����������ϐ���
size(1)    : ���������T�C�Y
color(-1)  : �}�e���A���J���[(24bitRGB�l)
matobj(-1) : �}�e���A��ID
%inst
�w��T�C�Y�̗����̂�3D���f���f�[�^�Ƃ��ăm�[�h�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
���f����X,Y�T�C�Y��sizex,sizey�p�����[�^�[�Ŏw�肷�邱�Ƃ��ł��܂��B
color�p�����[�^�[�Ń��f���̐F(�}�e���A���J���[)��24bitRGB�l(0xRRGGBB�Ŏ������l)�ɂ��w�肵�܂��B
color�p�����[�^�[���ȗ����ꂽ�ꍇ�́A���F(0xffffff)���g�p����܂��B
matobj�p�����[�^�[�ŁA�}�e���A��ID���w�肷�邱�Ƃ��ł��܂��B
gpcolormat���߂Ȃǂɂ��A���[�U�[�����������}�e���A�����g�p����ꍇ�͎w�肵�Ă��������B
matobj�p�����[�^�[���ȗ����ꂽ�ꍇ�́A�W���̃}�e���A�����g�p����܂��B
^
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^
�m�[�h�ɕ����ݒ���s�Ȃ��ꍇ�́Agppbind���߂��g�p���Ă��������B
�m�[�h�̐ڐG����́A���Ƃ̃��f���Ɠ����`�󂪎g�p����܂��B
%href
gpdraw
gppbind


%index
gpspr
2D�X�v���C�g�m�[�h����
%group
�g����ʐ��䖽��
%prm
var,bufid,celid,gmode
var      : �������ꂽ�I�u�W�F�N�gID����������ϐ���
bufid(0) : �o�b�t�@ID
celid(0) : �Z��ID
gmode(3) : �R�s�[���[�h
%inst
2D�X�v���C�g��\�����邽�߂̃m�[�h�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��2D�X�N���[���̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
bufid�p�����[�^�[�ŕ\�����̉摜���ǂݍ��܂�Ă���o�b�t�@ID���Acelid�p�����[�^�[�ŕ\������Z��ID���w�肵�܂��B
�܂��Agmode�p�����[�^�[��gcopy���߂Ŏw�肷����̂Ɠ��l�̃R�s�[���[�h���w�肵�܂��B
^p
	 gmode�l  |  ���e
	---------------------------------------------------
	    0,1      �A���t�@�`�����l������
	    2        �A���t�@�`�����l���L��
	    5        �F���Z�E�A���t�@�`�����l���L��
^p
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^p
	; �X�v���C�g1������̕`��
	gmode [gmode�ݒ�l]
	pos [�m�[�hX���W],[�m�[�hY���W]
	celput [�o�b�t�@ID], [�Z��ID], [�m�[�hX�X�P�[��], [�m�[�hY�X�P�[��], [�m�[�hZ��]]
^p
�܂�A2D�X�v���C�g�m�[�h�͏�̂悤�ȏ��������炩���ߓo�^�����ݒ���܂Ƃ߂čs�Ȃ��@�\�ƍl���邱�Ƃ��ł��܂��B
�܂��Agetcoli���߂ɂ��2D�X�v���C�g�m�[�h���m�̐ڐG�������y�ɍs�Ȃ����Ƃ��\�ł��B
%href
gpdraw


%index
gplight
���C�g�m�[�h��ݒ�
%group
�g����ʐ��䖽��
%prm
id,opt,range,inner,outer
id(0)     : �I�u�W�F�N�g��ID
opt(0)    : ���C�g�����I�v�V����
range(1)  : �e���͈̓p�����[�^�[
inner(0.5): �����̌����p�����[�^�[
outer(1)  : �O���̌����p�����[�^�[
%inst
�����ς݂̃m�[�h�Ƀ��C�g�Ƃ��Ă̋@�\��ǉ����܂��B
id�p�����[�^�[�ŁA�m�[�h�̃I�u�W�F�N�gID���w�肵�܂��B
opt�p�����[�^�[�Ń��C�g�����I�v�V�����l���w�肷�邱�Ƃ��ł��܂��B
^p
	  opt�l               |  ���e
	--------------------------------------------------------------
	  GPOBJ_LGTOPT_NORMAL    ���s����(�f�B���N�V���i�����C�g)
	  GPOBJ_LGTOPT_POINT     �_����(�|�C���g���C�g)
	  GPOBJ_LGTOPT_SPOT      �X�|�b�g���C�g
^p
range�p�����[�^�[�́A�|�C���g���C�g�y�уX�|�b�g���C�g�̉e���͈͂Ɋւ���ݒ���s�Ȃ��܂��B
�܂��Ainner,outer�p�����[�^�[�́A�X�|�b�g���C�g��������������E�O���̃p�����[�^�[��ݒ肵�܂��B
^p
	��:
	gpnull id_alight			; �k���m�[�h�𐶐�����
	gplight id_alight, GPOBJ_LGTOPT_NORMAL	; ���C�g�Ƃ��ēo�^����
	gpuselight id_alight			; �f�t�H���g�̃��C�g�ɐݒ�
^p
gplight���߂́A�����܂ł��I�u�W�F�N�g�Ƀ��C�g�Ƃ��Ă̋@�\��ݒ肷�邾���ł��B
�ݒ肳�ꂽ���C�g�́Agpuselight���߂ɂ��J�����g���C�g�Ƃ��ēo�^���邱�ƂŁA�ȍ~�ɐ�������郂�f���E�}�e���A���ɔ��f����܂��B

%href
gpresetlight
gpuselight
gpnull

%index
gpcamera
�J�����m�[�h��ݒ�
%group
�g����ʐ��䖽��
%prm
id,fov,aspect,near,far,sw
id(0)      : �I�u�W�F�N�g��ID
fov(45)    : ����(FOV)�p�����[�^�[
aspect(1.5): �A�X�y�N�g��
near(0.5)  : �j�A�N���b�vZ�l
far(768)   : �t�@�[�N���b�vZ�l
sw(0)      : �J�����^�C�v�l(0,1)
%inst
�����ς݂̃m�[�h�ɃJ�����Ƃ��Ă̋@�\��ǉ����܂��B
id�p�����[�^�[�ŁA�m�[�h�̃I�u�W�F�N�gID���w�肵�܂��B
fov�p�����[�^�[�Ŏ���(FOV)��ݒ肵�܂��B45���w�肵���ꍇ�́A45�x�̎���ƂȂ�܂��B
aspect�p�����[�^�[�ŃA�X�y�N�g��(�c����)���w�肵�܂��B
�܂��Anear,far�p�����[�^�[�ɂ��߂��Ɖ�����Z���W(�N���b�s���O�Ɏg����Z���W)���w�肷�邱�Ƃ��ł��܂��B
^p
	��:
	gpnull id_camera			; �k���m�[�h�𐶐�����
	gpcamera id_camera, 45, 1.5, 0.5, 768	; �J�����Ƃ��Đݒ肷��
	gpusecamera id_camera			; �g�p����J������I������
	setpos id_camera, 0,20,20		; �J�����ʒu��ݒ肷��
^p
�J�����^�C�v�l(sw)��1���w�肷�邱�Ƃɂ��A���s���e(Orthographic)���s���J������ݒ肷�邱�Ƃ��\�ł��B���̏ꍇ�́Afov�l�̓Y�[���l(1.0���W��)�Ƃ��Ĕ��f����܂��B

�V�[�����ɔz�u���ꂽ�J�����́Agpusecamera���߂ɂ��؂�ւ��邱�Ƃ��ł��܂��B

%href
gpusecamera
gpnull


%index
gplookat
�w����W�Ɍ����ăm�[�h����]
%group
�g����ʐ��䖽��
%prm
objid,x,y,z
objid(0)  : �I�u�W�F�N�gID
x(0)      : �ڕW�ƂȂ�X���W
y(0)      : �ڕW�ƂȂ�Y���W
z(0)      : �ڕW�ƂȂ�Z���W
%inst
3D�m�[�h���A�w�肵�����W�Ɍ����ĉ�]�����܂��B
�J�����ɓK�p�����ꍇ�́A�w����W�𒍎�����p�x�ɐݒ肳��܂��B
%href


%index
gppbind
�m�[�h�ɕW���I�ȕ���������ݒ�
%group
�g����ʐ��䖽��
%prm
objid,mass,friction,option
objid(0)      : �I�u�W�F�N�gID
mass(1)       : �d��
friction(0.5) : ���C�W��
option(0)     : �ݒ�I�v�V����
%inst
�m�[�h�I�u�W�F�N�g�ɑ΂��āA��{�I�ȕ����ݒ���s�Ȃ��܂��B
mass�p�����[�^�[�͕��̂̏d���Bfriction�p�����[�^�[�͖��C�W���ł��B�l���ȗ������ꍇ�́A�f�t�H���g�l���g�p����܂��B
�d��(mass)��0�ɂ��邱�ƂŐÓI����(�Փ˂͂��邪�A�����Ȃ�)�Ƃ��Đݒ肳��܂��B
����ȊO�̏ꍇ�́A�����@���ɏ]���ď��̂���ꏊ�܂ŗ������܂��B
^
gppbind���߂͊�{�I�ȕ�������������ݒ肵�܂��B�ڍׂȕ����p�����[�^�[��ݒ肷��ꍇ�ɂ́Agppset���߂��g�p���Đݒ���s���Ă��������B
^
������������ݒ肷��ꍇ�́A�K����(�n��)�ƂȂ镔�����쐬���Ă����Ă��������B
gpfloor���߂ɂ���Đ������ꂽ���ɕW���I�ȕ���������ݒ肷�邱�ƂŁA�Œ肳�ꂽ���ʂ𐶐����邱�Ƃ��ł��܂��B
�������݂��Ȃ������ꍇ�A���͉̂i���ɗ����𑱂��邱�ƂɂȂ�܂��B
^
�����ݒ���s�Ȃ����m�[�h�I�u�W�F�N�g�́A����ȍ~�������ē��삷��悤�ɂȂ�Asetpos�Ȃǂ̍��W�ύX�͖����ƂȂ�܂��B
���̂ɗ͂����������ꍇ�́Agppapply���߂��g�p���Ă��������B
^
option�p�����[�^�[�ɂ��ݒ莞�̃I�v�V������t�����܂��B�ȉ��̃}�N�����w�肷�邱�Ƃ��ł��܂��B
^p
	  opt�l               |  ���e
	--------------------------------------------------------------

	  GPPBIND_NOSCALE        �R���W�����Ƀm�[�h�̃X�P�[���𔽉f�����Ȃ�
	  GPPBIND_MESH           �R���W�����Ƃ��ăm�[�h�̃��f���𔽉f������
^p
�m�[�h�I�u�W�F�N�g�ɕ����ݒ���s�Ȃ��ƁA�ڐG������s�����(�R���W����)���쐬����܂��B

���m�[�h�A���m�[�h�A�m�[�h�͂��ꂼ��̌`����R���W�����Ƃ��Ĉ����܂��Boption�ɁAGPPBIND_NOSCALE���w�肵���ꍇ�́A�X�P�[�������f����Ă��Ȃ����Ƃ��Ƃ̌`�󂪃R���W�����ƂȂ�܂��B
3D���f���m�[�h�́A�W���ł̓��f���S�̂𕢂��X�t�B�A(����)���R���W�����Ƃ��č쐬���܂��B�������Aoption��GPPBIND_MESH���w�肵���ꍇ�́A���f���̌`�󂻂̂��̂��R���W�����Ƃ��Ĉ����܂��B�������A���G�ȃ��f���`����R���W�����ɂ����ꍇ�A�ڐG����ɂ����镉�ׂ����債�܂��B
�R���W�����́A���f���̌`��Ƃ͓Ɨ��������ƂȂ�܂��B�R���W�������쐬���ꂽ��́A�m�[�h�̃X�P�[���l�͔��f����܂���̂Œ��ӂ��Ă��������B


%href
gppapply
gppset


%index
getwork2
�m�[�h���[�N�l2���擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�
%inst
�I�u�W�F�N�g�̎���work2�p�����[�^�[���擾���܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
���߂̍Ō�Ɂui�v��t�����邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B
%href
getwork2i


%index
getwork2i
�m�[�h���[�N�l2���擾(�����l)
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�
%inst
�I�u�W�F�N�g�̎���work2�p�����[�^�[���擾���܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
getwork2���߂��g�p���邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B
%href
getwork2


%index
selquat
�I�u�W�F�N��]����MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��quat(�N�H�[�^�j�I����]���)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href


%index
selwork2
�I�u�W�F�N�g���[�N2��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��work2(���[�N2)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href


%index
setwork2
work2�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)
%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
work2�O���[�v(���[�N2�l)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
%href
setwork


%index
addwork2
work2�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)
%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
work2�O���[�v(���[�N2�l)��(x,y,z)�Ŏw�肳�ꂽ�l�����Z���܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
%href
addwork


%index
gpcnvaxis
3D���W�̕ϊ����s�Ȃ�
%group
�g����ʐ��䖽��
%prm
var_x,var_y,var_z,x,y,z,mode
var_x   : X�l����������ϐ�
var_y   : Y�l����������ϐ�
var_z   : Z�l����������ϐ�
x(0.0)  : �ϊ�����X�l
y(0.0)  : �ϊ�����Y�l
z(0.0)  : �ϊ�����Z�l
mode(0) : �ϊ����[�h
%inst
���߂�ꂽ���[�h�ɏ]���āA(x,y,z)��3D���W��ϊ����܂��B
���ʂ́Avar_x,var_y,var_z�Ŏw�肳�ꂽ�ϐ��Ɏ����^�ő������܂��B(�ϐ��^�͎����I�ɐݒ肳��܂�)
���[�h�l�ɂ��ϊ��̓��e�͈ȉ��̒ʂ�ł��B
^p
���[�h  ���e
-----------------------------------------------
0       �`�悳���2D���W(X,Y)�ʒu+Z�o�b�t�@�l
1       0�Ɠ�������(X,Y)���W�����K�����ꂽ����
2       �r���[�ϊ����s�Ȃ���(X,Y,Z)���W
^p
���[�h0��1�́A�X�N���[�����2D���e���s�Ȃ����ۂ�X,Y���W�A�y��Z�o�b�t�@�l�ɕϊ����܂��B
���[�h2�ł́A�J�����ʒu���l�������r���[�ϊ����s�Ȃ���X,Y,Z���W�l�ɕϊ����܂��B
%href


%index
gppset
�m�[�h�̕����p�����[�^�[��ݒ�
%group
�g����ʐ��䖽��
%prm
objid,prmid,x,y,z
objid(0)  : �I�u�W�F�N�gID
prmid(0)  : �p�����[�^�[ID
x(0.0)    : �ݒ�p�����[�^�[X�l
y(0.0)    : �ݒ�p�����[�^�[Y�l
z(0.0)    : �ݒ�p�����[�^�[Z�l
%inst
objid�Ŏw�肳�ꂽ�m�[�h�̏ڍׂȕ����p�����[�^�[��ݒ肵�܂��B
prmid�p�����[�^�[�ŁA�ݒ肷�鍀�ڂ��w�肵�AX,Y,Z�Ɏw�肳�ꂽ�l���A���ꂼ��̍��ڂɑΉ������l�Ƃ��ēK�p����܂��B
^p
        �}�N����                          ���e
    ----------------------------------------------------------------------------
	GPPSET_ENABLE                     X=����������ON/OFF(0=����)
	GPPSET_FRICTION                   X=���C�W��, Y=�e�͐ݒ�
	GPPSET_DAMPING                    X=linear����(0�`1.0), Y=angular����(0�`1.0)
	GPPSET_KINEMATIC                  X=Kinematic�ݒ��ON/OFF(0=����)
	GPPSET_ANISOTROPIC_FRICTION       X,Y,Z=�ٕ����̖��C
	GPPSET_GRAVITY                    X,Y,Z=�d��
	GPPSET_LINEAR_FACTOR              X,Y,Z=�x�N�g���ɉ������ړ��̐ݒ�
	GPPSET_ANGULAR_FACTOR             X,Y,Z=�x�N�g���ɉ�������]�̐ݒ�
	GPPSET_ANGULAR_VELOCITY           X,Y,Z=��]�x���V�e�B�[
	GPPSET_LINEAR_VELOCITY            X,Y,Z=���j�A�x���V�e�B�[
	GPPSET_MASS_CENTER                X,Y,Z=���S���W�̃I�t�Z�b�g
^p
�K��gppbind���߂Ŋ�{�I�ȕ���������ݒ肵����ŏڍאݒ���s�Ȃ��悤�ɂ��Ă��������B
�ݒ�l���������Ȃ��ꍇ�́A�G���[���������܂��B
%href
gppbind


%index
gpobjpool
�I�u�W�F�N�gID�����̐ݒ�
%group
�g����ʐ��䖽��
%prm
start,num
start(0) : ���蓖�ĊJ�n�ԍ�
num(-1)  : �ő劄�蓖�Đ�
%inst
�I�u�W�F�N�gID�̊��蓖�ĕ��@��ύX���܂��B
�I�u�W�F�N�gID�́A���炩���ߌ��߂�ꂽ�ő吔�̒��ŁA�g�p����Ă��Ȃ�ID�ԍ������蓖�Ă��܂��B
�I�u�W�F�N�g�ő吔�́A�f�t�H���g��1024�ƂȂ��Ă���Asysreq���߂ɂ���Ċg�����邱�Ƃ��\�ł��B
^p
	��:
	setreq SYSREQ_MAXOBJ,4096	; �I�u�W�F�N�g�ő吔��4096�Ɋg������
^p
gpobjpool���߂́AID�ԍ��̊��蓖�Ĕ͈͂�C�ӂɕύX���邱�Ƃ��ł��܂��B
start�p�����[�^�[�Ŏw�肳�ꂽ�ԍ������蓖�ĊJ�n�ԍ��ɐݒ肵�܂��B
num�p�����[�^�[�Ŏw�肳�ꂽ�ԍ������蓖�Ă���ő吔�ɐݒ肵�܂��B
num�p�����[�^�[���}�C�i�X�l���ȗ�����Ă����ꍇ�́A���蓖�ĊJ�n�ԍ�����ő������͈͂��ݒ肳��܂��B
^p
	��:
	gpobjpool 100,50	; �I�u�W�F�N�gID�����̐ݒ�ύX
^p
��̗�ł́AID�ԍ�100�`150�݂̂����蓖�đΏۂɕύX���܂��B
����ȍ~�̃I�u�W�F�N�g��������(gpbox��gpnull�Ȃ�)�ł́A�w�肳�ꂽ�͈͓��̃I�u�W�F�N�gID�݂̂����蓖�Ă��܂��B
�I�u�W�F�N�g�S�̂̒��œ���̌��܂ł�����������Ȃ��悤�ɐ����������ꍇ��A
�\��������������x�R���g���[���������ꍇ�ɗ��p�ł��܂��B
gpobjpool���߂ɂ���āA���炩���ߐݒ肳�ꂽ�I�u�W�F�N�g�ő吔���g�����邱�Ƃ͂ł��܂���B
�K���ő吔�͈͓̔��Őݒ���s�Ȃ��悤���ӂ��Ă��������B
%href
delobj


%index
gppapply
�m�[�h�ɕ����I�ȗ͂�K�p����
%group
�g����ʐ��䖽��
%prm
objid,action,x,y,z
objid(0)  : �I�u�W�F�N�gID
action(0) : �͂̎��(�^�C�v)
x(0.0)    : �ݒ�p�����[�^�[X�l
y(0.0)    : �ݒ�p�����[�^�[Y�l
z(0.0)    : �ݒ�p�����[�^�[Z�l
%inst
�m�[�h�ɑ΂���(x,y,z)�Ŏw�肵���x�N�g���̕����I�ȗ͂�K�p���܂��B
action�p�����[�^�[�Őݒ�ł���^�C�v�́A�ȉ��̒ʂ�ł��B
^p
        �}�N����                     ���e
    ----------------------------------------------------------------------------
	GPPAPPLY_FORCE               �ړ����悤�Ƃ���͂����Z����
	GPPAPPLY_IMPULSE             �u�ԓI�ȏՌ���^����
	GPPAPPLY_TORQUE              �g���N(�˂���)�͂�^����
	GPPAPPLY_TORQUE_IMPULSE      �g���N+�Ռ���^����
^p
�K��gppbind���߂Ŋ�{�I�ȕ���������ݒ肵����ŗ͂�K�p����悤�ɂ��Ă��������B
�ݒ�l���������Ȃ��ꍇ�́A�G���[���������܂��B
%href
gppbind


%index
gpmatprm1
�}�e���A���̃p�����[�^�[�ݒ�(2)
%group
�g����ʐ��䖽��
%prm
id,"name",value
id(0)      : �}�e���A��ID/�I�u�W�F�N�gID
"name"     : �p�����[�^�[��
value(0.0) : X�̐ݒ�l(�����l)
%inst
�������ꂽ�}�e���A���̃V�F�[�_�[�p�����[�^�[��ݒ肵�܂��B
gpmatprm���߂Ɗ�{�I�ɓ����@�\�ł��B
gpmatprm1���߂́A1���ڂ݂̂̎����p�����[�^�[���w�肵�܂��B
%href
gpmat
gpmatprm
gpmatprm4
gpmatprm16


%index
gpmatprm4
�}�e���A���̃p�����[�^�[�ݒ�(3)
%group
�g����ʐ��䖽��
%prm
id,"name",x,y,z,w
id(0)  : �}�e���A��ID/�I�u�W�F�N�gID
"name" : �p�����[�^�[��
x(0.0) : X�̐ݒ�l(�����l)
y(0.0) : Y�̐ݒ�l(�����l)
z(0.0) : Z�̐ݒ�l(�����l)
w(0.0) : W�̐ݒ�l(�����l)
%inst
�������ꂽ�}�e���A���̃V�F�[�_�[�p�����[�^�[��ݒ肵�܂��B
gpmatprm���߂Ɗ�{�I�ɓ����@�\�ł��B
gpmatprm4���߂́A4����(x,y,z,w)�̎����p�����[�^�[���w�肵�܂��B
%href
gpmat
gpmatprm
gpmatprm1
gpmatprm16


%index
setalpha
�I�u�W�F�N�g�̓����x(���l)�ݒ�
%group
�g����ʐ��䖽��
%prm
objid,value
objid(0)   : �I�u�W�F�N�gID
value(255) : �ݒ肷��l(�����l)(0�`255)
%inst
�I�u�W�F�N�g�̓����x(���l)��ݒ肵�܂��B
value�p�����[�^�[�Ŏw�肳�ꂽ�l���Aobjid�p�����[�^�[�̃I�u�W�F�N�g�ɐݒ肵�܂��B
value�p�����[�^�[�Ŏw�肷��l�́A�����x������0�`255�̐����l(���l)�ƂȂ�܂��B
0�͊��S�ȓ����A255�͕s�������K�p����܂��B
���l��255�ȊO(������)�̏�ԂƂȂ����I�u�W�F�N�g�́A�`�揇�����O�ʂɕύX����܂��B
(OBJ_LATE�̃��[�h�t���O�l���w�肳�ꂽ�̂Ɠ������)
%href
gpsetprm


%index
gpgetlog
HGIMG4�G���[���O���擾
%group
�g����ʐ��䖽��
%prm
var
var   : �G���[���O����������ϐ�
%inst
HGIMG4�̃G���[���O���擾���ĕϐ��ɑ�����܂��B�ϐ��͕�����^�Ƃ��ď���������܂��B
�G���[���O�́Agpreset�Agpload���߂Ȃǂ̎��s���ɔ��������G���[�̏ڍׂ��L�^������̂ŁA�����̒����Ȃǂɗ��p���邱�Ƃ��ł��܂��B

%href
gpload
gpreset


%index
gpaddanim
�A�j���[�V�����N���b�v��ǉ�
%group
�g����ʐ��䖽��
%prm
objid,"name",start,end,option
objid(0)  : �I�u�W�F�N�gID
"name"    : �A�j���[�V�����N���b�v��
start(0)  : �X�^�[�g�t���[��(�~���b)
end(-1)   : �I���t���[��(�~���b)
option(0) : �ǉ��I�v�V����
%inst
�ǂݍ��܂ꂽ3D���f�������A�j���[�V�����f�[�^�����ƂɁA�V�K�̃A�j���[�V�����N���b�v��ǉ����܂��B
�A�j���[�V�����N���b�v�́A3D���f���̃A�j���[�V�����f�[�^����ꕔ�̃t���[����؂�o�������̂ɖ��O��t���ĊǗ�������̂ł��B
���炩���߁Agpload���߂ɂ��gpb�t�@�C������A�j���[�V�����f�[�^���܂ރ��f���f�[�^��ǂݍ���ł����K�v������܂��B
"name"�p�����[�^�[�ŁA�A�j���[�V�����N���b�v�̖��O���w�肵�܂��B���ɒǉ�����Ă��閼�O�͎w��ł��܂���B
start,end�p�����[�^�[�ŃA�j���[�V�����N���b�v�̃t���[���͈͂��w�肵�܂��B�����̓~���b�P�ʂ̎��Ԏw��ƂȂ�܂��B
end�p�����[�^�[���ȗ����邩�}�C�i�X�l���w�肵���ꍇ�́A�A�j���[�V�����S�̂̍Ō�ɂ�����t���[�����K�p����܂��B

����������ɏI�������ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B�G���[�����������ꍇ�́A�V�X�e���ϐ�stat�̓}�C�i�X�l���������܂��B

%href
gpgetanim
gpsetanim
gpact


%index
gpact
�A�j���[�V�����N���b�v���Đ�/��~
%group
�g����ʐ��䖽��
%prm
objid,"name",option
objid(0)  : �I�u�W�F�N�gID
"name"(""): �A�j���[�V�����N���b�v��
option(1) : �Đ��I�v�V����
%inst
�w�肳�ꂽ���O�̃A�j���[�V�����N���b�v�̍Đ�/��~�Ȃǂ��R���g���[�����܂��B
�A�j���[�V�������ݒ肳��Ă��郂�f���̃I�u�W�F�N�gID���w�肵�A"name"�ŃA�j���[�V�����N���b�v��I�����܂��B
�A�j���[�V�����N���b�v�͂��炩����gpaddanim���߂Őݒ肵�Ă������Ƃ��ł��܂��B�܂��A"name"�̎w����ȗ����邩�A""(�󕶎�)�̏ꍇ�̓f�t�H���g�̃A�j���[�V�����N���b�v�ƂȂ�܂��B
option�̒l�ōĐ��̃R���g���[�����s�Ȃ��܂��B
^p
        �}�N����              �l          ���e
    ----------------------------------------------------------------------------
	GPACT_STOP            0           ��~
	GPACT_PLAY            1           �J�n
	GPACT_PAUSE           2           �ꎞ��~
^p
�A�j���[�V�����̍Đ��́A�A�j���[�V�����N���b�v���Ƃɐ��䂳��܂��B
1�̃��f���ɑ΂��ē����ɕ����̃A�j���[�V�����N���b�v���Đ����邱�Ƃ��\�ł��B
�A�j���[�V�����N���b�v�Đ��̏�Ԃ��擾�E�ݒ肷�邽�߂̖��߂Ƃ��āAgpgetanim,gpsetanim���p�ӂ���Ă��܂��B
����������ɏI�������ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B�G���[�����������ꍇ�́A�V�X�e���ϐ�stat�̓}�C�i�X�l���������܂��B

%href
gpaddanim
gpgetanim
gpsetanim


%index
gpgetanim
�A�j���[�V�����N���b�v�ݒ���擾
%group
�g����ʐ��䖽��
%prm
var,objid,index,prmid
var   : ��񂪑�������ϐ�
objid(0) : �I�u�W�F�N�gID
index(0) : �A�j���[�V�����N���b�v�̃C���f�b�N�X(0�`)
prmid(0) : �p�����[�^�[ID
%inst
�w�肳�ꂽ�A�j���[�V�����N���b�v�̐ݒ���擾����var�Ŏw�肳�ꂽ�ϐ��ɑ�����܂��B
objid�Őݒ���擾����I�u�W�F�N�gID���Aindex�ɃA�j���[�V�����N���b�v�̃C���f�b�N�X���w�肵�܂��B
�A�j���[�V�����N���b�v�̃C���f�b�N�X�́A�I�u�W�F�N�g���ێ����Ă���A�j���[�V�����N���b�v�ɏ��ԂɊ���U����ԍ��ł��B0,1,2,3�c�̂悤��0����n�܂鐮���l�ŁA���݂��Ȃ��C���f�b�N�X���w�肳�ꂽ�ꍇ�̓V�X�e���ϐ���-1(�G���[)���������܂��B
prmid�łǂ̂悤�ȏ����擾���邩���w�肵�܂��Bprmid�Ŏw��ł���l�͈ȉ��̒ʂ�ł��B
^p
        �}�N����                   �l          ���e
    ----------------------------------------------------------------------------
	GPANIM_OPT_START_FRAME     0           �J�n�t���[��(�~���b�P��)
	GPANIM_OPT_END_FRAME       1           �I���t���[��(�~���b�P��)
	GPANIM_OPT_DURATION        2           �Đ��̒���(�~���b�P��)
	GPANIM_OPT_ELAPSED         3           �o�ߎ���(�~���b�P��)
	GPANIM_OPT_BLEND           4           �u�����h�W��(%�P��)
	GPANIM_OPT_PLAYING         5           �Đ����t���O(0=��~/1=�Đ�)
	GPANIM_OPT_SPEED           6           �Đ��X�s�[�h(%�P��)
	GPANIM_OPT_NAME            16          �A�j���[�V�����N���b�v��
^p
�擾�����ϐ��͓K�؂Ȍ^�ŏ���������܂��BGPANIM_OPT_NAME�̏ꍇ�́A������^�ƂȂ�܂��B
����������ɏI�������ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B�G���[�����������ꍇ�́A�V�X�e���ϐ�stat�̓}�C�i�X�l���������܂��B
%href
gpaddanim
gpsetanim


%index
gpsetanim
�A�j���[�V�����N���b�v�ݒ���X�V
%group
�g����ʐ��䖽��
%prm
objid,index,prmid,value
objid(0) : �I�u�W�F�N�gID
index(0) : �A�j���[�V�����N���b�v�̃C���f�b�N�X(0�`)
prmid(0) : �p�����[�^�[ID
value(0) : �ݒ肳���l(�����l)
%inst
�w�肳�ꂽ�A�j���[�V�����N���b�v�̐ݒ��value�Ŏw�肳���V�����l�ōX�V���܂��B
objid�Őݒ���擾����I�u�W�F�N�gID���Aindex�ɃA�j���[�V�����N���b�v�̃C���f�b�N�X���w�肵�܂��B
�A�j���[�V�����N���b�v�̃C���f�b�N�X�́A�I�u�W�F�N�g���ێ����Ă���A�j���[�V�����N���b�v�ɏ��ԂɊ���U����ԍ��ł��B0,1,2,3�c�̂悤��0����n�܂鐮���l�ŁA���݂��Ȃ��C���f�b�N�X���w�肳�ꂽ�ꍇ�̓V�X�e���ϐ���-1(�G���[)���������܂��B
prmid�łǂ̂悤�ȏ���ݒ肷�邩���w�肵�܂��Bprmid�Ŏw��ł���l�͈ȉ��̒ʂ�ł��B
^p
        �}�N����                   �l          ���e
    ----------------------------------------------------------------------------
	GPANIM_OPT_DURATION        2           �Đ��̒���(�~���b�P��)
	GPANIM_OPT_BLEND           4           �u�����h�W��(%�P��)
	GPANIM_OPT_SPEED           6           �Đ��X�s�[�h(%�P��)
^p
����������ɏI�������ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B�G���[�����������ꍇ�́A�V�X�e���ϐ�stat�̓}�C�i�X�l���������܂��B
%href
gpaddanim
gpgetanim


%index
gpmatprm16
�}�e���A���̃p�����[�^�[�ݒ�(�}�g���N�X)
%group
�g����ʐ��䖽��
%prm
id,"name",var
id(0)      : �}�e���A��ID/�I�u�W�F�N�gID
"name"     : �p�����[�^�[��
var        : �l��������ꂽ�z��ϐ���(�����^)
count(1)   : �ݒ肳���}�g���N�X�̌�
%inst
�������ꂽ�}�e���A���̃V�F�[�_�[�p�����[�^�[��ݒ肵�܂��B
gpmatprm���߂Ɗ�{�I�ɓ����@�\�ł����Agpmatprm16���߂́Avar�Ŏw�肳�ꂽ�����^�̔z��ϐ��Ɋi�[���ꂽ���l��4�~4�̃}�g���N�X�s��Ƃ��Đݒ肵�܂��B
var(0)�`var(15)�̂P�U�̎������}�g���N�X�s��ƂȂ�܂��Bcount���w�肵���ꍇ�́A���̌������z��ϐ�����l�����o���܂��B
%href
gpmatprm
gpmatprm1
gpmatprm4


%index
gpmatprmt
�}�e���A���̃p�����[�^�[�ݒ�(�e�N�X�`��)
%group
�g����ʐ��䖽��
%prm
id,"name","filename"
id(0)      : �}�e���A��ID/�I�u�W�F�N�gID
"name"     : �p�����[�^�[��
"filename" : �摜�t�@�C����
opt(0)     : �}�e���A���I�v�V�����l
%inst
�������ꂽ�}�e���A���̃V�F�[�_�[�p�����[�^�[��ݒ肵�܂��B
gpmatprm���߂Ɗ�{�I�ɓ����@�\�ł����Agpmatprmt���߂́A"filename"�Ŏw�肳�ꂽ�t�@�C�����e�N�X�`���摜�Ƃ��Đݒ肵�܂��B
sampler2D�^�̃p�����[�^�[���V�F�[�_�[�ɓn���ꍇ�Ɏg�p���邱�Ƃ��ł��܂��B
opt�p�����[�^�[�ɁAGPOBJ_MATOPT_NOMIPMAP���w�肵���ꍇ�́AMIPMAP�𐶐����܂���B
�܂��Aopt�p�����[�^�[�ɁAGPOBJ_MATOPT_CUBEMAP���w�肵���ꍇ�́A�e�N�X�`�����L���[�u�}�b�v�Ƃ��Ĉ����܂��B
�L���[�u�}�b�v�́A6�ʕ����̉摜���܂Ƃ߂�����Ȍ`���Ŋ��}�b�v��X�J�C�{�b�N�X�Ȃǂɗ��p���邱�Ƃ��ł��܂��B
(�L���[�u�}�b�v�摜�́A+X,-X,+Y,-Y,+Z,-Z������6�摜���c�ɘA������1����.PNG�`�����g�p���Ă��������B)

%href
gpmatprm
gpmatprm1
gpmatprm4



%index
gpusershader
���[�U�[�V�F�[�_�[�̎w��
%group
�g����ʐ��䖽��
%prm
"vsh","fsh","defs"
"vsh"     : �o�[�e�b�N�X�V�F�[�_�[�t�@�C����
"fsh"     : �t���O�����g�V�F�[�_�[�t�@�C����
"defs"    : �ǉ��̃��x����`
%inst
���[�U�[���Ǝ��ɐݒ肷�邽�߂̃V�F�[�_�[���w�肵�܂��B
�o�[�e�b�N�X�V�F�[�_�[�A�t���O�����g�V�F�[�_�[�y�ђǉ��̃��x����`���L�q���āA�g�p���邱�Ƃ��ł��܂��B
�w�肳�ꂽ�V�F�[�_�[�́Agpusermat�̃f�t�H���g�l�Ƃ��āAbuffer���߂ɂ��X�N���[���o�b�t�@�̃J�X�^���V�F�[�_�[�w�莞�ɎQ�Ƃ���܂��B
%href
buffer
gpusermat


%index
gpgetmat
�}�e���A��ID�̎擾
%group
�g����ʐ��䖽��
%prm
var,id,opt
var    : �}�e���A��ID����������ϐ�
id(0)  : �Q�Ƃ����ID
opt(0) : �擾�I�v�V����
%inst
�w�肳�ꂽ�I�u�W�F�N�g�A�y�щ�ʃo�b�t�@�Ŏg�p����Ă���J�X�^���}�e���A����ID���擾���܂��B
opt�p�����[�^�[�Ŏ擾�I�v�V�������w�肵�܂��Bopt�Ŏw��ł���l�͈ȉ��̒ʂ�ł��B^p
        �}�N����                   �l     ���e
    ----------------------------------------------------------------------------
	GPGETMAT_OPT_OBJMAT        0      �I�u�W�F�N�g�����J�X�^���}�e���A��
	GPGETMAT_OPT_SCRMAT        1      ��ʃo�b�t�@�����J�X�^���}�e���A��
^p
GPGETMAT_OPT_OBJMAT���w�肵���ꍇ�́Aid�p�����[�^�[�ɃI�u�W�F�N�gID���w�肷�邱�ƂŁA�I�u�W�F�N�g�����J�X�^���}�e���A����ID���擾���邱�Ƃ��ł��܂��B
GPGETMAT_OPT_SCRMAT���w�肵���ꍇ�́Aid�p�����[�^�[�ɉ�ʃo�b�t�@ID���w�肷�邱�ƂŁA���ꂼ��̉�ʃo�b�t�@�����J�X�^���}�e���A����ID���擾���邱�Ƃ��ł��܂��B


%href
buffer
gpmatprm
gpmatprm1
gpmatprm4
gpmatprm16


%index
setquat
quat�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z,w
id      : �I�u�W�F�N�gID
(x,y,z,w) : �ݒ肷��l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎���]�p�����[�^�[��ݒ肵�܂��B
quat�O���[�v(�N�H�[�^�j�I��)��(x,y,z,w)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z,w)�́A�N�H�[�^�j�I��(�l����)�ɂ��ݒ���s�Ȃ��܂��BHGIMG4�����ł́A���ׂẲ�]���́A�N�H�[�^�j�I���ɂ��ێ�����Ă��܂��B

%href
getquat


%index
getquat
quat�O���[�v�����擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z,w
id      : �I�u�W�F�N�gID
(x,y,z,w) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎���]�p�����[�^�[���擾���܂��B
quat�O���[�v(�N�H�[�^�j�I��)�̓��e��(x,y,z,w)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z,w)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
HGIMG4�����ł́A���ׂẲ�]���́A�N�H�[�^�j�I���ɂ��ێ�����Ă��܂��B
�p�x���ɕϊ�����ꍇ�́Agetang�܂���getangr���߂����g�p���������B
�������A��]�������S�ɍČ��ł��Ȃ��ꍇ������܂��̂ŁA�p�x���ɕϊ�����ꍇ�͒��ӂ��Ă��������B

%href
getang
getangr
setquat



%index
event_suicide
�I�u�W�F�N�g�j���C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
p1
p1    : �C�x���gID
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�I�u�W�F�N�g�j���C�x���g��ǉ����܂��B
���̖��߂́Aevent_delobj�Ɠ����Ɏg�p���邱�Ƃ��ł��܂��B
%href
event_delobj


%index
gpsetprmon
�I�u�W�F�N�g�̃R�A�p�����[�^�[�ݒ�(�r�b�g�ǉ�)
%group
�g����ʐ��䖽��
%prm
objid,prmid,value
objid(0) : �I�u�W�F�N�gID
prmid(0) : �R�A�p�����[�^�[ID
value(0) : �ݒ肷��l(�����l)
%inst
�I�u�W�F�N�g���Ƃɕێ�����Ă���R�A�p�����[�^�[�̒l���Avalue�Őݒ肳��Ă���r�b�g�̂�ON�ɐݒ肵�܂��B
(���Ƃ��Ƃ̃R�A�p�����[�^�[�l��value�̒l��OR�ō������܂�)
����́A���[�h�t���O�l�Ȃǃr�b�g�P�ʂŐݒ肪�K�v�ȃp�����[�^�[�ɁA�V�����r�b�g��ǉ�����ꍇ�ȂǂɎg�p���邱�Ƃ��ł��܂��B

�R�A�p�����[�^�[�́A32bit�����l�ŁA�l�X�ȏ����Ǘ����Ă��܂��B
�R�A�p�����[�^�[ID�Ƃ��Ďw��\�ȍ��ڂ͈ȉ��̒ʂ�ł��B
^p
	�}�N����             | ���e
	--------------------------------------------------------------
	PRMSET_FLAG            �I�u�W�F�N�g�o�^�t���O(*)
	PRMSET_MODE            ���[�h�t���O�l
	PRMSET_ID              �I�u�W�F�N�gID(*)
	PRMSET_ALPHA           �����x(���l)
	PRMSET_TIMER           �^�C�}�[�l
	PRMSET_MYGROUP         ���g�̃R���W�����O���[�v
	PRMSET_COLGROUP        �Փˌ��o����R���W�����O���[�v
	PRMSET_SHAPE           �`��ID(*)
	PRMSET_USEGPMAT        �}�e���A��ID(*)
	PRMSET_COLILOG         �R���W�������OID(*)
	PRMSET_FADE            �t�F�[�h�p�����[�^�[
	PRMSET_SPRID           �\�[�X�o�b�t�@ID(�X�v���C�g�̂�)
	PRMSET_SPRCELID        �\�[�X�̃Z��ID(�X�v���C�g�̂�)
	PRMSET_SPRGMODE        �R�s�[���[�h(�X�v���C�g�̂�)

	(*)�̍��ڂ͓ǂݏo���̂�
^p
%href
gpgetprm
gpsetprm
gpsetprmoff



%index
gpsetprmoff
�I�u�W�F�N�g�̃R�A�p�����[�^�[�ݒ�(�r�b�g�폜)
%group
�g����ʐ��䖽��
%prm
objid,prmid,value
objid(0) : �I�u�W�F�N�gID
prmid(0) : �R�A�p�����[�^�[ID
value(0) : �ݒ肷��l(�����l)
%inst
�I�u�W�F�N�g���Ƃɕێ�����Ă���R�A�p�����[�^�[�̒l���Avalue�Őݒ肳��Ă���r�b�g�̂�OFF�ɐݒ肵�܂��B
(���Ƃ��Ƃ̃R�A�p�����[�^�[�l����value�Ŏw�肳�ꂽ�r�b�g���������܂�)
����́A���[�h�t���O�l�Ȃǃr�b�g�P�ʂŐݒ肪�K�v�ȃp�����[�^�[����A����̃r�b�g���폜����ꍇ�ȂǂɎg�p���邱�Ƃ��ł��܂��B

�R�A�p�����[�^�[�́A32bit�����l�ŁA�l�X�ȏ����Ǘ����Ă��܂��B
�R�A�p�����[�^�[ID�Ƃ��Ďw��\�ȍ��ڂ͈ȉ��̒ʂ�ł��B
^p
	�}�N����             | ���e
	--------------------------------------------------------------
	PRMSET_FLAG            �I�u�W�F�N�g�o�^�t���O(*)
	PRMSET_MODE            ���[�h�t���O�l
	PRMSET_ID              �I�u�W�F�N�gID(*)
	PRMSET_ALPHA           �����x(���l)
	PRMSET_TIMER           �^�C�}�[�l
	PRMSET_MYGROUP         ���g�̃R���W�����O���[�v
	PRMSET_COLGROUP        �Փˌ��o����R���W�����O���[�v
	PRMSET_SHAPE           �`��ID(*)
	PRMSET_USEGPMAT        �}�e���A��ID
	PRMSET_COLILOG         �R���W�������OID(*)
	PRMSET_FADE            �t�F�[�h�p�����[�^�[
	PRMSET_SPRID           �\�[�X�o�b�t�@ID(�X�v���C�g�̂�)
	PRMSET_SPRCELID        �\�[�X�̃Z��ID(�X�v���C�g�̂�)
	PRMSET_SPRGMODE        �R�s�[���[�h(�X�v���C�g�̂�)

	(*)�̍��ڂ͓ǂݏo���̂�
^p
%href
gpgetprm
gpsetprm
gpsetprmon



%index
setangy
ang�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
setang���߂Ɠ��l�̋@�\�������Ă��܂����A��]�̏��Ԃ�Y->X->Z�ƂȂ�܂��B

%href
setang
setangz
setangr


%index
setangz
ang�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
setang���߂Ɠ��l�̋@�\�������Ă��܂����A��]�̏��Ԃ�Z->Y->X�ƂȂ�܂��B

%href
setang
setangy
setangr


%index
event_angy
ang�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,x1,y1,z1,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
(x1,y1,z1) : �ݒ肳���l
sw(0)      : ��ԃI�v�V����

%inst
event_ang���߂Ɠ��l�̋@�\�������Ă��܂����A��]�̏��Ԃ�Y->X->Z�ƂȂ�܂��B

%href
event_ang
event_angz
event_angr


%index
event_angz
ang�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,x1,y1,z1,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
(x1,y1,z1) : �ݒ肳���l
sw(0)      : ��ԃI�v�V����

%inst
event_ang���߂Ɠ��l�̋@�\�������Ă��܂����A��]�̏��Ԃ�Z->Y->X�ƂȂ�܂��B

%href
event_ang
event_angy
event_angr


%index
event_setangy
ang�O���[�v�ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,x1,y1,z1,x2,y2,z2
id         : �C�x���gID
(x1,y1,z1) : �ݒ肳���l(�����l)
(x2,y2,z2) : �ݒ肳���l(����l)
%inst
event_setang���߂Ɠ��l�̋@�\�������Ă��܂����A��]�̏��Ԃ�Y->X->Z�ƂȂ�܂��B

%href
event_setang
event_setangz
event_setangr


%index
event_setangz
ang�O���[�v�ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,x1,y1,z1,x2,y2,z2
id         : �C�x���gID
(x1,y1,z1) : �ݒ肳���l(�����l)
(x2,y2,z2) : �ݒ肳���l(����l)
%inst
event_setang���߂Ɠ��l�̋@�\�������Ă��܂����A��]�̏��Ԃ�Z->Y->X�ƂȂ�܂��B

%href
event_setang
event_setangy
event_setangr


%index
gpresetlight
�J�����g���C�g�̏�����
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=1�`9(1) : �f�B���N�V���i�����C�g�̌�
p2=0�`9(0) : �|�C���g���C�g�̌�
p3=0�`9(0) : �X�|�b�g���C�g�̌�
%inst
�g�p���郉�C�g�̎�ʂƂƂ��ɃJ�����g���C�g�����������܂��B
�J�����g���C�g��ݒ肵�Ă������ƂŁA�ȍ~�ɐ������ꂽ���f����}�e���A�����󂯂郉�C�g�̏ڍׂ����߂邱�Ƃ��ł��܂��B
�V�[�������������ꂽ��Ԃł́A�f�B���N�V���i�����C�g1������ݒ�ł����ԂɂȂ��Ă��܂��B�����̃��C�g��A�|�C���g���C�g�A�X�|�b�g���C�g�Ȃǂ��g�p����ꍇ�́Agpresetlight���߂ɂ���ăJ�����g���C�g�̌������炩���ߌ��߂Ă����K�v������܂��B
p1,p2,p3�p�����[�^�[�ŁA���ꂼ��̃��C�g��ʂ��g�p���郉�C�g�̍ő�����w�肵�܂��B�f�B���N�V���i�����C�g�͍Œ�ł�1�g�p����K�v������܂��B
����ȊO�̃|�C���g���C�g�A�X�|�b�g���C�g�͕K�v�ɉ����Ďw�肵�Ă��������BGPU�̌v�Z���ׂɂȂ��邽�߁A�ł��邾���s�v�ȃ��C�g�͎w�肵�Ȃ��悤�ɂ��Ă��������B
�J�����g���C�g�����������ꂽ��́Agpuselight���߂ɂ��o�^���邱�Ƃ��ł��܂��B

%href
gpuselight
gplight


%index
setobjlight
�I�u�W�F�N�g�ɃJ�����g���C�g��ݒ�
%group
�g����ʐ��䖽��
%prm
id
id      : �I�u�W�F�N�gID
%inst
id�Ŏw�肵���I�u�W�F�N�g�ɃJ�����g���C�g�̐ݒ���s���܂��B
id�Ŏw�肵���I�u�W�F�N�g�́A�����v�Z���s��3D���f���ł���K�v������܂��B
����܂ŃI�u�W�F�N�g�ɐݒ肳��Ă������C�g�̐ݒ�͔j������A�V�����J�����g���C�g�̐ݒ肪�㏑������܂��B
�������A3D���f�����������ꂽ���_�̃J�����g���C�g�̐ݒ�(�f�B���N�V���i�����C�g�A�|�C���g���C�g�A�X�|�b�g���C�g�̌�)�͕ύX����܂���̂Œ��ӂ��Ă��������B(�K���A�J�����g���C�g�Ɋ܂܂�郉�C�g�̌�������̂��̂�ݒ肷��悤�ɂ��Ă��������B)
%href
gpuselight
gpresetlight


%index
gppcontact
�I�u�W�F�N�g�̕����Փˏ����쐬����
%group
�g����ʐ��䖽��
%prm
var,objid
var      : ���ʂ���������ϐ�
objid(0) : �I�u�W�F�N�gID
%inst
�����ݒ���s�Ȃ���3D�I�u�W�F�N�g�̐��m�ȏՓ˂̏����쐬���܂��B
objid�Ŏw�肳�ꂽ3D�I�u�W�F�N�g�����̃I�u�W�F�N�g�ɏՓ˂����ۂ̏������ׂč쐬���܂��B
objid�Ŏw�肳�ꂽ3D�I�u�W�F�N�g�́A�K��gppbind���߂ɂ�蕨���ݒ���s���Ă����K�v������܂��B
�܂��Asetcoli���߂ɂ��Փ˂����m����ΏۂƂȂ�I�u�W�F�N�g�̃R���W�����O���[�v��K�؂ɐݒ肵�Ă����K�v������܂��B
var�Ŏw�肳�ꂽ�ϐ��ɂ͏Փˏ�񂪍쐬���ꂽ���������l�Ƃ��đ������܂��B
�G���[�����������ꍇ�́A�}�C�i�X�l���������܂��B
�Փˏ��͕����쐬����邱�Ƃ�����܂��B����́A�����̃I�u�W�F�N�g�Ɠ����ɏՓ˂��邱�Ƃ����邽�߂ł��B�ϐ���0��������ꂽ�ꍇ�́A�Փ˂��Ă���I�u�W�F�N�g���Ȃ����Ƃ������܂��B
���ۂ̏Փˏ��́Agppinfo���߂ɂ��擾���邱�Ƃ��ł��܂��B�Փˏ��Ƃ��āA�Փ˂����Ώۂ̃I�u�W�F�N�gID�A�Փ˂������W�A�Փ˂̋����Ȃǂ��擾���邱�Ƃ��ł��܂��B
�Փˏ��̓I�u�W�F�N�gID���Ƃɍ쐬����A�V����gppcontact���߂����s����܂ł͕ێ�����܂��B
gppcontact���߂́A���������̉ߒ��Ŕ��������Փ˂̏ڍׂ𓾂邽�߂̖��߂ł��B�ȈՓI�ȏՓ˂�m�邾���ł���΁Agetcoli���߂��ւŗ��p���邱�Ƃ��Ă��܂��B
�܂��A�����܂ł����������ňړ����s�����ۂɏՓ˂���(���̃I�u�W�F�N�g�ɂ߂荞��)�Ƃ����������Ƃɂ��Ă��邽�߁A���S�ɓ����̂Ȃ����(�P�ɐڂ��Ă��邾���̏��)�ł͏Փˏ�񂪍쐬����Ȃ��̂Œ��ӂ��Ă��������B
%href
gppbind
gppinfo
getcoli
setcoli
gppraytest


%index
gppinfo
�I�u�W�F�N�g�̕����Փˏ����擾����
%group
�g����ʐ��䖽��
%prm
fv,var,objid,index
fv       : FV�l����������ϐ���
var      : �Փ˂����I�u�W�F�N�gID�l����������ϐ���
objid(0) : �I�u�W�F�N�gID
index(0) : �C���f�b�N�X�l
%inst
gppcontact���߂ɂ���č쐬���ꂽ�I�u�W�F�N�g�̕����Փˏ����擾���܂��B�K���Agppcontact���߂��Ɏ��s���Ă����K�v������܂��B
objid�ɂ��w�肳�ꂽ3D�I�u�W�F�N�g�̕����Փˏ���var��fv�Ŏw�肵���ϐ��ɑ�����܂��B�ϐ��ɂ͈ȉ��̓��e���i�[����܂��B
^p
    �ϐ�                 | ����������e
    --------------------------------------------------------------
	var                    �Փ˂����I�u�W�F�N�gID
    fv(0)                  �Փ˂���X���W
    fv(1)                  �Փ˂���Y���W
    fv(2)                  �Փ˂���Z���W
    fv(3)                  �Փ˂�������
^p
gppcontact���߂ɂ�茟�o���ꂽ�Փˏ�񂪕�������ꍇ�́A0����n�܂�C���f�b�N�X�l�ɂ���Ď��ʂ��܂��B
3�̏Փˏ�񂪂���ꍇ�́A�C���f�b�N�X�l��0�`2���w�肷�邱�Ƃ��ł��܂��B
����������ɏI�������ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B�G���[�����������ꍇ�́A�V�X�e���ϐ�stat�Ƀ}�C�i�X�l���������܂��B
%href
gppcontact


%index
gppraytest
�x�N�g����̕����Փˏ����擾����
%group
�g����ʐ��䖽��
%prm
var,objid,distance
var      : ���o�����I�u�W�F�N�gID�l����������ϐ���
objid(0)      : �I�u�W�F�N�gID
distance(100) : �x�N�g���̒���
%inst
�����ݒ���s�Ȃ���3D�I�u�W�F�N�g�̒��ŁA�w�肵�������ɏՓ˂���I�u�W�F�N�g�̏����擾���܂��B
objid�Ŏw�肵��3D�m�[�h�����I�u�W�F�N�g����_�Ƃ��āA�I�u�W�F�N�g�̌����Ă����������distance�Ŏw�肳�ꂽ�����̊Ԃōŏ��ɏՓ˂���3D�I�u�W�F�N�g�̃I�u�W�F�N�gID�𒲍����܂��B
objid�Ŏw�肳���I�u�W�F�N�g�́A�����ݒ肳��Ă���K�v�͂���܂���B�J������null�m�[�h���ł����Ă���肠��܂���B
var�Ŏw�肳�ꂽ�ϐ��Ɍ��ʂ��������܂��B���炩�̃G���[�����������ꍇ�́A�}�C�i�X�l���������܂��B
�����ɏՓ˂���I�u�W�F�N�g���������ꍇ�́A���̃I�u�W�F�N�gID���������܂��B�����Փ˂���I�u�W�F�N�g���Ȃ������ꍇ�́A0���������܂��B
�Փ˂��������ꍇ�́A�����objid�Ŏw�肳�ꂽ�I�u�W�F�N�g�̃m�[�h���[�N�l(work,work2)�ɏڍׂȏ�񂪊i�[����܂��B
�m�[�h���[�N�l�́Agetwork�y��getwork2���߂ɂ��擾���邱�Ƃ��ł��܂��B���ꂼ��ɐݒ肳�����e�͈ȉ��̒ʂ�ł��B
^p
	�m�[�h���[�N�l       | �ݒ肳�����e
	--------------------------------------------------------------
	work                   �Փ˂���������X,Y,Z���W
	work2                  �Փ˂����ʂ̖@���x�N�g��X,Y,Z�l
^p
gppraytest���߂́A�����ݒ肳�ꂽ�I�u�W�F�N�g���ׂĂ��Փ˂̑ΏۂƂȂ�܂��B�R���W�����O���[�v�̐ݒ�͍l������܂���B
%href
gppcontact
getcoli
getwork
getwork2


%index
event_fade
�t�F�[�h�ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,fade
id         : �C�x���gID
fade(0)    : �ݒ肳���l
%inst
�I�u�W�F�N�g�̃t�F�[�h�l��ݒ肷��C�x���g��ǉ����܂��B
�t�F�[�h�Ƀ}�C�i�X�l���w�肷�邱�ƂŃ��l��0�Ɍ����ăt�F�[�h�A�E�g�A�v���X�l���w�肷�邱�ƂŃ��l��255�Ɍ����ăt�F�[�h�C�������邱�Ƃ��ł��܂��B
event_prmset���߂�PRMSET_FADE�p�����[�^�[�ɐݒ肷�邱�ƂƓ����ł��B
%href
event_prmset


%index
gpmesh
3D���b�V���[�m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,color,matobj
var     : �������ꂽ�I�u�W�F�N�gID����������ϐ���
color(-1)  : �}�e���A���J���[(24bitRGB�l)
matobj(-1) : �}�e���A��ID
%inst
���R�Ȍ`���3D���f���Ƃ��Ē�`�������̂��m�[�h�I�u�W�F�N�g�Ƃ��Đ������܂��B
���炩���߁Agpmeshclear�Agpmeshadd�Agpmeshpolygon���̖��߂��g�p���āA�J�X�^��3D���b�V���ƌĂ΂�郂�f�������\�z����K�v������܂��B
gpbox��gpplate�̂悤�ȒP���ȃ��f���ł͂Ȃ��A���R�ɕ��G�Ȍ`����`���邱�Ƃ��ł��܂����A���_���W��@���x�N�g����1��1���`����K�v�����邽�߁A�㋉�Ҍ����̋@�\�ƍl���Ă��������B
�ʏ��3D���f���f�[�^��.gpb�t�@�C���Ƃ��ėp�ӂ������̂������p���������B
^
�J�X�^��3D���b�V���́A�ȉ��̂悤�Ȏ菇�ō쐬���邱�Ƃ��ł��܂��B
^p
	1. gpmeshclear���߂ŃJ�X�^��3D���b�V��������������
	2. gpmeshadd���߂ŕK�v�Ȓ��_����o�^����
	3. gpmeshpolygon���߂ɂ�蒸�_����g�ݍ��킹��3�p�`�܂���4�p�`�̖ʂ��\������
	4. �K�v�Ȗʂ����ȏ�̓o�^���J��Ԃ�
^p
gpmesh���߂́A�쐬���ꂽ�J�X�^��3D���b�V���̏������ƂɁA�o�^����Ă��邷�ׂĂ̖ʂ��g�p�������f���𐶐����܂��B
���_���ɂ́AX,Y,Z���W�A�@���x�N�g���A�e�N�X�`��UV���W�Ȃǂ�o�^���邱�Ƃ��\�ł��B������K�؂ɐݒ肷�邱�ƂŁA���R�Ȍ`����`���邱�Ƃ��ł��܂��B
�J�X�^��3D���b�V���́A���x�ł��Ē�`���ĈقȂ郂�f���`���o�^���邱�Ƃ��\�ł��B
^
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�I�u�W�F�N�g��gpload���߂ɂ��ǂݍ��܂ꂽ3D���f���Ɠ��l�ɑ��삷�邱�Ƃ��ł��܂��B
color�p�����[�^�[�Ń��f���S�̂̐F(�}�e���A���J���[)��24bitRGB�l(0xRRGGBB�Ŏ������l)�ɂ��w�肵�܂��B
color�p�����[�^�[���ȗ����ꂽ�ꍇ�́A���F(0xffffff)���g�p����܂��B
matobj�p�����[�^�[�ŁA�}�e���A��ID���w�肷�邱�Ƃ��ł��܂��B
gpcolormat���߂Ȃǂɂ��A���[�U�[�����������}�e���A�����g�p����ꍇ�͎w�肵�Ă��������B
matobj�p�����[�^�[���ȗ����ꂽ�ꍇ�́A�W���̃}�e���A�����g�p����܂��B

%href
gpmeshclear
gpmeshpolygon
gpmeshadd


%index
gpmeshclear
�J�X�^��3D���b�V����������
%group
�g����ʐ��䖽��
%inst
�J�X�^��3D���b�V���̓o�^�������������܂��B
�J�X�^��3D���b�V���́A���R��3D�`����`���邽�߂̃f�[�^���\�z����d�g�݂ł��B
���ۂ̃f�[�^�o�^�́Agpmeshadd�Agpmeshpolygon���߂��g�p���܂��B
�\�z�����f�[�^�́Agpmesh���߂Ńm�[�h�I�u�W�F�N�g�Ƃ��ēo�^���邱�Ƃ��ł��܂��B
%href
gpmesh
gpmeshpolygon
gpmeshadd


%index
gpmeshadd
�J�X�^��3D���b�V���ɒ��_����ǉ�
%group
�g����ʐ��䖽��
%prm
var,x,y,z,nx,ny,nz,u,v
var     : �������ꂽ���b�V�����_ID����������ϐ���
x(0)    : X���W(����)
y(0)    : Y���W(����)
z(0)    : Z���W(����)
nx(0)   : �@���x�N�g��X(����)
ny(0)   : �@���x�N�g��Y(����)
nz(0)   : �@���x�N�g��Z(����)
u(0)    : �e�N�X�`�����_���WX(����)
v(0)    : �e�N�X�`�����_���WY(����)
%inst
�J�X�^��3D���b�V���ɒ��_����ǉ��o�^���܂��B
���_���́AX,Y,Z���W�A�@���x�N�g���A�e�N�X�`��UV���W��1�̃Z�b�g�Ƃ��ēo�^���܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�o�^���ꂽ���b�V�����_ID���������܂��B���b�V�����_ID�́A��(3�p�`,4�p�`)���\������ۂɎg�p���܂��B
���ɓo�^����Ă��钸�_���̏ꍇ�́A�ߋ��ɓo�^���ꂽ���b�V�����_ID���������A�d�����ēo�^�͍s���܂���B���_���͍ő��32767�܂œo�^���邱�Ƃ��\�ł��B
^
(X,Y,Z)���W��3D��ԏ�̒��_�������܂��B
�@���x�N�g��(X,Y,Z)�͒��_�������Ă������(�x�N�g��)�𐳋K���������̂������܂��B�@���x�N�g���́A�����v�Z���s���ۂɕK�v�ƂȂ�܂��B
�e�N�X�`�����_���W(X(u),Y(v))�́A�e�N�X�`����\��ۂɎQ�Ƃ������W���w�肵�܂��B���_(0.0, 0.0)���痼�[(1.0, 1.0)�܂ł̐��K�����ꂽ�l�ƂȂ�܂��B�}�e���A���Ƃ��ăe�N�X�`����\��ۂɕK�v�ƂȂ�܂��B
^
�J�X�^��3D���b�V�����`����ꍇ�́A�ŏ��ɕK��gpmeshclear���߂œo�^�����N���A���Ă����K�v������܂��B
���ۂɒ��_����g�ݍ��킹�Ė�(3�p�`,4�p�`)��o�^����ꍇ�́Agpmeshpolygon���߂��g�p���܂��B
�\�z�����f�[�^�́Agpmesh���߂Ńm�[�h�I�u�W�F�N�g�Ƃ��ēo�^���邱�Ƃ��ł��܂��B
%href
gpmeshclear
gpmeshpolygon
gpmesh


%index
gpmeshpolygon
�J�X�^��3D���b�V���ɖʏ���ǉ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1(0)   : ���b�V�����_ID1
p2(0)   : ���b�V�����_ID2
p3(0)   : ���b�V�����_ID3
p4(-1)  : ���b�V�����_ID4
%inst
�J�X�^��3D���b�V���ɖ�(�|���S��)����ǉ��o�^���܂��B
���炩���߁Agpmeshadd���߂ɂ��K�v�Ȓ��_����o�^���Ă����K�v������܂��B
���_���̃C���f�b�N�X���������b�V�����_ID��g�ݍ��킹�āA��(3�p�`,4�p�`)���\�����܂��B
3�p�`�̏ꍇ�́Ap1,p2,p3�p�����[�^�[�A4�p�`�̏ꍇ�́Ap1,p2,p3,p4�p�����[�^�[�Ƀ��b�V�����_ID���w�肵�Ă��������B���_���w�肷�鏇�Ԃ́Ap1,p2,p3��3�p�`�����v���ɕ��Ԃ悤�ɔz�u���Ă��������B(4�p�`�̏ꍇ�́A�c���1���_���Ō�ɒǉ����Ă�������)
^
�\�z�����f�[�^�́Agpmesh���߂Ńm�[�h�I�u�W�F�N�g�Ƃ��ēo�^���邱�Ƃ��ł��܂��B
%href
gpmeshclear
gpmeshadd
gpmesh


%index
gpnodeinfo
3D���f���̊K�w�����擾����
%group
�g����ʐ��䖽��
%prm
var,objid,option,"name"
var       : ���ʂ���������ϐ���
objid(0)  : �I�u�W�F�N�gID
option(0) : ���b�V�����_ID1
name      : �K�w�m�[�h��
%inst
gpload���߂œǂݍ��܂ꂽ3D���f���̊K�w�����擾���āAvar�Ŏw�肳�ꂽ�ϐ��Ɍ��ʂ������܂��B
objid�Ŏw�肵��3D���f�������K�w�𖼑O�ɂ���Ďw�肷�邱�ƂŌʂ̃m�[�h����肵�܂��B
(�K�w�̖��O(�m�[�h��)�́A3D���f���쐬���ɂ��炩���ߕt�����Ă��܂��B���ׂĂ̊K�w���擾����ۂɂ́Amod_gputil���W���[����gptree_get���߂����g�p���������B)
option�l�ɂ��A�������錋�ʂ�I�����邱�Ƃ��ł��܂��Boption�l�Ɏw��ł���l�́A�ȉ��̒ʂ�ł��B
^p
	�I�v�V�����l          | �擾�������e
	--------------------------------------------------------------
	GPNODEINFO_NODE         �Y������m�[�h�������I�u�W�F�N�gID
	GPNODEINFO_MODEL        �Y�����郂�f���m�[�h�������I�u�W�F�N�gID
	GPNODEINFO_NAME         �Y������m�[�h��(*)
	GPNODEINFO_CHILD        �K�w�����q�̃m�[�h��(*)
	GPNODEINFO_SIBLING      �����K�w�ɂ���ׂ̃m�[�h��(*)
	GPNODEINFO_SKINROOT     �X�L�����b�V���������Ă���m�[�h��(*)

    (*) ���ʂ̕����񂪑������܂�
^p
GPNODEINFO_NODE���w�肵���ꍇ�́A�w�肳�ꂽ���O�����K�w���������ʂȃI�u�W�F�N�gID�̒l���������܂��B
���̃I�u�W�F�N�gID���g�p���āAgetpos�Agetang�Agetquat�Ȃǂ��ꂼ��̊K�w�������W���]�����擾���邱�Ƃ��ł��܂��B
GPNODEINFO_MODEL���w�肵���ꍇ�́A�`�悷�郂�f�����������K�w�̂݃I�u�W�F�N�gID���擾����܂��B
GPNODEINFO_CHILD�AGPNODEINFO_SIBLING�AGPNODEINFO_SKINROOT�̃I�v�V�����́A���̊K�w�Ƃ̌q������擾���܂��B����ɂ��A�m�[�h�̊K�w�𒲂ׂ邱�Ƃ��ł��܂��B
����������ɏI�������ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B�G���[�����������ꍇ�́A�V�X�e���ϐ�stat�Ƀ}�C�i�X�l���������܂��B

%href
gpload



