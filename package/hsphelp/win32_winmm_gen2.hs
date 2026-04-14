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
The timeGetDevCaps function queries the timer device to determine its resolution.
%group
Win32 winmm
%prm
ptc, cbtc
ptc : [var] A pointer to a TIMECAPS structure. This structure is filled with information about the resolution of the timer device.
cbtc : [int] The size, in bytes, of the TIMECAPS structure.
%inst
The timeGetDevCaps function queries the timer device to determine its
resolution.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error code otherwise.
Possible error codes include the following.
This doc was truncated.


%index
timeGetSystemTime
The timeGetSystemTime function retrieves the system time, in milliseconds.
%group
Win32 winmm
%prm
pmmt, cbmmt
pmmt : [var] Pointer to an MMTIME structure.
cbmmt : [int] Size, in bytes, of the MMTIME structure.
%inst
The timeGetSystemTime function retrieves the system time, in
milliseconds.

[戻り値]
If successful, returns TIMERR_NOERROR. Otherwise, returns an error
code.

[備考]
The system time is returned in the ms member of the MMTIME structure.


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
Closes an installable driver.
%group
Win32 winmm
%prm
hDriver, lParam1, lParam2
hDriver : [intptr] Handle of an installable driver instance. The handle must have been previously created by using the OpenDriver function.
lParam1 : [intptr] 32-bit driver-specific data.
lParam2 : [intptr] 32-bit driver-specific data.
%inst
Closes an installable driver.

[戻り値]
Returns nonzero if successful or zero otherwise.

[備考]
The function passes the lParam1 and lParam2 parameters to the
DriverProc function of the installable driver.


%index
DefDriverProc
Provides default processing for any messages not processed by an installable driver. This function is intended to be used only within the DriverProc function of an installable driver. (DefDriverProc)
%group
Win32 winmm
%prm
dwDriverIdentifier, hdrvr, uMsg, lParam1, lParam2
dwDriverIdentifier : [int] Identifier of the installable driver.
hdrvr : [intptr] Handle of the installable driver instance.
uMsg : [int] Driver message value.
lParam1 : [intptr] 32-bit message-dependent information.
lParam2 : [intptr] 32-bit message-dependent information.
%inst
Provides default processing for any messages not processed by an
installable driver. This function is intended to be used only within
the DriverProc function of an installable driver. (DefDriverProc)

[戻り値]
Returns nonzero if successful or zero otherwise.


%index
DriverCallback
Calls a callback function, sends a message to a window, or unblocks a thread. The action depends on the value of the notification flag. This function is intended to be used only within the DriverProc function of an installable driver.
%group
Win32 winmm
%prm
dwCallback, dwFlags, hDevice, dwMsg, dwUser, dwParam1, dwParam2
dwCallback : [int] Address of the callback function, a window handle, or a task handle, depending on the flag specified in the dwFlags parameter.
dwFlags : [int] Notification flags. It can be one of these values:
hDevice : [intptr] Handle of the installable driver instance.
dwMsg : [int] Message value.
dwUser : [int] 32-bit user-instance data supplied by the application when the device was opened.
dwParam1 : [int] 32-bit message-dependent parameter.
dwParam2 : [int] 32-bit message-dependent parameter.
%inst
Calls a callback function, sends a message to a window, or unblocks a
thread. The action depends on the value of the notification flag.
This function is intended to be used only within the DriverProc
function of an installable driver.

[戻り値]
Returns TRUE if successful or FALSE if a parameter is invalid or the
task's message queue is full.

[備考]
The client specifies how to notify it when the device is opened. The
DCB_FUNCTION and DCB_WINDOW flags are equivalent to the high-order
word of the corresponding flags CALLBACK_FUNCTION and CALLBACK_WINDOW
specified in the lParam2 parameter of the DRV_OPEN message when the
device was opened. If notification is accomplished with a callback
function, hdrvr, msg, dwUser, dwParam1, and dwParam2 are passed to
the callback function. If notification is accomplished by means of a
window, only msg, hdrvr, and dwParam1 are passed to the window.


%index
DrvGetModuleHandle
Retrieves the instance handle of the module that contains the installable driver. This function is provided for compatibility with previous versions of Windows.
%group
Win32 winmm
%prm
hDriver
hDriver : [intptr] Handle of the installable driver instance. The handle must have been previously created by using the OpenDriver function.
%inst
Retrieves the instance handle of the module that contains the
installable driver. This function is provided for compatibility with
previous versions of Windows.

[戻り値]
Returns an instance handle of the driver module if successful or NULL
otherwise.


%index
GetDriverModuleHandle
Retrieves the instance handle of the module that contains the installable driver.
%group
Win32 winmm
%prm
hDriver
hDriver : [intptr] Handle of the installable driver instance. The handle must have been previously created by using the OpenDriver function.
%inst
Retrieves the instance handle of the module that contains the
installable driver.

[戻り値]
Returns an instance handle of the driver module if successful or NULL
otherwise.


%index
OpenDriver
Opens an instance of an installable driver and initializes the instance using either the driver's default settings or a driver-specific value.
%group
Win32 winmm
%prm
szDriverName, szSectionName, lParam2
szDriverName : [wstr] Address of a null-terminated, wide-character string that specifies the filename of an installable driver or the name of a registry value associated with the installable driver. (This value must have been previously set when the driver was installed.)
szSectionName : [wstr] Address of a null-terminated, wide-character string that specifies the name of the registry key containing the registry value given by the lpDriverName parameter. If lpSectionName is NULL, the registry key is assumed to be Drivers32.
lParam2 : [intptr] 32-bit driver-specific value. This value is passed as the lParam2 parameter to the DriverProc function of the installable driver.
%inst
Opens an instance of an installable driver and initializes the
instance using either the driver's default settings or a
driver-specific value.

[戻り値]
Returns the handle of the installable driver instance if successful
or NULL otherwise.


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
Sends the specified message to the installable driver.
%group
Win32 winmm
%prm
hDriver, message, lParam1, lParam2
hDriver : [intptr] Handle of the installable driver instance. The handle must been previously created by using the OpenDriver function.
message : [int] Driver message value. It can be a custom message value or one of these standard message values.
lParam1 : [intptr] 32-bit message-dependent information.
lParam2 : [intptr] 32-bit message-dependent information.
%inst
Sends the specified message to the installable driver.

[戻り値]
Returns nonzero if successful or zero otherwise.


%index
auxGetDevCapsW
The auxGetDevCapsW (Unicode) function (mmeapi.h) retrieves the capabilities of a given auxiliary output device.
%group
Win32 winmm
%prm
uDeviceID, pac, cbac
uDeviceID : [int] Identifier of the auxiliary output device to be queried. Specify a valid device identifier (see the following comments section), or use the following constant:
pac : [var] Pointer to an AUXCAPS structure to be filled with information about the capabilities of the device.
cbac : [int] Size, in bytes, of the AUXCAPS structure.
%inst
The auxGetDevCapsW (Unicode) function (mmeapi.h) retrieves the
capabilities of a given auxiliary output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
The device identifier in uDeviceID varies from zero to one less than
the number of devices present. AUX_MAPPER may also be used. Use the
auxGetNumDevs function to determine the number of auxiliary output
devices present in the system.
> [!NOTE] > The mmeapi.h header defines auxGetDevCaps as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
auxGetNumDevs
The auxGetNumDevs function retrieves the number of auxiliary output devices present in the system.
%group
Win32 winmm
%prm

%inst
The auxGetNumDevs function retrieves the number of auxiliary output
devices present in the system.

[戻り値]
Returns the number of device. A return value of zero means that no
devices are present or that an error occurred.


%index
auxGetVolume
The auxGetVolume function retrieves the current volume setting of the specified auxiliary output device.
%group
Win32 winmm
%prm
uDeviceID, pdwVolume
uDeviceID : [int] Identifier of the auxiliary output device to be queried.
pdwVolume : [var] Pointer to a variable to be filled with the current volume setting. The low-order word of this location contains the left channel volume setting, and the high-order word contains the right channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence. If a device does not support both left and right volume control, the low-order word of the specified location contains the volume level. The full 16-bit setting(s) set with the auxSetVolume function are returned, regardless of whether the device supports the full 16 bits of volume-level control.
%inst
The auxGetVolume function retrieves the current volume setting of the
specified auxiliary output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Not all devices support volume control. To determine whether a device
supports volume control, use the AUXCAPS_VOLUME flag to test the
dwSupport member of the AUXCAPS structure (filled by the
auxGetDevCaps function). To determine whether a device supports
volume control on both the left and right channels, use the
AUXCAPS_LRVOLUME flag to test the dwSupport member of the AUXCAPS
structure (filled by auxGetDevCaps).


%index
auxOutMessage
The auxOutMessage function sends a message to the given auxiliary output device. This function also performs error checking on the device identifier passed as part of the message.
%group
Win32 winmm
%prm
uDeviceID, uMsg, dw1, dw2
uDeviceID : [int] Identifier of the auxiliary output device to receive the message.
uMsg : [int] Message to send.
dw1 : [int] Message parameter.
dw2 : [int] Message parameter.
%inst
The auxOutMessage function sends a message to the given auxiliary
output device. This function also performs error checking on the
device identifier passed as part of the message.

[戻り値]
Returns the message return value.

[備考]
The DRV_QUERYDEVICEINTERFACE message queries for the device-interface
name of a waveIn, waveOut, midiIn, midiOut, or mixer device. For
DRV_QUERYDEVICEINTERFACE, dwParam1 is a pointer to a caller-allocated
buffer into which the function writes a null-terminated Unicode
string containing the device-interface name. If the device has no
device interface, the string length is zero. For
DRV_QUERYDEVICEINTERFACE, dwParam2 specifies the buffer size in
bytes. This is an input parameter to the function. The caller should
specify a size that is greater than or equal to the buffer size
retrieved by the DRV_QUERYDEVICEINTERFACESIZE message. The
DRV_QUERYDEVICEINTERFACE message is supported in Windows Me, and
Windows 2000 and later. This message is valid only for the
waveInMessage, waveOutMessage, midiInMessage, midiOutMessage, and
mixerMessage functions. The system intercepts this message and
returns the appropriate value without sending the message to the
device driver. For general information about system-intercepted
xxxMessage functions, see System-Intercepted Device Messages. The
following two message constants are used together for the purpose of
obtaining device interface names:
This doc was truncated.


%index
auxSetVolume
The auxSetVolume function sets the volume of the specified auxiliary output device.
%group
Win32 winmm
%prm
uDeviceID, dwVolume
uDeviceID : [int] Identifier of the auxiliary output device to be queried. Device identifiers are determined implicitly from the number of devices present in the system. Device identifier values range from zero to one less than the number of devices present. Use the auxGetNumDevs function to determine the number of auxiliary devices in the system.
dwVolume : [int] Specifies the new volume setting. The low-order word specifies the left-channel volume setting, and the high-order word specifies the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence. If a device does not support both left and right volume control, the low-order word of dwVolume specifies the volume level, and the high-order word is ignored.
%inst
The auxSetVolume function sets the volume of the specified auxiliary
output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Not all devices support volume control. To determine whether the
device supports volume control, use the AUXCAPS_VOLUME flag to test
the dwSupport member of the AUXCAPS structure (filled by the
auxGetDevCaps function). To determine whether the device supports
volume control on both the left and right channels, use the
AUXCAPS_LRVOLUME flag to test the dwSupport member of the AUXCAPS
structure (filled by auxGetDevCaps). Most devices do not support the
full 16 bits of volume-level control and will use only the high-order
bits of the requested volume setting. For example, for a device that
supports 4 bits of volume control, requested volume level values of
0x4000, 0x4FFF, and 0x43BE will produce the same physical volume
setting, 0x4000. The auxGetVolume function will return the full
16-bit setting set with auxSetVolume. Volume settings are interpreted
logarithmically. This means the perceived volume increase is the same
when increasing the volume level from 0x5000 to 0x6000 as it is from
0x4000 to 0x5000.


%index
joyConfigChanged
The joyConfigChanged function informs the joystick driver that the configuration has changed and should be reloaded from the registry.
%group
Win32 winmm
%prm
dwFlags
dwFlags : [int] Reserved for future use. Must equal zero.
%inst
The joyConfigChanged function informs the joystick driver that the
configuration has changed and should be reloaded from the registry.

[戻り値]
Returns JOYERR_NOERROR if successful. Returns JOYERR_PARMS if the
parameter is non-zero.

[備考]
This function causes a window message to be sent to all top-level
windows. This message may be defined by applications that need to
respond to changes in joystick calibration by using
RegisterWindowMessage with the following message ID:
This doc was truncated.


