/**
 * @file FootyViewKey.cpp
 * @brief ���̃t�@�C���ŃL�[�{�[�h���b�Z�[�W����̏������s���܂��B
 * @author Shinji Watanabe
 * @date Nov.08.2008
 */

#include "FootyView.h"
#include "KeyboardState.h"

//-----------------------------------------------------------------------------
/**
 * CFootyView::OnChar
 * @brief �������ł��ꂽ�Ƃ��A�h�L�������g���X�V���čĕ`�悷��
 * @param c ���͂��ꂽ�����ꕶ��
 * @note WM_CHAR����Ă΂�܂��B
 */
void CFootyView::OnChar(wchar_t c)
{
	// WM_IME_COMPOSITION�̕������A�L�����Z��
	if (m_nIgnoreKey > 0){
		m_nIgnoreKey -= sizeof(wchar_t);
		return;
	}

	// �����ȕ����񂩃`�F�b�N
	if ((0x20 <= c && c <= 0x7e) ||
		(0xa1 <= c && c <= 0xdf)){

		// �ꕶ���}�����郋�[�`�����Ăяo��
		CFootyDoc::RedrawType nNeedRedraw = m_pDocuments->InsertChar(c);

		// �L�����b�g�ʒu����\���ʒu��ݒ�
		size_t nBeforeFirstVisibleColumn = m_nFirstVisibleColumn;
		CEthicLine cBeforeFirstVisibleLine = *m_pDocuments->GetFirstVisible(m_nViewID);

		AdjustVisibleLine();
		AdjustVisiblePos();

		// �t���O�𒲐�����
		if (nBeforeFirstVisibleColumn != m_nFirstVisibleColumn ||
			*m_pDocuments->GetFirstVisible(m_nViewID) != cBeforeFirstVisibleLine)
			nNeedRedraw = CFootyDoc::REDRAW_ALL;

		// �ĕ`��
		if (nNeedRedraw == CFootyDoc::REDRAW_ALL)
			Refresh();
		else
			LineChangedRefresh();

		// �C�x���g��ʒm����
		m_pDocuments->SendTextModified(MODIFIED_CAUSE_CHAR);
	}
	
}

//-----------------------------------------------------------------------------
/**
 * CFootyView::OnImeComposition
 * @brief IME�̃��b�Z�[�W�������Ă����Ƃ��̏���
 * @param lParam ���b�Z�[�W��LPARAM�����̂܂܈����p��
 */
void CFootyView::OnImeComposition(LPARAM lParam)
{
	if (lParam & GCS_RESULTSTR) 										// �ϊ���₪�m�肳�ꂽ�Ƃ�
	{
		// �錾
		unsigned long dwSize;											// IME�̕ϊ������񒷂�
		HIMC hImc = ImmGetContext(m_hWnd);								// IME�̃n���h��
		
		// IME�ϊ���������擾����
		if (!hImc)return;
		dwSize = ImmGetCompositionStringW(hImc,GCS_RESULTSTR,NULL,0);	// �m�蕶����̒������擾
		std::wstring strImeString;
		strImeString.resize(dwSize/sizeof(wchar_t));
		ImmGetCompositionStringW(hImc,GCS_RESULTSTR,(LPVOID)strImeString.c_str(),dwSize);
		
		// �擾�����������}������
		CFootyDoc::RedrawType nNeedRedraw = m_pDocuments->InsertString(strImeString.c_str(),true,true);

		// �L�����Z���ʂ���
		m_nIgnoreKey += dwSize;											// OnChar�ŃL�����Z�������

		// �L�����b�g�ʒu����\���ʒu��ݒ�
		size_t nBeforeFirstVisibleColumn = m_nFirstVisibleColumn;
		CEthicLine cBeforeFirstVisibleLine = *m_pDocuments->GetFirstVisible(m_nViewID);

		AdjustVisibleLine();
		AdjustVisiblePos();

		// �t���O�𒲐�����
		if (nBeforeFirstVisibleColumn != m_nFirstVisibleColumn ||
			*m_pDocuments->GetFirstVisible(m_nViewID) != cBeforeFirstVisibleLine)
			nNeedRedraw = CFootyDoc::REDRAW_ALL;

		// �ĕ`��
		if (nNeedRedraw == CFootyDoc::REDRAW_ALL)
			Refresh();
		else
			LineChangedRefresh();

		// �C�x���g��ʒm����
		m_pDocuments->SendTextModified(MODIFIED_CAUSE_IME);
	}
}

