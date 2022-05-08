/**
 * @file TextConverter.cpp
 * @brief �e�L�X�g�̕ϊ��������\�ȃN���X�̊��
 * @author Shinji Watanabe
 * @version 1.0
 * @date Jan.07.2008
 */

#include "TextConverter.h"

/*----------------------------------------------------------------
CTextConverter::CTextConverter
�R���X�g���N�^�ł��B
----------------------------------------------------------------*/
CTextConverter::CTextConverter(){
	m_pOutputText = NULL;
	m_nTextSize = 0;
}

/*----------------------------------------------------------------
CTextConverter::~CTextConverter
�f�X�g���N�^�ł��B
----------------------------------------------------------------*/
CTextConverter::~CTextConverter(){
	Free();
}

/**
 * CTextConverter::Alloc
 * @brief �����������蓖�Ă܂�
 * @param nSize �m�ۂ���o�C�g��
 * @return �m�ۂł����Ƃ�true
 */
bool CTextConverter::Alloc(size_t nSize){
	Free();
	m_pOutputText = new char[nSize];
	if (!m_pOutputText)return false;
	m_nTextSize = nSize;
	return true;
}

/*----------------------------------------------------------------
CTextConverter::Free
��������������܂��B
----------------------------------------------------------------*/
void CTextConverter::Free(){
	if (m_pOutputText){
		delete [] m_pOutputText;
		m_pOutputText = NULL;
	}
}

/*[EOF]*/
