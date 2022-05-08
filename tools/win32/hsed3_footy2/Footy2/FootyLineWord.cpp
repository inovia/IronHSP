/*===================================================================
CFootyLine�N���X
Footy�̍s������s�P�ʂŊǗ�����N���X�ł��B
===================================================================*/

#include "FootyLine.h"

/*-------------------------------------------------------------------
CFootyLine::GetWordInfo
nPos�̈ʒu�ɑ��݂���P��̏����擾���܂��B
bIsBackMode�̎��Ɍ�둤�ցB�f�t�H���g��true�ł��B
-------------------------------------------------------------------*/
CFootyLine::WordInfo CFootyLine::GetWordInfo(size_t nPos,bool bIsBackMode) const
{
	WordInfo wiReturn;
	CharSets nKind;								/*���*/
	CharSets nKindBefore = CHARSETS_UNKNOWN;	/*�O�̎��*/
	const wchar_t* pLineData = GetLineData();	/*�������p*/
	
	/*�񂵂Ă���*/
	for (size_t i=0;i<GetLineLength();pLineData++,i++){
		/*�����̎�ނ��擾����*/
		if (IsSurrogateLead(*pLineData))
			nKind = GetCharSets(*pLineData,*(pLineData+1));
		else
			nKind = GetCharSets(*pLineData);
		/*�O�̕����ƈႤ�Ƃ�*/
		if (nKindBefore != nKind ||
			nKind == CHARSETS_SYMBOLS ||
			nKind == CHARSETS_ANSI_SYMBOL){
			/*��O���v�Z*/
			switch(nKind){
			case CHARSETS_JP_NOBASHI:	/*�L�΂����̎��͑O���Ђ炪�Ȃ��J�^�J�i�Ȃ瓯��P��*/
				if (nKindBefore == CHARSETS_HIRAGANA || nKindBefore == CHARSETS_KATAKANA)
					goto Next_i;
				break;
			case CHARSETS_ANSI_UNDER:	/*�A���_�[�o�[�̎��͑O���A���t�@�x�b�g�Ȃ瓯��P��*/
				if (nKindBefore == CHARSETS_ANSI_ALPHABET)
					goto Next_i;
				break;
			case CHARSETS_ANSI_ALPHABET:
				if (nKindBefore == CHARSETS_ANSI_UNDER)
					goto Next_i;
				if (nKindBefore == CHARSETS_ANSI_NUMBER)
					goto Next_i;
				break;
			case CHARSETS_ANSI_NUMBER:
				if (nKindBefore == CHARSETS_ANSI_ALPHABET)
					goto Next_i;
				break;
			}
			/*�Z�b�g����*/
			if (bIsBackMode ? (i < nPos) : (i <= nPos)){
				wiReturn.m_nBeginPos = i;
				nKindBefore = nKind;
			}
			else{
				wiReturn.m_nEndPos = i;
				return wiReturn;
			}
		}
Next_i:;
		/*�T���Q�[�g�y�A�������Ƃ��͈��֐i�߂Ă���*/
		if (IsSurrogateLead(*pLineData)){
			pLineData++;i++;
		}
	}
	wiReturn.m_nEndPos = GetLineLength();
	return wiReturn;

}


