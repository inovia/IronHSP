
;
;	qvb module for OBAQ
;

#module
#deffunc qvbload var _p1, str _p2

	;	qvbload����
	;	qvbload �ϐ�, "�t�@�C����"
	;	�w�肳�ꂽ�t�@�C����(qvb�t�@�C��)�̃��f���f�[�^��ϐ��ɓǂݍ��݂܂��B
	;	�ǂݍ��񂾃f�[�^�́A���̂܂�qaddmodel���߂Ŏw�肷�邱�Ƃ��ł��܂��B
	;	(�f�[�^�͐����`���̂��ߕ\���X�P�[���������߂ɐݒ肵�Ă�������)
	;	qvb�t�@�C���́A�ʓr�c�[��(obaqme.hsp)�ō쐬���Ă��������B
	;
	exist _p2
	if strsize<=0 : dialog "No file ["+_p2+"]" : return
	qvxmax=strsize/4
	dim _p1,qvxmax
	bload _p2,_p1
	return

#global

