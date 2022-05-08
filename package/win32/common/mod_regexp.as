#ifndef __mod_regexp
#define __mod_regexp
/*********************************************************************
%dll
mod_regexp
%group
���K�\����������
%note
Internet Explorer 5.5 �ȏオ�K�v
%********************************************************************/
#module
oReg=0
oMatches=0
#deffunc _endregexp onexit
	delcom oReg
	return
#deffunc _startregexp
	newcom oReg,"VBScript.RegExp"
	return
/*********************************************************************
%index
match
���K�\���Ō������čŏ��Ɉ�v�����������Ԃ�
%prm
(p1,p2,p3,p4)
p1:��������镶����
p2:�������镶����
p3(0):�啶���Ə���������ʂ���Ȃ�1
p4(0):�S�̂���̍s�ƌ��Ȃ��Ȃ�1
%inst
p1�̕����񂩂�p2�Ɉ�v�����ŏ��̕������Ԃ��܂��B
p2�ɂ͐��K�\���̃p�^�[�����w�肵�܂��B
p3��1�ɂ���Ƒ啶���Ə���������ʂ��܂��B0��ȗ������ꍇ�͋�ʂ��܂���B
p4��1�ɂ���ƃ��^���� ^ �� $ �����s����E���O�ɑΉ����܂���B0��ȗ������ꍇ�͑Ή����܂��B

���K�\���̃p�^�[���ɂ͒ʏ�̕����̑��A�ȉ��̃��^�����ƌĂ΂����ꕶ�����g���܂��B
���^�������g���ꍇ�AHSP�X�N���v�g��ł� \ �� "\\" �ƕ\�L���鎖�ɒ��ӂ��Ă��������B
���Ƃ��΁A�����ƈ�v����p�^�[���̕\�L�� "\\d" �ƂȂ�A \ �ƈ�v����p�^�[���\�L�� "\\\\" �ƂȂ�܂��B
�܂��AHSP�ł̉��s "\n" ��\r\n�̂Q�����ł��邱�Ƃɒ��ӂ��Ă��������B"\n" �ƈ�v����p�^�[���\�L�� "\n" �܂��� "\\r\\n" �ƂȂ�܂��B

html{
<center>���^�����ꗗ</center>
<table border="1" style="font-family:MS UI Gothic;line-height:100%;">
<tr valign="top"><th>����</th><th>����</th></tr>
<tr valign="top"><td align="center" nowrap>.</td><td> \n �ȊO�̔C�ӂ�1�����Ɉ�v���܂��B\r �Ƃ͈�v���鎖�ɒ��ӂ��Ă��������B</td></tr>
<tr valign="top"><td align="center" nowrap>*</td><td>���O�̃p�^�[����0��ȏ�̌J��Ԃ��Ɉ�v���܂��B���Ƃ��΁AHSP!* �� "HSP" �� "HSP!" �� "HSP!!" ������ɂ���v���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>+</td><td>���O�̃p�^�[����1��ȏ�̌J��Ԃ��Ɉ�v���܂��B���Ƃ��΁AHSP!+ �� "HSP!" �� "HSP!!" �ɂ͈�v���܂����A"HSP" �ɂ͈�v���܂���B</td></tr>
<tr valign="top"><td align="center" nowrap>?</td><td>���O�̃p�^�[����0��܂��� 1 ��̌J��Ԃ��Ɉ�v���܂��B���Ƃ��΁AHSP!? �� "HSP" �� "HSP!" �Ɉ�v���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>{<em>n</em>,<em>m</em>}</td><td>���O�̃p�^�[���� <em>n</em> ��ȏ� <em>m</em> ��ȉ��̌J��Ԃ��Ɉ�v���܂��B���Ƃ��΁A\d{3,4} �� 3���܂���4���̐����Ɉ�v���܂��� 2���̐����ɂ͈�v�����A5���̐����ɂ͍ŏ���4����������v���܂��B<em>m</em>���ȗ������<em>n</em> ��ȏ�̌J��Ԃ��Ɉ�v���A�J���}��<em>m</em>���ȗ������<em>n</em> �񂿂傤�ǂ̌J��Ԃ��Ɉ�v���܂��B{0,1} �� ? �Ɠ����Ӗ��ɂȂ�A{1,} �� + �ƁA{0,} �� * �Ɠ����Ӗ��ɂȂ�܂��B{ }�̊Ԃɂ͗]���ȋ󔒂Ȃǂ����Ă͂����܂���B</td></tr>
<tr valign="top"><td align="center">*? +? ?? {<em>n</em>,<em>m</em>}?</td><td>* + ? {<em>n</em>,<em>m</em>} �̂悤�ȌJ��Ԃ��w��̃��^�����͒ʏ�A�ł�����������ƈ�v���܂����A�����̃��^��������� ? �������ƍł��Z��������ƈ�v���܂��B���Ƃ��΁A"&lt;abc&gt;&lt;def&gt;" �Ƃ�����������p�^�[�� &lt;.*&gt; �Ō��������ꍇ�A������S�̂ƈ�v���܂��� &lt;.*?&gt; �ƌ��������ꍇ�� "&lt;abc&gt;" �� "&lt;def&gt;" �̓�ɕ����Ĉ�v����悤�ɂȂ�܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>[<em>string</em>]</td><td><em>string</em> �Ɋ܂܂�邢���ꂩ�̈ꕶ���ƈ�v���܂��B���Ƃ��΁AHSP[123] �� "HSP1" �� "HSP2" ��"HSP3" �Ɉ�v���܂��� "HSP4" �ɂ͈�v���܂���B�܂��A��̕�����-�łȂ��Δ͈͎w�肪�\�ł��B�Ⴆ�� [a-z] �͔C�ӂ̉p�������ꕶ���Ɉ�v���A[a-zA-Z] �͔C�ӂ̉p���ꕶ���Ɉ�v���܂��B-���̂���������ꍇ�� [-a-z] �̂悤�ɂ��܂��B<em>string</em>�ɂ� $ �Ȃǂ̃��^�������g�p���Ă����^�����Ɖ��߂���܂��񂪁A�ꕔ������ \ �Ŏn�܂郁�^�����͋@�\���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>[^<em>string</em>]</td><td>[<em>string</em>] �Ƃ͋t�� <em>string</em> �Ɋ܂܂�Ȃ��C�ӂ̈ꕶ���ƈ�v���܂��B���Ƃ��΁AHSP[^1-3] �� "HSP4" �� "HSP5" �Ɉ�v���܂��� "HSP1" �� "HSP2" ��"HSP3" �ɂ͈�v���܂���B</td></tr>
<tr valign="top"><td align="center" nowrap>|</td><td>�_���a(OR)���������܂��B���Ƃ��΁Aabc|def �� "abc" �� "def" �Ɉ�v���܂��B| �͑��̕������]���̗D�揇�ʂ��Ⴂ�̂� ( ) �Ƒg�ݍ��킹��̂��֗��ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>(<em>pattern</em>)</td><td><em>pattern</em> ����̃O���[�v�Ƃ��܂��B���Ƃ��΁A20(09|10) �� "2009" �� "2010" �Ɉ�v���܂��B�܂��A<em>pattern</em> �Ɉ�v���镶������T�u�}�b�`�Ƃ��Č���Q�Ƃ��邱�Ƃ��o���܂�(�ő�99��)�B</td></tr>
<tr valign="top"><td align="center" nowrap>(?:<em>pattern</em>)</td><td>�T�u�}�b�`�Ƃ��ė��p�ł��Ȃ��ȊO�� (<em>pattern</em>) �Ƃ�������ł��B(<em>pattern</em>)���g���ꍇ�ɔ�ׂă������̐ߖ�ɂȂ�܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>(?=<em>pattern</em>)</td><td><em>pattern</em> �Ɉ�v���镶����̒��O�̈ʒu�Ɉ�v���܂��B���Ƃ��΁AHSP(?=2|3) �� "HSP2" �� "HSP3" ��"HSP"�Ɉ�v���܂��� "HSP1" ��"HSP"�ɂ͈�v���܂���B�܂��A�T�u�}�b�`�Ƃ��Ă̗��p�͏o���܂���B</td></tr>
<tr valign="top"><td align="center" nowrap>(?!<em>pattern</em>)</td><td><em>pattern</em> �Ɉ�v���Ȃ�������̒��O�̈ʒu�Ɉ�v���܂��B���Ƃ��΁AHSP(?!2)\d �� "HSP1" �� "HSP3" �Ɉ�v���܂��� "HSP2" �� "HSPa" �ɂ͈�v���܂���B�܂��A�T�u�}�b�`�Ƃ��Ă̗��p�͏o���܂���B</td></tr>
<tr valign="top"><td align="center" nowrap>\<em>num</em></td><td>�T�u�}�b�`�Ɠ���������Ɉ�v���܂��B��ڂ̃T�u�}�b�`��\1�ōő�\99�܂Ŏw��ł��܂��B���Ƃ��΁A(.)(.)\1\2 �� "abab" �� "0101" �̂悤�Ȍ��݂ɌJ��Ԃ�������Ɉ�v���A&lt;(.*?)&gt;.*&lt;/\1&gt; �� "&lt;a&gt;hoge&lt;/a&gt;" �� "&lt;b&gt;hoge&lt;/b&gt;" �Ɉ�v���܂��B�Ή�����T�u�}�b�`���Ȃ��ꍇ��8�i�����R�[�h�ƌ��Ȃ���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>^</td><td>�s���Ɉ�v���܂��B�܂�A������̐擪����� \n �܂��� \r �̒���̈ʒu�Ɉ�v���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>$</td><td>�s���Ɉ�v���܂��B�܂�A������̍Ōエ��� \n �܂��� \r �̒��O�̈ʒu�Ɉ�v���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>\</td><td>\�̎��Ƀ��^�����������ƁA���̕����ƈ�v���܂��B���Ƃ��΁A\( �� "(" �Ɉ�v�� \? �� "?" �Ɉ�v���܂��B�܂��A\\ �� "\" �Ɉ�v���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>\n</td><td>���s(LF)�Ɉ�v���܂��B\x0a ����� \cJ �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\r</td><td>���s(CR)�Ɉ�v���܂��B\x0d ����� \cM �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\t</td><td>�^�u�Ɉ�v���܂��B\x09 ����� \cI �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\f</td><td>�t�H�[���t�B�[�h�Ɉ�v���܂��B\x0c ����� \cL �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\v</td><td>�����^�u�Ɉ�v���܂��B\x0b ����� \cK �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\c</td><td>Ctrl�L�[�œ��͂ł��鐧�䕶���Ɉ�v���܂��B\c�ɑ����ĉp���ꕶ�����w�肵�܂��B���Ƃ��΁A\cM �� Ctrl + M �L�[(���s����)�Ɉ�v���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>\b</td><td>�P��̋��E�Ɉ�v���܂��B���Ƃ��΁Arun\b �� "run" �ɂ͈�v���܂��� "running" �� "run" �ɂ͈�v���܂���B</td></tr>
<tr valign="top"><td align="center" nowrap>\B</td><td>�P��̋��E�łȂ��ʒu�Ɉ�v���܂��B���Ƃ��΁Arun\B �� "running" �� "run" �ɂ͈�v���܂��� "run" �ɂ͈�v���܂���B</td></tr>
<tr valign="top"><td align="center" nowrap>\d</td><td>�����ꕶ���Ɉ�v���܂��B[0-9] �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\D</td><td>�����ȊO�̈ꕶ���Ɉ�v���܂��B[^0-9] �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\s</td><td>�X�y�[�X��^�u�Ȃǂ̋󔒕����Ɉ�v���܂��B[ \f\n\r\t\v] �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\S</td><td>�󔒕����ȊO�̔C�ӂ̈ꕶ���Ɉ�v���܂��B[^ \f\n\r\t\v] �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\w</td><td>�P��Ɏg�p�����C�ӂ̈ꕶ���Ɉ�v���܂��B[A-Za-z0-9_] �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\W</td><td>�P��Ɏg�p����镶���ȊO�̔C�ӂ̈ꕶ���Ɉ�v���܂��B[^A-Za-z0-9_] �Ɠ����ł��B</td></tr>
<tr valign="top"><td align="center" nowrap>\x</td><td>16�i�����R�[�h�ł��B\x�ɑ�����2����16�i�����w�肵�܂��B���Ƃ��΁A\x41 �� "A" �Ɉ�v���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>\</td><td>8�i�����R�[�h�ł��B\�ɑ�����3����8�i�����w�肵�܂��B���Ƃ��΁A\101 �� "A" �Ɉ�v���܂��B</td></tr>
<tr valign="top"><td align="center" nowrap>\u</td><td>Unicode�ł��B\u�ɑ�����4����16�i�����w�肵�܂��B���Ƃ��΁A\u3042 �� "��" �Ɉ�v���܂��B</td></tr>
</table>
}html
%sample
#include "mod_regexp.as"
a={"
	�Z��=50
	����=100
	�Љ�=70
"}
mes match(a,"����=\\d+")

 ;--------����-----------
 ;����=100
%href
submatch
matches
replace
%********************************************************************/
#defcfunc match str target,str Pattern,int IgnoreCase,int Multiline
	oReg("Global") = 0
	oReg("IgnoreCase") = (IgnoreCase==0)
	oReg("Multiline") = (Multiline==0)
	oReg("Pattern") = Pattern
	comres oMatches
	oReg->"Execute" target
	if stat<0:return ""
	if oMatches("count"){
		oMatch=oMatches("item",0)
		retstr=oMatch("value")
		delcom oMatch
	}else{
		retstr=""
	}
	delcom oMatches
	return retstr
