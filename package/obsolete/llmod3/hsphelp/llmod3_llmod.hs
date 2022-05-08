;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
���[�U�[�g������
%ver
3.3
%note
llmod3.hsp���C���N���[�h����

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www.s-software.net/


%index
getptr
�ϐ��̃|�C���^���擾����
%group
�������Ǘ�����
%prm
v1,v2
v1 : �|�C���^��������ϐ�
v2 : �|�C���^���擾����ϐ�
%inst
�ϐ�v2�̃|�C���^���擾���A�ϐ�v1�ɑ�����܂��B
�擾�����|�C���^��dll�֓n���p�����[�^�ȂǂɎg�p�ł��܂��B





%index
dllproc
�O��dll�̊֐����Ăяo��
%group
�g�����o�͐��䖽��
%prm
"s1",v2,n3,n4
s1 : �֐���
v2 : �֐��ɓn���p�����[�^��������ꂽ�ϐ�
n3 : �֐��ɓn���p�����[�^�̐�
n4 : dll�̃C���X�^���X

%inst
n4�Ɏw�肵��dll����s1�̊֐����g�p���܂��B
�֐��̕Ԃ�l�̓V�X�e���ϐ�stat�ɑ������܂��B
llmod3���ł͎�p��dll�����[�h����Ă��āA����dll���g�p����ꍇ��n4�Ɉȉ��̐��l���g�p�ł��܂��B
^p
DLL��          ���l(define����Ă��閼�O)
kernel32.dll   0 (D_KERNEL)
user32.dll     1 (D_USER)
shell32.dll    2 (D_SHELL)
comctl32.dll   3 (D_COMCTL)
comdlg.dll     4 (D_COMDLG)
gdi32.dll      5 (D_GDI)
^p

%href
ll_libload
ll_libfree
getptr

%sample
	;��1
	ll_libload dll,"user32"		;user32.dll�����[�h
	s="test"
	getptr p,s
	prm=0, p, p, 0
	dllproc "MessageBoxA", prm, 4, dll
	mes dllret
	ll_libfree dll
	end
^
	;��2
	s="test2"
	getptr p, s
	prm=0, p, p, 0
	dllproc "MessageBoxA", prm, 4, D_USER
	mes dllret



%index
_makewnd
WinAPI��CreateWindowA���Ăяo��
%group
OS�V�X�e�����䖽��
%prm
v1, "s2"
v1 : CreateWindow�ɓn���p�����[�^��������ꂽ�ϐ�
s2 : �E�B���h�E�̃N���X��
%inst
v1�ɑ�����ꂽ�p�����[�^���g�p����CreateWindowA���Ăяo���܂��B
v1�ɂ�x���W, y���W, ��, ����, �X�^�C��, �e�E�B���h�E�̃n���h��, dwExStyle�̏��Ƀp�����[�^�������܂��B
s2�͍쐬����E�B���h�E�̃N���X���ł��B
�쐬�����E�B���h�E�̃n���h����v1�ɑ������܂��B
�e�E�B���h�E�̃n���h����0�ɂ����_makewnd���Ă΂ꂽ�Ƃ�����ΏۂɂȂ��Ă���E�B���h�E�̃n���h�����g�p����܂��B
%sample
	prm = csrx, csry, 200, 30, $50000000, 0, $200
	_makewnd prm,"msctls_trackbar32"
	handle_of_track=prm
	stop



%index
_objsel
llmod3�̃��W���[���ō쐬�����I�u�W�F�N�g���A�N�e�B�u�ɂ���
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : �A�N�e�B�u�ɂ���I�u�W�F�N�g��ID
%inst
n1�Ɏw�肵���I�u�W�F�N�g���A�N�e�B�u�ɂ��܂��B
n1��-1�ɂ���ƌ��݃A�N�e�B�u�ɂȂ��Ă���I�u�W�F�N�g��ID��
stat�ɑ�����܂��B



%index
_clrobj
llmod3�̃��W���[���ō쐬�����I�u�W�F�N�g����������
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : ��������I�u�W�F�N�g��ID

%inst
llmod3�̃��W���[���ō쐬����listview,progbox,trackbox,treebox,udbtn�Ȃǂ̃I�u�W�F�N�g���������܂��B
^
��llmod3�ō쐬�����I�u�W�F�N�g��HSP�W�����߂�cls�Ascreen�Ȃǂŏ�������܂���B
�����̖��߂��g�p�����Ƃ���_cls�A_clrobj���g�p���Ă��������B
%href
_cls
listview
progbox
trackbox
treebox
udbtn




%index
_cls
llmod3�̃��W���[���ō쐬�������̂��܂ޑS�ẴI�u�W�F�N�g����������
%group
�I�u�W�F�N�g���䖽��
%prm
n1
n1 : cls�ɓn���p�����[�^

%inst
llmod3�̃��W���[���ō쐬����listview,progbox,trackbox,treebox,udbtn�Ȃǂ̃I�u�W�F�N�g��HSP�W�����߂ō쐬�����I�u�W�F�N�g��S�ď������܂��B
n1��_cls�̓����ŌĂяo����Ă���HSP�W�����߂�cls�ɓn���p�����[�^�Ƃ��Ďg�p����܂��B
^
��llmod3�ō쐬�����I�u�W�F�N�g��HSP�W�����߂�cls�Ascreen�Ȃǂŏ�������܂���B
�����̖��߂��g�p�����Ƃ���_cls�A_clrobj���g�p���Ă��������B
%href
_clrobj
listview
progbox
trackbox
treebox
udbtn




%index
charupper
WinAPI��CharUpperA���g���ϐ����̉p����啶���ɕϊ�����
%group
�����񑀍얽��
%prm
v1
v1 : CharUpper�ɓn��������ϐ�

%inst
�ϐ����̉p����啶���ɕϊ����܂��B



%index
charlower
WinAPI��CharLowerA���g���ϐ����̉p����啶���ɕϊ�����
%group
�����񑀍얽��
%prm
v1
v1 : CharLower�ɓn��������ϐ�

%inst
�ϐ����̉p�����������ɕϊ����܂��B

