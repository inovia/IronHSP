/**
 * @file DllFileFunc.cpp
 * @brief �t�@�C������֘A��DLL�֐��̎���
 * @author Shinji Watanabe
 * @version 1.0
 * @note DllMain.cpp����ړ�
 * @date Oct.01.2007
 */

#include "ConvFactory.h"
#include "CharsetDetector.h"

/**
 * TextFromFile
 * @brief �w�肳�ꂽ�t�@�C���|�C���^����t�@�C����ǂݍ��݂܂��B
 * @param nID �W�J����Footy��ID�ԍ�
 * @param pFile �W�J���t�@�C���|�C���^
 * @param nCharSets �ǂݍ��ރL�����N�^�Z�b�g
 */
static int TextFromFile(int nID,FILE *pFile,CharSetMode nCharSets){
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;

	// �t�@�C���̒������擾����
	UINT nFileSize;
	fseek(pFile,0,SEEK_END);
	nFileSize=ftell(pFile);
	fseek(pFile,0,SEEK_SET);
	
	if (nFileSize == 0){
		// �t�@�C������Ȃ�V�K�쐬����
		Footy2CreateNew(nID);
	}
	else{
		// �t�@�C�����琶�f�[�^���擾����
		std::vector<char> vecRawData;
		vecRawData.assign(nFileSize,'\0');
		fread(&vecRawData[0],nFileSize,1,pFile);

		// �e�L�X�g�R���o�[�^�[��p�ӂ���
		if (nCharSets == CSM_AUTOMATIC){
			CCharsetDetector cDetector;
			cDetector.Detect(&vecRawData[0],nFileSize);
			nCharSets = cDetector.GetCodepage();
		}
		CConvFactory cConvFactory(nCharSets);
		if (!cConvFactory.GetConv())return FOOTY2ERR_ENCODER;

		// �e�L�X�g��ϊ����đ��
		if (!cConvFactory.GetConv()->ToUnicode(&vecRawData[0],nFileSize)){
			fclose(pFile);
			return FOOTY2ERR_MEMORY;
		}
		pFooty->SetText((const wchar_t*)cConvFactory.GetConv()->GetConvData());
		pFooty->SetCharSet(cConvFactory.GetCharset());
	}
	
	// �t�@�C�������
	fclose(pFile);
	return FOOTY2ERR_NONE;
}

/**
 * SaveToFile
 * @brief �w�肳�ꂽ�t�@�C���ɕۑ����鏈��
 * @param nID �f�[�^������FootyID
 * @param pFile �������ݐ�t�@�C���|�C���^
 * @param nCharSets �������݃L�����N�^�Z�b�g
 * @param nLineMode �������݉��s�R�[�h
 */
static int SaveToFile(int nID,FILE *pFile,CharSetMode nCharSets,int nLineMode){
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;

	// �w�肵��Footy����f�[�^���擾����
	int nLength = Footy2GetTextLengthW(nID,nLineMode);
	wchar_t *pTexts = new wchar_t[nLength+1];
	Footy2GetTextW(nID,pTexts,nLineMode,nLength+1);

	// �e�L�X�g�R���o�[�^�[��p�ӂ���
	if (nCharSets == CSM_AUTOMATIC)
		nCharSets = pFooty->GetCharSet();
	CConvFactory cConvFactory(nCharSets);
	if (!cConvFactory.GetConv())return FOOTY2ERR_ENCODER;
	if (!cConvFactory.GetConv()->ToMulti(pTexts,nLength)){
		if (pTexts){
			delete [] pTexts;
			pTexts = NULL;
		}
		fclose(pFile);
		return FOOTY2ERR_MEMORY;
	}
	fwrite(cConvFactory.GetConv()->GetConvData(),					// �ϊ������������ۑ�����
		   cConvFactory.GetConv()->GetConvTextSize()-sizeof(char),	// NULL�����͕ۑ����Ȃ�
		   1,pFile);												// �n���ꂽ�t�@�C���|�C���^�֏�������

	// �Z�[�u��������ۑ����Ă���
	pFooty->m_cDoc.SetSavePoint();

	// ���������������
	if (pTexts){
		delete [] pTexts;
		pTexts = NULL;
	}
	fclose(pFile);
	return FOOTY2ERR_NONE;
}

