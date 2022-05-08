/*===================================================================
DllMetricsFunc.cpp
���l�̎擾�Ɋւ���֐����L�q���܂�
===================================================================*/

/*----------------------------------------------------------------
Footy2SetMetrics
���l�ݒ�
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetMetrics(int nID,int nObject,int nValue,bool bRefresh)
{
	// �錾
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	
	switch(nObject)
	{
	// for (int i=0;i<3;i++)��for (int i=0;i<4;i++)�ɏC�� by Tetr@pod
	case SM_MARK_VISIBLE:
		for (int i=0;i<4;i++)
		{
			pFooty->m_cView[i].SetMarkVisible(nValue);
		}
		break;
	case SM_LINENUM_WIDTH:
		for (int i=0;i<4;i++)
		{
			pFooty->m_cView[i].SetLineWidth(nValue);
		}
		break;
	case SM_RULER_HEIGHT:
		for (int i=0;i<4;i++)
		{
			pFooty->m_cView[i].SetRulerHeight(nValue);
		}
		break;
	case SM_UNDERLINE_VISIBLE:
		for (int i=0;i<4;i++)
		{
			pFooty->m_cView[i].SetUnderlineVisible(nValue);
		}
		break;
	case SM_MARGIN_HEIGHT:
		for (int i=0;i<4;i++)
		{
			pFooty->m_cView[i].SetMarginHeight(nValue);
		}
		break;
	case SM_TAB_WIDTH:
		pFooty->m_cDoc.SetTabLen(nValue);
		break;
	default:
		return FOOTY2ERR_ARGUMENT;
	}

	/*�ĕ`�悳����*/
	if (bRefresh)pFooty->m_cView[0].Refresh();
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2GetMetrics
���l�擾
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetMetrics(int nID,int nObject,int *pValue)
{
	// Footy���擾����
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (!pValue)return FOOTY2ERR_ARGUMENT;

	// �Ԃ�
	switch(nObject)
	{
	case SM_LAPEL_COLUMN:
		*pValue = (int)pFooty->m_cDoc.GetLapelColumn();
		break;
	case SM_LAPEL_MODE:
		*pValue = (int)pFooty->m_cDoc.GetLapelMode();
		break;
	case SM_MARK_VISIBLE:
		*pValue = pFooty->m_cView[0].GetMarkVisible();
		break;
	case SM_LINENUM_WIDTH:
		*pValue = pFooty->m_cView[0].GetLineCountWidth();
		break;
	case SM_RULER_HEIGHT:
		*pValue = pFooty->m_cView[0].GetRulerHeight();
		break;
	case SM_UNDERLINE_VISIBLE:
		*pValue = pFooty->m_cView[0].GetUnderlineVisible();
		break;
	case SM_TAB_WIDTH:
		*pValue = pFooty->m_cDoc.GetTabLen();
		break;
	case SM_REDOREM:
		*pValue = pFooty->m_cDoc.GetRedoRem();
		break;
	case SM_UNDOREM:
		*pValue = pFooty->m_cDoc.GetUndoRem();
		break;
	default:
		return FOOTY2ERR_ARGUMENT;
	}
	return FOOTY2ERR_NONE;
}

/*[EOF]*/
