;--------------------------------------------------
; HSP �w���v �\�[�X�t�@�C�� (hs �`��)
; hs �t�@�C���̏����ɂ��ẮAHS_BIBLE.txt ���Q�Ƃ��Ă��������B

;--------------------------------------------------
; ���� hs �t�@�C���̃f�t�H���g�̃t�B�[���h�l��ݒ�

%dll
; �v���O�C��/���W���[���� ���L��
encode.as

%ver
; �o�[�W���� ���L��

%date
2008/06/05

%author
sharkpp

%url
https://wiki.hsp.moe/Module%EF%BC%8F%E6%96%87%E5%AD%97%E3%82%B3%E3%83%BC%E3%83%89%E5%A4%89%E6%8F%9B%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB.html

%note
encode.as ���C���N���[�h���Ă��������B

%type
���[�U�[�g������

%port
; �Ή��� ���L��
Windows �� HSP

%portinfo
; �ڐA�̃q���g ���L��

%index
sjis2eucjp
SJIS �� EUC-JP �ɕϊ�

%prm
euc_jp, sjis
euc_jp : [�ϐ�] �ϊ����镶����
sjis   : [�ϐ�] �ϊ����ꂽ������

%inst
sjis�Ɏw�肵�������R�[�h Shift_JIS �̕������ EUC-JP �ɕϊ����A���ʂ� euc_jp �ɕԂ��܂��B

%sample
#include "encode.as"
src = "HSP��Windows�̐��E���L����܂��B"
dest = ""

mes src
mes ""

sjis2eucjp dest, src
mes "SJIS -> EUC-JP"
mes dest
mes ""

mes "EUC-JP -> SJIS"
mes eucjp2sjis(dest)


%href
sjis2jis
sjis2utf7n
sjis2utf8n
eucjp2sjis

%group
; �O���[�v ���L��
Shift_JIS ����ϊ�

%index
sjis2jis
SJIS �� JIS �ɕϊ�

%prm
jis, sjis
jis  : [�ϐ�] �ϊ����镶����
sjis : [�ϐ�] �ϊ����ꂽ������

%inst
sjis�Ɏw�肵�������R�[�h Shift_JIS �̕������ JIS �ɕϊ����A���ʂ� jis �ɕԂ��܂��B

%sample
#include "encode.as"
src = "HSP��Windows�̐��E���L����܂��B"
dest = ""

mes src
mes ""

sjis2jis dest, src
mes "SJIS -> JIS"
mes dest
mes ""

mes "JIS -> SJIS"
mes jis2sjis(dest)


%href
sjis2eucjp
sjis2utf7n
sjis2utf8n
jis2sjis

%group
; �O���[�v ���L��
Shift_JIS ����ϊ�
%index
sjis2utf7n
SJIS �� UTF-7 �ɕϊ�

%prm
utf7n, sjis
utf7n : [�ϐ�] �ϊ����镶����
sjis  : [�ϐ�] �ϊ����ꂽ������

%inst
sjis�Ɏw�肵�������R�[�h Shift_JIS �̕������ UTF-7 �ɕϊ����A���ʂ� utf7n �ɕԂ��܂��B

%sample
#include "encode.as"
src = "HSP��Windows�̐��E���L����܂��B"
dest = ""

mes src
mes ""

sjis2utf7n dest, src
mes "SJIS -> UTF-7"
mes dest
mes ""

mes "UTF-7 -> SJIS"
mes utf7n2sjis(dest)


%href
sjis2eucjp
sjis2jis
sjis2utf8n
utf7n2sjis

%group
; �O���[�v ���L��
Shift_JIS ����ϊ�
%index
sjis2utf8n
SJIS �� UTF-8 �ɕϊ�

%prm
utf8n, sjis
utf8n : [�ϐ�] �ϊ����镶����
sjis  : [�ϐ�] �ϊ����ꂽ������

%inst
sjis�Ɏw�肵�������R�[�h Shift_JIS �̕������ UTF-8 �ɕϊ����A���ʂ� utf8n �ɕԂ��܂��B

%sample
#include "encode.as"
src = "HSP��Windows�̐��E���L����܂��B"
dest = ""

mes src
mes ""

sjis2utf8n dest, src
mes "SJIS -> UTF-8"
mes dest
mes ""

mes "UTF-8 -> SJIS"
mes utf8n2sjis(dest)

%href
sjis2eucjp
sjis2jis
sjis2utf7n
utf8n2sjis

%group
; �O���[�v ���L��
Shift_JIS ����ϊ�


%index
eucjp2sjis
EUC-JP �� SJIS �ɕϊ�

%prm
(euc_jp)
euc_jp : [�ϐ�] �ϊ����镶����
val    : [�ϐ�] �ϊ����ꂽ������

%inst
euc_jp �Ɏw�肵�������R�[�h EUC-JP �̕������ Shift_JIS �ɕϊ����Č��ʂ� val �ɕԂ��܂��B

%sample
#include "encode.as"
src = "HSP��Windows�̐��E���L����܂��B"
dest = ""

mes src
mes ""

sjis2eucjp dest, src
mes "SJIS -> EUC-JP"
mes dest
mes ""

mes "EUC-JP -> SJIS"
mes eucjp2sjis(dest)


%href
jis2sjis
utf7n2sjis
utf8n2sjis
sjis2eucjp

%group
; �O���[�v ���L��
Shift_JIS �ɕϊ�

%index
jis2sjis
JIS �� SJIS �ɕϊ�

%prm
(jis)
jis : [�ϐ�] �ϊ����镶����
val : [�ϐ�] �ϊ����ꂽ������

%inst
jis �Ɏw�肵�������R�[�h JIS �̕������ Shift_JIS �ɕϊ����Č��ʂ� val �ɕԂ��܂��B

%sample
#include "encode.as"
src = "HSP��Windows�̐��E���L����܂��B"
dest = ""

mes src
mes ""

sjis2jis dest, src
mes "SJIS -> JIS"
mes dest
mes ""

mes "JIS -> SJIS"
mes jis2sjis(dest)


%href
eucjp2sjis
utf7n2sjis
utf8n2sjis
sjis2jis

%group
; �O���[�v ���L��
Shift_JIS �ɕϊ�

%index
utf7n2sjis
UTF-7 �� SJIS �ɕϊ�

%prm
(utf7n)
utf7n : [�ϐ�] �ϊ����镶����
val   : [�ϐ�] �ϊ����ꂽ������

%inst
utf7n �Ɏw�肵�������R�[�h UTF-7 �̕������ Shift_JIS �ɕϊ����Č��ʂ� val �ɕԂ��܂��B

%sample
#include "encode.as"
src = "HSP��Windows�̐��E���L����܂��B"
dest = ""

mes src
mes ""

sjis2utf7n dest, src
mes "SJIS -> UTF-7"
mes dest
mes ""

mes "UTF-7 -> SJIS"
mes utf7n2sjis(dest)


%href
eucjp2sjis
jis2sjis
utf8n2sjis
sjis2utf7n

%group
; �O���[�v ���L��
Shift_JIS �ɕϊ�

%index
utf8n2sjis
UTF-7 �� SJIS �ɕϊ�

%prm
(utf8n)
utf8n : [�ϐ�] �ϊ����镶����
val   : [�ϐ�] �ϊ����ꂽ������

%inst
utf8n �Ɏw�肵�������R�[�h UTF-8 �̕������ Shift_JIS �ɕϊ����Č��ʂ� val �ɕԂ��܂��B

%sample
#include "encode.as"
src = "HSP��Windows�̐��E���L����܂��B"
dest = ""

mes src
mes ""

mes "UTF-8 -> SJIS"
mes utf8n2sjis(dest)

%href
eucjp2sjis
jis2sjis
utf7n2sjis
sjis2utf8n

%group
; �O���[�v ���L��
Shift_JIS �ɕϊ�

