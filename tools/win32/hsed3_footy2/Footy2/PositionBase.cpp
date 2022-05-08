/*===================================================================
PositionBase�N���X
�G�f�B�^��̃|�W�V�����x�[�X�N���X
===================================================================*/

#include "PositionBase.h"

/*-------------------------------------------------------------------
CPositionBase::CPositionBase
�|�W�V�����x�[�X�N���X�̃R���X�g���N�^
-------------------------------------------------------------------*/
CPositionBase::CPositionBase(){
}

/*-------------------------------------------------------------------
CPositionBase::operator = 
�|�W�V�����x�[�X�N���X�̃R�s�[�I�y���[�^
-------------------------------------------------------------------*/
bool CPositionBase::operator = (CPositionBase &cPos){
	m_iterLine = cPos.m_iterLine;
	return true;
}

/*-------------------------------------------------------------------
CPositionBase::SetParam
�p�����[�^�Z�b�g(�w��s��)
-------------------------------------------------------------------*/
bool CPositionBase::SetParam(LsLines *pLines,size_t nLine){
	/*�G���[�`�F�b�N*/
	if (!pLines)return false;
	if (pLines->size() <= nLine)return false;
	/*�s�|�C���^�擾*/
	LinePt pLine = pLines->begin();
	for (size_t i=0;i<nLine;i++)pLine++;
	/*�������*/
	m_iterLine = pLine;
	return true;
}

/*-------------------------------------------------------------------
CPositionBase::SetParam
�p�����[�^�Z�b�g
-------------------------------------------------------------------*/
void CPositionBase::SetParam(LinePt pLine){
	m_iterLine = pLine;
}

/*-------------------------------------------------------------------
CPositionBase::MoveRealNext
���ۂ̍s�Ŏ��֍s��
-------------------------------------------------------------------*/
bool CPositionBase::MoveRealNext(LsLines *pLines,size_t nPos){
	if (!pLines)return false;
	LineSize nSize = pLines->size();
	for (size_t i=0;i<nPos;i++){
		if (GetLineNum() + 1 == nSize)return false;
		m_iterLine++;
	}
	return true;
}

/*-------------------------------------------------------------------
CPositionBase::MoveRealBack
���ۂ̍s�őO�ɍs��
-------------------------------------------------------------------*/
bool CPositionBase::MoveRealBack(size_t nPos){
	for (size_t i=0;i<nPos;i++){
		if (GetLineNum() == 0)return false;
		m_iterLine--;
	}
	return true;
}
