;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.4
%note
hspcv.as���C���N���[�h���邱�ƁB

%date
2009/08/01
%author
onitama
%dll
hspcv
%url
http://hsp.tv/
%port
Win


%index
cvreset
HSPCV�̏�����
%group
�g����ʐ��䖽��
%inst
HSPCV�����uCV�o�b�t�@�v�����ׂĔj�����āA������Ԃɖ߂��܂��B
HSPCV�̊J�n�A�I�����ɂ͎����I�ɏ��������s�Ȃ��܂��B
�����I�ɏ���������������cvreset���߂��g�p���Ă��������B



%index
cvsel
�Ώ�CV�o�b�t�@�̐ݒ�
%group
�g����ʐ��䖽��
%prm
p1
p1 : CV�o�b�t�@ID
%inst
�W���̑����CV�o�b�t�@ID��ݒ肵�܂��B
�p�����[�^�[�ŁACV�o�b�t�@ID���w�肷�鎞�ɏȗ������ꍇ�ɂ́A�W���̑����CV�o�b�t�@ID���g�p����܂��B



%index
cvbuffer
CV�o�b�t�@��������
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1(0)   : CV�o�b�t�@ID
p2(640) : ���̃s�N�Z���T�C�Y
p3(480) : �c�̃s�N�Z���T�C�Y
%inst
�w�肵���T�C�Y��CV�o�b�t�@�����������܂��B
�o�b�t�@�����������邱�Ƃɂ��A�e��摜�������\�ɂȂ�܂��B
CV�o�b�t�@�́A�t���J���[���[�h(RGB�e8bit)�ŏ���������܂��B
%href
cvload



%index
cvresize
�摜�̃��T�C�Y
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1(0) : ���̃s�N�Z���T�C�Y
p2(0) : �c�̃s�N�Z���T�C�Y
p3 : CV�o�b�t�@ID
p4(1) : ��ԃA���S���Y��
%inst
CV�o�b�t�@��(p1,p2)�Ŏw�肵���T�C�Y�ɕύX���܂��B
p3�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B
p4�ŕ�ԃA���S���Y�����w�肵�܂��B
p4�Ŏw�肷����e�͈ȉ�����1�I�Ԃ��Ƃ��ł��܂��B
^p
	CV_INTER_NN - �j�A���X�g�l�C�o�[
	CV_INTER_LINEAR - �o�C���j�A(�f�t�H���g)
	CV_INTER_AREA - �s�N�Z�����ӂ����T���v�����O
	                (���A����ጸ���邱�Ƃ��ł��܂�)
	CV_INTER_CUBIC - �o�C�L���[�r�b�N
^p



%index
cvgetimg
�摜�̎擾
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : CV�o�b�t�@ID
p2(0) : �擾���[�h
%inst
CV�o�b�t�@�̓��e��HSP�̃E�B���h�E�o�b�t�@�ɓ]�����܂��B
�]����ƂȂ�HSP�̃E�B���h�E�o�b�t�@�́Agsel���߂Ŏw�肳��Ă��錻�݂̑����E�B���h�EID�ƂȂ�܂��B
p1�œ]�����ƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́AID0���g�p����܂��B
p2�ŁA�]�����̕��@���w�肷�邱�Ƃ��ł��܂��B
p2��0�̏ꍇ�́AHSP�̃E�B���h�E�o�b�t�@�T�C�Y�͂��̂܂܂œ]�����s�Ȃ��܂��B
p2��1���w�肵���ꍇ�́ACV�o�b�t�@�Ɠ����T�C�Y��HSP�̃E�B���h�E�o�b�t�@�T�C�Y��ύX������œ]�����s�Ȃ��܂��B
%href
cvputimg



%index
cvputimg
CV�o�b�t�@�ɏ�������
%group
�g����ʐ��䖽��
%prm
p1
p1 : CV�o�b�t�@ID
%inst
HSP�̃E�B���h�E�o�b�t�@���e��CV�o�b�t�@�ɓ]�����܂��B
�]�����ƂȂ�HSP�̃E�B���h�E�o�b�t�@�́Agsel���߂Ŏw�肳��Ă��錻�݂̑����E�B���h�EID�ƂȂ�܂��B
p1�œ]����ƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B
%href
cvgetimg


