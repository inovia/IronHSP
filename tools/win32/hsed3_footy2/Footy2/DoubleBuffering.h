/*===================================================================
CDoubleBuffering�N���X
�E�B���h�E�̃_�u���o�b�t�@�����O�������s���N���X�ł��B
===================================================================*/

#pragma once

#include "EthicLine.h"

class CDoubleBuffering{
public:
	CDoubleBuffering();
	virtual ~CDoubleBuffering();

	//! �T�C�Y���ύX���ꂽ�Ƃ��ɌĂ΂�鏈��
	bool ChangeSize(HWND hWnd,int nWidth,int nHeight);
	//! �_�u���o�b�t�@�����O�p�̃R���p�`�u���f�o�C�X�R���e�L�X�g���擾����
	inline HDC GetDC(){return m_MainSurfaceDC;}
	//! �`�悳�ꂽ���ǂ�����ݒ肷�鏈��
	void SetRendInfo(CEthicLine *pFirstVisible);
	//! ��x�ł��`�悳��Ă��邩�ǂ����擾���鏈��(�������̂��߂ɕ`�揈��������ł���\��������)
	inline bool IsRendered(){return m_bRendered;}
	//! �O�ɕ`�悳�ꂽ�Ƃ��̃o�b�t�@�����O��Ԃ�Ԃ�
	inline CEthicLine* const GetFirstVisible(){return &m_cRenderedFirstVisible;}
	inline int GetWidth(){return m_nWidth;};
	inline int GetHeight(){return m_nHeight;};

private:
	/*�_�u���o�b�t�@�����O�̃f�[�^*/
	HBITMAP m_MainSurface;					//!< �_�u���o�b�t�@�����O
	HBITMAP m_MainSurfaceOld;				//!< �O�Ɏg�p���Ă�������
	HDC m_MainSurfaceDC;					//!< �R���p�`�u���f�o�C�X�R���e�L�X�g
	int m_nWidth,m_nHeight;					//!< �傫��
	
	/*�ǂ̂悤�ȏ�Ԃōĕ`�悳�ꂽ�̂�*/
	bool m_bRendered;						//!< ���łɈ�x�ȏ�`�悳��Ă��邩�H
	CEthicLine m_cRenderedFirstVisible;		//!< �`�掞�ŏ�ʍs
};

/*[EOF]*/
