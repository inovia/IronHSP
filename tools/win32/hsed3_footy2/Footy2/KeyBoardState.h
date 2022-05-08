/*===================================================================
CKeyBoardState�N���X
�L�[�{�[�h�̏�Ԃ��擾����N���X�ł��B
===================================================================*/

#pragma once

class CKeyBoardState{
public:
	CKeyBoardState(){
		m_bShiftLocked = false;
	}
	CKeyBoardState(bool bShiftLocked){
		m_bShiftLocked = bShiftLocked;
	}

	/*�L�[�{�[�h�̏����擾���郋�[�`��*/
	inline bool IsControlPushed()
		{return (GetKeyState(VK_CONTROL) >> (sizeof(BYTE)*8-1)) != 0;}
	inline bool IsShiftPushed(){
		if (m_bShiftLocked)
			return true;
		else
			return (GetKeyState(VK_SHIFT) >> (sizeof(BYTE)*8-1)) != 0;
	}

private:
	bool m_bShiftLocked;
};

/*[EOF]*/
