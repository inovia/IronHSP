; ============================================================
;   winmm.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
timeBeginPeriod
timeBeginPeriod 関数は周期タイマーの最小分解能を要求する。
%group
Win32 winmm
%prm
uPeriod
uPeriod : [int] アプリケーションまたはデバイスドライバの最小タイマー分解能(ミリ秒単位)。小さい値ほど高い(より正確な)分解能を指定する。
%inst
timeBeginPeriod 関数は周期タイマーの最小分解能を要求する。

[戻り値]
成功時は TIMERR_NOERROR、uPeriod が範囲外の場合は TIMERR_NOCANDO を返す。

[備考]
タイマーサービス利用直前に呼び出し、使用終了直後に timeEndPeriod を呼ぶこと。各 timeBeginPeriod
呼び出しは同じ最小分解能を指定した timeEndPeriod 呼び出しと対にする必要がある。Windows 10 version
2004 より前ではグローバル設定に影響し、OS は全プロセスの最低値(最高分解能)を使用していた。Windows 10 version
2004 以降はグローバルタイマー分解能には影響せず、呼び出したプロセスにのみ適用される。Windows 11
以降、完全に隠れた/最小化された/非可視・非可聴のウィンドウ所有プロセスについては既定のシステム分解能以上を保証しない。高分解能はタイムアウト精度を向上させるが、全体のシステム性能を低下させる可能性がある。また、CPU
の電源管理が省電力モードに入れなくなる場合もある。高分解能パフォーマンスカウンタの精度は向上しない。


%index
timeEndPeriod
timeEndPeriod 関数は以前設定した最小タイマー分解能をクリアする。
%group
Win32 winmm
%prm
uPeriod
uPeriod : [int] 以前の timeBeginPeriod 呼び出しで指定した最小タイマー分解能。
%inst
timeEndPeriod 関数は以前設定した最小タイマー分解能をクリアする。

[戻り値]
成功時は TIMERR_NOERROR、uPeriod が範囲外の場合は TIMERR_NOCANDO を返す。

[備考]
タイマーサービス使用終了直後に呼び出す。各 timeBeginPeriod 呼び出しは同じ最小分解能を指定した timeEndPeriod
と対にする必要がある。


%index
timeGetDevCaps
timeGetDevCaps 関数はタイマデバイスに問い合わせてその分解能を判定する。
%group
Win32 winmm
%prm
ptc, cbtc
ptc : [var] TIMECAPS 構造体へのポインタ。この構造体にタイマデバイスの分解能に関する情報が格納される。
cbtc : [int] TIMECAPS 構造体のサイズ (バイト単位)。
%inst
timeGetDevCaps 関数はタイマデバイスに問い合わせてその分解能を判定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーコードを返す。考えられるエラーコードは次のとおり。
（以下省略）


%index
timeGetSystemTime
timeGetSystemTime 関数はシステム時刻をミリ秒単位で取得する。
%group
Win32 winmm
%prm
pmmt, cbmmt
pmmt : [var] MMTIME 構造体へのポインタ。
cbmmt : [int] MMTIME 構造体のサイズ (バイト単位)。
%inst
timeGetSystemTime 関数はシステム時刻をミリ秒単位で取得する。

[戻り値]
成功時は TIMERR_NOERROR を返す。それ以外の場合はエラーコードを返す。

[備考]
システム時刻は MMTIME 構造体の ms メンバに返される。


%index
timeGetTime
timeGetTime 関数はシステム時刻(Windows 起動からの経過時間)をミリ秒単位で取得する。
%group
Win32 winmm
%prm

%inst
timeGetTime 関数はシステム時刻(Windows 起動からの経過時間)をミリ秒単位で取得する。

[戻り値]
システム時刻(ミリ秒単位)を返す。

[備考]
timeGetSystemTime との違いは、timeGetSystemTime が MMTIME
構造体でシステム時刻を返すのに対し本関数は DWORD で返す点のみ。timeGetTime のほうがオーバーヘッドが少ない。戻り値は
DWORD であり 2^32 ミリ秒(約 49.71 日)で 0 に折り返すため、時刻計算ではなく 2 つの timeGetTime
戻り値の差分を使うこと。既定精度はマシンにより 5 ms 以上のこともあるため、必要に応じて
timeBeginPeriod/timeEndPeriod で精度を上げること。短時間の高精度計測には
QueryPerformanceCounter/QueryPerformanceFrequency を使う。


%index
CloseDriver
インストール可能ドライバを閉じる。
%group
Win32 winmm
%prm
hDriver, lParam1, lParam2
hDriver : [intptr] インストール可能ドライバインスタンスのハンドル。OpenDriver 関数によって事前に作成されたハンドルでなければならない。
lParam1 : [intptr] 32 ビットのドライバ固有データ。
lParam2 : [intptr] 32 ビットのドライバ固有データ。
%inst
インストール可能ドライバを閉じる。

[戻り値]
成功時は非ゼロを、それ以外の場合は 0 を返す。

[備考]
本関数は lParam1 および lParam2 パラメータをインストール可能ドライバの DriverProc 関数に渡す。


%index
DefDriverProc
インストール可能ドライバが処理しないメッセージに対する既定の処理を提供する。本関数はインストール可能ドライバの DriverProc 関数内でのみ使用することを想定している。(DefDriverProc)
%group
Win32 winmm
%prm
dwDriverIdentifier, hdrvr, uMsg, lParam1, lParam2
dwDriverIdentifier : [int] インストール可能ドライバの識別子。
hdrvr : [intptr] インストール可能ドライバインスタンスのハンドル。
uMsg : [int] ドライバメッセージ値。
lParam1 : [intptr] 32 ビットのメッセージ依存情報。
lParam2 : [intptr] 32 ビットのメッセージ依存情報。
%inst
インストール可能ドライバが処理しないメッセージに対する既定の処理を提供する。本関数はインストール可能ドライバの DriverProc
関数内でのみ使用することを想定している。(DefDriverProc)

[戻り値]
成功時は非ゼロを、それ以外の場合は 0 を返す。


%index
DriverCallback
コールバック関数を呼び出すか、ウィンドウにメッセージを送信するか、スレッドのブロックを解除する。動作は通知フラグの値に依存する。本関数はインストール可能ドライバの DriverProc 関数内でのみ使用することを想定している。
%group
Win32 winmm
%prm
dwCallback, dwFlags, hDevice, dwMsg, dwUser, dwParam1, dwParam2
dwCallback : [int] コールバック関数のアドレス、ウィンドウハンドル、またはタスクハンドル。dwFlags パラメータで指定されたフラグに応じて意味が変わる。
dwFlags : [int] 通知フラグ。次のいずれかの値を指定できる。
hDevice : [intptr] インストール可能ドライバインスタンスのハンドル。
dwMsg : [int] メッセージ値。
dwUser : [int] デバイスがオープンされたときにアプリケーションから供給された 32 ビットのユーザインスタンスデータ。
dwParam1 : [int] 32 ビットのメッセージ依存パラメータ。
dwParam2 : [int] 32 ビットのメッセージ依存パラメータ。
%inst

コールバック関数を呼び出すか、ウィンドウにメッセージを送信するか、スレッドのブロックを解除する。動作は通知フラグの値に依存する。本関数はインストール可能ドライバの
DriverProc 関数内でのみ使用することを想定している。

[戻り値]
成功時は TRUE を返す。パラメータが無効、またはタスクのメッセージキューがいっぱいの場合は FALSE を返す。

[備考]
クライアントはデバイスがオープンされたときの通知方法を指定する。DCB_FUNCTION および DCB_WINDOW
フラグは、デバイスがオープンされたときに DRV_OPEN メッセージの lParam2 パラメータで指定された対応するフラグ
CALLBACK_FUNCTION および CALLBACK_WINDOW
の上位ワードと等価である。コールバック関数による通知が行われる場合、hdrvr、msg、dwUser、dwParam1、dwParam2
がコールバック関数に渡される。ウィンドウによる通知が行われる場合、msg、hdrvr、dwParam1 のみがウィンドウに渡される。


%index
DrvGetModuleHandle
インストール可能ドライバを含むモジュールのインスタンスハンドルを取得する。本関数は以前のバージョンの Windows との互換性のために提供されている。
%group
Win32 winmm
%prm
hDriver
hDriver : [intptr] インストール可能ドライバインスタンスのハンドル。OpenDriver 関数によって事前に作成されたハンドルでなければならない。
%inst
インストール可能ドライバを含むモジュールのインスタンスハンドルを取得する。本関数は以前のバージョンの Windows
との互換性のために提供されている。

[戻り値]
成功時はドライバモジュールのインスタンスハンドルを、失敗時は NULL を返す。


%index
GetDriverModuleHandle
インストール可能ドライバを含むモジュールのインスタンスハンドルを取得する。
%group
Win32 winmm
%prm
hDriver
hDriver : [intptr] インストール可能ドライバインスタンスのハンドル。OpenDriver 関数によって事前に作成されたハンドルでなければならない。
%inst
インストール可能ドライバを含むモジュールのインスタンスハンドルを取得する。

[戻り値]
成功時はドライバモジュールのインスタンスハンドルを、失敗時は NULL を返す。


%index
OpenDriver
インストール可能ドライバのインスタンスをオープンし、ドライバ既定の設定またはドライバ固有値のいずれかを用いてインスタンスを初期化する。
%group
Win32 winmm
%prm
szDriverName, szSectionName, lParam2
szDriverName : [wstr] インストール可能ドライバのファイル名、またはインストール可能ドライバに関連付けられたレジストリ値の名前を指定する null 終端のワイド文字列のアドレス。(この値はドライバがインストールされたときにあらかじめ設定されている必要がある。)
szSectionName : [wstr] lpDriverName パラメータで指定されたレジストリ値を含むレジストリキーの名前を指定する null 終端のワイド文字列のアドレス。lpSectionName が NULL の場合、レジストリキーは Drivers32 と仮定される。
lParam2 : [intptr] 32 ビットのドライバ固有値。この値はインストール可能ドライバの DriverProc 関数の lParam2 パラメータとして渡される。
%inst
インストール可能ドライバのインスタンスをオープンし、ドライバ既定の設定またはドライバ固有値のいずれかを用いてインスタンスを初期化する。

[戻り値]
成功時はインストール可能ドライバインスタンスのハンドルを、失敗時は NULL を返す。


%index
PlaySoundW
(no summary)
%group
Win32 winmm
%prm
pszSound, hmod, fdwSound
pszSound : [wstr] 
hmod : [intptr] 
fdwSound : [int] 
%inst



%index
SendDriverMessage
指定したメッセージをインストール可能ドライバに送信する。
%group
Win32 winmm
%prm
hDriver, message, lParam1, lParam2
hDriver : [intptr] インストール可能ドライバインスタンスのハンドル。OpenDriver 関数によって事前に作成されたハンドルでなければならない。
message : [int] ドライバメッセージ値。カスタムメッセージ値、または次の標準メッセージ値のいずれかを指定できる。
lParam1 : [intptr] 32 ビットのメッセージ依存情報。
lParam2 : [intptr] 32 ビットのメッセージ依存情報。
%inst
指定したメッセージをインストール可能ドライバに送信する。

[戻り値]
成功時は非ゼロを、それ以外の場合は 0 を返す。


%index
auxGetDevCapsW
auxGetDevCapsW (Unicode) 関数 (mmeapi.h) は指定された補助出力デバイスの機能を取得する。
%group
Win32 winmm
%prm
uDeviceID, pac, cbac
uDeviceID : [int] 問い合わせ対象の補助出力デバイスの識別子。有効なデバイス識別子 (後述の解説を参照) を指定するか、次の定数を使用する。
pac : [var] デバイスの機能に関する情報が格納される AUXCAPS 構造体へのポインタ。
cbac : [int] AUXCAPS 構造体のサイズ (バイト単位)。
%inst
auxGetDevCapsW (Unicode) 関数 (mmeapi.h) は指定された補助出力デバイスの機能を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
uDeviceID のデバイス識別子は 0 から存在するデバイスの数より 1 少ない値までの範囲となる。AUX_MAPPER
も使用できる。システムに存在する補助出力デバイスの数を判定するには auxGetNumDevs 関数を使用する。
> [!NOTE] > mmeapi.h ヘッダは auxGetDevCaps をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
auxGetNumDevs
auxGetNumDevs 関数はシステムに存在する補助出力デバイスの数を取得する。
%group
Win32 winmm
%prm

%inst
auxGetNumDevs 関数はシステムに存在する補助出力デバイスの数を取得する。

[戻り値]
デバイスの数を返す。戻り値が 0 の場合はデバイスが存在しないか、エラーが発生したことを意味する。


%index
auxGetVolume
auxGetVolume 関数は指定された補助出力デバイスの現在の音量設定を取得する。
%group
Win32 winmm
%prm
uDeviceID, pdwVolume
uDeviceID : [int] 問い合わせ対象の補助出力デバイスの識別子。
pdwVolume : [var] 現在の音量設定が格納される変数へのポインタ。下位ワードに左チャネルの音量設定が、上位ワードに右チャネルの設定が格納される。0xFFFF が最大音量、0x0000 が無音を表す。デバイスが左右両チャネルの音量制御をサポートしていない場合、指定された場所の下位ワードに音量レベルが格納される。auxSetVolume 関数で設定した完全な 16 ビットの値が、デバイスが 16 ビット全ての音量制御をサポートしているかどうかにかかわらず返される。
%inst
auxGetVolume 関数は指定された補助出力デバイスの現在の音量設定を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
全てのデバイスが音量制御をサポートしているわけではない。デバイスが音量制御をサポートしているかを判定するには、AUXCAPS_VOLUME
フラグを用いて (auxGetDevCaps 関数で取得した) AUXCAPS 構造体の dwSupport
メンバをテストする。デバイスが左右両チャネルの音量制御をサポートしているかを判定するには、AUXCAPS_LRVOLUME フラグを用いて
AUXCAPS 構造体の dwSupport メンバをテストする。


%index
auxOutMessage
auxOutMessage 関数は指定した補助出力デバイスにメッセージを送信する。本関数はメッセージの一部として渡されたデバイス識別子に対するエラーチェックも行う。
%group
Win32 winmm
%prm
uDeviceID, uMsg, dw1, dw2
uDeviceID : [int] メッセージを受け取る補助出力デバイスの識別子。
uMsg : [int] 送信するメッセージ。
dw1 : [int] メッセージパラメータ。
dw2 : [int] メッセージパラメータ。
%inst
auxOutMessage
関数は指定した補助出力デバイスにメッセージを送信する。本関数はメッセージの一部として渡されたデバイス識別子に対するエラーチェックも行う。

[戻り値]
メッセージの戻り値を返す。

[備考]
DRV_QUERYDEVICEINTERFACE メッセージは、waveIn、waveOut、midiIn、midiOut、または
mixer デバイスのデバイスインターフェイス名を問い合わせる。DRV_QUERYDEVICEINTERFACE では、dwParam1
はデバイスインターフェイス名を含む null 終端の Unicode
文字列を関数が書き込む呼び出し側割り当てバッファへのポインタである。デバイスにデバイスインターフェイスがない場合、文字列長は 0
となる。DRV_QUERYDEVICEINTERFACE では、dwParam2
はバッファサイズをバイト単位で指定する。これは関数への入力パラメータである。呼び出し側は
DRV_QUERYDEVICEINTERFACESIZE
メッセージで取得したバッファサイズ以上のサイズを指定するべきである。DRV_QUERYDEVICEINTERFACE メッセージは
Windows Me、Windows 2000 以降でサポートされる。このメッセージは
waveInMessage、waveOutMessage、midiInMessage、midiOutMessage、mixerMessage
関数でのみ有効である。システムはこのメッセージを傍受し、デバイスドライバへ送信せずに適切な値を返す。システム傍受 xxxMessage
関数の一般情報については System-Intercepted Device Messages
を参照。デバイスインターフェイス名の取得を目的として、次の 2 つのメッセージ定数が一緒に使用される。
（以下省略）


%index
auxSetVolume
auxSetVolume 関数は指定された補助出力デバイスの音量を設定する。
%group
Win32 winmm
%prm
uDeviceID, dwVolume
uDeviceID : [int] 問い合わせ対象の補助出力デバイスの識別子。デバイス識別子はシステムに存在するデバイスの数から暗黙的に決定される。デバイス識別子の値は 0 から存在するデバイスの数より 1 少ない値までの範囲となる。システム内の補助デバイスの数を判定するには auxGetNumDevs 関数を使用する。
dwVolume : [int] 新しい音量設定を指定する。下位ワードに左チャネルの音量設定を、上位ワードに右チャネルの設定を指定する。0xFFFF が最大音量、0x0000 が無音を表す。デバイスが左右両チャネルの音量制御をサポートしていない場合、dwVolume の下位ワードで音量レベルを指定し、上位ワードは無視される。
%inst
auxSetVolume 関数は指定された補助出力デバイスの音量を設定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
全てのデバイスが音量制御をサポートしているわけではない。デバイスが音量制御をサポートしているかを判定するには、AUXCAPS_VOLUME
フラグを用いて (auxGetDevCaps 関数で取得した) AUXCAPS 構造体の dwSupport
メンバをテストする。デバイスが左右両チャネルの音量制御をサポートしているかを判定するには、AUXCAPS_LRVOLUME フラグを用いて
AUXCAPS 構造体の dwSupport メンバをテストする。ほとんどのデバイスは 16
ビット全ての音量レベル制御をサポートしておらず、要求された音量設定の上位ビットのみを使用する。例えば 4
ビットの音量制御をサポートするデバイスでは、要求音量レベル値 0x4000、0x4FFF、0x43BE は同じ物理音量設定 0x4000
を生成する。auxGetVolume 関数は auxSetVolume で設定された完全な 16
ビット値を返す。音量設定は対数的に解釈される。これは音量レベルを 0x5000 から 0x6000 に上げたときと 0x4000 から
0x5000 に上げたときの音量増加が同じように知覚されることを意味する。


%index
joyConfigChanged
joyConfigChanged 関数はジョイスティックドライバに対し設定が変更されたためレジストリから再読み込みが必要であることを通知する。
%group
Win32 winmm
%prm
dwFlags
dwFlags : [int] 将来の使用のために予約されている。0 でなければならない。
%inst
joyConfigChanged
関数はジョイスティックドライバに対し設定が変更されたためレジストリから再読み込みが必要であることを通知する。

[戻り値]
成功時は JOYERR_NOERROR を返す。パラメータが非ゼロの場合は JOYERR_PARMS を返す。

[備考]

本関数は全てのトップレベルウィンドウへウィンドウメッセージを送信する。このメッセージはジョイスティックのキャリブレーション変更に応答する必要があるアプリケーションが、次のメッセージ
ID を指定して RegisterWindowMessage で定義することができる。
（以下省略）


%index
joyGetDevCapsW
joyGetDevCapsW (Unicode) 関数はジョイスティックに問い合わせて、その包括的な機能を判定する。
%group
Win32 winmm
%prm
uJoyID, pjc, cbjc
uJoyID : [int] 問い合わせ対象のジョイスティックの識別子。uJoyID の有効値は -1 から 15 までの範囲。-1 を指定すると、デバイスの有無にかかわらず JOYCAPS 構造体の szRegKey メンバを取得できる。
pjc : [var] ジョイスティックの機能を格納する JOYCAPS 構造体へのポインタ。
cbjc : [int] JOYCAPS 構造体のサイズ (バイト単位)。
%inst
joyGetDevCapsW (Unicode) 関数はジョイスティックに問い合わせて、その包括的な機能を判定する。

[戻り値]
成功時は JOYERR_NOERROR を、失敗時は次のいずれかのエラー値を返す。
（以下省略）

[備考]
ドライバがサポートするジョイスティックデバイスの数を判定するには joyGetNumDevs 関数を使用する。
このメソッドは cbjc パラメータに無効な値が渡された場合に失敗する。
> [!NOTE] > joystickapi.h ヘッダは joyGetDevCaps をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
joyGetNumDevs
joyGetNumDevs 関数はジョイスティックドライバに対しサポートするジョイスティックの数を問い合わせる。
%group
Win32 winmm
%prm

%inst
joyGetNumDevs 関数はジョイスティックドライバに対しサポートするジョイスティックの数を問い合わせる。

[戻り値]
joyGetNumDevs 関数は現在のドライバがサポートするジョイスティックの数を返す。ドライバがインストールされていない場合は 0
を返す。

[備考]
指定したジョイスティックがシステムに物理的に接続されているかを判定するには joyGetPos
関数を使用する。指定されたジョイスティックが接続されていない場合、joyGetPos は JOYERR_UNPLUGGED
エラー値を返す。


%index
joyGetPos
joyGetPos 関数はジョイスティックの位置およびボタン状態を問い合わせる。
%group
Win32 winmm
%prm
uJoyID, pji
uJoyID : [int] 問い合わせ対象のジョイスティックの識別子。uJoyID の有効値は 0 (JOYSTICKID1) から 15 までの範囲。
pji : [var] ジョイスティックの位置およびボタン状態を含む JOYINFO 構造体へのポインタ。
%inst
joyGetPos 関数はジョイスティックの位置およびボタン状態を問い合わせる。

[戻り値]
成功時は JOYERR_NOERROR を、失敗時は次のいずれかのエラー値を返す。
（以下省略）

[備考]
4 から 6 軸の動き、ポイントオブビューコントロール、または 4 個を超えるボタンを持つデバイスについては joyGetPosEx
関数を使用する。


%index
joyGetPosEx
joyGetPosEx 関数はジョイスティックの位置およびボタン状態を問い合わせる。
%group
Win32 winmm
%prm
uJoyID, pji
uJoyID : [int] 問い合わせ対象のジョイスティックの識別子。uJoyID の有効値は 0 (JOYSTICKID1) から 15 までの範囲。
pji : [var] ジョイスティックの拡張位置情報およびボタン状態を含む JOYINFOEX 構造体へのポインタ。dwSize および dwFlags メンバを設定する必要がある。設定しないと joyGetPosEx は失敗する。joyGetPosEx から返される情報は dwFlags で指定するフラグに依存する。
%inst
joyGetPosEx 関数はジョイスティックの位置およびボタン状態を問い合わせる。

[戻り値]
成功時は JOYERR_NOERROR を、失敗時は次のいずれかのエラー値を返す。
（以下省略）

[備考]
本関数はラダーペダル、ポイントオブビューハット、多数のボタンを持つデバイス、最大 6
軸を使用する座標系などの拡張デバイスへのアクセスを提供する。3 軸以下で 4 個未満のボタンを使用するジョイスティックデバイスについては
joyGetPos 関数を使用する。


%index
joyGetThreshold
joyGetThreshold 関数はジョイスティックの現在の移動しきい値を問い合わせる。
%group
Win32 winmm
%prm
uJoyID, puThreshold
uJoyID : [int] ジョイスティックの識別子。uJoyID の有効値は 0 (JOYSTICKID1) から 15 までの範囲。
puThreshold : [var] 移動しきい値が格納される変数へのポインタ。
%inst
joyGetThreshold 関数はジョイスティックの現在の移動しきい値を問い合わせる。

[戻り値]
成功時は JOYERR_NOERROR を、失敗時は次のいずれかのエラー値を返す。
（以下省略）

[備考]
移動しきい値とは、デバイスをキャプチャしたウィンドウへジョイスティック位置変更メッセージ
(MM_JOY1MOVE、MM_JOY1ZMOVE、MM_JOY2MOVE、MM_JOY2ZMOVE)
が送信される前にジョイスティックを動かさなければならない距離である。しきい値は初期状態では 0 である。


%index
joyReleaseCapture
joyReleaseCapture 関数は指定したキャプチャ済みジョイスティックを解放する。
%group
Win32 winmm
%prm
uJoyID
uJoyID : [int] 解放対象のジョイスティックの識別子。uJoyID の有効値は 0 (JOYSTICKID1) から 15 までの範囲。
%inst
joyReleaseCapture 関数は指定したキャプチャ済みジョイスティックを解放する。

[戻り値]
成功時は JOYERR_NOERROR を、失敗時は次のいずれかのエラー値を返す。
（以下省略）

[備考]
このメソッドはキャプチャされていない有効なジョイスティック識別子が渡された場合 JOYERR_NOERROR を返す。


%index
joySetCapture
joySetCapture 関数はジョイスティックをキャプチャし、そのメッセージを指定したウィンドウに送信する。
%group
Win32 winmm
%prm
hwnd, uJoyID, uPeriod, fChanged
hwnd : [intptr] ジョイスティックメッセージを受け取るウィンドウへのハンドル。
uJoyID : [int] キャプチャ対象のジョイスティックの識別子。uJoyID の有効値は 0 (JOYSTICKID1) から 15 までの範囲。
uPeriod : [int] ポーリング頻度 (ミリ秒単位)。
fChanged : [int] 位置変更フラグ。位置がジョイスティック移動しきい値より大きい値で変化した場合のみメッセージを送信するには TRUE を指定する。それ以外の場合は uPeriod で指定したポーリング頻度でメッセージが送信される。
%inst
joySetCapture 関数はジョイスティックをキャプチャし、そのメッセージを指定したウィンドウに送信する。

[戻り値]
成功時は JOYERR_NOERROR を、失敗時は次のいずれかのエラー値を返す。
（以下省略）

[備考]
指定したジョイスティックが現在キャプチャ済みの場合、本関数の動作は未定義となる。キャプチャされたジョイスティックを解放するには
joyReleaseCapture 関数を呼び出すか、ウィンドウを破棄して自動的にジョイスティックを解放する。


%index
joySetThreshold
joySetThreshold 関数はジョイスティックの移動しきい値を設定する。
%group
Win32 winmm
%prm
uJoyID, uThreshold
uJoyID : [int] ジョイスティックの識別子。uJoyID の有効値は 0 (JOYSTICKID1) から 15 までの範囲。
uThreshold : [int] 新しい移動しきい値。
%inst
joySetThreshold 関数はジョイスティックの移動しきい値を設定する。

[戻り値]
成功時は JOYERR_NOERROR を、失敗時は次のいずれかのエラー値を返す。
（以下省略）

[備考]
移動しきい値とは、デバイスをキャプチャしたウィンドウへジョイスティック位置変更メッセージ
(MM_JOY1MOVE、MM_JOY1ZMOVE、MM_JOY2MOVE、MM_JOY2ZMOVE)
が送信される前にジョイスティックを動かさなければならない距離である。しきい値は初期状態では 0 である。


%index
mciDriverNotify
(no summary)
%group
Win32 winmm
%prm
hwndCallback, wDeviceID, uStatus
hwndCallback : [intptr] 
wDeviceID : [int] 
uStatus : [int] 
%inst



%index
mciDriverYield
(no summary)
%group
Win32 winmm
%prm
wDeviceID
wDeviceID : [int] 
%inst



%index
mciFreeCommandResource
(no summary)
%group
Win32 winmm
%prm
wTable
wTable : [int] 
%inst



%index
mciGetCreatorTask
(no summary)
%group
Win32 winmm
%prm
mciId
mciId : [int] 
%inst



%index
mciGetDeviceIDA
(no summary)
%group
Win32 winmm
%prm
pszDevice
pszDevice : [str] 
%inst



%index
mciGetDeviceIDFromElementIDA
(no summary)
%group
Win32 winmm
%prm
dwElementID, lpstrType
dwElementID : [int] 
lpstrType : [str] 
%inst



%index
mciGetDeviceIDFromElementIDW
(no summary)
%group
Win32 winmm
%prm
dwElementID, lpstrType
dwElementID : [int] 
lpstrType : [wstr] 
%inst



%index
mciGetDeviceIDW
(no summary)
%group
Win32 winmm
%prm
pszDevice
pszDevice : [wstr] 
%inst



%index
mciGetDriverData
(no summary)
%group
Win32 winmm
%prm
wDeviceID
wDeviceID : [int] 
%inst



%index
mciGetErrorStringW
(no summary)
%group
Win32 winmm
%prm
mcierr, pszText, cchText
mcierr : [int] 
pszText : [wstr] 
cchText : [int] 
%inst



%index
mciLoadCommandResource
(no summary)
%group
Win32 winmm
%prm
hInstance, lpResName, wType
hInstance : [intptr] 
lpResName : [wstr] 
wType : [int] 
%inst



%index
mciSendCommandW
(no summary)
%group
Win32 winmm
%prm
mciId, uMsg, dwParam1, dwParam2
mciId : [int] 
uMsg : [int] 
dwParam1 : [int] 
dwParam2 : [int] 
%inst



%index
mciSendStringW
(no summary)
%group
Win32 winmm
%prm
lpstrCommand, lpstrReturnString, uReturnLength, hwndCallback
lpstrCommand : [wstr] 
lpstrReturnString : [wstr] 
uReturnLength : [int] 
hwndCallback : [intptr] 
%inst



%index
mciSetDriverData
(no summary)
%group
Win32 winmm
%prm
wDeviceID, dwData
wDeviceID : [int] 
dwData : [int] 
%inst



%index
mciSetYieldProc
(no summary)
%group
Win32 winmm
%prm
mciId, fpYieldProc, dwYieldData
mciId : [int] 
fpYieldProc : [int] 
dwYieldData : [int] 
%inst



%index
midiOutClose
midiOutClose 関数は指定された MIDI 出力デバイスを閉じる。
%group
Win32 winmm
%prm
hmo
hmo : [intptr] MIDI 出力デバイスへのハンドル。本関数が成功した場合、このハンドルは呼び出し後に有効ではなくなる。
%inst
midiOutClose 関数は指定された MIDI 出力デバイスを閉じる。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
midiOutLongMsg
関数を使用して送信した出力バッファのうちアプリケーションへ返されていないものがある場合、クローズ操作は失敗する。保留中の全バッファを完了とマークするには
midiOutReset 関数を使用する。


%index
midiConnect
midiConnect 関数は MIDI 入力デバイスを MIDI スルーまたは出力デバイスへ接続する、あるいは MIDI スルーデバイスを MIDI 出力デバイスへ接続する。
%group
Win32 winmm
%prm
hmi, hmo, pReserved
hmi : [intptr] MIDI 入力デバイスまたは MIDI スルーデバイスへのハンドル。(スルーデバイスの場合、このハンドルは midiOutOpen 関数の呼び出しによって返されたものでなければならない。)
hmo : [intptr] MIDI 出力またはスルーデバイスへのハンドル。
pReserved : [intptr] 予約。NULL でなければならない。
%inst
midiConnect 関数は MIDI 入力デバイスを MIDI スルーまたは出力デバイスへ接続する、あるいは MIDI
スルーデバイスを MIDI 出力デバイスへ接続する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数を呼び出した後は、MIDI 入力デバイスが MIM_DATA
メッセージでイベントデータを受け取るたびに、同じイベントデータを持つメッセージが出力デバイスドライバへ送信される。スルードライバは
MIDI 出力ドライバの特殊な形態である。システムは 1 つの MIDI 出力デバイスのみが MIDI
入力デバイスへ接続されることを許可するが、複数の MIDI 出力デバイスを MIDI スルーデバイスへ接続できる。指定された MIDI
入力デバイスが MIM_DATA
メッセージでイベントデータを受け取るたびに、同じイベントデータを持つメッセージが指定された出力デバイスドライバ
(またはスルードライバを介して出力ドライバ) へ送信される。


%index
midiDisconnect
midiDisconnect 関数は MIDI 入力デバイスを MIDI スルーまたは出力デバイスから切断する、あるいは MIDI スルーデバイスを MIDI 出力デバイスから切断する。
%group
Win32 winmm
%prm
hmi, hmo, pReserved
hmi : [intptr] MIDI 入力デバイスまたは MIDI スルーデバイスへのハンドル。
hmo : [intptr] 切断対象の MIDI 出力デバイスへのハンドル。
pReserved : [intptr] 予約。NULL でなければならない。
%inst
midiDisconnect 関数は MIDI 入力デバイスを MIDI スルーまたは出力デバイスから切断する、あるいは MIDI
スルーデバイスを MIDI 出力デバイスから切断する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
MIDI 入力、出力、スルーデバイスは midiConnect 関数を使用して接続できる。その後、MIDI 入力デバイスが
MIM_DATA メッセージでイベントデータを受け取るたびに、同じイベントデータを持つメッセージが出力デバイスドライバ
(またはスルードライバを介して出力ドライバ) へ送信される。


%index
midiInClose
midiInClose 関数は指定された MIDI 入力デバイスを閉じる。
%group
Win32 winmm
%prm
hmi
hmi : [intptr] MIDI 入力デバイスへのハンドル。本関数が成功した場合、このハンドルは呼び出し後に有効ではなくなる。
%inst
midiInClose 関数は指定された MIDI 入力デバイスを閉じる。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
midiInAddBuffer
関数を使用して送信した入力バッファのうちアプリケーションへ返されていないものがある場合、クローズ操作は失敗する。保留中の全バッファをコールバック関数経由で返すには
midiInReset 関数を使用する。


%index
midiInAddBuffer
midiInAddBuffer 関数は指定されたオープン済み MIDI 入力デバイスへ入力バッファを送信する。本関数はシステムエクスクルーシブメッセージに使用される。
%group
Win32 winmm
%prm
hmi, pmh, cbmh
hmi : [intptr] MIDI 入力デバイスへのハンドル。
pmh : [var] バッファを識別する MIDIHDR 構造体へのポインタ。
cbmh : [int] MIDIHDR 構造体のサイズ (バイト単位)。
%inst
midiInAddBuffer 関数は指定されたオープン済み MIDI
入力デバイスへ入力バッファを送信する。本関数はシステムエクスクルーシブメッセージに使用される。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
バッファが満たされると、アプリケーションへ返される。バッファは midiInAddBuffer 関数に渡される前に
midiInPrepareHeader 関数で準備されている必要がある。


