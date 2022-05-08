/**
 * @file FootyViewMouse.cpp
 * @brief Footy�̃r���[�Ǘ����s���܂��B���̃t�@�C���Ń}�E�X�̏������s���܂��B
 */

#include "FootyView.h"
#include "KeyboardState.h"
#include "Cursor.h"
#ifndef WM_MOUSEWHEEL
#	include "zmouse.h"						/*�}�E�X�z�C�[�����b�Z�[�W*/
#endif	/*WM_MOUSEWHEEL*/

//-----------------------------------------------------------------------------
/**
 * @brief �z�C�[���}�E�X���������ꂽ�Ƃ��̏���
 * @param bIsForward �������։񂳂ꂽ���ǂ���
 */
void CFootyView::OnMouseWheel(bool bIsForward)
{
	if (bIsForward)
		m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),WHEEL_MOUSE);
	else
		m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack(WHEEL_MOUSE);
	Refresh();
}

//-----------------------------------------------------------------------------
/**
 * @brief �����X�N���[���^�C�}�[�̂��߂̎������s����
 */
void CFootyView::OnAutoVerticalTimer()
{
	if ( 0 < m_nAutoScrollNumVertical )
	{
		m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),(int)(m_nAutoScrollNumVertical));
	}
	else
	{
		m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack((int)(-m_nAutoScrollNumVertical));
	}
	OnMouseMove(m_nNowMousePosX,m_nNowMousePosY,true);
	if (m_ImgCtr->IsLoaded()){
		Refresh();// �w�i�摜���ǂ܂�Ă���ꍇ�́A�c�����c��ׂ��ׂčĕ`�悷��
	}
}

//-----------------------------------------------------------------------------
/**
 * @brief �����X�N���[���^�C�}�[�����s���ꂽ�Ƃ��̏���
 */
void CFootyView::OnAutoHorizontalTimer()
{
	CEditPosition cNowPosition;
	int x = m_nNowMousePosX;
	int y = m_nNowMousePosY;
	if ( x < m_nLineCountWidth )	// �s�ԍ��\���̈��荶
	{
		StartHorizontalScrollTimer((int)((x - m_nLineCountWidth) / PIXEL_PER_COLUMNSPEED) - 1);
		x = m_nLineCountWidth;
	}
	else if	( m_nWidth < x )		// �s�ԍ��\���̈��荶
	{
		StartHorizontalScrollTimer((int)((x - m_nWidth) / PIXEL_PER_COLUMNSPEED) + 1);
		x = m_nWidth;
	}
	else
	{
		StopHorizontalScrollTimer();
	}
	
	// �}�E�X�ʒu�ɂ�����G�f�B�^��̈ʒu���Z�o���܂��B���[���[�ゾ�ƌv�Z�ł��Ȃ��̂ŁA�Œ�ł����[���[��Ɖ���
	if (y < m_nRulerHeight) y = m_nRulerHeight;
	CalcInfoFromMouse( x, y, &cNowPosition );

	// �ŏ��Ɍ����錅���𒲐����܂�
	int nMax = max( 0, min
	(
		(int)m_pDocuments->GetLapelColumn(),
		(int)(cNowPosition.GetLinePointer()->GetLineLength() - m_nVisibleColumns / 2)
	));
	
	m_nFirstVisibleColumn += m_nAutoScrollNumHorizontal;
	if (m_nFirstVisibleColumn < 0)
	{
		m_nFirstVisibleColumn = 0;
	}
	if ( m_nFirstVisibleColumn > nMax )
	{
		m_nFirstVisibleColumn = nMax;
	}
	FOOTY2_PRINTF( L"OnAutoHorizontalTimer first visible column = %d", m_nFirstVisibleColumn );
	
	// ���݂̈ʒu���L�����b�g��
	m_pDocuments->SetSelectEndNormal(&cNowPosition);
	*m_pDocuments->GetCaretPosition() = cNowPosition;
	
	// �ĕ`��
	Refresh();
}

//-----------------------------------------------------------------------------
/**
 * @brief �}�E�X�������ꂽ�Ƃ��̏���
 * @param x �}�E�X���Wx
 * @param y �}�E�X���Wy
 */
