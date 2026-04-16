%dll
; iron_exif EXIF情報読み取り
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
画像操作

%index
exif_open
画像を開く
%prm
"image.jpg"
%inst
stat=0 で成功。
%href
exif_get_str

%index
exif_get_str
文字列タグを取得
%prm
tag_id
%inst
refstr にタグ値。EXIF_MODEL 等。
%href
exif_get_int

%index
exif_get_int
整数タグを取得
%prm
tag_id
%inst
stat に整数値。
%href
exif_get_rational

%index
exif_get_rational
有理数タグを取得
%prm
tag_id
%inst
refdval に double。
%href
exif_close

%index
exif_close
画像を閉じる
%prm

%inst

%href
exif_count

%index
exif_count
プロパティ数を返す
%prm
()
%inst

