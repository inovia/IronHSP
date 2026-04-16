;
; iron_taskdialog.hsp  HSP3 ヘルプ (日本語)
; Vista+ タスクダイアログ (TaskDialogIndirect)
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP
%dll
iron_taskdialog.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
comctl32.dll (OS 標準)。Windows Vista 以降が必要。
#include "iron_taskdialog.hsp" を記述して使用。

;============================================================
; 定数リファレンス
;============================================================

%index
TDICO_NONE
アイコンなし定数 (値: 0)
%group
タスクダイアログ定数
%inst
メインアイコンまたはフッターアイコンにアイコンを表示しないことを示す定数です。
値は 0 です。taskdlg や taskdlg_simple の mainico / footico パラメータに指定します。
%href
TDICO_WARNING
TDICO_ERROR
TDICO_INFO
TDICO_SHIELD
taskdlg

%index
TDICO_WARNING
警告アイコン定数 (値: 1)
%group
タスクダイアログ定数
%inst
黄色い三角形の警告アイコンを表示します。
値は 1 です。内部的に TD_WARNING_ICON (0xFFFF) に変換されます。
%href
TDICO_NONE
TDICO_ERROR
TDICO_INFO
TDICO_SHIELD
taskdlg

%index
TDICO_ERROR
エラーアイコン定数 (値: 2)
%group
タスクダイアログ定数
%inst
赤い丸のエラーアイコンを表示します。
値は 2 です。内部的に TD_ERROR_ICON (0xFFFE) に変換されます。
%href
TDICO_NONE
TDICO_WARNING
TDICO_INFO
TDICO_SHIELD
taskdlg

%index
TDICO_INFO
情報アイコン定数 (値: 3)
%group
タスクダイアログ定数
%inst
青い丸の情報アイコンを表示します。
値は 3 です。内部的に TD_INFORMATION_ICON (0xFFFD) に変換されます。
%href
TDICO_NONE
TDICO_WARNING
TDICO_ERROR
TDICO_SHIELD
taskdlg

%index
TDICO_SHIELD
シールドアイコン定数 (値: 4)
%group
タスクダイアログ定数
%inst
UAC シールド (盾) アイコンを表示します。
管理者権限が必要な操作を示すときに使用します。
値は 4 です。内部的に TD_SHIELD_ICON (0xFFFC) に変換されます。
%href
TDICO_NONE
TDICO_WARNING
TDICO_ERROR
TDICO_INFO
taskdlg

%index
TDBTN_OK
OK ボタン定数 (値: 0x01)
%group
タスクダイアログ定数
%inst
共通ボタンとして OK ボタンを表示します。
値は 0x01 (1) です。
taskdlg_set_buttons や taskdlg_simple の buttons パラメータに指定します。
複数のボタンを表示する場合は OR 演算子 (|) で組み合わせます。

OK ボタンが押された場合、stat に IDOK (1) が返ります。
%href
TDBTN_YES
TDBTN_NO
TDBTN_CANCEL
TDBTN_RETRY
TDBTN_CLOSE
taskdlg_set_buttons
taskdlg_simple

%index
TDBTN_YES
はい (Yes) ボタン定数 (値: 0x02)
%group
タスクダイアログ定数
%inst
共通ボタンとして「はい」ボタンを表示します。
値は 0x02 (2) です。
「はい」ボタンが押された場合、stat に IDYES (6) が返ります。
%href
TDBTN_OK
TDBTN_NO
TDBTN_CANCEL
taskdlg_simple

%index
TDBTN_NO
いいえ (No) ボタン定数 (値: 0x04)
%group
タスクダイアログ定数
%inst
共通ボタンとして「いいえ」ボタンを表示します。
値は 0x04 (4) です。
「いいえ」ボタンが押された場合、stat に IDNO (7) が返ります。
%href
TDBTN_OK
TDBTN_YES
TDBTN_CANCEL
taskdlg_simple