void CFootyView::OnMouseDown(int x,int y)
{
	/*�錾*/
	CEditPosition cNowPosition;
	CEditPosition cSelStart,cSelEnd;
	CKeyBoardState cKeyStates(m_bShiftLocked);
	bool bSelected = m_pDocuments->IsSelecting();
	
	/*�t�H�[�J�X�����킹��*/
	::SetFocus(m_hWnd);

	if (y > m_nRulerHeight)
	{
		// �s�ԍ��\���̈�
		if (x < m_nLineCountWidth)
		{
			CalcLineCount(y,&cSelStart,&cSelEnd);
			m_pDocuments->SetSelectStart(&cSelStart);
			m_pDocuments->SetSelectEndNormal(&cSelEnd);
			m_pDocuments->SetSelLineStart();
			*m_pDocuments->GetCaretPosition() = cSelEnd;
			m_pDocuments->SendMoveCaretCallBack();

			// �h���b�O��������
			m_nDragMode = DRAGMODE_LINE;
			SetCapture(m_hWnd);				// �}�E�X�L���v�`���J�n

			// �ĕ`�揈��
			Refresh();
		}
		// �ʏ�̃G�f�B�^�̈�
		else 
		{
			// �L�����b�g�ʒu���ړ�����
			CalcInfoFromMouse(x,y,&cNowPosition);
			if (cKeyStates.IsShiftPushed())	// Shift�L�[��������Ă���Ƃ��͑I������
			{
				if (m_pDocuments->IsSelecting())
					m_pDocuments->SetSelectEndNormal(&cNowPosition);
				else
				{
					m_pDocuments->SetSelectStart();
					m_pDocuments->SetSelectEndNormal(&cNowPosition);
				}
				bSelected = true;
			}
			else m_pDocuments->SetSelectStart(&cNowPosition);
			*m_pDocuments->GetCaretPosition() = cNowPosition;
			m_pDocuments->SendMoveCaretCallBack();

			// �h���b�O��������
			m_nDragMode = DRAGMODE_MOUSE;
			SetCapture(m_hWnd);				// �}�E�X�L���v�`���J�n

			// �ʒu���Đݒ肵�Ă���
			bool bAdLine = AdjustVisibleLine();
			bool bAdPos = AdjustVisiblePos();

			/*�ĕ`�揈��*/
			if (bSelected || bAdLine || bAdPos)Refresh();
			else CaretRefresh();
		}
	}
}

//-----------------------------------------------------------------------------
/**
 * @brief �}�E�X���������ꂽ�Ƃ��ɌĂяo����܂��B
 * @param x �}�E�X���Wx
 * @param y �}�E�X���Wy
 * @param bFromScrollTimer �X�N���[���^�C�}�[����Ă΂ꂽ��true�A�E�B���h�E���b�Z�[�W����Ă΂ꂽ��false
 */
