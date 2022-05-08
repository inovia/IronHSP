/**
 * @file CFootyView�N���X
 * @brief ���̃t�@�C����GUI�`�揈����S�����܂��B
 * @author Shinji Watanabe
 * @version 1.0
 */

#include "FootyView.h"
#include "StaticStack.h"

#ifndef UNDER_CE
#	pragma comment (lib, "Msimg32.lib")
#endif	/*not defined UNDER_CE*/

/*-------------------------------------------------------------------
CFootyView::MoveWin
�傫���̕ύX�BbRefresh��false�̂Ƃ��A�����P�ɗ̈�v�Z�݂̂��s��
-------------------------------------------------------------------*/
bool CFootyView::MoveWin(int x,int y,int nWidth,int nHeight,bool bRefresh){
	/*�錾*/
	int nDrawAreaWidth;			/*�`��̈敝*/
	int nDrawAreaHeight;		/*�`��̈捂��*/

	/*��񂩂烁���o�ϐ���ݒ肷��*/
	m_x = x;					/*x���W*/
	m_y = y;					/*y���W*/
	m_nHeight = nHeight;		/*��*/
	m_nWidth = nWidth;			/*����*/
	
	/*�\���ł��錅��*/
	nDrawAreaWidth = nWidth - m_nLineCountWidth - GetSystemMetrics(SM_CXVSCROLL);
	if (nDrawAreaWidth > 0)
		m_nVisibleColumns = nDrawAreaWidth / (m_pFonts->GetWidth() + m_nWidthMargin);
	else
		m_nVisibleColumns = 0;

	/*�\���ł���s��*/
	if (m_nVisibleColumns <= m_pDocuments->GetLapelColumn())/*�����X�N���[����\�����Ă���*/
		nDrawAreaHeight = nHeight - m_nRulerHeight - GetSystemMetrics(SM_CYVSCROLL);
	else													/*�����X�N���[����\�����Ă��Ȃ�*/
		nDrawAreaHeight = nHeight - m_nRulerHeight;

	if (nDrawAreaHeight > 0)
		m_nVisibleLines = nDrawAreaHeight / (m_pFonts->GetHeight() + m_nHeightMargin);
	else
		m_nVisibleLines = 0;

	/*�ړ����čĕ`�揈��*/
	if (bRefresh){
		m_cDoubleBuffering.ChangeSize(m_hWnd,nWidth,nHeight);
		MoveWindow(m_hWnd,x,y,m_nWidth,m_nHeight,true);	/*�E�B���h�E�̈ړ�*/
		Refresh(false);
	}
	return true;
}

/*-------------------------------------------------------------------
CFootyView::SetVisible
�\���E��\���̐ݒ�
-------------------------------------------------------------------*/
void CFootyView::SetVisible(bool bVisible){
	ShowWindow(m_hWnd,bVisible ? SW_SHOWNORMAL : SW_HIDE);
	m_bVisible = bVisible;
}

/*-------------------------------------------------------------------
CFootyView::SetLineWidth
�s�ԍ��\������ݒ肷��
-------------------------------------------------------------------*/
void CFootyView::SetLineWidth(int nWidth){
	if (nWidth < 0)
		m_nLineCountWidth = LINEWIDTH_DEFAULT;
	else
		m_nLineCountWidth = nWidth;
	MoveWin(m_x,m_y,m_nWidth,m_nHeight,false);
}

/*-------------------------------------------------------------------
CFootyView::SetRulerHeight
���[���[�������w�肷��
-------------------------------------------------------------------*/
void CFootyView::SetRulerHeight(int nHeight){
	if (nHeight < 0)
		m_nRulerHeight = RULERHEIGHT_DEFAULT;
	else
		m_nRulerHeight = nHeight;
	MoveWin(m_x,m_y,m_nWidth,m_nHeight,false);
}

/*-------------------------------------------------------------------
CFootyView::SetMarginHeight
�}�[�W���������w�肷��
-------------------------------------------------------------------*/
void CFootyView::SetMarginHeight(int nHeight){
	if (nHeight < 0) {
		m_nHeightMargin = 0 ;
		m_nLineCountMargin = 0;
	} else {
		m_nHeightMargin = nHeight;
		m_nLineCountMargin = nHeight;
	}
	MoveWin(m_x,m_y,m_nWidth,m_nHeight,false);
}

//-----------------------------------------------------------------------------
/**
 * @brief �E�B���h�E�̋����ĕ`�揈���ł�
 * @param	bSendOther	[in] �قȂ�r���[�ɑ΂��Ă����𑗐M���邩�ǂ�����I�����܂�
 */
