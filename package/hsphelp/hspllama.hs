;
; hspllama.dll  HSP3 ヘルプ (日本語)
; llama.cpp (local LLM) プラグイン
;

%type
拡張命令
%ver
1.0
%date
2026-04-15
%author
IronHSP / hspllama
%dll
hspllama.dll
%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
hspllama.dll は llama.cpp (https://github.com/ggerganov/llama.cpp) を
embed した local LLM 推論プラグインです。HSP から GGUF 形式の
量子化済モデルを読み込み、同期または streaming で補完 / チャットが
可能です。

ビルドには llama.cpp の static lib または dll 配置が必要です。
plugins/win32/hspllama/third_party/llamacpp/README.md の手順で
CMake ビルド → hspllama.vcxproj に lib を追加してください。
llama.cpp 未配置でもスタブとしてビルドは通ります (実推論は不可)。

同時に 4 モデルまで保持できます。LLM は VRAM / RAM を大量に
消費するので、使わないモデルは llama_close で速やかに開放して
ください。

iron_ai.hsp に LOCAL_LLAMA バックエンドを追加しており、
通常は iron_ai_set_backend / iron_ai_chat 経由で呼び出すのが
簡単です (iron_ai.hsp 参照)。

%group
hspllama (llama.cpp LLM)

%index
llama_init
llama.cpp バックエンド初期化
%group
hspllama ― 初期化 / 終了
%prm

%inst
ggml backend を初期化します。アプリ起動時に 1 回だけ呼び出します。

%index
llama_shutdown
llama.cpp バックエンド終了
%group
hspllama ― 初期化 / 終了
%prm

%index
llama_load
GGUF モデルをロード
%group
hspllama ― セッション
%prm
"model.gguf", n_ctx, n_gpu_layers, var_h
"model.gguf"  : GGUF ファイルパス
n_ctx         : コンテキスト長 (0 指定時 2048)
n_gpu_layers  : GPU へオフロードするレイヤ数 (0=CPU のみ, 99=全部)
var_h         : セッションハンドル (>=0) または負のエラーコード

%inst
モデルをロードしてコンテキストを作成します。4 スロットまで同時保持可能。

エラーコード:
  -1  : ハンドル満杯
  -2  : モデルロード失敗 (ファイル不正 / メモリ不足)
  -3  : コンテキスト作成失敗
 -100 : llama.cpp 未リンク (スタブビルド)

%index
llama_close
セッションを閉じる
%group
hspllama ― セッション
%prm
h

%index
llama_complete
単発補完 (同期)
%group
hspllama ― 推論
%prm
h, "prompt", max_tokens, var_result_str, buf_size
h               : セッションハンドル
"prompt"        : プロンプト文字列
max_tokens      : 生成する最大トークン数
var_result_str  : 結果を受け取る str 変数 (sdim 済)
buf_size        : var_result_str に sdim で確保したバッファサイズ

%inst
プロンプトを流し込み、最大 max_tokens 個のトークンを生成して
結果文字列を var_result_str に格納します。EOS トークンに到達した
時点で打ち切られます。
var_result_str は事前に sdim で十分なサイズを確保し、その sdim
サイズを buf_size に指定してください。

%index
llama_chat
chat 形式の補完 (同期, chat template 適用)
%group
hspllama ― 推論
%prm
h, "system", "user", max_tokens, var_result_str, buf_size
h               : セッションハンドル
"system"        : system プロンプト
"user"          : user プロンプト
max_tokens      : 生成する最大トークン数
var_result_str  : 結果を受け取る str 変数 (sdim 済)
buf_size        : var_result_str に sdim で確保したバッファサイズ

%inst
モデル組み込みの chat template を適用して system + user を
適切な形式に整形し、assistant の返答を生成します。
var_result_str は事前に sdim で十分なサイズを確保し、その sdim
サイズを buf_size に指定してください。

%index
llama_stream_begin
ストリーミング開始
%group
hspllama ― ストリーミング
%prm
h, "prompt", max_tokens

%inst
ストリーミング推論を開始します。以後 llama_stream_next を
ループで呼ぶと 1 トークンずつ (token piece の文字列) が
返ります。空文字列が返ったら終了です。

%index
llama_stream_next
次のトークンを取得
%group
hspllama ― ストリーミング
%prm
var_token_str, buf_size
var_token_str : トークン片を受け取る str 変数 (sdim 済)
buf_size      : var_token_str に sdim で確保したバッファサイズ

%inst
ストリーミング中に次のトークン片を var_token_str に格納します。
空文字列が返った場合は EOS か max_tokens 到達です。
var_token_str は事前に sdim で十分なサイズを確保し、その sdim
サイズを buf_size に指定してください。

%index
llama_stream_end
ストリーミング終了
%group
hspllama ― ストリーミング
%prm

%index
llama_n_ctx
コンテキスト長を取得
%group
hspllama ― メタ情報
%prm
h, var_int

%index
llama_n_vocab
語彙サイズを取得
%group
hspllama ― メタ情報
%prm
h, var_int

%href
llama_load
llama_complete
llama_chat
