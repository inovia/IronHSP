/*===================================================================
DllMetricsFunc.cpp
���l�̎擾�Ɋւ���֐����L�q���܂�
===================================================================*/

/*----------------------------------------------------------------
Footy2SetFuncFocus
�t�H�[�J�X�𓾂��Ƃ��̊֐�
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetFuncFocus(int nID,Footy2FuncFocus pFunc,void *pData){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�֐��ݒ�*/
	for (int i=0;i<4;i++){
		pFooty->m_cView[i].m_pFuncFocus = pFunc;
		pFooty->m_cView[i].m_pDataFocus = pData;
	}
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2SetFuncMoveCaret
�L�����b�g���ړ����ꂽ�Ƃ��̃C�x���g
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetFuncMoveCaret(int nID,Footy2FuncMoveCaret pFunc,void *pData){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�֐��ݒ�*/
	pFooty->m_cDoc.m_pFuncMoveCaret = pFunc;
	pFooty->m_cDoc.m_pDataMoveCaret = pData;
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2SetFuncTextModified
�e�L�X�g���ҏW���ꂽ�Ƃ��̃C�x���g
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetFuncTextModified(int nID,Footy2FuncTextModified pFunc,void *pData){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�֐��ݒ�*/
	pFooty->m_cDoc.m_pFuncTextModified = pFunc;
	pFooty->m_cDoc.m_pDataTextModified = pData;
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2SetFuncTextModified
�e�L�X�g���ҏW���ꂽ�Ƃ��̃C�x���g
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetFuncInsertModeChanged(int nID,Footy2FuncInsertModeChanged pFunc,void *pData){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�֐��ݒ�*/
	pFooty->m_cDoc.m_pFuncInsertMode = pFunc;
	pFooty->m_cDoc.m_pDataInsertModeChanged = pData;
	return FOOTY2ERR_NONE;
}

/*[EOF]*/
