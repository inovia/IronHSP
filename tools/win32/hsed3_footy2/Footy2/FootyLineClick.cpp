/**
 * @file FootyLineClick.cpp
 * @brief �N���b�J�u���n�̏������s���܂��B
 * @author Shinji Watanabe
 * @version 1.0
 * @date Jan.08.2008
 */

#include "FootyLine.h"

/**
 * CFootyLine::FindURL
 * @brief URL��������������܂��B
 * @param start [in] �J�n�ʒu
 * @param pBegin [out] ���������J�n�ʒu
 * @param pEnd [out] ���������I���ʒu
 */
bool CFootyLine::FindURL(size_t start,size_t *pBegin,size_t *pEnd)
{
	// �錾
	const wchar_t *pLineData = GetLineData() + start;
	size_t nTextLen = GetLineLength();
	size_t len = -1;
	// �����J�n
	for (size_t i=start;i<nTextLen;i++,pLineData++)
	{
		// ��r
		if (5 <= nTextLen-i && IsMatched(pLineData,L"http:",5))len=5;
		if (6 <= nTextLen-i && IsMatched(pLineData,L"https:",6))len=6;
		if (4 <= nTextLen-i && IsMatched(pLineData,L"ftp:",4))len=4;
		
		// ��v�����Ƃ�
		if (len!=-1)
		{
			*pBegin = i;
			for (pLineData+=len,i+=len;i<nTextLen;i++,pLineData++)
			{
				if (!IsURLChar(*pLineData))	// URL�̕����̓K�������`�F�b�N
				{
					*pEnd = i;
					return true;
				}
			}
			*pEnd = nTextLen;
			return true;
		}
	}
	*pBegin = *pEnd = -1;
	return false;
}

/**
 * CFootyLine::FindMail
 * @brief ���[���A�h���X��������������܂��B
 * @param start [in] �J�n�ʒu
 * @param pBegin [out] ���������J�n�ʒu
 * @param pEnd [out] ���������I���ʒu
 */
bool CFootyLine::FindMail(size_t start,size_t *pBegin,size_t *pEnd)
{
	// �錾
	int work=-1;										//!< ���o�p
	bool bDotFound;										//!< �h�b�g������������
	size_t i,j;
	const wchar_t *pLineData = GetLineData() + start;	//!< �������p
	const wchar_t *pWork;
	size_t nTextLen = GetLineLength();

	// ����
	for (i = start;i<nTextLen;i++,pLineData++)			// �Ōォ���O�܂�
	{
		bDotFound = false;
		if (*pLineData == L'@')							// ���}�[�N������
		{
			if (i == 0)continue;						// ����ȑO�������ꍇ�͎���
			for (j=i-1,pWork=pLineData-1;;pWork--,j--)	// ����ȑO���������Ă���
			{
				if (j == -1)
				{
					*pBegin=0;
					break;
				}
				if (!IsMailChar(*pWork))				// ���[��������Ƃ��ĕs�K�؂ȏꍇ
				{
					if (j == i - 1)goto NextI;			// ���}�[�N�ȑO�ɂȂ������玟��
					*pBegin = j + 1;
					break;
				}
			}
			for (j=i+1,pWork=pLineData+1;;pWork++,j++)	// ���}�[�N�ȍ~������
			{
				if (j == nTextLen)
				{
					*pEnd = nTextLen;
					if (bDotFound)
						return true;
					goto NextI;
				}
				if (!IsMailChar(*pWork))
				{
					if (i == j+1)goto NextI;			// ����ȍ~�̕����񂪌�����Ȃ�
					*pEnd = j;
					if (bDotFound)
						return true;
					goto NextI;
				}
				if (*pWork == L'.')						// @�ȍ~��.����������
					bDotFound = true;
			}
		}
NextI:;
	}
	*pBegin = *pEnd = -1;
	return false;
}

