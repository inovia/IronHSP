/*===================================================================
CTextConverter_eucJP_ms�N���X
�e�L�X�g�̕ϊ��������\�ȃN���X�ł��B
===================================================================*/

#include "TextConverter_Japanese.h"
#include "UnicodeTable.h"

/*----------------------------------------------------------------
CTextConverter_EucJis2004::ToUnicode
Unicode�ɕϊ����鏈��
----------------------------------------------------------------*/
bool CTextConverter_EucJis2004::ToUnicode(const char* pChar,size_t nSize){
	size_t i;
	unsigned char c1,c2,c3;
	int nAllocSize = 0;
	int nUnicodePos = 0;
	CUnicodeTable_JIS2004_1PLANE TableP1;
	CUnicodeTable_JIS2004_2PLANE TableP2;
	
	/*�X�e�b�v�P�F�T�C�Y�����߂�*/
	for (i=0;i<nSize;i++){
		c1 = (unsigned char)pChar[i];
		/*1�o�C�g������*/
		if		(IsAscii(c1)){
			nAllocSize += sizeof(wchar_t);
		}
		/*2�o�C�g����(���p�J�i)*/
		else if (i + 1 < nSize && IsKana_Lead(c1)){
			c2 = (unsigned char)pChar[i+1];
			if (IsKana_Tail(c2)){
				i++;
				nAllocSize += sizeof(wchar_t);
			}
		}
		/*2�o�C�g����*/
		else if ((i + 1 < nSize) && IsTwoBytes(c1)){
			c2 = (unsigned char)pChar[i+1];
			if (IsTwoBytes(c2)){
				i++;
				nAllocSize += sizeof(wchar_t) * 2;
			}
		}
		/*3�o�C�g������*/
		else if (i + 2 < nSize && IsThreeBytes_Lead(c1)){
			c2 = (unsigned char)pChar[i+1];
			c3 = (unsigned char)pChar[i+2];
			if (IsTwoBytes(c2) && IsTwoBytes(c3)){ 
			   i += 2;
			   nAllocSize += sizeof(wchar_t)*2;
			}
		}
	}
	
	/*�X�e�b�v�Q�F���������m��*/
	if (!Alloc(nAllocSize + sizeof(wchar_t)))
		return false;
	
	/*�X�e�b�v�R�F�ϊ�*/
	for (i=0;i<nSize;i++){
		c1 = (unsigned char)pChar[i];
		/*JIS X 0201 ���e������*/
		if		(IsAscii(c1)){
			((wchar_t*)m_pOutputText)[nUnicodePos] = (wchar_t)c1;
			nUnicodePos++;
		}
		/*2�o�C�g����(���p�J�i)*/
		else if (i + 1 < nSize && IsKana_Lead(c1)){
			c2 = (unsigned char)pChar[i+1];
			if (IsKana_Tail(c2)){
				((wchar_t*)m_pOutputText)[nUnicodePos] = (wchar_t)(0xFF61 + c1 - 0xA1);
				nUnicodePos++;
				i++;
			}
		}
		/*2�o�C�g����(JIS X 2028�܂���NEC���ꕶ��)*/
		else if ((i + 1 < nSize) && IsTwoBytes(c1)){
			c2 = (unsigned char)pChar[i+1];
			if (IsTwoBytes(c2)){
				unsigned short s = (c1 << 8) | c2;
				s -= 0x8080;
				unsigned ucs4 = TableP1.ToUnicode(s);
				if (ucs4 != 0){
					ToSurrogate(ucs4,nUnicodePos);
					i++;
				}
			}
		}
		/*3�o�C�g������*/
		else if (i + 2 < nSize && IsThreeBytes_Lead(c1)){
			c2 = (unsigned char)pChar[i+1];
			c3 = (unsigned char)pChar[i+2];
			if (IsTwoBytes(c2) && IsTwoBytes(c3)){
				unsigned short s = (c2 << 8) | c3;
				s -= 0x8080;
				unsigned ucs4 = TableP1.ToUnicode(s);
				if (ucs4 != 0){
					ToSurrogate(ucs4,nUnicodePos);
					i += 2;
				}
			}
		}
	}
	
	/*�X�e�b�v�S�FNULL��������������*/
	((wchar_t*)m_pOutputText)[nUnicodePos] = L'\0';

	/*�e�L�X�g�̃T�C�Y��K���ɋ��߂��̂ŁA�Ō�ɒ��K���킹*/
	m_nTextSize = nUnicodePos + sizeof(wchar_t);
	return true;
}
/*----------------------------------------------------------------
CTextConverter_EucJis2004::ToMulti
eucJP-ms�ɕϊ����鏈��
----------------------------------------------------------------*/
bool CTextConverter_EucJis2004::ToMulti(const wchar_t *pChar,size_t nSize){
	size_t i;
	wchar_t w;
	int nAllocSize = 0;
	int nEucPos = 0;

	CUnicodeTable_JIS2004_1PLANE TableP1;
	CUnicodeTable_JIS2004_2PLANE TableP2;

	/*�X�e�b�v�P�F�T�C�Y�����߂�*/
	for (i=0;i<nSize;i++){
		w = pChar[i];
		/*ASCII����*/
		if		(0x0000 <= w && w <= 0x007F){
			nAllocSize += sizeof(char);
		}
		/*���p�J�i*/
		else if (0xFF61 <= w && w <= 0xFF9F){
			nAllocSize += sizeof(char)*2;
		}
		/*����ȊO�͂Ƃ肠����3�o�C�g�m�ۂ��Ă���*/
		else {
			nAllocSize += sizeof(char)*3;
			if (IsSurrogateLead(w))i++;
		}
	}
	
	/*�X�e�b�v�Q�F���������m��*/
	if (!Alloc(nAllocSize + sizeof(char)))
		return false;
	
	/*�X�e�b�v�R�F�ϊ�����*/
	for (i=0;i<nSize;i++){
		w = pChar[i];
		/*JIS X 0201 ���e������*/
		if		(0x0000 <= w && w <= 0x007F){
			m_pOutputText[nEucPos] = (char)w;
			nEucPos++;
		}
		/*JIS X 0201 ���p�J�^�J�i*/
		else if (0xFF61 <= w && w <= 0xFF9F){
			m_pOutputText[nEucPos + 0] = (char)0x8E;
			m_pOutputText[nEucPos + 1] = (char)(w - 0xFF61 + 0xA1);
			nEucPos += 2;
		}
		/*�������ĒT��*/
		else{
			/*�P���������擾����*/
			unsigned long ucs4;
			if (IsSurrogateLead(w) && i + 1 < nSize){
				ucs4 = ToUCS4(&pChar[i]);
				i++;
			}
			else ucs4 = (unsigned long)w;
			/*��������*/
			unsigned short euc;
			if ((euc = TableP1.ToCode(ucs4)) != 0){			/*JIS X 0213:2004���*/
				euc += 0x8080;
				m_pOutputText[nEucPos + 0] = (char)(euc >> 8);
				m_pOutputText[nEucPos + 1] = (char)(euc & 0xFF);
				nEucPos += 2;
			}
			else if ((euc = TableP2.ToCode(ucs4)) != 0){	/*JIS X 0213:2004���*/
				euc += 0x8080;
				m_pOutputText[nEucPos + 0] = (char)0x8F;
				m_pOutputText[nEucPos + 1] = (char)(euc >> 8);
				m_pOutputText[nEucPos + 2] = (char)(euc & 0xFF);
				nEucPos += 3;
			}
		}
	}
	
	/*�X�e�b�v�S�FNULL��������������*/
	m_pOutputText[nEucPos] = '\0';
	
	/*�e�L�X�g�̃T�C�Y��K���ɋ��߂��̂ŁA�Ō�ɒ��K���킹*/
	m_nTextSize = nEucPos + sizeof(char);
	return true;
}


/*[EOF]*/
