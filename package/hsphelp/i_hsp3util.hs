;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪��;�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.6
%note
hsp3util.as���C���N���[�h���邱�ƁB
%date
2009/08/01
%author
onitama
%dll
hsp3util
%url
http://hsp.tv/
%port
Win


%index
bmppalette
bmp�摜�p���b�g����ǂݍ���
%group
�g����ʐ��䖽��
%prm
"�t�@�C����"
"�t�@�C����" : �p���b�g�����o��BMP�摜�t�@�C����

%inst
8bit�`����bmp�摜�t�@�C���Ɋ܂܂��p���b�g����ǂݍ��݁AHSP�̃p���b�g�Ƃ��Ď��o���܂��B
�ʏ�Apicload���߂ɂ��p���b�g���[�h�ł̉摜�ǂݍ��݂́A�t�@�C���ɕt�����Ă���p���b�g����ǂݍ��ނ��Ƃ��ł��܂���B
hspdx�g���v���O�C���ȂǁA�t�@�C�����̃p���b�g��񂪕K�v�ƂȂ�ꍇ�ɁA�g�p���邱�Ƃ��ł��܂��B
�t�@�C���Ƃ��Ďw�肷�邱�Ƃ��ł���̂́A8BIT�`����BMP�t�@�C���݂̂ł��B
����ȊO�̃t�@�C����A�������Ȃ��`�����w�肳�ꂽ�ꍇ�ɂ́A�����s�Ȃ��܂���B

%href
palette
getpal



%index
gettimestr
���݂̎����𕶎���Ŏ擾����
%group
�g�����o�͐��䖽��
%prm
p1
p1 : ��������擾����ϐ���

%inst
���݂̎������擾���āA"hh:mm:ss"�̕�����^�`���Ƃ��ĕϐ��ɑ�����܂��B

%href
getdatestr



%index
getdatestr
���݂̓��t�𕶎���Ŏ擾����
%group
�g�����o�͐��䖽��
%prm
p1
p1 : ��������擾����ϐ���

%inst
���݂̓��t���擾���āA"yyyy/mm/dd"�̕�����^�`���Ƃ��ĕϐ��ɑ�����܂��B

%href
gettimestr



%index
text
�C�������\���̑҂����Ԃ�ݒ肷��
%group
�g����ʐ��䖽��
%prm
p1
p1(0) : �\���҂�����(ms)

%inst
emes���߂ŕ\������镶���̑҂����Ԃ�ݒ肵�܂��B
p1�łP�������Ƃ̑҂�����(�~���b�P��)���w�肵�܂��B
p1��0�ȉ��̒l���w�肵���ꍇ�́A�P�������Ƃ̑҂��͍s�Ȃ킸��x�ɕ\������܂��B
text���߂́AHSP3����W���łȂ����W���[�����g�p�����g�����߂Ƃ��Ĉ����Ă��܂��B
HSP2.x�ƈقȂ�Atext���߂Ŏw�肵���҂����Ԃ�emes���߂ɔ��f����܂��̂Œ��ӂ��Ă��������B

%href
textmode
emes


%index
textmode
�C�������\���̐ݒ���s�Ȃ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : �C�������̃��[�h
p2(0) : �����p�����[�^�[

%inst
emes���߂ŕ\�������C�������̐ݒ���s�Ȃ��܂��B
p1�Ń��[�h���w�肵�܂��B���[�h�̒l�͈ȉ��̒ʂ�ł��B
^p
	���[�h0 : �ʏ�̕\��
	���[�h1 : �e�t���\��
	���[�h2 : �֊s�t���\��
^p
���[�h1,2���w�肵���ꍇ�́Atextmode���߂����s�������_�Őݒ肳��Ă���F���e��֊s�Ŏg�p����܂��B
�܂��Ap2�ɒ����p�����[�^�[��ݒ肷�邱�Ƃŉe��֊s�̋������C�����邱�Ƃ��ł��܂��B
�����p�����[�^�[��0�̏ꍇ�́A�Œ዗��(1�h�b�g)�ƂȂ�l���傫���Ȃ邲�Ƃɋ������傫���Ȃ�܂��B

%href
text
emes



%index
emes
�C��������\��
%group
�g����ʐ��䖽��
%prm
"strings"
"strings" : �\�����郁�b�Z�[�W�܂��͕ϐ�

%inst
�C��������\�����܂��B
emes���߂́Ames���߂Ɠ��l�ɕ��������ʏ�ɕ\�����܂����A���̎��ɕ����ɏC�����s�Ȃ�����A�P�����Â������ƕ\�������邱�Ƃ��ł��܂��B
�C�������̐ݒ�́Atextmode���߂ōs�Ȃ����Ƃ��ł��܂��B
�܂��A�C�������̕\�����x��text���߂Ŏw�肷�邱�Ƃ��ł��܂��B

%href
textmode
text




%index
gfade
��ʂ̃t�F�[�h���s�Ȃ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5
p1(0) : �t�F�[�h���x��(0�`256)
(p2,p3) : �t�F�[�h���s�Ȃ�����X,Y���W
(p4,p5) : �t�F�[�h���s�Ȃ�X,Y�T�C�Y

%inst
�t���J���[��ʂɑ΂��āA�w�肳�ꂽ�̈���Œ�F�t�F�[�h���s�Ȃ��܂��B
���̖��߂́A���Ԃ��ƂɃt�F�[�h���x����ς��Ă������ƂɂȂ��āA�t�F�[�h�C���A�t�F�[�h�A�E�g�Ȃǂ��s�Ȃ����߂̂��̂ł��B
p1�Ńt�F�[�h���x�����w�肵�܂��B0�̏ꍇ�͉�ʂɉe���͂���܂���B
p1��256�̎��A���S�Ɏw�肵���F�œh��Ԃ��ꂽ��ԂɂȂ�܂��B
(p2,p3)�Ńt�F�[�h���s�Ȃ�����X,Y���W���w�肵�܂��B�ȗ������ꍇ�́A(0,0)�ƂȂ�܂��B
(p4,p5)�Ńt�F�[�h���s�Ȃ�X,Y�T�C�Y���w�肵�܂��B�ȗ������ꍇ�́A��ʑS�̂̃T�C�Y���g�p����܂��B

%href




%index
statictext
�X�^�e�B�b�N�e�L�X�g��z�u
%group
�g����ʐ��䖽��
%prm
"strings",p1,p2
"strings" : �X�^�e�B�b�N�e�L�X�g�̕�����
p1(0) : X�T�C�Y
p2(0) : Y�T�C�Y

%inst
���݂̃J�����g�|�W�V��������A�X�^�e�B�b�N�e�L�X�g��z�u�I�u�W�F�N�g�Ƃ��Đ������܂��B
�z�u���ꂽ�I�u�W�F�N�gID�́A�V�X�e���ϐ�stat�ɑ������܂��B
�z�u�����I�u�W�F�N�g�̃T�C�Y��(p1,p2)�Ŏw�肷�邱�Ƃ��ł��܂��B
�z�u���ꂽ�X�^�e�B�b�N�e�L�X�g�̓��e��ύX����ꍇ�́Astatictext_set���߂��g�p���Ă��������B
objprm���߂͎g�p�ł��Ȃ��̂Œ��ӂ��Ă��������B

%href
statictext_set



%index
statictext_set
�X�^�e�B�b�N�e�L�X�g��ύX
%group
�g����ʐ��䖽��
%prm
p1,"strings"
p1(0) : �I�u�W�F�N�gID
"strings" : �X�^�e�B�b�N�e�L�X�g�̕�����

%inst
statictext���߂Ŕz�u�����A�X�^�e�B�b�N�e�L�X�g�̓��e��ύX���܂��B
p1�ɃI�u�W�F�N�gID���w�肵�āA"strings"�ŐV�����ݒ肷��X�^�e�B�b�N�e�L�X�g�̕�������w�肷�邱�Ƃ��ł��܂��B

%href
statictext




%index
scrollbar
�X�N���[���o�[��z�u
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : X�T�C�Y
p2(0) : Y�T�C�Y

%inst
���݂̃J�����g�|�W�V��������A�X�N���[���o�[��z�u�I�u�W�F�N�g�Ƃ��Đ������܂��B
�z�u���ꂽ�I�u�W�F�N�gID�́A�V�X�e���ϐ�stat�ɑ������܂��B
�z�u�����I�u�W�F�N�g�̃T�C�Y��(p1,p2)�Ŏw�肷�邱�Ƃ��ł��܂��B
���̖��߂́A�z�u�I�u�W�F�N�g�Ƃ��ăX�N���[���o�[�𐶐����邱�Ƃ��T�|�[�g������̂ł��B
�z�u���ꂽ�X�N���[���o�[�ɑ΂��郁�b�Z�[�W�̑���M�́A�ʓrsendmsg���߂ōs�Ȃ��K�v������܂��B
���̍ۂɂ́AWIN32API�̃X�N���[���o�[���b�Z�[�W�Ɋւ��鎑�����ʓr�K�v�ɂȂ�܂��B
�܂��A�z�u�����I�u�W�F�N�g�ɑ΂��ẮAobjprm���߂͎g�p�ł��Ȃ��̂Œ��ӂ��Ă��������B

%href





%index
progbar
�v���O���X�o�[��z�u
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : X�T�C�Y
p2(0) : Y�T�C�Y

%inst
���݂̃J�����g�|�W�V��������A�v���O���X�o�[��z�u�I�u�W�F�N�g�Ƃ��Đ������܂��B
�z�u���ꂽ�I�u�W�F�N�gID�́A�V�X�e���ϐ�stat�ɑ������܂��B
�z�u�����I�u�W�F�N�g�̃T�C�Y��(p1,p2)�Ŏw�肷�邱�Ƃ��ł��܂��B
�z�u���ꂽ�v���O���X�o�[��i�߂�ꍇ�́Aprogbar_set�����progbar_step���߂��g�p���Ă��������B
�܂��A�z�u�����I�u�W�F�N�g�ɑ΂��ẮAobjprm���߂͎g�p�ł��Ȃ��̂Œ��ӂ��Ă��������B

%href
progbar_set
progbar_step



%index
progbar_set
�v���O���X�o�[�̃X�e�b�v������ݒ肷��
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : �I�u�W�F�N�gID
p2(0) : �����l

%inst
p1�ɃI�u�W�F�N�gID���w�肷�邱�ƂŁAprogbar���߂Ŕz�u�����v���O���X�o�[��1�X�e�b�v���Ƃ̑�����ݒ肷�邱�Ƃ��ł��܂��B
�v���O���X�o�[�́A�f�t�H���g��0����100�܂ł̒l���J�E���^�Ƃ��Ď����Ă��܂��B
����ɑ΂��āA�P�X�e�b�v���Ƃɑ��������Z���Ă����܂��B
�������w�肵�Ȃ������ꍇ�̃f�t�H���g�l��10�ɂȂ�܂��B

%href
progbar_step
progbar



%index
progbar_step
�v���O���X�o�[��1�X�e�b�v�i�߂�
%group
�g����ʐ��䖽��
%prm
p1
p1(0) : �I�u�W�F�N�gID

%inst
p1�ɃI�u�W�F�N�gID���w�肷�邱�ƂŁAprogbar���߂Ŕz�u�����v���O���X�o�[��1�X�e�b�v�i�߂܂��B
1�X�e�b�v���Ƃ̑����́Aprogbar_set���߂ɂ���Ďw�肷�邱�Ƃ��ł��܂��B

%href
progbar_set
progbar




%index
note2array
�����s�������z��ɕϊ�
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1 : �ϊ������z���������ϐ�
p2 : �����s�����񂪑������Ă���ϐ�

%inst
�����s�̕�������s���Ƃɕ������Ĕz��ϐ��̊e�v�f�ɑ�����܂��B
p2�Ŏw�肳�ꂽ�����s��������Ap1�Ŏw�肵���ϐ��ɕϊ����đ�����܂��B
p1�̕ϐ��́A�K��������^�̂P�����z��ϐ��ɂȂ�܂��B

%href
array2note
arraysave
arrayload




%index
array2note
�z��𕡐��s������ɕϊ�
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1 : �ϊ������𕶎����������ϐ�
p2 : �����񂪔z��ɑ������Ă���ϐ�

%inst
������^�̂P�����z��ϐ��𕡐��s������ɕϊ����܂��B
p2�Ŏw�肳�ꂽ������^�̂P�����z��ϐ��̓��e��ϊ����Ap1�Ŏw�肵���ϐ��ɑ�����܂��B

%href
note2array
arraysave
arrayload



%index
arraysave
������^�̔z��ϐ����t�@�C���ɏ����o��
%group
�g�����o�͐��䖽��
%prm
"�t�@�C����",p1
"�t�@�C����" : �����o�����s�Ȃ��t�@�C����
p1 : �����o�����s�Ȃ����̕ϐ�

%inst
p1�Ŏw�肵��������^�̂P�����z��ϐ��𕡐��s������ɕϊ�������ŁA�w�肵���t�@�C�����ŏ����o���܂��B
������z��͂P�����z��݂̂ɂȂ�܂��B
�����o�����t�@�C���́Aarrayload���߂ɂ���ēǂݍ��ނ��Ƃ��\�ł��B

%href
note2array
array2note
arrayload



%index
arrayload
������^�̔z��ϐ����t�@�C������ǂݍ���
%group
�g�����o�͐��䖽��
%prm
"�t�@�C����",p1
"�t�@�C����" : �ǂݍ��݂��s�Ȃ��t�@�C����
p1 : �ǂݍ��݂��s�Ȃ���̕ϐ�

%inst
arraysave���߂ɂ���ď����o���ꂽ�t�@�C�����Ap1�Ŏw�肵���ϐ��ɓǂݍ��݂܂��B
���̖��߂́A�t�@�C���Ɋ܂܂�镡���s������̍s��z��v�f�ɕϊ����đ��������̂ŁA�쐬�����z��z��͂P�����z��ɂȂ�܂��B


%href
note2array
array2note
arraysave




