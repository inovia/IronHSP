/*===================================================================
CHSplitter
�����X�N���[���o�[�̊Ǘ��N���X�ł��B
===================================================================*/

#include "HSplitter.h"
#include "Cursor.h"

/*-------------------------------------------------------------------
CHSplitter::CHSplitter
�R���X�g���N�^
-------------------------------------------------------------------*/
CHSplitter::CHSplitter(){
}


/*-------------------------------------------------------------------
CHSplitter::MoveWin
�X�v���b�^�[���ړ�������
-------------------------------------------------------------------*/
bool CHSplitter::MoveWin(int x,int y,int nWidth,int nHeight){
	/*�G���[�`�F�b�N*/
	if (y <= 0 || m_nBaseHeight < y)return false;
	/*�A�^�b�`���ꂽ�E�B���h�E���ړ�������*/
	if (m_pViews){
		if (m_nMode == SPLIT_DUAL){
			m_pViews[0].MoveWin(x,m_nBaseY,nWidth,y-m_nBaseY);
			m_pViews[1].MoveWin(x,y+SPLIT_SIZE,nWidth,nHeight-(y-m_nBaseY)-SPLIT_SIZE);
		}
		else if (m_pOtherSplit){
			//m_pViews[0].MoveWin(x,m_nBaseY,m_pOtherSplit->GetX(),y-m_nBaseY);
			m_pViews[0].MoveWin(x,m_nBaseY,m_pOtherSplit->GetX()-x,y-m_nBaseY);// �o�O�C�� by Tetr@pod
			m_pViews[1].MoveWin(m_pOtherSplit->GetX()+SPLIT_SIZE,m_nBaseY,
				nWidth-m_pOtherSplit->GetX()-SPLIT_SIZE,y-m_nBaseY);
			//m_pViews[2].MoveWin(x,y+SPLIT_SIZE,m_pOtherSplit->GetX(),m_nBaseHeight-(y-m_nBaseY)-SPLIT_SIZE);
			m_pViews[2].MoveWin(x,y+SPLIT_SIZE,m_pOtherSplit->GetX()-x,m_nBaseHeight-(y-m_nBaseY)-SPLIT_SIZE);// �o�O�C�� by Tetr@pod
			m_pViews[3].MoveWin(m_pOtherSplit->GetX()+SPLIT_SIZE,y+SPLIT_SIZE,
				nWidth-m_pOtherSplit->GetX()-SPLIT_SIZE,m_nBaseHeight-(y-m_nBaseY)-SPLIT_SIZE);
		}
	}
	/*�X�v���b�g�o�[���ړ�������*/
	MoveWindow(GetWnd(),x,y,nWidth,SPLIT_SIZE,true);
	/*�����o�ϐ�����*/
	m_x = x;
	m_y = y;
	return true;
}


/*-------------------------------------------------------------------
CHSplitter::OnMouseMove
�}�E�X���������ꂽ�Ƃ��̏���
-------------------------------------------------------------------*/
void CHSplitter::OnMouseMove(int x,int y){
	/*if (m_bDrag)
		MoveWin(m_x,m_y+y,m_nBaseWidth,m_nBaseHeight);
	CCursor::UseUpDown();*/
	// �����ł̃h���b�O�����ǉ� by Tetr@pod
	if (m_bDrag) {
		if (m_nMode == SPLIT_QUAD && m_pOtherSplit && m_bIsCenter) {// ���S���H
			FOOTY2_PRINTF( L"Center dragging! x=%d, y=%d, mx=%d, my=%d, omx=%d, omy=%d\n", x, y, m_x, m_y, m_pOtherSplit->GetX(), m_pOtherSplit->GetY() );
			MoveWin(m_x,m_y+y,m_nBaseWidth,m_nBaseHeight);
			m_pOtherSplit->OnBaseWindowMove(m_nBaseX,m_nBaseY,m_nBaseWidth,m_nBaseHeight);
			m_pOtherSplit->MoveWin(x,m_pOtherSplit->GetY(),m_nBaseWidth,m_nBaseHeight);
			CCursor::UseCross();
		}
		else {
			MoveWin(m_x,m_y+y,m_nBaseWidth,m_nBaseHeight);
			CCursor::UseUpDown();
		}
	}
	else {
		if (m_nMode == SPLIT_QUAD && m_pOtherSplit && x >= m_pOtherSplit->GetX() - SPLIT_CENTER_RANGE1 && x < m_pOtherSplit->GetX() + SPLIT_CENTER_RANGE2) {// ���S���H
			CCursor::UseCross();
		}
		else {
			CCursor::UseUpDown();
		}
	}
}

void CHSplitter::OnMouseDouble(int x,int y){// by Tetr@pod
	//FOOTY2_PRINTF( L"Double Click! x=%d, ox=%d, bx=%d\n", x, m_pOtherSplit->GetX(), m_nBaseX );
	if (m_nMode == SPLIT_DUAL){
		m_pFooty->ChangeView(VIEWMODE_NORMAL, true);
	}
	else if (m_pOtherSplit) {
		if (m_nMode == SPLIT_QUAD && m_pOtherSplit && x >= m_pOtherSplit->GetX() - SPLIT_CENTER_RANGE1 && x < m_pOtherSplit->GetX() + SPLIT_CENTER_RANGE2) {// ���S���H
			m_pFooty->ChangeView(VIEWMODE_NORMAL, true);
		}
		else {
			m_pFooty->ChangeView(VIEWMODE_VERTICAL, true);
		}
	}
	if (m_bDrag) {
		ReleaseCapture();
		m_bDrag = false;
	}
}

void CHSplitter::OnMouseDown(int x,int y)
{
	if (m_bDrag == false) {// by Tetr@pod
		SetCapture(m_hWnd2);
		m_bDrag = true;
		if (m_pOtherSplit) {
			m_bIsCenter = (x >= m_pOtherSplit->GetX() - SPLIT_CENTER_RANGE1 && x < m_pOtherSplit->GetX() + SPLIT_CENTER_RANGE2);// ���S���H by Tetr@pod
		}
	}
}

/*[EOF]*/