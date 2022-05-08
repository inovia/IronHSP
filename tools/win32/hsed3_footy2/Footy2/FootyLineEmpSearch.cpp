/**
 * @file FootyLineEmpSearch.cpp
 * @brief Footy�̋����\�����������邽�߂̏����ł�
 * @author Shinji Watanabe
 * @date Oct.30.2008
 */

#include "FootyLine.h"
#include "StaticStack.h"

#define MATCH_STR(s,n)	(pNowWord->IsNonCsWord() ? IsMatched(s,pNowLower,n) : IsMatched(s,pNowChar,n))

//-----------------------------------------------------------------------------
/**
 * @brief �����\��������̌���
 * @param pBeforeBetween �O�̍s�̎����z���F����
 * @param plsWords �����\�������񃊃X�g
 * @return �ύX�ɕω����������ꍇtrue���Ԃ�
 */
bool CFootyLine::SearchEmphasis(TakeOver *pBeforeBetween, LsWords *plsWords)
{
	if (!plsWords)return false;
	// �錾
	WordPt pNowWord;								//!< ���ݑ������̋����\��������
	TakeOver::iterator pNowBefore;					//!< �O�f�[�^�Z�b�g�p
	const wchar_t *pNowChar = GetLineData();		//!< ���ݑ������̕�����
	size_t nStringLen = GetLineLength();			//!< ������̒���
	CStaticStack<WordPt,sizeof(int)*8> cEmpStack;	//!< ���ݐF�����Ă���X�^�b�N
	EmpPos stInsert;								//!< �}������\����
	
	// ������
	TakeOver vecBetweenBackup;
	vecBetweenBackup = m_vecLineBetweenAfter;
	m_vecColorInfo.clear();
	m_vecLineBetweenAfter.clear();

	// �O����̃f�[�^���Z�b�g����
	if (pBeforeBetween){									// �f�[�^�����݂���Ƃ��̂�
		stInsert.m_nPosition = 0;
		stInsert.m_bIsStart = true;
		for (pNowBefore=pBeforeBetween->begin();pNowBefore!=pBeforeBetween->end();pNowBefore++){
			(*pNowBefore)->m_bDuplix = true;				// �d���`�F�b�N
			stInsert.m_Color = (*pNowBefore)->GetColor();	// �R�}���h�����X�g��
			m_vecColorInfo.push_back(stInsert);
			cEmpStack.push(*pNowBefore);
		}
	}
	
	// ��������
	std::wstring strLower = GetLineData();
	const wchar_t *pNowLower = strLower.c_str();
	CEmphasisWord::SetLower(&strLower[0], nStringLen);

	// �������Ă���
	for (size_t i=0;i<nStringLen;i++,pNowChar++,pNowLower++)
	{
		bool bWordSkipped = false;
		// ������𑖍����Ă���
		for (pNowWord=plsWords->begin();pNowWord!=plsWords->end();pNowWord++)
		{
			// ���̕����������ł��邩�`�F�b�N����
			if (pNowWord->m_bDuplix)continue;						// �d���`�F�b�N
			if (i != 0)
			{
				if (pNowWord->IsOnlyHead())continue;				// �擪�Ɍ���
				if (!pNowWord->CheckIndependence(pNowChar-1,false))	// �Ɨ����`�F�b�N(�O)
					continue;
			}
			if (cEmpStack.size() == 0)
			{
				if (!pNowWord->IsPermitted(0))continue;
			}
			else
			{
				if (!pNowWord->IsPermitted(cEmpStack.top()->GetLevel()))continue;
			}
			if (nStringLen - i < pNowWord->GetLen1())				// �����̒����͏\�����H
			{
				continue;
			}

			if (nStringLen - i != pNowWord->GetLen1())
			{
				if (!pNowWord->CheckIndependence
					(pNowChar+pNowWord->GetLen1(),true))			// �Ɨ����`�F�b�N(��)
					continue;
			}
			
			// ��������v���邩�`�F�b�N
			if (!MATCH_STR(pNowWord->GetString1(),pNowWord->GetLen1()))
				continue;

			// �J�n�R�}���h��}������
			stInsert.m_nPosition = i;
			stInsert.m_Color = pNowWord->GetColor();
			stInsert.m_bIsStart = true;
			m_vecColorInfo.push_back(stInsert);

			// �C���f�b�N�X�ԍ����ֈړ�������
			i += pNowWord->GetLen1() - 1;
			pNowChar += pNowWord->GetLen1() - 1;
			pNowLower+= pNowWord->GetLen1() - 1;
			bWordSkipped = true;

			// �����\�����ɂ���ďꍇ����
			if (pNowWord->GetType() == EMP_WORD){
				// �P��̎��́A����̏I���R�}���h��}������
				stInsert.m_nPosition = i + 1;
				stInsert.m_bIsStart = false;
				m_vecColorInfo.push_back(stInsert);
			}
			else{
				// �X�^�b�N��ς�
				pNowWord->m_bDuplix = true;
				cEmpStack.push(pNowWord);
			}
			// ���̕����̃��[�v�ֈړ�����
			goto To_NextLoop;
		}
		
		//�I�����`�F�b�N
		if (cEmpStack.size()){
			pNowWord = cEmpStack.top();
			// ��ڂ̒P�ꓖ������`�F�b�N
			if ((pNowWord->GetType() == EMP_MULTI_BETWEEN || pNowWord->GetType() == EMP_LINE_BETWEEN) && 
				nStringLen - i >= pNowWord->GetLen2()){
				if (MATCH_STR(pNowWord->GetString2(),pNowWord->GetLen2())){
					// �C���f�b�N�X�ԍ����ֈړ�������
					i += pNowWord->GetLen2() - 1;
					pNowChar  += pNowWord->GetLen2() - 1;
					pNowLower += pNowWord->GetLen2() - 1;
					bWordSkipped = true;
					// �I���R�}���h��}������
					stInsert.m_nPosition = i + 1;
					stInsert.m_bIsStart = false;
					m_vecColorInfo.push_back(stInsert);
					// �X�^�b�N��r��
					pNowWord->m_bDuplix = false;
					cEmpStack.pop();
				}
			}
		}
		// ���̃��[�v��
To_NextLoop:;
		// �T���Q�[�g�y�A�̂P�����ڂŁA�����\����������Ȃ������Ƃ��͂���Ɉ�i�߂Ă���
		if (!bWordSkipped && IsSurrogateLead(*pNowChar)){
			pNowChar++;i++;
		}
	}
	
	// ���̃x�N�g����
	for (;cEmpStack.size();){
		if (cEmpStack.top()->GetType() == EMP_MULTI_BETWEEN)
			m_vecLineBetweenAfter.push_back(cEmpStack.top());
		cEmpStack.top()->m_bDuplix = false;
		cEmpStack.pop();
	}

	m_bEmphasisChached = true;
	return !(vecBetweenBackup == m_vecLineBetweenAfter);
}

