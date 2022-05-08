/*===================================================================
CConvFactory�N���X
�e�L�X�g�̕ϊ��������\�ȃN���X�ł��B
===================================================================*/

#include "ConvFactory.h"
#include "TextConverter_Ansi.h"				/*ANSI��Unicode�R���o�[�^�[*/
#include "TextConverter_Japanese.h"			/*���{��p�R���o�[�^�[*/
#include "TextConverter_Unicode.h"			/*Unicode�p�R���o�[�^�[*/
#include "TextConverter_ISO8859.h"			/*ISO8859�p�R���o�[�^�[*/

#ifndef UNDER_CE
/*----------------------------------------------------------------
CConvFactory::CConvFactory
�R���X�g���N�^�ł��B
----------------------------------------------------------------*/
CConvFactory::CConvFactory(){
	CreateConverter(CSM_PLATFORM);
}
#endif	/*not defined UNDER_CE*/

/*----------------------------------------------------------------
CConvFactory::CConvFactory
�R���X�g���N�^�ł��B
----------------------------------------------------------------*/
CConvFactory::CConvFactory(CharSetMode nCharSet){
	CreateConverter(nCharSet);
}

/*----------------------------------------------------------------
CConvFactory::~CConvFactory
�f�X�g���N�^�ł��B
----------------------------------------------------------------*/
CConvFactory::~CConvFactory(){
	if (m_pConverter){
		delete m_pConverter;
		m_pConverter = NULL;
	}
}

/*----------------------------------------------------------------
CConvFactory::CreateConverter
�R���o�[�^�[���쐬����
----------------------------------------------------------------*/
void CConvFactory::CreateConverter(CharSetMode nCharSet){
	/*���݂̃L�����N�^�Z�b�g��ۑ����Ă���*/
	m_nCharSet = nCharSet;

	/*�R���o�[�^�[���쐬����*/
	switch(nCharSet){
#ifndef UNDER_CE
	case CSM_PLATFORM:
		m_pConverter = new CTextConverter_ANSI;
		break;
#endif	/*not defined UNDER_CE*/
	case CSM_SHIFT_JIS_2004:
		m_pConverter = new CTextConverter_ShiftJIS2004;
		break;
	case CSM_EUC_JIS_2004:
		m_pConverter = new CTextConverter_EucJis2004;
		break;
	case CSM_UTF8:
		m_pConverter = new CTextConverter_UTF8(false);
		break;
	case CSM_UTF8_BOM:
		m_pConverter = new CTextConverter_UTF8(true);
		break;
	case CSM_UTF16_LE:
		m_pConverter = new CTextConverter_UTF16LE(false);
		break;
	case CSM_UTF16_LE_BOM:
		m_pConverter = new CTextConverter_UTF16LE(true);
		break;
	case CSM_UTF16_BE:
		m_pConverter = new CTextConverter_UTF16BE(false);
		break;
	case CSM_UTF16_BE_BOM:
		m_pConverter = new CTextConverter_UTF16BE(true);
		break;
	case CSM_UTF32_LE:
		m_pConverter = new CTextConverter_UTF32LE(false);
		break;
	case CSM_UTF32_LE_BOM:
		m_pConverter = new CTextConverter_UTF32LE(true);
		break;
	case CSM_UTF32_BE:
		m_pConverter = new CTextConverter_UTF32BE(false);
		break;
	case CSM_UTF32_BE_BOM:
		m_pConverter = new CTextConverter_UTF32BE(true);
		break;
	case CSM_ISO8859_1:
		m_pConverter = new CTextConverter_ISO8859_Slide<0xA0,0xA0>;
		break;
	case CSM_ISO8859_2:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_2>;
		break;
	case CSM_ISO8859_3:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_3>;
		break;
	case CSM_ISO8859_4:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_4>;
		break;
	case CSM_ISO8859_5:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_5>;
		break;
	case CSM_ISO8859_6:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_6>;
		break;
	case CSM_ISO8859_7:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_7>;
		break;
	case CSM_ISO8859_8:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_8>;
		break;
	case CSM_ISO8859_9:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_9>;
		break;
	case CSM_ISO8859_10:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_10>;
		break;
	case CSM_ISO8859_11:
		m_pConverter = new CTextConverter_ISO8859_Slide<0xA1,0x0E01>;
		break;
	case CSM_ISO8859_13:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_13>;
		break;
	case CSM_ISO8859_14:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_14>;
		break;
	case CSM_ISO8859_15:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_15>;
		break;
	case CSM_ISO8859_16:
		m_pConverter = new CTextConverter_ISO8859_Table<CUnicodeTable_ISO8859_16>;
		break;
	default:
		m_pConverter = NULL;
		break;
	}
}

/*----------------------------------------------------------------
CConvFactory::GetCharset
�L�����N�^�Z�b�g���擾����
----------------------------------------------------------------*/
CharSetMode CConvFactory::GetCharset(){
	switch(m_nCharSet){
	case CSM_UTF8:
	case CSM_UTF8_BOM:
		if (((CTextConverter_Unicode*)GetConv())->IncludeBOM())
			return CSM_UTF8_BOM;
		else
			return CSM_UTF8;
	case CSM_UTF16_LE:
	case CSM_UTF16_LE_BOM:
		if (((CTextConverter_Unicode*)GetConv())->IncludeBOM())
			return CSM_UTF16_LE_BOM;
		else
			return CSM_UTF16_LE;
	case CSM_UTF16_BE:
	case CSM_UTF16_BE_BOM:
		if (((CTextConverter_Unicode*)GetConv())->IncludeBOM())
			return CSM_UTF16_BE_BOM;
		else
			return CSM_UTF16_BE;
	case CSM_UTF32_LE:
	case CSM_UTF32_LE_BOM:
		if (((CTextConverter_Unicode*)GetConv())->IncludeBOM())
			return CSM_UTF32_LE_BOM;
		else
			return CSM_UTF32_LE;
	case CSM_UTF32_BE:
	case CSM_UTF32_BE_BOM:
		if (((CTextConverter_Unicode*)GetConv())->IncludeBOM())
			return CSM_UTF32_BE_BOM;
		else
			return CSM_UTF32_BE;
	default:
		return m_nCharSet;
	}
}


/*[EOF]*/
