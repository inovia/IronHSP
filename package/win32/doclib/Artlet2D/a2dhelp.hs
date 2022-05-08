;--------------------------------------------------
; Artlet2D for HSP3 help
;--------------------------------------------------

%dll
Artlet2D

%ver
1.01 R3.1

%date
2018/06/16

%author
s.programs

%url
http://spn.php.xdomain.jp/

%note
a2d.hsp ���C���N���[�h���Ă��������B

%type
���[�U�[�g������

%port
Win

%portinfo
Windows XP �ȍ~�̊����K�v�ł��B

%index
alClipModeRect
�N���b�s���O����̈���w��

%prm
px, py, pw, ph
px, py : �N���b�s���O�̈� (��`) �̍�����W (0, 0)
pw, ph : �N���b�s���O�����`�̕��E���� (0, 0)

%inst
�N���b�s���O�����`�̈���w�肵�܂��B

Artlet2D �̕`�施�߂́A�����Ŏw�肵���̈�̒��ɂ̂ݕ`����s���悤�ɂȂ�܂��B

�N���b�s���O���[�h�́AalDraw�`, alFill�`, alCopy�` �Ȃǂ̂��܂��܂ȕ`�施�߂ɓK�p����܂��B

%href
alResetClipMode

%group
�N���b�s���O

%index
alResetClipMode
�N���b�s���O����̈������

%inst
�N���b�s���O���[�h���f�t�H���g�ɖ߂��܂��B

�N���b�s���O���[�h�́AalDraw�`, alFill�`, alCopy�` �Ȃǂ̂��܂��܂ȕ`�施�߂ɓK�p����܂��B

%href
alClipModeRect

%group
�N���b�s���O

%index
alColor
�`��F��ݒ�

%prm
R, G, B, A
R, G, B	: �`��F RGB [0-255] (0)
A	: �`��A���t�@�l [0-255] (255)

%inst
Artlet2D �ŕ`�悷��F��ݒ肵�܂��B

R, G, B �� color ���߂Ŏw�肷����̂Ɠ����A�e 8bit �� RGB �l�ł��B

A �ɂ͕`�掞�̃A���t�@�l (�����x) ���w�肵�܂��BA = 0 �̏ꍇ���S�ɓ����ŁA255 �̏ꍇ���S�ɕs�����ȐF�ƂȂ�܂��BA �l���ȗ�����ƁA255 ���^�����܂��B

(���̖��߂̎��s�ɂ��Agsel ���߂őI�����ꂽ HSP �X�N���[���̕`��F���A�����ĕύX����܂��B)

%href
alHsvColor
alSysColor

%sample
#include "a2d.hsp"

	alCreateImage 0, 640, 480 ; ���z�C���[�W���쐬
	if stat = -1 {
		dialog "GDI+ ���������ł��܂���ł����B"
		end
	}

	alColor 255, 0, 0, 128 ; �`��F���u�������̐ԁv�ɐݒ�
	alFillEllip  0,  0, 100, 100
	alColor 0, 255, 0, 128 ; �`��F���u�������̗΁v�ɐݒ�
	alFillEllip 30, 50, 100, 100
	alColor 0, 0, 255, 128 ; �`��F���u�������̐v�ɐݒ�
	alFillEllip 60,  0, 100, 100

	alCopyImageToScreen 0, 0 ; ���z�C���[�W���� HSP screen �ɉ摜�]��
	redraw ; HSP screen �ĕ`��

%group
�u���V�ݒ�

%index
alGradientColor
�O���f�[�V�����u���V��ݒ�

%prm
x1, y1, x2, y2, ARGB1, ARGB2, mode
x1, y1	: �|�C���g 1
x2, y2	: �|�C���g 2
ARGB1	: �F 1
ARGB2	: �F 2
mode	: ���b�v���[�h (0)

%inst
�O���f�[�V�����u���V��ݒ肵�܂��B

�ݒ肳���O���f�[�V�����̃p�^�[���́A�|�C���g (x1, y1) ���� �|�C���g (x2, y2) �ɂ����āA�F�� ARGB1 ���� ARGB2 �ɕω�������̂ƂȂ�܂��B

mode �ɂ́A�萔 WrapModeTile (= 0) �� WrapModeTileFlipX (= 1) ���g�p�ł��܂��B

ARGB �l�́AR, G, B, A �̒l�� 1 �̐����l�ɂ܂Ƃ߂��`���ŁA16 �i���\�L�̂��ꂼ��̌��̈Ӗ��� 0xAARRGGBB �ƂȂ�܂��B���W���[���ɓ����̃}�N�� ARGB(A, R, G, B) �������� RGBA(R, G, B, A) ���g�p����ƁA�l���ȒP�ɋL�q�ł��܂��B

%sample
#include "a2d.hsp"

	alCreateImage 0, 640, 480 ; ���z�C���[�W���쐬
	if stat = -1 {
		dialog "GDI+ ���������ł��܂���ł����B"
		end
	}

	; �O���f�[�V�����u���V�ݒ�
	alGradientColor 100, 100, 400, 200, RGBA(255,0,0), RGBA(0,0,255)
	alFillEllip 100, 100, 200, 100

	alCopyImageToScreen 0, 0 ; ���z�C���[�W���� HSP screen �ɉ摜�]��
	redraw ; HSP screen �ĕ`��

%href
alColor

%group
�u���V�ݒ�

%index
alHsvColor
�`��F�� HSV �Őݒ�

%prm
H, S, V, A
H, S, V	: �`��F HSV (0)
A	: �`��A���t�@�l [0-255] (255)

%inst
Artlet2D �ŕ`�悷��F�� HSV (�F��, �ʓx, ���x) �Őݒ肵�܂��B

H, S, V �� hsvcolor ���߂Ɠ����t�H�[�}�b�g�Ŏw�肵�܂��B

A �ɂ͕`�掞�̃A���t�@�l (�����x) ���w�肵�܂��BA = 0 �̏ꍇ���S�ɓ����ŁA255 �̏ꍇ���S�ɕs�����ȐF�ƂȂ�܂��BA �l���ȗ�����ƁA255 ���^�����܂��B

(���̖��߂̎��s�ɂ��Agsel ���߂őI�����ꂽ HSP �X�N���[���̕`��F���A�����ĕύX����܂��B)

%href
alColor
alSysColor

%group
�u���V�ݒ�

%index
alSysColor
�V�X�e���J���[����`��F��ݒ�

%prm
p1, A
p1	: �V�X�e���J���[ No. (0)
A	: �`��A���t�@�l [0-255] (255)

%inst
Artlet2D �ŕ`�悷��F���V�X�e���J���[����ݒ肵�܂��B

p1 �ɂ̓V�X�e���J���[�̔ԍ����w�肵�܂��B���̔ԍ��́Asyscolor ���߂Ɠ������̎g�p���܂��B

A �ɂ͕`�掞�̃A���t�@�l (�����x) ���w�肵�܂��BA = 0 �̏ꍇ���S�ɓ����ŁA255 �̏ꍇ���S�ɕs�����ȐF�ƂȂ�܂��BA �l���ȗ�����ƁA255 ���^�����܂��B

(���̖��߂̎��s�ɂ��Agsel ���߂őI�����ꂽ HSP �X�N���[���̕`��F���A�����ĕύX����܂��B)

%href
alColor
alHsvColor

%group
�u���V�ݒ�

%index
alCopyImageToImage
�摜�R�s�[ (Image �� Image)

%prm
sID, dID, dx, dy, w, h, sx, sy
sID	: �R�s�[�� Image ID
dID	: �R�s�[�� Image ID
dx, dy	: �R�s�[���` ������W (0)
w, h	: �R�s�[��` ���E���� (9999)
sx, sy	: �R�s�[����` ������W (0)

%inst
�R�s�[�� Image ID ����R�s�[�� Image ID �ցA�摜���R�s�[���܂��B

���W�������������ȗ������ꍇ�́A�R�s�[��A�R�s�[���Ƃ����W 0, 0�A�摜�S�� (�ő� 9999, 9999) ���R�s�[����܂��B

Image ID �� HSP �X�N���[���Ԃ̉摜�]���ɂ��ẮAalCopyImageToScreen, alCopyScreenToImage ���Q�Ƃ��Ă��������B

%href
alCopyImageToScreen
alCopyScreenToImage

%group
�R�s�[�E�Y�[��

%index
alCopyImageToScreen
�摜�R�s�[ (Image �� HSP screen)

%prm
sID, dID, dx, dy, w, h, sx, sy
sID	: �R�s�[�� Image ID
dID	: �R�s�[�� HSP �X�N���[�� ID
dx, dy	: �R�s�[���` ������W (0)
w, h	: �R�s�[��` ���E���� (9999)
sx, sy	: �R�s�[����` ������W (0)

%inst
�R�s�[�� Image ID ����R�s�[�� HSP �X�N���[�� ID �ցA�摜���R�s�[���܂��B

���W�������������ȗ������ꍇ�́A�R�s�[��A�R�s�[���Ƃ����W 0, 0�A�摜�S�� (�ő� 9999, 9999) ���R�s�[����܂��B

%href
alCopyImageToImage
alCopyScreenToImage

%group
�R�s�[�E�Y�[��

%index
alCopyScreenToImage
�摜�R�s�[ (HSP screen �� Image)

%prm
sID, dID, dx, dy, w, h, sx, sy
sID	: �R�s�[�� HSP �X�N���[�� ID
dID	: �R�s�[�� Image ID
dx, dy	: �R�s�[���` ������W (0)
w, h	: �R�s�[��` ���E���� (9999)
sx, sy	: �R�s�[����` ������W (0)

%inst
�R�s�[�� HSP �X�N���[�� ID ����R�s�[�� Image ID �ցA�摜���R�s�[���܂��B

���W�������������ȗ������ꍇ�́A�R�s�[��A�R�s�[���Ƃ����W 0, 0�A�摜�S�� (�ő� 9999, 9999) ���R�s�[����܂��B

%href
alCopyImageToImage
alCopyImageToScreen

%group
�R�s�[�E�Y�[��

%index
alCopyModeAlpha
�������R�s�[���[�h��ݒ�

%prm
p1
p1	: �A���t�@�l [0.0-1.0] double

%inst
�摜�R�s�[���ɔ������ŃR�s�[����悤�ɐݒ肵�܂��B

�����x�́A�p�����[�^ p1 �Őݒ肵�܂��Bp1 �� 0.0 �̏ꍇ�͊��S�ɓ����ŁA1.0 �̏ꍇ�͊��S�ɕs�����ɂȂ�܂��B

�ݒ肵���R�s�[���[�h�́A���L�̖��߂ɓK�p����܂��B

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

�ړI�̏���������������AalResetCopyMode ���߂Ńf�t�H���g�̃R�s�[���[�h�ɖ߂����Ƃ��ł��܂��B

�R�s�[���[�h�́A�`���� HSP Screen ID, ���z�C���[�W ID ���킸�ɓK�p����܂��B

%sample
; �T���v���X�N���v�g ���L��

%href
alResetCopyMode

%group
�R�s�[���[�h

%index
alResetCopyMode
�R�s�[���[�h�����Z�b�g

%inst
�摜�R�s�[���[�h���f�t�H���g��Ԃɖ߂��܂��B

�R�s�[���[�h�́A���L�̖��߂ɓK�p����܂��B

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

�R�s�[���[�h�́A�`���� HSP Screen ID, ���z�C���[�W ID ���킸�ɓK�p����܂��B

%href
alCopyModeColorMatrix
alCopyModeAlpha
alCopyModeGamma
alCopyModeColorKey

%group
�R�s�[���[�h

%index
alCopyModeColorKey
�J���[�L�[ �R�s�[���[�h��ݒ�

%prm
color1, color2
color1	: �L�[�͈͉��� RGB �l
color2	: �L�[�͈͏�� RGB �l

%inst
�摜�R�s�[���ɓ��ߐF�Ƃ��Ĉ����F�͈̔͂�ݒ肵�܂��B

color �����́AR, G, B �̒l�� 1 �̐����l�ɂ܂Ƃ߂��`���ŁA16 �i���\�L�̂��ꂼ��̌��̈Ӗ��� 0xRRGGBB �ƂȂ�܂��B(COLORREF �^�Ƃ͈قȂ�܂��B) ���W���[���ɓ����̃}�N�� RGBA(R, G, B) ���g�p����ƁA�l���ȒP�ɋL�q�ł��܂��B

���Ƃ��΁A���L�̃R�[�h�́A���F (255, 0, 255) �݂̂𓧖��F�Ƃ��ăR�s�[���郂�[�h��ݒ肵�܂��B

alCopyModeColorKey 0xff00ff, 0xff00ff

�ݒ肵���R�s�[���[�h�́A���L�̖��߂ɓK�p����܂��B

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

�ړI�̏���������������AalResetCopyMode ���߂Ńf�t�H���g�̃R�s�[���[�h�ɖ߂����Ƃ��ł��܂��B

�R�s�[���[�h�́A�`���� HSP Screen ID, ���z�C���[�W ID ���킸�ɓK�p����܂��B

%sample
; �T���v���X�N���v�g ���L��

%href
alResetCopyMode

%group
�R�s�[���[�h

%index
alCopyModeColorMatrix
�J���[�}�g���b�N�X �R�s�[���[�h��ݒ�

%prm
arr
arr	: �J���[�}�g���b�N�X (�s��) ��\���z��

%inst
�摜�R�s�[���ɃJ���[�}�g���b�N�X (�s��) �ϊ����s���悤�ɐݒ肵�܂��B

���� arr �́A�J���[�}�g���b�N�X��\�� double �^�� 1 �����z��ŁA

arr = m00,m01,m02,m03,m04, m10,m11,m12,m13,m14, m20,m21,m22,m23,m24, m30,m31,m32,m33,m34

�ƂȂ�l���w�肵�܂��B���ꂼ��̔z��v�f (�s��v�f) �́A�R�s�[���̐F (R G B A) �����L�̂悤�ɕϊ����Ă��R�s�[��̐F (R' G' B' A') �֏o�͂��邱�Ƃ������܂��B

R' = m00 * R + m01 * G + m02 * B + m03 * A + m04
G' = m10 * R + m11 * G + m12 * B + m13 * A + m14
B' = m20 * R + m21 * G + m22 * B + m23 * A + m24
A' = m30 * R + m31 * G + m32 * B + m33 * A + m34

���ꂼ��̗v�f�́A�ő�P�x�� 1.0 �Ƃ���l�ŋL�q���܂��B

�����z��́A���W���[���ɓ����̃}�N�� MAT_R, MAT_G, MAT_B, MAT_A (= 0, 5, 10, 15) ���g�p���Ĉȉ��̂悤�ɋL�q����ƃR�[�h�����₷���Ȃ�܂��B

	cmatrix(MAT_R) = m00, m01, m02, m03, m04
	cmatrix(MAT_G) = m10, m11, m12, m13, m14
	cmatrix(MAT_B) = m20, m21, m22, m23, m24
	cmatrix(MAT_A) = m30, m31, m32, m33, m34
	alCopyModeColorMatrix cmatrix

�}���[�}�g���b�N�X��p����ƁA�摜�̖��邳�̒����A�l�K�|�W���]�A���������A�O���[�X�P�[���ϊ��A�Z�s�A�F�ϊ��ARGB �����A�A���t�@�`���l���̃O���[�X�P�[���摜���ȂǁA���܂��܂Ȍ��ʂ𓾂邱�Ƃ��ł��܂��B

	(�}�g���b�N�X�̍쐬��)

	; ���ϊ� (��{)
	cmatrix(MAT_R) = 1.0, 0.0, 0.0, 0.0, 0.0
	cmatrix(MAT_G) = 0.0, 1.0, 0.0, 0.0, 0.0
	cmatrix(MAT_B) = 0.0, 0.0, 1.0, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.0

	; �S�̂𖾂邭����
	cmatrix(MAT_R) = 1.0, 0.0, 0.0, 0.0, 0.2
	cmatrix(MAT_G) = 0.0, 1.0, 0.0, 0.0, 0.2
	cmatrix(MAT_B) = 0.0, 0.0, 1.0, 0.0, 0.2
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.2

	; �S�̂��Â�����
	cmatrix(MAT_R) = 1.0, 0.0, 0.0, 0.0, -0.2
	cmatrix(MAT_G) = 0.0, 1.0, 0.0, 0.0, -0.2
	cmatrix(MAT_B) = 0.0, 0.0, 1.0, 0.0, -0.2
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, -0.2

	; �������ŃR�s�[����
	cmatrix(MAT_R) = 1.0, 0.0, 0.0, 0.0, 0.0
	cmatrix(MAT_G) = 0.0, 1.0, 0.0, 0.0, 0.0
	cmatrix(MAT_B) = 0.0, 0.0, 1.0, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 0.5, 0.0

	; �O���[�X�P�[���ɕϊ�
	cmatrix(MAT_R) = 0.299, 0.587, 0.114, 0.0, 0.0
	cmatrix(MAT_G) = 0.299, 0.587, 0.114, 0.0, 0.0
	cmatrix(MAT_B) = 0.299, 0.587, 0.114, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.0

	; �Z�s�A�F�ɕϊ�
	cmatrix(MAT_R) = 0.393, 0.769, 0.189, 0.0, 0.0
	cmatrix(MAT_G) = 0.349, 0.686, 0.168, 0.0, 0.0
	cmatrix(MAT_B) = 0.272, 0.534, 0.131, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.0

	; �l�K�|�W���]
	cmatrix(MAT_R) = -1.0, 0.0, 0.0, 0.0, 0.0
	cmatrix(MAT_G) = 0.0, -1.0, 0.0, 0.0, 0.0
	cmatrix(MAT_B) = 0.0, 0.0, -1.0, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.0

	; �A���t�@�`���l�����O���[�X�P�[���ɕϊ�
	cmatrix(MAT_R) = 0.0, 0.0, 0.0, 1.0, 0.0
	cmatrix(MAT_G) = 0.0, 0.0, 0.0, 1.0, 0.0
	cmatrix(MAT_B) = 0.0, 0.0, 0.0, 1.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 0.0, 1.0

�J���[�}�g���b�N�X �R�s�[���[�h�́A���L�̖��߂ɓK�p����܂��B

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

�ړI�̏���������������AalResetCopyMode ���߂Ńf�t�H���g�̃R�s�[���[�h�ɖ߂����Ƃ��ł��܂��B

�R�s�[���[�h�́A�`���� HSP Screen ID, ���z�C���[�W ID ���킸�ɓK�p����܂��B

%sample
; �T���v���X�N���v�g ���L��

%href
alResetCopyMode

%group
�R�s�[���[�h

%index
alCopyModeGamma
�K���}�����R�s�[���[�h��ݒ�

%prm
p1
p1	: �K���}�l double

%inst
�摜�R�s�[���ɃK���}�l�𒲐����ăR�s�[����悤�ɐݒ肵�܂��B

�ݒ肵���R�s�[���[�h�́A���L�̖��߂ɓK�p����܂��B

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

�ړI�̏���������������AalResetCopyMode ���߂Ńf�t�H���g�̃R�s�[���[�h�ɖ߂����Ƃ��ł��܂��B

�R�s�[���[�h�́A�`���� HSP Screen ID, ���z�C���[�W ID ���킸�ɓK�p����܂��B

%sample
; �T���v���X�N���v�g ���L��

%href
alResetCopyMode

%group
�R�s�[���[�h

%index
alCreateImage
���z�C���[�W���쐬

%prm
ID, pw, ph
ID	: Image ID [0-511] (0)
pw	: ���� [1-] (640)
ph	: ���� [1-] (480)

%inst
Artlet2D ���W���[���̉��z�C���[�W (���z���, Image) ���쐬���܂��B

ID �ɂ́A�쐬���鉼�z�C���[�W�� Image ID ���w�肵�܂��B���łɑ��݂��� Image ID ���w�肵���ꍇ�A�����̉��z�C���[�W�͔j������ĐV�������z�C���[�W���쐬����܂��B

pw, ph �ɂ́A�쐬���鉼�z�C���[�W�̑傫�����s�N�Z���P�ʂŎw�肵�܂��B

���̖��߂ō쐬����鉼�z�C���[�W�́AARGB 32bpp �`���̃A���t�@�`���l���t���r�b�g�}�b�v�ł��BArtlet2D �̕`�施�߂��g���Ă��̃o�b�t�@�ɉ摜��`�悵����A�摜�C���[�W���f�B�X�N�ɕۑ������肷�邱�Ƃ��ł��܂��B�܂��AArtlet2D �ł́A���̉��z�C���[�W���ƂɃu���V�A�y���A�t�H���g�̃X�e�[�^�X��ێ����Ă��܂��B

���z�C���[�W�𕡐��쐬�����ꍇ�́AalSelectImage ���߂��g�p���đ�����؂�ւ��邱�Ƃ��ł��܂��B���z�C���[�W�̍폜�ɂ́AalDeleteImage ���g�p���܂��B������̖��߂��A�����ɂ� alCreateImage ���߂Ŏw�肵�� Image ID ���g�p���܂��BalCreateImage ���߂̎��s��́A�쐬�������z�C���[�W���I�����ꂽ��ԂɂȂ�܂��B

���z�C���[�W�͒��ډ�ʂɂ͕`�悳��܂���̂ŁA���z�C���[�W�̓��e��\�����邽�߂ɂ� alCopyImageToScreen ���߂Ȃǂ��g�p���� HSP �X�N���[���ɓ��e��]������K�v������܂��B

�摜�t�@�C�����璼�ډ��z�C���[�W���쐬����ꍇ�́AalCreateImageByFile ���߂��g�p���܂��B

�R���s���[�^�� GDI+ ����������Ă��Ȃ��� (gdiplus.dll ���Ȃ���) �ł͉��z�C���[�W�͍쐬�ł����A�V�X�e���ϐ� stat �� -1 ���Ԃ�܂��B���̏ꍇ�AArtlet2D �͎g�p�ł��܂���BalCreateImage ���߂Ő���ɉ��z�C���[�W���쐬���ꂽ�ꍇ�́Astat �� 0 ���Ԃ�܂��B

%href
alSelectImage
alDeleteImage
alCreateImageByFile

%sample
#include "a2d.hsp"

	alCreateImage 0, 640, 480 ; ���z�C���[�W���쐬
	if stat = -1 {
		dialog "GDI+ ���������ł��܂���ł����B"
		end
	}

	alFillEllip 0, 0, 200, 100 ; ���z�C���[�W�ɑȉ~��`��

	alCopyImageToScreen 0, 0 ; ���z�C���[�W���� HSP screen �ɉ摜�]��
	redraw ; HSP screen �ĕ`��

%group
�C���[�W�Ǘ�

%index
alCreateImageByFile
�摜�t�@�C�����牼�z�C���[�W���쐬

%prm
ID, "file"
ID	: Image ID
"file"	: �ǂݍ��݃t�@�C����

%inst
�摜�t�@�C����ǂݍ���ŉ��z�C���[�W���쐬���܂��B

ID �ɂ́A�쐬���鉼�z�C���[�W�� Image ID ���w�肵�܂��B���łɑ��݂��� Image ID ���w�肵���ꍇ�A�����̉��z�C���[�W�͔j������ĐV�������z�C���[�W���쐬����܂��B

���̖��߂ŏ���������鉼�z�C���[�W�́A�摜�t�@�C���̌`���Ɋւ�炸�AARGB 32bpp �`���̃A���t�@�`���l���t���r�b�g�}�b�v�ƂȂ�܂��B

�摜�𐳂����ǂݍ��߂Ȃ������ꍇ�A�������̓R���s���[�^�� GDI+ ����������Ă��Ȃ��ꍇ�́A�V�X�e���ϐ� stat �̒l�� -1 �ɂȂ�܂��B����ɏI�������ꍇ�́Astat �� 0 �ƂȂ�܂��B

%href
; �֘A���� ���L��

%group
�t�@�C������

%index
alDeleteImage
���z�C���[�W���폜

%prm
ID
ID	: Image ID [0-511] (0)

%inst
�w�肵�����z�C���[�W���폜���܂��B

���̖��߂̎��s��́A���z�C���[�W�͑I������Ă��Ȃ���ԂƂȂ�܂��̂ŁA���̉��z�C���[�W�ɕ`����s���ꍇ�� alSelectImage ���߂ŕʂ̉��z�C���[�W��I�����Ă��������B

���ׂẲ��z�C���[�W���폜�����ƁAArtlet2D �͎����I�� GDI+ ���J�����܂��B

%href
alCreateImage
alDeleteAll

%group
�C���[�W�Ǘ�

%index
alSelectImage
���z�C���[�W��I��

%prm
ID
ID	: Image ID [0-511] (0)

%inst
����̑ΏۂƂȂ鉼�z�C���[�W��I�����܂��B

���� ID �ɂ́AalCreateImage ���߂Ȃǂō쐬�����C���[�W���w�肵�܂��B

Artlet2D �̕`�施�߂�u���V�A�t�H���g�I�𖽗߂́AalSelectImage ���߂őI�����ꂽ���z�C���[�W�ɑ΂��čs���܂��B

���݂��Ȃ� Image ID ���w�肳�ꂽ�ꍇ�A�V�X�e���ϐ� stat �� -1 ���Ԃ�܂��B����ɃC���[�W���؂�ւ���ꂽ�ꍇ�́Astat �� 0 ���Ԃ�܂��B

%href
alCreateImage

%group
�C���[�W�Ǘ�

%index
alDeleteAll
���z�C���[�W�����ׂč폜

%inst
Artlet2D �̉��z�C���[�W�����ׂč폜���AGDI+ ���J�����܂��B

���̖��ߎ��s����AalCreateImage ���߂ŃC���[�W���쐬����΁A�܂� Artlet2D ���g�p���邱�Ƃ��ł��܂��B

���̖��߂́AHSP �X�N���v�g�̎��s�I�����Ɏ����I�Ɏ��s����܂��B

%href
alDeleteImage

%group
�C���[�W�Ǘ�

%index
alGetID
���ݑI������Ă��� Image ID ���擾

%prm
()

%inst
���ݑI������Ă��鉼�z�C���[�W�� ID (Image ID) ���擾���܂��B

���ݗL���� Image ID ���I������Ă��Ȃ��ꍇ�́A-1 ���Ԃ�܂��B

%href
alSelectImage

%group
�C���[�W�Ǘ�

%index
alDrawArc
�~�ʂ̕`��

%prm
x, y, w, h, ang0, ang1
x, y	: ��ȉ~�ɊO�ڂ����`�̍�����W
w, h	: ��ȉ~�ɊO�ڂ����`�̃T�C�Y
ang0	: �J�n�p�x (�x)
ang1	: �I���p�x (�x)

%inst
�~�ʂ�`�悵�܂��B

%href
alDrawPie
alFillPie

%group
�}�`�`��

%index
alDrawPie
��`�̕`��

%prm
x, y, w, h, ang0, ang1
x, y	: ��ȉ~�ɊO�ڂ����`�̍�����W
w, h	: ��ȉ~�ɊO�ڂ����`�̃T�C�Y
ang0	: �J�n�p�x (�x)
ang1	: �I���p�x (�x)

%inst
��`��`�悵�܂��B

���̐�`�́A�h��Ԃ��ł͂Ȃ����Řg��`�悵���}�`�ł��B

%href
alDrawArc
alFillPie

%group
�}�`�`��

%index
alFillPie
�h��Ԃ���`�̕`��

%prm
x, y, w, h, ang0, ang1
x, y	: ��ȉ~�ɊO�ڂ����`�̍�����W
w, h	: ��ȉ~�ɊO�ڂ����`�̃T�C�Y
ang0	: �J�n�p�x (�x)
ang1	: �I���p�x (�x)

%inst
��`��`�悵�܂��B

%href
alDrawArc
alDrawPie

%group
�}�`�`��

%index
alDrawClosedCurve
�Ȑ��̕`��

%prm
arr, p1, p2
arr	: ���W�f�[�^�������� int �z��
p1	: ���W�f�[�^�̐�
p2	: �J�[�u���x (0.5)

%inst
�^����ꂽ�z��Ɋ�Â��ċȐ���`�悵�܂��B

�z�� arr �̃f�[�^�́Ax1, y1, x2, y2, ..., xN, yN �ƂȂ鐔��ł��Bp1 �ɂ́A�z��ɂ����̃|�C���g�������Ă��邩���w�肵�܂��B���̖��߂́A�w�肳�ꂽ���؂Ă̓_��ʂ�Ȑ���`�悵�܂��Bp2 �ɂ́A�J�[�u�̋������w�肵�܂��B���̒l�� 0 ���ƁA�܂���ɓ������`�挋�ʂƂȂ�܂��B

�Ⴆ�΁A�I�j�M���^�̐}�`��`�悷��ɂ́A

arr = 0, 100,  50, 0,  100, 100
alDrawClosedCurve arr, 3

�Ƃ��܂��B

%group
�}�`�`��

%index
alDrawCurve
�Ȑ��̕`��

%prm
arr, p1, p2
arr	: ���W�f�[�^�������� int �z��
p1	: ���W�f�[�^�̐�
p2	: �J�[�u���x (0.5)

%inst
�^����ꂽ�z��Ɋ�Â��ċȐ���`�悵�܂��B

�z�� arr �̃f�[�^�́Ax1, y1, x2, y2, ..., xN, yN �ƂȂ鐔��ł��Bp1 �ɂ́A�z��ɂ����̃|�C���g�������Ă��邩���w�肵�܂��B���̖��߂́A�w�肳�ꂽ���؂Ă̓_��ʂ�Ȑ���`�悵�܂��Bp2 �ɂ́A�J�[�u�̋������w�肵�܂��B���̒l�� 0 ���ƁA�܂���ɓ������`�挋�ʂƂȂ�܂��B

�Ⴆ�΁A�A�[�`�^�̐}�`��`�悷��ɂ́A

arr = 0, 100,  50, 0,  100, 100
alDrawCurve arr, 3

�Ƃ��܂��B

%group
�}�`�`��

%index
alDrawEllip
�ȉ~�̕`��

%prm
x, y, w, h
x, y	: �O�ڂ����`�̍�����W
w, h	: �O�ڂ����`�̃T�C�Y

%inst
�����Ŏw�肵���ʒu�E�T�C�Y�̋�`�ɓ��ڂ���ȉ~��`�悵�܂��B

%href
alFillEllip

%group
�}�`�`��

%index
alFillEllip
�h��Ԃ��ȉ~�̕`��

%prm
x, y, w, h
x, y	: �O�ڂ����`�̍�����W
w, h	: �O�ڂ����`�̃T�C�Y

%inst
�����Ŏw�肵���ʒu�E�T�C�Y�̋�`�ɓ��ڂ���ȉ~��`�悵�܂��B

%href
alDrawEllip

%group
�}�`�`��

%index
alDrawLine
������`��

%prm
x1, y1, x2, y2
x1, y1	: �|�C���g 1
x2, y2	: �|�C���g 2

%inst
(x1, y1) ���� (x2, y2) �ɐL�т������`�悵�܂��B

Artlet2D (GDI+) �ɂ́A�u�J�����g�|�W�V�����v�Ƃ����T�O�͂���܂���BHSP �W���� line ���߂ƈႢ�A2 �̃|�C���g���ȗ������w�肷��K�v������܂��B

%group
�}�`�`��

%index
alDrawLines
�܂���̕`��

%prm
arr, p1
arr	: ���W�f�[�^�������� int �z��
p1	: ���W�f�[�^�̐�

%inst
�^����ꂽ�z��Ɋ�Â��Đ܂����`�悵�܂��B

�z�� arr �̃f�[�^�́Ax1, y1, x2, y2, ..., xN, yN �ƂȂ鐔��ł��Bp1 �ɂ́A�z��ɂ����̃|�C���g�������Ă��邩���w�肵�܂��B

�Ⴆ�΁AV ���^�̐}�`��`�悷��ɂ́A

arr = 0, 0,  50, 100,  100, 0
alDrawLines arr, 3

�Ƃ��܂��B

�܂���������`�̐}�` (���p�`) ��`�悷��ꍇ�́AalDrawPoly, alFillPoly ���Q�Ƃ��Ă��������B�܂��A�܂�������炩�ɃJ�[�u�����ĕ`�悷��ꍇ�́AalDrawCurve ���Q�Ƃ��Ă��������B

%group
�}�`�`��

%index
alDrawPoly
���p�`�̕`��

%prm
arr, p1
arr	: ���W�f�[�^�������� int �z��
p1	: ���W�f�[�^�̐�

%inst
�^����ꂽ�z��Ɋ�Â��đ��p�`��`�悵�܂��B

�z�� arr �̃f�[�^�́Ax1, y1, x2, y2, ..., xN, yN �ƂȂ鐔��ł��Bp1 �ɂ́A�z��ɂ����̃|�C���g�������Ă��邩���w�肵�܂��B

�Ⴆ�΁A�O�p�`��`�悷��ɂ́A

arr = 0, 100,  50, 0,  100, 100
alDrawPoly arr, 3

�Ƃ��܂��B

%group
�}�`�`��

%index
alDrawRect
��`�̕`��

%prm
x, y, w, h
x, y	: ��`�̍�����W
w, h	: ��`�̃T�C�Y

%inst
�����Ŏw�肵���ʒu�E�T�C�Y�̋�`��`�悵�܂��B

���̋�`�́A�h��Ԃ��ł͂Ȃ����Řg��`�悵���}�`�ł��B

%href
alFillRect

%group
�}�`�`��

%index
alFillRect
�h��Ԃ���`�̕`��

%prm
x, y, w, h
x, y	: ��`�̍�����W
w, h	: ��`�̃T�C�Y

%inst
�����Ŏw�肵���ʒu�E�T�C�Y�̋�`��`�悵�܂��B

%href
alDrawRect

%group
�}�`�`��

%index
alDrawText
������̕`��

%prm
"str", px, py, w, h, ax, ay
"str"	: �`�悷�镶����
px, py	: �`�悷��ʒu (0, 0)
w, h	: �`��̈�̕��ƍ��� (9999, 9999)
ax, ay	: �A���C�������g ���[�h (0, 0)

%inst
���z�C���[�W�ɕ������`�悵�܂��B

���� "str" �̕�������A������W�� px, py �Ƃ��� �� w, ���� h �̋�`�̈���ɕ`�悵�܂��B�����񂪋�`�̈�̕��𒴂���ꍇ�́A�����I�ɐ܂�Ԃ��ĕ`�悳��܂��B

���� ax, ay �ŁA������, �c�����̃A���C�������g���w��ł��܂��B

ax : 0 = ����, 1 = ������, 2 = �E��
ay : 0 = ���, 1 = ������, 2 = ����

���Ƃ��΁A(0, 0)-(640, 480) �̋�`�̈���ɏ㉺���ɃZ���^�����O���ꂽ��Ԃŕ������`�悷��ꍇ�́A

alDrawText "string", 0, 0, 640, 480, 1, 1

�Ƃ��܂��B

alDrawText ���߂����s����O�ɁA�K�� alFont ���߂Ńt�H���g��I������K�v������܂��B

%sample
#include "a2d.hsp"

	alCreateImage 0, 640, 480 ; ���z�C���[�W���쐬
	if stat = -1 {
		dialog "GDI+ ���������ł��܂���ł����B"
		end
	}

	alFont "Times New Roman", 40 ; �t�H���g��ݒ�
	alDrawText "Artlet2D test" ; �e�L�X�g��`��

	; ��ʑS�̂ɃZ���^�����O���ĕ`��
	alDrawText "centering", 0, 0, 640, 480, 1, 1

	alCopyImageToScreen 0, 0 ; ���z�C���[�W���� HSP screen �ɉ摜�]��
	redraw ; HSP screen �ĕ`��

%href
alFont

%group
�}�`�`��

%index
alFont
�t�H���g��ݒ�

%prm
"font", p1, p2
"font"	: �t�H���g�� ("Arial")
p1	: �t�H���g�T�C�Y [1-] (16)
p2	: �t�H���g�X�^�C�� (0)

%inst
alDrawText ���߂ŕ`�悷��t�H���g���w�肵�܂��B

�����́AHSP �W���� font ���߂Ɠ������̂ł��B�������A�t�H���g�̎�ނɂ́A�r�b�g�}�b�v�t�H���g�͎g�p�ł��܂���B�K���x�N�^�f�[�^�������� TrueType �t�H���g���g�p����K�v������܂��B

(���̖��߂̎��s�ɂ��Agsel ���߂őI�����ꂽ HSP �X�N���[���̃t�H���g�ݒ���A�����ĕύX����܂��B)

%sample
; �T���v���X�N���v�g ���L��

%href
alDrawText

%group
�u���V�ݒ�

%index
alErase
���z�C���[�W�S�̂�����

%inst
���z�C���[�W�̃r�b�g�}�b�v�S�̂��A���F�E���� (ARGB(0, 0, 0, 0)) �̏�Ԃɏ������܂��B

%group
�s�N�Z������

%index
alEraserBrush
�����S���u���V�̐ݒ�

%inst
�u���V�������S���u���V�ɐݒ肵�܂��B

���̃u���V��I�����ĕ`�悳�ꂽ�s�N�Z���́A���F�E���� (ARGB(0, 0, 0, 0)) �Ƃ��ď�������܂��B

%sample
alEraserBrush
alFillRect 10, 10, 10, 10 ; ���̋�`�̈������

%group
�u���V�ݒ�

%index
alFillClosedCurve
�h��Ԃ��Ȑ��̕`��

%prm
arr, p1, p2
arr	: ���W�f�[�^�������� int �z��
p1	: ���W�f�[�^�̐�
p2	: �J�[�u���x (0.5)

%inst
�^����ꂽ�z��Ɋ�Â��ċȐ���`�悵�܂��B

�z�� arr �ɂ́A�|�C���g x1, y1, x2, y2, ..., xN, yN �ƂȂ鐔����w�肵�܂��B���̖��߂́A�w�肳�ꂽ���؂Ă̓_��ʂ�Ȑ���`�悵�܂��B

p1 �ɂ́A�z��ɂ����̃|�C���g�������Ă��邩���w�肵�܂��B

p2 �ɂ́A�J�[�u�̋������w�肵�܂��B���̒l�� 0 ���ƁA�܂���ɓ������`�挋�ʂƂȂ�܂��B

�Ⴆ�΁A�I�j�M���^�̐}�`��`�悷��ɂ́A

arr = 0, 100,  50, 0,  100, 100
alFillClosedCurve arr, 3

�Ƃ��܂��B

%group
�}�`�`��

%index
alFillPoly
�h��Ԃ����p�`�̕`��

%prm
arr, p1
arr	: ���W�f�[�^�������� int �z��
p1	: ���W�f�[�^�̐�

%inst
�^����ꂽ�z��Ɋ�Â��đ��p�`��`�悵�܂��B

�z�� arr �ɂ́A�|�C���g x1, y1, x2, y2, ..., xN, yN �ƂȂ鐔����w�肵�܂��B

p1 �ɂ́A�z��ɂ����̃|�C���g�������Ă��邩���w�肵�܂��B

�Ⴆ�΁A�O�p�`��`�悷��ɂ́A

arr = 0, 100,  50, 0,  100, 100
alFillPoly arr, 3

�Ƃ��܂��B

%group
�}�`�`��

%index
alGetFileWidth
�摜�t�@�C���̕��A�������擾

%prm
"file", vx, vy
"file"	: �t�@�C����
vx, vy	: �l���󂯎��ϐ�

%inst
�摜�t�@�C���̕��A�������s�N�Z���P�ʂŎ擾���܂��B

BMP, GIF, JPEG, PNG, TIFF �Ȃ� GDI+ ���ǂݏo����`�����T�|�[�g���܂��B

�摜�𐳂����ǂݍ��߂Ȃ������ꍇ�A�V�X�e���ϐ� stat �̒l�� -1 �ɂȂ�܂��B����ɏI�������ꍇ�́Astat �� 0 �ƂȂ�܂��B

%href
alLoadFile

%group
�t�@�C������

%index
alLoadFile
�摜�t�@�C�������[�h

%prm
"file", px, py
"file"	: �t�@�C����
px, py	: �`��ʒu (0)

%inst
���݂̉��z�C���[�W��ɉ摜�t�@�C�������[�h���܂��B

BMP, GIF, JPEG, PNG, TIFF �Ȃ� GDI+ ���ǂݏo����`�����T�|�[�g���܂��B

���� px, py �ŁA�`���̍�����W���w�肵�܂��B

�摜�t�@�C�����牼�z�C���[�W�𒼐ڍ쐬�������ꍇ�́AalCreateImageByFile ���߂��֗��ł��B

�摜�𐳂����ǂݍ��߂Ȃ������ꍇ�A�V�X�e���ϐ� stat �̒l�� -1 �ɂȂ�܂��B����ɏI�������ꍇ�́Astat �� 0 �ƂȂ�܂��B

%href
; �֘A���� ���L��

%group
�t�@�C������

%index
alGetHeight
���z�C���[�W�̍������擾

%prm
()

%inst
���ݑI������Ă��鉼�z�C���[�W�� Y �T�C�Y (height) ���擾���܂��B

���ݗL���� Image ID ���I������Ă��Ȃ��ꍇ�́A-1 ���Ԃ�܂��B

%href
alGetWidth

%group
�C���[�W�Ǘ�

%index
alGetWidth
���z�C���[�W�̉������擾

%prm
()

%inst
���ݑI������Ă��鉼�z�C���[�W�� X �T�C�Y (width) ���擾���܂��B

���ݗL���� Image ID ���I������Ă��Ȃ��ꍇ�́A-1 ���Ԃ�܂��B

%href
alGetHeight

%group
�C���[�W�Ǘ�

%index
alGetPixel
�s�N�Z���̒l���擾

%prm
(px, py)
px, py	: �l���擾����s�N�Z��

%inst
���݂̉��z�C���[�W��� 1 �s�N�Z���̒l���擾���܂��B�擾�����l�́AARGB �`���̐��l�ł��B

ARGB �l�́AR, G, B, A �̒l�� 1 �̐����l�ɂ܂Ƃ߂��`���ŁA16 �i���\�L�̂��ꂼ��̌��̈Ӗ��� 0xAARRGGBB �ƂȂ�܂��BR, G, B, A ���ꂼ��̒l�́A�}�N�� ARGB_A(), ARGB_R(), ARGB_G(), ARGB_B() �Ŏ擾���邱�Ƃ��ł��܂��B

��
; ���z�C���[�W (0, 0) �� R �l
r = RGBA_R( alGetPixel(0, 0) )

%href
alSetPixel

%group
�s�N�Z������

%index
alSetPixel
�s�N�Z���̒l��ݒ�

%prm
px, py, ARGB
px, py	: �l���擾����s�N�Z��
ARGB	: �ݒ肷�� ARGB �l

%inst
���݂̉��z�C���[�W��� 1 �s�N�Z���ɒl��ݒ肵�܂��B

ARGB �l�́AR, G, B, A �̒l�� 1 �̐����l�ɂ܂Ƃ߂��`���ŁA16 �i���\�L�̂��ꂼ��̌��̈Ӗ��� 0xAARRGGBB �ƂȂ�܂��B���W���[���ɓ����̃}�N�� ARGB(A, R, G, B) �������� RGBA(R, G, B, A) ���g�p����ƁA�l���ȒP�ɋL�q�ł��܂��B

%href
alGetPixel

%group
�s�N�Z������

%index
alPenStyle
�y���̃X�^�C����ݒ�

%prm
p1
p1	: �y���̃X�^�C�� No.

%inst
�y���̃X�^�C����ݒ肵�܂��B

�y���̃X�^�C���Ƃ��āA�ȉ��̒萔����`����Ă��܂��B

DashStyleSolid		(= 0) (�f�t�H���g)
DashStyleDash		(= 1)
DashStyleDot		(= 2)
DashStyleDashDot	(= 3)
DashStyleDashDotDot	(= 4)

�����Őݒ肵���y���̃X�^�C���́AalDrawLine �Ȃǐ���`�悷�閽�߂ɓK�p����܂��B

%sample
; �T���v���X�N���v�g ���L��

%href
alPenWidth

%group
�u���V�ݒ�

%index
alPenWidth
�y���̑�����ݒ�

%prm
p1
p1	: �y���̑��� [1-] int

%inst
�y���̑������s�N�Z���P�ʂŐݒ肵�܂��B

�����Őݒ肵���y���̑����́AalDrawLine �� alDrawEllip �Ȃǐ���`�悷�閽�߂ɓK�p����܂��B

%sample
; �T���v���X�N���v�g ���L��

%href
alPenStyle

%group
�u���V�ݒ�

%index
alResetTransMode
���W�ϊ����[�h�����Z�b�g

%inst
���W�ϊ����[�h���f�t�H���g��� (���ϊ�) �ɖ߂��܂��B

���W�ϊ����[�h�́AalDraw�`, alFill�`, alCopy�` �Ȃǂ̂��܂��܂ȕ`�施�߂ɓK�p����܂��B

���W�ϊ����[�h�́A���[�h�ύX���߂����s�����Ƃ��ɑI������Ă��鉼�z�C���[�W ID �ɑ΂��ēK�p����܂��B

%href
alTransModeMatrix
alTransModeOffsetRotateZoom
alTransModeRotateAt

%group
���W�ϊ����[�h

%index
alTransModeMatrix
���W�ϊ��}�g���b�N�X��ݒ�

%prm
m11, m12, m21, m22, dx, dy
m11, m12, 
m21, m22  : 2x2 ���W�ϊ��}�g���b�N�X (�s��)
dx, dy    : �I�t�Z�b�g

%inst
���W�ϊ����[�h�Ƃ��ă}�g���b�N�X  (�s��) ��ݒ肵�܂��B

���W�ϊ����[�h�́AalDraw�`, alFill�`, alCopy�` �Ȃǂ̂��܂��܂ȕ`�施�߂ɓK�p����܂��B

���W�ϊ����[�h�́A���[�h�ύX���߂����s�����Ƃ��ɑI������Ă��鉼�z�C���[�W ID �ɑ΂��ēK�p����܂��B

%href
alResetTransMode

%group
���W�ϊ����[�h

%index
alTransModeOffsetRotateZoom
���W�ϊ��p�����[�^��ݒ�

%prm
dx, dy, pa, sx, sy
dx, dy : �I�t�Z�b�g (0)
pa     : ��]�p�x (�x) (0)
sx, sy : �Y�[�� (1.0)

%inst
���W�ϊ����[�h�Ƃ��ăp�����[�^��ݒ肵�܂��B

dx, dy �́A�`��ʒu�𕽍s�ړ�����I�t�Z�b�g���w�肵�܂��B
pa �́A(���̌��_�𒆐S��) ��]������p�x���w�肵�܂��B
sx, sy �́A(���̍��W�n�����) �c�E�������Ɉ����L�΂��ʂ��w�肵�܂��B

���W�ϊ����[�h�́AalDraw�`, alFill�`, alCopy�` �Ȃǂ̂��܂��܂ȕ`�施�߂ɓK�p����܂��B

���W�ϊ����[�h�́A���[�h�ύX���߂����s�����Ƃ��ɑI������Ă��鉼�z�C���[�W ID �ɑ΂��ēK�p����܂��B

%href
alResetTransMode

%group
���W�ϊ����[�h

%index
alTransModeRotateAt
���W�ϊ��p�����[�^��ݒ�

%prm
pa, px, py
pa     : ��]�p�x (�x)
px, py : ��]�̒��S���W (0)

%inst
���W�ϊ����[�h�Ƃ��āA�C�ӂ̓_�𒆐S�Ƃ�����]��ݒ肵�܂��B

pa �́A��]������p�x���w�肵�܂��B
px, py �́A��]�̒��S�ƂȂ�_���w�肵�܂��B

���W�ϊ����[�h�́AalDraw�`, alFill�`, alCopy�` �Ȃǂ̂��܂��܂ȕ`�施�߂ɓK�p����܂��B

���W�ϊ����[�h�́A���[�h�ύX���߂����s�����Ƃ��ɑI������Ă��鉼�z�C���[�W ID �ɑ΂��ēK�p����܂��B

%href
alResetTransMode

%group
���W�ϊ����[�h

%index
alSaveFile
�摜�t�@�C����ۑ�

%prm
"file", "MIME", px, py, w, h
"file"	: �ۑ��t�@�C����
"MIME"	: MIME �^�C�v ("image/png")
px, py	: �ۑ��Ώۋ�` ���� (0, 0)
w, h	: �ۑ��Ώۋ�` ���E���� (currentWidth, currentHeight)

%inst
���݂̉��z�C���[�W���t�@�C���Ƃ��ĕۑ����܂��B

�ۑ��`���́A���� MIME �Ŏw�肵�܂��B�w�肷�邱�Ƃ��ł��� MIME �^�C�v�́A"image/bmp", "image/jpeg", "image/gif", "image/tiff", "image/png" �̂����ꂩ�ł��B�������ȗ������ꍇ�̃f�t�H���g�l�́A"image/png" �ł��B�s�N�Z���t�H�[�}�b�g�́A(���̌`���ŃT�|�[�g����Ă���ꍇ) 32bpp ARGB �ƂȂ�܂��B

���� px, py, w, h ���w�肷��ƁA���z�C���[�W�̈ꕔ��ۑ��ł��܂��B�����̈������ȗ������ꍇ�́A���z�C���[�W�S�̂��ΏۂƂȂ�܂��B

�摜��ۑ��ł��Ȃ������ꍇ�A�V�X�e���ϐ� stat �̒l�� -1 �ɂȂ�܂��B����ɏI�������ꍇ�́Astat �� 0 �ƂȂ�܂��B

%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��

%group
�t�@�C������

%index
alStretchImageToImage
�摜�X�g���b�`�R�s�[ (Image �� Image)

%prm
sID, dID, sx, sy, sw, sh, dx, dy, dw, dh
sID	: �R�s�[�� Image ID
dID	: �R�s�[�� Image ID
sx, sy	: �R�s�[����` ������W
sw, sh	: �R�s�[����` ���E����
dx, dy	: �R�s�[���` ������W
dw, dh	: �R�s�[���` ���E����

%inst
�R�s�[�� Image ID �̔C�ӂ̋�`�̈悩��R�s�[�� Image ID �̔C�ӂ̋�`�̈�ցA�摜���g��/�k�����ăR�s�[���܂��B

Image ID �� HSP �X�N���[���Ԃ̉摜�]���ɂ��ẮAalStretchImageToScreen, alStretchScreenToImage ���Q�Ƃ��Ă��������B

%href
alStretchImageToScreen
alStretchScreenToImage

%group
�R�s�[�E�Y�[��

%index
alStretchImageToScreen
�摜�X�g���b�`�R�s�[ (Image �� HSP screen)

%prm
sID, dID, sx, sy, sw, sh, dx, dy, dw, dh
sID	: �R�s�[�� Image ID
dID	: �R�s�[�� HSP �X�N���[�� ID
sx, sy	: �R�s�[����` ������W
sw, sh	: �R�s�[����` ���E����
dx, dy	: �R�s�[���` ������W
dw, dh	: �R�s�[���` ���E����

%inst
�R�s�[�� Image ID �̔C�ӂ̋�`�̈悩��R�s�[�� HSP �X�N���[�� ID �̔C�ӂ̋�`�̈�ցA�摜���g��/�k�����ăR�s�[���܂��B

%href
alStretchImageToImage
alStretchScreenToImage

%group
�R�s�[�E�Y�[��

%index
alStretchScreenToImage
�摜�X�g���b�`�R�s�[ (HSP screen �� Image)

%prm
sID, dID, sx, sy, sw, sh, dx, dy, dw, dh
sID	: �R�s�[�� HSP �X�N���[�� ID
dID	: �R�s�[�� Image ID
sx, sy	: �R�s�[����` ������W
sw, sh	: �R�s�[����` ���E����
dx, dy	: �R�s�[���` ������W
dw, dh	: �R�s�[���` ���E����

%inst
�R�s�[�� HSP �X�N���[�� ID �̔C�ӂ̋�`�̈悩��R�s�[�� Image ID �̔C�ӂ̋�`�̈�ցA�摜���g��/�k�����ăR�s�[���܂��B

%href
alStretchImageToImage
alStretchImageToScreen

%group
�R�s�[�E�Y�[��

%index
alTextureImage
�e�N�X�`���u���V��ݒ�

%prm
ID, mode
ID	: �e�N�X�`���� Image ID [0-511] (0)
mode	: ���b�v���[�h (0)

%inst
�e�N�X�`���u���V��ݒ肵�܂��B

ID �ŁA�e�N�X�`���̉摜�f�[�^��ێ����Ă��鉼�z�C���[�W�� ID ���w�肵�܂��B

mode �ɂ́A�萔 WrapModeTile (= 0), WrapModeTileFlipX (= 1), WrapModeTileFlipY (= 2), WrapModeTileFlipXY (= 3) ���w�肷�邱�Ƃ��ł��܂��B

�e�N�X�`���p�摜�t�@�C�����牼�z�C���[�W���쐬����ꍇ�AalCreateImageByFile ���߂��g�p����ƊȌ��ł��B

%sample
; �T���v���X�N���v�g ���L��

%href
; �֘A���� ���L��

%group
�u���V�ݒ�

