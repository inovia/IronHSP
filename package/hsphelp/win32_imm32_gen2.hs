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
ImmAssociateContextEx
ImmAssociateContextEx 関数 (immdev.h) は、入力コンテキストと指定したウィンドウまたはその子ウィンドウとの関連付けを変更する。
%group
Win32 imm32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
%inst
ImmAssociateContextEx 関数 (immdev.h)
は、入力コンテキストと指定したウィンドウまたはその子ウィンドウとの関連付けを変更する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
アプリケーションが IACE_CHILDREN を指定してこの関数を呼び出すと、オペレーティングシステムは指定した入力コンテキストを
hWnd で示されるウィンドウの子ウィンドウに関連付ける。入力コンテキストは hWnd
を作成したスレッドの子ウィンドウにのみ関連付けられる。この関数が呼び出された後に作成された子ウィンドウには影響せず、それらにはデフォルトの入力コンテキストが関連付けられる。IACE_DEFAULT
を指定して呼び出した場合、オペレーティングシステムはそのウィンドウのデフォルトの入力コンテキストを復元する。この場合、hIMC
パラメータは無視される。


%index
ImmConfigureIMEA
ImmConfigureIMEA (ANSI) 関数 (immdev.h) は、指定した入力ロケール識別子の IME 用構成ダイアログボックスを表示する。
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
param3 : [intptr] 
%inst
ImmConfigureIMEA (ANSI) 関数 (immdev.h) は、指定した入力ロケール識別子の IME
用構成ダイアログボックスを表示する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmConfigureIME をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmConfigureIMEW
ImmConfigureIMEW (Unicode) 関数 (immdev.h) は、指定した入力ロケール識別子の IME 用構成ダイアログボックスを表示する。
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
param3 : [intptr] 
%inst
ImmConfigureIMEW (Unicode) 関数 (immdev.h) は、指定した入力ロケール識別子の IME
用構成ダイアログボックスを表示する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmConfigureIME をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmCreateContext
ImmCreateContext 関数 (immdev.h) は、新しい入力コンテキストを作成し、そのメモリを割り当てて初期化する。
%group
Win32 imm32
%prm

%inst
ImmCreateContext 関数 (immdev.h) は、新しい入力コンテキストを作成し、そのメモリを割り当てて初期化する。

[戻り値]
成功した場合は新しい入力コンテキストへのハンドルを、失敗した場合は NULL を返す。


%index
ImmCreateIMCC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [int] 
%inst



%index
ImmCreateSoftKeyboard
(no summary)
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [int] 
param1 : [intptr] 
param2 : [int] 
param3 : [int] 
%inst



%index
ImmDestroyIMCC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmDestroySoftKeyboard
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmDisableIME
ImmDisableIME 関数 (immdev.h) は、スレッドまたはプロセス内のすべてのスレッドに対して IME を無効化する。
%group
Win32 imm32
%prm
param0
param0 : [int] 
%inst
ImmDisableIME 関数 (immdev.h) は、スレッドまたはプロセス内のすべてのスレッドに対して IME を無効化する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
アプリケーションは、スレッド内の最初のトップレベルウィンドウが WM_CREATE
メッセージを受け取る前にこの関数を呼び出す必要がある。したがって、アプリケーションはこの関数を次のいずれかの場所で呼び出す必要がある。
（以下省略）


%index
ImmDisableLegacyIME
ImmDisableLegacyIME 関数 (immdev.h) は、このスレッドが Windows ストアアプリ UI スレッドであることを示す。
%group
Win32 imm32
%prm

%inst
ImmDisableLegacyIME 関数 (immdev.h) は、このスレッドが Windows ストアアプリ UI
スレッドであることを示す。

[戻り値]
成功した場合は TRUE を、それ以外は FALSE を返す。

[備考]
explorer.exe のような Windows ストアアプリブローカーは、Windows ストアアプリ UI
スレッドでこの関数を呼び出し、Windows ストアアプリ互換の IME のみが利用可能になるようにするべきである。IME
入力を必要としない Windows ストアアプリスレッドでは、ImmDisableIME を呼び出してそのスレッドの IMM
を完全に無効化するべきである。アプリは、スレッド内の最初のトップレベルウィンドウが WM_CREATE
メッセージを受け取る前にこの関数を呼び出す必要がある。したがって、アプリはこの関数を次のいずれかの場所で呼び出す必要がある。
（以下省略）


