;
; hspwinrtocr.dll  HSP3 ヘルプ (日本語)
; Windows.Media.Ocr (WinRT) ラッパプラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hspwinrtocr
%dll
hspwinrtocr.dll
%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64 (Windows 10 以降)

%note
hspwinrtocr.dll は Windows 10 以降に標準搭載されている WinRT
OCR エンジン (Windows.Media.Ocr.OcrEngine) を HSP3 から直接呼び
出すためのプラグインです。

追加のモデルダウンロードは不要で、OS にインストール済みの言語パ
ックがそのまま OCR の認識言語になります (日本語 OCR は OS の
言語設定に日本語が含まれている必要があります)。

実装は C++/WinRT (header-only) + windowsapp.lib で、非同期
API はすべて内部で .get() による同期待ち扱いになっています。
HSP 側からは通常の同期呼び出しとして使えます。

API は画像ファイルからの OCR (ocr_run_file) と、HSP カレント
ウィンドウの描画内容からの OCR (ocr_run_hwnd) の 2 種類を提供
します。

%group
hspwinrtocr (WinRT OCR)

%index
ocr_init
OCR エンジンを初期化
%group
hspwinrtocr ― 基本
%prm
[, "lang"]
lang : BCP-47 言語タグ (例 "ja" / "en-US")。省略時はユーザー
       プロファイル言語から自動選択。

%inst
Windows.Media.Ocr.OcrEngine を作成します。

引数を省略した場合は OcrEngine::TryCreateFromUserProfileLanguages()
を使って OS 側の言語設定から自動で選ばれます。言語タグを指定
した場合は IsLanguageSupported() で利用可能か確認してから
TryCreateFromLanguage() で作成します。

戻り値 (stat):
  0  : 成功
 -1  : エンジン作成失敗 (言語パック未インストール等)
 -2  : 指定言語がサポート外

%href
ocr_free
ocr_langs
ocr_run_file

%index
ocr_free
OCR エンジンを解放
%group
hspwinrtocr ― 基本
%prm

%inst
ocr_init で確保した OcrEngine を解放します。アプリ終了時
(DLL PROCESS_DETACH) に自動解放もされますが、明示的に呼ぶ
ことも可能です。

%href
ocr_init

%index
ocr_langs
利用可能な OCR 言語一覧を取得
%group
hspwinrtocr ― 基本
%prm
var, buf_size
var      : 結果を受け取る文字列変数 (sdim 済)
buf_size : var に sdim で確保したバッファサイズ

%inst
OcrEngine::AvailableRecognizerLanguages() から現在の OS で
利用可能な OCR 認識言語の一覧を取得し、BCP-47 言語タグを
LF 区切りで var に格納します。

例: "en-US\nja\nzh-Hans-CN" のような文字列が返ります。

この命令は ocr_init を呼ぶ前でも使用できます。

%href
ocr_init

%index
ocr_run_file
画像ファイルを OCR する
%group
hspwinrtocr ― 実行
%prm
var, buf_size, "path"
var      : 認識結果テキストを受け取る文字列変数 (sdim 済)
buf_size : var に sdim で確保したバッファサイズ
path     : 画像ファイルのパス (相対/絶対どちらでも可)

%inst
指定したファイルを StorageFile::GetFileFromPathAsync で開き、
BitmapDecoder で SoftwareBitmap に展開してから
OcrEngine::RecognizeAsync に渡して認識を行います。

対応フォーマットは WIC が扱えるもの (BMP/PNG/JPEG/GIF/TIFF
/WebP/HEIF など) です。

結果テキストは OcrResult::Text() の全文 (改行なしで 1 行に
結合された文字列) を cp932 に変換して var に書き込みます。

戻り値 (stat):
  0  : 成功
 -1  : 例外発生 (ファイル not found / OCR エンジン未初期化 等)
 -2  : path が空
 -3  : GetFullPathName 失敗

%href
ocr_init
ocr_run_hwnd

%index
ocr_run_hwnd
カレントウィンドウの描画内容を OCR する
%group
hspwinrtocr ― 実行
%prm
var, buf_size
var      : 認識結果テキストを受け取る文字列変数 (sdim 済)
buf_size : var に sdim で確保したバッファサイズ

%inst
HSP のカレントウィンドウ (gsel で選択中の ID) の BMSCR から
24bit BGR DIB を読み取り、Bgra8 SoftwareBitmap に変換して
OcrEngine::RecognizeAsync に渡します。

これにより画面上に描画したテキスト (たとえば picload した
画像や、boxf/mes で書いた内容) をファイルに保存せずに直接
OCR できます。

注意:
  - OCR 対象は redraw された可視の描画内容です。
  - bottom-up DIB を top-down に変換しているため、サイズが
    大きいと変換コストが発生します。

%href
ocr_init
ocr_run_file

