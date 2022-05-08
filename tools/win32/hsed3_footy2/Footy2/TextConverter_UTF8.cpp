/**
 * @file TextConverter_UTF8.cpp
 * @brief �e�L�X�g�̕ϊ��������\�ȃN���X�ł��B
 * @version 1.0
 * @author Shinji Watanabe
 */

#include "TextConverter_Unicode.h"

/**
 * CTextConverter_UTF8::ToUnicode
 * @brief UTF8����Unicode�ɕϊ�����
 * @param pChar ����UTF-8������
 * @param nSize ����UTF-8������̒���(�o�C�g)
 */
bool CTextConverter_UTF8::ToUnicode(const char* pChar,size_t nSize)
{
	size_t i,nStartPos;
	unsigned char c;
	int nAllocSize = 0;
	int nUnicodePos = 0;

	// BOM���������疳������
	if (strncmp(pChar,"\xEF\xBB\xBF",3) == 0)
	{
		m_bIncludeBOM = true;
		nStartPos=3;
	}
	else
	{
		m_bIncludeBOM = false;
		nStartPos=0;
	}
	
	// �X�e�b�v�P�F�T�C�Y�����߂�
	for (i=nStartPos;i<nSize;i++)
	{
		c = (unsigned char)pChar[i];
		if		((c & 0x80) == 0)		// ���̕�����1�o�C�g
		{
			nAllocSize += sizeof(wchar_t);
		}
		else if (i + 1 < nSize &&
				 ((c & 0xDF) == c) &&
				 ((c & 0xC0) == 0xC0))	// ���̕�����2�o�C�g
		{
			nAllocSize += sizeof(wchar_t);
			i++;
		}
		else if (i + 2 < nSize &&
				 ((c & 0xEF) == c) &&
				 ((c & 0xE0) == 0xE0))	// ���̕�����3�o�C�g
		{
			nAllocSize += sizeof(wchar_t);
			i+=2;
		}
		else if (i + 3 < nSize && 
				 ((c & 0xF7) == c) &&
				 ((c & 0xF0) == 0xF0))	// ���̕�����4�o�C�g
		{
			nAllocSize += sizeof(wchar_t) * 2;
			i+=3;
		}
		else if (i + 4 < nSize && 
				 ((c & 0xFB) == c) &&
				 ((c & 0xF8) == 0xF8))	// ���̕�����5�o�C�g(Footy��Ή�)
		{
			i+=4;
		}
		else if (i + 5 < nSize && 
				 ((c & 0xFD) == c) &&
				 ((c & 0xFC) == 0xFC))	// ���̕�����5�o�C�g(Footy��Ή�)
		{
			i+=5;
		}
	}

	// �X�e�b�v�Q�F���������m��
	if (!Alloc(nAllocSize + sizeof(wchar_t)))
		return false;

	// �X�e�b�v�R�F�ϊ�
	for (i=nStartPos;i<nSize;i++){
		c = (unsigned char)pChar[i];
		if		((c & 0x80) == 0)		// ���̕�����1�o�C�g
		{
			((wchar_t*)m_pOutputText)[nUnicodePos] = (wchar_t)c;
			nUnicodePos++;
		}
		else if (i + 1 < nSize &&
				 ((c & 0xDF) == c) &&
				 ((c & 0xC0) == 0xC0))	// ���̕�����2�o�C�g
		{
			((wchar_t*)m_pOutputText)[nUnicodePos] = 
				(wchar_t)((c & 0x1F) << 6) | ((unsigned char)pChar[i+1] & 0x3F);
			nUnicodePos++;
			i++;
		}
		else if (i + 2 < nSize &&
				 ((c & 0xEF) == c) &&
				 ((c & 0xE0) == 0xE0))	// ���̕�����3�o�C�g
		{
			((wchar_t*)m_pOutputText)[nUnicodePos] = 
				(wchar_t)(
					((c & 0x0F) << 12) | 
					(((unsigned char)pChar[i+1] & 0x3F) << 6) | 
					((unsigned char)pChar[i+2] & 0x3F)
				);
			nUnicodePos++;
			i+=2;
		}
		else if (i + 3 < nSize && 
				 ((c & 0xF7) == c) &&
				 ((c & 0xF0) == 0xF0))	// ���̕�����4�o�C�g(�T���Q�[�g�y�A�𗘗p����)
		{
			unsigned long ucs4 = 
				(unsigned long)(
					((c & 7) << 16) |
					((((unsigned char)pChar[i+1]) & 0x3F) << 12 )| 
					((((unsigned char)pChar[i+2]) & 0x3F) << 6) | 
					((((unsigned char)pChar[i+3]) & 0x3F))
				);
			ucs4 -= 0x10000;	
			((wchar_t*)m_pOutputText)[nUnicodePos + 0] = (wchar_t)(0xD800 | ((ucs4 >> 10) & 0x3FF));
			((wchar_t*)m_pOutputText)[nUnicodePos + 1] = (wchar_t)(0xDC00 | ((ucs4 >> 0 ) & 0x3FF));
			nUnicodePos += 2;
			i+=3;
		}
		else if (i + 4 < nSize && 
				 ((c & 0xFB) == c) &&
				 ((c & 0xF8) == 0xF8))	// ���̕�����5�o�C�g(Footy��Ή�)
		{
			i+=4;
		}
		else if (i + 5 < nSize && 
				 ((c & 0xFD) == c) &&
				 ((c & 0xFC) == 0xFC))	// ���̕�����5�o�C�g(Footy��Ή�)
		{
			i+=5;
		}
	}

	// �X�e�b�v�S�FNULL��������������
	((wchar_t*)m_pOutputText)[nUnicodePos] = L'\0';
	return true;
}

