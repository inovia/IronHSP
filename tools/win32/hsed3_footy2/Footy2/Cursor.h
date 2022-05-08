/*===================================================================
CCursor�N���X
�J�[�\���Ǘ����s���܂��B�S��static�ō\������܂��B
===================================================================*/

#pragma once

class CCursor{
public:
	/*�\�z*/
	static bool LoadCursors(HINSTANCE hInstance);/*�J�[�\�������[�h���܂��B*/
	static void DestroyCursors();				/*�J�[�\����j�����܂��B*/

	/*�J�[�\���̎g�p*/
	static void UseArrow();						/*�A���[�J�[�\�����g�p���܂��B*/
	static void UseIBeam();						/*I�r�[���J�[�\�����g�p���܂��B*/
	static void UseUrlCursor();					/*URL�ɏ�����Ƃ��̃J�[�\�����g�p���܂��B*/
	static void UseLineCount();					/*�s�ԍ��\���̈�̃J�[�\�����g�p���܂��B*/
	static void UseUpDown();					/*�㉺�J�[�\�����g�p���܂��B*/
	static void UseRightLeft();					/*���E�J�[�\�����g�p���܂��B*/
	static void UseCross();					/*�\���J�[�\�����g�p���܂��B*/

	
//private:
	static HCURSOR m_hArrowCursor;				/*�A���[�J�[�\��*/
	static HCURSOR m_hIBeam;					/*I�r�[��*/
	static HCURSOR m_hLineCountCursor;			/*�s�ԍ��\���̈�̃J�[�\��*/
	static HCURSOR m_hOnUrlCursor;				/*URL�ɏ�����Ƃ��̃J�[�\��*/
	static HCURSOR m_hUpDownCursor;				/*�㉺�J�[�\��*/
	static HCURSOR m_hRightLeftCursor;			/*���E�J�[�\��*/
	static HCURSOR m_hCrossCursor;				/*�\���J�[�\��*/
};

/*[EOF]*/