//-----------------------------------------------------------------------------
/**
 * @brief IME���N�G�X�g���������Ƃ��̏���
 * @param wParam ���b�Z�[�W��WPARAM�������p��
 * @param lParam ���b�Z�[�W��LPARAM�������p��
 * @return ���b�Z�[�W���Ԃ��ׂ�LRESULT�l
 */
LRESULT CFootyView::OnImeRequest(WPARAM wParam,LPARAM lParam)
{
	LRESULT lReturn = false;
	static int nTextLength = 0;
	if (wParam == IMR_RECONVERTSTRING && m_pDocuments->IsSelecting()){		// �ĕϊ��v��
		RECONVERTSTRING* pReConvStr = (RECONVERTSTRING*)lParam;
		std::wstring wstrSelText;
		m_pDocuments->GetSelText(&wstrSelText);
		if (!pReConvStr){													// ����Ăяo��
			nTextLength = WideCharToMultiByte(CP_ACP,0,wstrSelText.c_str(),
				-1,NULL,0,NULL,NULL) - 1;									// NULL�����o�b�t�@���܂ނ̂ň���
		}
		else{																// ���ڂ̌Ăяo��
			// RECONVERTSTRING�\���̂𖄂߂�
			LPSTR lpsz = (LPSTR)pReConvStr + sizeof(RECONVERTSTRING);
			WideCharToMultiByte(CP_ACP,0,wstrSelText.c_str(),
				-1,lpsz,nTextLength,NULL,NULL);
			pReConvStr->dwStrLen = nTextLength;
			pReConvStr->dwStrOffset = sizeof(RECONVERTSTRING);
			pReConvStr->dwTargetStrOffset = 0;
			pReConvStr->dwTargetStrLen = nTextLength;
			pReConvStr->dwCompStrOffset = 0;
			pReConvStr->dwCompStrLen = nTextLength;
		}
		lReturn = sizeof(RECONVERTSTRING) + nTextLength;
	}
	return lReturn;
}



#define START_MOVEKEY	nNeedRedraw = CFootyDoc::REDRAW_CURMOVE;			\
						if (cKeyStates.IsShiftPushed()){					\
							if (!m_pDocuments->IsSelecting())				\
								m_pDocuments->SetSelectStart();				\
						}													\
						else{												\
							if (m_pDocuments->IsSelecting()){				\
								m_pDocuments->UnSelect();					\
								nNeedRedraw = CFootyDoc::REDRAW_ALL;		\
							}												\
						}

#define END_MOVEKEY		if (cKeyStates.IsShiftPushed()){					\
							m_pDocuments->SetSelectEndNormal();				\
							nNeedRedraw = CFootyDoc::REDRAW_SELCHANGED;		\
						}													\
						m_pDocuments->SendMoveCaretCallBack();

	

//-----------------------------------------------------------------------------
/**
 * @brief �L�[�������ꂽ�Ƃ��ɌĂ΂�܂��B
 * @param nKeyCode ���b�Z�[�W����Ăяo���ꂽ�Ƃ��̃L�[�R�[�h������܂�
 * @return ���̊֐����������s���Ƃ��ɂ�true���A�����łȂ��Ƃ���false���Ԃ�܂�
 */