%index
joyGetDevCapsW
The joyGetDevCapsW (Unicode) function queries a joystick to determine its comprehensive capabilities.
%group
Win32 winmm
%prm
uJoyID, pjc, cbjc
uJoyID : [int] Identifier of the joystick to be queried. Valid values for uJoyID range from -1 to 15. A value of -1 enables retrieval of the szRegKey member of the JOYCAPS structure whether a device is present or not.
pjc : [var] Pointer to a JOYCAPS structure to contain the capabilities of the joystick.
cbjc : [int] Size, in bytes, of the JOYCAPS structure.
%inst
The joyGetDevCapsW (Unicode) function queries a joystick to determine
its comprehensive capabilities.

[戻り値]
Returns JOYERR_NOERROR if successful or one of the following error
values:
This doc was truncated.

[備考]
Use the joyGetNumDevs function to determine the number of joystick
devices supported by the driver.
This method fails when passed an invalid value for the cbjc
parameter.
> [!NOTE] > The joystickapi.h header defines joyGetDevCaps as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
joyGetNumDevs
The joyGetNumDevs function queries the joystick driver for the number of joysticks it supports.
%group
Win32 winmm
%prm

%inst
The joyGetNumDevs function queries the joystick driver for the number
of joysticks it supports.

[戻り値]
The joyGetNumDevs function returns the number of joysticks supported
by the current driver or zero if no driver is installed.

[備考]
Use the joyGetPos function to determine whether a given joystick is
physically attached to the system. If the specified joystick is not
connected, joyGetPos returns a JOYERR_UNPLUGGED error value.


%index
joyGetPos
The joyGetPos function queries a joystick for its position and button status.
%group
Win32 winmm
%prm
uJoyID, pji
uJoyID : [int] Identifier of the joystick to be queried. Valid values for uJoyID range from zero (JOYSTICKID1) to 15.
pji : [var] Pointer to a JOYINFO structure that contains the position and button status of the joystick.
%inst
The joyGetPos function queries a joystick for its position and button
status.

[戻り値]
Returns JOYERR_NOERROR if successful or one of the following error
values.
This doc was truncated.

[備考]
For devices that have four to six axes of movement, a point-of-view
control, or more than four buttons, use the joyGetPosEx function.


%index
joyGetPosEx
The joyGetPosEx function queries a joystick for its position and button status.
%group
Win32 winmm
%prm
uJoyID, pji
uJoyID : [int] Identifier of the joystick to be queried. Valid values for uJoyID range from zero (JOYSTICKID1) to 15.
pji : [var] Pointer to a JOYINFOEX structure that contains extended position information and button status of the joystick. You must set the dwSize and dwFlags members or joyGetPosEx will fail. The information returned from joyGetPosEx depends on the flags you specify in dwFlags.
%inst
The joyGetPosEx function queries a joystick for its position and
button status.

[戻り値]
Returns JOYERR_NOERROR if successful or one of the following error
values.
This doc was truncated.

[備考]
This function provides access to extended devices such as rudder
pedals, point-of-view hats, devices with a large number of buttons,
and coordinate systems using up to six axes. For joystick devices
that use three axes or fewer and have fewer than four buttons, use
the joyGetPos function.


%index
joyGetThreshold
The joyGetThreshold function queries a joystick for its current movement threshold.
%group
Win32 winmm
%prm
uJoyID, puThreshold
uJoyID : [int] Identifier of the joystick. Valid values for uJoyID range from zero (JOYSTICKID1) to 15.
puThreshold : [var] Pointer to a variable that contains the movement threshold value.
%inst
The joyGetThreshold function queries a joystick for its current
movement threshold.

[戻り値]
Returns JOYERR_NOERROR if successful or one of the following error
values.
This doc was truncated.

[備考]
The movement threshold is the distance the joystick must be moved
before a joystick position-change message (MM_JOY1MOVE, MM_JOY1ZMOVE,
MM_JOY2MOVE, or MM_JOY2ZMOVE) is sent to a window that has captured
the device. The threshold is initially zero.


%index
joyReleaseCapture
The joyReleaseCapture function releases the specified captured joystick.
%group
Win32 winmm
%prm
uJoyID
uJoyID : [int] Identifier of the joystick to be released. Valid values for uJoyID range from zero (JOYSTICKID1) to 15.
%inst
The joyReleaseCapture function releases the specified captured
joystick.

[戻り値]
Returns JOYERR_NOERROR if successful or one of the following error
values.
This doc was truncated.

[備考]
This method returns JOYERR_NOERROR when passed a valid joystick
identifier that has not been captured.


%index
joySetCapture
The joySetCapture function captures a joystick by causing its messages to be sent to the specified window.
%group
Win32 winmm
%prm
hwnd, uJoyID, uPeriod, fChanged
hwnd : [intptr] Handle to the window to receive the joystick messages.
uJoyID : [int] Identifier of the joystick to be captured. Valid values for uJoyID range from zero (JOYSTICKID1) to 15.
uPeriod : [int] Polling frequency, in milliseconds.
fChanged : [int] Change position flag. Specify TRUE for this parameter to send messages only when the position changes by a value greater than the joystick movement threshold. Otherwise, messages are sent at the polling frequency specified in uPeriod.
%inst
The joySetCapture function captures a joystick by causing its
messages to be sent to the specified window.

[戻り値]
Returns JOYERR_NOERROR if successful or one of the following error
values.
This doc was truncated.

[備考]
If the specified joystick is currently captured, the function returns
undefined behavior. Call the joyReleaseCapture function to release
the captured joystick, or destroy the window to release the joystick
automatically.


%index
joySetThreshold
The joySetThreshold function sets the movement threshold of a joystick.
%group
Win32 winmm
%prm
uJoyID, uThreshold
uJoyID : [int] Identifier of the joystick. Valid values for uJoyID range from zero (JOYSTICKID1) to 15.
uThreshold : [int] New movement threshold.
%inst
The joySetThreshold function sets the movement threshold of a
joystick.

[戻り値]
Returns JOYERR_NOERROR if successful or one of the following error
values.
This doc was truncated.

[備考]
The movement threshold is the distance the joystick must be moved
before a joystick position-change message (MM_JOY1MOVE, MM_JOY1ZMOVE,
MM_JOY2MOVE, or MM_JOY2ZMOVE) is sent to a window that has captured
the device. The threshold is initially zero.


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
The midiOutClose function closes the specified MIDI output device.
%group
Win32 winmm
%prm
hmo
hmo : [intptr] Handle to the MIDI output device. If the function is successful, the handle is no longer valid after the call to this function.
%inst
The midiOutClose function closes the specified MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If there are output buffers that have been sent by using the
midiOutLongMsg function and have not been returned to the
application, the close operation will fail. To mark all pending
buffers as being done, use the midiOutReset function.


%index
midiConnect
The midiConnect function connects a MIDI input device to a MIDI thru or output device, or connects a MIDI thru device to a MIDI output device.
%group
Win32 winmm
%prm
hmi, hmo, pReserved
hmi : [intptr] Handle to a MIDI input device or a MIDI thru device. (For thru devices, this handle must have been returned by a call to the midiOutOpen function.)
hmo : [intptr] Handle to the MIDI output or thru device.
pReserved : [intptr] Reserved; must be NULL.
%inst
The midiConnect function connects a MIDI input device to a MIDI thru
or output device, or connects a MIDI thru device to a MIDI output
device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
After calling this function, the MIDI input device receives event
data in an MIM_DATA message whenever a message with the same event
data is sent to the output device driver. A thru driver is a special
form of MIDI output driver. The system will allow only one MIDI
output device to be connected to a MIDI input device, but multiple
MIDI output devices can be connected to a MIDI thru device. Whenever
the given MIDI input device receives event data in an MIM_DATA
message, a message with the same event data is sent to the given
output device driver (or through the thru driver to the output
drivers).


%index
midiDisconnect
The midiDisconnect function disconnects a MIDI input device from a MIDI thru or output device, or disconnects a MIDI thru device from a MIDI output device.
%group
Win32 winmm
%prm
hmi, hmo, pReserved
hmi : [intptr] Handle to a MIDI input device or a MIDI thru device.
hmo : [intptr] Handle to the MIDI output device to be disconnected.
pReserved : [intptr] Reserved; must be NULL.
%inst
The midiDisconnect function disconnects a MIDI input device from a
MIDI thru or output device, or disconnects a MIDI thru device from a
MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following:.
This doc was truncated.

[備考]
MIDI input, output, and thru devices can be connected by using the
midiConnect function. Thereafter, whenever the MIDI input device
receives event data in an MIM_DATA message, a message with the same
event data is sent to the output device driver (or through the thru
driver to the output drivers).


%index
midiInClose
The midiInClose function closes the specified MIDI input device.
%group
Win32 winmm
%prm
hmi
hmi : [intptr] Handle to the MIDI input device. If the function is successful, the handle is no longer valid after the call to this function.
%inst
The midiInClose function closes the specified MIDI input device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If there are input buffers that have been sent by using the
midiInAddBuffer function and have not been returned to the
application, the close operation will fail. To return all pending
buffers through the callback function, use the midiInReset function.


%index
midiInAddBuffer
The midiInAddBuffer function sends an input buffer to a specified opened MIDI input device. This function is used for system-exclusive messages.
%group
Win32 winmm
%prm
hmi, pmh, cbmh
hmi : [intptr] Handle to the MIDI input device.
pmh : [var] Pointer to a MIDIHDR structure that identifies the buffer.
cbmh : [int] Size, in bytes, of the MIDIHDR structure.
%inst
The midiInAddBuffer function sends an input buffer to a specified
opened MIDI input device. This function is used for system-exclusive
messages.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
When the buffer is filled, it is sent back to the application. The
buffer must be prepared by using the midiInPrepareHeader function
before it is passed to the midiInAddBuffer function.


%index
midiInGetDevCapsW
The midiInGetDevCapsW (Unicode) function (mmeapi.h) determines the capabilities of a specified MIDI input device.
%group
Win32 winmm
%prm
uDeviceID, pmic, cbmic
uDeviceID : [int] Identifier of the MIDI input device. The device identifier varies from zero to one less than the number of devices present. This parameter can also be a properly cast device handle.
pmic : [var] Pointer to a MIDIINCAPS structure that is filled with information about the capabilities of the device.
cbmic : [int] Size, in bytes, of the MIDIINCAPS structure. Only cbMidiInCaps bytes (or less) of information is copied to the location pointed to by lpMidiInCaps. If cbMidiInCaps is zero, nothing is copied, and the function returns MMSYSERR_NOERROR.
%inst
The midiInGetDevCapsW (Unicode) function (mmeapi.h) determines the
capabilities of a specified MIDI input device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
To determine the number of MIDI input devices present on the system,
use the midiInGetNumDevs function.
> [!NOTE] > The mmeapi.h header defines midiInGetDevCaps as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
midiInGetErrorTextW
The midiInGetErrorTextW (Unicode) function (mmeapi.h) retrieves a textual description for an error identified by the specified error code.
%group
Win32 winmm
%prm
mmrError, pszText, cchText
mmrError : [int] Error code.
pszText : [wstr] Pointer to the buffer to be filled with the textual error description.
cchText : [int] Length, in characters, of the buffer pointed to by lpText.
%inst
The midiInGetErrorTextW (Unicode) function (mmeapi.h) retrieves a
textual description for an error identified by the specified error
code.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If the textual error description is longer than the specified buffer,
the description is truncated. The returned error string is always
null-terminated. If cchText is zero, nothing is copied, and the
function returns zero. All error descriptions are less than
MAXERRORLENGTH characters long.
> [!NOTE] > The mmeapi.h header defines midiInGetErrorText as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
midiInGetID
The midiInGetID function gets the device identifier for the given MIDI input device.
%group
Win32 winmm
%prm
hmi, puDeviceID
hmi : [intptr] Handle to the MIDI input device.
puDeviceID : [var] Pointer to a variable to be filled with the device identifier.
%inst
The midiInGetID function gets the device identifier for the given
MIDI input device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


%index
midiInGetNumDevs
The midiInGetNumDevs function retrieves the number of MIDI input devices in the system.
%group
Win32 winmm
%prm

%inst
The midiInGetNumDevs function retrieves the number of MIDI input
devices in the system.

[戻り値]
Returns the number of MIDI input devices present in the system. A
return value of zero means that there are no devices (not that there
is no error).


%index
midiInMessage
The midiInMessage function sends a message to the MIDI device driver.
%group
Win32 winmm
%prm
hmi, uMsg, dw1, dw2
hmi : [intptr] Identifier of the MIDI device that receives the message. You must cast the device ID to the HMIDIIN handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
uMsg : [int] Message to send.
dw1 : [int] Message parameter.
dw2 : [int] Message parameter.
%inst
The midiInMessage function sends a message to the MIDI device driver.

