
;	getenv���W���[��
;	getenv���߂��g�p����ɂ͈ȉ��̍s���ŏ��ɓ���Ă�������
;
;	#include "mod_getenv.as"
;
#module
#uselib "Kernel32.dll"
#func GetEnvironmentVariable "GetEnvironmentVariableA" str,var,int

	;	getenv����
	;	getenv �ϐ�, "���ϐ���"
	;
	;	���ϐ��̒l��ϐ��Ɏ擾���܂��B
	;
#deffunc getenv var _p1,str _p2

	GetEnvironmentVariable _p2, _p1,0
	size=stat+1
	memexpand _p1,size ; �o�b�t�@�m��
	_p1=""
	GetEnvironmentVariable _p2,_p1,size
	return
#global