bool CFootyView::OnKeyDown(int nKeyCode)
{
	// �錾
	size_t i;
	bool bDontAdjustLine = false;
	CFootyDoc::RedrawType nNeedRedraw = CFootyDoc::REDRAW_FAILED;
	CFootyLine::EthicInfo stEthicInfo;
	size_t nPosition;
	CKeyBoardState cKeyStates(m_bShiftLocked);
	LinePt pLineBefore = m_pDocuments->GetCaretPosition()->GetLinePointer();
	size_t nPosBefore = m_pDocuments->GetCaretPosition()->GetPosition();
	size_t nBeforeFirstVisibleColumn = m_nFirstVisibleColumn;
	CEthicLine cBeforeFirstVisibleLine = *m_pDocuments->GetFirstVisible(m_nViewID);
	
	// �L�[�ɂ���ďꍇ�킯
	switch(nKeyCode)
	{

//��̃L�[
	case VK_UP:
		if (cKeyStates.IsControlPushed()){
			m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack(1);
			bDontAdjustLine = true;
		}
		else
		{
			START_MOVEKEY
			// �\���ʒu���X�V����
			if (*m_pDocuments->GetFirstVisible(m_nViewID) == *m_pDocuments->GetCaretPosition())
			{
				stEthicInfo = m_pDocuments->GetCaretPosition()->GetLinePointer()->CalcEthicLine
					(m_pDocuments->GetCaretPosition()->GetPosition(),m_pDocuments->GetLapelColumn(),
					m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
				m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack(1);
			}
			// �L�����b�g���ړ�������
			m_pDocuments->GetCaretPosition()->MoveLineBackwardEthic(m_pDocuments->GetLineList(),1,
				m_pDocuments->GetLapelColumn(),
				m_pDocuments->GetTabLen(),
				m_pDocuments->GetLapelMode());
			END_MOVEKEY
				if (m_ImgCtr->IsLoaded()){
					nNeedRedraw = CFootyDoc::REDRAW_ALL;// �w�i�摜���ǂ܂�Ă���ꍇ�́A�c�����c��ׂ��ׂčĕ`�悷��
				}
		}
		break;

//���̃L�[
	case VK_DOWN:
		if (cKeyStates.IsControlPushed()){
			m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),1);
			bDontAdjustLine = true;
		}
		else{
			START_MOVEKEY
			// �L�����b�g���ړ�������
			m_pDocuments->GetCaretPosition()->MoveLineForwardEthic(m_pDocuments->GetLineList(),1,
				m_pDocuments->GetLapelColumn(),
				m_pDocuments->GetTabLen(),
				m_pDocuments->GetLapelMode());
			// �\���ʒu���X�V����
			stEthicInfo = m_pDocuments->GetCaretPosition()->GetLinePointer()->CalcEthicLine
				(m_pDocuments->GetCaretPosition()->GetPosition(),m_pDocuments->GetLapelColumn(),
				m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
			if (m_pDocuments->GetFirstVisible(m_nViewID)->GetLinePointer()->GetOffset() + 
				m_pDocuments->GetFirstVisible(m_nViewID)->GetEthicNum() + m_nVisibleLines ==
				m_pDocuments->GetCaretPosition()->GetLinePointer()->GetOffset() + stEthicInfo.m_nEthicLine + 1)
				m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),1);
			END_MOVEKEY
				if (m_ImgCtr->IsLoaded()){
					nNeedRedraw = CFootyDoc::REDRAW_ALL;// �w�i�摜���ǂ܂�Ă���ꍇ�́A�c�����c��ׂ��ׂčĕ`�悷��
				}
		}
		break;

//�E�̃L�[
	case VK_RIGHT:
		START_MOVEKEY
		// �ʒu���ړ�������
		if (cKeyStates.IsControlPushed())
			m_pDocuments->MoveWordForward();
		else{
			// �T���Q�[�g�y�A���ǂ����`�F�b�N����
			CEditPosition *pCaretPos = m_pDocuments->GetCaretPosition();
			if (CFootyLine::IsSurrogateLead(pCaretPos->GetLinePointer()->GetLineData()[pCaretPos->GetPosition()]))
				pCaretPos->MoveColumnForward(m_pDocuments->GetLineList(),2);
			else
				pCaretPos->MoveColumnForward(m_pDocuments->GetLineList(),1);
		}
		// �\���ʒu���X�V����
		stEthicInfo = m_pDocuments->GetCaretPosition()->GetLinePointer()->CalcEthicLine
			(m_pDocuments->GetCaretPosition()->GetPosition(),m_pDocuments->GetLapelColumn(),
			m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
		if (stEthicInfo.m_nEthicColumn == m_nFirstVisibleColumn + m_nVisibleColumns)
			m_nFirstVisibleColumn ++;
		if (m_pDocuments->GetFirstVisible(m_nViewID)->GetLinePointer()->GetOffset() + 
			m_pDocuments->GetFirstVisible(m_nViewID)->GetEthicNum() + m_nVisibleLines ==
			m_pDocuments->GetCaretPosition()->GetLinePointer()->GetOffset() + stEthicInfo.m_nEthicLine + 1)
			m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),1);
		END_MOVEKEY
		if (m_ImgCtr->IsLoaded()){
			nNeedRedraw = CFootyDoc::REDRAW_ALL;// �w�i�摜���ǂ܂�Ă���ꍇ�́A�c�����c��ׂ��ׂčĕ`�悷��
		}
		break;

