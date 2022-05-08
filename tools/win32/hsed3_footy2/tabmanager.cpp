/*------------------------------------------------------------------------------
	Tab management routines for HSP Script Editor
------------------------------------------------------------------------------*/
#include <windows.h>
#include <commctrl.h>
#include <stdlib.h>
#include <string.h>
#include "tabmanager.h"
#include "footy2.h"
#include "classify.h"
#include "hsed_config.h"
#include "support.h"
#include "poppad.h"
#include "resource.h"

// poppad.cpp
LRESULT CALLBACK MyEditProc( HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam );
void poppad_setedit( int );
void DoCaption ( char *szTitleName, int TabID );

void __stdcall OnFooty2TextModified(int id, void *pParam, int nStatus);
void __stdcall OnFootyContextMenu(void *pParam, int id);


// main.cpp
//void ConfigEditColor( COLORREF fore, COLORREF back );

// popfont.cpp
void PopFontSetEditFont();

extern HWND     hwndClient;
extern HWND     hwndTab;
extern HWND     hwbak;
extern HWND     hwndDummy;
extern int      activeID;
extern int      activeFootyID;
extern WNDPROC	Org_EditProc;
extern BOOL     bNeedSave ;
extern char     szDirName[_MAX_PATH] ;
extern char     szFileName[_MAX_PATH] ;
extern char     szTitleName[_MAX_FNAME + _MAX_EXT] ;
extern char     szStartDir[_MAX_PATH];
static HMENU    hMenu = NULL;

extern int      nowViewMode;// by Tetr@pod

// �^�u���쐬
// Create a tab
//
// ����(Parameters)
// nTabNumber:  �}����̃^�u�ԍ�(Number of target tab's insert point)
// szTitleName: �L���v�V����(The caption)
// szFileName:  �Ǘ�����t�@�C���̃t�@�C����(File name of file managed by target tab)
// szDirName:   �Ǘ�����t�@�C���̃f�B���N�g����(Directory name of file managed by target tab)
//
// �߂�l
// ����܂���(Nothing)
void CreateTab(int nTabNumber, const char *szNewTitleName, const char *szNewFileName, const char *szNewDirName)
{
	int FootyID;
	int j/*, ret*/;
	HWND hWnd;
	TABINFO *lpTabInfo, *lpTopTabInfo;
	TCITEM tc_item;
	RECT rect;
	char szCaption[_MAX_PATH+128];
	MENUITEMINFO mii;
	LONG dx, dy;

	// Footy�̃E�B���h�E���쐬
	// Create a Footy window
	GetClientRect(hwndTab, &rect);
	TabCtrl_AdjustRect(hwndTab, FALSE, &rect);
	dx = max(rect.right-rect.left, 512);
	dy = max(rect.bottom-rect.top, 512);
	// dx, dy ���������T�C�Y�ɂ���ƁA�����r���[���Ƀo�O��
	FootyID = Footy2Create(hwndTab, rect.left, rect.top, dx, dy, VIEWMODE_INVISIBLE);
	if( FootyID < 0 ) {
		DebugBreak();	// 2008-02-17 Shark++ ��芸���������ŗ��Ƃ�
		return;
	}

//	FootySetMetrics(FootyID, F_SM_CLICKABLE_MODE, 0);	// 2008-02-17 Shark++ ��֎�i�s��
//	FootySetMetrics(FootyID, F_SM_UNDONUM, -1);	// 2008-02-17 Shark++ ��֎�i�s��
//	FootySetMetrics(FootyID, F_SM_OLEMODE, F_OLE_CTRL);	// 2008-02-17 Shark++ ��֎�i�s��
	Footy2SetFuncTextModified(FootyID, (Footy2FuncTextModified)OnFooty2TextModified, NULL);
//	FootyEventContextMenu(FootyID, (pFuncContext)OnFootyContextMenu, NULL);	// 2008-02-17 Shark++ ��֎�i������(��芸�����T�u�N���X���őΉ��ł��Ȃ����H)

	SetEditColor(FootyID);
	poppad_setedit(FootyID);		// �N������̐ݒ蔽�f(onitama:050218)
	SetClassify(FootyID);

	hWnd = Footy2GetWnd(FootyID, 0);
	Org_EditProc = (WNDPROC)GetWindowLong(hWnd, GWL_WNDPROC);
    SetWindowLong(hWnd, GWL_WNDPROC, (LONG)MyEditProc);
	DragAcceptFiles(hWnd, TRUE);
	PopFontSetEditFont();

	// �^�u���̍\���̂��쐬����
	// Create a struct of new tab information
	lpTabInfo = (TABINFO *)malloc(sizeof(TABINFO));
	lstrcpy(lpTabInfo->TitleName, szNewTitleName);
	lstrcpy(lpTabInfo->FileName, szNewFileName);
	lstrcpy(lpTabInfo->DirName, szNewDirName);
	lpTabInfo->LatestUndoNum = 0;
	lpTabInfo->NeedSave      = FALSE ;
 	lpTabInfo->FootyID       = FootyID;
	lpTabInfo->FileIndex     = 0;

	// Z �I�[�_�[�̃��X�g�ɉ�����
	// Include tab in Z-order list
	lpTopTabInfo = GetTabInfo(activeID);
	if(lpTopTabInfo != NULL){
		lpTabInfo->ZOrder.prev = lpTopTabInfo;
		lpTabInfo->ZOrder.next = lpTopTabInfo->ZOrder.next;
		(lpTopTabInfo->ZOrder.next)->ZOrder.prev = lpTabInfo;
		lpTopTabInfo->ZOrder.next = lpTabInfo;
	}
	else lpTabInfo->ZOrder.next = lpTabInfo->ZOrder.prev = lpTabInfo;

	// �^�u�̖��O��o�^
	// Register tab name
	if(szNewTitleName[0] == '\0') strcpy(szCaption, TABUNTITLED);
	else strcpy(szCaption, szNewTitleName);

	// �V�����^�u��}��
	// Insert a new tab
	if(nTabNumber < 0) nTabNumber = TabCtrl_GetItemCount(hwndTab);
	tc_item.mask = TCIF_TEXT | TCIF_PARAM;
	tc_item.pszText = szCaption;
	tc_item.lParam = (LPARAM)lpTabInfo;
	TabCtrl_InsertItem(hwndTab, nTabNumber, &tc_item);
	TabCtrl_SetCurSel(hwndTab, nTabNumber);
	if(lpTopTabInfo != NULL)
		activeID = GetTabID(lpTopTabInfo->FootyID);
	else
		activeID = -1;

	//
	// ���j���[�ɍ��ڂ�ǉ�
	if(hMenu == NULL)
		hMenu =  GetSubMenu(GetMenu(hwbak), POS_WINDOW);

	mii.cbSize     = sizeof(MENUITEMINFO);
	mii.fMask      = MIIM_ID | MIIM_TYPE;
	mii.fType      = MFT_RADIOCHECK | MFT_STRING;
	// mii.wID        = IDM_ACTIVATETAB + nTabNumber;
	mii.wID        = IDM_SEPARATEWINDOWQ + nTabNumber;
	mii.dwTypeData = (LPSTR)(szNewTitleName[0] == '\0' ? TABUNTITLED : szNewTitleName);
	InsertMenuItem(hMenu, POS_TABBASE + nTabNumber, TRUE, &mii);

	mii.fMask = MIIM_ID;
	for(j = nTabNumber + 1; j < GetMenuItemCount(hMenu); j++){
		mii.wID = IDM_ACTIVATETAB + j;
		SetMenuItemInfo(hMenu, POS_TABBASE + j, TRUE, &mii);
	}
	DrawMenuBar(hwbak);

	ActivateTab(activeID, nTabNumber);

	return;
}

