%dll
; iron_datetime 日付/時刻操作
%ver
3.8
%date
2026/04/16
%author
IronHSP
%note
Win32 SYSTEMTIME。外部DLL不要。
%type
ユーザー定義命令
%group
日付/時刻

%index
datetime_now
現在日時を返す
%prm
()
%inst
"YYYY-MM-DD HH:MM:SS" 形式の文字列を返す。
%href
date_today

%index
date_today
今日の日付を返す
%prm
()
%inst
"YYYY-MM-DD" 形式。
%href
time_now

%index
time_now
現在時刻を返す
%prm
()
%inst
"HH:MM:SS" 形式。
%href
datetime_year

%index
datetime_year
年を返す
%prm
()
%inst

%href
datetime_month

%index
datetime_month
月を返す
%prm
()
%inst

%href
datetime_day

%index
datetime_day
日を返す
%prm
()
%inst

%href
datetime_hour

%index
datetime_hour
時を返す
%prm
()
%inst

%href
datetime_minute

%index
datetime_minute
分を返す
%prm
()
%inst

%href
datetime_second

%index
datetime_second
秒を返す
%prm
()
%inst

%href
datetime_weekday

%index
datetime_weekday
曜日を返す
%prm
()
%inst
0=日, 1=月, ..., 6=土
%href
datetime_unix

%index
datetime_unix
Unixタイムスタンプを返す
%prm
()
%inst
1970-01-01からの秒数。
%href
uptime_ms

%index
uptime_ms
起動からの経過ミリ秒
%prm
()
%inst
GetTickCount64 ベース。