%index
TDBTN_CANCEL
キャンセルボタン定数 (値: 0x08)
%group
タスクダイアログ定数
%inst
共通ボタンとしてキャンセルボタンを表示します。
値は 0x08 (8) です。
キャンセルボタンが押された場合、stat に IDCANCEL (2) が返ります。

TDF_ALLOW_DIALOG_CANCELLATION フラグが有効な場合、タイトルバーの × ボタンや Esc キーでもキャンセルと同等の動作になります。
%href
TDBTN_OK
TDBTN_YES
TDBTN_NO
TDBTN_RETRY
TDBTN_CLOSE
taskdlg_simple

%index
TDBTN_RETRY
再試行ボタン定数 (値: 0x10)
%group
タスクダイアログ定数
%inst
共通ボタンとして「再試行」ボタンを表示します。
値は 0x10 (16) です。
再試行ボタンが押された場合、stat に IDRETRY (4) が返ります。
%href
TDBTN_OK
TDBTN_CANCEL
TDBTN_CLOSE
taskdlg_simple

%index
TDBTN_CLOSE
閉じるボタン定数 (値: 0x20)
%group
タスクダイアログ定数
%inst
共通ボタンとして「閉じる」ボタンを表示します。
値は 0x20 (32) です。
閉じるボタンが押された場合、stat に IDCLOSE (8) が返ります。
%href
TDBTN_OK
TDBTN_CANCEL
TDBTN_RETRY
taskdlg_simple

%index
TDF_ENABLE_HYPERLINKS
ハイパーリンク有効フラグ (値: 0x0001)
%group
タスクダイアログ定数
%inst
content や footer テキスト中の <a href="URL">テキスト</a> 形式のハイパーリンクを有効にします。
値は 0x0001 です。
taskdlg_set_flags で設定します。
taskdlg のデフォルトフラグに含まれています。
%href
TDF_ALLOW_DIALOG_CANCELLATION
TDF_USE_COMMAND_LINKS
taskdlg_set_flags

%index
TDF_ALLOW_DIALOG_CANCELLATION
ダイアログキャンセル許可フラグ (値: 0x0008)
%group
タスクダイアログ定数
%inst
タイトルバーの × ボタンや Esc キーでダイアログを閉じられるようにします。
閉じた場合、stat に IDCANCEL (2) が返ります。
値は 0x0008 です。
taskdlg および taskdlg_simple のデフォルトフラグに含まれています。
%href
TDF_ENABLE_HYPERLINKS
TDF_USE_COMMAND_LINKS
taskdlg_set_flags

%index
TDF_USE_COMMAND_LINKS
コマンドリンク表示フラグ (値: 0x0010)
%group
タスクダイアログ定数
%inst
taskdlg の選択肢をコマンドリンク形式 (大きなボタン + 矢印アイコン) で表示します。
通常のラジオボタンではなく、Vista スタイルの大きな選択ボタンになります。
値は 0x0010 です。
taskdlg のデフォルトフラグに含まれています。
%href
TDF_USE_COMMAND_LINKS_NO_ICON
TDF_ENABLE_HYPERLINKS
taskdlg_set_flags

%index
TDF_USE_COMMAND_LINKS_NO_ICON
コマンドリンク (アイコンなし) フラグ (値: 0x0020)
%group
タスクダイアログ定数
%inst
TDF_USE_COMMAND_LINKS と同様にコマンドリンク形式で表示しますが、矢印アイコンを表示しません。
値は 0x0020 です。
%href
TDF_USE_COMMAND_LINKS
taskdlg_set_flags

%index
TDF_EXPAND_FOOTER_AREA
フッター展開フラグ (値: 0x0040)
%group
タスクダイアログ定数
%inst
展開テキストをフッター領域に表示します。
値は 0x0040 です。
%href
TDF_EXPANDED_BY_DEFAULT
taskdlg_set_flags

%index
TDF_EXPANDED_BY_DEFAULT
初期展開フラグ (値: 0x0080)
%group
タスクダイアログ定数
%inst
ダイアログ表示時に展開テキストを最初から展開した状態にします。
値は 0x0080 です。
%href
TDF_EXPAND_FOOTER_AREA
taskdlg_set_flags