[戻り値]
Returns the value returned by the audio device driver.

[備考]
This function is used only for driver-specific messages that are not
supported by the MIDI API. The DRV_QUERYDEVICEINTERFACE message
queries for the device-interface name of a waveIn, waveOut, midiIn,
midiOut, or mixer device. For DRV_QUERYDEVICEINTERFACE, dwParam1 is a
pointer to a caller-allocated buffer into which the function writes a
null-terminated Unicode string containing the device-interface name.
If the device has no device interface, the string length is zero. For
DRV_QUERYDEVICEINTERFACE, dwParam2 specifies the buffer size in
bytes. This is an input parameter to the function. The caller should
specify a size that is greater than or equal to the buffer size
retrieved by the DRV_QUERYDEVICEINTERFACESIZE message. The
DRV_QUERYDEVICEINTERFACE message is supported in Windows Me, and
Windows 2000 and later. This message is valid only for the
waveInMessage, waveOutMessage, midiInMessage, midiOutMessage, and
mixerMessage functions. The system intercepts this message and
returns the appropriate value without sending the message to the
device driver. For general information about system-intercepted
xxxMessage functions, see System-Intercepted Device Messages. The
following two message constants are used together for the purpose of
obtaining device interface names:
This doc was truncated.


%index
midiInOpen
The midiInOpen function opens a specified MIDI input device.
%group
Win32 winmm
%prm
phmi, uDeviceID, dwCallback, dwInstance, fdwOpen
phmi : [intptr] Pointer to an HMIDIIN handle. This location is filled with a handle identifying the opened MIDI input device. The handle is used to identify the device in calls to other MIDI input functions.
uDeviceID : [int] Identifier of the MIDI input device to be opened.
dwCallback : [int] Pointer to a callback function, a thread identifier, or a handle of a window called with information about incoming MIDI messages. For more information on the callback function, see MidiInProc.
dwInstance : [int] User instance data passed to the callback function. This parameter is not used with window callback functions or threads.
fdwOpen : [int] Callback flag for opening the device and, optionally, a status flag that helps regulate rapid data transfers. It can be the following values.
%inst
The midiInOpen function opens a specified MIDI input device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following/
This doc was truncated.

[備考]
To determine the number of MIDI input devices present in the system,
use the midiInGetNumDevs function. The device identifier specified by
wDeviceID varies from zero to one less than the number of devices
present. If a window or thread is chosen to receive callback
information, the following messages are sent to the window procedure
or thread to indicate the progress of MIDI input: MM_MIM_OPEN,
MM_MIM_CLOSE, MM_MIM_DATA, MM_MIM_LONGDATA, MM_MIM_ERROR,
MM_MIM_LONGERROR, and MM_MIM_MOREDATA. If a function is chosen to
receive callback information, the following messages are sent to the
function to indicate the progress of MIDI input: MIM_OPEN, MIM_CLOSE,
MIM_DATA, MIM_LONGDATA, MIM_ERROR, MIM_LONGERROR, and MIM_MOREDATA.


%index
midiInPrepareHeader
The midiInPrepareHeader function prepares a buffer for MIDI input.
%group
Win32 winmm
%prm
hmi, pmh, cbmh
hmi : [intptr] Handle to the MIDI input device. To get the device handle, call midiInOpen.
pmh : [var] Pointer to a MIDIHDR structure that identifies the buffer to be prepared.
cbmh : [int] Size, in bytes, of the MIDIHDR structure.
%inst
The midiInPrepareHeader function prepares a buffer for MIDI input.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Before you pass a MIDI data block to a device driver, you must
prepare the buffer by passing it to the midiInPrepareHeader function.
After the header has been prepared, do not modify the buffer. After
the driver is done using the buffer, call the midiInUnprepareHeader
function. The application can re-use the same buffer, or allocate
multiple buffers and call midiInPrepareHeader for each buffer. If you
re-use the same buffer, it is not necessary to prepare the buffer
each time. You can call midiInPrepareHeader once at the beginning and
then call midiInUnprepareHeader once at the end. Preparing a header
that has already been prepared has no effect, and the function
returns zero.


%index
midiInReset
The midiInReset function stops input on a given MIDI input device.
%group
Win32 winmm
%prm
hmi
hmi : [intptr] Handle to the MIDI input device.
%inst
The midiInReset function stops input on a given MIDI input device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
This function returns all pending input buffers to the callback
function and sets the MHDR_DONE flag in the dwFlags member of the
MIDIHDR structure.


%index
midiInStart
The midiInStart function starts MIDI input on the specified MIDI input device.
%group
Win32 winmm
%prm
hmi
hmi : [intptr] Handle to the MIDI input device.
%inst
The midiInStart function starts MIDI input on the specified MIDI
input device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following
This doc was truncated.

[備考]
This function resets the time stamp to zero; time stamp values for
subsequently received messages are relative to the time that this
function was called. All messages except system-exclusive messages
are sent directly to the client when they are received.
System-exclusive messages are placed in the buffers supplied by the
midiInAddBuffer function. If there are no buffers in the queue, the
system-exclusive data is thrown away without notification to the
client and input continues. Buffers are returned to the client when
they are full, when a complete system-exclusive message has been
received, or when the midiInReset function is used. The
dwBytesRecorded member of the MIDIHDR structure will contain the
actual length of data received. Calling this function when input is
already started has no effect, and the function returns zero.


%index
midiInStop
The midiInStop function stops MIDI input on the specified MIDI input device.
%group
Win32 winmm
%prm
hmi
hmi : [intptr] Handle to the MIDI input device.
%inst
The midiInStop function stops MIDI input on the specified MIDI input
device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If there are any system-exclusive messages or stream buffers in the
queue, the current buffer is marked as done (the dwBytesRecorded
member of the MIDIHDR structure will contain the actual length of
data), but any empty buffers in the queue remain there and are not
marked as done. Calling this function when input is not started has
no effect, and the function returns zero.


%index
midiInUnprepareHeader
The midiInUnprepareHeader function cleans up the preparation performed by the midiInPrepareHeader function.
%group
Win32 winmm
%prm
hmi, pmh, cbmh
hmi : [intptr] Handle to the MIDI input device.
pmh : [var] Pointer to a MIDIHDR structure identifying the buffer to be cleaned up.
cbmh : [int] Size of the MIDIHDR structure.
%inst
The midiInUnprepareHeader function cleans up the preparation
performed by the midiInPrepareHeader function.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
This function is complementary to midiInPrepareHeader. You must use
this function before freeing the buffer. After passing a buffer to
the device driver by using the midiInAddBuffer function, you must
wait until the driver is finished with the buffer before using
midiInUnprepareHeader. Unpreparing a buffer that has not been
prepared has no effect, and the function returns MMSYSERR_NOERROR.


%index
midiOutCacheDrumPatches
The midiOutCacheDrumPatches function requests that an internal MIDI synthesizer device preload and cache a specified set of key-based percussion patches.
%group
Win32 winmm
%prm
hmo, uPatch, pwkya, fuCache
hmo : [intptr] Handle to the opened MIDI output device. This device should be an internal MIDI synthesizer. This parameter can also be the handle of a MIDI stream, cast to HMIDIOUT.
uPatch : [int] Drum patch number that should be used. This parameter should be set to zero to cache the default drum patch.
pwkya : [var] Pointer to a KEYARRAY array indicating the key numbers of the specified percussion patches to be cached or uncached.
fuCache : [int] Options for the cache operation. It can be one of the following flags.
%inst
The midiOutCacheDrumPatches function requests that an internal MIDI
synthesizer device preload and cache a specified set of key-based
percussion patches.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Some synthesizers are not capable of keeping all percussion patches
loaded simultaneously. Caching patches ensures that the specified
patches are available. Each element of the KEYARRAY array represents
one of the 128 key-based percussion patches and has bits set for each
of the 16 MIDI channels that use the particular patch. The
least-significant bit represents physical channel 0, and the
most-significant bit represents physical channel 15. For example, if
the patch on key number 60 is used by physical channels 9 and 15,
element 60 would be set to 0x8200. This function applies only to
internal MIDI synthesizer devices. Not all internal synthesizers
support patch caching. To see if a device supports patch caching, use
the MIDICAPS_CACHE flag to test the dwSupport member of the
MIDIOUTCAPS structure filled by the midiOutGetDevCaps function.


%index
midiOutCachePatches
The midiOutCachePatches function requests that an internal MIDI synthesizer device preload and cache a specified set of patches.
%group
Win32 winmm
%prm
hmo, uBank, pwpa, fuCache
hmo : [intptr] Handle to the opened MIDI output device. This device must be an internal MIDI synthesizer. This parameter can also be the handle of a MIDI stream, cast to HMIDIOUT.
uBank : [int] Bank of patches that should be used. This parameter should be set to zero to cache the default patch bank.
pwpa : [var] Pointer to a PATCHARRAY array indicating the patches to be cached or uncached.
fuCache : [int] Options for the cache operation. It can be one of the following flags.
%inst
The midiOutCachePatches function requests that an internal MIDI
synthesizer device preload and cache a specified set of patches.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Some synthesizers are not capable of keeping all patches loaded
simultaneously and must load data from disk when they receive MIDI
program change messages. Caching patches ensures that the specified
patches are immediately available. Each element of the PATCHARRAY
array represents one of the 128 patches and has bits set for each of
the 16 MIDI channels that use the particular patch. The
least-significant bit represents physical channel 0, and the
most-significant bit represents physical channel 15 (0x0F). For
example, if patch 0 is used by physical channels 0 and 8, element 0
would be set to 0x0101. This function applies only to internal MIDI
synthesizer devices. Not all internal synthesizers support patch
caching. To see if a device supports patch caching, use the
MIDICAPS_CACHE flag to test the dwSupport member of the MIDIOUTCAPS
structure filled by the midiOutGetDevCaps function.


%index
midiOutGetDevCapsW
The midiOutGetDevCapsW (Unicode) function (mmeapi.h) queries a specified MIDI output device to determine its capabilities.
%group
Win32 winmm
%prm
uDeviceID, pmoc, cbmoc
uDeviceID : [int] Identifier of the MIDI output device. The device identifier specified by this parameter varies from zero to one less than the number of devices present. The MIDI_MAPPER constant is also a valid device identifier. This parameter can also be a properly cast device handle.
pmoc : [var] Pointer to a MIDIOUTCAPS structure. This structure is filled with information about the capabilities of the device.
cbmoc : [int] Size, in bytes, of the MIDIOUTCAPS structure. Only cbMidiOutCaps bytes (or less) of information is copied to the location pointed to by lpMidiOutCaps. If cbMidiOutCaps is zero, nothing is copied, and the function returns MMSYSERR_NOERROR.
%inst
The midiOutGetDevCapsW (Unicode) function (mmeapi.h) queries a
specified MIDI output device to determine its capabilities.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
To determine the number of MIDI output devices present in the system,
use the midiOutGetNumDevs function.
> [!NOTE] > The mmeapi.h header defines midiOutGetDevCaps as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
midiOutGetErrorTextW
The midiOutGetErrorTextW (Unicode) function (mmeapi.h) retrieves a textual description for an error identified by the specified error code.
%group
Win32 winmm
%prm
mmrError, pszText, cchText
mmrError : [int] Error code.
pszText : [wstr] Pointer to a buffer to be filled with the textual error description.
cchText : [int] Length, in characters, of the buffer pointed to by lpText.
%inst
The midiOutGetErrorTextW (Unicode) function (mmeapi.h) retrieves a
textual description for an error identified by the specified error
code.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If the textual error description is longer than the specified buffer,
the description is truncated. The returned error string is always
null-terminated. If cchText is zero, nothing is copied, and the
function returns MMSYSERR_NOERROR. All error descriptions are less
than MAXERRORLENGTH characters long.
> [!NOTE] > The mmeapi.h header defines midiOutGetErrorText as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
midiOutGetID
The midiOutGetID function retrieves the device identifier for the given MIDI output device.
%group
Win32 winmm
%prm
hmo, puDeviceID
hmo : [intptr] Handle to the MIDI output device.
puDeviceID : [var] Pointer to a variable to be filled with the device identifier.
%inst
The midiOutGetID function retrieves the device identifier for the
given MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


%index
midiOutGetNumDevs
The midiOutGetNumDevs function retrieves the number of MIDI output devices present in the system.
%group
Win32 winmm
%prm

%inst
The midiOutGetNumDevs function retrieves the number of MIDI output
devices present in the system.

[戻り値]
Returns the number of MIDI output devices. A return value of zero
means that there are no devices (not that there is no error).