%index
ImmDisableTextFrameService
ImmDisableTextFrameService 関数 (immdev.h) は、Windows Vista 以降では使用できなくなっている。
%group
Win32 imm32
%prm
idThread
idThread : [int] テキストサービスを無効化するスレッドの識別子。スレッドはアプリケーションと同じプロセス内にある必要がある。アプリケーションは、現在のスレッドのサービスを無効化する場合はこのパラメータに 0 を設定する。現在のプロセス内のすべてのスレッドのサービスを無効化する場合は ?1 を設定する。
%inst
ImmDisableTextFrameService 関数 (immdev.h) は、Windows Vista
以降では使用できなくなっている。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
アプリケーションは、TSF と互換性のないスレッドを持っている場合にこの関数を呼び出す。TSF 機能は、TSF、入力メソッドマネージャ
(IMM32)、または Active Input Method Manager (AIMM 1.2)
を使うために特別に書かれていないアプリケーションに対しても提供される点に注意。アプリケーションが TSF、IMM32、AIMM 1.2
を使うように書かれていても、アプリケーション内の特定のコントロールがこれらの技術を使わない場合がある。そうした特定のコントロールに対しても
TSF サポートが提供される。この TSF 機能は、システムモジュール
User32.dll、Imm32.dll、Win32k.sys、および TSF モジュール Msctf.dll、Msimtf.dll
のすべてのダイナミックリンクライブラリ (DLL) がロードされている Windows XP 以降で利用できる。


%index
ImmEnumInputContext
ImmEnumInputContext 関数 (immdev.h) は、指定したスレッドの入力コンテキストを取得する。
%group
Win32 imm32
%prm
idThread, lpfn, lParam
idThread : [int] 
lpfn : [int] 列挙コールバック関数へのポインタ。詳細は EnumInputContext を参照。
lParam : [intptr] アプリケーションが指定するデータ。関数はこのデータをコールバック関数に渡す。
%inst
ImmEnumInputContext 関数 (immdev.h) は、指定したスレッドの入力コンテキストを取得する。

[戻り値]
成功した場合は TRUE を、失敗した場合は FALSE を返す。

[備考]
この関数は列挙された入力コンテキストごとにアプリケーションのコールバック関数を呼び出し、指定した lParam の値を渡す。


%index
ImmEnumRegisterWordW
ImmEnumRegisterWordW (Unicode) 関数 (immdev.h) は、指定した読み文字列、スタイル、登録文字列を持つ登録文字列を列挙する。
%group
Win32 imm32
%prm
param0, param1, lpszReading, param3, lpszRegister, param5
param0 : [intptr] 
param1 : [int] 
lpszReading : [wstr] 列挙する読み文字列へのポインタ。dwStyle と lpszRegister の設定に一致するすべての読み文字列を列挙する場合は、このパラメータに NULL を指定する。
param3 : [int] 
lpszRegister : [wstr] 列挙する登録文字列へのポインタ。lpszReading と dwStyle の設定に一致するすべての登録文字列を列挙する場合は、このパラメータに NULL を指定する。
param5 : [intptr] 
%inst
ImmEnumRegisterWordW (Unicode) 関数 (immdev.h)
は、指定した読み文字列、スタイル、登録文字列を持つ登録文字列を列挙する。

[戻り値]
コールバック関数が最後に返した値を返す。その意味はアプリケーションが定義する。登録文字列を列挙できなかった場合は 0 を返す。

[備考]
dwStyle が 0 で、lpszReading と lpszRegister の両方が NULL の場合、この関数は IME
辞書内のすべての登録文字列を列挙する。 > [!NOTE] > immdev.h ヘッダーは ImmEnumRegisterWord
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmEscapeW
ImmEscapeW (Unicode) 関数 (immdev.h) は、他の IME API 関数では利用できない特定の IME の機能にアクセスする。
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [intptr] 
param2 : [int] 
param3 : [intptr] 
%inst
ImmEscapeW (Unicode) 関数 (immdev.h) は、他の IME API 関数では利用できない特定の IME
の機能にアクセスする。

[戻り値]
成功した場合は操作固有の値を、失敗した場合は 0 を返す。

[備考]
uEscape に IME_ESC_QUERY_SUPPORT を指定した場合、lpData は IME
エスケープ値を格納したバッファを示す。たとえば、現在の IME が IME_ESC_GETHELPFILENAME
をサポートしているかを調べるには、次のように呼び出す。
（以下省略）


