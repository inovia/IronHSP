;
; hsppdf.dll  HSP3 ヘルプ (日本語)
; PDFium PDF 読み取りプラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hsppdf
%dll
hsppdf.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hsppdf.dll は Google PDFium (bblanchon/pdfium-binaries の prebuilt ~7 MB)
を embed した薄いプラグインです。HSP から PDF ファイルを開き、ページ数
の取得、ラスタライズ (ビットマップ化)、テキスト抽出、メタデータ参照が
できます。

PDFium 本体 (pdfium.dll) は別途 bblanchon のリリースから DL して
hsppdf.dll と同じディレクトリに配置する必要があります。詳しくは
plugins/win32/hsppdf/third_party/pdfium/README.md を参照してください。
プラグイン未配置時は stub として全関数が -100 / 空文字を返します。

HSP からは package/win32/common/iron_pdf.hsp を include して
pdf_open / pdf_draw / pdf_text 等の糖衣 API を使うのが推奨です。
本ヘルプは生 API の説明です。

ドキュメントハンドルは 16 並列まで同時に保持できます。使い終わった
ものは pdf_close で解放してください。

iron_ai との連携で PDF 要約を書く場合は、pdf_page_count で全ページ数を
取り、pdf_get_text を順に呼んで CP_ACP 文字列を結合してから
ai_chat / ai_complete に投げます (iron_ai 側で chunk 分割が必要な場合あり)。

%index
pdf_init
PDFium ライブラリを初期化
%group
hsppdf — ライフサイクル
%prm

%inst
FPDF_InitLibraryWithConfig を呼び、PDFium を初期化します。プロセスで
一度だけ呼べば良く、以降の pdf_load 等で暗黙に呼ばれるため明示呼び出しは
推奨ですが必須ではありません。

%href
pdf_shutdown

%index
pdf_shutdown
PDFium ライブラリを終了
%group
hsppdf — ライフサイクル
%prm

%inst
開いている全ハンドルを解放して FPDF_DestroyLibrary を呼びます。
アプリ終了前に一度呼んでください (DLL_PROCESS_DETACH でも自動解放
されますが、明示呼び出しを推奨)。

%href
pdf_init

%index
pdf_load
PDF ファイルをロード
%group
hsppdf — ドキュメント
%prm
"path" [, "password"], var_hid
"path"   : 開く PDF ファイルのパス
"password": 暗号化 PDF のパスワード (省略可)
var_hid  : ハンドル (>=0) または負のエラーコードを受け取る変数

%inst
指定パスの PDF を開きます。成功するとハンドル (0..15) が返ります。
16 スロットが全て使用中なら -1、ファイルが開けないか PDF として
不正なら -10、stub ビルド時は -100 が返ります。

エラーコード:
  -1   : ハンドル満杯
 -10   : FPDF_LoadDocument 失敗 (ファイル無し / 破損 / password 不一致)
-100   : PDFium が vendor されていない (stub ビルド)

%href
pdf_close
pdf_page_count

%index
pdf_close
ハンドルを解放
%group
hsppdf — ドキュメント
%prm
hid
hid : pdf_load で取得したハンドル

%inst
FPDF_CloseDocument を呼んでハンドルスロットを解放します。

%href
pdf_load

%index
pdf_page_count
ページ数を取得
%group
hsppdf — ページ情報
%prm
hid, var_int
hid     : ハンドル
var_int : ページ数を受け取る int 変数

%inst
ドキュメントのページ数 (>=0) を返します。

%index
pdf_page_size
ページサイズを取得 (points)
%group
hsppdf — ページ情報
%prm
hid, page, var_w, var_h
hid     : ハンドル
page    : 0 オリジンのページ番号
var_w   : 幅を受け取る double 変数 (points = 1/72 inch)
var_h   : 高さを受け取る double 変数

%inst
指定ページの幅と高さを points 単位で返します。A4 portrait は
概ね 595 x 842 points です。ピクセル数にしたい場合は scale (dpi/72)
を掛けてください。

%href
pdf_render_bitmap

%index
pdf_render_bitmap
ページをラスタライズして HSP 変数に書き込み
%group
hsppdf — 描画
%prm
hid, page, scale, var_buf, var_w, var_h
hid    : ハンドル
page   : 0 オリジンのページ番号
scale  : 倍率 (1.0 で 72 dpi 相当、2.0 で 144 dpi)
var_buf: 書き込み先 HSP 変数 (sdim で十分なサイズ確保済み)
var_w  : 実際の出力幅 (ピクセル) を受け取る int 変数
var_h  : 実際の出力高さを受け取る int 変数

%inst
ページを BGRA 32bit の生データとして var_buf に書き込みます。
必要なバイト数は out_w * out_h * 4。呼び出し前に
`sdim buf, expected_w * expected_h * 4` で十分なサイズを確保してください
(pdf_page_size で w,h を先に取ってから scale を掛けて計算)。

得られたバッファは HSP の sdim 変数に格納されているので、そのまま
iron_d2d1 で描画したり、独自に DIB に転送したり、画像ファイルとして
保存 (stb_image_write 等) することが可能です。

%href
pdf_render_to_hspwnd
pdf_page_size

%index
pdf_render_to_hspwnd
ページを現在の HSP window に直接描画
%group
hsppdf — 描画
%prm
hid, page, scale
hid   : ハンドル
page  : ページ番号
scale : 倍率

%inst
現在の HSP window (actscr) の BMSCR (bottom-up 24bit BGR DIB) に
PDF ページを直接描画します。描画先座標は左上 (0,0) 固定で、window
サイズを超える部分はクリップされます。alpha は破棄され白背景で
合成されます。

redraw 0 → pdf_draw → redraw 1 の形で使うのが典型です。

%href
pdf_render_bitmap

%index
pdf_get_text
ページのテキストを取得
%group
hsppdf — テキスト
%prm
hid, page, var_str
hid     : ハンドル
page    : ページ番号
var_str : 結果を受け取る str 変数 (sdim で十分なサイズ確保済み)

%inst
ページ内の全テキストを UTF-16 で取得し、CP_ACP (cp932) に変換して
var_str に書き込みます。PDF 側が日本語フォントを埋め込んでいれば
正しく取得できますが、outline 化された PDF や非対応フォントは
空文字になる場合があります。

var_str は `sdim s, 65536` 等で十分なサイズを確保してから渡して
ください。iron_pdf.hsp の pdf_text ラッパは refstr で文字列を
返すため、バッファ確保は不要です。

iron_ai と組み合わせて「PDF 全文要約」を作る場合は、ページ毎に
pdf_get_text で取り出して結合してから ai_chat に投げます。長大な
PDF は N ページずつ chunk して map-reduce 要約するのが現実的です。

%href
pdf_doc_title
pdf_doc_author

%index
pdf_doc_title
ドキュメントの /Title メタデータを取得
%group
hsppdf — メタデータ
%prm
hid, var_str
hid     : ハンドル
var_str : 結果を受け取る str 変数

%inst
PDF ドキュメントの Info 辞書から /Title エントリを UTF-16 で取得し、
CP_ACP に変換して var_str に書き込みます。設定されていなければ空文字。

%href
pdf_doc_author

%index
pdf_doc_author
ドキュメントの /Author メタデータを取得
%group
hsppdf — メタデータ
%prm
hid, var_str
hid     : ハンドル
var_str : 結果を受け取る str 変数

%inst
PDF ドキュメントの Info 辞書から /Author エントリを取得します。
仕様は pdf_doc_title と同じ。

%href
pdf_doc_title
