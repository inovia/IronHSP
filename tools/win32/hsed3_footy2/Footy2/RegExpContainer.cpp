/**
 * @file RegExpContainer.cpp
 * @brief ���K�\���̃N���X�B�q���̗v�f�𕡐������Ƃ��\�B
 * @author Shinji Watanabe
 * @date Jan.22.2008
 */

#include "RegExpContainer.h"

/**
 * CRegExpContainer::CRegExpContainer
 * @brief �R���X�g���N�^
 */
CRegExpContainer::CRegExpContainer()
{
}

/**
 * CRegExpContainer::~CRegExpContainer
 * @brief �f�X�g���N�^
 */
CRegExpContainer::~CRegExpContainer()
{
	for (ItElement iterElement = m_vecChildElements.begin();
		 iterElement != m_vecChildElements.end();iterElement ++)
	{
		delete (*iterElement);
		*iterElement = NULL;
	}
}

/**
 * CRegExpContainer::SearchInner
 * @brief �����p�̕�����ǉ�����
 */
bool CRegExpContainer::SearchInner(LinePt pStartLine,size_t nStartPos,CEditPosition *pEnd,LinePt pEndLine)
{
	// �q���̗v�f�ɂ��ă��[�v�������s��
	for (ItElement iterNowElement = m_vecChildElements.begin();
		 iterNowElement != m_vecChildElements.end();iterNowElement++)
	{
		
		// �����łȂ��Ƃ��͎�O����`�F�b�N
		bool bResult = (*iterNowElement)->Search(pStartLine,nStartPos,pEnd,pEndLine);
		
		// �߂�l�ɂ���Đ��䂷��
		if (!bResult)return false;
	}
	return true;
}

/*[EOF]*/
