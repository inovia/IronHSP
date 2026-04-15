;
; hspwasm.dll  HSP3 ヘルプ (日本語)
; WebAssembly (Wasm3) プラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hspwasm
%dll
hspwasm.dll
%url
https://github.com/HNWorks/IronHSP_2026
%port
Win32 / Win64

%note
hspwasm.dll は WebAssembly インタプリタ Wasm3 (pure C, ~150 KB) を
embed した薄いプラグインです。HSP から .wasm モジュールをロード
して、エクスポート関数を呼び出し、linear memory を読み書きできます。

v1 は compute 用途 (host imports / WASI なし) に特化しています。
Rust / Go / Zig / C / AssemblyScript で書いた計算処理をそのまま
.wasm として配布して HSP から呼ぶユースケースを想定しています。

HSP からは package/win32/common/iron_wasm.hsp を include して
wasm_call0 〜 wasm_call8 の固定アリティ糖衣を使うのが推奨です。
本ヘルプは生 API の説明です。

モジュールハンドルは 16 並列まで同時に保持できます。使い終わった
ものは wasm_close で解放してください。

%index
wasm_load
.wasm ファイルをロードしてハンドルを生成
%group
hspwasm — ロード / アンロード
%prm
"path", var_hid
"path" : ロードする .wasm ファイルのパス
var_hid : ハンドル (>=0) または負のエラーコードを受け取る変数

%inst
指定パスの .wasm バイナリを読み込み、Wasm3 にパース・リンクして
実行可能な状態にします。成功するとハンドル (0〜15) が返ります。
16 個のスロットが全て埋まっている場合は -1 が返ります。

エラーコード:
  -1  : ハンドル満杯
  -2  : 環境確保失敗
  -3  : ランタイム確保失敗
  -4  : wasm パース失敗 (不正な wasm)
  -5  : wasm リンク失敗 (import 未解決等)
 -10  : ファイルが開けない
 -11  : ファイルサイズ 0
 -12  : 読み込み失敗
-100  : wasm3 が vendor されていない (stub ビルド)

%href
wasm_load_mem
wasm_close

%index
wasm_load_mem
メモリバッファから .wasm をロード
%group
hspwasm — ロード / アンロード
%prm
var_buf, len, var_hid
var_buf : .wasm バイナリを保持する HSP 変数
len     : バイト長
var_hid : ハンドルを受け取る変数

%inst
bload や HTTP ダウンロードで HSP 変数に読み込み済みの .wasm を
直接ロードします。戻り値のエラーコード体系は wasm_load と同じ。

%href
wasm_load

%index
wasm_close
ハンドルを解放
%group
hspwasm — ロード / アンロード
%prm
hid
hid : wasm_load で取得したハンドル

%inst
Wasm3 のランタイムおよび環境を解放します。ハンドルスロットが
再利用可能になります。

%href
wasm_load
wasm_clear

%index
wasm_clear
全ハンドルを解放
%group
hspwasm — ロード / アンロード
%prm

%inst
16 個のスロット全てについて wasm_close 相当の解放を行います。
アプリ終了前のまとめ解放に使います。

%index
wasm_memory_size
linear memory のバイトサイズ取得
%group
hspwasm — メモリ
%prm
hid, var_int
hid : ハンドル
var_int : サイズを受け取る変数

%inst
wasm モジュールの linear memory の現在のバイト数を返します
(page 数 × 64KB)。

%index
wasm_memory_read
linear memory から HSP 変数へ読み出し
%group
hspwasm — メモリ
%prm
hid, offset, var_dst, len, var_int_result
hid     : ハンドル
offset  : linear memory のオフセット (byte)
var_dst : 読み出し先 HSP 変数 (sdim / dim 済み)
len     : 読み出しバイト数
var_int_result : 0=成功, 負=エラー

%inst
wasm モジュールの linear memory から指定バイト数を HSP 変数に
コピーします。範囲外アクセスはエラーとなり何も書きません。
読み出し先変数は予め十分なサイズで確保しておいてください。

%href
wasm_memory_write
wasm_memory_size

%index
wasm_memory_write
HSP 変数から linear memory に書き込み
%group
hspwasm — メモリ
%prm
hid, offset, var_src, len, var_int_result
hid     : ハンドル
offset  : linear memory のオフセット (byte)
var_src : 書き込み元 HSP 変数
len     : 書き込みバイト数
var_int_result : 0=成功, 負=エラー

%inst
HSP 変数の内容を wasm モジュールの linear memory にコピーします。
典型的には wasm 側で alloc(size) を呼んで確保した領域に対して
write して、結果を呼び出し関数にポインタとして渡す用途です。

%href
wasm_memory_read

%index
wasm_call_i
wasm 関数を呼び出し (i32 戻り)
%group
hspwasm — 関数呼び出し
%prm
hid, "name", array args, argc, var_ret
hid   : ハンドル
"name": エクスポート関数名
args  : 引数の int 配列 (全て i32 として渡される)
argc  : 引数個数
var_ret : i32 戻り値を受け取る int 変数

%inst
wasm エクスポート関数を検索して呼び出します。全引数は i32 として
渡されます。戻り値は i32 として int 変数に格納されます。

HSP からは固定アリティラッパの wasm_call0 〜 wasm_call8 (iron_wasm.hsp)
を使うほうが簡潔に書けます。

%href
wasm_call_i64
wasm_call_d

%index
wasm_call_i64
wasm 関数を呼び出し (i64 戻り)
%group
hspwasm — 関数呼び出し
%prm
hid, "name", array args, argc, var_double
hid   : ハンドル
"name": エクスポート関数名
args  : 引数の int 配列
argc  : 引数個数
var_double : i64 戻り値をビットパターンとして double 変数に格納

%inst
i64 戻り値を double 変数にビットパターンで格納します (HSP が
int64 型を持たないための折衷策)。HSP 側で取り出すときは
下位 32bit だけ使うか、別途 bitcast してください。

%href
wasm_call_i

%index
wasm_call_d
wasm 関数を呼び出し (f64 戻り)
%group
hspwasm — 関数呼び出し
%prm
hid, "name", array args, argc, var_double
hid   : ハンドル
"name": エクスポート関数名
args  : 引数の int 配列 (i32 として渡る)
argc  : 引数個数
var_double : f64 戻り値を格納する double 変数

%inst
f64 戻り値を double 変数に格納します。引数側も f64 を渡したい場合は
v1 では未対応 (v2 以降で対応予定)。

%href
wasm_call_i
