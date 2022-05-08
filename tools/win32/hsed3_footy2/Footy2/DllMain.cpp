/**
 * @file DllMain.cpp
 * @brief DLL�֐��̎���
 * @author Shinji Watanabe
 * @date 2009/01/10
 */

#include "Cursor.h"
#include "CharsetDetector.h"
#include "ConvFactory.h"

#ifndef UNDER_CE
#	pragma comment (lib,"imm32.lib")		//!< IME�֘A�̃��C�u����
#endif

#define FOOTY_VER			2017			//!< Footy�̃o�[�W�����~1000
#define FOOTY_BETA			0				//!< Footy�̃��o�[�W�����ԍ�

/*�O���[�o���ϐ��̒�`*/
static CRITICAL_SECTION g_CriticalSection;	//!< �N���e�B�J���Z�N�V����
static std::list<CFooty*> *g_plsFooty = NULL;
static HINSTANCE g_hInstance = NULL;

//-----------------------------------------------------------------------------
/**
 * @brief �w�肳�ꂽID��Footy�R���g���[���|�C���^���擾���܂��B
 */
CFooty *GetFooty(int nID)
{
	EnterCriticalSection(&g_CriticalSection);
	{
		if (!g_plsFooty)
		{
			LeaveCriticalSection(&g_CriticalSection);
			return NULL;
		}
		// �񂵂Ă���
		for (FootyPt pRetFooty = g_plsFooty->begin();
			pRetFooty != g_plsFooty->end();
			pRetFooty++)
		{
			if ((*pRetFooty)->GetID() == nID)
			{
				LeaveCriticalSection(&g_CriticalSection);
				return *pRetFooty;
			}
		}
	}
	LeaveCriticalSection(&g_CriticalSection);
	return NULL;
}

//-----------------------------------------------------------------------------
/**
 * @brief �����o�͂��܂�
 */
#ifdef PRINT_ENABLED
void FormatPrint( const wchar_t* filename, int nLine, const wchar_t* fmt, ... )
{
	const int MaxLogBuffer = 1024;
	wchar_t szText[ MaxLogBuffer + 1 ];
	
	swprintf( szText, MaxLogBuffer, L"%s(%d):", filename, nLine );
	OutputDebugStringW( szText );

	va_list vaList;
	va_start( vaList, fmt );
	vswprintf_s( szText, MaxLogBuffer, fmt, vaList );
	va_end( vaList );

	OutputDebugStringW( szText );
}
#endif


//-----------------------------------------------------------------------------
/**
 * @brief �J�n���ɌĂяo���܂��BFooty2���C�u���������������܂�
 */
FOOTYEXPORT(void) Footy2Start(HINSTANCE hInstance)
{
	InitializeCriticalSection(&g_CriticalSection);
	EnterCriticalSection(&g_CriticalSection);
	{
		g_hInstance = hInstance;
		g_plsFooty = new std::list<CFooty*>;
	}
	LeaveCriticalSection(&g_CriticalSection);
	CCursor::LoadCursors(hInstance);
	CFootyView::LoadLineIcons(hInstance);
}

//-----------------------------------------------------------------------------
/**
 * @brief �I�����ɌĂяo���܂�
 */
FOOTYEXPORT(void) Footy2End()
{
	FootyPt iterFooty;
	// Footy�̃|�C���^���폜���Ă���
	EnterCriticalSection(&g_CriticalSection);
	if (g_plsFooty)
	{
		for (iterFooty = g_plsFooty->begin();iterFooty != g_plsFooty->end();iterFooty++)
		{
			if (*iterFooty)
			{
				delete (*iterFooty);
				*iterFooty = NULL;
			}
		}
		delete g_plsFooty;
		g_plsFooty = NULL;
	}
	LeaveCriticalSection(&g_CriticalSection);
	// �J�[�\����j��
	CCursor::DestroyCursors();
	CFootyView::ReleaseLineIcons();
}

#if !defined FOOTYSTATIC
//-----------------------------------------------------------------------------
/**
 * @brief DLL�̃��C���֐��ł��B
 */
