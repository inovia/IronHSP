/**
 * @file DllTextFunc.cpp
 * @brief ���h���Ɋւ���DLL�֐����L�q���܂��B
 * @author nabeshin
 * @date 08/24/2007
 * @version 0.9
 *
 * @note DllMain.cpp���番��
 */

#include "ConvFactory.h"

#ifndef UNDER_CE
//-----------------------------------------------------------------------------
/**
 * @brief �S�̂̃e�L�X�g���Z�b�g���܂��B
 * @param nID Footy��ID
 * @param pString ������
 * @return �G���[
 */
FOOTYEXPORT(int) Footy2SetTextA(int nID,const char *pString)
{
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	// Unicode�ϊ�
	CConvFactory cConv;
	if (!cConv.GetConv()->ToUnicode(pString,(UINT)strlen(pString)))return FOOTY2ERR_MEMORY;
	// �������}��
	pFooty->SetText((wchar_t*)cConv.GetConv()->GetConvData());
	pFooty->SetCharSet(CSM_DEFAULT);
	return FOOTY2ERR_NONE;
}
#endif	/*UNDER_CE*/

//-----------------------------------------------------------------------------
/**
 * @brief �S�̂̃e�L�X�g���Z�b�g���܂��B
 * @param nID Footy��ID
 * @param pString ������
 * @return �G���[
 */
FOOTYEXPORT(int) Footy2SetTextW(int nID,const wchar_t *pString)
{
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	// �������}��
	pFooty->SetText(pString);
	pFooty->SetCharSet(CSM_DEFAULT);
	return FOOTY2ERR_NONE;
}


#ifndef UNDER_CE
//-----------------------------------------------------------------------------
/**
 * Footy2SetSelTextA
 * @brief �I�𕶎�����Z�b�g���܂��B
 * @param nID Footy��ID
 * @param pString ������
 * @return �G���[
 */
FOOTYEXPORT(int) Footy2SetSelTextA(int nID,const char *pString)
{
	if (!pString)return FOOTY2ERR_ARGUMENT;	// ������P�͕K�{
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	// �ϊ����ăZ�b�g
	CConvFactory cConv;
	if (!cConv.GetConv()->ToUnicode(pString,(UINT)strlen(pString)))return FOOTY2ERR_MEMORY;
	return pFooty->SetSelText((wchar_t*)cConv.GetConv()->GetConvData(), true) ?
		FOOTY2ERR_NONE : FOOTY2ERR_ARGUMENT;
}
#endif

//-----------------------------------------------------------------------------
/**
 * @brief �I�𕶎�����Z�b�g���܂��B
 * @param nID Footy��ID
 * @param pString ������
 * @return �G���[
 */
FOOTYEXPORT(int) Footy2SetSelTextW(int nID,const wchar_t *pString){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�����\���������o�^����*/
	return pFooty->SetSelText(pString, true) ? FOOTY2ERR_NONE : FOOTY2ERR_ARGUMENT;
}

#ifndef UNDER_CE
//-----------------------------------------------------------------------------
/**
 * Footy2GetSelLengthA
 * @param nID Footy��ID�ԍ����w�肵�܂��B
 * @param nLineMode ���s�R�[�h�����Ƃ��Ď擾����̂��w�肵�܂��B
 * @brief �I�𒆂̃e�L�X�g�̕�������Ԃ��܂��B
 */
FOOTYEXPORT(int) Footy2GetSelLengthA(int nID, int nLineMode)
{
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	
	// �I�𕶎�����擾����
	std::wstring strSelText;
	if (!pFooty->m_cDoc.GetSelText(&strSelText))
		return FOOTY2ERR_MEMORY;

	// ANSI������ɕϊ�����
	CConvFactory cConv;
	cConv.GetConv()->ToMulti(strSelText.c_str(), (UINT)strSelText.size());

	// �l��Ԃ�
	return (int)cConv.GetConv()->GetConvTextSize() - sizeof(char);
}
#endif	/*UNDER_CE*/


//-----------------------------------------------------------------------------
/**
 * Footy2GetSelLengthW
 * @param nID Footy��ID
 * @param nLineMode ���s�R�[�h���ǂ̂悤�Ɉ�����
 */
FOOTYEXPORT(int) Footy2GetSelLengthW(int nID, int nLineMode)
{
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	// �����\���������o�^����
	size_t nLength = pFooty->m_cDoc.GetSelLength(static_cast<LineMode>(nLineMode));
	if (nLength == 0)
		return FOOTY2ERR_NOTSELECTED;
	else
		return static_cast<int>(nLength);
}

#ifndef UNDER_CE
//-----------------------------------------------------------------------------
/**
 * Footy2GetTextLengthA
 * @brief �e�L�X�g�̕��������擾���܂��B
 */
