%dll
hspd2d
%ver
0.4
%date
2026/04/14
%author
IronHSP project
%url
https://github.com/inovia/IronHSP
%note
hspd2d.hsp ���C���N���[�h���邱�ƁBhsp3net ��p (NSTRUCT / intptr / COM �@�\���g������)�B

%type
��������
%group
hspd2d - DirectWrite + Direct2D + WIC �`�惂�W���[��
%port
Win10 22H2+

%index
d2d_init
hspd2d ������������
%prm

%inst
COM �̏������ADirectWrite �t�@�N�g���ADirect2D �t�@�N�g���AWIC �t�@�N�g���𐶐�����B
hspd2d �̑��̖��߂��ĂԑO�ɕK����x�Ă�ł����K�v������ (d2d_image_create / d2d_image_load
�͓����Ŏ����I�ɌĂԂ̂ŁA�����I�ɌĂ΂Ȃ��Ă��悢)�B

%href
d2d_shutdown
d2d_image_create
d2d_image_load


%index
d2d_shutdown
hspd2d ���������
%prm

%inst
DirectWrite / Direct2D / WIC �̊e�t�@�N�g���A���݂̃t�H���g�A���̑����\�[�X���������B
�v���O�����I�����ɌĂԂ��ƁB

%href
d2d_init


%index
d2d_image_create
�I�t�X�N���[���摜 (��) ���쐬����
%prm
id, w, h
id    : �摜 ID (0 �` 255)
w     : �� (�s�N�Z��)
h     : ���� (�s�N�Z��)
%inst
�w�� ID �� 32bpp PBGRA �� WIC �r�b�g�}�b�v�� Direct2D RenderTarget �𐶐�����B
�쐬��͂��� ID ���J�����g�`��ΏۂɂȂ�B������ ID ���w�肷��ƌÂ��ق��͎����Ŕj�������B

%href
d2d_image_load
d2d_image_select
d2d_image_delete


%index
d2d_image_load
�摜�t�@�C����ǂݍ���Ŏw�� ID �ɓW�J����
%prm
id, "filename"
id        : �摜 ID
filename  : �摜�t�@�C�� (PNG / BMP / JPEG / TIFF / GIF)
%inst
WIC �̃f�R�[�_���g���ĉ摜��ǂݍ��݁APBGRA �ɕϊ��A�w�� ID �Ƀr�b�g�}�b�v + RenderTarget
�Ƃ��ēW�J����B�ǂݍ��݌�͂��� ID ���J�����g�`��ΏۂɂȂ�Ad2d_drawimage �̃\�[�X�Ƃ��Ă�
�g����B

%href
d2d_image_create
d2d_image_save
d2d_drawimage


%index
d2d_image_select
�J�����g�`��Ώۂ�؂�ւ���
%prm
id
id : �؂�ւ���̉摜 ID
%inst
ID �Ŏw�肵���摜���J�����g�`��Ώۂɂ���B�ȍ~�� d2d_clear / d2d_drawtext / d2d_drawline /
d2d_fillrect ���͂��̉摜�ɑ΂��ĕ`�悳���B

%href
d2d_image_create
d2d_image_load


%index
d2d_image_delete
�摜��j������
%prm
id
id : �j������摜 ID
%inst
ID �Ŏw�肵���摜�� RenderTarget �� WIC �r�b�g�}�b�v���������B
�J�����g�`��Ώۂ������ꍇ�� cur_id �� -1 �Ƀ��Z�b�g�����B

%href
d2d_image_create


%index
d2d_image_save
�J�����g�摜���t�@�C���ɕۑ�����
%prm
id, "filename"
id        : �ۑ�����摜 ID
filename  : �ۑ��t�@�C���� (�g���q����`������������)
%inst
�g���q�ɉ����Ĉȉ��̌`���ŕۑ�����:
   .png         �� PNG
   .bmp         �� BMP
   .jpg / .jpeg �� JPEG
   .tif / .tiff �� TIFF
   .gif         �� GIF
���Ή��g���q�� PNG �Ƃ��ĕۑ������B

�����I�ɂ� WIC �G���R�[�_���g���� 32bpp BGRA �ŏ����o���B

%href
d2d_image_load


%index
d2d_clear
�J�����g�摜��P�F�œh��Ԃ�
%prm
r, g, b, a
r, g, b : 0�`255
a       : alpha 0�`255
%inst
�J�����g�`��Ώۂ��w��� RGBA �F�œh��Ԃ��B

%href
d2d_color


%index
d2d_color
�Ȍ�̕`��F��ݒ肷��
%prm
r, g, b, a
r, g, b : 0�`255
a       : alpha 0�`255
%inst
d2d_drawline / d2d_drawrect / d2d_fillrect / d2d_drawellipse / d2d_fillellipse /
d2d_drawtext �Ȃǂ̃J�����g�`��F��ݒ肷��B

%href
d2d_clear


%index
d2d_font
�e�L�X�g�`��p�t�H���g��ݒ肷��
%prm
"family", size, weight, italic
family : �t�H���g�t�@�~���[�� (�� "Yu Gothic UI" / "Segoe UI Emoji")
size   : �t�H���g�T�C�Y (DIP)
weight : ���� (100..900�A400=Normal, 700=Bold)
italic : 0=�ʏ� / 1=�Α�
%inst
DirectWrite �� IDWriteTextFormat ���쐬���ăJ�����g�t�H���g�Ƃ���B
������Ăׂ� (�O�̃t�H���g�͎����I�� release �����)�B
Segoe UI Emoji ���w�肷��� COLR/CPAL/CBDT/sbix �n�̃J���[�G�����������ŕ`�悳���B

%href
d2d_drawtext


%index
d2d_drawtext
�e�L�X�g��`�悷��
%prm
"text", x, y, w, h
text  : �`�悷�镶���� (UTF-8/SJIS�A������ UTF-16 �ɕϊ�)
x, y  : �`��ʒu (����)
w, h  : �`���`�̃T�C�Y (0 �ɂ���Ǝc��S��)
%inst
�J�����g�t�H���g / �J�����g�F�Ńe�L�X�g��`�悷��B
D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT ���L���Ȃ̂ŁASegoe UI Emoji ���̐F�t��
�G�����t�H���g�͎����ŃJ���[�`�悳���B

%href
d2d_font
d2d_color


%index
d2d_drawline
����`�悷��
%prm
x0, y0, x1, y1, linew
x0, y0 : �n�_
x1, y1 : �I�_
linew  : ���� (DIP, �ʏ� 1.0�`)
%inst
�J�����g�F�� 2 �_�����Ԓ�����`�悷��B

%href
d2d_drawrect


%index
d2d_drawrect
��` (�g��) ��`�悷��
%prm
x, y, w, h, linew
x, y  : ����
w, h  : �T�C�Y
linew : ����
%inst
�J�����g�F�Řg���݂̂̋�`��`�悷��B

%href
d2d_fillrect


%index
d2d_fillrect
��`��h��Ԃ�
%prm
x, y, w, h
x, y : ����
w, h : �T�C�Y
%inst
�J�����g�F�œh��Ԃ�����`��`�悷��B

%href
d2d_drawrect


%index
d2d_drawellipse
�ȉ~ (�g��) ��`�悷��
%prm
cx, cy, rx, ry, linew
cx, cy : ���S
rx, ry : x/y ���a
linew  : ����
%inst
�J�����g�F�Řg���݂̂̑ȉ~��`�悷��Brx==ry �ɂ���ΐ^�~�B

%href
d2d_fillellipse


%index
d2d_fillellipse
�ȉ~��h��Ԃ�
%prm
cx, cy, rx, ry
cx, cy : ���S
rx, ry : x/y ���a
%inst
�J�����g�F�œh��Ԃ����ȉ~��`�悷��B

%href
d2d_drawellipse


%index
d2d_drawimage
�ʂ̉摜���J�����g�摜�ɕ`�悷��
%prm
src_id, dst_x, dst_y, dst_w, dst_h
src_id : �`�挳�̉摜 ID (d2d_image_load �� d2d_image_create �ō���Ă���)
dst_x  : �]�ʐ�̍��� X
dst_y  : �]�ʐ�̍��� Y
dst_w  : �]�ʐ�̕� (0 �Ō��T�C�Y)
dst_h  : �]�ʐ�̍��� (0 �Ō��T�C�Y)
%inst
src_id �̉摜���J�����g�`��Ώۂɓ]�ʂ���Bdst_w/dst_h �� 0 �ɂ���ƌ��T�C�Y�ŕ`�悳���B
�g��k���͐��`��ԁB

%href
d2d_image_load
d2d_image_create


%index
d2d_gif_load
animated GIF file wo load suru (L1-2)
%prm
"path"
path : GIF file path
%inst
Animated GIF file wo load shite anim handle wo kaesu.
stat ni anim handle (>=0) mataha -1 (error) ga hairu.
Naibu de WIC Decoder wo hoji shi, GIF binary wo parse shite
 frame count / per-frame delay / loop count wo tyuusyutu suru.

%href
d2d_gif_free
d2d_gif_frame_count
d2d_gif_frame_to_image


%index
d2d_gif_frame_count
GIF no frame suu wo kaesu
%prm
handle
handle : d2d_gif_load de eta handle
%inst
Shitei sareta animated GIF no sou frame suu wo stat ni kaesu.

%href
d2d_gif_load


%index
d2d_gif_frame_delay
GIF no frame no delay (10ms tan'i) wo kaesu
%prm
handle, frame_idx
handle    : d2d_gif_load de eta handle
frame_idx : 0 kara hajimaru frame bangou
%inst
Shitei frame no delay wo GIF standard no 10ms tan'i de kaesu.
(Rei: 10 nara 100ms)

%href
d2d_gif_load


%index
d2d_gif_loop_count
GIF no loop count wo kaesu
%prm
handle
handle : d2d_gif_load de eta handle
%inst
NETSCAPE2.0 Application Extension ni kakareta loop count wo kaesu.
0 nara mugen loop.

%href
d2d_gif_load


%index
d2d_gif_frame_to_image
GIF no frame wo d2d_image ni tenso suru
%prm
handle, frame_idx, dst_image_id
handle       : d2d_gif_load de eta handle
frame_idx    : frame bangou (0 kara)
dst_image_id : d2d image ID (0..255)
%inst
Shitei frame wo WIC kara tori, PBGRA ni henkan shite
 dst_image_id no d2d_image (WIC bitmap + RenderTarget) wo sakusei suru.
Sude ni dst_image_id ga tsukawareteireba hakai sareru.
Sakusei go ha dst_image_id ga current draw target ni naru.

%href
d2d_gif_load
d2d_image_create
d2d_drawimage


%index
d2d_gif_free
GIF handle wo kaihou
%prm
handle
%inst
d2d_gif_load de eta handle wo kaihou suru.
d2d_shutdown de mo jidou de kaihou sareru.

%href
d2d_gif_load


%index
d2d_gif_write_begin
GIF write wo kaishi (stub, mi jissou)
%prm
"path", w, h
%inst
Genzai stub. Tsune ni -1 wo kaesu.
WIC encoder no multi-frame + PROPVARIANT metadata ga hitsuyou na tame
 shourai no Phase de jissou yotei.


%index
d2d_gif_write_frame
GIF frame wo kakidasi (stub)
%prm
writer_handle, src_image_id, delay_ms
%inst
Genzai stub. Tsune ni -1 wo kaesu.


%index
d2d_gif_write_end
GIF write wo kakutei (stub)
%prm
writer_handle
%inst
Genzai stub. Tsune ni -1 wo kaesu.


%index
d2d_svg_load
SVG file wo load shite render suru (stub, mi jissou)
%prm
"path", w, h
%inst
Genzai stub. Tsune ni -1 wo kaesu.
ID2D1DeviceContext5::CreateSvgDocument wo tsukau tame ni ha
 D3D-backed render target ga hitsuyou de, genzai no hspd2d ha
 ID2D1WicBitmapRenderTarget (software) wo tsukatte iru node,
 D3D/DXGI/D2D device chain heno init dai kaishuu ga hitsuyou.
Phase L ikou de taiou yotei.


%index
d2d_svg_load_str
SVG mojiretsu kara render (stub)
%prm
"svg_text", w, h
%inst
Genzai stub. Tsune ni -1 wo kaesu. Shousai ha d2d_svg_load sanshou.