/*********************************************************************
%index
submatch
���K�\���Ō������čŏ��Ɉ�v�����T�u�}�b�`�������Ԃ�
%prm
(p1,p2,p3,p4)
p1:��������镶����
p2:�������镶����
p3(0):�啶���Ə���������ʂ���Ȃ�1
p4(0):�S�̂���̍s�ƌ��Ȃ��Ȃ�1
%inst
p1�̕����񂩂�p2�Ɉ�v�����ŏ��̌��ʂ̃T�u�}�b�`�������Ԃ��܂��B
p2�ɂ͐��K�\���̃p�^�[�����w�肵�܂��B
p3��1�ɂ���Ƒ啶���Ə���������ʂ��܂��B0��ȗ������ꍇ�͋�ʂ��܂���B
p4��1�ɂ���ƃ��^���� ^ �� $ �����s����E���O�ɑΉ����܂���B0��ȗ������ꍇ�͑Ή����܂��B
���K�\���̃p�^�[���ɂ��Ă�match�̍��ڂ��Q�Ƃ��Ă��������B
%sample
#include "mod_regexp.as"
a={"
	�Z��=50
	����=100
	�Љ�=70
"}
mes submatch(a,"����=(\\d+)")

 ;--------����-----------
 ;100
%href
match
matches
replace
%********************************************************************/
#defcfunc submatch str target,str Pattern,int IgnoreCase,int Multiline
	oReg("Global") = 0
	oReg("IgnoreCase") = (IgnoreCase==0)
	oReg("Multiline") = (Multiline==0)
	oReg("Pattern") = Pattern
	comres oMatches
	oReg->"Execute" target
	if stat<0 : return ""
	retstr=""
	if oMatches("count"){
		oMatch=oMatches("item",0)
		oSubmatches=oMatch("submatches")
		if oSubmatches("count"){
			variant=oSubmatches(".Item",0)
			variant("vartype")=8/*VT_BSTR*/
			retstr=variant("value")
			variant=0
		}
		delcom oSubmatches
		delcom oMatch
	}
	delcom oMatches
	return retstr
