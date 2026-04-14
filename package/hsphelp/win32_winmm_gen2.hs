; ============================================================
;   winmm.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

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

