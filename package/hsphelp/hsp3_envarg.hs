;
;	HSP help manager用 HELPソースファイル
;	環境変数・コマンドライン引数 (IronHSP 内蔵)
;

%type
内蔵関数
%ver
3.8
%note
IronHSP (hsp3net) 専用
%date
2026/04/16
%author
IronHSP
%url
https://github.com/inovia/IronHSP
%port
Win


%index
getenv
環境変数を取得
%group
環境変数操作関数
%prm
(p1, p2)
p1 = "変数名" : 取得する環境変数名
p2 = ""        : デフォルト値 (省略時は空文字列)

%inst
p1 で指定した環境変数の値を文字列として返します。
環境変数が存在しない場合は p2 で指定したデフォルト値を返します。
p2 を省略した場合は空文字列 ("") が返ります。

%sample
	s = getenv("PATH")
	mes "PATH = " + s

	s = getenv("MY_VAR", "未設定")
	mes "MY_VAR = " + s

%href
hasenv
setenv
delenv


%index
hasenv
環境変数の存在チェック
%group
環境変数操作関数
%prm
(p1)
p1 = "変数名" : チェックする環境変数名

%inst
p1 で指定した環境変数が存在するかどうかをチェックします。
存在する場合は 1、存在しない場合は 0 を返します。
値が空文字列でも、変数自体が存在すれば 1 を返します。

%sample
	if hasenv("PATH") {
		mes "PATH は設定されています"
	}

%href
getenv
setenv
delenv


%index
setenv
環境変数を設定
%group
環境変数操作命令
%prm
p1, p2
p1 = "変数名" : 設定する環境変数名
p2 = "値"      : 設定する値

%inst
p1 で指定した環境変数に p2 の値を設定します。
変数が存在しない場合は新規作成されます。
この設定は現在のプロセスとその子プロセスにのみ有効です (システム環境変数は変更しません)。

%sample
	setenv "MY_APP_MODE", "debug"
	mes getenv("MY_APP_MODE")

%href
getenv
hasenv
delenv


%index
delenv
環境変数を削除
%group
環境変数操作命令
%prm
p1
p1 = "変数名" : 削除する環境変数名

%inst
p1 で指定した環境変数を現在のプロセスから削除します。
存在しない変数を指定してもエラーにはなりません。

%sample
	setenv "TEMP_VAR", "test"
	mes getenv("TEMP_VAR")
	delenv "TEMP_VAR"
	mes hasenv("TEMP_VAR")  ; 0

%href
getenv
hasenv
setenv


%index
getcmdargc
コマンドライン引数の数を取得
%group
コマンドライン引数関数
%prm
()

%inst
コマンドライン引数の数を返します (プログラム名を含む)。
引数なしで実行した場合は 1 (プログラム名のみ) を返します。

%sample
	n = getcmdargc()
	mes "引数の数: " + n

%href
getcmdarg
getcmdargs
getcmdargi
hascmdarg


%index
getcmdarg
コマンドライン引数を取得
%group
コマンドライン引数関数
%prm
(p1)
p1 = 0～ : 引数のインデックス (0起点)

%inst
p1 番目のコマンドライン引数を文字列として返します。
インデックスは 0 起点で、0 はプログラム名 (実行ファイルのパス) です。
範囲外のインデックスを指定した場合は空文字列を返します。

%sample
	; 実行例: hsp3cl_net_64.exe test.ax hello world
	mes getcmdarg(0)  ; → "...hsp3cl_net_64.exe"
	mes getcmdarg(1)  ; → "test.ax"
	mes getcmdarg(2)  ; → "hello"
	mes getcmdarg(3)  ; → "world"

%href
getcmdargc
getcmdargs
getcmdargi
hascmdarg


%index
getcmdargs
名前付きコマンドライン引数を取得 (文字列)
%group
コマンドライン引数関数
%prm
(p1, p2)
p1 = "--名前" : 引数名
p2 = ""       : デフォルト値

%inst
コマンドライン引数から p1 で指定した名前の値を文字列で取得します。
以下の2つの書式に対応しています:
^p
--name=value  (= 区切り)
--name value  (スペース区切り、次の引数が値)
^p
見つからない場合は p2 のデフォルト値を返します。

%sample
	; 実行例: app.ax --output result.png --mode=turbo
	s = getcmdargs("--output", "default.txt")
	mes s  ; → "result.png"

	s = getcmdargs("--mode", "normal")
	mes s  ; → "turbo"

%href
getcmdargi
hascmdarg
getcmdargc
getcmdarg


%index
getcmdargi
名前付きコマンドライン引数を取得 (整数)
%group
コマンドライン引数関数
%prm
(p1, p2)
p1 = "--名前" : 引数名
p2 = 0        : デフォルト値 (整数)

%inst
コマンドライン引数から p1 で指定した名前の値を整数で取得します。
書式は getcmdargs と同じです (--name=123 または --name 123)。
見つからない場合は p2 のデフォルト値を返します。

%sample
	; 実行例: app.ax --count 99 --port=8080
	n = getcmdargi("--count", 10)
	mes n  ; → 99

	port = getcmdargi("--port", 3000)
	mes port  ; → 8080

%href
getcmdargs
hascmdarg
getcmdargc
getcmdarg


%index
hascmdarg
コマンドライン引数の存在チェック
%group
コマンドライン引数関数
%prm
(p1)
p1 = "--名前" : チェックする引数名

%inst
コマンドライン引数に p1 で指定した名前が含まれているかをチェックします。
存在する場合は 1、存在しない場合は 0 を返します。
--verbose のようなフラグ引数のチェックに使います。
--name=value 形式で値が付いている場合も 1 を返します。

%sample
	; 実行例: app.ax --verbose --debug
	if hascmdarg("--verbose") {
		mes "詳細モード"
	}
	if hascmdarg("--debug") {
		mes "デバッグモード"
	}

%href
getcmdargs
getcmdargi
getcmdargc
getcmdarg
