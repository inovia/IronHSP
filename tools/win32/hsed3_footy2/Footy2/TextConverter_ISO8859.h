/*================================================================
ISO8859�Ɋ֘A���镶���R�[�h�ϊ��N���X
================================================================*/

#pragma once

#include "TextConverter.h"
#include "UnicodeTable.h"

//! �ϊ��e�[�u���������̂̕ϊ��N���X�BT�ɕϊ��e�[�u���N���X���w��
template<unsigned char C,wchar_t W>
class CTextConverter_ISO8859_Slide : public CTextConverter{
public:
	//! Unicode�֕ϊ����鏈��
	bool ToUnicode(const char* pRawText,size_t nSize){
		unsigned char c;
		/*���������m�ۂ���*/
		if (!Alloc((nSize+1)*sizeof(wchar_t)))
			return false;
		/*�ϊ�����*/
		size_t i;
		for (i=0;i<nSize;i++){
			c = pRawText[i];
			if (0x00 <= c && c < C)			/*ASCII����*/
				((wchar_t*)m_pOutputText)[i] = (wchar_t)c;
			else							/*����ȊO�͕ϊ��e�[�u���ɏ]��*/
				((wchar_t*)m_pOutputText)[i] = (wchar_t)c + W - 0xA0;
		}
		/*NULL�̏�������*/
		((wchar_t*)m_pOutputText)[i] = L'\0';
		return true;
	}
	
	//! �o�C�g�R�[�h�֕ϊ����鏈��
	bool ToMulti(const wchar_t* pMulti,size_t nSize){
		wchar_t w;
		/*���������m�ۂ���*/
		if (!Alloc((nSize+1)*sizeof(char)))
			return false;
		/*�ϊ�����*/
		size_t i;
		for (i=0;i<nSize;i++){
			w = pMulti[i];
			if (0x00 <= w && w < C)			/*ASCII����*/
				m_pOutputText[i] = (char)(w & 0xFF);
			else							/*����ȊO�͕ϊ��e�[�u���ɏ]��*/
				m_pOutputText[i] = (char)((w - W + 0xA0) & 0xFF);
		}
		/*NULL�̏�������*/
		m_pOutputText[i] = '\0';
		return true;
	}
};

//! �ϊ��e�[�u���������̂̕ϊ��N���X�BT�ɕϊ��e�[�u���N���X���w��
template<class T>
class CTextConverter_ISO8859_Table : public CTextConverter{
public:
	//! Unicode�֕ϊ����鏈��
	bool ToUnicode(const char* pRawText,size_t nSize){
		int nUnicodePos = 0;
		unsigned char c;
		wchar_t w;
		/*���������m�ۂ���*/
		if (!Alloc((nSize+1)*sizeof(wchar_t)))
			return false;
		/*�ϊ�����*/
		for (size_t i=0;i<nSize;i++){
			c = pRawText[i];
			if (0x00 <= c && c <= 0x9F){	/*ASCII����*/
				((wchar_t*)m_pOutputText)[nUnicodePos] = (wchar_t)c;
				nUnicodePos++;
			}
			else{							/*����ȊO�͕ϊ��e�[�u���ɏ]��*/
				w = (wchar_t)m_cTable.ToUnicode((unsigned short)c);
				if (w != 0){
					((wchar_t*)m_pOutputText)[nUnicodePos] = w;
					nUnicodePos++;
				}
			}
		}
		/*NULL�̏�������*/
		((wchar_t*)m_pOutputText)[nUnicodePos] = L'\0';
		return true;
	}
	
	//! �o�C�g�R�[�h�֕ϊ����鏈��
	bool ToMulti(const wchar_t* pMulti,size_t nSize){
		int nAnsiPos = 0;
		unsigned char c;
		wchar_t w;
		/*���������m�ۂ���*/
		if (!Alloc((nSize+1)*sizeof(char)))
			return false;
		/*�ϊ�����*/
		for (size_t i=0;i<nSize;i++){
			w = pMulti[i];
			if (0x00 <= w && w <= 0x9F){	/*ASCII����*/
				m_pOutputText[nAnsiPos] = (char)(w & 0xFF);
				nAnsiPos++;
			}
			else{							/*����ȊO�͕ϊ��e�[�u���ɏ]��*/
				c = (char)(m_cTable.ToCode((unsigned short)w) & 0xFF);
				if (c != 0){
					m_pOutputText[nAnsiPos] = c;
					nAnsiPos++;
				}
			}
		}
		/*NULL�̏�������*/
		m_pOutputText[nAnsiPos] = '\0';
		return true;
	}
private:
	T m_cTable;
};

/*[EOF]*/