void CFootyView::OnMouseMove(int x, int y, bool bFromScrollTimer)
{
	// �錾
	CEditPosition cNowPosition;
	CEditPosition cSelStart,cSelEnd;
	
	// ���݂̃}�E�X�ʒu��ݒ�
	m_nNowMousePosX = x;
	m_nNowMousePosY = y;
	
	// �h���b�O���Ă�����ɉ����ĕ���
	switch(m_nDragMode)
	{
//�h���b�O���Ă��Ȃ�
	case DRAGMODE_NONE:
		// �}�E�X�J�[�\����ύX����
		if (m_nRulerHeight < y)
		{
			if (m_nLineCountWidth < x)
			{
				if (CalcInfoFromMouse(x,y,&cNowPosition) &&
					IsOnUrl(&cNowPosition,NULL) != ONURL_NONE)
					CCursor::UseUrlCursor();	// URL��
				else CCursor::UseIBeam();		// I�r�[��
			}
			else CCursor::UseLineCount();		// �s�ԍ��\���̈�
		}
		else CCursor::UseArrow();
		break;

//�s�ԍ��\���̈���h���b�O��
	case DRAGMODE_LINE:
		if (y < m_nRulerHeight)
		{
			StartVerticalScrollTimer( (int)((y - m_nRulerHeight) / PIXEL_PER_LINESPEED) - 1 );
		}
		else if (y > m_nHeight)
		{
			StartVerticalScrollTimer( (int)((y - m_nHeight) / PIXEL_PER_LINESPEED) + 1 );
		}
		else
		{
			StopVerticalScrollTimer();
		}
		
		if (CalcLineCount(y,&cSelStart,&cSelEnd))		// ������Ǝ擾�ł����Ƃ��̂ݑI��
		{
			if (cSelStart < *m_pDocuments->GetLineSelStartA())
			{
				m_pDocuments->SetSelectStart(&cSelStart);
				m_pDocuments->SetSelectEndNormal(m_pDocuments->GetLineSelStartB());
				*m_pDocuments->GetCaretPosition() = cSelStart;
			}
			else 
			{
				m_pDocuments->SetSelectStart(m_pDocuments->GetLineSelStartA());
				m_pDocuments->SetSelectEndNormal(&cSelEnd);
				*m_pDocuments->GetCaretPosition() = cSelEnd;
			}
		}
		m_pDocuments->SendMoveCaretCallBack();

		// �ĕ`�揈��
		Refresh();
		m_cCaret.Hide();
		break;

//�}�E�X�ŃG�f�B�^����h���b�O��
	case DRAGMODE_MOUSE:
		// ��������
		if ( x < m_nLineCountWidth )	// �s�ԍ��\���̈��荶
		{
			StartHorizontalScrollTimer((int)((x - m_nLineCountWidth) / PIXEL_PER_COLUMNSPEED) - 1);
			x = m_nLineCountWidth;
		}
		else if	( m_nWidth < x )		// �s�ԍ��\���̈��荶
		{
			StartHorizontalScrollTimer((int)((x - m_nWidth) / PIXEL_PER_COLUMNSPEED) + 1);
			x = m_nWidth;
		}
		else
		{
			StopHorizontalScrollTimer();
		}
		// ��������
		if ( y < m_nRulerHeight )		// ���[���[����
		{
			StartVerticalScrollTimer((int)((y - m_nRulerHeight) / PIXEL_PER_LINESPEED) - 1);
			y = m_nRulerHeight;
		}
		else if ( y > m_nHeight )		// ��ʂ�艺
		{
			StartVerticalScrollTimer((int)((y - m_nHeight) / PIXEL_PER_LINESPEED) + 1);
			y = m_nHeight;
		}
		else
		{
			StopVerticalScrollTimer();
		}
		
		CalcInfoFromMouse( x, y, &cNowPosition );
		
		// �L�����b�g�ʒu���ړ������Ƃ��ɍĕ`�悷��
		if (cNowPosition != *m_pDocuments->GetCaretPosition())
		{
			m_pDocuments->SetSelectEndNormal(&cNowPosition);
			
			// ���݂̈ʒu���L�����b�g��
			LinePt pRenderStart = m_pDocuments->GetCaretPosition()->GetLinePointer();
			*m_pDocuments->GetCaretPosition() = cNowPosition;

			// �ĕ`���������
			if (bFromScrollTimer)
			{
				ScrollRefresh();
			}
			else
			{
				LineChangedRefresh(pRenderStart,cNowPosition.GetLinePointer());
			}

			// �L�����b�g�͔�\����
			m_cCaret.Hide();
			m_pDocuments->SendMoveCaretCallBack();
		}
		break;
	}
}

//-----------------------------------------------------------------------------
/**
 * @brief �}�E�X�������ꂽ�Ƃ��ɌĂяo����܂��B
 */
void CFootyView::OnMouseUp(int x,int y)
{
	switch(m_nDragMode)
	{
//�}�E�X�ŃG�f�B�^����h���b�O��
	case DRAGMODE_MOUSE:
	case DRAGMODE_LINE:
		m_cCaret.Show();
		ReleaseCapture();

		// �����X�N���[������߂�
		StopVerticalScrollTimer();
		StopHorizontalScrollTimer();
		break;
	}
	
	// �h���b�O��Ԃ����ɖ߂�
	m_nDragMode = DRAGMODE_NONE;
}

