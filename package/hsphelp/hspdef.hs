%type
�V�X�e����`�}�N��
%ver
3.6
%date
2019/04/09
%note
���̃}�N����hspdef.as���Œ�`����Ă��܂��B
%group
�W����`�}�N��
%author
onitama
%port
Win
Mac
Cli


%index
gmode_sub
�F���Z�����R�s�[���[�h

%inst
gmode�̑�1�����Ɏw�肷�邱�ƂŁA��ʃR�s�[���[�h��F���Z�����R�s�[���[�h�ɐݒ�ł��܂��B

%sample
	screen 1 : picload dir_exe + "/sample/demo/logop.bmp"
	img_width = ginfo_winx
	img_height = ginfo_winy
	gsel 0
	color       : boxf img_width / 5, 0, img_width  * 2 / 5, ginfo_winy
	color 255   : boxf img_width * 2 / 5, 0, img_width * 3 / 5, ginfo_winy
	color ,255  : boxf img_width * 3 / 5, 0, img_width * 4 / 5, ginfo_winy
	color ,,255 : boxf img_width * 4 / 5, 0, img_width, ginfo_winy
	gmode gmode_sub, img_width, img_height, 256
	gcopy 1, 0, 0
	stop

%href
gmode
gmode_rgb0
gmode_mem
gmode_alpha
gmode_add
gmode_gdi
gmode_rgb0alpha
gmode_pixela
%index
gmode_add
�F���Z�����R�s�[���[�h

%inst
gmode�̑�1�����Ɏw�肷�邱�ƂŁA��ʃR�s�[���[�h��F���Z�����R�s�[���[�h�ɐݒ�ł��܂��B

%sample
	screen 1 : picload dir_exe + "/sample/demo/logop.bmp"
	img_width = ginfo_winx
	img_height = ginfo_winy
	gsel 0
	color       : boxf img_width / 5, 0, img_width  * 2 / 5, ginfo_winy
	color 255   : boxf img_width * 2 / 5, 0, img_width * 3 / 5, ginfo_winy
	color ,255  : boxf img_width * 3 / 5, 0, img_width * 4 / 5, ginfo_winy
	color ,,255 : boxf img_width * 4 / 5, 0, img_width, ginfo_winy
	gmode gmode_add, img_width, img_height, 256
	gcopy 1, 0, 0
	stop

%href
gmode
gmode_rgb0
gmode_mem
gmode_alpha
gmode_sub
gmode_gdi
gmode_rgb0alpha
gmode_pixela
%index
gmode_gdi
�ʏ�̃R�s�[���[�h

%inst
gmode�̑�1�����Ɏw�肷�邱�ƂŁA��ʃR�s�[���[�h��ʏ�̃R�s�[���[�h�ɐݒ�ł��܂��B
�ȗ����Ă��������ʂ������܂��̂ŁA�ȗ����Ă��\���܂���B

%sample
	buffer 1 : picload dir_exe + "/sample/demo/logop.bmp"
	img_width = ginfo_winx
	img_height = ginfo_winy
	gsel 0
	gmode gmode_gdi
	gcopy 1, 0, 0, img_width, img_height
	stop

%href
gmode
gmode_rgb0
gmode_mem
gmode_alpha
gmode_add
gmode_sub
gmode_rgb0alpha
gmode_pixela
%index
gmode_rgb0
�����F�t���R�s�[���[�h

%inst
gmode�̑�1�����Ɏw�肷�邱�ƂŁA��ʃR�s�[���[�h�𓧖��F�t���R�s�[���[�h�ɐݒ�ł��܂��B

%sample
	screen 1 : picload dir_exe + "/sample/demo/logop.bmp"
	img_width = ginfo_winx
	img_height = ginfo_winy
	gsel 0
	gmode gmode_rgb0, img_width, img_height
	gcopy 1, 0, 0
	stop

%href
gmode
gmode_sub
gmode_mem
gmode_alpha
gmode_add
gmode_gdi
gmode_rgb0alpha
gmode_pixela
%index
gmode_mem
�������ԃR�s�[���[�h

%inst
gmode�̑�1�����Ɏw�肷�邱�ƂŁA��ʃR�s�[���[�h���������ԃR�s�[���[�h�ɐݒ�ł��܂��B

%sample
	screen 1 : picload dir_exe + "/sample/demo/logop.bmp"
	img_width = ginfo_winx
	img_height = ginfo_winy
	gsel 0
	gmode gmode_mem, img_width, img_height
	gcopy 1, 0, 0
	stop

%href
gmode
gmode_rgb0
gmode_sub
gmode_alpha
gmode_add
gmode_gdi
gmode_rgb0alpha
gmode_pixela
%index
gmode_alpha
�����������R�s�[���[�h

%inst
gmode�̑�1�����Ɏw�肷�邱�ƂŁA��ʃR�s�[���[�h�𔼓��������R�s�[���[�h�ɐݒ�ł��܂��B

%sample
	screen 1 : picload dir_exe + "/sample/demo/logop.bmp"
	img_width = ginfo_winx
	img_height = ginfo_winy
	gsel 0
	color       : boxf img_width / 5, 0, img_width  * 2 / 5, ginfo_winy
	color 255   : boxf img_width * 2 / 5, 0, img_width * 3 / 5, ginfo_winy
	color ,255  : boxf img_width * 3 / 5, 0, img_width * 4 / 5, ginfo_winy
	color ,,255 : boxf img_width * 4 / 5, 0, img_width, ginfo_winy
	gmode gmode_alpha, img_width, img_height, 128
	gcopy 1, 0, 0
	stop

%href
gmode
gmode_rgb0
gmode_mem
gmode_sub
gmode_add
gmode_gdi
gmode_rgb0alpha
gmode_pixela
%index
gmode_rgb0alpha
�����F�t�������������R�s�[���[�h

%inst
gmode�̑�1�����Ɏw�肷�邱�ƂŁA��ʃR�s�[���[�h�𓧖��F�t�������������R�s�[���[�h�ɐݒ�ł��܂��B

%sample
	screen 1 : picload dir_exe + "/sample/demo/logop.bmp"
	img_width = ginfo_winx
	img_height = ginfo_winy
	gsel 0
	color   0,   0,   0 : boxf img_width / 5, 0, img_width  * 2 / 5, ginfo_winy
	color 255,   0,   0 : boxf img_width * 2 / 5, 0, img_width * 3 / 5, ginfo_winy
	color   0, 255,   0 : boxf img_width * 3 / 5, 0, img_width * 4 / 5, ginfo_winy
	color   0,   0, 255 : boxf img_width * 4 / 5, 0, img_width, ginfo_winy
	gmode gmode_rgb0alpha, img_width, img_height, 128
	color 0, 0, 0
	gcopy 1, 0, 0
	stop

%href
gmode
gmode_rgb0
gmode_mem
gmode_alpha
gmode_add
gmode_gdi
gmode_sub
gmode_pixela
%index
gmode_pixela
�s�N�Z���A���t�@�u�����h�R�s�[���[�h

%inst
gmode�̑�1�����Ɏw�肷�邱�ƂŁA��ʃR�s�[���[�h���s�N�Z���A���t�@�u�����h�R�s�[���[�h�ɐݒ�ł��܂��B

%sample
	screen 1 : picload dir_exe + "/sample/demo/logop.bmp"
	img_width = ginfo_winx
	img_height = ginfo_winy
	screen 1, img_width * 2, img_height : picload dir_exe + "/sample/demo/logop.bmp", 1
	repeat img_width
		hsvcolor cnt * 192 / ( img_width  ), 255, 255
		line img_width + cnt, img_height, img_width + cnt, 0
	loop
	gsel 0
	gmode gmode_pixela, img_width, img_height, 128
	gcopy 1, 0, 0
	stop

%href
gmode
gmode_rgb0
gmode_mem
gmode_alpha
gmode_add
gmode_gdi
gmode_rgb0alpha
gmode_sub
%index
objinfo_mode
���[�h����уI�v�V�����f�[�^���擾

%prm
(p1)
p1=0�` : �E�B���h�E�I�u�W�F�N�gID