bool CFootyView::Refresh(bool bSendOther)
{
	if (m_bVisible)						// �ĕ`��͕\�����Ă���Ƃ��̂�
	{
		FOOTY2_PRINTF( L"���I���t���b�V���I %d\n", m_nFootyID );

		// �G������
		CaretMove();
		SetBars();

		/*// �F���� by Tetr@pod
		for (LinePt Line = m_pDocuments->GetTopLine(); Line != m_pDocuments->GetLastLine(); Line++) {
			m_pDocuments->SetLineInfo2(Line);
		}*/
		if (DrawAllUserFuncs) {
			for (LinePt Line = m_pDocuments->GetTopLine(); Line != m_pDocuments->GetLastLine(); ++Line) {
				m_pDocuments->FlushString2(Line);
				Line->SetEmphasisChached(false);
			}
			DrawAllUserFuncs = false;
			IsUFUpdateTiming = true;
		}

		// �ĕ`�揈����������
		HDC hDC = GetDC(m_hWnd);		// �f�o�C�X�R���e�L�X�g���擾
		FOOTY2_PRINTF( L"GetDC %d\n", m_nFootyID );
		if ( !hDC )
		{
			FOOTY2_PRINTF( L"But failed...\n", m_nFootyID );
			return false;
		}

		RECT rc;
		GetClientRect( m_hWnd, &rc );

		//FOOTY2_PRINTF( L"RECT %d,%d,%d,%d \n", rc.left, rc.top, rc.right, rc.bottom );
		//FOOTY2_PRINTF( L"�`��J�n�I\n");
		if (!Refresh(hDC,&rc))
		{
			ReleaseDC( m_hWnd, hDC );
			FOOTY2_PRINTF( L"ReleaseDC %d\n", m_nFootyID );
			return false;
		}
		//FOOTY2_PRINTF( L"�`��I���I\n");
		ReleaseDC(m_hWnd,hDC);			// �f�o�C�X�R���e�L�X�g�����
		FOOTY2_PRINTF( L"ReleaseDC %d\n", m_nFootyID );

		// ���̃r���[�֑��M����
		if (bSendOther)
		{
			for ( int i = 0; i < 4; i++ )
			{
				if (i != m_nViewID)
					m_pView[i].Refresh(false);
			}
		}
	}
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �w�肳�ꂽ�f�o�C�X�R���e�L�X�g�ւ̕`�揈��
 * @param hDC �`���f�o�C�X�R���e�L�X�g
 * @param rc �`����`
 */
bool CFootyView::Refresh(HDC hDC,const RECT *rc){
	// �錾
	int yNowPos;									//!< ���ݕ`�撆��y���W�ʒu
	CEthicLine cNowLine;							//!< ���ݕ`�撆�̍s��\��
	LineSize nLines = m_pDocuments->GetLineNum();	//!< �ҏW���̕����Ɋ܂܂��s�̑���
	SelOldInfo stOldInfo;							//!< �I��̈攽�]�̂��߂̋��f�o�C�X�R���e�L�X�g���
	HDC hDcBuffer = m_cDoubleBuffering.GetDC();

	// ������
	m_cCaret.Hide();
	DrawRectangle(hDcBuffer,0,0,rc->right,rc->bottom,m_pStatus->m_clBackGround);
	m_ImgCtr->Draw(hDcBuffer, 0, 0, rc->right, rc->bottom, m_cDoubleBuffering.GetWidth(), m_cDoubleBuffering.GetHeight() );

	SetBkMode(hDcBuffer,TRANSPARENT);

	// ���݂̕\���ʒu���烌���_�����O���Ă���
	cNowLine = *m_pDocuments->GetFirstVisible(m_nViewID);
	yNowPos = m_nRulerHeight - (int)(cNowLine.GetEthicNum() *
		(m_nHeightMargin + m_pFonts->GetHeight()));

	forever
	{
		// �����_�����O
		RendLine(hDcBuffer,cNowLine.GetLinePointer(),
				 yNowPos,cNowLine.GetLineNum() + 1 == nLines);
		// y���W��ύX����
		yNowPos += (int)((m_nHeightMargin + m_pFonts->GetHeight()) *
			(cNowLine.GetLinePointer()->GetEthicLine()));
		if (yNowPos >= rc->bottom)break;
		// ���̍s��
		if (!cNowLine.MoveRealNext(m_pDocuments->GetLineList(),1))
			break;
	}
	// �I��̈�̔��]
	if (m_pDocuments->IsSelecting()){
		// ���̏�����
		cNowLine = *m_pDocuments->GetFirstVisible(m_nViewID);
		yNowPos = m_nRulerHeight - (int)(cNowLine.GetEthicNum() *
			(m_nHeightMargin + m_pFonts->GetHeight()));
		// ���[�v�̊J�n
		InitDcForSelect(hDcBuffer,&stOldInfo);
		forever{
			// �I��̈�̔��]
			RendSelected(hDcBuffer,&cNowLine,yNowPos);						 
			// �����W��ύX����
			yNowPos += (int)((m_nHeightMargin + m_pFonts->GetHeight()) *
				cNowLine.GetLinePointer()->GetEthicLine());
			if (yNowPos >= rc->bottom)break;
			// ���̍s��
			if (!cNowLine.MoveRealNext(m_pDocuments->GetLineList(),1))
				break;
		}
		ReleaseDcForSelect(hDcBuffer,&stOldInfo);
	}

	// ���̂ق��t���p�[�c��`��
	RendLineCount(hDcBuffer,rc);
	RendRuler(hDcBuffer,rc);
	RendBorderLine(hDcBuffer,rc);

	// ���[�L���O�T�[�t�B�X����R�s�[����
	BitBlt(hDC,0,0,m_nWidth,m_nHeight,hDcBuffer,0,0,SRCCOPY);
	m_cDoubleBuffering.SetRendInfo(m_pDocuments->GetFirstVisible(m_nViewID));

	// �L�����b�g���A���_�[���C���͍Ō�Ɉ���
	RendUnderLine(hDC,rc);
	// �I������
	m_cCaret.Show();

	return true;
}

//-----------------------------------------------------------------------------
/** 
 * @brief �L�����b�g���������ꂽ�����̂Ƃ��ɌĂяo���ĕ`�惋�[�`���ł��B
 * @return ���������Ƃ�true�A���s�����Ƃ�false
 * @note ���̃r���[�͍ĕ`�悵�܂���B
 */
bool CFootyView::CaretRefresh()
{
	if (m_bVisible)					// �ĕ`��͕\�����Ă���Ƃ��̂�
	{
		if (!m_cDoubleBuffering.IsRendered())
		{
			return Refresh(false);
		}
		else
		{
			// �G������
			CaretMove();
			
			// �錾
			HDC hDC;
			HDC hDcBuffer = m_cDoubleBuffering.GetDC();
			RECT rc;
			
			// ������
			hDC = GetDC(m_hWnd);		// �f�o�C�X�R���e�L�X�g���擾
			if (!hDC)return false;
			FOOTY2_PRINTF( L"GetDC %d\n", m_nFootyID );
			GetClientRect( m_hWnd,&rc );// �`��G���A�擾
			m_cCaret.Hide();			// �L�����b�g��\��
			
			// �`��J�n
			RendLineCount(hDcBuffer,&rc);
			RendRuler(hDcBuffer,&rc);
			RendBorderLine(hDcBuffer,&rc);
			BitBlt(hDC,0,0,m_nWidth,m_nHeight,hDcBuffer,0,0,SRCCOPY);
			RendUnderLine(hDC,&rc);
			
			// �f�o�C�X�R���e�L�X�g�����
			m_cCaret.Show();			// �L�����b�g�\��
			ReleaseDC(m_hWnd,hDC);
			FOOTY2_PRINTF( L"ReleaseDC %d\n", m_nFootyID );
		}
	}
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �㉺�X�N���[�����ꂽ�Ƃ��ɍ����ĕ`����s���܂��B
 * @return ���������Ƃ�true�A���s�����Ƃ�false
 * @note ���̃r���[�͍ĕ`�悵�܂���
 */
bool CFootyView::ScrollRefresh()
{
	if (m_bVisible)					// �ĕ`��͕\�����Ă���Ƃ��̂�
	{
		// ���������s�\�łȂ����`�F�b�N����
		if (!m_cDoubleBuffering.IsRendered())
			return Refresh(false);
		
		// �ǂ̂��炢�X�N���[�����ꂽ�����ׂ�
		CEthicLine lnBeforeLast = *m_cDoubleBuffering.GetFirstVisible();
		lnBeforeLast.MoveEthicNext(m_pDocuments->GetLineList(),m_nVisibleLines);
		CEthicLine lnAfterLast = *m_pDocuments->GetFirstVisible(m_nViewID);
		lnAfterLast.MoveEthicNext(m_pDocuments->GetLineList(),m_nVisibleLines);

		int nScrolledNum = m_cDoubleBuffering.GetFirstVisible()->GetDifference
		(
			*m_pDocuments->GetFirstVisible(m_nViewID),
			m_pDocuments->GetLineList()
		);
		
		HDC hDC = m_cDoubleBuffering.GetDC();
		
		// �S���X�N���[������Ă܂���
		if (nScrolledNum == 0)
		{
			FOOTY2_PRINTF( L"not scrolled\n" );
			return true;
		}
		// ���փX�N���[�����ꂽ�Ƃ�
		else if (0 < nScrolledNum && nScrolledNum < (int)m_nVisibleLines)
		{
			FOOTY2_PRINTF( L"scroll down\n" );
			CaretMove();
			SetBars();
			BitBlt(hDC,0,0,m_nWidth,m_nHeight,hDC,0,nScrolledNum * (m_pFonts->GetHeight() + m_nHeightMargin),SRCCOPY);
			RenderLines(lnBeforeLast.GetLinePointer(),lnAfterLast.GetLinePointer());
		}
		// ��փX�N���[�����ꂽ�Ƃ�
		else if ((-(int)m_nVisibleLines) < nScrolledNum && nScrolledNum < 0)
		{
			FOOTY2_PRINTF( L"scroll up\n" );
			CaretMove();
			SetBars();
			BitBlt(hDC,0,0,m_nWidth,m_nHeight,hDC,0,nScrolledNum * (m_pFonts->GetHeight() + m_nHeightMargin),SRCCOPY);
			RenderLines(m_pDocuments->GetFirstVisible(m_nViewID)->GetLinePointer(),m_cDoubleBuffering.GetFirstVisible()->GetLinePointer());
		}
		// ��ʂ�����
		else
		{
			FOOTY2_PRINTF( L"scroll too much\n" );
			return Refresh(false);
		}
	}
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �w�肳�ꂽ�s�Ԃ݂̂��ĕ`�悷�鏈���B�w�肳�ꂽ�s�͂ǂ��炪��łǂ��炪���ł����܂��܂���B
 * @param pLine1 �s1
 * @param pLine2 �s2
 * @note ���̃r���[���ĕ`�悵�܂��B
 */
bool CFootyView::LineChangedRefresh(LinePt pLine1, LinePt pLine2)
{
	// �J�n�s�ƏI���s�𒲂ׂ�
	LinePt pStartLine = pLine1->GetRealLineNum() <  pLine2->GetRealLineNum() ? pLine1 : pLine2;
	LinePt pEndLine   = pLine1->GetRealLineNum() >= pLine2->GetRealLineNum() ? pLine1 : pLine2;

	// �L�����b�g�ʒu��K�؂Ȃ��̂ɁB�X�N���[���o�[�͕ω����Ȃ��c�͂��B
	CaretMove();

	// �S�čĕ`��
	for (int i=0;i<4;i++){
		if (m_pView[i].m_bVisible){
			m_pView[i].RenderLines(pStartLine, pEndLine);
		}
	}

	return true;
}


//-----------------------------------------------------------------------------
/**
 * @brief �w�肳�ꂽ�s�Ԃ݂̂��ĕ`�悷�鏈��
 * @param pStartLine �J�n�s
 * @param pEndLine �I���s
 * @note ���̃r���[�͍ĕ`�悵�܂���B
 */
bool CFootyView::RenderLines(LinePt pStartLine,LinePt pEndLine)
{
	// �錾
	int yNowPos;									//!< ���ݕ`�撆��y���W�ʒu
	CEthicLine cNowLine;							//!< ���ݕ`�撆�̍s��\��
	LineSize nLines = m_pDocuments->GetLineNum();	//!< �ҏW���̕����Ɋ܂܂��s�̑���
	SelOldInfo stOldInfo;							//!< �I��̈攽�]�̂��߂̋��f�o�C�X�R���e�L�X�g���
	HDC hDcBuffer = m_cDoubleBuffering.GetDC();

	// ������
	RECT rc;
	SetRect(&rc,0,0,m_nWidth,m_nHeight);
	m_cCaret.Hide();
	SetBkMode(hDcBuffer,TRANSPARENT);

	// ���݂̕\���ʒu���烌���_�����O���Ă���
	cNowLine = *m_pDocuments->GetFirstVisible(m_nViewID);
	yNowPos = m_nRulerHeight - (int)(cNowLine.GetEthicNum() *
		(m_nHeightMargin + m_pFonts->GetHeight()));
	forever{
		int yNext = yNowPos + (int)cNowLine.GetLinePointer()->GetEthicLine() * (m_nHeightMargin + m_pFonts->GetHeight());
	
		// �����_�����O
		if (pStartLine->GetRealLineNum() <= cNowLine.GetLineNum() &&
			cNowLine.GetLineNum() <= pEndLine->GetRealLineNum()){
			
			DrawRectangle(hDcBuffer,0,yNowPos,rc.right,yNext,m_pStatus->m_clBackGround);
			m_ImgCtr->Draw(hDcBuffer, 0, yNowPos, rc.right, yNext, m_cDoubleBuffering.GetWidth(), m_cDoubleBuffering.GetHeight() );
			RendLine(hDcBuffer,cNowLine.GetLinePointer(),yNowPos,cNowLine.GetLineNum() + 1 == nLines);
		}

		// y���W��ύX����
		yNowPos = yNext;
		if (yNowPos >= rc.bottom)break;

		// ���̍s��
		if (!cNowLine.MoveRealNext(m_pDocuments->GetLineList(),1))
			break;
	}
	DrawRectangle(hDcBuffer,0,yNowPos,rc.right,rc.bottom,m_pStatus->m_clBackGround);
	m_ImgCtr->Draw(hDcBuffer, 0, yNowPos, rc.right, rc.bottom, m_cDoubleBuffering.GetWidth(), m_cDoubleBuffering.GetHeight() );

	// �I��̈�̔��]
	if (m_pDocuments->IsSelecting()){
		// ���̏�����
		cNowLine = *m_pDocuments->GetFirstVisible(m_nViewID);
		yNowPos = m_nRulerHeight - (int)(cNowLine.GetEthicNum() *
			(m_nHeightMargin + m_pFonts->GetHeight()));
		// ���[�v�̊J�n
		InitDcForSelect(hDcBuffer,&stOldInfo);
		forever{
			// �I��̈�̔��]
			if (pStartLine->GetRealLineNum() <= cNowLine.GetLineNum() &&
				cNowLine.GetLineNum() <= pEndLine->GetRealLineNum())
				RendSelected(hDcBuffer,&cNowLine,yNowPos);						 
			// �����W��ύX����
			yNowPos += (int)((m_nHeightMargin + m_pFonts->GetHeight()) *
				cNowLine.GetLinePointer()->GetEthicLine());
			if (yNowPos >= rc.bottom)break;
			// ���̍s��
			if (!cNowLine.MoveRealNext(m_pDocuments->GetLineList(),1))
				break;
		}
		ReleaseDcForSelect(hDcBuffer,&stOldInfo);
	}

	// ���̂ق��t���p�[�c��`��
	RendLineCount(hDcBuffer,&rc);
	RendRuler(hDcBuffer,&rc);
	RendBorderLine(hDcBuffer,&rc);

	// ���[�L���O�T�[�t�B�X����R�s�[����
	HDC hDC = GetDC( m_hWnd );
	FOOTY2_PRINTF( L"GetDC %d\n", m_nFootyID );
	BitBlt(hDC,0,0,m_nWidth,m_nHeight,hDcBuffer,0,0,SRCCOPY);
	m_cDoubleBuffering.SetRendInfo(m_pDocuments->GetFirstVisible(m_nViewID));
	RendUnderLine(hDC,&rc);
	ReleaseDC( m_hWnd, hDC );
	FOOTY2_PRINTF( L"ReleaseDC %d\n", m_nFootyID );

	// �I������
	m_cCaret.Show();
	return true;
}


//-----------------------------------------------------------------------------
/**
 * @brief �w�肳�ꂽ��s���̃f�[�^�������_�����O���܂��B
 * @param hDC �`���f�o�C�X�R���e�L�X�g
 * @param pLine �`�悷��s�f�[�^
 * @param x �`���x���W
 * @param y �`���y���W
 * @param bEnd ���̍s���ŏI�s�ł��邩�H
 */
bool CFootyView::RendLine(HDC hDC,LinePt pLine,int y,bool bEnd)
{
	if (!hDC)return false;

	//! �`�惂�[�h
	enum RendMode
	{
		RM_NORMAL,										//!< �ʏ핶����̃����_�����O��
		RM_URL,											//!< URL�̃����_�����O��
		RM_MAIL,										//!< ���[���̃����_�����O��
		RM_LABEL,										//!< ���x���̃����_�����O�� by Tetr@pod
		RM_FUNC,										//!< ���߁E�֐��̃����_�����O�� by Tetr@pod
	};
	
	/*�錾*/
	size_t nSize = pLine->GetLineLength();				//!< ������̒���
	const wchar_t *pNowChar = pLine->GetLineData();		//!< ���ݕ`�悵�Ă��镶��
	int nColumn = 0;									//!< ���ݕ`�悷��ʒu
	CStaticStack<COLORREF,sizeof(int)*8+3> StackColor;	//!< �`�悷��F�̃X�^�b�N
	RendMode nRendMode = RM_NORMAL;						//!< ���݂̕`�惂�[�h(�m�[�}���AURL�A���[���A���x���A���߁E�֐�)
	CFootyLine::CharSets nCharSets;
	int nStartUrl;										//!< URL�A���[���A�h���X�A���x���A���߁E�֐��̊J�nx���W

	// �������p
	int nFirstVisCol = m_nFirstVisibleColumn;
	int nVisColms = (int)m_nVisibleColumns;
	int nNowEthicLine = 0;
	size_t nLapelColumn = m_pDocuments->GetLapelColumn();
	int nLapelMode = m_pDocuments->GetLapelMode();
	UrlIterator pNowUrl = pLine->GetUrlInfo()->begin();
	UrlIterator pEndUrl = pLine->GetUrlInfo()->end();
	UrlIterator pNowMail = pLine->GetMailInfo()->begin();
	UrlIterator pEndMail = pLine->GetMailInfo()->end();
	UrlIterator pNowLabel = pLine->GetLabelInfo()->begin();// by Tetr@pod
	UrlIterator pEndLabel = pLine->GetLabelInfo()->end();// by Tetr@pod
	UrlIterator pNowFunc = pLine->GetFuncInfo()->begin();// by Tetr@pod
	UrlIterator pEndFunc = pLine->GetFuncInfo()->end();// by Tetr@pod

	// �����_�����O�̂��߂̏�����
	SetTextColor(hDC,m_pStatus->m_clDefaultLetter);
	StackColor.push(m_pStatus->m_clDefaultLetter);
	
	// URL�A���[���A���x���p�̃y�����쐬����
	HPEN hPenURL,hPenMail,hPenLabel;// hPenLabel by Tetr@pod
#ifdef UNDER_CE
	hPenMail = CreatePen(PS_SOLID,1,m_pStatus->m_clMailUnder);
	hPenURL = CreatePen(PS_SOLID,1,m_pStatus->m_clUrlUnder);
	hPenLabel = CreatePen(PS_SOLID,1,m_pStatus->m_clLabelUnder);// by Tetr@pod
#else	/*UNDER_CE*/
	hPenMail = CreatePen(PS_DOT,1,m_pStatus->m_clMailUnder);
	hPenURL = CreatePen(PS_DOT,1,m_pStatus->m_clUrlUnder);
	hPenLabel = CreatePen(PS_DOT,1,m_pStatus->m_clLabelUnder);// by Tetr@pod
#endif	/*UNDER_CE*/

	// �L���b�V�������邩�m�F���Ă���
	if (!pLine->EmphasisChached())
		m_pDocuments->SetChacheCommand(pLine);
	std::vector<CFootyLine::EmpPos>::iterator pNowCommand = pLine->GetColorInfo()->begin();
	std::vector<CFootyLine::EmpPos>::iterator pEndCommand = pLine->GetColorInfo()->end();

	// �P�s���̃f�[�^�������_�����O����
	for (size_t i=0;i<nSize;i++,pNowChar++){
		// ���߁E�֐��H by Tetr@pod
		if (pNowFunc != pEndFunc){
			if (pNowFunc->m_nStartPos == i){
				nRendMode = RM_FUNC;
				switch (pNowFunc->m_nKind){
				case 0:
					SetTextColor(hDC,m_pStatus->m_clFunc1);
					break;
				case 1:
					SetTextColor(hDC,m_pStatus->m_clFunc2);
					break;
				case 2:
					SetTextColor(hDC,m_pStatus->m_clFunc3);
					break;
				case 3:
					SetTextColor(hDC,m_pStatus->m_clFunc4);
					break;
				case 4:
					SetTextColor(hDC,m_pStatus->m_clFunc5);
					break;
				case 5:
					SetTextColor(hDC,m_pStatus->m_clFunc6);
					break;
				case 6:
					SetTextColor(hDC,m_pStatus->m_clFunc7);
					break;
				case 7:
					SetTextColor(hDC,m_pStatus->m_clFunc8);
					break;
				}
				nStartUrl = GetTextPosX(nColumn);
			}
			if (pNowFunc->m_nEndPos == i){
				nRendMode = RM_NORMAL;
				SetTextColor(hDC,StackColor.top());
				pNowFunc++;
			}
		}
		// ���x���H by Tetr@pod
		if (pNowLabel != pEndLabel){
			if (nRendMode != RM_FUNC){									// �Ƃ肠�������߁E�֐��D��A��쓮�h�~
				if (pNowLabel->m_nStartPos == i){
					nRendMode = RM_LABEL;
					SetTextColor(hDC,m_pStatus->m_clLabel);
					nStartUrl = GetTextPosX(nColumn);
				}
				if (pNowLabel->m_nEndPos == i){
					nRendMode = RM_NORMAL;
					SetTextColor(hDC,StackColor.top());
					pNowLabel++;
					// �A���_�[���C���̕`��
					SelectObject(hDC,hPenLabel);
					MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
					LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
				}
			}
		}
		// URL�H
		if (pNowUrl != pEndUrl){
			if (nRendMode != RM_LABEL && nRendMode != RM_FUNC){									// URL��胉�x���A���߁E�֐��D��
				if (pNowUrl->m_nStartPos == i){
					nRendMode = RM_URL;
					SetTextColor(hDC,m_pStatus->m_clUrl);
					nStartUrl = GetTextPosX(nColumn);
				}
			}
			if (pNowUrl->m_nEndPos == i){
				nRendMode = RM_NORMAL;
				SetTextColor(hDC,StackColor.top());
				pNowUrl++;
				// �A���_�[���C���̕`��
				SelectObject(hDC,hPenURL);
				MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
				LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
			}
		}
		// ���[���A�h���X�H
		if (pNowMail != pEndMail){
			if (nRendMode != RM_URL && nRendMode != RM_LABEL && nRendMode != RM_FUNC){			// ���[���A�h���X���URL�A���x���A���߁E�֐��D��
				if (pNowMail->m_nStartPos == i){
					nRendMode = RM_MAIL;
					SetTextColor(hDC,m_pStatus->m_clMail);
					nStartUrl = GetTextPosX(nColumn);
				}
			}
			if (pNowMail->m_nEndPos == i){
				nRendMode = RM_NORMAL;
				SetTextColor(hDC,StackColor.top());
				pNowMail++;
				// �A���_�[���C���̕`��
				SelectObject(hDC,hPenMail);
				MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
				LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
			}
		}
		
		// ���̈ʒu�̃R�}���h���X�^�b�N�ɐς�
		for (;pNowCommand != pEndCommand;pNowCommand++){
			if (pNowCommand->m_nPosition == i){			// �����ʒu
				if (pNowCommand->m_bIsStart){
					if (nRendMode == RM_NORMAL)
						SetTextColor(hDC,pNowCommand->m_Color);
					StackColor.push(pNowCommand->m_Color);
				}
				else{
					StackColor.pop();
					if (nRendMode == RM_NORMAL)
						SetTextColor(hDC,StackColor.top());
				}
			}
			else break;									// �Ⴄ�ʒu�̎��̓��[�v�𔲂���
		}
		// �����������_�����O(�`��G���A�̒��̂�)
		if (*pNowChar == L'\t'){						// �^�u����
			if (nFirstVisCol <= nColumn && nColumn <= nFirstVisCol + (int)nVisColms && ((m_nMarkVisible & EDM_TAB) != 0)){
				SetTextColor(hDC,m_pStatus->m_clTab);
				m_pFonts->UseFont(hDC,FFM_ANSI_CHARSET);
				ExtTextOutW(hDC,GetTextPosX(nColumn),y,0,NULL,L">",1,NULL);
				SetTextColor(hDC,StackColor.top());
			}
			for (nColumn++;;nColumn++){
				if (nColumn % m_pDocuments->GetTabLen() == 0)
					break;
			}
		}
		else{
			// ���̕������擾����
			if (CFootyLine::IsSurrogateLead(*pNowChar))
				nCharSets = CFootyLine::GetCharSets(*pNowChar,*(pNowChar+1));
			else
				nCharSets = CFootyLine::GetCharSets(*pNowChar);
			// �t�H���g�̃Z�b�g
			if (nFirstVisCol - 1 <= nColumn && nColumn <= nFirstVisCol + (int)nVisColms){
				switch (nCharSets){
				case CFootyLine::CHARSETS_ANSI_ALPHABET:		// ANSI(�A���t�@�x�b�g)
				case CFootyLine::CHARSETS_ANSI_NUMBER:			// ANSI(����)
				case CFootyLine::CHARSETS_ANSI_SYMBOL:			// ANSI(�A���_�[�o�[�������L��)
				case CFootyLine::CHARSETS_ANSI_UNDER:			// ANSI�A���_�[�o�[)
					m_pFonts->UseFont(hDC,FFM_ANSI_CHARSET);
					break;
				case CFootyLine::CHARSETS_HIRAGANA:				// ���{��(�Ђ炪��)
				case CFootyLine::CHARSETS_KATAKANA:				// ���{��(�J�^�J�i)
				case CFootyLine::CHARSETS_KATAKANA_HALF:		// ���{��(���p�J�^�J�i)					
				case CFootyLine::CHARSETS_FULL_ALPHABET:		// �S�p�A���t�@�x�b�g
				case CFootyLine::CHARSETS_FULL_NUMBER:			// �S�p����
				case CFootyLine::CHARSETS_AINU_EXTENSION:		// �A�C�k��p�g��
				case CFootyLine::CHARSETS_SYMBOLS:				// �L��
				case CFootyLine::CHARSETS_JP_NOBASHI:			// ���{��̂΂���
				case CFootyLine::CHARSETS_IPA_EXTENSION:		// IPA�g��
					m_pFonts->UseFont(hDC,FFM_SHIFTJIS_CHARSET);
					break;
				case CFootyLine::CHARSETS_KANJI:				// ����
					m_pFonts->UseKanjiFont(hDC);
					break;
				case CFootyLine::CHARSETS_KOREA:				// �؍���
					m_pFonts->UseFont(hDC,FFM_HANGUL_CHARSET);
					break;
				case CFootyLine::CHARSETS_LATIN:				// ���e��
					
					break;
				case CFootyLine::CHARSETS_BALTIC:				// �o���g����
					m_pFonts->UseFont(hDC,FFM_BALTIC_CHARSET);
					break;
				case CFootyLine::CHARSETS_ARABIC:				// �A���r�A
					m_pFonts->UseFont(hDC,FFM_ARABIC_CHARSET);
					break;
				case CFootyLine::CHARSETS_HEBREW:				// �w�u���C
					m_pFonts->UseFont(hDC,FFM_HEBREW_CHARSET);
					break;
				case CFootyLine::CHARSETS_GREEK:				// �M���V��
					m_pFonts->UseFont(hDC,FFM_GREEK_CHARSET);
					break;
				case CFootyLine::CHARSETS_CYRILLIC:				// �L��������
					m_pFonts->UseFont(hDC,FFM_RUSSIAN_CHARSET);
					break;
				case CFootyLine::CHARSETS_VIETTNAMESE:			// �x�g�i����
					m_pFonts->UseFont(hDC,FFM_VIETNAMESE_CHARSET);
					break;
				case CFootyLine::CHARSETS_THAI:					// �^�C��
					m_pFonts->UseFont(hDC,FFM_THAI_CHARSET);
					break;
				default:
					m_pFonts->UseFont(hDC,FFM_ANSI_CHARSET);
					break;
				}

				// �F�Z�b�g
				if (*pNowChar == L'�@'){
					if ((m_nMarkVisible & EDM_FULL_SPACE) != 0){
						SetTextColor(hDC,m_pStatus->m_clNormalSpace);
						m_pFonts->UseFont(hDC,FFM_SHIFTJIS_CHARSET);
						ExtTextOutW(hDC,GetTextPosX(nColumn),y,0,NULL,L"��",1,NULL);
						SetTextColor(hDC,StackColor.top());
					}
				}
				else if (*pNowChar == L' '){
					if ((m_nMarkVisible & EDM_HALF_SPACE) != 0){
						SetTextColor(hDC,m_pStatus->m_clHalfSpace);
						m_pFonts->UseFont(hDC,FFM_ANSI_CHARSET);
						ExtTextOutW(hDC,GetTextPosX(nColumn),y,0,NULL,L"`",1,NULL);
						SetTextColor(hDC,StackColor.top());
					}
				}
				else{
					// �T���Q�[�g�y�A�𗘗p���������̕`�揈��
					if (CFootyLine::IsSurrogateLead(*pNowChar) && i != nSize - 1){
						ExtTextOutW(hDC,GetTextPosX(nColumn),y,0,NULL,pNowChar,2,NULL);
						i++;pNowChar++;
					}
					// �ʏ�̕����̕`�揈��
					else{
						//FOOTY2_PRINTF( L"Drawing %s\n", pNowChar );
						ExtTextOutW(hDC,GetTextPosX(nColumn),y,0,NULL,pNowChar,1,NULL);
					}
				}
			}
			// �������`��ʒu���߂��Ă��āA�T���Q�[�g�y�A�̂Ƃ��̓|�C���^�����ړ�����
			else if (CFootyLine::IsSurrogateLead(*pNowChar)){
				i++;pNowChar++;
			}
			
			// x���W�𑝂₷
			if (CFootyLine::IsDualChar(nCharSets))
				nColumn += 2;
			else
				nColumn ++;
		}

		// �������̈ʒu�͕`�悷��ʒu���I�����Ă���H
		if (pLine->GetEthicLine() == nNowEthicLine + 1 &&
			nFirstVisCol + (int)nVisColms + 1 < nColumn)
			break;

		// ���̍s�ֈړ����邩�H
		if (pLine->IsGoNext(pNowChar,i,nColumn,nLapelColumn,nLapelMode)){
			// URL�A���_�[���C���̌�n��
			switch(nRendMode){
			case RM_URL:
				SelectObject(hDC,hPenURL);
				MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
				LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
				nStartUrl = GetTextPosX(0);
				break;
			case RM_MAIL:
				SelectObject(hDC,hPenMail);
				MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
				LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
				nStartUrl = GetTextPosX(0);
				break;
			case RM_LABEL:// by Tetr@pod
				SelectObject(hDC,hPenLabel);
				MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
				LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
				nStartUrl = GetTextPosX(0);
				break;
			}
			// ���̍s��
			nColumn = 0;
			nNowEthicLine++;
			y += m_pFonts->GetHeight() + m_nHeightMargin;
		}
	}

	// URL�A���_�[���C���̌�n��
	switch(nRendMode){
	case RM_URL:
		SelectObject(hDC,hPenURL);
		MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
		LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
		break;
	case RM_MAIL:
		SelectObject(hDC,hPenMail);
		MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
		LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
		break;
	case RM_LABEL:// by Tetr@pod
		SelectObject(hDC,hPenLabel);
		MoveToEx(hDC,nStartUrl,y+m_pFonts->GetHeight(),NULL);
		LineTo(hDC,GetTextPosX(nColumn),y+m_pFonts->GetHeight());
		break;
	}
	
	// �s���̃}�[�N��`�悷��
	if (bEnd && ((m_nMarkVisible & EDM_EOF) != 0)){
		m_pFonts->UseFont(hDC,FFM_ANSI_CHARSET);
		SetTextColor(hDC,m_pStatus->m_clEOF);
		ExtTextOutW(hDC,GetTextPosX(nColumn),y,0,NULL,L"[EOF]",5,NULL);
	}
	else if ((m_nMarkVisible & EDM_LINE) != 0){
		m_pFonts->UseFont(hDC,FFM_SHIFTJIS_CHARSET);
		SetTextColor(hDC,m_pStatus->m_clCrlf);
		ExtTextOutW(hDC,GetTextPosX(nColumn),y,0,NULL,L"��",1,NULL);
	}
	
	// �I�u�W�F�N�g�j��
	DeleteObject(hPenURL);
	DeleteObject(hPenMail);
	DeleteObject(hPenLabel);// by Tetr@pod
	return true;
}

/*----------------------------------------------------------------
CFootyView::InitDcForSelect
�I��̈�̕`��̂��߂Ƀf�o�C�X�R���e�L�X�g�������B
pSelInfo�ɂ͌��̏����i�[���邽�߂̍\���̂ւ̃|�C���^
----------------------------------------------------------------*/
bool CFootyView::InitDcForSelect(HDC hDC,SelOldInfo *pSelInfo){
	if (!hDC || !pSelInfo)return false;
	/*GDI�I�u�W�F�N�g�̍쐬*/
	pSelInfo->m_hPen = CreatePen(PS_SOLID,1,RGB(255,255,255));
	pSelInfo->m_hBrush = CreateSolidBrush(RGB(255,255,255));
	/*�f�o�C�X�R���e�L�X�g�ɑ΂��đI���������s�킹��*/
	pSelInfo->m_hPenOld = (HPEN)SelectObject(hDC,pSelInfo->m_hPen);
	pSelInfo->m_hBrushOld = (HBRUSH)SelectObject(hDC,pSelInfo->m_hBrush);
	pSelInfo->m_nRopOld = SetROP2(hDC,m_nRop2);
	return true;
}

/*----------------------------------------------------------------
CFootyView::ReleaseDcForSelect
�I��̈�`�悪�I�������Ăяo���A�f�o�C�X�R���e�L�X�g������
�߂����߂̃��[�`���BpSelInfo�ɂ͌��ɏ�����ꂽ�\���̂ւ̃|�C���^
----------------------------------------------------------------*/
bool CFootyView::ReleaseDcForSelect(HDC hDC,CFootyView::SelOldInfo *pSelInfo){
	if (!hDC || !pSelInfo)return false;
	/*���̕���I��������*/
	SelectObject(hDC,pSelInfo->m_hPenOld);
	SelectObject(hDC,pSelInfo->m_hBrushOld);
	SetROP2(hDC,pSelInfo->m_nRopOld);
	/*�I�u�W�F�N�g��j�󂷂�*/
	DeleteObject(pSelInfo->m_hPen);
	DeleteObject(pSelInfo->m_hBrush);
	return true;
}

/*----------------------------------------------------------------
CFootyView::RendSelected
�I���G���A��`�悷�鏈��
----------------------------------------------------------------*/
bool CFootyView::RendSelected(HDC hDC,CEthicLine *pLine,int y){
	if (!hDC || !pLine)return false;
	/*�錾*/
	size_t i;														//!< ���[�v�J�E���^
	bool bSelCrlf = false;											//!< ���s�ʒu�𔽓]�����邩�ǂ���
	CEditPosition *pSelStartPos = m_pDocuments->GetSelStart();		//!< �I���J�n�ʒu
	CEditPosition *pSelEndPos = m_pDocuments->GetSelEnd();			//!< �I���I���ʒu
	size_t nEthicLine = pLine->GetLinePointer()->GetEthicLine();	//!< ���̍s�̘_���s�̐�
	size_t nSelStartPosition,nSelEndPosition;						//!< ���̍s�ɂ�����I�������
	CFootyLine::EthicInfo stSelStartInfo,stSelEndInfo;				//!< ���̘_���s���
	int nRectangleStartX,nRectangleEndX;							//!< �v�Z�p
	
	/*�J�n��Έʒu��ݒ肷��*/
	if (*pLine > *pSelStartPos)
		nSelStartPosition = 0;
	else if (*pLine == *pSelStartPos)
		nSelStartPosition = pSelStartPos->GetPosition();
	else return true;
	
	if (*pLine == *pSelEndPos)
		nSelEndPosition = pSelEndPos->GetPosition();
	else if (*pLine < *pSelEndPos){
		nSelEndPosition = pLine->GetLinePointer()->GetLineLength();
		bSelCrlf = true;
	}
	else return true;

	/*���[�v�p�̃f�[�^�𐶐�*/
	stSelStartInfo = pLine->GetLinePointer()->CalcEthicLine(nSelStartPosition,
		m_pDocuments->GetLapelColumn(),
		m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
	stSelEndInfo = pLine->GetLinePointer()->CalcEthicLine(nSelEndPosition,
		m_pDocuments->GetLapelColumn(),
		m_pDocuments->GetTabLen(),
		m_pDocuments->GetLapelMode());
	nRectangleStartX = (int)(m_nLineCountWidth + 
		(stSelStartInfo.m_nEthicColumn - m_nFirstVisibleColumn) *
		(m_pFonts->GetWidth() + m_nWidthMargin));
	nRectangleEndX = (int)(m_nLineCountWidth +
		(stSelEndInfo.m_nEthicColumn - m_nFirstVisibleColumn) *
		(m_pFonts->GetWidth() + m_nWidthMargin));
	/*���[�v�ŉ񂵂đI��̈�𔽓]������*/
	for (i=0;i<nEthicLine;i++){
		/*���̘_���s�̏�Ԃɂ���ĕ���*/
		if (i == stSelStartInfo.m_nEthicLine && i == stSelEndInfo.m_nEthicLine){
			Rectangle(hDC,nRectangleStartX,y,
				nRectangleEndX+(bSelCrlf ? m_pFonts->GetWidth()*2 : 0),
				y+m_pFonts->GetHeight()+m_nHeightMargin);
			break;
		}
		else if (i == stSelStartInfo.m_nEthicLine)
			Rectangle(hDC,nRectangleStartX,y,m_nWidth,
				y+m_pFonts->GetHeight()+m_nHeightMargin);
		else if (i == stSelEndInfo.m_nEthicLine){
			Rectangle(hDC,m_nLineCountWidth,y,
				nRectangleEndX+(bSelCrlf ? m_pFonts->GetWidth()*2 : 0),
				y+m_pFonts->GetHeight()+m_nHeightMargin);
			break;
		}
		else if (stSelStartInfo.m_nEthicLine < i && i < stSelEndInfo.m_nEthicLine)
			Rectangle(hDC,m_nLineCountWidth,y,m_nWidth,
				y+m_pFonts->GetHeight()+m_nHeightMargin);
		/*y���W�𒲐�����*/
		y += m_pFonts->GetHeight() + m_nHeightMargin;
	}
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �s�ԍ��\���̈��`�悷�鏈���ł��B
 * @param hDC �`���f�o�C�X�R���e�L�X�g
 * @param rc �`����`
 * @return �`��ɐ��������Ƃ�true
 */
bool CFootyView::RendLineCount(HDC hDC,const RECT *rc){
	if (!hDC || !rc)return false;					// �o�C�X�R���e�L�X�g���s��
	if (!m_nLineCountWidth)return true;				// �`�悷��K�v���Ȃ�

	// �錾
	const size_t TEMP_BUFFER = 20;					//!< �o�b�t�@�T�C�Y
	wchar_t szTempBuf[TEMP_BUFFER + 1];				//!< �`�悷�镶����̈ꎞ�o�b�t�@
	CEthicLine cNowLine = *m_pDocuments->GetFirstVisible(m_nViewID); //!< �`�悵�Ă���ʒu
	int nPosX,nPosY;								//!< �e�L�X�g�`��ʒu
	int nTextLen;									//!< �`�悷��e�L�X�g�̒���
	SIZE sizTextRender;								//!< �`�悷��͈�
	HDC hDcBitmap = CreateCompatibleDC(hDC);

	// �`��̂��߂̏�����
	m_pFonts->UseFont(hDC,FFM_ANSI_CHARSET);
	SetTextColor(hDC,m_pStatus->m_clLineNum);
	
	// �`��G���A��������
	DrawRectangle(hDC,0,m_nRulerHeight,m_nLineCountWidth,
				  rc->bottom,m_pStatus->m_clBackGround);	// �s�ԍ��\���̈�̏�����

	// ���݂̍s�̈ʒu����������
	if (m_bIsFocused){
		if (m_nRulerHeight <= m_cCaret.GetNowY() && m_cCaret.GetNowY() < m_nHeight)
			DrawRectangle(hDC,0,m_cCaret.GetNowY(),m_nLineCountWidth-m_nLineCountMargin,
				m_cCaret.GetNowY() + m_pFonts->GetHeight() + m_nHeightMargin,m_pStatus->m_clCaretLine);
	}

	// �����_�����O�J�n
	for (nPosY = m_nRulerHeight;nPosY < rc->bottom;nPosY += m_pFonts->GetHeight() + m_nHeightMargin ){
		// �����_�����O�������s��
		if (!cNowLine.GetEthicNum()){				// �s�ԍ��͍ŏ��̘_���s�̂Ƃ��̂ݕ\��
			// �s�ԍ���\��������
			FOOTY2SPRINTF(szTempBuf, TEMP_BUFFER, L"%d", cNowLine.GetLineNum()+1);
			nTextLen = (int)wcslen(szTempBuf);
			GetTextExtentPoint32W(hDC, szTempBuf, nTextLen, &sizTextRender);
			nPosX = m_nLineCountWidth - m_nLineCountMargin - 2 - sizTextRender.cx;
			ExtTextOutW(hDC,nPosX,nPosY,0,NULL,szTempBuf,nTextLen,NULL);

			// �A�C�R����\������
			int nIconLeft = LINEICON_MARGIN;
			int nLineIcons = cNowLine.GetLinePointer()->GetLineIcons();
			for (int nIconIndex = 0;nLineIcons != 0 && nIconIndex < sizeof(int) * 8;nIconIndex++){
				if ((nLineIcons & (1 << nIconIndex)) != 0){
					int nIconTop = nPosY + ( m_pFonts->GetHeight() + m_nHeightMargin ) / 2 - ICON_HEIGHT / 2;
					SelectObject(hDcBitmap,m_bmpIcons[nIconIndex]);
					TransparentBlt(hDC,nIconLeft,nIconTop,ICON_WIDTH,ICON_HEIGHT,
						hDcBitmap,0,0,ICON_WIDTH,ICON_HEIGHT,RGB(255,0,255));
					nIconLeft += ICON_WIDTH + LINEICON_MARGIN;
				}
			}
		}
		// ���̍s��
		if (!cNowLine.MoveEthicNext(m_pDocuments->GetLineList(),1))
			break;									// ���̍s�ɍs���Ȃ������Ƃ��͔�����
	}

	DeleteDC(hDcBitmap);
	return true;
}

/*----------------------------------------------------------------
CFootyView::RendBorderLine
�s�ԍ��\���̈�ƃG�f�B�^���̃{�[�_�[���C����`�悷�鏈��
----------------------------------------------------------------*/
bool CFootyView::RendBorderLine(HDC hDC,const RECT *rc){
	if (!hDC || !rc)return false;
	DrawLine(hDC,m_nLineCountWidth-m_nLineCountMargin,0,
		m_nLineCountWidth-m_nLineCountMargin,rc->bottom,m_pStatus->m_clLineNumLine);
	return true;
}

/*----------------------------------------------------------------
CFootyView::RendUnderLine
�L�����b�g���̃A���_�[���C����`�悷�郋�[�`��
----------------------------------------------------------------*/
bool CFootyView::RendUnderLine(HDC hDC,const RECT *rc)
{
#ifndef UNDER_CE
	if (!hDC || !rc)return false;
	if (m_bUnderlineVisible && m_bIsFocused && !m_pDocuments->IsSelecting())
	{
		DrawLine(hDC,m_nLineCountWidth,m_cCaret.GetNowY() + m_pFonts->GetHeight() + 1,
				rc->right,m_cCaret.GetNowY() + m_pFonts->GetHeight() + 1,m_pStatus->m_clUnderLine);
	}
#endif	/*not defined UNDER_CE*/
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �s�ԍ��\���̈��`�悷�鏈���ł��B
 * @param hDC �`���f�o�C�X�R���e�L�X�g
 * @param rc �`����`
 * @return ���������Ƃ�true���Ԃ�
 */
bool CFootyView::RendRuler(HDC hDC,const RECT *rc)
{
	FOOTY2_ASSERT( hDC );
	FOOTY2_ASSERT( rc );
	
	// �錾
	size_t i;
	const size_t TEMP_BUFFER = 20;
	wchar_t szWork[TEMP_BUFFER + 1];
	int nPosX;

	// �x�[�X��`��
	DrawRectangle(hDC,0,0,rc->right,m_nRulerHeight,m_pStatus->m_clRulerBk);	// ���[���[�w�i��`��
	
	// ���[���[���������߂̃I�u�W�F�N�g����
	HPEN hPen, hOldPen;
	hPen=CreatePen(PS_SOLID,1,m_pStatus->m_clRulerLine);	// ���[���[�̌r�����������߂̃y��
	SetTextColor(hDC,m_pStatus->m_clRulerText);				// ���[���[�̃e�L�X�g�̐F
	SetBkMode(hDC,TRANSPARENT);								// �w�i�𓧂�������悤�����`��
	m_pFonts->UseRulerFont(hDC);
	hOldPen=(HPEN)SelectObject(hDC,hPen);					// �y�����Z�b�g
    
	/*���[���[�̃L�����b�g�̂���ӏ�������*/
	if (m_bIsFocused && m_nLineCountWidth <= m_cCaret.GetNowX() && m_cCaret.GetNowX() < m_nWidth)
		DrawRectangle(hDC,m_cCaret.GetNowX(),0,m_cCaret.GetNowX()+m_pFonts->GetWidth(),
			m_nRulerHeight,m_pStatus->m_clCaretPos);

	/*���C���̕`�ʂ�����*/
	int nFontWidth = m_pFonts->GetWidth();				// �������p
	int nRulerHeight = m_nRulerHeight;					// �������p
	int nOtherStartY = nRulerHeight*8/9;				// �������p
	int nHalfStartY = nRulerHeight >> 1;				// �������p
	int nFirstVisibleCol = m_nFirstVisibleColumn;		// �������p
	size_t nLapelCol = m_pDocuments->GetLapelColumn();	// �������p
	size_t nVisibleCol = m_nVisibleColumns;				// �������p
	for (i=m_nFirstVisibleColumn,nPosX=m_nLineCountWidth;;i++,nPosX+=nFontWidth)
	{
		// ���C���̕`��
		if (i % 10 == 0)			// 10�̔{��(�傫�ȃo�[)
		{
			MoveToEx(hDC,nPosX,0,NULL);
			LineTo(hDC,nPosX,nRulerHeight);
			FOOTY2SPRINTF(szWork, TEMP_BUFFER, L"%d", i);
			ExtTextOutW(hDC,nPosX+2,nRulerHeight-
				m_pFonts->GetRulerHeight(),0,NULL,szWork,(int)wcslen(szWork),NULL);
		}
		else if (i % 5 == 0)		// 5�̔{��(�����炢�̃o�[)
		{
			MoveToEx(hDC,nPosX,nHalfStartY,NULL);
			LineTo(hDC,nPosX,nRulerHeight);
		}
		else						// �����ȃo�[
		{
			MoveToEx(hDC,nPosX,nOtherStartY,NULL);
			LineTo(hDC,nPosX,nRulerHeight);
		}
		// ���[�v�𔲂���
		if (i >= nFirstVisibleCol + nVisibleCol + 2)break;
		if (i == nLapelCol)break;
	}

	// ���[���[�p�I�u�W�F�N�g�̊J��
	SelectObject(hDC,hOldPen);
	DeleteObject(hPen);
	return true;
}


/*----------------------------------------------------------------
CFootyView::DrawRectangle
�w�肳�ꂽ�f�o�C�X�R���e�L�X�g�n���h���ɁA�����`��`�ʂ��܂��B
���̒����`�́A���g��h��Ԃ��܂��B
----------------------------------------------------------------*/
void CFootyView::DrawRectangle(HDC hDC,int x1,int y1,int x2,int y2,COLORREF color)
{
	HPEN hPen, hOldPen;
	HBRUSH hBrush, hOldBrush;
	
	hPen = (HPEN)CreatePen(PS_SOLID, 1, color);
	hOldPen = (HPEN)SelectObject(hDC, hPen);
	hBrush = (HBRUSH)CreateSolidBrush(color);
	hOldBrush = (HBRUSH)SelectObject(hDC, hBrush);

	Rectangle(hDC, x1, y1, x2, y2);

	SelectObject(hDC,hOldPen);
	SelectObject(hDC,hOldBrush);
	DeleteObject(hPen);
	DeleteObject(hBrush);
}

/*----------------------------------------------------------------
CFooty::DrawLine
<����>
hDC         �`���f�o�C�X�R���e�L�X�g
x1,y1,x2,y2 �`����W
color       �F
<���>
�w�肳�ꂽ�f�o�C�X�R���e�L�X�g�n���h���ɁA���������܂��B
���͎����ɂȂ�܂��B
----------------------------------------------------------------*/
void CFootyView::DrawLine(HDC hDC,int x1,int y1,int x2,int y2,COLORREF color,int penType)
{
	HPEN hPen,hOldPen;
	hPen = (HPEN)CreatePen(penType,1,color);
	hOldPen = (HPEN)SelectObject(hDC, hPen);
	MoveToEx(hDC,x1,y1,NULL);
	LineTo(hDC,x2,y2);
	SelectObject(hDC,hOldPen);
	DeleteObject(hPen);
}

void CFootyView::SetUnderlineDraw(bool flag){
	m_bUnderlineDraw = flag;
	//m_bUnderlineDraw = true;
}

BOOL CFootyView::ImageLoad(const wchar_t *pFilePath){
	return m_ImgCtr->Load(pFilePath);
}
void CFootyView::ImageClear(void){
	m_ImgCtr->UnLoad();
}
void CFootyView::SetColor(COLORREF color){
	m_ImgCtr->SetBgColor(color);
}

/*[EOF]*/
