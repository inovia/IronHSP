/*===================================================================
CCharsetDetective_MultiBytes�N���X
�����R�[�h�̔��ʏ������s���N���X
===================================================================*/

#include "CharsetDetective_MultiBytes.h"

/*----------------------------------------------------------------
CCharsetDetective_MultiBytes::CCharsetDetective_MultiBytes
�R���X�g���N�^
----------------------------------------------------------------*/
CCharsetDetective_MultiBytes::CCharsetDetective_MultiBytes(){
	m_nStoredChars = 0;
	m_nStatus = 0;
}

/*----------------------------------------------------------------
CCharsetDetective_ShiftJIS2004::NewCharacterInner
�V�����L�����N�^
----------------------------------------------------------------*/
void CCharsetDetective_ShiftJIS2004::NewCharInner(unsigned char cNewChar){
	switch(m_nStoredChars){
	case 0:					/*��Ԗڂ̕����̂Ƃ�*/
		/*ShiftJIS�̊J�n�������H*/
		if ((0x81 <= cNewChar && cNewChar <= 0x9F) ||
			(0xE0 <= cNewChar && cNewChar <= 0xFC)){
			StoreChar(cNewChar);
		}
		/*���p����*/
		else if (0xA1 <= cNewChar && cNewChar <= 0xDF){
			IncRare();
		}
		/*ASCII������*/
		else if (IsAsciiChar(cNewChar)){
			IncLetter();
		}
		else SetImpossible();
		break;
	case 1:					/*��Ԗڂ̃o�C�g�̂Ƃ�*/
		if (0x40 <= cNewChar && cNewChar <= 0xFC && cNewChar != 0x7F){
			unsigned short s = (cNewChar << 8) | m_cBeforeChars[0];
			/*�Ђ炪��*/
			if (0x82A0 <= s && s <= 0x82F1)
				IncCommon();
			/*��������*/
			else if (0x8340 <= s && s <= 0x8396)
				IncCommon();
			/*����ȊO*/
			else
				IncLetter();
			ResetStores();
		}
		else SetImpossible();
		break;
	}
}

/*[EOF]*/
