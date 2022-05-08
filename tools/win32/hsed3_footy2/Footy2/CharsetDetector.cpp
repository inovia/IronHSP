/*===================================================================
CCharsetDetector�N���X
�����R�[�h�̔��ʏ������s���N���X
===================================================================*/

#include "CharsetDetector.h"
#include "CharsetDetective_MultiBytes.h"

/*----------------------------------------------------------------
CCharsetDetector::CCharsetDetector
�R���X�g���N�^
----------------------------------------------------------------*/
CCharsetDetector::CCharsetDetector(){
	m_nCodePage = CSM_AUTOMATIC;
	m_nStartIndex = 0;
}

/*----------------------------------------------------------------
CCharsetDetector::~CCharsetDetector
�f�X�g���N�^
----------------------------------------------------------------*/
CCharsetDetector::~CCharsetDetector(){
}


/*----------------------------------------------------------------
CCharsetDetector::Detect
�����񔻕�
----------------------------------------------------------------*/
void CCharsetDetector::Detect(const char *pRawStr,unsigned int nSize){
	/*�T�コ��̃C���X�^���X�𐶐�*/
	CCharsetDetective_ShiftJIS2004 cShiftJIS;
	CCharsetDetective_EUC_JIS_2004 cEucJp;
	CCharsetDetective_UTF8 cUtf8;
	CCharsetDetective_UTF16_LE cUtf16LE;
	CCharsetDetective_UTF16_BE cUtf16BE;
	CCharsetDetective_UTF32_LE cUtf32LE;
	CCharsetDetective_UTF32_BE cUtf32BE;

	/*�T�コ����܂Ƃ߂�*/
	CCharsetDetective *pArray[MAX_DETECTIVE] = {
		&cShiftJIS,
		&cEucJp,
		&cUtf8,
		&cUtf16LE,
		&cUtf16BE,
		&cUtf32LE,
		&cUtf32BE
	};

	/*���ׂ�*/
	unsigned int nNowPos = 0;
	CCharsetDetective *pTop;
	tGuessRet tRetVal;
	
	for (;;){
		/*�����A���ʂɊ�Â�����*/
		nNowPos = Examine(pArray,pRawStr,nNowPos,nSize);
		tRetVal = Guess(pArray,&pTop);
		
		/*����ŏI���̂Ƃ��͔�����*/
		if (tRetVal == GUESS_DETERMINE || (tRetVal == GUESS_MULTIPLE && nNowPos == nSize)){
			m_nCodePage = pTop->GetCodepage();
			break;
		}
		else if (tRetVal == GUESS_NOBODY || nNowPos == nSize){
			m_nCodePage = CSM_ERROR;
			break;
		}
	}
}

/*----------------------------------------------------------------
CCharsetDetector::Examine
�ǂꂪ�������̂���������
----------------------------------------------------------------*/
int CCharsetDetector::Examine(CCharsetDetective** ppArray,
	const char* pRawStr,unsigned int nStartPos,unsigned int nTextSize){
	/*���ׂ�*/
	unsigned int nEndPos = min(nTextSize,nStartPos+SEPARATE_NUM);
	for (unsigned int i=nStartPos;i<nEndPos;i++,pRawStr++){
		for (int j=0;j<MAX_DETECTIVE;j++)
			ppArray[j]->NewCharacter((unsigned char)*pRawStr);
	}
	return nEndPos;
}

/*----------------------------------------------------------------
CCharsetDetector::Guess
�����������ʂ��琄�����鏈��
----------------------------------------------------------------*/
CCharsetDetector::tGuessRet CCharsetDetector::Guess(CCharsetDetective** ppArray,CCharsetDetective **ppTop){
	/*���ʂ���ɐ���*/
	int nMaxPoint = 0;
	bool bMultiple = false;
	for (int i=0;i<MAX_DETECTIVE;i++){
		int nPoint = ppArray[i]->GetPoint();
		if (nMaxPoint < nPoint){
			*ppTop = ppArray[i];
			nMaxPoint = nPoint;
			bMultiple = false;
		}
		else if (nPoint == nMaxPoint){
			bMultiple = true;
		}
	}
	/*���ʂ�Ԃ�*/
	if (nMaxPoint == 0)return GUESS_NOBODY;
	else if (bMultiple)return GUESS_MULTIPLE;
	else return GUESS_DETERMINE;
}


/*[EOF]*/
