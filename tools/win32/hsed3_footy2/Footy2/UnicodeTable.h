/**
 * @file UnicodeTable.h
 * @brief UNICODE�ւ̕ϊ��e�[�u����񋟂���N���X�Q
 * @author Shinji Watanabe
 * @date Nov.09.2008
 */

#pragma once

//! Unicode�e�[�u��
template <class T>
class CUnicodeTable
{
public:
	virtual T ToUnicode(unsigned short s)
	{
		const tUnicodeMapping* pStruct = GetToUnicodeStruct();
		int nMinPos = 0;
		int nMaxPos = GetToUnicodeNum()-1;
		int nCenterPos;

		for (;;)
		{
			// �f�[�^����������
			nCenterPos = (nMaxPos + nMinPos) / 2 ;
			if (pStruct[nCenterPos].m_nCode == s)return pStruct[nCenterPos].m_nUnicode;
			if (pStruct[nCenterPos].m_nCode > s)	// �f�[�^���������Ƃ�
				nMaxPos = nCenterPos - 1;
			if (pStruct[nCenterPos].m_nCode < s)	// �f�[�^���傫���Ƃ�
				nMinPos = nCenterPos + 1;
			// ������Ȃ�����
			if (nMinPos > nMaxPos)return 0;
		}
	}
	
	virtual unsigned short ToCode(T s)
	{
		const tUnicodeMapping* pStruct = GetToCodeStruct();
		int nMinPos = 0;
		int nMaxPos = GetToCodeNum()-1;
		int nCenterPos;

		for (;;)
		{
			// �f�[�^����������
			nCenterPos = (nMaxPos + nMinPos) / 2 ;
			if (pStruct[nCenterPos].m_nUnicode == s)return pStruct[nCenterPos].m_nCode;
			if (pStruct[nCenterPos].m_nUnicode > s)	// �f�[�^���������Ƃ�
				nMaxPos = nCenterPos - 1;
			if (pStruct[nCenterPos].m_nUnicode < s)	// �f�[�^���傫���Ƃ�
				nMinPos = nCenterPos + 1;
			// ������Ȃ�����
			if (nMinPos > nMaxPos)return 0;
		}
	}

protected:
	typedef struct _tUnicodeMapping
	{
		unsigned short m_nCode;
		T m_nUnicode;
	} tUnicodeMapping;

	virtual int GetToUnicodeNum() = 0;
	virtual int GetToCodeNum(){return GetToUnicodeNum();}
	virtual const tUnicodeMapping *GetToUnicodeStruct() = 0;
	virtual const tUnicodeMapping *GetToCodeStruct() = 0;
};

//! JIS X 0213:2004�̑���
class CUnicodeTable_JIS2004_1PLANE : public CUnicodeTable<unsigned long>
{
protected:
	const static int JIS2004 = 8797-25;
	int GetToUnicodeNum(){return JIS2004;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tJIS2004_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tJIS2004_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tJIS2004_UnicodeSorted[JIS2004];
	const static tUnicodeMapping m_tJIS2004_CodeSorted[JIS2004];
};

//! JIS X 0213:2004�̑���
class CUnicodeTable_JIS2004_2PLANE : public CUnicodeTable<unsigned long>
{
protected:
	const static int JIS2004 = 2436;
	int GetToUnicodeNum(){return JIS2004;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tJIS2004_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tJIS2004_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tJIS2004_UnicodeSorted[JIS2004];
	const static tUnicodeMapping m_tJIS2004_CodeSorted[JIS2004];
};

//! ISO8859 �����[���b�p
class CUnicodeTable_ISO8859_2 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_2 = 96;
	int GetToUnicodeNum(){return ISO8859_2;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_2];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_2];
};

//! ISO8859 �새�[���b�p
class CUnicodeTable_ISO8859_3 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_3 = 89;
	int GetToUnicodeNum(){return ISO8859_3;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_3];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_3];
};

//! ISO8859 �k���[���b�p
class CUnicodeTable_ISO8859_4 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_4 = 96;
	int GetToUnicodeNum(){return ISO8859_4;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_4];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_4];
};

//! ISO8859 �L����
class CUnicodeTable_ISO8859_5 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_5 = 96;
	int GetToUnicodeNum(){return ISO8859_5;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_5];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_5];
};

//! ISO8859 �A���r�A
class CUnicodeTable_ISO8859_6 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_6 = 51;
	int GetToUnicodeNum(){return ISO8859_6;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_6];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_6];
};

//! ISO8859 �M���V��
class CUnicodeTable_ISO8859_7 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_7 = 93;
	int GetToUnicodeNum(){return ISO8859_7;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_7];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_7];
};

//! ISO8859 �w�u���C
class CUnicodeTable_ISO8859_8 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_8 = 60;
	int GetToUnicodeNum(){return ISO8859_8;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_8];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_8];
};

//! ISO8859 �g���R
class CUnicodeTable_ISO8859_9 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_9 = 96;
	int GetToUnicodeNum(){return ISO8859_9;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_9];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_9];
};

//! ISO8859 �k��
class CUnicodeTable_ISO8859_10 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_10 = 96;
	int GetToUnicodeNum(){return ISO8859_10;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_10];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_10];
};

//! ISO8859 �o���g����
class CUnicodeTable_ISO8859_13 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_13 = 96;
	int GetToUnicodeNum(){return ISO8859_13;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_13];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_13];
};

//! ISO8859 �P���g��
class CUnicodeTable_ISO8859_14 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_14 = 96;
	int GetToUnicodeNum(){return ISO8859_14;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_14];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_14];
};


//! ISO8859 Latin1�̕ό`
class CUnicodeTable_ISO8859_15 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_15 = 96;
	int GetToUnicodeNum(){return ISO8859_15;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_15];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_15];
};

//! ISO8859 ���새�[���b�p
class CUnicodeTable_ISO8859_16 : public CUnicodeTable<unsigned short>
{
protected:
	const static int ISO8859_16 = 96;
	int GetToUnicodeNum(){return ISO8859_16;}
	const tUnicodeMapping *GetToUnicodeStruct(){return m_tIso8859_CodeSorted;}
	const tUnicodeMapping *GetToCodeStruct(){return m_tIso8859_UnicodeSorted;}
private:
	const static tUnicodeMapping m_tIso8859_CodeSorted[ISO8859_16];
	const static tUnicodeMapping m_tIso8859_UnicodeSorted[ISO8859_16];
};


/*[EOF]*/
