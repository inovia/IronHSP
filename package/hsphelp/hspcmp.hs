;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.6
%note
hspcmp.as���C���N���[�h���邱�ƁB

%date
2020/01/07
%author
onitama
%dll
hspcmp
%url
http://hsp.tv/
%port
Win


%index
hsc_ini
HSPCMP.DLL�̏�����
%group
�g�����o�͐��䖽��
%prm
"filename"
"filename" : �R���p�C���̑ΏۂƂȂ�t�@�C����


%inst
HSPCMP.DLL�̏��������s�Ȃ��܂��B
HSPCMP.DLL�̋@�\���g�p����ꍇ�́A�ŏ��ɏ�����������K�v������܂��B
"filename"�Ŏw�肵���t�@�C�����R���p�C���̑ΏۂƂ��܂��B
�t�@�C�����́A�g���q(as�łȂ��Ă��\���܂���)���܂߂Ďw�肵�ĉ������B




%index
hsc_refname
�G���[�\���t�@�C�����̎w��
%group
�g�����o�͐��䖽��
%prm
"filename"
"filename" : �G���[���b�Z�[�W�ŕ\�������t�@�C����


%inst
�G���[���b�Z�[�W�ŕ\�������\�[�X�X�N���v�g�t�@�C�������w�肵�܂��B
����́A���Ƃ��΁utest.as�v�Ƃ������O���ꎞ�I�Ɂuhsptmp�v�Ȃǂ̕ʖ��ŕۑ����ăR���p�C�����鎞�ɂ��A�G���[���b�Z�[�W�ɂ́utest.as�v�t�@�C�����ŃG���[���N�����Ă���Ƃ������Ƃ�\�������邽�߂̂��̂ł��B
�\�[�X�X�N���v�g�t�@�C�������Ahsc_ini�Ŏw�肵���t�@�C������ύX����K�v���Ȃ��ꍇ�́A�w�肵�Ȃ��Ă��\���܂���B




%index
hsc_objname
�o�̓I�u�W�F�N�g�t�@�C�����̎w��
%group
�g�����o�͐��䖽��
%prm
"filename"
"filename" : �o�̓I�u�W�F�N�g�t�@�C����


%inst
�o�͂����I�u�W�F�N�g�t�@�C�������w�肵�܂��B




%index
hsc_compath
���ʃf�B���N�g���̎w��
%group
�g�����o�͐��䖽��
%prm
"pathname"
"pathname" : ���ʃf�B���N�g���p�X

%inst
#include�ŃT�[�`����鋤�ʃf�B���N�g�����w�肵�܂��B
"pathname"�͕K���u\�v�ŏI��镶����ł���K�v������܂��B
hsc_compath���w�肳��Ȃ������ꍇ�́Ahspcmp.dll���g�p���Ă���EXE�̉��ɂ���ucommon�v�f�B���N�g�����Q�Ƃ���܂��B




%index
hsc_comp
�I�u�W�F�N�g�t�@�C���쐬
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1=0�`(0) : �R���p�C���̐ݒ�I�v�V����
p2=0�`(0) : �v���v���Z�b�T�̐ݒ�I�v�V����
p3=0�`(0) : �f�o�b�O�E�B���h�E�\���̗L��

%inst
HSP�R�[�h�R���p�C���ŁA�\�[�X�t�@�C�����R���p�C�����āA�I�u�W�F�N�g�t�@�C�����쐬���܂��B
p1�̃p�����[�^�ŁA�f�o�b�O�����I�u�W�F�N�g�t�@�C���ɏo�͂��邩���w�肷�邱�Ƃ��ł��܂��B
p1��0���܂��͏ȗ�����Ă���ꍇ�́A�G���[�s�\���ȂǂɕK�v�ȃf�o�b�O��񂪃I�u�W�F�N�g�t�@�C���ɕt������܂���B
p1��1(bit0)�̏ꍇ�́A�f�o�b�O��񂪕t������܂��B
p1��2(bit1)�̏ꍇ�̓v���v���Z�X�����̂ݍs���܂��B
p1��4(bit2)�̏ꍇ�͕�����f�[�^��UTF-8�R�[�h�ɕϊ����ďo�͂��܂��B
p1��8(bit3)�̏ꍇ�͎g�p���Ă��镶����f�[�^�t�@�C��(strmap)���o�͂��܂��B
p2��0�̏ꍇ�́u__hsp30__�v�}�N������`���ꂽ��ԂŃR���p�C�����s�Ȃ��܂��B
p2��1�̏ꍇ�́A�}�N���͒�`����܂���B����́A�X�N���v�g�G�f�B�^��
�uHSP�g���}�N�����g�p����v�t���O���R���p�C���ɓn�����߂̂��̂ł��B
p2�̒l��+4(bit2)����ƁA�\�[�X�Ɋ܂܂����s�t�@�C�������쐬�̂��߂̖���(#pack,#epack,#packopt)�����Ƃ�packfile�쐬���s�Ȃ��܂��B
p3��0�ȊO�̏ꍇ�́A�f�o�b�O�E�C���h�D��\������t���O���I�u�W�F�N�g�t�@�C���ɖ��ߍ��݂܂��B
hsc_comp���߂����s���邽�߂ɂ́A�K��hsc_ini���߂ŏ������ƃt�@�C���̎w�������K�v������܂��B
�܂��A�K�v�������hsc_objname�ŏo�͂����I�u�W�F�N�g�t�@�C�������w�肵�܂��B(�o�̓t�@�C�����́A�f�t�H���g�ł�hdc_ini�Ŏw�肵���t�@�C�����̊g���q���u.ax�v�ɂȂ������̂ɂȂ�܂�)
����ɕK�v�ł���΁Ahsc_refname���߂����炩���ߎ��s���Ă����ĉ������B�R���p�C���̎菇�Ƃ��ẮA
^p
1.�uhsc_ini�v
2.�uhsc_refname�v(�ȗ���)
3.�uhsc_objname�v(�ȗ���)
4.�uhsc_comp�v
^p
�̂悤�ɂȂ�܂��B






%index
hsc_getmes
�G���[���b�Z�[�W�o�͐�w��
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �G���[���b�Z�[�W���󂯎�镶����^�ϐ�

%inst
p1�Ŏw�肵��������^�̕ϐ��ɁA�G���[�Ȃ�HSPCMP.DLL���o�͂������b�Z�[�W�������܂��B




%index
hsc_clrmes
�G���[���b�Z�[�W�̃N���A
%group
�g�����o�͐��䖽��
%inst
�R���p�C�����o�͂������b�Z�[�W�̃f�[�^�����ׂăN���A���܂��B




%index
hsc_ver
�R���p�C���̃o�[�W�������擾
%group
�g�����o�͐��䖽��
%inst
�V�X�e���ϐ�refstr�ɁAHSP�R�[�h�R���p�C���̃o�[�W�������𕶎���Ƃ��ĕԂ��܂��B




%index
hsc_bye
�R���p�C���̏I������
%group
�g�����o�͐��䖽��
%inst
HSP�R�[�h�R���p�C���̏I���������s�Ȃ��܂��B
���̖��߂͎����I�Ɏ��s�����̂ŁA�ʏ�͎g�p���܂���B




%index
pack_ini
PACKFILE�}�l�[�W���̏�����
%group
�g�����o�͐��䖽��
%prm
"filename"
"filename" : ����Ώۃt�@�C����
%inst
PACKFILE�}�l�[�W���̏��������s�Ȃ��܂��B
PACKFILE�̑�����s�Ȃ��ꍇ(�upack_�v�Ŏn�܂閽��)�́A�ŏ��ɏ�����������K�v������܂��B
"filename"�Ŏw�肵���t�@�C���𑀍�̑ΏۂƂ��܂��B
�t�@�C�����́A�g���q�̂Ȃ����̂��w�肵�ĉ������B




%index
pack_view
PACKFILE�̓��e�ꗗ��\��
%group
�g�����o�͐��䖽��
%inst
pack_ini�Ŏw�肵���t�@�C����DPM�t�@�C���Ƃ��ē��e�ꗗ��\�����܂��Bpack_view�̌��ʂ́Ahsc_getmes���߂Ŏ擾���ĉ������B




%index
pack_make
DPM�t�@�C�����쐬
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1 : �쐬���[�h( 0=�W��EXE�t�@�C���p / 1=�O��DPM�t�@�C���p )
p2 : �Í����L�[( 0=�W���L�[���g�p���� / ���̑�=�Í����L�[ )
%inst
pack_ini�Ŏw�肵���t�@�C������DPM�t�@�C�����쐬���܂��B
p1�ŁA�W��EXE�t�@�C���p���A�O���ǂݍ��ݗp��DPM�t�@�C���Ȃ̂����w�肷��K�v������܂��B
�܂��ADPM�t�@�C�����쐬����ꍇ�́Ap2�ňÍ����L�[�ɂ��Ă̐ݒ���s�Ȃ����Ƃ��ł��܂��B
p2��0���w�肵���ꍇ�́A�W���̈Í����ɂ��DPM�t�@�C��(2.61�݊�)���쐬���܂��B
p2��0�ȊO���w�肵���ꍇ�́A���̒l���L�[�Ƃ���Í������{���܂��B
���̏ꍇ�́ADPM�ǂݍ��݂̍ۂɃX�N���v�g���œ����l�̃L�[��chdpm���߂ɂ���Ďw�肵�Ȃ���΁A�������t�@�C���Ƃ��ĕ�������Ȃ��Ȃ�̂Œ��ӂ��Ă��������B
DPM�t�@�C���Ɋ܂߂�t�@�C���́A�J�����g�f�B���N�g���́uPACKFILE�v���̃e�L�X�g�Ŏw�肳�ꂽ�t�@�C���ɂȂ�܂��B



%index
pack_exe
���s�t�@�C�����쐬
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �쐬���[�h(0=�W�� / 1=�t���X�N���[�����[�h / 2=�X�N���[���Z�[�o�[)

%inst
pack_ini�Ŏw�肵���t�@�C������EXE�t�@�C�����쐬���܂��B
p1��3�̃��[�h(�W���E�t���X�N���[���E�X�N���[���Z�[�o�[)���w�肷�邱�Ƃ��ł��܂��B
EXE�t�@�C���Ɋ܂߂�t�@�C���́A�J�����g�f�B���N�g���́uPACKFILE�v���̃e�L�X�g�Ŏw�肳�ꂽ�t�@�C���ɂȂ�܂��B
�܂��AHSP�����^�C���t�@�C��(hsprt)���K�؂ȃf�B���N�g���ɒu����Ă���K�v������܂��B




%index
pack_opt
���s�t�@�C���쐬�I�v�V�������w��
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1=0�`(640) : ���X�T�C�Y
p2=0�`(480) : ���Y�T�C�Y
p3=0�`(0) : �N�����̓���X�C�b�`

%inst
pack_exe���߂�EXE�t�@�C�����쐬����ꍇ�̃I�v�V�������w�肵�܂��B
pack_exe���߂����s����O�ɁA�w������Ă����K�v������܂��B
p3�Ŏw�肷��N�����̓���X�C�b�`�ɂ́A�ȉ��̒l���w�肷�邱�Ƃœ���ȋN������ɂ��邱�Ƃ��ł��܂��B
^p
	1 = �����E�B���h�E��\��
	2 = �f�B���N�g���ړ��Ȃ�
^p
����X�C�b�`�́A���Z���邱�Ƃœ����ɋ@�\��I�����邱�Ƃ��\�ł��B
���ɓ���ȓ��삪�K�v�Ȃ��ꍇ�́A0���w�肵�ĉ������B




%index
pack_rt
HSP�����^�C���t�@�C�����w��
%group
�g�����o�͐��䖽��
%prm
"filename"
"filename" : HSP�����^�C���t�@�C��(hsprt)�̂���t���p�X��

%inst
pack_exe���߂�EXE�t�@�C�����쐬����ꍇ�ɎQ�Ƃ����HSP�����^�C���t�@�C��(hsprt)�̂���t���p�X�����w�肵�܂��B
HSP�����^�C���t�@�C�����J�����g�f�B���N�g���ɂȂ��ꍇ�́A�w������Ă����Ă��������B
(��: pack_rt "c:\hsp\hsprt")




%index
pack_get
packfile����t�@�C�������o��
%group
�g�����o�͐��䖽��
%prm
"filename"
"filename" : ���o���t�@�C����

%inst
pack_ini�Ŏw�肵���t�@�C������DPM�t�@�C���Ƃ��āA�i�[����Ă���t�@�C�������o���܂��B
"filename"�Ŏw�肵���t�@�C�������o����A�J�����g�f�B���N�g���ɃZ�[�u����܂��B




%index
hsc3_getsym
�V���{�������擾
%group
�g�����o�͐��䖽��
%inst
�R���p�C���̃��b�Z�[�W�o�b�t�@��HSP�Ŏg�p�����V���{�������o�͂��܂��B
�o�͂́A�u�V���{����,sys[|var/func/macro][|1/2]�v�̌`���ɂȂ�܂��B




%index
hsc3_messize
�R���p�C�����b�Z�[�W�̃T�C�Y���擾
%group
�g�����o�͐��䖽��
%prm
val
val : �T�C�Y���󂯎�鐔�l�^�ϐ�

%inst
hsc_getmes�œ����郁�b�Z�[�W�S�̂̃T�C�Y���Aval�Ŏw�肵���ϐ��ɑ�����܂��B




%index
hsc3_make
���s�t�@�C���̎����쐬
%group
�g�����o�͐��䖽��
%prm
"path",sw
"path" : HSP�����^�C�����C�u�����̂���t���p�X
sw(0)  : iconins�g�p�t���O(0=���g�p/1=�g�p)

%inst
���s�t�@�C���̎����쐬���s�Ȃ��܂��B
���炩���߁Apack_ini�ɂ����PACKFILE�}�l�[�W���̏��������s�Ȃ��K�v������܂��B
"path"��HSP�����^�C�����C�u�����̂���t���p�X���w�肵�܂��B
packfile�̃I�v�V�����ɏ]���Ď��s�t�@�C�����쐬���܂��B
sw��1���w�肵���ꍇ�́Aiconins�c�[���ɂ��A�C�R���Ȃǂ̃��\�[�X�������������s���܂��B
iconins�c�[���ɓn���I�v�V�����ɂ��ẮA#packopt���߂��Q�Ƃ��Ă��������B
�I�v�V�����t����packfile�쐬�́Ahsc_comp�ōs�Ȃ��܂��B
%ref
pack_ini
#packopt


%index
hsc3_getruntime
�����^�C���t�@�C���̎擾
%group
�g�����o�͐��䖽��
%prm
val, "objfile"
val       : �����^�C�������擾����ϐ�
"objfile" : �I�u�W�F�N�g�t�@�C����

%inst
"objfile"�Ŏw�肵���I�u�W�F�N�g�t�@�C�����K�v�Ƃ���
�����^�C���t�@�C������val�Ŏw�肵���ϐ��Ɏ擾���܂��B
val�̕ϐ��͕�����^�ŏ���������Ă���K�v������܂��B
�����^�C���t�@�C��������("")�̏ꍇ�́A�f�t�H���g�̃����^�C��(hsp3.exe)���g�p���邱�Ƃ������Ă��܂��B



%index
hsc3_run
�����^�C�����s
%group
�g�����o�͐��䖽��
%prm
"string"
"string"   : ���s�R�}���h���C��

%inst
"string"�̓��e�������^�C�����s�p�̃R�}���h���C���Ƃ��ď������܂��B
"string"�ɂ́A�u�����^�C�����v�u�I�u�W�F�N�g�t�@�C�����v�u�N���I�v�V�����v�����ꂼ��X�y�[�X�ŋ�؂����`�Ŏw�肷��K�v������܂��B



