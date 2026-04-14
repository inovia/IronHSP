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
The timeBeginPeriod function requests a minimum resolution for periodic timers.
%group
Win32 winmm
%prm
uPeriod
uPeriod : [int] Minimum timer resolution, in milliseconds, for the application or device driver. A lower value specifies a higher (more accurate) resolution.
%inst
The timeBeginPeriod function requests a minimum resolution for
periodic timers.

[戻り値]
Returns TIMERR_NOERROR if successful or TIMERR_NOCANDO if the
resolution specified in uPeriod is out of range.

[備考]
Call this function immediately before using timer services, and call
the timeEndPeriod function immediately after you are finished using
the timer services. You must match each call to timeBeginPeriod with
a call to timeEndPeriod, specifying the same minimum resolution in
both calls. An application can make multiple timeBeginPeriod calls as
long as each call is matched with a call to timeEndPeriod. Prior to
Windows 10, version 2004, this function affects a global Windows
setting. For all processes Windows uses the lowest value (that is,
highest resolution) requested by any process. Starting with Windows
10, version 2004, this function no longer affects global timer
resolution. For processes which call this function, Windows uses the
lowest value (that is, highest resolution) requested by any process.
For processes which have not called this function, Windows does not
guarantee a higher resolution than the default system resolution.
Starting with Windows 11, if a window-owning process becomes fully
occluded, minimized, or otherwise invisible or inaudible to the end
user, Windows does not guarantee a higher resolution than the default
system resolution. See SetProcessInformation for more information on
this behavior. Setting a higher resolution can improve the accuracy
of time-out intervals in wait functions. However, it can also reduce
overall system performance, because the thread scheduler switches
tasks more often. High resolutions can also prevent the CPU power
management system from entering power-saving modes. Setting a higher
resolution does not improve the accuracy of the high-resolution
performance counter.


%index
timeEndPeriod
The timeEndPeriod function clears a previously set minimum timer resolution.
%group
Win32 winmm
%prm
uPeriod
uPeriod : [int] Minimum timer resolution specified in the previous call to the timeBeginPeriod function.
%inst
The timeEndPeriod function clears a previously set minimum timer
resolution.

[戻り値]
Returns TIMERR_NOERROR if successful or TIMERR_NOCANDO if the
resolution specified in uPeriod is out of range.

[備考]
Call this function immediately after you are finished using timer
services. You must match each call to timeBeginPeriod with a call to
timeEndPeriod, specifying the same minimum resolution in both calls.
An application can make multiple timeBeginPeriod calls as long as
each call is matched with a call to timeEndPeriod.


%index
timeGetTime
The timeGetTime function retrieves the system time, in milliseconds. The system time is the time elapsed since Windows was started.
%group
Win32 winmm
%prm

%inst
The timeGetTime function retrieves the system time, in milliseconds.
The system time is the time elapsed since Windows was started.

[戻り値]
Returns the system time, in milliseconds.

[備考]
The only difference between this function and the timeGetSystemTime
function is that timeGetSystemTime uses the MMTIME structure to
return the system time. The timeGetTime function has less overhead
than timeGetSystemTime. Note that the value returned by the
timeGetTime function is a DWORD value. The return value wraps around
to 0 every 2^32 milliseconds, which is about 49.71 days. This can
cause problems in code that directly uses the timeGetTime return
value in computations, particularly where the value is used to
control code execution. You should always use the difference between
two timeGetTime return values in computations. The default precision
of the timeGetTime function can be five milliseconds or more,
depending on the machine. You can use the timeBeginPeriod and
timeEndPeriod functions to increase the precision of timeGetTime. If
you do so, the minimum difference between successive values returned
by timeGetTime can be as large as the minimum period value set using
timeBeginPeriod and timeEndPeriod. Use the QueryPerformanceCounter
and QueryPerformanceFrequency functions to measure short time
intervals at a high resolution.


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
The waveInClose function closes the given waveform-audio input device.
%group
Win32 winmm
%prm
hwi
hwi : [intptr] Handle to the waveform-audio input device. If the function succeeds, the handle is no longer valid after this call.
%inst
The waveInClose function closes the given waveform-audio input
device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If there are input buffers that have been sent with the
waveInAddBuffer function and that haven't been returned to the
application, the close operation will fail. Call the waveInReset
function to mark all pending buffers as done.


