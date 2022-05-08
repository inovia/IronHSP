#uselib "hidmon.dll"
#func global ArrowBtnWndProc "ArrowBtnWndProc" sptr,sptr,sptr,sptr
#func global UsbExit "UsbExit@0"
#func global UsbInit "UsbInit@4" sptr
#func global UsbPoke "UsbPoke@16" int,int,int,int
#cfunc global UsbPeek "UsbPeek@8" int,int
#cfunc global PortAddress "PortAddress@4" sptr

;*********************************************************************
;   �T�|�[�g���Ă���HIDMON�֐��͈ȉ���5�ł��B
;*********************************************************************
;DLLmon �̃T�|�[�g�֐�:
;	UsbInit "string"	;������.(�߂�l=stat)
;	UsbExit			;�I��.(�߂�l=stat)
;	UsbPoke int adr,int arena,int data,int mask ; ��������
;	�߂�l=UsbPeek( int adr,int arena )	; 1�o�C�g�ǂݏo��
;	�߂�l=PortAddress( "string" )	;ATtiny2313�̃|�[�g���̂��A�h���X�ɕϊ�����.
;
;*********************************************************************

#define	global S_PINB	"pinb"
#define	global S_PORTB	"portb"
#define	global S_PIND	"pind"
#define	global S_PORTD	"portd"
#define	global S_DDRB	"ddrb"
#define	global S_DDRD	"ddrd"

#define global RAM_IO	0
#define global SERIAL "*"

#define global hidpoke(%1,%2,%3=0) usbpoke (%1),RAM_IO,(%2),(%3)
#define global ctype hidpeek(%1) usbpeek((%1),RAM_IO)

#module
#deffunc _hidinit str _p1

	;	hidmon������
	hidflag=0

	UsbInit _p1
	if stat<0 : return -1
	hidflag=1

	portb@=PortAddress(S_PORTB)
	portd@=PortAddress(S_PORTD)
	pinb@=PortAddress(S_PINB)
	pind@=PortAddress(S_PIND)
	ddrb@=PortAddress(S_DDRB)
	ddrd@=PortAddress(S_DDRD)

	usbpoke ddrb@, RAM_IO, 0xff, 0 ; B�|�[�g�S�Ă��o�̓|�[�g�ɂ���

	return 0

#deffunc hidbye onexit

	;	hidmon�I������
	if hidflag {
		;	HIDaspx�̕W�����[�h�ɖ߂�
		usbpoke portd@, RAM_IO, 0x67, 0
		usbpoke ddrd@, RAM_IO, 0x20, 0

		;	hidmon�I��
		UsbExit
		hidflag=0

	}
	return

#global

#define hidinit(%1="*") _hidinit %1

