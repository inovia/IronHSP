;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.51
%note
hspinet.as���C���N���[�h���邱�ƁB

%date
2017/09/13
%author
onitama
%dll
hspinet
%url
http://hsp.tv/
%port
Win


%index
netinit
�l�b�g�ڑ��̏�����
%group
�g�����o�͐��䖽��
%inst
Wininet.dll�̏��������s�Ȃ��܂��B
net�`�Ŏn�܂閽�߂��g�p����ۂɂ́A�ŏ��ɂP�񂾂��K�����s����K�v������܂��B
���s��Ɍ��ʂ��V�X�e���ϐ�stat�Ɋi�[����܂��B
0�Ȃ�ΐ���I���A����ȊO�̓G���[�������������Ƃ������Ă��܂��B
%href
netterm



%index
netterm
�l�b�g�ڑ��̏I��
%group
�g�����o�͐��䖽��
%inst
Wininet.dll�̏I���������s�Ȃ��܂��B
�ʏ�A���̖��߂̓v���O�����I�����Ɏ����I�ɌĂяo����邽�߁A���ɃX�N���v�g�ɋL�q����K�v�͂���܂���B
%href
netinit



%index
netexec
�ŏ��P�ʂ̏��������s
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �����̌��ʂ���������ϐ�

%inst
�ŏ��P�ʂ̏��������s���܂��B
�T�[�o�[����̉����҂���A�_�E�����[�h���Ȃǎ��Ԃ̂����鏈�����ׂ����P�ʂŎ��s���܂��B
���C���v���O�����ł́Aawait���߂Ȃǂōׂ����҂�����(�E�F�C�g)�����Ȃ���netexec���߂��Ăяo���K�v������܂��B
^p
��:
	;	���ʑ҂��̂��߂̃��[�v
	repeat
	netexec res
	if res : break
	await 50
	loop
^p
���s��A���ʂ�p1�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
���e��0�̏ꍇ�́A�������p�����ł��邱�Ƃ��Ӗ����܂��B
���e��1�̏ꍇ�́A����������ɏI�����Ă��邱�Ƃ��Ӗ����܂��B
���e���}�C�i�X�l�̏ꍇ�́A���炩�̃G���[�������������Ƃ������Ă��܂��B
stat��0�ȊO�̒l�ɂȂ����ꍇ�́A����ɉ�����������K�X�X�N���v�g���ŏ�������悤�ɂ��Ă��������B

%href
netmode
netsize



%index
netmode
���[�h�̎擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : ���[�h�l����������ϐ�

%inst
���݂̏������[�h���擾���܂��B
p1�Ŏw�肳�ꂽ�ϐ��Ƀ��[�h�l���������܂��B
���[�h�l�̓��e�͈ȉ��̒ʂ�ł��B
http���N�G�X�g�́AINET_MODE_READY�̏�ԂŔ��s����悤�ɂ��Ă��������B
ftp���N�G�X�g�́AINET_MODE_FTPREADY�̏�ԂŔ��s����悤�ɂ��Ă��������B
^p
���x��             | �l    ���
------------------------------------------------------
INET_MODE_NONE     |  0    ���������̏��
INET_MODE_READY    |  1    �ҋ@���
INET_MODE_REQUEST  |  2    http���N�G�X�g��t
INET_MODE_REQSEND  |  3    http���N�G�X�g���M��
INET_MODE_DATAWAIT |  4    http�f�[�^��M��
INET_MODE_DATAEND  |  5    http�f�[�^��M�I��������
INET_MODE_INFOREQ  |  6    http��񃊃N�G�X�g���M��
INET_MODE_INFORECV |  7    http���f�[�^��M��
INET_MODE_FTPREADY |  8    ftp�ҋ@���
INET_MODE_FTPDIR   |  9    ftp�f�B���N�g�����擾��
INET_MODE_FTPREAD  |  10   ftp�t�@�C����M��
INET_MODE_FTPWRITE |  11   ftp�t�@�C�����M��
INET_MODE_FTPCMD   |  12   ftp�R�}���h���M�I��������
INET_MODE_FTPRESULT|  13   ftp�T�[�o�[�ԐM�f�[�^��M��
INET_MODE_ERROR    |  14   �G���[���
^p

%href
netexec



%index
neterror
�l�b�g�G���[������̎擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �G���[�����񂪑�������ϐ�

%inst
�G���[�������̏ڍׂ�������������擾���܂��B
p1�Ŏw�肵���ϐ��ɁA������Ƃ��đ������܂��B



%index
neturl
URL�̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"URL"
"URL" : URL������������

%inst
http���N�G�X�g���s�Ȃ�URL��ݒ肵�܂��B
URL�́A�t�@�C�������������`�ŃX�L�[�������܂߂Đݒ肷��K�v������܂��B
�uhttp://www.onionsoft.net/hsp/index.html�v�̏ꍇ�́A�uhttp://www.onionsoft.net/hsp/�v�܂ł�ݒ肵�Ă��������B
http���N�G�X�g�͕K���Aneturl���߂ɂ��URL�ݒ���ɍs�Ȃ��Ă����Ă��������Bneturl���ߎ��s�̎��_�ł́A�܂�http���N�G�X�g�͔��s����܂���B
http���N�G�X�g�̔��s�́Anetrequest���߂܂���netload���߂ɂ���čs�Ȃ��܂��B
SSL�ڑ��ɂ�郊�N�G�X�g���s�Ȃ��ꍇ�ɂ́A�uhttps://�v����n�܂�URL���w�肵�Ă��������B
%href
netrequest
netload
netfileinfo



%index
netrequest
http���N�G�X�g���s
%group
�g�����o�͐��䖽��
%prm
"FileName"
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����

%inst
http���N�G�X�g���s�Ȃ��܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
netrequest���߂�http���N�G�X�g�𔭍s������́Anetexec���߂ɂ���M�������X�N���v�g���ōs�Ȃ��K�v������܂��B
��M�����������ōs�Ȃ����߂�netload���߂��ʓr�p�ӂ���Ă��܂��B
%href
neturl
netload
netfileinfo



%index
netload
http�t�@�C���擾
%group
�g�����o�͐��䖽��
%prm
"FileName"
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����

%inst
http���N�G�X�g���s�Ȃ��܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
netload���߂́A�t�@�C���̎擾���I������܂ŁA�����𒆒f���܂��B
��y�Ƀt�@�C���̎擾���s�Ȃ����Ƃ��\�ł����A�傫�ȃt�@�C�����M��Ԃ̈����ꍇ�Ȃǂ́A���̂܂܉�ʂ���~�����܂܂ɂȂ�\��������̂Œ��ӂ��Ă��������B
�t�@�C���̎�M���ɁA���s���ĕʂȏ������s�Ȃ������ꍇ�ɂ́Anetrequest���߂��g�p����http���N�G�X�g���s�Ȃ��Ă��������B
%href
neturl
netrequest
netfileinfo



%index
netfileinfo
http�t�@�C�����擾
%group
�g�����o�͐��䖽��
%prm
p1,"FileName"
p1         : �t�@�C����񂪑�������ϐ���
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����

%inst
http�T�[�o�[��ɂ���t�@�C�������擾���܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
�擾�ɐ�������ƁA�V�X�e���ϐ�stat�̒l��0�ƂȂ�Ap1�Ŏw�肵���ϐ��ɕ�����^�ŃT�[�o�[���Ԃ�����񕶎��񂪑������܂��B
�擾�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO���������܂��B
�T�[�o�[���Ԃ����̎�ނ́Ahttp�T�[�o�[�ɂ���ĈقȂ�܂��B
�ڂ����́ARFC�Ȃ�http�v���g�R���̉�����Q�Ƃ��Ă��������B
netfileinfo���߂́A�t�@�C���̎擾���I������܂ŁA�����𒆒f���܂��B
%href
neturl
netload



%index
netdlname
�_�E�����[�h���̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"FileName"
"FileName" : �_�E�����[�h���ꂽ���̃t�@�C����

%inst
�t�@�C�����擾����ۂ̃t�@�C������ݒ肵�܂��B
netdlname���߂ɂ���ăt�@�C������ݒ肵�Ă��Ȃ��ꍇ�́Ahttp���N�G�X�g���s�Ȃ����t�@�C�������g�p����܂��B
netdlname���߂ɁA��̕�����("")���w�肵���ꍇ���Ahttp���N�G�X�g���s�Ȃ����t�@�C�������g�p����܂��B
%href
netrequest
netload



%index
netproxy
�v���L�V�̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"ServerName",p1,p2
"ServerName" : ���N�G�X�g���s�Ȃ��t�@�C����
p1 (0)       : �|�[�g�ԍ�
p2 (0)       : ���[�J���ڑ��t���O

%inst
http�ڑ��̍ۂɎg�p�����v���L�V(�㗝)�T�[�o�[��ݒ肵�܂��B
"ServerName"�ŁA�v���L�V�T�[�o�[����ݒ肵�܂��B
��̕�����("")���w�肵���ꍇ�ɂ́A�v���L�V�͐ݒ肳��܂���B
p1��http���g�p����v���L�V�T�[�o�[�̃|�[�g�ԍ����w�肵�܂��B
p2�ŁA���[�J���A�h���X���v���L�V�o�R�̃A�N�Z�X���珜�O���邩�ǂ�����ݒ肵�܂��B1�̏ꍇ�́A���[�J���A�h���X�̂݃v���L�V���珜�O����܂��B0�̏ꍇ�́A���[�J���A�h���X���܂߂ăv���L�V���g�p���܂��B
netproxy���߂����s�����ƁA����܂ł̃Z�b�V��������������Aneturl���߂�Anetheader���߂ɂ��ݒ�̓��Z�b�g����܂��B
^p
	��:
	netinit
	if stat : dialog "�l�b�g�ڑ��ł��܂���B" : end
	netproxy "proxy_server",8080,1
	neturl "http://www.onionsoft.net/hsp/"
	netload "index.html"
^p
%href
netagent
netheader



%index
netagent
�G�[�W�F���g�̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"AgentName"
"AgentName" : �ݒ肷��G�[�W�F���g��

%inst
http�ڑ��̍ۂɃT�[�o�[�ɓn�����G�[�W�F���g���̕������ݒ肵�܂��B"AgentName"�Ŏw�肵���G�[�W�F���g�����ݒ肳��܂��B
��̕�����("")���w�肵���ꍇ�ɂ́A�f�t�H���g�̐ݒ�ɂȂ�܂��B
netagent���߂����s�����ƁA����܂ł̃Z�b�V��������������Aneturl���߂�Anetheader���߂ɂ��ݒ�̓��Z�b�g����܂��B
%href
netproxy
netheader



%index
netheader
�w�b�_������̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"HeaderString"
"HeaderString" : �w�b�_�ɒǉ�����镶����

%inst
http�ڑ��̍ۂɃT�[�o�[�ɓn�����w�b�_�������ݒ肵�܂��B
��̕�����("")���w�肵���ꍇ�ɂ́A���ݒ�ɂȂ�܂��B
�w�b�_������́A�ʏ�ݒ肷��K�v����܂��񂪁A������̕t�����⓮��ݒ���s�Ȃ��ꍇ�Ɏg�p���邱�Ƃ��ł��܂��B
netheader���߂Őݒ肵���w�b�_������́A����ȍ~�̃��N�G�X�g���ׂĂɓK�p����܂��B
^p
	��:
	; ���t�@���[��ǉ�����
	netheader "Referer:http://www.onionsoft.net/\n\n"
^p
%href
netagent



%index
netsize
�t�@�C����M�T�C�Y�̎擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �t�@�C����M�T�C�Y����������ϐ�

%inst
netrequest���߂Ŕ��s���ꂽhttp���N�G�X�g�ɑ΂���t�@�C�����ǂꂾ���̃T�C�Y����M���������擾���܂��B
p1�Ŏw�肳�ꂽ�ϐ��Ƀt�@�C����M�T�C�Y���������܂��B
�t�@�C����M�T�C�Y�́Anetexec���߂Ŏ�M���s�Ȃ�ꂽ���e�𒲂ׂ邽�߂̂��̂ł��B���炩���߁A�t�@�C�����擾�Ńt�@�C���T�C�Y�𒲂ׂĂ����΁A�i�s�̊������v�邱�Ƃ��\�ł��B
%href
netexec



%index
filecrc
�t�@�C����CRC32���擾
%group
�g�����o�͐��䖽��
%prm
p1,"FileName"
p1         : CRC�l����������ϐ���
"FileName" : CRC�`�F�b�N���s�Ȃ��t�@�C����

%inst
�w�肳�ꂽ�t�@�C����CRC32�����߂�p1�̕ϐ��ɑ�����܂��B
CRC32�́A�t�@�C���̓��e�����ƂɎZ�o���ꂽ32bit�̐��l�ł��B
�t�@�C�����e�̃`�F�b�N�ȂǂɎg�p���邱�Ƃ��ł��܂��B
%href
filemd5



%index
filemd5
�t�@�C����MD5���擾
%group
�g�����o�͐��䖽��
%prm
p1,"FileName"
p1         : MD5�l����������ϐ���
"FileName" : MD5�`�F�b�N���s�Ȃ��t�@�C����

%inst
�w�肳�ꂽ�t�@�C����MD5�����߂�p1�̕ϐ��ɑ�����܂��B
MD5�l�́A������^�Łuf96b697d7cb7938d525a2f31aaf161d0�v�̂悤��32������16�i���Ƃ��ĕ\������܂��B
MD5�l�́A�t�@�C���̓��e����ӂɕ\�킷�n�b�V���l�Ƃ��Ďg�p���邱�Ƃ��ł��܂��B�ڂ����́AMD5�ɂ��Ă̎����Ȃǂ��Q�Ƃ��Ă��������B
�t�@�C�����e�̃`�F�b�N�ȂǂɎg�p���邱�Ƃ��ł��܂��B
%href
varmd5
filecrc



%index
ftpopen
FTP�Z�b�V�����̊J�n
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3,p4,p5
p1 : ftp�T�[�o�[�A�h���X(������)
p2 : ftp���O�C�����[�U�[��(������)
p3 : ftp���O�C�����[�U�[�p�X���[�h(������)
p4 : �|�[�g�ԍ�(�ȗ��\)
p5 : PASSIVE���[�h�t���O(�ȗ��\)

%inst
ftp�T�[�o�[�ɐڑ����ăZ�b�V�������J�n���܂��B
p1�ɃT�[�o�[�̃A�h���X�Ap2�Ƀ��[�U�[���Ap3�Ƀp�X���[�h���w�肵��ftp�ɐڑ����܂��B
p4�p�����[�^�[�Ń|�[�g�ԍ����w�肷�邱�Ƃ��ł��܂��B
p4�̎w����ȗ������ꍇ�́A�W���̃|�[�g�ԍ����g�p����܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
p5�p�����[�^�[�Őڑ�����PASSIVE���[�h�t���O��ݒ肷�邱�Ƃ��ł��܂��B
p5��1��ݒ肵���ꍇ�́APASSIVE���[�h��ftp�ڑ����s�Ȃ��܂��B0�܂��͏ȗ������ꍇ�́A�ʏ��ftp�ڑ��ƂȂ�܂��B
^
���炩���߁Anetinit���߂ɂ���ď��������s�Ȃ��K�v������܂��B
ftp�Z�b�V�������J�n������́Aftp�֘A���߂̂ݎg�p���邱�Ƃ��ł��܂��Bhttp�ȂǑ��̃l�b�g������s�Ȃ��ꍇ�ɂ́A�K��ftpclose���߂ɂ��ftp�Z�b�V�������I��������悤�ɂ��Ă��������B

%href
ftpclose


%index
ftpclose
FTP�Z�b�V�����̏I��
%group
�g�����o�͐��䖽��

%inst
ftpopen���߂ŊJ�n���ꂽ�Z�b�V�������I�������܂��B

%href
ftpopen


%index
ftpresult
FTP�������ʕ�����̎擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : FTP�������ʕ����񂪑�������ϐ�

%inst
ftp�֘A���߂ɂ�鏈���ɑ΂���T�[�o�[�̕ԐM���b�Z�[�W��
�擾���āAp1�Ɏw�肳�ꂽ�ϐ��ɑ�����܂��B
p1�̕ϐ��ɂ́A������f�[�^�Ƃ��đ������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen


%index
ftpdir
FTP�f�B���N�g���ړ�
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1 : ���݂̃f�B���N�g���ʒu����������ϐ�
p2 : �ړ���̃f�B���N�g����(������)

%inst
p1�Ŏw�肵���ϐ��ɁAftp�T�[�o�[��̃J�����g�f�B���N�g�����𕶎���f�[�^�Ƃ��đ�����܂��B
p2�Ƀf�B���N�g�������w�肵���ꍇ�ɂ́A���̏ꏊ�ֈړ����s�Ȃ��܂��B
p2�̎w����ȗ������ꍇ�ɂ́A�f�B���N�g���ړ��͍s�Ȃ��܂���B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen


%index
ftpdirlist
FTP�f�B���N�g�����X�g�擾1
%group
�g�����o�͐��䖽��

%inst
ftp�T�[�o�[��̃J�����g�f�B���N�g���ɂ���t�@�C�����X�g���擾���邽�߂̃��N�G�X�g���s�Ȃ��܂��B
���ۂ̃t�@�C�����X�g�́Aftpdirlist2���߂ōs�Ȃ��܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpdirlist2


%index
ftpdirlist2
FTP�f�B���N�g�����X�g�擾2
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �t�@�C�����X�g����������ϐ�

%inst
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Aftpdirlist���߂ɂ��t�@�C�����X�g�擾���I��������Ŏg�p���Ă��������B
�ȉ��́A�t�@�C�����X�g�擾����܂ł̗�ł��B
^p
��:
	;	���ʑ҂��̂��߂̃��[�v
	ftpdirlist
	repeat
	netexec mode
	if res : break
	await 50
	loop
	ftpdirlist2 res
^p
�t�@�C�����X�g�擾�́Aftpdirlist���߂ɂ�郊�N�G�X�g�Anetexec���߂ɂ���M�҂��Aftpdirlist2���߂ɂ�錋�ʂ̎擾�Ƃ����R�̎菇�ɕ����čs�Ȃ��K�v������܂��B
p1�ɑ�������t�@�C�����X�g�́A�P�s������P�G���g�����Ƃɋ�؂��Ă��镡���s������f�[�^�ɂȂ�܂��B
�P�s�́A�u"�t�@�C����"�v�A�t�@�C���T�C�Y�A�X�V�����̏��ԂɁu,�v�ŋ�؂�ꂽ�`�ɂȂ�܂��B

%href
ftpopen
ftpdirlist
netexec


%index
ftpcmd
FTP�R�}���h�̎��s
%group
�g�����o�͐��䖽��
%prm
p1
p1 : ���s����FTP�R�}���h������

%inst
p1�Ŏw�肳�ꂽFTP�R�}���h�����s���܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen


%index
ftprmdir
FTP�f�B���N�g���̍폜
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �폜����f�B���N�g��������������

%inst
p1�Ŏw�肳�ꂽ�f�B���N�g�����폜���܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A
���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpmkdir


%index
ftpmkdir
FTP�f�B���N�g���̍쐬
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �쐬����f�B���N�g��������������

%inst
p1�Ŏw�肳�ꂽ�f�B���N�g�����쐬���܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftprmdir


%index
ftpget
FTP�t�@�C���擾
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1     : �T�[�o�[�ォ��擾����t�@�C����(������)
p2("") : ���[�J���ɍ쐬�����t�@�C����(������)
p3(0)  : �]�����[�h(0=�o�C�i��/1=�A�X�L�[)

%inst
ftp�T�[�o�[��̃t�@�C�����擾���܂��B
p1�ŃT�[�o�[��̃t�@�C�������w�肵�܂��B
p2�Ń_�E�����[�h���č쐬�����t�@�C�������w�肵�܂��B
p2�̎w����ȗ��܂���""�ɂ����ꍇ�́Ap1�Ɠ������O���g�p����܂��B
p3�œ]�����[�h���w�肵�܂��B�]�����[�h���ȗ��܂���0�Ɏw�肵���ꍇ�̓o�C�i���f�[�^�Ƃ��āA1�Ɏw�肵���ꍇ�́A�A�X�L�[�f�[�^�Ƃ��ē]�����s�Ȃ��܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpput


%index
ftpput
FTP�t�@�C�����M
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1     : �T�[�o�[��ɍ쐬����t�@�C����(������)
p2("") : ���[�J�����瑗�M�����t�@�C����(������)
p3(0)  : �]�����[�h(0=�o�C�i��/1=�A�X�L�[)

%inst
ftp�T�[�o�[��Ƀt�@�C���𑗐M���܂��B
p1�ŃT�[�o�[��ɍ쐬����t�@�C�������w�肵�܂��B
p2�Ń��[�J�����瑗�M�����t�@�C�������w�肵�܂��B
p2�̎w����ȗ��܂���""�ɂ����ꍇ�́Ap1�Ɠ������O���g�p����܂��B
p3�œ]�����[�h���w�肵�܂��B�]�����[�h���ȗ��܂���0�Ɏw�肵���ꍇ�̓o�C�i���f�[�^�Ƃ��āA1�Ɏw�肵���ꍇ�́A�A�X�L�[�f�[�^�Ƃ��ē]�����s�Ȃ��܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpget


%index
ftprename
FTP�t�@�C�����O�ύX
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1 : �ύX���̃t�@�C����(������)
p2 : �V�����t�@�C����(������)

%inst
ftp�T�[�o�[��̃t�@�C������ύX���܂��B
p1�ŕύX���̃t�@�C�������Ap2�ŐV�����t�@�C�������w�肵�܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpdelete


%index
ftpdelete
FTP�t�@�C���폜
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �폜����t�@�C����(������)

%inst
ftp�T�[�o�[��̃t�@�C�����폜���܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftprename


%index
netrequest_get
http���N�G�X�g���s(GET)
%group
�g�����o�͐��䖽��
%prm
"FileName"
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����

%inst
http���N�G�X�g���s�Ȃ��܂��B
netrequest���߂Ɠ��l�ł����A�_�E�����[�h�����f�[�^�C���[�W���t�@�C���ł͂Ȃ��A��������̃f�[�^�Ƃ��Ď擾�ł��܂��B
^
"FileName"�ŁA���N�G�X�g���s�Ȃ��t�@�C�������w�肵�܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
^
netrequest���߂�http���N�G�X�g�𔭍s������́Anetexec���߂ɂ���M������
�X�N���v�g���ōs�Ȃ��K�v������܂��B
����������������́Anetgetv���߂܂���netgetv_data���߂ɂ��C�ӂ̕ϐ��Ńf�[�^���󂯎�邱�Ƃ��ł��܂��B
POST�`����CGI�Ƀf�[�^�����N�G�X�g����ꍇ�́Anetrequest_post���߂��g�p���Ă��������B

%href
netgetv
netgetv_data
netgetv_size
netrequest
netrequest_post
netrequest_put
netrequest_delete
neturl


%index
netrequest_post
http���N�G�X�g���s(POST)
%group
�g�����o�͐��䖽��
%prm
"FileName",p1
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����
p1         : POST�p�̃f�[�^���i�[����������^�ϐ���

%inst
http���N�G�X�g���s�Ȃ��܂��B
netrequest���߂Ɠ��l�ł����A�_�E�����[�h�����f�[�^�C���[�W���t�@�C���ł͂Ȃ��A��������̃f�[�^�Ƃ��Ď擾�ł��܂��B
�܂��APOST�`���ɂ��CGI�p�����[�^�[�󂯓n���ɑΉ����Ă��܂��B
^
"FileName"�ŁA���N�G�X�g���s�Ȃ��t�@�C�������w�肵�܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
p1�ɁAPOST�p�̃f�[�^���i�[�����ϐ������w�肵�܂��B
���炩���߁A�ϐ��͕�����^��POST�`���̃f�[�^���i�[���Ă����K�v������܂��B
POST�`���̃f�[�^�́AGET�`����URL�Ŏw�肳���u&�v�ŋ�؂�ꂽ�p�����[�^�[�Ɠ��l�̂��̂ɂȂ�܂��B
�������A�o�C�i���f�[�^�𑗕t����ꍇ�́A�f�[�^�𕶎���ɃG���R�[�h����K�v������܂��B
netrequest_post���߂́A�n���ꂽ����������̂܂�POST�f�[�^�Ƃ��Ĕ��s���邽�߁A���̃G���R�[�h�͎��O�ɍs�Ȃ��Ă����Ă��������B
^p
��:
;	URL���w��
neturl "http://www.onionsoft.net/hsp/beta/"

;	POST�`����CGI�Ƀp�����[�^�[��n��
prm = "mode=find&cond=and&log=0&word=script"
netrequest_post "betabbs.cgi",prm
^p
netrequest���߂�http���N�G�X�g�𔭍s������́Anetexec���߂ɂ���M�������X�N���v�g���ōs�Ȃ��K�v������܂��B
����������������́Anetgetv���߂܂���netgetv_data���߂ɂ��C�ӂ̕ϐ��Ńf�[�^���󂯎�邱�Ƃ��ł��܂��B
GET�`����CGI�Ƀf�[�^�����N�G�X�g����ꍇ�́Anetrequest_get���߂��g�p���Ă��������B

%href
netgetv
netgetv_data
netgetv_size
netrequest
netrequest_get
netrequest_put
netrequest_delete
neturl


%index
netrequest_delete
http���N�G�X�g���s(DELETE)
%group
�g�����o�͐��䖽��
%prm
"FileName"
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����

%inst
http���N�G�X�g���s�Ȃ��܂��B
netrequest_delete���߂ɂ��ADELETE���N�G�X�g�𑗐M���A�w�肳�ꂽ���\�[�X(�t�@�C����)���폜���܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
^
netrequest���߂�http���N�G�X�g�𔭍s������́Anetexec���߂ɂ���M������
�X�N���v�g���ōs�Ȃ��K�v������܂��B
����������������́Anetgetv���߂܂���netgetv_data���߂ɂ��C�ӂ̕ϐ��Ńf�[�^���󂯎�邱�Ƃ��ł��܂��B

%href
netgetv
netgetv_data
netgetv_size
netrequest
netrequest_put
netrequest_get
neturl


%index
netrequest_put
http���N�G�X�g���s(PUT)
%group
�g�����o�͐��䖽��
%prm
"FileName",p1
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����
p1         : PUT�p�̃f�[�^���i�[����������^�ϐ���

%inst
http���N�G�X�g���s�Ȃ��܂��B
netrequest_put���߂ɂ��APUT���N�G�X�g�𑗐M���A�w�肳�ꂽ���\�[�X�̍X�V���s�����Ƃ��ł��܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
�p�����[�^�[�̏��́Anetrequest_post���߂Ɠ��l�ɁAPOST�`���ɂ��CGI�p�����[�^�[�󂯓n���ɑΉ����Ă��܂��B
^
"FileName"�ŁA���N�G�X�g���s�Ȃ��t�@�C�������w�肵�܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
p1�ɁAPOST�p�̃f�[�^���i�[�����ϐ������w�肵�܂��B
���炩���߁A�ϐ��͕�����^��POST�`���̃f�[�^���i�[���Ă����K�v������܂��B
POST�`���̃f�[�^�́AGET�`����URL�Ŏw�肳���u&�v�ŋ�؂�ꂽ�p�����[�^�[�Ɠ��l�̂��̂ɂȂ�܂��B
^
netrequest���߂�http���N�G�X�g�𔭍s������́Anetexec���߂ɂ���M�������X�N���v�g���ōs�Ȃ��K�v������܂��B
����������������́Anetgetv���߂܂���netgetv_data���߂ɂ��C�ӂ̕ϐ��Ńf�[�^���󂯎�邱�Ƃ��ł��܂��B
GET�`����CGI�Ƀf�[�^�����N�G�X�g����ꍇ�́Anetrequest_get���߂��g�p���Ă��������B

%href
netgetv
netgetv_data
netgetv_size
netrequest
netrequest_get
netrequest_post
netrequest_delete
neturl


%index
netgetv
http���N�G�X�g�̌��ʂ��擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �f�[�^����������ϐ�

%inst
netrequest_get�Anetrequest_post���߂ɂ��http���N�G�X�g�̌��ʂ��擾���܂��B
�K���Anetexec���߂ɂ���M�����ŁA�_�E�����[�h�������������Ƃ��m�F���Ă���A�f�[�^���擾����悤�ɂ��Ă��������B
p1�Ŏw�肳�ꂽ�ϐ��́A�����I�ɕK�v�ȃT�C�Y���m�ۂ���������^�Ƃ��ď���������܂��B
(���炩���ߕϐ���������������A���������m�ۂ��Ă����K�v�͂���܂���B)
�擾�����f�[�^�̓e�L�X�g(������)�Ƃ��ď�������܂��B����ȊO�̃f�[�^(�o�C�i��)���擾����ꍇ�́Anetgetv_data���߂��g�p���Ă��������B
���ߎ��s��ɁA�V�X�e���ϐ�stat�Ƀf�[�^�T�C�Y���������܂��B

%href
netgetv_data
netgetv_size
netrequest_get
netrequest_post
netrequest_put
netrequest_delete



%index
varmd5
�ϐ��o�b�t�@��MD5���擾
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1    : MD5�l����������ϐ���
p2    : �Q�Ƃ����ϐ���
p3(0) : �o�b�t�@�T�C�Y

%inst
�w�肳�ꂽ�ϐ��o�b�t�@�̓��e����MD5�����߂�p1�̕ϐ��ɑ�����܂��B
MD5�l�́A������^�Łuf96b697d7cb7938d525a2f31aaf161d0�v�̂悤��32������16�i���Ƃ��ĕ\������܂��B
MD5�l�́A�������̓��e����ӂɕ\�킷�n�b�V���l�Ƃ��Ďg�p���邱�Ƃ��ł��܂��B�ڂ����́AMD5�ɂ��Ă̎����Ȃǂ��Q�Ƃ��Ă��������B
�t�@�C���̓��e����MD5�����߂�ꍇ�́Afilemd5���߂��g�p���Ă��������B
%href
filemd5


%index
b64encode
BASE64�G���R�[�h
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1     : BASE64�ϊ����ꂽ�����񂪑�������ϐ���
p2     : �ϊ����f�[�^�����ϐ���
p3(-1) : �o�b�t�@�T�C�Y

%inst
p2�Ŏw�肳�ꂽ�ϐ��o�b�t�@�̓��e��BASE64�G���R�[�h(�ϊ�)����p1�̕ϐ��ɑ�����܂��B
p3�̒l���ȗ��܂��̓}�C�i�X�l�ɂ����ꍇ�́Ap2�Ɋ܂܂��f�[�^�𕶎���Ƃ��Ď����I�ɃT�C�Y�����肳��܂��B
BASE64�́A������^�Ƃ��Ċi�[����܂��B�o�C�i���f�[�^�Ȃǂ��ꎞ�I�ɕ�����ɕϊ�����ꍇ�ȂǂɎg�p����܂��B
BASE64�`���̕���������Ƃ̃f�[�^�Ƀf�R�[�h(�߂�)�ꍇ�́Ab64decode���߂��g�p���Ă��������B
%href
b64decode


%index
b64decode
BASE64�f�R�[�h
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1     : �f�R�[�h���ꂽ�f�[�^����������ϐ���
p2     : BASE64�`���̃f�[�^�����ϐ���
p3(-1) : �o�b�t�@�T�C�Y

%inst
p2�Ŏw�肳�ꂽ�ϐ��o�b�t�@�̓��e��BASE64�f�R�[�h����p1�̕ϐ��ɑ�����܂��B
p2�̕ϐ��ɂ́ABASE64�G���R�[�h���ꂽ�����񂪑������Ă���K�v������܂��B
%href
b64encode


%index
rc4encode
RC4�G���R�[�h
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1     : �ϐ���
p2     : �p�X���[�h������
p3(-1) : �o�b�t�@�T�C�Y

%inst
p1�Ŏw�肳�ꂽ�ϐ��o�b�t�@�̓��e��RC4�݊�(ARCFOUR)�A���S���Y���ňÍ������܂��B
�Í����̍ۂɁAp2�Ŏw�肳�ꂽ�p�X���[�h��������L�[�Ƃ��Ďg�p���܂��B
p3�Ńo�b�t�@�T�C�Y���w�肵�܂��Bp3���ȗ��܂��̓}�C�i�X�l�Ƃ����ꍇ�ɂ́A�ϐ��o�b�t�@�̓��e�𕶎���Ƃ��Ď����I�ɃT�C�Y�����肵�܂��B
RC4�Í��ł́A�Í�������O�ƌ�Ńf�[�^�T�C�Y�ɕύX�͂���܂���B
�܂��A�G���R�[�h�ƃf�R�[�h�͓����v���Z�X�ōs���邽�߁A�G���R�[�h���s�����f�[�^�ɑ΂��āA�ēx�����L�[�ňÍ������邱�Ƃł��Ƃ̃f�[�^�ɕ�������܂��B

%href
b64encode
b64decode


%index
urlencode
URL�G���R�[�h
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1     : URL�G���R�[�h���ꂽ�����񂪑�������ϐ���
p2     : �ϊ����f�[�^�����ϐ���

%inst
p2�Ŏw�肳�ꂽ�ϐ��o�b�t�@�̓��e(������)��URL�G���R�[�h(�ϊ�)����p1�̕ϐ��ɑ�����܂��B
p1�Ŏw�肳���ϐ��͎����I�ɕ�����^�Ƃ��ď���������܂��B
URL�G���R�[�h�ŏo�͂���镶�����͍ő��4095�����܂ł̐���������܂��̂Œ��ӂ��Ă��������B
URL�G���R�[�h�`���̕���������Ƃ̃f�[�^�Ƀf�R�[�h(�߂�)�ꍇ�́Aurldecode���߂��g�p���Ă��������B
%href
urldecode


%index
urldecode
URL�f�R�[�h
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1     : �f�R�[�h���ꂽ�f�[�^����������ϐ���
p2     : URL�G���R�[�h�`���̃f�[�^�����ϐ���

%inst
URL�G���R�[�h���ꂽ����������̕�����ɖ߂��܂��B
p2�Ŏw�肳�ꂽ�ϐ��o�b�t�@�̓��e���f�R�[�h����p1�̕ϐ��ɑ�����܂��B
�f�R�[�h�ŏo�͂���镶�����͍ő��4095�����܂ł̐���������܂��̂Œ��ӂ��Ă��������B
%href
urlencode


%index
jsonopen
JSON�`�����J��
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1     : JSON�|�C���^�l����������ϐ���
p2     : JSON�`���̃f�[�^�����ϐ���

%inst
JSON�`���̕������ǂݍ��݁A���e�ɃA�N�Z�X�\�ȏ�Ԃɂ��܂��B
p2�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă��镶�����JSON�`���Ƃ݂Ȃ��āA�f�[�^�̃p�[�X���s�Ȃ��܂��B
�ǂݍ��݌�́Ap1�Ŏw�肳�ꂽ�ϐ���JSON�|�C���^�l���������܂��B
JSON�`�����������߂�JSON�|�C���^�l���w�肷�邱�Ƃɂ��A�e��f�[�^�ɃA�N�Z�X���邱�Ƃ��\�ɂȂ�܂��B
jsonopen���߂Ńf�[�^��ǂݍ��܂�����́A�K���Ō��jsonclose���߂����s���ă��������������K�v������܂��B
%href
jsonclose


%index
jsonclose
JSON�`���̏I������
%group
�g�����o�͐��䖽��

%inst
jsonopen���߂œǂݍ��܂����f�[�^�̃�������������܂��B
%href
jsonopen


%index
jsonout
JSON�`���f�[�^��ϐ��ɏo�͂���
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1     : JSON�`���̃f�[�^����������ϐ���
p2(-1) : JSON�|�C���^�l

%inst
JSON�`���f�[�^��p1�Ŏw�肵���ϐ��ɏo�͂��܂��B
p2�ŏo�͂���JSON�f�[�^�̃|�C���^�l���w�肵�܂��B
p2���ȗ��܂��̓}�C�i�X�l�Ƃ����ꍇ�́Ajsonopen���߂œǂݍ��܂ꂽ�f�[�^���ΏۂɂȂ�܂��B
p1�Ŏw�肳�ꂽ�ϐ��͕�����^�Ƃ��ď���������T�C�Y�������I�Ɋm�ۂ���܂��B

%href
jsonopen


%index
jsongetobj
JSON�I�u�W�F�N�g�𓾂�
%group
�g�����o�͐��䖽��
%prm
p1,"name",p2
p1     : JSON�|�C���^�l����������ϐ���
"name" : �I�u�W�F�N�g���ʖ�
p2(-1) : JSON�|�C���^�l

%inst
"name"�Ŏw�肵�����O�̃I�u�W�F�N�g���擾���Ap1�Ŏw�肵���ϐ���JSON�|�C���^�l�������܂��B
p2�Ō����ΏۂƂȂ�I�u�W�F�N�g(JSON�|�C���^�l)���w�肵�܂��B
p2���ȗ��܂��̓}�C�i�X�l�ɂ����jsonopen���߂œǂݍ��܂����f�[�^�̃��[�g�K�w���g�p����܂��B
�w�肳�ꂽ���O�����݂��Ȃ������ꍇ��JSON�|�C���^�l�Ƃ���0���������܂��B
p2�ɋ�(NULL)��JSON�|�C���^�l���w�肵���ꍇ�́A�V�X�e���ϐ�stat��1�ɂȂ���s�͍s�Ȃ��܂���B
%href
jsonnext


%index
jsonnext
����JSON�I�u�W�F�N�g�𓾂�
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1     : JSON�|�C���^�l����������ϐ���
p2(-1) : JSON�|�C���^�l
p3(0)  : �擾�I�v�V����

%inst
p2�Ŏw�肳�ꂽJSON�I�u�W�F�N�g(JSON�|�C���^�l)�Ɋ֘A����l���擾���Ap1�Ŏw�肵���ϐ��ɑ�����܂��B
�擾�����l�́Ap3�̎擾�I�v�V�����ɂ���ĕς��܂��Bp3�͈ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
�擾�I�v�V����   ���e
--------------------------------------------
  0              ���̃I�u�W�F�N�g(next)
  1              �O�̃I�u�W�F�N�g(prev)
  2              �q�K�w�̃I�u�W�F�N�g(child)
  3              �I�u�W�F�N�g��type�l
^p
jsonnext���߂ɂ��A�����K�w�ɂ���I�u�W�F�N�g��A�q�K�w(�z��)���̃I�u�W�F�N�g�𓾂邱�Ƃ��ł��܂��B
p2���ȗ��܂��̓}�C�i�X�l�ɂ����jsonopen���߂œǂݍ��܂����f�[�^�̃��[�g�K�w���g�p����܂��B
�w�肳�ꂽJSON�I�u�W�F�N�g�����݂��Ȃ������ꍇ��JSON�|�C���^�l�Ƃ���0���������܂��B
p2�ɋ�(NULL)��JSON�|�C���^�l���w�肵���ꍇ�́A�V�X�e���ϐ�stat��1�ɂȂ���s�͍s�Ȃ��܂���B
%href
jsongetobj


%index
jsongets
JSON�I�u�W�F�N�g���當����𓾂�
%group
�g�����o�͐��䖽��
%prm
p1,"name",p2
p1     : �擾���ꂽ�����񂪑�������ϐ���
"name" : �I�u�W�F�N�g���ʖ�
p2(-1) : JSON�|�C���^�l

%inst
�I�u�W�F�N�g�ɋL�^���ꂽ��������擾���Ap1�Ŏw�肵���ϐ��ɑ�����܂��B
p2�őΏۂƂȂ�I�u�W�F�N�g(JSON�|�C���^�l)���w�肵�܂��B
"name"���ȗ��܂��͒��g�̂Ȃ�������("")�Ɏw�肵���ꍇ�́Ap2�Ŏw�肳�ꂽ�I�u�W�F�N�g���̂��̂ɋL�^����Ă��镶������擾���܂��B
"name"�Ŗ��O���w�肵���ꍇ�Ap2�Ŏw�肳�ꂽ�I�u�W�F�N�g�Ɠ��K�w�ɂ���I�u�W�F�N�g���瓯�����O�����I�u�W�F�N�g���������A�l���擾���܂��B
�w�肳�ꂽ���O�����݂��Ȃ��ꍇ�́Ap1�ɑ���͍s�Ȃ�ꂸ�ɃV�X�e���ϐ�stat��1�������ďI�����܂��B
p2���ȗ��܂��̓}�C�i�X�l�ɂ����jsonopen���߂œǂݍ��܂����f�[�^�̃��[�g�K�w���g�p����܂��B
p2�ɋ�(NULL)��JSON�|�C���^�l���w�肵���ꍇ�́A�V�X�e���ϐ�stat��1�ɂȂ���s�͍s�Ȃ��܂���B
%href
jsongeti
jsonnkf


%index
jsongeti
JSON�I�u�W�F�N�g���琮���l�𓾂�
%group
�g�����o�͐��䖽��
%prm
p1,"name",p2
p1     : �擾���ꂽ�����l����������ϐ���
"name" : �I�u�W�F�N�g���ʖ�
p2(-1) : JSON�|�C���^�l

%inst
�I�u�W�F�N�g�ɋL�^���ꂽ�����l���擾���Ap1�Ŏw�肵���ϐ��ɑ�����܂��B
p2�őΏۂƂȂ�I�u�W�F�N�g(JSON�|�C���^�l)���w�肵�܂��B
"name"���ȗ��܂��͒��g�̂Ȃ�������("")�Ɏw�肵���ꍇ�́Ap2�Ŏw�肳�ꂽ�I�u�W�F�N�g���̂��̂ɋL�^����Ă��鐮���l���擾���܂��B
"name"�Ŗ��O���w�肵���ꍇ�Ap2�Ŏw�肳�ꂽ�I�u�W�F�N�g�Ɠ��K�w�ɂ���I�u�W�F�N�g���瓯�����O�����I�u�W�F�N�g���������A�l���擾���܂��B
�w�肳�ꂽ���O�����݂��Ȃ��ꍇ�́Ap1�ɑ���͍s�Ȃ�ꂸ�ɃV�X�e���ϐ�stat��1�������ďI�����܂��B
p2���ȗ��܂��̓}�C�i�X�l�ɂ����jsonopen���߂œǂݍ��܂����f�[�^�̃��[�g�K�w���g�p����܂��B
p2�ɋ�(NULL)��JSON�|�C���^�l���w�肵���ꍇ�́A�V�X�e���ϐ�stat��1�ɂȂ���s�͍s�Ȃ��܂���B
%href
jsongets


%index
jsonnewobj
JSON�I�u�W�F�N�g��V�K�쐬
%group
�g�����o�͐��䖽��
%prm
p1,p2,"name"
p1     : JSON�|�C���^�l����������ϐ���
p2(-1) : �e��JSON�|�C���^�l
"name" : �I�u�W�F�N�g���ʖ�

%inst
JSON�I�u�W�F�N�g��V�K�쐬���āAp1�Ŏw�肵���ϐ���JSON�|�C���^�l�������܂��B
p2�Őe�ɂȂ�I�u�W�F�N�g(JSON�|�C���^�l)���w�肵�܂��B
p2���ȗ��܂��̓}�C�i�X�l�ɂ����jsonopen���߂œǂݍ��܂����f�[�^�̃��[�g�K�w���g�p����܂��B
���[�U�[���Ǝ���JSON�I�u�W�F�N�g���쐬����ۂɎg�p���܂��B
JSON�I�u�W�F�N�g��V�K�쐬������́A�Ō�ɍł��e�̊K�w��jsondelobj���߂ō폜����K�v������̂Œ��ӂ��Ă��������B
%href
jsondelobj


%index
jsondelobj
JSON�I�u�W�F�N�g���폜
%group
�g�����o�͐��䖽��
%prm
p1
p1(0) : JSON�|�C���^�l

%inst
JSON�I�u�W�F�N�g���폜���܂��B
jsonnewobj���߂ɂ��JSON�I�u�W�F�N�g��V�K�쐬������́A�Ō�ɍł��e�̊K�w��jsondelobj���߂ō폜����K�v������̂Œ��ӂ��Ă��������B
jsonopen���߂œǂݍ��܂����f�[�^�́Ajsonclose���߂ɂ�������Ă��������B(jsondelobj���߂ŉ������K�v�͂���܂���B)
%href
jsonnewobj


%index
jsonsetprm
JSON�I�u�W�F�N�g�ɒl��ݒ肷��
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1(0)  : JSON�|�C���^�l
p2(0)  : �ݒ�l
p3(0)  : �ݒ�I�v�V����

%inst
p1�Ŏw�肳�ꂽJSON�I�u�W�F�N�g(JSON�|�C���^�l)�Ɋ֘A����p�����[�^�[��ݒ肵�܂��B
�ݒ肷��p�����[�^�[�́Ap3�̃I�v�V�����ɂ���ĕς��܂��Bp3�͈ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
�ݒ�I�v�V����   ���e
--------------------------------------------
  0              ���̃I�u�W�F�N�g(next)
  1              �O�̃I�u�W�F�N�g(prev)
  2              �q�K�w�̃I�u�W�F�N�g(child)
  3              �I�u�W�F�N�g��type�l
  4              �I�u�W�F�N�g�ɐݒ肳�ꂽ�����l
^p
jsonsetprm���߂ɂ��A�q�K�w(�z��)���̃I�u�W�F�N�g��I�u�W�F�N�g�̘A���𒼐ڐݒ肷�邱�Ƃ��ł��܂��B
���ɐݒ肳��Ă���l���㏑�����邱�ƂŁA�K�w�\��������\��������܂��̂ŁA�ݒ肷��ꍇ�ɂ͒��ӂ���悤�ɂ��Ă��������B
p1�ɋ�(NULL)��JSON�|�C���^�l���w�肵���ꍇ�́A�V�X�e���ϐ�stat��1�ɂȂ���s�͍s�Ȃ��܂���B
%href
jsongetobj


%index
jsonputs
JSON�I�u�W�F�N�g�ɕ������ǉ�
%group
�g�����o�͐��䖽��
%prm
p1,"name","strings"
p1(0)     : JSON�|�C���^�l
"name"    : �I�u�W�F�N�g���ʖ�
"strings" : �ݒ肷�镶����

%inst
p1�Ŏw�肳�ꂽJSON�I�u�W�F�N�g(JSON�|�C���^�l)�ɕ�����̃f�[�^�����I�u�W�F�N�g��ǉ����܂��B
"name"�ŁA�ǉ������I�u�W�F�N�g�̎��ʖ����A"strings"�ŕ�������w�肵�܂��B

%href
jsonputi
jsonnkf


%index
jsonputi
JSON�I�u�W�F�N�g�ɐ��l��ǉ�
%group
�g�����o�͐��䖽��
%prm
p1,"name",p2,p3
p1(0)  : JSON�|�C���^�l
"name" : �I�u�W�F�N�g���ʖ�
p2(0)  : �ݒ肷��l
p3(0)  : �ݒ�I�v�V����

%inst
p1�Ŏw�肳�ꂽJSON�I�u�W�F�N�g(JSON�|�C���^�l)�ɐ��l�̃f�[�^�����I�u�W�F�N�g��ǉ����܂��B
"name"�ŁA�ǉ������I�u�W�F�N�g�̎��ʖ����Ap2�Ő��l���w�肵�܂��B
p
�ݒ肷�鐔�l�̎�ނ́Ap3�̃I�v�V�����ɂ���ĕς��܂��Bp3�͈ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
�ݒ�I�v�V����   ���e
--------------------------------------------
  0              �����l
  1              BOOL�l(False,True)
^p
�ݒ�I�v�V������BOOL�l�̏ꍇ�́Ap2�̒l��0�ȊO�Ȃ��True���A0�Ȃ��False���ݒ肳��܂��B

%href
jsonputs


%index
jsonnkf
JSON������ϊ��̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"option1","option2"
"option1" : �擾���ϊ��I�v�V����
"option2" : �ݒ莞�ϊ��I�v�V����

%inst
JSON�ň���������̃R�[�h�ϊ���ݒ肵�܂��B
jsongets�Ajsonputs���߂Ŏg�p���镶�����ϊ����邱�ƂŁAJSON�f�[�^��C�ӂ̕����R�[�h�ŕێ����邱�Ƃ��ł��܂��B
"option1"�y�сA"option2"�p�����[�^�[�ɂ��ANKF�ɂ��R�[�h�ϊ��p�����[�^�[���w�肵�܂��B
"option1"�́Ajsongets���߂ɂ�镶����擾���ɁA"option2"�́Ajsonputs���߂ɂ�镶����ݒ莞�Ɏg�p����܂��B
�I�v�V�����̕�����́Ankfcnv���߂Ŏg�p�������̂Ɠ����ł��B
NKF�̕ϊ���SJIS�̓��o�͂��w�肷�邱�Ƃɂ��AHSP�ň��������R�[�h�����̂܂܎w�肷�邱�Ƃ��ł���悤�ɂȂ�܂��B

%href
jsongets
jsonputs
nkfcnv


%index
nkfcnv
NKF�ɂ�镶���R�[�h�ϊ����s�Ȃ�
%group
�g�����o�͐��䖽��
%prm
p1,p2,"option",p3,p4
p1 : �ϊ���̕����񂪑�������ϐ�
p2 : �ϊ����̕����񂪑������Ă���ϐ�
"option" : NKF�ϊ��I�v�V����
p3(-1) : �ϊ����̕�����T�C�Y
p4(-1) : �o�͐�̍ő�o�b�t�@�T�C�Y

%inst
p2�Ŏw�肳�ꂽ�ϐ��Ɋi�[����Ă��镶����ɑ΂��āANKF�ɂ�镶���R�[�h�ϊ����s�Ȃ��A���ʂ�p1�Ŏw�肳�ꂽ�ϐ��ɑ�����܂��B
"option"��NKF�̕ϊ��I�v�V�������w�肷�邱�Ƃ��ł��܂��B����ɂ��A���͂���镶���R�[�h�Əo�͂���镶���R�[�h��C�ӂɎw�肷�邱�Ƃ��ł��܂��B
"option"�p�����[�^�[���ȗ������ꍇ�́A���̓R�[�h���������ʂ���SJIS�ɕϊ�����܂��B
��ȃI�v�V�����̈ꗗ�͈ȉ��̒ʂ�ł��B(�I�v�V����������͕����𑱂��Ďw�肷�邱�Ƃ��\�ł�)����ȊO�ɂ��A�����̎w�肪�\�ł��B�ڂ����́Adoclib�t�H���_����nkf_doc.txt���Q�Ƃ��Ă��������B
^p
�ݒ�I�v�V����   ���e
--------------------------------------------
    j  	      JIS�ɕϊ�����
    e  	      EUC�ɕϊ�����
    s  	      SJIS�ɕϊ�����
    w  	      UTF8�ɕϊ�����
    J  	      �ϊ�����JIS(ISO-2022-JP)�����肷��B
    E  	      �ϊ�����EUC(AT&T)�����肷��B
    S  	      �ϊ�����SJIS�����肷��
    W  	      �ϊ�����UTF-8�����肷��
    W16       �ϊ�����UTF-16 (Little Endian)�����肷��
    W16B      �ϊ�����UTF-16 (Big Endian)�����肷��
^p
p3�ŁA�ϊ����̕�����T�C�Y(byte��)���w�肵�܂��Bp3���ȗ����邩�}�C�i�X�l�̏ꍇ�́A���͂�C����`����ansi������Ƃ��Ď����v�Z����܂��B
p4�ŁA�o�͐�̃o�b�t�@�T�C�Y���w�肵�܂��B���̃T�C�Y�𒴂����ϊ��͍s�Ȃ��܂���Bp4���ȗ����邩�}�C�i�X�l�̏ꍇ�́A�f�t�H���g�T�C�Y(32KB)���g�p����܂��B
p1�Ŏw�肳�ꂽ�ϐ��́A�����I�ɕ�����T�C�Y�̃o�b�t�@���m�ۂ�����ŏ���������܂��B���炩����sdim�ŏ��������Ă����K�v�͂���܂���B

%href
nkfguess


%index
nkfguess
NKF�ɂ�镶���R�[�h�F�����ʂ��擾����
%group
�g�����o�͐��䖽��
%prm
p1
p1 : ���ʂ̕����񂪑�������ϐ�

%inst
nkfcnv���߂ɂ��ϊ����ꂽ�ۂɁA�F�����ꂽ�ϊ����̕����R�[�h���擾���܂��B
���ʂ́Ap1�Ŏw�肳�ꂽ�ϐ��ɕ�����Ƃ��đ������܂��B�K���A���nkfcnv���߂ŕϊ����s�Ȃ��Ă����K�v������܂��B

%href
nkfcnv


%index
getenv
���ϐ��̎擾
%group
�g�����o�͐��䖽��
%prm
p1,"name"
p1 : ���ʂ̕����񂪑�������ϐ�
"name" : ���ϐ���

%inst
���ϐ��̒l���擾���A�ϐ��ɑ�����܂��B
���ʂ͕�����^�ő������܂��B
�ϐ��̃o�b�t�@�͕�����ɍ��킹�Ď����I�ɒ�������܂��B

%href


%index
getctime
������ɂ����t�Ǝ����̎擾
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1 : ���ʂ̕����񂪑�������ϐ�
mode(0) : �擾�����`���̎w��

%inst
���t�Ǝ����𕶎���Ŏ擾���܂��B
mode�̒l�ɂ��A�擾����t�H�[�}�b�g���w�肵�܂��B
^p
 mode   ���e
---------------------------------------------
   0    C�����asctime�֐��ɂ�錻�ݎ���(���[�J��)
        ��: Sun Nov  6 08:49:37 1994
   1    C�����asctime�֐��ɂ�錻�ݎ���(GMT/UTC)
        ��: Sun Nov  6 08:49:37 1994
   2    RFC 1123�Œ�`�������t�t�H�[�}�b�g
        ��: Sun, 06 Nov 1994 08:49:37 GMT
^p

%href
gettime


%index
getenvprm
�w�蕶����v�f�̎擾
%group
�g�����o�͐��䖽��
%prm
p1, p2, "name", code
p1 : ���ʂ̕����񂪑�������ϐ�
p2 : �������e���������Ă��镶����^�ϐ�
"name" : �v�f��
code : ��؂蕶���R�[�h(�ȗ�����'&')

%inst
getenvprm���߂́A�uA=123&B=456&C=789�v�̂悤�ɓ���̋�؂�
�����R�[�h(���̏ꍇ�́u&�v)�ŋ�؂�ꂽ������̒�����A
�擪������"name"�ƈ�v�������̂����o���܂��B
CGI�̃p�����[�^�[�󂯓n���Ȃǂŕ����̏�񂪕�����Ƃ���
�n����Ă��钆����A����̍��ڂ����o���ꍇ�Ɏg�p���܂��B
���Ƃ��΁A�ϐ�a�ɁuA=123&B=456&C=789�v���������Ă���ꍇ�A
�ugetenvprm res,a,"B="�v�����s����ƁA�ϐ�res�ɂ́u789�v�Ƃ���
�����񂪑������܂��B
p2�Ŏw�肳�ꂽ�ϐ��́A������^�ł��炩���ߏ���������Ă���
�K�v������܂��B
�Y������v�f�����Ȃ������ꍇ�́A""(����0�̕�����)��
�������܂��B
code�ɋ�؂蕶���̃R�[�h���w�肷�邱�Ƃ��\�ł��B
code�̎w����ȗ������ꍇ�́A'&'���g�p����܂��B

%href


%index
netgetv_data
http���N�G�X�g�̌��ʂ��擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �f�[�^����������ϐ�

%inst
netrequest_get�Anetrequest_post���߂ɂ��http���N�G�X�g�̌��ʂ��擾���܂��B
�K���Anetexec���߂ɂ���M�����ŁA�_�E�����[�h�������������Ƃ��m�F���Ă���A�f�[�^���擾����悤�ɂ��Ă��������B
netgetv���߂Ɠ��l�̓���ł����Anetgetv���߂̓e�L�X�g(������)���擾����̂ɑ΂��āAnetgetv_data���߂̓o�C�i���f�[�^���o�b�t�@�Ɏ擾���܂��B
���̂��߁Ap1�Ŏw�肳�ꂽ�ϐ��ɂ́A���炩���߃_�E�����[�h�ɕK�v�ȃ������o�b�t�@�𕶎���^�Ƃ��Ċm�ۂ��Ă����K�v������܂��B(�K�v�ȃT�C�Y�́Anetgetv_size�֐��ɂ���Ď擾���邱�Ƃ��ł��܂��B)
���ߎ��s��ɁA�V�X�e���ϐ�stat�Ƀf�[�^�T�C�Y���������܂��B

%href
netgetv
netgetv_size
netrequest_get
netrequest_post


%index
netgetv_size
�t�@�C����M�T�C�Y�̎擾
%group
�g�����o�͊֐�

%inst
netrequest_get�Anetrequest_post���߂ɂ��http���N�G�X�g�̌��ʂŎ擾�����f�[�^�̃T�C�Y��߂��܂��B
�K���Anetexec���߂ɂ���M�����ŁA�_�E�����[�h�������������Ƃ��m�F���Ă���A�f�[�^���擾����悤�ɂ��Ă��������B
%href
netexec
netgetv_data