/*-------------------------------------------------------------------
CFootyLine::IsMatched
������pStr1��pStr2�̕�����nLen����v���Ă��邩�ǂ����̔��f�ł��B
-------------------------------------------------------------------*/
bool CFootyLine::IsMatched(const wchar_t *pStr1,const wchar_t *pStr2,size_t nLen){
#ifdef UNDER_CE
	/*���[�v���Č���*/
	for (size_t i=0;i<nLen;i++,pStr1++,pStr2++){
		if ((*pStr1) != (*pStr2))return false;
	}
	return true;
#else	/*UNDER_CE*/
	/*�錾*/
	bool bIsOddNum = (nLen & 1) == 1;
	if (bIsOddNum && pStr1[nLen-1] != pStr2[nLen-1])return false;
	size_t nLoopNum = nLen >> 1;
	/*���[�v���ĕ����񂪈�v���Ă��邩�`�F�b�N����*/
	unsigned long* pStrLong1 = (unsigned long*)pStr1;
	unsigned long* pStrLong2 = (unsigned long*)pStr2;
	for (size_t i=0;i<nLoopNum;i++,pStrLong1++,pStrLong2++){
		if ((*pStrLong1) != (*pStrLong2))return false;
	}
	//if (bIsOddNum && pStr1[nLen-1] != pStr2[nLen-1])return false;
	return true;
#endif	/*UNDER_CE*/	
}

/*[EOF]*/