%index
ImmGenerateMessage
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmGetCandidateListW
ImmGetCandidateListW (Unicode) 関数 (immdev.h) は、候補リストを取得する。
%group
Win32 imm32
%prm
param0, deIndex, lpCandList, dwBufLen
param0 : [intptr] 
deIndex : [int] 候補リストのゼロベースのインデックス。
lpCandList : [var] 関数が候補リストを取得する CANDIDATELIST 構造体へのポインタ。
dwBufLen : [int] 候補リストを受け取るバッファのサイズ (バイト単位)。出力バッファに必要なサイズだけを返させたい場合、アプリケーションはこのパラメータに 0 を指定してもよい。
%inst
ImmGetCandidateListW (Unicode) 関数 (immdev.h) は、候補リストを取得する。

[戻り値]
成功した場合は候補リストバッファにコピーされたバイト数を返す。アプリケーションが dwBufLen パラメータに 0
を指定した場合は、候補リストバッファに必要なサイズを返す。失敗した場合は 0 を返す。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmGetCandidateList
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmGetCandidateListCountW
ImmGetCandidateListCountW (Unicode) 関数 (immdev.h) は、候補リストのサイズを取得する。
%group
Win32 imm32
%prm
param0, lpdwListCount
param0 : [intptr] 
lpdwListCount : [var] この関数が候補リストのサイズを格納するバッファへのポインタ。
%inst
ImmGetCandidateListCountW (Unicode) 関数 (immdev.h) は、候補リストのサイズを取得する。

[戻り値]
成功した場合はすべての候補リストに必要なバイト数を、失敗した場合は 0 を返す。

[備考]
アプリケーションは通常、IMN_OPENCANDIDATE または IMN_CHANGECANDIDATE
コマンドに応じてこの関数を呼び出す。
> [!NOTE] > immdev.h ヘッダーは ImmGetCandidateListCount
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmGetCandidateWindow
ImmGetCandidateWindow 関数 (immdev.h) は、候補ウィンドウに関する情報を取得する。
%group
Win32 imm32
%prm
param0, param1, lpCandidate
param0 : [intptr] 
param1 : [int] 
lpCandidate : [var] この関数が候補ウィンドウに関する情報を取得する CANDIDATEFORM 構造体へのポインタ。
%inst
ImmGetCandidateWindow 関数 (immdev.h) は、候補ウィンドウに関する情報を取得する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。


%index
ImmGetCompositionFontW
ImmGetCompositionFontW (Unicode) 関数 (immdev.h) は、組み立てウィンドウで文字を表示するために現在使われている論理フォントに関する情報を取得する。
%group
Win32 imm32
%prm
param0, lplf
param0 : [intptr] 
lplf : [var] この関数がフォント情報を取得する LOGFONT 構造体へのポインタ。
%inst
ImmGetCompositionFontW (Unicode) 関数 (immdev.h)
は、組み立てウィンドウで文字を表示するために現在使われている論理フォントに関する情報を取得する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmGetCompositionFont
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


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
ImmGetCompositionWindow
ImmGetCompositionWindow 関数 (immdev.h) は、組み立てウィンドウに関する情報を取得する。
%group
Win32 imm32
%prm
param0, lpCompForm
param0 : [intptr] 
lpCompForm : [var] 関数が組み立てウィンドウに関する情報を取得する COMPOSITIONFORM 構造体へのポインタ。
%inst
ImmGetCompositionWindow 関数 (immdev.h) は、組み立てウィンドウに関する情報を取得する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。


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
ImmGetConversionListW
ImmGetConversionListW (Unicode) 関数 (immdev.h) は、IME 関連のメッセージを発生させずに、文字または単語の変換結果リストを取得する。
%group
Win32 imm32
%prm
param0, param1, lpSrc, lpDst, dwBufLen, uFlag
param0 : [intptr] 
param1 : [intptr] 
lpSrc : [wstr] リストのソースを指定する、null で終わる文字列へのポインタ。
lpDst : [var] 関数がリストを取得する CANDIDATELIST 構造体へのポインタ。
dwBufLen : [int] 出力バッファのサイズ (バイト単位)。変換結果リスト全体に必要なバッファサイズを返させたい場合、アプリケーションはこのパラメータに 0 を指定する。
uFlag : [int] 
%inst
ImmGetConversionListW (Unicode) 関数 (immdev.h) は、IME
関連のメッセージを発生させずに、文字または単語の変換結果リストを取得する。

