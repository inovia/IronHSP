/**
 * @file FootyDocClip.cpp
 * @brief �h�L�������g�Ǘ��N���X�B���̃t�@�C���ŃN���b�v�{�[�h�֘A�̏������s���܂�
 * @author Shinji Watanabe
 * @date 2009/01/11
 */

#include "FootyDoc.h"

//-----------------------------------------------------------------------------
/**
 * @brief �N���b�v�{�[�h�փR�s�[�������s���܂��B
 */
bool CFootyDoc::ClipCopy(HWND hWnd)
{
	// �錾
	std::wstring strSelText;
	HGLOBAL hMem;
	
	// ���b�N���āA�R�s�[������𐶐�
	if (!GetSelText(&strSelText))return false;
	hMem = GlobalAlloc(GHND, strSelText.size()+sizeof(wchar_t));
    memcpy(GlobalLock(hMem),strSelText.c_str(),strSelText.size()+sizeof(wchar_t));
    GlobalUnlock(hMem);
	
	// �N���b�v�{�[�h���I�[�v�����āA�R�s�[
	if (!OpenClipboard(hWnd))
	{
		GlobalFree(hMem);
		return false;
	}
	EmptyClipboard();
	SetClipboardData(CF_UNICODETEXT, hMem);
	CloseClipboard();
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief �N���b�v�{�[�h����\��t���������s���܂��B
 */
CFootyDoc::RedrawType CFootyDoc::ClipPaste(HWND hWnd)
{
	// �錾
	HGLOBAL hMem;
	wchar_t* lpStr;
	
	if ( IsReadOnly() ) return REDRAW_FAILED;
	
	// �N���b�v�{�[�h�����擾����
	if(!IsClipboardFormatAvailable(CF_UNICODETEXT)) // �e�L�X�g��񂪗��p�ł��Ȃ�
        return REDRAW_FAILED;
	if (!OpenClipboard(hWnd))
		return REDRAW_FAILED;
	hMem = (HGLOBAL*)GetClipboardData(CF_UNICODETEXT);
	if (!hMem)
	{
		CloseClipboard();
		return REDRAW_FAILED;
	}
	lpStr=(wchar_t*)GlobalLock(hMem);
	if (lpStr[0] != L'\0')				// �ȉ��͕����񂪂���Ƃ��̂�
		InsertString(lpStr,true);		// �}��
	GlobalUnlock(hMem);					// �O���[�o���������̉��
	CloseClipboard();					// �N���b�v�{�[�h�����
	return REDRAW_ALL;
}

/*[EOF]*/