FOOTYEXPORT(int) Footy2GetTextLengthA(int nID, int nLineMode)
{
	int nLineLen;
	size_t nRet = 0;
	LinePt iterLine,iterLastLine;
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*���s�R�[�h�̕��������w�肷��*/
	if (nLineMode == LM_AUTOMATIC)
		nLineMode = pFooty->m_cDoc.GetLineMode();
	nLineLen = nLineMode == LM_CRLF ? 2 : 1;
	/*���[�v�����Čv�Z����*/
	for (iterLine = pFooty->m_cDoc.GetTopLine(),
		 iterLastLine = pFooty->m_cDoc.GetLastLine();;iterLine++)
	{
		 CConvFactory cConv;
		 cConv.GetConv()->ToMulti(iterLine->GetLineData(), (UINT)iterLine->GetLineLength());
		 nRet += cConv.GetConv()->GetConvTextSize() - sizeof(char);
		 if (iterLine == iterLastLine)break;
		 nRet += nLineLen;
	}
	/*�l��Ԃ�*/
	return (int)nRet;
}
#endif	/*UNDER_CE*/

//-----------------------------------------------------------------------------
/**
 * @brief �e�L�X�g�̕��������擾���܂��B
 */
FOOTYEXPORT(int) Footy2GetTextLengthW(int nID,int nLineMode)
{
	int nLineLen;
	size_t nRet = 0;
	LinePt iterLine,iterLastLine;
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	// ���s�R�[�h�̕��������w�肷��
	if (nLineMode == LM_AUTOMATIC)
	{
		nLineMode = pFooty->m_cDoc.GetLineMode();
	}
	nLineLen = nLineMode == LM_CRLF ? 2 : 1;
	// ���[�v�����Čv�Z����
	for (iterLine = pFooty->m_cDoc.GetTopLine(),
		 iterLastLine = pFooty->m_cDoc.GetLastLine();
		 ;iterLine++)
	{
		nRet += iterLine->GetLineLength();
		if (iterLine == iterLastLine)break;
		nRet += nLineLen;
	}
	// �l��Ԃ�
	return (int)nRet;
}

#ifndef UNDER_CE

//-----------------------------------------------------------------------------
/**
 * @brief ��������擾���܂��B
 * @param nID Footy��ID�ԍ�
 * @param pString �i�[��
 * @param nLineMode ���s�R�[�h
 * @param nSize pString�̃o�b�t�@�T�C�Y
 */
FOOTYEXPORT(int) Footy2GetTextA(int nID,char *pString,int nLineMode,int nSize)
{
	LinePt iterLine;
	LinePt iterLastLine;
	const char *pTextPos;
	size_t nLineLength;
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (!pString || nSize <= 0)return FOOTY2ERR_ARGUMENT;
	// ���������p�ɉ��s�R�[�h��ύX����
	if (nLineMode == LM_AUTOMATIC)
		nLineMode = pFooty->m_cDoc.GetLineMode();
	// �������}�����Ă���
	for (iterLine = pFooty->m_cDoc.GetTopLine(),
		 iterLastLine = pFooty->m_cDoc.GetLastLine();;
		 iterLine++)
	{
		// �s���Ƃɑ�����Ă���
		CConvFactory cConv;
		cConv.GetConv()->ToMulti(iterLine->GetLineData(), (UINT)iterLine->GetLineLength());
		pTextPos = cConv.GetConv()->GetConvData();
		nLineLength = cConv.GetConv()->GetConvTextSize() - sizeof(char);
		for (size_t i=0;i<nLineLength;i++)
		{
			if (nSize == 1)break;
			*pString = *pTextPos;
			pString ++;
			pTextPos ++;
			nSize --;
		}
		// �Ō�̍s�������甲����
		if (iterLine == iterLastLine)
			break;
		// ���s�R�[�h������
		if (nLineMode == LM_CRLF)
		{
			if (nSize < 3)break;
			*pString = '\r';
			pString++;
			*pString = '\n';
			pString++;
			nSize -= 2;
		}
		else if (nLineMode == LM_CR)
		{
			if (nSize < 2)break;
			*pString = '\r';
			pString++;
			nSize--;
		}
		else
		{
			if (nSize < 2)break;
			*pString = '\n';
			pString++;
			nSize--;
		 }
	}
	// �Ō��NULL������
	*pString = '\0';
	return FOOTY2ERR_NONE;
}
#endif	/*UNDER_CE*/

//-----------------------------------------------------------------------------
/**
 * @brief �S��������擾���܂��B
 * @param nID Footy��ID�ԍ�
 * @param pString �i�[��
 * @param nLineMode ���s�R�[�h
 * @param nSize pString�̃o�b�t�@�T�C�Y
 */
FOOTYEXPORT(int) Footy2GetTextW(int nID,wchar_t *pString,int nLineMode,int nSize)
{
	LinePt iterLine;
	LinePt iterLastLine;
	const wchar_t *pTextPos;
	size_t nLineLength;
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (!pString || nSize <= 0)return FOOTY2ERR_ARGUMENT;
	// ���������p�ɉ��s�R�[�h��ύX����
	if (nLineMode == LM_AUTOMATIC)
	{
		nLineMode = pFooty->m_cDoc.GetLineMode();
	}
	// �������}�����Ă���
	for (iterLine = pFooty->m_cDoc.GetTopLine(),
		 iterLastLine = pFooty->m_cDoc.GetLastLine();;
		 iterLine++)
	{
		// �s���Ƃɑ�����Ă���
		pTextPos = iterLine->GetLineData();
		nLineLength = iterLine->GetLineLength();
		for (size_t i=0;i<nLineLength;i++)
		{
		if (nSize == 1)break;
			*pString = *pTextPos;
			pString ++;
			pTextPos ++;
			nSize --;
		}
		// �Ō�̍s�������甲����
		if (iterLine == iterLastLine)
			break;
		// ���s�R�[�h������
		if (nLineMode == LM_CRLF)
		{
			if (nSize < 3)break;
			*pString = L'\r';
			pString++;
			*pString = L'\n';
			pString++;
			nSize -= 2;
		}
		else if (nLineMode == LM_CR)
		{
			if (nSize < 2)break;
			*pString = L'\r';
			pString++;
			nSize--;
		}
		else
		{
			if (nSize < 2)break;
			*pString = L'\n';
			pString++;
			nSize--;
		}
	}
	// �Ō��NULL������
	*pString = L'\0';
	return FOOTY2ERR_NONE;
}

#ifndef UNDER_CE
//-----------------------------------------------------------------------------
/**
 * @brief ��������擾���܂��B
 * @param nID Footy��ID�ԍ�
 * @param pString �i�[��
 * @param nLineMode ���s�R�[�h
 * @param nSize pString�̃o�b�t�@�T�C�Y
 */
FOOTYEXPORT(int) Footy2GetSelTextA(int nID,char *pString,int nLineMode,int nSize){
	std::wstring strSelText;
	
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (!pString || nSize <= 0)return FOOTY2ERR_ARGUMENT;
	
	// �I�𕶎���̎擾
	if (!pFooty->m_cDoc.GetSelText(&strSelText, (LineMode)nLineMode))
		return FOOTY2ERR_NOTSELECTED;
	
	// �ϊ�
	CConvFactory cConv;
	if (!cConv.GetConv()->ToMulti(strSelText.c_str(), (UINT)pFooty->m_cDoc.GetSelLength((LineMode)nLineMode)))
	{
		return FOOTY2ERR_MEMORY;
	}
	
	// �R�s�[
	FOOTY2STRCPY(pString, cConv.GetConv()->GetConvData(), nSize);
	return FOOTY2ERR_NONE;
}
#endif	/*UNDER_CE*/

//-----------------------------------------------------------------------------
/**
 * @brief �I�����Ă��镶������擾���܂��B
 * @param nID Footy��ID�ԍ�
 * @param pString �i�[��
 * @param nLineMode ���s�R�[�h
 * @param nSize pString�̃o�b�t�@�T�C�Y
 */
FOOTYEXPORT(int) Footy2GetSelTextW(int nID,wchar_t *pString,int nLineMode,int nSize){
	LinePt iterLine;
	LinePt iterEndLine;
	LinePt iterStartLine;
	const wchar_t *pTextPos;
	size_t nStartPos, nEndPos;

	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (!pString || nSize <= 0)return FOOTY2ERR_ARGUMENT;

	// ���������p�ɉ��s�R�[�h��ύX����
	if (nLineMode == LM_AUTOMATIC)
		nLineMode = pFooty->m_cDoc.GetLineMode();

	// �������}�����Ă���
	for (iterStartLine = pFooty->m_cDoc.GetSelStart()->GetLinePointer(),
		 iterLine = iterStartLine,
		 iterEndLine = pFooty->m_cDoc.GetSelEnd()->GetLinePointer();;
		 iterLine++)
	{

		// �s���Ƃɑ�����Ă���
		nStartPos = iterLine == iterStartLine ? pFooty->m_cDoc.GetSelStart()->GetPosition() : 0;
		nEndPos = iterLine == iterEndLine ? pFooty->m_cDoc.GetSelEnd()->GetPosition() : iterLine->GetLineLength();

		pTextPos = &iterLine->GetLineData()[nStartPos];

		for (size_t i = nStartPos ; i < nEndPos; i++)
		{
			if (nSize == 1)break;
			*pString = *pTextPos;
			pString ++;
			pTextPos ++;
			nSize --;
		}
		 
		// �Ō�̍s�������甲����
		if (iterLine == iterEndLine)
			break;

		// ���s�R�[�h������
		if (nLineMode == LM_CRLF)
		{
			if (nSize < 3)break;
			*pString = L'\r';
			pString++;
			*pString = L'\n';
			pString++;
			nSize -= 2;
		}
		else if (nLineMode == LM_CR)
		{
			if (nSize < 2)break;
			*pString = L'\r';
			pString++;
			nSize--;
		}
		else
		{
			if (nSize < 2)break;
			*pString = L'\n';
			pString++;
			nSize--;
		}
	}
	// �Ō��NULL������
	*pString = L'\0';
	return FOOTY2ERR_NONE;
}

/*[EOF]*/