#if 0
/*-------------------------------------------------------------------
CFootyLine::GetCharSets
�����̎�ނ𔻕ʂ��܂��B
-------------------------------------------------------------------*/
CFootyLine::CharSets CFootyLine::GetCharSets(wchar_t wc){
	/*ANSI�W������*/
	if		((L'a' <= wc && wc <= L'z') ||
			 (L'A' <= wc && wc <= L'Z'))		/*ANSI�A���t�@�x�b�g*/
			 return CHARSETS_ANSI_ALPHABET;
	else if ((L'0' <= wc && wc <= L'9'))		/*ANSI����*/
			 return CHARSETS_ANSI_NUMBER;
	else if ((wc == L'_'))						/*ANSI�A���_�[�X�R�A*/
			 return CHARSETS_ANSI_UNDER;
	else if ((0x0000 <= wc && wc <= 0x007e))	/*ANSI�L��*/
			 return CHARSETS_ANSI_SYMBOL;
	/*���{��*/
	else if ((wc == L'�['))						/*�̂΂��L��*/
			 return CHARSETS_JP_NOBASHI;
	else if ((0x3040 <= wc && wc <= 0x309f))	/*�Ђ炪��*/
			 return CHARSETS_HIRAGANA;
	else if ((0x30a0 <= wc && wc <= 0x30ff))	/*�J�^�J�i*/
			 return CHARSETS_KATAKANA;
	else if ((0xff65 <= wc && wc <= 0xff9f))	/*���p�J�^�J�i*/
			 return CHARSETS_KATAKANA_HALF;
	else if ((L'��' <= wc && wc <= L'��') ||	/*�S�p�A���t�@�x�b�g*/
			 (L'�`' <= wc && wc <= L'�y'))
			  return CHARSETS_FULL_ALPHABET;
	else if ((L'�O' <= wc && wc <= L'�X'))		/*�S�p����*/
			  return CHARSETS_FULL_NUMBER;
	else if ((0x00A1 <= wc && wc <= 0x00BF) ||
			 (0x2010 == wc)					||
			 (0x2012 <= wc && wc <= 0x2027) ||
			 (0x2030 <= wc && wc <= 0x205E) ||
			 (0x2100 <= wc && wc <= 0x214E) ||
			 (0x2153 <= wc && wc <= 0x2184) ||
			 (0x2190 <= wc && wc <= 0x23E7) ||
			 (0x2460 <= wc && wc <= 0x266f) ||
			 (0x2701 <= wc && wc <= 0x27BE) ||
			 (0x2900 <= wc && wc <= 0x303F) ||
			 (0x3200 <= wc && wc <= 0x33FF) ||
			 (0xFE30 <= wc && wc <= 0xFE4F) ||
			 (0xFF01 <= wc && wc <= 0xFF0F) ||
			 (0xFF1A <= wc && wc <= 0xFF20) ||
			 (0xFF38 <= wc && wc <= 0xFF40) ||
			 (0xFF58 <= wc && wc <= 0xFF65) ||
			 (0xFFE0 <= wc && wc <= 0xFFEE))	/*�L���n*/
			 return CHARSETS_SYMBOLS;
	else if ((0x31F0 <= wc && wc <= 0x31FF))	/*Katakana Phonetic Extensions*/
			return CHARSETS_AINU_EXTENSION;
	else if ((0x0250 <= wc && wc <= 0x02A0))	/*IPA Extensions*/
			return CHARSETS_IPA_EXTENSION;
	/*CJK*/
	else if ((0x3400 <= wc && wc <= 0x4DBF) ||	/*CJK���������g��A*/
			 (0x4e00 <= wc && wc <= 0x9fa5) ||	/*CJK��������*/
			 (0xF900 <= wc && wc <= 0xFAFF))	/*CJK�����݊�*/
			 return CHARSETS_KANJI;
	/*�n���O��*/
	else if ((0x3130 <= wc && wc <= 0x318f) ||	/*Hangul Compatibility Jamo*/
			 (0xac00 <= wc && wc <= 0xd7a3))	/*Hangul Syllables*/
			 return CHARSETS_KOREA;
	/*�A���r�A*/
	else if ((0x0600 <= wc && wc <= 0x06FF) ||	/*Arabic*/
			 (0xFB50 <= wc && wc <= 0xFDFF) ||	/*Arabic Presentation Forms-A*/
			 (0xFE70 <= wc && wc <= 0xFEFE))	/*Arabic Presentation Forms-B*/
			return CHARSETS_ARABIC;
	/*�w�u���C*/
	else if ((0x0590 <= wc && wc <= 0x05FF) ||	/*Hebrew*/
			 (0xFB00 <= wc && wc <= 0xFB4F))	/*Hebrew Presentation Forms*/
			return CHARSETS_HEBREW;
	/*���̂ق�*/
	else if (0x0080 <= wc && wc <= 0x00ff)		/*C1 Controls and Latin-1 Supplement*/
			return CHARSETS_LATIN;
	else if ((0x0100 <= wc && wc <= 0x017f)	||	/*Latin Extended-A*/
			 (0x0180 <= wc && wc <= 0x024f))	/*Latin Extended-B*/
			return CHARSETS_BALTIC;
	else if (0x0370 <= wc && wc <= 0x03ff)		/*Greek and Coptic*/
			return CHARSETS_GREEK;
	else if ((0x0400 <= wc && wc <= 0x04ff) ||	/*Cyrillic*/
			 (0x0500 <= wc && wc <= 0x052f))	/*Cyrillic Supplementary*/
			return CHARSETS_CYRILLIC;
	else if ((0x0e00 <= wc && wc <= 0x0e7f))	/*Thai*/
			 return CHARSETS_THAI;
	//else if ((0x1E00 <= wc && wc <= 0x1EFF))	/*Laten Extended Additional*/
	//		return CHARSETS_VIETTNAMESE;
	/*�s���Ȍ���*/
	else return CHARSETS_UNKNOWN;
}

#else