%index
cvload
�摜�t�@�C���ǂݍ���
%group
�g����ʐ��䖽��
%prm
"filename",p1
"filename" : �摜�t�@�C����
p1 : CV�o�b�t�@ID
%inst
CV�o�b�t�@���w�肳�ꂽ�摜�t�@�C���̓��e�ŏ��������܂��B
p1�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

�摜�t�@�C���̃t�H�[�}�b�g�̓t�@�C���g���q�ɂ���Ĕ��f����܂��B
�g�p�ł���t�H�[�}�b�g�Ɗg���q�͈ȉ��̒ʂ�ł��B
^p
	Windows bitmaps - BMP, DIB
	JPEG files - JPEG, JPG, JPE
	Portable Network Graphics - PNG
	Portable image format - PBM, PGM, PPM
	Sun rasters - SR, RAS
	TIFF files - TIFF, TIF
	OpenEXR HDR images - EXR
	JPEG 2000 images - JP2
^p
����������ɏI�������ꍇ�ɂ́A�V�X�e���ϐ�stat��0�ɂȂ�܂��B
���炩�̃G���[�����������ꍇ�ɂ́A�V�X�e���ϐ�stat��0�ȊO�̒l�ƂȂ�܂��B
#pack�A#epack���Ŏ��s�t�@�C���y��DPM�t�@�C���ɖ��ߍ��܂ꂽ�t�@�C���͓ǂݍ��ނ��Ƃ��ł��܂���̂Œ��ӂ��Ă��������B
%href
cvsave



%index
cvsave
�摜�t�@�C����������
%group
�g����ʐ��䖽��
%prm
"filename",p1,p2
"filename" : �摜�t�@�C����
p1 : CV�o�b�t�@ID
p2 : �I�v�V�����l
%inst
CV�o�b�t�@�̓��e���w�肳�ꂽ�摜�t�@�C�����ŕۑ����܂��B
p1�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

�摜�t�@�C���̃t�H�[�}�b�g�̓t�@�C���g���q�ɂ���Ĕ��f����܂��B
�g�p�ł���t�H�[�}�b�g�Ɗg���q�͈ȉ��̒ʂ�ł��B
^p
	Windows bitmaps - BMP, DIB
	JPEG files - JPEG, JPG, JPE
	Portable Network Graphics - PNG
	Portable image format - PBM, PGM, PPM
	Sun rasters - SR, RAS
	TIFF files - TIFF, TIF
	OpenEXR HDR images - EXR
	JPEG 2000 images - JP2
^p
p2�Ŏw�肷��I�v�V�����l�́A�t�H�[�}�b�g���Ƃ̐ݒ���w�肷�邽�߂̂��̂ł��B
���݂́AJPEG�t�H�[�}�b�g�ۑ����̕i��(0�`100)�̂ݎw��\�ł��B
p2�̎w����ȗ������ꍇ�́AJPEG�t�H�[�}�b�g�ۑ����ɁA�i��95���g�p����܂��B
����������ɏI�������ꍇ�ɂ́A�V�X�e���ϐ�stat��0�ɂȂ�܂��B
���炩�̃G���[�����������ꍇ�ɂ́A�V�X�e���ϐ�stat��0�ȊO�̒l�ƂȂ�܂��B
%href
cvload



%index
cvgetinfo
CV�o�b�t�@�����擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1 : CV�o�b�t�@��񂪎擾�����ϐ�
p2 : CV�o�b�t�@ID
p3 : CV�o�b�t�@���ID
%inst
CV�o�b�t�@�Ɋւ�������擾����p1�̕ϐ��ɑ�����܂��B
p2�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

p3�Ŏ擾������̎�ނ��w�肷�邱�Ƃ��ł��܂��B
p3�Ɏw��ł���}�N���͈ȉ��̒ʂ�ł��B
^p
	�}�N��               ���e
	-------------------------------------------
	CVOBJ_INFO_SIZEX     �������T�C�Y
	CVOBJ_INFO_SIZEY     �c�����T�C�Y
	CVOBJ_INFO_CHANNEL   �`�����l����
	CVOBJ_INFO_BIT       �`�����l��������̃r�b�g��
^p
%href
cvbuffer
cvload



%index
cvsmooth
�摜�̃X���[�W���O
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5
p1 : �X���[�W���O�̃^�C�v
p2 : param1
p3 : param2
p4 : param3
p5 : CV�o�b�t�@ID
%inst
CV�o�b�t�@�ɃX���[�W���O��K�p���܂��B
p5�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

p1�Ŏw�肷�邱�Ƃ̂ł���}�N���͈ȉ��̒ʂ�ł��B

CV_BLUR_NO_SCALE
(param1�~param2�̗̈�Ńs�N�Z���l�𑫂����킹��)

CV_BLUR
(param1�~param2�̗̈�Ńs�N�Z���l�𑫂����킹����A
 1/(param1*param2)�ŃX�P�[�����O����)

CV_GAUSSIAN
(param1�~param2�K�E�V�A���t�B���^)

CV_MEDIAN
(param1�~param2���f�B�A���t�B���^)

CV_BILATERAL
(3�~3�o�C���e�����t�B���^(param1=�F���U, param2=��ԕ��U))
^p
http://www.dai.ed.ac.uk/CVonline/LOCAL_COPIES/MANDUCHI1/Bilateral_Filtering.html
^p
�uparam1�~param2�v�̃p�����[�^�[�́A1�ȏ�̊���w�肷��K�v������܂��B



%index
cvthreshold
�摜��臒l�Ŏ擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1 : �Q�l���^�C�v
p2 : 臒l(����)
p3 : ��l����̉�f�l(����)
p4 : CV�o�b�t�@ID
%inst
CV�o�b�t�@�ɑ΂���臒l�����ƂɂQ�l�����s�Ȃ��܂��B
p4�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B
p1�Ŏw�肷�邱�Ƃ̂ł���}�N���͈ȉ��̒ʂ�ł��B
^p
CV_THRESH_BINARY     : val = (val > thresh ? MAX:0)
CV_THRESH_BINARY_INV : val = (val > thresh ? 0:MAX)
CV_THRESH_TRUNC      : val = (val > thresh ? thresh:val)
CV_THRESH_TOZERO     : val = (val > thresh ? val:0)
CV_THRESH_TOZERO_INV : val = (val > thresh ? 0:val)
^p




%index
cvrotate
�摜�̉�]
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5,p6
p1(0) : �p�x(����)
p2(1) : �X�P�[��(����)
p3(0) : ���S���W��X�I�t�Z�b�g(����)
p4(0) : ���S���W��Y�I�t�Z�b�g(����)
p5 : ��ԃA���S���Y��
p6 : CV�o�b�t�@ID
%inst
CV�o�b�t�@�S�̂���]�����܂��B
p1�Ŋp�x(360�x�ň��)���Ap2�ŃX�P�[����ݒ肵�܂��B
(p3,p4)�Œ��S�̃I�t�Z�b�g���w�肷�邱�Ƃ��Ă��܂��B
p5�ŁA��]���̕�ԃA���S���Y�����w�肵�܂��B
p5�Ŏw�肷����e�͈ȉ�����1�I�Ԃ��Ƃ��ł��܂��B
^p
	CV_INTER_NN - �j�A���X�g�l�C�o�[
	CV_INTER_LINEAR - �o�C���j�A(�f�t�H���g)
	CV_INTER_AREA - �s�N�Z�����ӂ����T���v�����O
	                (���A����ጸ���邱�Ƃ��ł��܂�)
	CV_INTER_CUBIC - �o�C�L���[�r�b�N
^p
�܂��Ap5�ɓ����w��ł���I�v�V�������p�ӂ���Ă��܂��B
^p
	CV_WARP_FILL_OUTLIERS - �O���s�N�Z���𖄂߂�
	CV_WARP_INVERSE_MAP - ��]���t�s��ōs�Ȃ�
^p
�f�t�H���g�ł́ACV_INTER_LINEAR+CV_WARP_FILL_OUTLIERS���w�肳��Ă��܂��B
p6�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B



%index
cvarea
�R�s�[���̈�̎w��
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1(0) : �R�s�[�� X���W
p2(0) : �R�s�[�� Y���W
p3(0) : �R�s�[�̈� X�T�C�Y
p4(0) : �R�s�[�̈� Y�T�C�Y
%inst
cvcopy���߂ŉ摜�̃R�s�[���s�Ȃ��ۂ̃R�s�[���̈���w�肵�܂��B
�p�����[�^�[�����ׂ�0�̏ꍇ��A���ׂďȗ�����cvarea���߂����s�����ꍇ�́ACV�o�b�t�@�S�̂��ΏۂɂȂ�܂��B
%href
cvcopy



%index
cvcopy
�摜�̃R�s�[
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5
p1(0) : �R�s�[��CV�o�b�t�@ID
p2(0) : �R�s�[�� X���W
p3(0) : �R�s�[�� Y���W
p4 : �R�s�[��CV�o�b�t�@ID
p5(0) : ���Z�I�v�V����
%inst
CV�o�b�t�@�̓��e��ʂ�CV�o�b�t�@�ɃR�s�[���܂��B
p1�Ŏw�肳�ꂽCV�o�b�t�@ID���R�s�[���Ƃ��Ďg�p����܂��B
�o�b�t�@�̈ꕔ���R�s�[����ꍇ�ɂ́Acvarea���߂ňʒu��T�C�Y�����炩���ߐݒ肵�Ă����K�v������܂��B
p5�̉��Z�I�v�V�����ɂ��A�R�s�[���ɂ������̉��Z���s�Ȃ����Ƃ��\�ł��Bp5�Ɏw��ł���}�N���͈ȉ��̒ʂ�ł��B
^p
	CVCOPY_SET (�㏑���R�s�[)
	CVCOPY_ADD (���Z)
	CVCOPY_SUB (���Z)
	CVCOPY_MUL (��Z)
	CVCOPY_DIF (����)
	CVCOPY_AND (�_����)
^p
p4�ŃR�s�[��ƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

CV�o�b�t�@�̐F���[�h�́A�R�s�[���ƃR�s�[��ō��킹�Ă����K�v������܂��B
�O���C�X�P�[��(����)��ʂƃt���J���[��ʂ����݂��ăR�s�[���邱�Ƃ͂ł��܂���B
%href
cvarea



%index
cvxors
�摜��XOR���Z
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1(255) : XOR���Z�Ŏg�p����R�l
p2(255) : XOR���Z�Ŏg�p����G�l
p3(255) : XOR���Z�Ŏg�p����B�l
p4 : �R�s�[��CV�o�b�t�@ID
%inst
CV�o�b�t�@�̓��e�ɑ΂���XOR���Z���s�Ȃ��܂��B
p1�`p3�܂łŁARGB�l�ɑ΂��鉉�Z�l(0�`255)���w�肵�܂��B
p4�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B
%href
cvcopy



%index
cvflip
�摜�̔��]
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : ���]�̃��[�h
p2 : �R�s�[��CV�o�b�t�@ID
%inst
CV�o�b�t�@�̓��e�𔽓]�����܂��B
p1�Ŕ��]�̃��[�h���w�肷�邱�Ƃ��ł��܂��B
p1��0�̏ꍇ�́A�㉺���]�ɂȂ�܂��B
p1��1�ȏ�̏ꍇ�́A���E���]�ɂȂ�܂��B
p1���}�C�i�X�l�̏ꍇ�́A�㉺���E�Ƃ��ɔ��]����܂��B

p2�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B



%index
cvloadxml
XML�t�@�C���̓ǂݍ���
%group
�g����ʐ��䖽��
%prm
"filename"
"filename" : �ǂݍ���XML�t�@�C����
%inst
"filename"�Ŏw�肳�ꂽ�t�@�C����XML�t�@�C���Ƃ��ēǂݍ��݂܂��B
XML�t�@�C���́A�摜�̊�F�����ŕK�v�ȏꍇ�ɂ��炩���ߓǂݍ���ł����K�v������܂��B

����������ɏI�������ꍇ�ɂ́A�V�X�e���ϐ�stat��0�ɂȂ�܂��B
���炩�̃G���[�����������ꍇ�ɂ́A�V�X�e���ϐ�stat��0�ȊO�̒l�ƂȂ�܂��B

#pack�A#epack���Ŏ��s�t�@�C���y��DPM�t�@�C���ɖ��ߍ��܂ꂽ�t�@�C���͓ǂݍ��ނ��Ƃ��ł��܂���̂Œ��ӂ��Ă��������B
%href
cvfacedetect



%index
cvfacedetect
�摜�̊�F��
%group
�g����ʐ��䖽��
%prm
p1,p2
p1 : CV�o�b�t�@ID
p2(1) : �X�P�[���l(����)
%inst
CV�o�b�t�@�̉摜�������̃p�^�[����F�����܂��B
�p�^�[���̃p�����[�^�[������xml�t�@�C�����A���炩����cvloadxml���߂œǂݍ���ł����K�v������܂��B

p1�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

p2�ŏ������̃X�P�[����ݒ肷�邱�Ƃ��ł��܂��B
������1���傫���l���w�肷��ƁA�������Ƀo�b�t�@�T�C�Y���k�����ď��������悤�ɂȂ�܂��B�傫�ȉ摜���Ŏ��Ԃ�
������ꍇ�ȂǂɎw�肷��Ƃ����ł��傤�B

���s��ɁA�V�X�e���ϐ�stat�ɔF�����ꂽ�����Ԃ���܂��B
stat��0�̏ꍇ�́A�܂������F������Ă��Ȃ����Ƃ������܂��B
stat��1�ȏ�̏ꍇ�́Acvgetface���߂ɂ���ĔF�����ꂽ�̈���擾���邱�Ƃ��ł��܂��B
%href
cvgetface
cvloadxml



%index
cvgetface
�F�����ꂽ���W�̎擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1 : �F�����ꂽX���W����������ϐ�
p2 : �F�����ꂽY���W����������ϐ�
p3 : �F�����ꂽX�T�C�Y����������ϐ�
p4 : �F�����ꂽY�T�C�Y����������ϐ�
%inst
cvfacedetect���߂ɂ���ĔF�����ꂽ�̈���擾���܂��B
p1����p4�܂ł̕ϐ��ɁA���W�l�������ő������܂��B
cvfacedetect���߂ɂ���ĔF�����ꂽ�������A�J��Ԃ��ė̈���擾���邱�Ƃ��ł��܂��B

����Ɏ擾�ł����ꍇ�ɂ́A���s��ɃV�X�e���ϐ�stat��0�ɂȂ�܂��B
�擾�ł���f�[�^���Ȃ��ꍇ�ɂ́A�V�X�e���ϐ�stat��1�ɂȂ�܂��B
%href
cvfacedetect



%index
cvmatch
�摜�̃}�b�`���O����
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5
p1 : �F�����ꂽX���W����������ϐ�
p2 : �F�����ꂽY���W����������ϐ�
p3 : �}�b�`���O�̃^�C�v
p4 : �}�b�`���O����CV�o�b�t�@ID
p5 : �}�b�`���O���CV�o�b�t�@ID
%inst
�}�b�`���O���CV�o�b�t�@�̒�����A�}�b�`���O����CV�o�b�t�@�ɍł��߂��̈��T���o���Č��ʂ�Ԃ��܂��B
���s��A(p1,p2)�Ɏw�肵���ϐ��֌��ʂƂȂ���W�������܂��B
p3�Ń}�b�`���O�Ŏg�p����]�����@�̃^�C�v���w�肵�܂��B
p3�Ŏw�肷�邱�Ƃ̂ł���}�N���͈ȉ��̒ʂ�ł��B
^p
CV_TM_SQDIFF
	R(x,y)=sumx',y'[T(x',y')-I(x+x',y+y')]^2