%index
midiInGetDevCapsW
midiInGetDevCapsW (Unicode) 関数 (mmeapi.h) は指定された MIDI 入力デバイスの機能を判定する。
%group
Win32 winmm
%prm
uDeviceID, pmic, cbmic
uDeviceID : [int] MIDI 入力デバイスの識別子。デバイス識別子は 0 から存在するデバイスの数より 1 少ない値までの範囲となる。このパラメータは適切にキャストされたデバイスハンドルでもよい。
pmic : [var] デバイスの機能に関する情報が格納される MIDIINCAPS 構造体へのポインタ。
cbmic : [int] MIDIINCAPS 構造体のサイズ (バイト単位)。lpMidiInCaps が指す場所には cbMidiInCaps バイト (またはそれ以下) の情報のみコピーされる。cbMidiInCaps が 0 の場合は何もコピーされず、関数は MMSYSERR_NOERROR を返す。
%inst
midiInGetDevCapsW (Unicode) 関数 (mmeapi.h) は指定された MIDI 入力デバイスの機能を判定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
システムに存在する MIDI 入力デバイスの数を判定するには midiInGetNumDevs 関数を使用する。
> [!NOTE] > mmeapi.h ヘッダは midiInGetDevCaps をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
midiInGetErrorTextW
midiInGetErrorTextW (Unicode) 関数 (mmeapi.h) は指定したエラーコードで識別されるエラーのテキスト形式の説明を取得する。
%group
Win32 winmm
%prm
mmrError, pszText, cchText
mmrError : [int] エラーコード。
pszText : [wstr] テキスト形式のエラー説明が格納されるバッファへのポインタ。
cchText : [int] lpText が指すバッファの長さ (文字単位)。
%inst
midiInGetErrorTextW (Unicode) 関数 (mmeapi.h)
は指定したエラーコードで識別されるエラーのテキスト形式の説明を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
テキスト形式のエラー説明が指定したバッファより長い場合、説明は切り詰められる。返されるエラー文字列は常に null
終端される。cchText が 0 の場合は何もコピーされず、関数は 0 を返す。全てのエラー説明は MAXERRORLENGTH
文字未満の長さである。
> [!NOTE] > mmeapi.h ヘッダは midiInGetErrorText をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
midiInGetID
midiInGetID 関数は指定された MIDI 入力デバイスのデバイス識別子を取得する。
%group
Win32 winmm
%prm
hmi, puDeviceID
hmi : [intptr] MIDI 入力デバイスへのハンドル。
puDeviceID : [var] デバイス識別子が格納される変数へのポインタ。
%inst
midiInGetID 関数は指定された MIDI 入力デバイスのデバイス識別子を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
midiInGetNumDevs
midiInGetNumDevs 関数はシステム内の MIDI 入力デバイスの数を取得する。
%group
Win32 winmm
%prm

%inst
midiInGetNumDevs 関数はシステム内の MIDI 入力デバイスの数を取得する。

[戻り値]
システムに存在する MIDI 入力デバイスの数を返す。戻り値が 0 の場合、デバイスが存在しないことを意味する
(エラーが発生したわけではない)。


%index
midiInMessage
midiInMessage 関数は MIDI デバイスドライバへメッセージを送信する。
%group
Win32 winmm
%prm
hmi, uMsg, dw1, dw2
hmi : [intptr] メッセージを受け取る MIDI デバイスの識別子。デバイス ID を HMIDIIN ハンドル型にキャストする必要がある。デバイス ID の代わりにハンドルを渡すと、関数は失敗し MMSYSERR_NOSUPPORT エラーコードを返す。
uMsg : [int] 送信するメッセージ。
dw1 : [int] メッセージパラメータ。
dw2 : [int] メッセージパラメータ。
%inst
midiInMessage 関数は MIDI デバイスドライバへメッセージを送信する。

[戻り値]
オーディオデバイスドライバが返した値を返す。

[備考]
本関数は MIDI API
でサポートされていないドライバ固有のメッセージにのみ使用される。DRV_QUERYDEVICEINTERFACE
メッセージは、waveIn、waveOut、midiIn、midiOut、または mixer
デバイスのデバイスインターフェイス名を問い合わせる。DRV_QUERYDEVICEINTERFACE では、dwParam1
はデバイスインターフェイス名を含む null 終端の Unicode
文字列を関数が書き込む呼び出し側割り当てバッファへのポインタである。デバイスにデバイスインターフェイスがない場合、文字列長は 0
となる。DRV_QUERYDEVICEINTERFACE では、dwParam2
はバッファサイズをバイト単位で指定する。これは関数への入力パラメータである。呼び出し側は
DRV_QUERYDEVICEINTERFACESIZE
メッセージで取得したバッファサイズ以上のサイズを指定するべきである。DRV_QUERYDEVICEINTERFACE メッセージは
Windows Me、Windows 2000 以降でサポートされる。このメッセージは
waveInMessage、waveOutMessage、midiInMessage、midiOutMessage、mixerMessage
関数でのみ有効である。システムはこのメッセージを傍受し、デバイスドライバへ送信せずに適切な値を返す。システム傍受 xxxMessage
関数の一般情報については System-Intercepted Device Messages
を参照。デバイスインターフェイス名の取得を目的として、次の 2 つのメッセージ定数が一緒に使用される。
（以下省略）


%index
midiInOpen
midiInOpen 関数は指定された MIDI 入力デバイスをオープンする。
%group
Win32 winmm
%prm
phmi, uDeviceID, dwCallback, dwInstance, fdwOpen
phmi : [intptr] HMIDIIN ハンドルへのポインタ。この場所にオープンされた MIDI 入力デバイスを識別するハンドルが格納される。このハンドルは他の MIDI 入力関数の呼び出しでデバイスを識別するために使用される。
uDeviceID : [int] オープン対象の MIDI 入力デバイスの識別子。
dwCallback : [int] コールバック関数へのポインタ、スレッド識別子、または受信した MIDI メッセージに関する情報とともに呼び出されるウィンドウのハンドル。コールバック関数の詳細は MidiInProc を参照。
dwInstance : [int] コールバック関数へ渡されるユーザインスタンスデータ。このパラメータはウィンドウコールバック関数やスレッドでは使用されない。
fdwOpen : [int] デバイスを開くためのコールバックフラグ、およびオプションで高速データ転送を制御するためのステータスフラグ。次の値を指定できる。
%inst
midiInOpen 関数は指定された MIDI 入力デバイスをオープンする。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
システムに存在する MIDI 入力デバイスの数を判定するには midiInGetNumDevs 関数を使用する。wDeviceID
で指定されるデバイス識別子は 0 から存在するデバイスの数より 1
少ない値までの範囲となる。コールバック情報の受け取り先としてウィンドウまたはスレッドが選択された場合、MIDI
入力の進捗を示すために次のメッセージがウィンドウプロシージャまたはスレッドへ送信される:
MM_MIM_OPEN、MM_MIM_CLOSE、MM_MIM_DATA、MM_MIM_LONGDATA、MM_MIM_ERROR、MM_MIM_LONGERROR、MM_MIM_MOREDATA。コールバック情報の受け取り先として関数が選択された場合、MIDI
入力の進捗を示すために次のメッセージが関数へ送信される:
MIM_OPEN、MIM_CLOSE、MIM_DATA、MIM_LONGDATA、MIM_ERROR、MIM_LONGERROR、MIM_MOREDATA。


%index
midiInPrepareHeader
midiInPrepareHeader 関数は MIDI 入力用のバッファを準備する。
%group
Win32 winmm
%prm
hmi, pmh, cbmh
hmi : [intptr] MIDI 入力デバイスへのハンドル。デバイスハンドルを取得するには midiInOpen を呼び出す。
pmh : [var] 準備対象のバッファを識別する MIDIHDR 構造体へのポインタ。
cbmh : [int] MIDIHDR 構造体のサイズ (バイト単位)。
%inst
midiInPrepareHeader 関数は MIDI 入力用のバッファを準備する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
MIDI データブロックをデバイスドライバへ渡す前に、midiInPrepareHeader
関数へ渡すことでバッファを準備する必要がある。ヘッダが準備された後はバッファを変更してはならない。ドライバがバッファの使用を終えた後は
midiInUnprepareHeader
関数を呼び出す。アプリケーションは同じバッファを再利用するか、複数のバッファを割り当てそれぞれに対し
midiInPrepareHeader を呼び出すことができる。同じバッファを再利用する場合は毎回バッファを準備する必要はない。最初に
midiInPrepareHeader を 1 回呼び出し、最後に midiInUnprepareHeader を 1
回呼び出すだけでよい。既に準備済みのヘッダを準備しても効果はなく、関数は 0 を返す。


%index
midiInReset
midiInReset 関数は指定された MIDI 入力デバイスでの入力を停止する。
%group
Win32 winmm
%prm
hmi
hmi : [intptr] MIDI 入力デバイスへのハンドル。
%inst
midiInReset 関数は指定された MIDI 入力デバイスでの入力を停止する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数は保留中の全入力バッファをコールバック関数へ返し、MIDIHDR 構造体の dwFlags メンバの MHDR_DONE
フラグをセットする。


%index
midiInStart
midiInStart 関数は指定された MIDI 入力デバイスで MIDI 入力を開始する。
%group
Win32 winmm
%prm
hmi
hmi : [intptr] MIDI 入力デバイスへのハンドル。
%inst
midiInStart 関数は指定された MIDI 入力デバイスで MIDI 入力を開始する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数はタイムスタンプを 0
にリセットする。以降に受信したメッセージのタイムスタンプ値は本関数が呼び出された時刻からの相対値となる。システムエクスクルーシブメッセージ以外の全てのメッセージは受信されたときに直接クライアントへ送信される。システムエクスクルーシブメッセージは
midiInAddBuffer
関数で供給されたバッファに格納される。キューにバッファがない場合、システムエクスクルーシブデータはクライアントへ通知されることなく破棄され、入力は続行される。バッファは満杯になったとき、完全なシステムエクスクルーシブメッセージを受信したとき、または
midiInReset 関数が使用されたときにクライアントへ返される。MIDIHDR 構造体の dwBytesRecorded
メンバには受信したデータの実際の長さが格納される。入力が既に開始されている状態で本関数を呼び出しても効果はなく、関数は 0 を返す。


%index
midiInStop
midiInStop 関数は指定された MIDI 入力デバイスで MIDI 入力を停止する。
%group
Win32 winmm
%prm
hmi
hmi : [intptr] MIDI 入力デバイスへのハンドル。
%inst
midiInStop 関数は指定された MIDI 入力デバイスで MIDI 入力を停止する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
キューにシステムエクスクルーシブメッセージやストリームバッファがある場合、現在のバッファは完了としてマークされ (MIDIHDR 構造体の
dwBytesRecorded
メンバには受信データの実際の長さが格納される)、キュー内の空のバッファはそのまま残り完了としてマークされない。入力が開始されていない状態で本関数を呼び出しても効果はなく、関数は
0 を返す。


%index
midiInUnprepareHeader
midiInUnprepareHeader 関数は midiInPrepareHeader 関数で行った準備の後始末を行う。
%group
Win32 winmm
%prm
hmi, pmh, cbmh
hmi : [intptr] MIDI 入力デバイスへのハンドル。
pmh : [var] 後始末対象のバッファを識別する MIDIHDR 構造体へのポインタ。
cbmh : [int] MIDIHDR 構造体のサイズ。
%inst
midiInUnprepareHeader 関数は midiInPrepareHeader 関数で行った準備の後始末を行う。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数は midiInPrepareHeader
と対をなす。バッファを解放する前に本関数を使用しなければならない。midiInAddBuffer
関数でデバイスドライバへバッファを渡した後は、ドライバがバッファの使用を終えるまで待ってから midiInUnprepareHeader
を使用する必要がある。準備されていないバッファに対する後始末は効果がなく、関数は MMSYSERR_NOERROR を返す。


%index
midiOutCacheDrumPatches
midiOutCacheDrumPatches 関数は内部 MIDI シンセサイザデバイスに対して、指定された一連のキーベース打楽器パッチをプリロードしてキャッシュするよう要求する。
%group
Win32 winmm
%prm
hmo, uPatch, pwkya, fuCache
hmo : [intptr] オープン済み MIDI 出力デバイスへのハンドル。このデバイスは内部 MIDI シンセサイザでなければならない。このパラメータには HMIDIOUT にキャストされた MIDI ストリームのハンドルも指定できる。
uPatch : [int] 使用するドラムパッチ番号。既定のドラムパッチをキャッシュするには 0 を指定する。
pwkya : [var] キャッシュまたはアンキャッシュする打楽器パッチのキー番号を示す KEYARRAY 配列へのポインタ。
fuCache : [int] キャッシュ操作のオプション。次のフラグのいずれかを指定できる。
%inst
midiOutCacheDrumPatches 関数は内部 MIDI
シンセサイザデバイスに対して、指定された一連のキーベース打楽器パッチをプリロードしてキャッシュするよう要求する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]

シンセサイザの中には全ての打楽器パッチを同時にロードしておけないものがある。パッチをキャッシュすることで指定されたパッチが利用可能であることを保証する。KEYARRAY
配列の各要素は 128 のキーベース打楽器パッチのいずれかを表し、その特定のパッチを使用する 16 の MIDI
チャネルそれぞれに対しビットがセットされる。最下位ビットは物理チャネル 0 を、最上位ビットは物理チャネル 15 を表す。例えばキー番号
60 のパッチが物理チャネル 9 と 15 で使用される場合、要素 60 は 0x8200 にセットされる。本関数は内部 MIDI
シンセサイザデバイスにのみ適用される。全ての内部シンセサイザがパッチキャッシュをサポートしているわけではない。デバイスがパッチキャッシュをサポートしているかを判定するには、MIDICAPS_CACHE
フラグを用いて midiOutGetDevCaps 関数で取得した MIDIOUTCAPS 構造体の dwSupport
メンバをテストする。


%index
midiOutCachePatches
midiOutCachePatches 関数は内部 MIDI シンセサイザデバイスに対して、指定された一連のパッチをプリロードしてキャッシュするよう要求する。
%group
Win32 winmm
%prm
hmo, uBank, pwpa, fuCache
hmo : [intptr] オープン済み MIDI 出力デバイスへのハンドル。このデバイスは内部 MIDI シンセサイザでなければならない。このパラメータには HMIDIOUT にキャストされた MIDI ストリームのハンドルも指定できる。
uBank : [int] 使用するパッチのバンク。既定のパッチバンクをキャッシュするには 0 を指定する。
pwpa : [var] キャッシュまたはアンキャッシュするパッチを示す PATCHARRAY 配列へのポインタ。
fuCache : [int] キャッシュ操作のオプション。次のフラグのいずれかを指定できる。
%inst
midiOutCachePatches 関数は内部 MIDI
シンセサイザデバイスに対して、指定された一連のパッチをプリロードしてキャッシュするよう要求する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
シンセサイザの中には全てのパッチを同時にロードしておけず、MIDI
プログラムチェンジメッセージを受信したときにディスクからデータをロードする必要があるものがある。パッチをキャッシュすることで指定されたパッチが直ちに利用可能であることを保証する。PATCHARRAY
配列の各要素は 128 のパッチのいずれかを表し、その特定のパッチを使用する 16 の MIDI
チャネルそれぞれに対しビットがセットされる。最下位ビットは物理チャネル 0 を、最上位ビットは物理チャネル 15 (0x0F)
を表す。例えばパッチ 0 が物理チャネル 0 と 8 で使用される場合、要素 0 は 0x0101 にセットされる。本関数は内部 MIDI
シンセサイザデバイスにのみ適用される。全ての内部シンセサイザがパッチキャッシュをサポートしているわけではない。デバイスがパッチキャッシュをサポートしているかを判定するには、MIDICAPS_CACHE
フラグを用いて midiOutGetDevCaps 関数で取得した MIDIOUTCAPS 構造体の dwSupport
メンバをテストする。


%index
midiOutGetDevCapsW
midiOutGetDevCapsW (Unicode) 関数 (mmeapi.h) は指定された MIDI 出力デバイスに問い合わせてその機能を判定する。
%group
Win32 winmm
%prm
uDeviceID, pmoc, cbmoc
uDeviceID : [int] MIDI 出力デバイスの識別子。このパラメータで指定するデバイス識別子は 0 から存在するデバイスの数より 1 少ない値までの範囲となる。MIDI_MAPPER 定数も有効なデバイス識別子である。このパラメータは適切にキャストされたデバイスハンドルでもよい。
pmoc : [var] MIDIOUTCAPS 構造体へのポインタ。この構造体にデバイスの機能に関する情報が格納される。
cbmoc : [int] MIDIOUTCAPS 構造体のサイズ (バイト単位)。lpMidiOutCaps が指す場所には cbMidiOutCaps バイト (またはそれ以下) の情報のみコピーされる。cbMidiOutCaps が 0 の場合は何もコピーされず、関数は MMSYSERR_NOERROR を返す。
%inst
midiOutGetDevCapsW (Unicode) 関数 (mmeapi.h) は指定された MIDI
出力デバイスに問い合わせてその機能を判定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
システムに存在する MIDI 出力デバイスの数を判定するには midiOutGetNumDevs 関数を使用する。
> [!NOTE] > mmeapi.h ヘッダは midiOutGetDevCaps をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
midiOutGetErrorTextW
midiOutGetErrorTextW (Unicode) 関数 (mmeapi.h) は指定したエラーコードで識別されるエラーのテキスト形式の説明を取得する。
%group
Win32 winmm
%prm
mmrError, pszText, cchText
mmrError : [int] エラーコード。
pszText : [wstr] テキスト形式のエラー説明が格納されるバッファへのポインタ。
cchText : [int] lpText が指すバッファの長さ (文字単位)。
%inst
midiOutGetErrorTextW (Unicode) 関数 (mmeapi.h)
は指定したエラーコードで識別されるエラーのテキスト形式の説明を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
テキスト形式のエラー説明が指定したバッファより長い場合、説明は切り詰められる。返されるエラー文字列は常に null
終端される。cchText が 0 の場合は何もコピーされず、関数は MMSYSERR_NOERROR を返す。全てのエラー説明は
MAXERRORLENGTH 文字未満の長さである。
> [!NOTE] > mmeapi.h ヘッダは midiOutGetErrorText をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
midiOutGetID
midiOutGetID 関数は指定された MIDI 出力デバイスのデバイス識別子を取得する。
%group
Win32 winmm
%prm
hmo, puDeviceID
hmo : [intptr] MIDI 出力デバイスへのハンドル。
puDeviceID : [var] デバイス識別子が格納される変数へのポインタ。
%inst
midiOutGetID 関数は指定された MIDI 出力デバイスのデバイス識別子を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
midiOutGetNumDevs
midiOutGetNumDevs 関数はシステムに存在する MIDI 出力デバイスの数を取得する。
%group
Win32 winmm
%prm

