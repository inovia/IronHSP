%ver
3.3

%date
2011/05/10

%author
onitama

%url
http://hsp.tv/

%type
�}�N��

%group
�W����`�}�N��

%port
Win
Cli
Let

%index
_debug
�f�o�b�O���[�h��

%inst
�f�o�b�O���[�h���̂ݒ�`�����}�N���ł��B
#ifdef�A#ifndef���߂ȂǂŔ��ʂ��ĕ��򂳂��邱�Ƃ��\�ł��B

%sample
#ifdef _debug
	mes "�f�o�b�O���[�h�ł��B"
#else
	mes "�f�o�b�O���[�h�ł͂���܂���B"
#endif
	stop
%href
hspstat

%index
__hsp30__
ver3.0�ȍ~�g�p��

%inst
HSP3.0�ȍ~�ŁA�uHSP�g���}�N�����g�p����v�Ƀ`�F�b�N�������Ă��鎞�ɒ�`����܂��B

%sample
#ifdef __hsp30__
	mes {"HSP3.0�ȍ~�ŁA�uHSP�g���}�N�����g�p����v��
	�`�F�b�N�������Ă��܂��B"}
#else
	mes {"HSP3.0���Â����A�uHSP�g���}�N�����g�p����v��
	�`�F�b�N�������Ă��܂���B"}
#endif
	stop

%index
__file__
�g�p���_�ŉ�͂���Ă���t�@�C����

%inst
�g�p���_�ŉ�͂���Ă���t�@�C�����ɒu���������܂��B
�t�@�C�����ۑ�����Ă��Ȃ��ꍇ��"???"�ɒu�������܂��B

%sample
	mes "�g�p���_�ŉ�͂���Ă���t�@�C������" + __file__
	stop

%href
__line__

%index
__line__
�g�p���_�ŉ�͂���Ă���s�ԍ�

%inst
�g�p���_�ŉ�͂���Ă���s�ԍ��ɒu�������܂��B�s�ԍ���1����n�܂鐮���l�ł��B

%sample
	mes "�g�p���_�ŉ�͂���Ă���s�ԍ���" + __line__
	stop

%href
__file__

%index
__date__
�g�p���_�̓��t

%inst
�g�p���_�i�R���p�C���������_�j�̓��t�ɒu�������܂��B���t��YYYY/MM/DD�`���ŕ\����܂��B

�uHSP�g���}�N�����g�p����v�Ƀ`�F�b�N�������Ă��Ȃ��Ǝg�p�ł��܂���B

%sample
	mes "�g�p���_�̓��t��" + __date__
	stop

%href
__time__

%index
__time__
�g�p���_�̎���

%inst
�g�p���_�i�R���p�C���������_�j�̎����ɒu�������܂��B������HH:MM:SS�`���ŕ\����܂��B

�uHSP�g���}�N�����g�p����v�Ƀ`�F�b�N�������Ă��Ȃ��Ǝg�p�ł��܂���B

%sample
	mes "�g�p���_�̎�����" + __time__
	stop

%href
__date__

%index
__hspver__
HSP�o�[�W�����ԍ�

%inst
HSP�̃o�[�W�����ԍ��ɒu�������܂��B���8bit�A����8bit�����ꂼ�ꃁ�W���[�o�[�W�����E�}�C�i�[�o�[�W�����������܂��B 

�uHSP�g���}�N�����g�p����v�Ƀ`�F�b�N�������Ă��Ȃ��Ǝg�p�ł��܂���B

%sample
	mes "HSP�̃o�[�W�����ԍ���" + strf("%4x", __hspver__)
	stop

%href
hspver
