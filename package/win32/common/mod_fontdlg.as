#module
	#uselib "gdi32.dll"
	#func  GetObject "GetObjectA" int,int,var

	#uselib "COMDLG32.DLL"
	#func  ChooseFont "ChooseFontA" var

	; �E����  Value   (array)      : ���l�^�z��ϐ�
	;         nOption (int) ($100) : 0�`(0) �I�v�V�����l

	#deffunc fontdlg array prm1,int prm2
	mref bmscr,67
	mref ref,65
	nOption = prm2 : if nOption<=0 : nOption=0

	dim lpObject,64   ;LOGFONT�\����
	dim chf,15        ;CHOOSEFONT�\����
	dim retval,8      ;�擾�l�ޔ�p

	GetObject bmscr(38),60,lpObject

	;CHOOSEFONT�\����
	chf(0)  = 60
	chf(1)  = hwnd
	chf(3)  = varptr(lpObject)
	chf(5)  = $41|nOption
	chf(6)  = bmscr(40)
	chf(12) = $2000

	ChooseFont chf
	ret=stat
	if ret!0 {
		repeat 32
			prm=peek(lpObject,28+cnt)
			poke ref,cnt,prm
			if prm=0 : break
		loop
		retval(0) = -1*lpObject(0)
		if lpObject(4)>400 : retval(1)=1 : else : retval(1)=0
		if ((lpObject(5))&&($ff))!0 : retval(1)+=2
		retval(2) = chf(4)/10
		retval(3) = peek(chf,24)
		retval(4) = peek(chf,25)
		retval(5) = peek(chf,26)
		retval(6) = peek(lpObject,21)
		retval(7) = peek(lpObject,22)
	}
	repeat 8 : prm1(cnt)=retval(cnt) : loop
	;  prm1�̐��l�^�z��ϐ��ɕԂ����l
	;   (0)   : font size (HSP�ŗ��p����_���T�C�Y)
	;   (1)   : font����
	;              -  0 = NORMAL
	;              -  1 = BOLD
	;              -  2 = ITALIC
	;              -  3 = BOLD|ITALIC
	;   (2)   : font size (pt)
	;   (3),(4),(5) : color r,g,b
	;   (6)   : ����
	;   (7)   : �ŏ�����
	dim lpObject,0  : dim chf,0 : dim retval,0
	return ret
#global