CV_TM_SQDIFF_NORMED
	R(x,y)=sumx',y'[T(x',y')-I(x+x',y+y')]^2/sqrt[sumx',y'T(x',y')^2�Esumx',y'I(x+x',y+y')^2]

CV_TM_CCORR
	R(x,y)=sumx',y'[T(x',y')�EI(x+x',y+y')]

CV_TM_CCORR_NORMED
	R(x,y)=sumx',y'[T(x',y')�EI(x+x',y+y')]/sqrt[sumx',y'T(x',y')^2�Esumx',y'I(x+x',y+y')^2]

CV_TM_CCOEFF
	R(x,y)=sumx',y'[T'(x',y')�EI'(x+x',y+y')],
	where T'(x',y')=T(x',y') - 1/(w�Eh)�Esumx",y"T(x",y")
	I'(x+x',y+y')=I(x+x',y+y') - 1/(w�Eh)�Esumx",y"I(x+x",y+y")

CV_TM_CCOEFF_NORMED
	R(x,y)=sumx',y'[T'(x',y')�EI'(x+x',y+y')]/sqrt[sumx',y'T'(x',y')^2�Esumx',y'I'(x+x',y+y')^2]
^p
p5�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

cvmatch���߂́A�����܂ł��ł��߂��̈���������邾���ŁA���S�ɓ����ł��邱�Ƃ�ۏႷ����̂ł͂���܂���B



