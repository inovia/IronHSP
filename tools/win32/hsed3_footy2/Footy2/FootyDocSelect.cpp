/**
 * @file FootyDocSelect.cpp
 * @brief CFootyDoc�N���X�̒��őI���֘A�̏������s���܂��B
 * @author Shinji Watanabe
 * @version Jan.22.2008
 */

#include "FootyDoc.h"

//-----------------------------------------------------------------------------
/**
 * CFootyDoc::SetSelectStart
 * @brief �I���J�n�ʒu��ݒ肵�܂��B
 * @param pStart �ݒ肷��ʒu
 */
bool CFootyDoc::SetSelectStart(CEditPosition *pStart)
{
	if (!pStart)return false;
	m_nSelectType = SELECT_NONE;
	m_cSelectBegin = *pStart;
	return true;
}

//-----------------------------------------------------------------------------
/**
 * CFootyDoc::SetSelectStart
 * @brief �I���J�n�ʒu��ݒ肵�܂��B
 * @param pStart �ݒ肷��ʒu
 */
bool CFootyDoc::SetSelectStart(CUndoBuffer::CPosInfo *pStart)
{
	if (!pStart)return false;
	m_nSelectType = SELECT_NONE;
	pStart->SetPosition(&m_cSelectBegin,&m_lsLines);
	return true;
}

//-----------------------------------------------------------------------------
/**
 * CFootyDoc::SetSelectEndNormal
 * @brief �I���I���ʒu��ݒ肷��
 * @param �ݒ肷��ʒu
 */
bool CFootyDoc::SetSelectEndNormal(CEditPosition *pEnd){
	if (!pEnd)return false;
	m_cSelectEnd = *pEnd;
	if (m_cSelectEnd == m_cSelectBegin)		// �J�n�ʒu�Ɠ���
		m_nSelectType = SELECT_NONE;
	else if (m_cSelectEnd > m_cSelectBegin)	// �ʏ�I��
		m_nSelectType = SELECT_NORMAL;
	else									// �t�ʒu�I��
		m_nSelectType = SELECT_REV;
	return true;
}

//-----------------------------------------------------------------------------
/**
 * CFootyDoc::SetSelectEndNormal
 * @brief �I���I���ʒu��ݒ肷��
 */
bool CFootyDoc::SetSelectEndNormal(CUndoBuffer::CPosInfo *pEnd)
{
	if (!pEnd)return false;
	pEnd->SetPosition(&m_cSelectEnd,&m_lsLines);
	if (m_cSelectEnd == m_cSelectBegin)		// �J�n�ʒu�Ɠ���
		m_nSelectType = SELECT_NONE;
	else if (m_cSelectEnd > m_cSelectBegin)	// �ʏ�I��
		m_nSelectType = SELECT_NORMAL;
	else									// �t�ʒu�I��
		m_nSelectType = SELECT_REV;
	return true;
}

/*-------------------------------------------------------------------
CFootyDoc::GetSelStart
�I���J�n�ʒu���擾���郋�[�`��
-------------------------------------------------------------------*/
CEditPosition *CFootyDoc::GetSelStart(){
	if (m_nSelectType == SELECT_REV ||
		m_nSelectType == SELECT_BOX_REV)
		return &m_cSelectEnd;
	else
		return &m_cSelectBegin;
}

/*-------------------------------------------------------------------
CFootyDoc::GetSelEnd
�I���I���ʒu���擾���郋�[�`��
-------------------------------------------------------------------*/
CEditPosition *CFootyDoc::GetSelEnd(){
	if (m_nSelectType == SELECT_REV ||
		m_nSelectType == SELECT_BOX_REV)
		return &m_cSelectBegin;
	else
		return &m_cSelectEnd;
}

/*-------------------------------------------------------------------
CFootyDoc::SelectAll
�S�đI������
-------------------------------------------------------------------*/
void CFootyDoc::SelectAll(){
	m_nSelectType = SELECT_NORMAL;
	m_cSelectBegin.SetPosition(GetTopLine(),0);
	LinePt pLastLine = GetEndLine();pLastLine--;
	m_cSelectEnd.SetPosition(pLastLine,pLastLine->GetLineLength());
	m_cCaretPos = m_cSelectEnd;
}

/**
 * CFootyDoc::GetSelText
 * @brief �I�����Ă���e�L�X�g���擾���郋�[�`��
 * @param pString �o�͐�
 * @param nLineMode 
 */
