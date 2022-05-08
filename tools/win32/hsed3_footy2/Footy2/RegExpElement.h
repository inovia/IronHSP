/*===================================================================
CRegExpElement�N���X
���K�\���̗v�f�N���X
===================================================================*/

#pragma once

#include "EditPosition.h"

class CRegExpElement
{
public:
	CRegExpElement();
	virtual ~CRegExpElement();

	bool Search(LinePt pStartLine,size_t nStartPos,CEditPosition *pEnd,LinePt pEndLine);
	virtual void ResetSearch(){}

protected:
	virtual bool SearchInner(LinePt pStartLine,size_t nStartPos,CEditPosition *pEnd,LinePt pEndLine) = 0;

public:

protected:
	typedef enum _tLoopType{
		LOOPTYPE_NONE,				//!< �J��Ԃ��Ȃ�
		LOOPTYPE_LONG,				//!< �Œ���v
		LOOPTYPE_SHORT,				//!< �ŒZ��v
		LOOPTYPE_EQUALS,			//!< ���ƈ�v�����Ƃ��̂�
	} tLoopType;
	
	tLoopType m_nLoopType;
};

/*[EOF]*/