//���̃L�[
	case VK_LEFT:
		START_MOVEKEY
		// �\���ʒu���X�V����
		stEthicInfo = m_pDocuments->GetCaretPosition()->GetLinePointer()->CalcEthicLine
			(m_pDocuments->GetCaretPosition()->GetPosition(),m_pDocuments->GetLapelColumn(),
			m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
		if (stEthicInfo.m_nEthicColumn != 0 &&
			stEthicInfo.m_nEthicColumn == m_nFirstVisibleColumn)
			m_nFirstVisibleColumn --;
		// �ʒu���ړ�������
		if (cKeyStates.IsControlPushed())
			m_pDocuments->MoveWordBack();
		else{
			// �T���Q�[�g�y�A���ǂ����`�F�b�N����
			CEditPosition *pCaretPos = m_pDocuments->GetCaretPosition();
			if (CFootyLine::IsSurrogateTail(pCaretPos->GetLinePointer()->GetLineData()[pCaretPos->GetPosition()-1]))
				pCaretPos->MoveColumnBackward(m_pDocuments->GetLineList(),2);
			else
				pCaretPos->MoveColumnBackward(m_pDocuments->GetLineList(),1);
		}
		END_MOVEKEY
		if (m_ImgCtr->IsLoaded()){
			nNeedRedraw = CFootyDoc::REDRAW_ALL;// �w�i�摜���ǂ܂�Ă���ꍇ�́A�c�����c��ׂ��ׂčĕ`�悷��
		}
		break;

//�y�[�W�_�E���L�[
	case VK_NEXT:
		START_MOVEKEY
		// �\���ʒu���X�V����
		m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),m_nVisibleLines);
		// �J�[�\�����ړ�����
		for (i=0;i<m_nVisibleLines;i++){
			m_pDocuments->GetCaretPosition()->MoveLineForwardEthic(m_pDocuments->GetLineList(),1,
				m_pDocuments->GetLapelColumn(),
				m_pDocuments->GetTabLen(),
				m_pDocuments->GetLapelMode());
		}
		END_MOVEKEY
		nNeedRedraw = CFootyDoc::REDRAW_ALL;
		break;

//�y�[�W�A�b�v�L�[
	case VK_PRIOR:
		START_MOVEKEY
		// �\���ʒu���X�V����
		m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack(m_nVisibleLines);
		// �J�[�\�����ړ�����
		for (i=0;i<m_nVisibleLines;i++){
			m_pDocuments->GetCaretPosition()->MoveLineBackwardEthic(m_pDocuments->GetLineList(),1,
				m_pDocuments->GetLapelColumn(),
				m_pDocuments->GetTabLen(),
				m_pDocuments->GetLapelMode());
		}
		END_MOVEKEY
		nNeedRedraw = CFootyDoc::REDRAW_ALL;
		break;

//Home�L�[�������ꂽ�Ƃ�
	case VK_HOME:
		START_MOVEKEY
		if (cKeyStates.IsControlPushed())	// Ctrl�L�[�����Ă���̂ōŏ���
		{
			m_pDocuments->GetCaretPosition()->SetPosition(m_pDocuments->GetLineList(), 0, 0 );
		}
		else								// Ctrl�L�[�������Ă��Ȃ�
		{
			stEthicInfo = pLineBefore->CalcEthicLine( nPosBefore, m_pDocuments->GetLapelColumn(), m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode() );

			if ( m_bAutoIndentMode && stEthicInfo.m_nEthicLine == 0)
			{
				size_t nIndentPos = pLineBefore->CalcAutoIndentPos( pLineBefore->GetLineLength() );
				if ( nIndentPos == nPosBefore )
				{
					nPosition = 0;
				}
				else
				{
					nPosition = nIndentPos;
				}
			}
			else
			{
				nPosition = pLineBefore->CalcRealPosition(stEthicInfo.m_nEthicLine,0,m_pDocuments->GetLapelColumn(), m_pDocuments->GetTabLen(), m_pDocuments->GetLapelMode() );
			}

			m_pDocuments->GetCaretPosition()->SetPosition( pLineBefore, nPosition);
		}
		END_MOVEKEY
		break;

//End�L�[�������ꂽ�Ƃ�
	case VK_END:
		START_MOVEKEY
		if (cKeyStates.IsControlPushed())	// Ctrl�L�[�������Ă���̂ōŌ��
		{
			LinePt pLastLine = m_pDocuments->GetLastLine();
			m_pDocuments->GetCaretPosition()->SetPosition( pLastLine, pLastLine->GetLineLength() );
		}
		else								// Ctrl�L�[�������Ă��Ȃ�
		{
			stEthicInfo = pLineBefore->CalcEthicLine( nPosBefore, m_pDocuments->GetLapelColumn(), m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode() );
			nPosition = pLineBefore->CalcRealPosition( stEthicInfo.m_nEthicLine, m_pDocuments->GetLapelColumn(), m_pDocuments->GetLapelColumn(), m_pDocuments->GetTabLen(), m_pDocuments->GetLapelMode() );
			m_pDocuments->GetCaretPosition()->SetPosition( pLineBefore, nPosition );
		}
		END_MOVEKEY
		break;

