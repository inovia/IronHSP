/*===================================================================
CFootyView�N���X
Footy�̃r���[�Ǘ����s���܂��B
���̃t�@�C���̓��b�Z�[�W�Ǘ����s���܂��B
===================================================================*/

#include "FootyView.h"

/*-------------------------------------------------------------------
CFootyView::MainProc
���C���v���V�[�W��
-------------------------------------------------------------------*/
LRESULT CFootyView::MainProc(UINT msg,WPARAM wParam,LPARAM lParam){
	/*�z�C�[�����b�Z�[�W���ǂ����擾����*/
#ifndef UNDER_CE
	if (msg == m_uWheelMsg)msg = WM_MOUSEWHEEL;
#endif	/*UNDER_CE*/

	/*���b�Z�[�W�ɂ��ꍇ����*/
	switch(msg){
//�L�[�֘A
	case WM_CHAR:
		OnChar((wchar_t)wParam);
		break;
	case WM_IME_COMPOSITION:
		OnImeComposition(lParam);
		return DefWindowProc(m_hWnd,msg,wParam,lParam);
	case WM_IME_REQUEST:
		return OnImeRequest(wParam,lParam);
	case WM_KEYDOWN:
		OnKeyDown((int)wParam);
		break;
	case WM_GETDLGCODE:
		if (m_bIsFocused)	/*�t�H�[�J�X������Ƃ��̂ݑS���擾*/
			return DLGC_WANTALLKEYS;
		else				/*����ȊO�̓f�t�H���g�ɔC����*/
			return DefWindowProc(m_hWnd,msg,wParam,lParam);
//�}�E�X�֘A
	case WM_LBUTTONDOWN:
		OnMouseDown((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	case WM_MOUSEMOVE:
		OnMouseMove((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	case WM_LBUTTONUP:
		OnMouseUp((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	case WM_LBUTTONDBLCLK:
		OnMouseDouble((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	case WM_MOUSEWHEEL:
		OnMouseWheel((short)HIWORD(wParam) < 0);
		break;
//�X�N���[��
    case WM_VSCROLL:
		OnVScroll(wParam);
        break;
	case WM_HSCROLL:
		OnHScroll(wParam);
		break;
//�^�C�}�[�C�x���g
	case WM_TIMER:
		switch(wParam)
		{
		case eTimer_AutoVertical:
			FOOTY2_PRINTF( L"On Auto Vertical Scroll Timer\n" );
			OnAutoVerticalTimer();
			break;
		case eTimer_AutoHorizontal:
			FOOTY2_PRINTF( L"On Auto Horizontal Scroll Timer\n" );
			OnAutoHorizontalTimer();
			break;
		}
		break;
//�t�H�[�J�X�֘A
	case WM_SETFOCUS:
		OnGotFocus();
		FOOTY2_PRINTF(L"On got focus\n");
		break;
	case WM_KILLFOCUS:
		OnLostFocus();
		FOOTY2_PRINTF(L"On lost focus\n");
		break;
	case WM_PAINT:
		
		PAINTSTRUCT ps;
		BeginPaint(m_hWnd,&ps);
		//FOOTY2_PRINTF( L"BeginPaint %d\n", m_nFootyID );
		Refresh(ps.hdc,&ps.rcPaint);
		EndPaint(m_hWnd,&ps);
		//FOOTY2_PRINTF( L"EndPaint %d\n", m_nFootyID );
		
		break;
	default:
		return DefWindowProc(m_hWnd,msg,wParam,lParam);
	}
	return false;
}

/*----------------------------------------------------------------
CFootyView::OnLostFocus
�t�H�[�J�X���������Ƃ��ɔ������܂��B
----------------------------------------------------------------*/
void CFootyView::OnLostFocus(){


	m_bIsFocused = false;
	m_cCaret.Hide();		/*�L�����b�g���\���ɂ���*/
	if ((m_bUnderlineDraw == false)){
		m_cCaret.Destroy();		/*�j��B*/
		CaretRefresh();
	}
	/*�C�x���g�o��*/
	if (m_pFuncFocus)
		m_pFuncFocus(m_nFootyID,m_pDataFocus,m_nViewID,false);
	
//	m_cCaret.Hide();		/*�L�����b�g���\���ɂ���*/
//	// 4�̃r���[���t�H�[�J�X����ĂȂ��Ƃ��͔j�����Ȃ�
//	// �P�ł��r���[���t�H�[�J�X����Ă���ꍇ�͔j��

//	if ( ( m_pView[0].IsFocused() == false ) && ( m_pView[1].IsFocused() == false ) && ( m_pView[2].IsFocused() == false ) && ( m_pView[3].IsFocused() == false ) ){
//		FOOTY2_PRINTF( L"Test_OnLostFocus %d\n", m_nFootyID );
//	}else{
//		if ((m_bUnderlineDraw == false)){
//			m_cCaret.Destroy();		/*�j��B*/
//			CaretRefresh();
//		}
//	}


//	m_bIsFocused = false;
	
	/*�C�x���g�o��*/
//	if (m_pFuncFocus)
//		m_pFuncFocus(m_nFootyID,m_pDataFocus,m_nViewID,false);
	
}

/*----------------------------------------------------------------
CFootyView::OnGotFocus
�t�H�[�J�X�𓾂��Ƃ��ɔ������܂��B
----------------------------------------------------------------*/
void CFootyView::OnGotFocus(){

	// �A���_�[���C���̕\���o�O(�d�l�H)�C�� by Tetr@pod
	if (m_bUnderlineDraw){// ��t�H�[�J�X���̃A���_�[���C���̕`�悪�L���ȂƂ��ŁA
		for(int i=0; i<4; i++){// ���̃r���[��
			if (m_pView[i].IsFocused() == false){// �t�H�[�J�X���Ȃ��Ƃ���
				m_pView[i].m_cCaret.Destroy();// ���̃r���[�̃A���_�[���C����j��
				m_pView[i].CaretRefresh();// �����čX�V
			}
		}
	}

	if (!m_bIsFocused){				/*�t�H�[�J�X�������Ă����Ƃ���*/
		m_bIsFocused = true;		/*�t�H�[�J�X�t���O�𗧂Ă�*/
		Refresh(false);				/*�ĕ`�悳����*/
	}
	CaretMove();
	/*�C�x���g�o��*/
	if (m_pFuncFocus)
		m_pFuncFocus(m_nFootyID,m_pDataFocus,m_nViewID,true);
}