[戻り値]
出力バッファにコピーされたバイト数を返す。アプリケーションが dwBufLen パラメータに 0
を指定した場合、必要な出力バッファのサイズ (バイト単位) を返す。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmGetConversionList
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmGetConversionStatus
ImmGetConversionStatus 関数 (immdev.h) は、現在の変換状態を取得する。
%group
Win32 imm32
%prm
param0, lpfdwConversion, lpfdwSentence
param0 : [intptr] 
lpfdwConversion : [var] 関数が変換モード値の組み合わせを取得する変数へのポインタ。詳細は IME Conversion Mode Values を参照。
lpfdwSentence : [var] 関数が文節モード値を取得する変数へのポインタ。詳細は IME Sentence Mode Values を参照。
%inst
ImmGetConversionStatus 関数 (immdev.h) は、現在の変換状態を取得する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
変換モードおよび文節モードの値は、IME がそれらのモードをサポートしている場合にのみ設定される。


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
ImmGetDescriptionW
ImmGetDescriptionW (Unicode) 関数 (immdev.h) は、IME の説明を指定したバッファにコピーする。
%group
Win32 imm32
%prm
param0, lpszDescription, uBufLen
param0 : [intptr] 
lpszDescription : [wstr] 関数が IME を説明する null 終端文字列を取得するバッファへのポインタ。
uBufLen : [int] 出力バッファのサイズ (文字単位)。説明全体に必要なバッファサイズ (終端の null 文字を除く) を返させたい場合、アプリケーションはこのパラメータに 0 を指定する。Windows NT、Windows 2000、Windows XP: バッファのサイズは Unicode 文字単位で、各文字は 2 バイトで構成される。このパラメータを 0 に設定すると、関数は必要なバッファサイズを Unicode 文字単位で (Unicode の終端 null 文字を除いて) 返す。
%inst
ImmGetDescriptionW (Unicode) 関数 (immdev.h) は、IME の説明を指定したバッファにコピーする。

[戻り値]
出力バッファにコピーされた文字数を返す。アプリケーションが uBufLen パラメータに 0
を指定した場合、説明を受け取るのに必要なバッファサイズを返す。いずれの値も終端の null 文字を含まない。Unicode
の場合は、Unicode 終端 null 文字を除く Unicode 文字数を返す。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmGetDescription をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmGetGuideLineW
ImmGetGuideLineW (Unicode) 関数 (immdev.h) は、エラーに関する情報を取得する。アプリケーションはこの情報をユーザーへの通知に利用する。
%group
Win32 imm32
%prm
param0, dwIndex, lpBuf, dwBufLen
param0 : [intptr] 
dwIndex : [int] 
lpBuf : [wstr] 関数がエラーメッセージ文字列を取得するバッファへのポインタ。dwIndex が GGL_STRING でも GGL_PRIVATE でもない場合、または dwBufLen が 0 の場合、このパラメータは NULL になる。
dwBufLen : [int] 出力バッファのサイズ (バイト単位)。エラーメッセージ文字列を受け取るのに必要なバッファサイズ (終端の null 文字を除く) を返させたい場合、アプリケーションはこのパラメータに 0 を指定する。
%inst
ImmGetGuideLineW (Unicode) 関数 (immdev.h)
は、エラーに関する情報を取得する。アプリケーションはこの情報をユーザーへの通知に利用する。

[戻り値]
dwIndex パラメータの値に応じて、エラーレベル、エラーインデックス、またはエラーメッセージ文字列のサイズを返す。dwIndex が
GGL_LEVEL の場合、戻り値は次のいずれかとなる。
（以下省略）

[備考]
アプリケーションは通常、IMN_GUIDELINE コマンドを受け取った後にこの関数を呼び出す。
> [!NOTE] > immdev.h ヘッダーは ImmGetGuideLine をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmGetHotKey
(no summary)
%group
Win32 imm32
%prm
param0, lpuModifiers, lpuVKey, phKL
param0 : [int] 
lpuModifiers : [var] 
lpuVKey : [var] 
phKL : [intptr] 
%inst



