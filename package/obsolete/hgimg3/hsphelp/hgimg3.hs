;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;
%type
�g������
%ver
3.5
%note
hgimg3.as���C���N���[�h���邱�ƁB
%date
2017/05/29
%author
onitama
%dll
hgimg3
%url
http://www.onionsoft.net/
%port
Win
%portinfo
Windows+DirectX8�ȍ~�̃V�X�e����ł̂ݓ��삵�܂��B

%index
hgini
�v���O�C���̏�����
%group
�g����ʐ��䖽��
%prm
yofs,ysize
yofs    : �L���X�N���[���͈͂��c��+yofs�������炷
ysize   : �L���X�N���[���͈͂��c��ysize�Ƃ���
%inst
HGIMG3�̏��������s�Ȃ��܂��B
�ŏ��ɕK�������������Ă���HGIMG3�̊e���߂��g�p���Ȃ���΂Ȃ�܂���B
hgini���߂����s���ꂽ���_�ł̕`���(�E�B���h�EID)���\����Ƃ��ēo�^����܂��B
�܂����̎��_�ł̉�ʏ��������[�h(�E�B���h�E���[�h���t���X�N���[�����[�h��)�ɂ���āAHGIMG3�̕`�惂�[�h�����킹�Đݒ肳��܂��B
yofs,ysize�̎w�肪�ȗ�����邩0�̏ꍇ�̓E�B���h�E�S�̂��`��ΏۂɂȂ�܂��B
%href
hgbye
hgreset


%index
hgreset
�V�[�����̏�����
%group
�g����ʐ��䖽��
%prm
%inst
�V�[���̏��̏��������s�Ȃ��܂��B
���ׂẴ��f���A�I�u�W�F�N�g�A�e�N�X�`���A�C�x���g���X�g�̏��͔j������A�܂������V�����V�[���̏�Ԃɖ߂��܂��B
%href
hgini
hgbye


%index
hgbye
�v���O�C���̉��
%group
�g����ʐ��䖽��
%prm

%inst
HGIMG3�̉�����s�Ȃ��܂��B
�v���O�����̏I�����Ɏ����I�Ɏ��s�����̂ŁA�ʏ�͖�������K�v�͂���܂���B
%href
hgini


%index
hgdraw
�`��̎��s
%group
�g����ʐ��䖽��
%prm
p1
p1(0) : ���[�h
%inst
�I�u�W�F�N�g�̑S�`�揈�������s���܂��B
�f�t�H���g�ł́A���ׂẴI�u�W�F�N�g�`����s�Ȃ���ʂ��X�V���܂��B
hgdraw�́A�K��hgsync�Ƒ΂ɂ��Ďg�p����K�v������܂��B
���hgdraw���߂ŕ`����s�Ȃ��A�Ō��hgsync�ő҂����Ԃ�����悤�ɂ��Ă��������B
p1�Ń��[�h�̎w����s�Ȃ����Ƃ��ł��܂��B
^p
���[�h  ���e
-----------------------------------------------
1       �`��G���A�𔽉f����
2       Object�̕`����s�Ȃ�Ȃ�
4       ��ʂ̏��������s�Ȃ�Ȃ�
^p
���[�h�l�́A���Z���邱�Ƃŕ����w�肷�邱�Ƃ��\�ł��B
����ɂ��A�P�̉�ʓ���`��G���A���Ƃɕ`�悷�邱�Ƃ��\�ɂȂ�܂��B

%href
hgini
hgsync
hgview


%index
hgsync
���ԑ҂����s�Ȃ�
%group
�g����ʐ��䖽��
%prm
val
val : �҂�����
%inst
val�Ŏw�肵������(ms)�����E�F�C�g�����܂��B
hgsync�́A�K��hgdraw�Ƒ΂ɂ��Ďg�p����K�v������܂��B
���hgdraw���߂ŕ`����s�Ȃ��A�Ō��hgsync�ő҂����Ԃ�����悤�ɂ��Ă��������B
�V�X�e���ϐ�stat�ɁAHGIMG3�ɂ�镉��(�����ɂ��������~���b�P�ʂ̎���)�������܂��B


%href
getsync
hgdraw


%index
hgsetreq
�V�X�e�����N�G�X�g�ݒ�
%group
�g����ʐ��䖽��
%prm
type,val
type : �ݒ�^�C�v(SYSREQ_???)
val  : �ݒ肷��l
%inst
HGIMG3�ɑ΂��ėl�X�ȃV�X�e���ݒ���s�Ȃ��܂��B
type�l�Ŏw��ł���͈̂ȉ��̃V���{���ł��B
^p
	�V���{����        ���e
-----------------------------------------------
	SYSREQ_MAXMODEL   ���f���ő吔
	SYSREQ_MAXOBJ     �I�u�W�F�N�g�ő吔
	SYSREQ_MAXTEX     �e�N�X�`���ő吔
	SYSREQ_DXMODE     �t���X�N���[�����[�h�X�C�b�`
	SYSREQ_DXHWND     �E�B���h�E�n���h��(�Q�Ƃ̂�)
	SYSREQ_DXWIDTH    �t���X�N���[�����[�h���̉��T�C�Y
	SYSREQ_DXHEIGHT   �t���X�N���[�����[�h���̏c�T�C�Y
	SYSREQ_COLORKEY   �e�N�X�`���o�^���̓����F�R�[�h
	SYSREQ_RESVMODE   �G���[�������̌����R�[�h(�Q�Ƃ̂�)
	SYSREQ_MAXEVENT   �C�x���g�ő吔
	SYSREQ_MDLANIM    ���f��������̃A�j���[�V�����ő吔
	SYSREQ_CALCNORMAL X�t�@�C�����f���@���Čv�Z�X�C�b�`
	SYSREQ_2DFILTER   2D�`�掞�̃e�N�X�`����ԃ��[�h
	SYSREQ_3DFILTER   3D�`�掞�̃e�N�X�`����ԃ��[�h
	SYSREQ_OLDCAM     �J�����������[�h�̓���
	SYSREQ_QUATALG    X�t�@�C�����f���A�j���[�V������ԃ��[�h
	SYSREQ_DXVSYNC    �t���X�N���[�����[�h����VSYNC�҂����[�h
	SYSREQ_DEFTIMER   hgsync�̎��ԑ҂����[�h(0=HGIMG3/1=await)
	SYSREQ_NOMIPMAP   �e�N�X�`����MIPMAP�������[�h(0=����/1=MIPMAP�Ȃ�)
	SYSREQ_DEVLOST    DirectX�f�o�C�X�̑��݃t���O(0=����/-1=���X�g)
	SYSREQ_MAXEMITTER �G�~�b�^�[�ő吔
	SYSREQ_THROUGHFLAG�@X�����̃{�[�_�[�����t���O(0=�ʏ�/1=�X���[)
	SYSREQ_OBAQMATBUF OBAQ�p�}�e���A���o�b�t�@��
	SYSREQ_2DFILTER2   2D���ڕ`�掞�̃e�N�X�`����ԃ��[�h
	SYSREQ_FPUPRESERVE FPU���Z���x�ݒ�I�v�V����(0=�P���x/1=�ύX�Ȃ�)
	SYSREQ_DSSOFTWARE  �\�t�g�E�F�A�T�E���h�o�b�t�@�̎g�p(1=ON,0=OFF)
	SYSREQ_DSGLOBAL    �O���[�o���T�E���h�t�H�[�J�X(1=ON,0=OFF)
	SYSREQ_DSBUFSEC    ogg�X�g���[���Đ��o�b�t�@�̃T�C�Y(�b��)
^p
%href
hgini
hggetreq
%sample
	;	���������F��RGB=($00,$ff,$ff)�Ƃ���
	;	(texload���߂̒��O�Ɏg�p�\)
	hgsetreq SYSREQ_COLORKEY, $00ffff


%index
hggetreq
�V�X�e�����N�G�X�g�擾
%group
�g����ʐ��䖽��
%prm
val,type
val  : ���ʂ���������ϐ���
type : �ݒ�^�C�v(SYSREQ_???)
%inst
HGIMG3�̃V�X�e���ݒ�l�����o����val�Ŏw�肵���ϐ��ɑ�����܂��B
type�l�Ŏw��ł���͈̂ȉ��̃V���{���ł��B
^p
	�V���{����        ���e
-----------------------------------------------
	SYSREQ_MAXMODEL   ���f���ő吔
	SYSREQ_MAXOBJ     �I�u�W�F�N�g�ő吔
	SYSREQ_MAXTEX     �e�N�X�`���ő吔
	SYSREQ_DXMODE     �t���X�N���[�����[�h�X�C�b�`
	SYSREQ_DXHWND     �E�B���h�E�n���h��
	SYSREQ_DXWIDTH    �t���X�N���[�����[�h���̉��T�C�Y
	SYSREQ_DXHEIGHT   �t���X�N���[�����[�h���̏c�T�C�Y
	SYSREQ_COLORKEY   �e�N�X�`���o�^���̓����F�R�[�h
	SYSREQ_MAXEVENT   �C�x���g�ő吔
	SYSREQ_RESULT     �G���[�������̌����R�[�h
	SYSREQ_RESVMODE   �X�e�[�^�X�R�[�h
	SYSREQ_PTRD3D     DIRECT3D8��COM�|�C���^
	SYSREQ_PTRD3DDEV  DIRECT3DDEVICE8��COM�|�C���^
^p
%href
hgini
hgsetreq


%index
hgrect
��`�̒��ڕ`��
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5,p6
p1=0�`(0)  : ��`�̒��SX���W
p2=0�`(0)  : ��`�̒��SY���W
p3=0�`(0.0): ��]�p�x(�P�ʂ̓��W�A��)
p4=0�`(?)  : X�T�C�Y
p5=0�`(?)  : Y�T�C�Y
%inst
(p1,p2)�Ŏw�肵�����W�𒆐S�Ƃ��āA(p4,p5)�Ŏw�肵���T�C�Y�̋�`(�����`)�����ݐݒ肳��Ă���F�ŕ`�悵�܂��B
p3�ŉ�]�p�x�������Ŏw�肷�邱�Ƃ��ł��܂��B
�p�x�̒P�ʂ́A���W�A��(0����n�܂��āA2�΂ň��)�ƂȂ�܂��B
grect���߂́Agmode�Őݒ肳�ꂽ�R�s�[���[�h�̎w�肪���f����܂��B
^
gmode��0,1�̏ꍇ�́A�ʏ�̓h��Ԃ��B
gmode��3�̏ꍇ�́A�w�肳�ꂽ���[�g�Ŕ������ɂȂ�܂��B
gmode��5,6�̏ꍇ�́A���ꂼ��F���Z�A�F���Z�����ƂȂ�܂��B
�܂��A(p4,p5)�̃T�C�Y�w����ȗ������ꍇ�ɂ́Agmode���߂Őݒ肳��Ă���R�s�[�T�C�Y���g�p����܂��B
^
hgrect���߂́A�W�����߂�grect���߂Ɠ��������HGIMG3�̉�ʂɑ΂��čs�Ȃ��܂��B
���̖��߂́A���ڕ`�施�߂ł��B���߂̎��s�ƂƂ��ɕ`�悪���s����܂��B
�K���Ahgdraw��hgsync�̊Ԃɒ��ڕ`����s�Ȃ��K�v������܂��B

%href
hgline
hgrotate



%index
hgrotate
��`�摜�̒��ڕ`��
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5,p6
p1=0�`(0)  : �e�N�X�`��ID
p2=0�`(0)  : �R�s�[���̍���X���W
p3=0�`(0)  : �R�s�[���̍���Y���W
p4=0�`(0.0): ��]�p�x(�P�ʂ̓��W�A��)
p5=0�`(?)  : X�T�C�Y
p6=0�`(?)  : Y�T�C�Y
%inst
hgrotate���߂́A�w�肳�ꂽ��`�͈͂ɉ�]���܂߂��e�N�X�`���`�揈�����s�Ȃ��܂��B
p1�ŁA�R�s�[���̃e�N�X�`��ID���w��A(p2,p3)�ŃR�s�[����錳�̉摜�ɂ�������W���w�肵�܂��B(gcopy���߂Ɠ��l�ł�)
�R�s�[��́A���݂̕`���Ɏw�肳��Ă���E�B���h�EID�ŁApos���߂Őݒ肳�ꂽ�ꏊ�𒆐S�Ƃ������W�ɃR�s�[���s�Ȃ��܂��B
���̍ۂɁAp3�ŉ�]�p�x�������Ŏw�肷�邱�Ƃ��ł��܂��B
�p�x�̒P�ʂ́A���W�A��(0����n�܂��āA2�΂ň��)�ƂȂ�܂��B
(p5,p6)�ŁA�R�s�[���ꂽ���X,Y�T�C�Y���w�肵�܂��B
�܂��A�R�s�[����X,Y�T�C�Y��gmode���߂Őݒ肳�ꂽ�f�t�H���g�̃R�s�[�T�C�Y���g�p����܂��B
�܂�Agmode���߂Ŏw�肳�ꂽ�T�C�Y�����傫�ȃT�C�Y��(p5,p6)�Ŏw�肵���ꍇ�ɂ́A�g�傳��邱�ƂɂȂ�܂��B
(p5,p6)���ȗ������ꍇ�ɂ́A�R�s�[���Ɠ����T�C�Y�A�܂蓙�{�ŃR�s�[���s�Ȃ��܂��B
^
hgrotate���߂́Agmode�Őݒ肳�ꂽ�R�s�[���[�h�̎w�肪���f����܂��B
(�ڂ�����gmode���߂̃��t�@�����X���Q��)
^
hgrotate���߂́A�W�����߂�grotate���߂Ɠ��������HGIMG3�̉�ʂɑ΂��čs�Ȃ��܂��B
���̖��߂́A���ڕ`�施�߂ł��B���߂̎��s�ƂƂ��ɕ`�悪���s����܂��B
�K���Ahgdraw��hgsync�̊Ԃɒ��ڕ`����s�Ȃ��K�v������܂��B

%href
hgline
hgrect


%index
hgline
�����̒��ڕ`��
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=0�`(0)  : �J�nX���W
p2=0�`(0)  : �J�nY���W
p3=0�`(?)  : �I��X���W
p4=0�`(?)  : �I��Y���W
%inst
(p1,p2)�Ŏw�肵�����W����(p3,p4)�Ŏw�肵�����W�����Ԑ������ݐݒ肳��Ă���F�ŕ`�悵�܂��B
hgline���߂́Agmode�Őݒ肳�ꂽ�R�s�[���[�h�̎w�肪���f����܂��B
^
gmode��0,1�̏ꍇ�́A�ʏ�̓h��Ԃ��B
gmode��3�̏ꍇ�́A�w�肳�ꂽ���[�g�Ŕ������ɂȂ�܂��B
gmode��5,6�̏ꍇ�́A���ꂼ��F���Z�A�F���Z�����ƂȂ�܂��B
^
hgline���߂́A�W�����߂�line���߂Ɠ��������HGIMG3�̉�ʂɑ΂��čs�Ȃ��܂��B
���̖��߂́A���ڕ`�施�߂ł��B���߂̎��s�ƂƂ��ɕ`�悪���s����܂��B
�K���Ahgdraw��hgsync�̊Ԃɒ��ڕ`����s�Ȃ��K�v������܂��B

%href
hgrotate
hgrect


%index
settex
�e�N�X�`����o�^
%group
�g����ʐ��䖽��
%prm
x,y,sw,mode
(x,y)    : �e�N�X�`���o�^�T�C�Y
sw(0)    : �e�N�X�`���o�^�X�C�b�`(0=�ʏ�/1=Y���])
mode(-1) : �X�V���[�h�w��(-1=�V�K)
%inst
���ݑI������Ă���E�B���h�EID�̓��e���e�N�X�`���Ƃ��ēo�^���܂��B
�e�N�X�`���̓o�^�ɐ�������ƁA�V�X�e���ϐ�stat�Ƀe�N�X�`��ID���������܂��B
���s�����ꍇ�̓V�X�e���ϐ�stat���}�C�i�X�l�ɂȂ�܂��B
^
sw�̒l��1�̏ꍇ�́A�C���[�W�̏㉺�𔽓]���ăe�N�X�`���o�^���s�Ȃ��܂��B
mode�l��-1�܂��͏ȗ����ꂽ�ꍇ�́A�ʏ�̓o�^�������s�Ȃ��Amode�l�ɂ��łɓo�^���ꂽ�e�N�X�`��ID���w�肷��ƁA����ID�̃e�N�X�`�������݂̃E�B���h�E���e�ōX�V���܂��B
^
�ʏ�́Atexload���߁Atexload2���߂ɂ���ăt�@�C������e�N�X�`����ǂݍ��ނ悤�ɂ��Ă��������B
%href
texload
texload2


%index
texload
�e�N�X�`�����t�@�C������o�^
%group
�g����ʐ��䖽��
%prm
"filename"
"filename" : �o�^����e�N�X�`���̉摜�t�@�C��
%inst
�摜�t�@�C��"filename"�̓��e���e�N�X�`���Ƃ��ēo�^���܂��B
�摜�́Apicload���߂Ŏg�p�\�ȃt�H�[�}�b�g�Ɠ�������(BMP,JPG,GIF)�����p�\�ł��B
�e�N�X�`���̓o�^���I������ƁA�V�X�e���ϐ�stat�Ƀe�N�X�`��ID���������܂��B
���s�����ꍇ�̓G���[�_�C�A���O���\������܂��B
^
texload���߂́A2�̏搔(2,4,8,16�c)�T�C�Y�łȂ��e�N�X�`���͎����I�ɓK���ȃT�C�Y�ɕ␳���܂��B
�r�f�I�J�[�h���e�N�X�`���̐F���[�h��T�C�Y�ɑΉ����Ă��Ȃ��ꍇ�ɂ́A�t�@�C�������݂���ꍇ�ł��G���[�ɂȂ邱�Ƃ�����̂Œ��ӂ��Ă��������B
�܂��A�A���t�@�`�����l�����܂ރe�N�X�`����ǂݍ��ޏꍇ�́Atexload2���߂��g�p���Ă��������B
^
���̖��߂́Ahgimg3.as���̃��W���[���Ƃ��Ď�������Ă��܂��B
�܂��A�摜�ǂݍ��ݎ��ɁAHSP�̃E�B���h�EID3������Ŏg�p���Ă��܂��B
%href
settex
texload2


%index
texload2
�e�N�X�`�����t�@�C������o�^
%group
�g����ʐ��䖽��
%prm
"filename",sx,sy
"filename" : �o�^����e�N�X�`���̉摜�t�@�C��
sx,sy      : ��ƂȂ�e�N�X�`���T�C�Y
%inst
�摜�t�@�C��"filename"�̓��e���e�N�X�`���Ƃ��ēo�^���܂��B
texload���߂Ɠ���������s�Ȃ��܂����ADirectX��API���g�p���ēǂݍ��݂��s�Ȃ��܂��B
�g�p�\�ȃt�H�[�}�b�g�́ABMP,JPG,GIF,PNG,DDS,TGA,TIFF�Ȃǂł��B
�e�N�X�`���̓o�^���I������ƁA�V�X�e���ϐ�stat�Ƀe�N�X�`��ID���������܂��B
���s�����ꍇ�̓V�X�e���ϐ�stat�Ƀ}�C�i�X�l���������܂��B
^
DDS��TGA�t�@�C���ȂǃA���t�@�`�����l�����܂މ摜�f�[�^�́Atexload2���߂œǂݍ��ނ��ƂŗL���ɂȂ�܂��B
�������Atexload2���߂̓r�f�I�J�[�h�̃X�y�b�N�ɍ��킹�ĉ摜�T�C�Y���œK�ȃT�C�Y�Ɋg��k�����s�Ȃ����Ƃ�����܂��B
�K�v�ɉ�����texload�Atexload2���߂��g��������悤�ɂ��Ă��������B
^
sx,sy�Ńe�N�X�`���T�C�Y�������I�Ɏw�肷�邱�Ƃ��\�ł��B
�ʏ�́A�w����ȗ����Ă��Ė�肠��܂���B


%href
settex
texload



%index
loadtoon
�g�D�[���e�N�X�`�����t�@�C������o�^
%group
�g����ʐ��䖽��
%prm
p1,"filename"
p1         : ���f��ID
"filename" : �o�^����e�N�X�`���̉摜�t�@�C��
%inst
p1�Ŏw�肵�����f���ɑ΂��ăg�D�[���V�F�[�f�B���O�̃��[�h��ݒ肵�A�F�̏������e�N�X�`���t�@�C����ǂݍ��݂܂��B
^
���炩���߁Aaddxfile���߂ɂ��X�`����3D���f�����ǂݍ��܂�Ă���K�v������܂��B
�g�D�[���V�F�[�f�B���O��ݒ肷��ꍇ�ɂ́A���炩���߃g�D�[���e�N�X�`���ƌĂ΂��F�����������摜�f�[�^���쐬���Ă����Ȃ���΂Ȃ�܂���B
(�g�D�[���e�N�X�`���́Amaketoon���߂ɂ���č쐬���邱�Ƃ��\�ł��B)
^
���̖��߂́Ahgimg3.as���̃��W���[���Ƃ��Ď�������Ă��܂��B
�܂��AHSP�̃E�B���h�EID3������Ŏg�p���Ă��܂��B

%href
maketoon



%index
maketoon
�g�D�[���e�N�X�`�����쐬
%group
�g����ʐ��䖽��
%prm
p1,p2
p1    : ���f��ID
p2(0) : �쐬���[�h
%inst
p1�Ŏw�肵�����f���̏������ƂɃg�D�[���e�N�X�`���̍쐬���s�Ȃ��܂��B
p2�ŁA�쐬���[�h���w�肷�邱�Ƃ��ł��܂��B
^p
�쐬���[�h  ���e
--------------------------------------------------------------
  1         �쐬���ꂽ�g�D�[���e�N�X�`�������f���ɓK�p����
  2         �쐬���ꂽ�g�D�[���e�N�X�`�����t�@�C���ɃZ�[�u����
^p
maketoon���߂́A���f���̎��}�e���A���F�𒊏o���A�W���I�ȃg�D�[���e�N�X�`�����쐬���܂��B
�쐬���[�h��2���w�肵���ꍇ�́A�utoon.bmp�v�Ƃ������O�Ńg�D�[���e�N�X�`����ۑ����܂��B
�ۑ����ꂽ�g�D�[���e�N�X�`���́Aloadtoon���߂œǂݍ���Ŏg�p���邱�Ƃ��\�Ȃق��A�摜��ҏW���邱�Ƃɂ��A���ׂ����g�D�[���V�F�[�f�B���O�̕\�����s�Ȃ����Ƃ��\�ɂȂ�܂��B
^
���̖��߂́Ahgimg3.as���̃��W���[���Ƃ��Ď�������Ă��܂��B
�܂��AHSP�̃E�B���h�EID3������Ŏg�p���Ă��܂��B

%href
loadtoon


%index
setfont
�I���W�i���t�H���g��`
%group
�g����ʐ��䖽��
%prm
cx,cy,px,sw
( cx,cy ) : �t�H���g1�������XY�T�C�Y
  px      : 1�����\�����ƂɉE�Ɉړ�����h�b�g��
  sw      : 0=�����F�����Ȃ� / 1=�����F��������

%inst
fprt���߂ŕ\�����邽�߂̃t�H���g��ݒ肵�܂��B
�g�p����e�N�X�`���͂��̒���ɓǂݍ��܂ꂽ���̂ɂȂ�܂��B
%href
texload
fprt
%sample
	;	�e�N�X�`���t�H���g�\���̏���
	;
	setfont 16,16,12,1	; font Tex select(cx,cy,px,mode)
	texload "fontchr.bmp"	; �t�H���g�e�N�X�`���̓o�^


%index
fprt
��`�t�H���g������\��
%group
�g����ʐ��䖽��
%prm
"mes",x,y
"mes"  : �\�����镶����
( x,y ) : �\��������W

%inst
"mes"�̓��e���w�肳�ꂽ�t�H���g�ŉ�ʂɕ\�����܂��B
�K��hgdraw���߂ƁAhgsync���߂̊ԂɎg�p���Ă��������B
(x,y)�̎w��͉�ʂ̍��オ(0,0)�ɂȂ�܂��B
%href
setfont
hgdraw
hgsync
%sample
	;	�`�惁�C��
	;
	hgdraw				; �`�揈��
	getsync t1,0			; �O�񂩂�̕��ׂ��擾
	fprt "HGIMG Plugin test",8,108
	fprt "T:"+t1,8,124
	hgsync 10			; �����������ĂȂ���Ε`��


%index
falpha
�t�H���g�������l��ݒ�
%group
�g����ʐ��䖽��
%prm
val
val : �t�H���g�\���Ɏg�p���郿�����l
%inst
fprt���߂ɂ��t�H���g�\���Ŏg�p����郿�����l���w�肵�܂��B
�ȍ~���ׂĂ�fprt���߂ɓK�p����܂��B
���l�ɂ��Ă̏ڍׂ͈ȉ��̒ʂ�ł��B
^p
	�������l = 0�`255    : �w�i�ƃ�����(blend)���s�Ȃ�
	�������l = 256�`511  : �������s�Ȃ�Ȃ�(�ʏ펞)
	�������l = 512�`767  : �w�i�ƐF���Z(modulate)���s�Ȃ�
	�������l = 768�`1023 : �w�i�ƐF���Z(substract)���s�Ȃ�
^p
%href


%index
setsizef
�o�^���f���̕��A�������w��
%group
�g����ʐ��䖽��
%prm
fsx,fsy
(fsx,fsy) : X,Y�T�C�Y(�����l)
%inst
���f���o�^�̍ۂɎg�p�����T�C�Y�l���w�肵�܂��B
%href
addspr
addplate
addsplate
addbox


%index
clscolor
�w�i�F�ݒ�
%group
�g����ʐ��䖽��
%prm
color
color : �J���[�R�[�h
%inst
�P�F�œh��Ԃ��w�i�F��ݒ肵�܂��B
color��-1���w�肵���ꍇ�́A�w�i�N���A���s�Ȃ��܂���B
color��RGB�R�[�h($rrggbb)�ƂȂ�܂��B
%href
clstex
clsblur


%index
clstex
�w�i�e�N�X�`���ݒ�
%group
�g����ʐ��䖽��
%prm
id
id : �e�N�X�`��ID
%inst
�w�i�ƂȂ�e�N�X�`����ID���w�肵�܂��B
id��-1���w�肵���ꍇ�́A�w�i�Ƀe�N�X�`�����g��Ȃ��Ȃ�܂��B
%href
clscolor
clsblur
texload


%index
clsblur
�u���[�ݒ�
%group
�g����ʐ��䖽��
%prm
val
val : ���x(0�`255)
%inst
�[���u���[���ʂ�ݒ肵�܂��B
val�Őݒ肵�����x�̒l���������قǁA��ʂɑO�̃t���[�����c���Ƃ��Ďc��܂��B
%href
clscolor
clstex


%index
texmake
���b�Z�[�W�e�N�X�`���̍쐬
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1(256) : �e�N�X�`��X�T�C�Y
p2(256) : �e�N�X�`��Y�T�C�Y
p3(0)   : �쐬���[�h
%inst
���b�Z�[�W�`��p�e�N�X�`���̍쐬���s�Ȃ��܂��B
���̃e�N�X�`���́Atexmes���߂̃��b�Z�[�W�`���Ƃ��Ďg�p���邱�Ƃ��ł��܂��B
^
�e�N�X�`���̓o�^���I������ƁA�V�X�e���ϐ�stat�Ƀe�N�X�`��ID���������܂��B
���s�����ꍇ�̓V�X�e���ϐ�stat�Ƀ}�C�i�X�l���������܂��B
^
�쐬���[�h��0�̏ꍇ�́A16bit�e�N�X�`��(A4R4G4B4)���쐬����܂��B
0�ȊO�̎��́A32bit�e�N�X�`��(A8R8G8B8)�ƂȂ�܂��B
�f�t�H���g�ł́A16bit�e�N�X�`�����쐬����܂��B
���b�Z�[�W�������ꍇ�́A16bit�e�N�X�`���̕������x�I�ɂ��݊����̏�ł��L���ɂȂ�܂��B
��荂���x�ȃ��b�Z�[�W�`����s�Ȃ��ꍇ�ɂ́A32bit�e�N�X�`�����w�肵�Ă��������B

%href
texcls
texmes


%index
texcls
���b�Z�[�W�e�N�X�`���̃N���A
%group
�g����ʐ��䖽��
%prm
p1,p2
p1    : �e�N�X�`��ID
p2(0) : �J���[�R�[�h
%inst
���b�Z�[�W�`��p�e�N�X�`���̓��e���N���A(����)���܂��B
p2�ŁA�P�F�œh��Ԃ����߂̔w�i�F��ݒ肵�܂��B
p2��RGB�R�[�h($rrggbb)�ƂȂ�܂��B

%href
texmake
texmes


%index
texmes
���b�Z�[�W�e�N�X�`���ւ̕`��
%group
�g����ʐ��䖽��
%prm
"message",p1,p2,p3
"message" : ���b�Z�[�W������
p1        : �e�N�X�`��ID
p2,p3     : �`�����W
%inst
���b�Z�[�W�`��p�e�N�X�`���Ƀ��b�Z�[�W���������݂܂��B
"message"�ɕ`�悵������������w�肷�邱�ƂŁAp1�̃e�N�X�`���ɏ������݂��s�Ȃ��܂��B
���炩���߁Atexmake���߂ɂ�胁�b�Z�[�W�`��p�e�N�X�`�����쐬���Ă����K�v������̂Œ��ӂ��Ă��������B
^
texmes���߂́A�A���`�G�C���A�X���s�Ȃ����������e�N�X�`���ɑ΂��ď������݂܂��B
�`�悳��镶���t�H���g��F�́Afont���߁Acolor���߂Ŏw�肳��Ă�����̂��g���܂��B
texmes���߂́A�e�N�X�`���ɑ΂��ĕ������`�悷�邾���Ȃ̂ŁA���ۂɕ������\�����邽�߂ɂ́A�e�N�X�`����hgrotate���߂�X�v���C�g�Ȃǂŕ\������K�v������܂��B

%href
color
font
texmake
texcls
texopt


%index
texdel
�e�N�X�`���̍폜
%group
�g����ʐ��䖽��
%prm
p1
p1    : �e�N�X�`��ID
%inst
p1�Ŏw�肳�ꂽ�e�N�X�`�����폜���܂��B
�폜���ꂽ�e�N�X�`���́AVRAM�ォ��j������V��������ւ��邱�Ƃ��ł���悤�ɂȂ�܂��B

%href
texmake
texload
texload2


%index
setuv
�o�^�e�N�X�`��UV���W���w��
%group
�g����ʐ��䖽��
%prm
tx0,ty0,tx1,ty1
(tx0,ty0) : �e�N�X�`���̍�����W
(tx1,ty1) : �e�N�X�`���̉E�����W
%inst
���f���o�^�̍ۂɎg�p�����UV�l���w�肵�܂��B
%href
addspr
addplate
addbox


%index
addspr
2D�X�v���C�g���f�����쐬
%group
�g����ʐ��䖽��
%prm
var,mode,x1,y1,x2,y2,texid
var     : �쐬���ꂽ���f��ID����������ϐ���
mode    : 0=�����F�����Ȃ� / 1=�����F��������
(x1,y1) : �e�N�X�`���̍�����W
(x2,y2) : �e�N�X�`���̉E�����W
texid   : �e�N�X�`����ID
%inst
2D�X�v���C�g���f�����쐬���܂��B
����Ƀ��f�����쐬�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
texid���w�肳��Ă���ꍇ�́A������e�N�X�`��ID�Ƃ��ĎQ�Ƃ��܂��B
texid���ȗ����ꂽ�ꍇ�́A���ɓo�^�����e�N�X�`�����Q�Ƃ���܂��B
(x1,y1)-(x2,y2)�ŎQ�Ƃ����e�N�X�`���̍��W��ݒ肷�邱�Ƃ��ł��܂��B
(x1,y1)-(x2,y2)�̎w����ȗ������ꍇ�ɂ́Asetuv�Ŏw�肳�ꂽ�l���K�p����܂��B

%href
setuv


%index
regobj
�I�u�W�F�N�g�̓o�^
%group
�g����ʐ��䖽��
%prm
var,ModelID,mode,EventID
var      : �쐬���ꂽ�I�u�W�F�N�gID����������ϐ���
modelID  : ���f��ID
mode     : ���[�h�l
EventID  : �C�x���gID
%inst
�w�肳�ꂽ���f����\�����邽�߂̃I�u�W�F�N�g���쐬���܂��B
��������ƍ쐬���ꂽ�I�u�W�F�N�gID���ϐ��ɑ������܂��B
���炩�̗��R�ō쐬�Ɏ��s�����ꍇ�́A-1���������܂��B
^
���[�h�͈ȉ��̒�����I�����܂��B
^p
	���x��             |        ���e
	--------------------------------------------------------------
	OBJ_HIDE             ��\��(��ʂ������)
	OBJ_TREE             �ؑ���(Y���̂ݐ��ʂ�����)
	OBJ_XFRONT           ���ʑ���(��ɉ�ʂɐ��ʂ�����)
	OBJ_MOVE             XYZ�ړ��ʂ�L���ɂ���
	OBJ_FLIP             �{�[�_�[�̈�Ŕ��]����
	OBJ_BORDER           �{�[�_�[�̈��L���ɂ���
	OBJ_LATE             ��Ɍォ��`�����(�������I�u�W�F�N�g�p)
	OBJ_FIRST            ��ɍŏ��ɕ`�����
	OBJ_SORT             �����I�ɉ�����`�����(3D�I�u�W�F�N�g�p)
	OBJ_LOOKAT           ����I�u�W�F�N�g�̕�������Ɍ���
	OBJ_LAND             Y���W����Ɉ��ɕۂ�
	OBJ_GROUND           �n�ʂƂ��ĔF�������
	OBJ_STAND            �n�ʂ̏�ɔz�u����
	OBJ_GRAVITY          �d�͌v�Z��L���ɂ���
	OBJ_STATIC           ��Q���Ƃ��ĔF�������
	OBJ_BOUND            �n�ʂŔ�������(���b�V���}�b�v�R���W�����p)
	OBJ_ALIEN            �^�[�Q�b�g�Ɍ�����(���b�V���}�b�v�R���W�����p)
	OBJ_WALKCLIP         �ړ��̐������󂯂�(���b�V���}�b�v�R���W�����p)
	OBJ_EMITTER          �G�~�b�^�[�����I�u�W�F�N�g�ɂȂ�
^p
�����̍��ڂ𓯎��ɑI������ꍇ�́A�uOBJ_LATE|OBJ_MOVE�v�̂悤�Ɂu|�v�ŋ�؂��Ďw�肵�Ă��������B�����w�肵�Ȃ��ꍇ�́A0�ɂ��邩�ȗ����č\���܂���B
�I�u�W�F�N�g�̃��[�h�́A���炩���߃f�t�H���g�̃��[�h�����f���̎�ނɉ����Đݒ肳��Ă���̂ŁA�ʏ�͓��ɐݒ肷��K�v�͂���܂���B
OBJ_2D�̃��[�h�́A�����I�ɐݒ肳�����̂ŁA�r���ŕύX���Ȃ��悤�ɂ��Ă��������B
EventID���w�肷��ƁA�Y������C�x���g���I�u�W�F�N�g�ɐݒ肳��܂��B
EventID���ȗ����邩�A�}�C�i�X�l�̏ꍇ�̓C�x���g��ݒ肵�܂���B
%href
delobj


%index
addplate
��(PLATE)���f�����쐬
%group
�g����ʐ��䖽��
%prm
var,mode,sx,sy,x1,y1,x2,y2,texid
var     : �쐬���ꂽ���f��ID����������ϐ���
mode    : 0=�����F�����Ȃ� / 1=�����F��������
(sx,sy) : X,Y�T�C�Y
(x1,y1) : �e�N�X�`���̍�����W
(x2,y2) : �e�N�X�`���̉E�����W
texid   : �e�N�X�`��ID
%inst
3D�̔�(PLATE)���f�����쐬���܂��B
����Ƀ��f�����쐬�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
PLATE���f���́A�P�F�܂��̓e�N�X�`���ŕ`�悳��3D��ɔz�u�����l�p�`�ł��B
setcolor���߂ŐF���ݒ肳��Ă��鎞�́A�P�F�̔ɂȂ�܂��B
texid���w�肳��Ă���ꍇ�́A������e�N�X�`��ID�Ƃ��ĎQ�Ƃ��܂��B
texid���ȗ����ꂽ�ꍇ�́A���ɓo�^�����e�N�X�`�����Q�Ƃ���܂��B
(sx,sy)�Ŕ�X,Y�T�C�Y��ݒ肵�܂��B�ȗ����ꂽ�ꍇ�́Asetsizef�Ŏw�肳�ꂽ�l���K�p����܂��B
(x1,y1)-(x2,y2)�ŎQ�Ƃ����e�N�X�`���̍��W��ݒ肷�邱�Ƃ��ł��܂��B
(x1,y1)-(x2,y2)�̎w����ȗ������ꍇ�ɂ́Asetuv�Ŏw�肳�ꂽ�l���K�p����܂��B
PLATE���f���́A�����v�Z���s�Ȃ��܂���B
�����v�Z���K�v�ȏꍇ�ɂ́Aaddsplate���߂ɂ��SPLATE���f�����쐬���Ă��������B

%href
addsplate
setcolor(HGIMG3)
setsizef
setuv


%index
addsplate
��(SPLATE)���f�����쐬
%group
�g����ʐ��䖽��
%prm
var,mode,sx,sy,texid
var     : �쐬���ꂽ���f��ID����������ϐ���
mode    : 0=�����F�����Ȃ� / 1=�����F��������
(sx,sy) : X,Y�T�C�Y
texid   : �e�N�X�`��ID
%inst
3D�̌����v�Z�t����(SPLATE)���f�����쐬���܂��B
����Ƀ��f�����쐬�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
SPLATE���f���́A�P�F�܂��̓e�N�X�`���ŕ`�悳��3D��ɔz�u�����l�p�`�ł��B
setcolor���߂ŐF���ݒ肳��Ă��鎞�́A�P�F�̔ɂȂ�܂��B
texid���w�肳��Ă���ꍇ�́A������e�N�X�`��ID�Ƃ��ĎQ�Ƃ��܂��B
texid���ȗ����ꂽ�ꍇ�́A���ɓo�^�����e�N�X�`�����Q�Ƃ���܂��B
(sx,sy)�Ŕ�X,Y�T�C�Y��ݒ肵�܂��B�ȗ����ꂽ�ꍇ�́Asetsizef�Ŏw�肳�ꂽ�l���K�p����܂��B
addplate���߂Ƃقړ����ł����A�����v�Z���s�Ȃ����ƂƁA�e�N�X�`��UV���W�̎w�肪�ł��Ȃ��_���قȂ��Ă��܂��B

%href
addplate
setcolor(HGIMG3)
setsizef


%index
setcolor(HGIMG3)
�P�F�|���S���쐬�ݒ�
%group
�g����ʐ��䖽��
%prm
r,g,b
r,g,b : RGB�F���(���ꂼ��0�`255)
%inst
���f���̍쐬���s�Ȃ��ۂ̃|���S���F��ݒ肵�܂��B
addplate,addbox���߂ȂǂŒP�F�|���S�����쐬����ꍇ�Ɏg�p���܂��B
%href
addplate
addbox


%index
addbox
��(BOX)���f�����쐬
%group
�g����ʐ��䖽��
%prm
var,sx,sy,texid
var     : �쐬���ꂽ���f��ID����������ϐ���
(sx,sy) : X,Y�T�C�Y
texid   : �e�N�X�`��ID
%inst
��(BOX)���f�����쐬���܂��B
����Ƀ��f�����쐬�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
BOX���f���́A�P�F�܂��̓e�N�X�`���ŕ`�悳��3D��ɔz�u����闧���̂ł��B
texid���w�肳��Ă���ꍇ�́A������e�N�X�`��ID�Ƃ��ĎQ�Ƃ��܂��B
setcolor���߂ŐF���ݒ肳��Ă��鎞�́A�P�F�̔��ɂȂ�܂��B
setuv���߂ɂ����UV���w�肳��Ă���Atexid���ȗ����ꂽ�ꍇ�́A
���ɓo�^�����e�N�X�`�����Q�Ƃ���܂��B(������UV�̎w��͔��f����܂���)
(sx,sy)�Ŕ�X,Y�T�C�Y��ݒ肵�܂��B�ȗ����ꂽ�ꍇ�́Asetsizef�Ŏw�肳�ꂽ�l���K�p����܂��B

%href
setsizef
setcolor(HGIMG3)
setuv


%index
addmesh
��(MESH)���f�����쐬
%group
�g����ʐ��䖽��
%prm
var,divx,divy,mode,sx,sy,texid
var     : �쐬���ꂽ���f��ID����������ϐ���
divx    : ���b�V���̕�����X
divy    : ���b�V���̕�����Y
mode    : 0=�����F�����Ȃ� / 1=�����F�������� / 16=�J��Ԃ�
(sx,sy) : X,Y�T�C�Y
texid   : �e�N�X�`��ID
%inst
�������ꂽ3D�|���S�����g������(MESH)���쐬���܂��B
����Ƀ��f�����쐬�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
BOX���f���́A�e�N�X�`���ŕ`�悳��3D��ɔz�u����镪�����b�V���ł��B
texid���w�肳��Ă���ꍇ�́A������e�N�X�`��ID�Ƃ��ĎQ�Ƃ��܂��B
setuv���߂ɂ����UV���w�肳��Ă���Atexid���ȗ����ꂽ�ꍇ�́A���ɓo�^�����e�N�X�`�����Q�Ƃ���܂��B(������UV�̎w��͔��f����܂���)
(sx,sy)�Ŕ�X,Y�T�C�Y��ݒ肵�܂��B�ȗ����ꂽ�ꍇ�́Asetsizef�Ŏw�肳�ꂽ�l���K�p����܂��B
^
��{�I��addplate�ō����ƌ����ڂ͓����ł����Adivsizex �~ divsizey�̃|���S���ɕ�������Ă��܂��B
mode��16�̏ꍇ�́A�w�肳�ꂽ�e�N�X�`����1�|���S�����ƂɊ���t����J��Ԃ����[�h�ƂȂ�܂��B
%href
setsizef
setuv
meshmap
objwalk


%index
addeprim
�G�t�F�N�g(EPRIM)���f�����쐬
%group
�g����ʐ��䖽��
%prm
var,mode,option
var     : �쐬���ꂽ���f��ID����������ϐ���
mode    : �v���~�e�B�u���[�h
option  : �I�v�V�����l
%inst
�G�t�F�N�g(EPRIM)���f�����쐬���܂��B
����Ƀ��f�����쐬�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
�G�t�F�N�g���f���́A���ʐ����p�̓���Ȍ`������������f���ł��B
�G�t�F�N�g���f���͒��_���ƂɐF���ݒ肳��A�����v�Z���s�Ȃ�Ȃ����ʂȃ��f���ŁA�`���seteprim���߂ŃJ�X�^�}�C�Y���邱�Ƃ��ł��܂��B
mode�p�����[�^�[�ɂ��A�ȉ��̌`���I�����邱�Ƃ��ł��܂��B
^p
	���x��             |        ���e
	--------------------------------------------------------------
	EPRIM_CIRCLE         �~
	EPRIM_CIRCLE2        �M�U�M�U�̉~
	EPRIM_SQUARE         �p�̊ۂ��l�p�`
	EPRIM_FAN            �C�ӂ̒��_���������p�`
^p
option�p�����[�^�[�ɂ��A���f���쐬���R���g���[�����邱�Ƃ��ł��܂��B
option�l��0���ȗ����ꂽ�ꍇ�́A�ʏ�ʂ�̃��f�����쐬����܂��B
option�l��1�̏ꍇ�́A���f���{�̂̐����͍s�Ȃ킸�A���͂̂���(SPREAD)�̂ݐ������܂��B
option�l��2�̏ꍇ�́A����(SPREAD)�̐����͍s�Ȃ킸�A���f���{�̂̂ݐ������܂��B
%href
seteprim


%index
seteprim
�G�t�F�N�g(EPRIM)���f����ݒ�
%group
�g����ʐ��䖽��
%prm
Model,Param,Value
Model   : ���f��ID
Param   : �p�����[�^�[ID
Value   : �p�����[�^�[�ɐݒ肷��l
%inst
�G�t�F�N�g(EPRIM)���f���̐����p�����[�^�[��ݒ肵�܂��B
Model�ɁAaddeprim���߂ɂ���č쐬���ꂽ���f��ID���w�肵�܂��B
Param�ɐݒ肷��p�����[�^�[ID���AValue�ɐݒ肷��l�������������ɂ��w�肵�܂��B
Param�Ŏw�肷��p�����[�^�[ID�́Aaddeprim���߂ō쐬���ꂽ���f���`��ɂ��قȂ�܂��B
�p�����[�^�[ID�́A0����8�܂ł������l�ɂ��ݒ肪�\�ł��B
�p�����[�^�[ID��16����19�܂ł́A�F�R�[�h�̐ݒ�ƂȂ胿�l�ARGB�l������32bit�̐����l��ݒ肷�邱�Ƃ��ł��܂��B
seteprim���߂ɂ��A�����p�����[�^�[��ύX������́A�\�����s�Ȃ��ۂɒ��_���W�̍č\�z���s�Ȃ��܂��B
�����̕��ׂ��y�����邽�߂ɂ́A���t���[�����Ƃ�seteprim���߂����s����͔̂����āA
�K�v�ȏꍇ�ɂ̂݃p�����[�^�[�ύX���s�Ȃ��悤�ɂ��Ă��������B
%href
addeprim


%index
setefx
efx�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
efx�O���[�v(������ʐݒ�)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
^
�I�u�W�F�N�g�ɑ΂��Ax�̒l�͎��̂悤�ɔF������܂��By,z�̒l�͖��g�p�ł��B
^p
0 �`255 : �w�i�ƃ�����(blend)���s�Ȃ�
256 �`511 : �������s�Ȃ�Ȃ�(�ʏ펞)�i���݁A�u�����h�Z�x�͊֌W����܂���j
512 �`767 : �w�i�ƐF���Z(modulate)���s�Ȃ�
768 �`1023 : �w�i�ƃ��l���Z(substract)���s�Ȃ�
1024 �`1279 : �w�i�ƐF���Z(substract2)���s�Ȃ��i���݁A�u�����h�Z�x�͖����ɂȂ�܂��j
1280 �`1535 : �������s�Ȃ�Ȃ�(Z����)�i���݁A�u�����h�Z�x�͊֌W����܂���j
^p
�J�����ɑ΂��A���̃p�����[�^���w�肷��ꍇ�Ax,y,z�����̂悤�ɔF�����܂��B
^p
x : ����p�x�B�����l��45�x(��/4)���w�肳��Ă��܂��B
y : NearZ�l�B�J�������炱�̋�������O�̃|���S���͕\������܂���B
z : FarZ�l�B�J�������炱�̋�����艜�̃|���S���͕\������܂���B
^p


%href
setpos
setang
setangr
setscale
setdir
setwork


%index
addefx
efx�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : ���Z����l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
efx�O���[�v(������ʐݒ�)��(x,y,z)�Ŏw�肳�ꂽ�l�����Z���܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B

%href
addpos
addang
addangr
addscale
adddir
addwork


%index
getefx
efx�O���[�v�����擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
efx�O���[�v(������ʐݒ�)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
���߂̍Ō�Ɂui�v��t�����邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B

%href
getefxi
getpos
getang
getangr
getscale
getdir
getwork


%index
getangi
ang�O���[�v���𐮐��Ŏ擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
ang�O���[�v(�\���p�x)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B

%href
getang
getposi
getangri
getscalei
getdiri
getefxi
getworki


%index
getefxi
efx�O���[�v���𐮐��Ŏ擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
efx�O���[�v(������ʐݒ�)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B

%href
getefx
getposi
getangi
getangri
getscalei
getdiri
getworki


%index
selefx
�I�u�W�F�N�g������ʂ�MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��efx(����)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href
selmoc
selpos
selang
selscale
selcam
selcpos
selcang
selcint


%index
objset1
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
ofs,x
ofs : MOC�̃I�t�Z�b�g�ԍ�
x   : �ݒ肷��l

%inst
MOC����ݒ肵�܂��B
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objsetf1
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
ofs,fx
ofs : MOC�̃I�t�Z�b�g�ԍ�
fx  : �ݒ肷��l(�����l)

%inst
MOC����ݒ肵�܂��B
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objadd1
MOC�������Z
%group
�g����ʐ��䖽��
%prm
ofs,x
ofs : MOC�̃I�t�Z�b�g�ԍ�
x   : ���Z����l

%inst
MOC���ɐݒ肳��Ă���l��x�����Z���܂��B
%href
objset1
objadd1r
objset1r
objsetf1
objaddf1


%index
objadd1r
MOC�������Z
%group
�g����ʐ��䖽��
%prm
ofs,x
ofs : MOC�̃I�t�Z�b�g�ԍ�
x   : ���Z����l(�����p�x�l)

%inst
MOC���ɐݒ肳��Ă���l��x�����Z���܂��B
�����������l(256�łP��])�����W�A���P�ʂɕϊ������p�����[�^�[�����Z���܂��B
�p�x���w�肷��p�����[�^�[�ȊO�ł͐���Ȓl�ɂȂ�Ȃ��̂Œ��ӂ��Ă��������B
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objaddf1
MOC�������Z
%group
�g����ʐ��䖽��
%prm
ofs,fx
ofs : MOC�̃I�t�Z�b�g�ԍ�
fx  : ���Z����l(�����l)

%inst
MOC���ɐݒ肳��Ă���l��fx�����Z���܂��B
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objset1r
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
ofs,x
ofs : MOC�̃I�t�Z�b�g�ԍ�
x   : �ݒ肷��l

%inst
MOC���Ɋp�x����ݒ肵�܂��B
�����l(256�łP��])�����W�A���P�ʂɕϊ����ăp�����[�^�[���������݂܂��B
�p�x���w�肷��p�����[�^�[�ȊO�ł͐���Ȓl�ɂȂ�Ȃ��̂Œ��ӂ��Ă��������B
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objset2
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
ofs,x,y
ofs : MOC�̃I�t�Z�b�g�ԍ�
x   : �ݒ肷��l
y   : �ݒ肷��l2

%inst
MOC����ݒ肵�܂��B
ofs�Ŏw�肵���I�t�Z�b�g�ԍ�����Q�̃p�����[�^���ΏۂɂȂ�܂��B
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
objsetf2
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
ofs,fx,fy
ofs : MOC�̃I�t�Z�b�g�ԍ�
fx  : �ݒ肷��l(�����l)
fy  : �ݒ肷��l2(�����l)

%inst
MOC����ݒ肵�܂��B
ofs�Ŏw�肵���I�t�Z�b�g�ԍ�����Q�̃p�����[�^���ΏۂɂȂ�܂��B
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
objadd2
MOC�������Z
%group
�g����ʐ��䖽��
%prm
ofs,x,y
ofs : MOC�̃I�t�Z�b�g�ԍ�
x   : ���Z����l
y   : ���Z����l2

%inst
MOC���ɐݒ肳��Ă���l��x,y�����Z���܂��B
ofs�Ŏw�肵���I�t�Z�b�g�ԍ�����Q�̃p�����[�^���ΏۂɂȂ�܂��B
%href
objset2
objadd2r
objset2r
objsetf2
objaddf2


%index
objaddf2
MOC�������Z
%group
�g����ʐ��䖽��
%prm
ofs,fx,fy
ofs : MOC�̃I�t�Z�b�g�ԍ�
fx  : ���Z����l(�����l)
fy  : ���Z����l2(�����l)

%inst
MOC���ɐݒ肳��Ă���l��fx,fy�����Z���܂��B
ofs�Ŏw�肵���I�t�Z�b�g�ԍ�����Q�̃p�����[�^���ΏۂɂȂ�܂��B
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
objadd2r
MOC�������Z
%group
�g����ʐ��䖽��
%prm
ofs,fx,fy
ofs : MOC�̃I�t�Z�b�g�ԍ�
fx  : ���Z����l(�����p�x�l)
fy  : ���Z����l2(�����p�x�l)
%inst
MOC���ɐݒ肳��Ă���l��fx,fy�����Z���܂��B
�����������l(256�łP��])�����W�A���P�ʂɕϊ������p�����[�^�[�����Z���܂��B
�p�x���w�肷��p�����[�^�[�ȊO�ł͐���Ȓl�ɂȂ�Ȃ��̂Œ��ӂ��Ă��������B
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
objset2r
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
ofs,x,y
ofs : MOC�̃I�t�Z�b�g�ԍ�
x   : �ݒ肷��l
y   : �ݒ肷��l2

%inst
MOC���Ɋp�x����ݒ肵�܂��B
ofs�Ŏw�肵���I�t�Z�b�g�ԍ�����Q�̃p�����[�^���ΏۂɂȂ�܂��B
�����l(256�łP��])�����W�A���P�ʂɕϊ����ăp�����[�^�[���������݂܂��B
�p�x���w�肷��p�����[�^�[�ȊO�ł͐���Ȓl�ɂȂ�Ȃ��̂Œ��ӂ��Ă��������B
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
dxfload
DXF�`���t�@�C����ǂݍ���
%group
�g����ʐ��䖽��
%prm
"filename",p1
"filename" : �ǂݍ��ރ��f���t�@�C��(DXF�`��)
p1(0)      : �\�ʂ̐F�w��(�I�v�V����)
%inst
DXF�`���̃t�@�C�������f���f�[�^�Ƃ��ēǂݍ��݂܂��B
�V�X�e���ϐ�stat�ɓǂݍ��܂ꂽ��̃��f��ID���Ԃ���܂��B
p1�œǂݍ��܂ꂽ�|���S���̕\�ʐF���w�肷�邱�Ƃ��ł��܂��B�\�ʐF�́ARGB��24bit�����Ƀp�b�N�����`��($rrggbb)�Ŏw�肷��K�v������܂��B
p1���ȗ��܂���0�Ɏw�肵���ꍇ�́A���F(0xffffff)���I������܂��B
DXF�`���́ACAD��قƂ�ǂ�3D�c�[�����T�|�[�g���Ă����{�I��3D�`��t�H�[�}�b�g�ł��B�e�N�X�`�����ȂǍ��x�ȏ��͔��f����܂��񂪁A�`�������肷�邱�Ƃ��\�ł��B
dxfload���߂ł́ADXF�`����3DFACE�Ƃ����^�C�v�ɂ̂ݑΉ����Ă��܂��B
�ꕔ�̃t�@�C���Ƃ͌݊����Ȃ��\��������܂��B
���̖��߂́Ahgimg3.as���W���[�����Œ�`����Ă��܂��B
%href
adddxf
%sample
	dxfload "ball.dxf"		; dxf�t�@�C���ǂݍ���
	m_model=stat
	regobj obj, m_model		; �I�u�W�F�N�g�̓o�^


%index
adddxf
DXF�`���f�[�^�̓o�^
%group
�g����ʐ��䖽��
%prm
var1,var2,color
var1     : �쐬���ꂽ���f��ID����������ϐ���
var2     : DXF�`���̃f�[�^���������Ă���o�b�t�@�ϐ���
color(0) : �\�ʂ̐F�w��(�I�v�V����)
%inst
DXF�`���̃��f����o�^���܂��B���f���f�[�^�́A���炩����var2�Ŏw�肳�ꂽ�ϐ��o�b�t�@�ɓǂݍ��܂�Ă���K�v������܂��B
����Ƀ��f�����o�^�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
color�œǂݍ��܂ꂽ�|���S���̕\�ʐF���w�肷�邱�Ƃ��ł��܂��B�\�ʐF�́ARGB��24bit�����Ƀp�b�N�����`��($rrggbb)�Ŏw�肷��K�v������܂��B
color���ȗ��܂���0�Ɏw�肵���ꍇ�́A���F(0xffffff)���I������܂��B
���̖��߂́A��������ɓǂݍ��܂ꂽ�f�[�^����o�^���s�Ȃ����߂̂��̂ł��BDXF�`���̃t�@�C�����p�ӂ���Ă���ꍇ�́Adxfload���߂����g�����������B
%href
dxfload


%index
modelscale
���f���̃T�C�Y��ύX����
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : ���f��ID
(x,y,z) : X,Y,Z�{��(�����l)
%inst
�w�肵�����f���S�̂��w�肵���X�P�[���l�Ŋg��k�����܂��B
����ɂ�胂�f�����̂��̂̃T�C�Y���̂�ς��邱�Ƃ��\�ɂȂ�܂��B


%index
cammode
�J�������[�h�̐ݒ�
%group
�g����ʐ��䖽��
%prm
mode
mode : ���[�h�l
%inst
�J�����̌����ɂ��Ẵ��[�h��ݒ肵�܂��B
�w��ł��郂�[�h�́A
CAM_MODE_NORMAL		(�J�����̈ʒu�A�p�x�ɏ]��)
�ƁA
CAM_MODE_LOOKAT		(�J�����͒����_����Ɍ����Ă���)
�ł��B
%href
selcam
selcpos
selcint


%index
settoonedge
�g�D�[���V�F�[�f�B���O���̐ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1    : ���f��ID
p2(0) : �G�b�W�̐F(RGB�R�[�h)
p3(0) : Z�I�t�Z�b�g
p4(0) : X�I�t�Z�b�g(0.0�`1.0)
%inst
p1�Ŏw�肵�����f���̃g�D�[���V�F�[�f�B���O���̐ݒ���s�Ȃ��܂��B
p2�ŁA�G�b�W�̐F�R�[�h(RRGGBB)���w�肵�܂��B
p3,p4�͎����l�ɂ��G�b�W�̃I�t�Z�b�g���w�肷�邱�Ƃ��ł��܂��B
Z�I�t�Z�b�g(p3)��ύX���邱�Ƃɂ��A�֊s���̑����𒲐����邱�Ƃ��ł��܂��B
Z�I�t�Z�b�g�̃f�t�H���g�l�́A0.005���ݒ肳��Ă��܂��B
X�I�t�Z�b�g(p4)�́A�g�D�[���V�F�[�f�B���O�Ŏg�p����e�N�X�`����X�������_���w�肵�܂��B
X�I�t�Z�b�g�̃f�t�H���g�l�́A0.5���ݒ肳��Ă���A���̏ꍇ��X�����̔����ɂ�����ʒu�𒆐S�ɂ��āA�e�N�X�`����U�l���v�Z����邱�ƂɂȂ�܂��B

%href
loadtoon
maketoon


%index
event_addefx
efx�O���[�v���Z�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �C�x���gID
(x,y,z) : ���Z�����l
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�O���[�v���Z�C�x���g��ǉ����܂��B
�O���[�v���Z�C�x���g�́A�I�u�W�F�N�g�������Ă���p�����[�^�[��(x,y,z)�̒l�����Z���܂��B

%href
event_addpos
event_addang
event_addangr
event_addscale
event_adddir
event_addwork
newevent
setevent


%index
event_efx
efx�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,x1,y1,z1,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
(x1,y1,z1) : �ݒ肳���l
sw(0)      : ��ԃI�v�V����
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�O���[�v�ω��C�x���g��ǉ����܂��B
�O���[�v�ω��C�x���g�́A�I�u�W�F�N�g�������Ă���p�����[�^�[�̎��Ԃɂ��ω���ݒ肵�܂��B
frame�Ŏw�肵���t���[�������o�߂�������(x1,y1,z1)�̒l�ɂȂ�܂��B
sw�̕�ԃI�v�V�����́A�ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
	sw = 0 : ���j�A���(��Βl)
	sw = 1 : �X�v���C�����(��Βl)
	sw = 2 : ���j�A���(���Βl)
	sw = 3 : �X�v���C�����(���Βl)
^p
sw���ȗ������ꍇ�ɂ́A��Βl���j�A���ݒ肳��܂��B

%href
event_pos
event_ang
event_angr
event_scale
event_dir
event_work
newevent
setevent


%index
event_setefx
efx�O���[�v�ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,x1,y1,z1,x2,y2,z2
id         : �C�x���gID
(x1,y1,z1) : �ݒ肳���l(�����l)
(x2,y2,z2) : �ݒ肳���l(����l)
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�O���[�v�ݒ�C�x���g��ǉ����܂��B
�O���[�v�ݒ�C�x���g�́A�I�u�W�F�N�g�������Ă���p�����[�^�[��ݒ肵�܂��B
(x1,y1,z1)��(x2,y2,z2)���w�肷��ƁA���ꂼ��͈͓̔��ɂ���l�𗐐��ō쐬���܂��B
(x2,y2,z2)���ȗ����āA(x1,y1,z1)�������w�肵���ꍇ�͂��̂܂ܒl���ݒ肳��܂��B

%href
event_setpos
event_setang
event_setangr
event_setscale
event_setdir
event_setwork
newevent
setevent


%index
event_uv
UV�ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1    : �C�x���gID
p2    : X�I�t�Z�b�g
p3    : Y�I�t�Z�b�g
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁAUV�ݒ�C�x���g��ǉ����܂��B
UV�ݒ�C�x���g�́A2D�y��3D(x�`�����f��������)�̒P��|���S��������UV�𓮓I�ɕύX���܂��B
����́A�e�N�X�`���[�A�j���[�V���������������邽�߂̂��̂ŁA�C�x���g�����s�����ƁA�e�N�X�`����UV���W��(p2,p3)�Ŏw�肳�ꂽ�l(�h�b�g��)�ɍĐݒ肳��܂��B

%href
newevent
setevent


%index
setobjmodel
�I�u�W�F�N�g�̃��f���ݒ�
%group
�g����ʐ��䖽��
%prm
ObjID,modelID
ObjID    : �I�u�W�F�N�gID
modelID  : ���f��ID
%inst
�w�肳�ꂽ�I�u�W�F�N�g���\�����郂�f����ύX���܂��B
%href
regobj
setobjmode


%index
event_wpos
pos�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
sw(1)      : ��ԃI�v�V����
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�O���[�v�ω��C�x���g��ǉ����܂��B
�O���[�v�ω��C�x���g�́A�I�u�W�F�N�g�������Ă���p�����[�^�[�̎��Ԃɂ��ω���ݒ肵�܂��B
frame�Ŏw�肵���t���[�������o�߂�������work�O���[�v(���[�N�l)�̒l�ɂȂ�܂��B
sw�̕�ԃI�v�V�����́A�ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
	sw = 0 : ���j�A���(��Βl)
	sw = 1 : �X�v���C�����(��Βl)
	sw = 2 : ���j�A���(���Βl)
	sw = 3 : �X�v���C�����(���Βl)
^p
sw���ȗ������ꍇ�ɂ́A��Βl�X�v���C�����ݒ肳��܂��B

%href
event_wang
event_wangr
event_wscale
event_wdir
event_wefx
newevent
setevent


%index
event_wang
ang�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
sw(0)      : ��ԃI�v�V����
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�O���[�v�ω��C�x���g��ǉ����܂��B
�O���[�v�ω��C�x���g�́A�I�u�W�F�N�g�������Ă���p�����[�^�[�̎��Ԃɂ��ω���ݒ肵�܂��B
frame�Ŏw�肵���t���[�������o�߂�������work�O���[�v(���[�N�l)�̒l�ɂȂ�܂��B
sw�̕�ԃI�v�V�����́A�ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
	sw = 0 : ���j�A���(��Βl)
	sw = 1 : �X�v���C�����(��Βl)
	sw = 2 : ���j�A���(���Βl)
	sw = 3 : �X�v���C�����(���Βl)
^p
sw���ȗ������ꍇ�ɂ́A��Βl���j�A���ݒ肳��܂��B

%href
event_wpos
event_wangr
event_wscale
event_wdir
event_wefx
newevent
setevent


%index
event_wscale
scale�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
sw(0)      : ��ԃI�v�V����
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�O���[�v�ω��C�x���g��ǉ����܂��B
�O���[�v�ω��C�x���g�́A�I�u�W�F�N�g�������Ă���p�����[�^�[�̎��Ԃɂ��ω���ݒ肵�܂��B
frame�Ŏw�肵���t���[�������o�߂�������work�O���[�v(���[�N�l)�̒l�ɂȂ�܂��B
sw�̕�ԃI�v�V�����́A�ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
	sw = 0 : ���j�A���(��Βl)
	sw = 1 : �X�v���C�����(��Βl)
	sw = 2 : ���j�A���(���Βl)
	sw = 3 : �X�v���C�����(���Βl)
^p
sw���ȗ������ꍇ�ɂ́A��Βl���j�A���ݒ肳��܂��B

%href
event_wpos
event_wang
event_wangr
event_wdir
event_wefx
newevent
setevent


%index
event_wdir
dir�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
sw(0)      : ��ԃI�v�V����
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�O���[�v�ω��C�x���g��ǉ����܂��B
�O���[�v�ω��C�x���g�́A�I�u�W�F�N�g�������Ă���p�����[�^�[�̎��Ԃɂ��ω���ݒ肵�܂��B
frame�Ŏw�肵���t���[�������o�߂�������work�O���[�v(���[�N�l)�̒l�ɂȂ�܂��B
sw�̕�ԃI�v�V�����́A�ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
	sw = 0 : ���j�A���(��Βl)
	sw = 1 : �X�v���C�����(��Βl)
	sw = 2 : ���j�A���(���Βl)
	sw = 3 : �X�v���C�����(���Βl)
^p
sw���ȗ������ꍇ�ɂ́A��Βl���j�A���ݒ肳��܂��B

%href
event_wpos
event_wang
event_wangr
event_wscale
event_wefx
newevent
setevent


%index
event_wefx
efx�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
sw(0)      : ��ԃI�v�V����
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�O���[�v�ω��C�x���g��ǉ����܂��B
�O���[�v�ω��C�x���g�́A�I�u�W�F�N�g�������Ă���p�����[�^�[�̎��Ԃɂ��ω���ݒ肵�܂��B
frame�Ŏw�肵���t���[�������o�߂�������work�O���[�v(���[�N�l)�̒l�ɂȂ�܂��B
sw�̕�ԃI�v�V�����́A�ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
	sw = 0 : ���j�A���(��Βl)
	sw = 1 : �X�v���C�����(��Βl)
	sw = 2 : ���j�A���(���Βl)
	sw = 3 : �X�v���C�����(���Βl)
^p
sw���ȗ������ꍇ�ɂ́A��Βl���j�A���ݒ肳��܂��B

%href
event_wpos
event_wang
event_wangr
event_wscale
event_wdir
newevent
setevent


%index
event_regobj
�I�u�W�F�N�g�����C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,model,event
id         : �C�x���gID
model      : ���f��ID
event      : �C�x���gID
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�I�u�W�F�N�g�����C�x���g��ǉ����܂��B
�I�u�W�F�N�g�����C�x���g�́Aregobj���߂Ɠ��l�ɃC�x���g���s���ɐV�����I�u�W�F�N�g�𐶐����܂��B
�p�����[�^�[�Ƃ��āAmodel�Ƀ��f��ID���Aevent�ɃC�x���gID���w�肷�邱�Ƃ��ł��܂��B�܂��A���������I�u�W�F�N�g�̍��W�́A�C�x���g�����s���Ă���I�u�W�F�N�g�̍��W���p������܂��B

%href
event_delobj
newevent
setevent


%index
event_eprim
�G�t�F�N�g�ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,model,param,val1,val2
id     : �C�x���gID
model  : ���f��ID
param  : �p�����[�^�[ID
val1   : �ݒ�l1
val2   : �ݒ�l2
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�G�t�F�N�g�ݒ�C�x���g��ǉ����܂��B
seteprim���߂Ɠ��l�̑�����C�x���g���s���ɍs�Ȃ����Ƃ��ł��܂��B
model�ɁAaddeprim���߂ɂ���č쐬���ꂽ���f��ID���w�肵�܂��B
���f��ID���}�C�i�X�l�̏ꍇ�́A�C�x���g���ݒ肳��Ă���I�u�W�F�N�g�Ɋ��蓖�Ă��Ă��郂�f�����ΏۂɂȂ�܂��B
param��seteprim���߂Ɠ��l�̃p�����[�^�[ID���w�肵�܂��B
�������A�F�w��(�p�����[�^�[ID16�ȍ~)�ɂ��ẮAA��R��G��B�̏��Ԃŕʂȃp�����[�^�[ID�����蓖�Ă��Ă��܂��B
(seteprim���߂ł́A16�ɂ�����ID��16(A),17(R),18(G),19(B)�ɕ�������Ă��܂��B)
val2���ȗ������ꍇ�ɂ́Aval1�̒l���ݒ肳��܂��B
val2���w�肳�ꂽ�ꍇ�́A���ۂɐݒ肳���l��val1�`val2�ɂȂ�܂��B
val1�`val2�́A�C�x���g���s���ɗ����Ő�������܂��B

%href
addeprim
seteprim
newevent
setevent


%index
selcam
�J������MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
mocofs
mocofs : MOC�̃O���[�v�w��
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v���J�����ɐݒ肵�܂��B
�ʏ�́Aselcpos,selcang,selcint���߂����g�����������B
%href
selmoc
selpos
selang
selscale
seldir
selcpos
selcang
selcint


%index
sellight
������MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id,ofs
id     : ������ID(0�`3)
mocofs : MOC�̃O���[�v�w��
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v�����C�g(����)�ɐݒ肵�܂��B
�ʏ�́Asellpos,sellang,sellcolor���߂����g�����������B
%href
sellpos
sellang
sellcolor
selmoc
selcam


%index
selcpos
�J�������W��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v���J������A(�ړ����W)�ɐݒ肵�܂�
%href
selmoc
selpos
selang
selscale
seldir
selcam
selcang
selcint


%index
selcang
�J�����p�x��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v���J������B(��]�p�x)�ɐݒ肵�܂�
cammode�̐ݒ肪�����_�����郂�[�h�ɂȂ��Ă���ꍇ�́A�J������]�p�͎����I�ɐݒ肳��܂��B
%href
cammode
selmoc
selpos
selang
selscale
seldir
selcam
selcpos
selcint


%index
selcint
�J���������_��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��C(�����_���W)�ɐݒ肵�܂�
�����_�́Acammode�̐ݒ�ɂ���ėL���ɂȂ�܂��B
%href
cammode
selmoc
selpos
selang
selscale
seldir
selcam
selcpos
selcang


%index
sellpos
�������W��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : ������ID(0�`3)
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v�����C�g(����)�̍��W�ɐݒ肵�܂��B
%href
sellight
sellang
sellcolor
sellambient


%index
sellang
�����p�x��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : ������ID(0�`3)
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v�����C�g(����)�̊p�x�ɐݒ肵�܂��B
%href
sellight
sellpos
sellcolor
sellambient


%index
sellcolor
�����F��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : ������ID(0�`3)
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v�����C�g(����)�̐F(R,G,B,Ambient)�ɐݒ肵�܂��B
%href
sellight
sellpos
sellang
sellambient


%index
sellambient
�����F��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : ������ID(0�`3)
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v���A���r�G���g(����)�̐F(R,G,B)�ɐݒ肵�܂��B
%href
sellight
sellpos
sellang
sellcolor


%index
objgetv
MOC���𐮐��l�Ŏ擾
%group
�g����ʐ��䖽��
%prm
v
v    : �l����������ϐ���
%inst
MOC�ɐݒ肳��Ă���l��ϐ�v�ɐ����ő�����܂��B
v.0�`v.3�ɂ��ꂼ��̃I�t�Z�b�g�ԍ������l���������܂��B
%href
objsetv
objsetfv
objgetfv
fvset
fvadd
fvsub
fvmul
fvdiv


%index
objsetv
MOC���𐮐��l�Őݒ�
%group
�g����ʐ��䖽��
%prm
v
v    : �l���������Ă���ϐ���
%inst
�ϐ�v�ɐ����ő������Ă���l��MOC�ɐݒ肵�܂��B
v.0�`v.3�����ꂼ��̃I�t�Z�b�g�ԍ��ɐݒ肳��܂��B
%href
objgetv
objsetfv
objgetfv
fvset
fvadd
fvsub
fvmul
fvdiv


%index
objgetstr
MOC���𕶎���Ŏ擾
%group
�g����ʐ��䖽��
%prm
sval
sval : ���ʂ��������镶����^�ϐ���
%inst
MOC�ɐݒ肳��Ă���l��ϐ�sval�ɕ�����ŏ����o���܂��B
%href
fv2str
f2str


%index
objact
�w��A�j���[�V�������J�n
%group
�g����ʐ��䖽��
%prm
ObjID,Anim,mode
ObjID   : �I�u�W�F�N�gID
Anim    : �A�j���[�V�����C���f�b�N�X�l
mode(0) : �ݒ胂�[�h(0=����/1=�I����)
%inst
�w�肳�ꂽ�I�u�W�F�N�g�̃A�j���[�V�������J�n���܂��B
Anim�ŕ�������A�j���[�V�����������C���f�b�N�X�l���w�肵�܂��B
�C���f�b�N�X�l�́A�����A�j���[�V�����ǂݍ��݂��s�Ȃ������ԂɁA0,1,2,3�c�Ƃ��������ŕ\�킳��܂��B
Anim�Ƀ}�C�i�X�̒l(-1)���w�肷�邱�ƂŁA�A�j���[�V����������(��~)�����邱�Ƃ��ł��܂��B
�܂��Amode�̒l�ɂ��ݒ�̃��[�h���w�肷�邱�Ƃ��ł��܂��B
�ݒ胂�[�h��0�܂��͏ȗ������ꍇ�́A�����ɃA�j���[�V������؂�ւ��܂��B
�ݒ胂�[�h��1�Ɏw�肵���ꍇ�́A���ݍĐ�����Ă���A�j���[�V�������I���̂�҂��Ă���A�؂�ւ����s�Ȃ��܂��B
�ݒ胂�[�h1�ŁAAnim�Ƀ}�C�i�X�l���w�肵���ꍇ�́A���݂̃A�j���[�V�����Đ��I����ɃA�j���[�V�������~���܂��B
�ݒ胂�[�h0�ŃA�j���[�V�������Đ������ꍇ�́A�Đ��X�s�[�h�̓f�t�H���g�l�ɖ߂���A���s�[�g�Đ����s�Ȃ���ݒ�ɂȂ�܂��B
�A�j���[�V�����̊J�n���́A���f�������W���I�ȃA�j���[�V�������x(modelspeed���߂ɂĕύX�\)���ݒ肳��܂��B
�A�j���[�V�����̍Đ����́Aobjspeed���߂ɂ�葬�x��ύX���邱�Ƃ��\�ł��B

%href
addxfile
addxanim
objspeed
modelspeed
getanim


%index
getanim
�A�j���[�V���������擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1    : ��񂪑�������ϐ�
p2(0) : �I�u�W�F�N�gID
p3(0) : ���ID
%inst
p2�Ŏw�肳�ꂽ�I�u�W�F�N�g�̃A�j���[�V�����Ɋւ�������擾���āAp1�Ŏw�肳�ꂽ�ϐ��ɑ�����܂��B
�擾�������̎�ނ́Ap3�̏��ID�Ŏw�肷�邱�Ƃ��ł��܂��B
���ID�́A�ȉ��̒l���p�ӂ���Ă��܂��B
^p
���ID   ���e
-----------------------------------------------
  0      �A�j���[�V�����J�n����̎���(ms)
  1      �A�j���[�V�������[�v�t���O
^p
���ʂ���������ϐ��́A�����I�ɐ����^�ɐݒ肳��܂��B
�A�j���[�V�������[�v�t���O�́A�A�j���[�V�����J�n����0�ł����A�Ō�܂ōĐ����ꂽ�ꍇ�ɂ�1���Ԃ���܂��B

%href
objact


%index
addxfile
X�t�@�C�����f�����쐬
%group
�g����ʐ��䖽��
%prm
var,"filename"
var        : �쐬���ꂽ���f��ID����������ϐ���
"filename" : �ǂݍ��݂��s�Ȃ��t�@�C����
%inst
x�`���̃��f���t�@�C����ǂݍ��݂܂��B
����Ƀ��f�����ǂ݂��܂��ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
�ǂݍ��݂Ɏ��s�����ꍇ�ɂ́Avar�Ŏw�肵���ϐ���-1���������܂��B

HGIMG3���ǂݍ���x�`���́ADirectX8�ȍ~�̃X�L�����b�V���ɑΉ����Ă��܂��B
�����X�L�����f���y�уA�j���[�V�������o�͉\�Ȋe��c�[���ŁAx�`���̏o�͂ɑΉ��������̂�ʓr���p�Ӊ������B

setreq���߂ɂ���Ė@���Čv�Z�X�C�b�`(SYSREQ_CALCNORMAL)��0�ȊO�ɐݒ�
����Ă���ꍇ�ɂ́A���f���@���̍Čv�Z���s�Ȃ��܂��B
�ʏ�́Ax�`���t�@�C���ɋL�^���ꂽ�@�������̂܂܎g�p���܂��B

%href
addxanim



%index
addxanim
X�t�@�C���A�j���[�V�����̒ǉ�
%group
�g����ʐ��䖽��
%prm
ModelID,"filename"
ModelID    : ���f��ID
"filename" : �ǂݍ��݂��s�Ȃ��t�@�C����
%inst
X�t�@�C�����f���ɁA�A�j���[�V�����f�[�^��ǉ����܂��B
ModelID�ł́A���ł�addxfile���߂ɂ���ēǂݍ��܂�Ă��郂�f��ID���w�肷��K�v������܂��B
�A�j���[�V�����̒ǉ��ɐ�������ƁA�V�X�e���ϐ�stat�Ƀ��f��ID���������܂��B
�A�j���[�V�����̒ǉ��Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��-1���������܂��B
^
addxanim���߂́A�P�̃��f���ŕ����̃A�j���[�V������؂�ւ��Ďg�p����ꍇ�ɗ��p���܂��B
�ŏ��Ƀ��f���S�̂ƍŏ��̃A�j���[�V�������܂񂾃f�[�^��addxfile���߂ɂ��ǂݍ��݁A����ɒǉ��ŃA�j���[�V����������o�^����ꍇ��addxanim���߂��g�p���܂��B
�K���A���f����{�[���̍\���͓���̂��̂���o�͂���Ă���K�v������܂��B

�����̃A�j���[�V�����́Aobjact���߂ɂ���Đ؂�ւ��邱�Ƃ��\�ł��B
�؂�ւ��邽�߂̃A�j���[�V�����C���f�b�N�X�l�́A�ŏ���addxfile���߂œǂݍ��܂ꂽ�A�j���[�V������0�Ƃ��āA�ȍ~addxanim���߂Œǉ����邽�т�1,2,3�c�Ƒ������Ă����܂��B
^
�ǉ��ł���A�j���[�V�����̍ő吔�́A�W����16(���Ƃ�x�t�@�C���܂�)�ł��B
�ő吔���g������ꍇ�́Asetreq���߂ɂ���ăA�j���[�V�����ő吔(SYSREQ_MDLANIM)��K�؂ɐݒ肵�Ă��������B
^
�����̃A�j���[�V������������X�t�@�C������́A�ŏ��̂P�����ǂݍ��ނ��Ƃ��ł��܂���B�����ǂݍ��ލۂɂ́A������X�t�@�C����p�ӂ���K�v������܂��B

%href
addxfile
objact


%index
objspeed
�A�j���[�V�����Đ����x�̐ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : �I�u�W�F�N�gID
p2(0) : �P�t���[��������̍Đ����x(�����l)
%inst
p1�Ŏw�肳�ꂽ�I�u�W�F�N�gID�̃A�j���[�V�����Đ����x��ݒ肵�܂��B
p2�łP�t���[��������̍Đ����x(ms)�������l�Ŏw�肷�邱�Ƃ��ł��܂��B
���̖��߂́Aobjact���߂ɂ��Đ�����Ă���A�j���[�V�����̍Đ����x��ύX���邽�߂̂��̂ł��B
objact���߂����s�����ꍇ�́Amodelspeed���߂ɂ���Đݒ肳��Ă���W���̃A�j���[�V�����Đ����x���K�p����܂��B
�A�j���[�V�����̍Đ��O�ɑ��x��ݒ肷��ꍇ�́Amodelspeed���߂��g�p���Ă��������B

%href
modelspeed
objact




%index
modelspeed
�A�j���[�V�����Đ����x�̐ݒ�(2)
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : ���f��ID
p2(0) : �P�t���[��������̍Đ����x(�����l)
%inst
p1�Ŏw�肳�ꂽ���f��ID�����W���̃A�j���[�V�����Đ����x��ݒ肵�܂��B
p2�łP�t���[��������̍Đ����x(ms)�������l�Ŏw�肷�邱�Ƃ��ł��܂��B
�ȍ~�́A�w�肳�ꂽ���f�����g�p����I�u�W�F�N�g���A�A�j���[�V�������Đ�����ꍇ�̕W�����x�Ƃ��Đݒ肳��܂��B
modelspeed���߂ɂ���ĕW���̃A�j���[�V�����Đ����x���ݒ肳��Ȃ������ꍇ�́A15(ms)���I�u�W�F�N�g���������ɐݒ肳��܂��B
objact���߂ɂ��A���łɍĐ�����Ă���A�j���[�V�����̍Đ����x�́Aobjspeed���߂ɂ���ĕύX���Ă��������B


%href
objspeed
objact


%index
hgcapture
DirectX��ʃf�[�^�̎擾
%group
�g����ʐ��䖽��
%prm

%inst
HGIMG���`�悵�Ă���t���[���o�b�t�@�̏���HSP�̉�ʂɃR�s�[���܂��B
gsel���߂ȂǂŌ��݃A�N�e�B�u�ȉ�ʂ��R�s�[��ɂȂ�܂��B
�K���AHGIMG�������������T�C�Y�Ɠ����傫���̃o�b�t�@���R�s�[��ɂ��Ă��������B
hgcapture���߂́AHSP�̉��z��ʃo�b�t�@�ɃR�s�[���s�Ȃ��܂����A��ʂ̍X�V�͍s�Ȃ��܂���B
�擾���ꂽ��ʂ��E�B���h�E��Ŕ��f�����邽�߂ɂ́Aredraw���߂ɂ��ĕ`����s�Ȃ��K�v������܂��B
HGIMG�������������E�B���h�EID�Ɠ����o�b�t�@���R�s�[��ɂ����ꍇ�́AHGIMG�̉�ʂ��I�[�o�[���C����Ă��邽�߁A���e���\������Ȃ��̂Œ��ӂ��Ă��������B
�܂��Ahgcapture���߂́A�r�f�I�J�[�h�̃t���[���o�b�t�@�����ʂ̃f�[�^�����C���������ɃR�s�[���邽�߁A�r�f�I�J�[�h��CPU���ׂ��������܂��B

%href
redraw



%index
objlight
�Q�Ƃ���郉�C�g�̐ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1(0)  : ���C�g���ݒ肳���I�u�W�F�N�gID
p2(0)  : ���C�g�Ƃ��ĎQ�Ƃ����I�u�W�F�N�gID
p3(-1) : �ݒ胂�[�h
%inst
p1�Ŏw�肳�ꂽ�I�u�W�F�N�gID���e�����󂯂郉�C�g��ݒ肵�܂��B
p2�ŎQ�Ƃ����I�u�W�F�N�gID���w�肵�܂��B
�ʏ�A���ׂẴI�u�W�F�N�g�͊�{���C�g(HGOBJ_LIGHT)�̉e�����󂯂܂��B
objlight���߂ɂ��A��{���C�g�ȊO�̃I�u�W�F�N�g����e�����󂯂��ԂɕύX���܂��B
�Q�Ƃ����ǉ��̃��C�g�I�u�W�F�N�g�́Areglight���߂ō쐬���邱�Ƃ��ł��܂��B

p3�Ń��[�h���w�肷�邱�Ƃ��ł��܂��Bp3�̒l�́A�ȉ��̈Ӗ��������܂��B
^p
���[�h   ���e
---------------------------------------
   1     ���C�g�̕���
   2     ���C�g�̐F
   4     ���C�g�̃A���r�G���g�F
^p
�����̍��ڂ�ݒ肷��ꍇ�́A���ꂼ��̃��[�h�l�����Z���Ă��������B
p3���ȗ�����ƁA�����E�F�E�A���r�G���g�F�̂��ׂĂ��ݒ肳��܂��B

%href
reglight



%index
reglight
���C�g�I�u�W�F�N�g�̓o�^
%group
�g����ʐ��䖽��
%prm
p1
p1 : �쐬���ꂽ�I�u�W�F�N�gID����������ϐ���
%inst
�ǉ��̃��C�g�I�u�W�F�N�g��o�^���āAp1�Ɏw�肳�ꂽ�ϐ���ID�������܂��B
���C�g�I�u�W�F�N�g�́Aobjlight���߂ɂ���ĐV�����Q�Ƃ���邽�߂̃��C�g�Ƃ��Ĉ������Ƃ��ł��܂��B
�擾���ꂽ�I�u�W�F�N�gID�́A���̃I�u�W�F�N�g�Ɠ������@�Ńp�����[�^�[��ݒ�A�擾���邱�Ƃ��\�ł��B
�ݒ�ł���p�����[�^�[�́A��{���C�g(HGOBJ_LIGHT)�Ɠ��l�̂��̂ɂȂ�܂��B

%href
objlight



%index
getxinfo
X���f���\�����̎擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1 : �쐬���ꂽ���f����񕶎��񂪑�������ϐ���
p2 : �I�u�W�F�N�gID
p3 : �m�[�hID
p4 : �ݒ胂�[�h

%inst
p2�Ŏw�肳�ꂽ�I�u�W�F�N�gID���������f���̏��𕶎���Ƃ���
p1�Ŏw�肵���ϐ��ɑ�����܂��B
�K��X�`���̃��f�����I�u�W�F�N�gID���w�肷��K�v������܂��B
p1�̕ϐ��ɂ́A������̌`�ŏ�񂪑������܂��B
p2�Ńm�[�hID���w�肷�邱�Ƃ��ł��܂��B
�m�[�hID��0����n�܂鐔�l�ŁA�{�[���⃁�b�V�����Ƃɕ�����ID������U���Ă��܂��B
�m�[�hID��-1�Ȃǃ}�C�i�X�l���w�肵���ꍇ�́A���s�R�[�h�ŋ�؂�ꂽ1�s1�v�f�̌`�ł��ׂẴm�[�h��񂪕Ԃ���܂��B
����ɂ��m�[�hID�̍ő吔�𒲂ׂ邱�Ƃ��ł��܂��B
(�m�[�hID�̍ő吔�́A�������f���ł���΃��[�h������Ă��Ă����ʂł��B)
p4�Ŏ擾������̎�ނ��w�肷�邱�Ƃ��ł��܂��B
p4�Ŏw��ł���l�́A�ȉ��̒ʂ�ł��B
^p
���[�h        ���e
---------------------------------------------
 0            �m�[�h��
 1            �m�[�h�̃��[���h���W
 2            �m�[�h��X,Y,Z��]�p�x
 16           �m�[�h�����}�e���A����
 $1000+MatID  �}�e���A���̐F( Diffuse Color )
 $2000+MatID  �e�N�X�`����COM�|�C���^(�e�N�X�`�����g�p����0)
 $10000+Index  ���_���W
 $20000+Index  UV���W
^p
$1000��$2000�́A�}�e���A��ID�Ƒg�ݍ��킹�Ďg�p���܂��B
�}�e���A��ID�́A�m�[�h���ƂɊ���U��ꂽ0����n�܂�l�ŁA�L���ȃ}�e���A��ID�̐��́A���[�h16�Œ��ׂ邱�Ƃ��ł��܂��B
^
$10000��$20000�́A�����o�b�t�@��Index�Ƒg�ݍ��킹�Ďg�p���܂��B
�w�肵���C���f�b�N�X�������_���W�܂���UV���W�̒l���擾���邱�Ƃ��ł��܂��B
^
getxinfo���߂́A�{�[�����܂ރ��f�������ʂ̈ʒu���Ȃǂ𓾂邽�߂Ɏg�p���邱�Ƃ��ł��܂��B
�����̃m�[�h�������f������������ꍇ�ɂ́A�����������邱�Ƃ�����̂Ń��A���^�C���ȓ�����s�Ȃ��A�v���P�[�V�����ł͒��ӂ��ĉ������B
���݂́A���[�h1�y��2�̒l�͍Ō�ɕ`�悳�ꂽ���f���Ɋւ�������擾���܂��B
�����̃I�u�W�F�N�g�Ń��f�������L���Ă���ꍇ�́A�������擾����܂���̂ł����ӂ��������B

%href
setxinfo



%index
setxinfo
X���f�����̏ڍאݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,x,y,z
p1 : �I�u�W�F�N�gID
p2 : �m�[�hID
p3 : �ݒ胂�[�h
(x,y,z) : �ݒ肳���x�N�g�����(�����l)

%inst
p1�Ŏw�肳�ꂽ�I�u�W�F�N�gID���������f���̏ڍ׏���ݒ肵�܂��B
�K��X�`���̃��f�����I�u�W�F�N�gID���w�肷��K�v������܂��B
���f���������̃m�[�h(�{�[���⃁�b�V���Ȃ�)�������Ă���ꍇ�ɂ́Ap2�Ńm�[�hID���w�肷�邱�Ƃ��ł��܂��B
�m�[�hID��0����n�܂鐔�l�ŁA�{�[���⃁�b�V�����Ƃɕ�����ID������U���Ă��܂��B
(�w��\�ȃm�[�hID�͈̔͂́Agetxinfo���߂ɂ���ăm�[�h�ꗗ���擾���Ē��ׂ邱�Ƃ��ł��܂��B)
p3�Ŏ擾������̎�ނ��w�肷�邱�Ƃ��ł��܂��B
p3�Ŏw��ł���l�́A�ȉ��̒ʂ�ł��B
^p
���[�h        ���e
---------------------------------------------
 1            �m�[�h�̃��[�J�����W(x,y,z)
 2            �m�[�h�̉�]�p�x(x,y,z)
 $1000+MatID  �}�e���A���̐F( xyz=RGB )
 $2000+MatID  �Q�Ƃ����e�N�X�`��( x=�e�N�X�`��ID )
 $10000+Index  ���_���W( x,y,z )
 $20000+Index  UV���W( x,y )
^p
$1000��$2000�́A�}�e���A��ID�Ƒg�ݍ��킹�Ďg�p���܂��B
�}�e���A��ID�́A�m�[�h���ƂɊ���U��ꂽ0����n�܂�l�ŁA�L���ȃ}�e���A��ID�̐��́Agetxinfo���߂̃��[�h16�Œ��ׂ邱�Ƃ��ł��܂��B
^
$10000��$20000�́A�����o�b�t�@��Index�Ƒg�ݍ��킹�Ďg�p���܂��B
�w�肵���C���f�b�N�X�������_���W�܂���UV���W�𒼐ڕҏW���邱�Ƃ��ł��܂��B
^
setxinfo���߂́A�{�[�����܂ރ��f�������ʂ̏�Ԃ�ύX���邽�߂Ɏg�p���邱�Ƃ��ł��܂��B
�A�j���[�V�������ݒ肳��Ă���m�[�h�͐ݒ肷�邱�Ƃ��ł��܂���B
�܂��A�������m�[�hID���w�肵�Ȃ��ƕ\��������邱�Ƃ�����̂ŁA�\���ɒ��ӂ��Ďg�p���Ă��������B

%href
getxinfo



%index
getobjmodel
�I�u�W�F�N�g�̃��f��ID�擾
%group
�g����ʐ��䖽��
%prm
var,id
var      : ���ʂ���������ϐ���
id       : �I�u�W�F�N�gID
%inst
�w�肵���I�u�W�F�N�g�Ɋ��蓖�Ă��Ă��郂�f��ID���擾���Avar�Ŏw�肳�ꂽ�ϐ��ɑ�����܂��B

%href
setobjmodel



%index
modelcols
�R���W�����p�����[�^�[�̐ݒ�(2)
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : ���f��ID
p2(1.0) : �R���W�����p�����[�^�[X(�����l)
p3(1.0) : �R���W�����p�����[�^�[Y(�����l)
p4(1.0) : �R���W�����p�����[�^�[Z(�����l)
p5(0) : �ݒ�^�C�v
%inst
p1�Ŏw�肳�ꂽ���f��ID�����W���̃R���W�����p�����[�^�[��ݒ肵�܂��B
�ȍ~�́A�w�肳�ꂽ���f�����g�p����I�u�W�F�N�g���������̃R���W�����p�����[�^�[�Ƃ��Đݒ肳��܂��B
p5�̐ݒ�^�C�v��0�̏ꍇ�́Agetcoli���߂̃R���W�������莞�ɁA
�w�肳�ꂽ�l�ɑ΂���X�P�[��(�{��)��������X,Y,Z�����ƂɎw�肷�邱�Ƃ��ł��܂��B
(�W���̃R���W�����X�P�[�����ݒ肳��Ȃ������ꍇ�́A1.0(���{)���ݒ肳��܂��B)
p5�̐ݒ�^�C�v��1�̏ꍇ�́A�g���R���W�����p�����[�^�[�̐ݒ�ƂȂ�܂��B
p2���I�u�W�F�N�g�̏d��(������)�Ap3�������Ap4�𔼌a�Ƃ����~�����R���W��������p�ɐݒ肵�܂��B
(����́Aobjwalk���߂ɂ��n�`����p�Ŏg�p���邽�߂̐ݒ�ł�)

�I�u�W�F�N�g���Ƃ̃R���W�����p�����[�^�[�́Asetcolscale���߂ɂ���Đݒ肷�邱�Ƃ��\�ł��B

%href
setcolscale




%index
setcolscale
�R���W�����p�����[�^�[�̐ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : �I�u�W�F�N�gID
p2(1.0) : �R���W�����p�����[�^�[X(�����l)
p3(1.0) : �R���W�����p�����[�^�[Y(�����l)
p4(1.0) : �R���W�����p�����[�^�[Z(�����l)
p5(0) : �ݒ�^�C�v
%inst
p1�Ŏw�肳�ꂽ�I�u�W�F�N�gID�����R���W�����p�����[�^�[��ݒ肵�܂��B
p5�̐ݒ�^�C�v��0�̏ꍇ�́Agetcoli���߂̃R���W�������莞�ɁA�w�肳�ꂽ�l�ɑ΂���X�P�[��(�{��)��������X,Y,Z�����ƂɎw�肷�邱�Ƃ��ł��܂��B
(�W���̃R���W�����X�P�[�����ݒ肳��Ȃ������ꍇ�́A1.0(���{)���ݒ肳��܂��B)
p5�̐ݒ�^�C�v��1�̏ꍇ�́A�g���R���W�����p�����[�^�[�̐ݒ�ƂȂ�܂��B
p2���I�u�W�F�N�g�̏d��(������)�Ap3�������Ap4�𔼌a�Ƃ����~�����R���W��������p�ɐݒ肵�܂��B
(����́Aobjwalk���߂ɂ��n�`����p�Ŏg�p���邽�߂̐ݒ�ł�)

setcolscale���߂ɂ���ăR���W�����p�����[�^�[���ݒ肳��Ȃ������ꍇ�́A���f�����Ƃ̕W���R���W�����p�����[�^�[���g�p����܂��B

%href
modelcols



%index
modelshade
�V�F�[�f�B���O���[�h�̐ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : ���f��ID
p2(0) : �V�F�[�f�B���O���[�h
%inst
p1�Ŏw�肳�ꂽ���f��ID�����V�F�[�f�B���O���[�h��ݒ肵�܂��B
�V�F�[�f�B���O���[�h�́A���f����\���������ɍs�Ȃ������v�Z�̕��@�������܂��B
���[�h�l�́A�ȉ��̂����ꂩ�ɂȂ�܂��B
^p
	���[�h�l      ���e
	-----------------------------------------------------
	   0          �R���X�^���g(�����v�Z�Ȃ�)
	   1          �O�[���[(DirectX�W���̌����v�Z)
	   2          �������C�e�B���O
^p
���[�h�l��0�̏ꍇ�́A�����v�Z���s�Ȃ킸��Ƀ}�e���A���F�����̂܂ܔ��f���܂��B(�R���X�^���g�V�F�[�f�B���O)
���[�h�l��0�̏ꍇ�́A���C�g�F�A�A���r�G���g�F���l�����������v�Z���s�Ȃ��܂��B���̏ꍇ�̕\���F�́A
^p
	�P�x = ���̋��� * ���C�g�F * �}�e���A���F + �A���r�G���g�F
^p
�Ƃ��������g�p����܂��B(�P�x��255���z�����ꍇ�́A255�ɂȂ�܂��B)
���[�h�l��2�̏ꍇ�́A���C�g�F��V���F�A�A���r�G���g�F��n��F�Ƃ��Ĕ������C�e�B���O�̌v�Z���s�Ȃ��܂��B
�������C�e�B���O�́ADirectX�W���̌����v�Z�Ɣ�ׂĂ��炩�ł��߂ׂ̍����A�e��\�����邱�Ƃ��ł��܂��B
���݂̃o�[�W�����ł́A�V�F�[�f�B���O���[�h�̐ݒ�́Ax�`���̃��f���ɂ̂ݓK�p���邱�Ƃ��ł��܂��B
�܂��A�V�F�[�f�B���O���[�h�P�ł̓��C�g��scale(�J���[)�p�����[�^�͌��ݔ��f����Ȃ��d�l�ƂȂ��Ă��܂��̂ł��������������B

%href


%index
modelorder
��]�������[�h�̐ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : ���f��ID
p2(0) : ��]�������[�h
%inst
p1�Ŏw�肳�ꂽ���f��ID������]�����̃��[�h��ݒ肵�܂��B
��]�������[�h�ɂ��A3D�I�u�W�F�N�g�\�����̉�]������ݒ肷�邱�Ƃ��ł��܂��B
���[�h�̒l�́A�ȉ��̂����ꂩ�ɂȂ�܂��B
^p
	���[�h�l  �}�N��                 ��]����
	------------------------------------------------------
	    0     HGMODEL_ROTORDER_ZYX   Z��Y��X
	    1     HGMODEL_ROTORDER_XYZ   X��Y��Z
	    2     HGMODEL_ROTORDER_YXZ   Y��X��Z
^p
�f�t�H���g�̃��f���ł́A���[�h�l0���ݒ肳��Ă��܂��B
(�������Ax�`���̃��f���̂݃��[�h�l1���f�t�H���g�ƂȂ�܂��B)

modelorder���߂́A�ǂ����Ă������ł��Ȃ��I�u�W�F�N�g�̌�����ݒ肷��ꍇ��A�����̃f�[�^�Ƃ̌݊�����邽�߂ɗp�ӂ���Ă��܂��B
�ʏ�A�g�p����͈͂ŕK�{�ƂȂ閽�߂ł͂���܂���B

%href


%index
objchild
�I�u�W�F�N�g�̐e�q�֌W�ݒ�
%group
�g����ʐ��䖽��
%prm
ObjID,ChildObjID
ObjID      : �I�u�W�F�N�gID
ChildObjID : �q���̃I�u�W�F�N�gID
%inst
�w�肳�ꂽ�I�u�W�F�N�g�̎q���ƂȂ�I�u�W�F�N�g��ݒ肵�܂��B
ChildObjID�Ŏw�肳�ꂽ�I�u�W�F�N�g�́AObjID�Ŏw�肳�ꂽ�I�u�W�F�N�g�Ɛe�q�֌W�������ƂɂȂ�܂��B
�ȍ~�͐e�ƂȂ�AObjID�Ŏw�肳�ꂽ�I�u�W�F�N�g�̍��W�A��]�p�x�A�X�P�[�����p�������`�ŕ\�����s�Ȃ��܂��B
�܂��A�e�̃I�u�W�F�N�g���폜���ꂽ�ꍇ�ɂ́A���̎q�����ׂĂ������ɍ폜����܂��B
�q���������Ă���e�I�u�W�F�N�g���AChildObjID�Ɏw�肷�邱�Ƃő��K�w�̍\����ݒ肷�邱�Ƃ��\�ł��B
���łɉ��炩�̐e�������Ă���I�u�W�F�N�g���q���Ɏw�肷�邱�Ƃ͂ł��܂���B
ChildObjID�Ƀ}�C�i�X�l���w�肷��ƁAObjID�Ŏw�肵���I�u�W�F�N�g�����e�q�ݒ�����ׂĔj�����܂��B
^
���݂̃o�[�W�����ł́Ax�`���̃��f�������I�u�W�F�N�g�ł̐e�q�֌W�ݒ�͔��f����܂���Bx�`���ȊO��3D,2D���f���ł݂̂��g�p���������B
%href
regobj
delobj


%index
objproj
�I�u�W�F�N�g�̃v���W�F�N�V�����ύX
%group
�g����ʐ��䖽��
%prm
ObjID,Mode
ObjID      : �I�u�W�F�N�gID
Mode       : �v���W�F�N�V�������[�h
%inst
ObjID�Ŏw�肳�ꂽ�I�u�W�F�N�g�̃v���W�F�N�V�������[�h��ύX���܂��B
�v���W�F�N�V�������[�h��0�̏ꍇ�́A�ʏ�̃I�u�W�F�N�g�Ƃ��ăJ������NearZ�l�AFarZ�l�ɏ]����Z�����̃N���b�s���O���s�Ȃ��܂��B
�v���W�F�N�V�������[�h��1�̏ꍇ�́A����ȃI�u�W�F�N�g�Ƃ��ăJ������FarZ�l�͖�������܂��B
�w�i�ȂǁA�ꕔ�̃I�u�W�F�N�g�����������ɕ`�悷��悤�ȏꍇ�ɁA�v���W�F�N�V�������[�h��ύX���邱�Ƃ��ł��܂��B
%href
regobj


%index
dmmini
�T�E���h�@�\������
%group
�g���}���`���f�B�A���䖽��
%prm
%inst
�T�E���h�@�\�̏��������s�Ȃ��܂��B
�v���O�������s���̍ŏ��ɂP�񂾂����������s�Ȃ��K�v������܂��B
����ȍ~�́Admm�`�Ŏn�܂閽�߂��g�p���āADirectSound�ɂ��T�E���h�Đ��@�\���g�p���邱�Ƃ��\�ɂȂ�܂��B
dmmini���߂ɂ��A���������s�Ȃ�ꂽ���ɂ̂݃T�E���h�@�\���g�p����܂��B
HGIMG3�g�p���ł��A�T�E���h�֘A�@�\�̏��������s�Ȃ��Ȃ��ꍇ�́ADirectSound�ȂǃT�E���h�Ɋւ���API���g�p����邱�Ƃ͂���܂���B
HGIMG3�Ƒ��̃T�E���h�֘A�v���O�C�����g�p����ꍇ�́A�ʏ�ʂ肨�g�������܂��B

%href
dmmreset
dmmbye


%index
dmmreset
�T�E���h�@�\�̐ݒ�����Z�b�g
%group
�g���}���`���f�B�A���䖽��
%prm
%inst
�T�E���h�@�\�̐ݒ�����Z�b�g���܂��B
�ǂݍ��܂�Ă����A���ׂẴT�E���h�f�[�^�͔j������܂��B

%href
dmmini
dmmbye


%index
dmmbye
�T�E���h�@�\�I������
%group
�g���}���`���f�B�A���䖽��
%prm
%inst
�T�E���h�@�\�̏I���������s�Ȃ��܂��B
�ʏ�́A�I�������������I�ɍs�Ȃ���̂ŁA���̖��߂�����K�v�͂���܂���B

%href
dmmreset
dmmini


%index
dmmdel
�T�E���h�f�[�^���폜
%group
�g���}���`���f�B�A���䖽��
%prm
p1
p1(0) : �T�E���hID
%inst
p1�Ŏw�肵���T�E���hID�̏���j�����܂��B
%href
dmmload


%index
dmmvol
�T�E���h�f�[�^�̉��ʐݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1(0) : �T�E���hID
p2(0) : ����(-10000�`0)
%inst
p1�Ŏw�肵���T�E���hID�̉���(�{�����[��)��ݒ肵�܂��B
p2�Őݒ肷�鉹�ʂ��w�肵�܂��B0���ő�̉���(0db)�ƂȂ�A-10000���ŏ��̉���(����)�ɂȂ�܂��B
�ݒ�l�̒P�ʂ́Adb(�f�V�x��)�ɂȂ��Ă��邽�߁A�l�Ԃ������鉹�ʂƈقȂ��Ă��܂��B�l���������ۂɎ��R�ȉ��ʂ�ݒ肷��T���v���Ƃ��āAvolsamp.hsp���p�ӂ���Ă��܂��̂ŎQ�l�ɂ��Ă݂Ă��������B
��mmvol���߂Ƃ͒l�̕���\�A�w�肳���l�̈Ӗ����قȂ�̂Œ��ӂ��Ă�������

%href
dmmpan
dmmload


%index
dmmpan
�T�E���h�f�[�^�̃p���ݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1(0) : �T�E���hID
p2(0) : �p���j���O�l(-10000�`10000)
%inst
p1�Ŏw�肵���T�E���hID�̃p��(�X�e���I�o�����X)��ݒ肵�܂��B
p2�Őݒ肷��p���j���O�l���w�肵�܂��B
-10000�ō���100%�ƂȂ�A10000�ŉE��100%�ɂȂ�܂��B
��mmpan���߂Ƃ͒l�̕���\���قȂ�̂Œ��ӂ��Ă�������

%href
dmmvol
dmmload


%index
dmmloop
�T�E���h�f�[�^�̃��[�v�ݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1(0) : �T�E���hID
p2(0) : ���[�v�|�C���g(-1=���[�v�Ȃ�)
%inst
p1�Ŏw�肵���T�E���hID�̃��[�v����ݒ肵�܂��B
p2��0�ȏ�̒l���w�肵���ꍇ�ɂ́A�Đ����J��Ԃ���܂��B
p2���}�C�i�X�l�̏ꍇ�́A���[�v���s�Ȃ��܂���B
�X�g���[�~���O�Đ����́Ap2�Ń��[�v�|�C���g�̎w����s�Ȃ����Ƃ��\�ł��B���[�v�|�C���g�́A�T���v���P��(44.1kHz�̏ꍇ�́A44100����1�b)�Ő��l���w�肵�܂��B

%href
dmmload


%index
dmmload
�T�E���h�f�[�^�̓ǂݍ���
%group
�g���}���`���f�B�A���䖽��
%prm
"�t�@�C����",p1,p2
"�t�@�C����" : �ǂݍ��݂��s�Ȃ��t�@�C����
p1(-1) : �o�^����T�E���hID (-1=�������蓖��)
p2(0)  : �Đ����[�h(0=�ʏ�A1=���s�[�g)
%inst
"�t�@�C����"�Ŏw�肳�ꂽ�t�@�C�����T�E���h�f�[�^�Ƃ��ēo�^���܂��B
�T�E���h�f�[�^�́Awave�`��(�g���q.wav)�܂��́Aogg vorbis�`��(�g���q.ogg)�̃t�@�C�����w�肵�܂��B
�t�@�C���́Amemfile���߂Ŏw�肵�����������̃C���[�W���܂߁Adpm�t�@�C���Ȃ�HSP�Ŏg�p�\�ȃt�@�C�������ׂė��p���邱�Ƃ��ł��܂��B

p1�ɓo�^����T�E���hID�ԍ�(0����n�܂�C�ӂ̐��l)���w�肷�邱�ƂŁA����ȍ~�̓T�E���hID�ԍ������ƂɊe��@�\���g�p���邱�Ƃ��ł���悤�ɂȂ�܂��B
p1�̎w����ȗ��A�܂��̓}�C�i�X�l�ɂ����ꍇ�́A�o�^����Ă��Ȃ��T�E���hID�ԍ��������I�Ɋ��蓖�Ă܂��B
���蓖�Ă�ꂽ�T�E���hID�ԍ��́Admmload���ߎ��s��ɃV�X�e���ϐ�stat�ɑ������܂��B
p2��wave�`���̍Đ����[�h���w�肷�邱�Ƃ��ł��܂��B
�Đ����[�h���A0�̏ꍇ�͂P��݂̂̍Đ��B1�̏ꍇ�́A�J��Ԃ�(���s�[�g)�Đ��ɂȂ�܂��B
ogg vorbis�`���̌J��Ԃ��Đ��ɂ��ẮAdmmloop���߂��g�p���Ă��������B

%href
dmmloop
dmmdel


%index
dmmplay
�T�E���h�f�[�^�̍Đ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1(0) : �T�E���hID
p2(0) : �J�n�|�C���g
%inst
p1�Ŏw�肵���T�E���hID���Đ����܂��B
���łɎw�肳�ꂽ�T�E���hID���Đ����̏ꍇ�́A�ŏ�����Đ�����܂��B
p2�ŊJ�n�|�C���g���w�肷�邱�Ƃ��ł��܂��B
p2���ȗ�����邩0�̏ꍇ�́A�T�E���h�f�[�^�̍ŏ�����Đ�����A����ȊO�̏ꍇ�͍ŏ�����̃I�t�Z�b�g�ʒu�Ƃ��ēr������Đ�����܂��B
p2�Ŏw�肷��P�ʂ́A�T�E���h�f�[�^��wav�`���̏ꍇ�́A�o�C�g��(byte)�B
�X�g���[���f�[�^(ogg vorbis�`��)�̏ꍇ�́A�T���v����(samples)�ɂȂ�܂��B
���A�X�g���[���f�[�^�̓����Đ��ɂ͑Ή����Ă��܂���B

%href
dmmstop
dmmvol
dmmpan
dmmloop
dmmload


%index
dmmstop
�T�E���h�f�[�^�̍Đ���~
%group
�g���}���`���f�B�A���䖽��
%prm
p1
p1(-1) : �T�E���hID (-1=���ׂẴT�E���h)
%inst
p1�Ŏw�肵���T�E���hID�̍Đ����~���܂��B
p1���ȗ����邩�}�C�i�X�l���w�肵���ꍇ�ɂ́A�Đ����̂��ׂẴT�E���h���~���܂��B

%href
dmmplay
dmmload


%index
dmmstat
�T�E���h�f�[�^�̏�Ԏ擾
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2,p3
p1 : ��Ԃ��擾�����ϐ�
p2(0) : �T�E���hID
p3(0) : �擾���[�h
%inst
p2�Ŏw�肵���T�E���hID�̏�Ԃ��擾���āAp1�̕ϐ��ɑ�����܂��B
p3�Ŏ擾���郂�[�h���w�肷�邱�Ƃ��ł��܂��B
�擾���[�h�̒l�́A�ȉ��̒ʂ�ł��B
^p
	���[�h�l  ���e
	------------------------------------------------------
	    0     �ݒ�t���O�l
	    1     �{�����[���l
	    2     �p���j���O�l
	    3     �Đ����[�g(0=�I���W�i��)
	    4,5   ���[�v�|�C���g(���ʁA���16bit)
	    16    �Đ����t���O(0=��~��/1=�Đ���)
	   $100   ogg�T�E���h�̍Đ��ʒu(�����l)
	   $101   ogg�T�E���h�̑S�̃T�C�Y(�����l)
^p

%href
dmmplay
dmmload


%index
hgprm
����p�����[�^�[�̐ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3�c
p1(0)   : �p�����[�^�[ID
p2(0.0) : �ݒ肷��l
%inst
HGIMG3�̓�����ׂ����ݒ肵�܂��B
p1�Ŏw�肵���p�����[�^�[ID��p2�̒l��ݒ肵�܂��B
�p�����[�^�[ID�́A�ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
	�p�����[�^�[ID  ���e
	------------------------------------------------------
	    0           �n�ʂ̊�_�ƂȂ�Y���W(�����l=0.0)
	                (OBJ_LAND�̃I�u�W�F�N�g���[�h�ŎQ�Ƃ���܂�)
	    1           ���ԍX�V�t���O(�����l=1)
	                (0���w�肷�邱�ƂŃA�j���[�V�����⓮��̕�Ԃ��~���܂�)
	    2           �ړ��\�Ȓn�ʂ̍ō��ƂȂ�Y���W(�����l=-15.0)
	                (�I�u�W�F�N�g�����ړ��̍ۂɁA�w�肳�ꂽY���W����ɂ�
	                 �ړ����邱�Ƃ��ł��Ȃ��Ȃ�܂�)
	    3           �^�[�Q�b�g�I�u�W�F�N�gID���w��
	                (���̍��ڂ͌��ݖ��g�p�ł��B�����̊g���p�ɗp�ӂ���Ă��܂�)
	    4           �o�E���h�W��(�����l=1.0)
	                (OBJ_BOUND�̃I�u�W�F�N�g���[�h�ŎQ�Ƃ���܂�)
	    5           ���C��R(�󒆁A�n��)(�����l=0.95,0.95)
	                (�I�u�W�F�N�g�����ړ��̍ۂɁA���������R��ݒ肵�܂�
	                 ���̃p�����[�^�[ID�́A2�̒l��ݒ肷��K�v������܂�)
^p
%href


%index
objaim
�I�u�W�F�N�g��ڕW�Ɍ����đ��삷��
%group
�g����ʐ��䖽��
%prm
ObjID,Target,Mode,x,y,z
ObjID(0)   : �I�u�W�F�N�gID
Target(0)  : �^�[�Q�b�g���[�h(0=���W�A1=�p�x)
Mode(0)    : ���[�h
x(1.0)     : �I�v�V�����p�����[�^�[X
y(1.0)     : �I�v�V�����p�����[�^�[Y
z(1.0)     : �I�v�V�����p�����[�^�[Z
%inst
ObjID�Ŏw�肳�ꂽ�I�u�W�F�N�g���A�ڕW�ƂȂ�l�Ɍ����č��W��p�x�𑀍삵�܂��B
Target�ŁA������s�Ȃ��Ώ�(�^�[�Q�b�g���[�h)��ݒ肵�܂��B
0�܂��́A�ȗ������ꍇ�ɂ́A���W���ړ������邱�ƂɂȂ�܂��B
Mode�ŁA����̓��e��I�����邱�Ƃ��ł��܂��B

Mode 0 : �ڕW�l�Ɍ����Ĉړ�(�܂��͉�])

�I�u�W�F�N�g��work�O���[�v���ɐݒ肳�ꂽ���W�Ɍ����Ĉړ�(�܂��͉�])���܂��B
(�^�[�Q�b�g���[�h��0�̏ꍇ�͈ړ��A1�̏ꍇ�͉�]�p�x�̕ύX�ɂȂ�܂��B)
���炩���߁Asetwork���߂ɂ��ڕW�̍��W��ݒ肵�Ă����K�v������܂��B
�I�v�V�����p�����[�^�[X,Y,Z�ɂ��A�P�t���[��������̍ő�ړ��ʂ�ݒ肷�邱�Ƃ��ł��܂��B
���Ƃ��΁A(1,1,1)���w�肳��Ă���ꍇ�́AX,Y,Z���ꂼ��P�t���[��������ő�1�Â����ړ����s�Ȃ��܂���B

Mode 1 : �ڕW�l�Ɍ����Ĉړ��ʂ�ݒ�

Mode0�Ɠ��l�ɁA�I�u�W�F�N�g��work�O���[�v���ɐݒ肳�ꂽ���W�Ɍ����Ĉړ����܂��B
�������A���ۂɈړ����s�Ȃ��̂ł͂Ȃ��Adir�O���[�v���Ɉړ��ʂ�ݒ肵�܂��B
����́A�I�u�W�F�N�g�̃��[�h��OBJ_MOVE���w�肵�Ă���ꍇ�ɁA�w�肳�ꂽ���W�Ɍ����Ĉړ�������ꍇ�ȂǂɎg�p���邽�߂̂��̂ł��B
���̃��[�h�́A��Ƀ^�[�Q�b�g���[�h0(���W)���w�肷��悤�ɂ��Ă��������B

Mode 4 : �ڕW�l�Ɍ����Ċp�x��ݒ�

�I�u�W�F�N�g��work�O���[�v���ɐݒ肳�ꂽ���W�Ɍ����Ċp�x��ݒ肵�܂��B
���炩���߁Asetwork���߂ɂ��ڕW�̍��W��ݒ肵�Ă����K�v������܂��B
�I�v�V�����p�����[�^�[X,Y,Z�ɂ��A���Ƃ��Ƃ̃��f���������Ă���x�N�g�����w�肷��K�v������܂��B
���̃��[�h�́A��Ƀ^�[�Q�b�g���[�h0(���W)���w�肷��悤�ɂ��Ă��������B

objaim���߂́A���ɑ��l�ȃI�u�W�F�N�g���삪�\�Ȕ��ʁA�ݒ肪���G�ɂȂ��Ă��܂��B
�K�v�ȋ@�\���������H���Ȃ���o���Ă����Ƃ����ł��傤�B
���ߎ��s��ɁA�V�X�e���ϐ�refdval�ɑΏۂƂȂ���W����̋������������܂��B

%href
event_aim


%index
event_aim
�I�u�W�F�N�g����C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,Mode,x,y,z
id(0)      : �C�x���gID
Mode(0)    : ���[�h
x(1.0)     : �I�v�V�����p�����[�^�[X
y(1.0)     : �I�v�V�����p�����[�^�[Y
z(1.0)     : �I�v�V�����p�����[�^�[Z
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�I�u�W�F�N�g����C�x���g��ǉ����܂��B
objaim���߂Ɠ��l�̑�����C�x���g���s���ɍs�Ȃ����Ƃ��ł��܂��B
���[�h�y�сA�I�v�V�����p�����[�^�[X,Y,Z�̒l�́Aobjaim���߂Ɠ��l�̓��e���g�p�ł��܂��B
(�^�[�Q�b�g���[�h�͏��0���g�p����܂��B)

%href
objaim
newevent
setevent


%index
event_objact
�A�j���[�V�����ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,Anim,mode,speed
id(0)      : �C�x���gID
Anim       : �A�j���[�V�����C���f�b�N�X�l
mode(0)    : �ݒ胂�[�h(0=����/1=�I����)
speed(0.0) : �A�j���[�V�����Đ��X�s�[�h
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�A�j���[�V�����ݒ�C�x���g��ǉ����܂��B
Anim�y�сAmode�̐ݒ�́Aobjact���߂Ɠ��l�̒l���w�肷�邱�Ƃ��ł��܂��B
speed�ɂ��Đ����̑��x(objspeed���߂Ɠ��l)��ݒ肷�邱�Ƃ��ł��܂��B
speed�̒l��0.0���܂��͏ȗ��ɂ����ꍇ�́A�Đ����x�̐ݒ�͍s�Ȃ��܂���B

%href
objact
objspeed
newevent
setevent


%index
hgview
�`��G���A�̐ݒ�
%group
�g����ʐ��䖽��
%prm
x,y,sx,sy
x(0) : �`��G���A�̍�����W(X)
y(0) : �`��G���A�̍�����W(Y)
sx(640) : �`��G���A�̉��T�C�Y
sy(480) : �`��G���A�̏c�T�C�Y
%inst
��ʓ��ŕ`����s�Ȃ��G���A��ݒ肵�܂��B
hgview�ŕ`��G���A��ݒ肷��ƁA����ȍ~�̎w�肳�ꂽ�͈͓��ɂ̂ݕ`�悳���悤�ɂȂ�܂��B
�P�̉�ʓ����������̗̈�ɕ������ĕ`����s�Ȃ��ꍇ�ɗL���ł��B
�`��G���A�𔽉f���邽�߂ɂ́Ahgdraw���߂̃��[�h��K�؂Ȓl�Ɏw�肷��K�v������܂��̂ł����ӂ��������B
hgview���߂́A���C���E�B���h�E�ɕ\���������e���w�肵���͈͂Ɏ��߂�悤�ɕ`��ݒ��ύX���閽�߂ł��B���C���E�C���h�E�̃A�X�y�N�g�䗦�ƈႤ���̂��w�肵���ꍇ�́A�摜���c��ŕ\������邱�ƂɂȂ�܂��B
^p
�� :
	hgdraw 0			; �`�揈��(�S���)
	hgview 0,0,320,240		; �`��G���A�̐ݒ�
	hgdraw 1			; �`�揈��(�w��G���A��)
	hgsync 12			; ���ԑ҂�
^p

%href
hgdraw


%index
texopt
������`�惂�[�h��ݒ�
%group
�g����ʐ��䖽��
%prm
space,linespace,mode
space(0)     : �����Ԋu�T�C�Y
linespace(0) : �s�Ԋu�T�C�Y
mode(0)      : �`�惂�[�h�w��
%inst
texmes���߂ɂ��`�悳��镶����̏ڍאݒ���s�Ȃ��܂��B
space,linespace�ɂ��A�\�����̕����A�s�Ԋu�T�C�Y���h�b�g�P�ʂŔ������\�ł��B
0�Ȃ�Βʏ�̊Ԋu�ŁA���l���}�C�i�X�̏ꍇ�͊Ԋu�������A�v���X�̏ꍇ�͍L���Ȃ�܂��B
�܂�mode�ɂ��A�`�惂�[�h���ȉ��̒�����w�肷�邱�Ƃ��ł��܂��B
^p
���[�h  ���e
-----------------------------------------------
0       �A���`�G�C���A�X����
1       �A���`�G�C���A�X�Ȃ�
2       �A���`�G�C���A�X�Ȃ� + ���l�̂ݍX�V
^p

%href
texmes


%index
hgsettime
���A���^�C���^�C�}�[�ݒ�
%group
�g����ʐ��䖽��
%prm
val,max
val(0)      : �ݒ肷��l
max(100000) : �^�C�}�[�̏���l
%inst
���A���^�C���^�C�}�[�̒l��ݒ肵�܂��B
���A���^�C���^�C�}�[�́A1ms�P�ʂ̍����x�Ȏ��Ԃ��v��������̂ŁAHGIMG3�̓��쒆�Ɏg�p�\�ł��B
(�������Ahgsetreq���߂ŁAhgsync�̎��ԑ҂����[�h(SYSREQ_DEFTIMER)��
await�ɐݒ肵�Ă���ꍇ�̓��A���^�C���^�C�}�[�𗘗p�ł��܂���B)
���A���^�C���^�C�}�[�́A1ms���Ƃɏ��1�ÂJ�E���g�A�b�v����܂��B
�܂��A�^�C�}�[�̏���l���z�����ꍇ�́A0�ɖ߂�܂��B
���A���^�C���^�C�}�[�̒l�́Ahggettime���߂ɂ���Ď擾���邱�Ƃ��ł��܂��B

%href
hgsetreq
hggettime


%index
hggettime
���A���^�C���^�C�}�[�擾
%group
�g����ʐ��䖽��
%prm
val,type
val     : ���ʂ���������ϐ���
type(0) : �擾�^�C�v
%inst
���A���^�C���^�C�}�[�̏����擾���āAval�Ŏw�肳�ꂽ�ϐ��ɑ�����܂��B
���A���^�C���^�C�}�[�́A1ms�P�ʂ̍����x�Ȏ��Ԃ��v��������̂ŁAHGIMG3�̓��쒆�Ɏg�p�\�ł��B
�擾�^�C�v�̒l�ɂ���āA�擾�������e���ς��܂��B
�擾�^�C�v��0�̏ꍇ�́A1ms���ƂɃJ�E���g�A�b�v����郊�A���^�C���^�C�}�[�̒l�����̂܂܎擾���܂��B
�擾�^�C�v��1�̏ꍇ�́A���A���^�C���^�C�}�[������l���z�����񐔂��擾���܂��B
���A���^�C���^�C�}�[�̒l�́A���ł�hgsettime���߂ɂ���Đݒ肷�邱�Ƃ��ł��܂��B

%href
hgsettime



%index
meshmap
���b�V���}�b�v���̍X�V
%group
�g����ʐ��䖽��
%prm
var,id,mode,factor
var     : ���b�V���}�b�v��񂪑������Ă���z��ϐ���
id(0)   : �����̑ΏۂƂȂ郁�b�V�����f��ID
mode(0) : �X�V���[�h
factor(1.0) : �X�V�Ɏg�p�����{��(����)
%inst
�z��ϐ��ɑ������Ă���A���b�V���}�b�v�������f���ɔ��f�����܂��B
���b�V���}�b�v���́A�����^�̔z��ϐ��Ƃ���X,Y�����ɕ������ꂽ�i�q�P�ʂ̏���ێ�������̂ł��B���b�V�����_���Ƃ̍������n�߂Ƃ��āAUV�ȂǗl�X�ȏ������A���^�C���ɍX�V���邱�Ƃ��ł��܂��B
����ɂ��A�N���̂���n�ʂ�}�b�v�`�b�v��\�����邱�Ƃ��ł��܂��B
mode�Ŏw�肷��l�ɂ��A�X�V������񂪕ς��܂��B
^p
���[�h  ���e
-----------------------------------------------
0       ���b�V����Y���W
1       ���b�V����X���W
2       ���b�V����Z���W
3       ���b�V���̃e�N�X�`��U���W
4       ���b�V���̃e�N�X�`��V���W
$100    ���b�V���̃e�N�X�`�����}�b�s���O
^p
mode��$100(256)���w�肵���ꍇ�́A���b�V���}�b�v���̒l(0�`3)�����ƂɂS�������ꂽ�n�`�p�̃e�N�X�`���}�b�v�`�b�v��\�����邽�߂�UV�l���ݒ肳��܂��B

���b�V���̍��W���ύX���ꂽ�ꍇ�ɂ́A�@���̍Čv�Z���s�Ȃ��܂��B
���̏ꍇ�A���[�h�̒l��16�𑫂����ƂŁA�X���[�Y�Ȗ@�����쐬����܂�
(�������A�v�Z�R�X�g��������܂��B�܂����b�V���}�b�v�̌J��Ԃ��e�N�X�`�����g�p���Ă��Ȃ����̂��ΏۂɂȂ�܂�)�B

meshmap���߂́A���ׂĂ̒��_�ɑ΂��Ĕz��ϐ��̓��e�����Ƃɒl��ݒ肵�܂��B
�ݒ肳���l�ɂ́Afactor�̔{�����ꗥ�ɓK�p����܂��B
�܂�A�ϐ��Ɋi�[����Ă���l��15�������ꍇ�ł��Afactor��0.1���w�肷��ƁA���ۂɐݒ肳���l��1.5�ɂȂ�܂��B
getvarmap���߂Ƒg�ݍ��킹�Ďg�p���邱�ƂŁA�摜�f�[�^�����Ƃɂ��č�����A�}�b�v�`�b�v�̐ݒ���s�Ȃ����Ƃ��ł��܂��B

%href
getvarmap
addmesh
objwalk



%index
getvarmap
���b�V���}�b�v���̍쐬
%group
�g����ʐ��䖽��
%prm
var,sx,sy,mode
var     : ���b�V���}�b�v��񂪑�������z��ϐ���
sx(0)   : X����������
sy(0)   : Y����������
mode(0) : �擾���[�h
%inst
�`��o�b�t�@�̓��e���烁�b�V���}�b�v�����쐬���܂��B
���b�V���}�b�v���́A�����^�̔z��ϐ��Ƃ���X,Y�����ɕ������ꂽ�i�q�P�ʂ̏���ێ�������̂ł��B���b�V�����_���Ƃ̍������n�߂Ƃ��āAUV�ȂǗl�X�ȏ����i�[���邱�Ƃ��ł��܂��B
�`���Ɏw�肳��Ă���HSP�̉摜�o�b�t�@�̓��e��ǂݎ���āA�w�肳�ꂽ�z��ϐ��ɒl��ݒ肵�܂��B
���炩���߁A��������ϐ��͂Q�����z��Ƃ��ď���������Ă���K�v������܂��B
�Q�����z��̃T�C�Y�́A(sx,sy)�Ŏw�肳�ꂽ���������ꂼ��1�Â����A���_���̐������z����m�ۂ���_�ɒ��ӂ��Ă��������B
(XY��������(sx,sy)�Ƃ���΁A�z��̏��������s�Ȃ��T�C�Y�́A(sx+1,sy+1)�ƂȂ�܂��B)

mode�Ŏw�肷��l�ɂ��A�擾������񂪕ς��܂��B
^p
���[�h  ���e
-----------------------------------------------
0       ����0�A����255�Ƃ����P�x���
1       �����X�L�b�v�A����ȊO��1�Ƃ���l
2       ���̓X�L�b�v�A����ȊO��2�Ƃ���l
17      ����0�A����ȊO��1�Ƃ���l
18      ����0�A����ȊO��2�Ƃ���l
^p
�摜�̓_��ǂݎ��A����ɉ������l�����b�V���}�b�v���Ƃ��đ������܂��B
(�摜�̐F�͊֌W����܂���BRGB�̂����A�ł������Ȓl��ǂݎ��܂��B)

%href
meshmap



%index
objwalk
���b�V���}�b�v��̈ړ�
%group
�g����ʐ��䖽��
%prm
var,id,x,y,z
var      : ���ʂ���������ϐ���
id(0)    : �ړ����s�Ȃ��I�u�W�F�N�gID
x(0.0)   : X�����̈ړ���(����)
y(0.0)   : Y�����̈ړ���(����)
z(0.0)   : Z�����̈ړ���(����)
%inst
�w�肵���I�u�W�F�N�g��(x,y,z)�̕����Ɉړ������܂��B
�P�ɍ��W���ړ������邾���łȂ��A�n�ʂ��������b�V���}�b�v��A�g���R���W������ݒ肵���I�u�W�F�N�g���l��������ŁA�K�؂Ȉړ��悪�ݒ肳��܂��B
var�Ŏw�肳�ꂽ�ϐ��ɂ́A���ۂɈړ������傫��(�x�N�g��)���������܂��B
(�ϐ��́Adouble�^�̔z��Ƃ��ėv�f0�`2�ɒl���������܂�)

�N���̂���n�ʂ̏���ړ�������ꍇ�́A�K�؂ȃ��[�h���I�u�W�F�N�g�ɑ΂��Đݒ肳��Ă���K�v������܂��B
OBJ_GROUND�̃��[�h���ݒ肳��Ă���I�u�W�F�N�g�́A�n�ʂƂ��ĔF������܂��B
OBJ_STAND�̃��[�h���ݒ肳��Ă���I�u�W�F�N�g�́A�n�ʂ̏�ɔz�u����܂��B
OBJ_GRAVITY�̃��[�h���ݒ肳��Ă���I�u�W�F�N�g�́A�d�͌v�Z���t������܂��B
�܂��A�I�u�W�F�N�g����Q���Ƃ��ĔF��������ꍇ�ɂ��A���[�h�y�уR���W�����O���[�v�̐ݒ肪�K�v�ƂȂ�܂��B
OBJ_STATIC�̃��[�h���ݒ肳��Ă���I�u�W�F�N�g�́A��Q���ƂȂ�܂��B

objwalk���߂ɂ��ړ����ɓ�����l�X�ȏ���getcolvec���߂ɂ��擾���邱�Ƃ��\�ł��B

%href
addmesh
meshmap
objfloor
getcolvec



%index
objfloor
�n�ʂ���̕\���I�t�Z�b�g�ݒ�
%group
�g����ʐ��䖽��
%prm
id,offset
id(0)      : �ݒ���s�Ȃ��I�u�W�F�N�gID
offset(0.0): Y�����̃I�t�Z�b�g�l(����)
%inst
�n�ʂ̏���ړ�����ۂɕ\�������I�u�W�F�N�g��Y���W�ɑ΂���I�t�Z�b�g�l��ݒ肵�܂��B
����́A�n�ʂɂ�������W����w�肳�ꂽ�l����������ɂ��炵�ĕ\�����s�Ȃ����߂̃p�����[�^�[�ł��B
���f���̒��S���W�ɂ���ẮA�n�ʂɖ��܂��Ă��܂����Ƃ�����̂�������܂��B
�����Őݒ肳�ꂽ�I�t�Z�b�g�l�́Aobjwalk���߂Œn�ʂ̏���ړ������ꍇ�ȂǂɓK�p����܂��B

%href
regobj
objwalk



%index
getcolvec
�R���W�������̎擾
%group
�g����ʐ��䖽��
%prm
var1,var2,var3,id,mode
var1    : X�̌��ʂ���������ϐ���
var2    : Y�̌��ʂ���������ϐ���
var3    : Z�̌��ʂ���������ϐ���
id(0)   : �ΏۂƂȂ�I�u�W�F�N�gID
mode(0) : �擾���[�h
%inst
�R���W�����ƃI�u�W�F�N�g�Ɋւ���e������擾���܂��B
id�Ŏw�肳�ꂽ�I�u�W�F�N�g�̏��var1,var2,var3�Ŏw�肵���ϐ��ɑ������܂��B
�擾�������́Amode�̒l�ɂ���ĈقȂ�܂��B
mode�̓��e�́A�ȉ��̒ʂ�ł��B
^p
���[�h  ���e
-----------------------------------------------
 0      �����ɂ���n�ʂ̌X��(�@��)���擾����
 1      �n�ʂ̃I�u�W�F�N�gID�AX,Y���������擾����
 2      �R���W�����X�P�[���l���擾����
 3      �g���R���W�����p�����[�^�[���擾����
 4      �n�ʂ�Y���W�A�\��Y�I�t�Z�b�g�l���擾����
16      �n�ʂ̃I�u�W�F�N�gID�AX,Y���������擾����
17      �����o���Ɋւ���e����
18      �I�u�W�F�N�g�ėp���[�U�[�����擾����
^p

���[�h��0�`15�܂ł́A�����l�Ƃ���var1�`var3���ݒ肳��܂��B
���[�h16�ȍ~�́A�����l�Ƃ���var1�`var3���ݒ肳��܂��B
(���炩���ߕϐ��̌^��ݒ肵�Ă����K�v�͂���܂���B)

���[�h17�̉����o���Ɋւ���e����́Avar1�ɉ����o�����s�Ȃ������ǂ����̃t���O�l���Avar2�ɉ����o�����s�Ȃ���
�I�u�W�F�N�g��ID���Avar3�ɂ͎����������o���ꂽ�ꍇ�ɉ����o�������̃I�u�W�F�N�gID���������܂��B

%href
modelcols
setcolscale
objwalk



%index
getnearobj
�ł��߂��ɂ���I�u�W�F�N�g������
%group
�g����ʐ��䖽��
%prm
var,id,group,range
var      : ���ʂ���������ϐ���
id(0)    : �������̃I�u�W�F�N�gID
group(0) : �����ΏۂƂȂ�R���W�����O���[�v
range(10.0): �������s�Ȃ�����(����)
%inst
�������̃I�u�W�F�N�gID����ł��߂��ꏊ�ɂ���ʂȃI�u�W�F�N�g���������܂��B
id�Ŏw�肵���I�u�W�F�N�g�̎��͂ŁA�ł��߂��ʒu�ɂ���I�u�W�F�N�g���������āAvar�Ŏw�肳�ꂽ�ϐ��ɃI�u�W�F�N�gID�������܂��B
�����̍ۂɁAgroup�Ŏw�肵���R���W�����O���[�v�ƁArange�Ŏw�肵���������Q�Ƃ��܂��B
group�Ŏw�肷��R���W�����O���[�v�ƈ�v����I�u�W�F�N�g�������������܂��B
(���炩����setcoli���ߓ��Őݒ肳��Ă���ՓˑΏۂ̃O���[�v�͎Q�Ƃ���܂���)
range�́A�ǂ̋����܂ł������ΏۂƂ��邩���w�肵�܂��B
3D�I�u�W�F�N�g�̏ꍇ�͍��W�̋������A2D�I�u�W�F�N�g�̏ꍇ��2D���W��̋���(�h�b�g��)���g�p���܂��B

%href
getcoli
findobj



%index
wave_init
�g��̏�����
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(32) : ������X�T�C�Y
p2(32) : ������Y�T�C�Y
%inst
�g�䐶���@�\�̏��������s�Ȃ��܂��B
p1,p2�p�����[�^�[�ŁAX,Y�����̕��������w�肵�܂��B
�g�䐶���@�\�́A���b�V���}�b�v�̒��_�ɑΉ������g��̓`�B��e���̌v�Z���s�Ȃ����̂ł��B
�������A�����ȕ������Z���s�Ȃ��Ă���킯�ł͂Ȃ��A�p�t�H�[�}���X��D�悵���ȈՓI�ȃ��x���Ɍv�Z�ʂ��}�����Ă��܂��B
�����̋@�\�́A��ʏ�̉��o����ʂȂǂɗ��p���邱�Ƃ��ł��܂��B
�g�䐶���@�\�𗘗p���邽�߂ɂ́A�i�q�̏������ƃ��b�V���̍��������i�[����z��ϐ����쐬���Ă����K�v������̂Œ��ӂ��Ă��������B
�g��̏������́A���x�ł��s�Ȃ����Ƃ��\�ł��B
���������s�Ȃ��ƁA���ׂĂ̒��_������0�Ƀ��Z�b�g����܂��B

%href
wave_set
wave_apply



%index
wave_set
�g��̍�����ݒ�
%group
�g����ʐ��䖽��
%prm
x,y,pow,mode
x(0)    : ���_��X�ʒu
y(0)    : ���_��Y�ʒu
pow(0)  : �����̒l
mode(0) : �ݒ胂�[�h
%inst
�g�䐶���@�\�ł́A�g��̍�����ݒ肵�܂��B
�K���A���wave_init���߂ɂ���ď��������s�Ȃ��Ă����K�v������܂��B
���_(x,y)�̈ʒu�ɂ��鍂����pow�Ŏw�肵���l�Ƃ��Đݒ肵�܂��B
�܂��Amode�̒l�ɂ�肢�����̐ݒ���@��I�����邱�Ƃ��ł��܂��B
^p
���[�h  ���e
-----------------------------------------------
0       �w�肵���ʒu�̂ݒl��ݒ肵�܂�
1       �~����ɂȂ�悤�Ɏ��͂̒l��ݒ肵�܂�(��)
2       �~����ɂȂ�悤�Ɏ��͂̒l��ݒ肵�܂�(��)
3       ���`�ɐ���グ�܂�(�㏑��)
4       ���`�ɐ���グ�܂�(�ǉ�)
^p

%href
wave_init
wave_apply



%index
wave_apply
�g��̏�Ԃ��擾
%group
�g����ʐ��䖽��
%prm
var,mode
var      : ���ʂ���������ϐ���
mode(0)  : �擾���[�h
%inst
�g�䐶���@�\�ɂ��v�Z���s�Ȃ��A���ʂ�ϐ��ɓǂݏo���܂��B
�K���A���wave_init���߂ɂ���ď��������s�Ȃ��Ă����K�v������܂��B
�܂��Avar�Ŏw�肷��z��ϐ��́A�K�������^�ŃO���b�h�T�C�Y����X,Y�Ƃ���1�傫���l�ŏ���������Ă���K�v������܂��B
(���_�̐��̓O���b�h�̕��������P�����Ȃ邽�߂ł�)

mode�̒l�ɂ��A�����̓��e���w�肷�邱�Ƃ��ł��܂��B
���[�h�̓��e�́A�ȉ��̒ʂ�ł��B
^p
���[�h  ���e
-----------------------------------------------
0       �O��̌��ʂ݂̂����o��
1       �e���v�Z���s�Ȃ����ʂ����o��
2       �g��̌v�Z���s�Ȃ����ʂ����o��
-1      �ϐ��̓��e��g��o�b�t�@�ɏ�������(�f�o�b�O�p)
^p
wave_apply���߂́A�����܂ł����b�V���ɓK�p���邽�߂̌v�Z���s�Ȃ����߂̂��̂ł��B
���ۂ̉�ʏ�ɕ\�����邽�߂̃��b�V���}�b�v�֓K�p����ꍇ�́Ameshmap���߂��g�p����K�v������܂��B

%href
wave_init
wave_set
meshmap


%index
delmodel
���f���̍폜
%group
�g����ʐ��䖽��
%prm
ModelID
ModelID  : ���f��ID
%inst
�w�肳�ꂽ���f�����폜���܂��B
���f���Ɋւ������ǂݍ��܂�Ă��郊�\�[�X�����ׂĉ������܂��B
�I�u�W�F�N�g�Ɋ��蓖�Ă��Ă��郂�f�����폜�����ꍇ�ɂ́A�����\������Ȃ��Ȃ�܂��B(���̍ۂɂ��I�u�W�F�N�g�͍폜����Ȃ��̂Œ��ӂ��Ă��������B)
���f���̍폜�Ɠo�^�̓R�X�g�̍������߂Ȃ̂ŁA���t���[���̒P�ʂōs�Ȃ��悤�Ȏg�����͐�������܂���B
�K�v�ȃ��f���̓V�[���̕`��O�ɗp�ӂ��A�V�[�������ւ���ꍇ��hgreset���߂ɂ���Ă��ׂĔj�����Ă���ēo�^���s�Ȃ����@�������I�ł��B

%href
addbox
addeprim
addmesh
addplate
addsplate
addspr
addxfile


%index
hgcnvaxis
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
+16     Y���̒l�𐳕��t�Ƃ��Ĉ���
^p
���[�h0��1�́A�X�N���[�����2D���e���s�Ȃ����ۂ�X,Y���W�A�y��Z�o�b�t�@�l�ɕϊ����܂��B
���[�h2�ł́A�J�����ʒu���l�������r���[�ϊ����s�Ȃ���X,Y,Z���W�l�ɕϊ����܂��B
���[�h�l��16�����Z����ƁAY���̒l�𐳕��t�Ƃ��Ĉ����܂��B����́AHSP3.21���O�̃o�[�W�����Ƃ̌݊������������邽�ߗp�ӂ���Ă��܂��B

%href
getpos



%index
hgobaq
HGIMG3�ł�OBAQ������
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1(0) : OBAQ�V�X�e���|�C���^�l
p2(0) : �f�o�b�O�\�����[�h�ݒ�(0=ON/1=OFF)
p3(0) : 2D/3D�\�����[�h�ݒ�(0=2D/1=3D)
%inst
HGIMG3����OBAQ(�����G���W���v���O�C��)���g�p���邽�߂̏��������s�Ȃ��܂��B
���炩���߁AOBAQ�v���O�C����������������ŁAqgetptr���߂ɂ��擾���ꂽOBAQ�V�X�e���|�C���^�l��p1�Ɏw�肷��K�v������܂��B
p2�ɂ��f�o�b�O�\�����[�h���w�肵�܂��B����́Aqdraw���߂Ŏw�肳���\�����[�h�X�C�b�`�Ɠ��l�̓��e�ɂȂ�܂��B
p3�ŁA2D/3D�\���̐؂�ւ����s�Ȃ��܂��B
�f�t�H���g���A0���w�肳��Ă���ꍇ��2D���[�h�Ƃ��Ēʏ��OBAQ�Ɠ��l�̕��@��HGIMG3�̉�ʏ�ɕ`����s�Ȃ��܂��B
p3��1���w�肳��Ă����ꍇ�́A3D���[�h�ƂȂ�OBAQ�̕`���3D�|���S��(��)�̏�ɓ\��t����`��3D��ԏ�ɃI�u�W�F�N�g�Ƃ��Ĕz�u���邱�Ƃ��ł��܂��B
3D�\�����[�h�𗘗p����ꍇ�́A�ʓraddobaq3d���߂ɂ��OBAQ���f�����쐬���A�I�u�W�F�N�g�̓o�^���s�Ȃ��K�v������܂��B

%href
qgetptr
addobaq3d


%index
hgceldiv
HGIMG3�ł̃Z�������w��
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5
p1=0�`(0)  : �e�N�X�`��ID
p2=1�`(0)  : �������̕����T�C�Y
p3=1�`(0)  : �c�����̕����T�C�Y
p4=0�`(0)  : �������̒��S���W
p5=0�`(0)  : �c�����̒��S���W
%inst
HGIMG3���Ǘ�����e�N�X�`���̃Z�������T�C�Y�A�y�ђ��S���W��ݒ肵�܂��B
����́AHGIMG3���OBAQ�v���O�C�����g�p����ۂɁAOBAQ�I�u�W�F�N�g�̃}�e���A���w��ŃZ��ID���w�肷�鎞�ɎQ�Ƃ������̂ł��B
hgceldiv�́A�W�����߂ł���celdiv�Ɠ��l�̋@�\��HGIMG3�ōČ����邽�߂̂��̂ł��B
HGIMG3�P�̂Ŏg�p����ꍇ�́A���ɐݒ���s�Ȃ��K�v�͂���܂���B

%href
celdiv


%index
addobaq3d
OBAQ3D���f�����쐬
%group
�g����ʐ��䖽��
%prm
var
var     : �쐬���ꂽ���f��ID����������ϐ���
%inst
OBAQ3D���f�����쐬���܂��B
����Ƀ��f�����쐬�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
OBAQ3D���f���́AOBAQ�v���O�C�����Ǘ�����I�u�W�F�N�g�̕`����s�Ȃ��܂��B
OBAQ3D���f���́A���ʂ̔ɑ΂��ĕ`����s�Ȃ��܂����A3D��ԏ�Ɏ��R�ɔz�u���A��]�������邱�Ƃ��ł��܂��B��(PLATE)���f���Ɠ��l�̐��������������f���ł��B
OBAQ3D���f���́A�K��hgobaq���߂ɂ��OBAQ�̏�������3D�\���̐ݒ���s�Ȃ��Ă����K�v������܂��B

%href
hgobaq


%index
addline
�������f�����쐬
%group
�g����ʐ��䖽��
%prm
var,p1,p2,p3
var     : �쐬���ꂽ���f��ID����������ϐ���
p1(-1)  : �e�N�X�`��ID
p2(0)   : �Z��ID�A�J���[�R�[�h
p3(16)  : ���T�C�Y
%inst
�������f�����쐬���܂��B
����Ƀ��f�����쐬�����ƁAvar�Ŏw�肵���ϐ��Ƀ��f��ID���������܂��B
�������f���́A�I�u�W�F�N�g�ɐݒ肳�ꂽ���W����A�I�u�W�F�N�g��work�O���[�v�ɐݒ肳�ꂽ���W(���Έʒu)�ɐ��������@�\�������Ă��܂��B
p1�Ƀe�N�X�`��ID���w�肵���ꍇ�́A�e�N�X�`�����g�p���Đ���`�悵�܂��B
���̍ۂɂ́Ap2�Ŏw�肵���l���Z��ID(hgceldiv�ŕ������ꂽ���ł�ID)�Ƃ��Ĉ����܂��B
p1���f�t�H���g���}�C�i�X�l�̏ꍇ�́Ap2�Ŏw�肳�ꂽ�J���[�R�[�h�Ő���`�悵�܂��B�܂��A�e�N�X�`���`�掞��p3�̐��T�C�Y���L���ɂȂ�܂��B

%href
hgceldiv


%index
newemit
�G�~�b�^�[���쐬
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1     : �쐬���ꂽ�G�~�b�^�[ID����������ϐ���
p2(0)  : �G�~�b�^�[���[�h
p3(8)  : �I�u�W�F�N�g������
p4(-1) : �G�~�b�^�[ID
%inst
�G�~�b�^�[�����������Ap1�Ŏw�肵���ϐ��ɃG�~�b�^�[ID�������܂��B
^
�G�~�b�^�[�Ƃ́A�����̃I�u�W�F�N�g����x�ɔ��������邱�Ƃ̂ł�����ʂȎd�g�݂ł��B
�����_���ȃp�����[�^�[�Ȃǎ��R�ȑg�ݍ��킹�Ő������邱�Ƃ̂ł���A�I�u�W�F�N�g������ƍl���Ă��������B
�V�����G�~�b�^�[���쐬����ꍇ�ɂ́A�K��newemit���߂ŃG�~�b�^�[ID���擾���Ă����K�v������܂��B
p2�ŏ���������G�~�b�^�[�̃��[�h���w�肷�邱�Ƃ��ł��܂��B
^p
���[�h          �l      ���e
-----------------------------------------------
EMITMODE_NONE	0	�������Ȃ�
EMITMODE_STATIC	1	�o���݂̂ňړ����Ȃ�
EMITMODE_CIRCLE	2	���S�~��Ɉړ�
EMITMODE_RANDOM	3	�����_���ȕ����Ɉړ�
EMITMODE_LOOKAT	16	�ړ������Ɍ�����(���ƕ��p�\)
^p
p3�ň�x�ɐ��������I�u�W�F�N�g�̐���ݒ肵�܂��B
�f�t�H���g�ł́A8�̃I�u�W�F�N�g����x�ɐ��������ݒ�ɂȂ�܂��B
�쐬���ꂽ�G�~�b�^�[�ɂ́A�uemit_�v�Ŏn�܂�G�~�b�^�[�ݒ薽�߂ɂ���đ��ʂȓ����o�^���Ă������Ƃ��ł��܂��B
p4�ŏ㏑������G�~�b�^�[ID���w�肷�邱�Ƃ��ł��܂��B
�V�K�ɍ쐬����ꍇ�́A�ȗ����邩�}�C�i�X�l�ɂ��Ă����Ă��������B
^
�G�~�b�^�[���쐬����Ă����ɃI�u�W�F�N�g����������킯�ł͂���܂���B
���炩���߁A����������F�X�Ɛݒ肵����ŕK�v�Ȏ��ɔ��������܂��B
�G�~�b�^�[�����ۂɗ��p����ꍇ�́Ahgemit���߂ɂ���Ă��ł����������邱�Ƃ��ł���ق��Asetobjemit���߂ɂ��I�u�W�F�N�g�ɑ΂��ēK�p���邱�Ƃ��\�ł��B

%href
delemit
hgemit
setobjemit


%index
delemit
�G�~�b�^�[���폜
%group
�g����ʐ��䖽��
%prm
p1
p1(0)   : �G�~�b�^�[ID
%inst
p1�Ŏw�肳�ꂽ�G�~�b�^�[���폜���܂��B
�폜���ꂽ�G�~�b�^�[ID�́A�ēxnewemit���߂ŏ���������܂ł͎g�p�ł��܂���B
%href
newemit


%index
emit_size
�G�~�b�^�[�̔����͈͂�ݒ�
%group
�g����ʐ��䖽��
%prm
id,dx,dy,dz
id(0)   : �G�~�b�^�[ID
dx(0.0) : �����͈�X(����)
dy(0.0) : �����͈�Y(����)
dz(0.0) : �����͈�Z(����)
%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[����������I�u�W�F�N�g�͈̔͂�ݒ肵�܂��B
�����͈͂́A���Ƃ��Ǝw�肳�ꂽ�������W����ǂ̒��x�܂ł���΂邩���w�肷����̂ł��B
���Ƃ��΁A�G�~�b�^�[�̔������W��(10,10,10)�ł������Ƃ��āA�����͈͂�(20,10,0)�Ɛݒ肳�ꂽ�ꍇ�ɂ́A
�G�~�b�^�[���甭�������I�u�W�F�N�g�́A(10�`30,10�`20,10)�͈͓̔��ŗ����ɂ�肿��΂邱�ƂɂȂ�܂��B
����ɂ��A�������鏉���ʒu��������x�΂�����������邱�Ƃ��ł��܂��B
emit_size�̐ݒ肪�s�Ȃ��Ȃ��G�~�b�^�[�́A�����l�Ƃ���(0,0,0)���ݒ肳��Ă��܂��B

%href
newemit


%index
emit_speed
�G�~�b�^�[�̃X�s�[�h�ݒ�
%group
�g����ʐ��䖽��
%prm
id,speed,spdopt
id(0)       : �G�~�b�^�[ID
speed(1.0)  : �X�s�[�h�����l(����)
spdopt(0.0) : �X�s�[�h�͈�(����)
%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[����������I�u�W�F�N�g�̑��x��ݒ肵�܂��B
�I�u�W�F�N�g�̑��x�́A��������Ɠ����Ɉړ����J�n����I�u�W�F�N�g�ɗ^�����鐔�l�ł��B
�X�s�[�h�̒l���傫���قǁA�������x�ňړ����s�Ȃ��܂��B
speed�p�����[�^�[�ŁA�ݒ肷��X�s�[�h�̏����l���w�肵�܂��B
spdopt��0���傫���l�̏ꍇ�́A���͈͓̔��ł΂�����������܂��B
���Ƃ��΁A(1.0,5.0)���w�肳�ꂽ�ꍇ�ɂ́A���x��1.0�`6.0�͈͓̔��ŗ����ɂ�肿��΂邱�ƂɂȂ�܂��B
emit_speed�̐ݒ肪�s�Ȃ��Ȃ��G�~�b�^�[�́A�����l�Ƃ���(1.0,0.0)���ݒ肳��Ă��܂��B
%href
newemit


%index
emit_angmul
�G�~�b�^�[�̊p�x�W����ݒ�
%group
�g����ʐ��䖽��
%prm
id,dx,dy,dz
id(0)   : �G�~�b�^�[ID
dx(0.0) : �p�x�W��X(����)
dy(0.0) : �p�x�W��Y(����)
dz(0.0) : �p�x�W��Z(����)
%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[����������ۂ̃I�u�W�F�N�g�ړ��p�x�W����ݒ肵�܂��B
�G�~�b�^�[�ɂ��I�u�W�F�N�g����������ꍇ�ɁA�ړ���������̊p�x���Z�o����܂��B
�ړ������́A��{�I��EMITMODE_RANDOM���[�h�̏ꍇ�́A�S��360�x���烉���_���ɑI�΂�AEMITMODE_CIRCLE���[�h�̏ꍇ�͑S��360�x�𔭐�������ŋϓ��Ɋ���t���܂��B
�p�x�W���́A���̊p�x�ɏ�Z����鐔�l�ɂȂ�܂��B
����ɂ��A�S��360�x�����łȂ�180�x�A90�x�Ƃ��������肳�ꂽ�͈͓��ł̈ړ���ݒ肷�邱�Ƃ��ł��܂��B
���Ƃ��΁A�p�x�W����0.5���w�肵���ꍇ�́A�S���̔���(180�x)�Ōv�Z���s�Ȃ��܂��B����ɁAemit_angopt���߂ɂ��p�x���Z�l��ݒ肷�邱�Ƃɂ��ړ��͈̔͂����R�ɐݒ肷�邱�Ƃ��\�ł��B
�p�x�W���́AX,Y,Z�����ƂɌʐݒ�\�ł��B�܂��A2D�X�v���C�g�̏ꍇ��Z����]�݂̂����f����܂��B
emit_angmul�̐ݒ肪�s�Ȃ��Ȃ��G�~�b�^�[�́A�����l�Ƃ���(1,1,1)���ݒ肳��Ă��܂��B

%href
newemit
emit_angopt


%index
emit_angopt
�G�~�b�^�[�̊p�x���Z�l��ݒ�
%group
�g����ʐ��䖽��
%prm
id,dx,dy,dz
id(0)   : �G�~�b�^�[ID
dx(0.0) : �p�x���Z�lX(����)
dy(0.0) : �p�x���Z�lY(����)
dz(0.0) : �p�x���Z�lZ(����)
%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[����������ۂ̃I�u�W�F�N�g�ړ��p�x���Z�l��ݒ肵�܂��B
�G�~�b�^�[�ɂ��I�u�W�F�N�g����������ꍇ�ɁA�ړ���������̊p�x���Z�o����܂����A���̒l�ɉ��Z����萔��X,Y,Z�����ƂɎw��ł��܂��B
��������I�u�W�F�N�g�̈ړ�����(�p�x)�́A
^p
	�I�u�W�F�N�g�p�x = ��{�p�x * �p�x�W�� + �p�x���Z�l
^p
�Ƃ����`�ŎZ�o����܂��B(��{�p�x�̏ڍׂ́Aemit_angmul���߂̃��t�@�����X���Q�Ƃ��Ă�������)
�p�x�W����ݒ肷��emit_angmul���߂ƕ��p���邱�ƂŁA�ړ��p�x�͈̔͂����肵���`�ŃI�u�W�F�N�g�𔭐������邱�Ƃ��\�ɂȂ�܂��B
emit_angopt�̐ݒ肪�s�Ȃ��Ȃ��G�~�b�^�[�́A�����l�Ƃ���(0,0,0)���ݒ肳��Ă��܂��B

%href
newemit
emit_angmul


%index
emit_model
�G�~�b�^�[�̔������f����ݒ�
%group
�g����ʐ��䖽��
%prm
id,model,modelnum,objmode,efx
id(0)       : �G�~�b�^�[ID
model(0)    : ���f��ID
modelnum(0) : ���f��ID�͈�
objmode(0)  : �I�u�W�F�N�g���[�h�ݒ�l
efx(0x100)  : efx�ݒ�l

%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[����������I�u�W�F�N�g�̃��f��ID�ȂǏڍ׃p�����[�^�[��ݒ肵�܂��B
�G�~�b�^�[���甭�������I�u�W�F�N�g�̎�ނ⃂�[�h�ݒ�ȂǏd�v�ȗv�f���w�肵�܂��B
�G�~�b�^�[���g�p����ۂɂ͕K���ݒ肷��悤�ɂ��Ă��������B
model�p�����[�^�[�ŁA�������郂�f��ID���w�肵�܂��B���f��ID�́Aregobj���߂Őݒ�\�ȃ��f��ID�Ɠ��l�ł��B
modelnum�ŁA�������郂�f��ID�͈̔͂��w�肷�邱�Ƃ��ł��܂��B
����́A�����_���ɕʁX�ȃ��f���𔭐�������ۂɎg�p���邱�Ƃ��ł��܂��B
���Ƃ��΁A���f��ID��3�ŁAmodelnum��4�̏ꍇ�́A���f��ID3�`6�͈̔͂Ń����_���ɃI�u�W�F�N�g���������邱�ƂɂȂ�܂��B
�P��̃��f�������𔭐�������ꍇ�́Amodelnum��0�̂܂܂ɂ��Ă����Ă��������B
objmode�p�����[�^�[�ŁA�������ɐݒ肳���I�u�W�F�N�g�̃��[�h���w�肷�邱�Ƃ��ł��܂��B���[�h�l�́Aregobj���߂Ŏw�肷��l�Ɠ��l�ł��B
efx�p�����[�^�[�ŁA�������ɐݒ肳���I�u�W�F�N�g��efx�p�����[�^�[���w�肷�邱�Ƃ��ł��܂��B
efx�p�����[�^�[�́Asetefx���߂Ŏw�肷��P�Ԗڂ̃p�����[�^�[�Ɠ��l�ł��B
����ɂ��A����������Z�Ȃǂ̓�����ʐݒ���I�u�W�F�N�g�ɓK�p���邱�Ƃ��\�ɂȂ�܂��B

%href
newemit
regobj


%index
emit_event
�G�~�b�^�[�̃C�x���g�ݒ�
%group
�g����ʐ��䖽��
%prm
id,event,eventnum
id(0)   : �G�~�b�^�[ID
event(0)    : �C�x���gID
eventnum(0) : �C�x���gID�͈�
%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[����������I�u�W�F�N�g�̃C�x���gID��ݒ肵�܂��B
event�p�����[�^�[�ŁA��������C�x���gID���w�肵�܂��B�C�x���gID�́Asetevent���߂Őݒ�\�ȃC�x���gID�Ɠ��l�ł��B
eventnum�ŁA��������C�x���gID�͈̔͂��w�肷�邱�Ƃ��ł��܂��B
����́A�����_���ɕʁX�ȃC�x���g�𔭐�������ۂɎg�p���邱�Ƃ��ł��܂��B
���Ƃ��΁A�C�x���gID��2�ŁAeventnum��5�̏ꍇ�́A���f��ID2�`6�͈̔͂Ń����_���ɃC�x���g���������邱�ƂɂȂ�܂��B
�P��̃C�x���g�����𔭐�������ꍇ�́Aeventnum��0�̂܂܂ɂ��Ă����Ă��������B
emit_event�̐ݒ肪�s�Ȃ��Ȃ��G�~�b�^�[�́A�I�u�W�F�N�g�������ɃC�x���g�ݒ�͍s�Ȃ��܂���B

%href
newemit
setevent


%index
emit_num
�G�~�b�^�[�̔������ݒ�
%group
�g����ʐ��䖽��
%prm
id,num,numopt
id(0)     : �G�~�b�^�[ID
num(0)    : �I�u�W�F�N�g������
numopt(0) : �����͈�
%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[����������I�u�W�F�N�g�̐���ݒ肵�܂��B
num�ŁA��������I�u�W�F�N�g�̐����w�肷�邱�Ƃ��ł��܂��B
����́A�����_���ɕʁX�Ȑ��̃I�u�W�F�N�g�𔭐�������ۂɎg�p���邱�Ƃ��ł��܂��B
���Ƃ��΁A�I�u�W�F�N�g��������5�ŁAnumopt��10�̏ꍇ�́A5�`14�͈̔͂Ń����_���ɔ��������ς�邱�ƂɂȂ�܂��B
emit_num�̐ݒ肪�s�Ȃ��Ȃ��G�~�b�^�[�́Anewemit�Ŏw�肳�ꂽ�������ƂƂ��ɁA�����͈�(numopt)��0�ɂȂ��Ă��܂��B

%href
newemit


%index
emit_group
�G�~�b�^�[�̃O���[�v�ݒ�
%group
�g����ʐ��䖽��
%prm
id,mygroup,enegroup
id(0)       : �G�~�b�^�[ID
mygroup(0)  : ������������O���[�v�l
enegroup(0) : �Փ˂����o����ΏۂƂȂ�O���[�v�l
%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[����������I�u�W�F�N�g�̃R���W�����O���[�v��ݒ肵�܂��B����́Asetcoli���߂ɂ��I�u�W�F�N�g�ɐݒ肷��l�Ɠ��l�ł��B
����̃R���W�����O���[�v�����I�u�W�F�N�g�𔭐�������ꍇ�Ɏg�p���Ă��������B
emit_group�̐ݒ肪�s�Ȃ��Ȃ��G�~�b�^�[�́A�I�u�W�F�N�g�������ɃR���W�����O���[�v�ݒ�͍s�Ȃ��܂���B

%href
newemit
setcoli


%index
hgemit
�G�~�b�^�[�������s
%group
�g����ʐ��䖽��
%prm
id,dx,dy,dz
id(0)   : �G�~�b�^�[ID
dx(0.0) : X���W�l(����)
dy(0.0) : Y���W�l(����)
dz(0.0) : Z���W�l(����)
%inst
id�Ŏw�肳�ꂽ�G�~�b�^�[���A(dx,dy,dz)�̍��W���甭�������܂��B
���炩���߃G�~�b�^�[���甭��������I�u�W�F�N�g�̐ݒ���s�Ȃ��Ă����K�v������܂��B
���s��ɁA�����������I�u�W�F�N�g�̍��v�����V�X�e���ϐ�stat�ɑ������܂��B
�z�u����Ă���I�u�W�F�N�g�ɑ΂��ăG�~�b�^�[��K�p����ꍇ�́Asetobjemit���߂��g�p���Ă��������B
%href
newemit
setobjemit


%index
setobjemit
�I�u�W�F�N�g�ɃG�~�b�^�[�K�p
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : �I�u�W�F�N�gID
p2(0) : �G�~�b�^�[ID
%inst
�z�u����Ă���I�u�W�F�N�g���G�~�b�^�[�̔������Ƃ��Đݒ肵�܂��B
p1�Ŏw�肳�ꂽ�I�u�W�F�N�g�ɁAp2�̃G�~�b�^�[�����蓖�Ă܂��B
�ȍ~�́A�I�u�W�F�N�g�\�����ɃG�~�b�^�[�Ƃ��Ă����삷��悤�ɂȂ�܂��B
�G�~�b�^�[ID�Ƀ}�C�i�X�l���w�肷�邱�ƂŁA�G�~�b�^�[�̓K�p���������邱�Ƃ��ł��܂��B
%href
hgemit


%index
groupmod
����O���[�v�ɉ��Z�K�p
%group
�g����ʐ��䖽��
%prm
group,mocid,dx,dy,dz,opt
group(0) : ���Z�̑ΏۂƂȂ�R���W�����O���[�v
mocid(0) : MOC�̓K�p��
dx(0.0)  : X���Z�l(����)
dy(0.0)  : Y���Z�l(����)
dz(0.0)  : Z���Z�l(����)
opt(0)   : ���Z���@
%inst
�����R���W�����O���[�v�ɑ����Ă��郂�f���ɑ΂��Ă܂Ƃ߂ĉ��Z���s�Ȃ��܂��B
�L���Ȃ��ׂẴI�u�W�F�N�g�̒��ŁAgroup�p�����[�^�[�Ŏw�肵���R���W�����O���[�v���w�肳��Ă�����̂�����̑ΏۂƂȂ�܂��B
group�p�����[�^�[�Ŏw�肳���R���W�����O���[�v�ɂ́A�����̃r�b�g��g�ݍ��킹�邱�Ƃ��\�ł��B���Ƃ��΁A�O���[�v1�ƃO���[�v2�𓯎��Ɏw�肷��ꍇ�́A3�Ƃ����l�ɂȂ�܂��B
mocid�p�����[�^�[�́AMOC�O���[�v�������l���w�肵�܂��BMOC�O���[�v�ɂ́A�ȉ����w�肷�邱�Ƃ��\�ł��B
^p
MOC�O���[�v    mocid
---------------------------
  pos           0
  ang           1
  scale         2
  dir           3
  efx           4
  work          5
^p
(dx,dy,dz)�ɂ�艉�Z�Ŏg�p����l�����܂��B
���Z�̕��@�́Aopt�p�����[�^�[�ɂ���Ďw�肳��܂܂��Bopt�p�����[�^�[�ɂ́A�ȉ����w�肷�邱�Ƃ��ł��܂��B
^p
  opt  ���Z���@
---------------------------
   0   ���
   1   ���Z
   2   ���Z
   3   ��Z
^p
opt���ȗ��A�܂���0���w�肳�ꂽ���́A(dx,dy,dz)�̒l�����̂܂ܑΏۂƂȂ�I�u�W�F�N�g�ɑ������܂��B
����ȊO�̒l�ł́A���łɑ������Ă���(X,Y,Z)�l�ɑ΂���(dx,dy,dz)�����Z����܂��B
%href
setcoli


%index
hgqview
HGIMG3���OBAQ�r���[�ݒ�
%group
�g����ʐ��䖽��
%prm
ofsx,ofsy,ofsz,zoom
ofsx(0.0)  : X�����̕\���I�t�Z�b�g(����)
ofsy(0.0)  : Y�����̕\���I�t�Z�b�g(����)
ofsz(0.0)  : Z�����̕\���I�t�Z�b�g(����)
zoom(4.0) : �Y�[���{��(����)
%inst
HGIMG3���obaq�I�u�W�F�N�g��\������ۂ̐ݒ���s�Ȃ��܂��B
zoom�p�����[�^�[�ŁAHGIMG3�\�����̃Y�[���{�����w�肵�܂��B
(ofsx,ofsy,ofsz)��X,Y,Z���ɑ΂���\���I�t�Z�b�g���w�肷�邱�Ƃ��ł��܂��B
%href
qview



%index
hgqcnvaxis
OBAQ���W��HGIMG3���W�ɕϊ�
%group
�g����ʐ��䖽��
%prm
x,y,z,srcx,srcy
(x,y,z)    : �擾����ϐ�
srcx(0.0)  : OBAQ���X���W(����)
srcy(0.0)  : OBAQ���Y���W(����)
%inst
OBAQ���X,Y���W��HGIMG3���X,Y,Z���W�ɕϊ����܂��B
����́AOBAQ�I�u�W�F�N�g��3D�I�u�W�F�N�g�Ƃ��ĕ\������ۂ̍��W�����߂���̂ł��B
(srcx,srcy)��OBAQ���X,Y���W���w�肷��ƁA(x,y,z)�Ɏw�肳�ꂽ�ϐ��Ɏ����^��HGIMG3���X,Y,Z���W���������܂��B
%href
qcnvaxis


%index
enumobj
�I�u�W�F�N�g�̌����J�n
%group
�g����ʐ��䖽��
%prm
group
group    : �R���W�����O���[�v
%inst
�w�肵���R���W�����O���[�v�ɑ�����I�u�W�F�N�g���������܂��B
�������ʂ́Agetenum���߂ɂ��擾���邱�Ƃ��ł��܂��B
�������ʂ���������ꍇ�́Agetenum���߂��Ăяo�����тɎ��̌��ʂ��Ԃ���܂��B
���ׂĂ̌������I�������ꍇ�́Agetenum���߂ŃI�u�W�F�N�g��ID�Ƃ���-1���Ԃ���܂��B
%href
getenum


%index
getenum
�I�u�W�F�N�g�̌������ʂ��擾
%group
�g����ʐ��䖽��
%prm
var
var      : ���ʂ���������ϐ���
%inst
enumobj���߂ɂ�茟�����ꂽ�I�u�W�F�N�g��ID���擾���܂��B
getenum���߂����s���邽�тɁA���̌������ʂ��擾����܂��B�擾���I������ꍇ�ɂ́A-1���������܂��B

%href
enumobj



