/*===================================================================
CTextConverter_Unicode�N���X
�e�L�X�g�̕ϊ��������\�ȃN���X�ł��B
===================================================================*/

#include "TextConverter_Ansi.h"

#ifndef UNDER_CE

/*----------------------------------------------------------------
CTextConverter_ANSI::ToUnicode
ANSI����Unicode�ɕϊ�����
----------------------------------------------------------------*/
bool CTextConverter_ANSI::ToUnicode(const char* pChar,size_t nSize){
	int nAllocSize = MultiByteToWideChar(CP_ACP,0,pChar,(int)nSize,NULL,0);
	if (!Alloc((nAllocSize + 1) * sizeof(wchar_t)))return false;
	MultiByteToWideChar(CP_ACP,0,pChar,(int)nSize,(wchar_t*)m_pOutputText,nAllocSize);
	((wchar_t*)m_pOutputText)[nAllocSize] = L'\0';
	return true;
}

/*----------------------------------------------------------------
CTextConverter_ANSI::ToMulti
Unicode����ANSI�ɕϊ�����
----------------------------------------------------------------*/
bool CTextConverter_ANSI::ToMulti(const wchar_t *pChar,size_t nSize){
	int nAllocSize = WideCharToMultiByte(CP_ACP,0,pChar,(int)nSize,NULL,0,NULL,NULL);
	if (!Alloc(nAllocSize + sizeof(char)))return false;
	WideCharToMultiByte(CP_ACP,0,pChar,(int)nSize,m_pOutputText,nAllocSize,NULL,NULL);
	m_pOutputText[nAllocSize] = '\0';
	return true;
}

#endif	/*not defined UNDER_CE*/

/*[EOF]*/
