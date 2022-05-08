/**
 * @file FootyDoc.h
 * @brief �h�L�������g�Ǘ��N���X�̎���
 * @author ShinjiWatanabe
 * @version 1.0
 */

#pragma once

#include "EditPosition.h"
#include "UndoBuffer.h"
#include "EthicLine.h"
#include "RegExpContainer.h"


class CFootyDoc
{
public:
	// �R���X�g���N�^
	CFootyDoc();
	virtual ~CFootyDoc();

	//! �V�K�쐬
	void CreateNew(int nGlobalID);
	
	//! �ǂ͈̔͂�`�悷��K�v������̂�
	enum RedrawType
	{
		REDRAW_FAILED,				//!< �֐����s
		REDRAW_NONE,				//!< �ĕ`��K�v�Ȃ�
		REDRAW_LINE,				//!< ���̍s�̂ݍĕ`�悷��
		REDRAW_CURMOVE,				//!< �J�[�\���ړ��ɔ����ĕ`��̂�
		REDRAW_SCROLLED,			//!< �X�N���[�����ꂽ
		REDRAW_SELCHANGED,			//!< �I����Ԃ݂̂��ω�����
		REDRAW_ALL,					//!< �S�čĕ`�悷��K�v������
	};

	// �f�[�^����
	void SetText(const wchar_t *pString);
	RedrawType InsertString(const wchar_t *pString,bool bRecUndo = true,bool bOverwritable = false,bool bMemLineMode = false);
	RedrawType InsertChar(wchar_t wChar);
	RedrawType InsertReturn( bool bIndentMode );
	RedrawType InsertReturnUp( bool bIndentMode );
	RedrawType InsertReturnDown( bool bIndentMode );
	RedrawType Indent();
	RedrawType Unindent();
	RedrawType OnBackSpace();
	RedrawType OnDelete();

	// �R�}���h�n
	bool Undo();
	bool Redo();
	RedrawType ClipPaste(HWND hWnd);
	bool ClipCopy(HWND hWnd);
	void SetSavePoint();

	// �ړ��n
	void MoveWordForward();						//!< ��P���������΂��Č��
	void MoveWordBack();						//!< ��P���������΂��đO��

	// �����n
	bool Search(const wchar_t *szText, int nFlags);

	// �I���n
	bool SetSelectStart(CEditPosition *pStart);
	inline bool SetSelectStart(){return SetSelectStart(&m_cCaretPos);}
	bool SetSelectStart(CUndoBuffer::CPosInfo *pStart);
	bool SetSelectEndNormal(CEditPosition *pEnd);
	bool SetSelectEndNormal(CUndoBuffer::CPosInfo *pEnd);
	inline bool SetSelectEndNormal(){return SetSelectEndNormal(&m_cCaretPos);}
	bool SetSelectEndBox(CEditPosition *pEnd);
	inline void UnSelect(){m_nSelectType = SELECT_NONE;}
	void SelectWord();
	bool GetSelText(std::wstring *pString, LineMode nLineMode = LM_CRLF);
	inline void SetSelLineStart()
	{
		m_cLineSelStartA = *GetSelStart();
		m_cLineSelStartB = *GetSelEnd();
	}
	size_t GetSelLength(LineMode nLineMode = LM_CRLF);
	RedrawType DeleteSelected(CUndoBuffer *pUndoBuffer);
	int ClearSelected();
	void SelectAll();
	
	// �f�[�^�擾
	LinePt GetLine(size_t nLine);
	inline LsLines *GetLineList(){return &m_lsLines;}
	inline LinePt GetTopLine(){return m_lsLines.begin();}	//!< �擪�s���擾����
	LinePt GetLastLine();									//!< �u�{���́v�ŏI�s���擾����
	inline LinePt GetEndLine(){return m_lsLines.end();}		//!< �����̃_�~�[�s���擾����
	inline int GetLineMode() const {return m_nLineMode;}
	inline LineSize GetLineNum() const {return m_lsLines.size();}	//!< �s�̐����擾����
	inline size_t GetLapelColumn() const {return m_nLapelColumns;}
	inline int GetLapelMode() const {return m_nLapelMode;}
	inline size_t GetTabLen() const {return m_nTabLen;}
	bool IsEdited();
	inline bool IsInsertMode() const {return m_bInsertMode;}
	int GetRedoRem();
	int GetUndoRem();

	// �ꏊ�n�̎擾���[�`��
	inline CEditPosition *GetCaretPosition(){return &m_cCaretPos;}
	inline bool IsSelecting(){return m_nSelectType != SELECT_NONE;}
	inline bool IsBoxSelect(){return m_nSelectType == SELECT_BOX || 
									 m_nSelectType == SELECT_BOX_REV;}
	inline CEditPosition *GetLineSelStartA(){return &m_cLineSelStartA;}
	inline CEditPosition *GetLineSelStartB(){return &m_cLineSelStartB;}
	inline CEthicLine *GetFirstVisible(int nID){return &m_cFirstVisibleLine[nID];}
	CEditPosition *GetSelStart();
	CEditPosition *GetSelEnd();
	
	// �ݒ�
	void SetLapel(size_t nColumn,int nMode);
	void SetInsertMode(bool bInsertMode);
	inline void SetReadOnly( bool bReadOnly ){ m_bReadOnly = bReadOnly; }
	inline bool IsReadOnly() const { return m_bReadOnly; }
	void SetTabLen(size_t nTabLen);