%index
TDF_SHOW_PROGRESS_BAR
プログレスバー表示フラグ (値: 0x0200)
%group
タスクダイアログ定数
%inst
ダイアログにプログレスバーを表示します。
値は 0x0200 です。
%href
taskdlg_set_flags

%index
TDF_CAN_BE_MINIMIZED
最小化可能フラグ (値: 0x8000)
%group
タスクダイアログ定数
%inst
ダイアログを最小化できるようにします。
値は 0x8000 です。
%href
taskdlg_set_flags

;============================================================
; 戻り値で使われるボタン ID 定数
;============================================================

%index
IDOK
OK ボタン ID (値: 1)
%group
タスクダイアログ定数
%inst
taskdlg_simple で TDBTN_OK を指定した場合、OK ボタンが押されると stat にこの値 (1) が返ります。
Windows API の標準定数です。
%href
IDCANCEL
IDYES
IDNO
taskdlg_simple

%index
IDCANCEL
キャンセルボタン ID (値: 2)
%group
タスクダイアログ定数
%inst
キャンセルボタンが押された場合や、× ボタン / Esc キーで閉じた場合に stat にこの値 (2) が返ります。
taskdlg のコマンドリンク形式でキャンセルされた場合も同じ値が返ります。
Windows API の標準定数です。
%href
IDOK
IDYES
IDNO
taskdlg
taskdlg_simple

%index
IDRETRY
再試行ボタン ID (値: 4)
%group
タスクダイアログ定数
%inst
再試行ボタンが押された場合に stat にこの値 (4) が返ります。
Windows API の標準定数です。
%href
IDOK
IDCANCEL
taskdlg_simple

%index
IDYES
はい (Yes) ボタン ID (値: 6)
%group
タスクダイアログ定数
%inst
「はい」ボタンが押された場合に stat にこの値 (6) が返ります。
Windows API の標準定数です。
%href
IDOK
IDCANCEL
IDNO
taskdlg_simple

%index
IDNO
いいえ (No) ボタン ID (値: 7)
%group
タスクダイアログ定数
%inst
「いいえ」ボタンが押された場合に stat にこの値 (7) が返ります。
Windows API の標準定数です。
%href
IDOK
IDCANCEL
IDYES
taskdlg_simple

%index
IDCLOSE
閉じるボタン ID (値: 8)
%group
タスクダイアログ定数
%inst
閉じるボタンが押された場合に stat にこの値 (8) が返ります。
Windows API の標準定数です。
%href
IDOK
IDCANCEL
taskdlg_simple

;============================================================
; コマンドリファレンス
;============================================================

%index
taskdlg_init
タスクダイアログの初期化
%group
タスクダイアログ
%prm

%inst
タスクダイアログの内部状態を初期化します。
以下の値がデフォルトに設定されます:

  dwFlags = TDF_ALLOW_DIALOG_CANCELLATION | TDF_USE_COMMAND_LINKS | TDF_ENABLE_HYPERLINKS
  dwCommonButtons = 0
  nDefaultButton = 0
  cxWidth = 0 (自動)

通常は taskdlg / taskdlg_simple の初回呼び出し時に自動的に実行されるため、明示的に呼ぶ必要はありません。
taskdlg_set_flags 等で変更した設定をデフォルトに戻したい場合に使用してください。

%href
taskdlg
taskdlg_simple
taskdlg_set_flags

%index
taskdlg
タスクダイアログを表示 (フル機能版)
%group
タスクダイアログ
%prm
"title", "main", "content", "footer", "choices", mainico, footico
"title"   : ダイアログのタイトルバーに表示する文字列
"main"    : メインメッセージ (大きいフォントで表示される)
"content" : サブメッセージ (通常フォントで表示される)
"footer"  : フッター領域に表示する文字列 (空文字 "" で非表示)
"choices" : 選択肢を改行 (\n) 区切りで指定する文字列
mainico   : メインアイコン (TDICO_NONE=0 / TDICO_WARNING=1 / TDICO_ERROR=2 / TDICO_INFO=3 / TDICO_SHIELD=4)
footico   : フッターアイコン (同上)

