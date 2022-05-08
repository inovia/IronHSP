/*===================================================================
CCaret�N���X
�L�����b�g�̍쐬�A�Ǘ����s���N���X�ł��B
===================================================================*/

#pragma once

class CCaret{
public:
	/*�R���X�g���N�^*/
	CCaret();
	virtual ~CCaret();

	void SetParam(HWND hWnd){m_hWnd = hWnd;}

	/*�L�����b�g����*/
	inline void ReCreate(int nWidth,int nHeight);
	inline void Move(int nPosX,int nPosY);
	inline void Destroy();
	inline void Show();
	inline void Hide();
	
	/*�擾����*/
	inline int GetNowX(){return m_nCurrentCaretX;}
	inline int GetNowY(){return m_nCurrentCaretY;}
	inline bool IsShown(){return m_bCaretShown;}

private:
	/*���̃f�[�^*/
	bool m_bCaretShown;							/*�L�����b�g���\������Ă��邩*/
	int m_nCurrentCaretX;						/*�L�����b�g�̑��΍��W*/
	int m_nCurrentCaretY;						/*�L�����b�g�̑��΍��W*/

	/*�V�X�e���f�[�^*/
	HWND m_hWnd;								/*�E�B���h�E�n���h��*/
};

/*-------------------------------------------------------------------
CCaret::Show
�L�����b�g��\������
-------------------------------------------------------------------*/
void CCaret::Show(){
	if (!m_bCaretShown || m_hWnd){
		ShowCaret(m_hWnd);
		m_bCaretShown = true;
	}
}

/*-------------------------------------------------------------------
CCaret::Hide
�L�����b�g���\���ɂ���
-------------------------------------------------------------------*/
void CCaret::Hide(){
	if (m_bCaretShown || m_hWnd){
		HideCaret(m_hWnd);
		m_bCaretShown = false;
	}
}

/*-------------------------------------------------------------------
CCaret::ReCreate
�L�����b�g���č\�z����
-------------------------------------------------------------------*/
void CCaret::ReCreate(int nWidth,int nHeight){
	if (m_hWnd){
		Hide();
		Destroy();
		CreateCaret(m_hWnd,NULL,nWidth,nHeight);
	}
}

/*-------------------------------------------------------------------
CCaret::Destroy
�L�����b�g��j������
-------------------------------------------------------------------*/
void CCaret::Destroy(){
	DestroyCaret();
}

/*-------------------------------------------------------------------
CCaret::Move
�L�����b�g���ړ�����
-------------------------------------------------------------------*/
void CCaret::Move(int nPosX,int nPosY){
	SetCaretPos(nPosX,nPosY);
	m_nCurrentCaretX = nPosX;
	m_nCurrentCaretY = nPosY;
}

/*[EOF]*/