%index
waveInOpen
The waveInOpen function opens the given waveform-audio input device for recording.
%group
Win32 winmm
%prm
phwi, uDeviceID, pwfx, dwCallback, dwInstance, fdwOpen
phwi : [intptr] Pointer to a buffer that receives a handle identifying the open waveform-audio input device. Use this handle to identify the device when calling other waveform-audio input functions. This parameter can be NULL if WAVE_FORMAT_QUERY is specified for fdwOpen.
uDeviceID : [int] Identifier of the waveform-audio input device to open. It can be either a device identifier or a handle of an open waveform-audio input device. You can use the following flag instead of a device identifier.
pwfx : [var] Pointer to a WAVEFORMATEX structure that identifies the desired format for recording waveform-audio data. You can free this structure immediately after waveInOpen returns.
dwCallback : [int] Pointer to a fixed callback function, an event handle, a handle to a window, or the identifier of a thread to be called during waveform-audio recording to process messages related to the progress of recording. If no callback function is required, this value can be zero. For more information on the callback function, see waveInProc.
dwInstance : [int] User-instance data passed to the callback mechanism. This parameter is not used with the window callback mechanism.
fdwOpen : [int] Flags for opening the device. The following values are defined.
%inst
The waveInOpen function opens the given waveform-audio input device
for recording.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Use the waveInGetNumDevs function to determine the number of
waveform-audio input devices present on the system. The device
identifier specified by uDeviceID varies from zero to one less than
the number of devices present. The WAVE_MAPPER constant can also be
used as a device identifier.
If you choose to have a window or thread receive callback
information, the following messages are sent to the window procedure
or thread to indicate the progress of waveform-audio input:
MM_WIM_OPEN, MM_WIM_CLOSE, and MM_WIM_DATA.
If you choose to have a function receive callback information, the
following messages are sent to the function to indicate the progress
of waveform-audio input: WIM_OPEN, WIM_CLOSE, and WIM_DATA.


%index
waveInStart
The waveInStart function starts input on the given waveform-audio input device.
%group
Win32 winmm
%prm
hwi
hwi : [intptr] Handle to the waveform-audio input device.
%inst
The waveInStart function starts input on the given waveform-audio
input device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Buffers are returned to the application when full or when the
waveInReset function is called (the dwBytesRecorded member in the
header will contain the length of data). If there are no buffers in
the queue, the data is thrown away without notifying the application,
and input continues. Calling this function when input is already
started has no effect, and the function returns zero.


%index
waveInStop
The waveInStop function stops waveform-audio input.
%group
Win32 winmm
%prm
hwi
hwi : [intptr] Handle to the waveform-audio input device.
%inst
The waveInStop function stops waveform-audio input.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
If there are any buffers in the queue, the current buffer will be
marked as done (the dwBytesRecorded member in the header will contain
the length of data), but any empty buffers in the queue will remain
there. Calling this function when input is not started has no effect,
and the function returns zero.


%index
waveOutClose
The waveOutClose function closes the given waveform-audio output device.
%group
Win32 winmm
%prm
hwo
hwo : [intptr] Handle to the waveform-audio output device. If the function succeeds, the handle is no longer valid after this call.
%inst
The waveOutClose function closes the given waveform-audio output
device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
The close operation fails if the device is still playing a
waveform-audio buffer that was previously sent by calling
waveOutWrite. Before calling waveOutClose, the application must wait
for all buffers to finish playing or call the waveOutReset function
to terminate playback.


