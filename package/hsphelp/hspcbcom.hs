%dll
hspcbcom
%ver
0.1
%date
2026/04/14
%author
IronHSP project
%url
https://github.com/inovia/IronHSP
%note
hspcbcom (#defcbcom / #cbmethod / #endcbcom / newcomcb / comprm 等) は IronHSP の
hsp3net ランタイムに組み込まれているため、追加の include は不要です。
hsp3net 専用 (vanilla hsp3 では使えません)。

%type
内蔵命令
%group
hspcbcom - COM コールバックインターフェース
%port
Win10 22H2+

%index
#defcbcom
COM コールバックインターフェース クラス定義開始
%prm
class_name interface_name
class_name     : HSP 側で付ける任意のクラス名 (例 MyDropTarget)
interface_name : 事前に #usecom で IID を登録した COM インターフェース名
%inst
HSP 側で COM インターフェース (例: IDropTarget, IBindStatusCallback) を実装するための
クラス宣言を開始する。中に #cbmethod を列挙してメソッドを vtable index にマッピングする。
最後に #endcbcom で締める。

IUnknown の QueryInterface / AddRef / Release は自動実装される (vtable slot 0..2)。
ユーザーが書くのは vtable index 3 以降のメソッドのみ。

%sample
#define IID_IDropTarget "{00000122-0000-0000-c000-000000000046}"
#usecom IDropTarget IID_IDropTarget "{}"

#defcbcom MyDT IDropTarget
    #cbmethod 3 int comobj, int, intptr, intptr, *dt_enter
    #cbmethod 4 int int, intptr, intptr,         *dt_over
    #cbmethod 5 int,                             *dt_leave
    #cbmethod 6 int comobj, int, intptr, intptr, *dt_drop
#endcbcom

%href
#cbmethod
#endcbcom
newcomcb


%index
#cbmethod
COM コールバッククラスにメソッドを登録する
%prm
vtable_idx ret_type arg_types..., *label
vtable_idx : メソッドの vtable インデックス (3 以上)
ret_type   : 戻り値型 (普通は int = HRESULT)
arg_types  : 引数型のカンマ区切り (int / int64 / intptr / wstr / str / comobj / double / float)
label      : メソッドが呼ばれたとき gosub するラベル
%inst
#defcbcom ～ #endcbcom の中で使い、各 vtable slot に対応する HSP ラベルを宣言する。
ラベルは前方参照可能 (定義より前に書ける)。

引数列の最後はかならず *label で終わる。
引数型 intptr はプラットフォーム依存の整数 (x86=32bit / x64=64bit) で、ポインタ系の
引数を 1 つの HSP ソースで両プラットフォーム対応するために使う。

%href
#defcbcom
#endcbcom


%index
#endcbcom
COM コールバッククラス定義終了
%prm

%inst
#defcbcom で開始したクラス定義を確定する。この時点で hspcmp が登録 bytecode を発行し、
ランタイム実行時にクラスが自動的に登録される。

%href
#defcbcom


%index
newcomcb
COM コールバッククラスのインスタンスを生成する
%prm
var, "class_name" [, tag]
var        : 出力先 (comobj 変数)
class_name : #defcbcom で定義したクラス名 (string literal)
tag        : インスタンス識別用の int または string (省略可)
%inst
指定したクラスの新しいインスタンスを作成し、var に格納する。tag は callback 内から
comcbtag() / comcbtags() で取り出せるので、複数 instance を作って使い分ける用途に便利。
通常の comobj として外部 COM API (RegisterDragDrop / URLDownloadToFile 等) に渡せる。
不要になったら delcom var で解放する。

%href
#defcbcom
delcom


%index
comprm
コールバック中の引数を取得する
%prm
n
n : 引数番号 (0 から)
%inst
現在実行中のコールバックメソッドの N 番目の引数を、#cbmethod で宣言した型に従って
HSP 値として取得する。

  int     → HSP int  (32bit 値)
  int64   → HSP int64
  intptr  → HSP int64 (raw pointer)
  wstr    → HSP str (UTF-16 → SJIS 自動変換)
  str     → HSP str
  double  → HSP double
  comobj  → raw int64 (newcom -2 で wrap して使うか、別の #comfunc に渡す)

%href
#cbmethod


%index
comcbidx
現在のコールバックの vtable index を取得する
%prm

%inst
複数メソッドを同じラベルにマッピングしたとき、どの index で呼ばれたかを判別するために
使う。

%href
#cbmethod


%index
comcbtag
現在のコールバックの int tag を取得する
%prm

%inst
newcomcb 時に指定した int tag を返す。string tag を指定していた場合は 0、tag を省略
していた場合は instance ごとに自動採番された ID (1, 2, ...) が返る。

%href
newcomcb
comcbtags


%index
comcbtags
現在のコールバックの string tag を取得する
%prm

%inst
newcomcb 時に指定した string tag を返す。int tag だった場合や省略していた場合は空文字列
を返す。

%href
newcomcb
comcbtag


%index
comcbis
現在のコールバックの this が指定 comobj と一致するか確認する
%prm
var
var : 比較対象の comobj 変数
%inst
1 つの class から複数 instance を作って使い分けるとき、現在のコールバックがどの instance
から呼ばれたかを判別するために使う。一致すれば 1、それ以外は 0 を返す。

%href
newcomcb
comcbtag


%index
comcbthis
現在のコールバックの raw IUnknown* を取得する
%prm

%inst
高度な用途向け。コールバック内から自分自身 (this) の IUnknown* (intptr 値) を取得する。
これを別の COM API に渡して再帰的に登録する等に使える。

%href
newcomcb


%index
comret
コールバックの戻り値 (HRESULT) を設定する
%prm
val
val : HRESULT 値 (0 = S_OK)
%inst
コールバック内から呼んで、外部 COM caller に返す HRESULT を設定する。省略すると
S_OK (0) が返される。明示的に E_FAIL や E_NOTIMPL を返したい場合は comret <val> を呼ぶ。

%href
#cbmethod
