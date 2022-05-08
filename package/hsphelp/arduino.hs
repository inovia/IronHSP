%dll
arduino
%ver
3.5
%date
2016/07/01
%author
onitama

%url
http://hsp.tv/

%note
arduino.as���C���N���[�h���邱�ƁB

%type
���[�U�[��`����

%group
�g�����o�͐��䖽��

%port
Win

%index
arduino_init
arduino�ʐM�̏�����

%prm
port, baud
port=0�`(0) : COM�|�[�g�ԍ�
baud=0�`(0) : �ʐM�{�[���[�g

%inst
USB���o�R����arduino�f�o�C�X�Ƃ̃V���A���ʐM�����������܂��B
�������̌��ʂ��A�V�X�e���ϐ�stat�ɔ��f����܂��B
stat��0�̏ꍇ�́A������������ɏI���������Ƃ������܂��B
����ȊO�̏ꍇ�́A�G���[���������Ă��܂��B�G���[�����������ꍇ�́A�ϐ�arduino_error�ɃG���[���b�Z�[�W���i�[����܂��B

arduino.as���T�|�[�g���閽�߂��g�p����ۂɂ́A�ŏ��ɕK��arduino_init���Ăяo���ĉ������B
arduino_init���߂ɂ́ACOM�|�[�g�ԍ��ƃ{�[���[�g�̃p�����[�^�[�𐳂����w�肷��K�v������܂��B
Arduino IDE�ŒʐM���s�Ȃ��Ă���COM�|�[�g�ԍ��A�y��firmata�Ŏg�p���Ă���{�[���[�g(�ʏ��57600)��K�؂ɋL�q���Ă��������B

%href
arduino_bye
arduino_exec



%index
arduino_bye
arduino�ʐM�̏I��

%prm

%inst
arduino�f�o�C�X�Ƃ̃V���A���|�[�g�̉�����s�Ȃ��ʐM���I�����܂��B


%href
arduino_init
arduino_exec



%index
arduino_exec
arduino��M�����̎��s

%prm

%inst
USB���o�R����arduino�f�o�C�X�Ƃ̎�M���������s���܂��B
���ʂ��A�V�X�e���ϐ�stat�ɔ��f����܂��Bstat��0�̏ꍇ�́A������������ɏI���������Ƃ������܂��B
����ȊO�̏ꍇ�́A�G���[���������Ă��܂��B�G���[�����������ꍇ�́A�ϐ�arduino_error�ɃG���[���b�Z�[�W���i�[����܂��B
arduino_exec���߂́A�V���A���ʐM���Ď����āAarduino����̃��b�Z�[�W��K�؂ɏ������܂��B
�A�v���P�[�V�����̓��쒆�́A��莞�Ԃ��ƂɎ��s����悤�ɂ��Ă��������B

%sample
	arduino_exec
	if stat {
		; �G���[������ΏI��
		dialog arduino_error
		end
	}

%href
arduino_init
arduino_bye


%index
delay
���ԑ҂�

%prm
ms
ms=0�`(0) : ���s��҂���(�~���b�P��)

%inst
�w�肳�ꂽ���ԁA�X�N���v�g�̎��s���~�����܂��B
�����I�ɂ́Aawait���߂ƕς�肠��܂���B
arduino IDE�ŗp�ӂ���Ă���delay�֐��ƌ݊��Ŏg�p���邱�Ƃ��ł��܂��B

%href
await
arduino_init


%index
pinmode
�s���̃��[�h�ݒ�

%prm
pin, outmode
pin=0�`(0)     : �f�W�^���s���ԍ�
outmode=0�`(0) : �ݒ肳��郂�[�h(MODE_*)

%inst
arduino�̃f�W�^���s�����w�肵�����[�h�ɐݒ肵�܂��B
���Ƃ��΁A�upinmode 9, MODE_OUTPUT�v�́A9�Ԃ̃s�����f�W�^���o�͂ɐݒ肵�܂��B
pinmode���߂́Afirmata�ŋK�肳�ꂽ�������̃��[�h���w�肷�邱�Ƃ��ł��܂��B
�ȉ��̃��[�h���}�N���Ƃ��Ē�`����Ă��܂��B
^p
	���[�h��       ���e
	--------------------------------
	MODE_INPUT    �f�W�^������
	MODE_OUTPUT   �f�W�^���o��
	MODE_ANALOG   �A�i���O�o��
	MODE_PWM      PWM����(�o��)
	MODE_SERVO    �T�[�{����(�o��)
^p
�K�؂Ƀ��[�h�ݒ���s�Ȃ�����́A�w�肳�ꂽ�s���ł̓��o�͂��\�ɂȂ�܂��B

%href
digitalWrite
analogWrite
digitalRead
analogRead

%index
digitalWrite
�f�W�^���f�[�^�̏o��

%prm
pin, value
pin=0�`(0)   : �f�W�^���s���ԍ�
value=0�`(0) : �o�͂���l

%inst
pin�Ŏw�肳�ꂽ�s���ɁAvalue�Őݒ肳�ꂽ�l���o�͂��܂��B
�o�͂����l�́A0(OFF)�A��1(ON)�̂ǂ��炩�ɂȂ�܂��B�uD_LOW�v(OFF)�A���uD_HIGH�v(ON)�̃}�N�����w�肷�邱�Ƃ��\�ł��B

%href
analogWrite


%index
analogWrite
�A�i���O�f�[�^�̏o��

%prm
pin, value
pin=0�`(0)   : �f�W�^���s���ԍ�
value=0�`(0) : �o�͂���l

%inst
pin�Ŏw�肳�ꂽ�s���ɁAvalue�Őݒ肳�ꂽ�l���o�͂��܂��B
�o�͂����l�́A0(�ŏ�)����255(�ő�)�͈̔͂ƂȂ�܂��B�uD_LOW�v(0)�A���uD_HIGH�v(255)�̃}�N�����w�肷�邱�Ƃ��\�ł��B

%href
digitalWrite


%index
digitalRead
�f�W�^���f�[�^�̓ǂݏo��

%prm
(pin)
pin=0�`(0)   : �f�W�^���s���ԍ�

%inst
pin�Ŏw�肳�ꂽ�s���̓��e���擾���܂��B
�擾�����l�́A0(OFF)�A��255(ON)�̂ǂ��炩�ɂȂ�܂��B�uD_LOW�v(OFF)�A���uD_HIGH�v(ON)�̃}�N���ɂ���r���邱�Ƃ��\�ł��B

%href
analogRead
digitalReport


%index
analogRead
�A�i���O�f�[�^�̓ǂݏo��

%prm
(analogpin)
analogpin=0�`(0)   : �A�i���O�s���ԍ�

%inst
pin�Ŏw�肳�ꂽ�A�i���O�s���̓��e���擾���܂��B
�擾�����l�́A0(�ŏ�)�A��1023(�ő�)�͈̔͂ɂȂ�܂��B�uA_LOW�v(�ŏ�)�A���uA_HIGH�v(�ő�)�̃}�N���ɂ���r���邱�Ƃ��\�ł��B
^p
	digitalReport 0, 1	; �A�i���O�|�[�g0��ǂݏo���ݒ�
	value=analogRead(0)	; ���ۂ̒l��ǂݏo��
^p
�������̌�ɁAanalogReport���߂��g���Ďw�肳�ꂽ�|�[�g�̓ǂݏo�����J�n����K�v������̂Œ��ӂ��Ă��������B
�܂��AanalogInterval���߂ɂ��A�i���O�|�[�g�ǂݏo���̎�����ݒ肷�邱�Ƃ��\�ł��B


%href
analogReport
analogInterval
digitalRead


%index
analogReport
�A�i���O�f�[�^�̓ǂݏo���ݒ�

%prm
analogpin, sw
analogpin=0�`(0) : �A�i���O�s���ԍ�
sw=0�`(0)        : �ǂݏo���ݒ�(0=OFF,1=ON)

%inst
�w�肳�ꂽ�A�i���O�s���̓ǂݏo��ON/OFF�𐧌䂵�܂��B
analogRead���߂ɂ��ǂݏo���̐ݒ���s�Ȃ��ꍇ�́A�K���ǂݏo���ݒ��ON�ɂ���K�v������܂��B(�f�t�H���g��OFF�ɐݒ肳��Ă��܂�)
�ǂݏo���ݒ肪ON�̎��́AanalogInterval���߂ɂ��ݒ肳�ꂽ�����ŃA�i���O�s���̒l���X�V����܂��B

%href
analogRead
analogInterval


%index
digitalReport
�f�W�^���f�[�^�̓ǂݏo���ݒ�

%prm
port, sw
port=0�`(0) : �f�W�^���|�[�g�ԍ�
sw=0�`(0)   : �ǂݏo���ݒ�(0=OFF,1=ON)

%inst
�w�肳�ꂽ�f�W�^���s���̓ǂݏo��ON/OFF�𐧌䂵�܂��B
�ǂݏo���ݒ肪ON�̎��́A�f�W�^���s���̕ύX���擾�\�ɂȂ�܂��B
(�f�t�H���g��ON�ɐݒ肳��Ă��܂��̂ŁA�ʏ�͓��ɐݒ肷��K�v����܂���)
digitalRead���߂ɂ��ǂݏo���̐ݒ���s�Ȃ��ꍇ�́A�K���ǂݏo���ݒ肪ON�ɂȂ��Ă���K�v������܂��B

%href
digitalRead


%index
analogInterval
�A�i���O�f�[�^�̓ǂݏo���Ԋu�ݒ�

%prm
analogpin, ms
analogpin=0�`(0) : �A�i���O�s���ԍ�
ms=0�`(0)        : �ǂݏo���Ԋu(�~���b�P��)

%inst
�w�肳�ꂽ�A�i���O�s���̓ǂݏo���Ԋu���~���b�P�ʂŐݒ肵�܂��B

%href
analogRead
analogReport