%index
midiOutGetVolume
The midiOutGetVolume function retrieves the current volume setting of a MIDI output device.
%group
Win32 winmm
%prm
hmo, pdwVolume
hmo : [intptr] Handle to an open MIDI output device. This parameter can also contain the handle of a MIDI stream, as long as it is cast to HMIDIOUT. This parameter can also be a device identifier.
pdwVolume : [var] Pointer to the location to contain the current volume setting. The low-order word of this location contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence. If a device does not support both left and right volume control, the low-order word of the specified location contains the mono volume level. Any value set by using the midiOutSetVolume function is returned, regardless of whether the device supports that value.
%inst
The midiOutGetVolume function retrieves the current volume setting of
a MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If a device identifier is used, then the result of the
midiOutGetVolume call and the information returned in lpdwVolume
applies to all instances of the device. If a device handle is used,
then the result and information returned applies only to the instance
of the device referenced by the device handle. Not all devices
support volume control. You can determine whether a device supports
volume control by querying the device by using the midiOutGetDevCaps
function and specifying the MIDICAPS_VOLUME flag. You can also
determine whether the device supports volume control on both the left
and right channels by querying the device by using the
midiOutGetDevCaps function and specifying the MIDICAPS_LRVOLUME flag.


%index
midiOutLongMsg
The midiOutLongMsg function sends a system-exclusive MIDI message to the specified MIDI output device.
%group
Win32 winmm
%prm
hmo, pmh, cbmh
hmo : [intptr] Handle to the MIDI output device. This parameter can also be the handle of a MIDI stream cast to HMIDIOUT.
pmh : [var] Pointer to a MIDIHDR structure that identifies the MIDI buffer.
cbmh : [int] Size, in bytes, of the MIDIHDR structure.
%inst
The midiOutLongMsg function sends a system-exclusive MIDI message to
the specified MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Before the buffer is passed to midiOutLongMsg, it must be prepared by
using the midiOutPrepareHeader function. The MIDI output device
driver determines whether the data is sent synchronously or
asynchronously.


%index
midiOutMessage
The midiOutMessage function sends a message to the MIDI device drivers. This function is used only for driver-specific messages that are not supported by the MIDI API.
%group
Win32 winmm
%prm
hmo, uMsg, dw1, dw2
hmo : [intptr] Identifier of the MIDI device that receives the message. You must cast the device ID to the HMIDIOUT handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
uMsg : [int] Message to send.
dw1 : [int] Message parameter.
dw2 : [int] Message parameter.
%inst
The midiOutMessage function sends a message to the MIDI device
drivers. This function is used only for driver-specific messages that
are not supported by the MIDI API.

[戻り値]
Returns the value returned by the audio device driver.

[備考]
The DRV_QUERYDEVICEINTERFACE message queries for the device-interface
name of a waveIn, waveOut, midiIn, midiOut, or mixer device. For
DRV_QUERYDEVICEINTERFACE, dwParam1 is a pointer to a caller-allocated
buffer into which the function writes a null-terminated Unicode
string containing the device-interface name. If the device has no
device interface, the string length is zero. For
DRV_QUERYDEVICEINTERFACE, dwParam2 specifies the buffer size in
bytes. This is an input parameter to the function. The caller should
specify a size that is greater than or equal to the buffer size
retrieved by the DRV_QUERYDEVICEINTERFACESIZE message. The
DRV_QUERYDEVICEINTERFACE message is supported in Windows Me, and
Windows 2000 and later. This message is valid only for the
waveInMessage, waveOutMessage, midiInMessage, midiOutMessage, and
mixerMessage functions. The system intercepts this message and
returns the appropriate value without sending the message to the
device driver. For general information about system-intercepted
xxxMessage functions, see System-Intercepted Device Messages. The
following two message constants are used together for the purpose of
obtaining device interface names:
This doc was truncated.


%index
midiOutOpen
The midiOutOpen function opens a MIDI output device for playback.
%group
Win32 winmm
%prm
phmo, uDeviceID, dwCallback, dwInstance, fdwOpen
phmo : [intptr] Pointer to an HMIDIOUT handle. This location is filled with a handle identifying the opened MIDI output device. The handle is used to identify the device in calls to other MIDI output functions.
uDeviceID : [int] Identifier of the MIDI output device that is to be opened.
dwCallback : [int] Pointer to a callback function, an event handle, a thread identifier, or a handle of a window or thread called during MIDI playback to process messages related to the progress of the playback. If no callback is desired, specify NULL for this parameter. For more information on the callback function, see MidiOutProc.
dwInstance : [int] User instance data passed to the callback. This parameter is not used with window callbacks or threads.
fdwOpen : [int] Callback flag for opening the device. It can be the following values.
%inst
The midiOutOpen function opens a MIDI output device for playback.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
To determine the number of MIDI output devices present in the system,
use the midiOutGetNumDevs function. The device identifier specified
by wDeviceID varies from zero to one less than the number of devices
present. MIDI_MAPPER can also be used as the device identifier. If a
window or thread is chosen to receive callback information, the
following messages are sent to the window procedure or thread to
indicate the progress of MIDI output: MM_MOM_OPEN, MM_MOM_CLOSE, and
MM_MOM_DONE. If a function is chosen to receive callback information,
the following messages are sent to the function to indicate the
progress of MIDI output: MOM_OPEN, MOM_CLOSE, and MOM_DONE.


%index
midiOutPrepareHeader
The midiOutPrepareHeader function prepares a MIDI system-exclusive or stream buffer for output.
%group
Win32 winmm
%prm
hmo, pmh, cbmh
hmo : [intptr] Handle to the MIDI output device. To get the device handle, call midiOutOpen. This parameter can also be the handle of a MIDI stream cast to a HMIDIOUT type.
pmh : [var] Pointer to a MIDIHDR structure that identifies the buffer to be prepared.
cbmh : [int] Size, in bytes, of the MIDIHDR structure.
%inst
The midiOutPrepareHeader function prepares a MIDI system-exclusive or
stream buffer for output.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Before you pass a MIDI data block to a device driver, you must
prepare the buffer by passing it to the midiOutPrepareHeader
function. After the header has been prepared, do not modify the
buffer. After the driver is done using the buffer, call the
midiOutUnprepareHeader function. The application can re-use the same
buffer, or allocate multiple buffers and call midiOutPrepareHeader
for each buffer. If you re-use the same buffer, it is not necessary
to prepare the buffer each time. You can call midiOutPrepareHeader
once at the beginning and then call midiOutUnprepareHeader once at
the end. A stream buffer cannot be larger than 64K.
Preparing a header that has already been prepared has no effect, and
the function returns MMSYSERR_NOERROR.


%index
midiOutReset
The midiOutReset function turns off all notes on all MIDI channels for the specified MIDI output device.
%group
Win32 winmm
%prm
hmo
hmo : [intptr] Handle to the MIDI output device. This parameter can also be the handle of a MIDI stream cast to HMIDIOUT.
%inst
The midiOutReset function turns off all notes on all MIDI channels
for the specified MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Any pending system-exclusive or stream output buffers are returned to
the callback function and the MHDR_DONE flag is set in the dwFlags
member of the MIDIHDR structure. Terminating a system-exclusive
message without sending an EOX (end-of-exclusive) byte might cause
problems for the receiving device. The midiOutReset function does not
send an EOX byte when it terminates a system-exclusive message -
applications are responsible for doing this. To turn off all notes, a
note-off message for each note in each channel is sent. In addition,
the sustain controller is turned off for each channel.


%index
midiOutSetVolume
The midiOutSetVolume function sets the volume of a MIDI output device.
%group
Win32 winmm
%prm
hmo, dwVolume
hmo : [intptr] Handle to an open MIDI output device. This parameter can also contain the handle of a MIDI stream, as long as it is cast to HMIDIOUT. This parameter can also be a device identifier.
dwVolume : [int] New volume setting. The low-order word contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence. If a device does not support both left and right volume control, the low-order word of dwVolume specifies the mono volume level, and the high-order word is ignored.
%inst
The midiOutSetVolume function sets the volume of a MIDI output
device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If a device identifier is used, then the result of the
midiOutSetVolume call applies to all instances of the device. If a
device handle is used, then the result applies only to the instance
of the device referenced by the device handle. Not all devices
support volume changes. You can determine whether a device supports
it by querying the device using the midiOutGetDevCaps function and
the MIDICAPS_VOLUME flag. You can also determine whether the device
supports volume control on both the left and right channels by
querying the device using the midiOutGetDevCaps function and the
MIDICAPS_LRVOLUME flag. Devices that do not support a full 16 bits of
volume-level control use the high-order bits of the requested volume
setting. For example, a device that supports 4 bits of volume control
produces the same volume setting for the following volume-level
values: 0x4000, 0x43be, and 0x4fff. The midiOutGetVolume function
returns the full 16-bit value, as set by midiOutSetVolume,
irrespective of the device's capabilities. Volume settings are
interpreted logarithmically. This means that the perceived increase
in volume is the same when increasing the volume level from 0x5000 to
0x6000 as it is from 0x4000 to 0x5000.


%index
midiOutShortMsg
The midiOutShortMsg function sends a short MIDI message to the specified MIDI output device.
%group
Win32 winmm
%prm
hmo, dwMsg
hmo : [intptr] Handle to the MIDI output device. This parameter can also be the handle of a MIDI stream cast to HMIDIOUT.
dwMsg : [int] MIDI message. The message is packed into a DWORD value with the first byte of the message in the low-order byte. The message is packed into this parameter as follows.
%inst
The midiOutShortMsg function sends a short MIDI message to the
specified MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following:
This doc was truncated.

[備考]
This function is used to send any MIDI message except for
system-exclusive or stream messages. This function might not return
until the message has been sent to the output device. You can send
short messages while streams are playing on the same device (although
you cannot use a running status in this case).


%index
midiOutUnprepareHeader
The midiOutUnprepareHeader function cleans up the preparation performed by the midiOutPrepareHeader function.
%group
Win32 winmm
%prm
hmo, pmh, cbmh
hmo : [intptr] Handle to the MIDI output device. This parameter can also be the handle of a MIDI stream cast to HMIDIOUT.
pmh : [var] Pointer to a MIDIHDR structure identifying the buffer to be cleaned up.
cbmh : [int] Size, in bytes, of the MIDIHDR structure.
%inst
The midiOutUnprepareHeader function cleans up the preparation
performed by the midiOutPrepareHeader function.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
This function is complementary to the midiOutPrepareHeader function.
You must call midiOutUnprepareHeader before freeing the buffer. After
passing a buffer to the device driver with the midiOutLongMsg
function, you must wait until the device driver is finished with the
buffer before calling midiOutUnprepareHeader. Unpreparing a buffer
that has not been prepared has no effect, and the function returns
MMSYSERR_NOERROR.


%index
midiStreamClose
The midiStreamClose function closes an open MIDI stream.
%group
Win32 winmm
%prm
hms
hms : [intptr] Handle to a MIDI stream, as retrieved by using the midiStreamOpen function.
%inst
The midiStreamClose function closes an open MIDI stream.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


%index
midiStreamOpen
The midiStreamOpen function opens a MIDI stream for output. By default, the device is opened in paused mode. The stream handle retrieved by this function must be used in all subsequent references to the stream.
%group
Win32 winmm
%prm
phms, puDeviceID, cMidi, dwCallback, dwInstance, fdwOpen
phms : [intptr] Pointer to a variable to contain the stream handle when the function returns.
puDeviceID : [var] Pointer to a device identifier. The device is opened on behalf of the stream and closed again when the stream is closed.
cMidi : [int] Reserved; must be 1.
dwCallback : [int] Pointer to a callback function, an event handle, a thread identifier, or a handle of a window or thread called during MIDI playback to process messages related to the progress of the playback. If no callback mechanism is desired, specify NULL for this parameter.
dwInstance : [int] Application-specific instance data that is returned to the application with every callback function.
fdwOpen : [int] Callback flag for opening the device. One of the following callback flags must be specified.
%inst
The midiStreamOpen function opens a MIDI stream for output. By
default, the device is opened in paused mode. The stream handle
retrieved by this function must be used in all subsequent references
to the stream.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


%index
midiStreamOut
The midiStreamOut function plays or queues a stream (buffer) of MIDI data to a MIDI output device.
%group
Win32 winmm
%prm
hms, pmh, cbmh
hms : [intptr] Handle to a MIDI stream. This handle must have been returned by a call to the midiStreamOpen function. This handle identifies the output device.
pmh : [var] Pointer to a MIDIHDR structure that identifies the MIDI buffer.
cbmh : [int] Size, in bytes, of the MIDIHDR structure.
%inst
The midiStreamOut function plays or queues a stream (buffer) of MIDI
data to a MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Before the buffer is passed to midiStreamOpen, it must be prepared by
using the midiOutPrepareHeader function. Because the midiStreamOpen
function opens the output device in paused mode, you must call the
midiStreamRestart function before you can use midiStreamOut to start
the playback. For the current implementation of this function, the
buffer must be smaller than 64K. The buffer pointed to by the MIDIHDR
structure contains one or more MIDI events, each of which is defined
by a MIDIEVENT structure.


