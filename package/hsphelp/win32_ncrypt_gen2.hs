; ============================================================
;   ncrypt.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
NCryptFreeObject
Frees a CNG key storage object.
%group
Win32 ncrypt
%prm
hObject
hObject : [int] The handle of the object to free. This can be either a provider handle (NCRYPT_PROV_HANDLE) or a key handle (NCRYPT_KEY_HANDLE).
%inst
Frees a CNG key storage object.

[戻り値]
Returns a status code that indicates the success or failure of the
function.
Possible return codes include, but are not limited to, the following.
This doc was truncated.

[備考]
A service must not call this function from its StartService Function.
If a service calls this function from its StartService function, a
deadlock can occur, and the service may stop responding.

