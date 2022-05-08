/*===================================================================
CRegExpLetters�N���X
���K�\���̗v�f�N���X�B�ʏ�̕������i�[����ł���{�I�ȃN���X
===================================================================*/

#include "RegExpLetters.h"


/*----------------------------------------------------------------
CRegExpLetters::CRegExpLetters
�R���X�g���N�^
----------------------------------------------------------------*/
CRegExpLetters::CRegExpLetters(const wchar_t *pString, bool bIgnoreCase){
	m_strLetters = pString;
	m_bIgnoreCase = bIgnoreCase;
}

/*----------------------------------------------------------------
CRegExpLetters::CRegExpLetters
�R���X�g���N�^
----------------------------------------------------------------*/
CRegExpLetters::CRegExpLetters(std::wstring &strLetters, bool bIgnoreCase){
	m_strLetters = strLetters;
	m_bIgnoreCase = bIgnoreCase;
}

/*----------------------------------------------------------------
CRegExpLetters::~CRegExpLetters
�f�X�g���N�^
----------------------------------------------------------------*/
CRegExpLetters::~CRegExpLetters(){
}

/*----------------------------------------------------------------
CRegExpLetters::~CRegExpLetters
�f�X�g���N�^
----------------------------------------------------------------*/
bool CRegExpLetters::SearchInner(LinePt pLine,size_t nPosition,CEditPosition *pEnd,LinePt pEndLine){
	/*�������ɂ���ă`�F�b�N����*/
	if (m_strLetters.size() > pLine->GetLineLength() - nPosition)
		return false;

	/*���[�v*/
//	for (size_t i=0;
//		 i != m_strLetters.size() && nPosition != pLine->GetLineLength();
//		 nPosition++,i++){
//		 if (pLine->GetLineData()[nPosition] != m_strLetters[i])return false;
//	}

	if( CSTR_EQUAL != CompareStringW(
							LOCALE_USER_DEFAULT, (m_bIgnoreCase ? NORM_IGNORECASE : 0),
							pLine->GetLineData() + nPosition, static_cast<int>(m_strLetters.size()),
							m_strLetters.c_str(), static_cast<int>(m_strLetters.size())) )
	{
		return false;
	}
	nPosition += m_strLetters.size();
	
	/*��������*/
	pEnd->SetPosition(pLine,nPosition);
	return true;
}



/*[EOF]*/
