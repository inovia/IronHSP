;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;
%type
�g������
%ver
3.6
%note
hgimg4dx.as�܂���hgimg4.as���C���N���[�h���邱�ƁB
%author
onitama
%dll
hgimg4
%date
2021/01/18
%author
onitama
%url
http://www.onionsoft.net/
%port
Win
%portinfo
HGIMG4DX��DirectX9�AHGIMG4��OpenGL3.1���œ���


%index
fvseti
�����l����x�N�g���ݒ�
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l����������ϐ���
(x,y,z) = �����l
%inst
(x,y,z)�Ŏw�肳�ꂽ�����l���x�N�g���Ƃ���FV�l�ɑ������B
%href
fvset
fvadd
fvsub
fvmul
fvdiv
fvdir
fvmin
fvmax
fvouter
fvinner
fvface
fvunit


%index
fvset
�x�N�g���ݒ�
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l����������ϐ���
(x,y,z) = �v�Z�l(�����l)
%inst
(x,y,z)�Ŏw�肳�ꂽ�����l(X,Y,Z)���x�N�g���Ƃ���FV�l�ɑ������B
%href
fvseti
fvadd
fvsub
fvmul
fvdiv
fvdir
fvmin
fvmax
fvouter
fvinner
fvface
fvunit


%index
fvadd
�x�N�g�����Z
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = �v�Z�l(�����l)
%inst
(x,y,z)�Ŏw�肳�ꂽ�����l(X,Y,Z)��FV�l�ɉ��Z����B
%href
fvseti
fvset
fvsub
fvmul
fvdiv
fvmin
fvmax


%index
fvsub
�x�N�g�����Z
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = �v�Z�l(�����l)
%inst
(x,y,z)�Ŏw�肳�ꂽ�����l(X,Y,Z)��FV�l���猸�Z����B
%href
fvseti
fvset
fvadd
fvmul
fvdiv
fvmin
fvmax


%index
fvmul
�x�N�g����Z
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = �v�Z�l(�����l)
%inst
(x,y,z)�Ŏw�肳�ꂽ�����l(X,Y,Z)��FV�l�ɕ���ŏ�Z����B
%href
fvseti
fvset
fvadd
fvsub
fvdiv
fvmin
fvmax


%index
fvdiv
�x�N�g�����Z
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = �v�Z�l(�����l)
%inst
(x,y,z)�Ŏw�肳�ꂽ�����l(X,Y,Z)��FV�l�ɕ���ŏ��Z����B
%href
fvseti
fvset
fvadd
fvsub
fvmul
fvmin
fvmax


%index
fvdir
�x�N�g����]
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = ��]�p�x(�����l)
%inst
fv�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă���FV�l��X,Y,Z�p�x�Ƃ��āA
�����l(X,Y,Z)�Ŏw�肳�ꂽ�x�N�g������]���������ʂ��A�ϐ�fv�ɑ�����܂��B
%href
fvset
fvdir
fvface


%index
fvface
���W����p�x�𓾂�
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = X,Y,Z���W�l(�����l)
%inst
fv�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă���x�N�g��(FV�l)����_�Ƃ���X,Y,Z���W����A�w�肳�ꂽX,Y,Z���W�𒼐��Ō��邽�߂�X,Y,Z��]�p�x�����߂ĕϐ�fv�ɑ�����܂��B
%href
fvset
fvdir


