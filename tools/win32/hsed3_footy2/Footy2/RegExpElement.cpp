/**
 * @file RegExpElement.cpp
 * @brief ���K�\���̗v�f�N���X
 * @author Shinji Watanabe
 * @date Jan.22.2008
 */

#include "RegExpElement.h"

/**
 * CRegExpElement::CRegExpElement
 * @brief �R���X�g���N�^
 */
CRegExpElement::CRegExpElement()
{
	m_nLoopType = LOOPTYPE_NONE;
}

/**
 * CRegExpElement::~CRegExpElement
 * @brief �f�X�g���N�^
 */
CRegExpElement::~CRegExpElement()
{
}


/**
 * CRegExpElement::Search
 * @brief ���̒����������鏈��
 */
bool CRegExpElement::Search(LinePt pStartLine,size_t nStartPos,CEditPosition *pEnd,LinePt pEndLine)
{
	// ���[�v�ݒ���ɉ����ă��[�v������
	switch (m_nLoopType)
	{
	case LOOPTYPE_NONE:
		return SearchInner(pStartLine,nStartPos,pEnd,pEndLine);
	default:
		return false;
	}
}


/*[EOF]*/
