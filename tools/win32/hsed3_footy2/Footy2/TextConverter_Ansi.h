/*================================================================
ANSI�Ɋ֘A���镶���R�[�h�ϊ��N���X
Windows��API���g�p����
================================================================*/

#pragma once

#include "TextConverter.h"

#ifndef UNDER_CE

class CTextConverter_ANSI : public CTextConverter{
public:
	bool ToUnicode(const char* pRawText,size_t nSize);
	bool ToMulti(const wchar_t* pMulti,size_t nSize);
};

#endif	/*not defined UNDER_CE*/

/*[EOF]*/