/*-------------------------------------------------------------------
CFootyLine::GetCharSets
�����̎�ނ𔻕ʂ��܂�(�œK���o�[�W����)
-------------------------------------------------------------------*/
CFootyLine::CharSets CFootyLine::GetCharSets(wchar_t wc){
	/*ANSI�W������*/
	if (0 < wc && wc <= 127){
		if		((L'a' <= wc && wc <= L'z') ||
				 (L'A' <= wc && wc <= L'Z'))		/*ANSI�A���t�@�x�b�g*/
				 return CHARSETS_ANSI_ALPHABET;
		else if ((L'0' <= wc && wc <= L'9'))		/*ANSI����*/
				 return CHARSETS_ANSI_NUMBER;
		else if ((wc == L'_'))						/*ANSI�A���_�[�X�R�A*/
				 return CHARSETS_ANSI_UNDER;
		else if ((0x0000 <= wc && wc <= 0x007e))	/*ANSI�L��*/
				 return CHARSETS_ANSI_SYMBOL;
		else return CHARSETS_UNKNOWN;
	}
	/*���{��*/
	else if ((wc == L'�['))						/*�̂΂��L��*/
			 return CHARSETS_JP_NOBASHI;
	else if ((0x3040 <= wc && wc <= 0x309f))	/*�Ђ炪��*/
			 return CHARSETS_HIRAGANA;
	else if ((0x30a0 <= wc && wc <= 0x30ff))	/*�J�^�J�i*/
			 return CHARSETS_KATAKANA;
	else if ((0x3400 <= wc && wc <= 0x4DBF) ||	/*CJK���������g��A*/
			 (0x4e00 <= wc && wc <= 0x9fa5) ||	/*CJK��������*/
			 (0xF900 <= wc && wc <= 0xFAFF))	/*CJK�����݊�*/
			 return CHARSETS_KANJI;
	else if ((0xff65 <= wc && wc <= 0xff9f))	/*���p�J�^�J�i*/
			 return CHARSETS_KATAKANA_HALF;
	else if ((L'��' <= wc && wc <= L'��') ||	/*�S�p�A���t�@�x�b�g*/
			 (L'�`' <= wc && wc <= L'�y'))
			  return CHARSETS_FULL_ALPHABET;
	else if ((L'�O' <= wc && wc <= L'�X'))		/*�S�p����*/
			  return CHARSETS_FULL_NUMBER;
	else if ((0x00A1 <= wc && wc <= 0x00BF) ||
			 (0x2010 == wc)					||
			 (0x2012 <= wc && wc <= 0x2027) ||
			 (0x2030 <= wc && wc <= 0x205E) ||
			 (0x2100 <= wc && wc <= 0x214E) ||
			 (0x2153 <= wc && wc <= 0x2184) ||
			 (0x2190 <= wc && wc <= 0x23E7) ||
			 (0x2460 <= wc && wc <= 0x266f) ||
			 (0x2701 <= wc && wc <= 0x27BE) ||
			 (0x2900 <= wc && wc <= 0x303F) ||
			 (0x3200 <= wc && wc <= 0x33FF) ||
			 (0xFE30 <= wc && wc <= 0xFE4F) ||
			 (0xFF01 <= wc && wc <= 0xFF0F) ||
			 (0xFF1A <= wc && wc <= 0xFF20) ||
			 (0xFF38 <= wc && wc <= 0xFF40) ||
			 (0xFF58 <= wc && wc <= 0xFF65) ||
			 (0xFFE0 <= wc && wc <= 0xFFEE) ||
			 (wc == 0x00D7) || (wc == 0x00F7))	/*�L���n*/
			 return CHARSETS_SYMBOLS;
	else if ((0x31F0 <= wc && wc <= 0x31FF))	/*Katakana Phonetic Extensions*/
			return CHARSETS_AINU_EXTENSION;
	else if ((0x0250 <= wc && wc <= 0x02A0))	/*IPA Extensions*/
			return CHARSETS_IPA_EXTENSION;
	/*�n���O��*/
	else if ((0x3130 <= wc && wc <= 0x318f) ||	/*Hangul Compatibility Jamo*/
			 (0xac00 <= wc && wc <= 0xd7a3))	/*Hangul Syllables*/
			 return CHARSETS_KOREA;
	/*�A���r�A*/
	else if ((0x0600 <= wc && wc <= 0x06FF) ||	/*Arabic*/
			 (0xFB50 <= wc && wc <= 0xFDFF) ||	/*Arabic Presentation Forms-A*/
			 (0xFE70 <= wc && wc <= 0xFEFE))	/*Arabic Presentation Forms-B*/
			return CHARSETS_ARABIC;
	/*�w�u���C*/
	else if ((0x0590 <= wc && wc <= 0x05FF) ||	/*Hebrew*/
			 (0xFB00 <= wc && wc <= 0xFB4F))	/*Hebrew Presentation Forms*/
			return CHARSETS_HEBREW;
	/*���̂ق�*/
	else if (0x0080 <= wc && wc <= 0x00ff)		/*C1 Controls and Latin-1 Supplement*/
			return CHARSETS_LATIN;
	else if ((0x0100 <= wc && wc <= 0x017f)	||	/*Latin Extended-A*/
			 (0x0180 <= wc && wc <= 0x024f))	/*Latin Extended-B*/
			return CHARSETS_BALTIC;
	else if (0x0370 <= wc && wc <= 0x03ff)		/*Greek and Coptic*/
			return CHARSETS_GREEK;
	else if ((0x0400 <= wc && wc <= 0x04ff) ||	/*Cyrillic*/
			 (0x0500 <= wc && wc <= 0x052f))	/*Cyrillic Supplementary*/
			return CHARSETS_CYRILLIC;
	else if ((0x0e00 <= wc && wc <= 0x0e7f))	/*Thai*/
			 return CHARSETS_THAI;
	//else if ((0x1E00 <= wc && wc <= 0x1EFF))	/*Laten Extended Additional*/
	//		return CHARSETS_VIETTNAMESE;
	/*�s���Ȍ���*/
	else return CHARSETS_UNKNOWN;
}

