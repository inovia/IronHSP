
	;	module for AHT
	;
#include "mod_fontdlg.as"

#module ahtmod
#define APPNAME "Peas ver1.1"
#include "hspcmp.as"

#enum AHTTYPE_EDIT_INT = 0	// ���͘g(����=int,sub=�ŏ�,sub2=�ő�)
#enum AHTTYPE_EDIT_DOUBLE	// ���͘g(����=double,sub=�ŏ�,sub2=�ő�)
#enum AHTTYPE_EDIT_STRING	// ���͘g(����=str,sub=������,sub2=option)
#enum AHTTYPE_CBOX_STRING	// �R���{�{�b�N�X(����=str,sub=�I����,sub2=�I�����e�L�X�g)
#enum AHTTYPE_CHKB_INT		// �`�F�b�N�{�b�N�X(0or1�Asub=�e�L�X�g)
#enum AHTTYPE_COLS_INT		// �F�I��(����=int)
#enum AHTTYPE_FONT_STRING	// �t�H���g�I��(����=str)
#enum AHTTYPE_FILE_STRING	// �t�@�C���I��(sub=�g���q,sub2=�I��)
#enum AHTTYPE_EXTF_STRING	// �O���c�[���N��(sub=�g���q,sub2=�c�[����)
#enum AHTTYPE_PARTS_INT,	// �p�[�cID(sub=�N���X��,sub2=�Q�Ɩ�)
#enum AHTTYPE_PARTS_PROP_STRING,// �p�[�cID�̃v���p�e�B(sub=�v���p�e�B��)
#enum AHTTYPE_PARTS_OPT_STRING,	// �p�[�cID�̃I�v�V����(sub=�I�v�V������)
#enum AHTTYPE_MAX

#uselib "user32.dll"
#func EnableWindow "EnableWindow" int,int

;-------------------------------------------------------------------------

#deffunc tminit
	;	AHT�V�X�e��������
	;
	sdim class, 128
	sdim author, 64
	sdim ver, 64
	sdim fname, 260
	sdim icon, 64
	sdim mflag, 64
	sdim glid, 64
	sdim exp, 1024
	sdim helpkw, 256

	dim maxis, 8
	dim maxis2, 8

	aht_ini "test"

	return


#deffunc tmload var _p1, str _p2, str _p3, int _p4

	;	���f���ǂݍ���
	;	tmload �ϐ�, "�t�@�C����","�p�X��",���f��ID
	;	(���f��ID���}�C�i�X�̏ꍇ�͎����I��ID���蓖��)
	;	(�ϐ��Ɋ��蓖�Ă�ꂽID����������)
	;
	_p1 = -1
	aht_source m, _p2,_p3,_p4
	tmload_res=stat

	;mes "ModelID="+m

	aht_stdsize size
	sdim stdbuf, size
	aht_stdbuf stdbuf

	if tmload_res != 0 : return

	;mesbox stdbuf,640,200,0
	;aht_getopt class,"class",m,128
	;aht_getopt author,"author",m,64
	;aht_getopt ver,"ver",m,64
	;aht_getopt icon,"icon",m,64
	;aht_getopt fname,"source",m,260
	;aht_getopt exp,"exp",m,1024
	;mes "Class["+class+"] Author["+author+"] Ver["+ver+"] File["+fname+"] Icon["+icon+"]"
	;mes "Exp="+exp

	x=128:y=128
	if clsel>=0 {
		aht_getmodaxis maxis, clsel
		x=maxis(0)+80
		y=maxis(1)
	}
	aht_setmodaxis m, x, y, clpage

	_p1 = m
	clsel = m

	return


#deffunc tmdelete int _p1

	;	���f���폜
	;
	clsel = -1
	aht_delmod _p1
	return


#deffunc tmlink int _p1, int _p2

	;	���f���ڑ�
	;
	aht_linkmod _p1, _p2
	return


#deffunc tmunlink int _p1

	;	���f���ؒf
	;
	aht_unlinkmod _p1
	return