%index
midiStreamPause
The midiStreamPause function pauses playback of a specified MIDI stream.
%group
Win32 winmm
%prm
hms
hms : [intptr] Handle to a MIDI stream. This handle must have been returned by a call to the MIDIEVENT function. This handle identifies the output device.
%inst
The midiStreamPause function pauses playback of a specified MIDI
stream.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
The current playback position is saved when playback is paused. To
resume playback from the current position, use the midiStreamRestart
function. Calling this function when the output is already paused has
no effect, and the function returns MMSYSERR_NOERROR.


%index
midiStreamPosition
The midiStreamPosition function retrieves the current position in a MIDI stream.
%group
Win32 winmm
%prm
hms, lpmmt, cbmmt
hms : [intptr] Handle to a MIDI stream. This handle must have been returned by a call to the midiStreamOpen function. This handle identifies the output device.
lpmmt : [var] Pointer to an MMTIME structure.
cbmmt : [int] Size, in bytes, of the MMTIME structure.
%inst
The midiStreamPosition function retrieves the current position in a
MIDI stream.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Before calling midiStreamPosition, set the wType member of the MMTIME
structure to indicate the time format you desire. After calling
midiStreamPosition, check the wType member to determine if the
desired time format is supported. If the desired format is not
supported, wType will specify an alternative format. The position is
set to zero when the device is opened or reset.


%index
midiStreamProperty
The midiStreamProperty function sets or retrieves properties of a MIDI data stream associated with a MIDI output device.
%group
Win32 winmm
%prm
hms, lppropdata, dwProperty
hms : [intptr] Handle to the MIDI device that the property is associated with.
lppropdata : [var] Pointer to the property data.
dwProperty : [int] Flags that specify the action to perform and identify the appropriate property of the MIDI data stream. The midiStreamProperty function requires setting two flags in each use. One flag (either MIDIPROP_GET or MIDIPROP_SET) specifies an action, and the other identifies a specific property to examine or edit.
%inst
The midiStreamProperty function sets or retrieves properties of a
MIDI data stream associated with a MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
These properties are the default properties defined by the system.
Driver writers can implement and document their own properties.


%index
midiStreamRestart
The midiStreamRestart function restarts a paused MIDI stream.
%group
Win32 winmm
%prm
hms
hms : [intptr] Handle to a MIDI stream. This handle must have been returned by a call to the midiStreamOpen function. This handle identifies the output device.
%inst
The midiStreamRestart function restarts a paused MIDI stream.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Calling this function when the output is not paused has no effect,
and the function returns MMSYSERR_NOERROR.


%index
midiStreamStop
The midiStreamStop function turns off all notes on all MIDI channels for the specified MIDI output device.
%group
Win32 winmm
%prm
hms
hms : [intptr] Handle to a MIDI stream. This handle must have been returned by a call to the midiStreamOpen function. This handle identifies the output device.
%inst
The midiStreamStop function turns off all notes on all MIDI channels
for the specified MIDI output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
When you call this function, any pending system-exclusive or stream
output buffers are returned to the callback mechanism and the
MHDR_DONE bit is set in the dwFlags member of the MIDIHDR structure.
While the midiOutReset function turns off all notes, midiStreamStop
turns off only those notes that have been turned on by a MIDI note-on
message.


%index
mixerClose
The mixerClose function closes the specified mixer device.
%group
Win32 winmm
%prm
hmx
hmx : [intptr] Handle to the mixer device. This handle must have been returned successfully by the mixerOpen function. If mixerClose is successful, hmx is no longer valid.
%inst
The mixerClose function closes the specified mixer device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


%index
mixerGetControlDetailsW
The mixerGetControlDetailsW (Unicode) function (mmeapi.h) retrieves details about a single control associated with an audio line.
%group
Win32 winmm
%prm
hmxobj, pmxcd, fdwDetails
hmxobj : [intptr] Handle to the mixer device object being queried.
pmxcd : [var] Pointer to a MIXERCONTROLDETAILS structure, which is filled with state information about the control.
fdwDetails : [int] Flags for retrieving control details. The following values are defined.
%inst
The mixerGetControlDetailsW (Unicode) function (mmeapi.h) retrieves
details about a single control associated with an audio line.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
All members of the MIXERCONTROLDETAILS structure must be initialized
before calling this function.
> [!NOTE] > The mmeapi.h header defines mixerGetControlDetails as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
mixerGetDevCapsW
The mixerGetDevCapsW (Unicode) function (mmeapi.h) queries a specified mixer device to determine its capabilities.
%group
Win32 winmm
%prm
uMxId, pmxcaps, cbmxcaps
uMxId : [int] Identifier or handle of an open mixer device.
pmxcaps : [var] Pointer to a MIXERCAPS structure that receives information about the capabilities of the device.
cbmxcaps : [int] Size, in bytes, of the MIXERCAPS structure.
%inst
The mixerGetDevCapsW (Unicode) function (mmeapi.h) queries a
specified mixer device to determine its capabilities.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Use the mixerGetNumDevs function to determine the number of mixer
devices present in the system. The device identifier specified by
uMxId varies from zero to one less than the number of mixer devices
present. Only the number of bytes (or less) of information specified
in cbmxcaps is copied to the location pointed to by pmxcaps. If
cbmxcaps is zero, nothing is copied, and the function returns
successfully. This function also accepts a mixer device handle
returned by the mixerOpen function as the uMxId parameter. The
application should cast the HMIXER handle to a UINT.
> [!NOTE] > The mmeapi.h header defines mixerGetDevCaps as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
mixerGetID
The mixerGetID function retrieves the device identifier for a mixer device associated with a specified device handle.
%group
Win32 winmm
%prm
hmxobj, puMxId, fdwId
hmxobj : [intptr] Handle to the audio mixer object to map to a mixer device identifier.
puMxId : [var] Pointer to a variable that receives the mixer device identifier. If no mixer device is available for the hmxobj object, the value -1 is placed in this location and the MMSYSERR_NODRIVER error value is returned.
fdwId : [int] Flags for mapping the mixer object hmxobj. The following values are defined.
%inst
The mixerGetID function retrieves the device identifier for a mixer
device associated with a specified device handle.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


%index
mixerGetLineControlsW
The mixerGetLineControlsW (Unicode) function retrieves one or more controls associated with an audio line. (mixerGetLineControlsW)
%group
Win32 winmm
%prm
hmxobj, pmxlc, fdwControls
hmxobj : [intptr] Handle to the mixer device object that is being queried.
pmxlc : [var] Pointer to a MIXERLINECONTROLS structure. This structure is used to reference one or more MIXERCONTROL structures to be filled with information about the controls associated with an audio line. The cbStruct member of the MIXERLINECONTROLS structure must always be initialized to be the size, in bytes, of the MIXERLINECONTROLS structure.
fdwControls : [int] Flags for retrieving information about one or more controls associated with an audio line. The following values are defined.
%inst
The mixerGetLineControlsW (Unicode) function retrieves one or more
controls associated with an audio line. (mixerGetLineControlsW)

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
> [!NOTE] > The mmeapi.h header defines mixerGetLineControls as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
mixerGetLineInfoW
The mixerGetLineInfoW (Unicode) function retrieves information about a specific line of a mixer device. (mixerGetLineInfoW)
%group
Win32 winmm
%prm
hmxobj, pmxl, fdwInfo
hmxobj : [intptr] Handle to the mixer device object that controls the specific audio line.
pmxl : [var] Pointer to a MIXERLINE structure. This structure is filled with information about the audio line for the mixer device. The cbStruct member must always be initialized to be the size, in bytes, of the MIXERLINE structure.
fdwInfo : [int] Flags for retrieving information about an audio line. The following values are defined.
%inst
The mixerGetLineInfoW (Unicode) function retrieves information about
a specific line of a mixer device. (mixerGetLineInfoW)

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
> [!NOTE] > The mmeapi.h header defines mixerGetLineInfo as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
mixerGetNumDevs
The mixerGetNumDevs function retrieves the number of mixer devices present in the system.
%group
Win32 winmm
%prm

%inst
The mixerGetNumDevs function retrieves the number of mixer devices
present in the system.

[戻り値]
Returns the number of mixer devices or zero if no mixer devices are
available.


%index
mixerMessage
The mixerMessage function sends a custom mixer driver message directly to a mixer driver.
%group
Win32 winmm
%prm
hmx, uMsg, dwParam1, dwParam2
hmx : [intptr] Identifier of the mixer that receives the message. You must cast the device ID to the HMIXER handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
uMsg : [int] Custom mixer driver message to send to the mixer driver. This message must be above or equal to the MXDM_USER constant.
dwParam1 : [int] Parameter associated with the message being sent.
dwParam2 : [int] Parameter associated with the message being sent.
%inst
The mixerMessage function sends a custom mixer driver message
directly to a mixer driver.

[戻り値]
Returns a value that is specific to the custom mixer driver message.
Possible error values include the following.
This doc was truncated.

[備考]
User-defined messages must be sent only to a mixer driver that
supports the messages. The application should verify that the mixer
driver is the driver that supports the message by retrieving the
mixer capabilities and checking the wMid, wPid, vDriverVersion, and
szPname members of the MIXERCAPS structure. The
DRV_QUERYDEVICEINTERFACE message queries for the device-interface
name of a waveIn, waveOut, midiIn, midiOut, or mixer device. For
DRV_QUERYDEVICEINTERFACE, dwParam1 is a pointer to a caller-allocated
buffer into which the function writes a null-terminated Unicode
string containing the device-interface name. If the device has no
device interface, the string length is zero. For
DRV_QUERYDEVICEINTERFACE, dwParam2 specifies the buffer size in
bytes. This is an input parameter to the function. The caller should
specify a size that is greater than or equal to the buffer size
retrieved by the DRV_QUERYDEVICEINTERFACESIZE message. The
DRV_QUERYDEVICEINTERFACE message is supported in Windows Me, and
Windows 2000 and later. This message is valid only for the
waveInMessage, waveOutMessage, midiInMessage, midiOutMessage, and
mixerMessage functions. The system intercepts this message and
returns the appropriate value without sending the message to the
device driver. For general information about system-intercepted
xxxMessage functions, see System-Intercepted Device Messages. The
following two message constants are used together for the purpose of
obtaining device interface names:
This doc was truncated.


%index
mixerOpen
The mixerOpen function opens a specified mixer device and ensures that the device will not be removed until the application closes the handle.
%group
Win32 winmm
%prm
phmx, uMxId, dwCallback, dwInstance, fdwOpen
phmx : [intptr] Pointer to a variable that will receive a handle identifying the opened mixer device. Use this handle to identify the device when calling other audio mixer functions. This parameter cannot be NULL.
uMxId : [int] Identifier of the mixer device to open. Use a valid device identifier or any HMIXEROBJ (see the mixerGetID function for a description of mixer object handles). A "mapper" for audio mixer devices does not currently exist, so a mixer device identifier of -1 is not valid.
dwCallback : [int] Handle to a window called when the state of an audio line and/or control associated with the device being opened is changed. Specify NULL for this parameter if no callback mechanism is to be used.
dwInstance : [int] Reserved. Must be zero.
fdwOpen : [int] Flags for opening the device. The following values are defined.
%inst
The mixerOpen function opens a specified mixer device and ensures
that the device will not be removed until the application closes the
handle.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Use the mixerGetNumDevs function to determine the number of audio
mixer devices present in the system. The device identifier specified
by uMxId varies from zero to one less than the number of devices
present. If a window is chosen to receive callback information, the
MM_MIXM_LINE_CHANGE and MM_MIXM_CONTROL_CHANGE messages are sent to
the window procedure function to indicate when an audio line or
control state changes. For both messages, the wParam parameter is the
handle of the mixer device. The lParam parameter is the line
identifier for MM_MIXM_LINE_CHANGE or the control identifier for
MM_MIXM_CONTROL_CHANGE that changed state. To query for audio mixer
support or a media device, use the mixerGetID function. On 64-bit
systems, this function may not work as expected in situations where
you pass a 64-bit LPHWAVEOUT pointer in the uMxId parameter, because
the uMxId parameter is truncated to 32 bits.


