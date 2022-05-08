/**
 * @file FootyDocUndo.cpp
 * @brief �h�L�������g�Ǘ��N���X�B���̃t�@�C���ŃA���h�D�̏������s���܂��B
 * @author Shinji Watanabe
 * @date 2009/01/11
 */

#include "FootyDoc.h"
#include "UndoBuffer.h"

//-----------------------------------------------------------------------------
/**
 * @brief �A���h�D���𖖔��ɑ}�����܂��B
 */
bool CFootyDoc::PushBackUndo(CUndoBuffer *pUndo)
{
	FOOTY2_ASSERT( !IsReadOnly() );

	if (!pUndo)return false;
	if (m_pNowUndoPos == m_lsUndoBuffer.end())		// �A���h�D�����s���Ă��Ȃ�
	{
		m_lsUndoBuffer.push_back(*pUndo);
		/*�Z�[�u�|�C���g�Ɋւ��鏈��*/
		if (!m_bCannotReachSavedPos &&				// �A���h�D�ւ̓��B���\��
			m_pSavedPos == m_lsUndoBuffer.end())	// �ŏ��̃A���h�D�Z�b�g�̂Ƃ���
			m_pSavedPos--;							// ��O���A���h�D�̈ʒu�ƂȂ�
	}
	else											// �A���h�D�����s���Ă���
	{
		// �������ʒu�ɃZ�[�u�|�C���g���܂܂�Ă��邩�ǂ������ׂ�
		if (!m_bCannotReachSavedPos)
		{
			std::list<CUndoBuffer>::iterator iterUndo;
			for (iterUndo = m_pNowUndoPos;iterUndo != m_lsUndoBuffer.end();iterUndo++)
			{
				if (iterUndo == m_pSavedPos)
				{
					m_pSavedPos = m_lsUndoBuffer.end();
					m_bCannotReachSavedPos = true;
				}
			}
		}
		// �o�b�t�@�̑���
		m_lsUndoBuffer.erase(m_pNowUndoPos,m_lsUndoBuffer.end());	// ��������Ō�܂ŏ���
		m_lsUndoBuffer.push_back(*pUndo);							// �Ō�ɑ}��
		m_pNowUndoPos = m_lsUndoBuffer.end();						// ��x���A���h�D���ĂȂ����Ƃɂ���
	}
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �A���h�D�������s���܂��B
 */
bool CFootyDoc::Undo()
{
	if ( IsReadOnly() ) return false;

	// ���݂̃A���h�D�[�ʒu���擾����
	if (m_pNowUndoPos == m_lsUndoBuffer.end())		// �܂����s���Ă��Ȃ�
	{
		if (!m_lsUndoBuffer.size())
			return false;
	}
	else if (m_pNowUndoPos == m_lsUndoBuffer.begin())
	{
		return false;
	}
	m_pNowUndoPos --;

	// �R�}���h�ɏ]���ăA���h�D�������s���܂��B
	switch(m_pNowUndoPos->m_nUndoType)
	{
	case CUndoBuffer::UNDOTYPE_DELETE:
		m_pNowUndoPos->m_cBeforeStart.SetPosition(&m_cCaretPos,&m_lsLines);
		InsertString(m_pNowUndoPos->m_strBefore.c_str(),false);
		break;
	case CUndoBuffer::UNDOTYPE_INSERT:
		SetSelectStart(&m_pNowUndoPos->m_cAfterStart);
		SetSelectEndNormal(&m_pNowUndoPos->m_cAfterEnd);
		DeleteSelected(NULL);
		break;
	case CUndoBuffer::UNDOTYPE_REPLACE:
		SetSelectStart(&m_pNowUndoPos->m_cAfterStart);
		SetSelectEndNormal(&m_pNowUndoPos->m_cAfterEnd);
		InsertString(m_pNowUndoPos->m_strBefore.c_str(),false);
		break;
	}
	SendMoveCaretCallBack();
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief ���h�D�������s���܂��B
 */
bool CFootyDoc::Redo()
{
	if ( IsReadOnly() ) return false;

	// ���݂̃��h�D�[�ʒu���擾����
	if (m_pNowUndoPos == m_lsUndoBuffer.end())
		return false;
	
	// �R�}���h�ɏ]���ăA���h�D�������s���܂��B
	switch(m_pNowUndoPos->m_nUndoType)
	{
	case CUndoBuffer::UNDOTYPE_DELETE:
		SetSelectStart(&m_pNowUndoPos->m_cBeforeStart);
		SetSelectEndNormal(&m_pNowUndoPos->m_cBeforeEnd);
		DeleteSelected(NULL);
		break;
	case CUndoBuffer::UNDOTYPE_INSERT:
		m_pNowUndoPos->m_cAfterStart.SetPosition(&m_cCaretPos,&m_lsLines);
		InsertString(m_pNowUndoPos->m_strAfter.c_str(),false);
		break;
	case CUndoBuffer::UNDOTYPE_REPLACE:
		SetSelectStart(&m_pNowUndoPos->m_cBeforeStart);
		SetSelectEndNormal(&m_pNowUndoPos->m_cBeforeEnd);
		InsertString(m_pNowUndoPos->m_strAfter.c_str(),false);
		break;
	}
	
	// ���̃A���h�D�[����
	m_pNowUndoPos ++;
	SendMoveCaretCallBack();
	return true;
}

/*[EOF]*/