%inst
Windows Vista 以降の TaskDialogIndirect API を使用して、モダンなタスクダイアログを表示します。
MessageBox の上位互換として、より豊富なカスタマイズが可能です。

choices パラメータに改行 (\n) 区切りで選択肢を指定すると、コマンドリンク形式の大きなボタンとして表示されます。

■ 戻り値 (stat)
  101～ : 選択肢のボタンが押された場合。1番目の選択肢 = 101、2番目 = 102、...
  2     : キャンセル (× ボタン、Esc キー、または TDBTN_CANCEL)

■ アイコン一覧
  TDICO_NONE (0)    : アイコンなし
  TDICO_WARNING (1) : 黄色い三角の警告アイコン
  TDICO_ERROR (2)   : 赤い丸のエラーアイコン
  TDICO_INFO (3)    : 青い丸の情報アイコン
  TDICO_SHIELD (4)  : UAC シールド (盾) アイコン

■ フラグのカスタマイズ
デフォルトでは以下のフラグが有効になっています:
  TDF_ALLOW_DIALOG_CANCELLATION | TDF_USE_COMMAND_LINKS | TDF_ENABLE_HYPERLINKS
taskdlg_set_flags で変更できます。

■ ダイアログ幅
taskdlg_set_width でピクセル単位の幅を指定できます (0 = 自動)。

■ 共通ボタンの追加
taskdlg_set_buttons で選択肢とは別に OK / Cancel 等の共通ボタンを表示できます。

■ デフォルトボタン
taskdlg_set_default_id でフォーカスが当たるデフォルトボタンの ID を指定できます。
選択肢のボタン ID は 101 から順に割り当てられます。

■ 文字列の扱い
引数の文字列は内部で UTF-16 に変換されます。HSP の通常の cp932 文字列をそのまま渡せます。
空文字 ("") を渡した場合、その領域は非表示になります。

%sample
; --- 基本的な選択ダイアログ ---
#include "iron_taskdialog.hsp"

taskdlg "ファイル操作", "保存しますか？", "変更内容があります。", "", "保存する\n保存しない\nキャンセル", TDICO_WARNING, TDICO_NONE

if stat = 101 : mes "保存を選択"
if stat = 102 : mes "保存しないを選択"
if stat = 2   : mes "キャンセル"

%sample
; --- フッター付きダイアログ ---
#include "iron_taskdialog.hsp"

taskdlg "更新確認", "新しいバージョンがあります", "v3.8 にアップデートしますか？", "※ 再起動が必要です", "今すぐ更新\n後で通知", TDICO_INFO, TDICO_WARNING

mes "選択 ID = " + stat

%href
taskdlg_simple
taskdlg_init
taskdlg_set_flags
taskdlg_set_width
taskdlg_set_buttons
taskdlg_set_default_id
TDICO_NONE
TDICO_WARNING
TDICO_ERROR
TDICO_INFO
TDICO_SHIELD

%index
taskdlg_simple
簡易タスクダイアログを表示
%group
タスクダイアログ
%prm
"title", "main", buttons
"title"  : ダイアログのタイトルバーに表示する文字列
"main"   : メインメッセージ (大きいフォントで表示される)
buttons  : 表示するボタンの組み合わせ (TDBTN_* 定数を | で結合)

%inst
選択肢なしの簡易タスクダイアログを表示します。
OS 標準の共通ボタン (OK / Yes / No / Cancel / Retry / Close) のみを使用するシンプルな版です。

buttons パラメータには TDBTN_* 定数を OR (|) で組み合わせて指定します:
  TDBTN_OK     (0x01) : OK ボタン
  TDBTN_YES    (0x02) : はいボタン
  TDBTN_NO     (0x04) : いいえボタン
  TDBTN_CANCEL (0x08) : キャンセルボタン
  TDBTN_RETRY  (0x10) : 再試行ボタン
  TDBTN_CLOSE  (0x20) : 閉じるボタン

