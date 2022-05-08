#ifndef __MOD_DIRBOX
#define __MOD_DIRBOX
;
;
;============================================================
; mod_dirbox
;	���X�g�{�b�N�X���g�����t�@�C���I�����s���܂�
;	�u#include "mod_dirbox.as"�v��ǉ����邱�Ƃ�
; 	�ȉ��̖��߂��g�p�ł���悤�ɂȂ�܂�
;	�T���v���usample/new36/dirbox.hsp�v���Q�l�ɂ��Ă�������

;
; dirbox "filter",option,xsize,ysize
; 	"filter" : dirlist���߂̃t�B���^�Ɠ����A�ʏ�́u*.*�v���w��
; 	 option  : dirlist���߂̎擾���[�h�Ɠ����A�ʏ��0���w��
; 	 xsize,ysize : �t�@�C���I���I�u�W�F�N�g��X,Y�T�C�Y
;
;	�J�����g�t�H���_�̃t�@�C���ꗗ��\�����đI���ł���悤�ɂ��܂�
;	�K���A��莞�Ԃ��Ƃ�dirbox_get���Ăяo���đI�����m�F���Ă�������
;	���ʂ́Adirbox_fullname,dirbox_name�Ŏ擾�ł��܂�
;
; dirbox_refresh
; 
; 	�J�����g�t�H���_�̃t�@�C���ꗗ���Ď擾���܂�
; 
;
; dirbox_get var
; 	var : ���ʂ���������ϐ�
; 
; 	dirbox�̑I�𓮍�����s���܂�
;	wait/await���߂��܂ރ��[�v�̒��ŌĂяo���Ă�������
;	var��0��������ꂽ�ꍇ�͒ʏ�̏����A
;	1��������ꂽ�ꍇ�́A�_�u���N���b�N�Ńt�@�C�����I�����ꂽ���Ƃ������܂�
;
; dirbox_fullname var
; 	var : ���ʂ���������ϐ�
; 
; 	�Ō�ɑI�����ꂽ�t�@�C�������t���p�X�Ŏ擾���܂�
;	var�Ŏw�肵���ϐ��ɕ�����Ƃ��ăp�X�̏�񂪓���܂�
;
; dirbox_name var
; 	var : ���ʂ���������ϐ�
; 
; 	dirbox_fullname�Ɠ��l�ł����A�p�X���̂Ȃ��t�@�C�����݂̂��擾���܂�
; 
;

#module

#deffunc dirbox str _p1, int _p2, int _p3, int _p4

	sdim buf,$10000
	sdim s1,256
	d_filter=_p1
	d_option=_p2
	d_result=-1
	if d_filter="" : d_filter="*.*"

	gosub *dive_dirs

	objsize _p3,_p4
	listbox d_result,,buf
	d_objid = stat
	d_objcnt=objinfo(d_objid,16)

	return

*dive_dirs
	dirlist mydirs,"*.*",5
	d_mydir=dir_cur
	if strlen(d_mydir)>3 : mydirs="..\n"+mydirs
	notesel mydirs
	repeat notemax
		noteget s1,cnt
		noteadd "<"+s1+">",cnt,1
	loop
	noteunsel

	dirlist buf,d_filter,d_option
	buf+=mydirs
	sortnote buf,0
	return


#deffunc dirbox_refresh

	gosub *dive_dirs
	objprm d_objid,buf
	return


#deffunc dirbox_name var _p1

	if d_result<0 : _p1="" : return
	notesel buf
	noteget _p1,d_result
	noteunsel
	return

#deffunc dirbox_fullname var _p1

	if d_result<0 : _p1="" : return
	dirbox_name s1
	_p1=d_mydir+"\\"+s1
	return

#deffunc dirbox_get var _p1

	i=objinfo(d_objid,16)
	if i!=d_objcnt : goto *sel_name
	_p1=0
	return

*sel_name
	d_objcnt=i
	dirbox_name s1
	if peek(s1,0)='<' : goto *sel_name2
	_p1=1
	return
*sel_name2
	len=strlen(s1)-2
	s1=strmid(s1,1,len)
	chdir s1
	dirbox_refresh
	_p1=0
	return


#global
#endif

