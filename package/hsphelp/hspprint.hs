;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.6
%note
hspprint.as���C���N���[�h���邱�ƁB

%date
2014/01/11
%author
onitama
%dll
hspprint
%url
http://hsp.tv/
%port
Win
%portinfo
Windows�̃v�����^�����K�v�ł��B


%index
prnflags
�����^�񋓃t���O��ݒ肷��
%group
�g�����o�͐��䖽��
%prm
flag
flag(0) : �v�����^�񋓃t���O

%inst
hspprint�v���O�C�����񋓂���v�����^�ꗗ�̎擾�t���O��ݒ肵�܂��B
flag�Ɏw�肳�ꂽ�l���擾�t���O�ƂȂ�܂��B�ȉ��̃t���O���w��\�ł��B(������g�ݍ��킹�邱�Ƃ��\�ł�)
^p
��`��                       ���e
----------------------------------------------
PRINTER_ENUM_LOCAL           ���[�J���v�����^
PRINTER_ENUM_CONNECTIONS     �ڑ����m�����Ă���v�����^
PRINTER_ENUM_SHARED          ���L�������L���ȃv�����^
^p
flag�̒l��0���܂��͏ȗ����ꂽ�ꍇ�́A�f�t�H���g�̐ݒ�(PRINTER_ENUM_LOCAL+PRINTER_ENUM_CONNECTIONS)���g�p����܂��B

%href
enumprn


%index
enumprn
�v�����^��񋓂���
%group
�g�����o�͐��䖽��
%prm
�ϐ� : ���ʂ̕����񂪑�������ϐ���

%inst
�ڑ�����Ă���v�����^���̈ꗗ�𕶎���Ƃ��Ď擾���܂��B
�����̃v�����^���F������Ă���ꍇ�́A�����s�����񂪑������܂��B���ߎ��s��ɑ�����ꂽ�v�����^�̐����A�V�X�e���ϐ�stat�ɑ������܂��B
enumprn���߂Ŏ擾���ꂽ�ꗗ�̂P�s�ڂ��珇�ԂɃv�����^ID0�A�v�����^ID1�c��ID�ԍ����Ή����邱�ƂɂȂ�܂��B

%href
prnflags



%index
propprn
�v�����^���̎擾
%group
�g�����o�͐��䖽��
%prm
�ϐ�1,�ϐ�2,id,type
�ϐ�1 : ����X�̒l����������ϐ���
�ϐ�2 : ����Y�̒l����������ϐ���
id(0) : �v�����^ID(0�`)
type(0) : �擾�������^�C�v

%inst
�v�����^�Ɋւ�������擾���A�ϐ�1,�ϐ�2�ɑ�����܂��B
id�Ńv�����^ID���w�肵�܂��B�v�����^ID�́Aenumprn���߂Ŏ擾���ꂽ�ꗗ�̒����珇�Ԃ�0,1,2�c�̐��l�Ŏ��������̂ɂȂ�܂��B
����������́Atype(���^�C�v)�Ŏw�肳�ꂽ���e�ɂȂ�܂��B���^�C�v�͈ȉ��̒�����I�����܂��B
^p
���^�C�v    ���e
----------------------------------------------
   0          �r�N�Z���P�ʂ̃y�[�W�𑜓xX,Y
   1          �y�[�W�̕����T�C�YX,Y(�f�o�C�X�P��)
   2          ����\�̈�܂ł̋���X,Y(�f�o�C�X�P��)
   3          �����I�ȃy�[�W�̃T�C�YX,Y(mm�P��)
^p
X,Y�̒l����������ꍇ�́A�ϐ��͐����^�ɐݒ肳��܂��B

%href
enumprn


%index
execprn
�v�����^����̊J�n
%group
�g�����o�͐��䖽��
%prm
id,x,y,sx,sy,bx,by,bsx,bsy,"name"
id(0) : �v�����^ID(0�`)
x,y : ����y�[�W���̉摜�ʒuX,Y���W
sx,sy : ����y�[�W���̉摜�T�C�YX,Y
bx,by : ��������摜�̍���X,Y���W
bsx,bsy : ��������摜�T�C�YX,Y
"name" : �h�L�������g��

%inst
���݂̑����E�C���h�E�̉摜���v�����^�ň�����܂��B
id�Ńv�����^ID���w�肵�܂��B�v�����^ID�́Aenumprn���߂Ŏ擾���ꂽ�ꗗ�̒����珇�Ԃ�0,1,2�c�̐��l�Ŏ��������̂ɂȂ�܂��B

HSP�̉摜�o�b�t�@���̍��W(bx,by)����(bsx,bsy)�Ŏw�肳�ꂽ�T�C�Y������̑ΏۂƂȂ�܂��Bbx,by���ȗ����ꂽ�ꍇ�́A���ꂼ��0���g�p����܂��Bbsx,bsy���ȗ����ꂽ�ꍇ�́A�ő�̉�ʃT�C�Y���g�p����܂��B
��������y�[�W���ł̈ʒu��(x,y)�Ŏw�肷�邱�Ƃ��ł��܂��B����́A�s�N�Z���P�ʂŃy�[�W�𑜓x�͈͓̔��Ɏw��\�ł��B�܂����̏ꍇ�̃T�C�Y��(sx,sy)�Ŏw�肷�邱�Ƃ��ł��܂��B
"name"�͈���L���[�Ȃǂɕ\�������h�L�������g���ɂȂ�܂��B"name"���ȗ������ꍇ�́A"hspdoc"���g�p����܂��B

%href
enumprn



%index
getdefprn
�K��̃v�����^���擾����
%group
�g�����o�͐��䖽��
%prm
�ϐ�
�ϐ� : ���ʂ̕����񂪑�������ϐ���

%inst
�K��(�f�t�H���g)�̃v�����^�����擾���ĕϐ��ɑ�����܂��B

%href
enumprn


%index
prndialog
�v�����^�̐ݒ�_�C�A���O���J��
%group
�g�����o�͐��䖽��
%prm
id
id(0) : �v�����^ID(0�`)

%inst
�v�����^�̐ݒ�_�C�A���O���J���܂��B
id�Ńv�����^ID���w�肵�܂��B�v�����^ID�́Aenumprn���߂Ŏ擾���ꂽ�ꗗ�̒����珇�Ԃ�0,1,2�c�̐��l�Ŏ��������̂ɂȂ�܂��B

%href
enumprn

