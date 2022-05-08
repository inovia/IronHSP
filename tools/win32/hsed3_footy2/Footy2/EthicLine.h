/*===================================================================
CEthicLine�N���X
�ϗ��s�Ǘ��@�\�t���̃|�W�V�����N���X(�s�݂̂��Ǘ�����)
===================================================================*/

#pragma once

#include "PositionBase.h"

class CEthicLine : public CPositionBase{
public:
	/*�R���X�g���N�^*/
	CEthicLine();
	
	/*�p�����[�^�ݒ�*/
	bool SetPosition(LsLines *pLines,size_t nLine,size_t nEthic);
	bool SetPosition(LinePt pLine);
	
	/*�I�y���[�^*/
	bool operator = (CEthicLine &cEthic);
	inline bool operator != (CEthicLine &cEthic){
		return m_nNowEthicLine != cEthic.m_nNowEthicLine ||
			   GetLineNum() != cEthic.GetLineNum();
	}
	inline bool operator <= (CEthicLine &cEthic){
		if (GetLineNum() == cEthic.GetLineNum())
			return m_nNowEthicLine <= cEthic.m_nNowEthicLine;
		else
			return GetLineNum() <= cEthic.GetLineNum();
	}
	
	/*�ړ�*/
	bool MoveEthicNext(LsLines *pLines,size_t nPos);
	bool MoveEthicBack(size_t nPos);
	
	/*�擾*/
	inline size_t GetEthicNum(){return m_nNowEthicLine;}
	int GetDifference(CEthicLine &lnEthic,LsLines *pLines);

private:
	size_t m_nNowEthicLine;		/*���݂̘_���s*/
};

/*[EOF]*/
