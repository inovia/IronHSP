/**
 * @file DoubleBuffering.cpp
 * @brief �E�B���h�E�̃_�u���o�b�t�@�����O�������s���N���X�ł��B
 * @author Shinji Watanabe
 * @version 1.0
 * @date Jan.06.2008
 */

#include "DoubleBuffering.h"

/**
 * CDoubleBuffering::CDoubleBuffering
 * @brief �R���X�g���N�^
 */
CDoubleBuffering::CDoubleBuffering(){
	m_MainSurface = NULL;
	m_MainSurfaceOld = NULL;
	m_MainSurfaceDC = NULL;
	m_nWidth = 0;
	m_nHeight = 0;
	m_bRendered = false;
}

/**
 * CDoubleBuffering::~CDoubleBuffering
 * @brief �f�X�g���N�^
 */
CDoubleBuffering::~CDoubleBuffering(){
	/*�T�[�t�B�X�֘A���������*/
	if (m_MainSurface){
		SelectObject(m_MainSurfaceDC,m_MainSurfaceOld);
		DeleteObject(m_MainSurface);
		m_MainSurface = NULL;
	}
	if (m_MainSurfaceDC){
		DeleteDC(m_MainSurfaceDC);
	}
}

/**
 * CDoubleBuffering::SetRendInfo
 * @brief �`�����ۑ�����
 */
void CDoubleBuffering::SetRendInfo(CEthicLine *pFirstVisible){
	m_bRendered = true;
	m_cRenderedFirstVisible = *pFirstVisible;
}

/**
 * CDoubleBuffering::ChangeSize
 * @brief �T�C�Y�̕ύX����
 */
bool CDoubleBuffering::ChangeSize(HWND hWnd,int nWidth,int nHeight)
{
	// ���܂łƓ����T�C�Y�Ȃ�m�ۂ��Ȃ�
	if (m_nWidth == nWidth && m_nHeight == nHeight)
	{
		return true;
	}

	HDC hDC = ::GetDC(hWnd);
	//FOOTY2_PRINTF( L"GetDC\n" );
	if ( !hDC )
	{
		FOOTY2_PRINTF( L"But failed...\n" );
	}

	// �݊��f�o�C�X�R���e�L�X�g�����邩�ǂ���
	if (!m_MainSurfaceDC)
	{
		m_MainSurfaceDC = CreateCompatibleDC(hDC);
		if (!m_MainSurfaceDC)
		{
			FOOTY2_PRINTF( L"failed to create compatibleDC\n" );
			ReleaseDC(hWnd,hDC);
			FOOTY2_PRINTF( L"ReleaseDC\n" );
			return false;
		}
	}
	
	// �_�u���o�b�t�@�����O������Δj������
	if (m_MainSurface)
	{
		DeleteObject(m_MainSurface);
		m_MainSurface = NULL;
	}
	
	// �V�����o�b�t�@�𐶐�����
	m_MainSurface=CreateCompatibleBitmap(hDC,nWidth,nHeight);		// ����Ɋ֘A����r�b�g�}�b�v���쐬
	if (!m_MainSurface)
	{
		ReleaseDC( hWnd, hDC );
		FOOTY2_PRINTF( L"ReleaseDC\n" );
		return false;
	}
	if (!m_MainSurfaceOld)
	{
		m_MainSurfaceOld = (HBITMAP)SelectObject(m_MainSurfaceDC,m_MainSurface);	
	}
	else
	{
		SelectObject(m_MainSurfaceDC,m_MainSurface);
	}
	if (m_nWidth > nWidth || m_nHeight > nHeight)					// ���������ꂽ�Ƃ�
	{
		BitBlt(m_MainSurfaceDC,0,0,nWidth,nHeight,hDC,0,0,SRCCOPY);	// �R���o�`�u��DC�ɃR�s�[
	}
	ReleaseDC(hWnd,hDC);											// �f�o�C�X�R���e�L�X�g�J��
	//FOOTY2_PRINTF( L"ReleaseDC\n" );

	// �����o�ϐ��Ɋi�[
	m_nHeight = nHeight;
	m_nWidth = nWidth;

	// ��x���`�悳��Ă��Ȃ���Ԃɂ���
	m_bRendered = false;
	return true;
}

/*[EOF]*/
