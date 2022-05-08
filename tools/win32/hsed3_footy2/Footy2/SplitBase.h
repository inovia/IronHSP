/**
 * @file SplitBase.h
 * @brief �X�v���b�g�o�[�̊��N���X�ł��B
 * @author Shinji Watanabe
 * @date Dec. 28, 2008
 */

#pragma once

#include "FootyView.h"

class CFooty;

#define SPLIT_WNDCLASSNAME	L"Splitter"
#define SPLIT_PROPNAME		L"SplitterClass"

class CSplitBase
{
public:
	CSplitBase();
	virtual ~CSplitBase();

	bool Create( HWND hWndParent, HINSTANCE hInstance );
	void DestroySplitBar();
	void OnBaseWindowMove(int x,int y,int nWidth,int nHeight);
	inline HWND GetWnd(){return m_hWnd;}
	inline int GetX() const { return m_x; }
	inline int GetY() const { return m_y; }

	virtual bool MoveWin(int x,int y,int nWidth,int nHeight){ return false; }// by Tetr@pod, return false;�̓_�~�[
	
	void SetViews(CFooty *pFooty, CFootyView *pTopView)
	{
		m_pFooty = pFooty;// by Tetr@pod, �_�u���N���b�N�ɂ�镪�������̂���
		m_pViews = pTopView;
		m_nMode = SPLIT_DUAL;
	}
	void SetViews(CFooty *pFooty, CFootyView *pTopView,CSplitBase *pSplit)
	{
		m_pFooty = pFooty;// by Tetr@pod
		m_pViews = pTopView;
		m_pOtherSplit = pSplit;
		m_nMode = SPLIT_QUAD;
	}

	void SetVisible(bool bVisible);

	enum fixed_num
	{
		SPLIT_SIZE = 4,

		// ���S�͈̔� by Tetr@pod
		SPLIT_CENTER_RANGE1 = 32,// ����
		SPLIT_CENTER_RANGE2 = 32,// �E��
	};

protected:

private:
	static LRESULT CALLBACK SplitWinProc(HWND hWnd,UINT msg,WPARAM wParam,LPARAM lParam);
	LRESULT MainProc(UINT msg,WPARAM wParam,LPARAM lParam);
	// virtual void OnMouseDown(int x,int y);
	virtual void OnMouseDown(int x,int y){}// �ʏ����ɕύX
	virtual void OnMouseMove(int x,int y){}
	virtual void OnMouseUp(int x,int y);

	virtual void OnMouseDouble(int x,int y){}// by Tetr@pod


public:
protected:
	enum SplitMode
	{
		SPLIT_DUAL,						//!< �f���A���r���[
		SPLIT_QUAD,						//!< �N�A�b�h�r���[
	};

	bool m_bDrag;						//!< ���݃h���b�O���H
	int m_x,m_y;						//!< ���݂̈ʒu
	int m_nBaseX,m_nBaseY;				//!< �x�[�X�E�B���h�E�̈ʒu
	int m_nBaseWidth,m_nBaseHeight;		//!< �x�[�X�E�B���h�E�̑傫��
	bool m_bIsCenter;					//!< �����h���b�O���H by Tetr@pod

	HWND m_hWnd2;						//!< �E�B���h�E�n���h�� �ʏ����̂���
	
	CFootyView *m_pViews;				//!< Footy�̃r���[
	CFooty *m_pFooty;					//!< Footy by Tetr@pod
	CSplitBase *m_pOtherSplit;			//!< ���̃X�v���b�g�o�[
	SplitMode m_nMode;					//!< ���݂̃r���[���[�h

private:
	HWND m_hWnd;						//!< �E�B���h�E�n���h��
	bool m_bVisible;					//!< �\����Ԃ��H
};

/*[EOF]*/
