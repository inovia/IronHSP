;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
��������
%ver
3.6
%note
ver3.6�W������
%date
2020/06/04
%author
onitama
%url
http://hsp.tv/
%port
Win
Let


%index
button
�{�^���\��
%group
�I�u�W�F�N�g���䖽��
%prm
goto/gosub "name",*label
"name" : �{�^���̖��O
*label : ���������ɃW�����v���郉�x����

%inst
�J�����g�|�W�V�����ɃI�u�W�F�N�g�Ƃ��ĉ����{�^����z�u���܂��B
�{�^���ɂ́A"name"�Ŏw�肳�ꂽ�����񂪏�����A�}�E�X�Ń{�^�����N���b�N����ƁA*label�Ŏw�肵���ꏊ�Ƀv���O�����̐��䂪�ڂ�܂��B
^
button goto�ƋL�q�����ꍇ�́A���x���ɃW�����v�Bbutton  gosub�ƋL�q�����ꍇ�́A ���x���ɃT�u���[�`���W�����v���s�Ȃ��܂��Bgoto�Agosub�L�[���[�h���ȗ������ꍇ�ɂ́Agoto�Ɠ�������ɂȂ�܂��B
^p
�� :
	button gosub "�{�^��",*aaa  ; *aaa���Ăяo���{�^�����쐬
^p
^
�I�u�W�F�N�g�̑傫����objsize���߂Ŏw�肷�邱�Ƃ��ł��܂��B �{�^����z�u����ƁA�J�����g�|�W�V�����͎��̍s�Ɏ����I�Ɉړ����܂��B
^
�{�^���������ꂽ���ɃW�����v���Ď��s�����v���O�����ł́A�V�X�e���ϐ�stat�̏����l�Ƃ��ăI�u�W�F�N�gID���������܂��B
^
�ʏ�́A�{�^���̌`��Ƃ���Windows�V�X�e���ŗp�ӂ��ꂽ���̂��g�p����܂��B
�������Aobjimage���߂ɂ���ĉ摜���g�p�����J�X�^���{�^���̐ݒ肪�s�Ȃ��Ă���ꍇ�́A���R�ȊO�ςɂ��邱�Ƃ��ł��܂��B
�J�X�^���{�^���̐ݒ�ɂ��ẮAobjimage���߂̍����Q�Ƃ��Ă��������B


%href
objsize
objimage



%index
chkbox
�`�F�b�N�{�b�N�X�\��
%group
�I�u�W�F�N�g���䖽��
%prm
"strings",p1
"strings" : �`�F�b�N�{�b�N�X�̓��e�\��������
p1=�ϐ�   : �`�F�b�N�{�b�N�X�̏�Ԃ�ێ�����ϐ�

%inst
�J�����g�|�W�V�����ɃI�u�W�F�N�g�Ƃ��ă`�F�b�N�{�b�N�X��z�u���܂��B
�`�F�b�N�{�b�N�X�ɂ́A"strings"�Ŏw�肵��������̍����ɁA�J�[�\����ON/OFF��؂�ւ��邱�Ƃ̂ł���X�C�b�`�������I�u�W�F�N�g�ł��B
^
�`�F�b�N�{�b�N�X�̑傫���́A objsize�Ŏw�肳�ꂽ�T�C�Y�ɂȂ�w�i�̓O���[�ł��B
^
p1�Ŏw�肳�ꂽ���l�^�ϐ��̓��e��0�Ȃ�΃`�F�b�N��OFF�ɂȂ�A 1�Ȃ��ON�ɂȂ�܂��B�`�F�b�N��ON/OFF���ύX�����ƁA�ϐ��̓��e�������ɕω����܂��B

%href
objsize




%index
clrobj
�I�u�W�F�N�g���N���A
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2
p1=0�`(0)   : ��������I�u�W�F�N�gID(�J�n)
p2=-1�`(-1) : ��������I�u�W�F�N�gID(�I��)( -1�̏ꍇ�́A �ŏI��ID���w��
����܂� )

%inst
button���߂�mesbox���߂Ȃǂŏo�����I�u�W�F�N�g���������܂��B
^
p1,p2���ȗ����āA clrobj���������s������Ɖ�ʏ�̃I�u�W�F�N�g�����ׂď�������܂��B�ꕔ�̃I�u�W�F�N�g�����������������ꍇ�́Ap1�ɍŏ���ID�Ap2�ɍŌ��ID���w�肷���p1�`p2�܂ł̃I�u�W�F�N�g��������������܂��B�w�肷��I�u�W�F�N�gID�́A objprm���߂ȂǂŎw�肷��ID�Ɠ������̂ł��B
^
�폜���ꂽ�I�u�W�F�N�g��ID�́A�V�����I�u�W�F�N�g��z�u����ۂɂ͍ė��p����܂��B



%index
combox
�R���{�{�b�N�X�\��
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2,p3
p1=�ϐ�      : �R���{�{�b�N�X�̏�Ԃ�ێ����鐔�l�^�ϐ�
p2=0�`(100)  : �g��Y�T�C�Y
p3="strings" : �R���{�{�b�N�X�̓��e������������

%inst
�J�����g�|�W�V�����ɃI�u�W�F�N�g�Ƃ��āA�R���{�{�b�N�X��z�u���܂��B
�R���{�{�b�N�X�́A�����̕�����v�f�̒�����P��I�������邱�Ƃ̂ł�����̓I�u�W�F�N�g�ł��B
�I�u�W�F�N�g�̑傫���́Aobjsize���߂Őݒ肵���傫���ɂȂ�܂��B�������Ap2�p�����[�^�őI�����̃��X�g�\���̂��߂�Y�T�C�Y���w�肵�Ȃ���΂Ȃ�܂���B (�ʏ��100�`150���x���K���ł�)
^
�u\n�v�ŋ�؂����������p3�Ŏw�肷�邱�ƂŁA�I������v�f��ݒ肷�邱�Ƃ��ł��܂��B
���Ƃ��΁A�uAPPLE\nORANGE\nGRAPE�v�Ƃ�����������w�肷��ƁA �uAPPLE�v�uORANGE�v�uGRAPE�v�̒�����P��I������R���{�{�b�N�X�ɂȂ�܂��B
���ꂼ��̗v�f�ɂ́A0���珇�ԂɃC���f�b�N�X�ԍ������Ă��܂��B �O�̗�ł́A�uAPPLE�v�̓C���f�b�N�X0�A�uORANGE�v�̓C���f�b�N�X1�A�uGRAPE�v�̓C���f�b�N�X2�Ƃ����ӂ��ɔԍ������Ă����܂��B
^
���́u\n�v�ŋ�؂�Ƃ����f�[�^�`���́A�������m�[�g�p�b�h���߂ň��������s�e�L�X�g�f�[�^�Ɠ����ł��B�������m�[�g�p�b�h���߂ō쐬�����f�[�^�����̂܂�combox���߂ɂ��g�p�ł��܂��B
^
���[�U�[���I��������ƁAp1�Ŏw�肵�����l�^�ϐ��ɃC���f�b�N�X�ԍ����������܂��B
�ŏ��ɃR���{�{�b�N�X���z�u�����ۂɂ́Ap1�Őݒ肵���ϐ��������C���f�b�N�X���I�΂ꂽ��ԂɂȂ�܂��B (�C���f�b�N�X�ԍ���-1�̎��͔�I���̏�ԂɂȂ�܂�)

%href
objsize

%sample
	a=0:objsize 120,24
	combox a,120,"APPLE\nORANGE\nGRAPE"
	stop




%index
input
���̓{�b�N�X�\��
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2,p3,p4
p1=�ϐ� : ���͂̂��߂̕ϐ�
p2,p3   : ���b�Z�[�W�{�b�N�X�̃T�C�Y�i�h�b�g�P�ʁj
p4=0�`  : ���͂ł���ő啶����

%inst
�J�����g�|�W�V�����ɃI�u�W�F�N�g�Ƃ��ē��̓{�b�N�X��z�u���܂��B p2,p3�ő傫�����w�肵�āA�ꏊ�̓J�����g�|�W�V��������ɂȂ�܂��B p2,p3���ȗ����ꂽ�ꍇ�́Aobjsize�Ŏw�肳�ꂽ�T�C�Y�ɂȂ�܂��B
^
���̓{�b�N�X�́A�L�[�{�[�h���璼�ړ��͂��邱�Ƃ̂ł��鏬���ȑ��ł��B�}�E�X�œ��̓{�b�N�X���N���b�N���ăJ�[�\�����o������ԂŁA�L�[�{�[�h����p�����[�^����͂��邱�Ƃ��ł���悤�ɂȂ�܂��B
���͂����l�́Ap1�Ŏw�肵���ϐ��ɑ������܂��B�����Ap1�̕ϐ���������^�������ꍇ�ɂ͓��͂��������񂪁A���l�^�������ꍇ�ɂ͓��͂����l�����̂܂ܕϐ��ɔ��f����܂��B
^
���̓{�b�N�X�͏�����Ԃł́Ap1�Ŏw�肵���ϐ��ɑ������Ă����l���A�{�b�N�X���ɕ\������܂��B
^
p4�ŁA���͂ł���ő啶�������w�肷�邱�Ƃ��ł��܂��Bp4���ȗ����ꂽ�ꍇ�ɂ́Ap1�Ŏw�肳�ꂽ�ϐ��Ɋi�[�ł���ő啶�����������I�Ɋ��蓖�Ă��܂��B(�ϐ���������^�ȊO�������ꍇ�̓f�t�H���g��32�����܂łƂȂ�܂��B)
p4��0�Ɏw�肵���ꍇ�́A���̃o�[�W������Windows�ň�����ő啶���������͉\�ɂȂ�܂��B
^
���̓{�b�N�X��z�u����ƁA�J�����g�|�W�V�����͎��̍s�Ɏ����I�Ɉړ����܂��B

%href
mesbox
objsize




%index
listbox
���X�g�{�b�N�X�\��
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2,p3
p1=�ϐ�      : ���X�g�{�b�N�X�̏�Ԃ�ێ����鐔�l�^�ϐ�
p2=0�`(100)  : �g��Y�T�C�Y
p3="strings" : ���X�g�{�b�N�X�̓��e������������

%inst
�J�����g�|�W�V�����ɃI�u�W�F�N�g�Ƃ��āA���X�g�{�b�N�X��z�u���܂��B
���X�g�{�b�N�X�́A�����̕�����v�f�̒�����P��I�������邱�Ƃ̂ł�����̓I�u�W�F�N�g�ł��B
�I�u�W�F�N�g�̑傫���́Aobjsize���߂Őݒ肵���傫���ɂȂ�܂��B�������Ap2�p�����[�^�őI�����̃��X�g�\���̂��߂�Y�T�C�Y���w�肵�Ȃ���΂Ȃ�܂���B (�ʏ��100�`150���x���K���ł�)
^
�u\n�v�ŋ�؂����������p3�Ŏw�肷�邱�ƂŁA�I������v�f��ݒ肷�邱�Ƃ��ł��܂��B
���Ƃ��΁A�uAPPLE\nORANGE\nGRAPE�v�Ƃ�����������w�肷��ƁA �uAPPLE�v�uORANGE�v�uGRAPE�v�̒�����P��I�����郊�X�g�{�b�N�X�ɂȂ�܂��B
���ꂼ��̗v�f�ɂ́A0���珇�ԂɃC���f�b�N�X�ԍ������Ă��܂��B �O�̗�ł́A�uAPPLE�v�̓C���f�b�N�X0�A�uORANGE�v�̓C���f�b�N�X1�A�uGRAPE�v�̓C���f�b�N�X2�Ƃ����ӂ��ɔԍ������Ă����܂��B
^
���́u\n�v�ŋ�؂�Ƃ����f�[�^�`���́A�������m�[�g�p�b�h���߂ň��������s�e�L�X�g�f�[�^�Ɠ����ł��B�������m�[�g�p�b�h���߂ō쐬�����f�[�^�����̂܂�listbox���߂ɂ��g�p�ł��܂��B
^
���[�U�[���I��������ƁAp1�Ŏw�肵�����l�^�ϐ��ɃC���f�b�N�X�ԍ����������܂��B
�ŏ��Ƀ��X�g�{�b�N�X���z�u�����ۂɂ́Ap1�Őݒ肵���ϐ��������C���f�b�N�X���I�΂ꂽ��ԂɂȂ�܂��B (�C���f�b�N�X�ԍ���-1�̎��͔�I���̏�ԂɂȂ�܂�)

%href
objsize

%sample
	a=0:objsize 120,24
	listbox a,120,"APPLE\nORANGE\nGRAPE"
	stop




%index
mesbox
���b�Z�[�W�{�b�N�X�\��
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2,p3,p4,p5
p1=�ϐ�    : �\�����b�Z�[�W��������ꂽ������^�ϐ�
p2,p3      : ���b�Z�[�W�{�b�N�X�̃T�C�Y�i�h�b�g�P�ʁj
p4=0�`(1)  : ���b�Z�[�W�{�b�N�X�̃X�^�C��
p5=0�`(-1) : ���͂ł���ő啶����

%inst
�E�B���h�E��ɃI�u�W�F�N�g�Ƃ��āA ���b�Z�[�W�{�b�N�X(���b�Z�[�W�\���p�̑�)��z�u���܂��Bp2,p3�ő傫�����w�肵�āA�ꏊ�̓J�����g�|�W�V��������ɂȂ�܂��B
���b�Z�[�W�{�b�N�X�̃X�^�C���ɐݒ肷��l(p4)�́A�ȉ��̒ʂ�ɂȂ�܂��B
^p
   �l : �Ή�����L�[
 ---------------------------------------------------------------
     0  : �X�N���[���\�ȃG�f�B�b�g�{�b�N�X(���������s��)
    +1  : �X�N���[���\�ȃG�f�B�b�g�{�b�N�X(���������\)
    +4  : ���X�N���[���o�[��t����
    +8  : �������b�v(�܂�Ԃ�)�𖳌��ɂ���
^p
���������\�ȃG�f�B�b�g�{�b�N�X���쐬����ƁA���[�U�[���D���ɕ�������͂ł���ȒP�ȃe�L�X�g�G�f�B�^�ɂȂ�܂��B+4(���X�N���[���o�[��t����)�A+8(�������b�v�𖳌��ɂ���)�͂��ꂼ��̒l��p4�ɉ��Z���邱�ƂŁA�����𓯎��Ɏw�肷�邱�Ƃ��ł��܂��B
^
p5�ŁA���͂ł���ő啶�������w�肷�邱�Ƃ��ł��܂��B
p5��0�̏ꍇ�́A���̃o�[�W������Windows�ň�����ő啶�����ɂȂ�܂��B
p5���ȗ�����邩�}�C�i�X�l�̏ꍇ�ɂ́Ap1�Ŏw�肳�ꂽ�ϐ��Ɋi�[�ł���ő啶�����������I�Ɋ��蓖�Ă��܂��B

%href
input




%index
objprm
�I�u�W�F�N�g�̓��e��ύX
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2
p1=0�`(0) : �I�u�W�F�N�gID�w��
p2        : �ύX����p�����[�^�̓��e

%inst
button���߂�input,mesbox���߂Ȃǂŉ�ʏ�ɔz�u�����I�u�W�F�N�g�̎����e��p�����[�^��ύX���܂��B
^
p1�ɂ́A�I�u�W�F�N�gID���w�肵�܂��B�I�u�W�F�N�gID�́A 0���珇�Ԃɉ�ʏ�ɕ\�������I�u�W�F�N�g�P�P�Ɋ��蓖�Ă��Ă����ԍ��ł��B
�I�u�W�F�N�gID�́A�I�u�W�F�N�g��z�u���閽�ߎ��s��ɃV�X�e���ϐ�stat�ɑ������Ă��܂�(�ʏ�u�������Ԃ�0,1,2�c�̔ԍ������蓖�Ă��܂�)�B
^
�����Ŏw�肳�ꂽ�I�u�W�F�N�g��p2�Ŏw�肵���p�����[�^�ŕύX���܂��B
p2�Ŏw�肷��p�����[�^�̓I�u�W�F�N�g�̎�ނɂ���ĈقȂ�܂��B�I�u�W�F�N�g�ɂ���āA��������w�肷����̂�A���l���w�肷����̂�������Ă��܂��B�ڍׂ͉��̕\���Q�Ƃ��Ă��������B
^p
     �I�u�W�F�N�g      : p2�̎w��
 ----------------------------------------------------------
  �{�^��               : �{�^��������̕ύX(������)
  ���̓{�b�N�X(���l)   : ���͓��e�̕ύX(���l)
  ���̓{�b�N�X(������) : ���͓��e�̕ύX(������)
  �`�F�b�N�{�b�N�X     : �`�F�b�N��ON/OFF(���l)
  �R���{�{�b�N�X       : �R���{�{�b�N�X�̓��e�ύX(������)
  ���X�g�{�b�N�X       : ���X�g�{�b�N�X�̓��e�ύX(������)
^p
���Ƃ��΁A�`�F�b�N�{�b�N�X������ID���w�肵�Ă���Ap2�̃p�����[�^��1���w�肷��ƁA�`�F�b�N�{�b�N�X�������I��ON�̏�ԂɕύX���܂��B���̏ꍇ�A�`�F�b�N�{�b�N�X�̓��e��ێ�����ϐ��̒l�������I�ɏ����������܂��B
^
���̓{�b�N�X�̓��e��ύX�����ꍇ�ɂ́A�����I�ɓ��̓{�b�N�X�ɓ��̓t�H�[�J�X���ݒ肳��A�{�b�N�X���ɃJ�[�\�����\������܂��B

%href
button
input
mesbox
chkbox
listbox
combox
layerobj


%index
objsize
�I�u�W�F�N�g�T�C�Y�ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2,p3
p1=0�`(64)  : �I�u�W�F�N�g��X�����̃T�C�Y�i�h�b�g�P�ʁj
p2=0�`(24)  : �I�u�W�F�N�g��Y�����̃T�C�Y�i�h�b�g�P�ʁj
p3=0�`(0)   : Y�����̍Œ�m�ۍs�T�C�Y (�h�b�g�P��)

%inst
�{�^������̓{�b�N�X�Ȃǂ�z�u���鎞�̃I�u�W�F�N�g�̑傫����ݒ肵�܂��B
^
p3�Ń{�^���⃁�b�Z�[�W���u���ꂽ��ɃJ�����g�|�W�V�������ړ�����Œ�ʂ��w�肷�邱�Ƃ��ł��܂��B����ɂ��A�{�^���ƃ��b�Z�[�W��A�����Ēu�������ɓ����傫���ŃX�y�[�X���󂭂悤�ɂȂ�܂��B
^
��ʂ��N���A�����ƁA�I�u�W�F�N�g�T�C�Y�͎����I�Ƀf�t�H���g�ɖ߂�܂��B

%href
button
chkbox
combox
input
listbox




%index
objsel
�I�u�W�F�N�g�ɓ��̓t�H�[�J�X��ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
p1
p1=0�`(0) : �I�u�W�F�N�gID�w��

%inst
p1�Ŏw�肵���I�u�W�F�N�gID�ɓ��̓t�H�[�J�X�����킹�܂��B
���̓t�H�[�J�X�����킹�邱�Ƃɂ��A mesbox���߂�input���߂Ŕz�u�������̓{�b�N�X�̒��ɓ��̓J�[�\��(�L�����b�g)���o�����Ƃ��ł��܂��B
���̖��߂́A�����̓��̓{�b�N�X�ŔC�ӂ̏ꏊ�ɓ��̓t�H�[�J�X�����킹�����ꍇ��A���̓��̓{�b�N�X�ɃL�[���͂Ȃǂňړ�����悤�ȏ������s�Ȃ����߂̂��̂ł��B
�܂��Ap1��-1���w�肵���ꍇ�́A���݁A���̓t�H�[�J�X�������Ă���I�u�W�F�N�gID���V�X�e���ϐ�stat�ɑ�����܂��B



%index
objmode
�I�u�W�F�N�g���[�h�ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2
p1=0�`(0) : �I�u�W�F�N�g�t�H���g�ݒ胂�[�h�w��
p2=0�`1   : �t�H�[�J�X�ړ��L�[�w��(0=OFF/1=ON)
%inst
button,input,mesbox �Ȃǂ̃I�u�W�F�N�g���䖽�߂Ŏg�p�����X�^�C������ݒ肷�邽�߂̖��߂ł��B
p1�Ńt�H���g�ݒ�y�сA�X�^�C���Ɋւ��郂�[�h���w�肷�邱�Ƃ��ł��܂��B
����ɂ��A�ȍ~�̃I�u�W�F�N�g�z�u���ߎ��s���̃X�^�C���ݒ肪�ς��܂��B
���[�h�̒l�Ɠ��e�͈ȉ��̒ʂ�ł��B
^p
   p1 : �}�N����          : ���[�h
 ------------------------------------------------------------
    0 : objmode_normal      HSP�W���t�H���g���g�p
    1 : objmode_guifont     �f�t�H���gGUI�t�H���g���g�p
    2 : objmode_usefont     font���߂őI������Ă���t�H���g���g�p
    4 : objmode_usecolor    color����/objcolor���߂̐F���g�p
^p
�E�B���h�E�����������ꂽ����́A���[�h1�ɐݒ肳��Ă��܂��B
^
���[�h2�ɕύX�����ꍇ�́A font���߂Ŏw�肵���t�H���g���g����悤�ɂȂ�܂��B����́A�I�u�W�F�N�g���䖽�߂����s����鎞�_�ŁA�ݒ肳��Ă���t�H���g���g�p����܂��B objmode���߂����s���ꂽ���_�̃t�H���g�ł͂Ȃ��̂Œ��ӂ��Ă��������B
^
���[�h4(objmode_usecolor)�́A���̃��[�h�Ɖ��Z���邱�Ƃŕ��p���ł��܂��B�uobjmode_usefont+objmode_usecolor�v���w�肵���ꍇ�́A�ǂ���̃��[�h���L���ɂȂ�܂��B
^
p2�ŁA[TAB]�L�[�ɂ��I�u�W�F�N�g�̃t�H�[�J�X�ړ����[�h�� ON/OFF���s�Ȃ��܂��B p2��1�Ɏw�肵���ꍇ�́A�\������Ă���I�u�W�F�N�g�̓��̓t�H�[�J�X��[TAB]�L�[�ňړ����邱�Ƃ��ł��܂��Bp2�̃��[�h�w����ȗ������ꍇ�́A�ȑO�̃��[�h�������p���܂��B
^p
  p2 : ���[�h
 --------------------------------------------------------------
  0  : [TAB]�𖳌��ɂ���
  1  : [TAB]�L�[�ɂ��I�u�W�F�N�g�̃t�H�[�J�X�ړ��\(�W��)
^p
%href
button
chkbox
combox
input
listbox
objmode_guifont
objmode_normal
objmode_usefont
objmode_usecolor
objcolor



%index
objcolor
�I�u�W�F�N�g�̃J���[�ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2,p3
p1,p2,p3=0�`255(0) : �F�R�[�h�iR,G,B�̋P�x�j

%inst
�I�u�W�F�N�g���g�p����F��ݒ肵�܂��B
p1,p2,p3�����ꂼ��AR,G,B�̋P�x�ɂȂ�܂��B�w�肷��l�́A0���ł��Â��A255���ł����邭�Ȃ�܂��B(0,0,0 �͍��ɁA255,255,255 �͔��ɂȂ�܂��B)
^
objcolor���߂Ŏw�肳�ꂽ�F�́Aobjmode���߂�objmode_usecolor�I�v�V�������w�肳��Ă��鎞�̂ݗL���ɂȂ�܂��B
objmode_usecolor�I�v�V�����ɂ��A�I�u�W�F�N�g�z�u���̕����F�A�w�i�F���w�肷�邱�Ƃ��\�ɂȂ�܂��B

%href
objmode
color
objmode_usecolor




%index
objenable
�I�u�W�F�N�g�̗L���E������ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2
p1=0�`(0) : �I�u�W�F�N�gID�w��
p2=0�`(1) : 0�Ȃ�Ζ����A0�ȊO�͗L��

%inst
p1�Ŏw�肵���I�u�W�F�N�gID�̏�Ԃ�ύX���܂��B
p2�Ŏw�肵���l��0�Ȃ�΁A�I�u�W�F�N�g�͖���������܂��B
���������ꂽ�I�u�W�F�N�g�́A��ʏ�ɑ��݂��܂����F���ύX����A���삷�邱�Ƃ͂ł��Ȃ��Ȃ�܂��B
p2�Ŏw�肵���l��0�ȊO���w�肷��ƁA�ʏ�ʂ�̗L���ȃI�u�W�F�N�g�ƂȂ�܂��B
���̓{�b�N�X��{�^���ȂǁA���ׂẴI�u�W�F�N�g��L���E���������邱�Ƃ��ł��܂��B
%href
objgray

%port-
Let


%index
objskip
�I�u�W�F�N�g�̃t�H�[�J�X�ړ����[�h��ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2
p1=0�`(0) : �I�u�W�F�N�gID�w��
p2=1�`(2) : �t�H�[�J�X�ړ����[�h

%inst
p1�Ŏw�肵���I�u�W�F�N�gID�̃t�H�[�J�X�ړ����[�h��ݒ肵�܂��B
�t�H�[�J�X�ړ����[�h�́A[TAB]�L�[�ɂ��z�u���ꂽ�I�u�W�F�N�g���ړ�������ꍇ�̋������I�u�W�F�N�g���ƂɎw�肷����̂ł��B
p2�Ń��[�h�l���w�肵�܂��B���[�h�l�̏ڍׂ́A�ȉ��̒ʂ�ł��B
^p
  p2 : �t�H�[�J�X�ړ����[�h
 --------------------------------------------------------------
   1 : [TAB]�L�[�ɂ�莟�̃I�u�W�F�N�g�Ƀt�H�[�J�X���ړ��\(�W��)
   2 : [TAB]�L�[�ɂ�莟�̃I�u�W�F�N�g�Ƀt�H�[�J�X�ړ��͕s�\
   3 : [TAB]�L�[�ɂ��I�u�W�F�N�g�ւ̃t�H�[�J�X�ړ��͍s�Ȃ�Ȃ�(�X�L�b�v)
  +4 : �t�H�[�J�X�ړ����Ƀe�L�X�g��S�I������(���̓{�b�N�X�̂�)
^p
�ʏ�́A�I�u�W�F�N�g��z�u�����i�K�ōœK�ȃ��[�h���ݒ肳��Ă���̂ŁA�t�H�[�J�X�ړ����[�h���Đݒ肷��K�v�͂���܂���B
����Ȗ������ʂ����I�u�W�F�N�g�����A�t�H�[�J�X�ړ����[�h�ς�����Awinobj���߂ɂ��V�X�e����`�̃I�u�W�F�N�g��V�����ǉ������ꍇ�Ɏg�p���Ă��������B
objmode���߂ɂ��A�t�H�[�J�X�ړ����[�h�̋@�\��OFF�ɂ���Ă���ꍇ�́A[TAB]�L�[�ɂ��t�H�[�J�X�ړ��͍s�Ȃ��܂���̂Œ��ӂ��Ă��������B

%href
winobj
objmode

%port-
Let


%index
objimage
�J�X�^���{�^���̐ݒ�
%group
�I�u�W�F�N�g���䖽��
%prm
id,x1,y1,x2,y2,x3,y3
id    : �J�X�^���{�^���̎Q�ƃo�b�t�@ID
x1,y1 : �J�X�^���{�^���̎Q�ƍ��W1(�ʏ펞)
x2,y2 : �J�X�^���{�^���̎Q�ƍ��W2(����������)
x3,y3 : �J�X�^���{�^���̎Q�ƍ��W3(�}�E�X�I�[�o�[��)

%inst
�J�X�^���{�^����z�u���邽�߂̐ݒ���s�Ȃ��܂��B
�J�X�^���{�^���́Abutton���߂ō쐬����鉟���{�^���̃I�u�W�F�N�g�O�ς�C�ӂ̉摜�ɒu�������邱�Ƃ��ł��܂��B
�J�X�^���{�^�����쐬���邽�߂ɂ́A���炩���߃{�^���Ƃ��ĕ\�����邽�߂̉摜��p�ӂ��Ȃ���΂Ȃ�܂���B
^
id�p�����[�^�[�ŁA�J�X�^���{�^���̉摜���i�[����Ă����ʃo�b�t�@ID���w�肵�܂��B
id�p�����[�^�[���ȗ����邩�A�܂���-1���w�肷��ƃJ�X�^���{�^���̐ݒ�͖����ƂȂ�A�ʏ��Windows�V�X�e�����p�ӂ���{�^�����g�p����܂��B
(x1,y1)�ɁA�ʏ�̃{�^���Ƃ��ĕ\������摜�̍�����W���w�肵�܂��B(�p�����[�^�[�ȗ����́A(0,0)���w�肳��܂�)
(x2,y2)�ł́A�{�^���������ꂽ���ɁA�{�^���ɕ\������摜�̍�����W���w�肵�܂��B(�p�����[�^�[�ȗ����́A(0,0)���w�肳��܂�)
(x3,y3)�ł́A�}�E�X���{�^����ɏ����(�}�E�X�I�[�o�[)���A�{�^���ɕ\������摜�̍�����W���w�肵�܂��B(�p�����[�^�[�ȗ����́Ax1,y1�Ɠ��l�̒l���g�p����܂�)
^
objimage���߂ɂ���ăJ�X�^���{�^���̐ݒ肪�s�Ȃ�ꂽ��́Abutton���߂Ŕz�u�����{�^�����ׂĂɐݒ肪�K�p����܂��B
�J�X�^���{�^���́A�w�肳�ꂽ�摜���{�^�����z�u����Ă���ꏊ�ɃR�s�[���邱�ƂŊO�ς�ύX���Ă��܂��B
�R�s�[�����͈͂́A�{�^���Ɠ���(objsize���߂Őݒ肳�ꂽ)�T�C�Y�ƂȂ�܂��B
�O�ψȊO�̋����́A�ʏ�̃{�^���ƕς�肠��܂���B�{�^����̕����\����A�t�H�[�J�X�ړ��������l�ɃT�|�[�g����܂��B
�J�X�^���{�^���̐ݒ�́A��ʂ̏�������(cls���߂�screen���ߎ��s��)�ɃN���A����܂��B

%href
button

%port-
Let


%index
layerobj
���C���[�I�u�W�F�N�g��ǉ�
%group
�I�u�W�F�N�g���䖽��
%prm
p1,p2,p3,*label,p4
p1,p2     ; ���C���[�I�u�W�F�N�g��XY�T�C�Y�i�h�b�g�P�ʁj
p3(0)     : ���C���[ID
*label    : ���C���[�I�u�W�F�N�g�̏����T�u���[�`��
p4=0�`(0) : �I�v�V�����l

%inst
�J�����g�|�W�V�����Ƀ��C���[�I�u�W�F�N�g��z�u���܂��B
���C���[�I�u�W�F�N�g�́A���[�U�[�ɂ���Ē�`�����z�u�I�u�W�F�N�g�ł��B
���炩���߉�ʏ�̕`����s���T�u���[�`����o�^���Ă������ƂŁA�w�肵���^�C�~���O(���C���[)�ŕ`������s�����邱�Ƃ��ł��܂��B
���C���[�I�u�W�F�N�g�ɕ`��̈��ʒm���邽�߁Ap1,p2��X,Y�T�C�Y���h�b�g�P�ʂŎw�肷��K�v������܂��Bp1,p2�̎w����ȗ������ꍇ�́A��ʑS�̂̃T�C�Y�ƂȂ�܂��B
����ŁA�J�����g�|�W�V����X,Y������̍��W�Ƃ��āAp1,p2�Ŏw�肵���T�C�Y�܂ł����C���[�I�u�W�F�N�g�Ƃ��Ĉ����܂��B
p3�p�����[�^�[�ŁA�`�悷�郌�C���[���w�肵�܂��B
^p
  p3 : �`�悷�郌�C���[
 --------------------------------------------------------------
    0 : �`����s��Ȃ�(objlayer_min)
    1 : �w�i���C���[(objlayer_bg)
    2 : �ʏ�̕`�惌�C���[(objlayer_normal)
    3 : GUI���C���[(objlayer_posteff)
    4 : �őO�ʂ̕`�惌�C���[(objlayer_max)
 +256 : ���C���[�I�u�W�F�N�g�̏d���o�^��������(objlayer_multi)
^p
*label�p�����[�^�[�ŁA���C���[�I�u�W�F�N�g�̏����T�u���[�`�����w�肵�܂��B
���̃T�u���[�`���̓��[�U�[���g���p�ӂ���K�v������܂��B
p4�p�����[�^�[�ŁA���C���[�I�u�W�F�N�g�ɐݒ肷��C�ӂ̐����l��ݒ肷�邱�Ƃ��ł��܂��B
^
���C���[�I�u�W�F�N�g�������s�����͂��ׂă��[�U�[���쐬�����T�u���[�`���ɔC����Ă��܂��B
�T�u���[�`���́A�V�X�e���ϐ�iparam,wparam,lparam���ݒ肳�ꂽ��ԂŌĂяo����܂��B�����̏������ƂɁA���C���[�I�u�W�F�N�g�̕`����܂߂āA���[�U�[���������L�q���Ă��������B
���C���[�I�u�W�F�N�g�̏����T�u���[�`�����ł́A�`��݂̂��s���Ă�����return���߂ŏ������I��������K�v������܂��Bwait/await/redraw�Ȃǂ̃^�X�N����~���閽�߂͋L�q�ł��܂���B
���C���[�I�u�W�F�N�g�ɂ��Ă̏ڂ����g�p���@�́A�v���O���~���O�}�j���A�����Q�Ƃ��Ă��������B


%href
objprm

%port-
Let