%inst
midiOutGetNumDevs 関数はシステムに存在する MIDI 出力デバイスの数を取得する。

[戻り値]
MIDI 出力デバイスの数を返す。戻り値が 0 の場合、デバイスが存在しないことを意味する (エラーが発生したわけではない)。


%index
midiOutGetVolume
midiOutGetVolume 関数は MIDI 出力デバイスの現在の音量設定を取得する。
%group
Win32 winmm
%prm
hmo, pdwVolume
hmo : [intptr] オープン済み MIDI 出力デバイスへのハンドル。このパラメータには HMIDIOUT にキャストされていれば MIDI ストリームのハンドルを含めることもできる。デバイス識別子も指定できる。
pdwVolume : [var] 現在の音量設定が格納される場所へのポインタ。下位ワードに左チャネルの音量設定が、上位ワードに右チャネルの設定が格納される。0xFFFF が最大音量、0x0000 が無音を表す。デバイスが左右両チャネルの音量制御をサポートしていない場合、指定された場所の下位ワードにモノラル音量レベルが格納される。midiOutSetVolume 関数で設定された値は、デバイスがその値をサポートしているかどうかにかかわらず返される。
%inst
midiOutGetVolume 関数は MIDI 出力デバイスの現在の音量設定を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
デバイス識別子を使用した場合、midiOutGetVolume 呼び出しの結果と lpdwVolume
で返される情報はそのデバイスの全インスタンスに適用される。デバイスハンドルを使用した場合、結果と返される情報はそのデバイスハンドルが参照するインスタンスにのみ適用される。全てのデバイスが音量制御をサポートしているわけではない。デバイスが音量制御をサポートしているかは
midiOutGetDevCaps 関数で MIDICAPS_VOLUME フラグを指定して問い合わせることで判定できる。同じく
MIDICAPS_LRVOLUME
フラグを指定して問い合わせることで、デバイスが左右両チャネルの音量制御をサポートしているかも判定できる。


%index
midiOutLongMsg
midiOutLongMsg 関数は指定された MIDI 出力デバイスへシステムエクスクルーシブ MIDI メッセージを送信する。
%group
Win32 winmm
%prm
hmo, pmh, cbmh
hmo : [intptr] MIDI 出力デバイスへのハンドル。HMIDIOUT にキャストされた MIDI ストリームのハンドルも指定できる。
pmh : [var] MIDI バッファを識別する MIDIHDR 構造体へのポインタ。
cbmh : [int] MIDIHDR 構造体のサイズ (バイト単位)。
%inst
midiOutLongMsg 関数は指定された MIDI 出力デバイスへシステムエクスクルーシブ MIDI メッセージを送信する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
midiOutLongMsg にバッファを渡す前に midiOutPrepareHeader 関数で準備しておく必要がある。MIDI
出力デバイスドライバはデータを同期的に送信するか非同期的に送信するかを決定する。


%index
midiOutMessage
midiOutMessage 関数は MIDI デバイスドライバへメッセージを送信する。本関数は MIDI API でサポートされていないドライバ固有のメッセージにのみ使用される。
%group
Win32 winmm
%prm
hmo, uMsg, dw1, dw2
hmo : [intptr] メッセージを受け取る MIDI デバイスの識別子。デバイス ID を HMIDIOUT ハンドル型にキャストする必要がある。デバイス ID の代わりにハンドルを渡すと、関数は失敗し MMSYSERR_NOSUPPORT エラーコードを返す。
uMsg : [int] 送信するメッセージ。
dw1 : [int] メッセージパラメータ。
dw2 : [int] メッセージパラメータ。
%inst
midiOutMessage 関数は MIDI デバイスドライバへメッセージを送信する。本関数は MIDI API
でサポートされていないドライバ固有のメッセージにのみ使用される。

[戻り値]
オーディオデバイスドライバが返した値を返す。

[備考]
DRV_QUERYDEVICEINTERFACE メッセージは、waveIn、waveOut、midiIn、midiOut、または
mixer デバイスのデバイスインターフェイス名を問い合わせる。DRV_QUERYDEVICEINTERFACE では、dwParam1
はデバイスインターフェイス名を含む null 終端の Unicode
文字列を関数が書き込む呼び出し側割り当てバッファへのポインタである。デバイスにデバイスインターフェイスがない場合、文字列長は 0
となる。DRV_QUERYDEVICEINTERFACE では、dwParam2
はバッファサイズをバイト単位で指定する。これは関数への入力パラメータである。呼び出し側は
DRV_QUERYDEVICEINTERFACESIZE
メッセージで取得したバッファサイズ以上のサイズを指定するべきである。DRV_QUERYDEVICEINTERFACE メッセージは
Windows Me、Windows 2000 以降でサポートされる。このメッセージは
waveInMessage、waveOutMessage、midiInMessage、midiOutMessage、mixerMessage
関数でのみ有効である。システムはこのメッセージを傍受し、デバイスドライバへ送信せずに適切な値を返す。システム傍受 xxxMessage
関数の一般情報については System-Intercepted Device Messages
を参照。デバイスインターフェイス名の取得を目的として、次の 2 つのメッセージ定数が一緒に使用される。
（以下省略）


%index
midiOutOpen
midiOutOpen 関数は再生用に MIDI 出力デバイスをオープンする。
%group
Win32 winmm
%prm
phmo, uDeviceID, dwCallback, dwInstance, fdwOpen
phmo : [intptr] HMIDIOUT ハンドルへのポインタ。この場所にオープンされた MIDI 出力デバイスを識別するハンドルが格納される。このハンドルは他の MIDI 出力関数の呼び出しでデバイスを識別するために使用される。
uDeviceID : [int] オープン対象の MIDI 出力デバイスの識別子。
dwCallback : [int] コールバック関数へのポインタ、イベントハンドル、スレッド識別子、または MIDI 再生中に再生の進捗に関するメッセージを処理するために呼び出されるウィンドウやスレッドのハンドル。コールバックが不要な場合は NULL を指定する。コールバック関数の詳細は MidiOutProc を参照。
dwInstance : [int] コールバックへ渡されるユーザインスタンスデータ。このパラメータはウィンドウコールバックやスレッドでは使用されない。
fdwOpen : [int] デバイスを開くためのコールバックフラグ。次の値を指定できる。
%inst
midiOutOpen 関数は再生用に MIDI 出力デバイスをオープンする。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
システムに存在する MIDI 出力デバイスの数を判定するには midiOutGetNumDevs 関数を使用する。wDeviceID
で指定されるデバイス識別子は 0 から存在するデバイスの数より 1 少ない値までの範囲となる。MIDI_MAPPER
もデバイス識別子として使用できる。コールバック情報の受け取り先としてウィンドウまたはスレッドが選択された場合、MIDI
出力の進捗を示すために次のメッセージがウィンドウプロシージャまたはスレッドへ送信される:
MM_MOM_OPEN、MM_MOM_CLOSE、MM_MOM_DONE。コールバック情報の受け取り先として関数が選択された場合、MIDI
出力の進捗を示すために次のメッセージが関数へ送信される: MOM_OPEN、MOM_CLOSE、MOM_DONE。


%index
midiOutPrepareHeader
midiOutPrepareHeader 関数は MIDI システムエクスクルーシブまたはストリームバッファを出力用に準備する。
%group
Win32 winmm
%prm
hmo, pmh, cbmh
hmo : [intptr] MIDI 出力デバイスへのハンドル。デバイスハンドルを取得するには midiOutOpen を呼び出す。HMIDIOUT 型にキャストされた MIDI ストリームのハンドルも指定できる。
pmh : [var] 準備対象のバッファを識別する MIDIHDR 構造体へのポインタ。
cbmh : [int] MIDIHDR 構造体のサイズ (バイト単位)。
%inst
midiOutPrepareHeader 関数は MIDI システムエクスクルーシブまたはストリームバッファを出力用に準備する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
MIDI データブロックをデバイスドライバへ渡す前に、midiOutPrepareHeader
関数へ渡すことでバッファを準備する必要がある。ヘッダが準備された後はバッファを変更してはならない。ドライバがバッファの使用を終えた後は
midiOutUnprepareHeader
関数を呼び出す。アプリケーションは同じバッファを再利用するか、複数のバッファを割り当てそれぞれに対し
midiOutPrepareHeader を呼び出すことができる。同じバッファを再利用する場合は毎回バッファを準備する必要はない。最初に
midiOutPrepareHeader を 1 回呼び出し、最後に midiOutUnprepareHeader を 1
回呼び出すだけでよい。ストリームバッファのサイズは 64K より大きくできない。
既に準備済みのヘッダを準備しても効果はなく、関数は MMSYSERR_NOERROR を返す。


%index
midiOutReset
midiOutReset 関数は指定された MIDI 出力デバイスの全 MIDI チャネルの全ノートをオフにする。
%group
Win32 winmm
%prm
hmo
hmo : [intptr] MIDI 出力デバイスへのハンドル。HMIDIOUT にキャストされた MIDI ストリームのハンドルも指定できる。
%inst
midiOutReset 関数は指定された MIDI 出力デバイスの全 MIDI チャネルの全ノートをオフにする。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
保留中のシステムエクスクルーシブまたはストリーム出力バッファはコールバック関数へ返され、MIDIHDR 構造体の dwFlags メンバの
MHDR_DONE フラグがセットされる。EOX (end-of-exclusive)
バイトを送信せずにシステムエクスクルーシブメッセージを終了すると、受信デバイスに問題が発生する可能性がある。midiOutReset
関数はシステムエクスクルーシブメッセージを終了する際に EOX
バイトを送信しない。これを行うのはアプリケーションの責任である。全ノートをオフにするため、各チャネルの各ノートに対しノートオフメッセージが送信される。さらに各チャネルのサスティンコントローラがオフにされる。


%index
midiOutSetVolume
midiOutSetVolume 関数は MIDI 出力デバイスの音量を設定する。
%group
Win32 winmm
%prm
hmo, dwVolume
hmo : [intptr] オープン済み MIDI 出力デバイスへのハンドル。このパラメータには HMIDIOUT にキャストされていれば MIDI ストリームのハンドルを含めることもできる。デバイス識別子も指定できる。
dwVolume : [int] 新しい音量設定。下位ワードに左チャネルの音量設定を、上位ワードに右チャネルの設定を指定する。0xFFFF が最大音量、0x0000 が無音を表す。デバイスが左右両チャネルの音量制御をサポートしていない場合、dwVolume の下位ワードでモノラル音量レベルを指定し、上位ワードは無視される。
%inst
midiOutSetVolume 関数は MIDI 出力デバイスの音量を設定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
デバイス識別子を使用した場合、midiOutSetVolume
呼び出しの結果はそのデバイスの全インスタンスに適用される。デバイスハンドルを使用した場合、結果はそのデバイスハンドルが参照するインスタンスにのみ適用される。全てのデバイスが音量変更をサポートしているわけではない。サポートしているかは
midiOutGetDevCaps 関数で MIDICAPS_VOLUME フラグを指定して問い合わせることで判定できる。同じく
MIDICAPS_LRVOLUME
フラグを指定して問い合わせることで、デバイスが左右両チャネルの音量制御をサポートしているかも判定できる。16
ビット全ての音量レベル制御をサポートしていないデバイスは要求された音量設定の上位ビットを使用する。例えば 4
ビットの音量制御をサポートするデバイスは、音量レベル値 0x4000、0x43be、0x4fff
に対して同じ音量設定を生成する。midiOutGetVolume 関数はデバイスの能力にかかわらず midiOutSetVolume
で設定された完全な 16 ビット値を返す。音量設定は対数的に解釈される。これは音量レベルを 0x5000 から 0x6000
に上げたときと 0x4000 から 0x5000 に上げたときの音量増加が同じように知覚されることを意味する。


%index
midiOutShortMsg
midiOutShortMsg 関数は指定された MIDI 出力デバイスへショート MIDI メッセージを送信する。
%group
Win32 winmm
%prm
hmo, dwMsg
hmo : [intptr] MIDI 出力デバイスへのハンドル。HMIDIOUT にキャストされた MIDI ストリームのハンドルも指定できる。
dwMsg : [int] MIDI メッセージ。メッセージは DWORD 値にパックされ、メッセージの最初のバイトが下位バイトに格納される。メッセージは次のようにこのパラメータにパックされる。
%inst
midiOutShortMsg 関数は指定された MIDI 出力デバイスへショート MIDI メッセージを送信する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数はシステムエクスクルーシブまたはストリームメッセージを除く任意の MIDI
メッセージを送信するために使用される。本関数はメッセージが出力デバイスへ送信されるまで戻らないことがある。同じデバイス上でストリームの再生中にショートメッセージを送信できる
(ただしこの場合ランニングステータスは使用できない)。


%index
midiOutUnprepareHeader
midiOutUnprepareHeader 関数は midiOutPrepareHeader 関数で行った準備の後始末を行う。
%group
Win32 winmm
%prm
hmo, pmh, cbmh
hmo : [intptr] MIDI 出力デバイスへのハンドル。HMIDIOUT にキャストされた MIDI ストリームのハンドルも指定できる。
pmh : [var] 後始末対象のバッファを識別する MIDIHDR 構造体へのポインタ。
cbmh : [int] MIDIHDR 構造体のサイズ (バイト単位)。
%inst
midiOutUnprepareHeader 関数は midiOutPrepareHeader 関数で行った準備の後始末を行う。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数は midiOutPrepareHeader 関数と対をなす。バッファを解放する前に midiOutUnprepareHeader
を呼び出さなければならない。midiOutLongMsg
関数でデバイスドライバへバッファを渡した後は、デバイスドライバがバッファの使用を終えるまで待ってから
midiOutUnprepareHeader を呼び出す必要がある。準備されていないバッファに対する後始末は効果がなく、関数は
MMSYSERR_NOERROR を返す。


%index
midiStreamClose
midiStreamClose 関数はオープン済みの MIDI ストリームを閉じる。
%group
Win32 winmm
%prm
hms
hms : [intptr] midiStreamOpen 関数で取得した MIDI ストリームへのハンドル。
%inst
midiStreamClose 関数はオープン済みの MIDI ストリームを閉じる。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
midiStreamOpen
midiStreamOpen 関数は出力用の MIDI ストリームをオープンする。既定ではデバイスは一時停止モードでオープンされる。本関数で取得したストリームハンドルは、以降そのストリームを参照する全ての場面で使用しなければならない。
%group
Win32 winmm
%prm
phms, puDeviceID, cMidi, dwCallback, dwInstance, fdwOpen
phms : [intptr] 関数が戻ったときにストリームハンドルを格納する変数へのポインタ。
puDeviceID : [var] デバイス識別子へのポインタ。デバイスはストリームに代わってオープンされ、ストリームが閉じられるときに再び閉じられる。
cMidi : [int] 予約。1 でなければならない。
dwCallback : [int] コールバック関数へのポインタ、イベントハンドル、スレッド識別子、または MIDI 再生中に再生の進捗に関するメッセージを処理するために呼び出されるウィンドウやスレッドのハンドル。コールバック機構が不要な場合は NULL を指定する。
dwInstance : [int] コールバック関数のたびにアプリケーションへ返されるアプリケーション固有のインスタンスデータ。
fdwOpen : [int] デバイスを開くためのコールバックフラグ。次のコールバックフラグのいずれかを指定しなければならない。
%inst
midiStreamOpen 関数は出力用の MIDI
ストリームをオープンする。既定ではデバイスは一時停止モードでオープンされる。本関数で取得したストリームハンドルは、以降そのストリームを参照する全ての場面で使用しなければならない。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
midiStreamOut
midiStreamOut 関数は MIDI データのストリーム (バッファ) を MIDI 出力デバイスで再生またはキューイングする。
%group
Win32 winmm
%prm
hms, pmh, cbmh
hms : [intptr] MIDI ストリームへのハンドル。このハンドルは midiStreamOpen 関数の呼び出しによって返されたものでなければならない。このハンドルは出力デバイスを識別する。
pmh : [var] MIDI バッファを識別する MIDIHDR 構造体へのポインタ。
cbmh : [int] MIDIHDR 構造体のサイズ (バイト単位)。
%inst
midiStreamOut 関数は MIDI データのストリーム (バッファ) を MIDI 出力デバイスで再生またはキューイングする。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
midiStreamOpen にバッファを渡す前に midiOutPrepareHeader
関数で準備する必要がある。midiStreamOpen 関数は出力デバイスを一時停止モードでオープンするため、midiStreamOut
で再生を開始する前に midiStreamRestart 関数を呼び出す必要がある。本関数の現在の実装では、バッファは 64K
より小さくなければならない。MIDIHDR 構造体が指すバッファには 1 つ以上の MIDI イベントが含まれ、それぞれは
MIDIEVENT 構造体で定義される。


%index
midiStreamPause
midiStreamPause 関数は指定された MIDI ストリームの再生を一時停止する。
%group
Win32 winmm
%prm
hms
hms : [intptr] MIDI ストリームへのハンドル。このハンドルは MIDIEVENT 関数の呼び出しによって返されたものでなければならない。このハンドルは出力デバイスを識別する。
%inst
midiStreamPause 関数は指定された MIDI ストリームの再生を一時停止する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
再生を一時停止すると現在の再生位置が保存される。現在位置から再生を再開するには midiStreamRestart
関数を使用する。出力が既に一時停止している状態で本関数を呼び出しても効果はなく、関数は MMSYSERR_NOERROR を返す。


