%dll
form_decode

%ver
3.3

%date
2009/08/01

%author
onitama

%url
http://hsp.tv/

%note
form_decode.as���C���N���[�h���邱�ƁB

%type
���[�U�[��`����

%group
�����񑀍얽��

%port
Win
Cli
Let
%index
form_decode
�e�L�X�g���f�R�[�h

%prm
p1, p2, p3
p1=�ϐ� : �ϊ����ʂ��i�[���镶����^�ϐ�
p2=�ϐ� : �ϊ����镶�����������������^�ϐ�
p3=0�`(0) : �ϊ��X�C�b�`(0)

%inst
���M�p�ɃG���R�[�h���ꂽ�e�L�X�g�����̓��{��Ƀf�R�[�h���܂��B

p3��1�ɂ����'&'�����s�ɕϊ����A2�ɂ����'+'���󔒂ɕϊ����܂��B
3�ɂ���Ɨ����ϊ����܂��B

�����R�[�h�̕ϊ��͍s���܂���̂ŁA�����R�[�h�ϊ����K�v�ȏꍇ�̓f�R�[�h��ɍs���K�v������܂��B

%sample
#include "form_decode.as"
#include "encode.as"
	// �E�B�L�y�f�B�A�́u�E�B�L�y�f�B�A�v�Ɋւ���y�[�W��URL
	before = "http://ja.wikipedia.org/wiki/%E3%82%A6%E3%82%A3%E3%82%AD%E3%83%9A%E3%83%87%E3%82%A3%E3%82%A2"

	// �f�R�[�h�̎��s
	result = ""
	form_decode result, before

	// ���ʂ̕\���iUTF-8���V�t�gJIS�֕ϊ��j
	mes utf8n2sjis(result)
	stop