#deffunc tmprops int _p1

	;
	;	�v���p�e�B�ҏW�I�u�W�F�N�g�쐬
	;
	aht_getpropcnt pmax, _p1
	aht_getpropcnt plmax, _p1,1
	;
	sdim p_name, 512
	sdim p_help, 512
	sdim p_def2, 4096
	sdim p_def3, 4096
	sdim p_def, 1024, pmax
	dim p_defi, pmax
	ddim p_defd, pmax
	dim p_xx, pmax
	dim p_yy, pmax
	dim p_obj, pmax
	;
	sdim deftmp, 1024
	;
	pscr=1
	mymodel = _p1
	ox=160:oy=22:py=oy+4
	sx=320:sy=plmax*py+48+24
	screen pscr,sx,sy,8,ginfo_wx2,ginfo_wy1
	aht_getopt fname,"name",_p1,256
	title "�v���p�e�B - "+getpath(fname,9)
	syscolor 15:boxf
	sysfont 17:color 0,0,0
	x=4:y=4

	aht_propupdate mymodel	; ���I�v���p�e�B�̍X�V
	repeat pmax
		curprop=cnt
		aht_getproptype p_type, cnt, _p1
		aht_getpropmode p_mode, cnt, _p1
		aht_getprop p_name, 0, cnt, _p1
		aht_getprop p_help, 1, cnt, _p1
		aht_getprop p_def2, 3, cnt, _p1
		aht_getprop p_def3, 4, cnt, _p1
		aht_getprop p_def(cnt), 2, cnt, _p1
		pos x,y+2:mes p_name
		p_xx(cnt) = x+ginfo_mesx+8
		p_yy(cnt) = y
		p_obj(cnt) = -1
		pos p_xx(cnt),p_yy(cnt)
		on p_type gosub *ptype_0,*ptype_1,*ptype_2,*ptype_3,*ptype_4,*ptype_5,*ptype_6,*ptype_7,*ptype_8,*ptype_9,*ptype_10,*ptype_11
		if p_mode&AHTMODE_READ_ONLY : EnableWindow objinfo_hwnd(p_obj(cnt)),0
		y+=py
	loop
	;
	if pmax>0 : objsel 0
	;
	aht_getopt class,"class",_p1,128
	aht_getopt author,"author",_p1,64
	aht_getopt ver,"ver",_p1,64
	aht_getopt icon,"icon",_p1,64
	aht_getopt mflag,"flag",_p1,64
	aht_getopt glid,"glid",_p1,64
	aht_getopt fname,"source",_p1,260
	aht_getopt exp,"exp",_p1,1024
	aht_getopt helpkw,"helpkw",_p1,256
	;
	y+=24
	pos x,y
	mes "Class:"+class
	mes "Author:"+author+" Ver:"+ver
	mes "Flag:"+mflag+" PartsID:"+_p1+"/"+glid
	pos sx-128,y+14:objsize 120,24
	return

*ptype_0
	;	AHTTYPE_EDIT_INT
	objsize 64,oy
	i=ginfo_cx+72
	p_defi(cnt)=0+p_def(cnt)
	input p_defi(cnt)
	p_obj(cnt) = stat
	goto *afthelp
*ptype_1
	;	AHTTYPE_EDIT_DOUBLE
	objsize 64,oy
	i=ginfo_cx+72
	p_defd(cnt)=0.0+p_def(cnt)
	input p_defd(cnt)
	p_obj(cnt) = stat
	goto *afthelp
*ptype_2
	;	AHTTYPE_EDIT_STRING
	if peek(p_def3,0)='m' {
		mesbox p_def(cnt),310-ginfo_cx,py*4,1
		p_obj(cnt) = stat
		y+=py*3
		goto *afthelp2
	}
	if peek(p_def3,0)='w' {
		objsize 310-ginfo_cx,oy
		input p_def(cnt)
		p_obj(cnt) = stat
		goto *afthelp2
	}
*ptype_2x
	objsize ox,oy
	i=ginfo_cx+ox+8
	input p_def(cnt)
	p_obj(cnt) = stat
	goto *afthelp

*ptype_3
	;	AHTTYPE_CBOX_STRING
	;
	if p_def3="" : p_def3 = p_def2
	i=ginfo_cx+ox+8
	objsize 310-ginfo_cx,oy
	cbindex=0
	notesel p_def2
	repeat notemax
	noteget deftmp,cnt
	if p_def(curprop)=deftmp : cbindex=cnt
	loop
	;
	p_defi(cnt)=cbindex
	combox p_defi(cnt),100,p_def3
	p_obj(cnt) = stat
	goto *afthelp2

