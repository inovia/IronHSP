
��HSP��CGI�Ƃ��ē��삳��������\�z����ɂ�

CGI�𓮍삳������s������������K�v������܂��B
HSP�Ɍ��炸CGI�����s����ɂ́AWeb�T�[�o���K�v�ƂȂ�܂��B
�����ł́AWindows��ŃT�[�o�[���N�����Ď��s���s�Ȃ����@�ɂ��Đ������܂��B
CGI�����s������ꍇ�́AHSP�̃\�[�X�X�N���v�g(.hsp)�ł͂Ȃ��A
�I�u�W�F�N�g�t�@�C��(.ax)��ݒu����`�ōs�Ȃ��܂��B

�E�t���[�\�t�g�uAn HTTP Server�v�𗘗p����CGI���s��

�uAn HTTP Server�v�̓����
http://www.vector.co.jp/soft/win95/net/se044252.html

An HTTP Server �̃z�[���t�H���_�����WWW���[�g�́uC:\httpd�v�Ƃ��A
CGI�t�H���_�́uC:\httpd\cgi-bin�v�Ƃ��܂��B

��ʐݒ�ŁA�ucgi�����s����v�����s�Ȃ��A�g���q�̓o�^���s�Ȃ��܂��B
�g���q�́A.ax
���s�v���O�����́AC:\hsp33\hsp3cl.exe
(C:\hsp33��HSP3.3���C���X�g�[������Ă���ꍇ)
(��ʃp�X�ł����s����AEXE�`���̎��s�Ƀ`�F�b�N�����܂�)

CGI�̎��s���@
An HTTP Server ���ғ�������Ԃ�CGI�t�H���_�ucgi-bin�v�ɃI�u�W�F�N�g�t�@�C��(.ax)��u���A
�u���E�U���J���ăA�h���X�o�[��CGI�����N�G�X�g����URL����͂��A[Entet]�L�[�Ŏ��s���܂��B

���N�G�X�gURL�̗�Fhttp://localhost/cgi-bin/hello.exe


�E�uApache httpd�v�𗘗p����CGI���s��

�uApache httpd�v�̓����
http://httpd.apache.org/

�ݒ�t�@�C�� httpd.conf �Ɉȉ���ǉ�

<Directory "C:\www/hspcgi/">
    Options +ExecCGI
    Allow from all
    AddHandler cgi-script .ax
    ScriptInterpreterSource Registry-Strict
</Directory>

�uC:\www�v���h�L�������g���[�g�Ƃ��Đݒ肳��Ă���ꍇ�A
�uC:\www\hspcgi\�v��HSPCGI���s�p�ɐݒ肵�܂��B

���ɁA���W�X�g���G�f�B�^��.ax�̎��s���ݒ肵�܂��B

[HKEY_CLASSES_ROOT]
�ȉ��ɁA�ȉ��̃L�[���쐬���܂��B

	.ax �� shell �� ExecCGI �� command

command�̋K�蕶����(REG_SZ)�ɁA�ȉ���ݒ肵�܂��B

C:\hsp33\hsp3cl.exe %1
(C:\hsp33��HSP3.3���C���X�g�[������Ă���ꍇ)

CGI�̎��s���@
Apache httpd���ғ�������Ԃ�CGI�t�H���_�uhspcgi�v�ɃI�u�W�F�N�g�t�@�C��(.ax)��u���A
�u���E�U���J���ăA�h���X�o�[��CGI�����N�G�X�g����URL����͂��A[Entet]�L�[�Ŏ��s���܂��B

���N�G�X�gURL�̗�Fhttp://localhost/hspcgi/hello.ax