	// �����\���n�̊֐�
	bool AddEmphasis(const wchar_t *pString1,const wchar_t *pString2,int nType,
		int nFlags,int nLevel,int nOnLevel,int nIndependence,COLORREF nColor);
	void FlushEmphasis();
	void ClearEmphasis();
	void SetChacheCommand(LinePt pLine);

	// �h�L�������g�n�̃C�x���g�Ăяo��
	inline void SendMoveCaretCallBack()
	{
		if (m_pFuncMoveCaret)
			m_pFuncMoveCaret(m_nGlobalID,m_pDataMoveCaret,
							m_cCaretPos.GetLineNum(),m_cCaretPos.GetPosition());
	}
	inline void SendTextModified(int nCause)
	{
		if (m_pFuncTextModified)
			m_pFuncTextModified(m_nGlobalID,m_pDataTextModified,nCause);
	}

private:
	// �T�u���[�`��
	void ReturnLine(LinePt *pNowLine,const wchar_t **pString,const wchar_t *pWork,
		size_t nPos,std::wstring *pRestStr,int n,bool bFirst);

	// �����n
	void ParseRegulaerExpression(const wchar_t *szString,CRegExpContainer *pRegExp);
	bool SearchText(CEditPosition *pStart,CRegExpElement *pRegElement,bool bBackward = false);
	void SelectSearchedWord(LinePt pNowLine,size_t nPosition,CEditPosition *pEndPos);

	// ���ʃ��[�`��
	bool PushBackUndo(CUndoBuffer *pUndo);
	void DeleteLine(LinePt pLine);
	void DeleteLine(LinePt pStart,LinePt pEnd);
	bool SetLineInfo(LinePt pBegin, bool ForceListUpdate/*���s���܂ނ� by Tetr@pod*/);
	bool SetLineInfo(LinePt pBegin,LinePt pEnd, bool ForceListUpdate/*���s���܂ނ� by Tetr@pod*/);
	

public:
	//! �I���^�C�v
	enum SelType
	{
		SELECT_NONE,								//!< �I�����Ă��Ȃ�
		SELECT_NORMAL,								//!< �ʏ�̑I��
		SELECT_REV,									//!< �㉺�t�̑I��
		SELECT_BOX,									//!< ��`�I��
		SELECT_BOX_REV,								//!< �㉺�t�̋�`�I��
	};
	
	// �֐��|�C���^
	Footy2FuncMoveCaret m_pFuncMoveCaret;			//!< �L�����b�g�ړ��C�x���g
	void *m_pDataMoveCaret;							//!< ����̃f�[�^
	Footy2FuncTextModified m_pFuncTextModified;		//!< �e�L�X�g���ҏW���ꂽ�Ƃ��̃C�x���g
	void *m_pDataTextModified;						//!< �e�L�X�g���ҏW���ꂽ�Ƃ��̃f�[�^
	Footy2FuncInsertModeChanged m_pFuncInsertMode;	//!< �}����Ԃ��ω����ꂽ�Ƃ��̃C�x���g
	void *m_pDataInsertModeChanged;					//!< �}����Ԃ��ω����ꂽ�Ƃ��̃f�[�^

	void SetSpeedDraw(int flag);					//!< �����`�� by inovia
	bool FlushString2(LinePt pLine);				// Clone by Tetr@pod

private:
	// �h�L�������g�f�[�^
	LsLines m_lsLines;								//!< ������̃f�[�^
	std::list<CUndoBuffer> m_lsUndoBuffer;			//!< �A���h�D�[�o�b�t�@
	std::list<CUndoBuffer>::iterator m_pNowUndoPos;	//!< ���݂̃A���h�D�[�ʒu
	LsWords m_lsEmphasisWord;						//!< ������F����
	LineMode m_nLineMode;							//!< ���s�R�[�h
	bool m_bInsertMode;								//!< �C���T�[�g���

	// �ꏊ�E�I���֌W
	CEditPosition m_cCaretPos;						//!< ���݃L�����b�g������ʒu
	SelType m_nSelectType;							//!< �I���̃^�C�v
	CEditPosition m_cSelectBegin;					//!< �I���̊J�n�ʒu
	CEditPosition m_cSelectEnd;						//!< �I���̏I���ʒu
	CEditPosition m_cLineSelStartA;					//!< �s�I���̊J�n�ʒu(���̏ꏊ�̊J�n�ʒu)
	CEditPosition m_cLineSelStartB;					//!< �s�I���̊J�n�ʒu(���̏ꏊ�̏I���ʒu)
	CEthicLine m_cFirstVisibleLine[4];				//!< �ŏ��ɕ\������Ă���s

	// �r���[�f�[�^
	size_t m_nLapelColumns;							//!< �e�r���[�̐܂�Ԃ�����
	int m_nLapelMode;								//!< �r���[���[�h
	size_t m_nTabLen;								//!< �^�u�̉���
	
	// �ҏW����Ă��Ȃ����𒲂ׂ邽�߂̕ϐ�
	std::list<CUndoBuffer>::iterator m_pSavedPos;	//!< �Z�[�u�|�C���g
	bool m_bCannotReachSavedPos;					//!< �Z�[�u�|�C���g�܂ł��ǂ蒅���Ȃ�(�폜���ꂽ)
	
	// ���̂ق��f�[�^
	bool m_bReadOnly;								//!< �ҏW�\���
	int m_nGlobalID;								//!< �e��ID�ԍ�
	int f_SpeedDraw;								//!< �����`�� by inovia
};

/*[EOF]*/
