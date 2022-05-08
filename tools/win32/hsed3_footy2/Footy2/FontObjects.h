/**
 * @file	FontObjects.cpp
 * @brief	�t�H���g�̃I�u�W�F�N�g�Ǘ��N���X�ł��B
 * @author	Shinji Watanabe
 * @date	2009/03/16
 */

#pragma once

class CFontObjects
{
public:
	// �R���X�g���N�^
	CFontObjects();
	virtual ~CFontObjects();

	bool CreateAll( HDC hDC );
	

	// �t�H���g���쐬���邽�߂̃��[�`��
	bool SetRuler(HDC hDC,int nRulerHeight);

	inline HFONT UseFont(HDC hDC,FontMode nMode)
	{
		return (HFONT)SelectObject(hDC,m_hFont[nMode]);
	}
	inline HFONT UseKanjiFont(HDC hDC)
	{
		return (HFONT)SelectObject(hDC,GetKanjiFont());
	}
	inline HFONT GetKanjiFont()
	{
		return m_hFont[FFM_SHIFTJIS_CHARSET];
	}
	inline HFONT UseRulerFont(HDC hDC)
	{
		return (HFONT)SelectObject(hDC,m_hRulerFont);
	}

	// �擾
	inline int GetWidth()		const {return m_nFontWidth;}
	inline int GetHeight()		const { return m_nFontHeight; }
	inline int GetRulerHeight() const { return m_nRulerHeight; }
	inline int GetFontSize()	const { return m_nFontPoint; }
	
	/*�ݒ�*/
	void SetFontSize( int nPoint, HDC hDC )
	{
		m_nFontPoint = nPoint;
		CreateAll( hDC );
	}
	bool SetFontFace(int nType,const wchar_t *pFontFace,HDC hDC);

	// �t�H���g�̋��� by inovia
	void SetForceFont( int flag );
	// �����`�� by inovia
	void SetSpeedDraw( int flag );

private:
	bool CreateFontObject(int nType,HDC hDC);
	HFONT GetFontHandle(const wchar_t *szFontName,int nHeight,bool bBold,int nCharSets);
	void SetFontPixels(HDC hDC);
	int GetMulDiv(int nNumber,int nNumerator,int nDenominator);
	inline int HeightFromPoint(HDC hDC,int nPoint){
		return -GetMulDiv(nPoint, GetDeviceCaps(hDC, LOGPIXELSY), 72);
	}
	
private:
	enum fixed_num
	{
#ifdef UNDER_CE
		FONTNORMAL_DEFAULT = 9,
#else	/*UNDER_CE*/
		FONTNORMAL_DEFAULT = 11,
#endif	/*UNDER_CE*/
	}	/*enum fixed_num*/;
	
	HFONT m_hFont[FFM_NUM_FONTS];				//!< �t�H���g���X�g
	HFONT m_hRulerFont;							//!< ���[���[�̃t�H���g
	std::wstring m_strFace[FFM_NUM_FONTS];		//!< �t�H���g�̖��O
	static const int m_nCharSets[FFM_NUM_FONTS];
	int m_fnWeight;								//!< �{�[���h�̂̎��̑���
	int m_nFontPoint;							//!< �t�H���g�̃T�C�Y(�|�C���g)
	int m_nFontHeight;							//!< ���C���t�H���g�̍���(�s�N�Z��)
	int m_nFontWidth;							//!< ���C���t�H���g�̕�(�s�N�Z��)
	int m_nRulerHeight;							//!< ���[���[�t�H���g�̍���
	int m_fForceFont;							//!< �t�H���g���������邩�H by inovia
};

/*[EOF]*/