/**
 * CFootyLine::FindLabel by Tetr@pod
 * @brief ���x����������������܂��B
 * @param start [in] �J�n�ʒu
 * @param pBegin [out] ���������J�n�ʒu
 * @param pEnd [out] ���������I���ʒu
 */
bool CFootyLine::FindLabel(size_t start,size_t *pBegin,size_t *pEnd)
{
	FOOTY2_PRINTF(L"FindLabel Start\n");
	// �錾
	const wchar_t *pLineData = GetLineData() + start;
	size_t nTextLen = GetLineLength();
	bool IsLabelDefination = true;// ���x���{��(goto�Ƃ��̂���Ȃ��A��`��)���H
	// �����J�n
	for (size_t i=start;i<nTextLen;i++,pLineData++)
	{
		if (IsLabelDefination && *pLineData != L'*' && ( *pLineData != L'\t' && *pLineData != L' ' && *pLineData != L':' && *pLineData != L'{' && *pLineData != L'}' )) {
			// ���x���{�̂ł͂Ȃ�
			IsLabelDefination = false;
		}
		if (*pLineData == L'*')							// ���}�[�N������
		{
			if (IsLabelDefination || i == 0) {// ���x���{�̂�����
				// ������Ȃ�����
				*pBegin = i - 1;// �����Ɨǂ�������������͂������ǁc
				break;
			}
			FOOTY2_PRINTF(L"FindLabel Find '*'\n");
			*pBegin = i;
			const wchar_t *pLabelStart = pLineData - 1;
			for (pLineData++,i++;i<nTextLen;i++,pLineData++)
			{
				if (!IsLabelChar(*pLineData))	// ���x���̕����̓K�������`�F�b�N
				{
					if (*pBegin == i - 1) {// *�����̂��̂̓��x���ł͂Ȃ�
						break;
					}
					// ���O�̕����� ":"�A" "�A"\t"�A"\n"�A"//"�A"/ *"�A"* /"�A";"�A","�A"{"�A"}" �ȊO�̂��̂̓��x���ł͂Ȃ�
					if (*pLabelStart == L':' || *pLabelStart == L' ' || 
						*pLabelStart == L'\t' || *pLabelStart == L'\n' || 
						( *pBegin > 1 && ( ( *(pLabelStart-1) == L'/' && 
						( *pLabelStart == L'/' || *pLabelStart == L'*' ) ) ||
						( *(pLabelStart-1) == L'*' && *pLabelStart == L'/' ) ) ) ||
						*pLabelStart == L';' || *pLabelStart == L',' ||
						*pLineData == L'{' || *pLineData == L'}') {

							// ����̕����� ":"�A" "�A"\t"�A"\r"�A"//"�A"/ *"�A"* /"�A";"�A","�A"{"�A"}" �ȊO�̂��̂̓��x���ł͂Ȃ�
							if (*pLineData == L':' || *pLineData == L' ' || 
								*pLineData == L'\t' || *pLineData == L'\r' || 
								( i + 1 < nTextLen && ( ( *pLineData == L'/' && 
								( *(pLineData+1) == L'/' || *(pLineData+1) == L'*' ) ) ||
								( *pLineData == L'*' && *(pLineData+1) == L'/' ) ) ) ||
								*pLineData == L';' || *pLineData == L',' ||
								*pLineData == L'{' || *pLineData == L'}') {
									*pEnd = i;
									return true;
							}
					}

					// ������Ȃ�����
					*pBegin = i - 1;// �����Ɨǂ�������������͂������ǁc
					break;
				}
			}

			// ������Ȃ�����
			if (*pBegin == i - 1) {
				break;
			}

			*pEnd = nTextLen;
			return true;
		}
	}
	*pBegin = *pEnd = -1;
	FOOTY2_PRINTF(L"FindLabel Finish on false\n");
	return false;
}

