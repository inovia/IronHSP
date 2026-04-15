; ============================================================
;   secur32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
GetComputerObjectNameW
ローカルコンピュータ名を指定された形式で取得する。(Unicode)
%group
Win32 secur32
%prm
NameFormat, lpNameBuffer, nSize
NameFormat : [int] 名前の形式。このパラメータは EXTENDED_NAME_FORMAT 列挙体の値。NameUnknown は指定できない。
lpNameBuffer : [wstr] 指定された形式の名前を受け取るバッファへのポインタ。
nSize : [var] 入力時は lpNameBuffer バッファのサイズを TCHAR 単位で指定する。成功時はバッファにコピーされた名前のサイズを受け取る。lpNameBuffer バッファが小さすぎて名前を格納できない場合、関数は失敗し lpnSize に必要なバッファサイズが返る。
%inst
ローカルコンピュータ名を指定された形式で取得する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。失敗時は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
> [!NOTE] > secext.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして GetComputerObjectName
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
TranslateNameW
ディレクトリサービスオブジェクトの名前をある形式から別の形式へ変換する。(Unicode)
%group
Win32 secur32
%prm
lpAccountName, AccountNameFormat, DesiredNameFormat, lpTranslatedName, nSize
lpAccountName : [wstr] 変換対象の名前。
AccountNameFormat : [int] 変換する名前の形式。このパラメータは EXTENDED_NAME_FORMAT 列挙体の値。
DesiredNameFormat : [int] 変換後の名前の形式。このパラメータは EXTENDED_NAME_FORMAT 列挙体の値。NameUnknown は指定できない。
lpTranslatedName : [wstr] 変換後の名前を受け取るバッファへのポインタ。
nSize : [var] 入力時は lpTranslatedName バッファのサイズを TCHAR 単位で示す。出力時は終端 NULL 文字を含めた返却文字列のサイズを TCHAR 単位で返す。
%inst
ディレクトリサービスオブジェクトの名前をある形式から別の形式へ変換する。(Unicode)

[戻り値]
関数が成功すると戻り値は 0 以外となる。失敗時は 0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
TranslateName はドメインコントローラ上の Active Directory にバインドできない場合に失敗する。
> [!NOTE] > secext.h ヘッダは、UNICODE プリプロセッサ定数の定義に基づいて本関数の ANSI 版と
Unicode 版を自動的に選択するエイリアスとして TranslateName
を定義している。エンコーディング中立なエイリアスとエンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを招く不整合が発生しうる。詳しくは
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。