%index
midiStreamPosition
midiStreamPosition 関数は MIDI ストリームの現在位置を取得する。
%group
Win32 winmm
%prm
hms, lpmmt, cbmmt
hms : [intptr] MIDI ストリームへのハンドル。このハンドルは midiStreamOpen 関数の呼び出しによって返されたものでなければならない。このハンドルは出力デバイスを識別する。
lpmmt : [var] MMTIME 構造体へのポインタ。
cbmmt : [int] MMTIME 構造体のサイズ (バイト単位)。
%inst
midiStreamPosition 関数は MIDI ストリームの現在位置を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
midiStreamPosition を呼び出す前に MMTIME 構造体の wType
メンバを設定して希望する時間形式を指定する。midiStreamPosition を呼び出した後、希望する時間形式がサポートされているかを
wType メンバで確認する。希望する形式がサポートされていない場合、wType
は代替形式を指定する。デバイスがオープンまたはリセットされたとき、位置は 0 にセットされる。


%index
midiStreamProperty
midiStreamProperty 関数は MIDI 出力デバイスに関連付けられた MIDI データストリームのプロパティを設定または取得する。
%group
Win32 winmm
%prm
hms, lppropdata, dwProperty
hms : [intptr] プロパティが関連付けられている MIDI デバイスへのハンドル。
lppropdata : [var] プロパティデータへのポインタ。
dwProperty : [int] 実行するアクションを指定し、MIDI データストリームの該当プロパティを識別するフラグ。midiStreamProperty 関数は使用するたびに 2 つのフラグの設定を必要とする。1 つのフラグ (MIDIPROP_GET または MIDIPROP_SET) はアクションを指定し、もう 1 つは検査または編集する具体的なプロパティを識別する。
%inst
midiStreamProperty 関数は MIDI 出力デバイスに関連付けられた MIDI
データストリームのプロパティを設定または取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
これらのプロパティはシステムによって定義された既定のプロパティである。ドライバライタは独自のプロパティを実装し文書化することができる。


%index
midiStreamRestart
midiStreamRestart 関数は一時停止された MIDI ストリームを再開する。
%group
Win32 winmm
%prm
hms
hms : [intptr] MIDI ストリームへのハンドル。このハンドルは midiStreamOpen 関数の呼び出しによって返されたものでなければならない。このハンドルは出力デバイスを識別する。
%inst
midiStreamRestart 関数は一時停止された MIDI ストリームを再開する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
出力が一時停止していない状態で本関数を呼び出しても効果はなく、関数は MMSYSERR_NOERROR を返す。


%index
midiStreamStop
midiStreamStop 関数は指定された MIDI 出力デバイスの全 MIDI チャネルの全ノートをオフにする。
%group
Win32 winmm
%prm
hms
hms : [intptr] MIDI ストリームへのハンドル。このハンドルは midiStreamOpen 関数の呼び出しによって返されたものでなければならない。このハンドルは出力デバイスを識別する。
%inst
midiStreamStop 関数は指定された MIDI 出力デバイスの全 MIDI チャネルの全ノートをオフにする。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数を呼び出すと、保留中のシステムエクスクルーシブまたはストリーム出力バッファはコールバック機構へ返され、MIDIHDR 構造体の
dwFlags メンバの MHDR_DONE ビットがセットされる。midiOutReset
関数が全ノートをオフにするのに対し、midiStreamStop は MIDI
ノートオンメッセージによってオンにされたノートのみをオフにする。


%index
mixerClose
mixerClose 関数は指定されたミキサーデバイスを閉じる。
%group
Win32 winmm
%prm
hmx
hmx : [intptr] ミキサーデバイスへのハンドル。このハンドルは mixerOpen 関数によって正常に返されたものでなければならない。mixerClose が成功した場合、hmx は有効ではなくなる。
%inst
mixerClose 関数は指定されたミキサーデバイスを閉じる。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
mixerGetControlDetailsW
mixerGetControlDetailsW (Unicode) 関数 (mmeapi.h) はオーディオラインに関連付けられた単一のコントロールの詳細を取得する。
%group
Win32 winmm
%prm
hmxobj, pmxcd, fdwDetails
hmxobj : [intptr] 問い合わせ対象のミキサーデバイスオブジェクトへのハンドル。
pmxcd : [var] コントロールに関する状態情報が格納される MIXERCONTROLDETAILS 構造体へのポインタ。
fdwDetails : [int] コントロール詳細を取得するためのフラグ。次の値が定義されている。
%inst
mixerGetControlDetailsW (Unicode) 関数 (mmeapi.h)
はオーディオラインに関連付けられた単一のコントロールの詳細を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数を呼び出す前に MIXERCONTROLDETAILS 構造体の全メンバを初期化する必要がある。
> [!NOTE] > mmeapi.h ヘッダは mixerGetControlDetails をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
mixerGetDevCapsW
mixerGetDevCapsW (Unicode) 関数 (mmeapi.h) は指定されたミキサーデバイスに問い合わせてその機能を判定する。
%group
Win32 winmm
%prm
uMxId, pmxcaps, cbmxcaps
uMxId : [int] オープン済みミキサーデバイスの識別子またはハンドル。
pmxcaps : [var] デバイスの機能に関する情報を受け取る MIXERCAPS 構造体へのポインタ。
cbmxcaps : [int] MIXERCAPS 構造体のサイズ (バイト単位)。
%inst
mixerGetDevCapsW (Unicode) 関数 (mmeapi.h)
は指定されたミキサーデバイスに問い合わせてその機能を判定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
システムに存在するミキサーデバイスの数を判定するには mixerGetNumDevs 関数を使用する。uMxId
で指定されるデバイス識別子は 0 から存在するミキサーデバイスの数より 1 少ない値までの範囲となる。pmxcaps が指す場所には
cbmxcaps で指定したバイト数 (またはそれ以下) の情報のみコピーされる。cbmxcaps が 0
の場合は何もコピーされず、関数は正常に戻る。本関数は mixerOpen 関数によって返されたミキサーデバイスハンドルも uMxId
パラメータとして受け入れる。アプリケーションは HMIXER ハンドルを UINT にキャストする必要がある。
> [!NOTE] > mmeapi.h ヘッダは mixerGetDevCaps をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
mixerGetID
mixerGetID 関数は指定されたデバイスハンドルに関連付けられたミキサーデバイスのデバイス識別子を取得する。
%group
Win32 winmm
%prm
hmxobj, puMxId, fdwId
hmxobj : [intptr] ミキサーデバイス識別子にマップするオーディオミキサーオブジェクトへのハンドル。
puMxId : [var] ミキサーデバイス識別子を受け取る変数へのポインタ。hmxobj オブジェクトに対して利用可能なミキサーデバイスがない場合、この場所には -1 が格納され、MMSYSERR_NODRIVER エラー値が返される。
fdwId : [int] ミキサーオブジェクト hmxobj をマップするためのフラグ。次の値が定義されている。
%inst
mixerGetID 関数は指定されたデバイスハンドルに関連付けられたミキサーデバイスのデバイス識別子を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
mixerGetLineControlsW
mixerGetLineControlsW (Unicode) 関数はオーディオラインに関連付けられた 1 つ以上のコントロールを取得する。(mixerGetLineControlsW)
%group
Win32 winmm
%prm
hmxobj, pmxlc, fdwControls
hmxobj : [intptr] 問い合わせ対象のミキサーデバイスオブジェクトへのハンドル。
pmxlc : [var] MIXERLINECONTROLS 構造体へのポインタ。この構造体は、オーディオラインに関連付けられたコントロールに関する情報が格納される 1 つ以上の MIXERCONTROL 構造体を参照するために使用される。MIXERLINECONTROLS 構造体の cbStruct メンバは常に MIXERLINECONTROLS 構造体のサイズ (バイト単位) で初期化しなければならない。
fdwControls : [int] オーディオラインに関連付けられた 1 つ以上のコントロールに関する情報を取得するためのフラグ。次の値が定義されている。
%inst
mixerGetLineControlsW (Unicode) 関数はオーディオラインに関連付けられた 1
つ以上のコントロールを取得する。(mixerGetLineControlsW)

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
> [!NOTE] > mmeapi.h ヘッダは mixerGetLineControls をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
mixerGetLineInfoW
mixerGetLineInfoW (Unicode) 関数はミキサーデバイスの特定のラインに関する情報を取得する。(mixerGetLineInfoW)
%group
Win32 winmm
%prm
hmxobj, pmxl, fdwInfo
hmxobj : [intptr] 特定のオーディオラインを制御するミキサーデバイスオブジェクトへのハンドル。
pmxl : [var] MIXERLINE 構造体へのポインタ。この構造体にはミキサーデバイスのオーディオラインに関する情報が格納される。cbStruct メンバは常に MIXERLINE 構造体のサイズ (バイト単位) で初期化しなければならない。
fdwInfo : [int] オーディオラインに関する情報を取得するためのフラグ。次の値が定義されている。
%inst
mixerGetLineInfoW (Unicode)
関数はミキサーデバイスの特定のラインに関する情報を取得する。(mixerGetLineInfoW)

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
> [!NOTE] > mmeapi.h ヘッダは mixerGetLineInfo をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
mixerGetNumDevs
mixerGetNumDevs 関数はシステムに存在するミキサーデバイスの数を取得する。
%group
Win32 winmm
%prm

%inst
mixerGetNumDevs 関数はシステムに存在するミキサーデバイスの数を取得する。

[戻り値]
ミキサーデバイスの数を返す。利用可能なミキサーデバイスがない場合は 0 を返す。


%index
mixerMessage
mixerMessage 関数はカスタムミキサードライバメッセージをミキサードライバへ直接送信する。
%group
Win32 winmm
%prm
hmx, uMsg, dwParam1, dwParam2
hmx : [intptr] メッセージを受け取るミキサーの識別子。デバイス ID を HMIXER ハンドル型にキャストする必要がある。デバイス ID の代わりにハンドルを渡すと、関数は失敗し MMSYSERR_NOSUPPORT エラーコードを返す。
uMsg : [int] ミキサードライバへ送信するカスタムミキサードライバメッセージ。このメッセージは MXDM_USER 定数以上でなければならない。
dwParam1 : [int] 送信するメッセージに関連付けられたパラメータ。
dwParam2 : [int] 送信するメッセージに関連付けられたパラメータ。
%inst
mixerMessage 関数はカスタムミキサードライバメッセージをミキサードライバへ直接送信する。

[戻り値]
カスタムミキサードライバメッセージに固有の値を返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
ユーザ定義メッセージはそのメッセージをサポートするミキサードライバにのみ送信しなければならない。アプリケーションはミキサーの機能を取得し
MIXERCAPS 構造体の wMid、wPid、vDriverVersion、szPname
メンバを確認することで、ミキサードライバがメッセージをサポートするドライバであることを検証する必要がある。DRV_QUERYDEVICEINTERFACE
メッセージは、waveIn、waveOut、midiIn、midiOut、または mixer
デバイスのデバイスインターフェイス名を問い合わせる。DRV_QUERYDEVICEINTERFACE では、dwParam1
はデバイスインターフェイス名を含む null 終端の Unicode
文字列を関数が書き込む呼び出し側割り当てバッファへのポインタである。デバイスにデバイスインターフェイスがない場合、文字列長は 0
となる。DRV_QUERYDEVICEINTERFACE では、dwParam2
はバッファサイズをバイト単位で指定する。これは関数への入力パラメータである。呼び出し側は
DRV_QUERYDEVICEINTERFACESIZE
メッセージで取得したバッファサイズ以上のサイズを指定するべきである。DRV_QUERYDEVICEINTERFACE メッセージは
Windows Me、Windows 2000 以降でサポートされる。このメッセージは
waveInMessage、waveOutMessage、midiInMessage、midiOutMessage、mixerMessage
関数でのみ有効である。システムはこのメッセージを傍受し、デバイスドライバへ送信せずに適切な値を返す。システム傍受 xxxMessage
関数の一般情報については System-Intercepted Device Messages
を参照。デバイスインターフェイス名の取得を目的として、次の 2 つのメッセージ定数が一緒に使用される。
（以下省略）


%index
mixerOpen
mixerOpen 関数は指定されたミキサーデバイスをオープンし、アプリケーションがハンドルを閉じるまでデバイスが取り外されないことを保証する。
%group
Win32 winmm
%prm
phmx, uMxId, dwCallback, dwInstance, fdwOpen
phmx : [intptr] オープンされたミキサーデバイスを識別するハンドルを受け取る変数へのポインタ。このハンドルは他のオーディオミキサー関数を呼び出すときにデバイスを識別するために使用する。このパラメータは NULL であってはならない。
uMxId : [int] オープン対象のミキサーデバイスの識別子。有効なデバイス識別子または任意の HMIXEROBJ を使用する (ミキサーオブジェクトハンドルの説明は mixerGetID 関数を参照)。オーディオミキサーデバイスの「マッパー」は現在存在しないため、ミキサーデバイス識別子 -1 は無効である。
dwCallback : [int] オープン対象のデバイスに関連付けられたオーディオラインまたはコントロールの状態が変化したときに呼び出されるウィンドウへのハンドル。コールバック機構を使用しない場合は NULL を指定する。
dwInstance : [int] 予約。0 でなければならない。
fdwOpen : [int] デバイスを開くためのフラグ。次の値が定義されている。
%inst
mixerOpen
関数は指定されたミキサーデバイスをオープンし、アプリケーションがハンドルを閉じるまでデバイスが取り外されないことを保証する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
システムに存在するオーディオミキサーデバイスの数を判定するには mixerGetNumDevs 関数を使用する。uMxId
で指定されるデバイス識別子は 0 から存在するデバイスの数より 1
少ない値までの範囲となる。コールバック情報の受け取り先としてウィンドウが選択された場合、オーディオラインまたはコントロール状態の変化を示すために
MM_MIXM_LINE_CHANGE および MM_MIXM_CONTROL_CHANGE
メッセージがウィンドウプロシージャ関数へ送信される。両メッセージにおいて wParam
パラメータはミキサーデバイスのハンドルである。lParam パラメータは MM_MIXM_LINE_CHANGE
の場合は状態が変化したライン識別子、MM_MIXM_CONTROL_CHANGE
の場合はコントロール識別子である。オーディオミキサーサポートまたはメディアデバイスを問い合わせるには mixerGetID
関数を使用する。64 ビットシステムでは、uMxId パラメータが 32 ビットに切り詰められるため、64 ビットの LPHWAVEOUT
ポインタを uMxId パラメータに渡す状況では本関数は期待どおりに動作しないことがある。


%index
mixerSetControlDetails
mixerSetControlDetails 関数はオーディオラインに関連付けられた単一のコントロールのプロパティを設定する。
%group
Win32 winmm
%prm
hmxobj, pmxcd, fdwDetails
hmxobj : [intptr] プロパティを設定する対象のミキサーデバイスオブジェクトへのハンドル。
pmxcd : [var] MIXERCONTROLDETAILS 構造体へのポインタ。この構造体はコントロールに対する希望状態を含むコントロール詳細構造体を参照するために使用される。
fdwDetails : [int] コントロールのプロパティを設定するためのフラグ。次の値が定義されている。
%inst
mixerSetControlDetails 関数はオーディオラインに関連付けられた単一のコントロールのプロパティを設定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
mixerSetControlDetails を呼び出す前に MIXERCONTROLDETAILS
構造体の全メンバを初期化しなければならない。アプリケーションがカスタムミキサーコントロールの現在の状態のみを取得する必要があり、ダイアログボックスを表示する必要がない場合は、MIXER_GETCONTROLDETAILSF_VALUE
フラグを指定して mixerGetControlDetails を使用できる。


%index
mmioAdvance
mmioAdvance 関数は mmioGetInfo 関数で直接 I/O バッファアクセス用にセットアップされたファイルの I/O バッファを進める。
%group
Win32 winmm
%prm
hmmio, pmmioinfo, fuAdvance
hmmio : [intptr] mmioOpen 関数を使用してオープンしたファイルのファイルハンドル。
pmmioinfo : [var] mmioGetInfo 関数で取得した MMIOINFO 構造体へのポインタ。この構造体は現在のファイル情報を設定するために使用され、バッファが進められた後に更新される。このパラメータはオプションである。
fuAdvance : [int] 操作のフラグ。次のいずれかを指定できる。
%inst
mmioAdvance 関数は mmioGetInfo 関数で直接 I/O バッファアクセス用にセットアップされたファイルの I/O
バッファを進める。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
ファイルが読み取り用にオープンされている場合、I/O バッファはディスクから埋められる。ファイルが書き込み用にオープンされており
MMIOINFO 構造体の dwFlags メンバに MMIO_DIRTY
フラグがセットされている場合、バッファはディスクに書き込まれる。MMIOINFO 構造体の
pchNext、pchEndRead、pchEndWrite メンバは I/O
バッファの新しい状態を反映するように更新される。指定したファイルが書き込み用または読み書き両用にオープンされている場合、次のバッファが読み込まれる前に
I/O バッファはディスクへフラッシュされる。ディスクが満杯のため I/O バッファをディスクへ書き込めない場合、mmioAdvance
は MMIOERR_CANNOTWRITE を返す。指定したファイルが書き込み専用でオープンされている場合は MMIO_WRITE
フラグを指定しなければならない。I/O バッファに書き込んだ場合、mmioAdvance を呼び出す前に MMIOINFO 構造体の
dwFlags メンバに MMIO_DIRTY
フラグをセットする必要がある。そうしないとバッファはディスクへ書き込まれない。ファイルの末尾に到達した場合でも、これ以上データを読めないにもかかわらず
mmioAdvance は正常に戻る。ファイル末尾を確認するには、mmioAdvance を呼び出した後に MMIOINFO 構造体の
pchNext と pchEndRead メンバが等しいかをチェックする。


