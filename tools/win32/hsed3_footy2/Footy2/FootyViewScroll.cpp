/**
 * @file FootyViewScroll
 * @brief Footy�̃r���[�Ǘ����s���܂��B���̃t�@�C���ŃX�N���[���֌W�̏������s���܂��B
 * @author Shinji Watanabe
 * @version 1.0
 */

#include "FootyView.h"

/**
 * CFootyView::SetBars
 * @brief �X�N���[���o�[�����݂̃����o�ϐ��p�����[�^�ɏ]���Đݒ肵�܂��B
 */
void CFootyView::SetBars(){
	/*�錾*/
	size_t nEthicLines;
	LinePt pLastLine = m_pDocuments->GetLastLine();
	
	/*�\���ł���ʂ��v�Z����*/
	nEthicLines = pLastLine->GetOffset();
	nEthicLines += pLastLine->GetEthicLine();
	
	/*�����X�N���[���o�[*/
	m_vInfo.cbSize = sizeof(SCROLLINFO);
	m_vInfo.fMask = SIF_ALL;
	if (nEthicLines == 1)		/*��s�̂Ƃ��́A�\���s���{�P�̒l*/
		m_vInfo.nMax = (int)m_nVisibleLines;
	else						/*����ȊO�̂Ƃ��́A�ŉ��s����ԏ�ɂ����悤��*/
		m_vInfo.nMax = (int)(m_nVisibleLines + nEthicLines - 2);
	m_vInfo.nMin=0;
	m_vInfo.nPage = (unsigned)m_nVisibleLines;
	m_vInfo.nPos = (int)(m_pDocuments->GetFirstVisible(m_nViewID)->
		GetLinePointer()->GetOffset() +
		m_pDocuments->GetFirstVisible(m_nViewID)->GetEthicNum());
	m_vInfo.nTrackPos = 0;
	SetScrollInfo(m_hWnd,SB_VERT,&m_vInfo,true);

	if (m_nVisibleColumns <= m_pDocuments->GetLapelColumn()){
		/*�����X�N���[���o�[��\������*/
		m_hInfo.cbSize=sizeof(SCROLLINFO);
		m_hInfo.fMask=SIF_ALL;
		m_hInfo.nMax = (int)(m_pDocuments->GetLapelColumn() + m_nVisibleColumns - 2);
		m_hInfo.nMin = 0;
		m_hInfo.nPage = (int)m_nVisibleColumns;
		m_hInfo.nPos = (int)m_nFirstVisibleColumn;
		m_hInfo.nTrackPos = 0;
		SetScrollInfo(m_hWnd,SB_HORZ,&m_hInfo,true);
	}
	else{
		/*�����X�N���[���o�[�͔�\����*/
		m_hInfo.cbSize=sizeof(SCROLLINFO);
		m_hInfo.fMask=SIF_ALL;
		m_hInfo.nMax=0;
		m_hInfo.nMin=0;
		m_hInfo.nPage=0;
		m_hInfo.nPos=0;
		m_hInfo.nTrackPos=0;
		SetScrollInfo(m_hWnd,SB_HORZ,&m_hInfo,true);
	}
}

// ���̕ӂ�������
int g_dy;
/**
 * CFootyView::OnVScroll
 * @brief �����X�N���[���o�[�����삳�ꂽ�Ƃ��ɌĂ΂�܂��B
 * @param wParam �E�B���h�E���b�Z�[�W��WPARAM�������p���܂�
 */

