;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.3
%note
llmod3.hsp,winver.hsp���C���N���[�h����

%date
2009/08/01
%author
tom
%dll
llmod3
%url
http://www5b.biglobe.ne.jp/~diamond/hsp/hsp2file.htm


%index
winver
Windows�̃o�[�W�����擾
%group
���̑��̖���
%prm
v1
v1 : �o�[�W�������󂯎�邽�߂̐��l�ϐ�

%inst
�E�B���h�E�Y�̃o�[�W�������擾���܂��B
�ϐ��ɂ͈ȉ��̒l������܂��B
^p
v.0     �v���b�g�t�H�[��
  0     Windows 3.1
  95    Windows 95
  98    Windows 98
  100   Windows Me
  $100  Windows NT 3.5
  $101  Windows NT 4.0
  2000  Windows 2000
  2001  Windows XP
v.1    ���W���[�o�[�W����
v.2    �}�C�i�[�o�[�W����
v.3    �r���h�i���o�[
v.4    ���W���[&�}�C�i�[�o�[�W����(�v���b�g�t�H�[���� Windows 95,98,Me�̎��̂�)
^p
%sample
	winver ver : s = refstr
	if ver<100  : v = ""+ver
	if ver=100  : v = "Me"
	if ver=$100 : v = "NT 3.5"
	if ver=$101 : v = "NT 4.0"
	if ver=2000 : v = "2000"
	if ver=2001 : v = "XP"
	mes "platform = Windows "+v
	mes "���W���[�o�[�W���� = "+ver.1
	mes "�}�C�i�[�o�[�W���� = "+ver.2
	mes "�r���h�i���o�[ = "+ver.3
	if ver<=100 : mes "���W���[&�}�C�i�[�o�[�W����"+ver.4
	mes "szCSDVersion:"+s






%index
verinfo
�o�[�W�������擾
%group
���̑��̖���
%prm
"s1",n2
s1 : �t�@�C����
n2 : �擾����^�C�v

%inst
s1�Ŏw�肵���t�@�C������A�o�[�W���������擾���܂��B
s1�ɂ�dll��exe�Ȃǂ̃o�C�i���t�@�C�����w�肵�܂��B
refstr�Ƀo�[�W������񂪑������܂��B
^
16bit�t�@�C������̓o�[�W�������擾�ł��܂���B
�G���[���N�����ꍇ��stat��1���������܂��B
^
^p
n2�̒l   �擾�������
0        ��Ж�
1        �t�@�C���̐���
2        �t�@�C���o�[�W����
3        �����t�@�C����
4        ���쌠
5        ���Ƃ̃t�@�C����
6        ���i��
7        ���i�o�[�W����
^p

%sample
	#include "llmod3.hsp"
	#include "winver.hsp"
^
	file="user32.dll"   : gosub get_verinfo
	file="comctl32.dll" : gosub get_verinfo
	stop
^
*get_verinfo
	s=windir+"\\system\\"+file
	mes "���t�@�C��"+s+"�̃o�[�W�������"
	repeat 8
		verinfo s,cnt
		mes refstr
	loop
	return


