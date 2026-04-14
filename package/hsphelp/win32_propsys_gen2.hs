; ============================================================
;   propsys.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
PropVariantChangeType
PROPVARIANT 構造体に格納された値を、別のバリアント型の等価な値に強制変換する。
%group
Win32 propsys
%prm
ppropvarDest, propvarSrc, flags, vt
ppropvarDest : [var] 型: PROPVARIANT* PROPVARIANT 構造体へのポインタ。この関数が成功して戻ると、強制変換された値とその新しい型を受け取る。
propvarSrc : [var] 型: REFPROPVARIANT 元の型で表現された値を保持する変換元 PROPVARIANT 構造体への参照。
flags : [int] 型: PROPVAR_CHANGE_FLAGS 予約済み。0 でなければならない。
vt : [int] 型: VARTYPE 値の新しい型を指定する。認識される型名については下表を参照のこと。
%inst
PROPVARIANT 構造体に格納された値を、別のバリアント型の等価な値に強制変換する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、失敗した場合は標準の COM
エラー値を返す。要求された強制変換が不可能な場合はエラーを返す。

[備考]
変換元と変換先の PROPVARIANT 構造体は別々の構造体でなければならない点に注意する。変換元 PROPVARIANT
のデータを新しい変換先のデータで上書きすることはできず、これを試みるとエラーになる。
PropVariantChangeType は次のように型間で値を変換する。番号は表の後で説明する条件を指す。
このドキュメントは省略されている。