*ptype_4
	;	AHTTYPE_CHKB_INT	// �`�F�b�N�{�b�N�X(0or1�Asub=�e�L�X�g)
	;
	i=ginfo_cx+ox+8
	objsize ox,oy
	p_defi(cnt)=0+p_def(cnt)
	chkbox p_def2,p_defi(cnt)
	p_obj(cnt) = stat
	goto *afthelp

*ptype_5
	;	AHTTYPE_COLS_INT	// �F�I��(����=int)
	;
	objsize 64,oy
	i=ginfo_cx+68
	input p_def(cnt)
	p_obj(cnt) = stat
	pos i,y:objsize 36,oy
	button gosub "�I��",*btn_colset
	i+=44
	goto *afthelp

*ptype_6
	;	AHTTYPE_FONT_STRING	// �t�H���g�I��(����=str)
	;
	objsize 270-ginfo_cx,oy
	i=280
	input p_def(cnt)
	p_obj(cnt) = stat
	pos i,y:objsize 36,oy
	button gosub "�I��",*btn_fontset
	goto *afthelp2

*ptype_7
	;	AHTTYPE_FILE_STRING	// �t�@�C���I��(sub=�g���q,sub2=�I��)
	;
	objsize 270-ginfo_cx,oy
	i=280
	input p_def(cnt)
	p_obj(cnt) = stat
	pos i,y:objsize 36,oy
	button gosub "�I��",*btn_fileset
	goto *afthelp2

*ptype_8
	;	AHTTYPE_EXTF_STRING	// �O���c�[���N��(sub=�g���q,sub2=�c�[����)
	;
	objsize 310-ginfo_cx,oy
	input p_def(cnt)
	p_obj(cnt) = stat
	goto *afthelp2

*ptype_9
	;	AHTTYPE_PARTS_INT		// �p�[�cID(sub=�N���X��)
	aht_listparts p_def3, p_def2
	;
	objsize 310-ginfo_cx,oy
	cbindex=0
	i_defid = 0 + p_def(curprop)
	notesel p_def3
	repeat notemax
	noteget deftmp,cnt
	if i_defid = (0+deftmp) : cbindex=cnt
	loop
	;
	p_defi(cnt)=cbindex
	combox p_defi(cnt),100,p_def3
	p_obj(cnt) = stat
	goto *afthelp2

*ptype_10
	;	AHTTYPE_PARTS_PROP_STRING	// �p�[�cID�̃v���p�e�B(sub=�v���p�e�B��)
	goto *ptype_2x

*ptype_11
	;	AHTTYPE_PARTS_OPT_STRING	// �p�[�cID�̃I�v�V����(sub=�I�v�V������)
	goto *ptype_2x