BOOL APIENTRY DllMain(HANDLE hInst, DWORD  fdwReason, LPVOID lpReserved)
{
	switch(fdwReason)
	{
	case DLL_PROCESS_ATTACH:		// �v���Z�X�ɃA�^�b�`���ꂽ�B
		Footy2Start((HINSTANCE)hInst);
		break;
	case DLL_PROCESS_DETACH:		// �v���Z�X�Ƀf�^�b�`���ꂽ�B
		Footy2End();
#if defined _DEBUG && !defined UNDER_CE
	_CrtDumpMemoryLeaks();			// ���������[�N���o
#endif	/*_DEBUG*/
		break;
	}
	return true;
}
#endif	/*!defined FOOTYSTATIC*/

//-----------------------------------------------------------------------------
/**
 * @brief �o�[�W���������擾���܂�
 */
FOOTYEXPORT(int) GetFooty2Ver()
{
	return FOOTY_VER;
}

//-----------------------------------------------------------------------------
/**
 * @brief ���o�[�W�������擾���܂�
 */
FOOTYEXPORT(int) GetFooty2BetaVer()
{
	return FOOTY_BETA;
}

//-----------------------------------------------------------------------------
/**
 * @brief Footy���\�z���܂�
 */
FOOTYEXPORT(int) Footy2Create(HWND hWnd,int x,int y,int dx,int dy,int nMode)
{
	// �G���[�`�F�b�N
	if (!hWnd || dx < 0 || dy < 0)
	{
		return FOOTY2ERR_ARGUMENT;
	}

	// Footy���m�ۂ���
	int nID;
	// ���X�g�֑��
	EnterCriticalSection(&g_CriticalSection);
		FootyPt iterFooty = g_plsFooty->begin();
		for (nID = 0;iterFooty != g_plsFooty->end();iterFooty++,nID++)
		{
			if ((*iterFooty)->GetID() != nID)		//�r����
			{
				break;
			}
		}
		// Footy�I�u�W�F�N�g���\�z���܂�
		CFooty *pFooty = new CFooty( nID, g_hInstance, nMode );
		if (!pFooty)
		{
			LeaveCriticalSection(&g_CriticalSection);
			return FOOTY2ERR_MEMORY;
		}
		g_plsFooty->insert(iterFooty,pFooty);
	LeaveCriticalSection(&g_CriticalSection);
	
	// �\�z����
	pFooty->Create( hWnd, x, y, dx, dy );
	
	// ID��Ԃ�
	return nID;
}

//-----------------------------------------------------------------------------
/**
 * @brief �e�E�B���h�E��ύX���܂�
 */
