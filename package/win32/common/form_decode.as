
;	form_decode���W���[��
;	form_decode���߂��g�p����ɂ͈ȉ��̍s���ŏ��ɓ���Ă�������
;
;	#include "form_decode.as"
;
#module
	;	form_decode����
	;	form_decode �����ϐ�1, �����ϐ�2, �ϊ��X�C�b�`
	;
	;	���M�p�ɃG���R�[�h���ꂽ�e�L�X�g�����̓��{��Ƀf�R�[�h���܂��B
	;	�����ϐ�2�̓��e���f�R�[�h���ĕ����ϐ�1�Ɋi�[���܂��B
	;	�ϊ��X�C�b�`�̌��ʂ͈ȉ��̂Ƃ���ł��B
	;		1�ɂ����'&'�����s�ɕϊ�
	;		2�ɂ����'+'���󔒂ɕϊ�
	;		3�ɂ���Ɨ����Ƃ��ϊ�
	;
/*
	2008/02/01 �ύX�_
		�R�[�h�𐮗��E�኱�������B
	���m�̕s�
		��1�����icnvbf�j���[���Ɋm�ۂ���Ă��Ȃ���
		�o�b�t�@�I�[�o�[�t���[�������N�����\��������܂��B
*/
#deffunc form_decode var cnvbf,var txtbf,int sw
	i = 0                  		// �e�L�X�g�̓ǂݏo���ʒu
	txtsize = strlen(txtbf)		// �e�L�X�g�̒���
	code = -1              		// �ǂ݂����������R�[�h
	repeat
		if (code == 0)|(i >= txtsize) : break
		code = peek(txtbf, i)
		i+
		if code == '%' {
			// ���{��ϊ�
			code = int("$" + strmid(txtbf, i, 2))
			i += 2
		}
		if sw & (code == '&') {
			// '&'�͉��s��
			wpoke cnvbf, cnt, $0A0D
			continue cnt + 2
		}
		if (sw >> 1) & (code == '+') {
			// '+'�͋󔒂�
			code = 32
		}
		poke cnvbf, cnt, code
	loop
	return

#global