%index
ImmGetIMCCLockCount
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmGetIMCCSize
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmGetIMCLockCount
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmGetIMEFileNameW
ImmGetIMEFileNameW (Unicode) 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME のファイル名を取得する。
%group
Win32 imm32
%prm
param0, lpszFileName, uBufLen
param0 : [intptr] 
lpszFileName : [wstr] 関数がファイル名を取得するバッファへのポインタ。uBufLen が NULL に設定されている場合、このパラメータは NULL になる。
uBufLen : [int] 出力バッファのサイズ (バイト単位)。ファイル名を受け取るのに必要なバッファサイズ (終端の null 文字を除く) を返させたい場合、アプリケーションは 0 を指定する。Unicode の場合、uBufLen は Unicode 文字単位でのサイズを指定し、終端の null 文字は含まない。
%inst
ImmGetIMEFileNameW (Unicode) 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME
のファイル名を取得する。

[戻り値]
出力バッファにコピーされたファイル名のバイト数を返す。アプリケーションが uBufLen に 0
を指定した場合は、ファイル名に必要なバッファサイズを返す。いずれの場合も終端の null 文字は含まない。Unicode
の場合は、出力バッファにコピーされた Unicode 文字数 (Unicode 終端 null 文字を除く) を返す。

[備考]
オペレーティングシステムはレジストリキー
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Keyboard
Layouts\HKL の「IME name value」としてファイル名を格納する。
> [!NOTE] > immdev.h ヘッダーは ImmGetIMEFileName をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmGetImeMenuItemsW
ImmGetImeMenuItemsW (Unicode) 関数 (immdev.h) は、指定した入力コンテキストの IME メニューに登録されているメニュー項目を取得する。
%group
Win32 imm32
%prm
param0, param1, param2, lpImeParentMenu, lpImeMenu, dwSize
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
lpImeParentMenu : [var] 関数が親メニュー情報を取得する IMEMENUITEMINFO 構造体へのポインタ。この親メニューのサブメニュー項目に関する情報を取得するには、アプリケーションは fType メンバに MFT_SUBMENU を設定する。関数がトップレベルのメニュー項目のみを取得する場合、このパラメータは NULL となる。
lpImeMenu : [var] 関数がメニュー項目に関する情報を取得する IMEMENUITEMINFO 構造体の配列へのポインタ。関数が登録済みメニュー項目の数を取得する場合、このパラメータは NULL となる。
dwSize : [int] IMEMENUITEMINFO 構造体を受け取るバッファのサイズ。
%inst
ImmGetImeMenuItemsW (Unicode) 関数 (immdev.h) は、指定した入力コンテキストの IME
メニューに登録されているメニュー項目を取得する。

[戻り値]
lpImeMenu にコピーされたメニュー項目の数を返す。lpImeMenu が NULL
の場合は、指定した入力コンテキストに登録されているメニュー項目の数を返す。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmGetImeMenuItems をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmGetOpenStatus
ImmGetOpenStatus 関数 (immdev.h) は、IME が開いているか閉じているかを判定する。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmGetOpenStatus 関数 (immdev.h) は、IME が開いているか閉じているかを判定する。

[戻り値]
IME が開いている場合は 0 以外の値を、そうでない場合は 0 を返す。


%index
ImmGetProperty
ImmGetProperty 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME のプロパティと機能を取得する。
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
ImmGetProperty 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME のプロパティと機能を取得する。

[戻り値]
dwIndex パラメータの値に応じて、プロパティまたは機能の値を返す。dwIndex が IGP_PROPERTY
に設定されている場合、関数は次のいずれか (または複数) の値を返す。
（以下省略）


%index
ImmGetRegisterWordStyleW
ImmGetRegisterWordStyleW (Unicode) 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME がサポートするスタイルの一覧を取得する。
%group
Win32 imm32
%prm
param0, nItem, lpStyleBuf
param0 : [intptr] 
nItem : [int] 出力バッファが保持できるスタイルの最大数。IME で利用可能なスタイル数をカウントさせたい場合、アプリケーションはこのパラメータに 0 を指定する。
lpStyleBuf : [var] 関数がスタイル情報を取得する STYLEBUF 構造体へのポインタ。
%inst
ImmGetRegisterWordStyleW (Unicode) 関数 (immdev.h) は、指定した入力ロケールに関連付けられた
IME がサポートするスタイルの一覧を取得する。