%inst
�w�肵���E�B���h�E�I�u�W�F�N�g�̃��[�h����уI�v�V�����f�[�^��Ԃ��܂��B

%sample
	button goto "sample", *dummy
	info = objinfo_mode( stat )
	mes "mode : " + ( info & 0xffff )
	mes "option : " + ( info >> 16 & 0xffff )

*dummy
	stop

%href
objinfo
objinfo_hwnd
objinfo_bmscr
%index
objinfo_bmscr
�I�u�W�F�N�g���z�u����Ă���BMSCR�\���̂̃|�C���^���擾

%prm
(p1)
p1=0�` : �E�B���h�E�I�u�W�F�N�gID

%inst
�w�肵���E�B���h�E�I�u�W�F�N�g���z�u����Ă���BMSCR�\���̂̃|�C���^��Ԃ��܂��B

%sample
	button goto "sample", *dummy
	p_bmscr = objinfo_bmscr( stat )
	mes "object���z�u����Ă���BMSCR�\���̂̃|�C���^ : " + p_bmscr
	mref bmscr, 67
	mes "mref�œ�����l�i" + varptr( bmscr ) + "�j�Ɠ���"

*dummy
	stop

%href
objinfo
objinfo_mode
objinfo_hwnd
%index
objinfo_hwnd
�E�B���h�E�I�u�W�F�N�g�̃n���h�����擾

%prm
(p1)
p1=0�` : �E�B���h�E�I�u�W�F�N�gID

%inst
�w�肵���E�B���h�E�I�u�W�F�N�g�̃n���h����Ԃ��܂��B

%sample
	button goto "sample", *dummy
	obj_hwnd = objinfo_hwnd( stat )
	mes "�E�B���h�E�I�u�W�F�N�g�̃n���h�� : " + obj_hwnd

*dummy
	stop

%href
objinfo
objinfo_mode
objinfo_bmscr
%index
screen_normal
�ʏ�̃E�B���h�E���쐬

%inst
screen���߂̑�4�����Ɏw�肷�邱�ƂŁA�ʏ�̃E�B���h�E���쐬�ł��܂��B
�ȗ����Ă��������ʂ������܂��̂ŁA�ȗ����Ă��\���܂���B

%sample
// �E�B���h�EID0�̒ʏ�̃E�B���h�E���쐬
	screen 0, 640, 480, screen_normal

// �ȗ����Ă��������ʂ�������
	screen 1, 320, 240
	stop

%href
screen
screen_palette
screen_hide
screen_fixedsize
screen_tool
screen_frame

%index
screen_palette
�p���b�g���[�h�̃E�B���h�E���쐬

%inst
screen���߂̑�4�����Ɏw�肷�邱�ƂŁA�p���b�g���[�h�̃E�B���h�E���쐬�ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �E�B���h�EID0�̃E�B���h�E���p���b�g���[�h�ō쐬
	screen 0, 640, 480, screen_palette
	stop

%href
screen
screen_normal
screen_hide
screen_fixedsize
screen_tool
screen_frame

%index
screen_hide
��\���̃E�B���h�E���쐬

%inst
screen���߂̑�4�����Ɏw�肷�邱�ƂŁA��\���̃E�B���h�E���쐬�ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �E�B���h�EID0�̃E�B���h�E���\���ō쐬
	screen 0, 640, 480, screen_hide
	stop

%href
screen
screen_normal
screen_palette
screen_fixedsize
screen_tool
screen_frame
%index
screen_fixedsize
�T�C�Y�Œ�E�B���h�E���쐬

%inst
screen���߂̑�4�����Ɏw�肷�邱�ƂŁA�T�C�Y�Œ�̃E�B���h�E���쐬�ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �E�B���h�EID0�̃E�B���h�E���T�C�Y�Œ�ō쐬
	screen 0, 640, 480, screen_fixedsize
	stop

%href
screen
screen_normal
screen_palette
screen_hide
screen_tool
screen_frame
%index
screen_tool
�c�[���E�B���h�E���쐬

%inst
screen���߂̑�4�����Ɏw�肷�邱�ƂŁA�c�[���E�B���h�E���쐬�ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �E�B���h�EID0�̃c�[���E�B���h�E���쐬
	screen 0, 640, 480, screen_tool
	stop

%href
screen
screen_normal
screen_palette
screen_hide
screen_fixedsize
screen_frame

%index
screen_frame
�[�����̂���E�B���h�E���쐬

%inst
screen���߂̑�4�����Ɏw�肷�邱�ƂŁA�[�����̂���E�B���h�E���쐬�ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �E�B���h�EID�̐[�����̂���E�B���h�E���쐬
	screen 0, 640, 480, screen_frame
	stop

%href
screen
screen_normal
screen_palette
screen_hide
screen_fixedsize
screen_tool

%index
font_normal
�ʏ�̃X�^�C���Ńt�H���g�ݒ�

%inst
font���߂̑�3�����Ɏw�肷�邱�ƂŁA�ʏ�̃X�^�C���Ńt�H���g��ݒ肷�邱�Ƃ��ł��܂��B
�ȗ����Ă��������ʂ������܂��̂ŁA�ȗ����Ă��\���܂���B

%sample
// �T�C�Y12��MS�S�V�b�N��ݒ�
	font msgothic, 24, font_normal
	mes "�T�C�Y24��MS�S�V�b�N�i�ʏ�̃X�^�C���j"

// �ȗ����Ă��������ʂ�������
	font msgothic, 24
	mes "�T�C�Y24��MS�S�V�b�N�i�ʏ�̃X�^�C���j"
	stop

%href
font
font_bold
font_italic
font_underline
font_strikeout
font_antialias
%index
font_bold
�������Ńt�H���g�ݒ�

%inst
font���߂̑�3�����Ɏw�肷�邱�ƂŁA�������̃t�H���g��ݒ肷�邱�Ƃ��ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �T�C�Y24��MS�S�V�b�N��ݒ�
	font msgothic, 24, font_normal
	mes "�T�C�Y24��MS�S�V�b�N�i�ʏ�̃X�^�C���j"

// �T�C�Y24�ő�������MS�S�V�b�N��ݒ�
	font msgothic, 24, font_bold
	mes "�T�C�Y24��MS�S�V�b�N�i�������j"
	stop

%href
font
font_normal
font_italic
font_underline
font_strikeout
font_antialias
%index
font_italic
�C�^���b�N�̂Ńt�H���g�ݒ�

%inst
font���߂̑�3�����Ɏw�肷�邱�ƂŁA�C�^���b�N�̂̃t�H���g��ݒ肷�邱�Ƃ��ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �T�C�Y24��MS�S�V�b�N��ݒ�
	font msgothic, 24, font_normal
	mes "�T�C�Y24��MS�S�V�b�N�i�ʏ�̃X�^�C���j"

// �T�C�Y24�ŃC�^���b�N��MSms�S�V�b�N��ݒ�
	font msgothic, 24, font_italic
	mes "�T�C�Y24��MS�S�V�b�N�i�C�^���b�N�́j"
	stop

%href
font
font_normal
font_bold
font_underline
font_strikeout
font_antialias
%index
font_underline
�����t���Ńt�H���g�ݒ�

%inst
font���߂̑�3�����Ɏw�肷�邱�ƂŁA�����t���̃t�H���g��ݒ肷�邱�Ƃ��ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �T�C�Y24��MS�S�V�b�N��ݒ�
	font msgothic, 24, font_normal
	mes "�T�C�Y24��MS�S�V�b�N�i�ʏ�̃X�^�C���j"

// �T�C�Y24�ŉ����t����MS�S�V�b�N��ݒ�
	font msgothic, 24, font_underline
	mes "�T�C�Y24��MS�S�V�b�N�i�����t���j"
	stop

%href
font
font_normal
font_bold
font_italic
font_strikeout
font_antialias
%index
font_strikeout
�ł��������t���Ńt�H���g�ݒ�

%inst
font���߂̑�3�����Ɏw�肷�邱�ƂŁA�ł��������t���̃t�H���g��ݒ肷�邱�Ƃ��ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �T�C�Y24��MS�S�V�b�N��ݒ�
	font msgothic, 24, font_normal
	mes "�T�C�Y24��MS�S�V�b�N�i�ʏ�̃X�^�C���j"

// �T�C�Y24�őł��������t����MS�S�V�b�N��ݒ�
	font msgothic, 24, font_strikeout
	mes "�T�C�Y24��MS�S�V�b�N�i�ł��������t���j"
	stop

%href
font
font_normal
font_bold
font_italic
font_underline
font_antialias
%index
font_antialias
�A���`�G�C���A�X�Ńt�H���g�ݒ�

%inst
font���߂̑�3�����Ɏw�肷�邱�ƂŁA�A���`�G�C���A�X�̃t�H���g��ݒ肷�邱�Ƃ��ł��܂��B
���̃}�N���Ƒg�ݍ��킹�Ďw�肷��ꍇ�́A���̘a�܂��͘_���a���w�肵�Ă��������B

%sample
// �T�C�Y24��MS�S�V�b�N��ݒ�
	font msgothic, 24, font_normal
	mes "�T�C�Y24��MS�S�V�b�N�i�ʏ�̃X�^�C���j"

// �T�C�Y24�ŃA���`�G�C���A�X��MS�S�V�b�N��ݒ�
	font msgothic, 24, font_antialias
	mes "�T�C�Y24��MS�S�V�b�N�i�A���`�G�C���A�X�j"
	stop

%href
font
font_normal
font_bold
font_italic
font_underline
font_strikeout


%index
objmode_normal
HSP�W���t�H���g��ݒ�

%inst
objmode���߂̑�1�����Ɏw�肷�邱�ƂŁA�I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g��HSP�W���t�H���g�ɐݒ肷�邱�Ƃ��ł��܂��B
�ȗ����Ă��������ʂ������܂��̂ŁA�ȗ����Ă��\���܂���B

%sample
	s = "�I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g�̃T���v��"

// �I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g��HSP�W���t�H���g�ɐݒ�
	objmode objmode_normal
	mesbox s, ginfo_winx, ginfo_winy / 2

// �ȗ����Ă��������ʂ�������
	objmode objmode_normal
	mesbox s, ginfo_winx, ginfo_winy / 2

	stop

%href
objmode
objmode_guifont
objmode_usefont
objmode_usecolor

%index
objmode_guifont
�f�t�H���gGUI�t�H���g��ݒ�

%inst
objmode���߂̑�1�����Ɏw�肷�邱�ƂŁA�I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g���f�t�H���gGUI�t�H���g�ɐݒ肷�邱�Ƃ��ł��܂��B

%sample
	s = "�I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g�̃T���v��"

// �I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g���f�t�H���gGUI�t�H���g�ɐݒ�
	objmode objmode_guifont
	mesbox s, ginfo_winx, ginfo_winy

	stop

%href
objmode
objmode_normal
objmode_usefont
objmode_usecolor


%index
objmode_usefont
font���߂őI������Ă���t�H���g��ݒ�

%inst
objmode���߂̑�1�����Ɏw�肷�邱�ƂŁA�I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g��font���߂őI������Ă���t�H���g�ɐݒ肷�邱�Ƃ��ł��܂��B

%sample
	s = "�I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g�̃T���v��"

// �I�u�W�F�N�g���䖽�߂Ŏg�p�����t�H���g��font���߂őI������Ă���t�H���g�ɐݒ�
	objmode objmode_usefont

	font msmincho, 24
	mesbox s, ginfo_winx, ginfo_winy / 2

	font msgothic, 18, font_italic
	mesbox s, ginfo_winx, ginfo_winy / 2

	stop

%href
objmode
objmode_normal
objmode_guifont
objmode_usecolor


%index
objmode_usecolor
objcolor���߂őI������Ă���F��ݒ�

%inst
objmode���߂̑�1�����Ɏw�肷�邱�ƂŁA�I�u�W�F�N�g���䖽�߂Ŏg�p�����F��color���߁Aobjcolor���߂Ŏw�肳��Ă���F�ɐݒ肷�邱�Ƃ��ł��܂��B

%href
objmode
objmode_normal
objmode_guifont
objmode_usefont



%index
msgothic
MS�S�V�b�N�t�H���g

%group
�V�X�e���ϐ�

%inst
MS�S�V�b�N�������t�H���g�������L�[���[�h�ł��B
font���߂Ŏw�肷��t�H���g���Ƃ��Ďg�p���邱�Ƃ��ł��܂��B

%href
msmincho

;---------------------------------------------------------------------
%index
msmincho
MS�����t�H���g

%group
�V�X�e���ϐ�

%inst
MS�����������t�H���g�������L�[���[�h�ł��B
font���߂Ŏw�肷��t�H���g���Ƃ��Ďg�p���邱�Ƃ��ł��܂��B

%href
msgothic

;---------------------------------------------------------------------
%index
and
�_����(���Z�q)

%group
�W����`�}�N��

%inst
�_���ς��������Z�q�u&�v�Ɠ��l�Ɏg�p���邱�Ƃ��ł���}�N���ł��B

%href
or
xor
not

;---------------------------------------------------------------------
%index
or
�_���a(���Z�q)

%group
�W����`�}�N��

%inst
�_���a���������Z�q�u|�v�Ɠ��l�Ɏg�p���邱�Ƃ��ł���}�N���ł��B

%href
and
xor
not

;---------------------------------------------------------------------
%index
xor
�r���I�_���a(���Z�q)

%group
�W����`�}�N��

%inst
�r���I�_���a���������Z�q�u^�v�Ɠ��l�Ɏg�p���邱�Ƃ��ł���}�N���ł��B

%href
and
or
not

;---------------------------------------------------------------------
%index
not
�ے�(���Z�q)

%group
�W����`�}�N��

%inst
�ے���������Z�q�u!�v�Ɠ��l�Ɏg�p���邱�Ƃ��ł���}�N���ł��B

%href
and
or
xor

;---------------------------------------------------------------------
%index
M_PI
�~����

%inst
�~������\���萔�ł��B3.14159265358979323846����`����Ă��܂��B

%group
���w�萔

%href
rad2deg
deg2rad


;---------------------------------------------------------------------
%index
rad2deg
���W�A����x�ɕϊ�

%prm
(p1)
p1 : �x�ɕϊ�����p�x�i���W�A���j

%inst
�p�x�̒P�ʂ����W�A������x�֕ϊ����܂��B
�ʓx�@�ŕ\���ꂽ�p�x��x���@�ł̊p�x�ɕϊ�����Ƃ������܂��B

%sample
	tmp = M_PI
	mes str(tmp) + "���W�A����" + rad2deg(tmp) + "���ł��B"
	stop

%href
M_PI
deg2rad


;---------------------------------------------------------------------
%index
deg2rad
�x�����W�A���ɕϊ�

%prm
(p1)
p1 : ���W�A���ɕϊ�����p�x�i�x�j

%inst
�p�x�̒P�ʂ�x���烉�W�A���֕ϊ����܂��B
�x���@�ŕ\���ꂽ�p�x���ʓx�@�ł̊p�x�ɕϊ�����Ƃ������܂��B

%sample
	tmp = 90
	mes str(tmp) + "����" + deg2rad(tmp) + "���W�A���ł��B"
	stop

%href
M_PI
rad2deg


