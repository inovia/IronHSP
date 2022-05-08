/*===================================================================
CEditPosition�N���X
�G�f�B�^��̈ʒu���w�������N���X
===================================================================*/

#include "EditPosition.h"

/*-------------------------------------------------------------------
CEditPosition::CEditPosition
�R���X�g���N�^�ł��B
-------------------------------------------------------------------*/
CEditPosition::CEditPosition(){
	m_nPosition = 0;
	m_nBackupPosition = 0;
	m_nBackupLine = 0;
}

/*-------------------------------------------------------------------
CEditPosition::operator =
������Z
-------------------------------------------------------------------*/
bool CEditPosition::operator = (CEditPosition &cPos){
	m_nPosition = cPos.m_nPosition;
	m_nBackupPosition = cPos.m_nBackupPosition;
	m_nBackupLine = cPos.m_nBackupLine;
	m_iterBackupLine = cPos.m_iterBackupLine;
	return *(CPositionBase*)this = cPos;
}

/*-------------------------------------------------------------------
CEditPosition::operator ==
�E�ӂƓ��������ǂ����𔻒肷��
-------------------------------------------------------------------*/
bool CEditPosition::operator == (CEditPosition &cPos){
	return m_nPosition == cPos.m_nPosition &&
		GetLineNum() == cPos.GetLineNum();
}

/*-------------------------------------------------------------------
CEditPosition::operator !=
�E�ӂƓ������Ȃ����ǂ����𔻒肷��
-------------------------------------------------------------------*/
bool CEditPosition::operator != (CEditPosition &cPos){
	return m_nPosition != cPos.m_nPosition ||
		GetLineNum() != cPos.GetLineNum();
}

/*-------------------------------------------------------------------
CEditPosition::operator <
�s��������
-------------------------------------------------------------------*/
bool CEditPosition::operator < (CEditPosition &cPos){
	if (GetLineNum() == cPos.GetLineNum())
		return m_nPosition < cPos.m_nPosition;
	else
		return GetLineNum() < cPos.GetLineNum();
}

/*-------------------------------------------------------------------
CEditPosition::operator >
�s��������
-------------------------------------------------------------------*/
bool CEditPosition::operator > (CEditPosition &cPos){
	if (GetLineNum() == cPos.GetLineNum())
		return m_nPosition > cPos.m_nPosition;
	else
		return GetLineNum() > cPos.GetLineNum();
}

/*-------------------------------------------------------------------
CEditPosition::MoveColumnForward
nPos�����ړ�������B������true�ł��B�f�[�^�̓o�b�N�A�b�v����܂��B
-------------------------------------------------------------------*/
bool CEditPosition::MoveColumnForward(LsLines *pLine,size_t nPos){
	if (!pLine)return false;
	m_nPosition += nPos;
	/*���̍s�ɍs�����`�F�b�N*/
	if (m_nPosition > GetLinePointer()->GetLineLength()){
		if (GetLineNum() + 1 < pLine->size()){/*���̍s��*/
			MoveRealNext(pLine,1);
			m_nPosition = 0;
		}
		else{							/*���̍s�����݂��Ȃ�*/
			m_nPosition = GetLinePointer()->GetLineLength();
		}
	}
	BackupAll();
	return true;
}

/*-------------------------------------------------------------------
CEditPosition::MoveColumnBackward
nPos�������ɂ�����B������true�ł��B�f�[�^�̓o�b�N�A�b�v����܂��B
-------------------------------------------------------------------*/
bool CEditPosition::MoveColumnBackward(LsLines *pLines,size_t nPos){
	if (!pLines)return false;
	/*�O�̍s�ɍs�����`�F�b�N*/
	if (m_nPosition < nPos){
		if (GetLineNum() != 0){			/*�O�̍s��*/
			CPositionBase::MoveRealBack(1);
			m_nPosition = GetLinePointer()->GetLineLength();
		}
		else{							/*�O�̍s�����݂��Ȃ�*/
			m_nPosition = 0;
		}
	}
	else m_nPosition -= nPos;
	BackupAll();
	return true;
}

/*-------------------------------------------------------------------
CEditPosition::SetPosition
������Z(nLine�s��nPos���ڂɈړ�����A����0�x�[�X)�ł��B
�f�[�^�̓o�b�N�A�b�v����܂��B
-------------------------------------------------------------------*/
bool CEditPosition::SetPosition(LsLines *pLines,size_t nLine,size_t nPos){
	if (!SetParam(pLines,nLine))					/*�s���Z�b�g����*/
		return false;
	if (GetLinePointer()->GetLineLength() < nPos)	/*�����s���łȂ����`�F�b�N����*/
		return false;
	m_nPosition = nPos;								/*�����Z�b�g����*/
	BackupAll();									/*�f�[�^��S�ăo�b�N�A�b�v����*/
	return true;
}

