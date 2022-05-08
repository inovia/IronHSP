/**
 * @file Footy.cpp
 * @author Shinji Watanabe
 * @brief Footy�̑匳�ƂȂ�N���X�ł��B
 * @date Dec. 28, 2008
 */

//-----------------------------------------------------------------------------
/**
 * @brief �R���X�g���N�^�ł��B
 */
CFooty::CFooty( int nID, HINSTANCE hInstance, int nViewMode ) :
	m_nID( nID ),
	m_nViewMode( VIEWMODE_NORMAL ),
	m_nCharSet( CSM_DEFAULT ),
	m_hWndParent( NULL ),
	m_x( 0 ),
	m_y( 0 ),
	m_nWidth( 0 ),
	m_nHeight( 0 )
{
	// �h�L�������g�V�K�쐬
	m_cDoc.CreateNew(m_nID);
	
	// �r���[������
	for ( int i = 0; i < 4; i++ )
	{
		m_cView[i].Initialize( &m_cFonts, m_cView, &m_cDoc, &m_cStatus, m_nID, i );
	}
	
	m_hInstance = hInstance;
	m_nViewMode = nViewMode;
}

//-----------------------------------------------------------------------------
/**
 * @brief Footy���쐬���܂�
 */
bool CFooty::Create( HWND hWnd, int x,int y,int nWidth, int nHeight )
{
	// �G���[�`�F�b�N
	if (!hWnd || nWidth < 0 || nHeight < 0)return false;
	m_hWndParent = hWnd;

	// �t�H���g���쐬����
	HDC hDC = GetDC(hWnd);
	FOOTY2_PRINTF( L"GetDC %d\n", m_nID );
	if (!m_cFonts.CreateAll(hDC))return false;
	if (!m_cFonts.SetRuler(hDC,m_cView[0].GetRulerHeight()))return false;
	ReleaseDC(hWnd,hDC);
	FOOTY2_PRINTF( L"ReleaseDC %d\n", m_nID );
	
	// �����o�ϐ��ɃR�s�[
	m_nWidth = nWidth;
	m_nHeight = nHeight;
	m_x = x;
	m_y = y;
	
	// �r���[�쐬
	for ( int i = 0; i < 4; i++ )
	{
		if (!m_cView[i].CreateFootyView( hWnd, m_hInstance ))
		{
			return false;
		}
	}
	if ( !m_cVSplitter.Create( hWnd, m_hInstance ) ||
		 !m_cHSplitter.Create( hWnd, m_hInstance ) )
	{
		return false;
	}

	// �r���[���[�h��ύX����
	ChangeView( m_nViewMode );
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �r���[���[�h�̕ύX����
 */
void CFooty::ChangeView( int nViewMode, bool bRedraw )
{
	// ���Ƃ̈ʒu��ۑ� by Tetr@pod
	int oldSplitterPosX = m_x + m_nWidth / 2 - CSplitBase::SPLIT_SIZE / 2;
	int oldSplitterPosY = m_y + m_nHeight / 2 - CSplitBase::SPLIT_SIZE / 2;
	if (m_nViewMode == VIEWMODE_VERTICAL) {
		oldSplitterPosX = m_cVSplitter.GetX();
	}
	else if (m_nViewMode == VIEWMODE_HORIZONTAL) {
		oldSplitterPosY = m_cHSplitter.GetY();
	}
	else if (m_nViewMode == VIEWMODE_QUAD) {
		oldSplitterPosX = m_cVSplitter.GetX();
		oldSplitterPosY = m_cHSplitter.GetY();
	}

	m_nViewMode = nViewMode;

	// �X�v���b�^��ύX����
	m_cVSplitter.OnBaseWindowMove(m_x,m_y,m_nWidth,m_nHeight);
	m_cHSplitter.OnBaseWindowMove(m_x,m_y,m_nWidth,m_nHeight);

	// ���[�h�ɍ��킹�ăr���[�𒲐߂���
	switch(nViewMode)
	{
	case VIEWMODE_NORMAL:
		m_cView[0].MoveWin(m_x,m_y,m_nWidth,m_nHeight);
		m_cHSplitter.SetVisible(false);
		m_cVSplitter.SetVisible(false);
		m_cView[0].SetVisible(true);
		m_cView[1].SetVisible(false);
		m_cView[2].SetVisible(false);
		m_cView[3].SetVisible(false);
		break;
	case VIEWMODE_VERTICAL:
		// m_cVSplitter.SetViews(m_cView);
		m_cVSplitter.SetViews(this, m_cView);// by Tetr@pod
		// m_cVSplitter.MoveWin(m_x+m_nWidth / 2 - CSplitBase::SPLIT_SIZE / 2,m_y,m_nWidth,m_nHeight);
		m_cVSplitter.MoveWin(oldSplitterPosX,m_y,m_nWidth,m_nHeight);
		m_cVSplitter.SetVisible(true);
		m_cHSplitter.SetVisible(false);
		m_cView[0].SetVisible(true);
		m_cView[1].SetVisible(true);
		m_cView[2].SetVisible(false);
		m_cView[3].SetVisible(false);
		break;
	case VIEWMODE_HORIZONTAL:
		// m_cHSplitter.SetViews(m_cView);
		m_cHSplitter.SetViews(this, m_cView);// by Tetr@pod
		// m_cHSplitter.MoveWin(m_x,m_y+m_nHeight / 2 - CSplitBase::SPLIT_SIZE / 2,m_nWidth,m_nHeight);
		m_cHSplitter.MoveWin(m_x,oldSplitterPosY,m_nWidth,m_nHeight);
		m_cHSplitter.SetVisible(true);
		m_cVSplitter.SetVisible(false);
		m_cView[0].SetVisible(true);
		m_cView[1].SetVisible(true);
		m_cView[2].SetVisible(false);
		m_cView[3].SetVisible(false);
		break;
	case VIEWMODE_QUAD:
		// m_cHSplitter.SetViews(m_cView,&m_cVSplitter);
		m_cHSplitter.SetViews(this, m_cView,&m_cVSplitter);// by Tetr@pod
		// m_cVSplitter.SetViews(m_cView,&m_cHSplitter);
		m_cVSplitter.SetViews(this, m_cView,&m_cHSplitter);// by Tetr@pod
		// m_cHSplitter.MoveWin(m_x,m_y+m_nHeight / 2 - CSplitBase::SPLIT_SIZE / 2,m_nWidth,m_nHeight);
		m_cHSplitter.MoveWin(m_x,oldSplitterPosY,m_nWidth,m_nHeight);
		// m_cVSplitter.MoveWin(m_x+m_nWidth / 2 - CSplitBase::SPLIT_SIZE / 2,m_y,m_nWidth,m_nHeight);
		m_cVSplitter.MoveWin(oldSplitterPosX,m_y,m_nWidth,m_nHeight);
		m_cHSplitter.SetVisible(true);
		m_cVSplitter.SetVisible(true);
		m_cView[0].SetVisible(true);
		m_cView[1].SetVisible(true);
		m_cView[2].SetVisible(true);
		m_cView[3].SetVisible(true);
		break;
	case VIEWMODE_INVISIBLE:
		m_cHSplitter.SetVisible(false);
		m_cVSplitter.SetVisible(false);
		m_cView[0].SetVisible(false);
		m_cView[1].SetVisible(false);
		m_cView[2].SetVisible(false);
		m_cView[3].SetVisible(false);
		break;
	}

	// �t�H�[�J�X�𓖂Ă�(�����ꂩ���t�H�[�J�X�������Ă���Ƃ��̂�)
	if ( IsFocused() )
	{
		m_cView[ 0 ].SetFocus();
	}
	
	// �ĕ`��
	if (bRedraw)
	{
		m_cView[ 0 ].Refresh();
	}
}

/*-------------------------------------------------------------------
CFooty::IsFocused
�����ꂩ�̃r���[���t�H�[�J�X�������Ă��邩�������鏈��
-------------------------------------------------------------------*/
bool CFooty::IsFocused(){
	// for (int i=0;i<3;i++)��for (int i=0;i<4;i++)�ɏC�� by Tetr@pod
	for (int i=0;i<4;i++){
		if (m_cView[i].IsFocused())return true;
	}
	return false;
}

/*-------------------------------------------------------------------
CFooty::Move
�ړ������邽�߂̊֐��ł��B
-------------------------------------------------------------------*/
bool CFooty::Move(int x,int y,int nWidth,int nHeight){
	if (nWidth < 0 || nHeight < 0)return false;
	
	/*���X�̕� by Tetr@pod*/
	int old_nWidth = m_nWidth;
	int old_nHeight = m_nHeight;

	/*�����o�ϐ��փR�s�[*/
	m_nWidth = nWidth;
	m_nHeight = nHeight;
	m_x = x;
	m_y = y;
	
	/*�X�v���b�g�o�[�𒲐�*/
	m_cVSplitter.OnBaseWindowMove(m_x,m_y,m_nWidth,m_nHeight);
	m_cHSplitter.OnBaseWindowMove(m_x,m_y,m_nWidth,m_nHeight);
	
	// �X�v���b�g�o�[�̈ʒu�������Œ�������悤�ɕύX by Tetr@pod
	/*���[�h�ɉ����ăr���[��ݒ肷��*/
	switch(m_nViewMode)
	{
	case VIEWMODE_NORMAL:
		m_cView[0].MoveWin(x,y,nWidth,nHeight);
		break;
	case VIEWMODE_VERTICAL:
		// m_cVSplitter.MoveWin(m_cVSplitter.GetX(),y,nWidth,nHeight);
		m_cVSplitter.MoveWin(m_cVSplitter.GetX() * nWidth / old_nWidth,y,nWidth,nHeight);// by Tetr@pod
		break;
	case VIEWMODE_HORIZONTAL:
		// m_cHSplitter.MoveWin(x,m_cHSplitter.GetY(),nWidth,nHeight);
		m_cHSplitter.MoveWin(x,m_cHSplitter.GetY() * nHeight / old_nHeight,nWidth,nHeight);// by Tetr@pod
		break;
	case VIEWMODE_QUAD:
		// m_cVSplitter.MoveWin(m_cVSplitter.GetX(),y,nWidth,nHeight);
		// m_cHSplitter.MoveWin(x,m_cHSplitter.GetY(),nWidth,nHeight);
		m_cVSplitter.MoveWin(m_cVSplitter.GetX() * nWidth / old_nWidth,y,nWidth,nHeight);// by Tetr@pod
		m_cHSplitter.MoveWin(x,m_cHSplitter.GetY() * nHeight / old_nHeight,nWidth,nHeight);// by Tetr@pod
		break;
	}
	
	/*�S�Ẵr���[�ŃL�����b�g���쐬����*/
	for (int i=0;i<4;i++){
		m_cView[i].CaretMove();
	}
	return true;
}

/*-------------------------------------------------------------------
CFooty::Undo
�A���h�D�������s���܂��B
-------------------------------------------------------------------*/
bool CFooty::Undo(){
	if (!m_cDoc.Undo())
		return false;
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++){
		if (m_cView[i].IsFocused()){
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_UNDO);
	return true;
}

/*-------------------------------------------------------------------
CFooty::Redo
���h�D�������s���܂�
-------------------------------------------------------------------*/
bool CFooty::Redo(){
	if (!m_cDoc.Redo())
		return false;
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++)
	{
		if (m_cView[i].IsFocused())
		{
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	/*�ĕ`��*/
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_REDO);
	return true;
}

/*-------------------------------------------------------------------
CFooty::Copy
�R�s�[�������s���܂��B
-------------------------------------------------------------------*/
bool CFooty::Copy()
{
	if (!m_cDoc.ClipCopy(m_cView[0].GetWnd()))
		return false;
	return true;
}

/*-------------------------------------------------------------------
CFooty::Cut
�؂��菈�����s���܂��B
-------------------------------------------------------------------*/
bool CFooty::Cut()
{
	if (!m_cDoc.ClipCopy(m_cView[0].GetWnd()))
		return false;
	m_cDoc.OnBackSpace();
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++){
		if (m_cView[i].IsFocused()){
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	/*�ĕ`��*/
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_CUT);
	return true;
}


/*-------------------------------------------------------------------
CFooty::Paste
�y�[�X�g�������s���܂��B
-------------------------------------------------------------------*/
bool CFooty::Paste()
{
	if (!m_cDoc.ClipPaste(m_cView[0].GetWnd()))
		return false;

	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++)
	{
		if (m_cView[i].IsFocused())
		{
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	/*�ĕ`��*/
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_PASTE);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetSelText
�I�𕶎�����Z�b�g���܂��B
-------------------------------------------------------------------*/
bool CFooty::SetSelText(const wchar_t *pString, bool recUndo)
{
	if (!m_cDoc.InsertString(pString, recUndo))return false;
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++)
	{
		if (m_cView[i].IsFocused())
		{
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	/*�ĕ`��*/
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_SETSELTEXT);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetText
��������Z�b�g���܂��B
-------------------------------------------------------------------*/
void CFooty::SetText(const wchar_t *pString)
{
	m_cDoc.SetText(pString);
	m_cView[0].Refresh();
}


/*-------------------------------------------------------------------
CFooty::SetLapel
�܂�Ԃ��ʒu��ݒ肵�܂��B
-------------------------------------------------------------------*/
bool CFooty::SetLapel(int nColumns,int nMode,bool bRedraw)
{
	/*�J�����������������ׂ�*/
	if (nColumns < 2)return false;

	/*�Z�b�g����*/
	m_cDoc.SetLapel(nColumns,nMode);
	for (int i=0;i<4;i++)
	{
		m_cView[i].SetVisibleCols();
		m_cView[i].SetFirstColumn(0);
	}
	if (bRedraw)m_cView[0].Refresh(true);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetFontSize
�t�H���g�̃T�C�Y��ݒ肵�܂�
-------------------------------------------------------------------*/
bool CFooty::SetFontSize(int nPoint,bool bRedraw)
{
	/*�|�C���g�T�C�Y�����������`�F�b�N����*/
	if (nPoint < 2)return false;
	
	/*�Z�b�g����*/
	HDC hDC = GetDC(m_hWndParent);
	m_cFonts.SetFontSize(nPoint,hDC);
	ReleaseDC(m_hWndParent,hDC);
	
	for (int i=0;i<4;i++)
	{
		m_cView[i].SetVisibleCols();
		m_cView[i].SetFirstColumn(0);
	}
	if (bRedraw)m_cView[0].Refresh(true);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetFontSize
�t�H���g�̃T�C�Y��ݒ肵�܂�
-------------------------------------------------------------------*/
bool CFooty::SetFontFace(int nType,const wchar_t *pFaceName,bool bRedraw)
{
	/*�Z�b�g����*/
	HDC hDC = GetDC(m_hWndParent);
	m_cFonts.SetFontFace(nType,pFaceName,hDC);
	ReleaseDC(m_hWndParent,hDC);
	
	for (int i=0;i<4;i++)
	{
		m_cView[i].SetVisibleCols();
		m_cView[i].SetFirstColumn(0);
	}
	if (bRedraw)m_cView[0].Refresh(true);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetForceFont
�w��t�H���g�̋����g�p by inovia
-------------------------------------------------------------------*/
bool CFooty::SetForceFont(int flag)
{
	/*�Z�b�g����*/
	m_cFonts.SetForceFont(flag);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetSpeedDraw
�w��t�H���g�̋����g�p by inovia
-------------------------------------------------------------------*/
bool CFooty::SetSpeedDraw(int flag)
{
	/*�Z�b�g����*/
	m_cDoc.SetSpeedDraw(flag);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetBackgroundImage
�w�i�摜��ݒ肷�鏈��
-------------------------------------------------------------------*/
bool CFooty::SetBackgroundImage(const wchar_t *pFilePath, bool bRedraw)
{
	/*�Z�b�g����*/
	
	for (int i=0;i<4;i++)
	{
		m_cView[i].ImageLoad(pFilePath);
	}
	if (bRedraw)m_cView[0].Refresh(true);
	return true;
}

/*-------------------------------------------------------------------
CFooty::ClearBackgroundImage
�w�i�摜���������鏈��
-------------------------------------------------------------------*/
bool CFooty::ClearBackgroundImage(bool bRedraw)
{
	/*�Z�b�g����*/
	
	for (int i=0;i<4;i++)
	{
		m_cView[i].ImageClear();
	}
	if (bRedraw)m_cView[0].Refresh(true);
	return true;
}
/*-------------------------------------------------------------------
CFooty::SetBackgroundColor
�w�i�F��ݒ肷�鏈��
-------------------------------------------------------------------*/
bool CFooty::SetBackgroundColor(COLORREF color)
{
	/*�Z�b�g����*/
	
	for (int i=0;i<4;i++)
	{
		m_cView[i].SetColor(color);
	}
	return true;
}
/*[EOF]*/
