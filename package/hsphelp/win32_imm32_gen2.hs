; ============================================================
;   imm32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
ImmDestroyContext
ImmDestroyContext 関数 (immdev.h) は入力コンテキストを解放し関連メモリを解放する。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmDestroyContext 関数 (immdev.h) は入力コンテキストを解放し関連メモリを解放する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。

[備考]
ImmCreateContext で入力コンテキストを作成したアプリケーションは終了前に本関数で解放する必要がある。ただし呼び出し前に
ImmAssociateContext でスレッド内のウィンドウとの関連付けを解除しておく必要がある。


%index
ImmAssociateContext
ImmAssociateContext 関数 (immdev.h) は指定の入力コンテキストを指定ウィンドウに関連付ける。
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
ImmAssociateContext 関数 (immdev.h) は指定の入力コンテキストを指定ウィンドウに関連付ける。

[戻り値]
以前にそのウィンドウに関連付けられていた入力コンテキストのハンドルを返す。

[備考]

入力コンテキストをウィンドウに関連付ける際、アプリケーションは入力コンテキストを破棄する前に関連付けを解除しなければならない。ハンドルを保存しておき、ウィンドウの既定入力コンテキストに戻すのが一つの方法。


%index
ImmGetCompositionStringW
ImmGetCompositionStringW (Unicode) 関数 (immdev.h) は組み立て中文字列の情報を取得する。
%group
Win32 imm32
%prm
param0, param1, lpBuf, dwBufLen
param0 : [intptr] 
param1 : [int] 
lpBuf : [intptr] 組み立て中文字列情報を受け取るバッファへのポインタ。
dwBufLen : [int] 出力バッファのサイズ(バイト単位)。Unicode 文字列の場合もバイト単位。0 を渡すと必要サイズを返す。
%inst
ImmGetCompositionStringW (Unicode) 関数 (immdev.h) は組み立て中文字列の情報を取得する。

[戻り値]
出力バッファにコピーされたバイト数を返す。dwBufLen が 0 の場合、終端 NULL
を除いた必要バッファサイズをバイト単位で返す。戻り値は要求情報が Unicode
文字列でも常にバイト単位。失敗時は以下の負のエラーコードのいずれかを返す:
（以下省略）

[備考]
WM_IME_COMPOSITION または WM_IME_STARTCOMPOSITION
メッセージへの応答として呼び出す。ImmReleaseContext を呼ぶと IMM は情報を除去する。注意: SIP
と併用される場合は全角ひらがなと半角カタカナの両方を扱うコードが必要。
> [!NOTE] > immdev.h は UNICODE マクロに応じて ImmGetCompositionString を
ANSI/Unicode 版のエイリアスとして定義する。


%index
ImmGetContext
ImmGetContext 関数 (immdev.h) は指定ウィンドウに関連付けられた入力コンテキストを返す。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmGetContext 関数 (immdev.h) は指定ウィンドウに関連付けられた入力コンテキストを返す。

[戻り値]
入力コンテキストのハンドルを返す。

[備考]
アプリケーションはコンテキスト内の情報にアクセスする前に本関数で現在の入力コンテキストを取得するのが定石。使用後は必ず
ImmReleaseContext を呼ぶ。


%index
ImmGetDefaultIMEWnd
ImmGetDefaultIMEWnd 関数 (immdev.h) は IME クラスの既定ウィンドウハンドルを取得する。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmGetDefaultIMEWnd 関数 (immdev.h) は IME クラスの既定ウィンドウハンドルを取得する。

[戻り値]
成功時は IME クラスの既定ウィンドウハンドルを返す。失敗時は NULL。

[備考]
OS は各スレッドに対して既定 IME ウィンドウを作成する。作成は IME クラスに基づく。アプリケーションはこのウィンドウに
WM_IME_CONTROL メッセージを送れる。


%index
ImmIsIME
ImmIsIME 関数 (immdev.h) は指定の入力ロケールが IME を持つかを判定する。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmIsIME 関数 (immdev.h) は指定の入力ロケールが IME を持つかを判定する。

[戻り値]
ロケールが IME を持つ場合 0 以外、そうでなければ 0 を返す。


%index
ImmReleaseContext
ImmReleaseContext 関数 (immdev.h) は入力コンテキストを解放し関連メモリのロックを解除する。
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [intptr] 
%inst
ImmReleaseContext 関数 (immdev.h) は入力コンテキストを解放し関連メモリのロックを解除する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。


%index
ImmSetCandidateWindow
ImmSetCandidateWindow 関数 (immdev.h) は候補ウィンドウに関する情報を設定する。
%group
Win32 imm32
%prm
param0, lpCandidate
param0 : [intptr] 
lpCandidate : [var] 候補ウィンドウに関する情報を保持する CANDIDATEFORM 構造体へのポインタ。
%inst
ImmSetCandidateWindow 関数 (immdev.h) は候補ウィンドウに関する情報を設定する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。

[備考]
本関数は IMN_SETCANDIDATEPOS コマンドを送信させる。IME とアプリケーション双方から呼ばれる。


%index
ImmSetCompositionWindow
ImmSetCompositionWindow 関数 (immdev.h) は組み立て中ウィンドウの位置を設定する。
%group
Win32 imm32
%prm
param0, lpCompForm
param0 : [intptr] 
lpCompForm : [var] 組み立て中ウィンドウの新しい位置など関連情報を保持する COMPOSITIONFORM 構造体へのポインタ。
%inst
ImmSetCompositionWindow 関数 (immdev.h) は組み立て中ウィンドウの位置を設定する。

[戻り値]
成功時は 0 以外、失敗時は 0 を返す。

[備考]
本関数はアプリケーションに IMN_SETCOMPOSITIONWINDOW コマンドを送信させる。