%index
fvmin
�x�N�g���̗v�f���ŏ��l�Ő؂�l�߂�
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = ��r�l(�����l)
%inst
fv�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă���FV�l�̊e�v�f���A�p�����[�^�[�Ŏw�肳�ꂽ�l(X,Y,Z)���ŏ��l�ɂȂ�悤�ɐ؂�l�߂܂��B
FV�l�̊e�v�f�ɑ΂��čŏ��l��K�p����ꍇ�Ɏg�p���܂��B
%href
fvseti
fvset
fvadd
fvsub
fvmul
fvdiv
fvmax


%index
fvmax
�x�N�g���̗v�f���ő�l�Ő؂�l�߂�
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = ��r�l(�����l)
%inst
fv�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă���FV�l�̊e�v�f���A�p�����[�^�[�Ŏw�肳�ꂽ�l(X,Y,Z)���ő�l�ɂȂ�悤�ɐ؂�l�߂܂��B
FV�l�̊e�v�f�ɑ΂��čő�l��K�p����ꍇ�Ɏg�p���܂��B
%href
fvseti
fvset
fvadd
fvsub
fvmul
fvdiv
fvmin


%index
fvouter
�x�N�g���O��
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = ���Z����x�N�g���l(�����l)
%inst
fv�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă���FV�l�ƁA�����l(X,Y,Z)�Ŏw�肷��x�N�g���̊O�ς����߂đ�����܂��B
%href
fvseti
fvset
fvinner


%index
fvinner
�x�N�g������
%group
�g����ʐ��䖽��
%prm
fv,x,y,z
fv      = FV�l���������Ă���ϐ���
(x,y,z) = ���Z����x�N�g���l(�����l)
%inst
fv�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă���FV�l�ƁA�����l(X,Y,Z)�Ŏw�肷��x�N�g���̓��ς����߂�fv.0�ɑ�����܂��B
%href
fvseti
fvset
fvouter


%index
fvunit
�x�N�g�����K��
%group
�g����ʐ��䖽��
%prm
fv
fv      = FV�l���������Ă���ϐ���
%inst
fv�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă���x�N�g��(FV�l)�𐳋K�����܂��B
%href
fvseti
fvset


%index
fsin
�T�C�������߂�
%group
�g����ʐ��䖽��
%prm
fval,frot
fval    = �����l����������ϐ���
frot    = ��]�p�x(���W�A��)
%inst
frot�Ŏw�肳�ꂽ�p�x�̃T�C���l��fval�Ŏw�肵���ϐ��ɑ�����܂��B
�p�x�̒P�ʂ̓��W�A��(2��=360�x)�ɂȂ�܂��B
%href
fcos
fsqr
froti



%index
fcos
�R�T�C�������߂�
%group
�g����ʐ��䖽��
%prm
fval,frot
fval    = �����l����������ϐ���
frot    = ��]�p�x(���W�A��)
%inst
frot�Ŏw�肳�ꂽ�p�x�̃R�T�C���l��fval�Ŏw�肵���ϐ��ɑ�����܂��B
�p�x�̒P�ʂ̓��W�A��(2��=360�x)�ɂȂ�܂��B
%href
fsin
fsqr
froti



%index
fsqr
�����������߂�
%group
�g����ʐ��䖽��
%prm
fval,fprm
fval    = �����l����������ϐ���
fprm    = ���Z�Ɏg����l(����)
%inst
fprm�Ŏw�肳�ꂽ�l�̕�������fval�Ŏw�肵���ϐ��ɑ�����܂��B
%href
fsin
fcos
froti



%index
str2fv
��������x�N�g���ɕϊ�
%group
�g����ʐ��䖽��
%prm
fv,"x,y,z"
fv      = FV�l����������ϐ���
"x,y,z" = �u,�v�ŋ�؂�ꂽ�����l���i�[���ꂽ������
%inst
"x,y,z"�Ŏw�肳�ꂽ����������u,�v�ŋ�؂�ꂽX,Y,Z�����l�Ƃ��ēǂݏo���Afv�Ŏw�肳�ꂽ�ϐ��Ɋi�[���܂��B
���ꂼ��̍��ڂ����������l�Ƃ��ĔF���ł��Ȃ�(�s����)�����񂪂������ꍇ�ɂ́A����ȍ~�̍��ڂ��܂߂�0.0���������܂��B
%href
fv2str
str2f
f2str
f2i


%index
fv2str
�x�N�g���𕶎���ɕϊ�
%group
�g����ʐ��䖽��
%prm
fv
fv      = FV�l���������Ă���ϐ���
%inst
fv�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă���x�N�g��(FV�l)�𕶎���ɕϊ����ăV�X�e���ϐ�refstr�Ɍ��ʂ�Ԃ��܂��B
%href
str2fv
str2f
f2str
f2i


%index
str2f
������������l�ɕϊ�
%group
�g����ʐ��䖽��
%prm
fval,"fval"
fval    = �����l����������ϐ���
"fval"  = �����l���i�[���ꂽ������
%inst
"fval"�Ŏw�肳�ꂽ��������������l�Ƃ��ēǂݏo���Afval�Ŏw�肳�ꂽ�ϐ��Ɋi�[���܂��B
%href
fv2str
str2fv
f2str
f2i


%index
f2str
�����l�𕶎���ɕϊ�
%group
�g����ʐ��䖽��
%prm
sval,fval
sval    = �����񂪑�������ϐ���
fval    = �ϊ����̎����l
%inst
fval�Ŏw�肳�ꂽ�����l�𕶎���ɕϊ����āAval�Ŏw�肳�ꂽ������^�̕ϐ��Ɍ��ʂ�Ԃ��܂��B
%href
fv2str
str2fv
str2f
f2i


%index
delobj
�I�u�W�F�N�g�̍폜
%group
�g����ʐ��䖽��
%prm
ObjID
ObjID  : �I�u�W�F�N�gID
%inst
�w�肳�ꂽ�I�u�W�F�N�g���폜���܂��B
%href
regobj


%index
setpos
pos�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
pos�O���[�v(�\�����W)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B

%href
setang
setangr
setscale
setdir
setefx
setwork


%index
setang
ang�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
ang�O���[�v(�\���p�x)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
�p�x�̒P�ʂ̓��W�A���ɂȂ�܂��B
(��]���鏇�Ԃ�X->Y->Z�ƂȂ�܂��B���̏��Ԃŉ�]�����邽�߂́Asetangy�Asetangz���߂��p�ӂ���Ă��܂��B)
�����Ŋp�x��ݒ肷�邽�߂�setangr���߂��p�ӂ���Ă��܂��B

%href
setpos
setangr
setscale
setdir
setefx
setwork


%index
setangr
ang�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
ang�O���[�v(�\���p�x)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
�p�x�̒P�ʂ͐�����0�`255�ň������l���g�p���܂��B
���W�A���Ŋp�x��ݒ肷�邽�߂�setang���߂��p�ӂ���Ă��܂��B

%href
setpos
setang
setscale
setdir
setefx
setwork


%index
setscale
scale�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
scale�O���[�v(�\���{��)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B

%href
setpos
setang
setangr
setdir
setefx
setwork


%index
setdir
dir�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
dir�O���[�v(�ړ��x�N�g��)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
�ړ��x�N�g���ɓo�^���ꂽ�l�́A�I�u�W�F�N�g�̎����ړ����[�h(OBJ_MOVE)���ɎQ�Ƃ���܂��B

%href
setpos
setang
setangr
setscale
setefx
setwork


%index
setwork
work�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
work�O���[�v(���[�N�l)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B

%href
setpos
setang
setangr
setscale
setdir
setefx
setwork2


%index
addpos
pos�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : ���Z����l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
pos�O���[�v(�\�����W)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B

%href
addang
addangr
addscale
adddir
addefx
addwork


%index
addang
ang�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : ���Z����l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
ang�O���[�v(�\���p�x)��(x,y,z)�Ŏw�肳�ꂽ�l�����Z���܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
�p�x�̒P�ʂ̓��W�A���ɂȂ�܂��B
�����Ŋp�x��ݒ肷�邽�߂�setangr���߂��p�ӂ���Ă��܂��B

%href
addpos
addangr
addscale
adddir
addefx
addwork


%index
addangr
ang�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : ���Z����l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
ang�O���[�v(�\���p�x)��(x,y,z)�Ŏw�肳�ꂽ�l�����Z���܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
�p�x�̒P�ʂ͐�����0�`255�ň������l���g�p���܂��B
���W�A���Ŋp�x��ݒ肷�邽�߂�setang���߂��p�ӂ���Ă��܂��B

%href
addpos
addang
addscale
adddir
addefx
addwork


%index
addscale
scale�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : ���Z����l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
scale�O���[�v(�\���{��)��(x,y,z)�Ŏw�肳�ꂽ�l�����Z���܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B

%href
addpos
addang
addangr
adddir
addefx
addwork


%index
adddir
dir�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : ���Z����l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
dir�O���[�v(�ړ��x�N�g��)��(x,y,z)�Ŏw�肳�ꂽ�l�����Z���܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B

%href
addpos
addang
addangr
addscale
addefx
addwork


%index
addwork
work�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : ���Z����l (�f�t�H���g=0)

%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
work�O���[�v(���[�N�l)��(x,y,z)�Ŏw�肳�ꂽ�l�����Z���܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B

%href
addpos
addang
addangr
addscale
adddir
addefx


%index
getpos
pos�O���[�v�����擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
pos�O���[�v(�\�����W)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
���߂̍Ō�Ɂui�v��t�����邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B

%href
getposi
getang
getangr
getscale
getdir
getefx
getwork


%index
getscale
scale�O���[�v�����擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
scale�O���[�v(�\���{��)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
���߂̍Ō�Ɂui�v��t�����邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B

%href
getscalei
getpos
getang
getangr
getdir
getefx
getwork


%index
getdir
dir�O���[�v�����擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
dir�O���[�v(�ړ��x�N�g��)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
���߂̍Ō�Ɂui�v��t�����邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B

%href
getdiri
getpos
getang
getangr
getscale
getefx
getwork


%index
getwork
work�O���[�v�����擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
work�O���[�v(���[�N�l)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
���߂̍Ō�Ɂui�v��t�����邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B

%href
getworki
getpos
getang
getangr
getscale
getdir
getefx


%index
getposi
pos�O���[�v���𐮐��Ŏ擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
pos�O���[�v(�\�����W)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B

%href
getpos
getangi
getangri
getscalei
getdiri
getefxi
getworki


%index
getscalei
scale�O���[�v���𐮐��Ŏ擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
scale�O���[�v(�\���{��)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B

%href
getscale
getposi
getangi
getangri
getdiri
getefxi
getworki


%index
getdiri
dir�O���[�v���𐮐��Ŏ擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
dir�O���[�v(�ړ��x�N�g��)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B

%href
getdir
getposi
getangi
getangri
getscalei
getefxi
getworki


%index
getworki
work�O���[�v���𐮐��Ŏ擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�

%inst
�I�u�W�F�N�g�̎��p�����[�^�[���擾���܂��B
work�O���[�v(���[�N�l)�̓��e��(x,y,z)�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B

%href
getwork
getposi
getangi
getangri
getscalei
getdiri
getefxi


%index
selpos
�ړ����W��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��pos(���W)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href
selmoc
selang
selscale
seldir
selefx
selcam
selcpos
selcang
selcint


%index
selang
��]�p�x��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��ang(��]�p�x)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href
selmoc
selpos
selscale
seldir
selefx
selcam
selcpos
selcang
selcint


%index
selscale
�X�P�[����MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��scale(�X�P�[��)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href
selmoc
selpos
selang
selefx
seldir
selcam
selcpos
selcang
selcint


%index
seldir
�ړ��ʂ�MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��dir(�ړ���)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href
selmoc
selpos
selang
selscale
selefx
selcam
selcpos
selcang
selcint


%index
selwork
�I�u�W�F�N�g���[�N��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id     : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��work(���[�N)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href
selmoc
selpos
selang
selscale
selefx
selcam
selcpos
selcang
selcint


%index
objset3
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
x,y,z
x   : �ݒ肷��l
y   : �ݒ肷��l2
z   : �ݒ肷��l3

%inst
MOC����ݒ肵�܂��B
�I�t�Z�b�g�ԍ�0����3�̃p�����[�^���ΏۂɂȂ�܂��B
%href
objset3
objadd3
objset3r
objsetf3
objaddf3


%index
objsetf3
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
fx,fy,fz
fx  : �ݒ肷��l(�����l)
fy  : �ݒ肷��l2(�����l)
fz  : �ݒ肷��l3(�����l)

%inst
MOC����ݒ肵�܂��B
�I�t�Z�b�g�ԍ�0����3�̃p�����[�^���ΏۂɂȂ�܂��B
%href
objset3
objadd3
objset3r
objsetf3
objaddf3


%index
objadd3
MOC�������Z
%group
�g����ʐ��䖽��
%prm
x,y,z
x   : ���Z����l
y   : ���Z����l2
z   : ���Z����l3

%inst
MOC���ɐݒ肳��Ă���l��x,y,z�����Z���܂��B
�I�t�Z�b�g�ԍ�0����3�̃p�����[�^���ΏۂɂȂ�܂��B
%href
objset3
objadd3r
objset3r
objsetf3
objaddf3


%index
objaddf3
MOC�������Z
%group
�g����ʐ��䖽��
%prm
fx,fy,fz
fx  : ���Z����l(�����l)
fy  : ���Z����l2(�����l)
fz  : ���Z����l3(�����l)

%inst
MOC���ɐݒ肳��Ă���l��fx,fy,fz�����Z���܂��B
�I�t�Z�b�g�ԍ�0����3�̃p�����[�^���ΏۂɂȂ�܂��B
%href
objset3
objadd3
objset3r
objsetf3
objaddf3


%index
objadd3r
MOC�������Z
%group
�g����ʐ��䖽��
%prm
ofs,fx,fy,fz
ofs : MOC�̃I�t�Z�b�g�ԍ�
fx  : ���Z����l(�����p�x�l)
fy  : ���Z����l2(�����p�x�l)
fz  : ���Z����l3(�����p�x�l)
%inst
MOC���ɐݒ肳��Ă���l��fx,fy,fz�����Z���܂��B
�����������l(256�łP��])�����W�A���P�ʂɕϊ������p�����[�^�[�����Z���܂��B
�p�x���w�肷��p�����[�^�[�ȊO�ł͐���Ȓl�ɂȂ�Ȃ��̂Œ��ӂ��Ă��������B
%href
objset3
objadd3
objset3r
objsetf3
objaddf3


%index
objset3r
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
x,y,z
x   : �ݒ肷��l
y   : �ݒ肷��l2
z   : �ݒ肷��l3

%inst
MOC���Ɋp�x����ݒ肵�܂��B
�I�t�Z�b�g�ԍ�0����3�̃p�����[�^���ΏۂɂȂ�܂��B
�����l(256�łP��])�����W�A���P�ʂɕϊ����ăp�����[�^�[���������݂܂��B
�p�x���w�肷��p�����[�^�[�ȊO�ł͐���Ȓl�ɂȂ�Ȃ��̂Œ��ӂ��Ă��������B
%href
objset3
objadd3
objset3r
objsetf3
objaddf3


%index
setobjmode
�I�u�W�F�N�g�̃��[�h�ݒ�
%group
�g����ʐ��䖽��
%prm
ObjID,mode,sw
ObjID    : �I�u�W�F�N�gID
mode     : ���[�h�l
sw       : �ݒ�X�C�b�`
%inst
�w�肳�ꂽ�I�u�W�F�N�g�̃��[�h��ύX���܂��B
���[�h�l�́Aregobj���߂Ŏw�肷����̂Ɠ��l�ł��B
sw�́A�ȉ��̂悤�ɓ��삵�܂��B
^p
	sw = 0 : �w�肵�����[�h�l��ǉ�
	sw = 1 : �w�肵�����[�h�l���폜
	sw = 2 : �w�肵�����[�h�l������ݒ�
^p
%href
regobj
setobjmodel


%index
setcoli
�I�u�W�F�N�g�̃R���W�����ݒ�
%group
�g����ʐ��䖽��
%prm
id,mygroup,enegroup
id       : �I�u�W�F�N�gID
mygroup  : ������������O���[�v�l
enegroup : �Փ˂����o����ΏۂƂȂ�O���[�v�l
%inst
�I�u�W�F�N�g�ɑ΂��ăR���W�����O���[�v����ݒ肵�܂��B
�R���W�����O���[�v�l�́A1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768�̒�����1������I���\�ł��B
%href
getcoli
findobj
nextobj


%index
getcoli
�I�u�W�F�N�g�̃R���W��������
%group
�g����ʐ��䖽��
%prm
val,id,distance
val      : ���ʂ���������ϐ���
id       : �I�u�W�F�N�gID
distance : �Փ˂����o����͈�(�����l)
%inst
�w�肵���I�u�W�F�N�g�����R���W�����������ƂɁA���̃I�u�W�F�N�g���Փ˂��Ă���ʂȃI�u�W�F�N�g��ID�𒲂ׂ܂��B
distance�́A�Փ˂���͈�(���a)�������l�Ŏw�肵�܂��B
�Փ˂����o���ꂽ�ꍇ�́A�ϐ��ɃI�u�W�F�N�gID���������܂��B
�����Փ˂����o����Ȃ������ꍇ�́A-1���������܂��B
^
HGIMG4�ł́Adistance�Ƀ}�C�i�X�l���w�肵���ꍇ�A3D���f�������Փ˔͈�(�o�E���f�B���O�{�b�N�X)��distance���|�����l�����ƂɏՓˌ��o���s�Ȃ��܂��B
���Ƃ��΁A-1.5���w�肵���ꍇ�́A�Փ˔͈͂�1.5�{�Ɋg�債����ԂŁA�Փˌ��o���s�Ȃ��܂��B�܂��A��萳�m�ȏՓ˂̏����쐬���邽�߂ɁAgppcontact���߂��g�p���邱�Ƃ��\�ł��B
%href
setcoli
findobj
nextobj
gppcontact


%index
getobjcoli
�I�u�W�F�N�g�̃O���[�v�擾
%group
�g����ʐ��䖽��
%prm
var,id,group
var      : ���ʂ���������ϐ���
id(0)    : �I�u�W�F�N�gID
group(0) : �O���[�vID
%inst
�w�肵���I�u�W�F�N�g����������O���[�v�l(�R���W�����O���[�v�Ȃ�)���擾���Avar�Ŏw�肳�ꂽ�ϐ��ɑ�����܂��B
�O���[�v�l�́A�ȉ��̂��̂ɂȂ�܂��B
^p
�O���[�vID   ���e
---------------------------------------
  0          �R���W�����O���[�v(setcoli�Őݒ�)
  1          �ՓˑΏۃO���[�v(setcoli�Őݒ�)
  2          �����_�����O�O���[�v(setobjrender�Őݒ�)
  3          ���C�e�B���O�O���[�v(setobjrender�Őݒ�)
^p

%href
setcoli
getcoli
setobjrender


%index
setobjrender
�I�u�W�F�N�g�̃����_�����O�O���[�v�ݒ�
%group
�g����ʐ��䖽��
%prm
id,rendergroup,lightgroup
id(0)           : �I�u�W�F�N�gID
rendergroup(1)  : �����_�����O�O���[�v�l
lightgroup(1)   : ���C�e�B���O�O���[�v�l
%inst
�I�u�W�F�N�g�ɑ΂��ă����_�����O�O���[�v�A���C�e�B���O�O���[�v����ݒ肵�܂��B
�����_�����O�O���[�v�l�́A�J�������烌���_�����O�����ۂɕ\����ON/OFF��ݒ肷�邽�߂̒l�ł��B�J�������������_�����O�O���[�v�l�Ɠ���ł���ꍇ�́A�\�����L���ƂȂ�܂��B
�ʏ�́A�I�u�W�F�N�g�A�J�����Ƃ��ɃO���[�v1���ݒ肳��Ă��܂��B����̃J��������̕\���̂ݕ\���𖳌��ɂ������ꍇ�Ȃǂɗ��p�ł��܂��B
���C�e�B���O�O���[�v�l�́A����̃��C�g�ɑ΂��ėL��/������؂�ւ�����̂ł��B���C�g�������C�e�B���O�O���[�v�l�ƈقȂ�ꍇ�́A���C�g�������ƂȂ�܂��B

���ꂼ��̃O���[�v�l�́A1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768�̒�����C�ӂ̃r�b�g��g�ݍ��킹�Ďw��\�ł��B

%href
setcoli
getobjcoli


%index
findobj
�I�u�W�F�N�g����
%group
�g����ʐ��䖽��
%prm
exmode,group
exmode(0) : ���������O���郂�[�h
group(0)  : �����ΏۃR���W�����O���[�v�l
%inst
�L���ȃI�u�W�F�N�g��񋓂��܂��B
�R���W�����O���[�v�l���w�肵���ꍇ�́A����̃R���W�����O���[�v�ɑ�����I�u�W�F�N�g�������������܂��B
�R���W�����O���[�v�l��0�̏ꍇ�́A���ׂẴI�u�W�F�N�g�������ΏۂƂȂ�܂��B
�ŏ���findobj�����s���āA����nextobj���߂ŊY������I�u�W�F�N�g���������邱�Ƃ��ł��܂��B
�܂��Aexmode�Ŏw�肵�����[�h(regobj�Ŏw�肷�郂�[�h�l�Ɠ���)�͌������珜�O����܂��B
%href
setcoli
nextobj


%index
nextobj
���̃I�u�W�F�N�g����
%group
�g����ʐ��䖽��
%prm
val
val      : ���ʂ���������ϐ���
%inst
findobj���߂Ŏw�肳�ꂽ���������ƂɃI�u�W�F�N�g���������܂��B
���������ƁA�ϐ��ɃI�u�W�F�N�gID���������܂��B
�����Ώۂ��Ȃ��Ȃ������ɂ�-1���������܂��B
%href
setcoli
findobj


%index
setborder
�I�u�W�F�N�g�L���͈͐ݒ�
%group
�g����ʐ��䖽��
%prm
fx,fy,fz,option
( fx,fy,fz ) : �{�[�_�[�̈�̐ݒ�l(�����l)
option(0) : �ݒ�I�v�V����(0�`2)
%inst
�{�[�_�[�̈�(�I�u�W�F�N�g�L���͈�)��ݒ肵�܂��B
option�p�����[�^�[�ɂ��A( fx,fy,fz )�ɐݒ肷����e���ς��܂��B
option�p�����[�^�[���ȗ����邩�A�܂���0�̏ꍇ�́A
( 0,0,0 )�𒆐S�ɂ����A( fx,fy,fz )�T�C�Y�̗����̂��{�[�_�[�̈�ƂȂ�܂��B
option�p�����[�^�[��1�̏ꍇ�́A( fx,fy,fz )�̍��W�𐔒l�����������̃{�[�_�[�̈�Ƃ��Đݒ肵�܂��B
option�p�����[�^�[��2�̏ꍇ�́A( fx,fy,fz )�̍��W�𐔒l���傫�����̃{�[�_�[�̈�Ƃ��Đݒ肵�܂��B

%href
regobj
setobjmode


%index
selmoc
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
id, mocofs
id     : �I�u�W�F�N�gID
mocofs : MOC�̃O���[�v�w��
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v���w�肵�܂��B
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
�ʏ�́Aselpos,selang,selscale,seldir���߂����g�����������B
%href
selpos
selang
selscale
seldir
selcam
selcpos
selcang
selcint


%index
objgetfv
MOC�����擾
%group
�g����ʐ��䖽��
%prm
fv
fv      = FV�l����������ϐ���
%inst
MOC�ɐݒ肳��Ă���l��ϐ�fv�ɑ�����܂��B
%href
objsetfv
fvset
fvadd
fvsub
fvmul
fvdiv


%index
objsetfv
MOC����ݒ�
%group
�g����ʐ��䖽��
%prm
fv
fv      = FV�l���������Ă���ϐ���
%inst
�ϐ�fv�̓��e��MOC�ɐݒ肵�܂��B
%href
objgetfv
fvset
fvadd
fvsub
fvmul
fvdiv


%index
objaddfv
MOC�������Z
%group
�g����ʐ��䖽��
%prm
fv
fv      = FV�l���������Ă���ϐ���
%inst
�ϐ�fv�̓��e��MOC�ɉ��Z���܂��B
%href
objgetfv
fvset
fvadd
fvsub
fvmul
fvdiv


%index
objexist
�I�u�W�F�N�gID���L�������ׂ�
%group
�g����ʐ��䖽��
%prm
p1
p1(0) : �I�u�W�F�N�gID
%inst
p1�Ŏw�肳�ꂽ�I�u�W�F�N�gID���L���ł��邩���ׂ܂��B
�I�u�W�F�N�gID���L��(�o�^�ς�)�̏ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B
�I�u�W�F�N�gID������(���o�^)�̏ꍇ�́A�V�X�e���ϐ�stat��-1���������܂��B

%href
regobj
delobj



%index
event_wait
�҂����ԃC�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,p1
id      : �C�x���gID
p1(0)   : �҂�����(�t���[��)
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�҂����ԃC�x���g��ǉ����܂��B
�҂����ԃC�x���g�́Ap1�Ŏw�肳�ꂽ�t���[�����������̃C�x���g�ɐi�ނ��Ƃ�ۗ����܂��B

%href
newevent
setevent


%index
event_jump
�W�����v�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,p1,p2
id      : �C�x���gID
p1(0)   : �W�����v��̃C�x���g�ԍ�
p2(0)   : �W�����v�����̊m��(%)
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�W�����v�C�x���g��ǉ����܂��B
�W�����v�C�x���g�́A�w�肳�ꂽ�C�x���g�ԍ�������s�𑱂��邱�Ƃ��w�����܂��B
�C�x���g���X�g�̒��ł�goto���߂ɂ�����܂��B
p1�Ŏw�肷��C�x���g�ԍ��́A�C�x���g�ɒǉ����ꂽ���Ԃ�0,1,2�c�Ɛ��������̂ɂȂ�܂��B
p2�ŁA�W�����v�����̊m��(%)��ݒ肷�邱�Ƃ��ł��܂��B
0�܂��͏ȗ����ꂽ�ꍇ�́A�K��(������)�ŃW�����v���s�Ȃ��܂��B
����ȊO�̏ꍇ�́A���������Ƃ�1�`100%�̊m���ŃW�����v���s�Ȃ��A
�W�����v���Ȃ������ꍇ�͎��̃C�x���g�ɐi�݂܂��B

%href
newevent
setevent


%index
event_prmset
�p�����[�^�[�ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,p1,p2
id      : �C�x���gID
p1(0)   : �p�����[�^�[ID(PRMSET_*)
p2(0)   : �ݒ肳���l
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�p�����[�^�[�ݒ�C�x���g��ǉ����܂��B
�p�����[�^�[�ݒ�C�x���g�́Ap1�Ŏw�肳�ꂽ�p�����[�^�[ID��p2�̒l��ݒ肵�܂��B
(����܂łɐݒ肳��Ă������e�͏�������܂�)
�p�����[�^�[ID�ɂ́A�ȉ��̖��O���g�p���邱�Ƃ��ł��܂��B
^p
�p�����[�^�[ID   ���e
---------------------------------------
PRMSET_MODE      ���샂�[�h
PRMSET_FLAG      ���݃t���O
PRMSET_SHADE     �V�F�[�f�B���O���[�h
PRMSET_TIMER     �^�C�}�[
PRMSET_MYGROUP   �R���W�����O���[�v�l
PRMSET_COLGROUP  �ΏۃO���[�v�l
^p

%href
event_prmon
event_prmoff
newevent
setevent


%index
event_prmon
�p�����[�^�[�r�b�g�ݒ�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,p1,p2
id      : �C�x���gID
p1(0)   : �p�����[�^�[ID(PRMSET_*)
p2(0)   : �ݒ肳���r�b�g
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�p�����[�^�[�r�b�g�ݒ�C�x���g��ǉ����܂��B
�p�����[�^�[�r�b�g�ݒ�C�x���g�́Ap1�Ŏw�肳�ꂽ�p�����[�^�[ID��p2�̃r�b�g��ݒ肵�܂��B
(����܂łɐݒ肳��Ă������e�͕ێ����ꂽ�܂܁A�V�����l�̃r�b�g�������L���ɂȂ�܂�)
�p�����[�^�[ID�̏ڍׂɂ��ẮAevent_prmset���߂��Q�Ƃ��Ă��������B

%href
event_prmset
event_prmoff
newevent
setevent


%index
event_prmoff
�p�����[�^�[�r�b�g�����C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,p1,p2
id      : �C�x���gID
p1(0)   : �p�����[�^�[ID(PRMSET_*)
p2(0)   : ���������r�b�g
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�p�����[�^�[�r�b�g�����C�x���g��ǉ����܂��B
�p�����[�^�[�r�b�g�����C�x���g�́Ap1�Ŏw�肳�ꂽ�p�����[�^�[ID����A
p2�̃r�b�g�������������܂��B
�p�����[�^�[ID�̏ڍׂɂ��ẮAevent_prmset���߂��Q�Ƃ��Ă��������B

%href
event_prmset
event_prmon
newevent
setevent


%index
event_setpos
pos�O���[�v�ݒ�C�x���g��ǉ�
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
event_setang
event_setangr
event_setscale
event_setdir
event_setefx
event_setwork
newevent
setevent


%index
event_setang
ang�O���[�v�ݒ�C�x���g��ǉ�
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
event_setangr
event_setscale
event_setdir
event_setefx
event_setwork
newevent
setevent


%index
event_setangr
ang�O���[�v�ݒ�C�x���g��ǉ�
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
event_setscale
event_setdir
event_setefx
event_setwork
newevent
setevent


%index
event_setscale
scale�O���[�v�ݒ�C�x���g��ǉ�
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
event_setdir
event_setefx
event_setwork
newevent
setevent


%index
event_setdir
dir�O���[�v�ݒ�C�x���g��ǉ�
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
event_setefx
event_setwork
newevent
setevent


%index
event_setwork
work�O���[�v�ݒ�C�x���g��ǉ�
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
event_setefx
newevent
setevent


%index
event_pos
pos�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,x1,y1,z1,sw
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
(x1,y1,z1) : �ݒ肳���l
sw(1)      : ��ԃI�v�V����
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
sw���ȗ������ꍇ�ɂ́A��Βl�X�v���C�����ݒ肳��܂��B
sw�̒l��16�����Z�����ꍇ�́A(x1,y1,z1)�Őݒ肳���l�̑ւ��ɃI�u�W�F�N�g������work�O���[�v�̒l���g�p���ĕω���ݒ肵�܂��B

%href
event_ang
event_angr
event_scale
event_dir
event_efx
event_work
newevent
setevent


%index
event_ang
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
sw�̒l��16�����Z�����ꍇ�́A(x1,y1,z1)�Őݒ肳���l�̑ւ��ɃI�u�W�F�N�g������work�O���[�v�̒l���g�p���ĕω���ݒ肵�܂��B
(�p�x�̎w��́Asetang���߂Ɠ��l�ŁA��]���鏇�Ԃ�X->Y->Z�ƂȂ�܂��B���̏��Ԃŉ�]�����邽�߂́Aevent_angy�Aevent_angz���߂��p�ӂ���Ă��܂��B)


%href
event_pos
event_angr
event_scale
event_dir
event_efx
event_work
newevent
setevent


%index
event_angr
ang�O���[�v�ω��C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id,frame,x1,y1,z1
id         : �C�x���gID
frame      : �ω��܂ł̃t���[����
(x1,y1,z1) : �ݒ肳���l
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
sw�̒l��16�����Z�����ꍇ�́A(x1,y1,z1)�Őݒ肳���l�̑ւ��ɃI�u�W�F�N�g������work�O���[�v�̒l���g�p���ĕω���ݒ肵�܂��B

%href
event_pos
event_ang
event_scale
event_dir
event_efx
event_work
newevent
setevent


%index
event_scale
scale�O���[�v�ω��C�x���g��ǉ�
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
sw�̒l��16�����Z�����ꍇ�́A(x1,y1,z1)�Őݒ肳���l�̑ւ��ɃI�u�W�F�N�g������work�O���[�v�̒l���g�p���ĕω���ݒ肵�܂��B

%href
event_pos
event_ang
event_angr
event_dir
event_efx
event_work
newevent
setevent


%index
event_dir
dir�O���[�v�ω��C�x���g��ǉ�
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
sw�̒l��16�����Z�����ꍇ�́A(x1,y1,z1)�Őݒ肳���l�̑ւ��ɃI�u�W�F�N�g������work�O���[�v�̒l���g�p���ĕω���ݒ肵�܂��B

%href
event_pos
event_ang
event_angr
event_scale
event_efx
event_work
newevent
setevent


%index
event_work
work�O���[�v�ω��C�x���g��ǉ�
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
event_efx
newevent
setevent


%index
event_addpos
pos�O���[�v���Z�C�x���g��ǉ�
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
event_addang
event_addangr
event_addscale
event_adddir
event_addefx
event_addwork
newevent
setevent


%index
event_addang
ang�O���[�v���Z�C�x���g��ǉ�
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
event_addangr
event_addscale
event_adddir
event_addefx
event_addwork
newevent
setevent


%index
event_addangr
ang�O���[�v���Z�C�x���g��ǉ�
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
event_addscale
event_adddir
event_addefx
event_addwork
newevent
setevent


%index
event_addscale
scale�O���[�v���Z�C�x���g��ǉ�
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
event_adddir
event_addefx
event_addwork
newevent
setevent


%index
event_adddir
dir�O���[�v���Z�C�x���g��ǉ�
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
event_addefx
event_addwork
newevent
setevent


%index
event_addwork
work�O���[�v���Z�C�x���g��ǉ�
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
event_addefx
newevent
setevent


%index
setevent
�I�u�W�F�N�g�ɃC�x���g��ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1(0)  : �I�u�W�F�N�gID
p2(0)  : �C�x���gID
p3(-1) : �C�x���g�X���b�gID
%inst
p1�Ŏw�肵���I�u�W�F�N�g��p2�̃C�x���g��K�p���܂��B
���炩���߁A���܂�������̏���(�C�x���g)��o�^�����C�x���g���X�g��p�ӂ��Ă����K�v������܂��B
^
setevent���߂ɂ���Đݒ肳���C�x���g�́A�I�u�W�F�N�g�P������S�܂œ����ɓK�p���邱�Ƃ��\�ł��B
p3�ɃC�x���g��ݒ肷�邽�߂̃C�x���g�X���b�gID(0����3�܂�)���w�肷�邱�Ƃ��ł��܂��B
p3���ȗ����邩�A-1���w�肵���ꍇ�ɂ�0���珇�Ԃɋ󂢂Ă���C�x���g�X���b�gID���g�p����܂��B
�I�u�W�F�N�g�ɐݒ肳�ꂽ�C�x���g���폜����ꍇ�ɂ́Ap3�ɃC�x���g�X���b�gID���w�肵�āAp2���}�C�i�X�l�ɂ��Ă��������B
^
�C�x���g�̐ݒ�ɐ��������ꍇ�ɂ́A�V�X�e���ϐ�stat�ɐݒ肳�ꂽ�C�x���g�X���b�gID���������܂��B
�C�x���g�̐ݒ�Ɏ��s����ƁA�V�X�e���ϐ�stat��-1���������܂��B


%href
newevent


%index
delevent
�C�x���g���X�g���폜
%group
�g����ʐ��䖽��
%prm
p1
p1 : �C�x���gID
%inst
p1�Ŏw�肵���C�x���g���X�g���폜���܂��B

%href
newevent


%index
newevent
�C�x���g���X�g���쐬
%group
�g����ʐ��䖽��
%prm
p1
p1 : �C�x���gID����������ϐ���
%inst
�V�����C�x���gID���擾���Ap1�Ŏw�肵���ϐ��ɑ�����܂��B
^
�V�����C�x���g���쐬����ꍇ�ɂ́A�K��newevent���߂ŃC�x���gID���擾���Ă����K�v������܂��B
���ɁA�uevent_�v�Ŏn�܂�C�x���g���X�g�ǉ����߂ɂ���đ��ʂȓ����o�^���Ă������Ƃ��ł��܂��B
��x�擾���ꂽ�C�x���gID�́A�V�[���̃��Z�b�g(hgreset����)���s�Ȃ��邩�A
�܂���delevent���߂ɂ���ăC�x���g���X�g���폜�����܂ł͕ێ�����܂��B
^
�������Ăł����C�x���g�́Asetevent���߂ɂ���Ă��ł��I�u�W�F�N�g�ɑ΂��ēK�p���邱�Ƃ��ł��܂��B


%href
delevent
setevent


%index
getang
ang�O���[�v�����擾
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
���߂̍Ō�Ɂui�v��t�����邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B

%href
getangi
getpos
getangr
getscale
getdir
getefx
getwork


%index
getangr
ang�O���[�v�����擾
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
�p�x�̒P�ʂ͐�����0�`255�ň������l���g�p���܂��B

%href
getpos
getang
getscale
getdir
getefx
getwork


%index
event_delobj
�I�u�W�F�N�g�폜�C�x���g��ǉ�
%group
�g����ʐ��䖽��
%prm
id
id         : �C�x���gID
%inst
id�Ŏw�肵�Ă���C�x���gID�ɁA�I�u�W�F�N�g�폜�C�x���g��ǉ����܂��B
�I�u�W�F�N�g�폜�C�x���g�́A���݃C�x���g�����s���Ă���I�u�W�F�N�g���̂��̂��폜���閽�߂ł��B
%href
event_regobj
newevent
setevent


