; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    shell32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __shell32_gen2_as__
#define __shell32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "shell32.dll"
; void DragAcceptFiles(winmdroot.Foundation.HWND hWnd, winmdroot.Foundation.BOOL fAccept)
#func DragAcceptFiles "DragAcceptFiles" intptr, int

; void DragFinish(winmdroot.UI.Shell.HDROP hDrop)
#func DragFinish "DragFinish" intptr

; uint DragQueryFileW(winmdroot.UI.Shell.HDROP hDrop, uint iFile, winmdroot.Foundation.PWSTR lpszFile, uint cch)
#cfunc DragQueryFileW "DragQueryFileW" intptr, int, wstr, int

; winmdroot.Foundation.BOOL DragQueryPoint(winmdroot.UI.Shell.HDROP hDrop, global::System.Drawing.Point* ppt)
#cfunc DragQueryPoint "DragQueryPoint" intptr, var

; winmdroot.UI.WindowsAndMessaging.HICON ExtractIconW(winmdroot.Foundation.HINSTANCE hInst, winmdroot.Foundation.PCWSTR pszExeFileName, uint nIconIndex)
#cfunc ExtractIconW "ExtractIconW" intptr, wstr, int

; winmdroot.UI.Shell.Common.ITEMIDLIST* SHBrowseForFolderW(winmdroot.UI.Shell.BROWSEINFOW* lpbi)
#cfunc SHBrowseForFolderW "SHBrowseForFolderW" var

; void SHChangeNotify(int wEventId, winmdroot.UI.Shell.SHCNF_FLAGS uFlags, [Optional] void* dwItem1, [Optional] void* dwItem2)
#func SHChangeNotify "SHChangeNotify" int, int, intptr, intptr

; winmdroot.Foundation.HRESULT SHGetFolderPathW(winmdroot.Foundation.HWND hwnd, int csidl, winmdroot.Foundation.HANDLE hToken, uint dwFlags, winmdroot.Foundation.PWSTR pszPath)
#cfunc SHGetFolderPathW "SHGetFolderPathW" intptr, int, intptr, int, wstr

; winmdroot.Foundation.HRESULT SHGetKnownFolderPath(global::System.Guid* rfid, uint dwFlags, winmdroot.Foundation.HANDLE hToken, winmdroot.Foundation.PWSTR* ppszPath)
#cfunc SHGetKnownFolderPath "SHGetKnownFolderPath" var, int, intptr, var

; winmdroot.Foundation.BOOL SHGetPathFromIDListW(winmdroot.UI.Shell.Common.ITEMIDLIST* pidl, winmdroot.Foundation.PWSTR pszPath)
#cfunc SHGetPathFromIDListW "SHGetPathFromIDListW" var, wstr

; winmdroot.Foundation.BOOL SHGetSpecialFolderPathW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PWSTR pszPath, int csidl, winmdroot.Foundation.BOOL fCreate)
#cfunc SHGetSpecialFolderPathW "SHGetSpecialFolderPathW" intptr, wstr, int, int

; winmdroot.Foundation.HINSTANCE ShellExecuteW(winmdroot.Foundation.HWND hwnd, winmdroot.Foundation.PCWSTR lpOperation, winmdroot.Foundation.PCWSTR lpFile, winmdroot.Foundation.PCWSTR lpParameters, winmdroot.Foundation.PCWSTR lpDirectory, winmdroot.UI.WindowsAndMessaging.SHOW_WINDOW_CMD nShowCmd)
#cfunc ShellExecuteW "ShellExecuteW" intptr, wstr, wstr, wstr, wstr, int

#endif