//-----------------------------------------------------------------------------
/**
 * @brief �����X�N���[�����s�����߂̃^�C�}�[���X�^�[�g�����鏈���ł�
 */
void CFootyView::StartVerticalScrollTimer( int nScrollNum )
{
	if ( !m_bAutoScrollVertical )
	{
		m_bAutoScrollVertical = true;
		SetTimer( m_hWnd, eTimer_AutoVertical, SCROLL_TIME, NULL );
	}
	m_nAutoScrollNumVertical = nScrollNum;
}

//-----------------------------------------------------------------------------
/**
 * @brief �����X�N���[�����s�����߂̃^�C�}�[���X�^�[�g�����鏈���ł�
 */
void CFootyView::StartHorizontalScrollTimer( int nScrollNum )
{
	if ( !m_bAutoScrollHorizontal )
	{
		m_bAutoScrollHorizontal = true;
		SetTimer( m_hWnd, eTimer_AutoHorizontal, SCROLL_TIME, NULL );
	}
	m_nAutoScrollNumHorizontal = nScrollNum;
}

//-----------------------------------------------------------------------------
/**
 * @brief �����X�N���[���^�C�}�[���~���܂��B
 */
void CFootyView::StopVerticalScrollTimer()
{
	if ( m_bAutoScrollVertical )
	{
		m_bAutoScrollVertical = false;
		KillTimer( m_hWnd, eTimer_AutoVertical );
	}
	m_nAutoScrollNumVertical = 0;
}

//-----------------------------------------------------------------------------
/**
 * @brief �����X�N���[���^�C�}�[���~���܂��B
 */
void CFootyView::StopHorizontalScrollTimer()
{
	if ( m_bAutoScrollHorizontal )
	{
		m_bAutoScrollHorizontal = false;
		KillTimer( m_hWnd, eTimer_AutoHorizontal );
	}
	m_nAutoScrollNumHorizontal = 0;
}

//-----------------------------------------------------------------------------
/**
 * @brief �_�u���N���b�N�����Ƃ��ɌĂяo����܂��B
 */
