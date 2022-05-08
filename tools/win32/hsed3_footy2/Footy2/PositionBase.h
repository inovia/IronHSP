/*===================================================================
PositionBase�N���X
�G�f�B�^��̃|�W�V�����x�[�X�N���X
===================================================================*/

#pragma once

#include "FootyLine.h"

class CPositionBase{
public:
	/*�R���X�g���N�^*/
	CPositionBase();
	
	/*�I�y���[�^*/
	virtual bool operator = (CPositionBase &cPos);
	virtual bool operator <= (CPositionBase &cPos){return GetLineNum() <= cPos.GetLineNum();}
	virtual bool operator >= (CPositionBase &cPos){return GetLineNum() >= cPos.GetLineNum();}
	virtual bool operator < (CPositionBase &cPos){return GetLineNum() < cPos.GetLineNum();}
	virtual bool operator > (CPositionBase &cPos){return GetLineNum() > cPos.GetLineNum();}
	virtual bool operator == (CPositionBase &cPos){return GetLineNum() == cPos.GetLineNum();}
	virtual bool operator != (CPositionBase &cPos){return GetLineNum() != cPos.GetLineNum();}
	
	/*�擾*/
	inline size_t GetLineNum(){return m_iterLine->GetRealLineNum();}
	inline LinePt GetLinePointer(){return m_iterLine;}
	
	/*�s���ړ�����*/
	virtual bool MoveRealNext(LsLines *pLines,size_t nPos);
	virtual bool MoveRealBack(size_t nPos);

	static void OnLineDelete(int nLineNum);

protected:	
	/*�|�W�V�������Z�b�g���܂�*/
	bool SetParam(LsLines *pLines,size_t nLine);
	void SetParam(LinePt pLine);

private:
	LinePt m_iterLine;						/*���̈ʒu�̍s*/
};

/*[EOF]*/