/*********************************************************************
%index
matches
���K�\���Ō������������̌��ʂ��擾����
%prm
p1,p2,p3,p4,p5,p6
p1:���ʂ��󂯎��ϐ�
p2:��������镶����
p3:�������镶����
p4(0):�啶���Ə���������ʂ���Ȃ�1
p5(0):�ŏ��̌��ʂ������擾����Ȃ�1
p6(0):�S�̂���̍s�ƌ��Ȃ��Ȃ�1
%inst
p2�̕����񂩂�p3�Ɉ�v���������̌��ʂ��T�u�}�b�`���܂߂Ĉ�x�Ɏ擾���܂��B
p3�ɂ͐��K�\���̃p�^�[�����w�肵�܂��B
p4��1�ɂ���Ƒ啶���Ə���������ʂ��܂��B0��ȗ������ꍇ�͋�ʂ��܂���B
p5��1�ɂ���ƍŏ��Ɉ�v�������ʂ������擾���܂��B0��ȗ������ꍇ�͑S�Ă̌��ʂ��擾���܂��B
p6��1�ɂ���ƃ��^���� ^ �� $ �����s����E���O�ɑΉ����܂���B0��ȗ������ꍇ�͑Ή����܂��B

p1�̕ϐ��͏���������A���ʂ�p1�̔z��ɃZ�b�g����܂��B
��ԖڂɈ�v�����������p1(0)�ɁA��ԖڂɈ�v�����������p1(1)�Ɋi�[����܂��B
����ɁA��ԖڂɈ�v����������̂Ȃ��̈�Ԗڂ̃T�u�}�b�`��p1(0,1)�ɁA��Ԗڂ̃T�u�}�b�`��p1(0,2)�Ɋi�[����܂��B
stat�Ɉ�v����������̐����Z�b�g����A0�Ȃ�����v���Ă��Ȃ����ƂɂȂ�܂��B
�T�u�}�b�`�̐���length2���g���Ē��ׂ��܂��B

���K�\���̃p�^�[���ɂ��Ă�match�̍��ڂ��Q�Ƃ��Ă��������B
%sample
#include "mod_regexp.as"
a={"
	���Y�F�Z��=50,����=100,�Љ�=70
	��Y�F�Z��=30,����=50,�Љ�=60
	�Ԏq�F�Z��=60,����=40,�Љ�=50
"}
matches b,a,"(.*)�F�Z��=(\\d+),����=(\\d+),�Љ�=(\\d+)"
repeat stat
	mes b(cnt)
	mes "\t"+b(cnt,1)+"�̑����_="+(0+b(cnt,2)+b(cnt,3)+b(cnt,4))
loop

 ;-------------����------------
 ;���Y�F�Z��=50,����=100,�Љ�=70
 ;	���Y�̑����_=220
 ;��Y�F�Z��=30,����=50,�Љ�=60
 ;	��Y�̑����_=140
 ;�Ԏq�F�Z��=60,����=40,�Љ�=50
 ;	�Ԏq�̑����_=150
%href
match
submatch
replace
%********************************************************************/
#deffunc matches array retvar,str target,str Pattern,int IgnoreCase,int Global,int Multiline
	oReg("IgnoreCase") = (IgnoreCase==0)
	oReg("Global") = (Global==0)
	oReg("Multiline") = (Multiline==0)
	oReg("Pattern") = Pattern
	comres oMatches
	oReg->"Execute" target
	if stat<0:sdim retvar,1,1:return 0
	num1=oMatches("count")
	if num1==0:sdim retvar,1,1:	delcom oMatches:return 0
	oMatch=oMatches("item",0)
	oSubmatches=oMatch("submatches")
	num2=oSubmatches("Count")
	sdim retvar,64,num1,num2+1
	for i,0,num1,1
		oMatch=oMatches("item",i)
		retvar.i=oMatch("value")
		oSubmatches=oMatch("submatches")
		repeat num2
			variant=oSubmatches(".Item",cnt)
			variant("vartype")=8/*VT_BSTR*/
			retvar(i,cnt+1)=variant("value")
		loop
	next
	variant=0
	delcom oSubmatches
	delcom oMatch
	delcom oMatches
	return num1