%index
mmioAscend
mmioAscend 関数は mmioDescend 関数で降下した、または mmioCreateChunk 関数で作成した RIFF ファイル内のチャンクから上昇する。
%group
Win32 winmm
%prm
hmmio, pmmcki, fuAscend
hmmio : [intptr] オープン済み RIFF ファイルのファイルハンドル。
pmmcki : [var] 事前に mmioDescend または mmioCreateChunk 関数によって埋められたアプリケーション定義の MMCKINFO 構造体へのポインタ。
fuAscend : [int] 予約。0 でなければならない。
%inst
mmioAscend 関数は mmioDescend 関数で降下した、または mmioCreateChunk 関数で作成した RIFF
ファイル内のチャンクから上昇する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
mmioDescend を使用してチャンクへ降下した場合、mmioAscend はチャンクの末尾の直後
(パッドバイトがある場合はそれ以降) の位置へシークする。mmioCreateChunk を使用してチャンクを作成し降下した場合、または
lpck が参照する MMCKINFO 構造体の dwFlags メンバに MMIO_DIRTY
フラグがセットされている場合、現在のファイル位置がチャンクのデータ部分の末尾と仮定される。チャンクサイズが mmioCreateChunk
呼び出し時に MMCKINFO 構造体の cksize メンバに格納された値と異なる場合、mmioAscend
はチャンクから上昇する前にファイル内のチャンクサイズを訂正する。チャンクサイズが奇数の場合、mmioAscend はチャンクの末尾に
null パッドバイトを書き込む。チャンクから上昇した後、現在のファイル位置はチャンクの末尾の直後 (パッドバイトがある場合はそれ以降)
の位置となる。


%index
mmioClose
mmioClose 関数は mmioOpen 関数を使用してオープンしたファイルを閉じる。
%group
Win32 winmm
%prm
hmmio, fuClose
hmmio : [intptr] クローズ対象のファイルのファイルハンドル。
fuClose : [int] クローズ操作のフラグ。次の値が定義されている。
%inst
mmioClose 関数は mmioOpen 関数を使用してオープンしたファイルを閉じる。

[戻り値]
成功時は 0 を、それ以外の場合はエラーを返す。エラー値は mmioFlush 関数または I/O
プロシージャから発生する可能性がある。考えられるエラー値は次のとおり。
（以下省略）


%index
mmioCreateChunk
mmioCreateChunk 関数は mmioOpen 関数を使用してオープンした RIFF ファイル内にチャンクを作成する。
%group
Win32 winmm
%prm
hmmio, pmmcki, fuCreate
hmmio : [intptr] オープン済み RIFF ファイルのファイルハンドル。
pmmcki : [var] 作成するチャンクに関する情報を含む MMCKINFO 構造体を受け取るバッファへのポインタ。
fuCreate : [int] 作成するチャンクの種類を識別するフラグ。次の値が定義されている。
%inst
mmioCreateChunk 関数は mmioOpen 関数を使用してオープンした RIFF ファイル内にチャンクを作成する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]

本関数はファイルの途中にチャンクを挿入することはできない。アプリケーションがファイルの末尾以外の場所にチャンクを作成しようとすると、mmioCreateChunk
はファイル内の既存の情報を上書きする。lpck パラメータが指す MMCKINFO 構造体は次のように設定する必要がある。
（以下省略）


%index
mmioDescend
mmioDescend 関数は mmioOpen 関数を使用してオープンした RIFF ファイル内のチャンクへ降下する。指定されたチャンクを検索することもできる。
%group
Win32 winmm
%prm
hmmio, pmmcki, pmmckiParent, fuDescend
hmmio : [intptr] オープン済み RIFF ファイルのファイルハンドル。
pmmcki : [var] MMCKINFO 構造体を受け取るバッファへのポインタ。
pmmckiParent : [var] 検索対象のチャンクの親を識別するオプションのアプリケーション定義 MMCKINFO 構造体へのポインタ。このパラメータが NULL でない場合、mmioDescend はそれが参照する MMCKINFO 構造体が親チャンクへ降下するために mmioDescend が呼び出されたときに埋められたものと仮定し、親チャンク内のチャンクを検索する。親チャンクを指定しない場合はこのパラメータを NULL に設定する。
fuDescend : [int] 検索フラグ。フラグが指定されない場合、mmioDescend は現在のファイル位置から始まるチャンクへ降下する。次の値が定義されている。
%inst
mmioDescend 関数は mmioOpen 関数を使用してオープンした RIFF
ファイル内のチャンクへ降下する。指定されたチャンクを検索することもできる。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
「RIFF」チャンクは 4 バイトのチャンク識別子 (FOURCC 型)、続いて 4 バイトのチャンクサイズ (DWORD
型)、続いてチャンクのデータ部分、データ部分のサイズが奇数の場合は null
パッドバイトで構成される。チャンク識別子が「RIFF」または「LIST」の場合、チャンクのデータ部分の最初の 4
バイトはフォーム型またはリスト型 (FOURCC 型) である。mmioDescend
を使用してチャンクを検索する場合は、関数を呼び出す前にファイル位置がチャンクの先頭にあることを確認する。検索は現在のファイル位置から始まり、ファイル末尾まで続く。親チャンクが指定されている場合、mmioDescend
を呼び出す前にファイル位置が親チャンク内のどこかにあるべきである。この場合、検索は現在のファイル位置から始まり親チャンクの末尾まで続く。mmioDescend
がチャンクの検索に失敗した場合、現在のファイル位置は未定義となる。mmioDescend
が成功した場合、現在のファイル位置は変更される。チャンクが「RIFF」または「LIST」チャンクの場合、新しいファイル位置はフォーム型またはリスト型の直後
(チャンク先頭から 12 バイト) となる。その他のチャンクの場合、新しいファイル位置はチャンクのデータ部分の先頭 (チャンク先頭から 8
バイト) となる。mmioDescend 関数は lpck パラメータが指す MMCKINFO 構造体に次の情報を埋める。
（以下省略）


%index
mmioFlush
mmioFlush 関数はファイルの I/O バッファに書き込みが行われていた場合、それをディスクへ書き込む。
%group
Win32 winmm
%prm
hmmio, fuFlush
hmmio : [intptr] mmioOpen 関数を使用してオープンしたファイルのファイルハンドル。
fuFlush : [int] フラッシュ方法を決定するフラグ。0 または次のいずれかを指定できる。
%inst
mmioFlush 関数はファイルの I/O バッファに書き込みが行われていた場合、それをディスクへ書き込む。

[戻り値]
成功時は 0 を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
mmioClose
関数でファイルを閉じると、そのバッファは自動的にフラッシュされる。バッファを書き込むためのディスク領域が不足している場合、先行する
mmioWrite 関数の呼び出しが成功していたとしても mmioFlush は失敗する。


%index
mmioGetInfo
mmioGetInfo 関数は mmioOpen 関数を使用してオープンしたファイルに関する情報を取得する。この情報により、ファイルがバッファード I/O 用にオープンされていればアプリケーションが I/O バッファに直接アクセスできる。
%group
Win32 winmm
%prm
hmmio, pmmioinfo, fuInfo
hmmio : [intptr] ファイルのファイルハンドル。
pmmioinfo : [var] mmioGetInfo がファイルに関する情報を埋める MMIOINFO 構造体を受け取るバッファへのポインタ。
fuInfo : [int] 予約。0 でなければならない。
%inst
mmioGetInfo 関数は mmioOpen
関数を使用してオープンしたファイルに関する情報を取得する。この情報により、ファイルがバッファード I/O
用にオープンされていればアプリケーションが I/O バッファに直接アクセスできる。

[戻り値]
成功時は 0 を、それ以外の場合はエラーを返す。

[備考]
バッファード I/O 用にオープンされたファイルの I/O バッファに直接アクセスするには、mmioGetInfo によって埋められた
MMIOINFO 構造体の次のメンバを使用する。
（以下省略）


%index
mmioOpenW
mmioOpenW (Unicode) 関数はバッファなしまたはバッファード I/O 用にファイルをオープンする、ファイルを作成する、ファイルを削除する、またはファイルが存在するかを確認する。(mmioOpenW)
%group
Win32 winmm
%prm
pszFileName, pmmioinfo, fdwOpen
pszFileName : [wstr] ファイル名を含むバッファへのポインタ。ファイルをオープンするための I/O プロシージャが指定されない場合、ファイル名がオープン方法を次のように決定する。
pmmioinfo : [var] mmioOpen が使用する追加パラメータを含む MMIOINFO 構造体へのポインタ。メモリファイルをオープンする、バッファード I/O 用のバッファサイズを指定する、ファイルをオープンするためのインストールされていない I/O プロシージャを指定する、のいずれでもない限り、このパラメータは NULL であるべきである。このパラメータが NULL でない場合、それが参照する MMIOINFO 構造体の未使用メンバ (予約メンバを含む) は全て 0 に設定しなければならない。
fdwOpen : [int] オープン操作のフラグ。MMIO_READ、MMIO_WRITE、MMIO_READWRITE フラグは相互排他的であり、いずれか 1 つのみを指定する。MMIO_COMPAT、MMIO_EXCLUSIVE、MMIO_DENYWRITE、MMIO_DENYREAD、MMIO_DENYNONE フラグはファイル共有フラグである。次の値が定義されている。
%inst
mmioOpenW (Unicode) 関数はバッファなしまたはバッファード I/O
用にファイルをオープンする、ファイルを作成する、ファイルを削除する、またはファイルが存在するかを確認する。(mmioOpenW)

[備考]
lpmmioinfo が MMIOINFO 構造体を指す場合、構造体のメンバを次のように初期化する。未使用メンバ (予約メンバを含む)
は全て 0 に設定しなければならない。
（以下省略）


%index
mmioRead
mmioRead 関数は mmioOpen 関数を使用してオープンしたファイルから指定されたバイト数を読み取る。
%group
Win32 winmm
%prm
hmmio, pch, cch
hmmio : [intptr] 読み取り対象のファイルのファイルハンドル。
pch : [var] ファイルから読み取ったデータを格納するバッファへのポインタ。
cch : [int] ファイルから読み取るバイト数。
%inst
mmioRead 関数は mmioOpen 関数を使用してオープンしたファイルから指定されたバイト数を読み取る。

[戻り値]
実際に読み取ったバイト数を返す。ファイル末尾に到達しこれ以上バイトを読み取れない場合、戻り値は 0
となる。ファイルからの読み取り中にエラーが発生した場合、戻り値は -1 となる。


%index
mmioRenameW
mmioRenameW (Unicode) 関数は指定されたファイルをリネームし、ファイル名を含む文字列を変更するパラメータを含む。(mmioRenameW)
%group
Win32 winmm
%prm
pszFileName, pszNewFileName, pmmioinfo, fdwRename
pszFileName : [wstr] リネーム対象のファイルのファイル名を含む文字列へのポインタ。
pszNewFileName : [wstr] 新しいファイル名を含む文字列へのポインタ。
pmmioinfo : [var] mmioRename が使用する追加パラメータを含む MMIOINFO 構造体へのポインタ。このパラメータが NULL でない場合、それが参照する MMIOINFO 構造体の未使用メンバ (予約メンバを含む) は全て 0 に設定しなければならない。
fdwRename : [int] リネーム操作のフラグ。このパラメータは 0 に設定するべきである。
%inst
mmioRenameW (Unicode)
関数は指定されたファイルをリネームし、ファイル名を含む文字列を変更するパラメータを含む。(mmioRenameW)

[戻り値]
ファイルがリネームされた場合は 0 を返す。それ以外の場合は mmioRename または I/O
プロシージャから返されたエラーコードを返す。

[備考]
> [!NOTE] > mmiscapi.h ヘッダは mmioRename をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
mmioSeek
mmioSeek 関数は mmioOpen 関数を使用してオープンしたファイルの現在のファイル位置を変更する。
%group
Win32 winmm
%prm
hmmio, lOffset, iOrigin
hmmio : [intptr] シーク対象のファイルのファイルハンドル。
lOffset : [int] ファイル位置を変更するためのオフセット。
iOrigin : [int] lOffset で指定されたオフセットの解釈方法を示すフラグ。次の値が定義されている。
%inst
mmioSeek 関数は mmioOpen 関数を使用してオープンしたファイルの現在のファイル位置を変更する。

[戻り値]
新しいファイル位置をファイル先頭からのバイト数で返す。エラーが発生した場合、戻り値は -1 となる。

[備考]
ファイル末尾を超える位置などファイル内の無効な場所へシークしても mmioSeek
がエラーを返さないことがあるが、そのファイルに対する以降の I/O 操作が失敗する可能性がある。ファイル末尾を特定するには、lOffset
を 0、iOrigin を SEEK_END に設定して mmioSeek を呼び出す。


%index
mmioSendMessage
mmioSendMessage 関数は指定されたファイルに関連付けられた I/O プロシージャへメッセージを送信する。
%group
Win32 winmm
%prm
hmmio, uMsg, lParam1, lParam2
hmmio : [intptr] mmioOpen 関数を使用してオープンしたファイルのファイルハンドル。
uMsg : [int] I/O プロシージャへ送信するメッセージ。
lParam1 : [intptr] メッセージのパラメータ。
lParam2 : [intptr] メッセージのパラメータ。
%inst
mmioSendMessage 関数は指定されたファイルに関連付けられた I/O プロシージャへメッセージを送信する。

[戻り値]
メッセージに対応する値を返す。I/O プロシージャがメッセージを認識しない場合、戻り値は 0 であるべきである。

[備考]

本関数はカスタムユーザ定義メッセージを送信するために使用する。MMIOM_OPEN、MMIOM_CLOSE、MMIOM_READ、MMIOM_WRITE、MMIOM_WRITEFLUSH、MMIOM_SEEK
メッセージの送信には使用しないこと。カスタムメッセージは MMIOM_USER 定数以上で定義する。


%index
mmioSetBuffer
mmioSetBuffer 関数は mmioOpen 関数を使用してオープンしたファイルに対し、バッファード I/O の有効化/無効化、またはバッファ・バッファサイズの変更を行う。
%group
Win32 winmm
%prm
hmmio, pchBuffer, cchBuffer, fuBuffer
hmmio : [intptr] ファイルのファイルハンドル。
pchBuffer : [str] バッファード I/O に使用するアプリケーション定義バッファへのポインタ。このパラメータが NULL の場合、mmioSetBuffer はバッファード I/O 用の内部バッファを割り当てる。
cchBuffer : [int] アプリケーション定義バッファのサイズ (文字単位)、または mmioSetBuffer が割り当てるバッファのサイズ。
fuBuffer : [int] 予約。0 でなければならない。
%inst
mmioSetBuffer 関数は mmioOpen 関数を使用してオープンしたファイルに対し、バッファード I/O
の有効化/無効化、またはバッファ・バッファサイズの変更を行う。

[戻り値]
成功時は 0 を、それ以外の場合はエラーを返す。エラーが発生してもファイルハンドルは有効なままである。次の値が定義されている。
（以下省略）

[備考]
内部バッファを使用してバッファリングを有効にするには、pchBuffer を NULL に、cchBuffer
を希望するバッファサイズに設定する。独自のバッファを供給するには、pchBuffer をそのバッファを指すように設定し、cchBuffer
をバッファのサイズに設定する。バッファード I/O を無効にするには、pchBuffer を NULL に、cchBuffer を 0
に設定する。内部バッファを使用してバッファード I/O が既に有効になっている場合、pchBuffer を NULL
に、cchBuffer
を新しいバッファサイズに設定することでバッファのサイズを変更して再割り当てできる。サイズ変更後はバッファの内容が変わる可能性がある。


%index
mmioSetInfo
mmioSetInfo 関数は mmioOpen 関数を使用してオープンしたファイルについて mmioGetInfo 関数で取得した情報を更新する。バッファード I/O 用にオープンされたファイルの直接バッファアクセスを終了するためにこの関数を使用する。
%group
Win32 winmm
%prm
hmmio, pmmioinfo, fuInfo
hmmio : [intptr] ファイルのファイルハンドル。
pmmioinfo : [var] mmioGetInfo 関数によって情報が埋められた MMIOINFO 構造体へのポインタ。
fuInfo : [int] 予約。0 でなければならない。
%inst
mmioSetInfo 関数は mmioOpen 関数を使用してオープンしたファイルについて mmioGetInfo
関数で取得した情報を更新する。バッファード I/O 用にオープンされたファイルの直接バッファアクセスを終了するためにこの関数を使用する。

[戻り値]
成功時は 0 を、それ以外の場合はエラーを返す。

[備考]
ファイル I/O バッファに書き込んだ場合、直接バッファアクセスを終了するために mmioSetInfo を呼び出す前に MMIOINFO
構造体の dwFlags メンバに MMIO_DIRTY フラグをセットする。そうしないとバッファはディスクへフラッシュされない。


%index
mmioStringToFOURCCA
mmioStringToFOURCC 関数は null 終端文字列を 4 文字コードに変換する。(mmioStringToFOURCCA)
%group
Win32 winmm
%prm
sz, uFlags
sz : [str] 4 文字コードに変換する null 終端文字列へのポインタ。
uFlags : [int] 変換のフラグ。次の値が定義されている。
%inst
mmioStringToFOURCC 関数は null 終端文字列を 4 文字コードに変換する。(mmioStringToFOURCCA)

[戻り値]
指定した文字列から作成された 4 文字コードを返す。

