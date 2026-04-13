; ============================================================
;   ole32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CLSIDFromString
StringFromCLSID 関数で生成された文字列を元の CLSID に戻す。
%group
Win32 ole32
%prm
lpsz, pclsid
lpsz : [wstr] CLSID または ProgID のゼロ終端文字列表現、または NULL。
pclsid : [var] CLSID へのポインタ。
%inst
StringFromCLSID 関数で生成された文字列を元の CLSID に戻す。

[戻り値]
標準の戻り値 E_INVALIDARG のほか、次の値を返すことがある。
（以下省略）

[備考]
CLSID の形式は {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}。ProgID を渡すと対応する
CLSID が pclsid に格納される。NULL を渡した場合は GUID_NULL が返る。


%index
CoCreateInstance
指定した CLSID に関連付けられたクラスの単一の未初期化オブジェクトを生成する。
%group
Win32 ole32
%prm
rclsid, pUnkOuter, dwClsContext, riid, ppv
rclsid : [var] 生成対象オブジェクトを作るためのデータおよびコードに関連付けられた CLSID。
pUnkOuter : [var] NULL の場合、オブジェクトはアグリゲートの一部として作成されない。NULL 以外の場合、アグリゲートオブジェクトの IUnknown インタフェース(制御 IUnknown)へのポインタ。
dwClsContext : [int] 新しく作成されるオブジェクトを管理するコードが実行されるコンテキスト。値は CLSCTX 列挙体から取得する。
riid : [var] オブジェクトとの通信に用いるインタフェース識別子への参照。
ppv : [var] riid で要求されたインタフェースポインタを受け取るポインタ変数のアドレス。成功時は *ppv にインタフェースポインタ、失敗時は NULL が格納される。
%inst
指定した CLSID に関連付けられたクラスの単一の未初期化オブジェクトを生成する。

[戻り値]
この関数は次の値を返すことがある。
（以下省略）

[備考]
指定した CLSID
に関連付けられたクラスオブジェクトに接続し、既定値で初期化されたインスタンスを生成し、クラスオブジェクトを解放するという一連の処理をカプセル化したショートカットを提供する。
（以下省略）


%index
CoInitialize
現在のスレッドで COM ライブラリを初期化し、同時実行モデルをシングルスレッドアパートメント(STA)として識別する。
%group
Win32 ole32
%prm
pvReserved
pvReserved : [intptr] このパラメータは予約されており、NULL を指定する必要がある。
%inst
現在のスレッドで COM ライブラリを初期化し、同時実行モデルをシングルスレッドアパートメント(STA)として識別する。

[戻り値]
標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED のほか、次の値を返すことがある。
（以下省略）

[備考]
COM ライブラリの関数を呼び出す前にスレッド上で COM ライブラリを初期化する必要がある(CoGetMalloc
とメモリ割り当て関数を除く)。スレッドの同時実行モデルは一度設定されると変更できず、マルチスレッドとして初期化済みのアパートメントに対する
CoInitialize 呼び出しは RPC_E_CHANGED_MODE で失敗する。CoInitializeEx
は同等の機能に加えて同時実行モデルを明示的に指定するパラメータを持ち、今後のアプリケーションは CoInitializeEx
を使用すべきである。成功した各 CoInitialize/CoInitializeEx 呼び出し(S_FALSE を含む)は
CoUninitialize 呼び出しと対応させる。DllMain からこれらの関数を呼び出してはならない。
（以下省略）


%index
CoInitializeEx
呼び出し元スレッドで COM ライブラリを初期化し、スレッドの同時実行モデルを設定し、必要に応じて新しいアパートメントを作成する。
%group
Win32 ole32
%prm
pvReserved, dwCoInit
pvReserved : [intptr] このパラメータは予約されており、NULL を指定する必要がある。
dwCoInit : [int] スレッドの同時実行モデルおよび初期化オプション。値は COINIT 列挙体から取得する。COINIT_APARTMENTTHREADED と COINIT_MULTITHREADED を同時に指定することはできない。既定は COINIT_MULTITHREADED。
%inst
呼び出し元スレッドで COM ライブラリを初期化し、スレッドの同時実行モデルを設定し、必要に応じて新しいアパートメントを作成する。

