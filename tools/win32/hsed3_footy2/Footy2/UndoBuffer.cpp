/*===================================================================
CUndoBuffer�N���X
�A���h�D�[����ێ�����N���X
===================================================================*/

#include "UndoBuffer.h"

/*-------------------------------------------------------------------
CPosInfo::CPosInfo
�R���X�g���N�^
-------------------------------------------------------------------*/
CUndoBuffer::CPosInfo::CPosInfo(){
	m_nLineNum = 0;
	m_nPosition = 0;
}

/*-------------------------------------------------------------------
CPosInfo::CPosInfo
�R���X�g���N�^
-------------------------------------------------------------------*/
size_t CUndoBuffer::CPosInfo::operator = (CEditPosition &cPos){
	m_nLineNum = cPos.GetLineNum();
	m_nPosition = cPos.GetPosition();
	return m_nLineNum;
}

/*-------------------------------------------------------------------
CPosInfo::SetPosition
�R���X�g���N�^
-------------------------------------------------------------------*/
bool CUndoBuffer::CPosInfo::SetPosition(CEditPosition *pPos,LsLines *pLines){
	if (!pPos || !pLines)return false;
	return pPos->SetPosition(pLines,m_nLineNum,m_nPosition);
}
