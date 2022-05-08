/**
 * @file SplitBase.cpp
 * @brief �X�v���b�g�o�[�̊��N���X�ł��B
 * @author Shinji Watanabe
 * @date Dec. 28, 2008
 */

#include "SplitBase.h"

//-----------------------------------------------------------------------------
/**
 * @brief �R���X�g���N�^
 */
CSplitBase::CSplitBase()
{
	m_hWnd = NULL;
	m_hWnd2 = NULL;
	m_nMode = SPLIT_DUAL;
	m_pViews = NULL;
	m_bDrag = false;
	m_bVisible = false;
	m_pOtherSplit = NULL;
}


//-----------------------------------------------------------------------------
/**
 * @brief �f�X�g���N�^
 *
 */
CSplitBase::~CSplitBase()
{
	DestroySplitBar();
}

//-----------------------------------------------------------------------------
/**
 * @brief �\�z����
 */
 bool CSplitBase::Create(HWND hWndParent, HINSTANCE hInstance)
{
	if (!hWndParent || !hInstance)return false;
	
	// ���łɐ����ς݂̏ꍇ�͂�������j��
	if ( m_hWnd )
	{
		DestroySplitBar();
	}
	
	// �N���X��o�^����
	WNDCLASS wc;
	
#ifdef UNDER_CE
	wc.style			= 0;
#else	/*UNDER_CE*/
	// wc.style			= CS_BYTEALIGNCLIENT | CS_BYTEALIGNWINDOW;
	wc.style			= CS_BYTEALIGNCLIENT | CS_BYTEALIGNWINDOW | CS_DBLCLKS;// by Tetr@pod
#endif	/*UNDER_CE*/
	wc.lpfnWndProc		= SplitWinProc;
	wc.hInstance		= hInstance;
	wc.hIcon			= NULL;
	wc.hCursor			= NULL;						// ��Ԃɂ���ēK�X�ύX����
	wc.hbrBackground	= (HBRUSH)GetSysColorBrush(COLOR_BTNFACE);
	wc.lpszMenuName		= NULL;
	wc.lpszClassName	= SPLIT_WNDCLASSNAME;
	wc.cbClsExtra		= 0;						// �g�p���Ȃ��B0���w��
	wc.cbWndExtra		= 0;						// �g�p���Ȃ��B0���w��
	RegisterClass(&wc);								// �E�B���h�E�N���X�̓o�^

	/*�E�B���h�E�̍쐬*/
	m_hWnd = CreateWindowEx(0,SPLIT_WNDCLASSNAME,SPLIT_WNDCLASSNAME,
							WS_CHILD,0,0,0,0,hWndParent,NULL,hInstance,NULL);
	if (!m_hWnd)return false;
	m_hWnd2 = m_hWnd;
	
	/*�v���p�e�B�̐ݒ�*/
	SetProp(m_hWnd,SPLIT_PROPNAME,(HANDLE)this);
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �X�v���b�g�o�[���폜���܂�
 */
void CSplitBase::DestroySplitBar()
{
	if (m_hWnd)
	{
		RemoveProp( m_hWnd, SPLIT_PROPNAME );
		DestroyWindow( m_hWnd );
		m_hWnd = NULL;
		m_hWnd2 = NULL;
	}
}

//-----------------------------------------------------------------------------
/**
 * @brief �E�B���h�E�v���V�[�W���ł��B
 */
LRESULT CALLBACK CSplitBase::SplitWinProc(HWND hWnd,UINT msg,WPARAM wParam,LPARAM lParam)
{
	CSplitBase *pSplitClass=NULL;	// ���̃N���X�ւ̃|�C���^
	pSplitClass=(CSplitBase*)GetProp(hWnd,SPLIT_PROPNAME);
	if (pSplitClass)
		return pSplitClass->MainProc(msg,wParam,lParam);
	else
		return DefWindowProc(hWnd,msg,wParam,lParam);
}


//-----------------------------------------------------------------------------
/**
 * @brief �E�B���h�E�Ɋ֘A�Â����Ă�N���X�C���X�^���X�������ł����ꍇ�ɍs��
 *		  ���ۂ̃E�B���h�E�v���V�[�W�������ł�
 */
LRESULT CSplitBase::MainProc(UINT msg,WPARAM wParam,LPARAM lParam)
{
	switch(msg)
	{
	case WM_LBUTTONDOWN:
		//FOOTY2_PRINTF( L"Double Click A!\n" );
		OnMouseDown((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	case WM_MOUSEMOVE:
		OnMouseMove((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	case WM_LBUTTONUP:
		OnMouseUp((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;

	case WM_LBUTTONDBLCLK:// by Tetr@pod
		FOOTY2_PRINTF( L"Double Click A!\n" );
		OnMouseDouble((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;

	default:
		return DefWindowProc(m_hWnd,msg,wParam,lParam);
	}
	return false;
}

//-----------------------------------------------------------------------------
/**
 * @brief �}�E�X���������Ƃ��̏����ł�
 * @param	x	[in] �}�E�Xx���W
 * @param	y	[in] �}�E�Xy���W
 */
/*void CSplitBase::OnMouseDown(int x,int y)
{
	if (m_bDrag == false) {// by Tetr@pod
		SetCapture(m_hWnd);
		m_bDrag = true;
	}
}*/
// �ʏ����ɕύX

//-----------------------------------------------------------------------------
/**
 * @brief �}�E�X�̍��{�^�������������Ƃ��̏���
 */
void CSplitBase::OnMouseUp(int x,int y)
{
	if (m_bDrag == true) {// by Tetr@pod
		ReleaseCapture();

		if (m_nMode == SPLIT_QUAD && m_pOtherSplit) {// �␳���� by Tetr@pod
			m_pOtherSplit->MoveWin(m_pOtherSplit->GetX(),m_pOtherSplit->GetY(),m_nBaseWidth,m_nBaseHeight);
			MoveWin(m_x,m_y,m_nBaseWidth,m_nBaseHeight);
		}

		m_bDrag = false;
	}
}

//-----------------------------------------------------------------------------
/**
 * @brief �\����Ԃ�ݒ�ł��܂�
 */
void CSplitBase::SetVisible(bool bVisible)
{
	ShowWindow(m_hWnd,bVisible ? SW_SHOWNORMAL : SW_HIDE);
}


//-----------------------------------------------------------------------------
/**
 * @brief �e�E�B���h�E���������Ƃ��ɌĂяo���Ă�������
 */
void CSplitBase::OnBaseWindowMove(int x,int y,int nWidth,int nHeight)
{
	m_nBaseX = x;
	m_nBaseY = y;
	m_nBaseWidth = nWidth;
	m_nBaseHeight = nHeight;
}

/*[EOF]*/
