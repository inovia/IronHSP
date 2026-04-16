%dll
; IronHSP MAP型ヘルプ
%ver
3.8
%date
2026/04/16
%author
IronHSP
%url
https://github.com/inovia/IronHSP_2026
%note
IronHSP 内蔵機能です。
%type
内蔵命令
%group
メモリ操作命令

%index
dimmap
連想配列変数を作成
%prm
var
var : 変数名
%inst
連想配列 (MAP) 変数を作成します。
作成された変数は map("key") = value の形式で文字列キーによる読み書きができます。
値は内部的に文字列として保持され、代入時に int/double/int64 は自動的に文字列へ変換されます。
未登録のキーを読み取ると空文字列 "" が返ります。
%sample
	dimmap mymap
	mymap("name") = "HSP"
	mymap("year") = "2026"
	mes mymap("name")
	mes "count = " + mapcount(mymap)
%href
mapcount
hasmap
mapkey
delmap
mapclear

%index
delmap
連想配列のエントリを削除
%prm
var, "key"
var : MAP 変数
"key" : 削除するキー文字列
%inst
連想配列から指定したキーのエントリを削除します。
指定したキーが存在しない場合は何もしません。
%sample
	dimmap mymap
	mymap("a") = "1"
	delmap mymap, "a"
	mes hasmap(mymap, "a")  ; 0
%href
dimmap
mapclear

%index
mapclear
連想配列の全エントリを削除
%prm
var
var : MAP 変数
%inst
連想配列の全エントリを削除し、空の状態に戻します。
%sample
	dimmap mymap
	mymap("a") = "1"
	mymap("b") = "2"
	mapclear mymap
	mes mapcount(mymap)  ; 0
%href
dimmap
delmap

%type
内蔵関数
%group
メモリ操作関数

%index
mapcount
連想配列のエントリ数を取得
%prm
(var)
var : MAP 変数
%inst
連想配列に含まれるエントリ (キーと値のペア) の数を返します。
%sample
	dimmap mymap
	mymap("a") = "1"
	mymap("b") = "2"
	mes mapcount(mymap)  ; 2
%href
dimmap
hasmap
mapkey

%index
hasmap
連想配列にキーが存在するか確認
%prm
(var, "key")
var : MAP 変数
"key" : 検索するキー文字列
%inst
連想配列に指定したキーが存在する場合は 1、存在しない場合は 0 を返します。
%sample
	dimmap mymap
	mymap("name") = "HSP"
	mes hasmap(mymap, "name")  ; 1
	mes hasmap(mymap, "foo")   ; 0
%href
dimmap
mapcount

%index
mapkey
連想配列のキーをインデックスで取得
%prm
(var, index)
var : MAP 変数
index : 0 から始まるインデックス
%inst
連想配列の index 番目のキーを文字列で返します。
mapcount と組み合わせて全キーを列挙できます。
列挙順序は挿入順とは限りません (unordered_map のため)。
index が範囲外の場合は空文字列 "" を返します。
%sample
	dimmap mymap
	mymap("a") = "1"
	mymap("b") = "2"
	n = mapcount(mymap)
	repeat n
		k = mapkey(mymap, cnt)
		mes k + " = " + mymap(k)
	loop
%href
dimmap
mapcount
hasmap
