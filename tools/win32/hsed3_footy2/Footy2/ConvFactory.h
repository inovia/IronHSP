/*===================================================================
CConvFactory�N���X
�R���o�[�^�̃t�@�N�g���N���X
===================================================================*/

#pragma once

#include "TextConverter.h"					/*�e�L�X�g�R���o�[�^�[*/

class  CConvFactory
{
public:
#ifndef UNDER_CE
	CConvFactory();
#endif	/*not defined UNDER_CE*/
	CConvFactory(CharSetMode nCharSet);
	virtual ~CConvFactory();
	
	inline CTextConverter *GetConv(){return m_pConverter;}
	CharSetMode GetCharset();

private:
	void CreateConverter(CharSetMode nCharSet);

private:
	CTextConverter *m_pConverter;
	CharSetMode m_nCharSet;
};

/*[EOF]*/
