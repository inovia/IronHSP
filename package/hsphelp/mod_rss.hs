%dll
mod_rss

%ver
3.3

%date
2009/08/01

%author
onitama

%url
http://hsp.tv/

%note
mod_rss.as���C���N���[�h���邱�ƁB

%type
���[�U�[��`����

%group
���o�͐��䖽��

%port
Win
Cli
Let
%index
rssload
XML�p�[�T�[(MSXML)���g�p����RSS��ǂݍ���

%prm
p1, p2, "path", p3
p1=�ϐ� : RSS�̓��e�������镶����^�z��ϐ�
p2=�ϐ� : �����N��������镶����^�z��ϐ�
"path" : URL�܂��̓t�@�C���p�X
p3=0�`(5) : �ǂݍ���RSS�t�B�[���h�̐�

%inst
XML�p�[�T�[(MSXML)���g�p����RSS��ǂݍ��݂܂��B

���ʂ�p1�����p2�ɑ������܂��Bp1�����p2�͎����I�ɕ�����^�z��ϐ��Ƃ��ď���������܂��B

p3�ɂ͓ǂݍ���RSS�t�B�[���h�̐����w�肵�܂��Bp3���ȗ������ꍇ��5�ǂݍ��݂܂��B

RSS�̓ǂݍ��݂ɐ�������ƁA�V�X�e���ϐ�stat��0���Ԃ�܂��B
�擾�Ɏ��s�����ꍇ��stat��1���A�w�肵��URL�܂��̓t�@�C���p�X��RSS�̂��̂ł͂Ȃ������ꍇ��stat��2���Ԃ�܂��B

%sample
#include "mod_rss.as"

	// RSS��URL�iHSPWiKi��RSS�j
	url = "http://quasiquote.org/hspwiki/?c=rss"
	// RSS�̃��[�h
	rssload desc, link, url, 6
	if stat == 1 : dialog "�擾�Ɏ��s���܂����B" : end
	if stat == 2 : dialog "RSS�ł͂���܂���B"  : end

	// ���e��\��
	mes "RSS�̓��e��\�����܂��B"
	mes url
	mes "----------------------------------------------------------------"
	foreach desc
		mes ""  +cnt + ":" + desc(cnt)
		mes "    (" + link(cnt) + ")"
	loop

	stop
