/*===================================================================
CEditPosition�N���X
�s���w�������f�[�^���i�[���邱�Ƃ��ł��܂��B
===================================================================*/

#pragma once 

#include "PositionBase.h"

class CEditPosition : public CPositionBase{
public:
	/*�R���X�g���N�^*/
	CEditPosition();
	
	/*�I�y���[�V����(������Z)*/
	bool operator = (CEditPosition &cPos);
	bool operator == (CEditPosition &cPos);
	bool operator != (CEditPosition &cPos);
	bool operator < (CEditPosition &cPos);
	bool operator > (CEditPosition &cPos);
	
	/*�ʒu�ݒ�*/
	bool SetPosition(LsLines *pLines,size_t nLine,size_t nPos);
	bool SetPosition(LinePt pLine,size_t nPos);

	/*�f�[�^����*/
	bool MoveColumnForward(LsLines *pLine,size_t nPos);
	bool MoveColumnBackward(LsLines *pLine,size_t nPos);
	bool MoveLineForwardEthic(LsLines *pLine,size_t nPos,size_t nColumn,size_t nTabLen,int nMode);
	bool MoveLineBackwardEthic(LsLines *pLine,size_t nPos,size_t nColumn,size_t nTabLen,int nMode);
	
	/*�I�[�o�[���C�h*/
	bool MoveRealNext(LsLines *pLine,size_t nLine);
	
	/*�f�[�^�擾*/
	inline size_t GetPosition(){return m_nPosition;}

private:
	void BackupAll();

public:
private:
	size_t m_nPosition;						/*����(0�x�[�X)*/
	
	/*�o�b�N�A�b�v�p*/
	size_t m_nBackupPosition;				/*�o�b�N�A�b�v�|�W�V����*/
	size_t m_nBackupLine;					/*�o�b�N�A�b�v�s�ԍ�*/
	LinePt m_iterBackupLine;				/*�o�b�N�A�b�v�s�ւ̃|�C���^*/
};

/*[EOF]*/
