/*===================================================================
CUndoBuffer�N���X
�A���h�D�[����ێ�����N���X
===================================================================*/

#pragma once

#include "EditPosition.h"

class CUndoBuffer{
public:
	enum UndoType{
		UNDOTYPE_INSERT,				//!< �����񂪑}�����ꂽ
		UNDOTYPE_DELETE,				//!< �����񂪍폜���ꂽ
		UNDOTYPE_REPLACE,				//!< �����񂪒u�����ꂽ
		UNDOTYPE_MOVE,					//!< �ړ����ꂽ
	};
	
	UndoType m_nUndoType;				//!< �A���h�D�̏��

	/*
	 * CEditPosition���g���ƁA���̍s���폜����Ă��܂����Ƃ���
	 * ���������Ȃ��Ă��܂����Ƃ�����̂Ő�p�̃N���X���g�p���܂��B
	 */
	class CPosInfo{
	public:
		CPosInfo();

		bool SetPosition(CEditPosition *pPos,LsLines *pLines);
		size_t operator = (CEditPosition&);

	private:
		size_t m_nLineNum;
		size_t m_nPosition;
	};

	/*�ʒu���*/
	CPosInfo m_cBeforeStart;
	CPosInfo m_cBeforeEnd;
	CPosInfo m_cAfterStart;
	CPosInfo m_cAfterEnd;
	
	/*��������*/
	std::wstring m_strBefore;				//!< ���s�O(�폜���ꂽ)������̏��
	std::wstring m_strAfter;				//!< ���s��(�}�����ꂽ)������̏��
};

/*[EOF]*/