/*********************************************************************
%index
replace
���K�\���ŕ�����̒u�����s��
%prm
(p1,p2,p3,p4,p5,p6)
p1:��������镶����
p2:�������镶����
p3:�u�������镶����
p4(0):�啶���Ə���������ʂ���Ȃ�1
p5(0):�ŏ��Ɉ�v��������������u������Ȃ�1
p6(0):�S�̂���̍s�ƌ��Ȃ��Ȃ�1
%inst
p1�̕�����̂Ȃ���p2�Ɉ�v����������p3�Œu���������������Ԃ��܂��B
p2�ɂ͐��K�\���̃p�^�[�����w�肵�܂��B
p4��1�ɂ���Ƒ啶���Ə���������ʂ��܂��B0��ȗ������ꍇ�͋�ʂ��܂���B
p5��1�ɂ���ƍŏ��Ɉ�v��������������u�����܂��B0��ȗ������ꍇ�͑S�Ă̈�v����������u�����܂��B
p6��1�ɂ���ƃ��^���� ^ �� $ �����s����E���O�ɑΉ����܂���B0��ȗ������ꍇ�͑Ή����܂��B
���K�\���̃p�^�[���ɂ��Ă�match�̍��ڂ��Q�Ƃ��Ă��������B

p3�ɂ͈ȉ��̓��ꕶ�����g�p�ł��܂��B
html{
<table border="1" style="font-family:MS UI Gothic;line-height:100%;">
<tr><th>����</th><th>����</th></tr>
<tr><td align="center" nowrap>$<em>num</em></td><td><em>num</em>�Ԗڂ̃T�u�}�b�`������ɒu������܂��B��ڂ̃T�u�}�b�`��$1�ōő�$99�܂Ŏw��ł��܂��B</td></tr>
<tr><td align="center" nowrap>$&amp;</td><td>p2�Ɉ�v����������ɒu������܂��B</td></tr>
<tr><td align="center" nowrap>$`</td><td>p1�̒��ŁAp2�Ɉ�v��������������O���̕����ɒu������܂��B</td></tr>
<tr><td align="center" nowrap>$'</td><td>p1�̒��ŁAp2�Ɉ�v�����������������̕����ɒu������܂��B</td></tr>
<tr><td align="center" nowrap>$$</td><td>$�ɒu������܂��B</td></tr>
</table>
}html
%sample
#include "mod_regexp.as"
a={"
	���Y�F50,100,70
	��Y�F30,50,60
	�Ԏq�F60,40,50
"}
mes replace(a,"�F","�̐��сF")

 ;---------------����--------------
 ;���Y�̐��сF50,100,70
 ;��Y�̐��сF30,50,60
 ;�Ԏq�̐��сF60,40,50

mes replace(a,"(.*)�F(\\d+),(\\d+),(\\d+)","$1�̐��сF�Z��=$2,����=$3,�Љ�=$4")

 ;---------------����--------------
 ;���Y�̐��сF�Z��=50,����=100,�Љ�=70
 ;��Y�̐��сF�Z��=30,����=50,�Љ�=60
 ;�Ԏq�̐��сF�Z��=60,����=40,�Љ�=50
%href
match
submatch
matches
%********************************************************************/
#defcfunc replace str target,str Pattern,str repstr,int IgnoreCase,int Global,int Multiline
	oReg("IgnoreCase") = (IgnoreCase==0)
	oReg("Global") = (Global==0)
	oReg("Multiline") = (Multiline==0)
	oReg("Pattern") = Pattern
	comres retstr
	oReg->"Replace" target,repstr
	if stat<0:return target
	return retstr
#global
_startregexp
#endif