[戻り値]
標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED のほか、次の値を返すことがある。
（以下省略）

[備考]
CoInitializeEx は COM ライブラリを使用する各スレッドにつき最低 1
回呼び出す必要がある。同じフラグで複数回呼び出した場合は S_FALSE が返る。成功した呼び出しは CoUninitialize
と対応させる。スレッドの同時実行モデルは一度設定されると変更できない。STA
のオブジェクトはアパートメントのスレッドからのみメソッド呼び出しを受け取り、MTA
のオブジェクトは任意のスレッドから呼び出されうるため同期プリミティブでの保護が必要。OleInitialize は
COINIT_APARTMENTTHREADED で CoInitializeEx を呼ぶため、MTA では OleInitialize
の機能は使用できない。DllMain から CoInitialize/CoInitializeEx/CoUninitialize
を呼び出してはならない。
（以下省略）


%index
CoTaskMemAlloc
IMalloc::Alloc と同じ方法でタスクメモリブロックを割り当てる。
%group
Win32 ole32
%prm
cb
cb : [int] 割り当てるメモリブロックのサイズ(バイト単位)。
%inst
IMalloc::Alloc と同じ方法でタスクメモリブロックを割り当てる。

[戻り値]
関数が成功した場合、割り当てられたメモリブロックを返す。失敗した場合は NULL を返す。

[備考]
CoTaskMemAlloc は既定のアロケータを使用する。CoTaskMemAlloc の呼び出し前に CoGetMalloc
を呼ぶ必要はない。返されるブロックの初期内容は未定義。cb が 0 の場合は長さ 0
のアイテムを割り当ててその有効なポインタを返す。メモリ不足時は NULL を返すので、小さなサイズの要求でも戻り値を必ず検査すること。


%index
CoTaskMemFree
CoTaskMemAlloc または CoTaskMemRealloc で割り当てたタスクメモリブロックを解放する。
%group
Win32 ole32
%prm
pv
pv : [intptr] 解放するメモリブロックへのポインタ。NULL を指定した場合、関数は何もしない。
%inst
CoTaskMemAlloc または CoTaskMemRealloc で割り当てたタスクメモリブロックを解放する。

[備考]
既定の OLE アロケータを使用する。解放されるバイト数は元の割り当てサイズと等しい。呼び出し後、pv
が指すメモリブロックは無効となり以降使用できない。


%index
CoUninitialize
現在のスレッドで COM ライブラリをクローズし、ロード済み DLL のアンロードとリソース解放、RPC 接続のクローズを行う。
%group
Win32 ole32
%prm

%inst
現在のスレッドで COM ライブラリをクローズし、ロード済み DLL のアンロードとリソース解放、RPC 接続のクローズを行う。

[備考]
成功した CoInitialize/CoInitializeEx の各呼び出し(S_FALSE を含む)に対して 1 回ずつ
CoUninitialize を呼ぶ必要がある。ライブラリを初期化した呼び出しに対応する CoUninitialize
のみがライブラリをクローズできる。OleUninitialize は内部で CoUninitialize
を呼ぶ。アプリケーション終了時、メインウィンドウを隠してメッセージループを抜けた後に呼び出す。開いているカンバセーションがあればモーダルメッセージループを開始して保留メッセージをディスパッチする。DllMain
から呼び出してはならない。


%index
StringFromCLSID
CLSID を印字可能文字列に変換する。異なる CLSID は常に異なる文字列に変換される。
%group
Win32 ole32
%prm
rclsid, lplpsz
rclsid : [var] 変換する CLSID。
lplpsz : [var] 結果文字列へのポインタを受け取るポインタ変数のアドレス。rclsid を表す文字列は囲み中括弧を含む。
%inst
CLSID を印字可能文字列に変換する。異なる CLSID は常に異なる文字列に変換される。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY および S_OK を返すことができる。

[備考]
StringFromCLSID は内部で StringFromGUID2 を呼んで GUID を文字列に変換する。呼び出し元は
CoTaskMemFree で文字列用に割り当てられたメモリを解放する責任がある。