// �^�u���폜����
// Delete a tab
//
// ����(Parameters)
// nTabNumber:  �^�u�ԍ�(Number of target tab)
//
// �߂�l(Result)
// ����܂���(Nothing)
void DeleteTab(int nTabNumber)
{
	TABINFO *lpTabInfo;
	MENUITEMINFO mii;
	int n = TabCtrl_GetItemCount(hwndTab), i, nFootyID;

	lpTabInfo = GetTabInfo(nTabNumber);
//	if(lpTabInfo == NULL || (n == 1 && lpTabInfo->FileName[0] == '\0' && FootyGetMetrics(0, F_GM_UNDOREM) <= 0
//		&& FootyGetMetrics(0, F_GM_REDOREM) <= 0))
	if(lpTabInfo == NULL || (n == 1 && lpTabInfo->FileName[0] == '\0' && Footy2IsEdited(activeFootyID)))	// 2008-02-17 Shark++ ��֋@�\������
		return;

	nFootyID = lpTabInfo->FootyID;
	(lpTabInfo->ZOrder.prev)->ZOrder.next = lpTabInfo->ZOrder.next;
	(lpTabInfo->ZOrder.next)->ZOrder.prev = lpTabInfo->ZOrder.prev;
	free(lpTabInfo);
	TabCtrl_DeleteItem(hwndTab, nTabNumber);
	DeleteMenu(hMenu, POS_TABBASE + nTabNumber, MF_BYPOSITION);

	// �V��������ΏۂƂȂ�^�u���擾
	// Get a new current tab
	if(--n > 0){
		if(activeID == nTabNumber) TabCtrl_SetCurSel(hwndTab, n <= activeID ? n - 1 : activeID);
		else if(activeID > nTabNumber) TabCtrl_SetCurSel(hwndTab, activeID-1);
		activeID = TabCtrl_GetCurSel(hwndTab);
		if(GetTabInfo(activeID) != NULL)
			ActivateTab(-1, activeID);
		else activeFootyID = -1;
	} else CreateTab(0, "", "", "");

	mii.cbSize = sizeof(MENUITEMINFO);
	mii.fMask  = MIIM_ID;
	for(i = nTabNumber; i < GetMenuItemCount(hMenu); i++){
		mii.wID = IDM_ACTIVATETAB + i;
		SetMenuItemInfo(hMenu, POS_TABBASE + i, TRUE, &mii);
	}

	Footy2Delete(nFootyID);
	return;
}