/**
 * CFootyLine::FindFunc by Tetr@pod
 * @brief ���[�U�[��`���߁E�֐��Ȃǂ��������܂��B
 *        �������A����Ă��邱�Ƃ͂����̌����ł��B
 *        �p�ɂɌĂяo����܂��B
 *        �������ł�����͂��Ă�����������
 *        ���Ȃ݂ɃA���S���Y����BM�@�̂͂��A�ł��B
 * @param start [in] �J�n�ʒu
 * @param pBegin [out] ���������J�n�ʒu
 * @param pEnd [out] ���������I���ʒu
 * @param SearchWord [in] �������閽�߁E�֐���
 * @param bIsFunction [in] ����͊֐���(true�Ŋ֐�)
 * @param bMatchCase [in] �啶������������ʂ��邩
 */
bool CFootyLine::FindFunc(size_t start,size_t *pBegin,size_t *pEnd, wchar_t *SearchWord, bool bIsFunction, bool bMatchCase)
{
	FOOTY2_PRINTF(L"FindFunc Start\n");

#if 0
	// BM�@�Ō���

	// �錾
	const wchar_t *pLineData = GetLineData() + start;
	size_t nTextLen = GetLineLength();
	
	int skip[65536];
	int i, j;
	int pat_len = wcslen(SearchWord);
	
	for(i = 0; i < 65536; i++) {
		skip[i] = pat_len;
	}
	for(i = 0; i < pat_len - 1; i++) {
		skip[*(SearchWord + i)] = pat_len - i - 1;
	}

	int count=0;
	i = start + pat_len - 1;
	
	while(i < nTextLen){
		j = pat_len - 1;
		count++;
		while(true){
			if (bMatchCase) {
				if (*(pLineData + i) != *(SearchWord + j)) {
					break;
				}
			}
			else {
				if (towlower(*(pLineData + i)) != towlower(*(SearchWord + j))) {
					break;
				}
			}
			if (j == 0) {
# if 0
				// �O��̕������`�F�b�N���Ȃ��ꍇ
				*pBegin = i;
				*pEnd = i + pat_len;
				return true;
# else
				// �O�̕����� :;+-/\*=( ^|&<>,? �ȊO�̂��̂͂���
				if ( i == 0 || (
					*(pLineData + i - 1) == L':'  || *(pLineData + i - 1) == 0x20 || 
					*(pLineData + i - 1) == L'+'  || *(pLineData + i - 1) == 0x09 || 
					*(pLineData + i - 1) == L'-'  || *(pLineData + i - 1) == 0x0a || 
					*(pLineData + i - 1) == L'*'  || *(pLineData + i - 1) == L'/' || 
					*(pLineData + i - 1) == L'\\' || *(pLineData + i - 1) == L'=' || 
					*(pLineData + i - 1) == L'('  || *(pLineData + i - 1) == L'^' || 
					*(pLineData + i - 1) == L'|'  || *(pLineData + i - 1) == L'&' || 
					*(pLineData + i - 1) == L'<'  || *(pLineData + i - 1) == L'>' || 
					*(pLineData + i - 1) == L'?'  || *(pLineData + i - 1) == L',' ||
					*(pLineData + i - 1) == L';') ) {
	
						if (bIsFunction) {
							// �֐��Ȃ�A���̕����� @() ;//  / *  * /  \t\r �ȊO�̂��̂͂���
							if (i + pat_len >= nTextLen || (
								*(pLineData + i + pat_len) == L'@' || *(pLineData + i + pat_len) == 0x20 || 
								*(pLineData + i + pat_len) == 0x09 || *(pLineData + i + pat_len) == 0x0d || 
								( i + pat_len + 1 < nTextLen && ( ( *(pLineData + i + pat_len) == L'/' && 
								( *(pLineData + i + pat_len + 1) == L'/' || *(pLineData + i + pat_len + 1) == L'*' ) ) ||
								( *(pLineData + i + pat_len) == L'*' && *(pLineData + i + pat_len + 1) == L'/' ) ) ) ||
								*(pLineData + i + pat_len) == L'(' || *(pLineData + i + pat_len) == L')' || 
								*(pLineData + i + pat_len) == L';')) {
									*pBegin = i;
									*pEnd = i + pat_len;
									return true;
							}
						}
						else {
							// ���߂Ȃ�A���̕����� @$):} ;//  / *  * /  \t\r �ȊO�̂��̂͂���
							if (i + pat_len >= nTextLen || (
								*(pLineData + i + pat_len) == L'@' || *(pLineData + i + pat_len) == 0x20 || 
								*(pLineData + i + pat_len) == 0x09 || *(pLineData + i + pat_len) == 0x0d || 
								( i + pat_len + 1 < nTextLen && ( ( *(pLineData + i + pat_len) == L'/' && 
								( *(pLineData + i + pat_len + 1) == L'/' || *(pLineData + i + pat_len + 1) == L'*' ) ) ||
								( *(pLineData + i + pat_len) == L'*' && *(pLineData + i + pat_len + 1) == L'/' ) ) ) ||
								*(pLineData + i + pat_len) == L';' || *(pLineData + i + pat_len) == L')' || 
								*(pLineData + i + pat_len) == L'$' || *(pLineData + i + pat_len) == L':' || 
								*(pLineData + i + pat_len) == L'}')) {
									*pBegin = i;
									*pEnd = i + pat_len;
									return true;
							}
						}

				}
				break;
# endif
			}
			i--;
			j--;
			count++;
		}
		i += max(skip[*(pLineData + i)], pat_len - j);
	}


#else
	// �W���֐�(wcsstr)�Ō���

	// �錾
	const wchar_t *pLineData = GetLineData() + start;
	size_t nTextLen = GetLineLength();
	int pat_len = wcslen(SearchWord);
	if (nTextLen < 1 || pat_len < 1) {
		FOOTY2_PRINTF(L"FindFunc invalid length.");
		return false;
	}
	
	// �����p������̐錾(�啶���������̕ϊ��Ƃ���邽��)
	wchar_t *pLineData_ForSearch;// �����p������������
	wchar_t *SearchWord_ForSearch;// �����p���o������
	if (bMatchCase) {
		// �啶���������̔�r������Ȃ炻�̂܂܃|�C���^���R�s�[����
		pLineData_ForSearch  = (wchar_t *) pLineData;// ���܂�悭�Ȃ��B
		SearchWord_ForSearch = SearchWord;
	}
	else {
		// �啶���������̔�r�����Ȃ��Ȃ當������R�s�[���A������������

		// �m�ۂ���
		pLineData_ForSearch  = (wchar_t *)malloc(sizeof(pLineData_ForSearch ));
		SearchWord_ForSearch = (wchar_t *)malloc(sizeof(SearchWord_ForSearch));

		// �G���[��������
		if (pLineData_ForSearch == NULL | SearchWord_ForSearch == NULL ) {
			if (pLineData_ForSearch  != NULL) {
				free(pLineData_ForSearch );
			}
			if (SearchWord_ForSearch != NULL) {// �����Ə������ƁB���蓾�邩��B
				free(SearchWord_ForSearch);
			}

			FOOTY2_PRINTF(L"!! FindFunc allocation error!");

			return false;
		}

		// �R�s�[����
		memcpy(pLineData_ForSearch , pLineData , sizeof(pLineData ));
		memcpy(SearchWord_ForSearch, SearchWord, sizeof(SearchWord));

		// ������������
		for(int i=0; i<nTextLen; i++) {
			if (pLineData_ForSearch[i] >= L'A' && pLineData_ForSearch[i] <= L'Z') {
				pLineData_ForSearch[i] += 32;// 'a' - 'A'
			}
		}
		for(int i=0; i<pat_len; i++) {
			if (SearchWord_ForSearch[i] >= L'A' && SearchWord_ForSearch[i] <= L'Z') {
				SearchWord_ForSearch[i] += 32;// 'a' - 'A'
			}
		}
	}

	const wchar_t *ptr = pLineData_ForSearch;
	for ( ptr = wcsstr(ptr, SearchWord_ForSearch); ptr != NULL; ptr = wcsstr(ptr, SearchWord_ForSearch)) {

# if 0
		// �O��̕������`�F�b�N���Ȃ��ꍇ
		*pBegin = ptr - pLineData_ForSearch;
		*pEnd = ptr - pLineData_ForSearch + pat_len;
		return true;
# else
		// �O�̕����� :;+-/\*=( ^|&<>,? �ȊO�̂��̂͂���
		/*if ( ptr - pLineData_ForSearch + start == 0 || (
			*(ptr - 1) == L':'  || *(ptr - 1) == 0x20 || 
			*(ptr - 1) == L'+'  || *(ptr - 1) == 0x09 || 
			*(ptr - 1) == L'-'  || *(ptr - 1) == 0x0a || 
			*(ptr - 1) == L'*'  || *(ptr - 1) == L'/' || 
			*(ptr - 1) == L'\\' || *(ptr - 1) == L'=' || 
			*(ptr - 1) == L'('  || *(ptr - 1) == L'^' || 
			*(ptr - 1) == L'|'  || *(ptr - 1) == L'&' || 
			*(ptr - 1) == L'<'  || *(ptr - 1) == L'>' || 
			*(ptr - 1) == L'?'  || *(ptr - 1) == L',' ||
			*(ptr - 1) == L';') ) {*/

		if (ptr - pLineData_ForSearch + start == 0 || (// 0-9 A-Z a-z " ' # _ �ȊO�Ȃ�OK�ɂ���
			( *(ptr - 1) <  L'0'  || *(ptr - 1) >  L'9'  ) && 
			( *(ptr - 1) <  L'A'  || *(ptr - 1) >  L'Z'  ) && 
			( *(ptr - 1) <  L'a'  || *(ptr - 1) >  L'z'  ) &&
			  *(ptr - 1) != L'\"' && *(ptr - 1) != L'\''   &&
			  *(ptr - 1) != L'#'  && *(ptr - 1) != L'_'    ))
			{
				/*bool FunctionFound = false;// ���߁E�֐��͌��������H

				if (bIsFunction) {// �֐��̎��̕����`�F�b�N
					// �֐��Ȃ�A���̕����� @() ;//  / *  * /  \t\r �ȊO�̂��̂͂���
					if (ptr - pLineData_ForSearch + start + pat_len >= nTextLen || (
						*(ptr + pat_len) == L'(' || *(ptr + pat_len) == L')' || 
						*(ptr + pat_len) == L';' || 
						*(ptr + pat_len) == L'@' || *(ptr + pat_len) == 0x20 || 
						*(ptr + pat_len) == 0x09 || *(ptr + pat_len) == 0x0d || 
						( ptr - pLineData_ForSearch + start + pat_len + 1 < nTextLen && ( ( *(ptr + pat_len) == L'/' && 
						( *(ptr + pat_len + 1) == L'/' || *(ptr + pat_len + 1) == L'*' ) ) ||
						( *(ptr + pat_len) == L'*' && *(ptr + pat_len + 1) == L'/' ) ) ) ) )
						{
							FunctionFound = true;
					}
				}
				else {// ���߂̎��̕����`�F�b�N
					// ���߂Ȃ�A���̕����� @$):} ;//  / *  * /  \t\r �ȊO�̂��̂͂���
					if (ptr - pLineData_ForSearch + start + pat_len >= nTextLen || (
						*(ptr + pat_len) == L'@' || *(ptr + pat_len) == 0x20 || 
						*(ptr + pat_len) == 0x09 || *(ptr + pat_len) == 0x0d || 
						( ptr - pLineData_ForSearch + start + pat_len + 1 < nTextLen && ( ( *(ptr + pat_len) == L'/' && 
						( *(ptr + pat_len + 1) == L'/' || *(ptr + pat_len + 1) == L'*' ) ) ||
						( *(ptr + pat_len) == L'*' && *(ptr + pat_len + 1) == L'/' ) ) ) ||
						*(ptr + pat_len) == L';' || *(ptr + pat_len) == L')' || 
						*(ptr + pat_len) == L'$' || *(ptr + pat_len) == L':' || 
						*(ptr + pat_len) == L'}')) {
							FOOTY2_PRINTF(L"FindFunc Finish on true. It's NOT function, %d >= %d\n", ptr - pLineData_ForSearch + start + pat_len, nTextLen);
							FunctionFound = true;
					}
				}

				if (FunctionFound) {// ���������Ȃ�A*/

				if (ptr - pLineData_ForSearch + start + pat_len >= nTextLen || (// 0-9 A-Z a-z " ' # _ �ȊO�Ȃ�OK�ɂ���
					( *(ptr + pat_len) <  L'0'  || *(ptr + pat_len) >  L'9'  ) && 
					( *(ptr + pat_len) <  L'A'  || *(ptr + pat_len) >  L'Z'  ) && 
					( *(ptr + pat_len) <  L'a'  || *(ptr + pat_len) >  L'z'  ) && 
					  *(ptr + pat_len) != L'\"' && *(ptr + pat_len) != L'\''   &&
					  *(ptr + pat_len) != L'#'  && *(ptr + pat_len) != L'_'    ))
					{
						*pBegin = ptr - pLineData_ForSearch + start;
						*pEnd = ptr - pLineData_ForSearch + pat_len + start;
						return true;
				}

		}
# endif
		if (ptr - pLineData_ForSearch + start + pat_len >= nTextLen - 1) {
			// ���������邱�Ƃ͂Ȃ����낤
			break;
		}
		ptr += 2;
	}
#endif

	*pBegin = *pEnd = -1;
	FOOTY2_PRINTF(L"FindFunc Finish on false\n");
	return false;
}


