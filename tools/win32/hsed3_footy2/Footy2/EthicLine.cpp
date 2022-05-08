/*===================================================================
CEthicLine�N���X
�ϗ��s�Ǘ��@�\�t���̃|�W�V�����N���X
===================================================================*/

#include "EthicLine.h"

/*-------------------------------------------------------------------
CEthicLine::CEthicLine
�R���X�g���N�^
-------------------------------------------------------------------*/
CEthicLine::CEthicLine(){
	m_nNowEthicLine = 0;
}


/*-------------------------------------------------------------------
CEthicLine::SetPosition
�|�W�V�����ʒu��ݒ�
-------------------------------------------------------------------*/
bool CEthicLine::SetPosition(LsLines *pLines,size_t nLine,size_t nEthic){
	if (!SetParam(pLines,nLine))
		return false;
	if (nEthic < GetLinePointer()->GetEthicLine()){
		m_nNowEthicLine = nEthic;
		return true;
	}
	else return false;
}

/*-------------------------------------------------------------------
CEthicLine::operator = 
����I�y���[�^
-------------------------------------------------------------------*/
bool CEthicLine::operator = (CEthicLine & cEthic){
	m_nNowEthicLine = cEthic.m_nNowEthicLine;
	return (*(CPositionBase*)this) = cEthic;
}

/**
 * CEthicLine::MoveEthicNext
 * @brief �ϗ��s�̃f�[�^���܂߂Ďw�肵���s���i�݂܂��B
 * @param pLines �s���X�g
 * @param nPos �i�ސ�
 * @return ���s������false�A����������true
 */
bool CEthicLine::MoveEthicNext(LsLines *pLines,size_t nPos)
{
	if (!pLines)return false;
	size_t nThisEthic = GetLinePointer()->GetEthicLine();
	// ���[�v���Ă���
	for (size_t i=0;i<nPos;i++){
		if (m_nNowEthicLine == nThisEthic - 1){			// ���ꂪ�ŏI�_���s�̂Ƃ�
			if (GetLineNum()+1 != pLines->size()){		// ���ꂪ�ŏI�s�łȂ��Ƃ�
				MoveRealNext(pLines,1);//				// ���̍s��
				nThisEthic = GetLinePointer()->GetEthicLine();
				m_nNowEthicLine = 0;
			}
			else return false;
		}
		else m_nNowEthicLine++;
	}
	return true;
}

/*-------------------------------------------------------------------
CEthicLine::MoveEthicBack
�ϗ��s�̃f�[�^���܂߂đO�̍s�ֈړ����܂��B������nPos���ړ��ł��Ȃ�
(�I�[�ɂ���)�ꍇ�⎸�s�����ꍇ��false���߂�܂��B
-------------------------------------------------------------------*/
bool CEthicLine::MoveEthicBack(size_t nPos){
	/*���[�v���Ă���*/
	for (size_t i=0;i<nPos;i++){
		if (m_nNowEthicLine == 0){
			if (GetLineNum() != 0){
				MoveRealBack(1);
				m_nNowEthicLine = GetLinePointer()->GetEthicLine() - 1;
			}
			else return false;
		}
		else m_nNowEthicLine --;
	}
	return true;
}

/*-------------------------------------------------------------------
CEthicLine::SetPosition
�|�W�V�������Z�b�g���܂��B�_���s��0�ɃZ�b�g����܂��B
-------------------------------------------------------------------*/
bool CEthicLine::SetPosition(LinePt pLine){
	SetParam(pLine);
	m_nNowEthicLine = 0;
	return true;
}

int CEthicLine::GetDifference(CEthicLine &lnEthic,LsLines *pLines){
	int nRetValue;
	CEthicLine lnWork = *this;
	if (lnWork <= lnEthic){
		for (nRetValue=0;lnWork != lnEthic;nRetValue++){
			lnWork.MoveEthicNext(pLines,1);
		}
	}
	else{
		for (nRetValue=0;lnWork != lnEthic;nRetValue--){
			lnWork.MoveEthicBack(1);
		}
	}
	return nRetValue;
}


/*[EOF]*/