bool CFootyDoc::GetSelText(std::wstring *pString, LineMode nLineMode){
	if (!pString || !IsSelecting())return false;
	// �錾
	size_t nNowIndex = 0;						//!< ����p�A���݂̃C���f�b�N�X�ԍ�
	size_t nReserve = GetSelLength(nLineMode);	//!< �m�ۗ�
	CEditPosition *pSelStart = GetSelStart();	//!< �I���J�n�ʒu
	CEditPosition *pSelEnd = GetSelEnd();		//!< �I���I���ʒu
	CEditPosition cNowPos;						//!< ���݂̈ʒu
	bool bCopyLine;

	// ���������܂Ƃ߂Ċm�ۂ���
	pString->clear();
	pString->resize(nReserve);
	
	// ���s�R�[�h��ݒ�
	if (nLineMode == LM_AUTOMATIC)
		nLineMode = (LineMode)GetLineMode();
	
	/*�񂵂Ȃ���f�[�^�����Ă���*/
	cNowPos = *pSelStart;
	forever
	{
		bCopyLine = false;
		if (pSelStart->GetLineNum() == cNowPos.GetLineNum() &&
			pSelEnd->GetLineNum() == cNowPos.GetLineNum())
		{
			pString->insert(nNowIndex,
				&cNowPos.GetLinePointer()->m_strLineData[pSelStart->GetPosition()],
				pSelEnd->GetPosition() - pSelStart->GetPosition());
			break;
		}
		else if (pSelStart->GetLineNum() == cNowPos.GetLineNum())
		{
			pString->insert(nNowIndex,
				&pSelStart->GetLinePointer()->m_strLineData[pSelStart->GetPosition()]);
			nNowIndex += cNowPos.GetLinePointer()->GetLineLength() - pSelStart->GetPosition();
			bCopyLine = true;
		}
		else if (pSelEnd->GetLineNum() == cNowPos.GetLineNum())
		{
			pString->insert(nNowIndex,
				cNowPos.GetLinePointer()->m_strLineData.c_str(),pSelEnd->GetPosition());
			break;
		}
		else
		{
			pString->insert(nNowIndex,cNowPos.GetLinePointer()->m_strLineData);
			nNowIndex += cNowPos.GetLinePointer()->GetLineLength();
			bCopyLine = true;
		}

		// ���s�R�[�h�̃R�s�[
		if (bCopyLine)
		{
			switch((int)nLineMode)
			{
			case LM_CRLF:
				pString->insert(nNowIndex,L"\r\n");
				nNowIndex += 2;
				break;
			case LM_CR:
				pString->insert(nNowIndex,L"\r");
				nNowIndex += 1;
				break;
			case LM_LF:
				pString->insert(nNowIndex,L"\n");
				nNowIndex += 1;
				break;
			}
		}

		/*���̍s��*/
		cNowPos.MoveRealNext(&m_lsLines,1);
	}
	return true;
}

/**
 * CFootyDoc::DeleteSelected
 * @brief �I�����Ă���e�L�X�g���폜���܂��B
 * @param pUndoBuffer �A���h�D�ɋL�^���邽�߂̃o�b�t�@�BNULL�B
 * @note �폜������͑I����Ԃ��������ăL�����b�g�ʒu(pPos)��I���n�_�Ɉړ����܂��B
 */
CFootyDoc::RedrawType CFootyDoc::DeleteSelected(CUndoBuffer *pUndoBuffer)
{
	if (!IsSelecting())return REDRAW_FAILED;

	// �錾
	CEditPosition *pSelStart = GetSelStart();	//!< �I���J�n�ʒu
	CEditPosition *pSelEnd = GetSelEnd();		//!< �I���I���ʒu
	LinePt pStartLine = pSelStart->GetLinePointer();
	LinePt pEndLine = pSelEnd->GetLinePointer();
	LinePt pStartLineBack = pStartLine;

	// ������
	m_cCaretPos = *pSelStart;
	if (pUndoBuffer)
	{
		pUndoBuffer->m_nUndoType = CUndoBuffer::UNDOTYPE_DELETE;
		pUndoBuffer->m_cBeforeStart = *pSelStart;
		pUndoBuffer->m_cBeforeEnd = *pSelEnd;
		GetSelText(&pUndoBuffer->m_strBefore);
	}

	// ����
	if (pSelStart->GetLineNum() == pSelEnd->GetLineNum())
	{
		pStartLine->m_strLineData.erase(
			pSelStart->GetPosition(),pSelEnd->GetPosition()-pSelStart->GetPosition());
		SetLineInfo(pStartLine, false/*���s���܂ނ� by Tetr@pod*/);
	}
	else
	{
		// �J�n�s�ƏI���s�̑I���ʒu����폜����
		pStartLine->m_strLineData.erase(pSelStart->GetPosition());
		pStartLine->m_strLineData.insert(pSelStart->GetPosition(),
			&pEndLine->m_strLineData[pSelEnd->GetPosition()]);

		// ���̊Ԃ̍s���폜����
		pStartLine++;
		pEndLine++;
		DeleteLine(pStartLine,pEndLine);

		// �f�[�^���t���b�V������
		SetLineInfo(pStartLineBack,pEndLine, true/*���s���܂ނ� by Tetr@pod*/);
	}

	// �I������������
	m_nSelectType = SELECT_NONE;
	SendMoveCaretCallBack();
	return REDRAW_ALL;
}

