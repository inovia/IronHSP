; ============================================================
;   shlwapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
shlwapi.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の shlwapi.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
StrChrW
文字列から、指定した文字と一致する最初の文字を検索する。比較では大文字と小文字を区別する。(Unicode)
%prm
pszStart, wMatch
pszStart : [wstr] 型: PTSTR 検索対象となる文字列のアドレス。
wMatch : [int] 型: TCHAR 比較に使用する文字。
%inst
文字列から、指定した文字と一致する最初の文字を検索する。比較では大文字と小文字を区別する。(Unicode)

[戻り値]
型: PTSTR 成功した場合は、文字列中で最初に見つかった該当文字のアドレスを返す。見つからなかった場合は NULL を返す。

[備考]
比較では、pszStart が NULL 終端文字列の先頭を指しているものとみなされる。
> [!NOTE] > shlwapi.h ヘッダーは StrChr をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrChrIA
文字列から、指定した文字と一致する最初の文字を検索する。比較では大文字と小文字を区別しない。(ANSI)
%prm
pszStart, wMatch
pszStart : [str] 型: PTSTR 検索対象となる文字列へのポインタ。
wMatch : [int] 型: TCHAR 比較に使用する文字。
%inst
文字列から、指定した文字と一致する最初の文字を検索する。比較では大文字と小文字を区別しない。(ANSI)

[戻り値]
型: PTSTR 成功した場合は、文字列中で最初に見つかった該当文字のアドレスを返す。見つからなかった場合は NULL を返す。

[備考]
比較では、pszStart が NULL 終端文字列の先頭を指しているものとみなされる。
> [!NOTE] > shlwapi.h ヘッダーは StrChrI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrChrIW
文字列から、指定した文字と一致する最初の文字を検索する。比較では大文字と小文字を区別しない。(Unicode)
%prm
pszStart, wMatch
pszStart : [wstr] 型: PTSTR 検索対象となる文字列へのポインタ。
wMatch : [int] 型: TCHAR 比較に使用する文字。
%inst
文字列から、指定した文字と一致する最初の文字を検索する。比較では大文字と小文字を区別しない。(Unicode)

[戻り値]
型: PTSTR 成功した場合は、文字列中で最初に見つかった該当文字のアドレスを返す。見つからなかった場合は NULL を返す。

[備考]
比較では、pszStart が NULL 終端文字列の先頭を指しているものとみなされる。
> [!NOTE] > shlwapi.h ヘッダーは StrChrI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrCmpNA
2 つの文字列の先頭から指定した文字数を比較し、同一であるかどうかを判定する。比較では大文字と小文字を区別する。StrNCmp マクロはこの関数と名称が異なるだけである。(ANSI)
%prm
psz1, psz2, nChar
psz1 : [str] 型: PCTSTR 比較する 1 つ目の NULL 終端文字列へのポインタ。
psz2 : [str] 型: PCTSTR 比較する 2 つ目の NULL 終端文字列へのポインタ。
nChar : [int] 型: int 各文字列の先頭から比較する文字数。
%inst
2 つの文字列の先頭から指定した文字数を比較し、同一であるかどうかを判定する。比較では大文字と小文字を区別する。StrNCmp
マクロはこの関数と名称が異なるだけである。(ANSI)

[戻り値]
型: int 文字列が等しい場合はゼロを返す。psz1 が指す文字列の先頭 nChar 文字が psz2
が指す文字列のそれより大きい場合は正の値を返す。psz1 が指す文字列の先頭 nChar 文字が psz2
が指す文字列のそれより小さい場合は負の値を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrCmpN をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrCmpNIA
2 つの文字列の先頭から指定した文字数を比較し、同一であるかどうかを判定する。比較では大文字と小文字を区別しない。StrNCmpI マクロはこの関数と名称が異なるだけである。(ANSI)
%prm
psz1, psz2, nChar
psz1 : [str] 型: PCTSTR 比較する 1 つ目の NULL 終端文字列へのポインタ。
psz2 : [str] 型: PCTSTR 比較する 2 つ目の NULL 終端文字列へのポインタ。
nChar : [int] 型: int 各文字列の先頭から比較する文字数。
%inst
2 つの文字列の先頭から指定した文字数を比較し、同一であるかどうかを判定する。比較では大文字と小文字を区別しない。StrNCmpI
マクロはこの関数と名称が異なるだけである。(ANSI)