[戻り値]
バッファにコピーされたスタイルの数を返す。アプリケーションが nItem パラメータに 0 を指定した場合、戻り値は IME
で利用可能なスタイルの数となる。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmGetRegisterWordStyle
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmGetStatusWindowPos
ImmGetStatusWindowPos 関数 (immdev.h) は、ステータスウィンドウの位置を取得する。
%group
Win32 imm32
%prm
param0, lpptPos
param0 : [intptr] 
lpptPos : [var] 関数が位置座標を取得する POINT 構造体へのポインタ。これらは画面の左上隅を基準としたスクリーン座標である。
%inst
ImmGetStatusWindowPos 関数 (immdev.h) は、ステータスウィンドウの位置を取得する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。


%index
ImmGetVirtualKey
ImmGetVirtualKey 関数 (immdev.h) は、IME がすでに処理したキー入力メッセージに関連付けられた元の仮想キー値を取得する。
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst
ImmGetVirtualKey 関数 (immdev.h) は、IME
がすでに処理したキー入力メッセージに関連付けられた元の仮想キー値を取得する。

[戻り値]
アプリケーションが TranslateMessage を呼び出している場合、ImmGetVirtualKey は
VK_PROCESSKEY を返す。そうでない場合は仮想キーを返す。

[備考]
IME はキー入力メッセージを処理した後に仮想キー値を VK_PROCESSKEY に設定するが、アプリケーションは
ImmGetVirtualKey 関数を用いて元の仮想キー値を取得できる。この関数は VK_PROCESSKEY
値を含むキー入力メッセージに対してのみ使用する。アプリケーションは、WM_KEYDOWN (VK_PROCESSKEY)
メッセージを受け取った後、自身のメッセージループで TranslateMessage
が呼ばれる前にこの関数を使って元の仮想キーを取得できる。


%index
ImmInstallIMEA
ImmInstallIMEA (ANSI) 関数 (immdev.h) は、IME をインストールする。
%group
Win32 imm32
%prm
lpszIMEFileName, lpszLayoutText
lpszIMEFileName : [str] IME のフルパスを指定する null 終端文字列へのポインタ。
lpszLayoutText : [str] IME の名前と関連するレイアウトテキストを指定する null 終端文字列へのポインタ。
%inst
ImmInstallIMEA (ANSI) 関数 (immdev.h) は、IME をインストールする。

[戻り値]
IME の入力ロケール識別子を返す。

[備考]
この関数は IME のセットアップアプリケーションによってのみ使用されることを想定している。
> [!NOTE] > immdev.h ヘッダーは ImmInstallIME をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmInstallIMEW
ImmInstallIMEW (Unicode) 関数 (immdev.h) は、IME をインストールする。
%group
Win32 imm32
%prm
lpszIMEFileName, lpszLayoutText
lpszIMEFileName : [wstr] IME のフルパスを指定する null 終端文字列へのポインタ。
lpszLayoutText : [wstr] IME の名前と関連するレイアウトテキストを指定する null 終端文字列へのポインタ。
%inst
ImmInstallIMEW (Unicode) 関数 (immdev.h) は、IME をインストールする。

[戻り値]
IME の入力ロケール識別子を返す。

[備考]
この関数は IME のセットアップアプリケーションによってのみ使用されることを想定している。
> [!NOTE] > immdev.h ヘッダーは ImmInstallIME をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


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
ImmIsUIMessageW
ImmIsUIMessageW (Unicode) 関数 (immdev.h) は、IME ウィンドウ向けのメッセージをチェックし、それらをウィンドウに送信する。
%group
Win32 imm32
%prm
param0, param1, param2, param3
param0 : [intptr] 
param1 : [int] 
param2 : [intptr] 
param3 : [intptr] 
%inst
ImmIsUIMessageW (Unicode) 関数 (immdev.h) は、IME
ウィンドウ向けのメッセージをチェックし、それらをウィンドウに送信する。

[戻り値]
メッセージが IME ウィンドウで処理された場合は 0 以外の値を、そうでない場合は 0 を返す。

[備考]
アプリケーションは通常、IME が指定する組み立て文字列や候補リストを表示するためにこの関数を使う。hWndIME が NULL
の場合、関数はメッセージがユーザーインターフェイスメッセージかどうかを判定する。Windows Me/98: この関数は ANSI
版のみを持つ。Unicode ベースの IME から Unicode 文字を受け取るには、アプリケーションは
ImmGetCompositionString を使うべきである。
> [!NOTE] > immdev.h ヘッダーは ImmIsUIMessage をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmLockIMC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmLockIMCC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmNotifyIME
ImmNotifyIME 関数 (immdev.h) は、入力コンテキストの状態変更を IME に通知する。
%group
Win32 imm32
%prm
param0, dwAction, dwIndex, dwValue
param0 : [intptr] 
dwAction : [int] 
dwIndex : [int] 
dwValue : [int] 候補文字列のインデックス。dwAction パラメータの値に応じて、アプリケーションはこのパラメータを設定してもよいし、無視してもよい。
%inst
ImmNotifyIME 関数 (immdev.h) は、入力コンテキストの状態変更を IME に通知する。