/**
 * CFootyDoc::ClearSelected by inovia
 * @brief �I�����Ă���e�L�X�g���������܂��B
 * @param pUndoBuffer �A���h�D�ɋL�^���邽�߂̃o�b�t�@�BNULL�B
 * @note �폜������͑I����Ԃ��������ăL�����b�g�ʒu(pPos)��I���n�_�Ɉړ����܂��B
 */
int CFootyDoc::ClearSelected()
{
	if (!IsSelecting())return REDRAW_FAILED;
	// �I������������
	m_nSelectType = SELECT_NONE;
	SendMoveCaretCallBack();
	return REDRAW_ALL;
}

/*-------------------------------------------------------------------
CFootyDoc::GetSelLength
���ݑI�����Ă���e�L�X�g�̒������擾���܂�
-------------------------------------------------------------------*/
size_t CFootyDoc::GetSelLength(LineMode nLineMode){
	if (!IsSelecting())return 0;
	
	/*�錾*/
	size_t nSelSize = 0;						/*�I�����Ă���傫��*/
	size_t nLineCodeSize;
	CEditPosition cNowPos;						/*���ݑ������̍s*/
	CEditPosition *pSelStart = GetSelStart();	/*�I���J�n�ʒu*/
	CEditPosition *pSelEnd = GetSelEnd();		/*�I���I���ʒu*/
	
	/*���C���R�[�h�̒������擾*/
	if (nLineMode == LM_AUTOMATIC)
		nLineMode = m_nLineMode;

	switch(static_cast<size_t>(nLineMode)){
	case LM_CRLF:
		nLineCodeSize = 2; break;
	case LM_CR: case LM_LF:
		nLineCodeSize = 1; break;
	}
	
	/*���������[�v���Čv�Z������*/
	cNowPos = *pSelStart;
	forever{
		/*�Ƃ肠�������̍s�̒������ǉ�����*/
		nSelSize += cNowPos.GetLinePointer()->GetLineLength();
		/*�ŏ��̑I���s�̂Ƃ��́A�����܂ł�����*/
		if (pSelStart->GetLineNum() == cNowPos.GetLineNum())
			nSelSize -= pSelStart->GetPosition();
		/*�ŏI�̑I���s�̂Ƃ��́A���̕��������ă��[�v�𔲂���*/
		if (pSelEnd->GetLineNum() == cNowPos.GetLineNum()){
			nSelSize -= cNowPos.GetLinePointer()->GetLineLength() - pSelEnd->GetPosition();
			break;
		}
		/*�ŏI�s�łȂ��Ƃ��́A���s���v���X*/
		nSelSize += nLineCodeSize;
		cNowPos.MoveRealNext(&m_lsLines,1);
	}
	
	/*�l��ԋp����*/
	return nSelSize;
}

/*-------------------------------------------------------------------
CFootyDoc::SelectWord
���݂̃L�����b�g�̈ʒu�ŒP��I���������s���܂��B
-------------------------------------------------------------------*/
void CFootyDoc::SelectWord(){
	/*���݂̈ʒu�ɂ���P������擾���܂�*/
	LinePt pLine = m_cCaretPos.GetLinePointer();
	CFootyLine::WordInfo wInfo = pLine->GetWordInfo(m_cCaretPos.GetPosition());
	/*�P��̑I���������s���܂��B*/
	m_cCaretPos.SetPosition(pLine,wInfo.m_nBeginPos);
	SetSelectStart();
	m_cCaretPos.SetPosition(pLine,wInfo.m_nEndPos);
	SetSelectEndNormal();
	SendMoveCaretCallBack();
}

/*[EOF]*/
