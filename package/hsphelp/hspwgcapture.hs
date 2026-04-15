;
; hspwgcapture.dll  HSP3 ヘルプ (日本語)
; Windows.Graphics.Capture (Win10 1903+) ラッパプラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hspwgcapture
%dll
hspwgcapture.dll
%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64 (Windows 10 1903 以降)

%note
hspwgcapture.dll は Windows 10 1903 (19H1) 以降に搭載された
Windows.Graphics.Capture API (WinRT) を HSP3 から直接呼び出す
ためのプラグインです。

Windows.Graphics.Capture API はモダンな DWM 連携キャプチャを
提供し、従来の BitBlt / PrintWindow よりも高フレームレートで
GPU 上のウィンドウ / モニタ内容を取得できます。ハードウェア
アクセラレートされた D3D11 テクスチャ経由でピクセルが渡される
ため、全画面ゲームやハードウェア合成されたウィンドウでも正しく
キャプチャできます。

実装は C++/WinRT + D3D11 + WIC で、非同期 API は使用していま
せん (Direct3D11CaptureFramePool::CreateFreeThreaded の同期
ポーリング型)。HSP 側からは通常の同期命令として扱えます。

注意: Windows.Graphics.Capture を利用すると、対象ウィンドウ
に黄色の「キャプチャ中」ハイライト枠が表示されるのが既定動作
です (Windows 11 以降は設定で無効化可能)。

%group
hspwgcapture (画面キャプチャ)

%index
wgc_init
キャプチャサブシステム初期化
%group
hspwgcapture ― 基本
%prm

%inst
Windows.Graphics.Capture を利用可能か確認し、キャプチャ用の
D3D11 デバイスを作成します。プラグイン使用前に 1 回呼びます。

戻り値 (stat):
  0  : 成功
 -1  : 例外発生
 -2  : この OS では未サポート (Win10 1903 未満)
 -3  : D3D11 デバイス作成失敗

%href
wgc_shutdown

%index
wgc_shutdown
キャプチャサブシステム解放
%group
hspwgcapture ― 基本
%prm

%inst
作成した D3D11 デバイスとアクティブなセッションをすべて解放
します。DLL_PROCESS_DETACH 時にも自動解放されますが、明示的
に呼ぶこともできます。

%href
wgc_init

%index
wgc_list_windows
キャプチャ可能なウィンドウ一覧を取得
%group
hspwgcapture ― 列挙
%prm
var, buf_size
var      : 結果を受け取る文字列変数 (sdim 済)
buf_size : var に sdim で確保したバッファサイズ

%inst
EnumWindows でトップレベルウィンドウを列挙し、可視かつタイ
トル有りのものを "title<TAB>HWND\n" 形式で var に格納します。
HWND は 16 進数表記 (例: 0000000000123456)。

ウィンドウをキャプチャするには、この HWND を整数化して
wgc_start_window に渡します。

%href
wgc_start_window

%index
wgc_start_window
指定ウィンドウのキャプチャを開始
%group
hspwgcapture ― キャプチャ
%prm
hwnd, var_handle
hwnd       : キャプチャ対象ウィンドウハンドル (int)
var_handle : セッションハンドルを受け取る整数変数

%inst
GraphicsCaptureItem::CreateForWindow で指定 HWND のキャプチャ
セッションを作成し、Direct3D11CaptureFramePool を CreateFreeThreaded
で生成したのち、GraphicsCaptureSession::StartCapture() を呼びます。

var_handle に 0 以上の内部セッションスロット番号が格納されます。
                -1 = 失敗 / -2 = 無効な HWND。

同時に最大 4 セッションを保持できます。

%href
wgc_start_monitor
wgc_stop
wgc_grab_frame

%index
wgc_start_monitor
指定モニタ全体のキャプチャを開始
%group
hspwgcapture ― キャプチャ
%prm
idx, var_handle
idx        : モニタ index (0 = プライマリ, 1 = サブ, ...)
var_handle : セッションハンドルを受け取る整数変数

%inst
EnumDisplayMonitors で取得した idx 番目の HMONITOR に対して
GraphicsCaptureItem::CreateForMonitor でキャプチャセッション
を作成します。

idx=0 を指定すればプライマリモニタ全画面キャプチャになります。

%href
wgc_start_window
wgc_stop

%index
wgc_stop
キャプチャ停止
%group
hspwgcapture ― キャプチャ
%prm
handle
handle : wgc_start_* が返したスロット番号

%inst
指定セッションの GraphicsCaptureSession / FramePool を Close
してスロットを解放します。

%href
wgc_start_window

%index
wgc_grab_frame
最新フレームを BGRA バイト列で取得
%group
hspwgcapture ― フレーム取得
%prm
handle, buf, buf_size, w, h
handle   : セッションハンドル
buf      : 画素データを受け取る変数 (sx*sy*4 バイトの BGRA)
buf_size : buf に確保したバッファサイズ (バイト数)
w, h     : 幅と高さを受け取る int 変数

%inst
FramePool::TryGetNextFrame() で最新フレームを取り出し、
IDirect3DDxgiInterfaceAccess 経由で ID3D11Texture2D を得て、
staging テクスチャにコピー → Map() → memcpy の順でピクセル
を CPU へ読み戻します。

format は B8G8R8A8UIntNormalized (各画素 4 バイト BGRA)。
buf は呼び出し側で sdim や memexpand 等で十分なサイズを確保
してから渡してください。確保したバッファサイズを buf_size に
指定します。

戻り値 (stat):
  0  : 成功
 -1  : 未初期化
 -2  : 不正ハンドル
 -3  : 非アクティブセッション
 -4  : フレーム未到着 (TryGetNextFrame が null を返した場合)

%href
wgc_save_png

%index
wgc_save_png
最新フレームを PNG ファイルに保存
%group
hspwgcapture ― フレーム取得
%prm
handle, "path"
handle : セッションハンドル
path   : 出力ファイルパス

%inst
wgc_grab_frame と同じ方法で最新フレームを取得し、その場で
WIC (Windows Imaging Component) の IWICBitmapEncoder を使って
PNG エンコードしてファイルに書き出します。

戻り値 (stat):
  0  : 成功
 負値 : 失敗

%href
wgc_grab_frame