/*
void CFootyView::OnVScroll(WPARAM wParam){
	int dy;                   // �X�N���[����
	SCROLLINFO sbInfo;

	switch (LOWORD(wParam)) {
	case SB_LINEUP:
		g_dy = -1; 
		return;                // �O�p�{�^����
	case SB_LINEDOWN:
		g_dy = 1;
		return;                // �O�p�{�^����
	case SB_PAGEUP:           // ���傱���ƊԂ����
		g_dy = -1*m_vInfo.nPage;
		return;
	case SB_PAGEDOWN:         // ���傱���ƊԂ�����
		g_dy = m_vInfo.nPage;
		return;
	case SB_THUMBPOSITION:    // �X�N���[�������肮�蓮����
	case SB_THUMBTRACK:       // �X�N���[�������肮�蓮����
		ZeroMemory(&sbInfo, sizeof(SCROLLINFO));
		sbInfo.cbSize = sizeof(SCROLLINFO);
		sbInfo.fMask = SIF_TRACKPOS;
		GetScrollInfo(m_hWnd,SB_VERT,&sbInfo);
		g_dy = sbInfo.nTrackPos - m_vInfo.nPos;
		return;
	case SB_ENDSCROLL:
		dy = g_dy;
		break;
    default:
		return;
    }

	// �ŏ��ɕ\������Ă���s���ړ�������
	if (dy < 0)m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack(-dy);
	else m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),dy);

	// �ĕ`�悳����
	ScrollRefresh();
}
*/
void CFootyView::OnVScroll(WPARAM wParam){
	/*�錾*/
	int dy;                   // �X�N���[����
	SCROLLINFO sbInfo;

	switch (LOWORD(wParam)) {
	case SB_LINEUP:
		dy = -1; 
		break;                // �O�p�{�^����
	case SB_LINEDOWN:
		dy = 1;
		break;                // �O�p�{�^����
	case SB_PAGEUP:           // ���傱���ƊԂ����
		dy = -1*m_vInfo.nPage;
		break;
	case SB_PAGEDOWN:         // ���傱���ƊԂ�����
		dy = m_vInfo.nPage;
		break;
	case SB_THUMBPOSITION:    // �X�N���[�������肮�蓮����
	case SB_THUMBTRACK:       // �X�N���[�������肮�蓮����
		ZeroMemory(&sbInfo, sizeof(SCROLLINFO));
		sbInfo.cbSize = sizeof(SCROLLINFO);
		sbInfo.fMask = SIF_TRACKPOS;
		GetScrollInfo(m_hWnd,SB_VERT,&sbInfo);
		dy = sbInfo.nTrackPos - m_vInfo.nPos;
		break;
    default:
		return;
    }

	// �ŏ��ɕ\������Ă���s���ړ�������
	if (dy < 0)m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack(-dy);
	else m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),dy);

	// �ĕ`�悳����
	if (m_ImgCtr->IsLoaded()){
		Refresh();// �w�i�摜���ǂ܂�Ă���ꍇ�́A�c�����c��ׂ��ׂčĕ`�悷��
	}else{
		ScrollRefresh();
	}
}

/**
 * CFootyView::OnHScroll
 * @brief �����X�N���[�����������ꂽ�Ƃ��̏���
 * @param wParam �E�B���h�E���b�Z�[�W�̒l�������p��
 */
void CFootyView::OnHScroll(WPARAM wParam){
	int dx;                   /*�X�N���[����*/

	switch (LOWORD(wParam)) {
	case SB_LINEUP:
		dx=-1; 
		break;                /*�O�p�{�^����*/
	case SB_LINEDOWN:
		dx=1;
		break;                /*�O�p�{�^����*/
	case SB_PAGEUP:           /*���傱���ƊԂ����*/
		dx = -1 * m_hInfo.nPage;
		break;
	case SB_PAGEDOWN:         /*���傱���ƊԂ�����*/
		dx = m_hInfo.nPage;
		break;
	case SB_THUMBPOSITION:    /*�X�N���[�������肮�蓮����*/
	case SB_THUMBTRACK:       /*�X�N���[�������肮�蓮����*/
		dx = HIWORD(wParam) - m_hInfo.nPos;
		break;
    default:
		return;
    }

	m_nFirstVisibleColumn += dx;
	if (m_nFirstVisibleColumn < 0)m_nFirstVisibleColumn = 0;
	if (m_nFirstVisibleColumn > (int)m_pDocuments->GetLapelColumn())
		m_nFirstVisibleColumn = (int)m_pDocuments->GetLapelColumn();
	
	Refresh();
}

/*[EOF]*/
