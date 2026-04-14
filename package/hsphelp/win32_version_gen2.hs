; ============================================================
;   version.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
GetFileVersionInfoW
指定ファイルのバージョン情報を取得する。(GetFileVersionInfoW)
%group
Win32 version
%prm
lptstrFilename, dwHandle, dwLen, lpData
lptstrFilename : [wstr] 型: LPCTSTR ファイル名。フルパス指定でない場合は LoadLibrary と同じ検索順序を使う。
dwHandle : [int] 型: DWORD このパラメータは無視される。
dwLen : [int] 型: DWORD lpData が指すバッファのサイズ(バイト単位)。先に GetFileVersionInfoSize を呼んで必要サイズを求めること。不十分なサイズを渡すと関数はバージョン情報を切り詰める。
lpData : [intptr] 型: LPVOID ファイルバージョン情報を受け取るバッファへのポインタ。後で VerQueryValue に渡してデータを取り出せる。
%inst
指定ファイルのバージョン情報を取得する。(GetFileVersionInfoW)

[戻り値]
型: BOOL 成功時は 0 以外、失敗時は 0 を返す。拡張エラー情報は GetLastError で取得する。

[備考]
ファイルバージョン情報には固定部と非固定部がある。固定部にはバージョン番号などが含まれ、非固定部には文字列などが含まれる。かつてはバイナリ
(exe/dll) からバージョン情報を取得していたが、現在は言語中立ファイルから固定部を、mui
ファイルから非固定部を取得してマージする。対象バイナリに mui ファイルがない場合は従来と同じ動作。呼び出し前に
GetFileVersionInfoSize を呼ぶこと。取得後のバッファから情報を取り出すには VerQueryValue を使う。
> [!NOTE] > winver.h は UNICODE マクロに応じて GetFileVersionInfo を
ANSI/Unicode 版のエイリアスとして定義する。


%index
GetFileVersionInfoSizeW
OS が指定ファイルのバージョン情報を取得できるかを判定し、取得可能ならそのサイズ(バイト単位)を返す。(Unicode)
%group
Win32 version
%prm
lptstrFilename, lpdwHandle
lptstrFilename : [wstr] 型: LPCTSTR 対象ファイルの名前。LoadLibrary と同じ検索順序を使う。
lpdwHandle : [var] 型: LPDWORD 関数が 0 に設定する変数へのポインタ。
%inst
OS が指定ファイルのバージョン情報を取得できるかを判定し、取得可能ならそのサイズ(バイト単位)を返す。(Unicode)

[戻り値]
型: DWORD 成功時はファイルのバージョン情報サイズ(バイト単位)を返す。失敗時は 0。拡張エラー情報は GetLastError
で取得する。

[備考]
GetFileVersionInfo を呼ぶ前に本関数を呼ぶこと。返されたサイズは GetFileVersionInfo
に必要なバッファサイズを示す。
> [!NOTE] > winver.h は UNICODE マクロに応じて GetFileVersionInfoSize を
ANSI/Unicode 版のエイリアスとして定義する。


%index
VerQueryValueW
指定のバージョン情報リソースから指定の情報を取得する。(Unicode)
%group
Win32 version
%prm
pBlock, lpSubBlock, lplpBuffer, puLen
pBlock : [intptr] 型: LPCVOID GetFileVersionInfo が返したバージョン情報リソース。
lpSubBlock : [wstr] 型: LPCTSTR 取得するバージョン情報の値。バックスラッシュ (\\) で区切られた名前で構成する。
lplpBuffer : [var] 型: LPVOID* 復帰時、pBlock 内の要求バージョン情報へのポインタを受け取る。pBlock のメモリ解放時に一緒に解放される。
puLen : [var] 型: PUINT 復帰時、lplpBuffer が指すデータのサイズを受け取る。バージョン情報値の場合は文字列の文字数、翻訳配列値の場合は配列のバイト数、ルートブロックの場合は構造体のバイト数。
%inst
指定のバージョン情報リソースから指定の情報を取得する。(Unicode)

[戻り値]
型: BOOL 指定のバージョン情報構造体が存在し情報が取得できれば 0 以外、長さバッファのアドレスが 0
であれば該当名前用の値が存在しない。指定名前が存在しない/リソースが無効の場合は 0 を返す。

[備考]
本関数は 16/32/64 ビットファイルイメージで動作する。定義済みバージョン情報 Unicode 文字列は以下の通り。
（以下省略）

