; ============================================================
;   dxgi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CreateDXGIFactory
他の DXGI オブジェクトを生成するために使える DXGI 1.0 ファクトリを作成する。
%group
Win32 dxgi
%prm
riid, ppFactory
riid : [var] 型: REFIID ppFactory パラメータが参照する IDXGIFactory オブジェクトの GUID (グローバル一意識別子)。
ppFactory : [var] 型: void** IDXGIFactory オブジェクトへのポインタのアドレス。
%inst
他の DXGI オブジェクトを生成するために使える DXGI 1.0 ファクトリを作成する。

[戻り値]
型: HRESULT 成功時は S_OK を返す。それ以外は次の DXGI_ERROR のいずれかを返す。

[備考]
DXGI ファクトリを使って、アダプタの列挙、スワップチェーンの生成、フルスクリーン表示モードの切り替えのための alt+enter
キーシーケンスとウィンドウを関連付けるオブジェクトを生成する。CreateDXGIFactory 関数が成功すると
IDXGIFactory インターフェースの参照カウントが増加する。メモリリークを避けるため、使用を終えたら
IDXGIFactory::Release メソッドでインターフェースを解放すること。注意 DXGI 1.0 (IDXGIFactory)
と DXGI 1.1 (IDXGIFactory1) を 1 つのアプリケーションで混在させてはならない。IDXGIFactory または
IDXGIFactory1 のどちらか一方だけを使用する。 注意 アプリの DllMain 関数から CreateDXGIFactory
を呼び出すと失敗する。DXGI が DllMain からどのように応答するかについては DXGI Responses from
DLLMain を参照。
このドキュメントは省略されている。


%index
CreateDXGIFactory1
他の DXGI オブジェクトを生成するために使える DXGI 1.1 ファクトリを作成する。
%group
Win32 dxgi
%prm
riid, ppFactory
riid : [var] 型: REFIID ppFactory パラメータが参照する IDXGIFactory1 オブジェクトの GUID (グローバル一意識別子)。
ppFactory : [var] 型: void** IDXGIFactory1 オブジェクトへのポインタのアドレス。
%inst
他の DXGI オブジェクトを生成するために使える DXGI 1.1 ファクトリを作成する。

[戻り値]
型: HRESULT 成功時は S_OK を返す。それ以外はエラーコードを返す。エラーコード一覧については DXGI_ERROR を参照。

[備考]
DXGI 1.1 ファクトリを使って、アダプタの列挙、スワップチェーンの生成、フルスクリーン表示モードの切り替えのための
alt+enter キーシーケンスとウィンドウを関連付けるオブジェクトを生成する。CreateDXGIFactory1 関数が成功すると
IDXGIFactory1 インターフェースの参照カウントが増加する。メモリリークを避けるため、使用を終えたら
IDXGIFactory1::Release メソッドでインターフェースを解放すること。このエントリポイントは Windows Vista
/ Windows Server 2008 に同梱された DXGI 1.0 ではサポートされない。DXGI 1.1
のサポートが必要で、Windows 7、Windows Server 2008 R2、および Windows Vista SP2 (KB
971644) や Windows Server 2008 (KB 971512) の更新プログラムで利用できる。注意 DXGI 1.0
(IDXGIFactory) と DXGI 1.1 (IDXGIFactory1) を 1
つのアプリケーションで混在させてはならない。IDXGIFactory または IDXGIFactory1 のどちらか一方だけを使用する。
注意 アプリの DllMain 関数から CreateDXGIFactory1 を呼び出すと失敗する。DXGI が DllMain
からどのように応答するかについては DXGI Responses from DLLMain を参照。
このドキュメントは省略されている。


%index
CreateDXGIFactory2
他の DXGI オブジェクトを生成するために使える DXGI 1.3 ファクトリを作成する。
%group
Win32 dxgi
%prm
Flags, riid, ppFactory
Flags : [int] 型: UINT 有効な値には DXGI_CREATE_FACTORY_DEBUG (0x01) フラグや 0 が含まれる。
riid : [var] 型: REFIID ppFactory パラメータが参照する IDXGIFactory2 オブジェクトの GUID (グローバル一意識別子)。
ppFactory : [var] 型: void** IDXGIFactory2 オブジェクトへのポインタのアドレス。
%inst
他の DXGI オブジェクトを生成するために使える DXGI 1.3 ファクトリを作成する。

[戻り値]
型: HRESULT 成功時は S_OK を返す。それ以外はエラーコードを返す。エラーコード一覧については DXGI_ERROR を参照。

[備考]
この関数は DXGIDebug.dll をロードするかどうかを示すフラグを受け取る。それ以外の動作は CreateDXGIFactory1
と同一である。


%index
DXGIDeclareAdapterRemovalSupport
プロセスが自身のグラフィックスデバイスの取り外しに耐性を持つことを示せるようにする。
%group
Win32 dxgi
%prm

%inst
プロセスが自身のグラフィックスデバイスの取り外しに耐性を持つことを示せるようにする。

[戻り値]
型: HRESULT 成功時は S_OK を返す。それ以外はエラーコードを返す。デバイス作成後に呼び出された場合は
DXGI_ERROR_INVALID_CALL を返す。本関数が 2 度目以降に呼ばれた場合は
DXGI_ERROR_ALREADY_EXISTS を返す。エラーコードの完全な一覧については DXGI_ERROR を参照。

[備考]
この関数はグラフィックス API 非依存である。つまり OpenGL や Vulkan など他の API
上で動作するアプリにも適用できる。この関数はプロセスごとに 1 回、デバイス作成の前に呼び出す必要がある。


%index
DXGIGetDebugInterface1
Windows ストアアプリが Microsoft DirectX Graphics Infrastructure (DXGI) をデバッグするために使うインターフェースを取得する。
%group
Win32 dxgi
%prm
Flags, riid, pDebug
Flags : [int] 使用しない。
riid : [var] 要求するインターフェース種別の GUID (グローバル一意識別子)。IDXGIDebug、IDXGIDebug1、IDXGIInfoQueue インターフェースの識別子のいずれかを指定できる。
pDebug : [var] デバッグインターフェースへのポインタを受け取るバッファへのポインタ。
%inst
Windows ストアアプリが Microsoft DirectX Graphics Infrastructure (DXGI)
をデバッグするために使うインターフェースを取得する。

[戻り値]
関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。

[備考]
DXGIGetDebugInterface1 関数は開発時の補助機能であるため、Windows Software Development
Kit (SDK) がインストールされていないシステムでは E_NOINTERFACE を返す。