[戻り値]
型: int 文字列が等しい場合はゼロを返す。psz1 が指す文字列の先頭 nChar 文字が psz2
が指す文字列のそれより大きい場合は正の値を返す。psz1 が指す文字列の先頭 nChar 文字が psz2
が指す文字列のそれより小さい場合は負の値を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrCmpNI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrCmpNIW
2 つの文字列の先頭から指定した文字数を比較し、同一であるかどうかを判定する。比較では大文字と小文字を区別しない。StrNCmpI マクロはこの関数と名称が異なるだけである。(Unicode)
%prm
psz1, psz2, nChar
psz1 : [wstr] 型: PCTSTR 比較する 1 つ目の NULL 終端文字列へのポインタ。
psz2 : [wstr] 型: PCTSTR 比較する 2 つ目の NULL 終端文字列へのポインタ。
nChar : [int] 型: int 各文字列の先頭から比較する文字数。
%inst
2 つの文字列の先頭から指定した文字数を比較し、同一であるかどうかを判定する。比較では大文字と小文字を区別しない。StrNCmpI
マクロはこの関数と名称が異なるだけである。(Unicode)

[戻り値]
型: int 文字列が等しい場合はゼロを返す。psz1 が指す文字列の先頭 nChar 文字が psz2
が指す文字列のそれより大きい場合は正の値を返す。psz1 が指す文字列の先頭 nChar 文字が psz2
が指す文字列のそれより小さい場合は負の値を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrCmpNI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrCmpNW
2 つの文字列の先頭から指定した文字数を比較し、同一であるかどうかを判定する。比較では大文字と小文字を区別する。StrNCmp マクロはこの関数と名称が異なるだけである。(Unicode)
%prm
psz1, psz2, nChar
psz1 : [wstr] 型: PCTSTR 比較する 1 つ目の NULL 終端文字列へのポインタ。
psz2 : [wstr] 型: PCTSTR 比較する 2 つ目の NULL 終端文字列へのポインタ。
nChar : [int] 型: int 各文字列の先頭から比較する文字数。
%inst
2 つの文字列の先頭から指定した文字数を比較し、同一であるかどうかを判定する。比較では大文字と小文字を区別する。StrNCmp
マクロはこの関数と名称が異なるだけである。(Unicode)

[戻り値]
型: int 文字列が等しい場合はゼロを返す。psz1 が指す文字列の先頭 nChar 文字が psz2
が指す文字列のそれより大きい場合は正の値を返す。psz1 が指す文字列の先頭 nChar 文字が psz2
が指す文字列のそれより小さい場合は負の値を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrCmpN をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrRChrW
文字列から、指定した文字が最後に出現する位置を検索する。比較では大文字と小文字を区別する。(Unicode)
%prm
pszStart, pszEnd, wMatch
pszStart : [wstr] 型: PTSTR 検索対象の NULL 終端文字列へのポインタ。
pszEnd : [wstr] 型: PCTSTR 検索範囲を定義する、元文字列内へのポインタ。pszEnd を文字列中のある文字を指すように設定すると、検索はその直前の文字で停止する。pszEnd を NULL に設定すると、文字列全体を検索する。
wMatch : [int] 型: TCHAR 検索する文字。
%inst
文字列から、指定した文字が最後に出現する位置を検索する。比較では大文字と小文字を区別する。(Unicode)

[戻り値]
型: PTSTR 成功した場合は、文字列中で最後に見つかった該当文字へのポインタを返す。見つからなかった場合は NULL を返す。

[備考]
比較では、pszEnd が文字列の末尾を指しているものとみなされる。
> [!NOTE] > shlwapi.h ヘッダーは StrRChr をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrRChrIA
文字列から、指定した文字が最後に出現する位置を検索する。比較では大文字と小文字を区別しない。(ANSI)
%prm
pszStart, pszEnd, wMatch
pszStart : [str] 型: PTSTR 検索対象の NULL 終端文字列へのポインタ。
pszEnd : [str] 型: PCTSTR 検索範囲を定義する、元文字列内へのポインタ。pszEnd を文字列中のある文字を指すように設定すると、検索はその直前の文字で停止する。pszEnd を NULL に設定すると、文字列全体を検索する。
wMatch : [int] 型: TCHAR 検索する文字。
%inst
文字列から、指定した文字が最後に出現する位置を検索する。比較では大文字と小文字を区別しない。(ANSI)

[戻り値]
型: PTSTR 成功した場合は、文字列中で最後に見つかった該当文字へのポインタを返す。見つからなかった場合は NULL を返す。

[備考]
比較では、pszEnd が文字列の末尾を指しているものとみなされる。
> [!NOTE] > shlwapi.h ヘッダーは StrRChrI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrRChrIW
文字列から、指定した文字が最後に出現する位置を検索する。比較では大文字と小文字を区別しない。(Unicode)
%prm
pszStart, pszEnd, wMatch
pszStart : [wstr] 型: PTSTR 検索対象の NULL 終端文字列へのポインタ。
pszEnd : [wstr] 型: PCTSTR 検索範囲を定義する、元文字列内へのポインタ。pszEnd を文字列中のある文字を指すように設定すると、検索はその直前の文字で停止する。pszEnd を NULL に設定すると、文字列全体を検索する。
wMatch : [int] 型: TCHAR 検索する文字。
%inst
文字列から、指定した文字が最後に出現する位置を検索する。比較では大文字と小文字を区別しない。(Unicode)