//�^�u�L�[
	case VK_TAB:
		if (m_pDocuments->IsSelecting() &&
			m_pDocuments->GetSelStart()->GetLinePointer() != 
			m_pDocuments->GetSelEnd()->GetLinePointer()){
			if (cKeyStates.IsShiftPushed())
				m_pDocuments->Unindent();
			else
				m_pDocuments->Indent();
			nNeedRedraw = CFootyDoc::REDRAW_ALL;
		}
		else{
			nNeedRedraw = m_pDocuments->InsertChar(L'\t');
			m_pDocuments->SendTextModified(MODIFIED_CAUSE_TAB);
		}
		
		break;

//�o�b�N�X�y�[�X
	case VK_BACK:
		nNeedRedraw = m_pDocuments->OnBackSpace();
		m_pDocuments->SendTextModified(MODIFIED_CAUSE_BACKSPACE);		
		break;

//Del�L�[
	case VK_DELETE:
		nNeedRedraw = m_pDocuments->OnDelete();
		m_pDocuments->SendTextModified(MODIFIED_CAUSE_DELETE);
		break;

//Insert�L�[
	case VK_INSERT:
		/*�L�����b�g�͕ς��邪�ĕ`��͂��Ȃ�*/
		m_pDocuments->SetInsertMode(!m_pDocuments->IsInsertMode());
		CaretMove();
		break;

//Enter�L�[�������ꂽ�Ƃ�
	case VK_RETURN:
		if (cKeyStates.IsControlPushed())
		{
			if (cKeyStates.IsShiftPushed())
			{
				m_pDocuments->InsertReturnDown( m_bAutoIndentMode );
			}
			else
			{
				m_pDocuments->InsertReturnUp( m_bAutoIndentMode );
			}
		}
		else m_pDocuments->InsertReturn( m_bAutoIndentMode );
		// �\���ʒu���X�V����
		if (m_pDocuments->GetFirstVisible(m_nViewID)->GetLinePointer()->GetOffset() + m_nVisibleLines ==
			m_pDocuments->GetCaretPosition()->GetLinePointer()->GetOffset())
			m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),1);
		nNeedRedraw = CFootyDoc::REDRAW_ALL;
		// �C�x���g�̒ʒm
		m_pDocuments->SendTextModified(MODIFIED_CAUSE_ENTER);		
		break;

// ESC�L�[�őI�����L�����Z�����܂�
	case VK_ESCAPE:
		m_pDocuments->UnSelect();
		break;

//����ȊO�̂Ƃ�
	default:
		return false;
	}

	// �L�����b�g�ʒu�̍ŏI����
	if (!bDontAdjustLine)AdjustVisibleLine();
	AdjustVisiblePos();

	// �ĕ`��t���O�𐮗�
	if (nNeedRedraw != CFootyDoc::REDRAW_ALL){
		if (nBeforeFirstVisibleColumn != m_nFirstVisibleColumn)
			nNeedRedraw = CFootyDoc::REDRAW_ALL;
		else if (*m_pDocuments->GetFirstVisible(m_nViewID) != cBeforeFirstVisibleLine){
			if (nNeedRedraw == CFootyDoc::REDRAW_CURMOVE)
				nNeedRedraw = CFootyDoc::REDRAW_SCROLLED;
			else
				nNeedRedraw = CFootyDoc::REDRAW_ALL;
		}
	}

	// �ĕ`�揈��
	switch(nNeedRedraw){
	case CFootyDoc::REDRAW_SCROLLED:		// �X�N���[�����ꂽ
		ScrollRefresh();
		FOOTY2_PRINTF( L"Scroll redraw\n" );
		break;
	case CFootyDoc::REDRAW_CURMOVE:			// �L�����b�g�ړ��̂�
		CaretRefresh();
		FOOTY2_PRINTF( L"cursor redraw\n" );
		break;
	case CFootyDoc::REDRAW_SELCHANGED:
		LineChangedRefresh(pLineBefore, m_pDocuments->GetCaretPosition()->GetLinePointer());
		FOOTY2_PRINTF( L"sel redraw\n" );
		break;
	case CFootyDoc::REDRAW_LINE:			// ��s�̂ݍĕ`��
		LineChangedRefresh();
		FOOTY2_PRINTF( L"line redraw\n" );
		break;
	case CFootyDoc::REDRAW_ALL:				// ���S�ĕ`��
		Refresh();
		FOOTY2_PRINTF( L"all redraw\n" );
		break;
	}

	return true;
}

/*[EOF]*/
