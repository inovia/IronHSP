
	;
	;	hs�t�@�C�����������߂̃��W���[��
	;	HSP3�p( onion software/onitama 1999-2020 )
	;
	;   *���̃��W���[���͎��R�ɑg�ݍ���Œ����č\���܂���
	;
	;	ihelp_init
	;		�ϐ��̏��������s�Ȃ��܂��B
	;		�X�N���v�g�̍ŏ��Ɂu#include "mod_hs.as"�v������
	;		�K���n�߂�ihelp_init��ʂ�悤�ɂ��Ă��������B
	;
	;	ihelp_find "keyword"
	;		( keyword = �����L�[���[�h )
	;		�w�肳�ꂽ�L�[���[�h���������܂��B
	;		�����ɊY�����鍀�ڐ����V�X�e���ϐ�stat�ɁA
	;		�����ɊY�������L�[���[�h�ꗗ��ih_ansbuf�ɕԂ�܂��B
	;		�����̂��߂ɂ́A�C���f�b�N�X�t�@�C��(hsphelp.idx)��
	;		�J�����g�f�B���N�g���ɂ���K�v������܂��B
	;
	;	ihelp_open n
	;		( n=���No. )
	;		�L�[���[�h�����̒�����An�Ԗ�(0�`)�̍��ڂ��擾���܂��B
	;		�擾�������́Aih_info���n�߂Ƃ���e��ϐ��ɑ������܂��B
	;
	;	ihelp_info
	;		ihelp_open�����ł͎擾����Ȃ��A�g�����𓾂܂��B
	;		���ʂ́Aih_opt�ɑ������܂��B
	;

*ihelp_boot
	;
	;	hs�t�@�C�����C�u����������
	;	(�Q�Ɨp�O���[�o���ϐ�)
	;
	ih_file="hsphelp.idx"			; index�t�@�C��
	;
	sdim ih_ansbuf,$8000			; �������o�b�t�@
	sdim ih_info,$8000				; ���b�Z�[�W�\���o�b�t�@(32K)
	sdim ih_refinf,$4000			; �֘A���ڕ\���o�b�t�@(16K)
	sdim ih_refsel,$4000			; �֘A���ڕ\���o�b�t�@(16K)
	sdim ih_group,256
	sdim ih_ans_key,64
	sdim ih_ans_name,64
	sdim ih_ans_title,256
	sdim ih_ans_dll,64
	sdim ih_prgsmp,$4000			; �T���v�����(16K)
	sdim ih_prminf,$4000			; �p�����[�^���(16K)
	sdim ih_fncprm,$1000			; �p�����[�^���2(4K)
	sdim ih_opt,$4000				; �ڍ׏��\���o�b�t�@(16K)

	ih_htmopt = 0					; html�o�� ON/OFF flag

	sdim cb_group,512

	if sysinfo(3)=1 {
		cb_group={"���ߊT�v
�v���v���Z�b�T����
�������
����������
�v���O�������䖽��
�v���O��������}�N��
��{���o�͐��䖽��
�g�����o�͐��䖽��
�I�u�W�F�N�g���䖽��
��ʐ��䖽��
�g����ʐ��䖽��
�����񑀍얽��
�������Ǘ�����
�}���`���f�B�A���䖽��
�t�@�C�����얽��
�g���t�@�C�����얽��
�ʐM���䖽��
OS�V�X�e�����䖽��
HSP�V�X�e�����䖽��
���̑��̖���
"}
	} else {
		cb_group={"Abstract
Preprocess command
Substitution command
Special assignment command
Program control command
Program control macro
Basic I/O control command
Extended I/O control command
Object control command
Screen control command
Extended screen control command
String manipulation command
Memory management command
Multimedia control command
File operation command
Extended file operation command
Communication control command
OS system control command
HSP system control command
Other commands
"}
}




#module "ihelp"
#deffunc ihelp_init var _p1
	;
	;	hsphelp���C�u����������
	;
	ih_msg="Init HSPhelp.\n"

	idxerror=0				; index�\�z�G���[�t���O

	sdim fl,$4000
	dirlist fl,"*.hs",1
	notesel fl
	flmax=notemax 
	if flmax=0 : goto *failidx

	fname2=ih_file@				; �����o���t�@�C��
	exist fname2
	if strsize>0 : goto *loadidx
*initidx
	ih_msg+="Rebuild index.\n"
	if idxerror>0 : goto *failidx
	gosub *mkidx
	idxerror++
*loadidx
	fname2=ih_file@				; idx�t�@�C����
	exist fname2
	if strsize<1 : goto *failidx
	;
	sdim tmp,$8000				; text�ꎞ�o�b�t�@(32K)
	sdim wrt,strsize+4			; idx�o�b�t�@���m��
	sdim ln,256
	hsfilemax=0
	hsfileok=0
	notesel wrt
	noteload fname2
	repeat notemax
		noteget ln,cnt
		if peek(ln,0)!='@' : break
		i=1
		getstr fname1,ln,i,','
		i+=strsize
		getstr tmp,ln,i,','
		flsize=0+tmp
		exist fname1
		if strsize!=flsize : hsfileok=1
		hsfilemax++
	loop
	if hsfilemax!=flmax : hsfileok=2

	if hsfileok>0 {
		goto *initidx		; .HS�t�@�C�����X�V����Ă���
	}
	maxkw=(notemax-hsfilemax)/2
	ih_msg+="Total "+maxkw+" keywords.\n"
	_p1=ih_msg
	return 0
*failidx
	sdim wrt,64
	ih_msg+="No index file.\n"
	_p1=ih_msg
	return 1

*mkidx
	;	idx�t�@�C���č\�zmain
	;
	ih_msg="idx�t�@�C���̍X�V��...\n"

	fname2=ih_file@				; �����o���t�@�C��
	sdim tidx1,$10000			; idx�ꎞ�o�b�t�@(64K)
	sdim tidx2,$10000			; idx�ꎞ�o�b�t�@(64K)
	sdim hsidx,$10000			; hsidx�ꎞ�o�b�t�@(64K)
	sdim wrt,$18000				; idx�����o���o�b�t�@(96K)

	dim flsize,flmax
	flnum=0

*lp2
	;	"*.hs"�����ׂĉ��
	;
	notesel fl
	noteget fname1,flnum
	gosub *docstart

	flnum++
	if flnum<flmax : goto *lp2

	;	tidx���\�[�g����wrt���쐬
	;
	sdim ln,256
	sortnote tidx1
	;
	notesel tidx1
	i=notemax
	c=0
	wrt=""
	repeat i
	  notesel tidx1
	  noteget ln,cnt
	  c=peek(ln,0)
	  if c=0 : goto *tchkov
	  wrt+=ln+"\n"
	  sortget c,cnt
	  notesel tidx2
	  noteget ln,c
	  wrt+=ln+"\n"
*tchkov
	loop

	;	idx�t�@�C�����Z�[�u
	;
	wrt = hsidx + wrt
	;
	notesel wrt
	notesave fname2
	ih_msg+="["+fname2+"] saved.\n"



*docstart
	;	hs�t�@�C������͂���idx���쐬
	;
	exist fname1
	if strsize<0 : dialog "fatal error" : end
	hsfsize=strsize
	sdim buf,hsfsize+4			; hs�ǂݍ��݃o�b�t�@
	flsize(flnum)=hsfsize
	hsidx+="@"+fname1+","+hsfsize+"\n"

	sdim a,256
	sdim ln,256
	sdim dllname,64

	ih_msg+="file ["+fname1+"] ��ǂݍ��݂܂�.\n"
	bload fname1,buf
	bufmax=strlen(buf)

	i=0:idn=0
	c=0
*doc1
	idn=i					; �sID��ۑ�
	getstr ln,buf,i,0:i+=strsize
	c=peek(ln,0)
	if c!=$25 : goto *doc2			; '%' check
	;
	a=strmid(ln,1,64)
	if a="dll" : goto *doc3			; "%dll" check
	if a!="index" : goto *doc2		; "%index" check
	;
	getstr a,buf,i,0:i+=strsize		; ���̍s���擾
	getstr ln,buf,i,0:i+=strsize		; ���̎��̍s���擾
	if i>=bufmax : goto *doc2		; error check
	;
	tidx1+=a+"\n"
	tidx2+=""+idn+","+fname1+","+dllname+","+hsfsize+"\n"
*doc2
	if i<bufmax : goto *doc1
	return
*doc3
	getstr dllname,buf,i,0:i+=strsize	; ���̍s���擾
	if dllname="none" : dllname=""
	goto *doc2


#deffunc ihelp_open int _p1
*gethelp
	;	hs�t�@�C���ǂݍ���
	;		ihelp_find�̌��ʕϐ������Ƃ�help�f�[�^�擾
	;		ihelp_open n ( n=�T�[�`�e�[�u��index )
	;
	lnidx=ansln._p1
	gosub *getidx
	;
	ih_ans_key@ = ans_key
	ih_ans_name@ = ans_name
	ih_ans_title@ = ans_title
	ih_ans_dll@ = ans_dll
	;
	exist ans_name
	if strsize<0 : dialog "No file ["+ans_name+"]." : lnidx=-1 : return

	;	Help��note���ڂ��擾
	;
	ih_opt@=""
	sdim ln,256
	sdim buf,$8000				; hs�ǂݍ��݃o�b�t�@
	notesel buf
	noteload ans_name			; �擪���烍�[�h
	bufmax=strlen(buf)
	i=0:c=0
*getnopt
	if i>bufmax : goto *gnlp1
	getstr ln,buf,i,0:i+=strsize
	if ln="%note" : goto *gnlp0
	if ln="%index" : goto *gnlp1
	goto *getnopt
*gnlp0
	if i>bufmax : goto *gnlp1
	getstr ln,buf,i,0:i+=strsize
	c=peek(ln,0):if c='%' : goto *gnlp1
	ih_opt@+=ln
	goto *gnlp0
*gnlp1
	;	Help�{�����擾
	;
	sdim buf,$8000				; hs�ǂݍ��݃o�b�t�@
	bload ans_name,buf,$8000,lnidx		; �w��I�t�Z�b�g���烍�[�h
	notesel buf
	bufmax=notemax
	;
	sdim ln,256
	sdim cate,256
	sdim tmp,$8000				; text�ꎞ�o�b�t�@(32K)
	sdim refsel,$4000			; ���t�@�����X���2(16K)
	;
	noteget tmp,0
	if tmp!="%index" : lnidx=-1 : return 1
	noteget ans_title,2
	ih_ans_title@ = ans_title
	;
	c=0
	a=""
	ih_info@=""
	ih_group@=""
	ih_refinf@=""
	ih_prgsmp@=""
	ih_prminf@=""
	ih_fncprm@=""
	i=1
	tagmode=0

	;	hs�t�@�C��������擾
	;
*ghlp0
	tmp=""
*ghlp1
	noteget ln,i
*ghlp1x
	c=peek(ln,0)
	if c=0 : goto *ghlp2		; NULL check
	if c=';' : goto *ghlp2		; ';' comment check
	if c=$25 : goto *ghlp3		; '%' tag check
	if c=$5e : goto *ghlp4		; '^' html tag check
	;
	if tagmode : tmp+="    "
	tmp+=ln+"\n"
*ghlp2
	i++
	if i<bufmax : goto *ghlp1
	;
	if tmp="" : goto *helpov
	goto *ghlp3

*ghlp4
	;	html����tag
	;
	c=peek(ln,1)
	if c='p' : goto *ghlp6
	if c='P' : goto *ghlp6
	ln=strmid(ln,1,256)
*ghlp5
	if ih_htmopt@ : tmp+="<BR><BR>"
	tmp+="\n"
	goto *ghlp2
*ghlp6
	tagmode=tagmode^1
	if ih_htmopt@=0 : goto *ghlp5
	;
	if tagmode : tmp+="<UL><PRE>\n" : goto *ghlp2
	tmp+="</UL></PRE>\n"
	goto *ghlp2

*ghlp3
	;	�J�e�S���[����
	;
	if cate="prm" : ih_prminf@=tmp
	if cate="inst" : ih_info@=tmp
	if cate="href" : gosub *getref
	if cate="group" : ih_group@=tmp
	if cate="sample" : ih_prgsmp@=tmp
	if cate="index" : goto *helpov
	;
	tagmode=0
	cate=strmid(ln,1,64)
	i++
	if i<bufmax : goto *ghlp0
	;
*helpov
	fncprm=""
	getstr ih_fncprm@,ih_prminf@,0,0		; �֐��p�����[�^���擾	
	ih_prminf@=strmid(ih_prminf@,strsize,4096)	; �c����p�����[�^�����Ƃ���
	;
	notesel refsel : i=notemax
	ih_refsel@="Related "+i+" keys.\n"
	ih_refsel@+=refsel
	;
	return 0


*getref
	;	���t�@�����X�����擾
	;		tmp -> refinf & refsel
	;
	sdim rs,128
	sdim rs2,128
	ridx=0:ridx2=0:rchr=0
	ih_refinf@=""
	refsel=""
*gref1
	getstr rs,tmp,ridx,0
	ridx+=strsize
	if strsize=0 : return
	;
	rchr=peek(rs,0)
	if rchr!=$22 : goto *gref3
	;
	ridx2=instr(rs,1,"\"")
	if ridx2<1 : goto *gref1
	poke rs,ridx2+1,0
	rs2=peek(rs,1)
	refsel+=rs2+"\n"
	rs2=peek(rs,ridx2+2)
	ih_refinf@+=rs2+"\n"
	goto *gref1
*gref3
	ih_refinf@+=rs+"\n"
	refsel+=rs+"\n"
	goto *gref1

*getidx
	;
	;	idx���e�擾(lnidx=�sindex)
	;		ans_name : hs�t�@�C����
	;		ans_title : ���ڃ^�C�g��
	;
	if lnidx<0 : return
	;
	sdim ln2,256
	sdim ans_key,64
	sdim ans_name,64
	sdim ans_title,256
	sdim ans_dll,64
	;
	i=lnidx
	getstr ans_key,wrt,i			; index���擾
	i+=strsize
	getstr ln2,wrt,i			; index�̎��s���擾
	;
	i=0
	getstr a,ln2,i,','			; offset���擾
	i+=strsize:lnidx=0+a
	getstr ans_name,ln2,i,','		; ans_name���擾
	i+=strsize
	getstr ans_dll,ln2,i,','		; ans_dll���擾
	i+=strsize
	getstr ans_title,ln2,i			; ans_title���擾
	;
	return




#deffunc ihelp_info
*getprop
	;	hs�t�@�C���ǂݍ���
	;		lnidx�܂ł̏ڍ׃f�[�^�擾
	;
	ih_opt=""
	exist ans_name
	if strsize<0 : dialog "No file ["+ans_name+"]." : return
	;
	sdim buf,strsize+4			; hs�ǂݍ��݃o�b�t�@
	sdim a,256
	sdim ln,256
	sdim iopt,256,6				; �ڍ׃f�[�^�i�[�o�b�t�@

	;	 �ڍ׏��table
	;
	;
	bload ans_name,buf
	bufmax=strlen(buf)
	if lnidx>bufmax : return

	i=0
*prlp1
	if i>=lnidx : goto *prfin		; �I���`�F�b�N
	;
	getstr ln,buf,i,0:i+=strsize
	c=peek(ln,0)
	if c!=$25 : goto *prlp1			; '%' check
	;
	j=-1
	a=strmid(ln,1,64)
	if a="type"   : j=0
	if a="ver"    : j=1
	if a="date"   : j=2
	if a="author" : j=3
	if a="note"   : j=4
	if a="url"    : j=5
	;
	if j<0 : goto *prlp1
	;
	getstr ln,buf,i,0:i+=strsize
	iopt.j=ln
	goto *prlp1

*prfin
	ih_opt@="[Type] "+iopt.0+"\n[Group]"+ih_group@+"[Version] "+iopt.1+"\n[Date] "+iopt.2+"\n[Author] "+iopt.3+"\n[URL]"+iopt.5+"\n[misc]\n"+iopt.4
	return



#deffunc ihelp_find str _p1
*chkidx
	;	idx�T�[�`(in:�����L�[������)
	;		 (stat��lnnum���Ԃ�)
	;		lnnum   : match�� ( 0 = not found )
	;		ansln.x : lnidx�l
	;		ansbuf  : ����index (note�`��)
	;
	mref _stat,64
	a=_p1					; �ϐ�a = �p�����[�^1
	;
	dim ansln,$1000				; �T�[�`����line�o�b�t�@(4096)
	sdim ansbuf,$8000			; �T�[�`���ʃo�b�t�@
	;
	sdim ln,256
	sdim ln2,256
	i=0:c=0
	lnnum=0
	c=strlen(a)
*idsrc
	getstr ln,wrt,i				; lnidx���擾
	if strsize=0 : goto *chkfin
	if peek(ln,0)='@' {			; file���s
		i+=strsize
		goto *idsrc
	}
	ln2=ln
	poke ln2,c,0				; ln2��a�Ɠ��������ɍ��킹��

	if ln2=a : ansln.lnnum=i : ansbuf+=ln+"\n" : lnnum+

	i+=strsize
	getstr ln,wrt,i:i+=strsize		; 1�s��ǂݔ�΂�

	goto *idsrc

*chkfin
	_stat = lnnum
	ih_ansbuf@ = ansbuf
	return



#global

