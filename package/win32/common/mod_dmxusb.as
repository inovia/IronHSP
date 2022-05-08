////////////////////////////////////////////////////////////////////////////////
//  mod_dmxusb  DMX���䃂�W���[��
//              USB�ڑ����ꂽENTTEC DMX US PRO����DMX�@����R���g���[�����܂�
//              Copyright(C) 2020 onion software/onitama
//              ���̃��W���[���͒N�ł����R�Ɏg�p�E���ρE�Ĕz�z�\�ł�
//

#module
#include "hspext.as"

#deffunc dmxbye onexit

	;	DMX�@��̏I������
	if dmxport=0 : return 1
	comclose
	return 0

#deffunc dmxinit int port, int maxch

	;	DMX�@��̏�����
	;	dmxset port, maxch
	;	(port=COM�|�[�g�ԍ��Amaxch=�ő�ch��)
	dmxport = port

	comopen dmxport,"baud=57600 parity=N data=8 stop=1"
	if stat {
		dmxport=0
		return 1
	}
	;
	dmxch_max = maxch
	if dmxch_max<=0 : dmxch_max = 512
	if dmxch_max>512 : dmxch_max = 512
	dmxch_max++

	val_dmxopen=$7e
	val_dmxclose=$e7
	;
	size_dmxinit1=7
	sdim dmxinit1,size_dmxinit1
	poke dmxinit1,0,val_dmxopen
	poke dmxinit1,1,3
	poke dmxinit1,2,2
	poke dmxinit1,6,val_dmxclose
	;
	size_dmxinit2=7
	sdim dmxinit2,size_dmxinit2
	poke dmxinit2,0,val_dmxopen
	poke dmxinit2,1,10
	poke dmxinit2,2,2
	poke dmxinit2,6,val_dmxclose
	;
	size_dmxsend=dmxch_max+5
	ptr_dmxdata=4
	sdim dmxsend1,size_dmxsend+1
	poke dmxsend1,0,val_dmxopen
	poke dmxsend1,1,6
	poke dmxsend1,2,dmxch_max&255
	poke dmxsend1,3,dmxch_max>>8
	poke dmxsend1,size_dmxsend-1,val_dmxclose
	;
	computb dmxinit1, size_dmxinit1
	computb dmxinit2, size_dmxinit2
	return 0

#deffunc dmxset int ch, int value

	;	DMX�@��̃`�����l���f�[�^��ݒ肷��
	;	dmxset ch(1�`512), value(0�`255)
	if dmxport=0 : return 1
	i=ch
	if i<1 : i=1
	if i>=dmxch_max : i=dmxch_max-1
	a=value
	if a<0 : a=0
	if a>255 : a=255
	poke dmxsend1,ptr_dmxdata+i,a
	return 0

#deffunc dmxsend

	;	DMX�@��Ƀf�[�^�𑗐M����
	if dmxport=0 : return 1
	computb dmxsend1, size_dmxsend
	if stat=0 : return 1
	return 0

#deffunc dmxdimm

	;	DMX�@��̑S�`�����l����0�ɂ���
	if dmxport=0 : return 1
	repeat dmxch_max:poke dmxsend1,ptr_dmxdata+cnt,0:loop
	computb dmxsend1, size_dmxsend
	return 0



#global