FOOTYEXPORT(int) Footy2ChangeParent(int nID, HWND hWnd, int x,int y, int dx,int dy)
{
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	pFooty->Create( hWnd, x, y, dx, dy );
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2ChangeView
Footy�̃r���[���[�h�̕ύX�ł��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2ChangeView(int nID,int nView){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	pFooty->ChangeView(nView);
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2SetFocus
Footy�̃r���[���[�h�̕ύX�ł��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetFocus(int nID,int nViewID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (nViewID < 0 || 4 < nViewID)return FOOTY2ERR_ARGUMENT;
	pFooty->m_cView[nViewID].SetFocus();
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2GetWnd
Footy�̃E�B���h�E�n���h�����擾���܂�
----------------------------------------------------------------*/
FOOTYEXPORT(HWND) Footy2GetWnd(int nID,int nViewID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return NULL;
	if (nViewID < 0 || 4 < nViewID)return NULL;
	return pFooty->m_cView[nViewID].GetWnd();
}

/*----------------------------------------------------------------
Footy2GetWndVSplit
Footy��VSplit�̃E�B���h�E�n���h�����擾���܂�
----------------------------------------------------------------*/
FOOTYEXPORT(HWND) Footy2GetWndVSplit(int nID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return NULL;
	return pFooty->m_cVSplitter.GetWnd();
}

/*----------------------------------------------------------------
Footy2GetWndHSplit
Footy��HSplit�̃E�B���h�E�n���h�����擾���܂�
----------------------------------------------------------------*/
FOOTYEXPORT(HWND) Footy2GetWndHSplit(int nID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return NULL;
	return pFooty->m_cHSplitter.GetWnd();
}

/*----------------------------------------------------------------
Footy2GetWndHSplit
Footy��HSplit�̃E�B���h�E�n���h�����擾���܂�
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetActiveView(int nID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�擾����*/
	int nRet = FOOTY2ERR_NOACTIVE;
	for (int i=0;i<4;i++){
		if (pFooty->m_cView[i].IsFocused())
			nRet = i;
	}
	return nRet;
}

/*----------------------------------------------------------------
Footy2Delete
Footy���폜���܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2Delete(int id){
	CFooty *pFooty = GetFooty(id);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*���X�g����폜����*/
	g_plsFooty->remove(pFooty);
	/*�|�C���^���폜����*/
	if (pFooty){
		delete pFooty;
		pFooty = NULL;
	}
	return FOOTY2ERR_NONE;
}


/*----------------------------------------------------------------
Footy2Move
Footy2�E�B���h�E���ړ����邽�߂̊֐��ł��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2Move(int nID,int x,int y,int dx,int dy){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	return pFooty->Move(x,y,dx,dy) ? FOOTY2ERR_NONE : FOOTY2ERR_ARGUMENT;
}

/*----------------------------------------------------------------
Footy2Refresh
Footy2�E�B���h�E���ĕ`�悷�鏈��
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2Refresh(int nID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	pFooty->m_cView[0].Refresh();
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2CreateNew
�V�K�쐬
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2CreateNew(int nID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�V�K�쐬*/
	pFooty->m_cDoc.CreateNew(nID);
	pFooty->SetCharSet(CSM_DEFAULT);
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2GetCharSet
�����R�[�h�Z�b�g���擾���鏈��
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetCharSet(int nID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return CSM_ERROR;
	return pFooty->GetCharSet();
}

/*----------------------------------------------------------------
Footy2GetLineCode
�V�K�쐬
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetLineCode(int nID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return LM_ERROR;
	return pFooty->m_cDoc.GetLineMode();
}

/*----------------------------------------------------------------
Footy2GetLines
�S�s�����擾���܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(int)Footy2GetLines(int nID){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�s�����擾����*/
	return (int)pFooty->m_cDoc.GetLineNum();
}


#ifndef UNDER_CE
/**
 * Footy2GetLineA
 * @brief �w��s�̃e�L�X�g���擾���܂��B
 * @param nID Footy��ID�ԍ�
 * @param pString �o�͐�
 * @param nLine �o�͂���s
 * @param nSize �o�b�t�@�T�C�Y
 */
FOOTYEXPORT(int) Footy2GetLineA(int nID,char *pString,size_t nLine,int nSize){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�Y���s���擾����*/
	if (nLine < 0 || pFooty->m_cDoc.GetLineNum() <= nLine)return FOOTY2ERR_ARGUMENT;
	LinePt pLine = pFooty->m_cDoc.GetLine(nLine);
	/*�f�[�^��Ԃ�*/
	CConvFactory cConv;
	cConv.GetConv()->ToMulti(pLine->GetLineData(), (UINT)pLine->GetLineLength());
	FOOTY2STRCPY(pString,cConv.GetConv()->GetConvData(),nSize);
	return FOOTY2ERR_NONE;
}
#endif	/*UNDER_CE*/

/*----------------------------------------------------------------
Footy2GetLineW
�w��s�̃e�L�X�g���擾���܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(const wchar_t*) Footy2GetLineW(int nID,size_t nLine){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return NULL;
	/*�Y���s���擾����*/
	if (nLine < 0 || pFooty->m_cDoc.GetLineNum() <= nLine)return NULL;
	LinePt pLine = pFooty->m_cDoc.GetLine(nLine);
	/*�f�[�^��Ԃ�*/
	return pLine->GetLineData();
}


#ifndef UNDER_CE
/*----------------------------------------------------------------
Footy2SetLineA
�w��s�̃e�L�X�g��ݒ肵�܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetLineA(int nID,size_t nLine,const char *pString,bool bRedraw){
	CConvFactory cConv;
	cConv.GetConv()->ToUnicode(pString,(UINT)strlen(pString));
	return Footy2SetLineW(nID,nLine,(wchar_t*)cConv.GetConv()->GetConvData(),bRedraw);
}
#endif

/*----------------------------------------------------------------
Footy2SetLineW
�w��s�̃e�L�X�g��ݒ肵�܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetLineW(int nID,size_t nLine,const wchar_t *pString,bool bRedraw){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return NULL;
	if (!pString)return FOOTY2ERR_ARGUMENT;
	/*�I������*/
	CFootyDoc *pDoc = &pFooty->m_cDoc;
	if (!pDoc->GetCaretPosition()->SetPosition(pDoc->GetLineList(),nLine,0))
		return FOOTY2ERR_ARGUMENT;
	LinePt pLine = pDoc->GetCaretPosition()->GetLinePointer();
	pDoc->SetSelectStart();
	pDoc->GetCaretPosition()->SetPosition(pLine,pLine->GetLineLength());
	pDoc->SetSelectEndNormal();
	/*�ݒ肷��*/
	pDoc->InsertString(pString);
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++){
		pFooty->m_cView[i].AdjustVisibleLine();
		pFooty->m_cView[i].AdjustVisiblePos();
	}
	/*�ĕ`�揈��*/
	if (bRedraw)pFooty->m_cView[0].Refresh();
	return FOOTY2ERR_NONE;
}

#ifndef UNDER_CE
/*----------------------------------------------------------------
Footy2GetLineSizeA
�w��s�̒������擾���܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetLineLengthA(int nID,size_t nLine){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return -1;
	/*�Y���s���擾����*/
	if (pFooty->m_cDoc.GetLineNum() <= nLine)return -1;
	LinePt pLine = pFooty->m_cDoc.GetLine(nLine);
	/*�f�[�^��Ԃ�*/
	CConvFactory cConv;
	cConv.GetConv()->ToMulti(pLine->GetLineData(), (UINT)pLine->GetLineLength());
	return (int)cConv.GetConv()->GetConvTextSize() - sizeof(char);
}
#endif

/*----------------------------------------------------------------
Footy2GetLineSizeW
�w��s�̒������擾���܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetLineLengthW(int nID,size_t nLine){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�Y���s���擾����*/
	if (pFooty->m_cDoc.GetLineNum() <= nLine)return FOOTY2ERR_ARGUMENT;
	LinePt pLine = pFooty->m_cDoc.GetLine(nLine);
	/*�f�[�^��Ԃ�*/
	return (int)pLine->GetLineLength();
}

/*----------------------------------------------------------------
Footy2SetLapel
�܂�Ԃ��ݒ�
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetLapel(int nID,int nColumns,int nMode,bool bRedraw){
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	return pFooty->SetLapel(nColumns,nMode,bRedraw) ? FOOTY2ERR_NONE : FOOTY2ERR_ARGUMENT;
}

/*----------------------------------------------------------------
Footy2GetVisibleColumns
�\���\�Ȍ������擾���鏈��
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetVisibleColumns(int nID,int nViewID){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (nViewID < 0 || 4 <= nViewID)return FOOTY2ERR_ARGUMENT;
	return (int)pFooty->m_cView[nViewID].GetVisibleColumns();
}

/*----------------------------------------------------------------
Footy2GetVisibleLines
�\���\�ȍs�����擾���鏈��
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetVisibleLines(int nID,int nViewID){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (nViewID < 0 || 4 <= nViewID)return FOOTY2ERR_ARGUMENT;
	return (int)pFooty->m_cView[nViewID].GetVisibleLines();
}

/*[EOF]*/