*afthelp
	;	�p�[�c�̉E���Ƀw���v��\��
	pos i,y+2:mes p_help
	return
*afthelp2
	;	�p�[�c�̉��Ƀw���v��\��
	if p_help="" : return
	y+=py
	pos x+48,y+4:mes p_help
	return

*btn_colset
	;	�J���[�I��
	objid = stat-1
	gosub *obj_getid
	if myid<0 : return
	;
	gsel pscr,1
	dialog "",33
	if stat {
		objprm p_obj(myid),"$"+strf("%02x",ginfo_r)+strf("%02x",ginfo_g)+strf("%02x",ginfo_b)
		aht_getprop p_def3, 4, myid, mymodel
		if p_def3="rgb" {
			objprm p_obj(myid+1),ginfo_r
			objprm p_obj(myid+2),ginfo_g
			objprm p_obj(myid+3),ginfo_b
		}
	}
	return

*btn_fontset
	;	�t�H���g�I��
	objid = stat-1
	gosub *obj_getid
	if myid<0 : return
	;
	gsel pscr,1
	dim n,8
	fontdlg n,$100
	if stat {
		gsel 1
		objprm p_obj(myid),refstr
		objprm p_obj(myid+1),n(2)
		objprm p_obj(myid+2),n(1)
	}
	return

*btn_fileset
	;	�t�@�C���I��
	objid = stat-1
	gosub *obj_getid
	if myid<0 : return
	;
	aht_getprop p_def2, 3, myid, mymodel
	aht_getprop p_def3, 4, myid, mymodel
	curbak = getpath(dir_cur,16)+"\\"

	gsel pscr,1
	dialog p_def2,16,p_def3
	if stat {
		gsel 1
		fname=getpath(refstr,32+16)
		objprm p_obj(myid),getpath(refstr,8+16)

		;	�J�����g����̑��΃p�X�ɂȂ邩?
		if strmid(fname,0,strlen(curbak))=curbak {
			fname=strmid(fname,strlen(curbak),255)
		}
		objprm p_obj(myid+1),fname
	}
	chdir curbak
	return

*obj_getid
	;	objectID(objid)����PropertyID�𓾂�
	;
	myid = -1
	repeat pmax
		if p_obj(cnt)=objid : myid=cnt
	loop
	return


#deffunc tmsetprop int _p1
	;
	;	�ҏW�����v���p�e�B��ݒ�
	;
	repeat pmax
		aht_getproptype p_type, cnt, _p1
		if p_type=AHTTYPE_EDIT_INT : gosub *cnvi2s
		if p_type=AHTTYPE_CHKB_INT : gosub *cnvi2s
		if p_type=AHTTYPE_EDIT_DOUBLE : gosub *cnvd2s
		if p_type=AHTTYPE_CBOX_STRING {
			aht_getprop p_def2, 3, cnt, _p1
			gosub *cnv_cb2s
		}
		if p_type=AHTTYPE_PARTS_INT {
			aht_getprop p_def2, 3, cnt, _p1
			aht_listparts p_def3, p_def2
			gosub *cnv_parts2s
		}
		aht_setprop p_def(cnt), cnt, _p1
	loop
	return

*cnvi2s
	;	�p�����[�^�[(int)�𕶎���ɕϊ�
	p_def(cnt)=""+p_defi(cnt)
	return
*cnvd2s
	;	�p�����[�^�[(double)�𕶎���ɕϊ�
	p_def(cnt)=""+p_defd(cnt)
	return
*cnv_cb2s
	;	�p�����[�^�[(int)�𕶎���ɕϊ�
	if p_def2="" : goto *cnvi2s
	notesel p_def2
	noteget p_def(cnt), p_defi(cnt)
	return
*cnv_parts2s
	;	�p�����[�^�[(int)�𕶎���ɕϊ�
	notesel p_def3
	noteget p_def(cnt), p_defi(cnt)
	i_parts = 0+p_def(cnt)
	return


#deffunc tmmake int _p1, int _p2

	;
	;	AHT����\�[�X���o��
	;	tmmake ID, mode
	;	( mode:bit0=normal/bit1=ahtout/bit2=Make buffer out)
	;
	aht_make res, "ahtout", _p1, _p2
	aht_stdsize size
	sdim stdbuf, size
	aht_stdbuf stdbuf
	return res


;-------------------------------------------------------------------------

#deffunc scrinit

	;
	;	�摜�̏�����
	;
	buffer 5
	picload "ahtman_wnd.bmp"
	pssx=640:pssy=384
	osx=64:osy=64
	;
	buffer 3
	picload "ahticon.bmp"
	;
	buffer 4
	picload "ahtman640.bmp"
	;
	msx=800:msy=600
	clx=22:cly=22:clsx=640:clsy=480
	clex=clsx+clx-osx
	cley=clsy+cly-osy-20
	;
	return


#deffunc scrparts_dir int _p1

	;	�p�[�c�t�H���_�ύX
	;
	sdim ahtlist,256
	pfolder="aht\\"
	if _p1>0 {
		notesel ahtdirs
		noteget fname, _p1
		pfolder+=fname+"\\"
	}
	dirlist ahtlist, dir_exe+"\\"+pfolder+"*.aht"
	parts_max = stat
	aht_parts dir_exe+"\\"+pfolder, ahtlist
	parts_page=0
	return


#deffunc scrparts

	;
	;	�p�[�c���
	;
	screen 6,pssx,pssy
	title "Parts list"
	;
	sdim ahtdirs,256
	dirlist ahtdirs, dir_exe+"\\aht\\*.*",5
	ahtdirs="��{�p�[�c\n"+ahtdirs
	scrparts_dir 0
	;
	return


#deffunc scrparts_sel int _p1

	;
	;	�p�[�c����
	;
	clsel_bak = clsel

	notesel ahtlist
	noteget fname, _p1

	tmload m, fname,pfolder,-1
	if tmload_res != 0 {
		dialog stdbuf
		return
	}
	;
	if clsel_bak>=0 {
		aht_linkmod clsel_bak, m
	}
	;
	return


#deffunc dlg_notice str _p1

	;	�ėp�_�C�A���O���o��
	;
	screen 6,320,120,8,ginfo_wx1,ginfo_wy1
	syscolor 15:boxf
	title ""
	sysfont 17:color 0,0,0
	pos 8,12
	mes _p1
	objsize 120,24
	pos 180,60
	return

#deffunc dlg_done

	;	�ėp�_�C�A���O�����
	;
	gsel 6,-1
	gsel 0, 1
	return


#deffunc scrmain

	;
	;	���C�����
	;
	screen 0,msx,msy
	gmode 0,msx,msy
	pos 0,0:gcopy 4,0,0
	mmax = 0
	clbtn = 0
	clsel = -1
	clcmd = 0
	clpage = 0
	clpage_max = 0

	title APPNAME
	sdim stbuf,256
	sdim prjname,256

	pos 18,520
	mesbox stbuf,648,50
	sysfont 17
	objsize 96,22,24
	pos 680,24
	button gosub "�ǂݍ���",*nocmd
	button gosub "�ۑ�",*nocmd
	button gosub "�ʖ��ۑ�",*nocmd
	objsize 96,64
	button gosub "���s",*nocmd

	objsize 96,22,24
	pos 680,216
	button gosub "�ǉ�",*nocmd
	objsize 96,64,66
	button gosub "�ҏW",*nocmd
	objsize 96,22,24
	button gosub "�ڑ�",*nocmd
	button gosub "�ؒf",*nocmd
	button gosub "�폜",*nocmd

	pos 680,400
	input num_page : objid_num_page = stat
	button gosub "�y�[�W",*nocmd
	objsize 48,22,24
	pos 680,448
	button gosub "<-",*nocmd
	pos 680+48,448
	button gosub "->",*nocmd

	pos 680,472
	button gosub "Home",*nocmd
	pos 680+48,472
	button gosub "?",*nocmd

	pselflag = 1

	return

*nocmd
	clcmd = stat
	return


#deffunc objput int _p1, int _p2, int _p3, int _p4

	;
	;	���f���I�u�W�F�N�g�̕\��
	;	objput x,y,icon,selflag
	;	(fname�Ƀt�@�C�����������Ă���)
	;
	pos _p1,_p2:gmode 2,osx,osy
	gcopy 3,_p3*osx,0
	_x=_p1+32-strlen(fname)*3:
	_y=_p2+68
	color 0,0,0
	pos _x+1,_y+1:mes fname
	color 255,255,255
	pos _x,_y:mes fname

	if _p4=0 : return

	;	�I��g
	color 255,0,0
	_x=_p1+64:_y=_p2+64
	line _p1,_p2,_x,_p2
	line _p1,_y,_x,_y
	line _p1,_p2,_p1,_y
	line _x,_p2,_x,_y

	return


#deffunc selinfo int _p1

	;	�p�[�c�I�����ꂽ���̏��\��
	;
	if _p1<0 : return
	;
	aht_getopt class,"class",_p1,128
	aht_getopt fname,"name",_p1,256
	aht_getopt exp,"exp",_p1,1024
	;
	stbuf="[ "+fname+" ] (ID"+_p1+") ["+class+"]\n"+exp
	;
	gsel 0
	objprm 0,stbuf
	return


#deffunc selflag int _p1

	;	�p�[�c�I���̋���/�s����
	;	(1=OK/0=NG)
	pselflag = _p1
	return

#deffunc scr_update

	;
	;	���C����ʍX�V
	;
	gsel 0
	redraw 0
	gmode 0,clsx+64,clsy+64
	pos 0,0:gcopy 4

	;	info
	fname="Page "+clpage+"/"+clpage_max
	x=580:y=cly+8
	color 0,0,0
	pos x+1,y+1:mes fname
	color 255,255,255
	pos x,y:mes fname

	;	initalize
	ptx=mousex:pty=mousey
	clcmd = 0
	cldrag=-1

	;	icon put
	aht_getmodcnt mmax
	sysfont 17
	repeat mmax
		; maxis��Model��񂪑������Ă��܂�
		; (0)=X���W,(1)=Y���W,(2)=ICON,(3)=�y�[�W,(4)=NextID,(5)=PrevID
		aht_getmodaxis maxis, cnt
		if stat : continue		; Model���o�^�̏ꍇ�̓X�L�b�v
		if clpage!=maxis(3) : continue	; �y�[�W���قȂ�ꍇ�̓X�L�b�v
		aht_getopt fname,"name",cnt,260
		x=maxis
		y=maxis(1)
		if (ptx>=x)&(pty>=y) {
			if (ptx<(x+64))&(pty<(y+64)) {
				cldrag=cnt
			}
		}
		objput x,y,maxis(2),cnt=clsel

		if maxis(4)>=0 {
			aht_getmodaxis maxis2, maxis(4)
			color 255,255,255
			line x+64,y+28,maxis2+4,maxis2(1)+28
		}
	loop

	redraw 1

	stick key,$3ff
	on clbtn gosub *cl_0,*cl_1

	return

*cl_0
	if (key&$100)=0 : return
	if cldrag<0 : return
	if pselflag = 0 : return
	if clsel!=cldrag : selinfo cldrag
	clbtn=1:clsel=cldrag
	aht_getmodaxis maxis, clsel
	clbtnx=ptx-maxis:clbtny=pty-maxis(1)
	return
*cl_1
	if (key&$100)=0 : clbtn=0 : return

	x=limit(ptx-clbtnx,clx,clex)
	y=limit(pty-clbtny,cly,cley)
	aht_setmodaxis clsel,x,y,clpage

	return
*cl_2
	return



#deffunc scrp_update

	;
	;	�p�[�c��ʍX�V
	;
	gsel 6
	redraw 0
	gmode 0,pssx,pssy
	pos 0,0:gcopy 5,0,0
	sysfont 17
	notesel ahtlist
	ptx=mousex:pty=mousey
	cldrag=-1
	i=parts_page
	repeat 20
		if i>=parts_max : break
		x=(cnt\5)*80+40
		y=(cnt/5)*80+32
		if (ptx>=x)&(pty>=y) {
			if (ptx<(x+64))&(pty<(y+64)) {
				cldrag=i
			}
		}
		aht_getparts i, icon,fname,clsname
		objput x,y,icon,cldrag=i
		i++
	loop

	redraw 1

	return


#deffunc chg_page int _p1

	;	�y�[�W�ύX
	;	(_p1=�y�[�W���Βl/0�̏ꍇ�͓��͒l)
	;
	if _p1=0 {
		clpage = num_page
		if clpage>clpage_max : clpage_max = clpage
	} else {
		clpage+=_p1
	}
	if clpage<0 : clpage=0
	if clpage>clpage_max : clpage=clpage_max
	aht_setpage clpage, clpage_max
	clsel = -1				; �I��������
	objprm objid_num_page, clpage
	return


#deffunc edit_src int _p1

	;
	;	�\�[�X�ҏW
	;
	;
	aht_getopt fname,"source",_p1,260
	exec "hsed3f aht\\"+fname
	return

#deffunc screxec int _p1

	;
	;	AHT���s
	;
	;
	if prjname = "" : dialog "�v���W�F�N�g���ۑ�����Ă��܂���B",1 : return
	;
	ahtbase=getpath(prjname,1)+".hsp"
	;
	aht_makeinit
	;
	aht_findstart
	makeerr=0
	repeat
		aht_findparts findid
		findres = stat
		if findid<0 : break

		aht_getmodaxis maxis, findid
		if stat : continue		; Model���o�^�̏ꍇ�̓X�L�b�v

		aht_propupdate findid		; ���I�v���p�e�B�̍X�V

		aht_getopt fname,"name",findid,255
		aht_makeput ";-------main:"+fname+"(ID"+cnt+")",0
		aht_makeput ";-------init:"+fname+"(ID"+cnt+")",1

		tmmake findid, 4
		if stat : makeerr=findid : break

		if maxis(4)<0 {			; �����N�̏I�[��?
			if findres & 1 {
				aht_makeput "return",0
			} else {
				aht_makeput "stop",0
			}
		}

	loop
	aht_findend i
	if i : return				; �G���[�����������ꍇ
	;
	aht_makeput ";-------entry point",1
	aht_makeput "goto _ahtstart",1
	;
	aht_makeend ahtbase
	;
	gsel 0
	objprm 0,stdbuf
	if makeerr {
		dialog "AHT�t�@�C���̕ϊ����ɃG���[���������܂����B(ID"+makeerr+")"
		return
	}
	;
#ifdef EXEC_DEBUG
	exec "notepad "+ahtbase
	return
#endif
	;
	;	HSP3�\�[�X�X�N���v�g���R���p�C�����Ď��s����
	;	(�X�N���v�g�G�f�B�^�̃R���p�C��+���s�Ɠ���������s�Ȃ��܂�)
	;
	sdim rtname,256
	objname="obj"			; �I�u�W�F�N�g�t�@�C����
	;
	hsc_ini ahtbase
	hsc_clrmes
	hsc_objname objname
	hsc_comp 0
	res=stat

	hsc3_messize size
	sdim stdbuf, size
	hsc_getmes stdbuf

	if res!=0 {
		dialog "���s���ɃG���[���������܂����B\n"+stdbuf
		return
	}
	hsc3_getruntime rtname, objname
	if rtname="" : rtname="hsp3.exe"
	debug_mode=0			; �f�o�b�O�E�B���h�E�\���t���O
	;
	cmdexe = dir_exe+"\\"+rtname+" \""+dir_cur+"\\"+objname+"\""
	hsc3_run cmdexe, debug_mode
	;
	return


#deffunc prjload str _fname

	;
	;	�v���W�F�N�g�����[�h
	;	(_fname��""�̎��̓_�C�A���O���o��)
	;
	sdim mdlname,256
	sdim mdlpath,256

	if _fname="" {
		dialog "peas",16,"PeaS�v���W�F�N�g�t�@�C��"
		if stat=0 : return 1
		fname = getpath(refstr,32+16)
		prjname = getpath(refstr,8+16)
	} else {
		fname = getpath(_fname,32+16)
		prjname = getpath(_fname,8+16)
	}
	chdir fname
	aht_prjload prjname
	if stat : prjname="" : dialog "�v���W�F�N�g���[�h���ɃG���[���������܂����B" : return -1
	gsel 0
	title prjname + " - " + APPNAME
	aht_getprjmax res		; �p�[�c���̎擾
	;dialog "PARTS="+res
	repeat res
		aht_getprjsrc mdlname,mdlpath,mdlid,cnt	; �p�[�c���A�p�X���AID�̎擾
		;dialog "LOAD PARTS="+mdlname+"/"+mdlpath+"/"+mdlid
		tmload i, mdlname,mdlpath,mdlid	; �p�[�c�ǂݍ���
		if i<0 : dialog "�ǂݍ��ݒ��ɃG���[���������܂����B["+mdlname+"]" : break
		;dialog "APPLY PARTS="+i
		aht_prjload2 i,cnt	; �p�����[�^�[�̔��f
	loop
	aht_prjloade			; ���Ƃ��܂�
	aht_getpage clpage, clpage_max	; �y�[�W�����擾
	return


#deffunc prjsave int _p1

	;
	;	�v���W�F�N�g���Z�[�u
	;	(mode:0=save/1=save as)
	res = _p1
	if prjname = "" : res=1
	if res {
		dialog "peas",17,"PeaS�v���W�F�N�g�t�@�C��"
		if stat=0 : return 1
		fname = getpath(refstr,32+16)
		prjname = getpath(refstr,8+1+16)+".peas"
		chdir fname
	}
	aht_prjsave prjname
	if stat : prjname="" : return -1
	gsel 0
	title prjname + " - " + APPNAME
	return 0

;-------------------------------------------------------------------------

#global

