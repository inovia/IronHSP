%dll
hsedsdk

%ver
3.6

%date
2020/12/17

%author
onitama

%url
; �֘A URL ���L��

%note
hsedsdk.as���C���N���[�h���邱�ƁB

%type
���[�U�[�g������

%port
Win

%group
HSP�X�N���v�g�G�f�B�^ �O���c�[���쐬�p

%index
hsed_exist
HSP�X�N���v�g�G�f�B�^�̋N����Ԃ��擾

%inst
HSP�X�N���v�g�G�f�B�^���N�����Ă��邩�`�F�b�N���܂��B
�N�����Ă����1���A�N�����Ă��Ȃ����0���V�X�e���ϐ�stat�ɑ������܂��B

%sample
#include "hsedsdk.as"
	hsed_exist
	if ( stat ) {
		mes "HSP�X�N���v�g�G�f�B�^���N�����Ă��܂��B"
	} else {
		mes "HSP�X�N���v�g�G�f�B�^�͋N�����Ă��܂���B"
	}
	stop

%group
���擾����

%index
hsed_capture
HSP�X�N���v�g�G�f�B�^��API�E�B���h�E��ߑ�

%inst
hsedsdk���W���[�����̕ϐ�hIF��HSP�X�N���v�g�G�f�B�^��API�E�B���h�E�̃n���h���������܂��B
^
�擾�ɐ��������ꍇ�̓V�X�e���ϐ�stat��0���������܂��B
^
���̖��߂�hsedsdk.as���ŗ��p����閽�߂ł���A�ʏ�͗��p����K�v�͂���܂���B

%group
�n���h���擾����

%href
hsed_getwnd
%index
hsed_gettext
�ҏW���̃e�L�X�g���擾

%prm
p1, p2
p1 : �e�L�X�g��������ϐ�
p2 : �擾������Footy��ID

%inst
HSP�X�N���v�g�G�f�B�^�ŕҏW���Ă���e�L�X�g���擾���Ap1�ɑ�����܂��B
^
�擾�ɐ��������ꍇ�̓V�X�e���ϐ�stat��0���������܂��B

%sample
#include "hsedsdk.as"
	nTabID = 0
	hsed_getfootyid nFootyID, nTabID
	if ( stat == 0 ) : hsed_gettext buf, nFootyID
	mesbox buf, ginfo_winx, ginfo_winy
	stop

%href
hsed_settext

%group
�e�L�X�g�擾����
%index
hsed_sendstr
�������\��t��

%prm
p1
p1 : �X�N���v�g�ɑ}�����镶������i�[����������^�ϐ�

%inst
�ҏW���̃e�L�X�g��p1�Ɋi�[�����������\��t���܂��B

%sample
#include "hsedsdk.as"
	sIns = "�X�N���v�g�G�f�B�^�ɑ��镶����"
	hsed_sendstr sIns

%href
hsed_settext

%group
�e�L�X�g�ҏW����
%index
hsed_cancopy
�R�s�[�̉ۂ��擾

%prm
p1, p2
p1 : ���ʂ��i�[����ϐ�
p2 : Footy��ID

%inst
�R�s�[�̉ۂ��擾���܂��B
�w�肳�ꂽFooty����N���b�v�{�[�h�ɃR�s�[���邱�Ƃ��ł���ꍇ��p1��1���Ԃ�܂��B
^
���ۂɃR�s�[��؂�����s���ꍇ��hsed_copy�܂���hsed_cut�𗘗p���Ă��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_cancopy ret, idFooty
		if ( ret ) {
			mes "ID" + str( cnt ) + "�̃^�u�̓R�s�[�ł��܂��B"
		} else {
			mes "ID" + str( cnt ) + "�̃^�u�̓R�s�[�ł��܂���B"
		}
	loop
	stop

%group
���擾����

%href
hsed_copy
hsed_cut
hsed_canpaste
%index
hsed_cut
�w�肵��Footy���當�����؂���

%prm
p1
p1 : �������؂���Footy��ID

%inst
�w�肵��Footy�֕�������N���b�v�{�[�h�ɐ؂���悤�v�����܂��B
�؂��肪�s���邩�ǂ�����hsed_cancopy�Œ��ׂĂ��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_cancopy ret, idFooty
		if ( ret ) {
			hsed_cut idFooty
			mes "ID" + str( cnt ) + "�̃^�u����؂���܂����B"
		}
	loop
	stop

%href
hsed_cancopy
hsed_copy

%group
�N���b�v�{�[�h���얽��
%index
hsed_redo
���h�D���s��

%prm
p1
p1 : ���h�D���s��Footy��ID

%inst
�w�肵��Footy�ɑ΂��ă��h�D���s���悤�ɗv�����܂��B
���h�D���s���邩�ǂ�����hsed_canredo�Œ��ׂĂ��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_canredo ret, idFooty
		if ( ret ) {
			hsed_redo idFooty
			mes "ID" + idFooty + "��Footy�����h�D���܂����B"
		} else {
			mes "ID" + idFooty + "��Footy�̓��h�D�ł��܂���ł����B"
		}
	loop
	stop

%href
hsed_undo
hsed_canredo

%group
�e�L�X�g�ҏW����
%index
hsed_undo
�A���h�D���s��

%prm
p1
p1 : �A���h�D���s��Footy��ID

%inst
�w�肵��Footy�ɑ΂��ăA���h�D���s���悤�ɗv�����܂��B
�A���h�D���s���邩�ǂ�����hsed_canundo�Œ��ׂĂ��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_canundo ret, idFooty
		if ( ret ) {
			hsed_undo idFooty
			mes "ID" + idFooty + "��Footy���A���h�D���܂����B"
		} else {
			mes "ID" + idFooty + "��Footy�̓A���h�D�ł��܂���ł����B"
		}
	loop
	stop

%href
hsed_redo
hsed_canundo

%group
�e�L�X�g�ҏW����
%index
hsed_indent
�C���f���g���s��

%prm
p1
p1 : �C���f���g���s��Footy��ID

%inst
Footy�ɑ΂��ăC���f���g���s���悤�ɗv�����܂��B
�C���f���g�͑I��͈͂ɑ΂��čs���܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_selectall idFooty
		hsed_indent idFooty
	loop
	stop

%href
hsed_unindent

%group
�e�L�X�g�ҏW����
%index
hsed_unindent
�A���C���f���g���s��

%prm
p1
p1 : �A���C���f���g���s��Footy��ID

%inst
Footy�ɑ΂��ăA���C���f���g���s���悤�ɗv�����܂��B
�A���C���f���g�͑I��͈͂ɑ΂��čs���܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_selectall idFooty
		hsed_unindent idFooty
	loop
	stop

%href
hsed_indent

%group
�e�L�X�g�ҏW����
%index
hsed_uninitduppipe
�p�C�v�n���h���̉��

%inst
; ����� ���L��

%href
hsed_initduppipe

%group
�p�C�v���얽��
%index
hsed_initduppipe
�p�C�v�n���h���̍쐬

%prm
p1
p1 : ������̒���

%inst
; ����� ���L��

%href
hsed_uninitduppipe

%group
�p�C�v���얽��
%index
hsed_getmajorver
���W���[�o�[�W�����𒊏o

%prm
(p1)
p1 : �o�[�W������\�������l

%inst
p1�Ŏw�肳�ꂽ�o�[�W�������烁�W���[ �o�[�W�����݂̂𒊏o���܂��B
�����Ŏw��ł���l�́Ahsed_getver��HGV_PUBLICVER��������HGV_PRIVATEVER���w�肵�Ď擾�����o�[�W�����݂̂ł��B

%href
hsed_getver
hsed_getminorver
hsed_getbetaver


%group
�o�[�W�������o�֐�
%index
hsed_getminorver
�}�C�i�[�o�[�W�����𒊏o

%prm
(p1)
p1 : �o�[�W������\�������l

%inst
p1�Ŏw�肳�ꂽ�o�[�W��������}�C�i�[ �o�[�W�����݂̂𒊏o���܂��B
�����Ŏw��ł���l�́Ahsed_getver��HGV_PUBLICVER��������HGV_PRIVATEVER���w�肵�Ď擾�����o�[�W�����݂̂ł��B

%href
hsed_getver
hsed_getmajorver
hsed_getbetaver


%group
�o�[�W�������o�֐�
%index
hsed_getbetaver
�x�[�^�o�[�W�����𒊏o

%prm
(p1)
p1 : �o�[�W������\�������l

%inst
p1�Ŏw�肳�ꂽ�o�[�W��������x�[�^ �o�[�W�����݂̂𒊏o���܂��B
�����Ŏw��ł���l�́Ahsed_getver��HGV_PUBLICVER��������HGV_PRIVATEVER���w�肵�Ď擾�����o�[�W�����݂̂ł��B

%href
hsed_getmajorver
hsed_getminorver
hsed_getver


%group
�o�[�W�������o�֐�
%index
hsed_getver
�X�N���v�g�G�f�B�^�̃o�[�W�������擾

%prm
p1, p2
p1 : ���ʂ��i�[����ϐ�
p2 : �o�[�W�����̎�ނ��w�肷�邽�߂̐����l

%inst
p2�Ŏw�肳�ꂽ��ނ̃G�f�B�^�̃o�[�W�������擾���Ap1�ɑ�����܂��B
�擾�Ɏ��s�����ꍇ�́A�����Ƃ���p1��-1�������܂��B�������Ap2��HGV_HSPCMPVER���w�肳��Ă����ꍇ�́A"Error"�������܂��B
^
stat�ɑ�������l�͈ȉ��̒ʂ�ł��B
0: �擾�ɐ���
1: �G�f�B�^��������Ȃ�����
2: �p�C�v�����Ȃ�����
3: �G�f�B�^���������l��Ԃ��Ȃ�����(p2���������Ȃ��ꍇ�܂�)
^
p2�Ɏw�肷��l�͈ȉ��̒ʂ�ł��BHGV_�Ŏn�܂�萔��p���Ă��A���ʓ��̐�����p���Ă��\���܂���B
html{
<table border="1"><tr><th>HGV_PUBLICVER(0)</th>
<td>�p�u���b�N �o�[�W����(�G�f�B�^���J���_�ł̎��̃o�[�W����)�B
16�i����<ul><li>������4�����W���[ �o�[�W����</li><li>������3���ڃ}�C�i�[ �o�[�W����</li></ul>��\���܂��B(��:Ver3.6beta3��$0003603)<br />
hsed_getmajorver(), hsed_getminorver(), hsed_getbetaver()�Ŋe�l���擾�ł��܂��B<br />
�܂��Ahsed_cnvverstr�ŁA������ɕϊ����邱�Ƃ��\�ł��B</td></tr>
<tr><th>HGV_PRIVATEVER(1)</th>
<td>�v���C�x�[�g �o�[�W�����BHGV_PUBLICBER�Ɠ����`���ł��B</td></tr>
<tr><th>HGV_HSPCMPVER(2)</th>
<td>hspcmp.dll����hsc_ver�Ŏ擾�����o�[�W����(������)���������܂��B</td></tr>
<tr><th>HGV_FOOTYVER(3)</th>
<td>Footy����GetFootyVer�Ŏ擾�����o�[�W�������������܂��B
�o�[�W������100�{�������l���Ԃ�܂��B(��:Ver3.6��0x3600)</td></tr>
<tr><th nowrap>HGV_FOOTYBETAVER(4)</th>
<td>Footy����GetFootyBetaVer�Ŏ擾�����o�[�W�������������܂��B
�x�[�^ �o�[�W���������̂܂ܑ������܂��B
�x�[�^ �o�[�W�����ł͂Ȃ��ꍇ��0���������܂��B</td></tr>
</table>
}html


%href
hsed_getmajorver
hsed_getminorver
hsed_getbetaver

%group
���擾����
%index
hsed_getwnd
�X�N���v�g�G�f�B�^�̊e��n���h�����擾

%prm
p1, p2, p3

%inst
p2�Ŏw�肳�ꂽ��ނ̃G�f�B�^�̃E�B���h�E �n���h�����擾���Ap1�ɑ�����܂��B
p2��HGW_EDIT���w�肵���ꍇ�́Ap3��Footy��ID���w�肷��K�v������܂��B
�擾�Ɏ��s�����ꍇ�́Ap1��0�������܂��B

stat�ɑ�������l�͈ȉ��̒ʂ�ł��B
0: �擾�ɐ���
1: �G�f�B�^��������Ȃ�����
2: �G�f�B�^���������l��Ԃ��Ȃ�����(p2���������Ȃ��ꍇ�܂�)

p2�Ɏw�肷��l�͈ȉ��̒ʂ�ł��BHGW_�Ŏn�܂�萔��p���Ă��A���ʓ��̐�����p���Ă��\���܂���B
HGW_MAIN(0): ���C�� �E�B���h�E
HGW_CLIENT(1): �N���C�A���g �E�B���h�E
HGW_TAB(2): �^�u �E�B���h�E
HGW_EDIT(3): Footy �E�B���h�E
HGW_TOOLBAR(4): �c�[���o�[
HGW_STATUSBAR(5): �X�e�[�^�X�o�[

%href
hsed_capture

%group
�n���h���擾����
%index
hsed_cnvverstr
�o�[�W�����̐��l�𕶎���ɕϊ�

%prm
p1
p1 : �o�[�W������\�������l

%inst
p1�Ŏw�肳�ꂽ�o�[�W�����𕶎���ɕϊ����Arefstr�ɑ�����܂��B"(���W���[�o�[�W����).(�}�C�i�[�o�[�W����)"�̌`���ł��B�������A�x�[�^�o�[�W�����̏ꍇ�͖�����"b(�x�[�^�o�[�W����)"���������܂��B
�����Ŏw��ł���l�́Ahsed_getver��HGV_PUBLICVER��������HGV_PRIVATEVER���w�肵�Ď擾�����o�[�W�����݂̂ł��B

%group
�o�[�W�����ϊ�����

%index
hsed_selectall
�e�L�X�g�����ׂđI��

%prm
p1
p1 : �e�L�X�g��I������Footy��ID

%inst
Footy�ɑ΂��ăe�L�X�g�����ׂđI������悤�ɗv�����܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_selectall idFooty
	loop
	stop

%group
�e�L�X�g�ҏW����
%index
hsed_gettextlength
�e�L�X�g�̕����񒷂��擾

%prm
p1, p2
p1 : �����񒷂�������ϐ�
p2 : �����񒷂��擾����Footy��ID

%inst
�e�L�X�g�̕����񒷂��擾���Ap1�֑�����܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_gettextlength lText, idFooty
		mes "ID" + idFooty + "��Footy�̕����񒷂�" + lText + "�ł��B"
	loop
	stop

%href
hsed_getlinelength

%group
���擾����
%index
hsed_getlines
�e�L�X�g�̍s�����擾

%prm
p1, p2
p1 : �s����������ϐ�
p2 : �s�����擾����Footy��ID

%inst
�e�L�X�g�̍s����p1�ɑ�����܂��B�R�����g�s���s��1�s�Ƃ��ăJ�E���g����܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	lText = ""
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_getlines nLines, idFooty
		mes "ID" + idFooty + "��Footy�̍s����" + nLines + "�ł��B"
	loop
	stop


%href
hsed_getlinelength

%group
���擾����
%index
hsed_getlinelength
�s�̕����񒷂��擾

%prm
p1, p2, p3
p1 : �����񒷂�������ϐ�
p2 : �����񒷂��擾����Footy��ID
p3 : �����񒷂��擾����s�̔ԍ��i1�`�j

%inst
�e�L�X�g��p3�s�ڂ̕����񒷂��擾���Ap1�֑�����܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_getlinelength lLine, idFooty, 1
		mes "ID" + idFooty + "��Footy��1�s�ڂ̕����񒷂�" + lLine + "�ł��B"
	loop
	stop

%href
hsed_getlines
hsed_gettextlength

%group
���擾����
%index
hsed_getlinecode
���s�R�[�h���擾

%prm
p1, p2

%inst
; ����� ���L��

%href
; �֘A���� ���L��

%group
���擾����
%index
hsed_copy
�w�肵��Footy���當������R�s�[

%prm
p1
p1 : ��������R�s�[����Footy��ID

%inst
�w�肵��Footy�֕�������N���b�v�{�[�h�ɃR�s�[����悤�v�����܂��B
�R�s�[���s���邩�ǂ�����hsed_cancopy�Œ��ׂĂ��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		if ( stat == 0 ) {
			hsed_cancopy ret, idFooty
			if ( ret ) {
				hsed_copy idFooty
				mes "ID" + str( cnt ) + "�̃^�u����R�s�[���܂����B"
			}
		}
	loop
	stop

%href
hsed_cancopy
hsed_cut

%group
�N���b�v�{�[�h���얽��
%index
hsed_paste
�w�肵��Footy�֕������\��t��

%prm
p1
p1 : �������\��t����Footy��ID

%inst
�w�肵��Footy�֕�������N���b�v�{�[�h����\��t����悤�v�����܂��B
�\��t�����s���邩�ǂ�����hsed_canpaste�Œ��ׂĂ��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	hsed_canpaste ret
	if ( ret ) {
		repeat nTabs
			hsed_getfootyid idFooty, cnt
			if ( stat == 0 ) {
				hsed_paste idFooty
				mes "ID" + str( cnt ) + "�̃^�u�֓\��t���܂����B"
			}
		loop
	} else {
		mes "�\��t���ł��܂���B"
	}
	stop
%href
hsed_canpaste


%group
�N���b�v�{�[�h���얽��
%index
hsed_canpaste
�\��t���̉ۂ��擾

%prm
p1
p1 : ���ʂ��i�[����ϐ�

%inst
�\��t���̉ۂ��擾���܂��B
�N���b�v�{�[�h����\��t�����邱�Ƃ��ł���ꍇ��p1��1���Ԃ�܂��B
^
���ۂɓ\��t�����s���ꍇ��hsed_paste�𗘗p���Ă��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	hsed_canpaste ret
	if ( ret ) {
		mes "�\��t���ł��܂��B"
	} else {
		mes "�\��t���ł��܂���B"
	}
	stop

%href
hsed_paste
hsed_cancopy

%group
���擾����
%index
hsed_canundo
�A���h�D�̉ۂ��擾

%prm
p1, p2
p1 : ���ʂ��i�[����ϐ�
p2 : Footy��ID

%inst
�w�肵��Footy�̃A���h�D�̉ۂ��擾���܂��B
�A���h�D���\�Ȃ��p1��1���Ԃ�܂��B
^
���ۂɃA���h�D���s���ꍇ��hsed_undo�𗘗p���Ă��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_canundo ret, idFooty
		if ( ret ) {
			hsed_undo idFooty
			mes "ID" + idFooty + "��Footy���A���h�D���܂����B"
		} else {
			mes "ID" + idFooty + "��Footy�̓A���h�D�ł��܂���ł����B"
		}
	loop
	stop

%href
hsed_undo
hsed_canredo

%group
���擾����
%index
hsed_canredo
���h�D�̉ۂ��擾

%prm
p1, p2
p1 : ���ʂ��i�[����ϐ�
p2 : Footy��ID

%inst
�w�肵��Footy�̃��h�D�̉ۂ��擾���܂��B
���h�D���\�Ȃ��p1��1���Ԃ�܂��B
^
���ۂɃ��h�D���s���ꍇ��hsed_redo�𗘗p���Ă��������B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_canredo ret, idFooty
		if ( ret ) {
			hsed_redo idFooty
			mes "ID" + idFooty + "��Footy�����h�D���܂����B"
		} else {
			mes "ID" + idFooty + "��Footy�̓��h�D�ł��܂���ł����B"
		}
	loop
	stop

%href
hsed_redo
hsed_canundo

%group
���擾����
%index
hsed_getmodify
�ύX�t���O���擾

%prm
p1, p2
p1 : ���ʂ��i�[����ϐ�
p2 : Footy��ID

%inst
�w�肵��Footy�̕ύX�t���O���擾���܂��B
�ύX����Ă����p1�ɂ�1���Ԃ�܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_getmodify ret, idFooty
		if ( ret ) {
			mes "ID" + idFooty + "��Footy�͕ύX����Ă��܂��B"
		} else {
			mes "ID" + idFooty + "��Footy�͕ύX����Ă��܂���B"
		}
	loop
	stop

%group
���擾����
%index
hsed_settext
�e�L�X�g��ύX

%prm
p1, p2
p1 : �ύX������Footy��ID
p2 : �ύX����e�L�X�g

%inst
HSP�X�N���v�g�G�f�B�^�ŕҏW���̃e�L�X�g��p2�ɕύX���܂��B
^
�ύX�ɐ��������ꍇ�̓V�X�e���ϐ�stat��0���������܂��B

%sample
#include "hsedsdk.as"
	nTabID = 0
	hsed_getfootyid nFootyID, nTabID
	if ( stat == 0 ) : hsed_settext nFootyID, "�ύX���ꂽ�e�L�X�g"
	stop

%href
hsed_gettext
hsed_sendstr

%group
�e�L�X�g�ҏW����
%index
hsed_getfootyid
�^�u��ID����Footy��ID���擾

%prm
p1, p2
p1 : Footy��ID��������ϐ�
p2 : �^�u��ID

%inst
; ����� ���L��

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTab
	repeat nTab
		hsed_getfootyid idFooty, cnt
		mes str( cnt ) + "�Ԗڂ�Footy��ID��" + idFooty + "�ł��B"
	loop
	stop

%href
hsed_getactfootyid
hsed_gettabid
hsed_getacttabid

%group
���擾����
%index
hsed_gettabid
Footy��ID����^�u��ID���擾

%prm
p1, p2
p1 : �^�u��ID��������ϐ�
p2 : Footy��ID

%inst
; ����� ���L��

%href
hsed_getacttabid
hsed_getfootyid
hsed_getactfootyid

%group
���擾����
%index
hsed_gettabcount
�^�u���̎擾

%prm
p1
p1 : �^�u����������ϐ�

%inst
HSP�X�N���v�g�G�f�B�^�̃G�f�B�^���㕔�ɕ\������Ă���^�u�����擾����p1�ɑ�����܂��B
^
�擾�ɐ��������ꍇ�̓V�X�e���ϐ�stat��0���������܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTab
	if ( stat == 0 ) : mes "HSP�X�N���v�g�G�f�B�^�̃^�u����" + nTab + "�ł��B"

%group
���擾����
%index
hsed_getactfootyid
�A�N�e�B�u��Footy��ID�̎擾

%prm
p1
p1 : Footy��ID��������ϐ�

%inst
HSP�X�N���v�g�G�f�B�^�̃A�N�e�B�u�ȃ^�u�ɕ\������Ă���Footy��ID���擾����p1�ɑ�����܂��B
^
�擾�ɐ��������ꍇ�̓V�X�e���ϐ�stat��0���������܂��B
^
�擾�Ɏ��s�����ꍇ�̓V�X�e���ϐ�stat��1���������Ap1��-1���������܂��B

%sample
#include "hsedsdk.as"
	hsed_getactfootyid idFooty
	if ( stat == 0 ) : mes "�A�N�e�B�u��Footy��ID��" + idFooty + "�ł��B"

%href
hsed_getacttabid
hsed_gettabid
hsed_getfootyid

%group
���擾����

%index
hsed_getacttabid
�A�N�e�B�u�ȃ^�u��ID�̎擾

%prm
p1
p1 : �^�u��ID��������ϐ�

%inst
HSP�X�N���v�g�G�f�B�^�̃A�N�e�B�u�ȃ^�u��ID���擾����p1�ɑ�����܂��B
^
�擾�ɐ��������ꍇ�̓V�X�e���ϐ�stat��0���������܂��B
^
�擾�Ɏ��s�����ꍇ�̓V�X�e���ϐ�stat��1���������Ap1��-1���������܂��B

%sample
#include "hsedsdk.as"
	hsed_getactfootyid idTab
	if ( stat == 0 ) : mes "�A�N�e�B�u�ȃ^�u��ID��" + idTab + "�ł��B"

%href
hsed_getactfootyid
hsed_getfootyid
hsed_gettabid

%group
���擾����

%index
hsed_getpath
�^�uID����t�@�C���p�X���擾

%prm
p1, p2
p1 : �t�@�C���p�X��������ϐ�
p2 : �^�u��ID

%inst
HSP�X�N���v�g�G�f�B�^�ŊJ���Ă���t�@�C���̃p�X�����擾���Ap1�ɑ�����܂��B
^
�擾�ɐ��������ꍇ�̓V�X�e���ϐ�stat��0���������܂��B

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
		dialog "HSP�G�f�B�^��������܂���B", 1
		end
	}
	repeat nTabs
		hsed_getpath path, cnt
		if stat == 0 {
			mes "ID" + cnt + "�̃^�u�̃t�@�C���p�X��\""+path+"\"�ł��B"
		}
	loop
	stop

%group
���擾����
