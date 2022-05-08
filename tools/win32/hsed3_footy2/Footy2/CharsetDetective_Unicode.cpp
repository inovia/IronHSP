/*===================================================================
CCharsetDetective_Unicode�N���X
�����R�[�h�̔��ʏ������s���N���X
===================================================================*/

#include "CharsetDetective_MultiBytes.h"

/*----------------------------------------------------------------
CCharsetDetective_Unicode::CCharsetDetective_Unicode
�R���X�g���N�^
----------------------------------------------------------------*/
CCharsetDetective_Unicode::CCharsetDetective_Unicode(){
	m_nBomStatus = BOMSTATUS_DETECTING;
	m_nCharNum = 0;
}

/*----------------------------------------------------------------
BOM�̐錾
----------------------------------------------------------------*/
const unsigned char *CCharsetDetective_UTF8::GetBOM(){return (const unsigned char*)"\xEF\xBB\xBF$";}
const unsigned char *CCharsetDetective_UTF16_LE::GetBOM(){return (const unsigned char*)"\xFF\xFE$";}
const unsigned char *CCharsetDetective_UTF16_BE::GetBOM(){return (const unsigned char*)"\xFE\xFF$";}
const unsigned char *CCharsetDetective_UTF32_LE::GetBOM(){return (const unsigned char*)"\xFF\xFE\x00\x00$";}
const unsigned char *CCharsetDetective_UTF32_BE::GetBOM(){return (const unsigned char*)"\x00\x00\xFE\xFF$";}

/*----------------------------------------------------------------
CCharsetDetective_Unicode::NewCharInner
UNICODE��BOM���胋�[�`��
----------------------------------------------------------------*/
void CCharsetDetective_Unicode::NewCharInner(unsigned char cNewChar){
	if (m_nBomStatus == BOMSTATUS_DETECTING){
		unsigned char cBomChar;
		cBomChar = GetBOM()[m_nCharNum];
		if (cBomChar == '$'){		/*BOM�̔��芮��*/
			m_nBomStatus = BOMSTATUS_HAS_BOM;
			m_nStatus = 0;
		}
		else{
			if (cBomChar != cNewChar)
				m_nBomStatus = BOMSTATUS_NO_BOM;
		}
		m_nCharNum++;
	}
	
	NewCharUnicode(cNewChar);
}

/**
 * CCharsetDetective_UTF8::NewCharUnicode
 * @brief UTF8�����p���胋�[�`��
 * @param cNewChar �V��������
 */
void CCharsetDetective_UTF8::NewCharUnicode(unsigned char cNewChar){
	if (m_nStatus == 0){			/*1�o�C�g�ڂ̂Ƃ�*/
		if		((cNewChar & 0x80) == 0){		/*���̕�����1�o�C�g*/
			ResetStores();
			IncLetter();
			m_nStatus = 0;
		}
		else if (((cNewChar & 0xDF) == cNewChar) &&
				 ((cNewChar & 0xC0) == 0xC0)){	/*���̕�����2�o�C�g*/
			StoreChar(cNewChar);
			m_nStatus = 1;
		}
		else if (((cNewChar & 0xEF) == cNewChar) &&
				 ((cNewChar & 0xE0) == 0xE0)){	/*���̕�����3�o�C�g*/
			StoreChar(cNewChar);
			m_nStatus = 2;
		}
		else if (((cNewChar & 0xF7) == cNewChar) &&
				 ((cNewChar & 0xF0) == 0xF0)){	/*���̕�����4�o�C�g*/
			StoreChar(cNewChar);
			m_nStatus = 3;
		}
		else if (((cNewChar & 0xFB) == cNewChar) &&
				 ((cNewChar & 0xF8) == 0xF8)){	/*���̕�����5�o�C�g*/
			StoreChar(cNewChar);
			m_nStatus = 4;
		}
		else if (((cNewChar & 0xFD) == cNewChar) &&
				 ((cNewChar & 0xFC) == 0xFC)){	/*���̕�����5�o�C�g*/
			StoreChar(cNewChar);
			m_nStatus = 5;
		}
		else SetImpossible();
	}
	else{							/*2�o�C�g�ڈȍ~*/
		if	(((cNewChar & 0xBF) == cNewChar) &&
			 ((cNewChar & 0x80) == 0x80)){
			m_nStatus--;
			if (m_nStatus == 0){
				ResetStores();
				IncLetter();
			}
		}
		else SetImpossible();
	}
}
/*----------------------------------------------------------------
CCharsetDetective_UTF16_LE::NewCharUnicode
UTF16LE�����p���胋�[�`��
----------------------------------------------------------------*/
void CCharsetDetective_UTF16_LE::NewCharUnicode(unsigned char cNewChar){
	if (m_nStatus == 0){	/*1�o�C�g��*/
		StoreChar(cNewChar);
		m_nStatus = 1;
	}
	else{					/*2�o�C�g��*/
		/*���͂��ꂽ�����ɂ��Č�������*/
		wchar_t w = (wchar_t)((cNewChar << 8) | m_cBeforeChars[0]);
		if (IsNotUnicode((unsigned long)w))SetImpossible();		/*Unicode�Ƃ��ĕs�K�؂ȕ�����*/
		else if (0x0000 == w)SetImpossible();					/*NULL��UTF32�ɂ��悭�o��*/
		else if (0x0000 < w && w < 0x0080)IncCommon();			/*ASCII�����Ȃ�ǂ��o��͂��ł���*/
		else if (0x20 <= cNewChar && cNewChar <= 0x7E &&		/*����ASCII�����Ȃ瑼�̕����悭�o��͂�*/
				 0x20 <= m_cBeforeChars[0] && m_cBeforeChars[0] <= 0x7E)IncRare();
		else if (IsSurrogateLead(w))IncRare();					/*�T���Q�[�g�y�A*/
		else IncLetter();										/*����ȊO�͏o��\����������̂Ƃ���*/
		/*1�o�C�g�ڂɖ߂�*/
		ResetStores();
		m_nStatus = 0;
	}
}

/*----------------------------------------------------------------
CCharsetDetective_UTF16_BE::NewCharUnicode
UTF16LE�����p���胋�[�`��
----------------------------------------------------------------*/
void CCharsetDetective_UTF16_BE::NewCharUnicode(unsigned char cNewChar){
	if (m_nStatus == 0){	/*1�o�C�g��*/
		StoreChar(cNewChar);
		m_nStatus = 1;
	}
	else{					/*2�o�C�g��*/
		/*���͂��ꂽ�����ɂ��Č�������*/
		wchar_t w = (wchar_t)((m_cBeforeChars[0] << 8) | cNewChar);
		if (IsNotUnicode((unsigned long)w))SetImpossible();		/*Unicode�Ƃ��ĕs�K�؂ȕ�����*/
		else if (0x0000 == w)SetImpossible();					/*NULL��UTF32�ɂ��悭�o��*/
		else if (0x0000 < w && w < 0x0080)IncCommon();			/*ASCII�����Ȃ�ǂ��o��͂��ł���*/
		else if (0x20 <= cNewChar && cNewChar <= 0x7E &&		/*����ASCII�����Ȃ瑼�̕����悭�o��͂�*/
				 0x20 <= m_cBeforeChars[0] && m_cBeforeChars[0] <= 0x7E)IncRare();
		else if (IsSurrogateLead(w))IncRare();					/*�T���Q�[�g�y�A*/
		else IncLetter();										/*����ȊO�͏o��\����������̂Ƃ���*/
		/*1�o�C�g�ڂɖ߂�*/
		ResetStores();
		m_nStatus = 0;
	}
}

/*----------------------------------------------------------------
CCharsetDetective_UTF32_LE::NewCharUnicode
UTF16LE�����p���胋�[�`��
----------------------------------------------------------------*/
void CCharsetDetective_UTF32_LE::NewCharUnicode(unsigned char cNewChar){
	if (m_nStatus != 3){	/*1�`3�o�C�g��*/
		StoreChar(cNewChar);
		m_nStatus++;
	}
	else{					/*4�o�C�g��*/
		/*���͂��ꂽ�����ɂ��Č�������*/
		unsigned long u = (unsigned long)((cNewChar << 24) | (m_cBeforeChars[2] << 16) | ( (m_cBeforeChars[1] << 8) | m_cBeforeChars[0]));
		if (IsNotUnicode(u))SetImpossible();					/*Unicode�Ƃ��ĕs�K�؂ȕ�����*/
		else if (0x0000 <= u && u < 0x0080)IncCommon();			/*ASCII�����Ȃ�悭�o��͂�*/
		else IncLetter();										/*����ȊO�͏o��\����������̂Ƃ���*/
		/*1�o�C�g�ڂɖ߂�*/
		ResetStores();
		m_nStatus = 0;
	}
}

/*----------------------------------------------------------------
CCharsetDetective_UTF32_BE::NewCharUnicode
UTF16LE�����p���胋�[�`��
----------------------------------------------------------------*/
void CCharsetDetective_UTF32_BE::NewCharUnicode(unsigned char cNewChar){
	if (m_nStatus != 3){	/*1�`3�o�C�g��*/
		StoreChar(cNewChar);
		m_nStatus++;
	}
	else{					/*4�o�C�g��*/
		/*���͂��ꂽ�����ɂ��Č�������*/
		unsigned long u = (unsigned long)(cNewChar | (m_cBeforeChars[2] << 8) | ( (m_cBeforeChars[1] << 16) | (m_cBeforeChars[0] << 24)));
		if (IsNotUnicode(u))SetImpossible();					/*Unicode�Ƃ��ĕs�K�؂ȕ�����*/
		else if (0x0000 <= u && u < 0x0080)IncCommon();			/*ASCII�����Ȃ�悭�o��͂�*/
		else IncLetter();										/*����ȊO�͏o��\����������̂Ƃ���*/
		/*1�o�C�g�ڂɖ߂�*/
		ResetStores();
		m_nStatus = 0;
	}
}

/*[EOF]*/