%index
mixerSetControlDetails
The mixerSetControlDetails function sets properties of a single control associated with an audio line.
%group
Win32 winmm
%prm
hmxobj, pmxcd, fdwDetails
hmxobj : [intptr] Handle to the mixer device object for which properties are being set.
pmxcd : [var] Pointer to a MIXERCONTROLDETAILS structure. This structure is used to reference control detail structures that contain the desired state for the control.
fdwDetails : [int] Flags for setting properties for a control. The following values are defined.
%inst
The mixerSetControlDetails function sets properties of a single
control associated with an audio line.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
All members of the MIXERCONTROLDETAILS structure must be initialized
before calling mixerSetControlDetails. If an application needs to
retrieve only the current state of a custom mixer control and not
display a dialog box, then mixerGetControlDetails can be used with
the MIXER_GETCONTROLDETAILSF_VALUE flag.


%index
mmioAdvance
The mmioAdvance function advances the I/O buffer of a file set up for direct I/O buffer access with the mmioGetInfo function.
%group
Win32 winmm
%prm
hmmio, pmmioinfo, fuAdvance
hmmio : [intptr] File handle of a file opened by using the mmioOpen function.
pmmioinfo : [var] Pointer to the MMIOINFO structure obtained by using the mmioGetInfo function. This structure is used to set the current file information, and then it is updated after the buffer is advanced. This parameter is optional.
fuAdvance : [int] Flags for the operation. It can be one of the following.
%inst
The mmioAdvance function advances the I/O buffer of a file set up for
direct I/O buffer access with the mmioGetInfo function.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If the file is opened for reading, the I/O buffer is filled from the
disk. If the file is opened for writing and the MMIO_DIRTY flag is
set in the dwFlags member of the MMIOINFO structure, the buffer is
written to disk. The pchNext,pchEndRead, and pchEndWrite members of
the MMIOINFO structure are updated to reflect the new state of the
I/O buffer. If the specified file is opened for writing or for both
reading and writing, the I/O buffer is flushed to disk before the
next buffer is read. If the I/O buffer cannot be written to disk
because the disk is full, mmioAdvance returns MMIOERR_CANNOTWRITE. If
the specified file is open only for writing, the MMIO_WRITE flag must
be specified. If you have written to the I/O buffer, you must set the
MMIO_DIRTY flag in the dwFlags member of the MMIOINFO structure
before calling mmioAdvance. Otherwise, the buffer will not be written
to disk. If the end of file is reached, mmioAdvance still returns
successfully even though no more data can be read. To check for the
end of the file, check if the pchNext and pchEndRead members of the
MMIOINFO structure are equal after calling mmioAdvance.


%index
mmioAscend
The mmioAscend function ascends out of a chunk in a RIFF file descended into with the mmioDescend function or created with the mmioCreateChunk function.
%group
Win32 winmm
%prm
hmmio, pmmcki, fuAscend
hmmio : [intptr] File handle of an open RIFF file.
pmmcki : [var] Pointer to an application-defined MMCKINFO structure previously filled by the mmioDescend or mmioCreateChunk function.
fuAscend : [int] Reserved; must be zero.
%inst
The mmioAscend function ascends out of a chunk in a RIFF file
descended into with the mmioDescend function or created with the
mmioCreateChunk function.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If the chunk was descended into by using mmioDescend, mmioAscend
seeks to the location following the end of the chunk (past the extra
pad byte, if any). If the chunk was created and descended into by
using mmioCreateChunk, or if the MMIO_DIRTY flag is set in the
dwFlags member of the MMCKINFO structure referenced by lpck, the
current file position is assumed to be the end of the data portion of
the chunk. If the chunk size is not the same as the value stored in
the cksize member of the MMCKINFO structure when mmioCreateChunk was
called, mmioAscend corrects the chunk size in the file before
ascending from the chunk. If the chunk size is odd, mmioAscend writes
a null pad byte at the end of the chunk. After ascending from the
chunk, the current file position is the location following the end of
the chunk (past the extra pad byte, if any).


%index
mmioClose
The mmioClose function closes a file that was opened by using the mmioOpen function.
%group
Win32 winmm
%prm
hmmio, fuClose
hmmio : [intptr] File handle of the file to close.
fuClose : [int] Flags for the close operation. The following value is defined.
%inst
The mmioClose function closes a file that was opened by using the
mmioOpen function.

[戻り値]
Returns zero if successful or an error otherwise. The error value can
originate from the mmioFlush function or from the I/O procedure.
Possible error values include the following.
This doc was truncated.


%index
mmioCreateChunk
The mmioCreateChunk function creates a chunk in a RIFF file that was opened by using the mmioOpen function.
%group
Win32 winmm
%prm
hmmio, pmmcki, fuCreate
hmmio : [intptr] File handle of an open RIFF file.
pmmcki : [var] Pointer to a buffer that receives a MMCKINFO structure containing information about the chunk to be created.
fuCreate : [int] Flags identifying what type of chunk to create. The following values are defined.
%inst
The mmioCreateChunk function creates a chunk in a RIFF file that was
opened by using the mmioOpen function.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
This function cannot insert a chunk into the middle of a file. If an
application attempts to create a chunk somewhere other than at the
end of a file, mmioCreateChunk overwrites existing information in the
file. The MMCKINFO structure pointed to by the lpck parameter should
be set up as follows:
This doc was truncated.


%index
mmioDescend
The mmioDescend function descends into a chunk of a RIFF file that was opened by using the mmioOpen function. It can also search for a given chunk.
%group
Win32 winmm
%prm
hmmio, pmmcki, pmmckiParent, fuDescend
hmmio : [intptr] File handle of an open RIFF file.
pmmcki : [var] Pointer to a buffer that receives an MMCKINFO structure.
pmmckiParent : [var] Pointer to an optional application-defined MMCKINFO structure identifying the parent of the chunk being searched for. If this parameter is not NULL, mmioDescend assumes the MMCKINFO structure it refers to was filled when mmioDescend was called to descend into the parent chunk, and mmioDescend searches for a chunk within the parent chunk. Set this parameter to NULL if no parent chunk is being specified.
fuDescend : [int] Search flags. If no flags are specified, mmioDescend descends into the chunk beginning at the current file position. The following values are defined.
%inst
The mmioDescend function descends into a chunk of a RIFF file that
was opened by using the mmioOpen function. It can also search for a
given chunk.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
A "RIFF" chunk consists of a four-byte chunk identifier (type
FOURCC), followed by a four-byte chunk size (type DWORD), followed by
the data portion of the chunk, followed by a null pad byte if the
size of the data portion is odd. If the chunk identifier is "RIFF" or
"LIST", the first four bytes of the data portion of the chunk are a
form type or list type (type FOURCC). If you use mmioDescend to
search for a chunk, make sure the file position is at the beginning
of a chunk before calling the function. The search begins at the
current file position and continues to the end of the file. If a
parent chunk is specified, the file position should be somewhere
within the parent chunk before calling mmioDescend. In this case, the
search begins at the current file position and continues to the end
of the parent chunk. If mmioDescend is unsuccessful in searching for
a chunk, the current file position is undefined. If mmioDescend is
successful, the current file position is changed. If the chunk is a
"RIFF" or "LIST" chunk, the new file position will be just after the
form type or list type (12 bytes from the beginning of the chunk).
For other chunks, the new file position will be the start of the data
portion of the chunk (8 bytes from the beginning of the chunk). The
mmioDescend function fills the MMCKINFO structure pointed to by the
lpck parameter with the following information:
This doc was truncated.


%index
mmioFlush
The mmioFlush function writes the I/O buffer of a file to disk if the buffer has been written to.
%group
Win32 winmm
%prm
hmmio, fuFlush
hmmio : [intptr] File handle of a file opened by using the mmioOpen function.
fuFlush : [int] Flag determining how the flush is carried out. It can be zero or the following.
%inst
The mmioFlush function writes the I/O buffer of a file to disk if the
buffer has been written to.

[戻り値]
Returns zero if successful or an error otherwise. Possible error
values include the following.
This doc was truncated.

[備考]
Closing a file with the mmioClose function automatically flushes its
buffer. If there is insufficient disk space to write the buffer,
mmioFlush fails, even if the preceding calls of the mmioWrite
function were successful.


%index
mmioGetInfo
The mmioGetInfo function retrieves information about a file opened by using the mmioOpen function. This information allows the application to directly access the I/O buffer, if the file is opened for buffered I/O.
%group
Win32 winmm
%prm
hmmio, pmmioinfo, fuInfo
hmmio : [intptr] File handle of the file.
pmmioinfo : [var] Pointer to a buffer that receives an MMIOINFO structure that mmioGetInfo fills with information about the file.
fuInfo : [int] Reserved; must be zero.
%inst
The mmioGetInfo function retrieves information about a file opened by
using the mmioOpen function. This information allows the application
to directly access the I/O buffer, if the file is opened for buffered
I/O.

[戻り値]
Returns zero if successful or an error otherwise.

[備考]
To directly access the I/O buffer of a file opened for buffered I/O,
use the following members of the MMIOINFO structure filled by
mmioGetInfo:
This doc was truncated.


%index
mmioOpenW
The mmioOpenW (Unicode) function opens a file for unbuffered or buffered I/O; creates a file; deletes a file; or checks whether a file exists. (mmioOpenW)
%group
Win32 winmm
%prm
pszFileName, pmmioinfo, fdwOpen
pszFileName : [wstr] Pointer to a buffer that contains the name of the file. If no I/O procedure is specified to open the file, the file name determines how the file is opened, as follows:
pmmioinfo : [var] Pointer to an MMIOINFO structure containing extra parameters used by mmioOpen. Unless you are opening a memory file, specifying the size of a buffer for buffered I/O, or specifying an uninstalled I/O procedure to open a file, this parameter should be NULL. If this parameter is not NULL, all unused members of the MMIOINFO structure it references must be set to zero, including the reserved members.
fdwOpen : [int] Flags for the open operation. The MMIO_READ, MMIO_WRITE, and MMIO_READWRITE flags are mutually exclusive ? only one should be specified. The MMIO_COMPAT, MMIO_EXCLUSIVE, MMIO_DENYWRITE, MMIO_DENYREAD, and MMIO_DENYNONE flags are file-sharing flags. The following values are defined.
%inst
The mmioOpenW (Unicode) function opens a file for unbuffered or
buffered I/O; creates a file; deletes a file; or checks whether a
file exists. (mmioOpenW)

[備考]
If lpmmioinfo points to an MMIOINFO structure, initialize the members
of the structure as follows. All unused members must be set to zero,
including reserved members.
This doc was truncated.


%index
mmioRead
The mmioRead function reads a specified number of bytes from a file opened by using the mmioOpen function.
%group
Win32 winmm
%prm
hmmio, pch, cch
hmmio : [intptr] File handle of the file to be read.
pch : [var] Pointer to a buffer to contain the data read from the file.
cch : [int] Number of bytes to read from the file.
%inst
The mmioRead function reads a specified number of bytes from a file
opened by using the mmioOpen function.

[戻り値]
Returns the number of bytes actually read. If the end of the file has
been reached and no more bytes can be read, the return value is 0. If
there is an error reading from the file, the return value is ?1.


%index
mmioRenameW
The mmioRenameW (Unicode) function renames the specified file and contains parameters that modify strings containing a file name. (mmioRenameW)
%group
Win32 winmm
%prm
pszFileName, pszNewFileName, pmmioinfo, fdwRename
pszFileName : [wstr] Pointer to a string containing the file name of the file to rename.
pszNewFileName : [wstr] Pointer to a string containing the new file name.
pmmioinfo : [var] Pointer to an MMIOINFO structure containing extra parameters used by mmioRename. If this parameter is not NULL, all unused members of the MMIOINFO structure it references must be set to zero, including the reserved members.
fdwRename : [int] Flags for the rename operation. This parameter should be set to zero.
%inst
The mmioRenameW (Unicode) function renames the specified file and
contains parameters that modify strings containing a file name.
(mmioRenameW)

[戻り値]
Returns zero if the file was renamed. Otherwise, returns an error
code returned from mmioRename or from the I/O procedure.

[備考]
> [!NOTE] > The mmiscapi.h header defines mmioRename as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
mmioSeek
The mmioSeek function changes the current file position in a file opened by using the mmioOpen function.
%group
Win32 winmm
%prm
hmmio, lOffset, iOrigin
hmmio : [intptr] File handle of the file to seek in.
lOffset : [int] Offset to change the file position.
iOrigin : [int] Flags indicating how the offset specified by lOffset is interpreted. The following values are defined:
%inst
The mmioSeek function changes the current file position in a file
opened by using the mmioOpen function.

[戻り値]
Returns the new file position, in bytes, relative to the beginning of
the file. If there is an error, the return value is ?1.

