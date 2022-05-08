/*===================================================================
DllCaretFunc.cpp
�L�����b�g�֘A�̏������s���܂�
===================================================================*/

/*----------------------------------------------------------------
Footy2GetCaretPosition
�L�����b�g�ʒu���擾���܂�
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetCaretPosition(int nID,size_t *pCaretLine,size_t *pCaretPos){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;

	/*�L�����b�g�̈ʒu���擾*/
	CEditPosition *pPosition = pFooty->m_cDoc.GetCaretPosition();
	if (pCaretLine)
		*pCaretLine = pPosition->GetLineNum();
	if (pCaretPos)
		*pCaretPos = pPosition->GetPosition();
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2SetCaretPosition
�L�����b�g�ʒu��ύX���܂�
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetCaretPosition(int nID,size_t nCaretLine,size_t nCaretPos,bool bRefresh){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;

	/*�L�����b�g�ʒu���X�V*/
	CEditPosition *pPosition = pFooty->m_cDoc.GetCaretPosition();
	if (!pPosition->SetPosition(pFooty->m_cDoc.GetLineList(),nCaretLine,nCaretPos))
		return FOOTY2ERR_ARGUMENT;
	else{
		pFooty->m_cDoc.UnSelect();
		pFooty->m_cDoc.SendMoveCaretCallBack();
		if (bRefresh){
			pFooty->m_cView[0].AdjustVisiblePos();
			pFooty->m_cView[0].AdjustVisibleLine();
			pFooty->m_cView[0].Refresh();
		}
		return FOOTY2ERR_NONE;
	}
}

/**
 * Footy2GetSel
 * @brief �I���̊J�n�ʒu���擾����
 * @param nID Footy��ID
 * @param pStartLine [out]�I���J�n�s
 * @param pStartPos [out]�I���J�n��
 * @param pEndLine [out]�I���I���s
 * @param pEndPos [out]�I���I����
 */
FOOTYEXPORT(int) Footy2GetSel(int nID,size_t *pStartLine,size_t *pStartPos,size_t *pEndLine,size_t *pEndPos){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�I���ʒu���擾����*/
	if (pFooty->m_cDoc.IsSelecting()){
		CEditPosition *pStart = pFooty->m_cDoc.GetSelStart();
		CEditPosition *pEnd = pFooty->m_cDoc.GetSelEnd();
		/*�|�C���^�ɕԂ�*/
		if (pStartLine)
			*pStartLine = pStart->GetLineNum();
		if (pStartPos)
			*pStartPos = pStart->GetPosition();
		if (pEndLine)
			*pEndLine = pEnd->GetLineNum();
		if (pEndPos)
			*pEndPos = pEnd->GetPosition();
		/*����ɏI������*/
		return FOOTY2ERR_NONE;
	}
	else
		return FOOTY2ERR_NOTSELECTED;
}

/*----------------------------------------------------------------
Footy2SetSel
�I�����J�n������
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetSel(int nID,size_t nStartLine,size_t nStartPos,size_t nEndLine,size_t nEndPos,bool bRefresh){
	/*���l�����������ǂ����`�F�b�N����*/
	if (nStartLine > nEndLine)return FOOTY2ERR_ARGUMENT;
	else if (nStartLine == nEndLine){
		if (nStartPos > nEndPos)return FOOTY2ERR_ARGUMENT;
	}
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	
	/*�I������*/
	CEditPosition cSelStart,cSelEnd;
	if (!cSelStart.SetPosition(pFooty->m_cDoc.GetLineList(),nStartLine,nStartPos) ||
		!cSelEnd.SetPosition(pFooty->m_cDoc.GetLineList(),nEndLine,nEndPos) ||
		!pFooty->m_cDoc.SetSelectStart(&cSelStart) ||
		!pFooty->m_cDoc.SetSelectEndNormal(&cSelEnd))
		return FOOTY2ERR_ARGUMENT;
	*pFooty->m_cDoc.GetCaretPosition() = cSelEnd;
	
	/*�ĕ`��*/
	if (bRefresh){
		pFooty->m_cView[0].AdjustVisiblePos();
		pFooty->m_cView[0].AdjustVisibleLine();
		pFooty->m_cView[0].Refresh();
	}
	
	/*�֐�������ɏI������*/
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2ResetSel
�I���������������� by inovia
----------------------------------------------------------------*/
//FOOTYEXPORT(int) Footy2ResetSel(int nID,bool bRefresh){
//	/*Footy���擾����*/
//	CFooty *pFooty = GetFooty(nID);
//	if (!pFooty)return FOOTY2ERR_NOID;
//	
//	/*�I������*/
//	CEditPosition cSelStart,cSelEnd;
//	if (!cSelStart.SetPosition(pFooty->m_cDoc.GetLineList(),nStartLine,nStartPos) ||
//		!cSelEnd.SetPosition(pFooty->m_cDoc.GetLineList(),nEndLine,nEndPos) ||
//		!pFooty->m_cDoc.SetSelectStart(&cSelStart) ||
//		!pFooty->m_cDoc.SetSelectEndNormal(&cSelEnd))
//		return FOOTY2ERR_ARGUMENT;
//	*pFooty->m_cDoc.GetCaretPosition() = cSelEnd;
//	
//	/*�ĕ`��*/
//	if (bRefresh){
//		pFooty->m_cView[0].AdjustVisiblePos();
//		pFooty->m_cView[0].AdjustVisibleLine();
//		pFooty->m_cView[0].Refresh();
//		pFooty->m_cView[0].Refresh();
//	}
//	
//	/*�֐�������ɏI������*/
//	return FOOTY2ERR_NONE;
//}

/*----------------------------------------------------------------
Footy2SetUnderlineDraw
�t�H�[�J�X����Ă��Ȃ��Ƃ��ɃA���_�[�o�[��`�悷�邩�ǂ����H by inovia
�f�t�H���g: false
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetUnderlineDraw(int nID, bool bFlag){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	/*�G���[�`�F�b�N*/
	if (!pFooty)return FOOTY2ERR_NOID;
	pFooty->m_cView[0].SetUnderlineDraw(bFlag);
	pFooty->m_cView[1].SetUnderlineDraw(bFlag);
	pFooty->m_cView[2].SetUnderlineDraw(bFlag);
	pFooty->m_cView[3].SetUnderlineDraw(bFlag);
	return FOOTY2ERR_NONE;
}

/*[EOF]*/