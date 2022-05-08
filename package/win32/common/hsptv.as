;
; HSPTV define and macros
;
#ifndef __hsptv__
#define __hsptv__
#runtime "hsptv"
#regcmd 18
#cmd hsptv_send $00

#module hsptv
#define global HSPTV_RANK_MAX 30

#deffunc hsptv_up int _p1, str _p2, int _p3

	;	HSPTV�f�[�^���X�V���܂�
	;	hsptv_up score,"comment",option
	;	score,comment���𔽉f�����čŐV�f�[�^���擾���܂��B
	;	(score���}�C�i�X�l�̏ꍇ�͍ŐV�f�[�^�̂ݎ擾���܂�)
	;
	buf=""
	hsptv_send buf,_p1,_p2,_p3
	return

#deffunc hsptv_getrank var _p1, var _p2, var _p3, int _p4

	;	HSPTV�f�[�^���擾���܂�
	;	hsptv_getrank var1,var2,var3,rank
	;	(�ϐ�var1��rank�Ŏw�肵�����ʂ̃X�R�A���������܂�)
	;	(�ϐ�var2��rank�Ŏw�肵�����ʂ̃��[�U�[���������܂�)
	;	(�ϐ�var3��rank�Ŏw�肵�����ʂ̃R�����g���������܂�)
	;	(rank��0��1�ʁA29��30�ʂƂȂ�)
	;	(var1�͐��l�^�Avar2,var3�͕�����^�ƂȂ�܂�)
	;	(�ŐV�f�[�^�̍X�V��hsptv_up�ōs�Ȃ��Ă�������)
	;
	notesel buf
	i=_p4*3
	noteget _p2, i
	_p1=0+_p2
	noteget _p2, i+1
	noteget _p3, i+2
	noteunsel
	return

#global
#endif
