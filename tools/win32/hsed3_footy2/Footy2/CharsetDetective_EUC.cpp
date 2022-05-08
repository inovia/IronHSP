/*===================================================================
CCharsetDetective_EUC_JIS_2004�N���X
�����R�[�h�̔��ʏ������s���N���X
===================================================================*/

#include "CharsetDetective_MultiBytes.h"

/*----------------------------------------------------------------
CCharsetDetective_EUC_JIS_2004::NewCharacterInner
�V�����L�����N�^
----------------------------------------------------------------*/
void CCharsetDetective_EUC_JIS_2004::NewCharInner(unsigned char cNewChar){
	switch(m_nStatus){
	case EUC_JP_FIRSTBYTE:			/*�ŏ��̃o�C�g*/
		if		(cNewChar == 0x8E)
			m_nStatus = EUC_JP_KATAKANA;
		else if((0xA1 <= cNewChar && cNewChar <= 0xA8) || 
				(0xB0 <= cNewChar && cNewChar <= 0xF4)){
			StoreChar(cNewChar);
			m_nStatus = EUC_JP_KANJI;
		}
		else if (cNewChar == 0xAD)
			m_nStatus = EUC_JP_NEC;
		else if (0xF5 <= cNewChar && cNewChar <= 0xFE)
			m_nStatus = EUC_JP_USERS_FIRST;
		else if (cNewChar == 0x8F)
			m_nStatus = EUC_JP_SECONDBYTE;
		else if (IsAsciiChar(cNewChar))
			IncLetter();
		else SetImpossible();
		break;
	case EUC_JP_KATAKANA:			/*���p����*/
		if (0xA1 <= cNewChar && cNewChar <= 0xDF){
			IncRare();
			m_nStatus = EUC_JP_FIRSTBYTE;
		}
		else SetImpossible();
		break;
	case EUC_JP_KANJI:				/*JIS X 0208:1997����*/
		if (0xA1 <= cNewChar && cNewChar <= 0xFE){
			IncLetter();
			ResetStores();
		}
		else SetImpossible();
		m_nStatus = EUC_JP_FIRSTBYTE;
		break;
	case EUC_JP_NEC:				/*NEC����*/
		if (0xA1 <= cNewChar && cNewChar <= 0xFE){
			IncLetter();
		}
		else SetImpossible();
		m_nStatus = EUC_JP_FIRSTBYTE;
		break;
	case EUC_JP_USERS_FIRST:		/*���[�U�[��`*/
		if (0xA1 <= cNewChar && cNewChar <= 0xFE){
			IncRare();
		}
		else SetImpossible();
		m_nStatus = EUC_JP_FIRSTBYTE;
		break;
	case EUC_JP_SECONDBYTE:			/*��o�C�g�ڂ�I��*/
		if		((0xA1 <= cNewChar && cNewChar <= 0xAB) ||
				 (0xB0 <= cNewChar && cNewChar <= 0xED))
			m_nStatus = EUC_JP_EXTENDED_KANJI;
		else if (cNewChar == 0xF3 || cNewChar == 0xF4)
			m_nStatus = EUC_JP_IBM_EXTENDED;
		else if (0xF5 <= cNewChar && cNewChar <= 0xFE)
			m_nStatus = EUC_JP_USERS_SECOND;
		else SetImpossible();
		break;
	case EUC_JP_EXTENDED_KANJI:		/*�g������*/
	case EUC_JP_IBM_EXTENDED:		/*IBM�g��*/
	case EUC_JP_USERS_SECOND:		/*���[�U�[��`*/
		if (0xA1 <= cNewChar && cNewChar <= 0xFE)
			IncLetter();
		else SetImpossible();
		m_nStatus = EUC_JP_FIRSTBYTE;
		break;
	}
}


/*[EOF]*/
