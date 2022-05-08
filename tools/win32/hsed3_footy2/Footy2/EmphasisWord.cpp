/*===================================================================
CEmphasisWord�N���X
���ޕ��̋����\���������ێ�����N���X�ł��B
===================================================================*/

#include "EmphasisWord.h"
#include "FootyLine.h"

/*----------------------------------------------------------------
CEmphasisWord::CEmphasisWord
�R���X�g���N�^�ł��B
----------------------------------------------------------------*/
CEmphasisWord::CEmphasisWord(){
	m_nPermission = 1;
	m_nType = EMP_INVALIDITY;
	m_nIndependence = EMP_IND_ALLOW_ALL;
	m_nLevel = 1 << 0;
	m_bDuplix = false;
	m_nEmpFlag = 0;
}

/*----------------------------------------------------------------
CEmphasisWord::SetValues
�l���Z�b�g����
----------------------------------------------------------------*/
bool CEmphasisWord::SetValues(const wchar_t *pString1,const wchar_t *pString2,
	int nType,int nFlags,int nLevel,int nPermission,int nIndependence,COLORREF nColor){
	
	if (!pString1)return false;
	m_nLevel = nLevel;
	m_nEmpFlag = nFlags;
	m_nPermission = nPermission;
	m_nIndependence = nIndependence;
	m_nType = nType;
	m_nColor = nColor;

	/*������̃Z�b�g�E�n�b�V���l�̌v�Z*/
	m_strWord1 = pString1;
	if (IsNonCsWord())SetLower(const_cast<wchar_t*>(m_strWord1.c_str()),GetLen1());
	if (pString2){
		m_strWord2 = pString2;
		if (IsNonCsWord())SetLower(const_cast<wchar_t*>(m_strWord2.c_str()),GetLen2());
	}
	return true;
}

/*----------------------------------------------------------------
CEmphasisWord::SetLower
�������S�ď�����������
----------------------------------------------------------------*/
void CEmphasisWord::SetLower(wchar_t *szStr,size_t nLen)
{
	for (size_t i=0;i<nLen;i++,szStr++)
	{
		if (CFootyLine::IsSurrogateLead(*szStr))		// �T���Q�[�g�y�A
		{
			szStr++;i++;
		}
		else if (L'A' <= *szStr && *szStr <= L'Z')		// ���p�啶��
		{
			(*szStr) += (L'a' - L'A');
		}
		else if (L'�`' <= *szStr && *szStr <= L'�y')	// �S�p�啶��
		{
			(*szStr) += (L'��' - L'�`');
		}
	}
}

/*----------------------------------------------------------------
CEmphasisWord::CheckIndependence
�Ɨ���Ԃ��`�F�b�N����
----------------------------------------------------------------*/
#define FLAG_CHECKED(f)	((m_nIndependence & f) != 0)
bool CEmphasisWord::CheckIndependence(const wchar_t *pChar,bool bCheckAfter){
	/*�����̎�ނ��擾����*/
	CFootyLine::CharSets nKind;
	if (bCheckAfter){
		if (CFootyLine::IsSurrogateLead(*pChar))
			nKind = CFootyLine::GetCharSets(*pChar,*(pChar+1));
		else
			nKind = CFootyLine::GetCharSets(*pChar);
	}
	else{
		if (CFootyLine::IsSurrogateTail(*pChar))
			nKind = CFootyLine::GetCharSets(*(pChar-1),*pChar);
		else
			nKind = CFootyLine::GetCharSets(*pChar);
	}
	/*�����̎�ނɂ���ďꍇ����*/
	switch(nKind){
	/*ASCII*/
	case CFootyLine::CHARSETS_ANSI_ALPHABET:
		if (L'A' <= *pChar && *pChar <= L'Z')
			return FLAG_CHECKED(EMP_IND_CAPITAL_ALPHABET);
		else
			return FLAG_CHECKED(EMP_IND_SMALL_ALPHABET);
	case CFootyLine::CHARSETS_ANSI_NUMBER:
		return FLAG_CHECKED(EMP_IND_NUMBER);
	case CFootyLine::CHARSETS_ANSI_SYMBOL:
		switch (*pChar){
		case L'(':case L')':
			return FLAG_CHECKED(EMP_IND_PARENTHESIS);
		case L'{':case L'}':
			return FLAG_CHECKED(EMP_IND_BRACE);
		case L'<':case L'>':
			return FLAG_CHECKED(EMP_IND_ANGLE_BRACKET);
		case L'[':case L']':
			return FLAG_CHECKED(EMP_IND_SQUARE_BRACKET);
		case L'\"':case L'\'':
			return FLAG_CHECKED(EMP_IND_QUOTATION);
		case L'_':
			return FLAG_CHECKED(EMP_IND_UNDERBAR);
		case L'+':case L'-':case L'*':case L'/':case L'%':case L'^':case L'=':
			return FLAG_CHECKED(EMP_IND_OPERATORS);
		case L'#':case L'!': case L'$':case L'&':case L'|':case L'\\':
		case L'@':case L'\?':case L',':case L'.':case L':':case L';':
		case L'~':
			return FLAG_CHECKED(EMP_IND_OTHER_ASCII_SIGN);
		case L' ':
			return FLAG_CHECKED(EMP_IND_SPACE);
		case L'\t':
			return FLAG_CHECKED(EMP_IND_TAB);
		default:
			return FLAG_CHECKED(EMP_IND_OTHERS);
		}
	/*���{��*/
	case CFootyLine::CHARSETS_HIRAGANA:
	case CFootyLine::CHARSETS_KATAKANA:
	case CFootyLine::CHARSETS_KATAKANA_HALF:
	case CFootyLine::CHARSETS_KANJI:
	case CFootyLine::CHARSETS_JP_NOBASHI:
	case CFootyLine::CHARSETS_FULL_ALPHABET:
	case CFootyLine::CHARSETS_FULL_NUMBER:
	case CFootyLine::CHARSETS_SYMBOLS:
		if (*pChar == L'�@')
			return FLAG_CHECKED(EMP_IND_FULL_SPACE);
		else
			return FLAG_CHECKED(EMP_IND_JAPANESE);
	/*�؍���*/
	case CFootyLine::CHARSETS_KOREA:
		return FLAG_CHECKED(EMP_IND_KOREAN);
	/*�����[���b�p*/
	case CFootyLine::CHARSETS_BALTIC:
	case CFootyLine::CHARSETS_CYRILLIC:
	case CFootyLine::CHARSETS_GREEK:
		return FLAG_CHECKED(EMP_IND_EASTUROPE);
	/*���̂ق�*/
	default:
		return FLAG_CHECKED(EMP_IND_OTHERS);
	}
}

/*[EOF]*/