[備考]
Seeking to an invalid location in the file, such as past the end of
the file, might not cause mmioSeek to return an error, but it might
cause subsequent I/O operations on the file to fail. To locate the
end of a file, call mmioSeek with lOffset set to zero and iOrigin set
to SEEK_END.


%index
mmioSendMessage
The mmioSendMessage function sends a message to the I/O procedure associated with the specified file.
%group
Win32 winmm
%prm
hmmio, uMsg, lParam1, lParam2
hmmio : [intptr] File handle for a file opened by using the mmioOpen function.
uMsg : [int] Message to send to the I/O procedure.
lParam1 : [intptr] Parameter for the message.
lParam2 : [intptr] Parameter for the message.
%inst
The mmioSendMessage function sends a message to the I/O procedure
associated with the specified file.

[戻り値]
Returns a value that corresponds to the message. If the I/O procedure
does not recognize the message, the return value should be zero.

[備考]
Use this function to send custom user-defined messages. Do not use it
to send the MMIOM_OPEN, MMIOM_CLOSE, MMIOM_READ, MMIOM_WRITE,
MMIOM_WRITEFLUSH, or MMIOM_SEEK messages. Define custom messages to
be greater than or equal to the MMIOM_USER constant.


%index
mmioSetBuffer
The mmioSetBuffer function enables or disables buffered I/O, or changes the buffer or buffer size for a file opened by using the mmioOpen function.
%group
Win32 winmm
%prm
hmmio, pchBuffer, cchBuffer, fuBuffer
hmmio : [intptr] File handle of the file.
pchBuffer : [str] Pointer to an application-defined buffer to use for buffered I/O. If this parameter is NULL, mmioSetBuffer allocates an internal buffer for buffered I/O.
cchBuffer : [int] Size, in characters, of the application-defined buffer, or the size of the buffer for mmioSetBuffer to allocate.
fuBuffer : [int] Reserved; must be zero.
%inst
The mmioSetBuffer function enables or disables buffered I/O, or
changes the buffer or buffer size for a file opened by using the
mmioOpen function.

[戻り値]
Returns zero if successful or an error otherwise. If an error occurs,
the file handle remains valid. The following values are defined.
This doc was truncated.

[備考]
To enable buffering using an internal buffer, set pchBuffer to NULL
and cchBuffer to the desired buffer size. To supply your own buffer,
set pchBuffer to point to the buffer, and set cchBuffer to the size
of the buffer. To disable buffered I/O, set pchBuffer to NULL and
cchBuffer to zero. If buffered I/O is already enabled using an
internal buffer, you can reallocate the buffer to a different size by
setting pchBuffer to NULL and cchBuffer to the new buffer size. The
contents of the buffer can be changed after resizing.


%index
mmioSetInfo
The mmioSetInfo function updates the information retrieved by the mmioGetInfo function about a file opened by using the mmioOpen function. Use this function to terminate direct buffer access of a file opened for buffered I/O.
%group
Win32 winmm
%prm
hmmio, pmmioinfo, fuInfo
hmmio : [intptr] File handle of the file.
pmmioinfo : [var] Pointer to an MMIOINFO structure filled with information by the mmioGetInfo function.
fuInfo : [int] Reserved; must be zero.
%inst
The mmioSetInfo function updates the information retrieved by the
mmioGetInfo function about a file opened by using the mmioOpen
function. Use this function to terminate direct buffer access of a
file opened for buffered I/O.

[戻り値]
Returns zero if successful or an error otherwise.

[備考]
If you have written to the file I/O buffer, set the MMIO_DIRTY flag
in the dwFlags member of the MMIOINFO structure before calling
mmioSetInfo to terminate direct buffer access. Otherwise, the buffer
will not get flushed to disk.


%index
mmioStringToFOURCCA
The mmioStringToFOURCC function converts a null-terminated string to a four-character code. (mmioStringToFOURCCA)
%group
Win32 winmm
%prm
sz, uFlags
sz : [str] Pointer to a null-terminated string to convert to a four-character code.
uFlags : [int] Flags for the conversion. The following value is defined:
%inst
The mmioStringToFOURCC function converts a null-terminated string to
a four-character code. (mmioStringToFOURCCA)

[戻り値]
Returns the four-character code created from the given string.

[備考]
This function copies the string to a four-character code and pads it
with space characters or truncates it if necessary. It does not check
whether the code it returns is valid.
> [!NOTE] > The mmiscapi.h header defines mmioStringToFOURCC as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
mmioStringToFOURCCW
The mmioStringToFOURCCW (Unicode) function converts a null-terminated string to a four-character code. (mmioStringToFOURCCW)
%group
Win32 winmm
%prm
sz, uFlags
sz : [wstr] Pointer to a null-terminated string to convert to a four-character code.
uFlags : [int] Flags for the conversion. The following value is defined:
%inst
The mmioStringToFOURCCW (Unicode) function converts a null-terminated
string to a four-character code. (mmioStringToFOURCCW)

[戻り値]
Returns the four-character code created from the given string.

[備考]
This function copies the string to a four-character code and pads it
with space characters or truncates it if necessary. It does not check
whether the code it returns is valid.
> [!NOTE] > The mmiscapi.h header defines mmioStringToFOURCC as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
mmioWrite
The mmioWrite function writes a specified number of bytes to a file opened by using the mmioOpen function.
%group
Win32 winmm
%prm
hmmio, pch, cch
hmmio : [intptr] File handle of the file.
pch : [str] Pointer to the buffer to be written to the file.
cch : [int] Number of bytes to write to the file.
%inst
The mmioWrite function writes a specified number of bytes to a file
opened by using the mmioOpen function.

[戻り値]
Returns the number of bytes actually written. If there is an error
writing to the file, the return value is -1.

[備考]
The current file position is incremented by the number of bytes
written.


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
The waveInAddBuffer function sends an input buffer to the given waveform-audio input device. When the buffer is filled, the application is notified.
%group
Win32 winmm
%prm
hwi, pwh, cbwh
hwi : [intptr] Handle to the waveform-audio input device.
pwh : [var] Pointer to a WAVEHDR structure that identifies the buffer.
cbwh : [int] Size, in bytes, of the WAVEHDR structure.
%inst
The waveInAddBuffer function sends an input buffer to the given
waveform-audio input device. When the buffer is filled, the
application is notified.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
When the buffer is filled, the WHDR_DONE bit is set in the dwFlags
member of the WAVEHDR structure. The buffer must be prepared with the
waveInPrepareHeader function before it is passed to this function.


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
The waveInGetID function gets the device identifier for the given waveform-audio input device.
%group
Win32 winmm
%prm
hwi, puDeviceID
hwi : [intptr] Handle to the waveform-audio input device.
puDeviceID : [var] Pointer to a variable to be filled with the device identifier.
%inst
The waveInGetID function gets the device identifier for the given
waveform-audio input device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


%index
waveInGetNumDevs
The waveInGetNumDevs function returns the number of waveform-audio input devices present in the system.
%group
Win32 winmm
%prm

%inst
The waveInGetNumDevs function returns the number of waveform-audio
input devices present in the system.

[戻り値]
Returns the number of devices. A return value of zero means that no
devices are present or that an error occurred.


%index
waveInGetPosition
waveInGetPosition is no longer supported for use as of Windows?Vista.
%group
Win32 winmm
%prm
hwi, pmmt, cbmmt
hwi : [intptr] Handle to the waveform-audio input device.
pmmt : [var] Pointer to an MMTIME structure.
cbmmt : [int] Size, in bytes, of the MMTIME structure.
%inst
waveInGetPosition is no longer supported for use as of Windows Vista.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Before calling this function, set the wType member of the MMTIME
structure to indicate the time format you want. After calling this
function, check wType to determine whether the desired time format is
supported. If the format is not supported, the member will specify an
alternative format. The position is set to zero when the device is
opened or reset.


%index
waveInMessage
The waveInMessage function sends messages to the waveform-audio input device drivers.
%group
Win32 winmm
%prm
hwi, uMsg, dw1, dw2
hwi : [intptr] Identifier of the waveform device that receives the message. You must cast the device ID to the HWAVEIN handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
uMsg : [int] Message to send.
dw1 : [int] Message parameter.
dw2 : [int] Message parameter.
%inst
The waveInMessage function sends messages to the waveform-audio input
device drivers.

[戻り値]
Returns the value returned from the driver.

[備考]
The DRV_QUERYDEVICEINTERFACE message queries for the device-interface
name of a waveIn, waveOut, midiIn, midiOut, or mixer device. For
DRV_QUERYDEVICEINTERFACE, dwParam1 is a pointer to a caller-allocated
buffer into which the function writes a null-terminated Unicode
string containing the device-interface name. If the device has no
device interface, the string length is zero. For
DRV_QUERYDEVICEINTERFACE, dwParam2 specifies the buffer size in
bytes. This is an input parameter to the function. The caller should
specify a size that is greater than or equal to the buffer size
retrieved by the DRV_QUERYDEVICEINTERFACESIZE message. The
DRV_QUERYDEVICEINTERFACE message is supported in Windows Me, and
Windows 2000 and later. This message is valid only for the
waveInMessage, waveOutMessage, midiInMessage, midiOutMessage, and
mixerMessage functions. The system intercepts this message and
returns the appropriate value without sending the message to the
device driver. For general information about system-intercepted
xxxMessage functions, see System-Intercepted Device Messages. The
following two message constants are used together for the purpose of
obtaining device interface names:
This doc was truncated.


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
The waveInPrepareHeader function prepares a buffer for waveform-audio input.
%group
Win32 winmm
%prm
hwi, pwh, cbwh
hwi : [intptr] Handle to the waveform-audio input device.
pwh : [var] Pointer to a WAVEHDR structure that identifies the buffer to be prepared.
cbwh : [int] Size, in bytes, of the WAVEHDR structure.
%inst
The waveInPrepareHeader function prepares a buffer for waveform-audio
input.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
The lpData, dwBufferLength, and dwFlags members of the WAVEHDR
structure must be set before calling this function (dwFlags must be
zero).


%index
waveInReset
The waveInReset function stops input on the given waveform-audio input device and resets the current position to zero. All pending buffers are marked as done and returned to the application.
%group
Win32 winmm
%prm
hwi
hwi : [intptr] Handle to the waveform-audio input device.
%inst
The waveInReset function stops input on the given waveform-audio
input device and resets the current position to zero. All pending
buffers are marked as done and returned to the application.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


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
The waveInUnprepareHeader function cleans up the preparation performed by the waveInPrepareHeader function.
%group
Win32 winmm
%prm
hwi, pwh, cbwh
hwi : [intptr] Handle to the waveform-audio input device.
pwh : [var] Pointer to a WAVEHDR structure identifying the buffer to be cleaned up.
cbwh : [int] Size, in bytes, of the WAVEHDR structure.
%inst
The waveInUnprepareHeader function cleans up the preparation
performed by the waveInPrepareHeader function.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
This function complements the waveInPrepareHeader function. You must
call this function before freeing the buffer. After passing a buffer
to the device driver with the waveInAddBuffer function, you must wait
until the driver is finished with the buffer before calling
waveInUnprepareHeader. Unpreparing a buffer that has not been
prepared has no effect, and the function returns zero.


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
The waveOutBreakLoop function breaks a loop on the given waveform-audio output device and allows playback to continue with the next block in the driver list.
%group
Win32 winmm
%prm
hwo
hwo : [intptr] Handle to the waveform-audio output device.
%inst
The waveOutBreakLoop function breaks a loop on the given
waveform-audio output device and allows playback to continue with the
next block in the driver list.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
The blocks making up the loop are played to the end before the loop
is terminated. Calling this function when nothing is playing or
looping has no effect, and the function returns zero.


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
The waveOutGetID function retrieves the device identifier for the given waveform-audio output device.
%group
Win32 winmm
%prm
hwo, puDeviceID
hwo : [intptr] Handle to the waveform-audio output device.
puDeviceID : [var] Pointer to a variable to be filled with the device identifier.
%inst
The waveOutGetID function retrieves the device identifier for the
given waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.


%index
waveOutGetNumDevs
The waveOutGetNumDevs function retrieves the number of waveform-audio output devices present in the system.
%group
Win32 winmm
%prm

%inst
The waveOutGetNumDevs function retrieves the number of waveform-audio
output devices present in the system.

[戻り値]
Returns the number of devices. A return value of zero means that no
devices are present or that an error occurred.


