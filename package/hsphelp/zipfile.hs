%type
�g������
%ver
3.6

%dll
ZLibWrap
%url
http://hsp.tv/
%port
Win

%date
2019/07/16
%author
onitama

%url
http://hsp.tv/

%note
zipfile.as���C���N���[�h���邱�ƁB

%type
���[�U�[��`����

%group
�t�@�C�����o�͐��䖽��

%port
Win
Cli

%index
zipcompress
zip�t�@�C���Ɉ��k

%prm
"srcfile","zipfile"
srcfile : ���k�t�@�C�����̎w��(���C���h�J�[�h��)
zipfile : �ۑ����zip�t�@�C����

%inst
�w�肳�ꂽ�t�@�C����zip�`���ň��k���ĕۑ����܂��B
srcfile�ŁA���k�����t�@�C�������w�肵�܂��B���̎w��ɂ́A���C���h�J�[�h���g�p���邱�Ƃ��ł��܂��B
�u*.jpg�v���w�肵���ꍇ�́A�g���q.jpg�������ׂẴt�@�C���A�u*.*�v���w�肵���ꍇ�͂��ׂẴt�@�C�����ΏۂƂȂ�܂��B
�t�H���_���܂܂�Ă���ꍇ�́A�t�H���_�ȉ������ׂĈ��k�ΏۂƂȂ�܂��B
zipfile�ŕۑ����zip�t�@�C�������w�肵�܂��B
���������������ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B�G���[�����������ꍇ�́A0�ȊO���������܂��B

%sample
#include "zipfile.as"
	;	(hsp�C���X�g�[���t�H���_����common�t�H���_�ȉ������k����common.zip�Ƃ��ĕۑ����܂�)
	fname = "common.zip"
	s1=dir_exe+"\\common\\*.*"
	ZipCompress s1, fname
	if stat : dialog "zip���k�Ɏ��s���܂���"

	mes "���k���p�X:"+s1
	mes fname+"��ۑ����܂����B"
	stop


%index
zipextract
zip�t�@�C������

%prm
"zipfile","path"
zipfile  : �𓀂���zip�t�@�C����
path("") : �𓀐�̃t�H���_�p�X(""�̏ꍇ�̓J�����g)

%inst
�w�肳�ꂽzip�`���̃t�@�C�����𓀂��܂��B���k�t�@�C���Ɋ܂܂�Ă���t�@�C�����ׂĂ��𓀑ΏۂƂȂ�܂��B
zipfile�ŁA���k���ꂽzip�t�@�C�������w�肵�܂��B
path�ɁA�𓀐�̃p�X���w�肵�܂��B�u""�v���w�肳�ꂽ�ꍇ�́A�J�����g�t�H���_���ΏۂƂȂ�܂��B
�p�X���[�h�t����zip�t�@�C���̓T�|�[�g����Ă��܂���B
���������������ꍇ�́A�V�X�e���ϐ�stat��0���������܂��B�G���[�����������ꍇ�́A0�ȊO���������܂��B

%sample
#include "zipfile.as"
	;	onibtn.zip���𓀂��܂�(onibtn.gif�����o����܂�)
	fname = "onibtn.zip"
	s1 = dir_cur
	mes "�𓀌��t�@�C��:"+fname
	mes "�𓀐�t�H���_:"+s1
	;
	ZipExtract fname, s1
	if stat : dialog "zip�𓀂Ɏ��s���܂���"
	mes "�𓀂��܂����B"
	stop