// �^�u�����擾
// Get a tab information
//
// ����(Parameters)
// nTabNumber:  �^�u�ԍ�(Number of target tab)
//
// �߂�l(Result)
// �^�u���̍\���̂ւ̃|�C���^��Ԃ��܂��B
// Return a pointer to a target tab information
TABINFO *GetTabInfo(int nTabNumber)
{
	TCITEM tc_item;

	tc_item.mask = TCIF_PARAM;
	if(!TabCtrl_GetItem(hwndTab, nTabNumber, &tc_item))
		return NULL;
    return (TABINFO *)tc_item.lParam;
}

// �^�u����ݒ�
// Set a tab information
//
// ����(Parameters)
// nTabNumber:  �^�u�ԍ�(Number of target tab.)
// szTitleName: �L���v�V����(The caption.)
// szFileName:  �Ǘ�����t�@�C���̃t�@�C����(File name of file managed by target tab.)
// szDirName:   �Ǘ�����t�@�C���̃f�B���N�g����(Directory name of file managed by target tab.)
// bNeedSave:   �ۑ����K�v�Ȃ�TRUE�A����ȊO�Ȃ�FALSE
//              If this parameter is TRUE, the string target tab has need to save; otherwise, it doesn't.
//
// �߂�l(Result)
// ����܂���(Nothing)
//
// ���l(Remarks)
// szTitleName, szFileName, szDirName��NULL���w�肷��ƁA���̃p�����[�^�͖�������܂��B
// If szTitleName, szFileName, szDirName is set NULL, the parameter is ignored.
void SetTabInfo(int nTabNumber, const char *szTitleName, const char *szFileName, const char *szDirName, BOOL bNeedSave)
{
	MENUITEMINFO mii;
	char *szMenuText;
	TABINFO *lpTabInfo = GetTabInfo(nTabNumber);
	if(lpTabInfo){
		if(szTitleName != NULL) lstrcpy(lpTabInfo->TitleName, szTitleName);
		if(szFileName  != NULL) lstrcpy(lpTabInfo->FileName,  szFileName);
		if(szDirName   != NULL) lstrcpy(lpTabInfo->DirName,   szDirName);
		if(bNeedSave >= 0) lpTabInfo->NeedSave = bNeedSave;

		szMenuText = (char *)malloc(max(lstrlen(lpTabInfo->TitleName), lstrlen(TABUNTITLED)) + 3);
		lstrcpy(szMenuText, lpTabInfo->TitleName[0] == '\0' ? TABUNTITLED : lpTabInfo->TitleName);

		if(lpTabInfo->NeedSave) lstrcat(szMenuText, " *");

		mii.cbSize = sizeof(MENUITEMINFO);
		mii.fMask  = MIIM_TYPE;
		mii.fType  = MFT_STRING | MFT_RADIOCHECK;
		mii.dwTypeData = szMenuText;
		SetMenuItemInfo(hMenu, POS_TABBASE + nTabNumber, TRUE, &mii);
		DrawMenuBar(hwbak);
		free(szMenuText);
	}

	return;
}

// �����𖞂����^�u������
// Search a tab matching up to a conditional
//
// ����(Parameters)
// szTitleName: �L���v�V����(The caption)
// szFileName:  �Ǘ�����t�@�C���̃t�@�C����(File name of file managed by target tab)
// szDirName:   �Ǘ�����t�@�C���̃f�B���N�g����(Directory name of file managed by target tab)
// ullFileIndex: �t�@�C�� �C���f�b�N�X
//
// �߂�l(Result)
// ���������ꍇ�͑Ώۂ̃^�u�ԍ��A������Ȃ����-1��Ԃ��܂��B
// If finder could find a target, return number of target, or else return -1
int SearchTab(const char *szTitleName, const char *szFileName, const char *szDirName, ULONGLONG ullFileIndex)
{
	TABINFO *lpTabInfo;
	int num = TabCtrl_GetItemCount(hwndTab);

	for(int i = 0; i < num; i++){
		lpTabInfo = GetTabInfo(i);

		if((szTitleName  && !strcmp(szTitleName, lpTabInfo->TitleName))
		|| (szFileName   && !strcmp(szFileName,  lpTabInfo->FileName))
		|| (szDirName    && !strcmp(szDirName,   lpTabInfo->DirName))
		|| (ullFileIndex && ullFileIndex == lpTabInfo->FileIndex))
			return i;
	}
	return -1;
}

