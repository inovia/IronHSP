/**
 * @file Footy.h
 * @brief Footy�G�f�B�^�̂��߂̃N���X�B���Ɉ�̃h�L�������g��4�̃r���[��ێ����܂�
 * @author Shinji Watanabe
 * @date Nov.08.2008
 */

#pragma once

#include "FootyDoc.h"
#include "VSplitter.h"
#include "HSplitter.h"

class CFooty
{
public:
	CFooty(int nID, HINSTANCE hInstance, int nViewMode );

	// ���\�b�h
	bool Create(HWND hWnd, int x,int y,int nWidth,int nHeight);
	void ChangeView(int nViewMode,bool bRedraw = false);
	bool Move(int x,int y,int nWidth,int nHeight);
	void SetText(const wchar_t *pString);
	bool SetSelText(const wchar_t *pString, bool recUndo);
	bool Paste();
	bool Copy();
	bool Cut();
	bool Undo();
	bool Redo();
	
	// �t�H���g�ݒ�
	bool SetFontSize(int nPoint,bool bRedraw);
	bool SetFontFace(int nType,const wchar_t *pFaceName,bool bRedraw);
	bool SetForceFont(int flag);	// �t�H���g�̋����g�p by inovia
	bool SetSpeedDraw(int flag);	// �����`�� by inovia
	
	// �܂�Ԃ��ݒ�
	bool SetLapel(int nColumns,int nMode,bool bRedraw);
	inline void SetCharSet(CharSetMode nCharSet){m_nCharSet = nCharSet;}
	
	// �擾
	inline int GetID() const {return m_nID;}
	inline CharSetMode GetCharSet() const {return m_nCharSet;}
	bool IsFocused();

	// �w�i�摜�ݒ�n
	bool SetBackgroundImage(const wchar_t *pFilePath, bool bRedraw);
	bool ClearBackgroundImage(bool bRedraw);
	bool SetBackgroundColor(COLORREF color);

public:
	// �f�[�^
	CFootyDoc m_cDoc;					//!< �h�L�������g
	CFootyStatus m_cStatus;				//!< �X�e�[�^�X�N���X
	
	// GUI
	CFootyView m_cView[4];				//!< �r���[�N���X
	CVSplitter m_cVSplitter;			//!< �����X�v���b�^�[
	CHSplitter m_cHSplitter;			//!< �����X�v���b�^�[
	
private:
	// ID�f�[�^
	int m_nID;							//!< Footy2��ID
	CharSetMode m_nCharSet;				//!< ���ݐݒ肳��Ă���L�����N�^�Z�b�g
	LineMode m_nLineCode;

	// �f�[�^
	HWND m_hWndParent;					//!< �e�E�B���h�E�n���h��
	HINSTANCE m_hInstance;				//!< DLL�̃C���X�^���X
	int m_x,m_y;						//!< �ʒu
	int m_nWidth,m_nHeight;				//!< �傫��
	int m_nViewMode;					//!< �r���[���
	CFontObjects m_cFonts;				//!< �t�H���g�I�u�W�F�N�g
	
};

/*[EOF]*/
