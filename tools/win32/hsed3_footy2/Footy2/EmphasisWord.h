/*===================================================================
CEmphasisWord�N���X
���ޕ��̋����\���������ێ�����N���X�ł��B
===================================================================*/

#pragma once

class CEmphasisWord
{
public:
	CEmphasisWord();

	bool SetValues(const wchar_t *pString1,const wchar_t *pString2,
		int nType,int nFlags,int nLevel,int nPermission,int nIndependence,COLORREF nColor);
	
	/*�擾�n�̃��[�`��*/
	inline bool IsPermitted(int nLevel){return (m_nPermission & (1 << nLevel)) != 0;}
	bool CheckIndependence(const wchar_t *pChar,bool bCheckAfter);
	inline int GetLevel(){return m_nLevel;}
	inline const wchar_t *GetString1() const { return m_strWord1.c_str(); }
	inline const wchar_t *GetString2() const { return m_strWord2.c_str(); }
	inline size_t GetLen1() const { return m_strWord1.size(); }
	inline size_t GetLen2() const { return m_strWord2.size(); }
	inline COLORREF GetColor(){return m_nColor;}
	inline int GetType(){return m_nType;}
	inline bool IsOnlyHead(){return (m_nEmpFlag & EMPFLAG_HEAD) != 0;}
	inline bool IsNonCsWord(){return (m_nEmpFlag & EMPFLAG_NON_CS) != 0;}
	
	/*�I�y���[�^*/
	bool operator < (CEmphasisWord &cEmpWord){return GetLen1() < cEmpWord.GetLen1();}
	bool operator > (CEmphasisWord &cEmpWord){return GetLen1() > cEmpWord.GetLen1();}

	/*�������������������*/
	static void SetLower(wchar_t *szStr,size_t nLen);

private:
public:
	/*�ꎞ�I�ȕϐ�*/
	bool m_bDuplix;

private:
	std::wstring m_strWord1;			//!< ������1
	std::wstring m_strWord2;			//!< ������2

	int m_nPermission;					//!< ����Ă郌�x��
	int m_nIndependence;				//!< �Ɨ����
	int m_nLevel;						//!< ���̕�����ɐݒ肳��Ă��郌�x��
	int m_nEmpFlag;						//!< �����t���O
	int m_nType;						//!< �����\���^�C�v
	COLORREF m_nColor;					//!< �����\���F
};

typedef std::list<CEmphasisWord> LsWords;
typedef std::list<CEmphasisWord>::iterator WordPt;

/*[EOF]*/
