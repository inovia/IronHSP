;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
��������
%ver
3.6
%note
ver3.6�W������
%date
2015/02/25
%author
onitama
%url
http://hsp.tv/
%port
Win



%index
newcom
COM�I�u�W�F�N�g�^�ϐ��̐V�K�쐬
%group
COM�I�u�W�F�N�g���얽��
%prm
p1,p2,p3,p4
p1    : �ϐ���
p2    : �C���^�[�t�F�[�X���A�܂��̓N���XID
p3(0) : �쐬���[�h(�I�v�V����)
p4    : �Q�ƌ��|�C���^(�I�v�V����)

%inst
p1�Ŏw�肵���ϐ���COM�I�u�W�F�N�g�^�Ƃ��ď��������s�Ȃ��܂��B
p1�̕ϐ���COM�I�u�W�F�N�g�^�łȂ��ꍇ�́ACOM�I�u�W�F�N�g�^�Ƃ��ď���������܂��B
^
���ł�COM�I�u�W�F�N�g�^�̏ꍇ�A�ȑO�̃I�u�W�F�N�g�͔j������܂��B
p2�ŃN���XID���܂��́A�v���O����ID(ProgID)���w�肷�邱�Ƃ��ł��܂��B
^p
	��:
	newcom ie, "InternetExplorer.Application"	; ProgID
^p
��̗�ł́A�v���O����ID���g�p���ď��������s�Ȃ��Ă��܂��B
����ɂ��ϐ�ie�́ACOM�I�u�W�F�N�g�^�ϐ��Ƃ��ď���������܂��B
�܂��A#usecom���߂ɂ�肷�łɒ�`����Ă���C���^�[�t�F�[�X�����w�肵�ď��������邱�Ƃ��\�ł��B
^p
	��:
	#define IID_IDirectMusicPerformance8 "{679c4137-c62e-4147-b2b4-9d569acb254c}"
	#define IID_IDirectMusicLoader8      "{19e7c08c-0a44-4e6a-a116-595a7cd5de8c}"
	#usecom IDirectMusicLoader8 IID_IDirectMusicLoader8�@CLSID_DirectMusicLoader
	newcom loader, IDirectMusicLoader8
^p
p3�ō쐬���[�h���w�肷�邱�Ƃ��ł��܂��Bp3���ȗ������ꍇ�ɂ̓��[�h0�ƂȂ�܂��B
^p
���[�h    ���e
------------------------------------------------------------------
  0       �w�肳�ꂽ�N���X��COM���T�[�o�[�Ƃ��ČĂяo��
 -1       p4�Ŏw�肳�ꂽ�|�C���^�Ƃ���COM�I�u�W�F�N�g�^�ϐ����쐬
^p
p3��-1�̏ꍇ�́ACOM�I�u�W�F�N�g��V�K�ɍ쐬�����ɁAp4�Ŏw�肳�ꂽ�l��
�|�C���^�Ƃ���COM�I�u�W�F�N�g�^�ϐ����쐬���܂��B
^
COM�I�u�W�F�N�g�^�ϐ��́AWindows������COM�̎d�g�݂�HSP����Ăяo�����߂̎d�g�݂Ɏg�p����܂��B�ڂ����́A�v���O���~���O�}�j���A��(hspprog.htm)���Q�Ƃ��Ă��������B


%href
#usecom
#comfunc
delcom
axobj
querycom
comres
mcall



%index
delcom
COM�I�u�W�F�N�g�^�ϐ��̔j��
%group
COM�I�u�W�F�N�g���얽��
%prm
p1
p1 : �ϐ���

%inst
p1�Ŏw�肵��COM�I�u�W�F�N�g�^�̕ϐ��̃C���X�^���X���폜���܂��B
p1�́Anewcom���߂ɂ���Ă��ł�COM�I�u�W�F�N�g�^���ݒ肳��Ă���ϐ��ł���K�v������܂��B
^p
	��:
	delcom v
^p
delcom���߂́A���������ꂽCOM�I�u�W�F�N�g�̎Q�ƃJ�E���g�����炵�A�ϐ��ɐݒ肳��Ă���C���X�^���X�𖳌��ɂ��܂��B
�ʏ�A�������ꂽCOM�I�u�W�F�N�g�̃C���X�^���X��HSP�����Ŏ����I�ɔj������邽�߁A����delcom���߂Ŗ����I�ɔj������K�v�͂���܂���B
^
��x�j�����ꂽCOM�I�u�W�F�N�g�^�̕ϐ��́A�ēxnewcom���߂ɂ�菉���������܂ł͎g�p���邱�Ƃ��ł��܂���B

%href
querycom
newcom



%index
comres
���\�b�h�Ԓl����ϐ���ݒ肷��
%group
�������Ǘ�����
%prm
p1
p1 : �ϐ���

%inst
p1�Ŏw�肵���ϐ����A���\�b�h�Ԓl����ϐ��Ƃ��Đݒ肵�܂��B
���\�b�h�Ԓl����ϐ��́ACOM�I�u�W�F�N�g�^�ϐ����g�p����COM�I�[�g���[�V����(IDispatch)�̃��\�b�h�Ăяo�����s�Ȃ�ꂽ�ۂɁA���ʂ���������ΏۂƂȂ�܂��B
mcall���߂ɂ���ă��\�b�h�Ăяo�����s�Ȃ�ꂽ���ʂ��擾���邽�߂ɂ́Acomres���߂ɂ���ĕϐ����ݒ肳��Ă���K�v������܂��B

%href
mcall
querycom
newcom
delcom




%index
querycom
COM�I�u�W�F�N�g�^�ϐ��̍쐬
%group
COM�I�u�W�F�N�g���얽��
%prm
p1,p2,p3
p1 : �ϐ���
p2 : �Q�Ƃ����ϐ���
p3 : �C���^�[�t�F�[�X��

%inst
p2�Ŏw�肳�ꂽCOM�I�u�W�F�N�g�^�ϐ��̃C���^�[�t�F�[�X�ɑ΂��āA�ʂȃC���^�[�t�F�[�X��₢���킹�Ap1�Ŏw�肵���ϐ���COM�I�u�W�F�N�g�^�Ƃ��ď��������s�Ȃ��܂��B
p1�̕ϐ���COM�I�u�W�F�N�g�^�łȂ��ꍇ�́ACOM�I�u�W�F�N�g�^�Ƃ��ď���������܂��B
���ł�COM�I�u�W�F�N�g�^�̏ꍇ�A�ȑO�̃I�u�W�F�N�g�͔j������܂��B
p3�ł��łɒ�`����Ă���C���^�[�t�F�[�X�����w�肵�܂��B
�C���^�[�t�F�[�X���́A#usecom���߂ɂ���`���ꂽ���̂ł���K�v������܂��B

%href
#usecom
newcom
delcom
mcall



%index
comevent
COM�C�x���g�̎擾�J�n
%group
COM�I�u�W�F�N�g���얽��
%prm
p1,p2,p3,*label
p1      : �ϐ���
p2      : �C�x���g�擾���̕ϐ���
p3      : �R�l�N�V�����|�C���gGUID
*label  : �C�x���g�T�u���[�`���̃��x��

%inst
p1�Ŏw�肳�ꂽ�ϐ����C�x���g�������s�Ȃ����߂�COM�I�u�W�F�N�g�^�Ƃ��ď��������܂��B
p2�Ŏw�肳�ꂽ�ϐ�(COM�I�u�W�F�N�g�^)����C�ӂ̃C�x���g���擾���ď������s�Ȃ��܂��B
p2�Ŏw�肳�ꂽCOM�I�u�W�F�N�g�́A���ł�newcom���߂ɂ�菉��������Ă���K�v������܂��B
p3�ŃR�l�N�V�����|�C���gGUID�𕶎���`���Ŏw�肵�܂��B
p3�̎w����ȗ������ꍇ�́AIProvideClassInfo2�ɂ���ē���ꂽ�f�t�H���g�̃R�l�N�V�����|�C���g���������܂��B
*label�ŃC�x���g�����T�u���[�`���̃��x�����w�肵�܂��B
�C�x���g�擾�̏����Ɏ��s�����ꍇ�́A�G���[���������܂��B
���������ꍇ�́A����ȍ~�C�x���g���������邽�т�*label�Ŏw�肳�ꂽ�ꏊ�ɃT�u���[�`���W�����v�̊��荞�݂��������܂��B
*label�Ŏw�肳�ꂽ�C�x���g�T�u���[�`���ł́Acomevdisp�֐��Acomevarg���߂ɂ��
�C�x���g�̓��e���ׂ����擾���邱�Ƃ��\�ɂȂ�܂��B

���łɃC�x���g�̎擾���J�n����Ă���ϐ��ɑ΂��āA�ēxcomevent���߂����s�����ꍇ�́A�ȑO�̃C�x���g�L���[�̐ݒ�͖����ɂȂ�܂��B
�C�x���g�̎擾�́Adelcom���߂ɂ��COM�I�u�W�F�N�g���j�������܂Ōp������܂��B


%href
newcom
delcom
comevarg
comevdisp




%index
comevarg
COM�C�x���g�̃p�����[�^�[���擾
%group
COM�I�u�W�F�N�g���얽��
%prm
p1,p2,p3,p4
p1     : ���ʂ���������ϐ���
p2     : �Q�Ƃ����COM�I�u�W�F�N�g�^�ϐ���
p3 (0) : �p�����[�^�[�̃C���f�b�N�X
p4 (0) : �擾���[�h(0=�ʏ�̕ϊ��A1=������ɕϊ� 2=Variant�ϊ�)

%inst
p2�Ŏw�肳�ꂽ�ϐ�(COM�I�u�W�F�N�g�^)�̃C�x���g�T�u���[�`�����ŁA�C�x���g�̃p�����[�^�[(����)���擾���܂��B
p2�Ŏw�肳�ꂽ�ϐ��́Acomevent���߂ɂ�菉��������Ă���K�v������܂��B
�擾�͕K���A�C�x���g�T�u���[�`�����ōs�Ȃ��K�v������܂��B

p3�Ńp�����[�^�[�̃C���f�b�N�X���w�肷�邱�Ƃ��ł��܂��B�C���f�b�N�X�́A0����n�܂鐔�ŃC�x���g�ɂ���ėL���ȃC���f�b�N�X�͈͂��قȂ�܂��B
p4�Ńp�����[�^�[�擾�̕��@���w�肷�邱�Ƃ��ł��܂��B
0���܂��͏ȗ������ꍇ�ɂ́A�f�t�H���g�̕ϊ����@(������^�A���l�^�Ȃǂ̕ϊ����V�X�e���������I�ɍs�Ȃ��܂�)���g�p����܂��B
p4��1���w�肵���ꍇ�́ACOM�̃V�X�e����������ɕϊ�������ԂŎ擾����܂��B
p4��2���w�肵���ꍇ�́AVariant�^�Ƃ��Ēl���擾����܂��B

%href
comevent
comevdisp



%index
sarrayconv
Variant�^�Ƃ̈ꊇ�ϊ����s�Ȃ�
%group
COM�I�u�W�F�N�g���얽��
%prm
p1,p2,p3,p4
p1    : ���ʂ��i�[����ϐ�
p2    : �ϊ����̕ϐ�
p3(0) : �ϊ��̃��[�h
p4(0) : �o�C�i���[�f�[�^�̃T�C�Y

%inst
Variant�^�Ƃ̈ꊇ�ϊ����s�Ȃ��܂��B
p3�̃��[�h�ɂ��A�ϊ��̃��[�h���w�肷�邱�Ƃ��ł��܂��B
�w��ł��郂�[�h�l�͈ȉ��̒ʂ�ł��B
^p
p3�@�@���e
---------------------------------------------
0     ��ϐ�p2�S�̂���SafeArray���쐬���AVariant�^�ϐ�p1��
      �i�[���܂��B
1     Variant�^�ϐ�p2�Ɋi�[����Ă���SafeArray��z��ϐ�p1��
      �i�[���܂��Bp1�̗̈�͍Ċm�ۂ���܂��B
2     �ϐ�p2����p4�o�C�g�������̃o�C�i���f�[�^����SafeArray
      (VT_UI1�^)���쐬���Ap1�Ɋi�[���܂��B
3     Variant�^�ϐ�p2�Ɋi�[����Ă���1����SafeArray (VT_UI1�^
      �܂���VT_I1�^)�̃o�C�i���f�[�^��ϐ�p1�Ɋi�[���܂��B
      �ϐ�p1�̗̈�͂��炩���ߊm�ۂ���Ă���K�v������܂��B
^p

%href
comevarg