/*-------------------------------------------------------------------
CEditPosition::SetPosition
�f�[�^���o�b�N�A�b�v����
-------------------------------------------------------------------*/
bool CEditPosition::SetPosition(LinePt pLine,size_t nPos){
	SetParam(pLine);
	if (GetLinePointer()->GetLineLength() < nPos)	/*�����s���łȂ����`�F�b�N����*/
		return false;
	m_nPosition = nPos;								/*�����Z�b�g����*/
	BackupAll();
	return true;
}


/*-------------------------------------------------------------------
CEditPosition::MoveRealNext
(�ϗ��s�ł͂Ȃ�)�s���ɐi�߂܂��B�f�[�^�̓o�b�N�A�b�v����܂��B
-------------------------------------------------------------------*/
bool CEditPosition::MoveRealNext(LsLines *pLine,size_t nLine){
	if (!pLine)return false;
	/*��ւ����߂�*/
	if (!CPositionBase::MoveRealNext(pLine,nLine)){
		m_nPosition = GetLinePointer()->GetLineLength();
		BackupAll();
		return false;
	}
	else{
		m_nPosition = 0;
		BackupAll();
		return true;
	}
}

/*-------------------------------------------------------------------
CEditPosition::MoveLineForwardEthic
�o�b�N�A�b�v�����s���A���������Ɉ�_���s���ֈړ����܂��B
�f�[�^�̓o�b�N�A�b�v����܂���B
-------------------------------------------------------------------*/
bool CEditPosition::MoveLineForwardEthic(LsLines *pLine,size_t nPos,
										 size_t nColumn,size_t nTabLen,int nMode){
	if (!pLine)return false;
	/*�錾*/
	CFootyLine::EthicInfo cBackupInfo =
		m_iterBackupLine->CalcEthicLine(m_nBackupPosition,nColumn,nTabLen,nMode);
	CFootyLine::EthicInfo cNowInfo =
		GetLinePointer()->CalcEthicLine(m_nPosition,nColumn,nTabLen,nMode);
	/*��ԉ��̘_���s���H*/
	if (GetLinePointer()->GetEthicLine() == cNowInfo.m_nEthicLine + 1){
		/*���̍s�֍s���A���̍s�����邩�H*/
		if (GetLineNum() + 1 != pLine->size()){
			CPositionBase::MoveRealNext(pLine,1);		/*���̍s��*/
			m_nPosition = GetLinePointer()->CalcRealPosition(0,cBackupInfo.m_nEthicColumn,nColumn,nTabLen,nMode);
		}
		else	/*�����Ȃ�΂��̍s�̍Ō�̌���*/
			m_nPosition = GetLinePointer()->GetLineLength();
	}
	else{
		/*���̍s�̎��̘_���s��*/
		m_nPosition = GetLinePointer()->CalcRealPosition
			(cNowInfo.m_nEthicLine + 1,cBackupInfo.m_nEthicColumn,nColumn,nTabLen,nMode);
	}
	return true;
}

/*-------------------------------------------------------------------
CEditPosition::MoveLineBackwardEthic
�o�b�N�A�b�v�����s���A���������Ɉ�_���s��ֈړ����܂��B
�f�[�^�̓o�b�N�A�b�v����܂���B
-------------------------------------------------------------------*/
bool CEditPosition::MoveLineBackwardEthic(LsLines *pLines,size_t nPos,
										  size_t nColumn,size_t nTabLen,int nMode){
	if (!pLines)return false;
	/*�錾*/
	CFootyLine::EthicInfo cBackupInfo =
		m_iterBackupLine->CalcEthicLine(m_nBackupPosition,nColumn,nTabLen,nMode);
	CFootyLine::EthicInfo cNowInfo =
		GetLinePointer()->CalcEthicLine(m_nPosition,nColumn,nTabLen,nMode);
	/*��ԉ��̘_���s���H*/
	if (cNowInfo.m_nEthicLine == 0){
		/*�O�̍s�֍s���A�O�̍s�����邩�H*/
		if (GetLineNum() != 0){
			CPositionBase::MoveRealBack(1);	/*�O�̍s��*/
			m_nPosition = GetLinePointer()->CalcRealPosition(GetLinePointer()->
				GetEthicLine()-1,cBackupInfo.m_nEthicColumn,nColumn,nTabLen,nMode);
		}
		else				/*�����Ȃ�΍ŏ��̌���*/
			m_nPosition = 0;
	}
	else{
		/*���̍s�̎��̘_���s��*/
		m_nPosition = GetLinePointer()->CalcRealPosition
			(cNowInfo.m_nEthicLine - 1,cBackupInfo.m_nEthicColumn,nColumn,nTabLen,nMode);
	}
	return true;
}

/*-------------------------------------------------------------------
CEditPosition::BackupAll
�㉺�L�[���������Ƃ��ɉ����n�߂��ʒu�̌����𒆐S�ɃL�����b�g�ړ���
�N����悤�ɂ��邽�߂ɑS�Ẵf�[�^�������o�ϐ��Ƀo�b�N�A�b�v���܂��B
-------------------------------------------------------------------*/
void CEditPosition::BackupAll(){
	m_nBackupPosition = m_nPosition;
	m_nBackupLine = GetLineNum();
	m_iterBackupLine = GetLinePointer();
}
