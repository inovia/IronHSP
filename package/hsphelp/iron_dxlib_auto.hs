;
; iron_dxlib_auto.hs — hsp3dx 自動生成 DxLib 命令の HSP Help
; DO NOT EDIT — tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py で再生成
; 関数数: 1129
;

%dll
iron_dxlib_auto
%ver
hsp3dx 5.5c
%date
2026/04/21
%author
DxLib: Takumi Yamada / hsp3dx binding: IronHSP Project
%url
https://dxlib.xsrv.jp/
%note
hsp3dx で iron_dxlib.as を #include すれば利用可能 (iron_dxlib_auto.as は内部 include)
%type
DxLib 自動生成コマンド (hsp3dx)
%port
Win

%index
dx_DxLib_GlobalStructInitialize
DxLib DxLib_GlobalStructInitialize (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の DxLib_GlobalStructInitialize() を呼び出します。
^p
元関数シグネチャ: int DxLib_GlobalStructInitialize(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DxLib_GlobalStructInitialize 項を参照。

%index
dx_DxLib_IsInit
DxLib DxLib_IsInit (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の DxLib_IsInit() を呼び出します。
^p
元関数シグネチャ: int DxLib_IsInit(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DxLib_IsInit 項を参照。

%index
dx_GetLastErrorCode
DxLib GetLastErrorCode (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetLastErrorCode() を呼び出します。
^p
元関数シグネチャ: int GetLastErrorCode(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLastErrorCode 項を参照。

%index
dx_GetLastErrorMessage
DxLib GetLastErrorMessage (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str StringBuffer
p2 : int StringBufferBytes
%inst
DxLib の GetLastErrorMessage() を呼び出します。
^p
元関数シグネチャ: int GetLastErrorMessage(const TCHAR * StringBuffer, int StringBufferBytes)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLastErrorMessage 項を参照。

%index
dx_SetAlwaysRunFlag
DxLib SetAlwaysRunFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetAlwaysRunFlag() を呼び出します。
^p
元関数シグネチャ: int SetAlwaysRunFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetAlwaysRunFlag 項を参照。

%index
dx_WaitTimer
DxLib WaitTimer (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int WaitTime
%inst
DxLib の WaitTimer() を呼び出します。
^p
元関数シグネチャ: int WaitTimer(int WaitTime)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WaitTimer 項を参照。

%index
dx_WaitKey
DxLib WaitKey (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の WaitKey() を呼び出します。
^p
元関数シグネチャ: int WaitKey(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WaitKey 項を参照。

%index
dx_SleepThread
DxLib SleepThread (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int WaitTime
%inst
DxLib の SleepThread() を呼び出します。
^p
元関数シグネチャ: int SleepThread(int WaitTime)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SleepThread 項を参照。

%index
dx_GetNowCount
DxLib GetNowCount (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseRDTSCFlag (default FALSE)
%inst
DxLib の GetNowCount() を呼び出します。
^p
元関数シグネチャ: int GetNowCount(int UseRDTSCFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetNowCount 項を参照。

%index
dx_GetRand
DxLib GetRand (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int RandMax
%inst
DxLib の GetRand() を呼び出します。
^p
元関数シグネチャ: int GetRand(int RandMax)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetRand 項を参照。

%index
dx_SRand
DxLib SRand (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Seed
%inst
DxLib の SRand() を呼び出します。
^p
元関数シグネチャ: int SRand(int Seed)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SRand 項を参照。

%index
dx_GetBatteryLifePercent
DxLib GetBatteryLifePercent (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetBatteryLifePercent() を呼び出します。
^p
元関数シグネチャ: int GetBatteryLifePercent(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetBatteryLifePercent 項を参照。

%index
dx_GetClipboardText
DxLib GetClipboardText (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str DestBuffer
p2 : int DestBufferBytes (default -1)
%inst
DxLib の GetClipboardText() を呼び出します。
^p
元関数シグネチャ: int GetClipboardText(const TCHAR * DestBuffer, int DestBufferBytes)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetClipboardText 項を参照。

%index
dx_SetClipboardText
DxLib SetClipboardText (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str Text
%inst
DxLib の SetClipboardText() を呼び出します。
^p
元関数シグネチャ: int SetClipboardText(const TCHAR * Text)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetClipboardText 項を参照。

%index
dx_LogFileAdd
DxLib LogFileAdd (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str String
%inst
DxLib の LogFileAdd() を呼び出します。
^p
元関数シグネチャ: int LogFileAdd(const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LogFileAdd 項を参照。

%index
dx_LogFileTabAdd
DxLib LogFileTabAdd (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
(引数なし)
%inst
DxLib の LogFileTabAdd() を呼び出します。
^p
元関数シグネチャ: int LogFileTabAdd(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LogFileTabAdd 項を参照。

%index
dx_LogFileTabSub
DxLib LogFileTabSub (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
(引数なし)
%inst
DxLib の LogFileTabSub() を呼び出します。
^p
元関数シグネチャ: int LogFileTabSub(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LogFileTabSub 項を参照。

%index
dx_ErrorLogAdd
DxLib ErrorLogAdd (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str String
%inst
DxLib の ErrorLogAdd() を呼び出します。
^p
元関数シグネチャ: int ErrorLogAdd(const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ErrorLogAdd 項を参照。

%index
dx_ErrorLogTabAdd
DxLib ErrorLogTabAdd (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の ErrorLogTabAdd() を呼び出します。
^p
元関数シグネチャ: int ErrorLogTabAdd(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ErrorLogTabAdd 項を参照。

%index
dx_ErrorLogTabSub
DxLib ErrorLogTabSub (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の ErrorLogTabSub() を呼び出します。
^p
元関数シグネチャ: int ErrorLogTabSub(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ErrorLogTabSub 項を参照。

%index
dx_SetUseTimeStampFlag
DxLib SetUseTimeStampFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetUseTimeStampFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseTimeStampFlag(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseTimeStampFlag 項を参照。

%index
dx_SetOutApplicationLogValidFlag
DxLib SetOutApplicationLogValidFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetOutApplicationLogValidFlag() を呼び出します。
^p
元関数シグネチャ: int SetOutApplicationLogValidFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetOutApplicationLogValidFlag 項を参照。

%index
dx_SetOutApplicationSystemLogValidFlag
DxLib SetOutApplicationSystemLogValidFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetOutApplicationSystemLogValidFlag() を呼び出します。
^p
元関数シグネチャ: int SetOutApplicationSystemLogValidFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetOutApplicationSystemLogValidFlag 項を参照。

%index
dx_SetApplicationLogFileName
DxLib SetApplicationLogFileName (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str FileName
%inst
DxLib の SetApplicationLogFileName() を呼び出します。
^p
元関数シグネチャ: int SetApplicationLogFileName(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetApplicationLogFileName 項を参照。

%index
dx_SetApplicationLogSaveDirectory
DxLib SetApplicationLogSaveDirectory (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str DirectoryPath
%inst
DxLib の SetApplicationLogSaveDirectory() を呼び出します。
^p
元関数シグネチャ: int SetApplicationLogSaveDirectory(const TCHAR * DirectoryPath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetApplicationLogSaveDirectory 項を参照。

%index
dx_SetUseDateNameLogFile
DxLib SetUseDateNameLogFile (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseDateNameLogFile() を呼び出します。
^p
元関数シグネチャ: int SetUseDateNameLogFile(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseDateNameLogFile 項を参照。

%index
dx_SetLogDrawOutFlag
DxLib SetLogDrawOutFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int DrawFlag
%inst
DxLib の SetLogDrawOutFlag() を呼び出します。
^p
元関数シグネチャ: int SetLogDrawOutFlag(int DrawFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLogDrawOutFlag 項を参照。

%index
dx_GetLogDrawFlag
DxLib GetLogDrawFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetLogDrawFlag() を呼び出します。
^p
元関数シグネチャ: int GetLogDrawFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLogDrawFlag 項を参照。

%index
dx_SetLogFontSize
DxLib SetLogFontSize (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Size
%inst
DxLib の SetLogFontSize() を呼び出します。
^p
元関数シグネチャ: int SetLogFontSize(int Size)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLogFontSize 項を参照。

%index
dx_SetLogFontHandle
DxLib SetLogFontHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の SetLogFontHandle() を呼び出します。
^p
元関数シグネチャ: int SetLogFontHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLogFontHandle 項を参照。

%index
dx_SetLogDrawArea
DxLib SetLogDrawArea (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
%inst
DxLib の SetLogDrawArea() を呼び出します。
^p
元関数シグネチャ: int SetLogDrawArea(int x1, int y1, int x2, int y2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLogDrawArea 項を参照。

%index
dx_putsDx
DxLib putsDx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str String
p2 : int NewLine (default TRUE)
%inst
DxLib の putsDx() を呼び出します。
^p
元関数シグネチャ: int putsDx(const TCHAR * String, int NewLine)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の putsDx 項を参照。

%index
dx_clsDx
DxLib clsDx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の clsDx() を呼び出します。
^p
元関数シグネチャ: int clsDx(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の clsDx 項を参照。

%index
dx_setPrintColorDx
DxLib setPrintColorDx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Color
p2 : int EdgeColor (default 0)
%inst
DxLib の setPrintColorDx() を呼び出します。
^p
元関数シグネチャ: int setPrintColorDx(int Color, int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の setPrintColorDx 項を参照。

%index
dx_SetUseASyncLoadFlag
DxLib SetUseASyncLoadFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseASyncLoadFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseASyncLoadFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseASyncLoadFlag 項を参照。

%index
dx_GetUseASyncLoadFlag
DxLib GetUseASyncLoadFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseASyncLoadFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseASyncLoadFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseASyncLoadFlag 項を参照。

%index
dx_CheckHandleASyncLoad
DxLib CheckHandleASyncLoad (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Handle
%inst
DxLib の CheckHandleASyncLoad() を呼び出します。
^p
元関数シグネチャ: int CheckHandleASyncLoad(int Handle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckHandleASyncLoad 項を参照。

%index
dx_GetHandleASyncLoadResult
DxLib GetHandleASyncLoadResult (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Handle
%inst
DxLib の GetHandleASyncLoadResult() を呼び出します。
^p
元関数シグネチャ: int GetHandleASyncLoadResult(int Handle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetHandleASyncLoadResult 項を参照。

%index
dx_SetASyncLoadFinishDeleteFlag
DxLib SetASyncLoadFinishDeleteFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Handle
%inst
DxLib の SetASyncLoadFinishDeleteFlag() を呼び出します。
^p
元関数シグネチャ: int SetASyncLoadFinishDeleteFlag(int Handle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetASyncLoadFinishDeleteFlag 項を参照。

%index
dx_WaitHandleASyncLoad
DxLib WaitHandleASyncLoad (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Handle
%inst
DxLib の WaitHandleASyncLoad() を呼び出します。
^p
元関数シグネチャ: int WaitHandleASyncLoad(int Handle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WaitHandleASyncLoad 項を参照。

%index
dx_WaitHandleASyncLoadAll
DxLib WaitHandleASyncLoadAll (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の WaitHandleASyncLoadAll() を呼び出します。
^p
元関数シグネチャ: int WaitHandleASyncLoadAll(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WaitHandleASyncLoadAll 項を参照。

%index
dx_GetASyncLoadNum
DxLib GetASyncLoadNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetASyncLoadNum() を呼び出します。
^p
元関数シグネチャ: int GetASyncLoadNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetASyncLoadNum 項を参照。

%index
dx_SetASyncLoadThreadNum
DxLib SetASyncLoadThreadNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ThreadNum
%inst
DxLib の SetASyncLoadThreadNum() を呼び出します。
^p
元関数シグネチャ: int SetASyncLoadThreadNum(int ThreadNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetASyncLoadThreadNum 項を参照。

%index
dx_SetMouseDispFlag
DxLib SetMouseDispFlag (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int DispFlag
%inst
DxLib の SetMouseDispFlag() を呼び出します。
^p
元関数シグネチャ: int SetMouseDispFlag(int DispFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMouseDispFlag 項を参照。

%index
dx_SetMouseDispIgnoreMenuFlag
DxLib SetMouseDispIgnoreMenuFlag (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int IgnoreMenuFlag
%inst
DxLib の SetMouseDispIgnoreMenuFlag() を呼び出します。
^p
元関数シグネチャ: int SetMouseDispIgnoreMenuFlag(int IgnoreMenuFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMouseDispIgnoreMenuFlag 項を参照。

%index
dx_GetMouseWheelRotVol
DxLib GetMouseWheelRotVol (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int CounterReset (default TRUE)
%inst
DxLib の GetMouseWheelRotVol() を呼び出します。
^p
元関数シグネチャ: int GetMouseWheelRotVol(int CounterReset)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMouseWheelRotVol 項を参照。

%index
dx_GetMouseHWheelRotVol
DxLib GetMouseHWheelRotVol (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int CounterReset (default TRUE)
%inst
DxLib の GetMouseHWheelRotVol() を呼び出します。
^p
元関数シグネチャ: int GetMouseHWheelRotVol(int CounterReset)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMouseHWheelRotVol 項を参照。

%index
dx_GetTouchInputNum
DxLib GetTouchInputNum (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の GetTouchInputNum() を呼び出します。
^p
元関数シグネチャ: int GetTouchInputNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetTouchInputNum 項を参照。

%index
dx_GetTouchInputLogNum
DxLib GetTouchInputLogNum (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の GetTouchInputLogNum() を呼び出します。
^p
元関数シグネチャ: int GetTouchInputLogNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetTouchInputLogNum 項を参照。

%index
dx_ClearTouchInputLog
DxLib ClearTouchInputLog (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の ClearTouchInputLog() を呼び出します。
^p
元関数シグネチャ: int ClearTouchInputLog(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ClearTouchInputLog 項を参照。

%index
dx_GetTouchInputDownLogNum
DxLib GetTouchInputDownLogNum (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の GetTouchInputDownLogNum() を呼び出します。
^p
元関数シグネチャ: int GetTouchInputDownLogNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetTouchInputDownLogNum 項を参照。

%index
dx_ClearTouchInputDownLog
DxLib ClearTouchInputDownLog (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の ClearTouchInputDownLog() を呼び出します。
^p
元関数シグネチャ: int ClearTouchInputDownLog(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ClearTouchInputDownLog 項を参照。

%index
dx_GetTouchInputUpLogNum
DxLib GetTouchInputUpLogNum (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の GetTouchInputUpLogNum() を呼び出します。
^p
元関数シグネチャ: int GetTouchInputUpLogNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetTouchInputUpLogNum 項を参照。

%index
dx_ClearTouchInputUpLog
DxLib ClearTouchInputUpLog (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の ClearTouchInputUpLog() を呼び出します。
^p
元関数シグネチャ: int ClearTouchInputUpLog(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ClearTouchInputUpLog 項を参照。

%index
dx_DxSetAllocPrintFlag
DxLib DxSetAllocPrintFlag (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Flag
%inst
DxLib の DxSetAllocPrintFlag() を呼び出します。
^p
元関数シグネチャ: int DxSetAllocPrintFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DxSetAllocPrintFlag 項を参照。

%index
dx_DxGetAllocNum
DxLib DxGetAllocNum (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の DxGetAllocNum() を呼び出します。
^p
元関数シグネチャ: int DxGetAllocNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DxGetAllocNum 項を参照。

%index
dx_DxErrorCheckAlloc
DxLib DxErrorCheckAlloc (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の DxErrorCheckAlloc() を呼び出します。
^p
元関数シグネチャ: int DxErrorCheckAlloc(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DxErrorCheckAlloc 項を参照。

%index
dx_DxSetAllocSizeOutFlag
DxLib DxSetAllocSizeOutFlag (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Flag
%inst
DxLib の DxSetAllocSizeOutFlag() を呼び出します。
^p
元関数シグネチャ: int DxSetAllocSizeOutFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DxSetAllocSizeOutFlag 項を参照。

%index
dx_DxSetAllocMemoryErrorCheckFlag
DxLib DxSetAllocMemoryErrorCheckFlag (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Flag
%inst
DxLib の DxSetAllocMemoryErrorCheckFlag() を呼び出します。
^p
元関数シグネチャ: int DxSetAllocMemoryErrorCheckFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DxSetAllocMemoryErrorCheckFlag 項を参照。

%index
dx_GetUseCharCodeFormat
DxLib GetUseCharCodeFormat (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseCharCodeFormat() を呼び出します。
^p
元関数シグネチャ: int GetUseCharCodeFormat(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseCharCodeFormat 項を参照。

%index
dx_Get_wchar_t_CharCodeFormat
DxLib Get_wchar_t_CharCodeFormat (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の Get_wchar_t_CharCodeFormat() を呼び出します。
^p
元関数シグネチャ: int Get_wchar_t_CharCodeFormat(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Get_wchar_t_CharCodeFormat 項を参照。

%index
dx_strcmpDx
DxLib strcmpDx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str1
p2 : str Str2
%inst
DxLib の strcmpDx() を呼び出します。
^p
元関数シグネチャ: int strcmpDx(const TCHAR * Str1, const TCHAR * Str2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の strcmpDx 項を参照。

%index
dx_stricmpDx
DxLib stricmpDx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str1
p2 : str Str2
%inst
DxLib の stricmpDx() を呼び出します。
^p
元関数シグネチャ: int stricmpDx(const TCHAR * Str1, const TCHAR * Str2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の stricmpDx 項を参照。

%index
dx_strncmpDx
DxLib strncmpDx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str1
p2 : str Str2
p3 : int Num
%inst
DxLib の strncmpDx() を呼び出します。
^p
元関数シグネチャ: int strncmpDx(const TCHAR * Str1, const TCHAR * Str2, int Num)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の strncmpDx 項を参照。

%index
dx_strncmp2Dx
DxLib strncmp2Dx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str1
p2 : str Str2
p3 : int Num
%inst
DxLib の strncmp2Dx() を呼び出します。
^p
元関数シグネチャ: int strncmp2Dx(const TCHAR * Str1, const TCHAR * Str2, int Num)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の strncmp2Dx 項を参照。

%index
dx_strpncmpDx
DxLib strpncmpDx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str1
p2 : str Str2
p3 : int Pos
p4 : int Num
%inst
DxLib の strpncmpDx() を呼び出します。
^p
元関数シグネチャ: int strpncmpDx(const TCHAR * Str1, const TCHAR * Str2, int Pos, int Num)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の strpncmpDx 項を参照。

%index
dx_strpncmp2Dx
DxLib strpncmp2Dx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str1
p2 : str Str2
p3 : int Pos
p4 : int Num
%inst
DxLib の strpncmp2Dx() を呼び出します。
^p
元関数シグネチャ: int strpncmp2Dx(const TCHAR * Str1, const TCHAR * Str2, int Pos, int Num)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の strpncmp2Dx 項を参照。

%index
dx_strstr2Dx
DxLib strstr2Dx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str1
p2 : str Str2
%inst
DxLib の strstr2Dx() を呼び出します。
^p
元関数シグネチャ: int strstr2Dx(const TCHAR * Str1, const TCHAR * Str2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の strstr2Dx 項を参照。

%index
dx_strrstr2Dx
DxLib strrstr2Dx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str1
p2 : str Str2
%inst
DxLib の strrstr2Dx() を呼び出します。
^p
元関数シグネチャ: int strrstr2Dx(const TCHAR * Str1, const TCHAR * Str2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の strrstr2Dx 項を参照。

%index
dx_atoiDx
DxLib atoiDx (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Str
%inst
DxLib の atoiDx() を呼び出します。
^p
元関数シグネチャ: int atoiDx(const TCHAR * Str)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の atoiDx 項を参照。

%index
dx_ProcessNetMessage
DxLib ProcessNetMessage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int RunReleaseProcess (default FALSE)
%inst
DxLib の ProcessNetMessage() を呼び出します。
^p
元関数シグネチャ: int ProcessNetMessage(int RunReleaseProcess)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ProcessNetMessage 項を参照。

%index
dx_PreparationListenNetWork
DxLib PreparationListenNetWork (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
p1 : int Port (default -1)
%inst
DxLib の PreparationListenNetWork() を呼び出します。
^p
元関数シグネチャ: int PreparationListenNetWork(int Port)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PreparationListenNetWork 項を参照。

%index
dx_PreparationListenNetWork_IPv6
DxLib PreparationListenNetWork_IPv6 (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
p1 : int Port (default -1)
%inst
DxLib の PreparationListenNetWork_IPv6() を呼び出します。
^p
元関数シグネチャ: int PreparationListenNetWork_IPv6(int Port)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PreparationListenNetWork_IPv6 項を参照。

%index
dx_StopListenNetWork
DxLib StopListenNetWork (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
(引数なし)
%inst
DxLib の StopListenNetWork() を呼び出します。
^p
元関数シグネチャ: int StopListenNetWork(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopListenNetWork 項を参照。

%index
dx_CloseNetWork
DxLib CloseNetWork (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
p1 : int NetHandle
%inst
DxLib の CloseNetWork() を呼び出します。
^p
元関数シグネチャ: int CloseNetWork(int NetHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CloseNetWork 項を参照。

%index
dx_GetNetWorkAcceptState
DxLib GetNetWorkAcceptState (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int NetHandle
%inst
DxLib の GetNetWorkAcceptState() を呼び出します。
^p
元関数シグネチャ: int GetNetWorkAcceptState(int NetHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetNetWorkAcceptState 項を参照。

%index
dx_GetNetWorkDataLength
DxLib GetNetWorkDataLength (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int NetHandle
%inst
DxLib の GetNetWorkDataLength() を呼び出します。
^p
元関数シグネチャ: int GetNetWorkDataLength(int NetHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetNetWorkDataLength 項を参照。

%index
dx_GetNetWorkSendDataLength
DxLib GetNetWorkSendDataLength (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int NetHandle
%inst
DxLib の GetNetWorkSendDataLength() を呼び出します。
^p
元関数シグネチャ: int GetNetWorkSendDataLength(int NetHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetNetWorkSendDataLength 項を参照。

%index
dx_GetNewAcceptNetWork
DxLib GetNewAcceptNetWork (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetNewAcceptNetWork() を呼び出します。
^p
元関数シグネチャ: int GetNewAcceptNetWork(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetNewAcceptNetWork 項を参照。

%index
dx_GetLostNetWork
DxLib GetLostNetWork (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetLostNetWork() を呼び出します。
^p
元関数シグネチャ: int GetLostNetWork(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLostNetWork 項を参照。

%index
dx_SetConnectTimeOutWait
DxLib SetConnectTimeOutWait (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Time
%inst
DxLib の SetConnectTimeOutWait() を呼び出します。
^p
元関数シグネチャ: int SetConnectTimeOutWait(int Time)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetConnectTimeOutWait 項を参照。

%index
dx_SetUseDXNetWorkProtocol
DxLib SetUseDXNetWorkProtocol (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseDXNetWorkProtocol() を呼び出します。
^p
元関数シグネチャ: int SetUseDXNetWorkProtocol(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseDXNetWorkProtocol 項を参照。

%index
dx_GetUseDXNetWorkProtocol
DxLib GetUseDXNetWorkProtocol (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseDXNetWorkProtocol() を呼び出します。
^p
元関数シグネチャ: int GetUseDXNetWorkProtocol(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseDXNetWorkProtocol 項を参照。

%index
dx_SetUseDXProtocol
DxLib SetUseDXProtocol (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseDXProtocol() を呼び出します。
^p
元関数シグネチャ: int SetUseDXProtocol(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseDXProtocol 項を参照。

%index
dx_GetUseDXProtocol
DxLib GetUseDXProtocol (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseDXProtocol() を呼び出します。
^p
元関数シグネチャ: int GetUseDXProtocol(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseDXProtocol 項を参照。

%index
dx_SetNetWorkCloseAfterLostFlag
DxLib SetNetWorkCloseAfterLostFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetNetWorkCloseAfterLostFlag() を呼び出します。
^p
元関数シグネチャ: int SetNetWorkCloseAfterLostFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNetWorkCloseAfterLostFlag 項を参照。

%index
dx_GetNetWorkCloseAfterLostFlag
DxLib GetNetWorkCloseAfterLostFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetNetWorkCloseAfterLostFlag() を呼び出します。
^p
元関数シグネチャ: int GetNetWorkCloseAfterLostFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetNetWorkCloseAfterLostFlag 項を参照。

%index
dx_NetWorkRecvBufferClear
DxLib NetWorkRecvBufferClear (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
p1 : int NetHandle
%inst
DxLib の NetWorkRecvBufferClear() を呼び出します。
^p
元関数シグネチャ: int NetWorkRecvBufferClear(int NetHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の NetWorkRecvBufferClear 項を参照。

%index
dx_MakeUDPSocket
DxLib MakeUDPSocket (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
p1 : int RecvPort (default -1)
%inst
DxLib の MakeUDPSocket() を呼び出します。
^p
元関数シグネチャ: int MakeUDPSocket(int RecvPort)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeUDPSocket 項を参照。

%index
dx_MakeUDPSocket_IPv6
DxLib MakeUDPSocket_IPv6 (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
p1 : int RecvPort (default -1)
%inst
DxLib の MakeUDPSocket_IPv6() を呼び出します。
^p
元関数シグネチャ: int MakeUDPSocket_IPv6(int RecvPort)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeUDPSocket_IPv6 項を参照。

%index
dx_DeleteUDPSocket
DxLib DeleteUDPSocket (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
p1 : int NetUDPHandle
%inst
DxLib の DeleteUDPSocket() を呼び出します。
^p
元関数シグネチャ: int DeleteUDPSocket(int NetUDPHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteUDPSocket 項を参照。

%index
dx_CheckNetWorkRecvUDP
DxLib CheckNetWorkRecvUDP (自動生成、hsp3dx 専用)
%group
DxLib ネットワーク
%prm
p1 : int NetUDPHandle
%inst
DxLib の CheckNetWorkRecvUDP() を呼び出します。
^p
元関数シグネチャ: int CheckNetWorkRecvUDP(int NetUDPHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckNetWorkRecvUDP 項を参照。

%index
dx_ClearInputCharBuf
DxLib ClearInputCharBuf (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の ClearInputCharBuf() を呼び出します。
^p
元関数シグネチャ: int ClearInputCharBuf(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ClearInputCharBuf 項を参照。

%index
dx_GetOneChar
DxLib GetOneChar (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str CharBuffer
p2 : int DeleteFlag
%inst
DxLib の GetOneChar() を呼び出します。
^p
元関数シグネチャ: int GetOneChar(const TCHAR * CharBuffer, int DeleteFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetOneChar 項を参照。

%index
dx_GetOneCharWait
DxLib GetOneCharWait (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str CharBuffer
p2 : int DeleteFlag
%inst
DxLib の GetOneCharWait() を呼び出します。
^p
元関数シグネチャ: int GetOneCharWait(const TCHAR * CharBuffer, int DeleteFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetOneCharWait 項を参照。

%index
dx_DrawIMEInputString
DxLib DrawIMEInputString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int SelectStringNum
p4 : int DrawCandidateList (default TRUE)
%inst
DxLib の DrawIMEInputString() を呼び出します。
^p
元関数シグネチャ: int DrawIMEInputString(int x, int y, int SelectStringNum, int DrawCandidateList)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawIMEInputString 項を参照。

%index
dx_DrawIMEInputExtendString
DxLib DrawIMEInputExtendString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double ExRateX
p4 : double ExRateY
p5 : int SelectStringNum
p6 : int DrawCandidateList (default TRUE)
%inst
DxLib の DrawIMEInputExtendString() を呼び出します。
^p
元関数シグネチャ: int DrawIMEInputExtendString(int x, int y, double ExRateX, double ExRateY, int SelectStringNum, int DrawCandidateList)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawIMEInputExtendString 項を参照。

%index
dx_SetUseIMEFlag
DxLib SetUseIMEFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetUseIMEFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseIMEFlag(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseIMEFlag 項を参照。

%index
dx_GetUseIMEFlag
DxLib GetUseIMEFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseIMEFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseIMEFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseIMEFlag 項を参照。

%index
dx_SetInputStringMaxLengthIMESync
DxLib SetInputStringMaxLengthIMESync (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetInputStringMaxLengthIMESync() を呼び出します。
^p
元関数シグネチャ: int SetInputStringMaxLengthIMESync(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetInputStringMaxLengthIMESync 項を参照。

%index
dx_SetIMEInputStringMaxLength
DxLib SetIMEInputStringMaxLength (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Length
%inst
DxLib の SetIMEInputStringMaxLength() を呼び出します。
^p
元関数シグネチャ: int SetIMEInputStringMaxLength(int Length)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetIMEInputStringMaxLength 項を参照。

%index
dx_GetStringPoint
DxLib GetStringPoint (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str String
p2 : int Point
%inst
DxLib の GetStringPoint() を呼び出します。
^p
元関数シグネチャ: int GetStringPoint(const TCHAR * String, int Point)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetStringPoint 項を参照。

%index
dx_GetStringPoint2
DxLib GetStringPoint2 (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str String
p2 : int Point
%inst
DxLib の GetStringPoint2() を呼び出します。
^p
元関数シグネチャ: int GetStringPoint2(const TCHAR * String, int Point)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetStringPoint2 項を参照。

%index
dx_GetStringLength
DxLib GetStringLength (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str String
%inst
DxLib の GetStringLength() を呼び出します。
^p
元関数シグネチャ: int GetStringLength(const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetStringLength 項を参照。

%index
dx_DrawObtainsBox
DxLib DrawObtainsBox (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int AddY
p6 : int (uint 扱い) Color
p7 : int FillFlag
%inst
DxLib の DrawObtainsBox() を呼び出します。
^p
元関数シグネチャ: int DrawObtainsBox(int x1, int y1, int x2, int y2, int AddY, unsigned int Color, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawObtainsBox 項を参照。

%index
dx_KeyInputNumber
DxLib KeyInputNumber (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int x
p2 : int y
p3 : int MaxNum
p4 : int MinNum
p5 : int CancelValidFlag
%inst
DxLib の KeyInputNumber() を呼び出します。
^p
元関数シグネチャ: int KeyInputNumber(int x, int y, int MaxNum, int MinNum, int CancelValidFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の KeyInputNumber 項を参照。

%index
dx_GetIMEInputModeStr
DxLib GetIMEInputModeStr (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str GetBuffer
%inst
DxLib の GetIMEInputModeStr() を呼び出します。
^p
元関数シグネチャ: int GetIMEInputModeStr(const TCHAR * GetBuffer)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetIMEInputModeStr 項を参照。

%index
dx_SetIMEInputString
DxLib SetIMEInputString (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str String
%inst
DxLib の SetIMEInputString() を呼び出します。
^p
元関数シグネチャ: int SetIMEInputString(const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetIMEInputString 項を参照。

%index
dx_SetKeyInputStringFont
DxLib SetKeyInputStringFont (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の SetKeyInputStringFont() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputStringFont(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputStringFont 項を参照。

%index
dx_DrawKeyInputModeString
DxLib DrawKeyInputModeString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
%inst
DxLib の DrawKeyInputModeString() を呼び出します。
^p
元関数シグネチャ: int DrawKeyInputModeString(int x, int y)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawKeyInputModeString 項を参照。

%index
dx_InitKeyInput
DxLib InitKeyInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の InitKeyInput() を呼び出します。
^p
元関数シグネチャ: int InitKeyInput(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitKeyInput 項を参照。

%index
dx_DeleteKeyInput
DxLib DeleteKeyInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputHandle
%inst
DxLib の DeleteKeyInput() を呼び出します。
^p
元関数シグネチャ: int DeleteKeyInput(int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteKeyInput 項を参照。

%index
dx_SetActiveKeyInput
DxLib SetActiveKeyInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputHandle
%inst
DxLib の SetActiveKeyInput() を呼び出します。
^p
元関数シグネチャ: int SetActiveKeyInput(int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetActiveKeyInput 項を参照。

%index
dx_GetActiveKeyInput
DxLib GetActiveKeyInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の GetActiveKeyInput() を呼び出します。
^p
元関数シグネチャ: int GetActiveKeyInput(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetActiveKeyInput 項を参照。

%index
dx_CheckKeyInput
DxLib CheckKeyInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputHandle
%inst
DxLib の CheckKeyInput() を呼び出します。
^p
元関数シグネチャ: int CheckKeyInput(int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckKeyInput 項を参照。

%index
dx_ReStartKeyInput
DxLib ReStartKeyInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputHandle
%inst
DxLib の ReStartKeyInput() を呼び出します。
^p
元関数シグネチャ: int ReStartKeyInput(int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReStartKeyInput 項を参照。

%index
dx_ProcessActKeyInput
DxLib ProcessActKeyInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の ProcessActKeyInput() を呼び出します。
^p
元関数シグネチャ: int ProcessActKeyInput(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ProcessActKeyInput 項を参照。

%index
dx_DrawKeyInputString
DxLib DrawKeyInputString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int InputHandle
p4 : int DrawCandidateList (default TRUE)
%inst
DxLib の DrawKeyInputString() を呼び出します。
^p
元関数シグネチャ: int DrawKeyInputString(int x, int y, int InputHandle, int DrawCandidateList)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawKeyInputString 項を参照。

%index
dx_DrawKeyInputExtendString
DxLib DrawKeyInputExtendString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double ExRateX
p4 : double ExRateY
p5 : int InputHandle
p6 : int DrawCandidateList (default TRUE)
%inst
DxLib の DrawKeyInputExtendString() を呼び出します。
^p
元関数シグネチャ: int DrawKeyInputExtendString(int x, int y, double ExRateX, double ExRateY, int InputHandle, int DrawCandidateList)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawKeyInputExtendString 項を参照。

%index
dx_SetKeyInputDrawArea
DxLib SetKeyInputDrawArea (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int InputHandle
%inst
DxLib の SetKeyInputDrawArea() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputDrawArea(int x1, int y1, int x2, int y2, int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputDrawArea 項を参照。

%index
dx_SetKeyInputSelectArea
DxLib SetKeyInputSelectArea (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int SelectStart
p2 : int SelectEnd
p3 : int InputHandle
%inst
DxLib の SetKeyInputSelectArea() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputSelectArea(int SelectStart, int SelectEnd, int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputSelectArea 項を参照。

%index
dx_SetKeyInputDrawStartPos
DxLib SetKeyInputDrawStartPos (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int DrawStartPos
p2 : int InputHandle
%inst
DxLib の SetKeyInputDrawStartPos() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputDrawStartPos(int DrawStartPos, int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputDrawStartPos 項を参照。

%index
dx_GetKeyInputDrawStartPos
DxLib GetKeyInputDrawStartPos (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputHandle
%inst
DxLib の GetKeyInputDrawStartPos() を呼び出します。
^p
元関数シグネチャ: int GetKeyInputDrawStartPos(int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetKeyInputDrawStartPos 項を参照。

%index
dx_SetKeyInputCursorBrinkTime
DxLib SetKeyInputCursorBrinkTime (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int Time
%inst
DxLib の SetKeyInputCursorBrinkTime() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputCursorBrinkTime(int Time)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputCursorBrinkTime 項を参照。

%index
dx_SetKeyInputCursorBrinkFlag
DxLib SetKeyInputCursorBrinkFlag (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int Flag
%inst
DxLib の SetKeyInputCursorBrinkFlag() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputCursorBrinkFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputCursorBrinkFlag 項を参照。

%index
dx_SetKeyInputString
DxLib SetKeyInputString (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : str String
p2 : int InputHandle
%inst
DxLib の SetKeyInputString() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputString(const TCHAR * String, int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputString 項を参照。

%index
dx_SetKeyInputNumber
DxLib SetKeyInputNumber (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int Number
p2 : int InputHandle
%inst
DxLib の SetKeyInputNumber() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputNumber(int Number, int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputNumber 項を参照。

%index
dx_SetKeyInputNumberToFloat
DxLib SetKeyInputNumberToFloat (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : double (float 縮小) Number
p2 : int InputHandle
%inst
DxLib の SetKeyInputNumberToFloat() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputNumberToFloat(float Number, int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputNumberToFloat 項を参照。

%index
dx_GetKeyInputString
DxLib GetKeyInputString (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : str StrBuffer
p2 : int InputHandle
%inst
DxLib の GetKeyInputString() を呼び出します。
^p
元関数シグネチャ: int GetKeyInputString(const TCHAR * StrBuffer, int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetKeyInputString 項を参照。

%index
dx_GetKeyInputNumber
DxLib GetKeyInputNumber (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputHandle
%inst
DxLib の GetKeyInputNumber() を呼び出します。
^p
元関数シグネチャ: int GetKeyInputNumber(int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetKeyInputNumber 項を参照。

%index
dx_SetKeyInputCursorPosition
DxLib SetKeyInputCursorPosition (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int Position
p2 : int InputHandle
%inst
DxLib の SetKeyInputCursorPosition() を呼び出します。
^p
元関数シグネチャ: int SetKeyInputCursorPosition(int Position, int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetKeyInputCursorPosition 項を参照。

%index
dx_GetKeyInputCursorPosition
DxLib GetKeyInputCursorPosition (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputHandle
%inst
DxLib の GetKeyInputCursorPosition() を呼び出します。
^p
元関数シグネチャ: int GetKeyInputCursorPosition(int InputHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetKeyInputCursorPosition 項を参照。

%index
dx_FileRead_open
DxLib FileRead_open (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FilePath
p2 : int ASync (default FALSE)
%inst
DxLib の FileRead_open() を呼び出します。
^p
元関数シグネチャ: int FileRead_open(const TCHAR * FilePath, int ASync)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FileRead_open 項を参照。

%index
dx_FileRead_close
DxLib FileRead_close (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int FileHandle
%inst
DxLib の FileRead_close() を呼び出します。
^p
元関数シグネチャ: int FileRead_close(int FileHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FileRead_close 項を参照。

%index
dx_FileRead_seek
DxLib FileRead_seek (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int FileHandle
p2 : int64 Offset
p3 : int Origin
%inst
DxLib の FileRead_seek() を呼び出します。
^p
元関数シグネチャ: int FileRead_seek(int FileHandle, LONGLONG Offset, int Origin)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FileRead_seek 項を参照。

%index
dx_FileRead_idle_chk
DxLib FileRead_idle_chk (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int FileHandle
%inst
DxLib の FileRead_idle_chk() を呼び出します。
^p
元関数シグネチャ: int FileRead_idle_chk(int FileHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FileRead_idle_chk 項を参照。

%index
dx_FileRead_eof
DxLib FileRead_eof (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int FileHandle
%inst
DxLib の FileRead_eof() を呼び出します。
^p
元関数シグネチャ: int FileRead_eof(int FileHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FileRead_eof 項を参照。

%index
dx_FileRead_gets
DxLib FileRead_gets (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str Buffer
p2 : int BufferSize
p3 : int FileHandle
%inst
DxLib の FileRead_gets() を呼び出します。
^p
元関数シグネチャ: int FileRead_gets(const TCHAR * Buffer, int BufferSize, int FileHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FileRead_gets 項を参照。

%index
dx_FileRead_fullyLoad
DxLib FileRead_fullyLoad (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FilePath
%inst
DxLib の FileRead_fullyLoad() を呼び出します。
^p
元関数シグネチャ: int FileRead_fullyLoad(const TCHAR * FilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FileRead_fullyLoad 項を参照。

%index
dx_FileRead_fullyLoad_delete
DxLib FileRead_fullyLoad_delete (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int FLoadHandle
%inst
DxLib の FileRead_fullyLoad_delete() を呼び出します。
^p
元関数シグネチャ: int FileRead_fullyLoad_delete(int FLoadHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FileRead_fullyLoad_delete 項を参照。

%index
dx_GetStreamFunctionDefault
DxLib GetStreamFunctionDefault (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetStreamFunctionDefault() を呼び出します。
^p
元関数シグネチャ: int GetStreamFunctionDefault(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetStreamFunctionDefault 項を参照。

%index
dx_ConvertFullPath
DxLib ConvertFullPath (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str Src
p2 : str Dest
p3 : str CurrentDir (default NULL)
%inst
DxLib の ConvertFullPath() を呼び出します。
^p
元関数シグネチャ: int ConvertFullPath(const TCHAR * Src, const TCHAR * Dest, const TCHAR * CurrentDir)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ConvertFullPath 項を参照。

%index
dx_CheckHitKeyAll
DxLib CheckHitKeyAll (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int CheckType (default DX_CHECKINPUT_ALL)
%inst
DxLib の CheckHitKeyAll() を呼び出します。
^p
元関数シグネチャ: int CheckHitKeyAll(int CheckType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckHitKeyAll 項を参照。

%index
dx_GetJoypadNum
DxLib GetJoypadNum (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の GetJoypadNum() を呼び出します。
^p
元関数シグネチャ: int GetJoypadNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetJoypadNum 項を参照。

%index
dx_GetJoypadButtonNum
DxLib GetJoypadButtonNum (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputType
%inst
DxLib の GetJoypadButtonNum() を呼び出します。
^p
元関数シグネチャ: int GetJoypadButtonNum(int InputType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetJoypadButtonNum 項を参照。

%index
dx_CheckJoypadXInput
DxLib CheckJoypadXInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputType
%inst
DxLib の CheckJoypadXInput() を呼び出します。
^p
元関数シグネチャ: int CheckJoypadXInput(int InputType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckJoypadXInput 項を参照。

%index
dx_GetJoypadType
DxLib GetJoypadType (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputType
%inst
DxLib の GetJoypadType() を呼び出します。
^p
元関数シグネチャ: int GetJoypadType(int InputType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetJoypadType 項を参照。

%index
dx_SetJoypadInputToKeyInput
DxLib SetJoypadInputToKeyInput (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputType
p2 : int PadInput
p3 : int KeyInput1
p4 : int KeyInput2 (default -1)
p5 : int KeyInput3 (default -1)
p6 : int KeyInput4 (default -1)
%inst
DxLib の SetJoypadInputToKeyInput() を呼び出します。
^p
元関数シグネチャ: int SetJoypadInputToKeyInput(int InputType, int PadInput, int KeyInput1, int KeyInput2, int KeyInput3, int KeyInput4)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetJoypadInputToKeyInput 項を参照。

%index
dx_SetJoypadDeadZone
DxLib SetJoypadDeadZone (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputType
p2 : double Zone
%inst
DxLib の SetJoypadDeadZone() を呼び出します。
^p
元関数シグネチャ: int SetJoypadDeadZone(int InputType, double Zone)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetJoypadDeadZone 項を参照。

%index
dx_SetJoypadDefaultDeadZoneAll
DxLib SetJoypadDefaultDeadZoneAll (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : double Zone
%inst
DxLib の SetJoypadDefaultDeadZoneAll() を呼び出します。
^p
元関数シグネチャ: int SetJoypadDefaultDeadZoneAll(double Zone)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetJoypadDefaultDeadZoneAll 項を参照。

%index
dx_StartJoypadVibration
DxLib StartJoypadVibration (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputType
p2 : int Power
p3 : int Time
p4 : int EffectIndex (default -1)
%inst
DxLib の StartJoypadVibration() を呼び出します。
^p
元関数シグネチャ: int StartJoypadVibration(int InputType, int Power, int Time, int EffectIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StartJoypadVibration 項を参照。

%index
dx_StopJoypadVibration
DxLib StopJoypadVibration (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputType
p2 : int EffectIndex (default -1)
%inst
DxLib の StopJoypadVibration() を呼び出します。
^p
元関数シグネチャ: int StopJoypadVibration(int InputType, int EffectIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopJoypadVibration 項を参照。

%index
dx_GetJoypadPOVState
DxLib GetJoypadPOVState (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int InputType
p2 : int POVNumber
%inst
DxLib の GetJoypadPOVState() を呼び出します。
^p
元関数シグネチャ: int GetJoypadPOVState(int InputType, int POVNumber)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetJoypadPOVState 項を参照。

%index
dx_ReSetupJoypad
DxLib ReSetupJoypad (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
(引数なし)
%inst
DxLib の ReSetupJoypad() を呼び出します。
^p
元関数シグネチャ: int ReSetupJoypad(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReSetupJoypad 項を参照。

%index
dx_ReSetupInputSystem
DxLib ReSetupInputSystem (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の ReSetupInputSystem() を呼び出します。
^p
元関数シグネチャ: int ReSetupInputSystem(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReSetupInputSystem 項を参照。

%index
dx_SetUseJoypadVibrationFlag
DxLib SetUseJoypadVibrationFlag (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : int Flag
%inst
DxLib の SetUseJoypadVibrationFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseJoypadVibrationFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseJoypadVibrationFlag 項を参照。

%index
dx_MakeGraph
DxLib MakeGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int SizeX
p2 : int SizeY
p3 : int NotUse3DFlag (default FALSE)
%inst
DxLib の MakeGraph() を呼び出します。
^p
元関数シグネチャ: int MakeGraph(int SizeX, int SizeY, int NotUse3DFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeGraph 項を参照。

%index
dx_DerivationGraph
DxLib DerivationGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int SrcX
p2 : int SrcY
p3 : int Width
p4 : int Height
p5 : int SrcGraphHandle
%inst
DxLib の DerivationGraph() を呼び出します。
^p
元関数シグネチャ: int DerivationGraph(int SrcX, int SrcY, int Width, int Height, int SrcGraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DerivationGraph 項を参照。

%index
dx_DerivationGraphF
DxLib DerivationGraphF (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : double (float 縮小) SrcX
p2 : double (float 縮小) SrcY
p3 : double (float 縮小) Width
p4 : double (float 縮小) Height
p5 : int SrcGraphHandle
%inst
DxLib の DerivationGraphF() を呼び出します。
^p
元関数シグネチャ: int DerivationGraphF(float SrcX, float SrcY, float Width, float Height, int SrcGraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DerivationGraphF 項を参照。

%index
dx_DeleteSharingGraph
DxLib DeleteSharingGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int GrHandle
%inst
DxLib の DeleteSharingGraph() を呼び出します。
^p
元関数シグネチャ: int DeleteSharingGraph(int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteSharingGraph 項を参照。

%index
dx_GetGraphNum
DxLib GetGraphNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetGraphNum() を呼び出します。
^p
元関数シグネチャ: int GetGraphNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetGraphNum 項を参照。

%index
dx_FillGraph
DxLib FillGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int GrHandle
p2 : int Red
p3 : int Green
p4 : int Blue
p5 : int Alpha (default 255)
%inst
DxLib の FillGraph() を呼び出します。
^p
元関数シグネチャ: int FillGraph(int GrHandle, int Red, int Green, int Blue, int Alpha)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FillGraph 項を参照。

%index
dx_FillRectGraph
DxLib FillRectGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int GrHandle
p2 : int x
p3 : int y
p4 : int Width
p5 : int Height
p6 : int Red
p7 : int Green
p8 : int Blue
p9 : int Alpha (default 255)
%inst
DxLib の FillRectGraph() を呼び出します。
^p
元関数シグネチャ: int FillRectGraph(int GrHandle, int x, int y, int Width, int Height, int Red, int Green, int Blue, int Alpha)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FillRectGraph 項を参照。

%index
dx_InitGraph
DxLib InitGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
(引数なし)
%inst
DxLib の InitGraph() を呼び出します。
^p
元関数シグネチャ: int InitGraph(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitGraph 項を参照。

%index
dx_ReloadFileGraphAll
DxLib ReloadFileGraphAll (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
(引数なし)
%inst
DxLib の ReloadFileGraphAll() を呼び出します。
^p
元関数シグネチャ: int ReloadFileGraphAll(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReloadFileGraphAll 項を参照。

%index
dx_MakeShadowMap
DxLib MakeShadowMap (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeShadowMap() を呼び出します。
^p
元関数シグネチャ: int MakeShadowMap(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeShadowMap 項を参照。

%index
dx_DeleteShadowMap
DxLib DeleteShadowMap (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SmHandle
%inst
DxLib の DeleteShadowMap() を呼び出します。
^p
元関数シグネチャ: int DeleteShadowMap(int SmHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteShadowMap 項を参照。

%index
dx_SetShadowMapLightDirection
DxLib SetShadowMapLightDirection (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int SmHandle
p2 : var (VECTOR: #defstruct float x,y,z) Direction
%inst
DxLib の SetShadowMapLightDirection() を呼び出します。
^p
元関数シグネチャ: int SetShadowMapLightDirection(int SmHandle, VECTOR Direction)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetShadowMapLightDirection 項を参照。

%index
dx_ShadowMap_DrawSetup
DxLib ShadowMap_DrawSetup (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SmHandle
%inst
DxLib の ShadowMap_DrawSetup() を呼び出します。
^p
元関数シグネチャ: int ShadowMap_DrawSetup(int SmHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ShadowMap_DrawSetup 項を参照。

%index
dx_ShadowMap_DrawEnd
DxLib ShadowMap_DrawEnd (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の ShadowMap_DrawEnd() を呼び出します。
^p
元関数シグネチャ: int ShadowMap_DrawEnd(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ShadowMap_DrawEnd 項を参照。

%index
dx_SetUseShadowMap
DxLib SetUseShadowMap (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int SmSlotIndex
p2 : int SmHandle
%inst
DxLib の SetUseShadowMap() を呼び出します。
^p
元関数シグネチャ: int SetUseShadowMap(int SmSlotIndex, int SmHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseShadowMap 項を参照。

%index
dx_SetShadowMapDrawArea
DxLib SetShadowMapDrawArea (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int SmHandle
p2 : var (VECTOR: #defstruct float x,y,z) MinPosition
p3 : var (VECTOR: #defstruct float x,y,z) MaxPosition
%inst
DxLib の SetShadowMapDrawArea() を呼び出します。
^p
元関数シグネチャ: int SetShadowMapDrawArea(int SmHandle, VECTOR MinPosition, VECTOR MaxPosition)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetShadowMapDrawArea 項を参照。

%index
dx_ResetShadowMapDrawArea
DxLib ResetShadowMapDrawArea (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SmHandle
%inst
DxLib の ResetShadowMapDrawArea() を呼び出します。
^p
元関数シグネチャ: int ResetShadowMapDrawArea(int SmHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetShadowMapDrawArea 項を参照。

%index
dx_SetShadowMapAdjustDepth
DxLib SetShadowMapAdjustDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int SmHandle
p2 : double (float 縮小) Depth
%inst
DxLib の SetShadowMapAdjustDepth() を呼び出します。
^p
元関数シグネチャ: int SetShadowMapAdjustDepth(int SmHandle, float Depth)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetShadowMapAdjustDepth 項を参照。

%index
dx_TestDrawShadowMap
DxLib TestDrawShadowMap (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SmHandle
p2 : int x1
p3 : int y1
p4 : int x2
p5 : int y2
%inst
DxLib の TestDrawShadowMap() を呼び出します。
^p
元関数シグネチャ: int TestDrawShadowMap(int SmHandle, int x1, int y1, int x2, int y2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の TestDrawShadowMap 項を参照。

%index
dx_LoadBmpToGraph
DxLib LoadBmpToGraph (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FileName
p2 : int TextureFlag
p3 : int ReverseFlag
p4 : int SurfaceMode (default DX_MOVIESURFACE_NORMAL)
%inst
DxLib の LoadBmpToGraph() を呼び出します。
^p
元関数シグネチャ: int LoadBmpToGraph(const TCHAR * FileName, int TextureFlag, int ReverseFlag, int SurfaceMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadBmpToGraph 項を参照。

%index
dx_LoadReverseGraph
DxLib LoadReverseGraph (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FileName
p2 : int NotUse3DFlag (default FALSE)
%inst
DxLib の LoadReverseGraph() を呼び出します。
^p
元関数シグネチャ: int LoadReverseGraph(const TCHAR * FileName, int NotUse3DFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadReverseGraph 項を参照。

%index
dx_LoadBlendGraph
DxLib LoadBlendGraph (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FileName
%inst
DxLib の LoadBlendGraph() を呼び出します。
^p
元関数シグネチャ: int LoadBlendGraph(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadBlendGraph 項を参照。

%index
dx_CreateBlendGraphFromSoftImage
DxLib CreateBlendGraphFromSoftImage (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int SIHandle
%inst
DxLib の CreateBlendGraphFromSoftImage() を呼び出します。
^p
元関数シグネチャ: int CreateBlendGraphFromSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CreateBlendGraphFromSoftImage 項を参照。

%index
dx_CreateGraphFromSoftImage
DxLib CreateGraphFromSoftImage (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int SIHandle
%inst
DxLib の CreateGraphFromSoftImage() を呼び出します。
^p
元関数シグネチャ: int CreateGraphFromSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CreateGraphFromSoftImage 項を参照。

%index
dx_CreateGraphFromRectSoftImage
DxLib CreateGraphFromRectSoftImage (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int SIHandle
p2 : int x
p3 : int y
p4 : int SizeX
p5 : int SizeY
%inst
DxLib の CreateGraphFromRectSoftImage() を呼び出します。
^p
元関数シグネチャ: int CreateGraphFromRectSoftImage(int SIHandle, int x, int y, int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CreateGraphFromRectSoftImage 項を参照。

%index
dx_ReCreateGraphFromSoftImage
DxLib ReCreateGraphFromSoftImage (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int SIHandle
p2 : int GrHandle
%inst
DxLib の ReCreateGraphFromSoftImage() を呼び出します。
^p
元関数シグネチャ: int ReCreateGraphFromSoftImage(int SIHandle, int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReCreateGraphFromSoftImage 項を参照。

%index
dx_ReCreateGraphFromRectSoftImage
DxLib ReCreateGraphFromRectSoftImage (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int SIHandle
p2 : int x
p3 : int y
p4 : int SizeX
p5 : int SizeY
p6 : int GrHandle
%inst
DxLib の ReCreateGraphFromRectSoftImage() を呼び出します。
^p
元関数シグネチャ: int ReCreateGraphFromRectSoftImage(int SIHandle, int x, int y, int SizeX, int SizeY, int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReCreateGraphFromRectSoftImage 項を参照。

%index
dx_ReloadGraph
DxLib ReloadGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : str FileName
p2 : int GrHandle
p3 : int ReverseFlag (default FALSE)
%inst
DxLib の ReloadGraph() を呼び出します。
^p
元関数シグネチャ: int ReloadGraph(const TCHAR * FileName, int GrHandle, int ReverseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReloadGraph 項を参照。

%index
dx_ReloadReverseGraph
DxLib ReloadReverseGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : str FileName
p2 : int GrHandle
%inst
DxLib の ReloadReverseGraph() を呼び出します。
^p
元関数シグネチャ: int ReloadReverseGraph(const TCHAR * FileName, int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReloadReverseGraph 項を参照。

%index
dx_SetGraphColorBitDepth
DxLib SetGraphColorBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ColorBitDepth
%inst
DxLib の SetGraphColorBitDepth() を呼び出します。
^p
元関数シグネチャ: int SetGraphColorBitDepth(int ColorBitDepth)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetGraphColorBitDepth 項を参照。

%index
dx_GetGraphColorBitDepth
DxLib GetGraphColorBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetGraphColorBitDepth() を呼び出します。
^p
元関数シグネチャ: int GetGraphColorBitDepth(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetGraphColorBitDepth 項を参照。

%index
dx_SetCreateGraphColorBitDepth
DxLib SetCreateGraphColorBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int BitDepth
%inst
DxLib の SetCreateGraphColorBitDepth() を呼び出します。
^p
元関数シグネチャ: int SetCreateGraphColorBitDepth(int BitDepth)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateGraphColorBitDepth 項を参照。

%index
dx_GetCreateGraphColorBitDepth
DxLib GetCreateGraphColorBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetCreateGraphColorBitDepth() を呼び出します。
^p
元関数シグネチャ: int GetCreateGraphColorBitDepth(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateGraphColorBitDepth 項を参照。

%index
dx_SetCreateGraphChannelBitDepth
DxLib SetCreateGraphChannelBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int BitDepth
%inst
DxLib の SetCreateGraphChannelBitDepth() を呼び出します。
^p
元関数シグネチャ: int SetCreateGraphChannelBitDepth(int BitDepth)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateGraphChannelBitDepth 項を参照。

%index
dx_GetCreateGraphChannelBitDepth
DxLib GetCreateGraphChannelBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetCreateGraphChannelBitDepth() を呼び出します。
^p
元関数シグネチャ: int GetCreateGraphChannelBitDepth(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateGraphChannelBitDepth 項を参照。

%index
dx_SetCreateGraphInitGraphDelete
DxLib SetCreateGraphInitGraphDelete (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetCreateGraphInitGraphDelete() を呼び出します。
^p
元関数シグネチャ: int SetCreateGraphInitGraphDelete(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateGraphInitGraphDelete 項を参照。

%index
dx_GetCreateGraphInitGraphDelete
DxLib GetCreateGraphInitGraphDelete (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetCreateGraphInitGraphDelete() を呼び出します。
^p
元関数シグネチャ: int GetCreateGraphInitGraphDelete(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateGraphInitGraphDelete 項を参照。

%index
dx_SetCreateGraphHandle
DxLib SetCreateGraphHandle (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int GrHandle
%inst
DxLib の SetCreateGraphHandle() を呼び出します。
^p
元関数シグネチャ: int SetCreateGraphHandle(int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateGraphHandle 項を参照。

%index
dx_GetCreateGraphHandle
DxLib GetCreateGraphHandle (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetCreateGraphHandle() を呼び出します。
^p
元関数シグネチャ: int GetCreateGraphHandle(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateGraphHandle 項を参照。

%index
dx_SetDrawValidGraphCreateFlag
DxLib SetDrawValidGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetDrawValidGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetDrawValidGraphCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawValidGraphCreateFlag 項を参照。

%index
dx_GetDrawValidGraphCreateFlag
DxLib GetDrawValidGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDrawValidGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int GetDrawValidGraphCreateFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawValidGraphCreateFlag 項を参照。

%index
dx_SetDrawValidFlagOf3DGraph
DxLib SetDrawValidFlagOf3DGraph (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetDrawValidFlagOf3DGraph() を呼び出します。
^p
元関数シグネチャ: int SetDrawValidFlagOf3DGraph(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawValidFlagOf3DGraph 項を参照。

%index
dx_SetLeftUpColorIsTransColorFlag
DxLib SetLeftUpColorIsTransColorFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetLeftUpColorIsTransColorFlag() を呼び出します。
^p
元関数シグネチャ: int SetLeftUpColorIsTransColorFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLeftUpColorIsTransColorFlag 項を参照。

%index
dx_SetUsePaletteGraphFlag
DxLib SetUsePaletteGraphFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUsePaletteGraphFlag() を呼び出します。
^p
元関数シグネチャ: int SetUsePaletteGraphFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUsePaletteGraphFlag 項を参照。

%index
dx_SetUseBlendGraphCreateFlag
DxLib SetUseBlendGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseBlendGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseBlendGraphCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseBlendGraphCreateFlag 項を参照。

%index
dx_GetUseBlendGraphCreateFlag
DxLib GetUseBlendGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseBlendGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseBlendGraphCreateFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseBlendGraphCreateFlag 項を参照。

%index
dx_SetUseAlphaTestGraphCreateFlag
DxLib SetUseAlphaTestGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseAlphaTestGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseAlphaTestGraphCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseAlphaTestGraphCreateFlag 項を参照。

%index
dx_GetUseAlphaTestGraphCreateFlag
DxLib GetUseAlphaTestGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseAlphaTestGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseAlphaTestGraphCreateFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseAlphaTestGraphCreateFlag 項を参照。

%index
dx_SetUseAlphaTestFlag
DxLib SetUseAlphaTestFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseAlphaTestFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseAlphaTestFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseAlphaTestFlag 項を参照。

%index
dx_GetUseAlphaTestFlag
DxLib GetUseAlphaTestFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseAlphaTestFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseAlphaTestFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseAlphaTestFlag 項を参照。

%index
dx_SetCubeMapTextureCreateFlag
DxLib SetCubeMapTextureCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetCubeMapTextureCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetCubeMapTextureCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCubeMapTextureCreateFlag 項を参照。

%index
dx_GetCubeMapTextureCreateFlag
DxLib GetCubeMapTextureCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetCubeMapTextureCreateFlag() を呼び出します。
^p
元関数シグネチャ: int GetCubeMapTextureCreateFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCubeMapTextureCreateFlag 項を参照。

%index
dx_SetUseNoBlendModeParam
DxLib SetUseNoBlendModeParam (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseNoBlendModeParam() を呼び出します。
^p
元関数シグネチャ: int SetUseNoBlendModeParam(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseNoBlendModeParam 項を参照。

%index
dx_SetDrawValidAlphaChannelGraphCreateFlag
DxLib SetDrawValidAlphaChannelGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetDrawValidAlphaChannelGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetDrawValidAlphaChannelGraphCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawValidAlphaChannelGraphCreateFlag 項を参照。

%index
dx_GetDrawValidAlphaChannelGraphCreateFlag
DxLib GetDrawValidAlphaChannelGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDrawValidAlphaChannelGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int GetDrawValidAlphaChannelGraphCreateFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawValidAlphaChannelGraphCreateFlag 項を参照。

%index
dx_SetDrawValidFloatTypeGraphCreateFlag
DxLib SetDrawValidFloatTypeGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetDrawValidFloatTypeGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetDrawValidFloatTypeGraphCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawValidFloatTypeGraphCreateFlag 項を参照。

%index
dx_GetDrawValidFloatTypeGraphCreateFlag
DxLib GetDrawValidFloatTypeGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDrawValidFloatTypeGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int GetDrawValidFloatTypeGraphCreateFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawValidFloatTypeGraphCreateFlag 項を参照。

%index
dx_SetDrawValidGraphCreateZBufferFlag
DxLib SetDrawValidGraphCreateZBufferFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetDrawValidGraphCreateZBufferFlag() を呼び出します。
^p
元関数シグネチャ: int SetDrawValidGraphCreateZBufferFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawValidGraphCreateZBufferFlag 項を参照。

%index
dx_GetDrawValidGraphCreateZBufferFlag
DxLib GetDrawValidGraphCreateZBufferFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDrawValidGraphCreateZBufferFlag() を呼び出します。
^p
元関数シグネチャ: int GetDrawValidGraphCreateZBufferFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawValidGraphCreateZBufferFlag 項を参照。

%index
dx_SetCreateDrawValidGraphZBufferBitDepth
DxLib SetCreateDrawValidGraphZBufferBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int BitDepth
%inst
DxLib の SetCreateDrawValidGraphZBufferBitDepth() を呼び出します。
^p
元関数シグネチャ: int SetCreateDrawValidGraphZBufferBitDepth(int BitDepth)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateDrawValidGraphZBufferBitDepth 項を参照。

%index
dx_GetCreateDrawValidGraphZBufferBitDepth
DxLib GetCreateDrawValidGraphZBufferBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetCreateDrawValidGraphZBufferBitDepth() を呼び出します。
^p
元関数シグネチャ: int GetCreateDrawValidGraphZBufferBitDepth(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateDrawValidGraphZBufferBitDepth 項を参照。

%index
dx_SetCreateDrawValidGraphMipLevels
DxLib SetCreateDrawValidGraphMipLevels (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int MipLevels
%inst
DxLib の SetCreateDrawValidGraphMipLevels() を呼び出します。
^p
元関数シグネチャ: int SetCreateDrawValidGraphMipLevels(int MipLevels)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateDrawValidGraphMipLevels 項を参照。

%index
dx_GetCreateDrawValidGraphMipLevels
DxLib GetCreateDrawValidGraphMipLevels (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetCreateDrawValidGraphMipLevels() を呼び出します。
^p
元関数シグネチャ: int GetCreateDrawValidGraphMipLevels(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateDrawValidGraphMipLevels 項を参照。

%index
dx_SetCreateDrawValidGraphChannelNum
DxLib SetCreateDrawValidGraphChannelNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ChannelNum
%inst
DxLib の SetCreateDrawValidGraphChannelNum() を呼び出します。
^p
元関数シグネチャ: int SetCreateDrawValidGraphChannelNum(int ChannelNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateDrawValidGraphChannelNum 項を参照。

%index
dx_GetCreateDrawValidGraphChannelNum
DxLib GetCreateDrawValidGraphChannelNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetCreateDrawValidGraphChannelNum() を呼び出します。
^p
元関数シグネチャ: int GetCreateDrawValidGraphChannelNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateDrawValidGraphChannelNum 項を参照。

%index
dx_SetCreateDrawValidGraphMultiSample
DxLib SetCreateDrawValidGraphMultiSample (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Samples
p2 : int Quality
%inst
DxLib の SetCreateDrawValidGraphMultiSample() を呼び出します。
^p
元関数シグネチャ: int SetCreateDrawValidGraphMultiSample(int Samples, int Quality)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateDrawValidGraphMultiSample 項を参照。

%index
dx_SetDrawValidMultiSample
DxLib SetDrawValidMultiSample (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Samples
p2 : int Quality
%inst
DxLib の SetDrawValidMultiSample() を呼び出します。
^p
元関数シグネチャ: int SetDrawValidMultiSample(int Samples, int Quality)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawValidMultiSample 項を参照。

%index
dx_GetMultiSampleQuality
DxLib GetMultiSampleQuality (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Samples
%inst
DxLib の GetMultiSampleQuality() を呼び出します。
^p
元関数シグネチャ: int GetMultiSampleQuality(int Samples)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMultiSampleQuality 項を参照。

%index
dx_SetUseTransColor
DxLib SetUseTransColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseTransColor() を呼び出します。
^p
元関数シグネチャ: int SetUseTransColor(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseTransColor 項を参照。

%index
dx_SetUseTransColorGraphCreateFlag
DxLib SetUseTransColorGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseTransColorGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseTransColorGraphCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseTransColorGraphCreateFlag 項を参照。

%index
dx_SetUseGraphAlphaChannel
DxLib SetUseGraphAlphaChannel (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseGraphAlphaChannel() を呼び出します。
^p
元関数シグネチャ: int SetUseGraphAlphaChannel(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseGraphAlphaChannel 項を参照。

%index
dx_GetUseGraphAlphaChannel
DxLib GetUseGraphAlphaChannel (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseGraphAlphaChannel() を呼び出します。
^p
元関数シグネチャ: int GetUseGraphAlphaChannel(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseGraphAlphaChannel 項を参照。

%index
dx_SetUseAlphaChannelGraphCreateFlag
DxLib SetUseAlphaChannelGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseAlphaChannelGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseAlphaChannelGraphCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseAlphaChannelGraphCreateFlag 項を参照。

%index
dx_GetUseAlphaChannelGraphCreateFlag
DxLib GetUseAlphaChannelGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseAlphaChannelGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseAlphaChannelGraphCreateFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseAlphaChannelGraphCreateFlag 項を参照。

%index
dx_SetUseNotManageTextureFlag
DxLib SetUseNotManageTextureFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseNotManageTextureFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseNotManageTextureFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseNotManageTextureFlag 項を参照。

%index
dx_GetUseNotManageTextureFlag
DxLib GetUseNotManageTextureFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseNotManageTextureFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseNotManageTextureFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseNotManageTextureFlag 項を参照。

%index
dx_SetUsePlatformTextureFormat
DxLib SetUsePlatformTextureFormat (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int PlatformTextureFormat
%inst
DxLib の SetUsePlatformTextureFormat() を呼び出します。
^p
元関数シグネチャ: int SetUsePlatformTextureFormat(int PlatformTextureFormat)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUsePlatformTextureFormat 項を参照。

%index
dx_GetUsePlatformTextureFormat
DxLib GetUsePlatformTextureFormat (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUsePlatformTextureFormat() を呼び出します。
^p
元関数シグネチャ: int GetUsePlatformTextureFormat(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUsePlatformTextureFormat 項を参照。

%index
dx_SetTransColor
DxLib SetTransColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Red
p2 : int Green
p3 : int Blue
%inst
DxLib の SetTransColor() を呼び出します。
^p
元関数シグネチャ: int SetTransColor(int Red, int Green, int Blue)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetTransColor 項を参照。

%index
dx_SetUseDivGraphFlag
DxLib SetUseDivGraphFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseDivGraphFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseDivGraphFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseDivGraphFlag 項を参照。

%index
dx_SetUseAlphaImageLoadFlag
DxLib SetUseAlphaImageLoadFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseAlphaImageLoadFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseAlphaImageLoadFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseAlphaImageLoadFlag 項を参照。

%index
dx_SetUseMaxTextureSize
DxLib SetUseMaxTextureSize (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Size
%inst
DxLib の SetUseMaxTextureSize() を呼び出します。
^p
元関数シグネチャ: int SetUseMaxTextureSize(int Size)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseMaxTextureSize 項を参照。

%index
dx_SetUseGraphBaseDataBackup
DxLib SetUseGraphBaseDataBackup (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseGraphBaseDataBackup() を呼び出します。
^p
元関数シグネチャ: int SetUseGraphBaseDataBackup(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseGraphBaseDataBackup 項を参照。

%index
dx_GetUseGraphBaseDataBackup
DxLib GetUseGraphBaseDataBackup (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseGraphBaseDataBackup() を呼び出します。
^p
元関数シグネチャ: int GetUseGraphBaseDataBackup(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseGraphBaseDataBackup 項を参照。

%index
dx_SetUseSystemMemGraphCreateFlag
DxLib SetUseSystemMemGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseSystemMemGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseSystemMemGraphCreateFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseSystemMemGraphCreateFlag 項を参照。

%index
dx_GetUseSystemMemGraphCreateFlag
DxLib GetUseSystemMemGraphCreateFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseSystemMemGraphCreateFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseSystemMemGraphCreateFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseSystemMemGraphCreateFlag 項を参照。

%index
dx_SetUseLoadDivGraphSizeCheckFlag
DxLib SetUseLoadDivGraphSizeCheckFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseLoadDivGraphSizeCheckFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseLoadDivGraphSizeCheckFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseLoadDivGraphSizeCheckFlag 項を参照。

%index
dx_GetUseLoadDivGraphSizeCheckFlag
DxLib GetUseLoadDivGraphSizeCheckFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseLoadDivGraphSizeCheckFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseLoadDivGraphSizeCheckFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseLoadDivGraphSizeCheckFlag 項を参照。

%index
dx_GraphUnLock
DxLib GraphUnLock (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int GrHandle
%inst
DxLib の GraphUnLock() を呼び出します。
^p
元関数シグネチャ: int GraphUnLock(int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GraphUnLock 項を参照。

%index
dx_SetUseGraphZBuffer
DxLib SetUseGraphZBuffer (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int GrHandle
p2 : int UseFlag
p3 : int BitDepth (default -1)
%inst
DxLib の SetUseGraphZBuffer() を呼び出します。
^p
元関数シグネチャ: int SetUseGraphZBuffer(int GrHandle, int UseFlag, int BitDepth)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseGraphZBuffer 項を参照。

%index
dx_CopyGraphZBufferImage
DxLib CopyGraphZBufferImage (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int DestGrHandle
p2 : int SrcGrHandle
%inst
DxLib の CopyGraphZBufferImage() を呼び出します。
^p
元関数シグネチャ: int CopyGraphZBufferImage(int DestGrHandle, int SrcGrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CopyGraphZBufferImage 項を参照。

%index
dx_SetDeviceLostDeleteGraphFlag
DxLib SetDeviceLostDeleteGraphFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int GrHandle
p2 : int DeleteFlag
%inst
DxLib の SetDeviceLostDeleteGraphFlag() を呼び出します。
^p
元関数シグネチャ: int SetDeviceLostDeleteGraphFlag(int GrHandle, int DeleteFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDeviceLostDeleteGraphFlag 項を参照。

%index
dx_GetGraphMipmapCount
DxLib GetGraphMipmapCount (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int GrHandle
%inst
DxLib の GetGraphMipmapCount() を呼び出します。
^p
元関数シグネチャ: int GetGraphMipmapCount(int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetGraphMipmapCount 項を参照。

%index
dx_GetGraphFilePath
DxLib GetGraphFilePath (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int GrHandle
p2 : str FilePathBuffer
%inst
DxLib の GetGraphFilePath() を呼び出します。
^p
元関数シグネチャ: int GetGraphFilePath(int GrHandle, const TCHAR * FilePathBuffer)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetGraphFilePath 項を参照。

%index
dx_CheckDrawValidGraph
DxLib CheckDrawValidGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int GrHandle
%inst
DxLib の CheckDrawValidGraph() を呼び出します。
^p
元関数シグネチャ: int CheckDrawValidGraph(int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckDrawValidGraph 項を参照。

%index
dx_GetValidRestoreShredPoint
DxLib GetValidRestoreShredPoint (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetValidRestoreShredPoint() を呼び出します。
^p
元関数シグネチャ: int GetValidRestoreShredPoint(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetValidRestoreShredPoint 項を参照。

%index
dx_SetGraphPalette
DxLib SetGraphPalette (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int GrHandle
p2 : int ColorIndex
p3 : int (uint 扱い) Color
%inst
DxLib の SetGraphPalette() を呼び出します。
^p
元関数シグネチャ: int SetGraphPalette(int GrHandle, int ColorIndex, unsigned int Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetGraphPalette 項を参照。

%index
dx_ResetGraphPalette
DxLib ResetGraphPalette (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int GrHandle
%inst
DxLib の ResetGraphPalette() を呼び出します。
^p
元関数シグネチャ: int ResetGraphPalette(int GrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetGraphPalette 項を参照。

%index
dx_DrawFillBox
DxLib DrawFillBox (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int (uint 扱い) Color
%inst
DxLib の DrawFillBox() を呼び出します。
^p
元関数シグネチャ: int DrawFillBox(int x1, int y1, int x2, int y2, unsigned int Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawFillBox 項を参照。

%index
dx_DrawLineBox
DxLib DrawLineBox (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int (uint 扱い) Color
p6 : int LineThickness (default 1)
%inst
DxLib の DrawLineBox() を呼び出します。
^p
元関数シグネチャ: int DrawLineBox(int x1, int y1, int x2, int y2, unsigned int Color, int LineThickness)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawLineBox 項を参照。

%index
dx_DrawOval
DxLib DrawOval (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int rx
p4 : int ry
p5 : int (uint 扱い) Color
p6 : int FillFlag
p7 : int LineThickness (default 1)
%inst
DxLib の DrawOval() を呼び出します。
^p
元関数シグネチャ: int DrawOval(int x, int y, int rx, int ry, unsigned int Color, int FillFlag, int LineThickness)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawOval 項を参照。

%index
dx_DrawOvalAA
DxLib DrawOvalAA (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double (float 縮小) rx
p4 : double (float 縮小) ry
p5 : int posnum
p6 : int (uint 扱い) Color
p7 : int FillFlag
p8 : double (float 縮小) LineThickness (default 1.0f)
%inst
DxLib の DrawOvalAA() を呼び出します。
^p
元関数シグネチャ: int DrawOvalAA(float x, float y, float rx, float ry, int posnum, unsigned int Color, int FillFlag, float LineThickness)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawOvalAA 項を参照。

%index
dx_DrawOval_Rect
DxLib DrawOval_Rect (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int (uint 扱い) Color
p6 : int FillFlag
%inst
DxLib の DrawOval_Rect() を呼び出します。
^p
元関数シグネチャ: int DrawOval_Rect(int x1, int y1, int x2, int y2, unsigned int Color, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawOval_Rect 項を参照。

%index
dx_DrawTriangleAA
DxLib DrawTriangleAA (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x1
p2 : double (float 縮小) y1
p3 : double (float 縮小) x2
p4 : double (float 縮小) y2
p5 : double (float 縮小) x3
p6 : double (float 縮小) y3
p7 : int (uint 扱い) Color
p8 : int FillFlag
p9 : double (float 縮小) LineThickness (default 1.0f)
%inst
DxLib の DrawTriangleAA() を呼び出します。
^p
元関数シグネチャ: int DrawTriangleAA(float x1, float y1, float x2, float y2, float x3, float y3, unsigned int Color, int FillFlag, float LineThickness)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawTriangleAA 項を参照。

%index
dx_DrawQuadrangle
DxLib DrawQuadrangle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int x3
p6 : int y3
p7 : int x4
p8 : int y4
p9 : int (uint 扱い) Color
p10 : int FillFlag
%inst
DxLib の DrawQuadrangle() を呼び出します。
^p
元関数シグネチャ: int DrawQuadrangle(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawQuadrangle 項を参照。

%index
dx_DrawQuadrangleAA
DxLib DrawQuadrangleAA (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x1
p2 : double (float 縮小) y1
p3 : double (float 縮小) x2
p4 : double (float 縮小) y2
p5 : double (float 縮小) x3
p6 : double (float 縮小) y3
p7 : double (float 縮小) x4
p8 : double (float 縮小) y4
p9 : int (uint 扱い) Color
p10 : int FillFlag
p11 : double (float 縮小) LineThickness (default 1.0f)
%inst
DxLib の DrawQuadrangleAA() を呼び出します。
^p
元関数シグネチャ: int DrawQuadrangleAA(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FillFlag, float LineThickness)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawQuadrangleAA 項を参照。

%index
dx_DrawRoundRect
DxLib DrawRoundRect (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int rx
p6 : int ry
p7 : int (uint 扱い) Color
p8 : int FillFlag
%inst
DxLib の DrawRoundRect() を呼び出します。
^p
元関数シグネチャ: int DrawRoundRect(int x1, int y1, int x2, int y2, int rx, int ry, unsigned int Color, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRoundRect 項を参照。

%index
dx_DrawRoundRectAA
DxLib DrawRoundRectAA (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x1
p2 : double (float 縮小) y1
p3 : double (float 縮小) x2
p4 : double (float 縮小) y2
p5 : double (float 縮小) rx
p6 : double (float 縮小) ry
p7 : int posnum
p8 : int (uint 扱い) Color
p9 : int FillFlag
p10 : double (float 縮小) LineThickness (default 1.0f)
%inst
DxLib の DrawRoundRectAA() を呼び出します。
^p
元関数シグネチャ: int DrawRoundRectAA(float x1, float y1, float x2, float y2, float rx, float ry, int posnum, unsigned int Color, int FillFlag, float LineThickness)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRoundRectAA 項を参照。

%index
dx_BeginAADraw
DxLib BeginAADraw (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の BeginAADraw() を呼び出します。
^p
元関数シグネチャ: int BeginAADraw(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の BeginAADraw 項を参照。

%index
dx_EndAADraw
DxLib EndAADraw (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の EndAADraw() を呼び出します。
^p
元関数シグネチャ: int EndAADraw(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の EndAADraw 項を参照。

%index
dx_DrawPixel3D
DxLib DrawPixel3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos
p2 : int (uint 扱い) Color
%inst
DxLib の DrawPixel3D() を呼び出します。
^p
元関数シグネチャ: int DrawPixel3D(VECTOR Pos, unsigned int Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPixel3D 項を参照。

%index
dx_DrawPixel3DD
DxLib DrawPixel3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Pos
p2 : int (uint 扱い) Color
%inst
DxLib の DrawPixel3DD() を呼び出します。
^p
元関数シグネチャ: int DrawPixel3DD(VECTOR_D Pos, unsigned int Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPixel3DD 項を参照。

%index
dx_DrawLine3D
DxLib DrawLine3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos1
p2 : var (VECTOR: #defstruct float x,y,z) Pos2
p3 : int (uint 扱い) Color
%inst
DxLib の DrawLine3D() を呼び出します。
^p
元関数シグネチャ: int DrawLine3D(VECTOR Pos1, VECTOR Pos2, unsigned int Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawLine3D 項を参照。

%index
dx_DrawLine3DD
DxLib DrawLine3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Pos2
p3 : int (uint 扱い) Color
%inst
DxLib の DrawLine3DD() を呼び出します。
^p
元関数シグネチャ: int DrawLine3DD(VECTOR_D Pos1, VECTOR_D Pos2, unsigned int Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawLine3DD 項を参照。

%index
dx_DrawTriangle3D
DxLib DrawTriangle3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos1
p2 : var (VECTOR: #defstruct float x,y,z) Pos2
p3 : var (VECTOR: #defstruct float x,y,z) Pos3
p4 : int (uint 扱い) Color
p5 : int FillFlag
%inst
DxLib の DrawTriangle3D() を呼び出します。
^p
元関数シグネチャ: int DrawTriangle3D(VECTOR Pos1, VECTOR Pos2, VECTOR Pos3, unsigned int Color, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawTriangle3D 項を参照。

%index
dx_DrawTriangle3DD
DxLib DrawTriangle3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Pos2
p3 : var (VECTOR_D: #defstruct double x,y,z) Pos3
p4 : int (uint 扱い) Color
p5 : int FillFlag
%inst
DxLib の DrawTriangle3DD() を呼び出します。
^p
元関数シグネチャ: int DrawTriangle3DD(VECTOR_D Pos1, VECTOR_D Pos2, VECTOR_D Pos3, unsigned int Color, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawTriangle3DD 項を参照。

%index
dx_DrawCube3DD
DxLib DrawCube3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Pos2
p3 : int (uint 扱い) DifColor
p4 : int (uint 扱い) SpcColor
p5 : int FillFlag
%inst
DxLib の DrawCube3DD() を呼び出します。
^p
元関数シグネチャ: int DrawCube3DD(VECTOR_D Pos1, VECTOR_D Pos2, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCube3DD 項を参照。

%index
dx_DrawSphere3DD
DxLib DrawSphere3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) CenterPos
p2 : double r
p3 : int DivNum
p4 : int (uint 扱い) DifColor
p5 : int (uint 扱い) SpcColor
p6 : int FillFlag
%inst
DxLib の DrawSphere3DD() を呼び出します。
^p
元関数シグネチャ: int DrawSphere3DD(VECTOR_D CenterPos, double r, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawSphere3DD 項を参照。

%index
dx_DrawCapsule3D
DxLib DrawCapsule3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos1
p2 : var (VECTOR: #defstruct float x,y,z) Pos2
p3 : double (float 縮小) r
p4 : int DivNum
p5 : int (uint 扱い) DifColor
p6 : int (uint 扱い) SpcColor
p7 : int FillFlag
%inst
DxLib の DrawCapsule3D() を呼び出します。
^p
元関数シグネチャ: int DrawCapsule3D(VECTOR Pos1, VECTOR Pos2, float r, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCapsule3D 項を参照。

%index
dx_DrawCapsule3DD
DxLib DrawCapsule3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Pos2
p3 : double r
p4 : int DivNum
p5 : int (uint 扱い) DifColor
p6 : int (uint 扱い) SpcColor
p7 : int FillFlag
%inst
DxLib の DrawCapsule3DD() を呼び出します。
^p
元関数シグネチャ: int DrawCapsule3DD(VECTOR_D Pos1, VECTOR_D Pos2, double r, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCapsule3DD 項を参照。

%index
dx_DrawCylinder3D
DxLib DrawCylinder3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos1
p2 : var (VECTOR: #defstruct float x,y,z) Pos2
p3 : double (float 縮小) r
p4 : int DivNum
p5 : int (uint 扱い) DifColor
p6 : int (uint 扱い) SpcColor
p7 : int FillFlag
%inst
DxLib の DrawCylinder3D() を呼び出します。
^p
元関数シグネチャ: int DrawCylinder3D(VECTOR Pos1, VECTOR Pos2, float r, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCylinder3D 項を参照。

%index
dx_DrawCylinder3DD
DxLib DrawCylinder3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Pos2
p3 : double r
p4 : int DivNum
p5 : int (uint 扱い) DifColor
p6 : int (uint 扱い) SpcColor
p7 : int FillFlag
%inst
DxLib の DrawCylinder3DD() を呼び出します。
^p
元関数シグネチャ: int DrawCylinder3DD(VECTOR_D Pos1, VECTOR_D Pos2, double r, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCylinder3DD 項を参照。

%index
dx_DrawTube3D
DxLib DrawTube3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos1
p2 : var (VECTOR: #defstruct float x,y,z) Pos2
p3 : double (float 縮小) r1
p4 : double (float 縮小) r2
p5 : int DivNum
p6 : int (uint 扱い) DifColor
p7 : int (uint 扱い) SpcColor
p8 : int FillFlag
%inst
DxLib の DrawTube3D() を呼び出します。
^p
元関数シグネチャ: int DrawTube3D(VECTOR Pos1, VECTOR Pos2, float r1, float r2, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawTube3D 項を参照。

%index
dx_DrawTube3DD
DxLib DrawTube3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Pos2
p3 : double r1
p4 : double r2
p5 : int DivNum
p6 : int (uint 扱い) DifColor
p7 : int (uint 扱い) SpcColor
p8 : int FillFlag
%inst
DxLib の DrawTube3DD() を呼び出します。
^p
元関数シグネチャ: int DrawTube3DD(VECTOR_D Pos1, VECTOR_D Pos2, double r1, double r2, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawTube3DD 項を参照。

%index
dx_DrawCone3D
DxLib DrawCone3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) TopPos
p2 : var (VECTOR: #defstruct float x,y,z) BottomPos
p3 : double (float 縮小) r
p4 : int DivNum
p5 : int (uint 扱い) DifColor
p6 : int (uint 扱い) SpcColor
p7 : int FillFlag
%inst
DxLib の DrawCone3D() を呼び出します。
^p
元関数シグネチャ: int DrawCone3D(VECTOR TopPos, VECTOR BottomPos, float r, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCone3D 項を参照。

%index
dx_DrawCone3DD
DxLib DrawCone3DD (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) TopPos
p2 : var (VECTOR_D: #defstruct double x,y,z) BottomPos
p3 : double r
p4 : int DivNum
p5 : int (uint 扱い) DifColor
p6 : int (uint 扱い) SpcColor
p7 : int FillFlag
%inst
DxLib の DrawCone3DD() を呼び出します。
^p
元関数シグネチャ: int DrawCone3DD(VECTOR_D TopPos, VECTOR_D BottomPos, double r, int DivNum, unsigned int DifColor, unsigned int SpcColor, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCone3DD 項を参照。

%index
dx_LoadGraphScreen
DxLib LoadGraphScreen (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int x
p2 : int y
p3 : str GraphName
p4 : int TransFlag
%inst
DxLib の LoadGraphScreen() を呼び出します。
^p
元関数シグネチャ: int LoadGraphScreen(int x, int y, const TCHAR * GraphName, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadGraphScreen 項を参照。

%index
dx_DrawRotaGraph2
DxLib DrawRotaGraph2 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int cx
p4 : int cy
p5 : double ExtRate
p6 : double Angle
p7 : int GrHandle
p8 : int TransFlag
p9 : int ReverseXFlag (default FALSE)
p10 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraph2() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraph2(int x, int y, int cx, int cy, double ExtRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraph2 項を参照。

%index
dx_DrawRotaGraph3
DxLib DrawRotaGraph3 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int cx
p4 : int cy
p5 : double ExtRateX
p6 : double ExtRateY
p7 : double Angle
p8 : int GrHandle
p9 : int TransFlag
p10 : int ReverseXFlag (default FALSE)
p11 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraph3() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraph3(int x, int y, int cx, int cy, double ExtRateX, double ExtRateY, double Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraph3 項を参照。

%index
dx_DrawRotaGraphFast
DxLib DrawRotaGraphFast (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double (float 縮小) ExRate
p4 : double (float 縮小) Angle
p5 : int GrHandle
p6 : int TransFlag
p7 : int ReverseXFlag (default FALSE)
p8 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraphFast() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraphFast(int x, int y, float ExRate, float Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraphFast 項を参照。

%index
dx_DrawRotaGraphFast2
DxLib DrawRotaGraphFast2 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int cx
p4 : int cy
p5 : double (float 縮小) ExtRate
p6 : double (float 縮小) Angle
p7 : int GrHandle
p8 : int TransFlag
p9 : int ReverseXFlag (default FALSE)
p10 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraphFast2() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraphFast2(int x, int y, int cx, int cy, float ExtRate, float Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraphFast2 項を参照。

%index
dx_DrawRotaGraphFast3
DxLib DrawRotaGraphFast3 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int cx
p4 : int cy
p5 : double (float 縮小) ExtRateX
p6 : double (float 縮小) ExtRateY
p7 : double (float 縮小) Angle
p8 : int GrHandle
p9 : int TransFlag
p10 : int ReverseXFlag (default FALSE)
p11 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraphFast3() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraphFast3(int x, int y, int cx, int cy, float ExtRateX, float ExtRateY, float Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraphFast3 項を参照。

%index
dx_DrawTurnGraph
DxLib DrawTurnGraph (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int GrHandle
p4 : int TransFlag
%inst
DxLib の DrawTurnGraph() を呼び出します。
^p
元関数シグネチャ: int DrawTurnGraph(int x, int y, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawTurnGraph 項を参照。

%index
dx_DrawReverseGraph
DxLib DrawReverseGraph (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int GrHandle
p4 : int TransFlag
p5 : int ReverseXFlag (default FALSE)
p6 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawReverseGraph() を呼び出します。
^p
元関数シグネチャ: int DrawReverseGraph(int x, int y, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawReverseGraph 項を参照。

%index
dx_DrawGraphF
DxLib DrawGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : int GrHandle
p4 : int TransFlag
%inst
DxLib の DrawGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawGraphF(float xf, float yf, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawGraphF 項を参照。

%index
dx_DrawExtendGraphF
DxLib DrawExtendGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x1f
p2 : double (float 縮小) y1f
p3 : double (float 縮小) x2f
p4 : double (float 縮小) y2f
p5 : int GrHandle
p6 : int TransFlag
%inst
DxLib の DrawExtendGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawExtendGraphF(float x1f, float y1f, float x2f, float y2f, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendGraphF 項を参照。

%index
dx_DrawRotaGraphF
DxLib DrawRotaGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : double ExRate
p4 : double Angle
p5 : int GrHandle
p6 : int TransFlag
p7 : int ReverseXFlag (default FALSE)
p8 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraphF(float xf, float yf, double ExRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraphF 項を参照。

%index
dx_DrawRotaGraph2F
DxLib DrawRotaGraph2F (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : double (float 縮小) cxf
p4 : double (float 縮小) cyf
p5 : double ExtRate
p6 : double Angle
p7 : int GrHandle
p8 : int TransFlag
p9 : int ReverseXFlag (default FALSE)
p10 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraph2F() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraph2F(float xf, float yf, float cxf, float cyf, double ExtRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraph2F 項を参照。

%index
dx_DrawRotaGraph3F
DxLib DrawRotaGraph3F (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : double (float 縮小) cxf
p4 : double (float 縮小) cyf
p5 : double ExtRateX
p6 : double ExtRateY
p7 : double Angle
p8 : int GrHandle
p9 : int TransFlag
p10 : int ReverseXFlag (default FALSE)
p11 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraph3F() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraph3F(float xf, float yf, float cxf, float cyf, double ExtRateX, double ExtRateY, double Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraph3F 項を参照。

%index
dx_DrawRotaGraphFastF
DxLib DrawRotaGraphFastF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : double (float 縮小) ExRate
p4 : double (float 縮小) Angle
p5 : int GrHandle
p6 : int TransFlag
p7 : int ReverseXFlag (default FALSE)
p8 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraphFastF() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraphFastF(float xf, float yf, float ExRate, float Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraphFastF 項を参照。

%index
dx_DrawRotaGraphFast2F
DxLib DrawRotaGraphFast2F (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : double (float 縮小) cxf
p4 : double (float 縮小) cyf
p5 : double (float 縮小) ExtRate
p6 : double (float 縮小) Angle
p7 : int GrHandle
p8 : int TransFlag
p9 : int ReverseXFlag (default FALSE)
p10 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraphFast2F() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraphFast2F(float xf, float yf, float cxf, float cyf, float ExtRate, float Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraphFast2F 項を参照。

%index
dx_DrawRotaGraphFast3F
DxLib DrawRotaGraphFast3F (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : double (float 縮小) cxf
p4 : double (float 縮小) cyf
p5 : double (float 縮小) ExtRateX
p6 : double (float 縮小) ExtRateY
p7 : double (float 縮小) Angle
p8 : int GrHandle
p9 : int TransFlag
p10 : int ReverseXFlag (default FALSE)
p11 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraphFast3F() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraphFast3F(float xf, float yf, float cxf, float cyf, float ExtRateX, float ExtRateY, float Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraphFast3F 項を参照。

%index
dx_DrawModiGraphF
DxLib DrawModiGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x1
p2 : double (float 縮小) y1
p3 : double (float 縮小) x2
p4 : double (float 縮小) y2
p5 : double (float 縮小) x3
p6 : double (float 縮小) y3
p7 : double (float 縮小) x4
p8 : double (float 縮小) y4
p9 : int GrHandle
p10 : int TransFlag
%inst
DxLib の DrawModiGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawModiGraphF(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawModiGraphF 項を参照。

%index
dx_DrawTurnGraphF
DxLib DrawTurnGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : int GrHandle
p4 : int TransFlag
%inst
DxLib の DrawTurnGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawTurnGraphF(float xf, float yf, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawTurnGraphF 項を参照。

%index
dx_DrawReverseGraphF
DxLib DrawReverseGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) xf
p2 : double (float 縮小) yf
p3 : int GrHandle
p4 : int TransFlag
p5 : int ReverseXFlag (default FALSE)
p6 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawReverseGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawReverseGraphF(float xf, float yf, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawReverseGraphF 項を参照。

%index
dx_DrawTile
DxLib DrawTile (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int Tx
p6 : int Ty
p7 : double ExtRate
p8 : double Angle
p9 : int GrHandle
p10 : int TransFlag
%inst
DxLib の DrawTile() を呼び出します。
^p
元関数シグネチャ: int DrawTile(int x1, int y1, int x2, int y2, int Tx, int Ty, double ExtRate, double Angle, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawTile 項を参照。

%index
dx_DrawRectExtendGraph
DxLib DrawRectExtendGraph (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int DestX1
p2 : int DestY1
p3 : int DestX2
p4 : int DestY2
p5 : int SrcX
p6 : int SrcY
p7 : int SrcWidth
p8 : int SrcHeight
p9 : int GraphHandle
p10 : int TransFlag
%inst
DxLib の DrawRectExtendGraph() を呼び出します。
^p
元関数シグネチャ: int DrawRectExtendGraph(int DestX1, int DestY1, int DestX2, int DestY2, int SrcX, int SrcY, int SrcWidth, int SrcHeight, int GraphHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectExtendGraph 項を参照。

%index
dx_DrawRectRotaGraph2
DxLib DrawRectRotaGraph2 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : int cx
p8 : int cy
p9 : double ExtRate
p10 : double Angle
p11 : int GraphHandle
p12 : int TransFlag
p13 : int ReverseXFlag (default FALSE)
p14 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraph2() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraph2(int x, int y, int SrcX, int SrcY, int Width, int Height, int cx, int cy, double ExtRate, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraph2 項を参照。

%index
dx_DrawRectRotaGraph3
DxLib DrawRectRotaGraph3 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : int cx
p8 : int cy
p9 : double ExtRateX
p10 : double ExtRateY
p11 : double Angle
p12 : int GraphHandle
p13 : int TransFlag
p14 : int ReverseXFlag (default FALSE)
p15 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraph3() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraph3(int x, int y, int SrcX, int SrcY, int Width, int Height, int cx, int cy, double ExtRateX, double ExtRateY, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraph3 項を参照。

%index
dx_DrawRectRotaGraphFast
DxLib DrawRectRotaGraphFast (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : double (float 縮小) ExtRate
p8 : double (float 縮小) Angle
p9 : int GraphHandle
p10 : int TransFlag
p11 : int ReverseXFlag (default FALSE)
p12 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraphFast() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraphFast(int x, int y, int SrcX, int SrcY, int Width, int Height, float ExtRate, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraphFast 項を参照。

%index
dx_DrawRectRotaGraphFast2
DxLib DrawRectRotaGraphFast2 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : int cx
p8 : int cy
p9 : double (float 縮小) ExtRate
p10 : double (float 縮小) Angle
p11 : int GraphHandle
p12 : int TransFlag
p13 : int ReverseXFlag (default FALSE)
p14 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraphFast2() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraphFast2(int x, int y, int SrcX, int SrcY, int Width, int Height, int cx, int cy, float ExtRate, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraphFast2 項を参照。

%index
dx_DrawRectRotaGraphFast3
DxLib DrawRectRotaGraphFast3 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : int cx
p8 : int cy
p9 : double (float 縮小) ExtRateX
p10 : double (float 縮小) ExtRateY
p11 : double (float 縮小) Angle
p12 : int GraphHandle
p13 : int TransFlag
p14 : int ReverseXFlag (default FALSE)
p15 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraphFast3() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraphFast3(int x, int y, int SrcX, int SrcY, int Width, int Height, int cx, int cy, float ExtRateX, float ExtRateY, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraphFast3 項を参照。

%index
dx_DrawRectModiGraph
DxLib DrawRectModiGraph (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int x3
p6 : int y3
p7 : int x4
p8 : int y4
p9 : int SrcX
p10 : int SrcY
p11 : int Width
p12 : int Height
p13 : int GraphHandle
p14 : int TransFlag
%inst
DxLib の DrawRectModiGraph() を呼び出します。
^p
元関数シグネチャ: int DrawRectModiGraph(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int SrcX, int SrcY, int Width, int Height, int GraphHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectModiGraph 項を参照。

%index
dx_DrawRectGraphF
DxLib DrawRectGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) DestX
p2 : double (float 縮小) DestY
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : int GraphHandle
p8 : int TransFlag
p9 : int ReverseXFlag (default FALSE)
p10 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawRectGraphF(float DestX, float DestY, int SrcX, int SrcY, int Width, int Height, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectGraphF 項を参照。

%index
dx_DrawRectGraphF2
DxLib DrawRectGraphF2 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) DestX
p2 : double (float 縮小) DestY
p3 : double (float 縮小) SrcX
p4 : double (float 縮小) SrcY
p5 : double (float 縮小) Width
p6 : double (float 縮小) Height
p7 : int GraphHandle
p8 : int TransFlag
p9 : int ReverseXFlag (default FALSE)
p10 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectGraphF2() を呼び出します。
^p
元関数シグネチャ: int DrawRectGraphF2(float DestX, float DestY, float SrcX, float SrcY, float Width, float Height, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectGraphF2 項を参照。

%index
dx_DrawRectExtendGraphF
DxLib DrawRectExtendGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) DestX1
p2 : double (float 縮小) DestY1
p3 : double (float 縮小) DestX2
p4 : double (float 縮小) DestY2
p5 : int SrcX
p6 : int SrcY
p7 : int SrcWidth
p8 : int SrcHeight
p9 : int GraphHandle
p10 : int TransFlag
%inst
DxLib の DrawRectExtendGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawRectExtendGraphF(float DestX1, float DestY1, float DestX2, float DestY2, int SrcX, int SrcY, int SrcWidth, int SrcHeight, int GraphHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectExtendGraphF 項を参照。

%index
dx_DrawRectExtendGraphF2
DxLib DrawRectExtendGraphF2 (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) DestX1
p2 : double (float 縮小) DestY1
p3 : double (float 縮小) DestX2
p4 : double (float 縮小) DestY2
p5 : double (float 縮小) SrcX
p6 : double (float 縮小) SrcY
p7 : double (float 縮小) SrcWidth
p8 : double (float 縮小) SrcHeight
p9 : int GraphHandle
p10 : int TransFlag
%inst
DxLib の DrawRectExtendGraphF2() を呼び出します。
^p
元関数シグネチャ: int DrawRectExtendGraphF2(float DestX1, float DestY1, float DestX2, float DestY2, float SrcX, float SrcY, float SrcWidth, float SrcHeight, int GraphHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectExtendGraphF2 項を参照。

%index
dx_DrawRectRotaGraphF
DxLib DrawRectRotaGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : double ExtRate
p8 : double Angle
p9 : int GraphHandle
p10 : int TransFlag
p11 : int ReverseXFlag (default FALSE)
p12 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraphF(float x, float y, int SrcX, int SrcY, int Width, int Height, double ExtRate, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraphF 項を参照。

%index
dx_DrawRectRotaGraph2F
DxLib DrawRectRotaGraph2F (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : double (float 縮小) cxf
p8 : double (float 縮小) cyf
p9 : double ExtRate
p10 : double Angle
p11 : int GraphHandle
p12 : int TransFlag
p13 : int ReverseXFlag (default FALSE)
p14 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraph2F() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraph2F(float x, float y, int SrcX, int SrcY, int Width, int Height, float cxf, float cyf, double ExtRate, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraph2F 項を参照。

%index
dx_DrawRectRotaGraph3F
DxLib DrawRectRotaGraph3F (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : double (float 縮小) cxf
p8 : double (float 縮小) cyf
p9 : double ExtRateX
p10 : double ExtRateY
p11 : double Angle
p12 : int GraphHandle
p13 : int TransFlag
p14 : int ReverseXFlag (default FALSE)
p15 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraph3F() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraph3F(float x, float y, int SrcX, int SrcY, int Width, int Height, float cxf, float cyf, double ExtRateX, double ExtRateY, double Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraph3F 項を参照。

%index
dx_DrawRectRotaGraphFastF
DxLib DrawRectRotaGraphFastF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : double (float 縮小) ExtRate
p8 : double (float 縮小) Angle
p9 : int GraphHandle
p10 : int TransFlag
p11 : int ReverseXFlag (default FALSE)
p12 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraphFastF() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraphFastF(float x, float y, int SrcX, int SrcY, int Width, int Height, float ExtRate, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraphFastF 項を参照。

%index
dx_DrawRectRotaGraphFast2F
DxLib DrawRectRotaGraphFast2F (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : double (float 縮小) cxf
p8 : double (float 縮小) cyf
p9 : double (float 縮小) ExtRate
p10 : double (float 縮小) Angle
p11 : int GraphHandle
p12 : int TransFlag
p13 : int ReverseXFlag (default FALSE)
p14 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraphFast2F() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraphFast2F(float x, float y, int SrcX, int SrcY, int Width, int Height, float cxf, float cyf, float ExtRate, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraphFast2F 項を参照。

%index
dx_DrawRectRotaGraphFast3F
DxLib DrawRectRotaGraphFast3F (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : int SrcX
p4 : int SrcY
p5 : int Width
p6 : int Height
p7 : double (float 縮小) cxf
p8 : double (float 縮小) cyf
p9 : double (float 縮小) ExtRateX
p10 : double (float 縮小) ExtRateY
p11 : double (float 縮小) Angle
p12 : int GraphHandle
p13 : int TransFlag
p14 : int ReverseXFlag (default FALSE)
p15 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRectRotaGraphFast3F() を呼び出します。
^p
元関数シグネチャ: int DrawRectRotaGraphFast3F(float x, float y, int SrcX, int SrcY, int Width, int Height, float cxf, float cyf, float ExtRateX, float ExtRateY, float Angle, int GraphHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectRotaGraphFast3F 項を参照。

%index
dx_DrawRectModiGraphF
DxLib DrawRectModiGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x1
p2 : double (float 縮小) y1
p3 : double (float 縮小) x2
p4 : double (float 縮小) y2
p5 : double (float 縮小) x3
p6 : double (float 縮小) y3
p7 : double (float 縮小) x4
p8 : double (float 縮小) y4
p9 : int SrcX
p10 : int SrcY
p11 : int Width
p12 : int Height
p13 : int GraphHandle
p14 : int TransFlag
%inst
DxLib の DrawRectModiGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawRectModiGraphF(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int SrcX, int SrcY, int Width, int Height, int GraphHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRectModiGraphF 項を参照。

%index
dx_DrawBlendGraph
DxLib DrawBlendGraph (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int GrHandle
p4 : int TransFlag
p5 : int BlendGraph
p6 : int BorderParam
p7 : int BorderRange
%inst
DxLib の DrawBlendGraph() を呼び出します。
^p
元関数シグネチャ: int DrawBlendGraph(int x, int y, int GrHandle, int TransFlag, int BlendGraph, int BorderParam, int BorderRange)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawBlendGraph 項を参照。

%index
dx_DrawBlendGraphF
DxLib DrawBlendGraphF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : int GrHandle
p4 : int TransFlag
p5 : int BlendGraph
p6 : int BorderParam
p7 : int BorderRange
%inst
DxLib の DrawBlendGraphF() を呼び出します。
^p
元関数シグネチャ: int DrawBlendGraphF(float x, float y, int GrHandle, int TransFlag, int BlendGraph, int BorderParam, int BorderRange)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawBlendGraphF 項を参照。

%index
dx_DrawBlendGraphPos
DxLib DrawBlendGraphPos (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int GrHandle
p4 : int TransFlag
p5 : int bx
p6 : int by
p7 : int BlendGraph
p8 : int BorderParam
p9 : int BorderRange
%inst
DxLib の DrawBlendGraphPos() を呼び出します。
^p
元関数シグネチャ: int DrawBlendGraphPos(int x, int y, int GrHandle, int TransFlag, int bx, int by, int BlendGraph, int BorderParam, int BorderRange)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawBlendGraphPos 項を参照。

%index
dx_DrawCircleGauge
DxLib DrawCircleGauge (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int CenterX
p2 : int CenterY
p3 : double Percent
p4 : int GrHandle
p5 : double StartPercent (default 0.0)
p6 : double Scale (default 1.0)
p7 : int ReverseX (default FALSE)
p8 : int ReverseY (default FALSE)
%inst
DxLib の DrawCircleGauge() を呼び出します。
^p
元関数シグネチャ: int DrawCircleGauge(int CenterX, int CenterY, double Percent, int GrHandle, double StartPercent, double Scale, int ReverseX, int ReverseY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCircleGauge 項を参照。

%index
dx_DrawCircleGaugeF
DxLib DrawCircleGaugeF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) CenterX
p2 : double (float 縮小) CenterY
p3 : double Percent
p4 : int GrHandle
p5 : double StartPercent (default 0.0)
p6 : double Scale (default 1.0)
p7 : int ReverseX (default FALSE)
p8 : int ReverseY (default FALSE)
%inst
DxLib の DrawCircleGaugeF() を呼び出します。
^p
元関数シグネチャ: int DrawCircleGaugeF(float CenterX, float CenterY, double Percent, int GrHandle, double StartPercent, double Scale, int ReverseX, int ReverseY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCircleGaugeF 項を参照。

%index
dx_DrawPolygon3D_UseVertexBuffer
DxLib DrawPolygon3D_UseVertexBuffer (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int VertexBufHandle
p2 : int GrHandle
p3 : int TransFlag
%inst
DxLib の DrawPolygon3D_UseVertexBuffer() を呼び出します。
^p
元関数シグネチャ: int DrawPolygon3D_UseVertexBuffer(int VertexBufHandle, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPolygon3D_UseVertexBuffer 項を参照。

%index
dx_DrawPolygonIndexed3D_UseVertexBuffer
DxLib DrawPolygonIndexed3D_UseVertexBuffer (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int VertexBufHandle
p2 : int IndexBufHandle
p3 : int GrHandle
p4 : int TransFlag
%inst
DxLib の DrawPolygonIndexed3D_UseVertexBuffer() を呼び出します。
^p
元関数シグネチャ: int DrawPolygonIndexed3D_UseVertexBuffer(int VertexBufHandle, int IndexBufHandle, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPolygonIndexed3D_UseVertexBuffer 項を参照。

%index
dx_DrawGraph3D
DxLib DrawGraph3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double (float 縮小) z
p4 : int GrHandle
p5 : int TransFlag
%inst
DxLib の DrawGraph3D() を呼び出します。
^p
元関数シグネチャ: int DrawGraph3D(float x, float y, float z, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawGraph3D 項を参照。

%index
dx_DrawExtendGraph3D
DxLib DrawExtendGraph3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double (float 縮小) z
p4 : double ExRateX
p5 : double ExRateY
p6 : int GrHandle
p7 : int TransFlag
%inst
DxLib の DrawExtendGraph3D() を呼び出します。
^p
元関数シグネチャ: int DrawExtendGraph3D(float x, float y, float z, double ExRateX, double ExRateY, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendGraph3D 項を参照。

%index
dx_DrawRotaGraph3D
DxLib DrawRotaGraph3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double (float 縮小) z
p4 : double ExRate
p5 : double Angle
p6 : int GrHandle
p7 : int TransFlag
p8 : int ReverseXFlag (default FALSE)
p9 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRotaGraph3D() を呼び出します。
^p
元関数シグネチャ: int DrawRotaGraph3D(float x, float y, float z, double ExRate, double Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaGraph3D 項を参照。

%index
dx_DrawRota2Graph3D
DxLib DrawRota2Graph3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double (float 縮小) z
p4 : double (float 縮小) cx
p5 : double (float 縮小) cy
p6 : double ExtRateX
p7 : double ExtRateY
p8 : double Angle
p9 : int GrHandle
p10 : int TransFlag
p11 : int ReverseXFlag (default FALSE)
p12 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawRota2Graph3D() を呼び出します。
^p
元関数シグネチャ: int DrawRota2Graph3D(float x, float y, float z, float cx, float cy, double ExtRateX, double ExtRateY, double Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRota2Graph3D 項を参照。

%index
dx_DrawModiBillboard3D
DxLib DrawModiBillboard3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos
p2 : double (float 縮小) x1
p3 : double (float 縮小) y1
p4 : double (float 縮小) x2
p5 : double (float 縮小) y2
p6 : double (float 縮小) x3
p7 : double (float 縮小) y3
p8 : double (float 縮小) x4
p9 : double (float 縮小) y4
p10 : int GrHandle
p11 : int TransFlag
%inst
DxLib の DrawModiBillboard3D() を呼び出します。
^p
元関数シグネチャ: int DrawModiBillboard3D(VECTOR Pos, float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int GrHandle, int TransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawModiBillboard3D 項を参照。

%index
dx_DrawBillboard3D
DxLib DrawBillboard3D (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos
p2 : double (float 縮小) cx
p3 : double (float 縮小) cy
p4 : double (float 縮小) Size
p5 : double (float 縮小) Angle
p6 : int GrHandle
p7 : int TransFlag
p8 : int ReverseXFlag (default FALSE)
p9 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawBillboard3D() を呼び出します。
^p
元関数シグネチャ: int DrawBillboard3D(VECTOR Pos, float cx, float cy, float Size, float Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawBillboard3D 項を参照。

%index
dx_GetDrawMode
DxLib GetDrawMode (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDrawMode() を呼び出します。
^p
元関数シグネチャ: int GetDrawMode(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawMode 項を参照。

%index
dx_SetDrawAlphaTest
DxLib SetDrawAlphaTest (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int TestMode
p2 : int TestParam
%inst
DxLib の SetDrawAlphaTest() を呼び出します。
^p
元関数シグネチャ: int SetDrawAlphaTest(int TestMode, int TestParam)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawAlphaTest 項を参照。

%index
dx_SetBlendGraph
DxLib SetBlendGraph (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int BlendGraph
p2 : int BorderParam
p3 : int BorderRange
%inst
DxLib の SetBlendGraph() を呼び出します。
^p
元関数シグネチャ: int SetBlendGraph(int BlendGraph, int BorderParam, int BorderRange)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetBlendGraph 項を参照。

%index
dx_SetBlendGraphPosition
DxLib SetBlendGraphPosition (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int x
p2 : int y
%inst
DxLib の SetBlendGraphPosition() を呼び出します。
^p
元関数シグネチャ: int SetBlendGraphPosition(int x, int y)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetBlendGraphPosition 項を参照。

%index
dx_SetDrawAddColor
DxLib SetDrawAddColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Red
p2 : int Green
p3 : int Blue
%inst
DxLib の SetDrawAddColor() を呼び出します。
^p
元関数シグネチャ: int SetDrawAddColor(int Red, int Green, int Blue)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawAddColor 項を参照。

%index
dx_SetWriteAlphaChannelFlag
DxLib SetWriteAlphaChannelFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetWriteAlphaChannelFlag() を呼び出します。
^p
元関数シグネチャ: int SetWriteAlphaChannelFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetWriteAlphaChannelFlag 項を参照。

%index
dx_GetWriteAlphaChannelFlag
DxLib GetWriteAlphaChannelFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetWriteAlphaChannelFlag() を呼び出します。
^p
元関数シグネチャ: int GetWriteAlphaChannelFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetWriteAlphaChannelFlag 項を参照。

%index
dx_CheckSeparateAlphaBlendEnable
DxLib CheckSeparateAlphaBlendEnable (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の CheckSeparateAlphaBlendEnable() を呼び出します。
^p
元関数シグネチャ: int CheckSeparateAlphaBlendEnable(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckSeparateAlphaBlendEnable 項を参照。

%index
dx_SetIgnoreDrawGraphColor
DxLib SetIgnoreDrawGraphColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int EnableFlag
%inst
DxLib の SetIgnoreDrawGraphColor() を呼び出します。
^p
元関数シグネチャ: int SetIgnoreDrawGraphColor(int EnableFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetIgnoreDrawGraphColor 項を参照。

%index
dx_GetIgnoreDrawGraphColor
DxLib GetIgnoreDrawGraphColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetIgnoreDrawGraphColor() を呼び出します。
^p
元関数シグネチャ: int GetIgnoreDrawGraphColor(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetIgnoreDrawGraphColor 項を参照。

%index
dx_SetMaxAnisotropy
DxLib SetMaxAnisotropy (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int MaxAnisotropy
%inst
DxLib の SetMaxAnisotropy() を呼び出します。
^p
元関数シグネチャ: int SetMaxAnisotropy(int MaxAnisotropy)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMaxAnisotropy 項を参照。

%index
dx_GetMaxAnisotropy
DxLib GetMaxAnisotropy (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetMaxAnisotropy() を呼び出します。
^p
元関数シグネチャ: int GetMaxAnisotropy(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMaxAnisotropy 項を参照。

%index
dx_SetUseLarge3DPositionSupport
DxLib SetUseLarge3DPositionSupport (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetUseLarge3DPositionSupport() を呼び出します。
^p
元関数シグネチャ: int SetUseLarge3DPositionSupport(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseLarge3DPositionSupport 項を参照。

%index
dx_SetUseZBufferFlag
DxLib SetUseZBufferFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseZBufferFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseZBufferFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseZBufferFlag 項を参照。

%index
dx_SetWriteZBufferFlag
DxLib SetWriteZBufferFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetWriteZBufferFlag() を呼び出します。
^p
元関数シグネチャ: int SetWriteZBufferFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetWriteZBufferFlag 項を参照。

%index
dx_SetZBias
DxLib SetZBias (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Bias
%inst
DxLib の SetZBias() を呼び出します。
^p
元関数シグネチャ: int SetZBias(int Bias)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetZBias 項を参照。

%index
dx_SetZBias3D
DxLib SetZBias3D (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Bias
%inst
DxLib の SetZBias3D() を呼び出します。
^p
元関数シグネチャ: int SetZBias3D(int Bias)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetZBias3D 項を参照。

%index
dx_SetDrawZ
DxLib SetDrawZ (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double (float 縮小) Z
%inst
DxLib の SetDrawZ() を呼び出します。
^p
元関数シグネチャ: int SetDrawZ(float Z)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawZ 項を参照。

%index
dx_SetUseReversedZ
DxLib SetUseReversedZ (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseReversedZ() を呼び出します。
^p
元関数シグネチャ: int SetUseReversedZ(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseReversedZ 項を参照。

%index
dx_SetDrawArea
DxLib SetDrawArea (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
%inst
DxLib の SetDrawArea() を呼び出します。
^p
元関数シグネチャ: int SetDrawArea(int x1, int y1, int x2, int y2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawArea 項を参照。

%index
dx_SetDrawAreaFull
DxLib SetDrawAreaFull (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の SetDrawAreaFull() を呼び出します。
^p
元関数シグネチャ: int SetDrawAreaFull(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawAreaFull 項を参照。

%index
dx_SetDraw3DScale
DxLib SetDraw3DScale (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double (float 縮小) Scale
%inst
DxLib の SetDraw3DScale() を呼び出します。
^p
元関数シグネチャ: int SetDraw3DScale(float Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDraw3DScale 項を参照。

%index
dx_RunRestoreShred
DxLib RunRestoreShred (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の RunRestoreShred() を呼び出します。
^p
元関数シグネチャ: int RunRestoreShred(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の RunRestoreShred 項を参照。

%index
dx_ResetTransformTo2D
DxLib ResetTransformTo2D (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の ResetTransformTo2D() を呼び出します。
^p
元関数シグネチャ: int ResetTransformTo2D(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetTransformTo2D 項を参照。

%index
dx_SetDefTransformMatrix
DxLib SetDefTransformMatrix (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の SetDefTransformMatrix() を呼び出します。
^p
元関数シグネチャ: int SetDefTransformMatrix(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDefTransformMatrix 項を参照。

%index
dx_SetUseCullingFlag
DxLib SetUseCullingFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseCullingFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseCullingFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseCullingFlag 項を参照。

%index
dx_GetUseBackCulling
DxLib GetUseBackCulling (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseBackCulling() を呼び出します。
^p
元関数シグネチャ: int GetUseBackCulling(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseBackCulling 項を参照。

%index
dx_SetUseRightHandClippingProcess
DxLib SetUseRightHandClippingProcess (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseRightHandClippingProcess() を呼び出します。
^p
元関数シグネチャ: int SetUseRightHandClippingProcess(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseRightHandClippingProcess 項を参照。

%index
dx_GetUseRightHandClippingProcess
DxLib GetUseRightHandClippingProcess (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseRightHandClippingProcess() を呼び出します。
^p
元関数シグネチャ: int GetUseRightHandClippingProcess(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseRightHandClippingProcess 項を参照。

%index
dx_SetTextureAddressModeUV
DxLib SetTextureAddressModeUV (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ModeU
p2 : int ModeV
p3 : int Stage (default -1)
%inst
DxLib の SetTextureAddressModeUV() を呼び出します。
^p
元関数シグネチャ: int SetTextureAddressModeUV(int ModeU, int ModeV, int Stage)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetTextureAddressModeUV 項を参照。

%index
dx_SetTextureAddressTransform
DxLib SetTextureAddressTransform (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double (float 縮小) TransU
p2 : double (float 縮小) TransV
p3 : double (float 縮小) ScaleU
p4 : double (float 縮小) ScaleV
p5 : double (float 縮小) RotCenterU
p6 : double (float 縮小) RotCenterV
p7 : double (float 縮小) Rotate
%inst
DxLib の SetTextureAddressTransform() を呼び出します。
^p
元関数シグネチャ: int SetTextureAddressTransform(float TransU, float TransV, float ScaleU, float ScaleV, float RotCenterU, float RotCenterV, float Rotate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetTextureAddressTransform 項を参照。

%index
dx_SetTextureAddressTransformMatrix
DxLib SetTextureAddressTransformMatrix (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : var (MATRIX: 4x4 float) Matrix
%inst
DxLib の SetTextureAddressTransformMatrix() を呼び出します。
^p
元関数シグネチャ: int SetTextureAddressTransformMatrix(MATRIX Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetTextureAddressTransformMatrix 項を参照。

%index
dx_ResetTextureAddressTransform
DxLib ResetTextureAddressTransform (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の ResetTextureAddressTransform() を呼び出します。
^p
元関数シグネチャ: int ResetTextureAddressTransform(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetTextureAddressTransform 項を参照。

%index
dx_SetFogEnable
DxLib SetFogEnable (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetFogEnable() を呼び出します。
^p
元関数シグネチャ: int SetFogEnable(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFogEnable 項を参照。

%index
dx_GetFogEnable
DxLib GetFogEnable (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetFogEnable() を呼び出します。
^p
元関数シグネチャ: int GetFogEnable(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFogEnable 項を参照。

%index
dx_GetFogMode
DxLib GetFogMode (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetFogMode() を呼び出します。
^p
元関数シグネチャ: int GetFogMode(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFogMode 項を参照。

%index
dx_SetFogColor
DxLib SetFogColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int r
p2 : int g
p3 : int b
%inst
DxLib の SetFogColor() を呼び出します。
^p
元関数シグネチャ: int SetFogColor(int r, int g, int b)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFogColor 項を参照。

%index
dx_SetFogStartEnd
DxLib SetFogStartEnd (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double (float 縮小) start
p2 : double (float 縮小) end
%inst
DxLib の SetFogStartEnd() を呼び出します。
^p
元関数シグネチャ: int SetFogStartEnd(float start, float end)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFogStartEnd 項を参照。

%index
dx_SetFogDensity
DxLib SetFogDensity (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double (float 縮小) density
%inst
DxLib の SetFogDensity() を呼び出します。
^p
元関数シグネチャ: int SetFogDensity(float density)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFogDensity 項を参照。

%index
dx_SetVerticalFogEnable
DxLib SetVerticalFogEnable (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetVerticalFogEnable() を呼び出します。
^p
元関数シグネチャ: int SetVerticalFogEnable(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVerticalFogEnable 項を参照。

%index
dx_GetVerticalFogEnable
DxLib GetVerticalFogEnable (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetVerticalFogEnable() を呼び出します。
^p
元関数シグネチャ: int GetVerticalFogEnable(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetVerticalFogEnable 項を参照。

%index
dx_GetVerticalFogMode
DxLib GetVerticalFogMode (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetVerticalFogMode() を呼び出します。
^p
元関数シグネチャ: int GetVerticalFogMode(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetVerticalFogMode 項を参照。

%index
dx_SetVerticalFogColor
DxLib SetVerticalFogColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int r
p2 : int g
p3 : int b
%inst
DxLib の SetVerticalFogColor() を呼び出します。
^p
元関数シグネチャ: int SetVerticalFogColor(int r, int g, int b)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVerticalFogColor 項を参照。

%index
dx_SetVerticalFogStartEnd
DxLib SetVerticalFogStartEnd (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double (float 縮小) start
p2 : double (float 縮小) end
%inst
DxLib の SetVerticalFogStartEnd() を呼び出します。
^p
元関数シグネチャ: int SetVerticalFogStartEnd(float start, float end)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVerticalFogStartEnd 項を参照。

%index
dx_SetVerticalFogDensity
DxLib SetVerticalFogDensity (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double (float 縮小) start
p2 : double (float 縮小) density
%inst
DxLib の SetVerticalFogDensity() を呼び出します。
^p
元関数シグネチャ: int SetVerticalFogDensity(float start, float density)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVerticalFogDensity 項を参照。

%index
dx_GetDrawScreenGraph
DxLib GetDrawScreenGraph (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int GrHandle
p6 : int UseClientFlag (default TRUE)
%inst
DxLib の GetDrawScreenGraph() を呼び出します。
^p
元関数シグネチャ: int GetDrawScreenGraph(int x1, int y1, int x2, int y2, int GrHandle, int UseClientFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawScreenGraph 項を参照。

%index
dx_BltDrawValidGraph
DxLib BltDrawValidGraph (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int TargetDrawValidGrHandle
p2 : int x1
p3 : int y1
p4 : int x2
p5 : int y2
p6 : int DestX
p7 : int DestY
p8 : int DestGrHandle
%inst
DxLib の BltDrawValidGraph() を呼び出します。
^p
元関数シグネチャ: int BltDrawValidGraph(int TargetDrawValidGrHandle, int x1, int y1, int x2, int y2, int DestX, int DestY, int DestGrHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の BltDrawValidGraph 項を参照。

%index
dx_ScreenCopy
DxLib ScreenCopy (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
(引数なし)
%inst
DxLib の ScreenCopy() を呼び出します。
^p
元関数シグネチャ: int ScreenCopy(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ScreenCopy 項を参照。

%index
dx_WaitVSync
DxLib WaitVSync (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SyncNum
%inst
DxLib の WaitVSync() を呼び出します。
^p
元関数シグネチャ: int WaitVSync(int SyncNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WaitVSync 項を参照。

%index
dx_ClsDrawScreen
DxLib ClsDrawScreen (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
(引数なし)
%inst
DxLib の ClsDrawScreen() を呼び出します。
^p
元関数シグネチャ: int ClsDrawScreen(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ClsDrawScreen 項を参照。

%index
dx_GetDrawScreen
DxLib GetDrawScreen (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDrawScreen() を呼び出します。
^p
元関数シグネチャ: int GetDrawScreen(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawScreen 項を参照。

%index
dx_GetActiveGraph
DxLib GetActiveGraph (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetActiveGraph() を呼び出します。
^p
元関数シグネチャ: int GetActiveGraph(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetActiveGraph 項を参照。

%index
dx_SetUseSetDrawScreenSettingReset
DxLib SetUseSetDrawScreenSettingReset (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetUseSetDrawScreenSettingReset() を呼び出します。
^p
元関数シグネチャ: int SetUseSetDrawScreenSettingReset(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseSetDrawScreenSettingReset 項を参照。

%index
dx_GetUseSetDrawScreenSettingReset
DxLib GetUseSetDrawScreenSettingReset (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseSetDrawScreenSettingReset() を呼び出します。
^p
元関数シグネチャ: int GetUseSetDrawScreenSettingReset(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseSetDrawScreenSettingReset 項を参照。

%index
dx_SetDrawZBuffer
DxLib SetDrawZBuffer (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int DrawScreen
%inst
DxLib の SetDrawZBuffer() を呼び出します。
^p
元関数シグネチャ: int SetDrawZBuffer(int DrawScreen)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDrawZBuffer 項を参照。

%index
dx_GetUseFullScreenResolutionMode
DxLib GetUseFullScreenResolutionMode (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseFullScreenResolutionMode() を呼び出します。
^p
元関数シグネチャ: int GetUseFullScreenResolutionMode(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseFullScreenResolutionMode 項を参照。

%index
dx_SetEmulation320x240
DxLib SetEmulation320x240 (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetEmulation320x240() を呼び出します。
^p
元関数シグネチャ: int SetEmulation320x240(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetEmulation320x240 項を参照。

%index
dx_SetZBufferSize
DxLib SetZBufferSize (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ZBufferSizeX
p2 : int ZBufferSizeY
%inst
DxLib の SetZBufferSize() を呼び出します。
^p
元関数シグネチャ: int SetZBufferSize(int ZBufferSizeX, int ZBufferSizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetZBufferSize 項を参照。

%index
dx_SetZBufferBitDepth
DxLib SetZBufferBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int BitDepth
%inst
DxLib の SetZBufferBitDepth() を呼び出します。
^p
元関数シグネチャ: int SetZBufferBitDepth(int BitDepth)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetZBufferBitDepth 項を参照。

%index
dx_GetWaitVSyncFlag
DxLib GetWaitVSyncFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetWaitVSyncFlag() を呼び出します。
^p
元関数シグネチャ: int GetWaitVSyncFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetWaitVSyncFlag 項を参照。

%index
dx_SetFullSceneAntiAliasingMode
DxLib SetFullSceneAntiAliasingMode (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Samples
p2 : int Quality
%inst
DxLib の SetFullSceneAntiAliasingMode() を呼び出します。
^p
元関数シグネチャ: int SetFullSceneAntiAliasingMode(int Samples, int Quality)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFullSceneAntiAliasingMode 項を参照。

%index
dx_SetGraphDisplayArea
DxLib SetGraphDisplayArea (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
%inst
DxLib の SetGraphDisplayArea() を呼び出します。
^p
元関数シグネチャ: int SetGraphDisplayArea(int x1, int y1, int x2, int y2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetGraphDisplayArea 項を参照。

%index
dx_SetChangeScreenModeGraphicsSystemResetFlag
DxLib SetChangeScreenModeGraphicsSystemResetFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetChangeScreenModeGraphicsSystemResetFlag() を呼び出します。
^p
元関数シグネチャ: int SetChangeScreenModeGraphicsSystemResetFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetChangeScreenModeGraphicsSystemResetFlag 項を参照。

%index
dx_GetScreenBitDepth
DxLib GetScreenBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetScreenBitDepth() を呼び出します。
^p
元関数シグネチャ: int GetScreenBitDepth(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetScreenBitDepth 項を参照。

%index
dx_GetColorBitDepth
DxLib GetColorBitDepth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetColorBitDepth() を呼び出します。
^p
元関数シグネチャ: int GetColorBitDepth(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetColorBitDepth 項を参照。

%index
dx_GetChangeDisplayFlag
DxLib GetChangeDisplayFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetChangeDisplayFlag() を呼び出します。
^p
元関数シグネチャ: int GetChangeDisplayFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetChangeDisplayFlag 項を参照。

%index
dx_GetRefreshRate
DxLib GetRefreshRate (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetRefreshRate() を呼び出します。
^p
元関数シグネチャ: int GetRefreshRate(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetRefreshRate 項を参照。

%index
dx_GetDisplayNum
DxLib GetDisplayNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDisplayNum() を呼び出します。
^p
元関数シグネチャ: int GetDisplayNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDisplayNum 項を参照。

%index
dx_GetDisplayModeNum
DxLib GetDisplayModeNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int DisplayIndex (default 0)
%inst
DxLib の GetDisplayModeNum() を呼び出します。
^p
元関数シグネチャ: int GetDisplayModeNum(int DisplayIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDisplayModeNum 項を参照。

%index
dx_GetMultiDrawScreenNum
DxLib GetMultiDrawScreenNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetMultiDrawScreenNum() を呼び出します。
^p
元関数シグネチャ: int GetMultiDrawScreenNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMultiDrawScreenNum 項を参照。

%index
dx_GetDrawFloatCoordType
DxLib GetDrawFloatCoordType (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDrawFloatCoordType() を呼び出します。
^p
元関数シグネチャ: int GetDrawFloatCoordType(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawFloatCoordType 項を参照。

%index
dx_SetUseNormalDrawShader
DxLib SetUseNormalDrawShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int Flag
%inst
DxLib の SetUseNormalDrawShader() を呼び出します。
^p
元関数シグネチャ: int SetUseNormalDrawShader(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseNormalDrawShader 項を参照。

%index
dx_SetUseSoftwareRenderModeFlag
DxLib SetUseSoftwareRenderModeFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseSoftwareRenderModeFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseSoftwareRenderModeFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseSoftwareRenderModeFlag 項を参照。

%index
dx_SetNotUse3DFlag
DxLib SetNotUse3DFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetNotUse3DFlag() を呼び出します。
^p
元関数シグネチャ: int SetNotUse3DFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNotUse3DFlag 項を参照。

%index
dx_SetUse3DFlag
DxLib SetUse3DFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUse3DFlag() を呼び出します。
^p
元関数シグネチャ: int SetUse3DFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUse3DFlag 項を参照。

%index
dx_GetUse3DFlag
DxLib GetUse3DFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUse3DFlag() を呼び出します。
^p
元関数シグネチャ: int GetUse3DFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUse3DFlag 項を参照。

%index
dx_SetScreenMemToVramFlag
DxLib SetScreenMemToVramFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetScreenMemToVramFlag() を呼び出します。
^p
元関数シグネチャ: int SetScreenMemToVramFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetScreenMemToVramFlag 項を参照。

%index
dx_GetScreenMemToSystemMemFlag
DxLib GetScreenMemToSystemMemFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetScreenMemToSystemMemFlag() を呼び出します。
^p
元関数シグネチャ: int GetScreenMemToSystemMemFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetScreenMemToSystemMemFlag 項を参照。

%index
dx_RestoreGraphSystem
DxLib RestoreGraphSystem (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
(引数なし)
%inst
DxLib の RestoreGraphSystem() を呼び出します。
^p
元関数シグネチャ: int RestoreGraphSystem(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の RestoreGraphSystem 項を参照。

%index
dx_SetUseHardwareVertexProcessing
DxLib SetUseHardwareVertexProcessing (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int Flag
%inst
DxLib の SetUseHardwareVertexProcessing() を呼び出します。
^p
元関数シグネチャ: int SetUseHardwareVertexProcessing(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseHardwareVertexProcessing 項を参照。

%index
dx_SetUsePixelLighting
DxLib SetUsePixelLighting (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int Flag
%inst
DxLib の SetUsePixelLighting() を呼び出します。
^p
元関数シグネチャ: int SetUsePixelLighting(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUsePixelLighting 項を参照。

%index
dx_SetUseOldDrawModiGraphCodeFlag
DxLib SetUseOldDrawModiGraphCodeFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseOldDrawModiGraphCodeFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseOldDrawModiGraphCodeFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseOldDrawModiGraphCodeFlag 項を参照。

%index
dx_SetUseVramFlag
DxLib SetUseVramFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseVramFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseVramFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseVramFlag 項を参照。

%index
dx_GetUseVramFlag
DxLib GetUseVramFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseVramFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseVramFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseVramFlag 項を参照。

%index
dx_SetBasicBlendFlag
DxLib SetBasicBlendFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetBasicBlendFlag() を呼び出します。
^p
元関数シグネチャ: int SetBasicBlendFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetBasicBlendFlag 項を参照。

%index
dx_SetUseBasicGraphDraw3DDeviceMethodFlag
DxLib SetUseBasicGraphDraw3DDeviceMethodFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseBasicGraphDraw3DDeviceMethodFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseBasicGraphDraw3DDeviceMethodFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseBasicGraphDraw3DDeviceMethodFlag 項を参照。

%index
dx_SetUseDisplayIndex
DxLib SetUseDisplayIndex (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Index
%inst
DxLib の SetUseDisplayIndex() を呼び出します。
^p
元関数シグネチャ: int SetUseDisplayIndex(int Index)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseDisplayIndex 項を参照。

%index
dx_RenderVertex
DxLib RenderVertex (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
(引数なし)
%inst
DxLib の RenderVertex() を呼び出します。
^p
元関数シグネチャ: int RenderVertex(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の RenderVertex 項を参照。

%index
dx_GetDrawCallCount
DxLib GetDrawCallCount (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetDrawCallCount() を呼び出します。
^p
元関数シグネチャ: int GetDrawCallCount(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawCallCount 項を参照。

%index
dx_SaveDrawScreenToBMP
DxLib SaveDrawScreenToBMP (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : str FileName
%inst
DxLib の SaveDrawScreenToBMP() を呼び出します。
^p
元関数シグネチャ: int SaveDrawScreenToBMP(int x1, int y1, int x2, int y2, const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawScreenToBMP 項を参照。

%index
dx_SaveDrawScreenToDDS
DxLib SaveDrawScreenToDDS (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : str FileName
%inst
DxLib の SaveDrawScreenToDDS() を呼び出します。
^p
元関数シグネチャ: int SaveDrawScreenToDDS(int x1, int y1, int x2, int y2, const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawScreenToDDS 項を参照。

%index
dx_SaveDrawScreenToJPEG
DxLib SaveDrawScreenToJPEG (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : str FileName
p6 : int Quality (default 80)
p7 : int Sample2x1 (default TRUE)
%inst
DxLib の SaveDrawScreenToJPEG() を呼び出します。
^p
元関数シグネチャ: int SaveDrawScreenToJPEG(int x1, int y1, int x2, int y2, const TCHAR * FileName, int Quality, int Sample2x1)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawScreenToJPEG 項を参照。

%index
dx_SaveDrawScreenToPNG
DxLib SaveDrawScreenToPNG (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : str FileName
p6 : int CompressionLevel (default -1)
%inst
DxLib の SaveDrawScreenToPNG() を呼び出します。
^p
元関数シグネチャ: int SaveDrawScreenToPNG(int x1, int y1, int x2, int y2, const TCHAR * FileName, int CompressionLevel)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawScreenToPNG 項を参照。

%index
dx_SaveDrawValidGraph
DxLib SaveDrawValidGraph (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int GrHandle
p2 : int x1
p3 : int y1
p4 : int x2
p5 : int y2
p6 : str FileName
p7 : int SaveType (default DX_IMAGESAVETYPE_BMP)
p8 : int Jpeg_Quality (default 80)
p9 : int Jpeg_Sample2x1 (default TRUE)
p10 : int Png_CompressionLevel (default -1)
%inst
DxLib の SaveDrawValidGraph() を呼び出します。
^p
元関数シグネチャ: int SaveDrawValidGraph(int GrHandle, int x1, int y1, int x2, int y2, const TCHAR * FileName, int SaveType, int Jpeg_Quality, int Jpeg_Sample2x1, int Png_CompressionLevel)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawValidGraph 項を参照。

%index
dx_SaveDrawValidGraphToBMP
DxLib SaveDrawValidGraphToBMP (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int GrHandle
p2 : int x1
p3 : int y1
p4 : int x2
p5 : int y2
p6 : str FileName
%inst
DxLib の SaveDrawValidGraphToBMP() を呼び出します。
^p
元関数シグネチャ: int SaveDrawValidGraphToBMP(int GrHandle, int x1, int y1, int x2, int y2, const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawValidGraphToBMP 項を参照。

%index
dx_SaveDrawValidGraphToDDS
DxLib SaveDrawValidGraphToDDS (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int GrHandle
p2 : int x1
p3 : int y1
p4 : int x2
p5 : int y2
p6 : str FileName
%inst
DxLib の SaveDrawValidGraphToDDS() を呼び出します。
^p
元関数シグネチャ: int SaveDrawValidGraphToDDS(int GrHandle, int x1, int y1, int x2, int y2, const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawValidGraphToDDS 項を参照。

%index
dx_SaveDrawValidGraphToJPEG
DxLib SaveDrawValidGraphToJPEG (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int GrHandle
p2 : int x1
p3 : int y1
p4 : int x2
p5 : int y2
p6 : str FileName
p7 : int Quality (default 80)
p8 : int Sample2x1 (default TRUE)
%inst
DxLib の SaveDrawValidGraphToJPEG() を呼び出します。
^p
元関数シグネチャ: int SaveDrawValidGraphToJPEG(int GrHandle, int x1, int y1, int x2, int y2, const TCHAR * FileName, int Quality, int Sample2x1)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawValidGraphToJPEG 項を参照。

%index
dx_SaveDrawValidGraphToPNG
DxLib SaveDrawValidGraphToPNG (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : int GrHandle
p2 : int x1
p3 : int y1
p4 : int x2
p5 : int y2
p6 : str FileName
p7 : int CompressionLevel (default -1)
%inst
DxLib の SaveDrawValidGraphToPNG() を呼び出します。
^p
元関数シグネチャ: int SaveDrawValidGraphToPNG(int GrHandle, int x1, int y1, int x2, int y2, const TCHAR * FileName, int CompressionLevel)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveDrawValidGraphToPNG 項を参照。

%index
dx_DeleteVertexBuffer
DxLib DeleteVertexBuffer (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int VertexBufHandle
%inst
DxLib の DeleteVertexBuffer() を呼び出します。
^p
元関数シグネチャ: int DeleteVertexBuffer(int VertexBufHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteVertexBuffer 項を参照。

%index
dx_InitVertexBuffer
DxLib InitVertexBuffer (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
(引数なし)
%inst
DxLib の InitVertexBuffer() を呼び出します。
^p
元関数シグネチャ: int InitVertexBuffer(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitVertexBuffer 項を参照。

%index
dx_UpdateVertexBuffer
DxLib UpdateVertexBuffer (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int VertexBufHandle
p2 : int UpdateStartIndex
p3 : int UpdateVertexNum
%inst
DxLib の UpdateVertexBuffer() を呼び出します。
^p
元関数シグネチャ: int UpdateVertexBuffer(int VertexBufHandle, int UpdateStartIndex, int UpdateVertexNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の UpdateVertexBuffer 項を参照。

%index
dx_DeleteIndexBuffer
DxLib DeleteIndexBuffer (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int IndexBufHandle
%inst
DxLib の DeleteIndexBuffer() を呼び出します。
^p
元関数シグネチャ: int DeleteIndexBuffer(int IndexBufHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteIndexBuffer 項を参照。

%index
dx_InitIndexBuffer
DxLib InitIndexBuffer (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の InitIndexBuffer() を呼び出します。
^p
元関数シグネチャ: int InitIndexBuffer(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitIndexBuffer 項を参照。

%index
dx_UpdateIndexBuffer
DxLib UpdateIndexBuffer (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int IndexBufHandle
p2 : int UpdateStartIndex
p3 : int UpdateIndexNum
%inst
DxLib の UpdateIndexBuffer() を呼び出します。
^p
元関数シグネチャ: int UpdateIndexBuffer(int IndexBufHandle, int UpdateStartIndex, int UpdateIndexNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の UpdateIndexBuffer 項を参照。

%index
dx_GetMaxPrimitiveCount
DxLib GetMaxPrimitiveCount (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetMaxPrimitiveCount() を呼び出します。
^p
元関数シグネチャ: int GetMaxPrimitiveCount(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMaxPrimitiveCount 項を参照。

%index
dx_GetMaxVertexIndex
DxLib GetMaxVertexIndex (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
(引数なし)
%inst
DxLib の GetMaxVertexIndex() を呼び出します。
^p
元関数シグネチャ: int GetMaxVertexIndex(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMaxVertexIndex 項を参照。

%index
dx_GetValidShaderVersion
DxLib GetValidShaderVersion (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
(引数なし)
%inst
DxLib の GetValidShaderVersion() を呼び出します。
^p
元関数シグネチャ: int GetValidShaderVersion(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetValidShaderVersion 項を参照。

%index
dx_LoadVertexShader
DxLib LoadVertexShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : str FileName
%inst
DxLib の LoadVertexShader() を呼び出します。
^p
元関数シグネチャ: int LoadVertexShader(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadVertexShader 項を参照。

%index
dx_LoadGeometryShader
DxLib LoadGeometryShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : str FileName
%inst
DxLib の LoadGeometryShader() を呼び出します。
^p
元関数シグネチャ: int LoadGeometryShader(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadGeometryShader 項を参照。

%index
dx_LoadPixelShader
DxLib LoadPixelShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : str FileName
%inst
DxLib の LoadPixelShader() を呼び出します。
^p
元関数シグネチャ: int LoadPixelShader(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadPixelShader 項を参照。

%index
dx_DeleteShader
DxLib DeleteShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int ShaderHandle
%inst
DxLib の DeleteShader() を呼び出します。
^p
元関数シグネチャ: int DeleteShader(int ShaderHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteShader 項を参照。

%index
dx_InitShader
DxLib InitShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
(引数なし)
%inst
DxLib の InitShader() を呼び出します。
^p
元関数シグネチャ: int InitShader(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitShader 項を参照。

%index
dx_GetConstIndexToShader
DxLib GetConstIndexToShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : str ConstantName
p2 : int ShaderHandle
%inst
DxLib の GetConstIndexToShader() を呼び出します。
^p
元関数シグネチャ: int GetConstIndexToShader(const TCHAR * ConstantName, int ShaderHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetConstIndexToShader 項を参照。

%index
dx_GetConstCountToShader
DxLib GetConstCountToShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : str ConstantName
p2 : int ShaderHandle
%inst
DxLib の GetConstCountToShader() を呼び出します。
^p
元関数シグネチャ: int GetConstCountToShader(const TCHAR * ConstantName, int ShaderHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetConstCountToShader 項を参照。

%index
dx_SetVSConstSF
DxLib SetVSConstSF (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : double (float 縮小) Param
%inst
DxLib の SetVSConstSF() を呼び出します。
^p
元関数シグネチャ: int SetVSConstSF(int ConstantIndex, float Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVSConstSF 項を参照。

%index
dx_SetVSConstF
DxLib SetVSConstF (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : var (FLOAT4) Param
%inst
DxLib の SetVSConstF() を呼び出します。
^p
元関数シグネチャ: int SetVSConstF(int ConstantIndex, FLOAT4 Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVSConstF 項を参照。

%index
dx_SetVSConstFMtx
DxLib SetVSConstFMtx (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : var (MATRIX: 4x4 float) Param
%inst
DxLib の SetVSConstFMtx() を呼び出します。
^p
元関数シグネチャ: int SetVSConstFMtx(int ConstantIndex, MATRIX Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVSConstFMtx 項を参照。

%index
dx_SetVSConstFMtxT
DxLib SetVSConstFMtxT (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : var (MATRIX: 4x4 float) Param
%inst
DxLib の SetVSConstFMtxT() を呼び出します。
^p
元関数シグネチャ: int SetVSConstFMtxT(int ConstantIndex, MATRIX Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVSConstFMtxT 項を参照。

%index
dx_SetVSConstSI
DxLib SetVSConstSI (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : int Param
%inst
DxLib の SetVSConstSI() を呼び出します。
^p
元関数シグネチャ: int SetVSConstSI(int ConstantIndex, int Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVSConstSI 項を参照。

%index
dx_ResetVSConstF
DxLib ResetVSConstF (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int ConstantIndex
p2 : int ParamNum
%inst
DxLib の ResetVSConstF() を呼び出します。
^p
元関数シグネチャ: int ResetVSConstF(int ConstantIndex, int ParamNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetVSConstF 項を参照。

%index
dx_ResetVSConstI
DxLib ResetVSConstI (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int ConstantIndex
p2 : int ParamNum
%inst
DxLib の ResetVSConstI() を呼び出します。
^p
元関数シグネチャ: int ResetVSConstI(int ConstantIndex, int ParamNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetVSConstI 項を参照。

%index
dx_ResetVSConstB
DxLib ResetVSConstB (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int ConstantIndex
p2 : int ParamNum
%inst
DxLib の ResetVSConstB() を呼び出します。
^p
元関数シグネチャ: int ResetVSConstB(int ConstantIndex, int ParamNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetVSConstB 項を参照。

%index
dx_SetPSConstSF
DxLib SetPSConstSF (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : double (float 縮小) Param
%inst
DxLib の SetPSConstSF() を呼び出します。
^p
元関数シグネチャ: int SetPSConstSF(int ConstantIndex, float Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetPSConstSF 項を参照。

%index
dx_SetPSConstF
DxLib SetPSConstF (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : var (FLOAT4) Param
%inst
DxLib の SetPSConstF() を呼び出します。
^p
元関数シグネチャ: int SetPSConstF(int ConstantIndex, FLOAT4 Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetPSConstF 項を参照。

%index
dx_SetPSConstFMtx
DxLib SetPSConstFMtx (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : var (MATRIX: 4x4 float) Param
%inst
DxLib の SetPSConstFMtx() を呼び出します。
^p
元関数シグネチャ: int SetPSConstFMtx(int ConstantIndex, MATRIX Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetPSConstFMtx 項を参照。

%index
dx_SetPSConstFMtxT
DxLib SetPSConstFMtxT (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : var (MATRIX: 4x4 float) Param
%inst
DxLib の SetPSConstFMtxT() を呼び出します。
^p
元関数シグネチャ: int SetPSConstFMtxT(int ConstantIndex, MATRIX Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetPSConstFMtxT 項を参照。

%index
dx_SetPSConstSI
DxLib SetPSConstSI (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ConstantIndex
p2 : int Param
%inst
DxLib の SetPSConstSI() を呼び出します。
^p
元関数シグネチャ: int SetPSConstSI(int ConstantIndex, int Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetPSConstSI 項を参照。

%index
dx_ResetPSConstF
DxLib ResetPSConstF (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int ConstantIndex
p2 : int ParamNum
%inst
DxLib の ResetPSConstF() を呼び出します。
^p
元関数シグネチャ: int ResetPSConstF(int ConstantIndex, int ParamNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetPSConstF 項を参照。

%index
dx_ResetPSConstI
DxLib ResetPSConstI (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int ConstantIndex
p2 : int ParamNum
%inst
DxLib の ResetPSConstI() を呼び出します。
^p
元関数シグネチャ: int ResetPSConstI(int ConstantIndex, int ParamNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetPSConstI 項を参照。

%index
dx_ResetPSConstB
DxLib ResetPSConstB (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int ConstantIndex
p2 : int ParamNum
%inst
DxLib の ResetPSConstB() を呼び出します。
^p
元関数シグネチャ: int ResetPSConstB(int ConstantIndex, int ParamNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetPSConstB 項を参照。

%index
dx_SetRenderTargetToShader
DxLib SetRenderTargetToShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int TargetIndex
p2 : int DrawScreen
p3 : int SurfaceIndex (default 0)
p4 : int MipLevel (default 0)
%inst
DxLib の SetRenderTargetToShader() を呼び出します。
^p
元関数シグネチャ: int SetRenderTargetToShader(int TargetIndex, int DrawScreen, int SurfaceIndex, int MipLevel)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetRenderTargetToShader 項を参照。

%index
dx_SetUseTextureToShader
DxLib SetUseTextureToShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int StageIndex
p2 : int GraphHandle
%inst
DxLib の SetUseTextureToShader() を呼び出します。
^p
元関数シグネチャ: int SetUseTextureToShader(int StageIndex, int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseTextureToShader 項を参照。

%index
dx_SetUseVertexShader
DxLib SetUseVertexShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int ShaderHandle
%inst
DxLib の SetUseVertexShader() を呼び出します。
^p
元関数シグネチャ: int SetUseVertexShader(int ShaderHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseVertexShader 項を参照。

%index
dx_SetUseGeometryShader
DxLib SetUseGeometryShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int ShaderHandle
%inst
DxLib の SetUseGeometryShader() を呼び出します。
^p
元関数シグネチャ: int SetUseGeometryShader(int ShaderHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseGeometryShader 項を参照。

%index
dx_SetUsePixelShader
DxLib SetUsePixelShader (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int ShaderHandle
%inst
DxLib の SetUsePixelShader() を呼び出します。
^p
元関数シグネチャ: int SetUsePixelShader(int ShaderHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUsePixelShader 項を参照。

%index
dx_DrawBillboard3DToShader
DxLib DrawBillboard3DToShader (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Pos
p2 : double (float 縮小) cx
p3 : double (float 縮小) cy
p4 : double (float 縮小) Size
p5 : double (float 縮小) Angle
p6 : int GrHandle
p7 : int TransFlag
p8 : int ReverseXFlag (default FALSE)
p9 : int ReverseYFlag (default FALSE)
%inst
DxLib の DrawBillboard3DToShader() を呼び出します。
^p
元関数シグネチャ: int DrawBillboard3DToShader(VECTOR Pos, float cx, float cy, float Size, float Angle, int GrHandle, int TransFlag, int ReverseXFlag, int ReverseYFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawBillboard3DToShader 項を参照。

%index
dx_DrawPolygon3DToShader_UseVertexBuffer
DxLib DrawPolygon3DToShader_UseVertexBuffer (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int VertexBufHandle
%inst
DxLib の DrawPolygon3DToShader_UseVertexBuffer() を呼び出します。
^p
元関数シグネチャ: int DrawPolygon3DToShader_UseVertexBuffer(int VertexBufHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPolygon3DToShader_UseVertexBuffer 項を参照。

%index
dx_DrawPolygonIndexed3DToShader_UseVertexBuffer
DxLib DrawPolygonIndexed3DToShader_UseVertexBuffer (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int VertexBufHandle
p2 : int IndexBufHandle
%inst
DxLib の DrawPolygonIndexed3DToShader_UseVertexBuffer() を呼び出します。
^p
元関数シグネチャ: int DrawPolygonIndexed3DToShader_UseVertexBuffer(int VertexBufHandle, int IndexBufHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPolygonIndexed3DToShader_UseVertexBuffer 項を参照。

%index
dx_InitShaderConstantBuffer
DxLib InitShaderConstantBuffer (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
(引数なし)
%inst
DxLib の InitShaderConstantBuffer() を呼び出します。
^p
元関数シグネチャ: int InitShaderConstantBuffer(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitShaderConstantBuffer 項を参照。

%index
dx_CreateShaderConstantBuffer
DxLib CreateShaderConstantBuffer (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int BufferSize
%inst
DxLib の CreateShaderConstantBuffer() を呼び出します。
^p
元関数シグネチャ: int CreateShaderConstantBuffer(int BufferSize)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CreateShaderConstantBuffer 項を参照。

%index
dx_DeleteShaderConstantBuffer
DxLib DeleteShaderConstantBuffer (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int SConstBufHandle
%inst
DxLib の DeleteShaderConstantBuffer() を呼び出します。
^p
元関数シグネチャ: int DeleteShaderConstantBuffer(int SConstBufHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteShaderConstantBuffer 項を参照。

%index
dx_UpdateShaderConstantBuffer
DxLib UpdateShaderConstantBuffer (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int SConstBufHandle
%inst
DxLib の UpdateShaderConstantBuffer() を呼び出します。
^p
元関数シグネチャ: int UpdateShaderConstantBuffer(int SConstBufHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の UpdateShaderConstantBuffer 項を参照。

%index
dx_SetGraphBlendScalingFilterMode
DxLib SetGraphBlendScalingFilterMode (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int IsBilinearFilter
%inst
DxLib の SetGraphBlendScalingFilterMode() を呼び出します。
^p
元関数シグネチャ: int SetGraphBlendScalingFilterMode(int IsBilinearFilter)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetGraphBlendScalingFilterMode 項を参照。

%index
dx_PlayMovie
DxLib PlayMovie (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : str FileName
p2 : int ExRate
p3 : int PlayType
%inst
DxLib の PlayMovie() を呼び出します。
^p
元関数シグネチャ: int PlayMovie(const TCHAR * FileName, int ExRate, int PlayType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PlayMovie 項を参照。

%index
dx_OpenMovieToGraph
DxLib OpenMovieToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : str FileName
p2 : int FullColor (default TRUE)
%inst
DxLib の OpenMovieToGraph() を呼び出します。
^p
元関数シグネチャ: int OpenMovieToGraph(const TCHAR * FileName, int FullColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の OpenMovieToGraph 項を参照。

%index
dx_AddMovieFrameToGraph
DxLib AddMovieFrameToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
p2 : int (uint 扱い) FrameNum
%inst
DxLib の AddMovieFrameToGraph() を呼び出します。
^p
元関数シグネチャ: int AddMovieFrameToGraph(int GraphHandle, unsigned int FrameNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の AddMovieFrameToGraph 項を参照。

%index
dx_SeekMovieToGraph
DxLib SeekMovieToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
p2 : int Time
%inst
DxLib の SeekMovieToGraph() を呼び出します。
^p
元関数シグネチャ: int SeekMovieToGraph(int GraphHandle, int Time)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SeekMovieToGraph 項を参照。

%index
dx_SetPlaySpeedRateMovieToGraph
DxLib SetPlaySpeedRateMovieToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
p2 : double SpeedRate
%inst
DxLib の SetPlaySpeedRateMovieToGraph() を呼び出します。
^p
元関数シグネチャ: int SetPlaySpeedRateMovieToGraph(int GraphHandle, double SpeedRate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetPlaySpeedRateMovieToGraph 項を参照。

%index
dx_GetMovieStateToGraph
DxLib GetMovieStateToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
%inst
DxLib の GetMovieStateToGraph() を呼び出します。
^p
元関数シグネチャ: int GetMovieStateToGraph(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMovieStateToGraph 項を参照。

%index
dx_SetMovieVolumeToGraph
DxLib SetMovieVolumeToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int Volume
p2 : int GraphHandle
%inst
DxLib の SetMovieVolumeToGraph() を呼び出します。
^p
元関数シグネチャ: int SetMovieVolumeToGraph(int Volume, int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMovieVolumeToGraph 項を参照。

%index
dx_GetMovieVolumeToGraph
DxLib GetMovieVolumeToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
%inst
DxLib の GetMovieVolumeToGraph() を呼び出します。
^p
元関数シグネチャ: int GetMovieVolumeToGraph(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMovieVolumeToGraph 項を参照。

%index
dx_ChangeMovieVolumeToGraph
DxLib ChangeMovieVolumeToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int Volume
p2 : int GraphHandle
%inst
DxLib の ChangeMovieVolumeToGraph() を呼び出します。
^p
元関数シグネチャ: int ChangeMovieVolumeToGraph(int Volume, int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeMovieVolumeToGraph 項を参照。

%index
dx_GetMovieVolumeToGraph2
DxLib GetMovieVolumeToGraph2 (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
%inst
DxLib の GetMovieVolumeToGraph2() を呼び出します。
^p
元関数シグネチャ: int GetMovieVolumeToGraph2(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMovieVolumeToGraph2 項を参照。

%index
dx_GetMovieTotalFrameToGraph
DxLib GetMovieTotalFrameToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
%inst
DxLib の GetMovieTotalFrameToGraph() を呼び出します。
^p
元関数シグネチャ: int GetMovieTotalFrameToGraph(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMovieTotalFrameToGraph 項を参照。

%index
dx_TellMovieToGraph
DxLib TellMovieToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
%inst
DxLib の TellMovieToGraph() を呼び出します。
^p
元関数シグネチャ: int TellMovieToGraph(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の TellMovieToGraph 項を参照。

%index
dx_TellMovieToGraphToFrame
DxLib TellMovieToGraphToFrame (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
%inst
DxLib の TellMovieToGraphToFrame() を呼び出します。
^p
元関数シグネチャ: int TellMovieToGraphToFrame(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の TellMovieToGraphToFrame 項を参照。

%index
dx_SeekMovieToGraphToFrame
DxLib SeekMovieToGraphToFrame (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
p2 : int Frame
%inst
DxLib の SeekMovieToGraphToFrame() を呼び出します。
^p
元関数シグネチャ: int SeekMovieToGraphToFrame(int GraphHandle, int Frame)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SeekMovieToGraphToFrame 項を参照。

%index
dx_GetLastUpdateTimeMovieToGraph
DxLib GetLastUpdateTimeMovieToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
%inst
DxLib の GetLastUpdateTimeMovieToGraph() を呼び出します。
^p
元関数シグネチャ: int GetLastUpdateTimeMovieToGraph(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLastUpdateTimeMovieToGraph 項を参照。

%index
dx_UpdateMovieToGraph
DxLib UpdateMovieToGraph (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int GraphHandle
%inst
DxLib の UpdateMovieToGraph() を呼び出します。
^p
元関数シグネチャ: int UpdateMovieToGraph(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の UpdateMovieToGraph 項を参照。

%index
dx_SetMovieRightImageAlphaFlag
DxLib SetMovieRightImageAlphaFlag (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int Flag
%inst
DxLib の SetMovieRightImageAlphaFlag() を呼び出します。
^p
元関数シグネチャ: int SetMovieRightImageAlphaFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMovieRightImageAlphaFlag 項を参照。

%index
dx_SetMovieColorA8R8G8B8Flag
DxLib SetMovieColorA8R8G8B8Flag (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int Flag
%inst
DxLib の SetMovieColorA8R8G8B8Flag() を呼び出します。
^p
元関数シグネチャ: int SetMovieColorA8R8G8B8Flag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMovieColorA8R8G8B8Flag 項を参照。

%index
dx_SetMovieUseYUVFormatSurfaceFlag
DxLib SetMovieUseYUVFormatSurfaceFlag (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int Flag
%inst
DxLib の SetMovieUseYUVFormatSurfaceFlag() を呼び出します。
^p
元関数シグネチャ: int SetMovieUseYUVFormatSurfaceFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMovieUseYUVFormatSurfaceFlag 項を参照。

%index
dx_SetCameraNearFar
DxLib SetCameraNearFar (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : double (float 縮小) Near
p2 : double (float 縮小) Far
%inst
DxLib の SetCameraNearFar() を呼び出します。
^p
元関数シグネチャ: int SetCameraNearFar(float Near, float Far)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraNearFar 項を参照。

%index
dx_SetCameraNearFarD
DxLib SetCameraNearFarD (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : double Near
p2 : double Far
%inst
DxLib の SetCameraNearFarD() を呼び出します。
^p
元関数シグネチャ: int SetCameraNearFarD(double Near, double Far)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraNearFarD 項を参照。

%index
dx_SetCameraPositionAndTarget_UpVecYD
DxLib SetCameraPositionAndTarget_UpVecYD (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Position
p2 : var (VECTOR_D: #defstruct double x,y,z) Target
%inst
DxLib の SetCameraPositionAndTarget_UpVecYD() を呼び出します。
^p
元関数シグネチャ: int SetCameraPositionAndTarget_UpVecYD(VECTOR_D Position, VECTOR_D Target)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraPositionAndTarget_UpVecYD 項を参照。

%index
dx_SetCameraPositionAndTargetAndUpVec
DxLib SetCameraPositionAndTargetAndUpVec (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : var (VECTOR: #defstruct float x,y,z) TargetPosition
p3 : var (VECTOR: #defstruct float x,y,z) UpVector
%inst
DxLib の SetCameraPositionAndTargetAndUpVec() を呼び出します。
^p
元関数シグネチャ: int SetCameraPositionAndTargetAndUpVec(VECTOR Position, VECTOR TargetPosition, VECTOR UpVector)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraPositionAndTargetAndUpVec 項を参照。

%index
dx_SetCameraPositionAndTargetAndUpVecD
DxLib SetCameraPositionAndTargetAndUpVecD (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Position
p2 : var (VECTOR_D: #defstruct double x,y,z) TargetPosition
p3 : var (VECTOR_D: #defstruct double x,y,z) UpVector
%inst
DxLib の SetCameraPositionAndTargetAndUpVecD() を呼び出します。
^p
元関数シグネチャ: int SetCameraPositionAndTargetAndUpVecD(VECTOR_D Position, VECTOR_D TargetPosition, VECTOR_D UpVector)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraPositionAndTargetAndUpVecD 項を参照。

%index
dx_SetCameraPositionAndAngle
DxLib SetCameraPositionAndAngle (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : double (float 縮小) VRotate
p3 : double (float 縮小) HRotate
p4 : double (float 縮小) TRotate
%inst
DxLib の SetCameraPositionAndAngle() を呼び出します。
^p
元関数シグネチャ: int SetCameraPositionAndAngle(VECTOR Position, float VRotate, float HRotate, float TRotate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraPositionAndAngle 項を参照。

%index
dx_SetCameraPositionAndAngleD
DxLib SetCameraPositionAndAngleD (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Position
p2 : double VRotate
p3 : double HRotate
p4 : double TRotate
%inst
DxLib の SetCameraPositionAndAngleD() を呼び出します。
^p
元関数シグネチャ: int SetCameraPositionAndAngleD(VECTOR_D Position, double VRotate, double HRotate, double TRotate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraPositionAndAngleD 項を参照。

%index
dx_SetCameraViewMatrix
DxLib SetCameraViewMatrix (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : var (MATRIX: 4x4 float) ViewMatrix
%inst
DxLib の SetCameraViewMatrix() を呼び出します。
^p
元関数シグネチャ: int SetCameraViewMatrix(MATRIX ViewMatrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraViewMatrix 項を参照。

%index
dx_SetCameraViewMatrixD
DxLib SetCameraViewMatrixD (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : var (MATRIX_D: 4x4 double) ViewMatrix
%inst
DxLib の SetCameraViewMatrixD() を呼び出します。
^p
元関数シグネチャ: int SetCameraViewMatrixD(MATRIX_D ViewMatrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraViewMatrixD 項を参照。

%index
dx_SetCameraScreenCenter
DxLib SetCameraScreenCenter (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
%inst
DxLib の SetCameraScreenCenter() を呼び出します。
^p
元関数シグネチャ: int SetCameraScreenCenter(float x, float y)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraScreenCenter 項を参照。

%index
dx_SetCameraScreenCenterD
DxLib SetCameraScreenCenterD (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : double x
p2 : double y
%inst
DxLib の SetCameraScreenCenterD() を呼び出します。
^p
元関数シグネチャ: int SetCameraScreenCenterD(double x, double y)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraScreenCenterD 項を参照。

%index
dx_SetupCamera_PerspectiveD
DxLib SetupCamera_PerspectiveD (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double Fov
%inst
DxLib の SetupCamera_PerspectiveD() を呼び出します。
^p
元関数シグネチャ: int SetupCamera_PerspectiveD(double Fov)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetupCamera_PerspectiveD 項を参照。

%index
dx_SetupCamera_Ortho
DxLib SetupCamera_Ortho (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double (float 縮小) Size
%inst
DxLib の SetupCamera_Ortho() を呼び出します。
^p
元関数シグネチャ: int SetupCamera_Ortho(float Size)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetupCamera_Ortho 項を参照。

%index
dx_SetupCamera_OrthoD
DxLib SetupCamera_OrthoD (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double Size
%inst
DxLib の SetupCamera_OrthoD() を呼び出します。
^p
元関数シグネチャ: int SetupCamera_OrthoD(double Size)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetupCamera_OrthoD 項を参照。

%index
dx_SetupCamera_ProjectionMatrix
DxLib SetupCamera_ProjectionMatrix (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : var (MATRIX: 4x4 float) ProjectionMatrix
%inst
DxLib の SetupCamera_ProjectionMatrix() を呼び出します。
^p
元関数シグネチャ: int SetupCamera_ProjectionMatrix(MATRIX ProjectionMatrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetupCamera_ProjectionMatrix 項を参照。

%index
dx_SetupCamera_ProjectionMatrixD
DxLib SetupCamera_ProjectionMatrixD (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : var (MATRIX_D: 4x4 double) ProjectionMatrix
%inst
DxLib の SetupCamera_ProjectionMatrixD() を呼び出します。
^p
元関数シグネチャ: int SetupCamera_ProjectionMatrixD(MATRIX_D ProjectionMatrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetupCamera_ProjectionMatrixD 項を参照。

%index
dx_SetCameraDotAspect
DxLib SetCameraDotAspect (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : double (float 縮小) DotAspect
%inst
DxLib の SetCameraDotAspect() を呼び出します。
^p
元関数シグネチャ: int SetCameraDotAspect(float DotAspect)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraDotAspect 項を参照。

%index
dx_SetCameraDotAspectD
DxLib SetCameraDotAspectD (自動生成、hsp3dx 専用)
%group
DxLib カメラ
%prm
p1 : double DotAspect
%inst
DxLib の SetCameraDotAspectD() を呼び出します。
^p
元関数シグネチャ: int SetCameraDotAspectD(double DotAspect)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCameraDotAspectD 項を参照。

%index
dx_CheckCameraViewClip
DxLib CheckCameraViewClip (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) CheckPos
%inst
DxLib の CheckCameraViewClip() を呼び出します。
^p
元関数シグネチャ: int CheckCameraViewClip(VECTOR CheckPos)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckCameraViewClip 項を参照。

%index
dx_CheckCameraViewClipD
DxLib CheckCameraViewClipD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) CheckPos
%inst
DxLib の CheckCameraViewClipD() を呼び出します。
^p
元関数シグネチャ: int CheckCameraViewClipD(VECTOR_D CheckPos)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckCameraViewClipD 項を参照。

%index
dx_CheckCameraViewClip_Dir
DxLib CheckCameraViewClip_Dir (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) CheckPos
%inst
DxLib の CheckCameraViewClip_Dir() を呼び出します。
^p
元関数シグネチャ: int CheckCameraViewClip_Dir(VECTOR CheckPos)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckCameraViewClip_Dir 項を参照。

%index
dx_CheckCameraViewClip_DirD
DxLib CheckCameraViewClip_DirD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) CheckPos
%inst
DxLib の CheckCameraViewClip_DirD() を呼び出します。
^p
元関数シグネチャ: int CheckCameraViewClip_DirD(VECTOR_D CheckPos)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckCameraViewClip_DirD 項を参照。

%index
dx_CheckCameraViewClip_Box
DxLib CheckCameraViewClip_Box (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) BoxPos1
p2 : var (VECTOR: #defstruct float x,y,z) BoxPos2
%inst
DxLib の CheckCameraViewClip_Box() を呼び出します。
^p
元関数シグネチャ: int CheckCameraViewClip_Box(VECTOR BoxPos1, VECTOR BoxPos2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckCameraViewClip_Box 項を参照。

%index
dx_CheckCameraViewClip_BoxD
DxLib CheckCameraViewClip_BoxD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) BoxPos1
p2 : var (VECTOR_D: #defstruct double x,y,z) BoxPos2
%inst
DxLib の CheckCameraViewClip_BoxD() を呼び出します。
^p
元関数シグネチャ: int CheckCameraViewClip_BoxD(VECTOR_D BoxPos1, VECTOR_D BoxPos2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckCameraViewClip_BoxD 項を参照。

%index
dx_SetMaterialUseVertDifColor
DxLib SetMaterialUseVertDifColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetMaterialUseVertDifColor() を呼び出します。
^p
元関数シグネチャ: int SetMaterialUseVertDifColor(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMaterialUseVertDifColor 項を参照。

%index
dx_SetMaterialUseVertSpcColor
DxLib SetMaterialUseVertSpcColor (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetMaterialUseVertSpcColor() を呼び出します。
^p
元関数シグネチャ: int SetMaterialUseVertSpcColor(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMaterialUseVertSpcColor 項を参照。

%index
dx_SetUseSpecular
DxLib SetUseSpecular (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetUseSpecular() を呼び出します。
^p
元関数シグネチャ: int SetUseSpecular(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseSpecular 項を参照。

%index
dx_SetGlobalAmbientLight
DxLib SetGlobalAmbientLight (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の SetGlobalAmbientLight() を呼び出します。
^p
元関数シグネチャ: int SetGlobalAmbientLight(COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetGlobalAmbientLight 項を参照。

%index
dx_SetUseLightAngleAttenuation
DxLib SetUseLightAngleAttenuation (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int UseFlag
%inst
DxLib の SetUseLightAngleAttenuation() を呼び出します。
^p
元関数シグネチャ: int SetUseLightAngleAttenuation(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseLightAngleAttenuation 項を参照。

%index
dx_SetUseHalfLambertLighting
DxLib SetUseHalfLambertLighting (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int UseFlag
%inst
DxLib の SetUseHalfLambertLighting() を呼び出します。
^p
元関数シグネチャ: int SetUseHalfLambertLighting(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseHalfLambertLighting 項を参照。

%index
dx_ChangeLightTypeDir
DxLib ChangeLightTypeDir (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Direction
%inst
DxLib の ChangeLightTypeDir() を呼び出します。
^p
元関数シグネチャ: int ChangeLightTypeDir(VECTOR Direction)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeLightTypeDir 項を参照。

%index
dx_ChangeLightTypeSpot
DxLib ChangeLightTypeSpot (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : var (VECTOR: #defstruct float x,y,z) Direction
p3 : double (float 縮小) OutAngle
p4 : double (float 縮小) InAngle
p5 : double (float 縮小) Range
p6 : double (float 縮小) Atten0
p7 : double (float 縮小) Atten1
p8 : double (float 縮小) Atten2
%inst
DxLib の ChangeLightTypeSpot() を呼び出します。
^p
元関数シグネチャ: int ChangeLightTypeSpot(VECTOR Position, VECTOR Direction, float OutAngle, float InAngle, float Range, float Atten0, float Atten1, float Atten2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeLightTypeSpot 項を参照。

%index
dx_ChangeLightTypePoint
DxLib ChangeLightTypePoint (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : double (float 縮小) Range
p3 : double (float 縮小) Atten0
p4 : double (float 縮小) Atten1
p5 : double (float 縮小) Atten2
%inst
DxLib の ChangeLightTypePoint() を呼び出します。
^p
元関数シグネチャ: int ChangeLightTypePoint(VECTOR Position, float Range, float Atten0, float Atten1, float Atten2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeLightTypePoint 項を参照。

%index
dx_GetLightType
DxLib GetLightType (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
(引数なし)
%inst
DxLib の GetLightType() を呼び出します。
^p
元関数シグネチャ: int GetLightType(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLightType 項を参照。

%index
dx_SetLightEnable
DxLib SetLightEnable (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int EnableFlag
%inst
DxLib の SetLightEnable() を呼び出します。
^p
元関数シグネチャ: int SetLightEnable(int EnableFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightEnable 項を参照。

%index
dx_GetLightEnable
DxLib GetLightEnable (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
(引数なし)
%inst
DxLib の GetLightEnable() を呼び出します。
^p
元関数シグネチャ: int GetLightEnable(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLightEnable 項を参照。

%index
dx_SetLightDifColor
DxLib SetLightDifColor (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の SetLightDifColor() を呼び出します。
^p
元関数シグネチャ: int SetLightDifColor(COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightDifColor 項を参照。

%index
dx_SetLightSpcColor
DxLib SetLightSpcColor (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の SetLightSpcColor() を呼び出します。
^p
元関数シグネチャ: int SetLightSpcColor(COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightSpcColor 項を参照。

%index
dx_SetLightAmbColor
DxLib SetLightAmbColor (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の SetLightAmbColor() を呼び出します。
^p
元関数シグネチャ: int SetLightAmbColor(COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightAmbColor 項を参照。

%index
dx_SetLightPosition
DxLib SetLightPosition (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
%inst
DxLib の SetLightPosition() を呼び出します。
^p
元関数シグネチャ: int SetLightPosition(VECTOR Position)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightPosition 項を参照。

%index
dx_SetLightRangeAtten
DxLib SetLightRangeAtten (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : double (float 縮小) Range
p2 : double (float 縮小) Atten0
p3 : double (float 縮小) Atten1
p4 : double (float 縮小) Atten2
%inst
DxLib の SetLightRangeAtten() を呼び出します。
^p
元関数シグネチャ: int SetLightRangeAtten(float Range, float Atten0, float Atten1, float Atten2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightRangeAtten 項を参照。

%index
dx_SetLightAngle
DxLib SetLightAngle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : double (float 縮小) OutAngle
p2 : double (float 縮小) InAngle
%inst
DxLib の SetLightAngle() を呼び出します。
^p
元関数シグネチャ: int SetLightAngle(float OutAngle, float InAngle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightAngle 項を参照。

%index
dx_SetLightUseShadowMap
DxLib SetLightUseShadowMap (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int SmSlotIndex
p2 : int UseFlag
%inst
DxLib の SetLightUseShadowMap() を呼び出します。
^p
元関数シグネチャ: int SetLightUseShadowMap(int SmSlotIndex, int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightUseShadowMap 項を参照。

%index
dx_CreateDirLightHandle
DxLib CreateDirLightHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Direction
%inst
DxLib の CreateDirLightHandle() を呼び出します。
^p
元関数シグネチャ: int CreateDirLightHandle(VECTOR Direction)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CreateDirLightHandle 項を参照。

%index
dx_CreateSpotLightHandle
DxLib CreateSpotLightHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : var (VECTOR: #defstruct float x,y,z) Direction
p3 : double (float 縮小) OutAngle
p4 : double (float 縮小) InAngle
p5 : double (float 縮小) Range
p6 : double (float 縮小) Atten0
p7 : double (float 縮小) Atten1
p8 : double (float 縮小) Atten2
%inst
DxLib の CreateSpotLightHandle() を呼び出します。
^p
元関数シグネチャ: int CreateSpotLightHandle(VECTOR Position, VECTOR Direction, float OutAngle, float InAngle, float Range, float Atten0, float Atten1, float Atten2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CreateSpotLightHandle 項を参照。

%index
dx_CreatePointLightHandle
DxLib CreatePointLightHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : double (float 縮小) Range
p3 : double (float 縮小) Atten0
p4 : double (float 縮小) Atten1
p5 : double (float 縮小) Atten2
%inst
DxLib の CreatePointLightHandle() を呼び出します。
^p
元関数シグネチャ: int CreatePointLightHandle(VECTOR Position, float Range, float Atten0, float Atten1, float Atten2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CreatePointLightHandle 項を参照。

%index
dx_DeleteLightHandle
DxLib DeleteLightHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
%inst
DxLib の DeleteLightHandle() を呼び出します。
^p
元関数シグネチャ: int DeleteLightHandle(int LHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteLightHandle 項を参照。

%index
dx_DeleteLightHandleAll
DxLib DeleteLightHandleAll (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
(引数なし)
%inst
DxLib の DeleteLightHandleAll() を呼び出します。
^p
元関数シグネチャ: int DeleteLightHandleAll(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteLightHandleAll 項を参照。

%index
dx_SetLightTypeHandle
DxLib SetLightTypeHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : int LightType
%inst
DxLib の SetLightTypeHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightTypeHandle(int LHandle, int LightType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightTypeHandle 項を参照。

%index
dx_SetLightEnableHandle
DxLib SetLightEnableHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : int EnableFlag
%inst
DxLib の SetLightEnableHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightEnableHandle(int LHandle, int EnableFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightEnableHandle 項を参照。

%index
dx_SetLightDifColorHandle
DxLib SetLightDifColorHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の SetLightDifColorHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightDifColorHandle(int LHandle, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightDifColorHandle 項を参照。

%index
dx_SetLightSpcColorHandle
DxLib SetLightSpcColorHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の SetLightSpcColorHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightSpcColorHandle(int LHandle, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightSpcColorHandle 項を参照。

%index
dx_SetLightAmbColorHandle
DxLib SetLightAmbColorHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の SetLightAmbColorHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightAmbColorHandle(int LHandle, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightAmbColorHandle 項を参照。

%index
dx_SetLightDirectionHandle
DxLib SetLightDirectionHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : var (VECTOR: #defstruct float x,y,z) Direction
%inst
DxLib の SetLightDirectionHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightDirectionHandle(int LHandle, VECTOR Direction)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightDirectionHandle 項を参照。

%index
dx_SetLightPositionHandle
DxLib SetLightPositionHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : var (VECTOR: #defstruct float x,y,z) Position
%inst
DxLib の SetLightPositionHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightPositionHandle(int LHandle, VECTOR Position)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightPositionHandle 項を参照。

%index
dx_SetLightRangeAttenHandle
DxLib SetLightRangeAttenHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : double (float 縮小) Range
p3 : double (float 縮小) Atten0
p4 : double (float 縮小) Atten1
p5 : double (float 縮小) Atten2
%inst
DxLib の SetLightRangeAttenHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightRangeAttenHandle(int LHandle, float Range, float Atten0, float Atten1, float Atten2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightRangeAttenHandle 項を参照。

%index
dx_SetLightAngleHandle
DxLib SetLightAngleHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : double (float 縮小) OutAngle
p3 : double (float 縮小) InAngle
%inst
DxLib の SetLightAngleHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightAngleHandle(int LHandle, float OutAngle, float InAngle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightAngleHandle 項を参照。

%index
dx_SetLightUseShadowMapHandle
DxLib SetLightUseShadowMapHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
p2 : int SmSlotIndex
p3 : int UseFlag
%inst
DxLib の SetLightUseShadowMapHandle() を呼び出します。
^p
元関数シグネチャ: int SetLightUseShadowMapHandle(int LHandle, int SmSlotIndex, int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLightUseShadowMapHandle 項を参照。

%index
dx_GetLightTypeHandle
DxLib GetLightTypeHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
%inst
DxLib の GetLightTypeHandle() を呼び出します。
^p
元関数シグネチャ: int GetLightTypeHandle(int LHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLightTypeHandle 項を参照。

%index
dx_GetLightEnableHandle
DxLib GetLightEnableHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int LHandle
%inst
DxLib の GetLightEnableHandle() を呼び出します。
^p
元関数シグネチャ: int GetLightEnableHandle(int LHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetLightEnableHandle 項を参照。

%index
dx_GetEnableLightHandleNum
DxLib GetEnableLightHandleNum (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
(引数なし)
%inst
DxLib の GetEnableLightHandleNum() を呼び出します。
^p
元関数シグネチャ: int GetEnableLightHandleNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetEnableLightHandleNum 項を参照。

%index
dx_GetEnableLightHandle
DxLib GetEnableLightHandle (自動生成、hsp3dx 専用)
%group
DxLib ライト
%prm
p1 : int Index
%inst
DxLib の GetEnableLightHandle() を呼び出します。
^p
元関数シグネチャ: int GetEnableLightHandle(int Index)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetEnableLightHandle 項を参照。

%index
dx_CreateMaskScreen
DxLib CreateMaskScreen (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
(引数なし)
%inst
DxLib の CreateMaskScreen() を呼び出します。
^p
元関数シグネチャ: int CreateMaskScreen(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CreateMaskScreen 項を参照。

%index
dx_DeleteMaskScreen
DxLib DeleteMaskScreen (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
(引数なし)
%inst
DxLib の DeleteMaskScreen() を呼び出します。
^p
元関数シグネチャ: int DeleteMaskScreen(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteMaskScreen 項を参照。

%index
dx_SetUseMaskScreenFlag
DxLib SetUseMaskScreenFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ValidFlag
%inst
DxLib の SetUseMaskScreenFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseMaskScreenFlag(int ValidFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseMaskScreenFlag 項を参照。

%index
dx_GetUseMaskScreenFlag
DxLib GetUseMaskScreenFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseMaskScreenFlag() を呼び出します。
^p
元関数シグネチャ: int GetUseMaskScreenFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseMaskScreenFlag 項を参照。

%index
dx_FillMaskScreen
DxLib FillMaskScreen (自動生成、hsp3dx 専用)
%group
DxLib グラフィック
%prm
p1 : int Flag
%inst
DxLib の FillMaskScreen() を呼び出します。
^p
元関数シグネチャ: int FillMaskScreen(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FillMaskScreen 項を参照。

%index
dx_SetMaskScreenGraph
DxLib SetMaskScreenGraph (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int GraphHandle
%inst
DxLib の SetMaskScreenGraph() を呼び出します。
^p
元関数シグネチャ: int SetMaskScreenGraph(int GraphHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMaskScreenGraph 項を参照。

%index
dx_InitMask
DxLib InitMask (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の InitMask() を呼び出します。
^p
元関数シグネチャ: int InitMask(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitMask 項を参照。

%index
dx_MakeMask
DxLib MakeMask (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Width
p2 : int Height
%inst
DxLib の MakeMask() を呼び出します。
^p
元関数シグネチャ: int MakeMask(int Width, int Height)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeMask 項を参照。

%index
dx_DeleteMask
DxLib DeleteMask (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int MaskHandle
%inst
DxLib の DeleteMask() を呼び出します。
^p
元関数シグネチャ: int DeleteMask(int MaskHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteMask 項を参照。

%index
dx_LoadMask
DxLib LoadMask (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FileName
%inst
DxLib の LoadMask() を呼び出します。
^p
元関数シグネチャ: int LoadMask(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadMask 項を参照。

%index
dx_DrawMask
DxLib DrawMask (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int MaskHandle
p4 : int TransMode
%inst
DxLib の DrawMask() を呼び出します。
^p
元関数シグネチャ: int DrawMask(int x, int y, int MaskHandle, int TransMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawMask 項を参照。

%index
dx_DrawStringMask
DxLib DrawStringMask (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int Flag
p4 : str String
%inst
DxLib の DrawStringMask() を呼び出します。
^p
元関数シグネチャ: int DrawStringMask(int x, int y, int Flag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawStringMask 項を参照。

%index
dx_DrawStringMaskToHandle
DxLib DrawStringMaskToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int Flag
p4 : int FontHandle
p5 : str String
%inst
DxLib の DrawStringMaskToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawStringMaskToHandle(int x, int y, int Flag, int FontHandle, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawStringMaskToHandle 項を参照。

%index
dx_DrawFillMask
DxLib DrawFillMask (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int MaskHandle
%inst
DxLib の DrawFillMask() を呼び出します。
^p
元関数シグネチャ: int DrawFillMask(int x1, int y1, int x2, int y2, int MaskHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawFillMask 項を参照。

%index
dx_SetMaskReverseEffectFlag
DxLib SetMaskReverseEffectFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int ReverseFlag
%inst
DxLib の SetMaskReverseEffectFlag() を呼び出します。
^p
元関数シグネチャ: int SetMaskReverseEffectFlag(int ReverseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetMaskReverseEffectFlag 項を参照。

%index
dx_GetMaskScreenData
DxLib GetMaskScreenData (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int MaskHandle
%inst
DxLib の GetMaskScreenData() を呼び出します。
^p
元関数シグネチャ: int GetMaskScreenData(int x1, int y1, int x2, int y2, int MaskHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMaskScreenData 項を参照。

%index
dx_GetMaskUseFlag
DxLib GetMaskUseFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetMaskUseFlag() を呼び出します。
^p
元関数シグネチャ: int GetMaskUseFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMaskUseFlag 項を参照。

%index
dx_EnumFontName
DxLib EnumFontName (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : str NameBuffer
p2 : int NameBufferNum
p3 : int JapanOnlyFlag (default TRUE)
%inst
DxLib の EnumFontName() を呼び出します。
^p
元関数シグネチャ: int EnumFontName(const TCHAR * NameBuffer, int NameBufferNum, int JapanOnlyFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の EnumFontName 項を参照。

%index
dx_InitFontToHandle
DxLib InitFontToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の InitFontToHandle() を呼び出します。
^p
元関数シグネチャ: int InitFontToHandle(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitFontToHandle 項を参照。

%index
dx_LoadFontDataToHandle
DxLib LoadFontDataToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : str FileName
p2 : int EdgeSize (default 0)
%inst
DxLib の LoadFontDataToHandle() を呼び出します。
^p
元関数シグネチャ: int LoadFontDataToHandle(const TCHAR * FileName, int EdgeSize)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadFontDataToHandle 項を参照。

%index
dx_SetFontSpaceToHandle
DxLib SetFontSpaceToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Pixel
p2 : int FontHandle
%inst
DxLib の SetFontSpaceToHandle() を呼び出します。
^p
元関数シグネチャ: int SetFontSpaceToHandle(int Pixel, int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontSpaceToHandle 項を参照。

%index
dx_SetFontLineSpaceToHandle
DxLib SetFontLineSpaceToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Pixel
p2 : int FontHandle
%inst
DxLib の SetFontLineSpaceToHandle() を呼び出します。
^p
元関数シグネチャ: int SetFontLineSpaceToHandle(int Pixel, int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontLineSpaceToHandle 項を参照。

%index
dx_DeleteFontToHandle
DxLib DeleteFontToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の DeleteFontToHandle() を呼び出します。
^p
元関数シグネチャ: int DeleteFontToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteFontToHandle 項を参照。

%index
dx_AddFontImageToHandle
DxLib AddFontImageToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
p2 : str Char
p3 : int GrHandle
p4 : int DrawX
p5 : int DrawY
p6 : int AddX
%inst
DxLib の AddFontImageToHandle() を呼び出します。
^p
元関数シグネチャ: int AddFontImageToHandle(int FontHandle, const TCHAR * Char, int GrHandle, int DrawX, int DrawY, int AddX)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の AddFontImageToHandle 項を参照。

%index
dx_SubFontImageToHandle
DxLib SubFontImageToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
p2 : str Char
%inst
DxLib の SubFontImageToHandle() を呼び出します。
^p
元関数シグネチャ: int SubFontImageToHandle(int FontHandle, const TCHAR * Char)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SubFontImageToHandle 項を参照。

%index
dx_AddSubstitutionFontToHandle
DxLib AddSubstitutionFontToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
p2 : int SubstitutionFontHandle
p3 : int DrawX
p4 : int DrawY
%inst
DxLib の AddSubstitutionFontToHandle() を呼び出します。
^p
元関数シグネチャ: int AddSubstitutionFontToHandle(int FontHandle, int SubstitutionFontHandle, int DrawX, int DrawY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の AddSubstitutionFontToHandle 項を参照。

%index
dx_SubSubstitutionFontToHandle
DxLib SubSubstitutionFontToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
p2 : int SubstitutionFontHandle
%inst
DxLib の SubSubstitutionFontToHandle() を呼び出します。
^p
元関数シグネチャ: int SubSubstitutionFontToHandle(int FontHandle, int SubstitutionFontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SubSubstitutionFontToHandle 項を参照。

%index
dx_ChangeFontFromHandle
DxLib ChangeFontFromHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の ChangeFontFromHandle() を呼び出します。
^p
元関数シグネチャ: int ChangeFontFromHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeFontFromHandle 項を参照。

%index
dx_ChangeFontType
DxLib ChangeFontType (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontType
%inst
DxLib の ChangeFontType() を呼び出します。
^p
元関数シグネチャ: int ChangeFontType(int FontType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeFontType 項を参照。

%index
dx_GetFontSize
DxLib GetFontSize (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontSize() を呼び出します。
^p
元関数シグネチャ: int GetFontSize(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontSize 項を参照。

%index
dx_GetFontEdgeSize
DxLib GetFontEdgeSize (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontEdgeSize() を呼び出します。
^p
元関数シグネチャ: int GetFontEdgeSize(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontEdgeSize 項を参照。

%index
dx_SetFontSpace
DxLib SetFontSpace (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Pixel
%inst
DxLib の SetFontSpace() を呼び出します。
^p
元関数シグネチャ: int SetFontSpace(int Pixel)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontSpace 項を参照。

%index
dx_GetFontSpace
DxLib GetFontSpace (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontSpace() を呼び出します。
^p
元関数シグネチャ: int GetFontSpace(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontSpace 項を参照。

%index
dx_SetFontLineSpace
DxLib SetFontLineSpace (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Pixel
%inst
DxLib の SetFontLineSpace() を呼び出します。
^p
元関数シグネチャ: int SetFontLineSpace(int Pixel)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontLineSpace 項を参照。

%index
dx_GetFontLineSpace
DxLib GetFontLineSpace (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontLineSpace() を呼び出します。
^p
元関数シグネチャ: int GetFontLineSpace(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontLineSpace 項を参照。

%index
dx_SetDefaultFontState
DxLib SetDefaultFontState (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : str FontName
p2 : int Size
p3 : int Thick
p4 : int FontType (default -1)
p5 : int CharSet (default -1)
p6 : int EdgeSize (default -1)
p7 : int Italic (default FALSE)
%inst
DxLib の SetDefaultFontState() を呼び出します。
^p
元関数シグネチャ: int SetDefaultFontState(const TCHAR * FontName, int Size, int Thick, int FontType, int CharSet, int EdgeSize, int Italic)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDefaultFontState 項を参照。

%index
dx_GetDefaultFontHandle
DxLib GetDefaultFontHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetDefaultFontHandle() を呼び出します。
^p
元関数シグネチャ: int GetDefaultFontHandle(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDefaultFontHandle 項を参照。

%index
dx_GetFontMaxCacheCharNum
DxLib GetFontMaxCacheCharNum (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontMaxCacheCharNum() を呼び出します。
^p
元関数シグネチャ: int GetFontMaxCacheCharNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontMaxCacheCharNum 項を参照。

%index
dx_GetFontMaxWidth
DxLib GetFontMaxWidth (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontMaxWidth() を呼び出します。
^p
元関数シグネチャ: int GetFontMaxWidth(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontMaxWidth 項を参照。

%index
dx_GetFontAscent
DxLib GetFontAscent (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontAscent() を呼び出します。
^p
元関数シグネチャ: int GetFontAscent(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontAscent 項を参照。

%index
dx_GetDrawStringWidth
DxLib GetDrawStringWidth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str String
p2 : int StrLen
p3 : int VerticalFlag (default FALSE)
%inst
DxLib の GetDrawStringWidth() を呼び出します。
^p
元関数シグネチャ: int GetDrawStringWidth(const TCHAR * String, int StrLen, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawStringWidth 項を参照。

%index
dx_GetDrawExtendStringWidth
DxLib GetDrawExtendStringWidth (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double ExRateX
p2 : str String
p3 : int StrLen
p4 : int VerticalFlag (default FALSE)
%inst
DxLib の GetDrawExtendStringWidth() を呼び出します。
^p
元関数シグネチャ: int GetDrawExtendStringWidth(double ExRateX, const TCHAR * String, int StrLen, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawExtendStringWidth 項を参照。

%index
dx_GetFontMaxCacheCharNumToHandle
DxLib GetFontMaxCacheCharNumToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の GetFontMaxCacheCharNumToHandle() を呼び出します。
^p
元関数シグネチャ: int GetFontMaxCacheCharNumToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontMaxCacheCharNumToHandle 項を参照。

%index
dx_GetFontMaxWidthToHandle
DxLib GetFontMaxWidthToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の GetFontMaxWidthToHandle() を呼び出します。
^p
元関数シグネチャ: int GetFontMaxWidthToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontMaxWidthToHandle 項を参照。

%index
dx_GetFontAscentToHandle
DxLib GetFontAscentToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の GetFontAscentToHandle() を呼び出します。
^p
元関数シグネチャ: int GetFontAscentToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontAscentToHandle 項を参照。

%index
dx_GetFontSizeToHandle
DxLib GetFontSizeToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の GetFontSizeToHandle() を呼び出します。
^p
元関数シグネチャ: int GetFontSizeToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontSizeToHandle 項を参照。

%index
dx_GetFontEdgeSizeToHandle
DxLib GetFontEdgeSizeToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の GetFontEdgeSizeToHandle() を呼び出します。
^p
元関数シグネチャ: int GetFontEdgeSizeToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontEdgeSizeToHandle 項を参照。

%index
dx_GetFontSpaceToHandle
DxLib GetFontSpaceToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の GetFontSpaceToHandle() を呼び出します。
^p
元関数シグネチャ: int GetFontSpaceToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontSpaceToHandle 項を参照。

%index
dx_GetFontLineSpaceToHandle
DxLib GetFontLineSpaceToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の GetFontLineSpaceToHandle() を呼び出します。
^p
元関数シグネチャ: int GetFontLineSpaceToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontLineSpaceToHandle 項を参照。

%index
dx_GetDrawStringWidthToHandle
DxLib GetDrawStringWidthToHandle (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str String
p2 : int StrLen
p3 : int FontHandle
p4 : int VerticalFlag (default FALSE)
%inst
DxLib の GetDrawStringWidthToHandle() を呼び出します。
^p
元関数シグネチャ: int GetDrawStringWidthToHandle(const TCHAR * String, int StrLen, int FontHandle, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawStringWidthToHandle 項を参照。

%index
dx_GetDrawExtendStringWidthToHandle
DxLib GetDrawExtendStringWidthToHandle (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : double ExRateX
p2 : str String
p3 : int StrLen
p4 : int FontHandle
p5 : int VerticalFlag (default FALSE)
%inst
DxLib の GetDrawExtendStringWidthToHandle() を呼び出します。
^p
元関数シグネチャ: int GetDrawExtendStringWidthToHandle(double ExRateX, const TCHAR * String, int StrLen, int FontHandle, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawExtendStringWidthToHandle 項を参照。

%index
dx_CheckFontCacheToTextureFlag
DxLib CheckFontCacheToTextureFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の CheckFontCacheToTextureFlag() を呼び出します。
^p
元関数シグネチャ: int CheckFontCacheToTextureFlag(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckFontCacheToTextureFlag 項を参照。

%index
dx_CheckFontChacheToTextureFlag
DxLib CheckFontChacheToTextureFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の CheckFontChacheToTextureFlag() を呼び出します。
^p
元関数シグネチャ: int CheckFontChacheToTextureFlag(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckFontChacheToTextureFlag 項を参照。

%index
dx_CheckFontHandleValid
DxLib CheckFontHandleValid (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の CheckFontHandleValid() を呼び出します。
^p
元関数シグネチャ: int CheckFontHandleValid(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckFontHandleValid 項を参照。

%index
dx_ClearFontCacheToHandle
DxLib ClearFontCacheToHandle (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int FontHandle
%inst
DxLib の ClearFontCacheToHandle() を呼び出します。
^p
元関数シグネチャ: int ClearFontCacheToHandle(int FontHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ClearFontCacheToHandle 項を参照。

%index
dx_SetFontCacheToTextureFlag
DxLib SetFontCacheToTextureFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Flag
%inst
DxLib の SetFontCacheToTextureFlag() を呼び出します。
^p
元関数シグネチャ: int SetFontCacheToTextureFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontCacheToTextureFlag 項を参照。

%index
dx_GetFontCacheToTextureFlag
DxLib GetFontCacheToTextureFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontCacheToTextureFlag() を呼び出します。
^p
元関数シグネチャ: int GetFontCacheToTextureFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontCacheToTextureFlag 項を参照。

%index
dx_SetFontChacheToTextureFlag
DxLib SetFontChacheToTextureFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Flag
%inst
DxLib の SetFontChacheToTextureFlag() を呼び出します。
^p
元関数シグネチャ: int SetFontChacheToTextureFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontChacheToTextureFlag 項を参照。

%index
dx_GetFontChacheToTextureFlag
DxLib GetFontChacheToTextureFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontChacheToTextureFlag() を呼び出します。
^p
元関数シグネチャ: int GetFontChacheToTextureFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontChacheToTextureFlag 項を参照。

%index
dx_SetFontCacheTextureColorBitDepth
DxLib SetFontCacheTextureColorBitDepth (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int ColorBitDepth
%inst
DxLib の SetFontCacheTextureColorBitDepth() を呼び出します。
^p
元関数シグネチャ: int SetFontCacheTextureColorBitDepth(int ColorBitDepth)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontCacheTextureColorBitDepth 項を参照。

%index
dx_GetFontCacheTextureColorBitDepth
DxLib GetFontCacheTextureColorBitDepth (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontCacheTextureColorBitDepth() を呼び出します。
^p
元関数シグネチャ: int GetFontCacheTextureColorBitDepth(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontCacheTextureColorBitDepth 項を参照。

%index
dx_SetFontCacheCharNum
DxLib SetFontCacheCharNum (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int CharNum
%inst
DxLib の SetFontCacheCharNum() を呼び出します。
^p
元関数シグネチャ: int SetFontCacheCharNum(int CharNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontCacheCharNum 項を参照。

%index
dx_GetFontCacheCharNum
DxLib GetFontCacheCharNum (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontCacheCharNum() を呼び出します。
^p
元関数シグネチャ: int GetFontCacheCharNum(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontCacheCharNum 項を参照。

%index
dx_SetFontCacheUsePremulAlphaFlag
DxLib SetFontCacheUsePremulAlphaFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Flag
%inst
DxLib の SetFontCacheUsePremulAlphaFlag() を呼び出します。
^p
元関数シグネチャ: int SetFontCacheUsePremulAlphaFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontCacheUsePremulAlphaFlag 項を参照。

%index
dx_GetFontCacheUsePremulAlphaFlag
DxLib GetFontCacheUsePremulAlphaFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontCacheUsePremulAlphaFlag() を呼び出します。
^p
元関数シグネチャ: int GetFontCacheUsePremulAlphaFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontCacheUsePremulAlphaFlag 項を参照。

%index
dx_SetFontUseAdjustSizeFlag
DxLib SetFontUseAdjustSizeFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Flag
%inst
DxLib の SetFontUseAdjustSizeFlag() を呼び出します。
^p
元関数シグネチャ: int SetFontUseAdjustSizeFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontUseAdjustSizeFlag 項を参照。

%index
dx_GetFontUseAdjustSizeFlag
DxLib GetFontUseAdjustSizeFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontUseAdjustSizeFlag() を呼び出します。
^p
元関数シグネチャ: int GetFontUseAdjustSizeFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontUseAdjustSizeFlag 項を参照。

%index
dx_SetFontOnlyDrawType
DxLib SetFontOnlyDrawType (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int OnlyType
%inst
DxLib の SetFontOnlyDrawType() を呼び出します。
^p
元関数シグネチャ: int SetFontOnlyDrawType(int OnlyType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontOnlyDrawType 項を参照。

%index
dx_GetFontOnlyDrawType
DxLib GetFontOnlyDrawType (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontOnlyDrawType() を呼び出します。
^p
元関数シグネチャ: int GetFontOnlyDrawType(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontOnlyDrawType 項を参照。

%index
dx_SetFontIgnoreLFFlag
DxLib SetFontIgnoreLFFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
p1 : int Flag
%inst
DxLib の SetFontIgnoreLFFlag() を呼び出します。
^p
元関数シグネチャ: int SetFontIgnoreLFFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFontIgnoreLFFlag 項を参照。

%index
dx_GetFontIgnoreLFFlag
DxLib GetFontIgnoreLFFlag (自動生成、hsp3dx 専用)
%group
DxLib フォント
%prm
(引数なし)
%inst
DxLib の GetFontIgnoreLFFlag() を呼び出します。
^p
元関数シグネチャ: int GetFontIgnoreLFFlag(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFontIgnoreLFFlag 項を参照。

%index
dx_DrawVString
DxLib DrawVString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : str String
p4 : int (uint 扱い) Color
p5 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawVString() を呼び出します。
^p
元関数シグネチャ: int DrawVString(int x, int y, const TCHAR * String, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawVString 項を参照。

%index
dx_DrawExtendString
DxLib DrawExtendString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double ExRateX
p4 : double ExRateY
p5 : str String
p6 : int (uint 扱い) Color
p7 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawExtendString() を呼び出します。
^p
元関数シグネチャ: int DrawExtendString(int x, int y, double ExRateX, double ExRateY, const TCHAR * String, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendString 項を参照。

%index
dx_DrawExtendVString
DxLib DrawExtendVString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double ExRateX
p4 : double ExRateY
p5 : str String
p6 : int (uint 扱い) Color
p7 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawExtendVString() を呼び出します。
^p
元関数シグネチャ: int DrawExtendVString(int x, int y, double ExRateX, double ExRateY, const TCHAR * String, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendVString 項を参照。

%index
dx_DrawRotaString
DxLib DrawRotaString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double ExRateX
p4 : double ExRateY
p5 : double RotCenterX
p6 : double RotCenterY
p7 : double RotAngle
p8 : int (uint 扱い) Color
p9 : int (uint 扱い) EdgeColor (default 0)
p10 : int VerticalFlag (default FALSE)
p11 : str String (default NULL)
%inst
DxLib の DrawRotaString() を呼び出します。
^p
元関数シグネチャ: int DrawRotaString(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaString 項を参照。

%index
dx_DrawModiString
DxLib DrawModiString (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int x3
p6 : int y3
p7 : int x4
p8 : int y4
p9 : int (uint 扱い) Color
p10 : int (uint 扱い) EdgeColor (default 0)
p11 : int VerticalFlag (default FALSE)
p12 : str String (default NULL)
%inst
DxLib の DrawModiString() を呼び出します。
^p
元関数シグネチャ: int DrawModiString(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawModiString 項を参照。

%index
dx_DrawStringF
DxLib DrawStringF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : str String
p4 : int (uint 扱い) Color
p5 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawStringF() を呼び出します。
^p
元関数シグネチャ: int DrawStringF(float x, float y, const TCHAR * String, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawStringF 項を参照。

%index
dx_DrawVStringF
DxLib DrawVStringF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : str String
p4 : int (uint 扱い) Color
p5 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawVStringF() を呼び出します。
^p
元関数シグネチャ: int DrawVStringF(float x, float y, const TCHAR * String, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawVStringF 項を参照。

%index
dx_DrawExtendStringF
DxLib DrawExtendStringF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double ExRateX
p4 : double ExRateY
p5 : str String
p6 : int (uint 扱い) Color
p7 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawExtendStringF() を呼び出します。
^p
元関数シグネチャ: int DrawExtendStringF(float x, float y, double ExRateX, double ExRateY, const TCHAR * String, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendStringF 項を参照。

%index
dx_DrawExtendVStringF
DxLib DrawExtendVStringF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double ExRateX
p4 : double ExRateY
p5 : str String
p6 : int (uint 扱い) Color
p7 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawExtendVStringF() を呼び出します。
^p
元関数シグネチャ: int DrawExtendVStringF(float x, float y, double ExRateX, double ExRateY, const TCHAR * String, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendVStringF 項を参照。

%index
dx_DrawRotaStringF
DxLib DrawRotaStringF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double ExRateX
p4 : double ExRateY
p5 : double RotCenterX
p6 : double RotCenterY
p7 : double RotAngle
p8 : int (uint 扱い) Color
p9 : int (uint 扱い) EdgeColor (default 0)
p10 : int VerticalFlag (default FALSE)
p11 : str String (default NULL)
%inst
DxLib の DrawRotaStringF() を呼び出します。
^p
元関数シグネチャ: int DrawRotaStringF(float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaStringF 項を参照。

%index
dx_DrawModiStringF
DxLib DrawModiStringF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x1
p2 : double (float 縮小) y1
p3 : double (float 縮小) x2
p4 : double (float 縮小) y2
p5 : double (float 縮小) x3
p6 : double (float 縮小) y3
p7 : double (float 縮小) x4
p8 : double (float 縮小) y4
p9 : int (uint 扱い) Color
p10 : int (uint 扱い) EdgeColor (default 0)
p11 : int VerticalFlag (default FALSE)
p12 : str String (default NULL)
%inst
DxLib の DrawModiStringF() を呼び出します。
^p
元関数シグネチャ: int DrawModiStringF(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, unsigned int EdgeColor, int VerticalFlag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawModiStringF 項を参照。

%index
dx_DrawNumberToI
DxLib DrawNumberToI (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int Num
p4 : int RisesNum
p5 : int (uint 扱い) Color
p6 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawNumberToI() を呼び出します。
^p
元関数シグネチャ: int DrawNumberToI(int x, int y, int Num, int RisesNum, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawNumberToI 項を参照。

%index
dx_DrawNumberToF
DxLib DrawNumberToF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double Num
p4 : int Length
p5 : int (uint 扱い) Color
p6 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawNumberToF() を呼び出します。
^p
元関数シグネチャ: int DrawNumberToF(int x, int y, double Num, int Length, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawNumberToF 項を参照。

%index
dx_DrawNumberPlusToI
DxLib DrawNumberPlusToI (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : str NoteString
p4 : int Num
p5 : int RisesNum
p6 : int (uint 扱い) Color
p7 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawNumberPlusToI() を呼び出します。
^p
元関数シグネチャ: int DrawNumberPlusToI(int x, int y, const TCHAR * NoteString, int Num, int RisesNum, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawNumberPlusToI 項を参照。

%index
dx_DrawNumberPlusToF
DxLib DrawNumberPlusToF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : str NoteString
p4 : double Num
p5 : int Length
p6 : int (uint 扱い) Color
p7 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawNumberPlusToF() を呼び出します。
^p
元関数シグネチャ: int DrawNumberPlusToF(int x, int y, const TCHAR * NoteString, double Num, int Length, unsigned int Color, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawNumberPlusToF 項を参照。

%index
dx_DrawStringToHandle
DxLib DrawStringToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : str String
p4 : int (uint 扱い) Color
p5 : int FontHandle
p6 : int (uint 扱い) EdgeColor (default 0)
p7 : int VerticalFlag (default FALSE)
%inst
DxLib の DrawStringToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawStringToHandle(int x, int y, const TCHAR * String, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawStringToHandle 項を参照。

%index
dx_DrawVStringToHandle
DxLib DrawVStringToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : str String
p4 : int (uint 扱い) Color
p5 : int FontHandle
p6 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawVStringToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawVStringToHandle(int x, int y, const TCHAR * String, unsigned int Color, int FontHandle, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawVStringToHandle 項を参照。

%index
dx_DrawExtendStringToHandle
DxLib DrawExtendStringToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double ExRateX
p4 : double ExRateY
p5 : str String
p6 : int (uint 扱い) Color
p7 : int FontHandle
p8 : int (uint 扱い) EdgeColor (default 0)
p9 : int VerticalFlag (default FALSE)
%inst
DxLib の DrawExtendStringToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawExtendStringToHandle(int x, int y, double ExRateX, double ExRateY, const TCHAR * String, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendStringToHandle 項を参照。

%index
dx_DrawExtendVStringToHandle
DxLib DrawExtendVStringToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double ExRateX
p4 : double ExRateY
p5 : str String
p6 : int (uint 扱い) Color
p7 : int FontHandle
p8 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawExtendVStringToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawExtendVStringToHandle(int x, int y, double ExRateX, double ExRateY, const TCHAR * String, unsigned int Color, int FontHandle, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendVStringToHandle 項を参照。

%index
dx_DrawRotaStringToHandle
DxLib DrawRotaStringToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double ExRateX
p4 : double ExRateY
p5 : double RotCenterX
p6 : double RotCenterY
p7 : double RotAngle
p8 : int (uint 扱い) Color
p9 : int FontHandle
p10 : int (uint 扱い) EdgeColor
p11 : int VerticalFlag
p12 : str String
%inst
DxLib の DrawRotaStringToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawRotaStringToHandle(int x, int y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaStringToHandle 項を参照。

%index
dx_DrawModiStringToHandle
DxLib DrawModiStringToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int x3
p6 : int y3
p7 : int x4
p8 : int y4
p9 : int (uint 扱い) Color
p10 : int FontHandle
p11 : int (uint 扱い) EdgeColor
p12 : int VerticalFlag
p13 : str String
%inst
DxLib の DrawModiStringToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawModiStringToHandle(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawModiStringToHandle 項を参照。

%index
dx_DrawStringFToHandle
DxLib DrawStringFToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : str String
p4 : int (uint 扱い) Color
p5 : int FontHandle
p6 : int (uint 扱い) EdgeColor (default 0)
p7 : int VerticalFlag (default FALSE)
%inst
DxLib の DrawStringFToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawStringFToHandle(float x, float y, const TCHAR * String, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawStringFToHandle 項を参照。

%index
dx_DrawVStringFToHandle
DxLib DrawVStringFToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : str String
p4 : int (uint 扱い) Color
p5 : int FontHandle
p6 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawVStringFToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawVStringFToHandle(float x, float y, const TCHAR * String, unsigned int Color, int FontHandle, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawVStringFToHandle 項を参照。

%index
dx_DrawExtendStringFToHandle
DxLib DrawExtendStringFToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double ExRateX
p4 : double ExRateY
p5 : str String
p6 : int (uint 扱い) Color
p7 : int FontHandle
p8 : int (uint 扱い) EdgeColor (default 0)
p9 : int VerticalFlag (default FALSE)
%inst
DxLib の DrawExtendStringFToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawExtendStringFToHandle(float x, float y, double ExRateX, double ExRateY, const TCHAR * String, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendStringFToHandle 項を参照。

%index
dx_DrawExtendVStringFToHandle
DxLib DrawExtendVStringFToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double ExRateX
p4 : double ExRateY
p5 : str String
p6 : int (uint 扱い) Color
p7 : int FontHandle
p8 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawExtendVStringFToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawExtendVStringFToHandle(float x, float y, double ExRateX, double ExRateY, const TCHAR * String, unsigned int Color, int FontHandle, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawExtendVStringFToHandle 項を参照。

%index
dx_DrawRotaStringFToHandle
DxLib DrawRotaStringFToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x
p2 : double (float 縮小) y
p3 : double ExRateX
p4 : double ExRateY
p5 : double RotCenterX
p6 : double RotCenterY
p7 : double RotAngle
p8 : int (uint 扱い) Color
p9 : int FontHandle
p10 : int (uint 扱い) EdgeColor (default 0)
p11 : int VerticalFlag (default FALSE)
p12 : str String (default NULL)
%inst
DxLib の DrawRotaStringFToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawRotaStringFToHandle(float x, float y, double ExRateX, double ExRateY, double RotCenterX, double RotCenterY, double RotAngle, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawRotaStringFToHandle 項を参照。

%index
dx_DrawModiStringFToHandle
DxLib DrawModiStringFToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : double (float 縮小) x1
p2 : double (float 縮小) y1
p3 : double (float 縮小) x2
p4 : double (float 縮小) y2
p5 : double (float 縮小) x3
p6 : double (float 縮小) y3
p7 : double (float 縮小) x4
p8 : double (float 縮小) y4
p9 : int (uint 扱い) Color
p10 : int FontHandle
p11 : int (uint 扱い) EdgeColor
p12 : int VerticalFlag
p13 : str String
%inst
DxLib の DrawModiStringFToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawModiStringFToHandle(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, unsigned int Color, int FontHandle, unsigned int EdgeColor, int VerticalFlag, const TCHAR * String)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawModiStringFToHandle 項を参照。

%index
dx_DrawNumberToIToHandle
DxLib DrawNumberToIToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int Num
p4 : int RisesNum
p5 : int (uint 扱い) Color
p6 : int FontHandle
p7 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawNumberToIToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawNumberToIToHandle(int x, int y, int Num, int RisesNum, unsigned int Color, int FontHandle, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawNumberToIToHandle 項を参照。

%index
dx_DrawNumberToFToHandle
DxLib DrawNumberToFToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : double Num
p4 : int Length
p5 : int (uint 扱い) Color
p6 : int FontHandle
p7 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawNumberToFToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawNumberToFToHandle(int x, int y, double Num, int Length, unsigned int Color, int FontHandle, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawNumberToFToHandle 項を参照。

%index
dx_DrawNumberPlusToIToHandle
DxLib DrawNumberPlusToIToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : str NoteString
p4 : int Num
p5 : int RisesNum
p6 : int (uint 扱い) Color
p7 : int FontHandle
p8 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawNumberPlusToIToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawNumberPlusToIToHandle(int x, int y, const TCHAR * NoteString, int Num, int RisesNum, unsigned int Color, int FontHandle, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawNumberPlusToIToHandle 項を参照。

%index
dx_DrawNumberPlusToFToHandle
DxLib DrawNumberPlusToFToHandle (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : str NoteString
p4 : double Num
p5 : int Length
p6 : int (uint 扱い) Color
p7 : int FontHandle
p8 : int (uint 扱い) EdgeColor (default 0)
%inst
DxLib の DrawNumberPlusToFToHandle() を呼び出します。
^p
元関数シグネチャ: int DrawNumberPlusToFToHandle(int x, int y, const TCHAR * NoteString, double Num, int Length, unsigned int Color, int FontHandle, unsigned int EdgeColor)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawNumberPlusToFToHandle 項を参照。

%index
dx_HitCheck_Triangle_Triangle
DxLib HitCheck_Triangle_Triangle (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Triangle1Pos1
p2 : var (VECTOR: #defstruct float x,y,z) Triangle1Pos2
p3 : var (VECTOR: #defstruct float x,y,z) Triangle1Pos3
p4 : var (VECTOR: #defstruct float x,y,z) Triangle2Pos1
p5 : var (VECTOR: #defstruct float x,y,z) Triangle2Pos2
p6 : var (VECTOR: #defstruct float x,y,z) Triangle2Pos3
%inst
DxLib の HitCheck_Triangle_Triangle() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Triangle_Triangle(VECTOR Triangle1Pos1, VECTOR Triangle1Pos2, VECTOR Triangle1Pos3, VECTOR Triangle2Pos1, VECTOR Triangle2Pos2, VECTOR Triangle2Pos3)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Triangle_Triangle 項を参照。

%index
dx_HitCheck_Triangle_TriangleD
DxLib HitCheck_Triangle_TriangleD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Triangle1Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Triangle1Pos2
p3 : var (VECTOR_D: #defstruct double x,y,z) Triangle1Pos3
p4 : var (VECTOR_D: #defstruct double x,y,z) Triangle2Pos1
p5 : var (VECTOR_D: #defstruct double x,y,z) Triangle2Pos2
p6 : var (VECTOR_D: #defstruct double x,y,z) Triangle2Pos3
%inst
DxLib の HitCheck_Triangle_TriangleD() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Triangle_TriangleD(VECTOR_D Triangle1Pos1, VECTOR_D Triangle1Pos2, VECTOR_D Triangle1Pos3, VECTOR_D Triangle2Pos1, VECTOR_D Triangle2Pos2, VECTOR_D Triangle2Pos3)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Triangle_TriangleD 項を参照。

%index
dx_HitCheck_Triangle_Triangle_2D
DxLib HitCheck_Triangle_Triangle_2D (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Triangle1Pos1
p2 : var (VECTOR: #defstruct float x,y,z) Triangle1Pos2
p3 : var (VECTOR: #defstruct float x,y,z) Triangle1Pos3
p4 : var (VECTOR: #defstruct float x,y,z) Triangle2Pos1
p5 : var (VECTOR: #defstruct float x,y,z) Triangle2Pos2
p6 : var (VECTOR: #defstruct float x,y,z) Triangle2Pos3
%inst
DxLib の HitCheck_Triangle_Triangle_2D() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Triangle_Triangle_2D(VECTOR Triangle1Pos1, VECTOR Triangle1Pos2, VECTOR Triangle1Pos3, VECTOR Triangle2Pos1, VECTOR Triangle2Pos2, VECTOR Triangle2Pos3)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Triangle_Triangle_2D 項を参照。

%index
dx_HitCheck_Triangle_TriangleD_2D
DxLib HitCheck_Triangle_TriangleD_2D (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Triangle1Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Triangle1Pos2
p3 : var (VECTOR_D: #defstruct double x,y,z) Triangle1Pos3
p4 : var (VECTOR_D: #defstruct double x,y,z) Triangle2Pos1
p5 : var (VECTOR_D: #defstruct double x,y,z) Triangle2Pos2
p6 : var (VECTOR_D: #defstruct double x,y,z) Triangle2Pos3
%inst
DxLib の HitCheck_Triangle_TriangleD_2D() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Triangle_TriangleD_2D(VECTOR_D Triangle1Pos1, VECTOR_D Triangle1Pos2, VECTOR_D Triangle1Pos3, VECTOR_D Triangle2Pos1, VECTOR_D Triangle2Pos2, VECTOR_D Triangle2Pos3)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Triangle_TriangleD_2D 項を参照。

%index
dx_HitCheck_Point_Cone
DxLib HitCheck_Point_Cone (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) PointPos
p2 : var (VECTOR: #defstruct float x,y,z) ConeTopPos
p3 : var (VECTOR: #defstruct float x,y,z) ConeBottomPos
p4 : double (float 縮小) ConeR
%inst
DxLib の HitCheck_Point_Cone() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Point_Cone(VECTOR PointPos, VECTOR ConeTopPos, VECTOR ConeBottomPos, float ConeR)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Point_Cone 項を参照。

%index
dx_HitCheck_Point_ConeD
DxLib HitCheck_Point_ConeD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) PointPos
p2 : var (VECTOR_D: #defstruct double x,y,z) ConeTopPos
p3 : var (VECTOR_D: #defstruct double x,y,z) ConeBottomPos
p4 : double ConeR
%inst
DxLib の HitCheck_Point_ConeD() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Point_ConeD(VECTOR_D PointPos, VECTOR_D ConeTopPos, VECTOR_D ConeBottomPos, double ConeR)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Point_ConeD 項を参照。

%index
dx_HitCheck_Line_Sphere
DxLib HitCheck_Line_Sphere (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) LinePos1
p2 : var (VECTOR: #defstruct float x,y,z) LinePos2
p3 : var (VECTOR: #defstruct float x,y,z) SphereCenterPos
p4 : double (float 縮小) SphereR
%inst
DxLib の HitCheck_Line_Sphere() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Line_Sphere(VECTOR LinePos1, VECTOR LinePos2, VECTOR SphereCenterPos, float SphereR)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Line_Sphere 項を参照。

%index
dx_HitCheck_Line_SphereD
DxLib HitCheck_Line_SphereD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) LinePos1
p2 : var (VECTOR_D: #defstruct double x,y,z) LinePos2
p3 : var (VECTOR_D: #defstruct double x,y,z) SphereCenterPos
p4 : double SphereR
%inst
DxLib の HitCheck_Line_SphereD() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Line_SphereD(VECTOR_D LinePos1, VECTOR_D LinePos2, VECTOR_D SphereCenterPos, double SphereR)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Line_SphereD 項を参照。

%index
dx_HitCheck_Sphere_Sphere
DxLib HitCheck_Sphere_Sphere (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Sphere1CenterPos
p2 : double (float 縮小) Sphere1R
p3 : var (VECTOR: #defstruct float x,y,z) Sphere2CenterPos
p4 : double (float 縮小) Sphere2R
%inst
DxLib の HitCheck_Sphere_Sphere() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Sphere_Sphere(VECTOR Sphere1CenterPos, float Sphere1R, VECTOR Sphere2CenterPos, float Sphere2R)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Sphere_Sphere 項を参照。

%index
dx_HitCheck_Sphere_SphereD
DxLib HitCheck_Sphere_SphereD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Sphere1CenterPos
p2 : double Sphere1R
p3 : var (VECTOR_D: #defstruct double x,y,z) Sphere2CenterPos
p4 : double Sphere2R
%inst
DxLib の HitCheck_Sphere_SphereD() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Sphere_SphereD(VECTOR_D Sphere1CenterPos, double Sphere1R, VECTOR_D Sphere2CenterPos, double Sphere2R)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Sphere_SphereD 項を参照。

%index
dx_HitCheck_Sphere_Capsule
DxLib HitCheck_Sphere_Capsule (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) SphereCenterPos
p2 : double (float 縮小) SphereR
p3 : var (VECTOR: #defstruct float x,y,z) CapPos1
p4 : var (VECTOR: #defstruct float x,y,z) CapPos2
p5 : double (float 縮小) CapR
%inst
DxLib の HitCheck_Sphere_Capsule() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Sphere_Capsule(VECTOR SphereCenterPos, float SphereR, VECTOR CapPos1, VECTOR CapPos2, float CapR)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Sphere_Capsule 項を参照。

%index
dx_HitCheck_Sphere_CapsuleD
DxLib HitCheck_Sphere_CapsuleD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) SphereCenterPos
p2 : double SphereR
p3 : var (VECTOR_D: #defstruct double x,y,z) CapPos1
p4 : var (VECTOR_D: #defstruct double x,y,z) CapPos2
p5 : double CapR
%inst
DxLib の HitCheck_Sphere_CapsuleD() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Sphere_CapsuleD(VECTOR_D SphereCenterPos, double SphereR, VECTOR_D CapPos1, VECTOR_D CapPos2, double CapR)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Sphere_CapsuleD 項を参照。

%index
dx_HitCheck_Sphere_Triangle
DxLib HitCheck_Sphere_Triangle (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) SphereCenterPos
p2 : double (float 縮小) SphereR
p3 : var (VECTOR: #defstruct float x,y,z) TrianglePos1
p4 : var (VECTOR: #defstruct float x,y,z) TrianglePos2
p5 : var (VECTOR: #defstruct float x,y,z) TrianglePos3
%inst
DxLib の HitCheck_Sphere_Triangle() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Sphere_Triangle(VECTOR SphereCenterPos, float SphereR, VECTOR TrianglePos1, VECTOR TrianglePos2, VECTOR TrianglePos3)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Sphere_Triangle 項を参照。

%index
dx_HitCheck_Sphere_TriangleD
DxLib HitCheck_Sphere_TriangleD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) SphereCenterPos
p2 : double SphereR
p3 : var (VECTOR_D: #defstruct double x,y,z) TrianglePos1
p4 : var (VECTOR_D: #defstruct double x,y,z) TrianglePos2
p5 : var (VECTOR_D: #defstruct double x,y,z) TrianglePos3
%inst
DxLib の HitCheck_Sphere_TriangleD() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Sphere_TriangleD(VECTOR_D SphereCenterPos, double SphereR, VECTOR_D TrianglePos1, VECTOR_D TrianglePos2, VECTOR_D TrianglePos3)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Sphere_TriangleD 項を参照。

%index
dx_HitCheck_Capsule_Capsule
DxLib HitCheck_Capsule_Capsule (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Cap1Pos1
p2 : var (VECTOR: #defstruct float x,y,z) Cap1Pos2
p3 : double (float 縮小) Cap1R
p4 : var (VECTOR: #defstruct float x,y,z) Cap2Pos1
p5 : var (VECTOR: #defstruct float x,y,z) Cap2Pos2
p6 : double (float 縮小) Cap2R
%inst
DxLib の HitCheck_Capsule_Capsule() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Capsule_Capsule(VECTOR Cap1Pos1, VECTOR Cap1Pos2, float Cap1R, VECTOR Cap2Pos1, VECTOR Cap2Pos2, float Cap2R)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Capsule_Capsule 項を参照。

%index
dx_HitCheck_Capsule_CapsuleD
DxLib HitCheck_Capsule_CapsuleD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) Cap1Pos1
p2 : var (VECTOR_D: #defstruct double x,y,z) Cap1Pos2
p3 : double Cap1R
p4 : var (VECTOR_D: #defstruct double x,y,z) Cap2Pos1
p5 : var (VECTOR_D: #defstruct double x,y,z) Cap2Pos2
p6 : double Cap2R
%inst
DxLib の HitCheck_Capsule_CapsuleD() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Capsule_CapsuleD(VECTOR_D Cap1Pos1, VECTOR_D Cap1Pos2, double Cap1R, VECTOR_D Cap2Pos1, VECTOR_D Cap2Pos2, double Cap2R)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Capsule_CapsuleD 項を参照。

%index
dx_HitCheck_Capsule_Triangle
DxLib HitCheck_Capsule_Triangle (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR: #defstruct float x,y,z) CapPos1
p2 : var (VECTOR: #defstruct float x,y,z) CapPos2
p3 : double (float 縮小) CapR
p4 : var (VECTOR: #defstruct float x,y,z) TrianglePos1
p5 : var (VECTOR: #defstruct float x,y,z) TrianglePos2
p6 : var (VECTOR: #defstruct float x,y,z) TrianglePos3
%inst
DxLib の HitCheck_Capsule_Triangle() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Capsule_Triangle(VECTOR CapPos1, VECTOR CapPos2, float CapR, VECTOR TrianglePos1, VECTOR TrianglePos2, VECTOR TrianglePos3)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Capsule_Triangle 項を参照。

%index
dx_HitCheck_Capsule_TriangleD
DxLib HitCheck_Capsule_TriangleD (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : var (VECTOR_D: #defstruct double x,y,z) CapPos1
p2 : var (VECTOR_D: #defstruct double x,y,z) CapPos2
p3 : double CapR
p4 : var (VECTOR_D: #defstruct double x,y,z) TrianglePos1
p5 : var (VECTOR_D: #defstruct double x,y,z) TrianglePos2
p6 : var (VECTOR_D: #defstruct double x,y,z) TrianglePos3
%inst
DxLib の HitCheck_Capsule_TriangleD() を呼び出します。
^p
元関数シグネチャ: int HitCheck_Capsule_TriangleD(VECTOR_D CapPos1, VECTOR_D CapPos2, double CapR, VECTOR_D TrianglePos1, VECTOR_D TrianglePos2, VECTOR_D TrianglePos3)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の HitCheck_Capsule_TriangleD 項を参照。

%index
dx_SetUseFastLoadFlag
DxLib SetUseFastLoadFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseFastLoadFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseFastLoadFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseFastLoadFlag 項を参照。

%index
dx_GetGraphDataShavedMode
DxLib GetGraphDataShavedMode (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetGraphDataShavedMode() を呼び出します。
^p
元関数シグネチャ: int GetGraphDataShavedMode(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetGraphDataShavedMode 項を参照。

%index
dx_SetUsePremulAlphaConvertLoad
DxLib SetUsePremulAlphaConvertLoad (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetUsePremulAlphaConvertLoad() を呼び出します。
^p
元関数シグネチャ: int SetUsePremulAlphaConvertLoad(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUsePremulAlphaConvertLoad 項を参照。

%index
dx_GetUsePremulAlphaConvertLoad
DxLib GetUsePremulAlphaConvertLoad (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUsePremulAlphaConvertLoad() を呼び出します。
^p
元関数シグネチャ: int GetUsePremulAlphaConvertLoad(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUsePremulAlphaConvertLoad 項を参照。

%index
dx_SetUseConvertNormalFormatLoad
DxLib SetUseConvertNormalFormatLoad (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int UseFlag
%inst
DxLib の SetUseConvertNormalFormatLoad() を呼び出します。
^p
元関数シグネチャ: int SetUseConvertNormalFormatLoad(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseConvertNormalFormatLoad 項を参照。

%index
dx_GetUseConvertNormalFormatLoad
DxLib GetUseConvertNormalFormatLoad (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
(引数なし)
%inst
DxLib の GetUseConvertNormalFormatLoad() を呼び出します。
^p
元関数シグネチャ: int GetUseConvertNormalFormatLoad(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetUseConvertNormalFormatLoad 項を参照。

%index
dx_InitSoftImage
DxLib InitSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の InitSoftImage() を呼び出します。
^p
元関数シグネチャ: int InitSoftImage(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitSoftImage 項を参照。

%index
dx_LoadSoftImage
DxLib LoadSoftImage (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FileName
%inst
DxLib の LoadSoftImage() を呼び出します。
^p
元関数シグネチャ: int LoadSoftImage(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadSoftImage 項を参照。

%index
dx_LoadARGB8ColorSoftImage
DxLib LoadARGB8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FileName
%inst
DxLib の LoadARGB8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int LoadARGB8ColorSoftImage(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadARGB8ColorSoftImage 項を参照。

%index
dx_LoadXRGB8ColorSoftImage
DxLib LoadXRGB8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FileName
%inst
DxLib の LoadXRGB8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int LoadXRGB8ColorSoftImage(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadXRGB8ColorSoftImage 項を参照。

%index
dx_MakeSoftImage
DxLib MakeSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftImage 項を参照。

%index
dx_MakeARGBF32ColorSoftImage
DxLib MakeARGBF32ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeARGBF32ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeARGBF32ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeARGBF32ColorSoftImage 項を参照。

%index
dx_MakeARGBF16ColorSoftImage
DxLib MakeARGBF16ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeARGBF16ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeARGBF16ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeARGBF16ColorSoftImage 項を参照。

%index
dx_MakeXRGB8ColorSoftImage
DxLib MakeXRGB8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeXRGB8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeXRGB8ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeXRGB8ColorSoftImage 項を参照。

%index
dx_MakeARGB8ColorSoftImage
DxLib MakeARGB8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeARGB8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeARGB8ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeARGB8ColorSoftImage 項を参照。

%index
dx_MakeRGBA8ColorSoftImage
DxLib MakeRGBA8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeRGBA8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeRGBA8ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeRGBA8ColorSoftImage 項を参照。

%index
dx_MakeABGR8ColorSoftImage
DxLib MakeABGR8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeABGR8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeABGR8ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeABGR8ColorSoftImage 項を参照。

%index
dx_MakeBGRA8ColorSoftImage
DxLib MakeBGRA8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeBGRA8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeBGRA8ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeBGRA8ColorSoftImage 項を参照。

%index
dx_MakeARGB4ColorSoftImage
DxLib MakeARGB4ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeARGB4ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeARGB4ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeARGB4ColorSoftImage 項を参照。

%index
dx_MakeA1R5G5B5ColorSoftImage
DxLib MakeA1R5G5B5ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeA1R5G5B5ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeA1R5G5B5ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeA1R5G5B5ColorSoftImage 項を参照。

%index
dx_MakeX1R5G5B5ColorSoftImage
DxLib MakeX1R5G5B5ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeX1R5G5B5ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeX1R5G5B5ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeX1R5G5B5ColorSoftImage 項を参照。

%index
dx_MakeR5G5B5A1ColorSoftImage
DxLib MakeR5G5B5A1ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeR5G5B5A1ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeR5G5B5A1ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeR5G5B5A1ColorSoftImage 項を参照。

%index
dx_MakeR5G6B5ColorSoftImage
DxLib MakeR5G6B5ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeR5G6B5ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeR5G6B5ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeR5G6B5ColorSoftImage 項を参照。

%index
dx_MakeRGB8ColorSoftImage
DxLib MakeRGB8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
%inst
DxLib の MakeRGB8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakeRGB8ColorSoftImage(int SizeX, int SizeY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeRGB8ColorSoftImage 項を参照。

%index
dx_MakePAL8ColorSoftImage
DxLib MakePAL8ColorSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SizeX
p2 : int SizeY
p3 : int UseAlpha (default FALSE)
%inst
DxLib の MakePAL8ColorSoftImage() を呼び出します。
^p
元関数シグネチャ: int MakePAL8ColorSoftImage(int SizeX, int SizeY, int UseAlpha)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakePAL8ColorSoftImage 項を参照。

%index
dx_DeleteSoftImage
DxLib DeleteSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
%inst
DxLib の DeleteSoftImage() を呼び出します。
^p
元関数シグネチャ: int DeleteSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteSoftImage 項を参照。

%index
dx_CheckPaletteSoftImage
DxLib CheckPaletteSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
%inst
DxLib の CheckPaletteSoftImage() を呼び出します。
^p
元関数シグネチャ: int CheckPaletteSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckPaletteSoftImage 項を参照。

%index
dx_CheckAlphaSoftImage
DxLib CheckAlphaSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
%inst
DxLib の CheckAlphaSoftImage() を呼び出します。
^p
元関数シグネチャ: int CheckAlphaSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckAlphaSoftImage 項を参照。

%index
dx_CheckPixelAlphaSoftImage
DxLib CheckPixelAlphaSoftImage (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int SIHandle
%inst
DxLib の CheckPixelAlphaSoftImage() を呼び出します。
^p
元関数シグネチャ: int CheckPixelAlphaSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckPixelAlphaSoftImage 項を参照。

%index
dx_GetDrawScreenSoftImage
DxLib GetDrawScreenSoftImage (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int SIHandle
%inst
DxLib の GetDrawScreenSoftImage() を呼び出します。
^p
元関数シグネチャ: int GetDrawScreenSoftImage(int x1, int y1, int x2, int y2, int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawScreenSoftImage 項を参照。

%index
dx_GetDrawScreenSoftImageDestPos
DxLib GetDrawScreenSoftImageDestPos (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int x1
p2 : int y1
p3 : int x2
p4 : int y2
p5 : int SIHandle
p6 : int DestX
p7 : int DestY
%inst
DxLib の GetDrawScreenSoftImageDestPos() を呼び出します。
^p
元関数シグネチャ: int GetDrawScreenSoftImageDestPos(int x1, int y1, int x2, int y2, int SIHandle, int DestX, int DestY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDrawScreenSoftImageDestPos 項を参照。

%index
dx_FillSoftImage
DxLib FillSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
p2 : int r
p3 : int g
p4 : int b
p5 : int a
%inst
DxLib の FillSoftImage() を呼び出します。
^p
元関数シグネチャ: int FillSoftImage(int SIHandle, int r, int g, int b, int a)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の FillSoftImage 項を参照。

%index
dx_ClearRectSoftImage
DxLib ClearRectSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
p2 : int x
p3 : int y
p4 : int w
p5 : int h
%inst
DxLib の ClearRectSoftImage() を呼び出します。
^p
元関数シグネチャ: int ClearRectSoftImage(int SIHandle, int x, int y, int w, int h)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ClearRectSoftImage 項を参照。

%index
dx_SetPaletteSoftImage
DxLib SetPaletteSoftImage (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int SIHandle
p2 : int PaletteNo
p3 : int r
p4 : int g
p5 : int b
p6 : int a
%inst
DxLib の SetPaletteSoftImage() を呼び出します。
^p
元関数シグネチャ: int SetPaletteSoftImage(int SIHandle, int PaletteNo, int r, int g, int b, int a)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetPaletteSoftImage 項を参照。

%index
dx_DrawPixelPalCodeSoftImage
DxLib DrawPixelPalCodeSoftImage (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int SIHandle
p2 : int x
p3 : int y
p4 : int palNo
%inst
DxLib の DrawPixelPalCodeSoftImage() を呼び出します。
^p
元関数シグネチャ: int DrawPixelPalCodeSoftImage(int SIHandle, int x, int y, int palNo)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPixelPalCodeSoftImage 項を参照。

%index
dx_GetPixelPalCodeSoftImage
DxLib GetPixelPalCodeSoftImage (自動生成、hsp3dx 専用)
%group
DxLib シェーダ
%prm
p1 : int SIHandle
p2 : int x
p3 : int y
%inst
DxLib の GetPixelPalCodeSoftImage() を呼び出します。
^p
元関数シグネチャ: int GetPixelPalCodeSoftImage(int SIHandle, int x, int y)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetPixelPalCodeSoftImage 項を参照。

%index
dx_GetPitchSoftImage
DxLib GetPitchSoftImage (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int SIHandle
%inst
DxLib の GetPitchSoftImage() を呼び出します。
^p
元関数シグネチャ: int GetPitchSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetPitchSoftImage 項を参照。

%index
dx_DrawPixelSoftImage
DxLib DrawPixelSoftImage (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int SIHandle
p2 : int x
p3 : int y
p4 : int r
p5 : int g
p6 : int b
p7 : int a
%inst
DxLib の DrawPixelSoftImage() を呼び出します。
^p
元関数シグネチャ: int DrawPixelSoftImage(int SIHandle, int x, int y, int r, int g, int b, int a)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPixelSoftImage 項を参照。

%index
dx_DrawPixelSoftImageF
DxLib DrawPixelSoftImageF (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int SIHandle
p2 : int x
p3 : int y
p4 : double (float 縮小) r
p5 : double (float 縮小) g
p6 : double (float 縮小) b
p7 : double (float 縮小) a
%inst
DxLib の DrawPixelSoftImageF() を呼び出します。
^p
元関数シグネチャ: int DrawPixelSoftImageF(int SIHandle, int x, int y, float r, float g, float b, float a)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawPixelSoftImageF 項を参照。

%index
dx_DrawLineSoftImage
DxLib DrawLineSoftImage (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int SIHandle
p2 : int x1
p3 : int y1
p4 : int x2
p5 : int y2
p6 : int r
p7 : int g
p8 : int b
p9 : int a
%inst
DxLib の DrawLineSoftImage() を呼び出します。
^p
元関数シグネチャ: int DrawLineSoftImage(int SIHandle, int x1, int y1, int x2, int y2, int r, int g, int b, int a)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawLineSoftImage 項を参照。

%index
dx_DrawCircleSoftImage
DxLib DrawCircleSoftImage (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int SIHandle
p2 : int x
p3 : int y
p4 : int radius
p5 : int r
p6 : int g
p7 : int b
p8 : int a
p9 : int FillFlag (default TRUE)
%inst
DxLib の DrawCircleSoftImage() を呼び出します。
^p
元関数シグネチャ: int DrawCircleSoftImage(int SIHandle, int x, int y, int radius, int r, int g, int b, int a, int FillFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawCircleSoftImage 項を参照。

%index
dx_BltSoftImage
DxLib BltSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SrcX
p2 : int SrcY
p3 : int SrcSizeX
p4 : int SrcSizeY
p5 : int SrcSIHandle
p6 : int DestX
p7 : int DestY
p8 : int DestSIHandle
%inst
DxLib の BltSoftImage() を呼び出します。
^p
元関数シグネチャ: int BltSoftImage(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int SrcSIHandle, int DestX, int DestY, int DestSIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の BltSoftImage 項を参照。

%index
dx_BltSoftImageWithTransColor
DxLib BltSoftImageWithTransColor (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SrcX
p2 : int SrcY
p3 : int SrcSizeX
p4 : int SrcSizeY
p5 : int SrcSIHandle
p6 : int DestX
p7 : int DestY
p8 : int DestSIHandle
p9 : int Tr
p10 : int Tg
p11 : int Tb
p12 : int Ta
%inst
DxLib の BltSoftImageWithTransColor() を呼び出します。
^p
元関数シグネチャ: int BltSoftImageWithTransColor(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int SrcSIHandle, int DestX, int DestY, int DestSIHandle, int Tr, int Tg, int Tb, int Ta)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の BltSoftImageWithTransColor 項を参照。

%index
dx_BltSoftImageWithAlphaBlend
DxLib BltSoftImageWithAlphaBlend (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SrcX
p2 : int SrcY
p3 : int SrcSizeX
p4 : int SrcSizeY
p5 : int SrcSIHandle
p6 : int DestX
p7 : int DestY
p8 : int DestSIHandle
p9 : int Opacity (default 255)
%inst
DxLib の BltSoftImageWithAlphaBlend() を呼び出します。
^p
元関数シグネチャ: int BltSoftImageWithAlphaBlend(int SrcX, int SrcY, int SrcSizeX, int SrcSizeY, int SrcSIHandle, int DestX, int DestY, int DestSIHandle, int Opacity)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の BltSoftImageWithAlphaBlend 項を参照。

%index
dx_ReverseSoftImageH
DxLib ReverseSoftImageH (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
%inst
DxLib の ReverseSoftImageH() を呼び出します。
^p
元関数シグネチャ: int ReverseSoftImageH(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReverseSoftImageH 項を参照。

%index
dx_ReverseSoftImageV
DxLib ReverseSoftImageV (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
%inst
DxLib の ReverseSoftImageV() を呼び出します。
^p
元関数シグネチャ: int ReverseSoftImageV(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReverseSoftImageV 項を参照。

%index
dx_ReverseSoftImage
DxLib ReverseSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
%inst
DxLib の ReverseSoftImage() を呼び出します。
^p
元関数シグネチャ: int ReverseSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ReverseSoftImage 項を参照。

%index
dx_ConvertPremulAlphaSoftImage
DxLib ConvertPremulAlphaSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
%inst
DxLib の ConvertPremulAlphaSoftImage() を呼び出します。
^p
元関数シグネチャ: int ConvertPremulAlphaSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ConvertPremulAlphaSoftImage 項を参照。

%index
dx_ConvertInterpAlphaSoftImage
DxLib ConvertInterpAlphaSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int SIHandle
%inst
DxLib の ConvertInterpAlphaSoftImage() を呼び出します。
^p
元関数シグネチャ: int ConvertInterpAlphaSoftImage(int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ConvertInterpAlphaSoftImage 項を参照。

%index
dx_BltStringSoftImage
DxLib BltStringSoftImage (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int x
p2 : int y
p3 : str StrData
p4 : int DestSIHandle
p5 : int DestEdgeSIHandle (default -1)
p6 : int VerticalFlag (default FALSE)
%inst
DxLib の BltStringSoftImage() を呼び出します。
^p
元関数シグネチャ: int BltStringSoftImage(int x, int y, const TCHAR * StrData, int DestSIHandle, int DestEdgeSIHandle, int VerticalFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の BltStringSoftImage 項を参照。

%index
dx_DrawSoftImage
DxLib DrawSoftImage (自動生成、hsp3dx 専用)
%group
DxLib 描画
%prm
p1 : int x
p2 : int y
p3 : int SIHandle
%inst
DxLib の DrawSoftImage() を呼び出します。
^p
元関数シグネチャ: int DrawSoftImage(int x, int y, int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DrawSoftImage 項を参照。

%index
dx_SaveSoftImageToBmp
DxLib SaveSoftImageToBmp (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FilePath
p2 : int SIHandle
%inst
DxLib の SaveSoftImageToBmp() を呼び出します。
^p
元関数シグネチャ: int SaveSoftImageToBmp(const TCHAR * FilePath, int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveSoftImageToBmp 項を参照。

%index
dx_SaveSoftImageToDds
DxLib SaveSoftImageToDds (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FilePath
p2 : int SIHandle
%inst
DxLib の SaveSoftImageToDds() を呼び出します。
^p
元関数シグネチャ: int SaveSoftImageToDds(const TCHAR * FilePath, int SIHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveSoftImageToDds 項を参照。

%index
dx_SaveSoftImageToPng
DxLib SaveSoftImageToPng (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FilePath
p2 : int SIHandle
p3 : int CompressionLevel
%inst
DxLib の SaveSoftImageToPng() を呼び出します。
^p
元関数シグネチャ: int SaveSoftImageToPng(const TCHAR * FilePath, int SIHandle, int CompressionLevel)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveSoftImageToPng 項を参照。

%index
dx_SaveSoftImageToJpeg
DxLib SaveSoftImageToJpeg (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FilePath
p2 : int SIHandle
p3 : int Quality
p4 : int Sample2x1
%inst
DxLib の SaveSoftImageToJpeg() を呼び出します。
^p
元関数シグネチャ: int SaveSoftImageToJpeg(const TCHAR * FilePath, int SIHandle, int Quality, int Sample2x1)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveSoftImageToJpeg 項を参照。

%index
dx_InitSoundMem
DxLib InitSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の InitSoundMem() を呼び出します。
^p
元関数シグネチャ: int InitSoundMem(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitSoundMem 項を参照。

%index
dx_AddSoundData
DxLib AddSoundData (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Handle (default -1)
%inst
DxLib の AddSoundData() を呼び出します。
^p
元関数シグネチャ: int AddSoundData(int Handle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の AddSoundData 項を参照。

%index
dx_AddStreamSoundMemToFile
DxLib AddStreamSoundMemToFile (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str WaveFile
p2 : int LoopNum
p3 : int SoundHandle
p4 : int StreamDataType
p5 : int UnionHandle (default -1)
%inst
DxLib の AddStreamSoundMemToFile() を呼び出します。
^p
元関数シグネチャ: int AddStreamSoundMemToFile(const TCHAR * WaveFile, int LoopNum, int SoundHandle, int StreamDataType, int UnionHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の AddStreamSoundMemToFile 項を参照。

%index
dx_SetupStreamSoundMem
DxLib SetupStreamSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
%inst
DxLib の SetupStreamSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetupStreamSoundMem(int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetupStreamSoundMem 項を参照。

%index
dx_PlayStreamSoundMem
DxLib PlayStreamSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
p2 : int PlayType (default DX_PLAYTYPE_LOOP)
p3 : int TopPositionFlag (default TRUE)
%inst
DxLib の PlayStreamSoundMem() を呼び出します。
^p
元関数シグネチャ: int PlayStreamSoundMem(int SoundHandle, int PlayType, int TopPositionFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PlayStreamSoundMem 項を参照。

%index
dx_CheckStreamSoundMem
DxLib CheckStreamSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
%inst
DxLib の CheckStreamSoundMem() を呼び出します。
^p
元関数シグネチャ: int CheckStreamSoundMem(int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckStreamSoundMem 項を参照。

%index
dx_StopStreamSoundMem
DxLib StopStreamSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
p2 : int IsNextLoopEnd (default FALSE)
%inst
DxLib の StopStreamSoundMem() を呼び出します。
^p
元関数シグネチャ: int StopStreamSoundMem(int SoundHandle, int IsNextLoopEnd)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopStreamSoundMem 項を参照。

%index
dx_SetStreamSoundCurrentPosition
DxLib SetStreamSoundCurrentPosition (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 Byte
p2 : int SoundHandle
%inst
DxLib の SetStreamSoundCurrentPosition() を呼び出します。
^p
元関数シグネチャ: int SetStreamSoundCurrentPosition(LONGLONG Byte, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetStreamSoundCurrentPosition 項を参照。

%index
dx_SetStreamSoundCurrentTime
DxLib SetStreamSoundCurrentTime (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 Time
p2 : int SoundHandle
%inst
DxLib の SetStreamSoundCurrentTime() を呼び出します。
^p
元関数シグネチャ: int SetStreamSoundCurrentTime(LONGLONG Time, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetStreamSoundCurrentTime 項を参照。

%index
dx_ProcessStreamSoundMem
DxLib ProcessStreamSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
%inst
DxLib の ProcessStreamSoundMem() を呼び出します。
^p
元関数シグネチャ: int ProcessStreamSoundMem(int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ProcessStreamSoundMem 項を参照。

%index
dx_ProcessStreamSoundMemAll
DxLib ProcessStreamSoundMemAll (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の ProcessStreamSoundMemAll() を呼び出します。
^p
元関数シグネチャ: int ProcessStreamSoundMemAll(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ProcessStreamSoundMemAll 項を参照。

%index
dx_LoadSoundMem2
DxLib LoadSoundMem2 (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName1
p2 : str FileName2
%inst
DxLib の LoadSoundMem2() を呼び出します。
^p
元関数シグネチャ: int LoadSoundMem2(const TCHAR * FileName1, const TCHAR * FileName2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadSoundMem2 項を参照。

%index
dx_LoadBGM
DxLib LoadBGM (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FileName
%inst
DxLib の LoadBGM() を呼び出します。
^p
元関数シグネチャ: int LoadBGM(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadBGM 項を参照。

%index
dx_LoadSoundMemBase
DxLib LoadSoundMemBase (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName
p2 : int BufferNum
p3 : int UnionHandle (default -1)
%inst
DxLib の LoadSoundMemBase() を呼び出します。
^p
元関数シグネチャ: int LoadSoundMemBase(const TCHAR * FileName, int BufferNum, int UnionHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadSoundMemBase 項を参照。

%index
dx_LoadSoundMemToBufNumSitei
DxLib LoadSoundMemToBufNumSitei (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName
p2 : int BufferNum
%inst
DxLib の LoadSoundMemToBufNumSitei() を呼び出します。
^p
元関数シグネチャ: int LoadSoundMemToBufNumSitei(const TCHAR * FileName, int BufferNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadSoundMemToBufNumSitei 項を参照。

%index
dx_DuplicateSoundMem
DxLib DuplicateSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SrcSoundHandle
p2 : int BufferNum (default 3)
%inst
DxLib の DuplicateSoundMem() を呼び出します。
^p
元関数シグネチャ: int DuplicateSoundMem(int SrcSoundHandle, int BufferNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DuplicateSoundMem 項を参照。

%index
dx_LoadSoundMemFromSoftSound
DxLib LoadSoundMemFromSoftSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoftSoundHandle
p2 : int BufferNum (default 3)
%inst
DxLib の LoadSoundMemFromSoftSound() を呼び出します。
^p
元関数シグネチャ: int LoadSoundMemFromSoftSound(int SoftSoundHandle, int BufferNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadSoundMemFromSoftSound 項を参照。

%index
dx_ChangePanSoundMem
DxLib ChangePanSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int PanPal
p2 : int SoundHandle
%inst
DxLib の ChangePanSoundMem() を呼び出します。
^p
元関数シグネチャ: int ChangePanSoundMem(int PanPal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangePanSoundMem 項を参照。

%index
dx_GetPanSoundMem
DxLib GetPanSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
%inst
DxLib の GetPanSoundMem() を呼び出します。
^p
元関数シグネチャ: int GetPanSoundMem(int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetPanSoundMem 項を参照。

%index
dx_ChangeVolumeSoundMem
DxLib ChangeVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int VolumePal
p2 : int SoundHandle
%inst
DxLib の ChangeVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int ChangeVolumeSoundMem(int VolumePal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeVolumeSoundMem 項を参照。

%index
dx_GetVolumeSoundMem
DxLib GetVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
%inst
DxLib の GetVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int GetVolumeSoundMem(int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetVolumeSoundMem 項を参照。

%index
dx_GetVolumeSoundMem2
DxLib GetVolumeSoundMem2 (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
%inst
DxLib の GetVolumeSoundMem2() を呼び出します。
^p
元関数シグネチャ: int GetVolumeSoundMem2(int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetVolumeSoundMem2 項を参照。

%index
dx_SetChannelVolumeSoundMem
DxLib SetChannelVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Channel
p2 : int VolumePal
p3 : int SoundHandle
%inst
DxLib の SetChannelVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetChannelVolumeSoundMem(int Channel, int VolumePal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetChannelVolumeSoundMem 項を参照。

%index
dx_ChangeChannelVolumeSoundMem
DxLib ChangeChannelVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Channel
p2 : int VolumePal
p3 : int SoundHandle
%inst
DxLib の ChangeChannelVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int ChangeChannelVolumeSoundMem(int Channel, int VolumePal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeChannelVolumeSoundMem 項を参照。

%index
dx_GetChannelVolumeSoundMem
DxLib GetChannelVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Channel
p2 : int SoundHandle
%inst
DxLib の GetChannelVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int GetChannelVolumeSoundMem(int Channel, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetChannelVolumeSoundMem 項を参照。

%index
dx_GetChannelVolumeSoundMem2
DxLib GetChannelVolumeSoundMem2 (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Channel
p2 : int SoundHandle
%inst
DxLib の GetChannelVolumeSoundMem2() を呼び出します。
^p
元関数シグネチャ: int GetChannelVolumeSoundMem2(int Channel, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetChannelVolumeSoundMem2 項を参照。

%index
dx_SetFrequencySoundMem
DxLib SetFrequencySoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int FrequencyPal
p2 : int SoundHandle
%inst
DxLib の SetFrequencySoundMem() を呼び出します。
^p
元関数シグネチャ: int SetFrequencySoundMem(int FrequencyPal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetFrequencySoundMem 項を参照。

%index
dx_GetFrequencySoundMem
DxLib GetFrequencySoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
%inst
DxLib の GetFrequencySoundMem() を呼び出します。
^p
元関数シグネチャ: int GetFrequencySoundMem(int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetFrequencySoundMem 項を参照。

%index
dx_ResetFrequencySoundMem
DxLib ResetFrequencySoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundHandle
%inst
DxLib の ResetFrequencySoundMem() を呼び出します。
^p
元関数シグネチャ: int ResetFrequencySoundMem(int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetFrequencySoundMem 項を参照。

%index
dx_SetNextPlayPanSoundMem
DxLib SetNextPlayPanSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int PanPal
p2 : int SoundHandle
%inst
DxLib の SetNextPlayPanSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetNextPlayPanSoundMem(int PanPal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNextPlayPanSoundMem 項を参照。

%index
dx_ChangeNextPlayPanSoundMem
DxLib ChangeNextPlayPanSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int PanPal
p2 : int SoundHandle
%inst
DxLib の ChangeNextPlayPanSoundMem() を呼び出します。
^p
元関数シグネチャ: int ChangeNextPlayPanSoundMem(int PanPal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeNextPlayPanSoundMem 項を参照。

%index
dx_SetNextPlayVolumeSoundMem
DxLib SetNextPlayVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int VolumePal
p2 : int SoundHandle
%inst
DxLib の SetNextPlayVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetNextPlayVolumeSoundMem(int VolumePal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNextPlayVolumeSoundMem 項を参照。

%index
dx_ChangeNextPlayVolumeSoundMem
DxLib ChangeNextPlayVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int VolumePal
p2 : int SoundHandle
%inst
DxLib の ChangeNextPlayVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int ChangeNextPlayVolumeSoundMem(int VolumePal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeNextPlayVolumeSoundMem 項を参照。

%index
dx_SetNextPlayChannelVolumeSoundMem
DxLib SetNextPlayChannelVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Channel
p2 : int VolumePal
p3 : int SoundHandle
%inst
DxLib の SetNextPlayChannelVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetNextPlayChannelVolumeSoundMem(int Channel, int VolumePal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNextPlayChannelVolumeSoundMem 項を参照。

%index
dx_ChangeNextPlayChannelVolumeSoundMem
DxLib ChangeNextPlayChannelVolumeSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Channel
p2 : int VolumePal
p3 : int SoundHandle
%inst
DxLib の ChangeNextPlayChannelVolumeSoundMem() を呼び出します。
^p
元関数シグネチャ: int ChangeNextPlayChannelVolumeSoundMem(int Channel, int VolumePal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ChangeNextPlayChannelVolumeSoundMem 項を参照。

%index
dx_SetNextPlayFrequencySoundMem
DxLib SetNextPlayFrequencySoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int FrequencyPal
p2 : int SoundHandle
%inst
DxLib の SetNextPlayFrequencySoundMem() を呼び出します。
^p
元関数シグネチャ: int SetNextPlayFrequencySoundMem(int FrequencyPal, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNextPlayFrequencySoundMem 項を参照。

%index
dx_SetCurrentPositionSoundMem
DxLib SetCurrentPositionSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SamplePosition
p2 : int SoundHandle
%inst
DxLib の SetCurrentPositionSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetCurrentPositionSoundMem(LONGLONG SamplePosition, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCurrentPositionSoundMem 項を参照。

%index
dx_SetSoundCurrentPosition
DxLib SetSoundCurrentPosition (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 Byte
p2 : int SoundHandle
%inst
DxLib の SetSoundCurrentPosition() を呼び出します。
^p
元関数シグネチャ: int SetSoundCurrentPosition(LONGLONG Byte, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetSoundCurrentPosition 項を参照。

%index
dx_SetSoundCurrentTime
DxLib SetSoundCurrentTime (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 Time
p2 : int SoundHandle
%inst
DxLib の SetSoundCurrentTime() を呼び出します。
^p
元関数シグネチャ: int SetSoundCurrentTime(LONGLONG Time, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetSoundCurrentTime 項を参照。

%index
dx_SetLoopPosSoundMem
DxLib SetLoopPosSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopTime
p2 : int SoundHandle
%inst
DxLib の SetLoopPosSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetLoopPosSoundMem(LONGLONG LoopTime, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLoopPosSoundMem 項を参照。

%index
dx_SetLoopTimePosSoundMem
DxLib SetLoopTimePosSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopTime
p2 : int SoundHandle
%inst
DxLib の SetLoopTimePosSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetLoopTimePosSoundMem(LONGLONG LoopTime, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLoopTimePosSoundMem 項を参照。

%index
dx_SetLoopSamplePosSoundMem
DxLib SetLoopSamplePosSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopSamplePosition
p2 : int SoundHandle
%inst
DxLib の SetLoopSamplePosSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetLoopSamplePosSoundMem(LONGLONG LoopSamplePosition, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLoopSamplePosSoundMem 項を参照。

%index
dx_SetLoopStartTimePosSoundMem
DxLib SetLoopStartTimePosSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopStartTime
p2 : int SoundHandle
%inst
DxLib の SetLoopStartTimePosSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetLoopStartTimePosSoundMem(LONGLONG LoopStartTime, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLoopStartTimePosSoundMem 項を参照。

%index
dx_SetLoopStartSamplePosSoundMem
DxLib SetLoopStartSamplePosSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopStartSamplePosition
p2 : int SoundHandle
%inst
DxLib の SetLoopStartSamplePosSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetLoopStartSamplePosSoundMem(LONGLONG LoopStartSamplePosition, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLoopStartSamplePosSoundMem 項を参照。

%index
dx_SetLoopAreaTimePosSoundMem
DxLib SetLoopAreaTimePosSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopStartTime
p2 : int64 LoopEndTime
p3 : int SoundHandle
%inst
DxLib の SetLoopAreaTimePosSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetLoopAreaTimePosSoundMem(LONGLONG LoopStartTime, LONGLONG LoopEndTime, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLoopAreaTimePosSoundMem 項を参照。

%index
dx_SetLoopAreaSamplePosSoundMem
DxLib SetLoopAreaSamplePosSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopStartSamplePosition
p2 : int64 LoopEndSamplePosition
p3 : int SoundHandle
%inst
DxLib の SetLoopAreaSamplePosSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetLoopAreaSamplePosSoundMem(LONGLONG LoopStartSamplePosition, LONGLONG LoopEndSamplePosition, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetLoopAreaSamplePosSoundMem 項を参照。

%index
dx_SetPlayFinishDeleteSoundMem
DxLib SetPlayFinishDeleteSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int DeleteFlag
p2 : int SoundHandle
%inst
DxLib の SetPlayFinishDeleteSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetPlayFinishDeleteSoundMem(int DeleteFlag, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetPlayFinishDeleteSoundMem 項を参照。

%index
dx_Set3DPositionSoundMem
DxLib Set3DPositionSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : int SoundHandle
%inst
DxLib の Set3DPositionSoundMem() を呼び出します。
^p
元関数シグネチャ: int Set3DPositionSoundMem(VECTOR Position, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DPositionSoundMem 項を参照。

%index
dx_Set3DRadiusSoundMem
DxLib Set3DRadiusSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : double (float 縮小) Radius
p2 : int SoundHandle
%inst
DxLib の Set3DRadiusSoundMem() を呼び出します。
^p
元関数シグネチャ: int Set3DRadiusSoundMem(float Radius, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DRadiusSoundMem 項を参照。

%index
dx_Set3DVelocitySoundMem
DxLib Set3DVelocitySoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Velocity
p2 : int SoundHandle
%inst
DxLib の Set3DVelocitySoundMem() を呼び出します。
^p
元関数シグネチャ: int Set3DVelocitySoundMem(VECTOR Velocity, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DVelocitySoundMem 項を参照。

%index
dx_SetNextPlay3DPositionSoundMem
DxLib SetNextPlay3DPositionSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : int SoundHandle
%inst
DxLib の SetNextPlay3DPositionSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetNextPlay3DPositionSoundMem(VECTOR Position, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNextPlay3DPositionSoundMem 項を参照。

%index
dx_SetNextPlay3DRadiusSoundMem
DxLib SetNextPlay3DRadiusSoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : double (float 縮小) Radius
p2 : int SoundHandle
%inst
DxLib の SetNextPlay3DRadiusSoundMem() を呼び出します。
^p
元関数シグネチャ: int SetNextPlay3DRadiusSoundMem(float Radius, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNextPlay3DRadiusSoundMem 項を参照。

%index
dx_SetNextPlay3DVelocitySoundMem
DxLib SetNextPlay3DVelocitySoundMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Velocity
p2 : int SoundHandle
%inst
DxLib の SetNextPlay3DVelocitySoundMem() を呼び出します。
^p
元関数シグネチャ: int SetNextPlay3DVelocitySoundMem(VECTOR Velocity, int SoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetNextPlay3DVelocitySoundMem 項を参照。

%index
dx_GetOggCommentNum
DxLib GetOggCommentNum (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str FileName
%inst
DxLib の GetOggCommentNum() を呼び出します。
^p
元関数シグネチャ: int GetOggCommentNum(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetOggCommentNum 項を参照。

%index
dx_SetCreateSoundDataType
DxLib SetCreateSoundDataType (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoundDataType
%inst
DxLib の SetCreateSoundDataType() を呼び出します。
^p
元関数シグネチャ: int SetCreateSoundDataType(int SoundDataType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateSoundDataType 項を参照。

%index
dx_GetCreateSoundDataType
DxLib GetCreateSoundDataType (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の GetCreateSoundDataType() を呼び出します。
^p
元関数シグネチャ: int GetCreateSoundDataType(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateSoundDataType 項を参照。

%index
dx_SetCreateSoundPitchRate
DxLib SetCreateSoundPitchRate (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : double (float 縮小) Cents
%inst
DxLib の SetCreateSoundPitchRate() を呼び出します。
^p
元関数シグネチャ: int SetCreateSoundPitchRate(float Cents)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateSoundPitchRate 項を参照。

%index
dx_SetCreateSoundTimeStretchRate
DxLib SetCreateSoundTimeStretchRate (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : double (float 縮小) Rate
%inst
DxLib の SetCreateSoundTimeStretchRate() を呼び出します。
^p
元関数シグネチャ: int SetCreateSoundTimeStretchRate(float Rate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateSoundTimeStretchRate 項を参照。

%index
dx_SetCreateSoundLoopAreaTimePos
DxLib SetCreateSoundLoopAreaTimePos (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopStartTime
p2 : int64 LoopEndTime
%inst
DxLib の SetCreateSoundLoopAreaTimePos() を呼び出します。
^p
元関数シグネチャ: int SetCreateSoundLoopAreaTimePos(LONGLONG LoopStartTime, LONGLONG LoopEndTime)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateSoundLoopAreaTimePos 項を参照。

%index
dx_SetCreateSoundLoopAreaSamplePos
DxLib SetCreateSoundLoopAreaSamplePos (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 LoopStartSamplePosition
p2 : int64 LoopEndSamplePosition
%inst
DxLib の SetCreateSoundLoopAreaSamplePos() を呼び出します。
^p
元関数シグネチャ: int SetCreateSoundLoopAreaSamplePos(LONGLONG LoopStartSamplePosition, LONGLONG LoopEndSamplePosition)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateSoundLoopAreaSamplePos 項を参照。

%index
dx_SetCreateSoundIgnoreLoopAreaInfo
DxLib SetCreateSoundIgnoreLoopAreaInfo (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int IgnoreFlag
%inst
DxLib の SetCreateSoundIgnoreLoopAreaInfo() を呼び出します。
^p
元関数シグネチャ: int SetCreateSoundIgnoreLoopAreaInfo(int IgnoreFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreateSoundIgnoreLoopAreaInfo 項を参照。

%index
dx_GetCreateSoundIgnoreLoopAreaInfo
DxLib GetCreateSoundIgnoreLoopAreaInfo (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の GetCreateSoundIgnoreLoopAreaInfo() を呼び出します。
^p
元関数シグネチャ: int GetCreateSoundIgnoreLoopAreaInfo(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetCreateSoundIgnoreLoopAreaInfo 項を参照。

%index
dx_SetDisableReadSoundFunctionMask
DxLib SetDisableReadSoundFunctionMask (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Mask
%inst
DxLib の SetDisableReadSoundFunctionMask() を呼び出します。
^p
元関数シグネチャ: int SetDisableReadSoundFunctionMask(int Mask)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDisableReadSoundFunctionMask 項を参照。

%index
dx_GetDisableReadSoundFunctionMask
DxLib GetDisableReadSoundFunctionMask (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の GetDisableReadSoundFunctionMask() を呼び出します。
^p
元関数シグネチャ: int GetDisableReadSoundFunctionMask(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetDisableReadSoundFunctionMask 項を参照。

%index
dx_SetEnableSoundCaptureFlag
DxLib SetEnableSoundCaptureFlag (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Flag
%inst
DxLib の SetEnableSoundCaptureFlag() を呼び出します。
^p
元関数シグネチャ: int SetEnableSoundCaptureFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetEnableSoundCaptureFlag 項を参照。

%index
dx_SetUseOldVolumeCalcFlag
DxLib SetUseOldVolumeCalcFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseOldVolumeCalcFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseOldVolumeCalcFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseOldVolumeCalcFlag 項を参照。

%index
dx_GetSoundCurrentTimeType
DxLib GetSoundCurrentTimeType (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の GetSoundCurrentTimeType() を呼び出します。
^p
元関数シグネチャ: int GetSoundCurrentTimeType(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetSoundCurrentTimeType 項を参照。

%index
dx_SetCreate3DSoundFlag
DxLib SetCreate3DSoundFlag (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Flag
%inst
DxLib の SetCreate3DSoundFlag() を呼び出します。
^p
元関数シグネチャ: int SetCreate3DSoundFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetCreate3DSoundFlag 項を参照。

%index
dx_Set3DSoundOneMetre
DxLib Set3DSoundOneMetre (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : double (float 縮小) Distance
%inst
DxLib の Set3DSoundOneMetre() を呼び出します。
^p
元関数シグネチャ: int Set3DSoundOneMetre(float Distance)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DSoundOneMetre 項を参照。

%index
dx_Set3DSoundListenerPosAndFrontPos_UpVecY
DxLib Set3DSoundListenerPosAndFrontPos_UpVecY (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : var (VECTOR: #defstruct float x,y,z) FrontPosition
%inst
DxLib の Set3DSoundListenerPosAndFrontPos_UpVecY() を呼び出します。
^p
元関数シグネチャ: int Set3DSoundListenerPosAndFrontPos_UpVecY(VECTOR Position, VECTOR FrontPosition)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DSoundListenerPosAndFrontPos_UpVecY 項を参照。

%index
dx_Set3DSoundListenerPosAndFrontPosAndUpVec
DxLib Set3DSoundListenerPosAndFrontPosAndUpVec (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Position
p2 : var (VECTOR: #defstruct float x,y,z) FrontPosition
p3 : var (VECTOR: #defstruct float x,y,z) UpVector
%inst
DxLib の Set3DSoundListenerPosAndFrontPosAndUpVec() を呼び出します。
^p
元関数シグネチャ: int Set3DSoundListenerPosAndFrontPosAndUpVec(VECTOR Position, VECTOR FrontPosition, VECTOR UpVector)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DSoundListenerPosAndFrontPosAndUpVec 項を参照。

%index
dx_Set3DSoundListenerVelocity
DxLib Set3DSoundListenerVelocity (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : var (VECTOR: #defstruct float x,y,z) Velocity
%inst
DxLib の Set3DSoundListenerVelocity() を呼び出します。
^p
元関数シグネチャ: int Set3DSoundListenerVelocity(VECTOR Velocity)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DSoundListenerVelocity 項を参照。

%index
dx_Set3DSoundListenerConeAngle
DxLib Set3DSoundListenerConeAngle (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : double (float 縮小) InnerAngle
p2 : double (float 縮小) OuterAngle
%inst
DxLib の Set3DSoundListenerConeAngle() を呼び出します。
^p
元関数シグネチャ: int Set3DSoundListenerConeAngle(float InnerAngle, float OuterAngle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DSoundListenerConeAngle 項を参照。

%index
dx_Set3DSoundListenerConeVolume
DxLib Set3DSoundListenerConeVolume (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : double (float 縮小) InnerAngleVolume
p2 : double (float 縮小) OuterAngleVolume
%inst
DxLib の Set3DSoundListenerConeVolume() を呼び出します。
^p
元関数シグネチャ: int Set3DSoundListenerConeVolume(float InnerAngleVolume, float OuterAngleVolume)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Set3DSoundListenerConeVolume 項を参照。

%index
dx_SetBeepFrequency
DxLib SetBeepFrequency (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Freq
%inst
DxLib の SetBeepFrequency() を呼び出します。
^p
元関数シグネチャ: int SetBeepFrequency(int Freq)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetBeepFrequency 項を参照。

%index
dx_PlayBeep
DxLib PlayBeep (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
(引数なし)
%inst
DxLib の PlayBeep() を呼び出します。
^p
元関数シグネチャ: int PlayBeep(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PlayBeep 項を参照。

%index
dx_StopBeep
DxLib StopBeep (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の StopBeep() を呼び出します。
^p
元関数シグネチャ: int StopBeep(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopBeep 項を参照。

%index
dx_PlaySoundFile
DxLib PlaySoundFile (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName
p2 : int PlayType
%inst
DxLib の PlaySoundFile() を呼び出します。
^p
元関数シグネチャ: int PlaySoundFile(const TCHAR * FileName, int PlayType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PlaySoundFile 項を参照。

%index
dx_PlaySound
DxLib PlaySound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName
p2 : int PlayType
%inst
DxLib の PlaySound() を呼び出します。
^p
元関数シグネチャ: int PlaySound(const TCHAR * FileName, int PlayType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PlaySound 項を参照。

%index
dx_PlaySoundDX
DxLib PlaySoundDX (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName
p2 : int PlayType
%inst
DxLib の PlaySoundDX() を呼び出します。
^p
元関数シグネチャ: int PlaySoundDX(const TCHAR * FileName, int PlayType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PlaySoundDX 項を参照。

%index
dx_CheckSoundFile
DxLib CheckSoundFile (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の CheckSoundFile() を呼び出します。
^p
元関数シグネチャ: int CheckSoundFile(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckSoundFile 項を参照。

%index
dx_CheckSound
DxLib CheckSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の CheckSound() を呼び出します。
^p
元関数シグネチャ: int CheckSound(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckSound 項を参照。

%index
dx_StopSoundFile
DxLib StopSoundFile (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の StopSoundFile() を呼び出します。
^p
元関数シグネチャ: int StopSoundFile(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopSoundFile 項を参照。

%index
dx_StopSound
DxLib StopSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の StopSound() を呼び出します。
^p
元関数シグネチャ: int StopSound(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopSound 項を参照。

%index
dx_SetVolumeSoundFile
DxLib SetVolumeSoundFile (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int VolumePal
%inst
DxLib の SetVolumeSoundFile() を呼び出します。
^p
元関数シグネチャ: int SetVolumeSoundFile(int VolumePal)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVolumeSoundFile 項を参照。

%index
dx_SetVolumeSound
DxLib SetVolumeSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int VolumePal
%inst
DxLib の SetVolumeSound() を呼び出します。
^p
元関数シグネチャ: int SetVolumeSound(int VolumePal)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVolumeSound 項を参照。

%index
dx_InitSoftSound
DxLib InitSoftSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の InitSoftSound() を呼び出します。
^p
元関数シグネチャ: int InitSoftSound(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitSoftSound 項を参照。

%index
dx_LoadSoftSound
DxLib LoadSoftSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName
%inst
DxLib の LoadSoftSound() を呼び出します。
^p
元関数シグネチャ: int LoadSoftSound(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadSoftSound 項を参照。

%index
dx_MakeSoftSound
DxLib MakeSoftSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int UseFormat_SoftSoundHandle
p2 : int64 SampleNum
%inst
DxLib の MakeSoftSound() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound(int UseFormat_SoftSoundHandle, LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound 項を参照。

%index
dx_MakeSoftSound2Ch16Bit44KHz
DxLib MakeSoftSound2Ch16Bit44KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SampleNum
%inst
DxLib の MakeSoftSound2Ch16Bit44KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound2Ch16Bit44KHz(LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound2Ch16Bit44KHz 項を参照。

%index
dx_MakeSoftSound2Ch16Bit22KHz
DxLib MakeSoftSound2Ch16Bit22KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SampleNum
%inst
DxLib の MakeSoftSound2Ch16Bit22KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound2Ch16Bit22KHz(LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound2Ch16Bit22KHz 項を参照。

%index
dx_MakeSoftSound2Ch8Bit44KHz
DxLib MakeSoftSound2Ch8Bit44KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SampleNum
%inst
DxLib の MakeSoftSound2Ch8Bit44KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound2Ch8Bit44KHz(LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound2Ch8Bit44KHz 項を参照。

%index
dx_MakeSoftSound2Ch8Bit22KHz
DxLib MakeSoftSound2Ch8Bit22KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SampleNum
%inst
DxLib の MakeSoftSound2Ch8Bit22KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound2Ch8Bit22KHz(LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound2Ch8Bit22KHz 項を参照。

%index
dx_MakeSoftSound1Ch16Bit44KHz
DxLib MakeSoftSound1Ch16Bit44KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SampleNum
%inst
DxLib の MakeSoftSound1Ch16Bit44KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound1Ch16Bit44KHz(LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound1Ch16Bit44KHz 項を参照。

%index
dx_MakeSoftSound1Ch16Bit22KHz
DxLib MakeSoftSound1Ch16Bit22KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SampleNum
%inst
DxLib の MakeSoftSound1Ch16Bit22KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound1Ch16Bit22KHz(LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound1Ch16Bit22KHz 項を参照。

%index
dx_MakeSoftSound1Ch8Bit44KHz
DxLib MakeSoftSound1Ch8Bit44KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SampleNum
%inst
DxLib の MakeSoftSound1Ch8Bit44KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound1Ch8Bit44KHz(LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound1Ch8Bit44KHz 項を参照。

%index
dx_MakeSoftSound1Ch8Bit22KHz
DxLib MakeSoftSound1Ch8Bit22KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int64 SampleNum
%inst
DxLib の MakeSoftSound1Ch8Bit22KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSound1Ch8Bit22KHz(LONGLONG SampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSound1Ch8Bit22KHz 項を参照。

%index
dx_MakeSoftSoundCustom
DxLib MakeSoftSoundCustom (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int ChannelNum
p2 : int BitsPerSample
p3 : int SamplesPerSec
p4 : int64 SampleNum
p5 : int IsFloatType (default 0)
%inst
DxLib の MakeSoftSoundCustom() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundCustom(int ChannelNum, int BitsPerSample, int SamplesPerSec, LONGLONG SampleNum, int IsFloatType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundCustom 項を参照。

%index
dx_DeleteSoftSound
DxLib DeleteSoftSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoftSoundHandle
%inst
DxLib の DeleteSoftSound() を呼び出します。
^p
元関数シグネチャ: int DeleteSoftSound(int SoftSoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteSoftSound 項を参照。

%index
dx_SaveSoftSound
DxLib SaveSoftSound (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoftSoundHandle
p2 : str FileName
%inst
DxLib の SaveSoftSound() を呼び出します。
^p
元関数シグネチャ: int SaveSoftSound(int SoftSoundHandle, const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SaveSoftSound 項を参照。

%index
dx_WriteSoftSoundData
DxLib WriteSoftSoundData (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoftSoundHandle
p2 : int64 SamplePosition
p3 : int Channel1
p4 : int Channel2
%inst
DxLib の WriteSoftSoundData() を呼び出します。
^p
元関数シグネチャ: int WriteSoftSoundData(int SoftSoundHandle, LONGLONG SamplePosition, int Channel1, int Channel2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WriteSoftSoundData 項を参照。

%index
dx_WriteSoftSoundDataF
DxLib WriteSoftSoundDataF (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SoftSoundHandle
p2 : int64 SamplePosition
p3 : double (float 縮小) Channel1
p4 : double (float 縮小) Channel2
%inst
DxLib の WriteSoftSoundDataF() を呼び出します。
^p
元関数シグネチャ: int WriteSoftSoundDataF(int SoftSoundHandle, LONGLONG SamplePosition, float Channel1, float Channel2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WriteSoftSoundDataF 項を参照。

%index
dx_WriteTimeStretchSoftSoundData
DxLib WriteTimeStretchSoftSoundData (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SrcSoftSoundHandle
p2 : int DestSoftSoundHandle
%inst
DxLib の WriteTimeStretchSoftSoundData() を呼び出します。
^p
元関数シグネチャ: int WriteTimeStretchSoftSoundData(int SrcSoftSoundHandle, int DestSoftSoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WriteTimeStretchSoftSoundData 項を参照。

%index
dx_WritePitchShiftSoftSoundData
DxLib WritePitchShiftSoftSoundData (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SrcSoftSoundHandle
p2 : int DestSoftSoundHandle
%inst
DxLib の WritePitchShiftSoftSoundData() を呼び出します。
^p
元関数シグネチャ: int WritePitchShiftSoftSoundData(int SrcSoftSoundHandle, int DestSoftSoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の WritePitchShiftSoftSoundData 項を参照。

%index
dx_InitSoftSoundPlayer
DxLib InitSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の InitSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int InitSoftSoundPlayer(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitSoftSoundPlayer 項を参照。

%index
dx_MakeSoftSoundPlayer
DxLib MakeSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int UseFormat_SoftSoundHandle
%inst
DxLib の MakeSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer(int UseFormat_SoftSoundHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer 項を参照。

%index
dx_MakeSoftSoundPlayer2Ch16Bit44KHz
DxLib MakeSoftSoundPlayer2Ch16Bit44KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の MakeSoftSoundPlayer2Ch16Bit44KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer2Ch16Bit44KHz(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer2Ch16Bit44KHz 項を参照。

%index
dx_MakeSoftSoundPlayer2Ch16Bit22KHz
DxLib MakeSoftSoundPlayer2Ch16Bit22KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の MakeSoftSoundPlayer2Ch16Bit22KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer2Ch16Bit22KHz(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer2Ch16Bit22KHz 項を参照。

%index
dx_MakeSoftSoundPlayer2Ch8Bit44KHz
DxLib MakeSoftSoundPlayer2Ch8Bit44KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の MakeSoftSoundPlayer2Ch8Bit44KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer2Ch8Bit44KHz(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer2Ch8Bit44KHz 項を参照。

%index
dx_MakeSoftSoundPlayer2Ch8Bit22KHz
DxLib MakeSoftSoundPlayer2Ch8Bit22KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の MakeSoftSoundPlayer2Ch8Bit22KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer2Ch8Bit22KHz(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer2Ch8Bit22KHz 項を参照。

%index
dx_MakeSoftSoundPlayer1Ch16Bit44KHz
DxLib MakeSoftSoundPlayer1Ch16Bit44KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の MakeSoftSoundPlayer1Ch16Bit44KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer1Ch16Bit44KHz(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer1Ch16Bit44KHz 項を参照。

%index
dx_MakeSoftSoundPlayer1Ch16Bit22KHz
DxLib MakeSoftSoundPlayer1Ch16Bit22KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の MakeSoftSoundPlayer1Ch16Bit22KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer1Ch16Bit22KHz(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer1Ch16Bit22KHz 項を参照。

%index
dx_MakeSoftSoundPlayer1Ch8Bit44KHz
DxLib MakeSoftSoundPlayer1Ch8Bit44KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の MakeSoftSoundPlayer1Ch8Bit44KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer1Ch8Bit44KHz(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer1Ch8Bit44KHz 項を参照。

%index
dx_MakeSoftSoundPlayer1Ch8Bit22KHz
DxLib MakeSoftSoundPlayer1Ch8Bit22KHz (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の MakeSoftSoundPlayer1Ch8Bit22KHz() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayer1Ch8Bit22KHz(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayer1Ch8Bit22KHz 項を参照。

%index
dx_MakeSoftSoundPlayerCustom
DxLib MakeSoftSoundPlayerCustom (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int ChannelNum
p2 : int BitsPerSample
p3 : int SamplesPerSec
%inst
DxLib の MakeSoftSoundPlayerCustom() を呼び出します。
^p
元関数シグネチャ: int MakeSoftSoundPlayerCustom(int ChannelNum, int BitsPerSample, int SamplesPerSec)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MakeSoftSoundPlayerCustom 項を参照。

%index
dx_DeleteSoftSoundPlayer
DxLib DeleteSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SSoundPlayerHandle
%inst
DxLib の DeleteSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int DeleteSoftSoundPlayer(int SSoundPlayerHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteSoftSoundPlayer 項を参照。

%index
dx_AddDataSoftSoundPlayer
DxLib AddDataSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SSoundPlayerHandle
p2 : int SoftSoundHandle
p3 : int64 AddSamplePosition
p4 : int AddSampleNum
%inst
DxLib の AddDataSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int AddDataSoftSoundPlayer(int SSoundPlayerHandle, int SoftSoundHandle, LONGLONG AddSamplePosition, int AddSampleNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の AddDataSoftSoundPlayer 項を参照。

%index
dx_AddOneDataSoftSoundPlayer
DxLib AddOneDataSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SSoundPlayerHandle
p2 : int Channel1
p3 : int Channel2
%inst
DxLib の AddOneDataSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int AddOneDataSoftSoundPlayer(int SSoundPlayerHandle, int Channel1, int Channel2)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の AddOneDataSoftSoundPlayer 項を参照。

%index
dx_StartSoftSoundPlayer
DxLib StartSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SSoundPlayerHandle
%inst
DxLib の StartSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int StartSoftSoundPlayer(int SSoundPlayerHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StartSoftSoundPlayer 項を参照。

%index
dx_CheckStartSoftSoundPlayer
DxLib CheckStartSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SSoundPlayerHandle
%inst
DxLib の CheckStartSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int CheckStartSoftSoundPlayer(int SSoundPlayerHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckStartSoftSoundPlayer 項を参照。

%index
dx_StopSoftSoundPlayer
DxLib StopSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SSoundPlayerHandle
%inst
DxLib の StopSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int StopSoftSoundPlayer(int SSoundPlayerHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopSoftSoundPlayer 項を参照。

%index
dx_ResetSoftSoundPlayer
DxLib ResetSoftSoundPlayer (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SSoundPlayerHandle
%inst
DxLib の ResetSoftSoundPlayer() を呼び出します。
^p
元関数シグネチャ: int ResetSoftSoundPlayer(int SSoundPlayerHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ResetSoftSoundPlayer 項を参照。

%index
dx_CheckSoftSoundPlayerNoneData
DxLib CheckSoftSoundPlayerNoneData (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int SSoundPlayerHandle
%inst
DxLib の CheckSoftSoundPlayerNoneData() を呼び出します。
^p
元関数シグネチャ: int CheckSoftSoundPlayerNoneData(int SSoundPlayerHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckSoftSoundPlayerNoneData 項を参照。

%index
dx_DeleteMusicMem
DxLib DeleteMusicMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int MusicHandle
%inst
DxLib の DeleteMusicMem() を呼び出します。
^p
元関数シグネチャ: int DeleteMusicMem(int MusicHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DeleteMusicMem 項を参照。

%index
dx_LoadMusicMem
DxLib LoadMusicMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName
%inst
DxLib の LoadMusicMem() を呼び出します。
^p
元関数シグネチャ: int LoadMusicMem(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の LoadMusicMem 項を参照。

%index
dx_PlayMusicMem
DxLib PlayMusicMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int MusicHandle
p2 : int PlayType
%inst
DxLib の PlayMusicMem() を呼び出します。
^p
元関数シグネチャ: int PlayMusicMem(int MusicHandle, int PlayType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PlayMusicMem 項を参照。

%index
dx_StopMusicMem
DxLib StopMusicMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int MusicHandle
%inst
DxLib の StopMusicMem() を呼び出します。
^p
元関数シグネチャ: int StopMusicMem(int MusicHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopMusicMem 項を参照。

%index
dx_CheckMusicMem
DxLib CheckMusicMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int MusicHandle
%inst
DxLib の CheckMusicMem() を呼び出します。
^p
元関数シグネチャ: int CheckMusicMem(int MusicHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckMusicMem 項を参照。

%index
dx_SetVolumeMusicMem
DxLib SetVolumeMusicMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Volume
p2 : int MusicHandle
%inst
DxLib の SetVolumeMusicMem() を呼び出します。
^p
元関数シグネチャ: int SetVolumeMusicMem(int Volume, int MusicHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVolumeMusicMem 項を参照。

%index
dx_GetMusicMemPosition
DxLib GetMusicMemPosition (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int MusicHandle
%inst
DxLib の GetMusicMemPosition() を呼び出します。
^p
元関数シグネチャ: int GetMusicMemPosition(int MusicHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMusicMemPosition 項を参照。

%index
dx_InitMusicMem
DxLib InitMusicMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の InitMusicMem() を呼び出します。
^p
元関数シグネチャ: int InitMusicMem(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の InitMusicMem 項を参照。

%index
dx_ProcessMusicMem
DxLib ProcessMusicMem (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の ProcessMusicMem() を呼び出します。
^p
元関数シグネチャ: int ProcessMusicMem(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の ProcessMusicMem 項を参照。

%index
dx_PlayMusic
DxLib PlayMusic (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : str FileName
p2 : int PlayType
%inst
DxLib の PlayMusic() を呼び出します。
^p
元関数シグネチャ: int PlayMusic(const TCHAR * FileName, int PlayType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の PlayMusic 項を参照。

%index
dx_SetVolumeMusic
DxLib SetVolumeMusic (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
p1 : int Volume
%inst
DxLib の SetVolumeMusic() を呼び出します。
^p
元関数シグネチャ: int SetVolumeMusic(int Volume)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetVolumeMusic 項を参照。

%index
dx_StopMusic
DxLib StopMusic (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の StopMusic() を呼び出します。
^p
元関数シグネチャ: int StopMusic(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の StopMusic 項を参照。

%index
dx_CheckMusic
DxLib CheckMusic (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の CheckMusic() を呼び出します。
^p
元関数シグネチャ: int CheckMusic(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の CheckMusic 項を参照。

%index
dx_GetMusicPosition
DxLib GetMusicPosition (自動生成、hsp3dx 専用)
%group
DxLib サウンド
%prm
(引数なし)
%inst
DxLib の GetMusicPosition() を呼び出します。
^p
元関数シグネチャ: int GetMusicPosition(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の GetMusicPosition 項を参照。

%index
dx_SelectMidiMode
DxLib SelectMidiMode (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Mode
%inst
DxLib の SelectMidiMode() を呼び出します。
^p
元関数シグネチャ: int SelectMidiMode(int Mode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SelectMidiMode 項を参照。

%index
dx_SetUseDXArchiveFlag
DxLib SetUseDXArchiveFlag (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Flag
%inst
DxLib の SetUseDXArchiveFlag() を呼び出します。
^p
元関数シグネチャ: int SetUseDXArchiveFlag(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetUseDXArchiveFlag 項を参照。

%index
dx_SetDXArchivePriority
DxLib SetDXArchivePriority (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : int Priority (default 0)
%inst
DxLib の SetDXArchivePriority() を呼び出します。
^p
元関数シグネチャ: int SetDXArchivePriority(int Priority)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDXArchivePriority 項を参照。

%index
dx_SetDXArchiveExtension
DxLib SetDXArchiveExtension (自動生成、hsp3dx 専用)
%group
DxLib 設定 / 取得
%prm
p1 : str Extension (default NULL)
%inst
DxLib の SetDXArchiveExtension() を呼び出します。
^p
元関数シグネチャ: int SetDXArchiveExtension(const TCHAR * Extension)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDXArchiveExtension 項を参照。

%index
dx_SetDXArchiveKeyString
DxLib SetDXArchiveKeyString (自動生成、hsp3dx 専用)
%group
DxLib 入力
%prm
p1 : str KeyString (default NULL)
%inst
DxLib の SetDXArchiveKeyString() を呼び出します。
^p
元関数シグネチャ: int SetDXArchiveKeyString(const TCHAR * KeyString)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の SetDXArchiveKeyString 項を参照。

%index
dx_DXArchivePreLoad
DxLib DXArchivePreLoad (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str FilePath
p2 : int ASync (default FALSE)
%inst
DxLib の DXArchivePreLoad() を呼び出します。
^p
元関数シグネチャ: int DXArchivePreLoad(const TCHAR * FilePath, int ASync)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DXArchivePreLoad 項を参照。

%index
dx_DXArchiveCheckIdle
DxLib DXArchiveCheckIdle (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str FilePath
%inst
DxLib の DXArchiveCheckIdle() を呼び出します。
^p
元関数シグネチャ: int DXArchiveCheckIdle(const TCHAR * FilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DXArchiveCheckIdle 項を参照。

%index
dx_DXArchiveRelease
DxLib DXArchiveRelease (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str FilePath
%inst
DxLib の DXArchiveRelease() を呼び出します。
^p
元関数シグネチャ: int DXArchiveRelease(const TCHAR * FilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DXArchiveRelease 項を参照。

%index
dx_DXArchiveCheckFile
DxLib DXArchiveCheckFile (自動生成、hsp3dx 専用)
%group
DxLib ファイル
%prm
p1 : str FilePath
p2 : str TargetFilePath
%inst
DxLib の DXArchiveCheckFile() を呼び出します。
^p
元関数シグネチャ: int DXArchiveCheckFile(const TCHAR * FilePath, const TCHAR * TargetFilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の DXArchiveCheckFile 項を参照。

%index
dx_MV1DuplicateModel
DxLib MV1DuplicateModel (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int SrcMHandle
%inst
DxLib の MV1DuplicateModel() を呼び出します。
^p
元関数シグネチャ: int MV1DuplicateModel(int SrcMHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1DuplicateModel 項を参照。

%index
dx_MV1CreateCloneModel
DxLib MV1CreateCloneModel (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int SrcMHandle
%inst
DxLib の MV1CreateCloneModel() を呼び出します。
^p
元関数シグネチャ: int MV1CreateCloneModel(int SrcMHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1CreateCloneModel 項を参照。

%index
dx_MV1InitModel
DxLib MV1InitModel (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
(引数なし)
%inst
DxLib の MV1InitModel() を呼び出します。
^p
元関数シグネチャ: int MV1InitModel(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1InitModel 項を参照。

%index
dx_MV1SetLoadModelReMakeNormal
DxLib MV1SetLoadModelReMakeNormal (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int Flag
%inst
DxLib の MV1SetLoadModelReMakeNormal() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelReMakeNormal(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelReMakeNormal 項を参照。

%index
dx_MV1SetLoadModelReMakeNormalSmoothingAngle
DxLib MV1SetLoadModelReMakeNormalSmoothingAngle (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : double (float 縮小) SmoothingAngle (default 1.562069f)
%inst
DxLib の MV1SetLoadModelReMakeNormalSmoothingAngle() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelReMakeNormalSmoothingAngle(float SmoothingAngle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelReMakeNormalSmoothingAngle 項を参照。

%index
dx_MV1SetLoadModelIgnoreScaling
DxLib MV1SetLoadModelIgnoreScaling (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int Flag
%inst
DxLib の MV1SetLoadModelIgnoreScaling() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelIgnoreScaling(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelIgnoreScaling 項を参照。

%index
dx_MV1SetLoadModelPositionOptimize
DxLib MV1SetLoadModelPositionOptimize (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int Flag
%inst
DxLib の MV1SetLoadModelPositionOptimize() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelPositionOptimize(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelPositionOptimize 項を参照。

%index
dx_MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon
DxLib MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int Flag
%inst
DxLib の MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon 項を参照。

%index
dx_MV1SetLoadModelPhysicsWorldGravity
DxLib MV1SetLoadModelPhysicsWorldGravity (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : double (float 縮小) Gravity
%inst
DxLib の MV1SetLoadModelPhysicsWorldGravity() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelPhysicsWorldGravity(float Gravity)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelPhysicsWorldGravity 項を参照。

%index
dx_MV1SetLoadCalcPhysicsWorldGravity
DxLib MV1SetLoadCalcPhysicsWorldGravity (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int GravityNo
p2 : var (VECTOR: #defstruct float x,y,z) Gravity
%inst
DxLib の MV1SetLoadCalcPhysicsWorldGravity() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadCalcPhysicsWorldGravity(int GravityNo, VECTOR Gravity)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadCalcPhysicsWorldGravity 項を参照。

%index
dx_MV1SetLoadModelPhysicsCalcPrecision
DxLib MV1SetLoadModelPhysicsCalcPrecision (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int Precision
%inst
DxLib の MV1SetLoadModelPhysicsCalcPrecision() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelPhysicsCalcPrecision(int Precision)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelPhysicsCalcPrecision 項を参照。

%index
dx_MV1AddLoadModelDisablePhysicsNameWord
DxLib MV1AddLoadModelDisablePhysicsNameWord (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : str NameWord
%inst
DxLib の MV1AddLoadModelDisablePhysicsNameWord() を呼び出します。
^p
元関数シグネチャ: int MV1AddLoadModelDisablePhysicsNameWord(const TCHAR * NameWord)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1AddLoadModelDisablePhysicsNameWord 項を参照。

%index
dx_MV1ResetLoadModelDisablePhysicsNameWord
DxLib MV1ResetLoadModelDisablePhysicsNameWord (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
(引数なし)
%inst
DxLib の MV1ResetLoadModelDisablePhysicsNameWord() を呼び出します。
^p
元関数シグネチャ: int MV1ResetLoadModelDisablePhysicsNameWord(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1ResetLoadModelDisablePhysicsNameWord 項を参照。

%index
dx_MV1SetLoadModelAnimFilePath
DxLib MV1SetLoadModelAnimFilePath (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : str FileName
%inst
DxLib の MV1SetLoadModelAnimFilePath() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelAnimFilePath(const TCHAR * FileName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelAnimFilePath 項を参照。

%index
dx_MV1SetLoadModelUsePackDraw
DxLib MV1SetLoadModelUsePackDraw (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int Flag
%inst
DxLib の MV1SetLoadModelUsePackDraw() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelUsePackDraw(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelUsePackDraw 項を参照。

%index
dx_MV1SetLoadModelTriangleListUseMaxBoneNum
DxLib MV1SetLoadModelTriangleListUseMaxBoneNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int UseMaxBoneNum
%inst
DxLib の MV1SetLoadModelTriangleListUseMaxBoneNum() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelTriangleListUseMaxBoneNum(int UseMaxBoneNum)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelTriangleListUseMaxBoneNum 項を参照。

%index
dx_MV1SetLoadModelTextureLoad
DxLib MV1SetLoadModelTextureLoad (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int Flag
%inst
DxLib の MV1SetLoadModelTextureLoad() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelTextureLoad(int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelTextureLoad 項を参照。

%index
dx_MV1SetLoadModelIgnoreIK
DxLib MV1SetLoadModelIgnoreIK (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int IgnoreFlag
%inst
DxLib の MV1SetLoadModelIgnoreIK() を呼び出します。
^p
元関数シグネチャ: int MV1SetLoadModelIgnoreIK(int IgnoreFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetLoadModelIgnoreIK 項を参照。

%index
dx_MV1SaveModelToMV1File
DxLib MV1SaveModelToMV1File (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : str FileName
p3 : int SaveType (default MV1_SAVETYPE_NORMAL)
p4 : int AnimMHandle (default -1)
p5 : int AnimNameCheck (default TRUE)
p6 : int Normal8BitFlag (default 1)
p7 : int Position16BitFlag (default 1)
p8 : int Weight8BitFlag (default 0)
p9 : int Anim16BitFlag (default 1)
%inst
DxLib の MV1SaveModelToMV1File() を呼び出します。
^p
元関数シグネチャ: int MV1SaveModelToMV1File(int MHandle, const TCHAR * FileName, int SaveType, int AnimMHandle, int AnimNameCheck, int Normal8BitFlag, int Position16BitFlag, int Weight8BitFlag, int Anim16BitFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SaveModelToMV1File 項を参照。

%index
dx_MV1SaveModelToXFile
DxLib MV1SaveModelToXFile (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : str FileName
p3 : int SaveType (default MV1_SAVETYPE_NORMAL)
p4 : int AnimMHandle (default -1)
p5 : int AnimNameCheck (default TRUE)
%inst
DxLib の MV1SaveModelToXFile() を呼び出します。
^p
元関数シグネチャ: int MV1SaveModelToXFile(int MHandle, const TCHAR * FileName, int SaveType, int AnimMHandle, int AnimNameCheck)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SaveModelToXFile 項を参照。

%index
dx_MV1DrawFrame
DxLib MV1DrawFrame (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1DrawFrame() を呼び出します。
^p
元関数シグネチャ: int MV1DrawFrame(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1DrawFrame 項を参照。

%index
dx_MV1DrawMesh
DxLib MV1DrawMesh (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1DrawMesh() を呼び出します。
^p
元関数シグネチャ: int MV1DrawMesh(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1DrawMesh 項を参照。

%index
dx_MV1DrawTriangleList
DxLib MV1DrawTriangleList (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TriangleListIndex
%inst
DxLib の MV1DrawTriangleList() を呼び出します。
^p
元関数シグネチャ: int MV1DrawTriangleList(int MHandle, int TriangleListIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1DrawTriangleList 項を参照。

%index
dx_MV1DrawModelDebug
DxLib MV1DrawModelDebug (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int (uint 扱い) Color
p3 : int IsNormalLine
p4 : double (float 縮小) NormalLineLength
p5 : int IsPolyLine
p6 : int IsCollisionBox
%inst
DxLib の MV1DrawModelDebug() を呼び出します。
^p
元関数シグネチャ: int MV1DrawModelDebug(int MHandle, unsigned int Color, int IsNormalLine, float NormalLineLength, int IsPolyLine, int IsCollisionBox)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1DrawModelDebug 項を参照。

%index
dx_MV1SetUseOrigShader
DxLib MV1SetUseOrigShader (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int UseFlag
%inst
DxLib の MV1SetUseOrigShader() を呼び出します。
^p
元関数シグネチャ: int MV1SetUseOrigShader(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetUseOrigShader 項を参照。

%index
dx_MV1SetPositionD
DxLib MV1SetPositionD (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (VECTOR_D: #defstruct double x,y,z) Position
%inst
DxLib の MV1SetPositionD() を呼び出します。
^p
元関数シグネチャ: int MV1SetPositionD(int MHandle, VECTOR_D Position)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetPositionD 項を参照。

%index
dx_MV1SetRotationZYAxis
DxLib MV1SetRotationZYAxis (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (VECTOR: #defstruct float x,y,z) ZAxisDirection
p3 : var (VECTOR: #defstruct float x,y,z) YAxisDirection
p4 : double (float 縮小) ZAxisTwistRotate
%inst
DxLib の MV1SetRotationZYAxis() を呼び出します。
^p
元関数シグネチャ: int MV1SetRotationZYAxis(int MHandle, VECTOR ZAxisDirection, VECTOR YAxisDirection, float ZAxisTwistRotate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetRotationZYAxis 項を参照。

%index
dx_MV1SetRotationYUseDir
DxLib MV1SetRotationYUseDir (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (VECTOR: #defstruct float x,y,z) Direction
p3 : double (float 縮小) OffsetYAngle
%inst
DxLib の MV1SetRotationYUseDir() を呼び出します。
^p
元関数シグネチャ: int MV1SetRotationYUseDir(int MHandle, VECTOR Direction, float OffsetYAngle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetRotationYUseDir 項を参照。

%index
dx_MV1SetRotationMatrix
DxLib MV1SetRotationMatrix (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (MATRIX: 4x4 float) Matrix
%inst
DxLib の MV1SetRotationMatrix() を呼び出します。
^p
元関数シグネチャ: int MV1SetRotationMatrix(int MHandle, MATRIX Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetRotationMatrix 項を参照。

%index
dx_MV1SetMatrix
DxLib MV1SetMatrix (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (MATRIX: 4x4 float) Matrix
%inst
DxLib の MV1SetMatrix() を呼び出します。
^p
元関数シグネチャ: int MV1SetMatrix(int MHandle, MATRIX Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMatrix 項を参照。

%index
dx_MV1SetMatrixD
DxLib MV1SetMatrixD (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (MATRIX_D: 4x4 double) Matrix
%inst
DxLib の MV1SetMatrixD() を呼び出します。
^p
元関数シグネチャ: int MV1SetMatrixD(int MHandle, MATRIX_D Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMatrixD 項を参照。

%index
dx_MV1SetVisible
DxLib MV1SetVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int VisibleFlag
%inst
DxLib の MV1SetVisible() を呼び出します。
^p
元関数シグネチャ: int MV1SetVisible(int MHandle, int VisibleFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetVisible 項を参照。

%index
dx_MV1GetVisible
DxLib MV1GetVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetVisible() を呼び出します。
^p
元関数シグネチャ: int MV1GetVisible(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetVisible 項を参照。

%index
dx_MV1SetMeshCategoryVisible
DxLib MV1SetMeshCategoryVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshCategory
p3 : int VisibleFlag
%inst
DxLib の MV1SetMeshCategoryVisible() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshCategoryVisible(int MHandle, int MeshCategory, int VisibleFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshCategoryVisible 項を参照。

%index
dx_MV1GetMeshCategoryVisible
DxLib MV1GetMeshCategoryVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshCategory
%inst
DxLib の MV1GetMeshCategoryVisible() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshCategoryVisible(int MHandle, int MeshCategory)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshCategoryVisible 項を参照。

%index
dx_MV1SetDifColorScale
DxLib MV1SetDifColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetDifColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetDifColorScale(int MHandle, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetDifColorScale 項を参照。

%index
dx_MV1SetSpcColorScale
DxLib MV1SetSpcColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetSpcColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetSpcColorScale(int MHandle, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetSpcColorScale 項を参照。

%index
dx_MV1SetEmiColorScale
DxLib MV1SetEmiColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetEmiColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetEmiColorScale(int MHandle, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetEmiColorScale 項を参照。

%index
dx_MV1SetAmbColorScale
DxLib MV1SetAmbColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetAmbColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetAmbColorScale(int MHandle, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetAmbColorScale 項を参照。

%index
dx_MV1GetSemiTransState
DxLib MV1GetSemiTransState (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetSemiTransState() を呼び出します。
^p
元関数シグネチャ: int MV1GetSemiTransState(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetSemiTransState 項を参照。

%index
dx_MV1SetOpacityRate
DxLib MV1SetOpacityRate (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : double (float 縮小) Rate
%inst
DxLib の MV1SetOpacityRate() を呼び出します。
^p
元関数シグネチャ: int MV1SetOpacityRate(int MHandle, float Rate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetOpacityRate 項を参照。

%index
dx_MV1SetUseDrawMulAlphaColor
DxLib MV1SetUseDrawMulAlphaColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Flag
%inst
DxLib の MV1SetUseDrawMulAlphaColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetUseDrawMulAlphaColor(int MHandle, int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetUseDrawMulAlphaColor 項を参照。

%index
dx_MV1GetUseDrawMulAlphaColor
DxLib MV1GetUseDrawMulAlphaColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetUseDrawMulAlphaColor() を呼び出します。
^p
元関数シグネチャ: int MV1GetUseDrawMulAlphaColor(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetUseDrawMulAlphaColor 項を参照。

%index
dx_MV1SetUseZBuffer
DxLib MV1SetUseZBuffer (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Flag
%inst
DxLib の MV1SetUseZBuffer() を呼び出します。
^p
元関数シグネチャ: int MV1SetUseZBuffer(int MHandle, int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetUseZBuffer 項を参照。

%index
dx_MV1SetWriteZBuffer
DxLib MV1SetWriteZBuffer (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Flag
%inst
DxLib の MV1SetWriteZBuffer() を呼び出します。
^p
元関数シグネチャ: int MV1SetWriteZBuffer(int MHandle, int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetWriteZBuffer 項を参照。

%index
dx_MV1SetZBias
DxLib MV1SetZBias (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Bias
%inst
DxLib の MV1SetZBias() を呼び出します。
^p
元関数シグネチャ: int MV1SetZBias(int MHandle, int Bias)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetZBias 項を参照。

%index
dx_MV1SetUseVertDifColor
DxLib MV1SetUseVertDifColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int UseFlag
%inst
DxLib の MV1SetUseVertDifColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetUseVertDifColor(int MHandle, int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetUseVertDifColor 項を参照。

%index
dx_MV1SetUseVertSpcColor
DxLib MV1SetUseVertSpcColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int UseFlag
%inst
DxLib の MV1SetUseVertSpcColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetUseVertSpcColor(int MHandle, int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetUseVertSpcColor 項を参照。

%index
dx_MV1SetSampleFilterMode
DxLib MV1SetSampleFilterMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FilterMode
%inst
DxLib の MV1SetSampleFilterMode() を呼び出します。
^p
元関数シグネチャ: int MV1SetSampleFilterMode(int MHandle, int FilterMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetSampleFilterMode 項を参照。

%index
dx_MV1SetMaxAnisotropy
DxLib MV1SetMaxAnisotropy (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaxAnisotropy
%inst
DxLib の MV1SetMaxAnisotropy() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaxAnisotropy(int MHandle, int MaxAnisotropy)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaxAnisotropy 項を参照。

%index
dx_MV1SetWireFrameDrawFlag
DxLib MV1SetWireFrameDrawFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Flag
%inst
DxLib の MV1SetWireFrameDrawFlag() を呼び出します。
^p
元関数シグネチャ: int MV1SetWireFrameDrawFlag(int MHandle, int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetWireFrameDrawFlag 項を参照。

%index
dx_MV1RefreshVertColorFromMaterial
DxLib MV1RefreshVertColorFromMaterial (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1RefreshVertColorFromMaterial() を呼び出します。
^p
元関数シグネチャ: int MV1RefreshVertColorFromMaterial(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1RefreshVertColorFromMaterial 項を参照。

%index
dx_MV1SetPhysicsWorldGravity
DxLib MV1SetPhysicsWorldGravity (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (VECTOR: #defstruct float x,y,z) Gravity
%inst
DxLib の MV1SetPhysicsWorldGravity() を呼び出します。
^p
元関数シグネチャ: int MV1SetPhysicsWorldGravity(int MHandle, VECTOR Gravity)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetPhysicsWorldGravity 項を参照。

%index
dx_MV1PhysicsCalculation
DxLib MV1PhysicsCalculation (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : double (float 縮小) MillisecondTime
%inst
DxLib の MV1PhysicsCalculation() を呼び出します。
^p
元関数シグネチャ: int MV1PhysicsCalculation(int MHandle, float MillisecondTime)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1PhysicsCalculation 項を参照。

%index
dx_MV1PhysicsResetState
DxLib MV1PhysicsResetState (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1PhysicsResetState() を呼び出します。
^p
元関数シグネチャ: int MV1PhysicsResetState(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1PhysicsResetState 項を参照。

%index
dx_MV1SetPrioritizePhysicsOverAnimFlag
DxLib MV1SetPrioritizePhysicsOverAnimFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Flag
%inst
DxLib の MV1SetPrioritizePhysicsOverAnimFlag() を呼び出します。
^p
元関数シグネチャ: int MV1SetPrioritizePhysicsOverAnimFlag(int MHandle, int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetPrioritizePhysicsOverAnimFlag 項を参照。

%index
dx_MV1SetUseShapeFlag
DxLib MV1SetUseShapeFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int UseFlag
%inst
DxLib の MV1SetUseShapeFlag() を呼び出します。
^p
元関数シグネチャ: int MV1SetUseShapeFlag(int MHandle, int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetUseShapeFlag 項を参照。

%index
dx_MV1GetMaterialNumberOrderFlag
DxLib MV1GetMaterialNumberOrderFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetMaterialNumberOrderFlag() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialNumberOrderFlag(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialNumberOrderFlag 項を参照。

%index
dx_MV1AttachAnim
DxLib MV1AttachAnim (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimIndex
p3 : int AnimSrcMHandle (default -1)
p4 : int NameCheck (default TRUE)
%inst
DxLib の MV1AttachAnim() を呼び出します。
^p
元関数シグネチャ: int MV1AttachAnim(int MHandle, int AnimIndex, int AnimSrcMHandle, int NameCheck)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1AttachAnim 項を参照。

%index
dx_MV1DetachAnim
DxLib MV1DetachAnim (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AttachIndex
%inst
DxLib の MV1DetachAnim() を呼び出します。
^p
元関数シグネチャ: int MV1DetachAnim(int MHandle, int AttachIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1DetachAnim 項を参照。

%index
dx_MV1SetAttachAnimTime
DxLib MV1SetAttachAnimTime (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AttachIndex
p3 : double (float 縮小) Time
%inst
DxLib の MV1SetAttachAnimTime() を呼び出します。
^p
元関数シグネチャ: int MV1SetAttachAnimTime(int MHandle, int AttachIndex, float Time)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetAttachAnimTime 項を参照。

%index
dx_MV1SetAttachAnimBlendRate
DxLib MV1SetAttachAnimBlendRate (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AttachIndex
p3 : double (float 縮小) Rate (default 1.0f)
%inst
DxLib の MV1SetAttachAnimBlendRate() を呼び出します。
^p
元関数シグネチャ: int MV1SetAttachAnimBlendRate(int MHandle, int AttachIndex, float Rate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetAttachAnimBlendRate 項を参照。

%index
dx_MV1SetAttachAnimBlendRateToFrame
DxLib MV1SetAttachAnimBlendRateToFrame (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AttachIndex
p3 : int FrameIndex
p4 : double (float 縮小) Rate
p5 : int SetChild (default TRUE)
%inst
DxLib の MV1SetAttachAnimBlendRateToFrame() を呼び出します。
^p
元関数シグネチャ: int MV1SetAttachAnimBlendRateToFrame(int MHandle, int AttachIndex, int FrameIndex, float Rate, int SetChild)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetAttachAnimBlendRateToFrame 項を参照。

%index
dx_MV1SetAttachAnimTimeToFrame
DxLib MV1SetAttachAnimTimeToFrame (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AttachIndex
p3 : int FrameIndex
p4 : double (float 縮小) Time
p5 : int SetChild (default TRUE)
%inst
DxLib の MV1SetAttachAnimTimeToFrame() を呼び出します。
^p
元関数シグネチャ: int MV1SetAttachAnimTimeToFrame(int MHandle, int AttachIndex, int FrameIndex, float Time, int SetChild)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetAttachAnimTimeToFrame 項を参照。

%index
dx_MV1GetAttachAnim
DxLib MV1GetAttachAnim (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AttachIndex
%inst
DxLib の MV1GetAttachAnim() を呼び出します。
^p
元関数シグネチャ: int MV1GetAttachAnim(int MHandle, int AttachIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAttachAnim 項を参照。

%index
dx_MV1SetAttachAnimUseShapeFlag
DxLib MV1SetAttachAnimUseShapeFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AttachIndex
p3 : int UseFlag
%inst
DxLib の MV1SetAttachAnimUseShapeFlag() を呼び出します。
^p
元関数シグネチャ: int MV1SetAttachAnimUseShapeFlag(int MHandle, int AttachIndex, int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetAttachAnimUseShapeFlag 項を参照。

%index
dx_MV1GetAttachAnimUseShapeFlag
DxLib MV1GetAttachAnimUseShapeFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AttachIndex
%inst
DxLib の MV1GetAttachAnimUseShapeFlag() を呼び出します。
^p
元関数シグネチャ: int MV1GetAttachAnimUseShapeFlag(int MHandle, int AttachIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAttachAnimUseShapeFlag 項を参照。

%index
dx_MV1GetAnimNum
DxLib MV1GetAnimNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetAnimNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimNum(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimNum 項を参照。

%index
dx_MV1SetAnimName
DxLib MV1SetAnimName (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimIndex
p3 : str AnimName
%inst
DxLib の MV1SetAnimName() を呼び出します。
^p
元関数シグネチャ: int MV1SetAnimName(int MHandle, int AnimIndex, const TCHAR * AnimName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetAnimName 項を参照。

%index
dx_MV1GetAnimIndex
DxLib MV1GetAnimIndex (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : str AnimName
%inst
DxLib の MV1GetAnimIndex() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimIndex(int MHandle, const TCHAR * AnimName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimIndex 項を参照。

%index
dx_MV1GetAnimTargetFrameNum
DxLib MV1GetAnimTargetFrameNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimIndex
%inst
DxLib の MV1GetAnimTargetFrameNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimTargetFrameNum(int MHandle, int AnimIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimTargetFrameNum 項を参照。

%index
dx_MV1GetAnimTargetFrame
DxLib MV1GetAnimTargetFrame (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimIndex
p3 : int AnimFrameIndex
%inst
DxLib の MV1GetAnimTargetFrame() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimTargetFrame(int MHandle, int AnimIndex, int AnimFrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimTargetFrame 項を参照。

%index
dx_MV1GetAnimTargetFrameKeySetNum
DxLib MV1GetAnimTargetFrameKeySetNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimIndex
p3 : int AnimFrameIndex
%inst
DxLib の MV1GetAnimTargetFrameKeySetNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimTargetFrameKeySetNum(int MHandle, int AnimIndex, int AnimFrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimTargetFrameKeySetNum 項を参照。

%index
dx_MV1GetAnimTargetFrameKeySet
DxLib MV1GetAnimTargetFrameKeySet (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimIndex
p3 : int AnimFrameIndex
p4 : int Index
%inst
DxLib の MV1GetAnimTargetFrameKeySet() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimTargetFrameKeySet(int MHandle, int AnimIndex, int AnimFrameIndex, int Index)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimTargetFrameKeySet 項を参照。

%index
dx_MV1GetAnimKeySetNum
DxLib MV1GetAnimKeySetNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetAnimKeySetNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimKeySetNum(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimKeySetNum 項を参照。

%index
dx_MV1GetAnimKeySetType
DxLib MV1GetAnimKeySetType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimKeySetIndex
%inst
DxLib の MV1GetAnimKeySetType() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimKeySetType(int MHandle, int AnimKeySetIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimKeySetType 項を参照。

%index
dx_MV1GetAnimKeySetDataType
DxLib MV1GetAnimKeySetDataType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimKeySetIndex
%inst
DxLib の MV1GetAnimKeySetDataType() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimKeySetDataType(int MHandle, int AnimKeySetIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimKeySetDataType 項を参照。

%index
dx_MV1GetAnimKeySetTimeType
DxLib MV1GetAnimKeySetTimeType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimKeySetIndex
%inst
DxLib の MV1GetAnimKeySetTimeType() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimKeySetTimeType(int MHandle, int AnimKeySetIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimKeySetTimeType 項を参照。

%index
dx_MV1GetAnimKeySetDataNum
DxLib MV1GetAnimKeySetDataNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimKeySetIndex
%inst
DxLib の MV1GetAnimKeySetDataNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimKeySetDataNum(int MHandle, int AnimKeySetIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimKeySetDataNum 項を参照。

%index
dx_MV1GetAnimKeyDataIndexFromTime
DxLib MV1GetAnimKeyDataIndexFromTime (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int AnimKeySetIndex
p3 : double (float 縮小) Time
%inst
DxLib の MV1GetAnimKeyDataIndexFromTime() を呼び出します。
^p
元関数シグネチャ: int MV1GetAnimKeyDataIndexFromTime(int MHandle, int AnimKeySetIndex, float Time)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetAnimKeyDataIndexFromTime 項を参照。

%index
dx_MV1GetMaterialNum
DxLib MV1GetMaterialNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetMaterialNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialNum(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialNum 項を参照。

%index
dx_MV1SetMaterialTypeAll
DxLib MV1SetMaterialTypeAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Type
%inst
DxLib の MV1SetMaterialTypeAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialTypeAll(int MHandle, int Type)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialTypeAll 項を参照。

%index
dx_MV1SetMaterialType
DxLib MV1SetMaterialType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int Type
%inst
DxLib の MV1SetMaterialType() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialType(int MHandle, int MaterialIndex, int Type)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialType 項を参照。

%index
dx_MV1GetMaterialType
DxLib MV1GetMaterialType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialType() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialType(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialType 項を参照。

%index
dx_MV1SetMaterialDifColor
DxLib MV1SetMaterialDifColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の MV1SetMaterialDifColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDifColor(int MHandle, int MaterialIndex, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDifColor 項を参照。

%index
dx_MV1SetMaterialSpcColor
DxLib MV1SetMaterialSpcColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の MV1SetMaterialSpcColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSpcColor(int MHandle, int MaterialIndex, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSpcColor 項を参照。

%index
dx_MV1SetMaterialEmiColor
DxLib MV1SetMaterialEmiColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の MV1SetMaterialEmiColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialEmiColor(int MHandle, int MaterialIndex, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialEmiColor 項を参照。

%index
dx_MV1SetMaterialAmbColor
DxLib MV1SetMaterialAmbColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の MV1SetMaterialAmbColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialAmbColor(int MHandle, int MaterialIndex, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialAmbColor 項を参照。

%index
dx_MV1SetMaterialSpcPower
DxLib MV1SetMaterialSpcPower (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : double (float 縮小) Power
%inst
DxLib の MV1SetMaterialSpcPower() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSpcPower(int MHandle, int MaterialIndex, float Power)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSpcPower 項を参照。

%index
dx_MV1SetMaterialDifMapTexture
DxLib MV1SetMaterialDifMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int TexIndex
%inst
DxLib の MV1SetMaterialDifMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDifMapTexture(int MHandle, int MaterialIndex, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDifMapTexture 項を参照。

%index
dx_MV1GetMaterialDifMapTexture
DxLib MV1GetMaterialDifMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialDifMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialDifMapTexture(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialDifMapTexture 項を参照。

%index
dx_MV1SetMaterialSubDifMapTexture
DxLib MV1SetMaterialSubDifMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int TexIndex
%inst
DxLib の MV1SetMaterialSubDifMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSubDifMapTexture(int MHandle, int MaterialIndex, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSubDifMapTexture 項を参照。

%index
dx_MV1GetMaterialSubDifMapTexture
DxLib MV1GetMaterialSubDifMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialSubDifMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialSubDifMapTexture(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialSubDifMapTexture 項を参照。

%index
dx_MV1SetMaterialSpcMapTexture
DxLib MV1SetMaterialSpcMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int TexIndex
%inst
DxLib の MV1SetMaterialSpcMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSpcMapTexture(int MHandle, int MaterialIndex, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSpcMapTexture 項を参照。

%index
dx_MV1GetMaterialSpcMapTexture
DxLib MV1GetMaterialSpcMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialSpcMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialSpcMapTexture(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialSpcMapTexture 項を参照。

%index
dx_MV1SetMaterialNormalMapTexture
DxLib MV1SetMaterialNormalMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int TexIndex
%inst
DxLib の MV1SetMaterialNormalMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialNormalMapTexture(int MHandle, int MaterialIndex, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialNormalMapTexture 項を参照。

%index
dx_MV1GetMaterialNormalMapTexture
DxLib MV1GetMaterialNormalMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialNormalMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialNormalMapTexture(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialNormalMapTexture 項を参照。

%index
dx_MV1SetMaterialDifGradTexture
DxLib MV1SetMaterialDifGradTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int TexIndex
%inst
DxLib の MV1SetMaterialDifGradTexture() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDifGradTexture(int MHandle, int MaterialIndex, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDifGradTexture 項を参照。

%index
dx_MV1GetMaterialDifGradTexture
DxLib MV1GetMaterialDifGradTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialDifGradTexture() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialDifGradTexture(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialDifGradTexture 項を参照。

%index
dx_MV1SetMaterialSpcGradTexture
DxLib MV1SetMaterialSpcGradTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int TexIndex
%inst
DxLib の MV1SetMaterialSpcGradTexture() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSpcGradTexture(int MHandle, int MaterialIndex, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSpcGradTexture 項を参照。

%index
dx_MV1GetMaterialSpcGradTexture
DxLib MV1GetMaterialSpcGradTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialSpcGradTexture() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialSpcGradTexture(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialSpcGradTexture 項を参照。

%index
dx_MV1SetMaterialSphereMapTexture
DxLib MV1SetMaterialSphereMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int TexIndex
%inst
DxLib の MV1SetMaterialSphereMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSphereMapTexture(int MHandle, int MaterialIndex, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSphereMapTexture 項を参照。

%index
dx_MV1GetMaterialSphereMapTexture
DxLib MV1GetMaterialSphereMapTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialSphereMapTexture() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialSphereMapTexture(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialSphereMapTexture 項を参照。

%index
dx_MV1SetMaterialDifGradBlendTypeAll
DxLib MV1SetMaterialDifGradBlendTypeAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int BlendType
%inst
DxLib の MV1SetMaterialDifGradBlendTypeAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDifGradBlendTypeAll(int MHandle, int BlendType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDifGradBlendTypeAll 項を参照。

%index
dx_MV1SetMaterialDifGradBlendType
DxLib MV1SetMaterialDifGradBlendType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int BlendType
%inst
DxLib の MV1SetMaterialDifGradBlendType() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDifGradBlendType(int MHandle, int MaterialIndex, int BlendType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDifGradBlendType 項を参照。

%index
dx_MV1GetMaterialDifGradBlendType
DxLib MV1GetMaterialDifGradBlendType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialDifGradBlendType() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialDifGradBlendType(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialDifGradBlendType 項を参照。

%index
dx_MV1SetMaterialSpcGradBlendTypeAll
DxLib MV1SetMaterialSpcGradBlendTypeAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int BlendType
%inst
DxLib の MV1SetMaterialSpcGradBlendTypeAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSpcGradBlendTypeAll(int MHandle, int BlendType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSpcGradBlendTypeAll 項を参照。

%index
dx_MV1SetMaterialSpcGradBlendType
DxLib MV1SetMaterialSpcGradBlendType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int BlendType
%inst
DxLib の MV1SetMaterialSpcGradBlendType() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSpcGradBlendType(int MHandle, int MaterialIndex, int BlendType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSpcGradBlendType 項を参照。

%index
dx_MV1GetMaterialSpcGradBlendType
DxLib MV1GetMaterialSpcGradBlendType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialSpcGradBlendType() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialSpcGradBlendType(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialSpcGradBlendType 項を参照。

%index
dx_MV1SetMaterialSphereMapBlendTypeAll
DxLib MV1SetMaterialSphereMapBlendTypeAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int BlendType
%inst
DxLib の MV1SetMaterialSphereMapBlendTypeAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSphereMapBlendTypeAll(int MHandle, int BlendType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSphereMapBlendTypeAll 項を参照。

%index
dx_MV1SetMaterialSphereMapBlendType
DxLib MV1SetMaterialSphereMapBlendType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int BlendType
%inst
DxLib の MV1SetMaterialSphereMapBlendType() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialSphereMapBlendType(int MHandle, int MaterialIndex, int BlendType)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialSphereMapBlendType 項を参照。

%index
dx_MV1GetMaterialSphereMapBlendType
DxLib MV1GetMaterialSphereMapBlendType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialSphereMapBlendType() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialSphereMapBlendType(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialSphereMapBlendType 項を参照。

%index
dx_MV1SetMaterialOutLineWidthAll
DxLib MV1SetMaterialOutLineWidthAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : double (float 縮小) Width
%inst
DxLib の MV1SetMaterialOutLineWidthAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialOutLineWidthAll(int MHandle, float Width)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialOutLineWidthAll 項を参照。

%index
dx_MV1SetMaterialOutLineWidth
DxLib MV1SetMaterialOutLineWidth (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : double (float 縮小) Width
%inst
DxLib の MV1SetMaterialOutLineWidth() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialOutLineWidth(int MHandle, int MaterialIndex, float Width)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialOutLineWidth 項を参照。

%index
dx_MV1SetMaterialOutLineDotWidthAll
DxLib MV1SetMaterialOutLineDotWidthAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : double (float 縮小) Width
%inst
DxLib の MV1SetMaterialOutLineDotWidthAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialOutLineDotWidthAll(int MHandle, float Width)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialOutLineDotWidthAll 項を参照。

%index
dx_MV1SetMaterialOutLineDotWidth
DxLib MV1SetMaterialOutLineDotWidth (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : double (float 縮小) Width
%inst
DxLib の MV1SetMaterialOutLineDotWidth() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialOutLineDotWidth(int MHandle, int MaterialIndex, float Width)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialOutLineDotWidth 項を参照。

%index
dx_MV1SetMaterialOutLineColorAll
DxLib MV1SetMaterialOutLineColorAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の MV1SetMaterialOutLineColorAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialOutLineColorAll(int MHandle, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialOutLineColorAll 項を参照。

%index
dx_MV1SetMaterialOutLineColor
DxLib MV1SetMaterialOutLineColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : var (COLOR_F: float r,g,b,a) Color
%inst
DxLib の MV1SetMaterialOutLineColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialOutLineColor(int MHandle, int MaterialIndex, COLOR_F Color)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialOutLineColor 項を参照。

%index
dx_MV1SetMaterialDrawBlendModeAll
DxLib MV1SetMaterialDrawBlendModeAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int BlendMode
%inst
DxLib の MV1SetMaterialDrawBlendModeAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDrawBlendModeAll(int MHandle, int BlendMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDrawBlendModeAll 項を参照。

%index
dx_MV1SetMaterialDrawBlendMode
DxLib MV1SetMaterialDrawBlendMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int BlendMode
%inst
DxLib の MV1SetMaterialDrawBlendMode() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDrawBlendMode(int MHandle, int MaterialIndex, int BlendMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDrawBlendMode 項を参照。

%index
dx_MV1GetMaterialDrawBlendMode
DxLib MV1GetMaterialDrawBlendMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialDrawBlendMode() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialDrawBlendMode(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialDrawBlendMode 項を参照。

%index
dx_MV1SetMaterialDrawBlendParamAll
DxLib MV1SetMaterialDrawBlendParamAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int BlendParam
%inst
DxLib の MV1SetMaterialDrawBlendParamAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDrawBlendParamAll(int MHandle, int BlendParam)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDrawBlendParamAll 項を参照。

%index
dx_MV1SetMaterialDrawBlendParam
DxLib MV1SetMaterialDrawBlendParam (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int BlendParam
%inst
DxLib の MV1SetMaterialDrawBlendParam() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDrawBlendParam(int MHandle, int MaterialIndex, int BlendParam)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDrawBlendParam 項を参照。

%index
dx_MV1GetMaterialDrawBlendParam
DxLib MV1GetMaterialDrawBlendParam (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialDrawBlendParam() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialDrawBlendParam(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialDrawBlendParam 項を参照。

%index
dx_MV1SetMaterialDrawAlphaTestAll
DxLib MV1SetMaterialDrawAlphaTestAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Enable
p3 : int Mode
p4 : int Param
%inst
DxLib の MV1SetMaterialDrawAlphaTestAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDrawAlphaTestAll(int MHandle, int Enable, int Mode, int Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDrawAlphaTestAll 項を参照。

%index
dx_MV1SetMaterialDrawAlphaTest
DxLib MV1SetMaterialDrawAlphaTest (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int Enable
p4 : int Mode
p5 : int Param
%inst
DxLib の MV1SetMaterialDrawAlphaTest() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDrawAlphaTest(int MHandle, int MaterialIndex, int Enable, int Mode, int Param)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDrawAlphaTest 項を参照。

%index
dx_MV1GetMaterialDrawAlphaTestEnable
DxLib MV1GetMaterialDrawAlphaTestEnable (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialDrawAlphaTestEnable() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialDrawAlphaTestEnable(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialDrawAlphaTestEnable 項を参照。

%index
dx_MV1GetMaterialDrawAlphaTestMode
DxLib MV1GetMaterialDrawAlphaTestMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialDrawAlphaTestMode() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialDrawAlphaTestMode(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialDrawAlphaTestMode 項を参照。

%index
dx_MV1GetMaterialDrawAlphaTestParam
DxLib MV1GetMaterialDrawAlphaTestParam (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
%inst
DxLib の MV1GetMaterialDrawAlphaTestParam() を呼び出します。
^p
元関数シグネチャ: int MV1GetMaterialDrawAlphaTestParam(int MHandle, int MaterialIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMaterialDrawAlphaTestParam 項を参照。

%index
dx_MV1SetMaterialDrawAddColorAll
DxLib MV1SetMaterialDrawAddColorAll (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int Red
p3 : int Green
p4 : int Blue
%inst
DxLib の MV1SetMaterialDrawAddColorAll() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDrawAddColorAll(int MHandle, int Red, int Green, int Blue)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDrawAddColorAll 項を参照。

%index
dx_MV1SetMaterialDrawAddColor
DxLib MV1SetMaterialDrawAddColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MaterialIndex
p3 : int Red
p4 : int Green
p5 : int Blue
%inst
DxLib の MV1SetMaterialDrawAddColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetMaterialDrawAddColor(int MHandle, int MaterialIndex, int Red, int Green, int Blue)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMaterialDrawAddColor 項を参照。

%index
dx_MV1GetTextureNum
DxLib MV1GetTextureNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetTextureNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureNum(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureNum 項を参照。

%index
dx_MV1SetTextureColorFilePath
DxLib MV1SetTextureColorFilePath (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
p3 : str FilePath
%inst
DxLib の MV1SetTextureColorFilePath() を呼び出します。
^p
元関数シグネチャ: int MV1SetTextureColorFilePath(int MHandle, int TexIndex, const TCHAR * FilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetTextureColorFilePath 項を参照。

%index
dx_MV1SetTextureAlphaFilePath
DxLib MV1SetTextureAlphaFilePath (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
p3 : str FilePath
%inst
DxLib の MV1SetTextureAlphaFilePath() を呼び出します。
^p
元関数シグネチャ: int MV1SetTextureAlphaFilePath(int MHandle, int TexIndex, const TCHAR * FilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetTextureAlphaFilePath 項を参照。

%index
dx_MV1SetTextureGraphHandle
DxLib MV1SetTextureGraphHandle (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
p3 : int GrHandle
p4 : int SemiTransFlag
%inst
DxLib の MV1SetTextureGraphHandle() を呼び出します。
^p
元関数シグネチャ: int MV1SetTextureGraphHandle(int MHandle, int TexIndex, int GrHandle, int SemiTransFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetTextureGraphHandle 項を参照。

%index
dx_MV1GetTextureGraphHandle
DxLib MV1GetTextureGraphHandle (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
%inst
DxLib の MV1GetTextureGraphHandle() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureGraphHandle(int MHandle, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureGraphHandle 項を参照。

%index
dx_MV1SetTextureAddressMode
DxLib MV1SetTextureAddressMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
p3 : int AddrUMode
p4 : int AddrVMode
%inst
DxLib の MV1SetTextureAddressMode() を呼び出します。
^p
元関数シグネチャ: int MV1SetTextureAddressMode(int MHandle, int TexIndex, int AddrUMode, int AddrVMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetTextureAddressMode 項を参照。

%index
dx_MV1GetTextureAddressModeU
DxLib MV1GetTextureAddressModeU (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
%inst
DxLib の MV1GetTextureAddressModeU() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureAddressModeU(int MHandle, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureAddressModeU 項を参照。

%index
dx_MV1GetTextureAddressModeV
DxLib MV1GetTextureAddressModeV (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
%inst
DxLib の MV1GetTextureAddressModeV() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureAddressModeV(int MHandle, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureAddressModeV 項を参照。

%index
dx_MV1GetTextureWidth
DxLib MV1GetTextureWidth (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
%inst
DxLib の MV1GetTextureWidth() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureWidth(int MHandle, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureWidth 項を参照。

%index
dx_MV1GetTextureHeight
DxLib MV1GetTextureHeight (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
%inst
DxLib の MV1GetTextureHeight() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureHeight(int MHandle, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureHeight 項を参照。

%index
dx_MV1GetTextureSemiTransState
DxLib MV1GetTextureSemiTransState (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
%inst
DxLib の MV1GetTextureSemiTransState() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureSemiTransState(int MHandle, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureSemiTransState 項を参照。

%index
dx_MV1SetTextureBumpImageFlag
DxLib MV1SetTextureBumpImageFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
p3 : int Flag
%inst
DxLib の MV1SetTextureBumpImageFlag() を呼び出します。
^p
元関数シグネチャ: int MV1SetTextureBumpImageFlag(int MHandle, int TexIndex, int Flag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetTextureBumpImageFlag 項を参照。

%index
dx_MV1GetTextureBumpImageFlag
DxLib MV1GetTextureBumpImageFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
%inst
DxLib の MV1GetTextureBumpImageFlag() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureBumpImageFlag(int MHandle, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureBumpImageFlag 項を参照。

%index
dx_MV1SetTextureBumpImageNextPixelLength
DxLib MV1SetTextureBumpImageNextPixelLength (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
p3 : double (float 縮小) Length
%inst
DxLib の MV1SetTextureBumpImageNextPixelLength() を呼び出します。
^p
元関数シグネチャ: int MV1SetTextureBumpImageNextPixelLength(int MHandle, int TexIndex, float Length)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetTextureBumpImageNextPixelLength 項を参照。

%index
dx_MV1SetTextureSampleFilterMode
DxLib MV1SetTextureSampleFilterMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
p3 : int FilterMode
%inst
DxLib の MV1SetTextureSampleFilterMode() を呼び出します。
^p
元関数シグネチャ: int MV1SetTextureSampleFilterMode(int MHandle, int TexIndex, int FilterMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetTextureSampleFilterMode 項を参照。

%index
dx_MV1GetTextureSampleFilterMode
DxLib MV1GetTextureSampleFilterMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TexIndex
%inst
DxLib の MV1GetTextureSampleFilterMode() を呼び出します。
^p
元関数シグネチャ: int MV1GetTextureSampleFilterMode(int MHandle, int TexIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTextureSampleFilterMode 項を参照。

%index
dx_MV1AddTextureGraphHandle
DxLib MV1AddTextureGraphHandle (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : str Name
p3 : int GrHandle
p4 : int SemiTransFlag
p5 : int AddressModeU (default DX_TEXADDRESS_WRAP)
p6 : int AddressModeV (default DX_TEXADDRESS_WRAP)
p7 : int FilterMode (default DX_DRAWMODE_ANISOTROPIC)
%inst
DxLib の MV1AddTextureGraphHandle() を呼び出します。
^p
元関数シグネチャ: int MV1AddTextureGraphHandle(int MHandle, const TCHAR * Name, int GrHandle, int SemiTransFlag, int AddressModeU, int AddressModeV, int FilterMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1AddTextureGraphHandle 項を参照。

%index
dx_MV1LoadTexture
DxLib MV1LoadTexture (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : str FilePath
%inst
DxLib の MV1LoadTexture() を呼び出します。
^p
元関数シグネチャ: int MV1LoadTexture(const TCHAR * FilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1LoadTexture 項を参照。

%index
dx_MV1GetFrameNum
DxLib MV1GetFrameNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetFrameNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameNum(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameNum 項を参照。

%index
dx_MV1SearchFrame
DxLib MV1SearchFrame (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : str FrameName
%inst
DxLib の MV1SearchFrame() を呼び出します。
^p
元関数シグネチャ: int MV1SearchFrame(int MHandle, const TCHAR * FrameName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SearchFrame 項を参照。

%index
dx_MV1SearchFrameChild
DxLib MV1SearchFrameChild (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex (default -1)
p3 : str ChildName (default NULL)
%inst
DxLib の MV1SearchFrameChild() を呼び出します。
^p
元関数シグネチャ: int MV1SearchFrameChild(int MHandle, int FrameIndex, const TCHAR * ChildName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SearchFrameChild 項を参照。

%index
dx_MV1GetFrameName2
DxLib MV1GetFrameName2 (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : str StrBuffer
%inst
DxLib の MV1GetFrameName2() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameName2(int MHandle, int FrameIndex, const TCHAR * StrBuffer)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameName2 項を参照。

%index
dx_MV1GetFrameParent
DxLib MV1GetFrameParent (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1GetFrameParent() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameParent(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameParent 項を参照。

%index
dx_MV1GetFrameChildNum
DxLib MV1GetFrameChildNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex (default -1)
%inst
DxLib の MV1GetFrameChildNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameChildNum(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameChildNum 項を参照。

%index
dx_MV1GetFrameChild
DxLib MV1GetFrameChild (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex (default -1)
p3 : int ChildIndex (default 0)
%inst
DxLib の MV1GetFrameChild() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameChild(int MHandle, int FrameIndex, int ChildIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameChild 項を参照。

%index
dx_MV1SetFrameUserLocalMatrix
DxLib MV1SetFrameUserLocalMatrix (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (MATRIX: 4x4 float) Matrix
%inst
DxLib の MV1SetFrameUserLocalMatrix() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameUserLocalMatrix(int MHandle, int FrameIndex, MATRIX Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameUserLocalMatrix 項を参照。

%index
dx_MV1SetFrameUserLocalMatrixD
DxLib MV1SetFrameUserLocalMatrixD (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (MATRIX_D: 4x4 double) Matrix
%inst
DxLib の MV1SetFrameUserLocalMatrixD() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameUserLocalMatrixD(int MHandle, int FrameIndex, MATRIX_D Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameUserLocalMatrixD 項を参照。

%index
dx_MV1ResetFrameUserLocalMatrix
DxLib MV1ResetFrameUserLocalMatrix (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1ResetFrameUserLocalMatrix() を呼び出します。
^p
元関数シグネチャ: int MV1ResetFrameUserLocalMatrix(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1ResetFrameUserLocalMatrix 項を参照。

%index
dx_MV1SetFrameUserLocalWorldMatrix
DxLib MV1SetFrameUserLocalWorldMatrix (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (MATRIX: 4x4 float) Matrix
%inst
DxLib の MV1SetFrameUserLocalWorldMatrix() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameUserLocalWorldMatrix(int MHandle, int FrameIndex, MATRIX Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameUserLocalWorldMatrix 項を参照。

%index
dx_MV1SetFrameUserLocalWorldMatrixD
DxLib MV1SetFrameUserLocalWorldMatrixD (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (MATRIX_D: 4x4 double) Matrix
%inst
DxLib の MV1SetFrameUserLocalWorldMatrixD() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameUserLocalWorldMatrixD(int MHandle, int FrameIndex, MATRIX_D Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameUserLocalWorldMatrixD 項を参照。

%index
dx_MV1ResetFrameUserLocalWorldMatrix
DxLib MV1ResetFrameUserLocalWorldMatrix (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1ResetFrameUserLocalWorldMatrix() を呼び出します。
^p
元関数シグネチャ: int MV1ResetFrameUserLocalWorldMatrix(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1ResetFrameUserLocalWorldMatrix 項を参照。

%index
dx_MV1GetFrameVertexNum
DxLib MV1GetFrameVertexNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1GetFrameVertexNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameVertexNum(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameVertexNum 項を参照。

%index
dx_MV1GetFrameTriangleNum
DxLib MV1GetFrameTriangleNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1GetFrameTriangleNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameTriangleNum(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameTriangleNum 項を参照。

%index
dx_MV1GetFrameMeshNum
DxLib MV1GetFrameMeshNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1GetFrameMeshNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameMeshNum(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameMeshNum 項を参照。

%index
dx_MV1GetFrameMesh
DxLib MV1GetFrameMesh (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : int Index
%inst
DxLib の MV1GetFrameMesh() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameMesh(int MHandle, int FrameIndex, int Index)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameMesh 項を参照。

%index
dx_MV1SetFrameVisible
DxLib MV1SetFrameVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : int VisibleFlag
%inst
DxLib の MV1SetFrameVisible() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameVisible(int MHandle, int FrameIndex, int VisibleFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameVisible 項を参照。

%index
dx_MV1GetFrameVisible
DxLib MV1GetFrameVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1GetFrameVisible() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameVisible(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameVisible 項を参照。

%index
dx_MV1SetFrameDifColorScale
DxLib MV1SetFrameDifColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetFrameDifColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameDifColorScale(int MHandle, int FrameIndex, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameDifColorScale 項を参照。

%index
dx_MV1SetFrameSpcColorScale
DxLib MV1SetFrameSpcColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetFrameSpcColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameSpcColorScale(int MHandle, int FrameIndex, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameSpcColorScale 項を参照。

%index
dx_MV1SetFrameEmiColorScale
DxLib MV1SetFrameEmiColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetFrameEmiColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameEmiColorScale(int MHandle, int FrameIndex, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameEmiColorScale 項を参照。

%index
dx_MV1SetFrameAmbColorScale
DxLib MV1SetFrameAmbColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetFrameAmbColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameAmbColorScale(int MHandle, int FrameIndex, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameAmbColorScale 項を参照。

%index
dx_MV1GetFrameSemiTransState
DxLib MV1GetFrameSemiTransState (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1GetFrameSemiTransState() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameSemiTransState(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameSemiTransState 項を参照。

%index
dx_MV1SetFrameOpacityRate
DxLib MV1SetFrameOpacityRate (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : double (float 縮小) Rate
%inst
DxLib の MV1SetFrameOpacityRate() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameOpacityRate(int MHandle, int FrameIndex, float Rate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameOpacityRate 項を参照。

%index
dx_MV1SetFrameBaseVisible
DxLib MV1SetFrameBaseVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : int VisibleFlag
%inst
DxLib の MV1SetFrameBaseVisible() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameBaseVisible(int MHandle, int FrameIndex, int VisibleFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameBaseVisible 項を参照。

%index
dx_MV1GetFrameBaseVisible
DxLib MV1GetFrameBaseVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1GetFrameBaseVisible() を呼び出します。
^p
元関数シグネチャ: int MV1GetFrameBaseVisible(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetFrameBaseVisible 項を参照。

%index
dx_MV1SetFrameTextureAddressTransform
DxLib MV1SetFrameTextureAddressTransform (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : double (float 縮小) TransU
p4 : double (float 縮小) TransV
p5 : double (float 縮小) ScaleU
p6 : double (float 縮小) ScaleV
p7 : double (float 縮小) RotCenterU
p8 : double (float 縮小) RotCenterV
p9 : double (float 縮小) Rotate
%inst
DxLib の MV1SetFrameTextureAddressTransform() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameTextureAddressTransform(int MHandle, int FrameIndex, float TransU, float TransV, float ScaleU, float ScaleV, float RotCenterU, float RotCenterV, float Rotate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameTextureAddressTransform 項を参照。

%index
dx_MV1SetFrameTextureAddressTransformMatrix
DxLib MV1SetFrameTextureAddressTransformMatrix (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : var (MATRIX: 4x4 float) Matrix
%inst
DxLib の MV1SetFrameTextureAddressTransformMatrix() を呼び出します。
^p
元関数シグネチャ: int MV1SetFrameTextureAddressTransformMatrix(int MHandle, int FrameIndex, MATRIX Matrix)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetFrameTextureAddressTransformMatrix 項を参照。

%index
dx_MV1ResetFrameTextureAddressTransform
DxLib MV1ResetFrameTextureAddressTransform (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
%inst
DxLib の MV1ResetFrameTextureAddressTransform() を呼び出します。
^p
元関数シグネチャ: int MV1ResetFrameTextureAddressTransform(int MHandle, int FrameIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1ResetFrameTextureAddressTransform 項を参照。

%index
dx_MV1GetMeshNum
DxLib MV1GetMeshNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetMeshNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshNum(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshNum 項を参照。

%index
dx_MV1GetMeshMaterial
DxLib MV1GetMeshMaterial (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshMaterial() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshMaterial(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshMaterial 項を参照。

%index
dx_MV1GetMeshVertexNum
DxLib MV1GetMeshVertexNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshVertexNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshVertexNum(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshVertexNum 項を参照。

%index
dx_MV1GetMeshTriangleNum
DxLib MV1GetMeshTriangleNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshTriangleNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshTriangleNum(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshTriangleNum 項を参照。

%index
dx_MV1SetMeshVisible
DxLib MV1SetMeshVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : int VisibleFlag
%inst
DxLib の MV1SetMeshVisible() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshVisible(int MHandle, int MeshIndex, int VisibleFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshVisible 項を参照。

%index
dx_MV1GetMeshVisible
DxLib MV1GetMeshVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshVisible() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshVisible(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshVisible 項を参照。

%index
dx_MV1SetMeshDifColorScale
DxLib MV1SetMeshDifColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetMeshDifColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshDifColorScale(int MHandle, int MeshIndex, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshDifColorScale 項を参照。

%index
dx_MV1SetMeshSpcColorScale
DxLib MV1SetMeshSpcColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetMeshSpcColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshSpcColorScale(int MHandle, int MeshIndex, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshSpcColorScale 項を参照。

%index
dx_MV1SetMeshEmiColorScale
DxLib MV1SetMeshEmiColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetMeshEmiColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshEmiColorScale(int MHandle, int MeshIndex, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshEmiColorScale 項を参照。

%index
dx_MV1SetMeshAmbColorScale
DxLib MV1SetMeshAmbColorScale (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : var (COLOR_F: float r,g,b,a) Scale
%inst
DxLib の MV1SetMeshAmbColorScale() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshAmbColorScale(int MHandle, int MeshIndex, COLOR_F Scale)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshAmbColorScale 項を参照。

%index
dx_MV1SetMeshOpacityRate
DxLib MV1SetMeshOpacityRate (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : double (float 縮小) Rate
%inst
DxLib の MV1SetMeshOpacityRate() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshOpacityRate(int MHandle, int MeshIndex, float Rate)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshOpacityRate 項を参照。

%index
dx_MV1SetMeshDrawBlendMode
DxLib MV1SetMeshDrawBlendMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : int BlendMode
%inst
DxLib の MV1SetMeshDrawBlendMode() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshDrawBlendMode(int MHandle, int MeshIndex, int BlendMode)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshDrawBlendMode 項を参照。

%index
dx_MV1SetMeshDrawBlendParam
DxLib MV1SetMeshDrawBlendParam (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : int BlendParam
%inst
DxLib の MV1SetMeshDrawBlendParam() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshDrawBlendParam(int MHandle, int MeshIndex, int BlendParam)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshDrawBlendParam 項を参照。

%index
dx_MV1GetMeshDrawBlendMode
DxLib MV1GetMeshDrawBlendMode (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshDrawBlendMode() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshDrawBlendMode(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshDrawBlendMode 項を参照。

%index
dx_MV1GetMeshDrawBlendParam
DxLib MV1GetMeshDrawBlendParam (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshDrawBlendParam() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshDrawBlendParam(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshDrawBlendParam 項を参照。

%index
dx_MV1SetMeshBaseVisible
DxLib MV1SetMeshBaseVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : int VisibleFlag
%inst
DxLib の MV1SetMeshBaseVisible() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshBaseVisible(int MHandle, int MeshIndex, int VisibleFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshBaseVisible 項を参照。

%index
dx_MV1GetMeshBaseVisible
DxLib MV1GetMeshBaseVisible (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshBaseVisible() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshBaseVisible(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshBaseVisible 項を参照。

%index
dx_MV1SetMeshBackCulling
DxLib MV1SetMeshBackCulling (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : int CullingFlag
%inst
DxLib の MV1SetMeshBackCulling() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshBackCulling(int MHandle, int MeshIndex, int CullingFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshBackCulling 項を参照。

%index
dx_MV1GetMeshBackCulling
DxLib MV1GetMeshBackCulling (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshBackCulling() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshBackCulling(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshBackCulling 項を参照。

%index
dx_MV1GetMeshTListNum
DxLib MV1GetMeshTListNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshTListNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshTListNum(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshTListNum 項を参照。

%index
dx_MV1GetMeshTList
DxLib MV1GetMeshTList (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : int Index
%inst
DxLib の MV1GetMeshTList() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshTList(int MHandle, int MeshIndex, int Index)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshTList 項を参照。

%index
dx_MV1GetMeshSemiTransState
DxLib MV1GetMeshSemiTransState (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshSemiTransState() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshSemiTransState(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshSemiTransState 項を参照。

%index
dx_MV1SetMeshUseVertDifColor
DxLib MV1SetMeshUseVertDifColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : int UseFlag
%inst
DxLib の MV1SetMeshUseVertDifColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshUseVertDifColor(int MHandle, int MeshIndex, int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshUseVertDifColor 項を参照。

%index
dx_MV1SetMeshUseVertSpcColor
DxLib MV1SetMeshUseVertSpcColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
p3 : int UseFlag
%inst
DxLib の MV1SetMeshUseVertSpcColor() を呼び出します。
^p
元関数シグネチャ: int MV1SetMeshUseVertSpcColor(int MHandle, int MeshIndex, int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetMeshUseVertSpcColor 項を参照。

%index
dx_MV1GetMeshUseVertDifColor
DxLib MV1GetMeshUseVertDifColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshUseVertDifColor() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshUseVertDifColor(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshUseVertDifColor 項を参照。

%index
dx_MV1GetMeshUseVertSpcColor
DxLib MV1GetMeshUseVertSpcColor (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshUseVertSpcColor() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshUseVertSpcColor(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshUseVertSpcColor 項を参照。

%index
dx_MV1GetMeshShapeFlag
DxLib MV1GetMeshShapeFlag (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int MeshIndex
%inst
DxLib の MV1GetMeshShapeFlag() を呼び出します。
^p
元関数シグネチャ: int MV1GetMeshShapeFlag(int MHandle, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetMeshShapeFlag 項を参照。

%index
dx_MV1GetShapeNum
DxLib MV1GetShapeNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetShapeNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetShapeNum(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetShapeNum 項を参照。

%index
dx_MV1SearchShape
DxLib MV1SearchShape (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : str ShapeName
%inst
DxLib の MV1SearchShape() を呼び出します。
^p
元関数シグネチャ: int MV1SearchShape(int MHandle, const TCHAR * ShapeName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SearchShape 項を参照。

%index
dx_MV1GetShapeTargetMeshNum
DxLib MV1GetShapeTargetMeshNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int ShapeIndex
%inst
DxLib の MV1GetShapeTargetMeshNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetShapeTargetMeshNum(int MHandle, int ShapeIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetShapeTargetMeshNum 項を参照。

%index
dx_MV1GetShapeTargetMesh
DxLib MV1GetShapeTargetMesh (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int ShapeIndex
p3 : int Index
%inst
DxLib の MV1GetShapeTargetMesh() を呼び出します。
^p
元関数シグネチャ: int MV1GetShapeTargetMesh(int MHandle, int ShapeIndex, int Index)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetShapeTargetMesh 項を参照。

%index
dx_MV1SetShapeRate
DxLib MV1SetShapeRate (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int ShapeIndex
p3 : double (float 縮小) Rate
p4 : int Type (default DX_MV1_SHAPERATE_ADD)
%inst
DxLib の MV1SetShapeRate() を呼び出します。
^p
元関数シグネチャ: int MV1SetShapeRate(int MHandle, int ShapeIndex, float Rate, int Type)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetShapeRate 項を参照。

%index
dx_MV1GetTriangleListNum
DxLib MV1GetTriangleListNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
%inst
DxLib の MV1GetTriangleListNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetTriangleListNum(int MHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTriangleListNum 項を参照。

%index
dx_MV1GetTriangleListVertexType
DxLib MV1GetTriangleListVertexType (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TListIndex
%inst
DxLib の MV1GetTriangleListVertexType() を呼び出します。
^p
元関数シグネチャ: int MV1GetTriangleListVertexType(int MHandle, int TListIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTriangleListVertexType 項を参照。

%index
dx_MV1GetTriangleListPolygonNum
DxLib MV1GetTriangleListPolygonNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TListIndex
%inst
DxLib の MV1GetTriangleListPolygonNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetTriangleListPolygonNum(int MHandle, int TListIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTriangleListPolygonNum 項を参照。

%index
dx_MV1GetTriangleListVertexNum
DxLib MV1GetTriangleListVertexNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TListIndex
%inst
DxLib の MV1GetTriangleListVertexNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetTriangleListVertexNum(int MHandle, int TListIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTriangleListVertexNum 項を参照。

%index
dx_MV1GetTriangleListLocalWorldMatrixNum
DxLib MV1GetTriangleListLocalWorldMatrixNum (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TListIndex
%inst
DxLib の MV1GetTriangleListLocalWorldMatrixNum() を呼び出します。
^p
元関数シグネチャ: int MV1GetTriangleListLocalWorldMatrixNum(int MHandle, int TListIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTriangleListLocalWorldMatrixNum 項を参照。

%index
dx_MV1GetTriangleListUseMaterial
DxLib MV1GetTriangleListUseMaterial (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int TListIndex
%inst
DxLib の MV1GetTriangleListUseMaterial() を呼び出します。
^p
元関数シグネチャ: int MV1GetTriangleListUseMaterial(int MHandle, int TListIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1GetTriangleListUseMaterial 項を参照。

%index
dx_MV1SetupCollInfo
DxLib MV1SetupCollInfo (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex (default -1)
p3 : int XDivNum (default 32)
p4 : int YDivNum (default 8)
p5 : int ZDivNum (default 32)
p6 : int MeshIndex (default -1)
%inst
DxLib の MV1SetupCollInfo() を呼び出します。
^p
元関数シグネチャ: int MV1SetupCollInfo(int MHandle, int FrameIndex, int XDivNum, int YDivNum, int ZDivNum, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetupCollInfo 項を参照。

%index
dx_MV1TerminateCollInfo
DxLib MV1TerminateCollInfo (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex (default -1)
p3 : int MeshIndex (default -1)
%inst
DxLib の MV1TerminateCollInfo() を呼び出します。
^p
元関数シグネチャ: int MV1TerminateCollInfo(int MHandle, int FrameIndex, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1TerminateCollInfo 項を参照。

%index
dx_MV1RefreshCollInfo
DxLib MV1RefreshCollInfo (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex (default -1)
p3 : int MeshIndex (default -1)
%inst
DxLib の MV1RefreshCollInfo() を呼び出します。
^p
元関数シグネチャ: int MV1RefreshCollInfo(int MHandle, int FrameIndex, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1RefreshCollInfo 項を参照。

%index
dx_MV1SetupReferenceMesh
DxLib MV1SetupReferenceMesh (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : int IsTransform
p4 : int IsPositionOnly (default FALSE)
p5 : int MeshIndex (default -1)
%inst
DxLib の MV1SetupReferenceMesh() を呼び出します。
^p
元関数シグネチャ: int MV1SetupReferenceMesh(int MHandle, int FrameIndex, int IsTransform, int IsPositionOnly, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1SetupReferenceMesh 項を参照。

%index
dx_MV1TerminateReferenceMesh
DxLib MV1TerminateReferenceMesh (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : int IsTransform
p4 : int IsPositionOnly (default FALSE)
p5 : int MeshIndex (default -1)
%inst
DxLib の MV1TerminateReferenceMesh() を呼び出します。
^p
元関数シグネチャ: int MV1TerminateReferenceMesh(int MHandle, int FrameIndex, int IsTransform, int IsPositionOnly, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1TerminateReferenceMesh 項を参照。

%index
dx_MV1RefreshReferenceMesh
DxLib MV1RefreshReferenceMesh (自動生成、hsp3dx 専用)
%group
DxLib MV1 モデル
%prm
p1 : int MHandle
p2 : int FrameIndex
p3 : int IsTransform
p4 : int IsPositionOnly (default FALSE)
p5 : int MeshIndex (default -1)
%inst
DxLib の MV1RefreshReferenceMesh() を呼び出します。
^p
元関数シグネチャ: int MV1RefreshReferenceMesh(int MHandle, int FrameIndex, int IsTransform, int IsPositionOnly, int MeshIndex)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の MV1RefreshReferenceMesh 項を参照。

%index
dx_Live2D_SetCubism4CoreDLLPath
DxLib Live2D_SetCubism4CoreDLLPath (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str CoreDLLFilePath
%inst
DxLib の Live2D_SetCubism4CoreDLLPath() を呼び出します。
^p
元関数シグネチャ: int Live2D_SetCubism4CoreDLLPath(const TCHAR * CoreDLLFilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_SetCubism4CoreDLLPath 項を参照。

%index
dx_Live2D_SetCubism3CoreDLLPath
DxLib Live2D_SetCubism3CoreDLLPath (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str CoreDLLFilePath
%inst
DxLib の Live2D_SetCubism3CoreDLLPath() を呼び出します。
^p
元関数シグネチャ: int Live2D_SetCubism3CoreDLLPath(const TCHAR * CoreDLLFilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_SetCubism3CoreDLLPath 項を参照。

%index
dx_Live2D_RenderBegin
DxLib Live2D_RenderBegin (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の Live2D_RenderBegin() を呼び出します。
^p
元関数シグネチャ: int Live2D_RenderBegin(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_RenderBegin 項を参照。

%index
dx_Live2D_RenderEnd
DxLib Live2D_RenderEnd (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の Live2D_RenderEnd() を呼び出します。
^p
元関数シグネチャ: int Live2D_RenderEnd(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_RenderEnd 項を参照。

%index
dx_Live2D_LoadModel
DxLib Live2D_LoadModel (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : str FilePath
%inst
DxLib の Live2D_LoadModel() を呼び出します。
^p
元関数シグネチャ: int Live2D_LoadModel(const TCHAR * FilePath)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_LoadModel 項を参照。

%index
dx_Live2D_DeleteModel
DxLib Live2D_DeleteModel (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_DeleteModel() を呼び出します。
^p
元関数シグネチャ: int Live2D_DeleteModel(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_DeleteModel 項を参照。

%index
dx_Live2D_InitModel
DxLib Live2D_InitModel (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
(引数なし)
%inst
DxLib の Live2D_InitModel() を呼び出します。
^p
元関数シグネチャ: int Live2D_InitModel(void)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_InitModel 項を参照。

%index
dx_Live2D_SetUseAutoScaling
DxLib Live2D_SetUseAutoScaling (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int UseFlag
%inst
DxLib の Live2D_SetUseAutoScaling() を呼び出します。
^p
元関数シグネチャ: int Live2D_SetUseAutoScaling(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_SetUseAutoScaling 項を参照。

%index
dx_Live2D_SetUseAutoCentering
DxLib Live2D_SetUseAutoCentering (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int UseFlag
%inst
DxLib の Live2D_SetUseAutoCentering() を呼び出します。
^p
元関数シグネチャ: int Live2D_SetUseAutoCentering(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_SetUseAutoCentering 項を参照。

%index
dx_Live2D_SetUseReverseYAxis
DxLib Live2D_SetUseReverseYAxis (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int UseFlag
%inst
DxLib の Live2D_SetUseReverseYAxis() を呼び出します。
^p
元関数シグネチャ: int Live2D_SetUseReverseYAxis(int UseFlag)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_SetUseReverseYAxis 項を参照。

%index
dx_Live2D_Model_Update
DxLib Live2D_Model_Update (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : double (float 縮小) DeltaTimeSeconds
%inst
DxLib の Live2D_Model_Update() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_Update(int Live2DModelHandle, float DeltaTimeSeconds)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_Update 項を参照。

%index
dx_Live2D_Model_SetTranslate
DxLib Live2D_Model_SetTranslate (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : double (float 縮小) x
p3 : double (float 縮小) y
%inst
DxLib の Live2D_Model_SetTranslate() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_SetTranslate(int Live2DModelHandle, float x, float y)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_SetTranslate 項を参照。

%index
dx_Live2D_Model_SetExtendRate
DxLib Live2D_Model_SetExtendRate (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : double (float 縮小) ExRateX
p3 : double (float 縮小) ExRateY
%inst
DxLib の Live2D_Model_SetExtendRate() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_SetExtendRate(int Live2DModelHandle, float ExRateX, float ExRateY)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_SetExtendRate 項を参照。

%index
dx_Live2D_Model_SetRotate
DxLib Live2D_Model_SetRotate (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : double (float 縮小) RotAngle
%inst
DxLib の Live2D_Model_SetRotate() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_SetRotate(int Live2DModelHandle, float RotAngle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_SetRotate 項を参照。

%index
dx_Live2D_Model_Draw
DxLib Live2D_Model_Draw (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_Draw() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_Draw(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_Draw 項を参照。

%index
dx_Live2D_Model_StartMotion
DxLib Live2D_Model_StartMotion (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : str group
p3 : int no
p4 : double (float 縮小) fadeInSeconds (default -1.0f)
p5 : double (float 縮小) fadeOutSeconds (default -1.0f)
p6 : int isLoopFadeIn (default TRUE)
%inst
DxLib の Live2D_Model_StartMotion() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_StartMotion(int Live2DModelHandle, const TCHAR * group, int no, float fadeInSeconds, float fadeOutSeconds, int isLoopFadeIn)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_StartMotion 項を参照。

%index
dx_Live2D_Model_GetLastPlayMotionNo
DxLib Live2D_Model_GetLastPlayMotionNo (自動生成、hsp3dx 専用)
%group
DxLib 動画 / 再生
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_GetLastPlayMotionNo() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_GetLastPlayMotionNo(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_GetLastPlayMotionNo 項を参照。

%index
dx_Live2D_Model_IsMotionFinished
DxLib Live2D_Model_IsMotionFinished (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_IsMotionFinished() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_IsMotionFinished(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_IsMotionFinished 項を参照。

%index
dx_Live2D_Model_SetExpression
DxLib Live2D_Model_SetExpression (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : str expressionID
%inst
DxLib の Live2D_Model_SetExpression() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_SetExpression(int Live2DModelHandle, const TCHAR * expressionID)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_SetExpression 項を参照。

%index
dx_Live2D_Model_HitTest
DxLib Live2D_Model_HitTest (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : str hitAreaName
p3 : double (float 縮小) x
p4 : double (float 縮小) y
%inst
DxLib の Live2D_Model_HitTest() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_HitTest(int Live2DModelHandle, const TCHAR * hitAreaName, float x, float y)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_HitTest 項を参照。

%index
dx_Live2D_Model_GetParameterCount
DxLib Live2D_Model_GetParameterCount (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_GetParameterCount() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_GetParameterCount(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_GetParameterCount 項を参照。

%index
dx_Live2D_Model_SetParameterValue
DxLib Live2D_Model_SetParameterValue (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : str parameterId
p3 : double (float 縮小) value
%inst
DxLib の Live2D_Model_SetParameterValue() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_SetParameterValue(int Live2DModelHandle, const TCHAR * parameterId, float value)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_SetParameterValue 項を参照。

%index
dx_Live2D_Model_GetHitAreasCount
DxLib Live2D_Model_GetHitAreasCount (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_GetHitAreasCount() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_GetHitAreasCount(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_GetHitAreasCount 項を参照。

%index
dx_Live2D_Model_GetExpressionCount
DxLib Live2D_Model_GetExpressionCount (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_GetExpressionCount() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_GetExpressionCount(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_GetExpressionCount 項を参照。

%index
dx_Live2D_Model_GetMotionGroupCount
DxLib Live2D_Model_GetMotionGroupCount (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_GetMotionGroupCount() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_GetMotionGroupCount(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_GetMotionGroupCount 項を参照。

%index
dx_Live2D_Model_GetMotionCount
DxLib Live2D_Model_GetMotionCount (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
p2 : str groupName
%inst
DxLib の Live2D_Model_GetMotionCount() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_GetMotionCount(int Live2DModelHandle, const TCHAR * groupName)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_GetMotionCount 項を参照。

%index
dx_Live2D_Model_GetEyeBlinkParameterCount
DxLib Live2D_Model_GetEyeBlinkParameterCount (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_GetEyeBlinkParameterCount() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_GetEyeBlinkParameterCount(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_GetEyeBlinkParameterCount 項を参照。

%index
dx_Live2D_Model_GetLipSyncParameterCount
DxLib Live2D_Model_GetLipSyncParameterCount (自動生成、hsp3dx 専用)
%group
DxLib その他
%prm
p1 : int Live2DModelHandle
%inst
DxLib の Live2D_Model_GetLipSyncParameterCount() を呼び出します。
^p
元関数シグネチャ: int Live2D_Model_GetLipSyncParameterCount(int Live2DModelHandle)
^p
戻り値は stat に入ります (DxLib は慣習として成功 0 / 失敗 -1)。
^p
詳細は DxLib 公式リファレンス https://dxlib.xsrv.jp/dxfunc.html の Live2D_Model_GetLipSyncParameterCount 項を参照。