void CFootyView::OnMouseDouble(int x,int y)
{
	// �錾
	CEditPosition cNowPosition;
	CUrlInfo cUrlInfo;
	RetOnUrl nRetURL;
	std::wstring strShellCommand;

	// �t�H�[�J�X�����킹��
	::SetFocus(m_hWnd);
	
	// �ʏ�̃G�f�B�^�̈�
	if (y > m_nRulerHeight && x > m_nLineCountWidth)
	{
		// �L�����b�g�ʒu���ړ�����
		CalcInfoFromMouse(x,y,&cNowPosition);
		// �N���b�J�u���H
		nRetURL = IsOnUrl(&cNowPosition,&cUrlInfo);
		if (nRetURL == ONURL_URL)				// URL
		{
			strShellCommand = cNowPosition.GetLinePointer()->
				m_strLineData.substr(cUrlInfo.m_nStartPos,cUrlInfo.GetLength());
			StartApplication(strShellCommand.c_str());
		}
		else if (nRetURL == ONURL_MAIL)			// ���[���A�h���X
		{
			strShellCommand = L"mailto:";
			strShellCommand += cNowPosition.GetLinePointer()->
				m_strLineData.substr(cUrlInfo.m_nStartPos,cUrlInfo.GetLength());
			StartApplication(strShellCommand.c_str());
		}
		else if (nRetURL == ONURL_LABEL)			// ���x��
		{
			FOOTY2_PRINTF( L"���x���_�u���N���b�N\n");
			// ���x���T��
			wchar_t lname[256];
			wchar_t *buffer;
			wchar_t *wp;
			int len;
			int line;

			len = Footy2GetTextLengthW(m_nFootyID, LM_CRLF);
			if(len >= 0){
				buffer = (wchar_t *) calloc( len + 2 /* ������I�[�Ɣԕ� */, sizeof(wchar_t) );
				Footy2GetTextW(m_nFootyID, buffer, LM_CRLF, len + 1);

				line = 1;
				wp = buffer;

				bool FoundLabel = false;// �ړI�̃��x��������������

				for(; *wp; line++, wp++) {
					// 1�s�ǂݍ���
					for(int LabelPosX = 0; *wp && 0x0d != *wp; wp++) {
						LabelPosX++;// by Tetr@pod
						// �擪�̋󔒂𖳎�
						if( L' ' == *wp || L'\t' == *wp ) {
							continue;
						}
						// ���x���ǂݍ���
						if( L'*' == *wp ) {
							wchar_t *pa = wp;
							int namelen;
							for(pa++;*pa &&
									(L':' > (unsigned wchar_t)*pa || L'>' < (unsigned wchar_t)*pa) &&
									L'/' < (unsigned wchar_t)*pa &&
									L' ' != *pa && '\t' != *pa && 
									0x0d != *pa; pa++) { }
							namelen = (int)(pa - wp);
							if( 1 < namelen) {// ���x������
								wcsncpy(lname, wp, namelen);
								lname[namelen] = '\0';
								// ��r
								if (_wcsicmp(cNowPosition.GetLinePointer()->m_strLineData.substr(cUrlInfo.m_nStartPos,cUrlInfo.GetLength()).c_str(), lname) == 0) {// by Tetr@pod
									// �L�����b�g�ړ�
									Footy2SetCaretPosition(m_nFootyID, line - 1, LabelPosX - 1, true);
									// Footy2Refresh(m_nFootyID);// ����Ȃ����ۂ�

									FoundLabel = true;// for�̑��d���[�v�Ȃ̂Ńt���O���g���Ĕ�����

									break;// �{����goto�Ŕ������ق��������H
								}
							}
							wp = pa;
							if( 0x0d == *wp ) {
								break;
							}
						}
						// �R�����g�ǂݔ�΂�
						if( L';' == *wp || (L'/' == *wp && L'/' == wp[1]) ) {
							// �s���܂œǂݔ�΂�
							for(wp++; *wp && 0x0d != *wp ; wp++);
							break;
						}
						if( L'/' == *wp && L'*' == wp[1] ) {
							for(wp++; *wp ; wp++) {
								if( L'*' == *wp && L'/' == wp[1] ) {
									wp++;
									break;
								}
								if( 0x0d == *wp ) {
									line++;
								}
							}
							continue;
						}
						// ���̃X�e�[�g�����g�܂œǂݔ�΂�
						for(bool bEscape = false;
							*wp && 0x0d != *wp && L':' != *wp &&
							L';' != *wp && (L'/' != *wp || L'*' != wp[1]) && (L'/' != *wp || L'/' != wp[1]); wp++)
						{
							if( L'\"' == *wp && !bEscape ) {
								bool bDameChk = false;
								// ������ǂݔ�΂�
								if( L'{' == *(wp - 1) ) { // �����s������
									wp += 2;
									for(bool bEscape = false; *wp && (L'\"' != *wp || L'}' != wp[1] || bEscape); ) {
										if( L'\\' == *wp ) {
											bEscape = !bEscape;
										}
										wp++;
									}
								} else {
									wp++;
									for(bool bEscape = false; *wp && (L'\"' != *wp || bEscape) && 0x0d != *wp; ) {
										if( L'\\' == *wp ) {
											bEscape = !bEscape;
										}
										wp++;
									}
								}
								wp--;
								continue;
							}
						}
						if( 0x0d == *wp ) {
							break;
						}
						if( L':' != *wp ) {
							wp--;
						}
					}

					if (FoundLabel) {// �ړI�̃��x�������������Ȃ�
						break;// ������
					}

					if( 0x0d == *wp && 0x0a == wp[1] ) {
						wp++;
					}
				}
				free (buffer) ;
			}
		}
		else if (nRetURL == ONURL_FUNC)			// �֐�
		{
			/* �������B�Ƃ������A�A�C�f�B�A���Ȃ� */
		}
		else									// �����Ȃ�(�P��̑I������)
		{
			m_pDocuments->SelectWord();
			Refresh();
		}
	}
}

