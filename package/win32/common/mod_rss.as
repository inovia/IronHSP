#ifndef __mod_rss__
#define __mod_rss__

#module "rssmod"

#deffunc rssload array _v1, array _v2, str _p1, int _p2

	;
	;	XML�p�[�T�[(MSXML)���g�p����RSS��ǂݍ���
	;	rssload �ϐ�1,�ϐ�2,�p�X,��
	;
	;	�ϐ�1,2 = ������^�z��ϐ��Ƃ��Č��ʂ��������܂�
	;	          (�ϐ�1��RSS�̓��e�A�ϐ�2�̓����N��)
	;	�p�X    = URL�܂��̓t�@�C���p�X���w�肵�܂�
	;	��    = �ǂݍ���RSS�t�B�[���h�̐����w�肵�܂�
	;	          (0�܂��͏ȗ�����5�ɂȂ�܂�)
	;
	newcom oDom,"Microsoft.XMLDOM"
	oDom("async")="FALSE"		; �����ǂݍ��݂��s��
	oDom->"load" _p1
	oRoot = oDom("documentElement")
	if varuse(oRoot)=0 : return 1
	rsstag = getpath(""+oRoot("tagName"),16)
	if rsstag="rdf:rdf" : goto *rsspick
	if rsstag="rss" : goto *rsspick

	delcom oRoot
	delcom oDom
	return
*rsspick
	maxnum=_p2
	if maxnum<=0 : maxnum=5

	comres elm_ch
	oDom->"getElementsByTagName" "title"

	comres elm_link
	oDom->"getElementsByTagName" "link"

	max=elm_ch("length")
	if max>maxnum : max=maxnum

	sdim _v1, 64, max
	sdim _v2, 64, max

	repeat max
		i=cnt
		node = elm_ch("item",i)
		node2 = node("firstChild")
		_v1.i = node2("nodeValue")

		node = elm_link("item",i)
		node2 = node("firstChild")
		_v2.i = node2("nodeValue")
	loop

	delcom node
	delcom node2
	delcom elm_ch
	delcom elm_link
	delcom oRoot
	delcom oDom

	return 0

#global

#endif

