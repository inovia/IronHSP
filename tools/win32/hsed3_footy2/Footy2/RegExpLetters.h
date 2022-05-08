/*===================================================================
CRegExpLetters�N���X
���K�\���̗v�f�N���X�B�ʏ�̕������i�[����ł���{�I�ȃN���X
===================================================================*/

#pragma once

#include "RegExpElement.h"

class CRegExpLetters : public CRegExpElement
{
public:
	CRegExpLetters(const wchar_t *pString, bool bIgnoreCase = false);
	CRegExpLetters(std::wstring &strLetters, bool bIgnoreCase = false);
	virtual ~CRegExpLetters();

protected:
	virtual bool SearchInner(LinePt pStartLine,size_t nStartPos,CEditPosition *pEnd,LinePt pEndLine);

private:
	std::wstring m_strLetters;
	bool         m_bIgnoreCase;
};

/*[EOF]*/