[戻り値]
成功した場合は 0 以外を、失敗した場合は 0 を返す。


%index
ImmReSizeIMCC
(no summary)
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst



%index
ImmRegisterWordW
ImmRegisterWordW (Unicode) 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME の辞書に文字列を登録する。
%group
Win32 imm32
%prm
param0, lpszReading, param2, lpszRegister
param0 : [intptr] 
lpszReading : [wstr] 登録する文字列に関連付けられた、null 終端の読み文字列へのポインタ。
param2 : [int] 
lpszRegister : [wstr] 登録する null 終端文字列へのポインタ。
%inst
ImmRegisterWordW (Unicode) 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME
の辞書に文字列を登録する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
IME の独立系ソフトウェアベンダー (ISV) は、IME_REGWORD_STYLE_USER_FIRST から
IME_REGWORD_STYLE_USER_LAST の範囲で IME 用のプライベートスタイルを定義できる。例:
（以下省略）


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
ImmRequestMessageW
WM_IME_REQUEST メッセージを生成する。(Unicode)
%group
Win32 imm32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [intptr] 
param2 : [intptr] 
%inst
WM_IME_REQUEST メッセージを生成する。(Unicode)

[戻り値]
成功した場合は操作固有の値を、失敗した場合は 0 を返す。

[備考]
IME は、SendMessage で WM_IME_REQUEST メッセージをアプリケーションに送る代わりにこの関数を使う必要がある。
> [!NOTE] > immdev.h ヘッダーは ImmRequestMessage をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


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
ImmSetCompositionFontW
ImmSetCompositionFontW (Unicode) 関数 (immdev.h) は、組み立てウィンドウで文字を表示するために使う論理フォントを設定する。
%group
Win32 imm32
%prm
param0, lplf
param0 : [intptr] 
lplf : [var] 設定するフォント情報を含む LOGFONT 構造体へのポインタ。
%inst
ImmSetCompositionFontW (Unicode) 関数 (immdev.h)
は、組み立てウィンドウで文字を表示するために使う論理フォントを設定する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
この関数はアプリケーションに IMN_SETCOMPOSITIONFONT
コマンドを送信させる。アプリケーションが組み立てウィンドウを使わない場合でも、文字が適切に表示されるように適切なフォントを設定しなければならない。縦書きの場合は特に重要である。
> [!NOTE] > immdev.h ヘッダーは ImmSetCompositionFont
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
ImmSetCompositionStringW
ImmSetCompositionStringW (Unicode) 関数 (immdev.h) は、組み立て文字列と読み文字列の文字、属性、文節を設定する。
%group
Win32 imm32
%prm
param0, dwIndex, lpComp, dwCompLen, lpRead, dwReadLen
param0 : [intptr] 
dwIndex : [int] 
lpComp : [intptr] dwIndex の値で指定される、組み立て文字列に設定する情報を格納したバッファへのポインタ。
dwCompLen : [int] 組み立て文字列の情報バッファのサイズ (バイト単位)。SCS_SETSTR が指定されバッファに Unicode 文字列が含まれる場合でもバイト単位。
lpRead : [intptr] dwIndex の値で指定される、読み文字列に設定する情報を格納したバッファへのポインタ。アプリケーションはこのパラメータに NULL を指定してもよい。
dwReadLen : [int] 読み文字列の情報バッファのサイズ (バイト単位)。SCS_SETSTR が指定されバッファに Unicode 文字列が含まれる場合でもバイト単位。
%inst
ImmSetCompositionStringW (Unicode) 関数 (immdev.h)
は、組み立て文字列と読み文字列の文字、属性、文節を設定する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
アプリケーションは lpComp、lpRead、またはその両方を設定できる。アプリケーションが lpComp
に値を指定しない場合は、このパラメータを NULL に設定し、dwCompLen を 0
にしなければならない。アプリケーションが属性を変更するとき、1 つの文節内のすべての文字は同じ属性でなければならない。変換済み文字は
ATTR_CONVERTED または ATTR_TARGET_CONVERTED 属性を持たなければならない。未変換文字は
ATTR_INPUT または ATTR_TARGET_NOTCONVERTED
属性を持たなければならない。アプリケーションが文節情報を変更するときは、ターゲット文節のみを変更でき、一度に 1
つの境界にしか影響を与えない。ターゲット文節は ATTR_TARGET_CONVERTED または
ATTR_TARGET_NOTCONVERTED 属性を持つ。属性 (ATTR_* 値) の詳細については Composition
String を参照。IME が変更を完了すると、アプリケーションに WM_IME_COMPOSITION
メッセージを送信して変更を通知する。Windows Me/98、Windows 2000、Windows XP:
SCS_*CONVERTSTRING の値は再変換のために使われる。これらは SCS_CAP_SETRECONVERTSTRING
プロパティを持つ IME でのみ使用できる。アプリケーションはこれらの値を次のように使う:
（以下省略）


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