#endif


/*-------------------------------------------------------------------
CFootyLine::GetCharSets
�T���Q�[�g�y�A�ŕ����̎�ނ��擾���鏈��
-------------------------------------------------------------------*/
CFootyLine::CharSets CFootyLine::GetCharSets(wchar_t w1,wchar_t w2){
	unsigned long ucs4 = (
		(((unsigned long)(w1 & 0x3FF)) << 10) |
		(((unsigned long)(w2 & 0x3FF)) <<  0)
	);
	ucs4 += 0x10000;
	
	/*SMP(����)*/
		//TODO
	/*SIP(����)*/
	if (0x20000 <= ucs4 && ucs4 <= 0x2FA1F)
		return CHARSETS_KANJI;
	return CHARSETS_UNKNOWN;
}


/*-------------------------------------------------------------------
CFootyLine::IsDualChar
���ꂪ��{�̕������������ǂ����擾����
-------------------------------------------------------------------*/
bool CFootyLine::IsDualChar(CFootyLine::CharSets c){
	return c == CHARSETS_HIRAGANA ||
		   c == CHARSETS_KATAKANA ||
		   c == CHARSETS_KANJI ||
		   c == CHARSETS_FULL_ALPHABET ||
		   c == CHARSETS_FULL_NUMBER ||
		   c == CHARSETS_AINU_EXTENSION ||
		   c == CHARSETS_IPA_EXTENSION || 
		   c == CHARSETS_JP_NOBASHI ||
		   c == CHARSETS_SYMBOLS || 
		   c == CHARSETS_KOREA;
}

//-----------------------------------------------------------------------------
/**
 * @brief ���̍s�ɍs�����ǂ������擾���܂��B
 * @param	nPos	[in] �����̃C���f�b�N�X�ԍ�
 * @param	nNowCol	[in] nPos�̈ʒu�̃J�����ʒu
 * @param	nColumns[in] �\���\�J������
 */
bool CFootyLine::IsGoNext(const wchar_t *pChar,size_t nPos,size_t nNowCol, size_t nColumns,int nMode) const
{
	// �錾
	wchar_t wcNext = *(pChar + 1);
	// �����𑱍s����
	if (nNowCol >= nColumns - 1 &&
		(IsDualChar(*pChar) || (IsSurrogateTail(*pChar) && IsDualChar(*(pChar-1),*pChar))))
	{
		if ((nMode & LAPELFLAG_JPN_PERIOD) != 0)		// ��Ǔ_��擪�ɗ������Ȃ�
		{
			if (wcNext == L'�A' || wcNext == L'�B')
				return false;
		}
		if ((nMode & LAPELFLAG_JPN_QUOTATION) != 0)		// �J�M���ʕ���擪�ɗ������Ȃ�
		{
			if (wcNext == L'�j' || wcNext == L'�v' || wcNext == L'�p' ||
				wcNext == L'�z' || wcNext == L'�x' || wcNext == L'�l' ||
				wcNext == L'�r' || wcNext == L'�t')
				return false;
		}
		return true;
	}
	else if (nNowCol >= nColumns)
	{
		return true;
	}
	return false;
}

/*s[EOF]*/