■ 戻り値 (stat)
  IDOK     (1) : OK ボタンが押された
  IDCANCEL (2) : キャンセルまたは × ボタン / Esc
  IDRETRY  (4) : 再試行ボタンが押された
  IDYES    (6) : はいボタンが押された
  IDNO     (7) : いいえボタンが押された
  IDCLOSE  (8) : 閉じるボタンが押された

■ フル機能版との違い
taskdlg_simple は TDF_ALLOW_DIALOG_CANCELLATION のみをフラグとして使用し、コマンドリンクやハイパーリンクは有効になりません。
アイコン、フッター、コンテンツ等の詳細な設定が必要な場合は taskdlg を使用してください。

%sample
; --- Yes/No 確認ダイアログ ---
#include "iron_taskdialog.hsp"

taskdlg_simple "確認", "続行しますか？", TDBTN_YES | TDBTN_NO

if stat = 6 : mes "はいが選択されました"
if stat = 7 : mes "いいえが選択されました"

%sample
; --- OK のみのダイアログ ---
#include "iron_taskdialog.hsp"

taskdlg_simple "完了", "処理が完了しました。", TDBTN_OK

%sample
; --- 3 ボタンダイアログ ---
#include "iron_taskdialog.hsp"

taskdlg_simple "エラー", "接続に失敗しました。", TDBTN_RETRY | TDBTN_CANCEL | TDBTN_CLOSE

if stat = 4 : mes "再試行"
if stat = 2 : mes "キャンセル"
if stat = 8 : mes "閉じる"

%href
taskdlg
taskdlg_init
TDBTN_OK
TDBTN_YES
TDBTN_NO
TDBTN_CANCEL
TDBTN_RETRY
TDBTN_CLOSE

%index
taskdlg_set_flags
タスクダイアログのフラグを設定
%group
タスクダイアログ
%prm
flags
flags : dwFlags に設定する値 (TDF_* 定数を | で結合)

%inst
次回の taskdlg 呼び出しで使用される dwFlags を設定します。

デフォルト値は以下の通りです:
  TDF_ALLOW_DIALOG_CANCELLATION | TDF_USE_COMMAND_LINKS | TDF_ENABLE_HYPERLINKS

利用可能なフラグ:
  TDF_ENABLE_HYPERLINKS         (0x0001) : テキスト中のハイパーリンクを有効化
  TDF_ALLOW_DIALOG_CANCELLATION (0x0008) : × ボタン / Esc でキャンセル可能
  TDF_USE_COMMAND_LINKS         (0x0010) : コマンドリンク形式で表示
  TDF_USE_COMMAND_LINKS_NO_ICON (0x0020) : コマンドリンク (アイコンなし)
  TDF_EXPAND_FOOTER_AREA        (0x0040) : 展開テキストをフッターに表示
  TDF_EXPANDED_BY_DEFAULT       (0x0080) : 展開テキストを初期表示
  TDF_SHOW_PROGRESS_BAR         (0x0200) : プログレスバーを表示
  TDF_CAN_BE_MINIMIZED          (0x8000) : 最小化を許可

この設定は taskdlg_init で初期化するまで保持されます。

%sample
; --- アイコンなしのコマンドリンクに変更 ---
#include "iron_taskdialog.hsp"

taskdlg_set_flags TDF_ALLOW_DIALOG_CANCELLATION | TDF_USE_COMMAND_LINKS_NO_ICON
taskdlg "設定", "表示モードを選択", "", "", "ライトモード\nダークモード", TDICO_NONE, TDICO_NONE

%href
taskdlg
taskdlg_init
TDF_ENABLE_HYPERLINKS
TDF_ALLOW_DIALOG_CANCELLATION
TDF_USE_COMMAND_LINKS
TDF_USE_COMMAND_LINKS_NO_ICON
TDF_EXPAND_FOOTER_AREA
TDF_EXPANDED_BY_DEFAULT
TDF_SHOW_PROGRESS_BAR
TDF_CAN_BE_MINIMIZED

