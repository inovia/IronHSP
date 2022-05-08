/**
 * @file FootyDocSearch.cpp
 * @brief �h�L�������g�Ǘ��N���X�B���̃t�@�C���Ō����n�̎��������܂��B
 * @author Shinji Watanabe
 * @version 1.0
 * @date Jan.22.2008
 */

#include "FootyDoc.h"
#include "RegExpLetters.h"

#define FLAG_ON(x)		((nFlags & x) != 0)


/**
 * CFootyDoc::Search
 * @brief �������������s���鏈��
 * @param szText ����������
 * @param nFlags �������邽�߂̃t���O(Footy2.h�ɒ�`)
 */
bool CFootyDoc::Search(const wchar_t *szText, int nFlags)
{
	CRegExpContainer cSearchText;
	
	// ���K�\���ɂ���
	if (FLAG_ON(SEARCH_REGEXP))
	{
	}
	else
	{
		cSearchText.AddRegExp(new CRegExpLetters(szText, FLAG_ON(SEARCH_IGNORECASE)));
	}
	
	// ���������̎��s
	CEditPosition cStartPos;
	if (FLAG_ON(SEARCH_FROMCURSOR))
	{
		if ( IsSelecting() )
		{
			cStartPos = FLAG_ON(SEARCH_BACK) ? *GetSelStart() : *GetSelEnd();
		}
		else
		{
			cStartPos = m_cCaretPos;
		}
	}
	else
	{
		cStartPos.SetPosition(m_lsLines.begin(), 0);
	}
	return SearchText(&cStartPos, &cSearchText, FLAG_ON(SEARCH_BACK));
}

/**
 * CFootyDoc::SearchText
 * @brief �������������s���鏈��
 * @param pStart �����J�n�ʒu
 * @param pRegElement ���K�\���v�f
 * @param bBackward �������
 * @return ���������Ƃ���true���Ԃ�
 */
bool CFootyDoc::SearchText(CEditPosition *pStart, CRegExpElement *pRegElement, bool bBackward)
{
	// �錾
	CEditPosition cEndPos;							//!< �I���I���ʒu
	LinePt pNowLine = pStart->GetLinePointer();		//!< �������̍s�ʒu
	size_t nNowPosition = pStart->GetPosition();	//!< �������̌�
	
	// �������֌������鏈���̏ꍇ
	if (!bBackward)
	{
		// �s���ƂɃ��[�v����
		for (;pNowLine != m_lsLines.end();)
		{
			// �����ƂɃ��[�v����
			for (;nNowPosition != pNowLine->GetLineLength();nNowPosition++)
			{
				if (pRegElement->Search(pNowLine,nNowPosition,&cEndPos,m_lsLines.end()))
				{
					SelectSearchedWord(pNowLine,nNowPosition,&cEndPos);
					return true;
				}
			}

			// ���̍s�ֈړ�����
			pNowLine++;
			nNowPosition = 0;
		}
	}
	else
	{
		// �s���ƂɃ��[�v����
		for (;;)
		{
			// �����ƂɃ��[�v����
			if ( nNowPosition != 0 )
			{
				for (nNowPosition-- ; ; nNowPosition--)
				{
					if (pRegElement->Search(pNowLine,nNowPosition,&cEndPos,m_lsLines.end()))
					{
						SelectSearchedWord(pNowLine,nNowPosition,&cEndPos);
						return true;
					}
					if (nNowPosition == 0)break;
				}
			}

			// ���̍s�ֈړ�����
			if (pNowLine == m_lsLines.begin())break;
			pNowLine--;
			nNowPosition = pNowLine->GetLineLength();
		}
	}
	return false;
}


/**
 * CFootyDoc::SelectSearchedWord
 * @brief �����̌��ʌ����������t��I������
 */
void CFootyDoc::SelectSearchedWord(LinePt pNowLine,size_t nPosition,CEditPosition *pEndPos)
{
	CEditPosition cStartSelect;			//!< ���������Ƃ��A�I���J�n�ʒu�Ƃ���ʒu

	cStartSelect.SetPosition(pNowLine,nPosition);
	*GetCaretPosition() = *pEndPos;
	SetSelectStart(&cStartSelect);
	SetSelectEndNormal();
}

/**
 * CFootyDoc::ParseRegulaerExpression
 * @brief ���K�\���Ƃ��ĕ�������p�[�X���鏈��
 */
void CFootyDoc::ParseRegulaerExpression(const wchar_t *szString,CRegExpContainer *pRegExp)
{
}


/*[EOF]*/