%index
waveOutGetPitch
The waveOutGetPitch function retrieves the current pitch setting for the specified waveform-audio output device.
%group
Win32 winmm
%prm
hwo, pdwPitch
hwo : [intptr] Handle to the waveform-audio output device.
pdwPitch : [var] Pointer to a variable to be filled with the current pitch multiplier setting. The pitch multiplier indicates the current change in pitch from the original authored setting. The pitch multiplier must be a positive value. The pitch multiplier is specified as a fixed-point value. The high-order word of the variable contains the signed integer part of the number, and the low-order word contains the fractional part. A value of 0x8000 in the low-order word represents one-half, and 0x4000 represents one-quarter. For example, the value 0x00010000 specifies a multiplier of 1.0 (no pitch change), and a value of 0x000F8000 specifies a multiplier of 15.5.
%inst
The waveOutGetPitch function retrieves the current pitch setting for
the specified waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Changing the pitch does not change the playback rate, sample rate, or
playback time. Not all devices support pitch changes. To determine
whether the device supports pitch control, use the WAVECAPS_PITCH
flag to test the dwSupport member of the WAVEOUTCAPS structure
(filled by the waveOutGetDevCaps function).


%index
waveOutGetPlaybackRate
The waveOutGetPlaybackRate function retrieves the current playback rate for the specified waveform-audio output device.
%group
Win32 winmm
%prm
hwo, pdwRate
hwo : [intptr] Handle to the waveform-audio output device.
pdwRate : [var] Pointer to a variable to be filled with the current playback rate. The playback rate setting is a multiplier indicating the current change in playback rate from the original authored setting. The playback rate multiplier must be a positive value. The rate is specified as a fixed-point value. The high-order word of the variable contains the signed integer part of the number, and the low-order word contains the fractional part. A value of 0x8000 in the low-order word represents one-half, and 0x4000 represents one-quarter. For example, the value 0x00010000 specifies a multiplier of 1.0 (no playback rate change), and a value of 0x000F8000 specifies a multiplier of 15.5.
%inst
The waveOutGetPlaybackRate function retrieves the current playback
rate for the specified waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Changing the playback rate does not change the sample rate but does
change the playback time. Not all devices support playback rate
changes. To determine whether a device supports playback rate
changes, use the WAVECAPS_PLAYBACKRATE flag to test the dwSupport
member of the WAVEOUTCAPS structure (filled by the waveOutGetDevCaps
function).


%index
waveOutGetPosition
The waveOutGetPosition function retrieves the current playback position of the given waveform-audio output device.
%group
Win32 winmm
%prm
hwo, pmmt, cbmmt
hwo : [intptr] Handle to the waveform-audio output device.
pmmt : [var] Pointer to an MMTIME structure.
cbmmt : [int] Size, in bytes, of the MMTIME structure.
%inst
The waveOutGetPosition function retrieves the current playback
position of the given waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Before calling this function, set the wType member of the MMTIME
structure to indicate the time format you want. After calling this
function, check wType to determine whether the time format is
supported. If the format is not supported, wType will specify an
alternative format. The position is set to zero when the device is
opened or reset.


%index
waveOutGetVolume
The waveOutGetVolume function retrieves the current volume level of the specified waveform-audio output device.
%group
Win32 winmm
%prm
hwo, pdwVolume
hwo : [intptr] Handle to an open waveform-audio output device. This parameter can also be a device identifier.
pdwVolume : [var] Pointer to a variable to be filled with the current volume setting. The low-order word of this location contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence. If a device does not support both left and right volume control, the low-order word of the specified location contains the mono volume level. The full 16-bit setting(s) set with the waveOutSetVolume function is returned, regardless of whether the device supports the full 16 bits of volume-level control.
%inst
The waveOutGetVolume function retrieves the current volume level of
the specified waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If a device identifier is used, then the result of the
waveOutGetVolume call and the information returned in pdwVolume
applies to all instances of the device. If a device handle is used,
then the result and information returned applies only to the instance
of the device referenced by the device handle. Not all devices
support volume changes. To determine whether the device supports
volume control, use the WAVECAPS_VOLUME flag to test the dwSupport
member of the WAVEOUTCAPS structure (filled by the waveOutGetDevCaps
function). To determine whether the device supports left- and
right-channel volume control, use the WAVECAPS_LRVOLUME flag to test
the dwSupport member of the WAVEOUTCAPS structure (filled by
waveOutGetDevCaps). Volume settings are interpreted logarithmically.
This means the perceived increase in volume is the same when
increasing the volume level from 0x5000 to 0x6000 as it is from
0x4000 to 0x5000.


%index
waveOutMessage
The waveOutMessage function sends messages to the waveform-audio output device drivers.
%group
Win32 winmm
%prm
hwo, uMsg, dw1, dw2
hwo : [intptr] Identifier of the waveform device that receives the message. You must cast the device ID to the HWAVEOUT handle type. If you supply a handle instead of a device ID, the function fails and returns the MMSYSERR_NOSUPPORT error code.
uMsg : [int] Message to send.
dw1 : [int] Message parameter.
dw2 : [int] Message parameter.
%inst
The waveOutMessage function sends messages to the waveform-audio
output device drivers.

[戻り値]
Returns the value returned from the driver.

[備考]
The DRV_QUERYDEVICEINTERFACE message queries for the device-interface
name of a waveIn, waveOut, midiIn, midiOut, or mixer device. For
DRV_QUERYDEVICEINTERFACE, dwParam1 is a pointer to a caller-allocated
buffer into which the function writes a null-terminated Unicode
string containing the device-interface name. If the device has no
device interface, the string length is zero. For
DRV_QUERYDEVICEINTERFACE, dwParam2 specifies the buffer size in
bytes. This is an input parameter to the function. The caller should
specify a size that is greater than or equal to the buffer size
retrieved by the DRV_QUERYDEVICEINTERFACESIZE message. The
DRV_QUERYDEVICEINTERFACE message is supported in Windows Me, and
Windows 2000 and later. This message is valid only for the
waveInMessage, waveOutMessage, midiInMessage, midiOutMessage, and
mixerMessage functions. The system intercepts this message and
returns the appropriate value without sending the message to the
device driver. For general information about system-intercepted
xxxMessage functions, see System-Intercepted Device Messages. The
following two message constants are used together for the purpose of
obtaining device interface names:
This doc was truncated.


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
The waveOutPause function pauses playback on the given waveform-audio output device. The current position is saved. Use the waveOutRestart function to resume playback from the current position.
%group
Win32 winmm
%prm
hwo
hwo : [intptr] Handle to the waveform-audio output device.
%inst
The waveOutPause function pauses playback on the given waveform-audio
output device. The current position is saved. Use the waveOutRestart
function to resume playback from the current position.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Calling this function when the output is already paused has no
effect, and the function returns zero.


%index
waveOutPrepareHeader
The waveOutPrepareHeader function prepares a waveform-audio data block for playback.
%group
Win32 winmm
%prm
hwo, pwh, cbwh
hwo : [intptr] Handle to the waveform-audio output device.
pwh : [var] Pointer to a WAVEHDR structure that identifies the data block to be prepared.
cbwh : [int] Size, in bytes, of the WAVEHDR structure.
%inst
The waveOutPrepareHeader function prepares a waveform-audio data
block for playback.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Set the lpData, dwBufferLength, and dwFlags members of the WAVEHDR
structure before calling this function. Set the dwFlags member to
zero. The dwFlags, dwBufferLength, and dwLoops members of the WAVEHDR
structure can change between calls to this function and the
waveOutWrite function. If you change the size specified by
dwBufferLength before the call to waveOutWrite, the new value must be
less than the prepared value. If the method succeeds, the
WHDR_PREPARED flag is set in the dwFlags member of the WAVEHDR
structure. Preparing a header that has already been prepared has no
effect, and the function returns zero.


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
The waveOutRestart function resumes playback on a paused waveform-audio output device.
%group
Win32 winmm
%prm
hwo
hwo : [intptr] Handle to the waveform-audio output device.
%inst
The waveOutRestart function resumes playback on a paused
waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Calling this function when the output is not paused has no effect,
and the function returns zero.


%index
waveOutSetPitch
The waveOutSetPitch function sets the pitch for the specified waveform-audio output device.
%group
Win32 winmm
%prm
hwo, dwPitch
hwo : [intptr] Handle to the waveform-audio output device.
dwPitch : [int] New pitch multiplier setting. This setting indicates the current change in pitch from the original authored setting. The pitch multiplier must be a positive value. The pitch multiplier is specified as a fixed-point value. The high-order word contains the signed integer part of the number, and the low-order word contains the fractional part. A value of 0x8000 in the low-order word represents one-half, and 0x4000 represents one-quarter. For example, the value 0x00010000 specifies a multiplier of 1.0 (no pitch change), and a value of 0x000F8000 specifies a multiplier of 15.5.
%inst
The waveOutSetPitch function sets the pitch for the specified
waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Changing the pitch does not change the playback rate or the sample
rate, nor does it change the playback time. Not all devices support
pitch changes. To determine whether the device supports pitch
control, use the WAVECAPS_PITCH flag to test the dwSupport member of
the WAVEOUTCAPS structure (filled by the waveOutGetDevCaps function).


%index
waveOutSetPlaybackRate
The waveOutSetPlaybackRate function sets the playback rate for the specified waveform-audio output device.
%group
Win32 winmm
%prm
hwo, dwRate
hwo : [intptr] Handle to the waveform-audio output device.
dwRate : [int] New playback rate setting. This setting is a multiplier indicating the current change in playback rate from the original authored setting. The playback rate multiplier must be a positive value. The rate is specified as a fixed-point value. The high-order word contains the signed integer part of the number, and the low-order word contains the fractional part. A value of 0x8000 in the low-order word represents one-half, and 0x4000 represents one-quarter. For example, the value 0x00010000 specifies a multiplier of 1.0 (no playback rate change), and a value of 0x000F8000 specifies a multiplier of 15.5.
%inst
The waveOutSetPlaybackRate function sets the playback rate for the
specified waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Changing the playback rate does not change the sample rate but does
change the playback time. Not all devices support playback rate
changes. To determine whether a device supports playback rate
changes, use the WAVECAPS_PLAYBACKRATE flag to test the dwSupport
member of the WAVEOUTCAPS structure (filled by the waveOutGetDevCaps
function).


%index
waveOutSetVolume
The waveOutSetVolume function sets the volume level of the specified waveform-audio output device.
%group
Win32 winmm
%prm
hwo, dwVolume
hwo : [intptr] Handle to an open waveform-audio output device. This parameter can also be a device identifier.
dwVolume : [int] New volume setting. The low-order word contains the left-channel volume setting, and the high-order word contains the right-channel setting. A value of 0xFFFF represents full volume, and a value of 0x0000 is silence. If a device does not support both left and right volume control, the low-order word of dwVolume specifies the volume level, and the high-order word is ignored.
%inst
The waveOutSetVolume function sets the volume level of the specified
waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If a device identifier is used, then the result of the
waveOutSetVolume call applies to all instances of the device. If a
device handle is used, then the result applies only to the instance
of the device referenced by the device handle. Not all devices
support volume changes. To determine whether the device supports
volume control, use the WAVECAPS_VOLUME flag to test the dwSupport
member of the WAVEOUTCAPS structure (filled by the waveOutGetDevCaps
function). To determine whether the device supports volume control on
both the left and right channels, use the WAVECAPS_LRVOLUME flag.
Most devices do not support the full 16 bits of volume-level control
and will not use the least-significant bits of the requested volume
setting. For example, if a device supports 4 bits of volume control,
the values 0x4000, 0x4FFF, and 0x43BE will all be truncated to
0x4000. The waveOutGetVolume function returns the full 16-bit setting
set with waveOutSetVolume. Volume settings are interpreted
logarithmically. This means the perceived increase in volume is the
same when increasing the volume level from 0x5000 to 0x6000 as it is
from 0x4000 to 0x5000.


%index
waveOutUnprepareHeader
The waveOutUnprepareHeader function cleans up the preparation performed by the waveOutPrepareHeader function. This function must be called after the device driver is finished with a data block. You must call this function before freeing the buffer.
%group
Win32 winmm
%prm
hwo, pwh, cbwh
hwo : [intptr] Handle to the waveform-audio output device.
pwh : [var] Pointer to a WAVEHDR structure identifying the data block to be cleaned up.
cbwh : [int] Size, in bytes, of the WAVEHDR structure.
%inst
The waveOutUnprepareHeader function cleans up the preparation
performed by the waveOutPrepareHeader function. This function must be
called after the device driver is finished with a data block. You
must call this function before freeing the buffer.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
This function complements waveOutPrepareHeader. You must call this
function before freeing the buffer. After passing a buffer to the
device driver with the waveOutWrite function, you must wait until the
driver is finished with the buffer before calling
waveOutUnprepareHeader. Unpreparing a buffer that has not been
prepared has no effect, and the function returns zero.


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

