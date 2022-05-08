/*------------------------------------------------------------------------------
	�w�i�摜�ǂݍ��݁��`�� for HSP Script Editor by inovia
	�쐬 2015.01.09
	�C�� 2015.04.29
------------------------------------------------------------------------------*/

#include <windows.h>
#include <gdiplus.h>
#include <olectl.h>
#pragma once
#pragma	comment(lib, "Gdiplus.lib")
#include "ImageController.h"

// �R���X�g���N�^
CImageController::CImageController(HWND hwnd){

	m_Load = FALSE;
	m_Bmp = NULL;
	m_Color = 0x00000000;
	m_g = NULL;

	HDC hdc;
	hdc = GetDC(hwnd);
	m_hWnd = hwnd;

	/* GDI+������ */
	Gdiplus::GdiplusStartup(&m_lpToken, &m_pSI, NULL);

	// �I�t�X�N���[��DC(�f�X�N�g�b�v�̃T�C�Y�ō쐬���܂�)
	m_hDrawDC = CreateCompatibleDC(hdc);
	GetClientRect(GetDesktopWindow(), &m_DesktopRect);

	HBITMAP hDrawBmp;
	hDrawBmp = CreateCompatibleBitmap(hdc, m_DesktopRect.right, m_DesktopRect.bottom);
	SelectObject(m_hDrawDC, hDrawBmp);
	DeleteObject(hDrawBmp);

}
	
// �f�X�g���N�^
CImageController::~CImageController(void){

	Destroy();

	// �I�t�X�N���[��DC�j��
	if(m_hDrawDC){
		DeleteDC(m_hDrawDC);
		m_hDrawDC = NULL;
	}

	/* �j�� */
	Gdiplus::GdiplusShutdown(m_lpToken);
}

BOOL CImageController::Load(const WCHAR *fileName){

	this->Destroy();

	/* �t�@�C���p�X�̕����񂩂�Bitmap�쐬 */
	m_Bmp = NULL;
	m_Bmp = new Gdiplus::Bitmap(fileName);
	if(m_Bmp != NULL && m_Bmp->GetLastStatus() == Gdiplus::Ok){
		m_g = new Gdiplus::Graphics(m_hDrawDC);
		this->Update();
		m_Load = TRUE;
		return TRUE;
	}
	this->UnLoad();

	return FALSE;
}

// �����I�ɔj������ꍇ
void CImageController::Destroy(void){

	if (m_Bmp != NULL && m_Bmp->GetLastStatus() == Gdiplus::Ok){
		delete(m_Bmp);
		m_Bmp = NULL;
		if (m_g != NULL){
			delete(m_g);
			m_g = NULL;
		}
	}

}

void CImageController::Update(void){
	// �E����Ŕz�u����i�������}�C�i�X�ɂȂ����ꍇ��0�ɂ���j
	LONG posX = m_DesktopRect.right - m_Bmp->GetWidth();
	LONG posY = m_DesktopRect.bottom - m_Bmp->GetHeight();
	if (posX < 0)
		posX = 0;
	if (posY < 0)
		posY = 0;

	// �w�i���N���A
	this->Clear();

	// �I�t�X�N���[��DC�ɕ`��
	if(Gdiplus::Ok != m_g->DrawImage(m_Bmp, posX, posY)){
		FOOTY2_PRINTF(L"CImageController::Update() GDI+�`��Ɏ��s���܂���");
	}
}

void CImageController::Clear(COLORREF color){
	// �w�i������
	HPEN hPen, hOldPen;
	HBRUSH hBrush, hOldBrush;
	
	hPen = CreatePen(PS_SOLID, 1, color);
	hOldPen = (HPEN)SelectObject(m_hDrawDC, hPen);
	hBrush = CreateSolidBrush(color);
	hOldBrush = (HBRUSH)SelectObject(m_hDrawDC, hBrush);

	if (FALSE == Rectangle(m_hDrawDC, 0, 0, m_DesktopRect.right, m_DesktopRect.bottom)){
		FOOTY2_PRINTF(L"CImageController::Clear() GDI�`��Ɏ��s���܂���");
	}

	SelectObject(m_hDrawDC, hOldPen);
	SelectObject(m_hDrawDC, hOldBrush);
	DeleteObject(hPen);
	DeleteObject(hBrush);
}

void CImageController::Clear(void){
	// �w�i������
	this->Clear(m_Color);
}

void CImageController::UnLoad(void){
	this->Clear();
	this->Destroy();
	m_Load = FALSE;
}

void CImageController::Draw(HDC targetHDC, int x1, int y1, int x2, int y2, int maxWidth, int maxHeight){
	// �`��T�C�Y
	int width = x2 - x1;
	int height = y2 - y1;

	int drawWidth =  m_DesktopRect.right  - (maxWidth - x2) - width;
	int drawHeight = m_DesktopRect.bottom - (maxHeight - y2) - height;

	if (FALSE == BitBlt(targetHDC, x1, y1, width, height, m_hDrawDC, drawWidth, drawHeight, SRCCOPY)){
		FOOTY2_PRINTF(L"CImageController::Draw() GDI�`��Ɏ��s���܂���");
	}
}

void CImageController::Draw(HDC targetHDC, int x1, int y1, int x2, int y2){
	this->Draw(targetHDC, x1, y1 ,x2, y2, 0, 0);
}