%index
ImmSetConversionStatus
ImmSetConversionStatus 関数 (immdev.h) は、現在の変換状態を設定する。
%group
Win32 imm32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
%inst
ImmSetConversionStatus 関数 (immdev.h) は、現在の変換状態を設定する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
この関数は IMN_SETCONVERSIONMODE および IMN_SETSENTENCEMODE
コマンドをアプリケーションに送信する。注: Windows 8
以降では、既定で入力スイッチはスレッド単位ではなくユーザー単位で設定される。Microsoft IME (日本語)
はモードをグローバルに尊重するため、フォーカス取得時に ImmSetConversionStatus が失敗することがある。


%index
ImmSetOpenStatus
ImmSetOpenStatus 関数 (immdev.h) は、IME を開くか閉じる。
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
ImmSetOpenStatus 関数 (immdev.h) は、IME を開くか閉じる。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
この関数は IMN_SETOPENSTATUS コマンドをアプリケーションに送信させる。


%index
ImmSetStatusWindowPos
ImmSetStatusWindowPos 関数 (immdev.h) は、ステータスウィンドウの位置を設定する。
%group
Win32 imm32
%prm
param0, lpptPos
param0 : [intptr] 
lpptPos : [var] ステータスウィンドウの新しい位置を、表示画面の左上隅を基準としたスクリーン座標で格納する POINT 構造体へのポインタ。
%inst
ImmSetStatusWindowPos 関数 (immdev.h) は、ステータスウィンドウの位置を設定する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
この関数は IMN_SETSTATUSWINDOWPOS コマンドをアプリケーションに送信させる。


%index
ImmShowSoftKeyboard
(no summary)
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst



%index
ImmSimulateHotKey
ImmSimulateHotKey 関数 (immdev.h) は、指定した IME ホットキーをシミュレートし、ユーザーが指定したウィンドウでそのホットキーを押したのと同じ応答を発生させる。
%group
Win32 imm32
%prm
param0, param1
param0 : [intptr] 
param1 : [int] 
%inst
ImmSimulateHotKey 関数 (immdev.h) は、指定した IME
ホットキーをシミュレートし、ユーザーが指定したウィンドウでそのホットキーを押したのと同じ応答を発生させる。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。


%index
ImmUnlockIMC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmUnlockIMCC
(no summary)
%group
Win32 imm32
%prm
param0
param0 : [intptr] 
%inst



%index
ImmUnregisterWordW
ImmUnregisterWordW (Unicode) 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME の辞書から登録文字列を削除する。
%group
Win32 imm32
%prm
param0, lpszReading, param2, lpszUnregister
param0 : [intptr] 
lpszReading : [wstr] 削除する文字列に関連付けられた、null 終端の読み文字列へのポインタ。
param2 : [int] 
lpszUnregister : [wstr] 削除する登録文字列を指定する、null 終端文字列へのポインタ。
%inst
ImmUnregisterWordW (Unicode) 関数 (immdev.h) は、指定した入力ロケールに関連付けられた IME
の辞書から登録文字列を削除する。

[戻り値]
成功した場合は 0 以外の値を、失敗した場合は 0 を返す。

[備考]
> [!NOTE] > immdev.h ヘッダーは ImmUnregisterWord をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスと、エンコーディング非依存でないコードを混在して使うと、コンパイルエラーや実行時エラーの原因になる可能性がある。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。