// �^�u���A�N�e�B�u�ɂ���
// Activate a tab
//
// ����(Parameters)
// nTabNumber: �^�u�ԍ�(Number of target tab)
//
// �߂�l(Result)
// ����܂���(Nothing)
#include "support.h"
void ActivateTab(int nTabNumber1, int nTabNumber2)
{
	TABINFO *lpTabInfo1, *lpTabInfo2;
	RECT rect;

	if(nTabNumber1 == nTabNumber2) return;

	lpTabInfo1 = GetTabInfo(nTabNumber1);
	lpTabInfo2 = GetTabInfo(nTabNumber2);
	if(lpTabInfo2 != NULL){
		activeID = nTabNumber2;
		activeFootyID = lpTabInfo2->FootyID;

		bNeedSave = lpTabInfo2->NeedSave;
		strcpy(szTitleName, lpTabInfo2->TitleName);
		strcpy(szFileName, lpTabInfo2->FileName);
		strcpy(szDirName, lpTabInfo2->DirName);
		DoCaption (szTitleName, activeID);

		SetCurrentDirectory(lpTabInfo2->DirName);
		TabCtrl_SetCurSel(hwndTab, nTabNumber2);
		TabCtrl_SetCurFocus(hwndTab, nTabNumber2);

		GetClientRect(hwndTab, &rect);
		TabCtrl_AdjustRect(hwndTab, FALSE, &rect);
		Footy2Move(activeFootyID, rect.left, rect.top, rect.right-rect.left, rect.bottom-rect.top);
		// Footy2ChangeView(activeFootyID, VIEWMODE_NORMAL);
		Footy2ChangeView(activeFootyID, nowViewMode);// by Tetr@pod
		//Footy2ChangeView(activeFootyID, VIEWMODE_QUAD);
		Footy2SetFocus(activeFootyID, 0);
		poppad_setsb_current(activeFootyID);
		Footy2Refresh(activeFootyID);

		CheckMenuRadioItem(hMenu, POS_TABBASE, GetMenuItemCount(hMenu) - 1, POS_TABBASE + nTabNumber2, MF_BYPOSITION);
	}
	else activeID = activeFootyID = -1;
	if(lpTabInfo1 != NULL)
		Footy2ChangeView(lpTabInfo1->FootyID, VIEWMODE_INVISIBLE);

	return;
}

// Z�I�[�_�[�̏�����ύX����
// Change Z-Order.
//
// ����(Parameters)
// nTabNumber1: �g�b�v�������^�u�ԍ�(Number of tab which was top tab)
// nTabNumber2: �g�b�v�ɂ���^�u�ԍ�(Number of tab been top tab)
//
// �߂�l(Result)
// ����܂���(Nothing)
void ChangeZOrder(int nTabNumber1, int nTabNumber2)
{
	TABINFO *lpTabInfo1, *lpTabInfo2;
	lpTabInfo1 = GetTabInfo(nTabNumber1);
	lpTabInfo2 = GetTabInfo(nTabNumber2);
	if(lpTabInfo1 != NULL && lpTabInfo2 != NULL){
		(lpTabInfo2->ZOrder.prev)->ZOrder.next = lpTabInfo2->ZOrder.next;
		(lpTabInfo2->ZOrder.next)->ZOrder.prev = lpTabInfo2->ZOrder.prev;
		(lpTabInfo1->ZOrder.next)->ZOrder.prev = lpTabInfo2;
		lpTabInfo2->ZOrder.prev = lpTabInfo1;
		lpTabInfo2->ZOrder.next = lpTabInfo1->ZOrder.next;
		lpTabInfo1->ZOrder.next = lpTabInfo2;
	}

}


// Footy��ID����ID���擾����
// Get tab ID by Footy ID
//
// ����(Parameters)
// lpTabInfo: Footy��ID(ID of Footy)
//
// �߂�l(Result)
// �n���ꂽFootyID�����^�u��ID
// ID of tab which has Footy ID
int GetTabID(int FootyID)
{
	TABINFO *lpTabInfo;
	int num = TabCtrl_GetItemCount(hwndTab);

    for(int i = 0; i < num; i++){
		lpTabInfo = GetTabInfo(i);
		if(lpTabInfo != NULL){
			if(lpTabInfo->FootyID == FootyID)
				return i;
		}
	}
	return -1;
}