; ============================================================
;   propsys.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
PropVariantChangeType
Coerces a value stored as a PROPVARIANT structure to an equivalent value of a different variant type.
%group
Win32 propsys
%prm
ppropvarDest, propvarSrc, flags, vt
ppropvarDest : [var] Type: PROPVARIANT* A pointer to a PROPVARIANT structure that, when this function returns successfully, receives the coerced value and its new type.
propvarSrc : [var] Type: REFPROPVARIANT A reference to the source PROPVARIANT structure that contains the value expressed as its original type.
flags : [int] Type: PROPVAR_CHANGE_FLAGS Reserved, must be 0.
vt : [int] Type: VARTYPE Specifies the new type for the value. See the tables below for recognized type names.
%inst
Coerces a value stored as a PROPVARIANT structure to an equivalent
value of a different variant type.

[戻り値]
Type: HRESULT Returns S_OK if successful, or a standard COM error
value otherwise. If the requested coercion is not possible, an error
is returned.

[備考]
Note that the source and destination PROPVARIANT structures must be
separate structures. You cannot overwrite the source PROPVARIANT data
with the new destination data; attempting to do so will result in an
error.
PropVariantChangeType converts values between the following types as
follows. Numbers refer to conditions explained after the tables.
This doc was truncated.

