/**
 * @file TextConverter_UTF32.cpp
 * @brief �e�L�X�g�̕ϊ��������\�ȃN���X�ł��B
 * @author Shinji Watanabe
 * @version 1.0
 */

#include "TextConverter_Unicode.h"

/*----------------------------------------------------------------
CTextConverter_UTF32LE::ToUnicode
UTF16����Unicode�ɕϊ�����
----------------------------------------------------------------*/
bool CTextConverter_UTF32LE::ToUnicode(const char* pChar,size_t nSize){
	/*�錾*/
	size_t i,nStartPos;
	size_t nAllocSize = 0;
	size_t nUnicodePos = 0;
	
	/*BOM���������疳������*/
	if (memcmp(pChar,"\xFF\xFE\x00\x00",4) == 0){
		m_bIncludeBOM = true;
		nStartPos=4;
	}
	else{
		m_bIncludeBOM = false;
		nStartPos=0;
	}

	/*�K�v�ȃ������̈���v�Z*/
	for (i=nStartPos;i<nSize;i += 4){
		unsigned long u = *((unsigned long*)(&pChar[i]));
		if		(0x00000000 <= u && u <= 0x0000FFFF){	/*�T���Q�[�g�y�A����*/
			nAllocSize += sizeof(wchar_t);
		}
		else if (0x00010000 <= u && u <= 0x000FFFFF){	/*�T���Q�[�g�y�A����*/
			nAllocSize += sizeof(wchar_t) * 2;
		}
	}
	if (!Alloc(nAllocSize + sizeof(wchar_t)))
		return false;
	
	/*�ϊ�����*/
	for (i=nStartPos;i<nSize;i += 4){
		unsigned long u = *((unsigned long*)(&pChar[i]));
		if		(0x00000000 <= u && u <= 0x0000FFFF){	/*�T���Q�[�g�y�A����*/
			((wchar_t*)m_pOutputText)[nUnicodePos] = (wchar_t)(u & 0xFFFF);
			nUnicodePos ++;
		}
		else if (0x00010000 <= u && u <= 0x000FFFFF){	/*�T���Q�[�g�y�A����*/
			u -= 0x10000;	
			((wchar_t*)m_pOutputText)[nUnicodePos + 0] = (wchar_t)(0xD800 | ((u >> 10) & 0x3FF));
			((wchar_t*)m_pOutputText)[nUnicodePos + 1] = (wchar_t)(0xDC00 | ((u >> 0 ) & 0x3FF));
			nUnicodePos += 2;
		}
	}
	
	/*NULL������}������*/
	((wchar_t*)m_pOutputText)[nUnicodePos] = L'\0';
	return true;
}

/*----------------------------------------------------------------
CTextConverter_UTF32LE::ToMulti
UTF16�ɕϊ����鏈��
----------------------------------------------------------------*/
bool CTextConverter_UTF32LE::ToMulti(const wchar_t *pChar,size_t nSize){
	/*�錾*/
	size_t i;
	size_t nAllocSize = 0;
	size_t nUnicodePos = 0;
	
	/*�X�e�b�v�P�F�T�C�Y�����߂�*/
	if (m_bIncludeBOM)nAllocSize = 4;
	for (i=0;i<nSize;i++){
		nAllocSize += 4;
		if (IsSurrogateLead(pChar[i]))i++;
	}

	/*�X�e�b�v�Q�F���������m��*/
	if (!Alloc(nAllocSize + sizeof(char)))
		return false;

	/*�X�e�b�v�R�F�ϊ�����*/
	if (m_bIncludeBOM){
		memcpy(m_pOutputText,"\xFF\xFE\x00\x00",4);
		nUnicodePos = 4;
	}
	for (i=0;i<nSize;i++){
		wchar_t w = pChar[i];
		if (IsSurrogateLead(w)){
			unsigned long ucs4 = (
				(((unsigned long)(pChar[i + 0] & 0x3FF)) << 10) |
				(((unsigned long)(pChar[i + 1] & 0x3FF)) <<  0)
			);
			ucs4 += 0x10000;
			*(unsigned long*)(&m_pOutputText[nUnicodePos]) = ucs4;
			i++;
		}
		else
			*(unsigned long*)(&m_pOutputText[nUnicodePos]) = (unsigned long)w;
		nUnicodePos += 4;
	}
	
	/*�X�e�b�v�S�FNULL��������������*/
	m_pOutputText[nUnicodePos] = '\0';
	return true;
}

