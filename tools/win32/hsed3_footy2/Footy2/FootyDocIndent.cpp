/**
 * @file FootyDocIndent.cpp
 * @brief �C���f���g�֘A�̏������s���t�@�C��
 * @version 1.0
 * @author Shinji Watanabe
 * @date Jan.09.2008
 */

#include "FootyDoc.h"

//-----------------------------------------------------------------------------
/**
 * CFootyDoc::Indent
 * @brief �C���f���g�������s��
 */
CFootyDoc::RedrawType CFootyDoc::Indent()
{
	if (!IsSelecting())return REDRAW_NONE;
	// �錾
	CEditPosition *pSelStart = GetSelStart();	//!< �I���J�n�ʒu
	CEditPosition *pSelEnd = GetSelEnd();		//!< �I���I���ʒu
	LinePt pStartLine = pSelStart->GetLinePointer();
	LinePt pEndLine = pSelEnd->GetLinePointer();
	if (pSelEnd->GetPosition() == 0)pEndLine--;

	// ���[�v���ăC���f���g��̃o�b�t�@���쐬����
	std::wstring strInsertBuf = L"";
	for (LinePt pNowLine = pStartLine;;pNowLine++)
	{
		strInsertBuf += L"\t";
		strInsertBuf += pNowLine->m_strLineData;
		if (pNowLine->GetRealLineNum() + 1 != GetLineNum())
			strInsertBuf += L"\r\n";
		if (pNowLine == pEndLine)break;
	}

	// �I������
	m_cSelectBegin.SetPosition(pStartLine,0);
	if (pEndLine->GetRealLineNum() + 1 != GetLineNum())
	{
		pEndLine++;
		m_cSelectEnd.SetPosition(pEndLine,0);
	}
	else
	{
		m_cSelectEnd.SetPosition(pEndLine,pEndLine->GetLineLength());
	}
	m_nSelectType = SELECT_NORMAL;

	// ������������o�b�N�A�b�v
	size_t nStartLine = pStartLine->GetRealLineNum();
	size_t nEndLine = pEndLine->GetRealLineNum();
	bool bIsLastPos = m_cSelectEnd.GetPosition() != 0;

	// �o�b�t�@����I�������Ƃ���ƒu��������(�A���h�D�����܂�)
	InsertString(strInsertBuf.c_str());

	// �u���������������đI������
	m_cSelectBegin.SetPosition( GetLine( nStartLine ), 0 );
	m_cSelectEnd.SetPosition( GetLine( nEndLine ), bIsLastPos ? GetLine( nEndLine )->GetLineLength() : 0 );
	m_nSelectType = SELECT_NORMAL;

	// �ҏW�ʒm
	SendTextModified(MODIFIED_CAUSE_INDENT);
	return REDRAW_ALL;
}

//-----------------------------------------------------------------------------
/**
 * CFootyDoc::Unindent
 * @brief �t�C���f���g�������s��
 */
CFootyDoc::RedrawType CFootyDoc::Unindent()
{
	if (!IsSelecting())return REDRAW_NONE;

	// �錾
	size_t i,nPos;
	CEditPosition *pSelStart = GetSelStart();	//!< �I���J�n�ʒu
	CEditPosition *pSelEnd = GetSelEnd();		//!< �I���I���ʒu
	LinePt pStartLine = pSelStart->GetLinePointer();
	LinePt pEndLine = pSelEnd->GetLinePointer();
	if (pSelEnd->GetPosition() == 0)pEndLine--;

	// ���[�v���ăC���f���g��̃o�b�t�@���쐬����
	std::wstring strInsertBuf = L"";
	for (LinePt pNowLine = pStartLine;;pNowLine++)
	{
		if (pNowLine->m_strLineData[0] == L'\t')
		{
			i = 1;
		}
		else
		{
			nPos = 0;
			for (i=0;i<pNowLine->GetLineLength();i++)
			{
				if (nPos >= m_nTabLen)break;
				if (pNowLine->m_strLineData[i] == L' ')
					nPos ++;
				else if (pNowLine->m_strLineData[i] == L'�@')
					nPos += 2;
				else break;
			}
		}
		strInsertBuf += &pNowLine->m_strLineData[i];
		if (pNowLine->GetRealLineNum() + 1 != GetLineNum())
			strInsertBuf += L"\r\n";
		if (pNowLine == pEndLine)break;
	}

	// �I������
	m_cSelectBegin.SetPosition(pStartLine,0);
	if (pEndLine->GetRealLineNum() + 1 != GetLineNum())
	{
		pEndLine++;
		m_cSelectEnd.SetPosition(pEndLine,0);
	}
	else
	{
		m_cSelectEnd.SetPosition(pEndLine,pEndLine->GetLineLength());
	}
	m_nSelectType = SELECT_NORMAL;

	// ������������o�b�N�A�b�v
	size_t nStartLine = pStartLine->GetRealLineNum();
	size_t nEndLine = pEndLine->GetRealLineNum();
	bool bIsLastPos = m_cSelectEnd.GetPosition() != 0;

	// �o�b�t�@����I�������Ƃ���ƒu��������(�A���h�D�����܂�)
	InsertString(strInsertBuf.c_str());

	// �u���������������đI������
	m_cSelectBegin.SetPosition( GetLine( nStartLine ), 0 );
	m_cSelectEnd.SetPosition( GetLine( nEndLine ), bIsLastPos ? GetLine( nEndLine )->GetLineLength() : 0 );
	m_nSelectType = SELECT_NORMAL;

	// �ҏW�ʒm
	SendTextModified(MODIFIED_CAUSE_UNINDENT);
	return REDRAW_ALL;
}

/*[EOF]*/