%index
cvconvert
�F���[�h�̕ϊ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : �ϊ����[�h
p2 : CV�o�b�t�@ID
%inst
CV�o�b�t�@��p1�Ŏw�肳�ꂽ�F���[�h�ɕϊ����܂��B
p1��0�̏ꍇ�́A�t���J���[��ʂ��O���C�X�P�[��(����)��ʂɁB
p1��1�̏ꍇ�́A�O���C�X�P�[��(����)��ʂ��t���J���[��ʂɁA���ꂼ��ϊ����܂��B
p2�őΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B



%index
cvcapture
�J�����L���v�`���̊J�n
%group
�g����ʐ��䖽��
%prm
p1,p2
p1(0) : �J����ID
p2 : CV�o�b�t�@ID
%inst
�L���v�`���f�o�C�X����̓��͂��J�n���܂��B
p1�ŁA�J��������肷�邽�߂̃J����ID���w�肵�܂��B
p1�Ŏw��ł���l�͈ȉ��̒ʂ�ł��B
�����̃f�o�C�X���ڑ�����Ă���ꍇ�́A1�Âl�����Z���邱�Ƃœ��肷�邱�Ƃ��\�ł��B
^p
�}�N��          �l      ���e
-------------------------------------------------
CV_CAP_ANY      0  	���p�\�ȃf�o�C�X���ׂ�
CV_CAP_MIL      100	Matrox Imaging Library
CV_CAP_VFW      200	Video for Windows
CV_CAP_IEEE1394 300	IEEE1394(���o�[�W�����ł͖��Ή��ł�)
^p
p2�ŃL���v�`�������摜��ۑ�����ΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

�J�����L���v�`���̊J�n��́Acvgetcapture���߂ɂ���ăt���[�����Ƃ̉摜���擾���邱�Ƃ��ł��܂��B
�܂��A�s�v�ɂȂ����ꍇ�ɂ͕K��cvendcapture���߂ŃL���v�`�����I��������K�v������܂��B
%href
cvgetcapture
cvendcapture



%index
cvgetcapture
�L���v�`���摜�̎擾
%group
�g����ʐ��䖽��
%inst
cvcapture���߂ɂ���ĊJ�n���ꂽ�L���v�`���̃t���[���摜���擾���܂��B
�擾�����CV�o�b�t�@�́Acvcapture���߂Őݒ肳�ꂽID�ɂȂ�܂��B
%href
cvcapture



%index
cvendcapture
�J�����L���v�`���̏I��
%group
�g����ʐ��䖽��
%inst
cvcapture���߂ɂ���ĊJ�n���ꂽ�L���v�`�����I�����܂��B
%href
cvcapture



%index
cvopenavi
avi�t�@�C���擾�̊J�n
%group
�g����ʐ��䖽��
%prm
"filename",p1
"filename" : avi����t�@�C����
p1 : CV�o�b�t�@ID
%inst
avi����t�@�C������̓��͂��J�n���܂��B
�w�肳�ꂽ�t�@�C�����̃t���[�����擾���邱�Ƃ��ł���悤�ɂȂ�܂��B

p1�ŃL���v�`�������摜��ۑ�����ΏۂƂȂ�CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

avi�t�@�C���擾�̊J�n��́Acvgetavi���߂ɂ���ăt���[�����Ƃ̉摜���擾���邱�Ƃ��ł��܂��B
�܂��A�s�v�ɂȂ����ꍇ�ɂ͕K��cvcloseavi���߂�avi�t�@�C���擾���I��������K�v������܂��B

cvopenavi���߂́A�����܂ł�avi�t�@�C���̓��e���ȈՓI�Ɏ��o�����߂̋@�\�ŁA����ȓ���Đ����s�Ȃ����߂̂��̂ł͂���܂���B�����܂ł��A�t���[�������o���ď������s�Ȃ����߂̕⏕�@�\���Ƃ��l�����������B
�܂��Acvopenavi���߂��������Ƃ̂ł���avi�t�@�C���́A�Â��`����avi�t�H�[�}�b�g�Ɍ����Ă���A���ׂĂ�avi�t�@�C�����J�����Ƃ��ł���킯�ł͂���܂���B
%href
cvgetavi
cvcloseavi



%index
cvgetavi
avi�t�@�C���摜�̎擾
%group
�g����ʐ��䖽��
%inst
cvopenavi���߂ɂ���ĊJ�n���ꂽavi�t�@�C���̃t���[���摜���擾���܂��B
�擾�����CV�o�b�t�@�́Acvcapture���߂Őݒ肳�ꂽID�ɂȂ�܂��B
%href
cvopenavi



%index
cvcloseavi
avi�t�@�C���擾�̏I��
%group
�g����ʐ��䖽��
%prm
%inst
cvopenavi���߂ɂ���ĊJ�n���ꂽavi�t�@�C���擾���I�����܂��B
%href
cvopenavi



%index
cvmakeavi
avi�t�@�C���o�͂̊J�n
%group
�g����ʐ��䖽��
%prm
"filename",p1,p2,p3
"filename" : �o�͂���avi����t�@�C����
p1(-1) : 32bit Codec�R�[�h
p2(29.97) : �����ɂ��t���[�����[�g(fps)
p3 : CV�o�b�t�@ID
%inst
avi����t�@�C���ւ̏o�͂��J�n���܂��B
�w�肳�ꂽ�t�@�C������avi�t�@�C�����쐬���܂��B

p1�ŃR�[�f�b�N������32bit�̃R�[�h(FOURCC)���w�肵�܂��B
p1��-1���w�肵���ꍇ�́A�R�[�f�b�N��I������_�C�A���O���J���܂��B
p2�Ŏ����ɂ��t���[�����[�g(fps)���w�肵�܂��B
p2�̎w�肪�ȗ����ꂽ�ꍇ�ɂ́A29.97fps�ƂȂ�܂��B

p3�ŏo�͉摜��ێ�����CV�o�b�t�@ID���w�肵�܂��B
�ȗ����ꂽ�ꍇ�́Acvsel���߂Őݒ肳�ꂽID���g�p����܂��B

�o�͂̊J�n��́Acvputavi���߂ɂ���ăt���[�����Ƃ̉摜��o�^���āA�Ō��cvendavi���߂��Ăяo���K�v������܂��B
%href
cvputavi
cvendavi



%index
cvputavi
avi�t�@�C���ɉ摜���o��
%group
�g����ʐ��䖽��
%inst
cvmakeavi���߂ɂ���ĊJ�n���ꂽavi�t�@�C���ɁA�t���[���摜��ǉ����܂��B
�Q�Ƃ����CV�o�b�t�@�́Acvmakeavi���߂Őݒ肳�ꂽID�ɂȂ�܂��B
%href
cvmakeavi



%index
cvendavi
avi�t�@�C���o�͂̏I��
%group
�g����ʐ��䖽��
%inst
cvmakeavi���߂ɂ���ĊJ�n���ꂽavi�t�@�C���o�͂��I�����܂��B
%href
cvmakeavi



%index
cvj2opt
JPEG-2000�ۑ��I�v�V�����ݒ�
%group
�g����ʐ��䖽��
%prm
"format","option"
"format" : �t�H�[�}�b�g������
"option" : �I�v�V����������
%inst
cvsave���߂�JPEG-2000�`��(.jp2)���w�肵���ۂ̏ڍאݒ���s�Ȃ��܂��B
�t�H�[�}�b�g������ɂ́A�ȉ��̂����ꂩ���w�肷�邱�Ƃ��ł��܂��B
(JPEG�ȊO�̃t�H�[�}�b�g���w�肵���ꍇ�ł��A�g���q��jp2�̂܂܂ɂȂ�̂Œ��ӂ��Ă�������)
^p
	�t�H�[�}�b�g������     �`��
	----------------------------------------
		mif	    My Image Format
		pnm	    Portable Graymap/Pixmap
		bmp	    Microsoft Bitmap
		ras	    Sun Rasterfile
		jp2	    JPEG2000 JP2 File Format Syntax
		jpc	    JPEG2000 Code Stream Syntax
		jpg	    JPEG
		pgx	    JPEG2000 VM Format
^p
�I�v�V����������ɂ��A�t���ݒ���s�Ȃ����Ƃ��ł��܂��B
^p
	��:
		cvj2opt "jp2","rate=0.1"
		cvsave "test2000.jp2"
^p
�I�v�V����������́A�t�H�[�}�b�g���Ƃɐݒ���@���قȂ�܂��B
�ڂ����́Ajasper���C�u�����Ɋ܂܂��A�R�}���h���C���c�[��
jasper�̃I�v�V�������Q�Ƃ��Ă��������B
^p
http://www.ece.uvic.ca/~mdadams/jasper/
^p
%href
cvsave