[戻り値]
型: PTSTR 成功した場合は、文字列中で最後に見つかった該当文字へのポインタを返す。見つからなかった場合は NULL を返す。

[備考]
比較では、pszEnd が文字列の末尾を指しているものとみなされる。
> [!NOTE] > shlwapi.h ヘッダーは StrRChrI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrRStrIA
文字列の中から、指定した部分文字列が最後に出現する位置を検索する。比較では大文字と小文字を区別しない。(ANSI)
%prm
pszSource, pszLast, pszSrch
pszSource : [str] 型: PTSTR NULL 終端された元文字列へのポインタ。
pszLast : [str] 型: PCTSTR 検索範囲を定義する、元文字列内へのポインタ。pszLast を元文字列中のある文字を指すように設定すると、検索はその直前の文字で停止する。pszLast を NULL に設定すると、元文字列全体を検索する。
pszSrch : [str] 型: PCTSTR 検索する部分文字列へのポインタ。
%inst
文字列の中から、指定した部分文字列が最後に出現する位置を検索する。比較では大文字と小文字を区別しない。(ANSI)

[戻り値]
型: PTSTR 成功した場合は、部分文字列が最後に出現した位置のアドレスを返す。見つからなかった場合は NULL を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrRStrI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrRStrIW
文字列の中から、指定した部分文字列が最後に出現する位置を検索する。比較では大文字と小文字を区別しない。(Unicode)
%prm
pszSource, pszLast, pszSrch
pszSource : [wstr] 型: PTSTR NULL 終端された元文字列へのポインタ。
pszLast : [wstr] 型: PCTSTR 検索範囲を定義する、元文字列内へのポインタ。pszLast を元文字列中のある文字を指すように設定すると、検索はその直前の文字で停止する。pszLast を NULL に設定すると、元文字列全体を検索する。
pszSrch : [wstr] 型: PCTSTR 検索する部分文字列へのポインタ。
%inst
文字列の中から、指定した部分文字列が最後に出現する位置を検索する。比較では大文字と小文字を区別しない。(Unicode)

[戻り値]
型: PTSTR 成功した場合は、部分文字列が最後に出現した位置のアドレスを返す。見つからなかった場合は NULL を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrRStrI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrStrW
文字列の中から、部分文字列が最初に出現する位置を検索する。比較では大文字と小文字を区別する。(StrStrW)
%prm
pszFirst, pszSrch
pszFirst : [wstr] 型: PTSTR 検索対象となる NULL 終端文字列へのポインタ。
pszSrch : [wstr] 型: PCTSTR 検索する部分文字列へのポインタ。
%inst
文字列の中から、部分文字列が最初に出現する位置を検索する。比較では大文字と小文字を区別する。(StrStrW)

[戻り値]
型: PTSTR 成功した場合は、一致する部分文字列が最初に出現した位置のアドレスを返す。見つからなかった場合は NULL を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrStr をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrStrIA
文字列の中から、部分文字列が最初に出現する位置を検索する。比較では大文字と小文字を区別しない。(ANSI)
%prm
pszFirst, pszSrch
pszFirst : [str] 型: PTSTR 検索対象となる NULL 終端文字列へのポインタ。
pszSrch : [str] 型: PCTSTR 検索する部分文字列へのポインタ。
%inst
文字列の中から、部分文字列が最初に出現する位置を検索する。比較では大文字と小文字を区別しない。(ANSI)

[戻り値]
型: PTSTR 成功した場合は、一致する部分文字列が最初に出現した位置のアドレスを返す。見つからなかった場合は NULL を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrStrI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
StrStrIW
文字列の中から、部分文字列が最初に出現する位置を検索する。比較では大文字と小文字を区別しない。(Unicode)
%prm
pszFirst, pszSrch
pszFirst : [wstr] 型: PTSTR 検索対象となる NULL 終端文字列へのポインタ。
pszSrch : [wstr] 型: PCTSTR 検索する部分文字列へのポインタ。
%inst
文字列の中から、部分文字列が最初に出現する位置を検索する。比較では大文字と小文字を区別しない。(Unicode)

[戻り値]
型: PTSTR 成功した場合は、一致する部分文字列が最初に出現した位置のアドレスを返す。見つからなかった場合は NULL を返す。

[備考]
> [!NOTE] > shlwapi.h ヘッダーは StrStrI をエイリアスとして定義しており、UNICODE
プリプロセッサ定数の定義に応じて、この関数の ANSI 版または Unicode
版が自動的に選択される。エンコーディング中立のエイリアスと、エンコーディング中立でないコードを混在させると、コンパイルエラーや実行時エラーを引き起こす不整合が生じることがある。詳細については
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。

