/*===================================================================
CTextConverter_ShiftJIS2004�N���X
�e�L�X�g�̕ϊ��������\�ȃN���X�ł��B
===================================================================*/

#include "TextConverter_Japanese.h"
#include "UnicodeTable.h"

/*----------------------------------------------------------------
CTextConverter_ShiftJIS2004::ToUnicode
Unicode�ɕϊ����鏈��
----------------------------------------------------------------*/
bool CTextConverter_ShiftJIS2004::ToUnicode(const char* pChar,size_t nSize){
	size_t i;
	unsigned char c1,c2;
	int nAllocSize = 0;
	int nUnicodePos = 0;
	CUnicodeTable_JIS2004_1PLANE TableP1;
	CUnicodeTable_JIS2004_2PLANE TableP2;
	
	/*�X�e�b�v�P�F�T�C�Y�����߂�*/
	for (i=0;i<nSize;i++){
		c1 = (unsigned char)pChar[i];
		/*1�o�C�g������*/
		if		(IsAscii(c1) || IsKana(c1)){
			nAllocSize += sizeof(wchar_t);
		}
		/*2�o�C�g������*/
		else if (i + 1 < nSize && (IsPlane1Lead(c1) || IsPlane2Lead(c1))){
			c2 = (unsigned char)pChar[i+1];
			if (IsTail(c2)){
				i++;		/*�T���Q�[�g�y�A���l�����Ĉꉞ4�o�C�g�m��*/
				nAllocSize += sizeof(wchar_t)*2;
			}
		}
	}
	
	/*�X�e�b�v�Q�F���������m��*/
	if (!Alloc(nAllocSize + sizeof(wchar_t)))
		return false;
	
	/*�X�e�b�v�R�F�ϊ�����*/
	for (i=0;i<nSize;i++){
		c1 = (unsigned char)pChar[i];
		/*JIS X 0201 ���e������*/
		if		(IsAscii(c1)){
			((wchar_t*)m_pOutputText)[nUnicodePos] = (wchar_t)c1;
			nUnicodePos++;
		}
		/*JIS X 0201 ���p�J�^�J�i*/
		else if (IsKana(c1)){
			((wchar_t*)m_pOutputText)[nUnicodePos] = (wchar_t)(0xFF61 + c1 - 0xA1);
			nUnicodePos++;
		}
		/*JIS X 0213:2004*/
		else if (i + 1 < nSize && (IsPlane1Lead(c1) || IsPlane2Lead(c1))){
			c2 = (unsigned char)pChar[i+1];
			if (IsTail(c2)){
				unsigned short nJisCode = ToJisCode(c1,c2);
				unsigned long ucs4 = IsPlane2Lead(c1) ? TableP2.ToUnicode(nJisCode) : TableP1.ToUnicode(nJisCode);
				if (ucs4 != 0){
					ToSurrogate(ucs4,nUnicodePos);
					i++;
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
CTextConverter_ShiftJIS2004::ToJisCode
ShiftJIS�R�[�h����JIS�R�[�h�֕ϊ����鏈��
----------------------------------------------------------------*/
inline unsigned short CTextConverter_ShiftJIS2004::ToJisCode(unsigned char c1,unsigned char c2){
	unsigned char jk, jt;
	const bool kuIsEven = 0x9F <= c2;

	if		(0x81 <= c1 && c1 <= 0x9F)		/*���*/
		jk = c1 * 2 - 0x101 + (kuIsEven ? 1 : 0);
	else if	(0xE0 <= c1 && c1 <= 0xEF)		/*���*/
		jk = c1 * 2 - 0x181 + (kuIsEven ? 1 : 0);
	else if((c1 == 0xF4 && kuIsEven) || (c1 >= 0xF5 && c1 <= 0xFC))
		jk = c1 * 2 - 0x19B + (kuIsEven ? 1 : 0);
	else if((0xF0 <= c1 && c1 <= 0xF3) || (c1 == 0xF4 && !kuIsEven)) {
		switch(c1) {
		case 0xF0:	jk = kuIsEven ? 8 : 1; break;
		case 0xF1:	jk = kuIsEven ? 4 : 3; break;
		case 0xF2:	jk = kuIsEven ? 12 : 5; break;
		case 0xF3:	jk = kuIsEven ? 14 : 13; break;
		case 0xF4:	jk = 15; break;
		}
	}
	if(jk % 2 == 0)
		jt = c2 - 0x9E;						/*trailbyte = jt + 0x9E*/
	else if(c2 <= 0x3F + 63)				/*�_: 01-63*/
		jt = c2 - 0x3F;						/*trailbyte = jt + 0x3F*/
	else									/*�_: 64-94*/
		jt = c2 - 0x40;						/*trailbyte = jt + 0x40*/
	return ((jk << 8) | jt) + 0x2020;
}



/*----------------------------------------------------------------
CTextConverter_ShiftJIS2004::ToMulti
CP932�ɕϊ����鏈��
----------------------------------------------------------------*/
bool CTextConverter_ShiftJIS2004::ToMulti(const wchar_t *pChar,size_t nSize){
	size_t i;
	wchar_t w;
	int nAllocSize = 0;
	int nSjisPos = 0;
	CUnicodeTable_JIS2004_1PLANE TableP1;
	CUnicodeTable_JIS2004_2PLANE TableP2;

	/*�X�e�b�v�P�F�T�C�Y�����߂�*/
	for (i=0;i<nSize;i++){
		w = pChar[i];
		/*1�o�C�g������*/
		if		((0x0000 <= w && w <= 0x007F) ||
				 (0xFF61 <= w && w <= 0xFF9F)){
			nAllocSize += sizeof(char);
		}
		/*2�o�C�g������*/
		else{
			nAllocSize += sizeof(char)*2;
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
			m_pOutputText[nSjisPos] = (char)w;
			nSjisPos++;
		}
		/*JIS X 0201 ���p�J�^�J�i*/
		else if (0xFF61 <= w && w <= 0xFF9F){
			m_pOutputText[nSjisPos] = (char)(w - 0xFF61 + 0xA1);
			nSjisPos++;
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
			unsigned short j = TableP1.ToCode(ucs4);
			if (j == 0)j = TableP2.ToCode(ucs4);
			if (j != 0){
				unsigned short s = ToSjis(j);
				m_pOutputText[nSjisPos + 0] = (unsigned char)((s >> 8) & 0xFF);
				m_pOutputText[nSjisPos + 1] = (unsigned char)((s >> 0) & 0xFF);
				nSjisPos += 2;
			}
		}
	}
	
	/*�X�e�b�v�S�FNULL��������������*/
	m_pOutputText[nSjisPos] = '\0';
	return true;
}

/*----------------------------------------------------------------
CTextConverter_ShiftJIS2004::ToSjis
JIS�R�[�h����ShiftJIS�ϊ����鏈��
----------------------------------------------------------------*/
inline unsigned short CTextConverter_ShiftJIS2004::ToSjis(unsigned short jis){
	unsigned char c1,c2;
	unsigned char jk = (jis - 0x2020) >> 8;		// ��
	unsigned char jt = (jis - 0x2020) & 0x00FF;	// �_

	if (jk >= 1 && jk <= 94 && jt >= 1 && jt <= 94){
		c1 = (jk - 1) / 2 + ((jk <= 62) ? 0x81 : 0xC1);
		if(jk % 2 == 0)	c2 = jt + 0x9E;
		else			c2 = jt + ((jt <= 63) ? 0x3F : 0x40);
		return (c1 << 8) | c2;
	}
	else return 0;
}

/*[EOF]*/