/**
 * CFootyLine::IsMailChar
 * @brief ���[���A�h���X�̕����Ƃ��ēK��������
 * @param c ���ׂ镶��
 * @return �K�؂ȏꍇtrue��Ԃ��܂��B
 */
bool CFootyLine::IsMailChar(wchar_t c)
{
	if (c==L'~'  || (97 <=c && c <= 122) || // a�`z
		c==L'_'  || (65 <=c && c <= 90)  || // ?,A�`Z
		c==L'\\' || (45 <=c && c <= 58)  || // �����A�s���I�h�A�n�C�t���A�X���b�V���A�R����
		c==L'='  || (36 <=c && c <= 38)  ||
		c==L'&'  || c==L'%' || c==L'#' || c==L'+')
		return true;
	else
		return false;
}

/**
 * CFootyLine::IsURLChar
 * @brief URL�̕����Ƃ��ēK���̂�����̂����ׂ܂��B
 * @param c ���ׂ镶��
 * @return �K�؂ȏꍇtrue��Ԃ��܂��B
 */
bool CFootyLine::IsURLChar(wchar_t c)
{
	if (c==L'~'  || (97 <=c && c <= 122) ||
		c==L'_'  || (65 <=c && c <= 90)  ||
		c==L'!'  || (44 <=c && c <= 59)  ||
		c==L'='  || (36 <=c && c <= 38)  ||
		c==L'*'  || c==L'?' || c==L'#')
		return true;
	else
		return false;
}

/**
 * CFootyLine::IsLabelChar by Tetr@pod
 * @brief ���x���̕����Ƃ��ēK���̂�����̂����ׂ܂��B
 * @param c ���ׂ镶��
 * @return �K�؂ȏꍇtrue��Ԃ��܂��B
 */
bool CFootyLine::IsLabelChar(wchar_t c)
{
	if ((97 <=c && c <= 122) || // a-z
		(65 <=c && c <= 90)  || // A-Z
		(48 <=c && c <= 57)  || // 0-9
		(c  == L'_'))           // "_"
		return true;
	else
		return false;
}

/*[EOF]*/