[備考]
本関数は文字列を 4
文字コードへコピーし、必要に応じて空白文字でパディングまたは切り詰める。返されるコードが有効かどうかはチェックしない。
> [!NOTE] > mmiscapi.h ヘッダは mmioStringToFOURCC をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
mmioStringToFOURCCW
mmioStringToFOURCCW (Unicode) 関数は null 終端文字列を 4 文字コードに変換する。(mmioStringToFOURCCW)
%group
Win32 winmm
%prm
sz, uFlags
sz : [wstr] 4 文字コードに変換する null 終端文字列へのポインタ。
uFlags : [int] 変換のフラグ。次の値が定義されている。
%inst
mmioStringToFOURCCW (Unicode) 関数は null 終端文字列を 4
文字コードに変換する。(mmioStringToFOURCCW)

[戻り値]
指定した文字列から作成された 4 文字コードを返す。

[備考]
本関数は文字列を 4
文字コードへコピーし、必要に応じて空白文字でパディングまたは切り詰める。返されるコードが有効かどうかはチェックしない。
> [!NOTE] > mmiscapi.h ヘッダは mmioStringToFOURCC をエイリアスとして定義し、UNICODE
プリプロセッサ定数の定義に基づき本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立のエイリアスとそうでないコードを混在させるとコンパイルエラーや実行時エラーの原因となる不一致が発生し得る。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
mmioWrite
mmioWrite 関数は mmioOpen 関数を使用してオープンしたファイルへ指定されたバイト数を書き込む。
%group
Win32 winmm
%prm
hmmio, pch, cch
hmmio : [intptr] ファイルのファイルハンドル。
pch : [str] ファイルへ書き込むバッファへのポインタ。
cch : [int] ファイルへ書き込むバイト数。
%inst
mmioWrite 関数は mmioOpen 関数を使用してオープンしたファイルへ指定されたバイト数を書き込む。

[戻り値]
実際に書き込まれたバイト数を返す。ファイルへの書き込み中にエラーが発生した場合、戻り値は -1 となる。

[備考]
現在のファイル位置は書き込まれたバイト数だけ進む。


%index
sndPlaySoundW
(no summary)
%group
Win32 winmm
%prm
pszSound, fuSound
pszSound : [wstr] 
fuSound : [int] 
%inst



%index
timeKillEvent
(no summary)
%group
Win32 winmm
%prm
uTimerID
uTimerID : [int] 
%inst



%index
timeSetEvent
(no summary)
%group
Win32 winmm
%prm
uDelay, uResolution, fptc, dwUser, fuEvent
uDelay : [int] 
uResolution : [int] 
fptc : [int] 
dwUser : [int] 
fuEvent : [int] 
%inst



%index
waveInClose
waveInClose 関数は指定の波形オーディオ入力デバイスを閉じる。
%group
Win32 winmm
%prm
hwi
hwi : [intptr] 波形オーディオ入力デバイスのハンドル。成功時は呼び出し後ハンドルは無効になる。
%inst
waveInClose 関数は指定の波形オーディオ入力デバイスを閉じる。

[戻り値]
成功時は MMSYSERR_NOERROR、それ以外はエラー値を返す。主なエラーは以下の通り。
（以下省略）

[備考]
waveInAddBuffer
で送信され、アプリに返却されていない入力バッファが残っていると閉じる操作は失敗する。すべての保留中バッファを完了済みにするには
waveInReset を呼ぶこと。


%index
waveInAddBuffer
waveInAddBuffer 関数は指定された波形オーディオ入力デバイスへ入力バッファを送信する。バッファが満たされるとアプリケーションへ通知される。
%group
Win32 winmm
%prm
hwi, pwh, cbwh
hwi : [intptr] 波形オーディオ入力デバイスへのハンドル。
pwh : [var] バッファを識別する WAVEHDR 構造体へのポインタ。
cbwh : [int] WAVEHDR 構造体のサイズ (バイト単位)。
%inst
waveInAddBuffer
関数は指定された波形オーディオ入力デバイスへ入力バッファを送信する。バッファが満たされるとアプリケーションへ通知される。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
バッファが満たされると WAVEHDR 構造体の dwFlags メンバの WHDR_DONE
ビットがセットされる。バッファは本関数に渡される前に waveInPrepareHeader 関数で準備されている必要がある。


%index
waveInGetDevCapsW
(no summary)
%group
Win32 winmm
%prm
uDeviceID, pwic, cbwic
uDeviceID : [int] 
pwic : [var] 
cbwic : [int] 
%inst



%index
waveInGetErrorTextW
(no summary)
%group
Win32 winmm
%prm
mmrError, pszText, cchText
mmrError : [int] 
pszText : [wstr] 
cchText : [int] 
%inst



%index
waveInGetID
waveInGetID 関数は指定された波形オーディオ入力デバイスのデバイス識別子を取得する。
%group
Win32 winmm
%prm
hwi, puDeviceID
hwi : [intptr] 波形オーディオ入力デバイスへのハンドル。
puDeviceID : [var] デバイス識別子が格納される変数へのポインタ。
%inst
waveInGetID 関数は指定された波形オーディオ入力デバイスのデバイス識別子を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
waveInGetNumDevs
waveInGetNumDevs 関数はシステムに存在する波形オーディオ入力デバイスの数を返す。
%group
Win32 winmm
%prm

%inst
waveInGetNumDevs 関数はシステムに存在する波形オーディオ入力デバイスの数を返す。

[戻り値]
デバイスの数を返す。戻り値が 0 の場合はデバイスが存在しないか、エラーが発生したことを意味する。


%index
waveInGetPosition
waveInGetPosition は Windows Vista 以降では使用がサポートされなくなった。
%group
Win32 winmm
%prm
hwi, pmmt, cbmmt
hwi : [intptr] 波形オーディオ入力デバイスへのハンドル。
pmmt : [var] MMTIME 構造体へのポインタ。
cbmmt : [int] MMTIME 構造体のサイズ (バイト単位)。
%inst
waveInGetPosition は Windows Vista 以降では使用がサポートされなくなった。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数を呼び出す前に MMTIME 構造体の wType
メンバを設定して希望する時間形式を指定する。本関数を呼び出した後、希望する時間形式がサポートされているかを wType
で確認する。形式がサポートされていない場合、メンバは代替形式を指定する。デバイスがオープンまたはリセットされたとき、位置は 0
にセットされる。


%index
waveInMessage
waveInMessage 関数は波形オーディオ入力デバイスドライバへメッセージを送信する。
%group
Win32 winmm
%prm
hwi, uMsg, dw1, dw2
hwi : [intptr] メッセージを受け取る波形デバイスの識別子。デバイス ID を HWAVEIN ハンドル型にキャストする必要がある。デバイス ID の代わりにハンドルを渡すと、関数は失敗し MMSYSERR_NOSUPPORT エラーコードを返す。
uMsg : [int] 送信するメッセージ。
dw1 : [int] メッセージパラメータ。
dw2 : [int] メッセージパラメータ。
%inst
waveInMessage 関数は波形オーディオ入力デバイスドライバへメッセージを送信する。

[戻り値]
ドライバから返された値を返す。

[備考]
DRV_QUERYDEVICEINTERFACE メッセージは、waveIn、waveOut、midiIn、midiOut、または
mixer デバイスのデバイスインターフェイス名を問い合わせる。DRV_QUERYDEVICEINTERFACE では、dwParam1
はデバイスインターフェイス名を含む null 終端の Unicode
文字列を関数が書き込む呼び出し側割り当てバッファへのポインタである。デバイスにデバイスインターフェイスがない場合、文字列長は 0
となる。DRV_QUERYDEVICEINTERFACE では、dwParam2
はバッファサイズをバイト単位で指定する。これは関数への入力パラメータである。呼び出し側は
DRV_QUERYDEVICEINTERFACESIZE
メッセージで取得したバッファサイズ以上のサイズを指定するべきである。DRV_QUERYDEVICEINTERFACE メッセージは
Windows Me、Windows 2000 以降でサポートされる。このメッセージは
waveInMessage、waveOutMessage、midiInMessage、midiOutMessage、mixerMessage
関数でのみ有効である。システムはこのメッセージを傍受し、デバイスドライバへ送信せずに適切な値を返す。システム傍受 xxxMessage
関数の一般情報については System-Intercepted Device Messages
を参照。デバイスインターフェイス名の取得を目的として、次の 2 つのメッセージ定数が一緒に使用される。
（以下省略）


%index
waveInOpen
waveInOpen 関数は指定の波形オーディオ入力デバイスを録音用に開く。
%group
Win32 winmm
%prm
phwi, uDeviceID, pwfx, dwCallback, dwInstance, fdwOpen
phwi : [intptr] 開いた波形オーディオ入力デバイスを識別するハンドルを受け取るバッファへのポインタ。fdwOpen で WAVE_FORMAT_QUERY を指定する場合は NULL 可。
uDeviceID : [int] 開く波形オーディオ入力デバイスの識別子。デバイス識別子、または開いているデバイスのハンドル。デバイス識別子の代わりに以下のフラグを使用できる。
pwfx : [var] 録音する波形オーディオデータの希望フォーマットを示す WAVEFORMATEX 構造体へのポインタ。waveInOpen が戻った直後に解放できる。
dwCallback : [int] 録音進捗に関するメッセージを処理するためのコールバック関数、イベントハンドル、ウィンドウハンドル、またはスレッド識別子。不要なら 0。詳細は waveInProc を参照。
dwInstance : [int] コールバック機構に渡されるユーザーインスタンスデータ。ウィンドウコールバック機構では使用しない。
fdwOpen : [int] デバイスを開くときのフラグ。以下の値が定義されている。
%inst
waveInOpen 関数は指定の波形オーディオ入力デバイスを録音用に開く。

[戻り値]
成功時は MMSYSERR_NOERROR、それ以外はエラー値を返す。主なエラーは以下の通り。
（以下省略）

[備考]
システムに存在する波形オーディオ入力デバイス数は waveInGetNumDevs で取得できる。uDeviceID は 0 から
デバイス数-1 までの値、または WAVE_MAPPER 定数を指定できる。
ウィンドウまたはスレッドにコールバック情報を受け取らせる場合、MM_WIM_OPEN、MM_WIM_CLOSE、MM_WIM_DATA
メッセージが送られる。
関数にコールバック情報を受け取らせる場合は WIM_OPEN、WIM_CLOSE、WIM_DATA が送られる。


%index
waveInPrepareHeader
waveInPrepareHeader 関数は波形オーディオ入力用のバッファを準備する。
%group
Win32 winmm
%prm
hwi, pwh, cbwh
hwi : [intptr] 波形オーディオ入力デバイスへのハンドル。
pwh : [var] 準備対象のバッファを識別する WAVEHDR 構造体へのポインタ。
cbwh : [int] WAVEHDR 構造体のサイズ (バイト単位)。
%inst
waveInPrepareHeader 関数は波形オーディオ入力用のバッファを準備する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数を呼び出す前に WAVEHDR 構造体の lpData、dwBufferLength、dwFlags メンバを設定する必要がある
(dwFlags は 0 でなければならない)。


%index
waveInReset
waveInReset 関数は指定された波形オーディオ入力デバイスでの入力を停止し、現在位置を 0 にリセットする。保留中の全バッファは完了とマークされアプリケーションへ返される。
%group
Win32 winmm
%prm
hwi
hwi : [intptr] 波形オーディオ入力デバイスへのハンドル。
%inst
waveInReset 関数は指定された波形オーディオ入力デバイスでの入力を停止し、現在位置を 0
にリセットする。保留中の全バッファは完了とマークされアプリケーションへ返される。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
waveInStart
waveInStart 関数は指定の波形オーディオ入力デバイスでの入力を開始する。
%group
Win32 winmm
%prm
hwi
hwi : [intptr] 波形オーディオ入力デバイスのハンドル。
%inst
waveInStart 関数は指定の波形オーディオ入力デバイスでの入力を開始する。

[戻り値]
成功時は MMSYSERR_NOERROR、それ以外はエラー値を返す。主なエラーは以下の通り。
（以下省略）

[備考]
バッファがいっぱいになったとき、または waveInReset
が呼ばれたときにアプリへ返される。キューにバッファが無い場合はデータは破棄されアプリに通知されず入力は続行される。入力がすでに開始されている場合、この関数は効果を持たず
0 を返す。


%index
waveInStop
waveInStop 関数は波形オーディオ入力を停止する。
%group
Win32 winmm
%prm
hwi
hwi : [intptr] 波形オーディオ入力デバイスのハンドル。
%inst
waveInStop 関数は波形オーディオ入力を停止する。

[戻り値]
成功時は MMSYSERR_NOERROR、それ以外はエラー値を返す。主なエラーは以下の通り。
（以下省略）

[備考]

キューにバッファがある場合、現在のバッファは完了済みとしてマークされるが、空のバッファはキューに残る。入力が開始されていない場合、本関数は効果を持たず
0 を返す。


%index
waveInUnprepareHeader
waveInUnprepareHeader 関数は waveInPrepareHeader 関数で行った準備の後始末を行う。
%group
Win32 winmm
%prm
hwi, pwh, cbwh
hwi : [intptr] 波形オーディオ入力デバイスへのハンドル。
pwh : [var] 後始末対象のバッファを識別する WAVEHDR 構造体へのポインタ。
cbwh : [int] WAVEHDR 構造体のサイズ (バイト単位)。
%inst
waveInUnprepareHeader 関数は waveInPrepareHeader 関数で行った準備の後始末を行う。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数は waveInPrepareHeader
関数と対をなす。バッファを解放する前に本関数を呼び出さなければならない。waveInAddBuffer
関数でデバイスドライバへバッファを渡した後は、ドライバがバッファの使用を終えるまで待ってから waveInUnprepareHeader
を呼び出す必要がある。準備されていないバッファに対する後始末は効果がなく、関数は 0 を返す。


%index
waveOutClose
waveOutClose 関数は指定の波形オーディオ出力デバイスを閉じる。
%group
Win32 winmm
%prm
hwo
hwo : [intptr] 波形オーディオ出力デバイスのハンドル。成功時は呼び出し後ハンドルは無効になる。
%inst
waveOutClose 関数は指定の波形オーディオ出力デバイスを閉じる。

[戻り値]
成功時は MMSYSERR_NOERROR、それ以外はエラー値を返す。主なエラーは以下の通り。
（以下省略）

[備考]
waveOutWrite で送信した波形バッファを再生中の場合、閉じる操作は失敗する。waveOutClose
を呼ぶ前にすべてのバッファの再生完了を待つか、waveOutReset を呼んで再生を終了させる必要がある。


%index
waveOutBreakLoop
waveOutBreakLoop 関数は指定された波形オーディオ出力デバイスのループを中断し、ドライバリスト内の次のブロックで再生を続行できるようにする。
%group
Win32 winmm
%prm
hwo
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
%inst
waveOutBreakLoop
関数は指定された波形オーディオ出力デバイスのループを中断し、ドライバリスト内の次のブロックで再生を続行できるようにする。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]

ループを構成するブロックはループが終了する前に最後まで再生される。何も再生されておらずループもしていない状態で本関数を呼び出しても効果はなく、関数は
0 を返す。


%index
waveOutGetDevCapsW
(no summary)
%group
Win32 winmm
%prm
uDeviceID, pwoc, cbwoc
uDeviceID : [int] 
pwoc : [var] 
cbwoc : [int] 
%inst



%index
waveOutGetErrorTextW
(no summary)
%group
Win32 winmm
%prm
mmrError, pszText, cchText
mmrError : [int] 
pszText : [wstr] 
cchText : [int] 
%inst



%index
waveOutGetID
waveOutGetID 関数は指定された波形オーディオ出力デバイスのデバイス識別子を取得する。
%group
Win32 winmm
%prm
hwo, puDeviceID
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
puDeviceID : [var] デバイス識別子が格納される変数へのポインタ。
%inst
waveOutGetID 関数は指定された波形オーディオ出力デバイスのデバイス識別子を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）


%index
waveOutGetNumDevs
waveOutGetNumDevs 関数はシステムに存在する波形オーディオ出力デバイスの数を取得する。
%group
Win32 winmm
%prm

%inst
waveOutGetNumDevs 関数はシステムに存在する波形オーディオ出力デバイスの数を取得する。

[戻り値]
デバイスの数を返す。戻り値が 0 の場合はデバイスが存在しないか、エラーが発生したことを意味する。


%index
waveOutGetPitch
waveOutGetPitch 関数は指定された波形オーディオ出力デバイスの現在のピッチ設定を取得する。
%group
Win32 winmm
%prm
hwo, pdwPitch
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
pdwPitch : [var] 現在のピッチ倍率設定が格納される変数へのポインタ。ピッチ倍率は元の設定からの現在のピッチの変化を示す。ピッチ倍率は正の値でなければならない。ピッチ倍率は固定小数点値として指定される。変数の上位ワードに数値の符号付き整数部、下位ワードに小数部が格納される。下位ワードの 0x8000 が 1/2、0x4000 が 1/4 を表す。例えば 0x00010000 は倍率 1.0 (ピッチ変化なし) を、0x000F8000 は倍率 15.5 を指定する。
%inst
waveOutGetPitch 関数は指定された波形オーディオ出力デバイスの現在のピッチ設定を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]

ピッチを変更しても再生レート、サンプルレート、再生時間は変化しない。全てのデバイスがピッチ変更をサポートしているわけではない。デバイスがピッチ制御をサポートしているかを判定するには、WAVECAPS_PITCH
フラグを用いて (waveOutGetDevCaps 関数で取得した) WAVEOUTCAPS 構造体の dwSupport
メンバをテストする。