/**
 * CTextConverter_UTF8::ToMulti
 * @brief UTF8�ɕϊ����鏈��
 * @param pChar �ϊ�������
 * @param nSize �ϊ����镶����(wchar_t�̐�)
 */
bool CTextConverter_UTF8::ToMulti(const wchar_t *pChar,size_t nSize)
{
	size_t i;
	wchar_t w;
	int nAllocSize = 0;
	int nUtf8Pos = 0;
	
	// �X�e�b�v�P�F�T�C�Y�����߂�
	if (m_bIncludeBOM)nAllocSize += sizeof(char)*3;
	for (i=0;i<nSize;i++)
	{
		w = pChar[i];
		if (0x0000 <= w && w <= 0x007F)
			nAllocSize += sizeof(char)*1;
		else if (0x0080 <= w && w <= 0x7FF)
			nAllocSize += sizeof(char)*2;
		else
			nAllocSize += sizeof(char)*3;
	}

	// �X�e�b�v�Q�F���������m��
	if (!Alloc(nAllocSize + sizeof(char)))
		return false;

	// �X�e�b�v�R�F�ϊ�
	if (m_bIncludeBOM)
	{
		memcpy(m_pOutputText, "\xEF\xBB\xBF", 3);
		nUtf8Pos = 3;
	}
	for (i=0;i<nSize;i++)
	{
		w = pChar[i];
		if (0x0000 <= w && w <= 0x007F)
		{
			m_pOutputText[nUtf8Pos] = (char)(w & 0x00FF);
			nUtf8Pos ++;
		}
		else if (0x0080 <= w && w <= 0x7FF)
		{
			m_pOutputText[nUtf8Pos + 0] = (char)(0xC0 | ((w & 0x07C0) >> 6));
			m_pOutputText[nUtf8Pos + 1] = (char)(0x80 | ((w & 0x003F) >> 0));
			nUtf8Pos += 2;
		}
		else
		{
			m_pOutputText[nUtf8Pos + 0] = (char)(0xE0 | ((w & 0xF000) >> 12));
			m_pOutputText[nUtf8Pos + 1] = (char)(0x80 | ((w & 0x0FC0) >> 6));
			m_pOutputText[nUtf8Pos + 2] = (char)(0x80 | ((w & 0x003F) >> 0));
			nUtf8Pos += 3;
		}
	}

	// �X�e�b�v�S�FNULL��������������
	m_pOutputText[nUtf8Pos] = '\0';
	return true;
}

/*[EOF]*/
