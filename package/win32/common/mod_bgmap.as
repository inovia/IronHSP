
#module "bgmap"

;
;	HSP3Dish�W���X�v���C�g�p�}�b�v�f�[�^�Ǘ����W���[��
;	(mapedit�c�[���ō쐬�����}�b�v�f�[�^��ǂݍ���Ŏg�p�ł��܂�)
;

#deffunc mapinit int _p1, int _p2

	;	�}�b�v������
	;	mapinit vx,vy
	;	(�}�b�v�����������܂�)
	;	vx=�\��X�T�C�Y�Avy=�\��Y�T�C�Y
	;
	cx=64:cy=64	; �p�[�cXY�T�C�Y
	mapsx=32	; �}�b�v�S��X�T�C�Y
	mapsy=32	; �}�b�v�S��Y�T�C�Y
	celname="mapbg.bmp"			; �p�[�c�摜�t�@�C��
	csrc=ginfo_newid			; �p�[�c�̂���E�B���h�EID
	buffer csrc
	mapvx=_p1:mapvy=_p2			; �\��XY�`�b�v��
	vx=mapvx*cx:vy=mapvy*cy			; ��ʓ��̃}�b�v�\���T�C�Y
	return


#deffunc mapload str _p1
	;	�}�b�v�ǂݍ���
	;	(�t�@�C������}�b�v��ǂݍ��݂܂�)
	;	mapload "filename"
	;	(*.map)�̃t�@�C����ǂݍ��݂܂��B
	;	�t�����(*.txt)������ꍇ�́A������ǂݍ��݂܂��B
	;
	fn=_p1
	minf=getpath(fn,1)+".txt"
	exist minf
	if strsize>0 : gosub *load_minf
	dim map,mapsx,mapsy
	mapx=0:mapy=0				; �}�b�v�\���ʒu
	bload fn,map
	return


*load_minf
	;	�t�����t�@�C��(txt)�����[�h
	;
	notesel buf
	noteload minf
	i=0
	noteget s1,i:i++
	if s1!="$mapedit data" : dialog "�t����񂪖����ł�" : return

	repeat
		if i>=notemax : break
		noteget s1,i:i++
		noteget s2,i
		if s1="%mapsx" : mapsx = 0+s2 : i++
		if s1="%mapsy" : mapsy = 0+s2 : i++
		if s1="%celname" : celname = s2 : i++
		if s1="%cx" : cx = 0+s2 : i++
		if s1="%cy" : cy = 0+s2 : i++
	loop
	return


#deffunc mapsave str _p1
	;	�}�b�v�ۑ�
	;	(�t�@�C���Ƀ}�b�v��ۑ����܂�)
	;	mapsave "filename"
	;	(*.map)�̃t�@�C����ۑ����܂��B
	;	�t�����(*.txt)�������ɕۑ����܂��B
	;
	fn=_p1
	bsave fn,map
	minf=getpath(fn,1)+".txt"
	;	�t�����t�@�C��(txt)��ۑ�
	buf="$mapedit data\n"
	buf+="%mapsx\n"+mapsx+"\n"
	buf+="%mapsy\n"+mapsy+"\n"
	buf+="%celname\n"+celname+"\n"
	buf+="%cx\n"+cx+"\n"
	buf+="%cy\n"+cy+"\n"
	notesel buf
	notesave minf
	return


#deffunc mapdraw int _p1, int _p2

	;	�}�b�v�`��
	;	(�}�b�v��`�悵�܂�)
	;	mapdraw x,y
	;	(x,y=�`��J�n�ʒu)
	;
	gmode 0
	xx=_p1:yy=_p2			; �}�b�v��`���n�߂�ʒu
	repeat mapvy
	y=cnt
	pos xx,y*cy+yy
	repeat mapvx
		celput csrc,map(mapx+cnt,mapy+y)
	loop
	loop
	return




#global