%index
waveOutOpen
The waveOutOpen function opens the given waveform-audio output device for playback.
%group
Win32 winmm
%prm
phwo, uDeviceID, pwfx, dwCallback, dwInstance, fdwOpen
phwo : [intptr] Pointer to a buffer that receives a handle identifying the open waveform-audio output device. Use the handle to identify the device when calling other waveform-audio output functions. This parameter might be NULL if the WAVE_FORMAT_QUERY flag is specified for fdwOpen.
uDeviceID : [int] Identifier of the waveform-audio output device to open. It can be either a device identifier or a handle of an open waveform-audio input device. You can also use the following flag instead of a device identifier:
pwfx : [var] Pointer to a WAVEFORMATEX structure that identifies the format of the waveform-audio data to be sent to the device. You can free this structure immediately after passing it to waveOutOpen.
dwCallback : [int] Specifies the callback mechanism. The value must be one of the following:
dwInstance : [int] User-instance data passed to the callback mechanism. This parameter is not used with the window callback mechanism.
fdwOpen : [int] Flags for opening the device. The following values are defined.
%inst
The waveOutOpen function opens the given waveform-audio output device
for playback.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
Use the waveOutGetNumDevs function to determine the number of
waveform-audio output devices present in the system. If the value
specified by the uDeviceID parameter is a device identifier, it can
vary from zero to one less than the number of devices present. The
WAVE_MAPPER constant can also be used as a device identifier.
The structure pointed to by pwfx can be extended to include
type-specific information for certain data formats. For example, for
PCM data, an extra UINT is added to specify the number of bits per
sample. Use the PCMWAVEFORMAT structure in this case. For all other
waveform-audio formats, use the WAVEFORMATEX structure to specify the
length of the additional data. If you choose to have a window or
thread receive callback information, the following messages are sent
to the window procedure function to indicate the progress of
waveform-audio output: MM_WOM_OPEN, MM_WOM_CLOSE, and MM_WOM_DONE.
Callback Mechanism The dwCallback and fdwOpen parameters specify how
the application is notified about the progress of waveform-audio
output. If fdwOpen contains the CALLBACK_FUNCTION flag, dwCallback is
a pointer to a callback function. For the function signature, see
waveOutProc. The uMsg parameter of the callback indicates the
progress of the audio output:
This doc was truncated.


%index
waveOutReset
The waveOutReset function stops playback on the given waveform-audio output device and resets the current position to zero. All pending playback buffers are marked as done (WHDR_DONE) and returned to the application.
%group
Win32 winmm
%prm
hwo
hwo : [intptr] Handle to the waveform-audio output device.
%inst
The waveOutReset function stops playback on the given waveform-audio
output device and resets the current position to zero. All pending
playback buffers are marked as done (WHDR_DONE) and returned to the
application.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
After this function returns, the application can send new playback
buffers to the device by calling waveOutWrite, or close the device by
calling waveOutClose.


%index
waveOutWrite
The waveOutWrite function sends a data block to the given waveform-audio output device.
%group
Win32 winmm
%prm
hwo, pwh, cbwh
hwo : [intptr] Handle to the waveform-audio output device.
pwh : [var] Pointer to a WAVEHDR structure containing information about the data block.
cbwh : [int] Size, in bytes, of the WAVEHDR structure.
%inst
The waveOutWrite function sends a data block to the given
waveform-audio output device.

[戻り値]
Returns MMSYSERR_NOERROR if successful or an error otherwise.
Possible error values include the following.
This doc was truncated.

[備考]
When the buffer is finished, the WHDR_DONE bit is set in the dwFlags
member of the WAVEHDR structure. The buffer must be prepared with the
waveOutPrepareHeader function before it is passed to waveOutWrite.
Unless the device is paused by calling the waveOutPause function,
playback begins when the first data block is sent to the device.