%index
waveOutGetPlaybackRate
waveOutGetPlaybackRate 関数は指定された波形オーディオ出力デバイスの現在の再生レートを取得する。
%group
Win32 winmm
%prm
hwo, pdwRate
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
pdwRate : [var] 現在の再生レートが格納される変数へのポインタ。再生レート設定は元の設定からの現在の再生レートの変化を示す倍率である。再生レート倍率は正の値でなければならない。レートは固定小数点値として指定される。変数の上位ワードに数値の符号付き整数部、下位ワードに小数部が格納される。下位ワードの 0x8000 が 1/2、0x4000 が 1/4 を表す。例えば 0x00010000 は倍率 1.0 (再生レート変化なし) を、0x000F8000 は倍率 15.5 を指定する。
%inst
waveOutGetPlaybackRate 関数は指定された波形オーディオ出力デバイスの現在の再生レートを取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]

再生レートを変更してもサンプルレートは変化しないが、再生時間は変化する。全てのデバイスが再生レート変更をサポートしているわけではない。デバイスが再生レート変更をサポートしているかを判定するには、WAVECAPS_PLAYBACKRATE
フラグを用いて (waveOutGetDevCaps 関数で取得した) WAVEOUTCAPS 構造体の dwSupport
メンバをテストする。


%index
waveOutGetPosition
waveOutGetPosition 関数は指定された波形オーディオ出力デバイスの現在の再生位置を取得する。
%group
Win32 winmm
%prm
hwo, pmmt, cbmmt
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
pmmt : [var] MMTIME 構造体へのポインタ。
cbmmt : [int] MMTIME 構造体のサイズ (バイト単位)。
%inst
waveOutGetPosition 関数は指定された波形オーディオ出力デバイスの現在の再生位置を取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数を呼び出す前に MMTIME 構造体の wType
メンバを設定して希望する時間形式を指定する。本関数を呼び出した後、時間形式がサポートされているかを wType
で確認する。形式がサポートされていない場合、wType は代替形式を指定する。デバイスがオープンまたはリセットされたとき、位置は 0
にセットされる。


%index
waveOutGetVolume
waveOutGetVolume 関数は指定された波形オーディオ出力デバイスの現在の音量レベルを取得する。
%group
Win32 winmm
%prm
hwo, pdwVolume
hwo : [intptr] オープン済み波形オーディオ出力デバイスへのハンドル。デバイス識別子も指定できる。
pdwVolume : [var] 現在の音量設定が格納される変数へのポインタ。下位ワードに左チャネルの音量設定が、上位ワードに右チャネルの設定が格納される。0xFFFF が最大音量、0x0000 が無音を表す。デバイスが左右両チャネルの音量制御をサポートしていない場合、指定された場所の下位ワードにモノラル音量レベルが格納される。waveOutSetVolume 関数で設定した完全な 16 ビットの値が、デバイスが 16 ビット全ての音量制御をサポートしているかどうかにかかわらず返される。
%inst
waveOutGetVolume 関数は指定された波形オーディオ出力デバイスの現在の音量レベルを取得する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
デバイス識別子を使用した場合、waveOutGetVolume 呼び出しの結果と pdwVolume
で返される情報はそのデバイスの全インスタンスに適用される。デバイスハンドルを使用した場合、結果と返される情報はそのデバイスハンドルが参照するインスタンスにのみ適用される。全てのデバイスが音量変更をサポートしているわけではない。デバイスが音量制御をサポートしているかを判定するには、WAVECAPS_VOLUME
フラグを用いて (waveOutGetDevCaps 関数で取得した) WAVEOUTCAPS 構造体の dwSupport
メンバをテストする。デバイスが左右チャネルの音量制御をサポートしているかを判定するには、WAVECAPS_LRVOLUME フラグを用いて
WAVEOUTCAPS 構造体の dwSupport メンバをテストする。音量設定は対数的に解釈される。これは音量レベルを 0x5000
から 0x6000 に上げたときと 0x4000 から 0x5000 に上げたときの音量増加が同じように知覚されることを意味する。


%index
waveOutMessage
waveOutMessage 関数は波形オーディオ出力デバイスドライバへメッセージを送信する。
%group
Win32 winmm
%prm
hwo, uMsg, dw1, dw2
hwo : [intptr] メッセージを受け取る波形デバイスの識別子。デバイス ID を HWAVEOUT ハンドル型にキャストする必要がある。デバイス ID の代わりにハンドルを渡すと、関数は失敗し MMSYSERR_NOSUPPORT エラーコードを返す。
uMsg : [int] 送信するメッセージ。
dw1 : [int] メッセージパラメータ。
dw2 : [int] メッセージパラメータ。
%inst
waveOutMessage 関数は波形オーディオ出力デバイスドライバへメッセージを送信する。

[戻り値]
ドライバから返された値を返す。

[備考]
DRV_QUERYDEVICEINTERFACE メッセージは、waveIn、waveOut、midiIn、midiOut、または
mixer デバイスのデバイスインターフェイス名を問い合わせる。DRV_QUERYDEVICEINTERFACE では、dwParam1
はデバイスインターフェイス名を含む null 終端の Unicode
文字列を関数が書き込む呼び出し側割り当てバッファへのポインタである。デバイスにデバイスインターフェイスがない場合、文字列長は 0
となる。DRV_QUERYDEVICEINTERFACE では、dwParam2
はバッファサイズをバイト単位で指定する。これは関数への入力パラメータである。呼び出し側は
DRV_QUERYDEVICEINTERFACESIZE
メッセージで取得したバッファサイズ以上のサイズを指定するべきである。DRV_QUERYDEVICEINTERFACE メッセージは
Windows Me、Windows 2000 以降でサポートされる。このメッセージは
waveInMessage、waveOutMessage、midiInMessage、midiOutMessage、mixerMessage
関数でのみ有効である。システムはこのメッセージを傍受し、デバイスドライバへ送信せずに適切な値を返す。システム傍受 xxxMessage
関数の一般情報については System-Intercepted Device Messages
を参照。デバイスインターフェイス名の取得を目的として、次の 2 つのメッセージ定数が一緒に使用される。
（以下省略）


%index
waveOutOpen
waveOutOpen 関数は指定の波形オーディオ出力デバイスを再生用に開く。
%group
Win32 winmm
%prm
phwo, uDeviceID, pwfx, dwCallback, dwInstance, fdwOpen
phwo : [intptr] 開いた波形オーディオ出力デバイスを識別するハンドルを受け取るバッファへのポインタ。fdwOpen で WAVE_FORMAT_QUERY を指定する場合は NULL 可。
uDeviceID : [int] 開く波形オーディオ出力デバイスの識別子。デバイス識別子、または開いているデバイスのハンドル。デバイス識別子の代わりに以下のフラグも使用できる:
pwfx : [var] デバイスに送る波形オーディオデータの形式を示す WAVEFORMATEX 構造体へのポインタ。waveOutOpen に渡した直後に解放できる。
dwCallback : [int] コールバック機構を指定する。以下のいずれかである必要がある:
dwInstance : [int] コールバック機構に渡されるユーザーインスタンスデータ。ウィンドウコールバック機構では使用しない。
fdwOpen : [int] デバイスを開くときのフラグ。以下の値が定義されている。
%inst
waveOutOpen 関数は指定の波形オーディオ出力デバイスを再生用に開く。

[戻り値]
成功時は MMSYSERR_NOERROR、それ以外はエラー値を返す。主なエラーは以下の通り。
（以下省略）

[備考]
システムに存在する波形オーディオ出力デバイス数は waveOutGetNumDevs で取得できる。uDeviceID は 0
からデバイス数-1、または WAVE_MAPPER 定数。
pwfx が指す構造体は特定データ形式のためにタイプ固有情報で拡張できる。PCM データでは追加 UINT
でサンプルあたりのビット数を指定し、この場合は PCMWAVEFORMAT を使う。他の形式では WAVEFORMATEX
で追加データ長を指定する。ウィンドウまたはスレッドにコールバック情報を受け取らせる場合、MM_WOM_OPEN、MM_WOM_CLOSE、MM_WOM_DONE
メッセージが送られる。
コールバック機構 dwCallback と fdwOpen で通知方法を指定する。fdwOpen に CALLBACK_FUNCTION
が含まれる場合、dwCallback はコールバック関数ポインタ。関数シグネチャは waveOutProc 参照。
（以下省略）


%index
waveOutPause
waveOutPause 関数は指定された波形オーディオ出力デバイスの再生を一時停止する。現在位置は保存される。現在位置から再生を再開するには waveOutRestart 関数を使用する。
%group
Win32 winmm
%prm
hwo
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
%inst
waveOutPause
関数は指定された波形オーディオ出力デバイスの再生を一時停止する。現在位置は保存される。現在位置から再生を再開するには
waveOutRestart 関数を使用する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
出力が既に一時停止している状態で本関数を呼び出しても効果はなく、関数は 0 を返す。


%index
waveOutPrepareHeader
waveOutPrepareHeader 関数は波形オーディオデータブロックを再生用に準備する。
%group
Win32 winmm
%prm
hwo, pwh, cbwh
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
pwh : [var] 準備対象のデータブロックを識別する WAVEHDR 構造体へのポインタ。
cbwh : [int] WAVEHDR 構造体のサイズ (バイト単位)。
%inst
waveOutPrepareHeader 関数は波形オーディオデータブロックを再生用に準備する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数を呼び出す前に WAVEHDR 構造体の lpData、dwBufferLength、dwFlags
メンバを設定する。dwFlags メンバは 0 に設定する。WAVEHDR 構造体の
dwFlags、dwBufferLength、dwLoops メンバは本関数と waveOutWrite
関数の呼び出しの間で変更できる。waveOutWrite を呼び出す前に dwBufferLength
で指定したサイズを変更する場合、新しい値は準備時の値より小さくなければならない。メソッドが成功した場合、WAVEHDR 構造体の
dwFlags メンバに WHDR_PREPARED フラグがセットされる。既に準備済みのヘッダを準備しても効果はなく、関数は 0
を返す。


%index
waveOutReset
waveOutReset 関数は指定の波形オーディオ出力デバイスでの再生を停止し、現在位置を 0 にリセットする。保留中のすべての再生バッファは WHDR_DONE でマークされアプリに返される。
%group
Win32 winmm
%prm
hwo
hwo : [intptr] 波形オーディオ出力デバイスのハンドル。
%inst
waveOutReset 関数は指定の波形オーディオ出力デバイスでの再生を停止し、現在位置を 0
にリセットする。保留中のすべての再生バッファは WHDR_DONE でマークされアプリに返される。

[戻り値]
成功時は MMSYSERR_NOERROR、それ以外はエラー値を返す。主なエラーは以下の通り。
（以下省略）

[備考]
本関数が戻った後、waveOutWrite で新しい再生バッファを送るか、waveOutClose でデバイスを閉じることができる。


%index
waveOutRestart
waveOutRestart 関数は一時停止された波形オーディオ出力デバイスの再生を再開する。
%group
Win32 winmm
%prm
hwo
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
%inst
waveOutRestart 関数は一時停止された波形オーディオ出力デバイスの再生を再開する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
出力が一時停止していない状態で本関数を呼び出しても効果はなく、関数は 0 を返す。


%index
waveOutSetPitch
waveOutSetPitch 関数は指定された波形オーディオ出力デバイスのピッチを設定する。
%group
Win32 winmm
%prm
hwo, dwPitch
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
dwPitch : [int] 新しいピッチ倍率設定。この設定は元の設定からの現在のピッチの変化を示す。ピッチ倍率は正の値でなければならない。ピッチ倍率は固定小数点値として指定される。上位ワードに数値の符号付き整数部、下位ワードに小数部が格納される。下位ワードの 0x8000 が 1/2、0x4000 が 1/4 を表す。例えば 0x00010000 は倍率 1.0 (ピッチ変化なし) を、0x000F8000 は倍率 15.5 を指定する。
%inst
waveOutSetPitch 関数は指定された波形オーディオ出力デバイスのピッチを設定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]

ピッチを変更しても再生レート、サンプルレート、再生時間は変化しない。全てのデバイスがピッチ変更をサポートしているわけではない。デバイスがピッチ制御をサポートしているかを判定するには、WAVECAPS_PITCH
フラグを用いて (waveOutGetDevCaps 関数で取得した) WAVEOUTCAPS 構造体の dwSupport
メンバをテストする。


%index
waveOutSetPlaybackRate
waveOutSetPlaybackRate 関数は指定された波形オーディオ出力デバイスの再生レートを設定する。
%group
Win32 winmm
%prm
hwo, dwRate
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
dwRate : [int] 新しい再生レート設定。この設定は元の設定からの現在の再生レートの変化を示す倍率である。再生レート倍率は正の値でなければならない。レートは固定小数点値として指定される。上位ワードに数値の符号付き整数部、下位ワードに小数部が格納される。下位ワードの 0x8000 が 1/2、0x4000 が 1/4 を表す。例えば 0x00010000 は倍率 1.0 (再生レート変化なし) を、0x000F8000 は倍率 15.5 を指定する。
%inst
waveOutSetPlaybackRate 関数は指定された波形オーディオ出力デバイスの再生レートを設定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]

再生レートを変更してもサンプルレートは変化しないが、再生時間は変化する。全てのデバイスが再生レート変更をサポートしているわけではない。デバイスが再生レート変更をサポートしているかを判定するには、WAVECAPS_PLAYBACKRATE
フラグを用いて (waveOutGetDevCaps 関数で取得した) WAVEOUTCAPS 構造体の dwSupport
メンバをテストする。


%index
waveOutSetVolume
waveOutSetVolume 関数は指定された波形オーディオ出力デバイスの音量レベルを設定する。
%group
Win32 winmm
%prm
hwo, dwVolume
hwo : [intptr] オープン済み波形オーディオ出力デバイスへのハンドル。デバイス識別子も指定できる。
dwVolume : [int] 新しい音量設定。下位ワードに左チャネルの音量設定を、上位ワードに右チャネルの設定を指定する。0xFFFF が最大音量、0x0000 が無音を表す。デバイスが左右両チャネルの音量制御をサポートしていない場合、dwVolume の下位ワードで音量レベルを指定し、上位ワードは無視される。
%inst
waveOutSetVolume 関数は指定された波形オーディオ出力デバイスの音量レベルを設定する。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
デバイス識別子を使用した場合、waveOutSetVolume
呼び出しの結果はそのデバイスの全インスタンスに適用される。デバイスハンドルを使用した場合、結果はそのデバイスハンドルが参照するインスタンスにのみ適用される。全てのデバイスが音量変更をサポートしているわけではない。デバイスが音量制御をサポートしているかを判定するには、WAVECAPS_VOLUME
フラグを用いて (waveOutGetDevCaps 関数で取得した) WAVEOUTCAPS 構造体の dwSupport
メンバをテストする。デバイスが左右両チャネルの音量制御をサポートしているかを判定するには WAVECAPS_LRVOLUME
フラグを使用する。ほとんどのデバイスは 16
ビット全ての音量レベル制御をサポートしておらず、要求された音量設定の最下位ビットを使用しない。例えばデバイスが 4
ビットの音量制御をサポートしている場合、値 0x4000、0x4FFF、0x43BE は全て 0x4000
に切り詰められる。waveOutGetVolume 関数は waveOutSetVolume で設定された完全な 16
ビット値を返す。音量設定は対数的に解釈される。これは音量レベルを 0x5000 から 0x6000 に上げたときと 0x4000 から
0x5000 に上げたときの音量増加が同じように知覚されることを意味する。


%index
waveOutUnprepareHeader
waveOutUnprepareHeader 関数は waveOutPrepareHeader 関数で行った準備の後始末を行う。本関数はデバイスドライバがデータブロックの使用を終えた後に呼び出さなければならない。バッファを解放する前に本関数を呼び出す必要がある。
%group
Win32 winmm
%prm
hwo, pwh, cbwh
hwo : [intptr] 波形オーディオ出力デバイスへのハンドル。
pwh : [var] 後始末対象のデータブロックを識別する WAVEHDR 構造体へのポインタ。
cbwh : [int] WAVEHDR 構造体のサイズ (バイト単位)。
%inst
waveOutUnprepareHeader 関数は waveOutPrepareHeader
関数で行った準備の後始末を行う。本関数はデバイスドライバがデータブロックの使用を終えた後に呼び出さなければならない。バッファを解放する前に本関数を呼び出す必要がある。

[戻り値]
成功時は MMSYSERR_NOERROR を、それ以外の場合はエラーを返す。考えられるエラー値は次のとおり。
（以下省略）

[備考]
本関数は waveOutPrepareHeader
と対をなす。バッファを解放する前に本関数を呼び出さなければならない。waveOutWrite
関数でデバイスドライバへバッファを渡した後は、ドライバがバッファの使用を終えるまで待ってから waveOutUnprepareHeader
を呼び出す必要がある。準備されていないバッファに対する後始末は効果がなく、関数は 0 を返す。


%index
waveOutWrite
waveOutWrite 関数は指定の波形オーディオ出力デバイスにデータブロックを送る。
%group
Win32 winmm
%prm
hwo, pwh, cbwh
hwo : [intptr] 波形オーディオ出力デバイスのハンドル。
pwh : [var] データブロックの情報を含む WAVEHDR 構造体へのポインタ。
cbwh : [int] WAVEHDR 構造体のサイズ(バイト単位)。
%inst
waveOutWrite 関数は指定の波形オーディオ出力デバイスにデータブロックを送る。

[戻り値]
成功時は MMSYSERR_NOERROR、それ以外はエラー値を返す。主なエラーは以下の通り。
（以下省略）

[備考]
バッファ完了時、WAVEHDR の dwFlags メンバで WHDR_DONE ビットが設定される。waveOutWrite に渡す前に
waveOutPrepareHeader でバッファを準備する必要がある。waveOutPause
で一時停止中でない限り、最初のデータブロック送信時に再生が開始される。