/**
 * Footy2SaveToFileW
 * @brief �t�@�C���֕ۑ����܂�
 * @param nID �ǂݍ���Footy��ID
 * @param pPath �ǂݍ��ރt�@�C����
 * @param nCharSets �L�����N�^�Z�b�g
 * @param nLineMode ���s�R�[�h
 */
FOOTYEXPORT(int)Footy2SaveToFileW(int nID,const wchar_t *pPath,int nCharSets,int nLineMode){
	// �t�@�C���̓o�C�i�����[�h�W�J
	FILE *pFile = NULL;
#ifdef UNDER_CE
	pFile = _wfopen(pPath, L"wb");
#else	/*UNDER_CE*/
	_wfopen_s(&pFile, pPath, L"wb");
#endif	/*UNDER_CE*/

	// �t�@�C�����W�J�ł��Ȃ�����
	if (!pFile)return FOOTY2ERR_404;

	// �t�@�C���֕ۑ�����
	return SaveToFile(nID,pFile,(CharSetMode)nCharSets,nLineMode);
}

/**
 * Footy2TextFromFileW
 * @brief �t�@�C������ǂݍ��݂܂�
 * @param pPath �ǂݍ��݌��t�@�C���p�X
 * @param nCharSets �L�����N�^�Z�b�g
 */
FOOTYEXPORT(int)Footy2TextFromFileW(int nID,const wchar_t *pPath,int nCharSets){
	// �t�@�C���̓o�C�i�����[�h�W�J
	FILE *pFile = NULL;
#ifdef UNDER_CE
	pFile = _wfopen(pPath, L"rb");
#else	/*UNDER_CE*/
	_wfopen_s(&pFile, pPath, L"rb");
#endif	/*UNDER_CE*/

	// �t�@�C�����J���Ȃ�����
	if (!pFile)return FOOTY2ERR_404;

	// �t�@�C�����J��
	return TextFromFile(nID,pFile,(CharSetMode)nCharSets);
}

#ifndef UNDER_CE
/**
 * Footy2SaveToFileA
 * @brief �t�@�C���֏������݂܂�
 * @param pPath �������ݐ�t�@�C���p�X
 * @param nCharSets �������ݕ����R�[�h
 * @param nLineMode �������݉��s�R�[�h
 */
FOOTYEXPORT(int)Footy2SaveToFileA(int nID,const char *pPath,int nCharSets,int nLineMode){
	// �t�@�C���̓o�C�i�����[�h�W�J
	FILE *pFile = NULL;
	fopen_s(&pFile, pPath, "wb");

	// �t�@�C���փA�N�Z�X�o���Ȃ�
	if (!pFile)return FOOTY2ERR_404;

	// �t�@�C����ۑ�����
	return SaveToFile(nID,pFile,(CharSetMode)nCharSets,nLineMode);
}

/**
 * Footy2TextFromFileA
 * @brief �t�@�C������ǂݍ��݂܂�
 * @param nID �ǂݍ��ݐ��FootyID
 * @param pPath �ǂݍ��݂��ƃt�@�C���p�X
 * @param nCharSets �L�����N�^�Z�b�g
 */
FOOTYEXPORT(int)Footy2TextFromFileA(int nID,const char *pPath,int nCharSets){
	// �t�@�C���̓o�C�i�����[�h�W�J
	FILE *pFile = NULL;
	fopen_s(&pFile, pPath, "rb");

	// �t�@�C���փA�N�Z�X�o���Ȃ�
	if (!pFile)return FOOTY2ERR_404;

	// �t�@�C����ǂݍ���
	return TextFromFile(nID,pFile,(CharSetMode)nCharSets);
}

#endif	/*UNDER_CE*/



/*[EOF]*/