/*----------------------------------------------------------------
CTextConverter_UTF32BE::ToUnicode
UTF16����Unicode�ɕϊ�����
----------------------------------------------------------------*/
bool CTextConverter_UTF32BE::ToUnicode(const char* pChar,size_t nSize){
	/*�錾*/
	size_t i,nStartPos;
	size_t nAllocSize = 0;
	size_t nUnicodePos = 0;
	
	/*BOM���������疳������*/
	if (memcmp(pChar,"\x00\x00\xFE\xFF",4) == 0){
		m_bIncludeBOM = true;
		nStartPos=4;
	}
	else{
		m_bIncludeBOM = false;
		nStartPos=0;
	}

	/*�K�v�ȃ������̈���v�Z*/
	for (i=nStartPos;i<nSize;i += 4){
		unsigned long u = *((unsigned long*)(&pChar[i]));
		u = ChangeByteOrder(u);
		if		(0x00000000 <= u && u <= 0x0000FFFF){	/*�T���Q�[�g�y�A����*/
			nAllocSize += sizeof(wchar_t);
		}
		else if (0x00010000 <= u && u <= 0x000FFFFF){	/*�T���Q�[�g�y�A����*/
			nAllocSize += sizeof(wchar_t) * 2;
		}
	}
	if (!Alloc(nAllocSize + sizeof(wchar_t)))
		return false;
	
	/*�ϊ�����*/
	for (i=nStartPos;i<nSize;i += 4){
		unsigned long u = *((unsigned long*)(&pChar[i]));
		u = ChangeByteOrder(u);
		if		(0x00000000 <= u && u <= 0x0000FFFF){	/*�T���Q�[�g�y�A����*/
			((wchar_t*)m_pOutputText)[nUnicodePos] = (wchar_t)(u & 0xFFFF);
			nUnicodePos ++;
		}
		else if (0x00010000 <= u && u <= 0x000FFFFF){	/*�T���Q�[�g�y�A����*/
			u -= 0x10000;	
			((wchar_t*)m_pOutputText)[nUnicodePos + 0] = (wchar_t)(0xD800 | ((u >> 10) & 0x3FF));
			((wchar_t*)m_pOutputText)[nUnicodePos + 1] = (wchar_t)(0xDC00 | ((u >> 0 ) & 0x3FF));
			nUnicodePos += 2;
		}
	}
	
	/*NULL������}������*/
	((wchar_t*)m_pOutputText)[nUnicodePos] = L'\0';
	return true;
}

/*----------------------------------------------------------------
CTextConverter_UTF32BE::ToMulti
UTF16�ɕϊ����鏈��
----------------------------------------------------------------*/
bool CTextConverter_UTF32BE::ToMulti(const wchar_t *pChar,size_t nSize){
	/*�錾*/
	size_t i;
	size_t nAllocSize = 0;
	size_t nUnicodePos = 0;
	
	/*�X�e�b�v�P�F�T�C�Y�����߂�*/
	if (m_bIncludeBOM)nAllocSize = 4;
	for (i=0;i<nSize;i++){
		nAllocSize += 4;
		if (IsSurrogateLead(pChar[i]))i++;
	}

	/*�X�e�b�v�Q�F���������m��*/
	if (!Alloc(nAllocSize + sizeof(char)))
		return false;

	/*�X�e�b�v�R�F�ϊ�����*/
	if (m_bIncludeBOM){
		memcpy(m_pOutputText,"\x00\x00\xFE\xFF",4);
		nUnicodePos = 4;
	}
	for (i=0;i<nSize;i++){
		wchar_t w = pChar[i];
		if (IsSurrogateLead(w)){
			unsigned long ucs4 = (
				(((unsigned long)(pChar[i + 0] & 0x3FF)) << 10) |
				(((unsigned long)(pChar[i + 1] & 0x3FF)) <<  0)
			);
			ucs4 += 0x10000;
			*(unsigned long*)(&m_pOutputText[nUnicodePos]) = ChangeByteOrder(ucs4);
			i++;
		}
		else
			*(unsigned long*)(&m_pOutputText[nUnicodePos]) = ChangeByteOrder((unsigned long)w);
		nUnicodePos += 4;
	}
	
	/*�X�e�b�v�S�FNULL��������������*/
	m_pOutputText[nUnicodePos] = '\0';
	return true;
}

/*[EOF]*/