//-----------------------------------------------------------------------------
/**
 * @brief �A�v���P�[�V������ShellExecuteEx�Ŏ��s���鏈��
 */
void CFootyView::StartApplication(const wchar_t *szFileName)
{
	SHELLEXECUTEINFO sei;
	memset(&sei,0,sizeof(SHELLEXECUTEINFO));
	sei.cbSize = sizeof(SHELLEXECUTEINFO);
	sei.nShow = SW_SHOWNORMAL;
	sei.lpVerb = L"open";
	sei.lpFile = szFileName;
	ShellExecuteEx(&sei);
}

//-----------------------------------------------------------------------------
/**
 * @brief �G�f�B�^��ɂ�����|�W�V����������o���֐��ł��B
 * @param	x	[in] �}�E�X��x���W
 * @param	y	[in] �}�E�X��y���W
 * @return �͈͂𒴂��Ă���Ƃ���false���Ԃ�܂����Ax���G�f�B�^���ɂ��肩��
 *         y���ŏI�s�𒴂��Ă���Ƃ���false��Ԃ��|�W�V����������o����܂��B
 */
bool CFootyView::CalcInfoFromMouse(int x,int y,CEditPosition *pPos)
{
	FOOTY2_ASSERT( pPos );
	
	// �錾
	size_t nEthicColumn = 0;
	size_t nPosition;
	size_t nLineFromTop;
	CEthicLine cMouseLine;

	// �K���͈͊O
	if (x < m_nLineCountWidth) return false;
	if (y < m_nRulerHeight) return false;

	// �v�Z����
	nLineFromTop = (size_t)
		(y - m_nRulerHeight) / (m_pFonts->GetHeight() + m_nHeightMargin);
	nEthicColumn = (size_t)m_nFirstVisibleColumn + 
		(x - m_nLineCountWidth + (m_pFonts->GetWidth() + m_nWidthMargin) / 2)
		/ (m_pFonts->GetWidth() + m_nWidthMargin);

	// ��������|�W�V�����̊���o��
	cMouseLine = *m_pDocuments->GetFirstVisible(m_nViewID);
	if (cMouseLine.MoveEthicNext(m_pDocuments->GetLineList(),nLineFromTop))
	{
		nPosition = cMouseLine.GetLinePointer()->CalcRealPosition
			(cMouseLine.GetEthicNum(),nEthicColumn,
			 m_pDocuments->GetLapelColumn(),
			 m_pDocuments->GetTabLen(),
			 m_pDocuments->GetLapelMode());
		pPos->SetPosition(cMouseLine.GetLinePointer(),nPosition);
		return true;
	}
	else		// �ŏI�s�����Ă�
	{
		LinePt pLast = m_pDocuments->GetLastLine();
		nPosition = pLast->CalcRealPosition
			(pLast->GetEthicLine() - 1,nEthicColumn,
			 m_pDocuments->GetLapelColumn(),
			 m_pDocuments->GetTabLen(),
			 m_pDocuments->GetLapelMode());
		pPos->SetPosition(pLast,nPosition);
		return false;
	}
}

//-----------------------------------------------------------------------------
/**
 * @brief �s�ԍ��\���̈���N���b�N���ꂽ�Ɖ��肵��y���W����ʒu������o�����[�`���ł��B
 */
