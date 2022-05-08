/**
 * @file TextConverter_UTF16.cpp
 * @brief UTF16�ւ̕ϊ��N���X
 * @version 1.0
 * @author ShinjiWatanabe
 */

#include "TextConverter_Unicode.h"

/**
 * CTextConverter_UTF16LE::ToUnicode
 * @brief UTF16����Unicode�ɕϊ�����
 * @param pChar �ϊ���������
 * @param nSize �����T�C�Y(�o�C�g)
 * @return �ϊ��o������true
 */
bool CTextConverter_UTF16LE::ToUnicode(const char* pChar,size_t nSize){
	// �錾
	size_t i,nStartPos;
	
	// BOM���������疳������
	if (strncmp(pChar,"\xFF\xFE",2) == 0){
		m_bIncludeBOM = true;
		nStartPos=2;
	}
	else{
		m_bIncludeBOM = false;
		nStartPos=0;
	}

	// ���������m��
	if ((nSize - nStartPos) % 2 != 0)return false;
	if (!Alloc(nSize - nStartPos + sizeof(wchar_t)))
		return false;

	// ���������R�s�[����
	for (i=0;i<nSize - nStartPos;i++){
		m_pOutputText[i] = pChar[i + nStartPos];
	}

	// �Ō��NULL������
	m_pOutputText[nSize - nStartPos + 0] = 0;
	m_pOutputText[nSize - nStartPos + 1] = 0;
	return true;
}

/**
 * CTextConverter_UTF16LE::ToMulti
 * @brief UTF16�ɕϊ����鏈��
 * @param pChar �ϊ���������
 * @param nSize �����T�C�Y(�o�C�g)
 * @return �ϊ��o������true
 */
bool CTextConverter_UTF16LE::ToMulti(const wchar_t *pChar,size_t nSize){
	// �錾
	size_t i,nStartPos;

	// ���������m��
	if (m_bIncludeBOM)nStartPos = 2;
	else nStartPos = 0;
	if (!Alloc(nSize * sizeof(wchar_t) + nStartPos + sizeof(char)))
		return false;
	
	// BOM���������珑������
	if (m_bIncludeBOM)
	{
		memcpy(m_pOutputText, "\xFF\xFE", 2);
	}

	// ���������R�s�[����
	for (i=0;i<nSize;i++){
		((wchar_t*)(&m_pOutputText[nStartPos]))[i] = pChar[i];
	}

	// �Ō��NULL������
	m_pOutputText[nSize * sizeof(wchar_t) + nStartPos] = 0;
	return true;
}

/**
 * CTextConverter_UTF16BE::ToUnicode
 * @brief UTF16����Unicode�ɕϊ�����
 * @param pChar �ϊ���������
 * @param nSize �ϊ��T�C�Y
 * @return ���������Ƃ�true
 */
bool CTextConverter_UTF16BE::ToUnicode(const char* pChar,size_t nSize){
	// �錾
	size_t i,nStartPos;

	// BOM���������疳������
	if (strncmp(pChar,"\xFE\xFF",2) == 0){
		m_bIncludeBOM  = true;
		nStartPos=2;
	}
	else{
		m_bIncludeBOM = false;
		nStartPos=0;
	}

	// ���������m��
	if ((nSize - nStartPos) % 2 != 0)return false;
	if (!Alloc(nSize - nStartPos + sizeof(wchar_t)))
		return false;

	// ���������R�s�[����
	for (i=0;i<nSize - nStartPos;i++){
		if (i % 2 == 0)
			m_pOutputText[i] = pChar[i + nStartPos + 1];
		else
			m_pOutputText[i] = pChar[i + nStartPos - 1];
	}

	// �Ō��NULL������
	m_pOutputText[nSize - nStartPos + 0] = 0;
	m_pOutputText[nSize - nStartPos + 1] = 0;
	return true;
}

/**
 * CTextConverter_UTF16BE::ToMulti
 * @brief UTF16�ɕϊ����鏈��
 * @param pChar �ϊ���������
 * @param nSize �ϊ��T�C�Y
 */
bool CTextConverter_UTF16BE::ToMulti(const wchar_t *pChar,size_t nSize){
	// �錾
	size_t i,nStartPos;
	
	// ���������m��
	if (m_bIncludeBOM)nStartPos = 2;
	else nStartPos = 0;
	if (!Alloc(nSize * sizeof(wchar_t) + nStartPos + sizeof(char)))
		return false;
	
	// BOM���������珑������
	if (m_bIncludeBOM)
	{
		memcpy(m_pOutputText, "\xFE\xFF", 2);
	}

	// ���������R�s�[����
	for (i=0;i<nSize;i++){
		((wchar_t*)(&m_pOutputText[nStartPos]))[i] =
			((pChar[i] & 0xFF00) >> 8) | ((pChar[i] & 0x00FF) << 8);
	}

	// �Ō��NULL������
	m_pOutputText[nSize * sizeof(wchar_t) + nStartPos] = 0;
	return true;
}

/*[EOF]*/