%index
taskdlg_set_width
タスクダイアログの幅を設定
%group
タスクダイアログ
%prm
px
px : ダイアログの幅 (ピクセル単位、0 = 自動)

%inst
次回の taskdlg 呼び出しで使用されるダイアログの幅をピクセル単位で設定します。
0 を指定すると、コンテンツに応じた自動幅になります (デフォルト)。

内部的に TASKDIALOGCONFIG 構造体の cxWidth フィールドに設定されます。
この設定は taskdlg_init で初期化するまで保持されます。

%sample
#include "iron_taskdialog.hsp"

taskdlg_set_width 500
taskdlg "テスト", "幅 500px のダイアログ", "このダイアログは幅 500 ピクセルで表示されています。", "", "OK", TDICO_INFO, TDICO_NONE

%href
taskdlg
taskdlg_init

%index
taskdlg_set_buttons
共通ボタンを設定
%group
タスクダイアログ
%prm
btns
btns : dwCommonButtons に設定する値 (TDBTN_* 定数を | で結合)

%inst
次回の taskdlg 呼び出しで、選択肢 (コマンドリンク) とは別に表示する共通ボタンを設定します。

例えば、コマンドリンクの選択肢に加えて「キャンセル」ボタンを表示したい場合に使用します:
  taskdlg_set_buttons TDBTN_CANCEL

設定可能な値:
  TDBTN_OK     (0x01) : OK ボタン
  TDBTN_YES    (0x02) : はいボタン
  TDBTN_NO     (0x04) : いいえボタン
  TDBTN_CANCEL (0x08) : キャンセルボタン
  TDBTN_RETRY  (0x10) : 再試行ボタン
  TDBTN_CLOSE  (0x20) : 閉じるボタン

この設定は taskdlg_init で初期化するまで保持されます。
taskdlg_simple では buttons パラメータで直接指定するため、この命令は不要です。

%sample
#include "iron_taskdialog.hsp"

; 選択肢 + キャンセルボタンの両方を表示
taskdlg_set_buttons TDBTN_CANCEL
taskdlg "操作選択", "どの操作を実行しますか？", "", "", "コピー\n移動\n削除", TDICO_INFO, TDICO_NONE

if stat = 101 : mes "コピー"
if stat = 102 : mes "移動"
if stat = 103 : mes "削除"
if stat = 2   : mes "キャンセル"

%href
taskdlg
taskdlg_init
taskdlg_simple
TDBTN_OK
TDBTN_YES
TDBTN_NO
TDBTN_CANCEL
TDBTN_RETRY
TDBTN_CLOSE

%index
taskdlg_set_default_id
デフォルトボタンの ID を設定
%group
タスクダイアログ
%prm
id
id : デフォルトで選択状態にするボタンの ID

%inst
次回の taskdlg 呼び出しで、初期フォーカスが当たるデフォルトボタンの ID を設定します。

taskdlg の選択肢は 101 から順番に ID が割り当てられます:
  1番目の選択肢 = 101
  2番目の選択肢 = 102
  3番目の選択肢 = 103
  ...

共通ボタンの ID:
  IDOK     = 1
  IDCANCEL = 2
  IDRETRY  = 4
  IDYES    = 6
  IDNO     = 7
  IDCLOSE  = 8

0 を指定するとデフォルトの動作 (最初のボタン) になります。
この設定は taskdlg_init で初期化するまで保持されます。

%sample
#include "iron_taskdialog.hsp"

; 2番目の選択肢をデフォルトにする
taskdlg_set_default_id 102
taskdlg "確認", "削除しますか？", "この操作は元に戻せません。", "", "削除する\nキャンセル", TDICO_WARNING, TDICO_NONE

; 「キャンセル」(102) がデフォルト選択になる

%href
taskdlg
taskdlg_init