bool CFootyView::CalcLineCount(int y,CEditPosition *pStart,CEditPosition *pEnd)
{
	// �錾
	size_t nPosition;
	size_t nLineFromTop;
	CEthicLine cMouseLine;
	LinePt pLine;
	// �K���͈͊O
	if (!pStart || !pEnd)return false;
	
	// �s�ʒu�̌v�Z
	cMouseLine = *m_pDocuments->GetFirstVisible(m_nViewID);
	if (y < m_nRulerHeight)
	{
		nLineFromTop = (size_t)
			(m_nRulerHeight - y) / (m_pFonts->GetHeight() + m_nHeightMargin);
		if (!cMouseLine.MoveEthicBack(nLineFromTop))
			return false;
	}
	else
	{
		nLineFromTop = (size_t)
			(y - m_nRulerHeight) / (m_pFonts->GetHeight() + m_nHeightMargin);
		cMouseLine.MoveEthicNext(m_pDocuments->GetLineList(),nLineFromTop);
	}
	pLine = cMouseLine.GetLinePointer();

	// �J�n�ʒu����o��
	nPosition = pLine->CalcRealPosition
		(cMouseLine.GetEthicNum(),0,
			m_pDocuments->GetLapelColumn(),
			m_pDocuments->GetTabLen(),
			m_pDocuments->GetLapelMode());
	pStart->SetPosition(pLine,nPosition);
	// �I���ʒu����o��
	nPosition = pLine->CalcRealPosition
		(cMouseLine.GetEthicNum() + 1,0,
			m_pDocuments->GetLapelColumn(),
			m_pDocuments->GetTabLen(),
			m_pDocuments->GetLapelMode());
	//if (nPosition == pLine->GetLineLength())
	//{
	//	if (cMouseLine.MoveRealNext(m_pDocuments->GetLineList(),1))
	//		nPosition = 0;
	//}
	pEnd->SetPosition(cMouseLine.GetLinePointer(),nPosition);
	return true;
}


//-----------------------------------------------------------------------------
/**
 * @brief �|�W�V�����N���X��URL��ɂ��邩�ǂ����𔻒f���܂��BpInfo�ɂ͒l��
 *        ����܂��BpInfo�ɂ͂��̏�񂪓���܂�(NULL��)
 */
CFootyView::RetOnUrl CFootyView::IsOnUrl(CEditPosition *pPos,CUrlInfo *pInfo)
{
	// �錾
	UrlIterator pUrlIterator;
	UrlIterator pEndIterator;
	
	// URL�̔��f
	pUrlIterator = pPos->GetLinePointer()->GetUrlInfo()->begin();
	pEndIterator = pPos->GetLinePointer()->GetUrlInfo()->end();
	
	for (;pUrlIterator!=pEndIterator;pUrlIterator++)
	{
		if (pUrlIterator->IsInPosition(pPos->GetPosition()))
		{
			if (pInfo)*pInfo = *pUrlIterator;
			return ONURL_URL;
		}
	}
	
	/*���[���̔��f*/
	pUrlIterator = pPos->GetLinePointer()->GetMailInfo()->begin();
	pEndIterator = pPos->GetLinePointer()->GetMailInfo()->end();
	
	for (;pUrlIterator!=pEndIterator;pUrlIterator++)
	{
		if (pUrlIterator->IsInPosition(pPos->GetPosition()))
		{
			if (pInfo)*pInfo = *pUrlIterator;
			return ONURL_MAIL;
		}
	}

	/*���x���̔��f by Tetr@pod*/
	FOOTY2_PRINTF(L"���x���Ȃ̂�\n");
	pUrlIterator = pPos->GetLinePointer()->GetLabelInfo()->begin();
	pEndIterator = pPos->GetLinePointer()->GetLabelInfo()->end();
	
	for (;pUrlIterator!=pEndIterator;pUrlIterator++)
	{
		if (pUrlIterator->IsInPosition(pPos->GetPosition()))
		{
			if (pInfo)*pInfo = *pUrlIterator;
			FOOTY2_PRINTF(L"���x��������\n");
			return ONURL_LABEL;
		}
	}

	/*���߁E�֐��̔��f by Tetr@pod*/
	FOOTY2_PRINTF(L"���߁E�֐��Ȃ̂�\n");
	pUrlIterator = pPos->GetLinePointer()->GetFuncInfo()->begin();
	pEndIterator = pPos->GetLinePointer()->GetFuncInfo()->end();
	
	for (;pUrlIterator!=pEndIterator;pUrlIterator++)
	{
		if (pUrlIterator->IsInPosition(pPos->GetPosition()))
		{
			if (pInfo)*pInfo = *pUrlIterator;
			FOOTY2_PRINTF(L"���߁E�֐�������\n");
			return ONURL_NONE;// �֐��͏������Ȃ��̂ŁA���������Ȃ��悤I�r�[���ŕ\��������
			// return ONURL_FUNC;
		}
	}

	return ONURL_NONE;
}

/*[EOF]*/
