//  hsp3dx_dxlib_auto_f.cpp — 関数形式 DxLib binding (#ccmd)
//  DO NOT EDIT — gen_dxlib_bindings.py で再生成
//  関数数: 1144
#include <stdio.h>
#include <string.h>
#include <windows.h>
#include "../../hsp3/hsp3config.h"
#include "../../hsp3/hsp3struct.h"
#include "../../hsp3/hsp3code.h"
#include "../../hsp3/hsp3debug.h"
#include "DxLib.h"
#include "hsp3dx_console.h"

//  dispatcher: reffunc_function から呼ばれる。
//  既に `(` は code_next() で消費済、ここでは引数列を順に parse して DxLib 関数を呼ぶ。
//  戻り値は専用 static 領域に格納、戻り type を *type_res、ポインタを return。
//  戻り値 0 = 未対応 (dispatcher は触らなかった) / 1 = 処理済
static int    s_ret_i = 0;
static double s_ret_d = 0.0;
static LONGLONG s_ret_i64 = 0;

extern "C" int hsp3dx_dxlib_auto_f_dispatch( int cmd, int *type_res, void **ptr_out )
{
    switch ( cmd ) {
    case 0x300: {  // DxLib_GlobalStructInitialize -> r_int
        s_ret_i = DxLib_GlobalStructInitialize(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x301: {  // DxLib_IsInit -> r_int
        s_ret_i = DxLib_IsInit(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x302: {  // GetLastErrorCode -> r_int
        s_ret_i = GetLastErrorCode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x303: {  // GetLastErrorMessage -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetLastErrorMessage( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x304: {  // SetAlwaysRunFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetAlwaysRunFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x305: {  // WaitTimer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = WaitTimer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x306: {  // WaitKey -> r_int
        s_ret_i = WaitKey(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x307: {  // SleepThread -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SleepThread( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x308: {  // GetNowCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetNowCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x309: {  // GetNowHiPerformanceCount -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetNowHiPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30a: {  // GetNowSysPerformanceCount -> r_uint64
        s_ret_i64 = (LONGLONG)(GetNowSysPerformanceCount(  ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30b: {  // GetSysPerformanceFrequency -> r_uint64
        s_ret_i64 = (LONGLONG)(GetSysPerformanceFrequency(  ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30c: {  // ConvSysPerformanceCountToSeconds -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSysPerformanceCountToSeconds( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30d: {  // ConvSysPerformanceCountToMilliSeconds -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSysPerformanceCountToMilliSeconds( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30e: {  // ConvSysPerformanceCountToMicroSeconds -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSysPerformanceCountToMicroSeconds( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30f: {  // ConvSysPerformanceCountToNanoSeconds -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSysPerformanceCountToNanoSeconds( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x310: {  // ConvSecondsToSysPerformanceCount -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSecondsToSysPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x311: {  // ConvMilliSecondsToSysPerformanceCount -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvMilliSecondsToSysPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x312: {  // ConvMicroSecondsToSysPerformanceCount -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvMicroSecondsToSysPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x313: {  // ConvNanoSecondsToSysPerformanceCount -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvNanoSecondsToSysPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x314: {  // GetRand -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetRand( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x315: {  // SRand -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SRand( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x316: {  // GetBatteryLifePercent -> r_int
        s_ret_i = GetBatteryLifePercent(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x317: {  // GetClipboardText -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( -1 );
        s_ret_i = GetClipboardText( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x318: {  // SetClipboardText -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = SetClipboardText( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x319: {  // LogFileAdd -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LogFileAdd( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31a: {  // LogFileTabAdd -> r_int
        s_ret_i = LogFileTabAdd(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31b: {  // LogFileTabSub -> r_int
        s_ret_i = LogFileTabSub(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31c: {  // ErrorLogAdd -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = ErrorLogAdd( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31d: {  // ErrorLogTabAdd -> r_int
        s_ret_i = ErrorLogTabAdd(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31e: {  // ErrorLogTabSub -> r_int
        s_ret_i = ErrorLogTabSub(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31f: {  // SetUseTimeStampFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseTimeStampFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x320: {  // SetOutApplicationLogValidFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetOutApplicationLogValidFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x321: {  // SetOutApplicationSystemLogValidFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetOutApplicationSystemLogValidFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x322: {  // SetApplicationLogFileName -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = SetApplicationLogFileName( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x323: {  // SetApplicationLogSaveDirectory -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = SetApplicationLogSaveDirectory( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x324: {  // SetUseDateNameLogFile -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDateNameLogFile( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x325: {  // SetLogDrawOutFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLogDrawOutFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x326: {  // GetLogDrawFlag -> r_int
        s_ret_i = GetLogDrawFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x327: {  // SetLogFontSize -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLogFontSize( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x328: {  // SetLogFontHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLogFontHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x329: {  // SetLogDrawArea -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetLogDrawArea( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32a: {  // putsDx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 1 );
        s_ret_i = putsDx( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32b: {  // clsDx -> r_int
        s_ret_i = clsDx(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32c: {  // setPrintColorDx -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = setPrintColorDx( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32d: {  // SetUseASyncLoadFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseASyncLoadFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32e: {  // GetUseASyncLoadFlag -> r_int
        s_ret_i = GetUseASyncLoadFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32f: {  // CheckHandleASyncLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckHandleASyncLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x330: {  // GetHandleASyncLoadResult -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetHandleASyncLoadResult( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x331: {  // SetASyncLoadFinishDeleteFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetASyncLoadFinishDeleteFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x332: {  // WaitHandleASyncLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = WaitHandleASyncLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x333: {  // WaitHandleASyncLoadAll -> r_int
        s_ret_i = WaitHandleASyncLoadAll(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x334: {  // GetASyncLoadNum -> r_int
        s_ret_i = GetASyncLoadNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x335: {  // SetASyncLoadThreadNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetASyncLoadThreadNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x336: {  // SetMouseDispFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMouseDispFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x337: {  // SetMouseDispIgnoreMenuFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMouseDispIgnoreMenuFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x338: {  // SetMousePoint -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetMousePoint( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x339: {  // GetMouseInput -> r_int
        s_ret_i = GetMouseInput(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33a: {  // GetMouseWheelRotVol -> r_int
        int _a0 = code_getdi( 1 );
        s_ret_i = GetMouseWheelRotVol( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33b: {  // GetMouseHWheelRotVol -> r_int
        int _a0 = code_getdi( 1 );
        s_ret_i = GetMouseHWheelRotVol( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33c: {  // GetMouseWheelRotVolF -> r_float
        int _a0 = code_getdi( 1 );
        s_ret_d = (double)(GetMouseWheelRotVolF( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x33d: {  // GetMouseHWheelRotVolF -> r_float
        int _a0 = code_getdi( 1 );
        s_ret_d = (double)(GetMouseHWheelRotVolF( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x33e: {  // GetTouchInputNum -> r_int
        s_ret_i = GetTouchInputNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33f: {  // GetTouchInputLogNum -> r_int
        s_ret_i = GetTouchInputLogNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x340: {  // ClearTouchInputLog -> r_int
        s_ret_i = ClearTouchInputLog(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x341: {  // GetTouchInputDownLogNum -> r_int
        s_ret_i = GetTouchInputDownLogNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x342: {  // ClearTouchInputDownLog -> r_int
        s_ret_i = ClearTouchInputDownLog(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x343: {  // GetTouchInputUpLogNum -> r_int
        s_ret_i = GetTouchInputUpLogNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x344: {  // ClearTouchInputUpLog -> r_int
        s_ret_i = ClearTouchInputUpLog(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x345: {  // DxSetAllocPrintFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DxSetAllocPrintFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x346: {  // DxGetAllocNum -> r_int
        s_ret_i = DxGetAllocNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x347: {  // DxErrorCheckAlloc -> r_int
        s_ret_i = DxErrorCheckAlloc(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x348: {  // DxSetAllocSizeOutFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DxSetAllocSizeOutFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x349: {  // DxSetAllocMemoryErrorCheckFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DxSetAllocMemoryErrorCheckFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34a: {  // GetUseCharCodeFormat -> r_int
        s_ret_i = GetUseCharCodeFormat(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34b: {  // Get_wchar_t_CharCodeFormat -> r_int
        s_ret_i = Get_wchar_t_CharCodeFormat(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34c: {  // strcmpDx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = strcmpDx( _a0_w, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34d: {  // stricmpDx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = stricmpDx( _a0_w, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34e: {  // strncmpDx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        s_ret_i = strncmpDx( _a0_w, _a1_w, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34f: {  // strncmp2Dx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        s_ret_i = strncmp2Dx( _a0_w, _a1_w, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x350: {  // strpncmpDx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = strpncmpDx( _a0_w, _a1_w, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x351: {  // strpncmp2Dx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = strpncmp2Dx( _a0_w, _a1_w, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x352: {  // strstr2Dx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = strstr2Dx( _a0_w, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x353: {  // strrstr2Dx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = strrstr2Dx( _a0_w, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x354: {  // atoiDx -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = atoiDx( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x355: {  // atofDx -> r_double
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_d = atofDx( _a0_w );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x356: {  // ProcessNetMessage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ProcessNetMessage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x357: {  // PreparationListenNetWork -> r_int
        int _a0 = code_getdi( -1 );
        s_ret_i = PreparationListenNetWork( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x358: {  // PreparationListenNetWork_IPv6 -> r_int
        int _a0 = code_getdi( -1 );
        s_ret_i = PreparationListenNetWork_IPv6( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x359: {  // StopListenNetWork -> r_int
        s_ret_i = StopListenNetWork(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35a: {  // CloseNetWork -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CloseNetWork( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35b: {  // GetNetWorkAcceptState -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetNetWorkAcceptState( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35c: {  // GetNetWorkDataLength -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetNetWorkDataLength( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35d: {  // GetNetWorkSendDataLength -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetNetWorkSendDataLength( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35e: {  // GetNewAcceptNetWork -> r_int
        s_ret_i = GetNewAcceptNetWork(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35f: {  // GetLostNetWork -> r_int
        s_ret_i = GetLostNetWork(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x360: {  // SetConnectTimeOutWait -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetConnectTimeOutWait( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x361: {  // SetUseDXNetWorkProtocol -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDXNetWorkProtocol( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x362: {  // GetUseDXNetWorkProtocol -> r_int
        s_ret_i = GetUseDXNetWorkProtocol(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x363: {  // SetUseDXProtocol -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDXProtocol( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x364: {  // GetUseDXProtocol -> r_int
        s_ret_i = GetUseDXProtocol(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x365: {  // SetNetWorkCloseAfterLostFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetNetWorkCloseAfterLostFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x366: {  // GetNetWorkCloseAfterLostFlag -> r_int
        s_ret_i = GetNetWorkCloseAfterLostFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x367: {  // NetWorkRecvBufferClear -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = NetWorkRecvBufferClear( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x368: {  // MakeUDPSocket -> r_int
        int _a0 = code_getdi( -1 );
        s_ret_i = MakeUDPSocket( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x369: {  // MakeUDPSocket_IPv6 -> r_int
        int _a0 = code_getdi( -1 );
        s_ret_i = MakeUDPSocket_IPv6( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36a: {  // DeleteUDPSocket -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteUDPSocket( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36b: {  // CheckNetWorkRecvUDP -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckNetWorkRecvUDP( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36c: {  // ClearInputCharBuf -> r_int
        s_ret_i = ClearInputCharBuf(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36d: {  // GetOneChar -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetOneChar( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36e: {  // GetOneCharWait -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetOneCharWait( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36f: {  // DrawIMEInputString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 1 );
        s_ret_i = DrawIMEInputString( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x370: {  // DrawIMEInputExtendString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 1 );
        s_ret_i = DrawIMEInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x371: {  // SetUseIMEFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseIMEFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x372: {  // GetUseIMEFlag -> r_int
        s_ret_i = GetUseIMEFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x373: {  // SetInputStringMaxLengthIMESync -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetInputStringMaxLengthIMESync( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x374: {  // SetIMEInputStringMaxLength -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetIMEInputStringMaxLength( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x375: {  // GetStringPoint -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetStringPoint( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x376: {  // GetStringPoint2 -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetStringPoint2( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x377: {  // GetStringLength -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = GetStringLength( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x378: {  // DrawObtainsBox -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawObtainsBox( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x379: {  // KeyInputNumber -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = KeyInputNumber( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37a: {  // GetIMEInputModeStr -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = GetIMEInputModeStr( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37b: {  // SetIMEInputString -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = SetIMEInputString( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37c: {  // SetKeyInputStringFont -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetKeyInputStringFont( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37d: {  // DrawKeyInputModeString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = DrawKeyInputModeString( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37e: {  // InitKeyInput -> r_int
        s_ret_i = InitKeyInput(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37f: {  // DeleteKeyInput -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteKeyInput( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x380: {  // SetActiveKeyInput -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetActiveKeyInput( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x381: {  // GetActiveKeyInput -> r_int
        s_ret_i = GetActiveKeyInput(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x382: {  // CheckKeyInput -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckKeyInput( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x383: {  // ReStartKeyInput -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ReStartKeyInput( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x384: {  // ProcessActKeyInput -> r_int
        s_ret_i = ProcessActKeyInput(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x385: {  // DrawKeyInputString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 1 );
        s_ret_i = DrawKeyInputString( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x386: {  // DrawKeyInputExtendString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 1 );
        s_ret_i = DrawKeyInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x387: {  // SetKeyInputDrawArea -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = SetKeyInputDrawArea( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x388: {  // SetKeyInputSelectArea -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetKeyInputSelectArea( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x389: {  // SetKeyInputDrawStartPos -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetKeyInputDrawStartPos( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38a: {  // GetKeyInputDrawStartPos -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetKeyInputDrawStartPos( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38b: {  // SetKeyInputCursorBrinkTime -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetKeyInputCursorBrinkTime( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38c: {  // SetKeyInputCursorBrinkFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetKeyInputCursorBrinkFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38d: {  // SetKeyInputString -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetKeyInputString( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38e: {  // SetKeyInputNumber -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetKeyInputNumber( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38f: {  // SetKeyInputNumberToFloat -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetKeyInputNumberToFloat( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x390: {  // GetKeyInputString -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetKeyInputString( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x391: {  // GetKeyInputNumber -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetKeyInputNumber( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x392: {  // GetKeyInputNumberToFloat -> r_float
        int _a0 = code_getdi( 0 );
        s_ret_d = (double)(GetKeyInputNumberToFloat( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x393: {  // SetKeyInputCursorPosition -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetKeyInputCursorPosition( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x394: {  // GetKeyInputCursorPosition -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetKeyInputCursorPosition( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x395: {  // FileRead_open -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = FileRead_open( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x396: {  // FileRead_size -> r_int64
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i64 = (LONGLONG)(FileRead_size( _a0_w ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x397: {  // FileRead_size_handle -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(FileRead_size_handle( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x398: {  // FileRead_close -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FileRead_close( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x399: {  // FileRead_tell -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(FileRead_tell( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x39a: {  // FileRead_seek -> r_int
        int _a0 = code_getdi( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = code_getdi( 0 );
        s_ret_i = FileRead_seek( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39b: {  // FileRead_idle_chk -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FileRead_idle_chk( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39c: {  // FileRead_eof -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FileRead_eof( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39d: {  // FileRead_gets -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = FileRead_gets( _a0_w, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39e: {  // FileRead_fullyLoad -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = FileRead_fullyLoad( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39f: {  // FileRead_fullyLoad_delete -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FileRead_fullyLoad_delete( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a0: {  // FileRead_fullyLoad_getSize -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(FileRead_fullyLoad_getSize( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x3a1: {  // GetStreamFunctionDefault -> r_int
        s_ret_i = GetStreamFunctionDefault(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a2: {  // ConvertFullPath -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        s_ret_i = ConvertFullPath( _a0_w, _a1_w, _a2_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a3: {  // CheckHitKey -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckHitKey( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a4: {  // CheckHitKeyAll -> r_int
        int _a0 = code_getdi( DX_CHECKINPUT_ALL );
        s_ret_i = CheckHitKeyAll( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a5: {  // GetJoypadNum -> r_int
        s_ret_i = GetJoypadNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a6: {  // GetJoypadButtonNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetJoypadButtonNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a7: {  // GetJoypadInputState -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetJoypadInputState( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a8: {  // CheckJoypadXInput -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckJoypadXInput( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a9: {  // GetJoypadType -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetJoypadType( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3aa: {  // SetJoypadInputToKeyInput -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( -1 );
        int _a5 = code_getdi( -1 );
        s_ret_i = SetJoypadInputToKeyInput( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ab: {  // SetJoypadDeadZone -> r_int
        int _a0 = code_getdi( 0 );
        double _a1 = code_getdd( 0.0 );
        s_ret_i = SetJoypadDeadZone( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ac: {  // GetJoypadDeadZone -> r_double
        int _a0 = code_getdi( 0 );
        s_ret_d = GetJoypadDeadZone( _a0 );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x3ad: {  // SetJoypadDefaultDeadZoneAll -> r_int
        double _a0 = code_getdd( 0.0 );
        s_ret_i = SetJoypadDefaultDeadZoneAll( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ae: {  // GetJoypadDefaultDeadZoneAll -> r_double
        s_ret_d = GetJoypadDefaultDeadZoneAll(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x3af: {  // StartJoypadVibration -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( -1 );
        s_ret_i = StartJoypadVibration( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b0: {  // StopJoypadVibration -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        s_ret_i = StopJoypadVibration( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b1: {  // GetJoypadPOVState -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetJoypadPOVState( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b2: {  // ReSetupJoypad -> r_int
        s_ret_i = ReSetupJoypad(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b3: {  // ReSetupInputSystem -> r_int
        s_ret_i = ReSetupInputSystem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b4: {  // SetUseJoypadVibrationFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseJoypadVibrationFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b5: {  // MakeGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MakeGraph( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b6: {  // MakeScreen -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MakeScreen( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b7: {  // DerivationGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = DerivationGraph( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b8: {  // DerivationGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = DerivationGraphF( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b9: {  // DeleteGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ba: {  // DeleteSharingGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSharingGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3bb: {  // GetGraphNum -> r_int
        s_ret_i = GetGraphNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3bc: {  // FillGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 255 );
        s_ret_i = FillGraph( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3bd: {  // FillRectGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 255 );
        s_ret_i = FillRectGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3be: {  // InitGraph -> r_int
        s_ret_i = InitGraph(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3bf: {  // ReloadFileGraphAll -> r_int
        s_ret_i = ReloadFileGraphAll(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c0: {  // MakeShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeShadowMap( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c1: {  // DeleteShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteShadowMap( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c2: {  // ShadowMap_DrawSetup -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ShadowMap_DrawSetup( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c3: {  // ShadowMap_DrawEnd -> r_int
        s_ret_i = ShadowMap_DrawEnd(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c4: {  // SetUseShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetUseShadowMap( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c5: {  // ResetShadowMapDrawArea -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ResetShadowMapDrawArea( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c6: {  // SetShadowMapAdjustDepth -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetShadowMapAdjustDepth( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c7: {  // TestDrawShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = TestDrawShadowMap( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c8: {  // LoadBmpToGraph -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( DX_MOVIESURFACE_NORMAL );
        s_ret_i = LoadBmpToGraph( _a0_w, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c9: {  // LoadGraph -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = LoadGraph( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ca: {  // LoadReverseGraph -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = LoadReverseGraph( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3cb: {  // LoadBlendGraph -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadBlendGraph( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3cc: {  // CreateBlendGraphFromSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CreateBlendGraphFromSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3cd: {  // CreateGraphFromSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CreateGraphFromSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ce: {  // CreateGraphFromRectSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = CreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3cf: {  // ReCreateGraphFromSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ReCreateGraphFromSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d0: {  // ReCreateGraphFromRectSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = ReCreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d1: {  // ReloadGraph -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = ReloadGraph( _a0_w, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d2: {  // ReloadReverseGraph -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ReloadReverseGraph( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d3: {  // SetGraphColorBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetGraphColorBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d4: {  // GetGraphColorBitDepth -> r_int
        s_ret_i = GetGraphColorBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d5: {  // SetCreateGraphColorBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateGraphColorBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d6: {  // GetCreateGraphColorBitDepth -> r_int
        s_ret_i = GetCreateGraphColorBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d7: {  // SetCreateGraphChannelBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateGraphChannelBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d8: {  // GetCreateGraphChannelBitDepth -> r_int
        s_ret_i = GetCreateGraphChannelBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d9: {  // SetCreateGraphInitGraphDelete -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateGraphInitGraphDelete( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3da: {  // GetCreateGraphInitGraphDelete -> r_int
        s_ret_i = GetCreateGraphInitGraphDelete(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3db: {  // SetCreateGraphHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateGraphHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3dc: {  // GetCreateGraphHandle -> r_int
        s_ret_i = GetCreateGraphHandle(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3dd: {  // SetDrawValidGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3de: {  // GetDrawValidGraphCreateFlag -> r_int
        s_ret_i = GetDrawValidGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3df: {  // SetDrawValidFlagOf3DGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidFlagOf3DGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e0: {  // SetLeftUpColorIsTransColorFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLeftUpColorIsTransColorFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e1: {  // SetUsePaletteGraphFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePaletteGraphFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e2: {  // SetUseBlendGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseBlendGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e3: {  // GetUseBlendGraphCreateFlag -> r_int
        s_ret_i = GetUseBlendGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e4: {  // SetUseAlphaTestGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseAlphaTestGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e5: {  // GetUseAlphaTestGraphCreateFlag -> r_int
        s_ret_i = GetUseAlphaTestGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e6: {  // SetUseAlphaTestFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseAlphaTestFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e7: {  // GetUseAlphaTestFlag -> r_int
        s_ret_i = GetUseAlphaTestFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e8: {  // SetCubeMapTextureCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCubeMapTextureCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e9: {  // GetCubeMapTextureCreateFlag -> r_int
        s_ret_i = GetCubeMapTextureCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ea: {  // SetUseNoBlendModeParam -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseNoBlendModeParam( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3eb: {  // SetDrawValidAlphaChannelGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidAlphaChannelGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ec: {  // GetDrawValidAlphaChannelGraphCreateFlag -> r_int
        s_ret_i = GetDrawValidAlphaChannelGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ed: {  // SetDrawValidFloatTypeGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidFloatTypeGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ee: {  // GetDrawValidFloatTypeGraphCreateFlag -> r_int
        s_ret_i = GetDrawValidFloatTypeGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ef: {  // SetDrawValidGraphCreateZBufferFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidGraphCreateZBufferFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f0: {  // GetDrawValidGraphCreateZBufferFlag -> r_int
        s_ret_i = GetDrawValidGraphCreateZBufferFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f1: {  // SetCreateDrawValidGraphZBufferBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateDrawValidGraphZBufferBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f2: {  // GetCreateDrawValidGraphZBufferBitDepth -> r_int
        s_ret_i = GetCreateDrawValidGraphZBufferBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f3: {  // SetCreateDrawValidGraphMipLevels -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateDrawValidGraphMipLevels( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f4: {  // GetCreateDrawValidGraphMipLevels -> r_int
        s_ret_i = GetCreateDrawValidGraphMipLevels(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f5: {  // SetCreateDrawValidGraphChannelNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateDrawValidGraphChannelNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f6: {  // GetCreateDrawValidGraphChannelNum -> r_int
        s_ret_i = GetCreateDrawValidGraphChannelNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f7: {  // SetCreateDrawValidGraphMultiSample -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetCreateDrawValidGraphMultiSample( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f8: {  // SetDrawValidMultiSample -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetDrawValidMultiSample( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f9: {  // GetMultiSampleQuality -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMultiSampleQuality( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3fa: {  // SetUseTransColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseTransColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3fb: {  // SetUseTransColorGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseTransColorGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3fc: {  // SetUseGraphAlphaChannel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseGraphAlphaChannel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3fd: {  // GetUseGraphAlphaChannel -> r_int
        s_ret_i = GetUseGraphAlphaChannel(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3fe: {  // SetUseAlphaChannelGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseAlphaChannelGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ff: {  // GetUseAlphaChannelGraphCreateFlag -> r_int
        s_ret_i = GetUseAlphaChannelGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x400: {  // SetUseNotManageTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseNotManageTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x401: {  // GetUseNotManageTextureFlag -> r_int
        s_ret_i = GetUseNotManageTextureFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x402: {  // SetUsePlatformTextureFormat -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePlatformTextureFormat( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x403: {  // GetUsePlatformTextureFormat -> r_int
        s_ret_i = GetUsePlatformTextureFormat(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x404: {  // SetTransColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetTransColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x405: {  // SetUseDivGraphFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDivGraphFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x406: {  // SetUseAlphaImageLoadFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseAlphaImageLoadFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x407: {  // SetUseMaxTextureSize -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseMaxTextureSize( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x408: {  // SetUseGraphBaseDataBackup -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseGraphBaseDataBackup( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x409: {  // GetUseGraphBaseDataBackup -> r_int
        s_ret_i = GetUseGraphBaseDataBackup(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x40a: {  // SetUseSystemMemGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseSystemMemGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x40b: {  // GetUseSystemMemGraphCreateFlag -> r_int
        s_ret_i = GetUseSystemMemGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x40c: {  // SetUseLoadDivGraphSizeCheckFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseLoadDivGraphSizeCheckFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x40d: {  // GetUseLoadDivGraphSizeCheckFlag -> r_int
        s_ret_i = GetUseLoadDivGraphSizeCheckFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x40e: {  // GraphUnLock -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GraphUnLock( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x40f: {  // SetUseGraphZBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( -1 );
        s_ret_i = SetUseGraphZBuffer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x410: {  // CopyGraphZBufferImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = CopyGraphZBufferImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x411: {  // SetDeviceLostDeleteGraphFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetDeviceLostDeleteGraphFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x412: {  // GetGraphMipmapCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetGraphMipmapCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x413: {  // GetGraphFilePath -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = GetGraphFilePath( _a0, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x414: {  // CheckDrawValidGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckDrawValidGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x415: {  // GetValidRestoreShredPoint -> r_int
        s_ret_i = GetValidRestoreShredPoint(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x416: {  // SetGraphPalette -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        unsigned int _a2 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = SetGraphPalette( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x417: {  // ResetGraphPalette -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ResetGraphPalette( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x418: {  // DrawLine -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 1 );
        s_ret_i = DrawLine( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x419: {  // DrawLineAA -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        float _a5 = (float)code_getdd( 1.0 );
        s_ret_i = DrawLineAA( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x41a: {  // DrawBox -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 1 );
        s_ret_i = DrawBox( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x41b: {  // DrawBoxAA -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 0 );
        float _a6 = (float)code_getdd( 1.0 );
        s_ret_i = DrawBoxAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x41c: {  // DrawFillBox -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawFillBox( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x41d: {  // DrawLineBox -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 1 );
        s_ret_i = DrawLineBox( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x41e: {  // DrawCircle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 1 );
        int _a5 = code_getdi( 1 );
        s_ret_i = DrawCircle( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x41f: {  // DrawCircleAA -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 1 );
        float _a6 = (float)code_getdd( 1.0 );
        double _a7 = code_getdd( 0.0 );
        s_ret_i = DrawCircleAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x420: {  // DrawOval -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 1 );
        s_ret_i = DrawOval( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x421: {  // DrawOvalAA -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        float _a7 = (float)code_getdd( 1.0 );
        s_ret_i = DrawOvalAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x422: {  // DrawOval_Rect -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 0 );
        s_ret_i = DrawOval_Rect( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x423: {  // DrawTriangle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        int _a7 = code_getdi( 0 );
        s_ret_i = DrawTriangle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x424: {  // DrawTriangleAA -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        int _a7 = code_getdi( 0 );
        float _a8 = (float)code_getdd( 1.0 );
        s_ret_i = DrawTriangleAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x425: {  // DrawQuadrangle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        unsigned int _a8 = (unsigned int)code_getdi( (int)(0) );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawQuadrangle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x426: {  // DrawQuadrangleAA -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        unsigned int _a8 = (unsigned int)code_getdi( (int)(0) );
        int _a9 = code_getdi( 0 );
        float _a10 = (float)code_getdd( 1.0 );
        s_ret_i = DrawQuadrangleAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x427: {  // DrawRoundRect -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        int _a7 = code_getdi( 0 );
        s_ret_i = DrawRoundRect( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x428: {  // DrawRoundRectAA -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        int _a8 = code_getdi( 0 );
        float _a9 = (float)code_getdd( 1.0 );
        s_ret_i = DrawRoundRectAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x429: {  // BeginAADraw -> r_int
        s_ret_i = BeginAADraw(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42a: {  // EndAADraw -> r_int
        s_ret_i = EndAADraw(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42b: {  // DrawPixel -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        unsigned int _a2 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawPixel( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42c: {  // LoadGraphScreen -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = code_getdi( 0 );
        s_ret_i = LoadGraphScreen( _a0, _a1, _a2_w, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42d: {  // DrawGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawGraph( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42e: {  // DrawExtendGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = DrawExtendGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42f: {  // DrawRotaGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        s_ret_i = DrawRotaGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x430: {  // DrawRotaGraph2 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRotaGraph2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x431: {  // DrawRotaGraph3 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        double _a6 = code_getdd( 0.0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        s_ret_i = DrawRotaGraph3( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x432: {  // DrawRotaGraphFast -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        s_ret_i = DrawRotaGraphFast( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x433: {  // DrawRotaGraphFast2 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRotaGraphFast2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x434: {  // DrawRotaGraphFast3 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        s_ret_i = DrawRotaGraphFast3( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x435: {  // DrawModiGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawModiGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x436: {  // DrawTurnGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawTurnGraph( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x437: {  // DrawReverseGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = DrawReverseGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x438: {  // DrawGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawGraphF( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x439: {  // DrawExtendGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = DrawExtendGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43a: {  // DrawRotaGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        s_ret_i = DrawRotaGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43b: {  // DrawRotaGraph2F -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRotaGraph2F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43c: {  // DrawRotaGraph3F -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        double _a6 = code_getdd( 0.0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        s_ret_i = DrawRotaGraph3F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43d: {  // DrawRotaGraphFastF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        s_ret_i = DrawRotaGraphFastF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43e: {  // DrawRotaGraphFast2F -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRotaGraphFast2F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43f: {  // DrawRotaGraphFast3F -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        s_ret_i = DrawRotaGraphFast3F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x440: {  // DrawModiGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawModiGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x441: {  // DrawTurnGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawTurnGraphF( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x442: {  // DrawReverseGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = DrawReverseGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x443: {  // DrawTile -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        double _a6 = code_getdd( 0.0 );
        double _a7 = code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawTile( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x444: {  // DrawRectGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRectGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x445: {  // DrawRectExtendGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRectExtendGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x446: {  // DrawRectRotaGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        double _a6 = code_getdd( 0.0 );
        double _a7 = code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x447: {  // DrawRectRotaGraph2 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        double _a8 = code_getdd( 0.0 );
        double _a9 = code_getdd( 0.0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraph2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x448: {  // DrawRectRotaGraph3 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        double _a8 = code_getdd( 0.0 );
        double _a9 = code_getdd( 0.0 );
        double _a10 = code_getdd( 0.0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        int _a14 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraph3( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13, _a14 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x449: {  // DrawRectRotaGraphFast -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraphFast( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44a: {  // DrawRectRotaGraphFast2 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        float _a8 = (float)code_getdd( 0.0 );
        float _a9 = (float)code_getdd( 0.0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraphFast2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44b: {  // DrawRectRotaGraphFast3 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        float _a8 = (float)code_getdd( 0.0 );
        float _a9 = (float)code_getdd( 0.0 );
        float _a10 = (float)code_getdd( 0.0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        int _a14 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraphFast3( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13, _a14 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44c: {  // DrawRectModiGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        s_ret_i = DrawRectModiGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44d: {  // DrawRectGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRectGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44e: {  // DrawRectGraphF2 -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRectGraphF2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44f: {  // DrawRectExtendGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRectExtendGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x450: {  // DrawRectExtendGraphF2 -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        s_ret_i = DrawRectExtendGraphF2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x451: {  // DrawRectRotaGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        double _a6 = code_getdd( 0.0 );
        double _a7 = code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x452: {  // DrawRectRotaGraph2F -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        double _a8 = code_getdd( 0.0 );
        double _a9 = code_getdd( 0.0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraph2F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x453: {  // DrawRectRotaGraph3F -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        double _a8 = code_getdd( 0.0 );
        double _a9 = code_getdd( 0.0 );
        double _a10 = code_getdd( 0.0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        int _a14 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraph3F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13, _a14 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x454: {  // DrawRectRotaGraphFastF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraphFastF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x455: {  // DrawRectRotaGraphFast2F -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        float _a8 = (float)code_getdd( 0.0 );
        float _a9 = (float)code_getdd( 0.0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraphFast2F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x456: {  // DrawRectRotaGraphFast3F -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        float _a8 = (float)code_getdd( 0.0 );
        float _a9 = (float)code_getdd( 0.0 );
        float _a10 = (float)code_getdd( 0.0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        int _a14 = code_getdi( 0 );
        s_ret_i = DrawRectRotaGraphFast3F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13, _a14 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x457: {  // DrawRectModiGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        int _a12 = code_getdi( 0 );
        int _a13 = code_getdi( 0 );
        s_ret_i = DrawRectModiGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x458: {  // DrawBlendGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawBlendGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x459: {  // DrawBlendGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawBlendGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45a: {  // DrawBlendGraphPos -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        s_ret_i = DrawBlendGraphPos( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45b: {  // DrawCircleGauge -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        int _a3 = code_getdi( 0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 1.0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        s_ret_i = DrawCircleGauge( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45c: {  // DrawCircleGaugeF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        int _a3 = code_getdi( 0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 1.0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        s_ret_i = DrawCircleGaugeF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45d: {  // DrawPolygon3D_UseVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = DrawPolygon3D_UseVertexBuffer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45e: {  // DrawPolygonIndexed3D_UseVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawPolygonIndexed3D_UseVertexBuffer( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45f: {  // DrawGraph3D -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = DrawGraph3D( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x460: {  // DrawExtendGraph3D -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        double _a4 = code_getdd( 0.0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawExtendGraph3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x461: {  // DrawRotaGraph3D -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        double _a4 = code_getdd( 0.0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        s_ret_i = DrawRotaGraph3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x462: {  // DrawRota2Graph3D -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        double _a6 = code_getdd( 0.0 );
        double _a7 = code_getdd( 0.0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        s_ret_i = DrawRota2Graph3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x463: {  // SetDrawMode -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawMode( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x464: {  // GetDrawMode -> r_int
        s_ret_i = GetDrawMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x465: {  // SetDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetDrawBlendMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x466: {  // SetDrawAlphaTest -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetDrawAlphaTest( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x467: {  // SetBlendGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetBlendGraph( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x468: {  // SetBlendGraphPosition -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetBlendGraphPosition( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x469: {  // SetDrawBright -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetDrawBright( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46a: {  // SetDrawAddColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetDrawAddColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46b: {  // SetWriteAlphaChannelFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetWriteAlphaChannelFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46c: {  // GetWriteAlphaChannelFlag -> r_int
        s_ret_i = GetWriteAlphaChannelFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46d: {  // CheckSeparateAlphaBlendEnable -> r_int
        s_ret_i = CheckSeparateAlphaBlendEnable(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46e: {  // SetIgnoreDrawGraphColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetIgnoreDrawGraphColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46f: {  // GetIgnoreDrawGraphColor -> r_int
        s_ret_i = GetIgnoreDrawGraphColor(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x470: {  // SetMaxAnisotropy -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaxAnisotropy( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x471: {  // GetMaxAnisotropy -> r_int
        s_ret_i = GetMaxAnisotropy(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x472: {  // SetUseLarge3DPositionSupport -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseLarge3DPositionSupport( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x473: {  // SetUseZBufferFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseZBufferFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x474: {  // SetWriteZBufferFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetWriteZBufferFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x475: {  // SetZBias -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetZBias( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x476: {  // SetUseZBuffer3D -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseZBuffer3D( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x477: {  // SetWriteZBuffer3D -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetWriteZBuffer3D( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x478: {  // SetZBias3D -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetZBias3D( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x479: {  // SetDrawZ -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetDrawZ( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47a: {  // SetUseReversedZ -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseReversedZ( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47b: {  // SetDrawArea -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetDrawArea( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47c: {  // SetDrawAreaFull -> r_int
        s_ret_i = SetDrawAreaFull(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47d: {  // SetDraw3DScale -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetDraw3DScale( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47e: {  // RunRestoreShred -> r_int
        s_ret_i = RunRestoreShred(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47f: {  // ResetTransformTo2D -> r_int
        s_ret_i = ResetTransformTo2D(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x480: {  // SetDefTransformMatrix -> r_int
        s_ret_i = SetDefTransformMatrix(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x481: {  // SetUseCullingFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseCullingFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x482: {  // GetUseBackCulling -> r_int
        s_ret_i = GetUseBackCulling(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x483: {  // SetUseRightHandClippingProcess -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseRightHandClippingProcess( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x484: {  // GetUseRightHandClippingProcess -> r_int
        s_ret_i = GetUseRightHandClippingProcess(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x485: {  // SetTextureAddressModeUV -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( -1 );
        s_ret_i = SetTextureAddressModeUV( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x486: {  // SetTextureAddressTransform -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        s_ret_i = SetTextureAddressTransform( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x487: {  // ResetTextureAddressTransform -> r_int
        s_ret_i = ResetTextureAddressTransform(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x488: {  // SetFogEnable -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFogEnable( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x489: {  // GetFogEnable -> r_int
        s_ret_i = GetFogEnable(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48a: {  // GetFogMode -> r_int
        s_ret_i = GetFogMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48b: {  // SetFogColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetFogColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48c: {  // SetFogStartEnd -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetFogStartEnd( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48d: {  // SetFogDensity -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetFogDensity( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48e: {  // GetFogDensity -> r_float
        s_ret_d = (double)(GetFogDensity(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x48f: {  // SetVerticalFogEnable -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetVerticalFogEnable( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x490: {  // GetVerticalFogEnable -> r_int
        s_ret_i = GetVerticalFogEnable(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x491: {  // GetVerticalFogMode -> r_int
        s_ret_i = GetVerticalFogMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x492: {  // SetVerticalFogColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetVerticalFogColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x493: {  // SetVerticalFogStartEnd -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetVerticalFogStartEnd( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x494: {  // SetVerticalFogDensity -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetVerticalFogDensity( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x495: {  // GetPixel -> r_uint
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = (int)(GetPixel( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x496: {  // GetPixelDX -> r_uint
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = (int)(GetPixelDX( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x497: {  // SetBackgroundColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetBackgroundColor( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x498: {  // GetDrawScreenGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 1 );
        s_ret_i = GetDrawScreenGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x499: {  // BltDrawValidGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        s_ret_i = BltDrawValidGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49a: {  // ScreenFlip -> r_int
        s_ret_i = ScreenFlip(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49b: {  // ScreenCopy -> r_int
        s_ret_i = ScreenCopy(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49c: {  // WaitVSync -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = WaitVSync( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49d: {  // ClsDrawScreen -> r_int
        s_ret_i = ClsDrawScreen(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49e: {  // SetDrawScreen -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawScreen( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49f: {  // GetDrawScreen -> r_int
        s_ret_i = GetDrawScreen(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a0: {  // GetActiveGraph -> r_int
        s_ret_i = GetActiveGraph(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a1: {  // SetUseSetDrawScreenSettingReset -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseSetDrawScreenSettingReset( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a2: {  // GetUseSetDrawScreenSettingReset -> r_int
        s_ret_i = GetUseSetDrawScreenSettingReset(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a3: {  // SetDrawZBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawZBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a4: {  // SetGraphMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 60 );
        s_ret_i = SetGraphMode( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a5: {  // GetUseFullScreenResolutionMode -> r_int
        s_ret_i = GetUseFullScreenResolutionMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a6: {  // SetEmulation320x240 -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetEmulation320x240( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a7: {  // SetZBufferSize -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetZBufferSize( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a8: {  // SetZBufferBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetZBufferBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a9: {  // SetWaitVSyncFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetWaitVSyncFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4aa: {  // GetWaitVSyncFlag -> r_int
        s_ret_i = GetWaitVSyncFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ab: {  // SetFullSceneAntiAliasingMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetFullSceneAntiAliasingMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ac: {  // SetGraphDisplayArea -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetGraphDisplayArea( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ad: {  // SetChangeScreenModeGraphicsSystemResetFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetChangeScreenModeGraphicsSystemResetFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ae: {  // GetScreenBitDepth -> r_int
        s_ret_i = GetScreenBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4af: {  // GetColorBitDepth -> r_int
        s_ret_i = GetColorBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b0: {  // GetChangeDisplayFlag -> r_int
        s_ret_i = GetChangeDisplayFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b1: {  // GetRefreshRate -> r_int
        s_ret_i = GetRefreshRate(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b2: {  // GetDisplayNum -> r_int
        s_ret_i = GetDisplayNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b3: {  // GetDisplayModeNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetDisplayModeNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b4: {  // GetMultiDrawScreenNum -> r_int
        s_ret_i = GetMultiDrawScreenNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b5: {  // GetDrawFloatCoordType -> r_int
        s_ret_i = GetDrawFloatCoordType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b6: {  // SetUseNormalDrawShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseNormalDrawShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b7: {  // SetUseSoftwareRenderModeFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseSoftwareRenderModeFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b8: {  // SetNotUse3DFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetNotUse3DFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b9: {  // SetUse3DFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUse3DFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ba: {  // GetUse3DFlag -> r_int
        s_ret_i = GetUse3DFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4bb: {  // SetScreenMemToVramFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetScreenMemToVramFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4bc: {  // GetScreenMemToSystemMemFlag -> r_int
        s_ret_i = GetScreenMemToSystemMemFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4bd: {  // RestoreGraphSystem -> r_int
        s_ret_i = RestoreGraphSystem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4be: {  // SetUseHardwareVertexProcessing -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseHardwareVertexProcessing( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4bf: {  // SetUsePixelLighting -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePixelLighting( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c0: {  // SetUseOldDrawModiGraphCodeFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseOldDrawModiGraphCodeFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c1: {  // SetUseVramFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseVramFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c2: {  // GetUseVramFlag -> r_int
        s_ret_i = GetUseVramFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c3: {  // SetBasicBlendFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetBasicBlendFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c4: {  // SetUseBasicGraphDraw3DDeviceMethodFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseBasicGraphDraw3DDeviceMethodFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c5: {  // SetUseDisplayIndex -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDisplayIndex( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c6: {  // RenderVertex -> r_int
        s_ret_i = RenderVertex(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c7: {  // GetDrawCallCount -> r_int
        s_ret_i = GetDrawCallCount(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c8: {  // GetFPS -> r_float
        s_ret_d = (double)(GetFPS(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4c9: {  // SaveDrawScreen -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        int _a5 = code_getdi( DX_IMAGESAVETYPE_BMP );
        int _a6 = code_getdi( 80 );
        int _a7 = code_getdi( 1 );
        int _a8 = code_getdi( -1 );
        s_ret_i = SaveDrawScreen( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ca: {  // SaveDrawScreenToBMP -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        s_ret_i = SaveDrawScreenToBMP( _a0, _a1, _a2, _a3, _a4_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4cb: {  // SaveDrawScreenToDDS -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        s_ret_i = SaveDrawScreenToDDS( _a0, _a1, _a2, _a3, _a4_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4cc: {  // SaveDrawScreenToJPEG -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        int _a5 = code_getdi( 80 );
        int _a6 = code_getdi( 1 );
        s_ret_i = SaveDrawScreenToJPEG( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4cd: {  // SaveDrawScreenToPNG -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        int _a5 = code_getdi( -1 );
        s_ret_i = SaveDrawScreenToPNG( _a0, _a1, _a2, _a3, _a4_w, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ce: {  // SaveDrawValidGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
        static wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        int _a6 = code_getdi( DX_IMAGESAVETYPE_BMP );
        int _a7 = code_getdi( 80 );
        int _a8 = code_getdi( 1 );
        int _a9 = code_getdi( -1 );
        s_ret_i = SaveDrawValidGraph( _a0, _a1, _a2, _a3, _a4, _a5_w, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4cf: {  // SaveDrawValidGraphToBMP -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
        static wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        s_ret_i = SaveDrawValidGraphToBMP( _a0, _a1, _a2, _a3, _a4, _a5_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d0: {  // SaveDrawValidGraphToDDS -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
        static wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        s_ret_i = SaveDrawValidGraphToDDS( _a0, _a1, _a2, _a3, _a4, _a5_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d1: {  // SaveDrawValidGraphToJPEG -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
        static wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        int _a6 = code_getdi( 80 );
        int _a7 = code_getdi( 1 );
        s_ret_i = SaveDrawValidGraphToJPEG( _a0, _a1, _a2, _a3, _a4, _a5_w, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d2: {  // SaveDrawValidGraphToPNG -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
        static wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        int _a6 = code_getdi( -1 );
        s_ret_i = SaveDrawValidGraphToPNG( _a0, _a1, _a2, _a3, _a4, _a5_w, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d3: {  // DeleteVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteVertexBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d4: {  // InitVertexBuffer -> r_int
        s_ret_i = InitVertexBuffer(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d5: {  // UpdateVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = UpdateVertexBuffer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d6: {  // DeleteIndexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteIndexBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d7: {  // InitIndexBuffer -> r_int
        s_ret_i = InitIndexBuffer(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d8: {  // UpdateIndexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = UpdateIndexBuffer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d9: {  // GetMaxPrimitiveCount -> r_int
        s_ret_i = GetMaxPrimitiveCount(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4da: {  // GetMaxVertexIndex -> r_int
        s_ret_i = GetMaxVertexIndex(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4db: {  // GetValidShaderVersion -> r_int
        s_ret_i = GetValidShaderVersion(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4dc: {  // LoadVertexShader -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadVertexShader( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4dd: {  // LoadGeometryShader -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadGeometryShader( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4de: {  // LoadPixelShader -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadPixelShader( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4df: {  // DeleteShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e0: {  // InitShader -> r_int
        s_ret_i = InitShader(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e1: {  // GetConstIndexToShader -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetConstIndexToShader( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e2: {  // GetConstCountToShader -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetConstCountToShader( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e3: {  // SetVSConstSF -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetVSConstSF( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e4: {  // SetVSConstSI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetVSConstSI( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e5: {  // ResetVSConstF -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetVSConstF( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e6: {  // ResetVSConstI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetVSConstI( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e7: {  // ResetVSConstB -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetVSConstB( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e8: {  // SetPSConstSF -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetPSConstSF( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e9: {  // SetPSConstSI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetPSConstSI( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ea: {  // ResetPSConstF -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetPSConstF( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4eb: {  // ResetPSConstI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetPSConstI( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ec: {  // ResetPSConstB -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetPSConstB( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ed: {  // SetRenderTargetToShader -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetRenderTargetToShader( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ee: {  // SetUseTextureToShader -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetUseTextureToShader( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ef: {  // SetUseVertexShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseVertexShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f0: {  // SetUseGeometryShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseGeometryShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f1: {  // SetUsePixelShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePixelShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f2: {  // DrawPolygon3DToShader_UseVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DrawPolygon3DToShader_UseVertexBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f3: {  // DrawPolygonIndexed3DToShader_UseVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = DrawPolygonIndexed3DToShader_UseVertexBuffer( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f4: {  // InitShaderConstantBuffer -> r_int
        s_ret_i = InitShaderConstantBuffer(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f5: {  // CreateShaderConstantBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CreateShaderConstantBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f6: {  // DeleteShaderConstantBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteShaderConstantBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f7: {  // UpdateShaderConstantBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = UpdateShaderConstantBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f8: {  // SetGraphBlendScalingFilterMode -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetGraphBlendScalingFilterMode( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f9: {  // PlayMovie -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = PlayMovie( _a0_w, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fa: {  // OpenMovieToGraph -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 1 );
        s_ret_i = OpenMovieToGraph( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fb: {  // PlayMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( DX_PLAYTYPE_BACK );
        int _a2 = code_getdi( 0 );
        s_ret_i = PlayMovieToGraph( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fc: {  // PauseMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = PauseMovieToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fd: {  // AddMovieFrameToGraph -> r_int
        int _a0 = code_getdi( 0 );
        unsigned int _a1 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = AddMovieFrameToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fe: {  // SeekMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SeekMovieToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ff: {  // SetPlaySpeedRateMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        double _a1 = code_getdd( 0.0 );
        s_ret_i = SetPlaySpeedRateMovieToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x500: {  // GetMovieStateToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMovieStateToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x501: {  // SetMovieVolumeToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetMovieVolumeToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x502: {  // GetMovieVolumeToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMovieVolumeToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x503: {  // ChangeMovieVolumeToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangeMovieVolumeToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x504: {  // GetMovieVolumeToGraph2 -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMovieVolumeToGraph2( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x505: {  // GetMovieTotalFrameToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMovieTotalFrameToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x506: {  // TellMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = TellMovieToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x507: {  // TellMovieToGraphToFrame -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = TellMovieToGraphToFrame( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x508: {  // SeekMovieToGraphToFrame -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SeekMovieToGraphToFrame( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x509: {  // GetOneFrameTimeMovieToGraph -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetOneFrameTimeMovieToGraph( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x50a: {  // GetLastUpdateTimeMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetLastUpdateTimeMovieToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50b: {  // UpdateMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = UpdateMovieToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50c: {  // SetMovieRightImageAlphaFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMovieRightImageAlphaFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50d: {  // SetMovieColorA8R8G8B8Flag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMovieColorA8R8G8B8Flag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50e: {  // SetMovieUseYUVFormatSurfaceFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMovieUseYUVFormatSurfaceFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50f: {  // SetCameraNearFar -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetCameraNearFar( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x510: {  // SetCameraNearFarD -> r_int
        double _a0 = code_getdd( 0.0 );
        double _a1 = code_getdd( 0.0 );
        s_ret_i = SetCameraNearFarD( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x511: {  // SetCameraScreenCenter -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetCameraScreenCenter( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x512: {  // SetCameraScreenCenterD -> r_int
        double _a0 = code_getdd( 0.0 );
        double _a1 = code_getdd( 0.0 );
        s_ret_i = SetCameraScreenCenterD( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x513: {  // SetupCamera_Perspective -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetupCamera_Perspective( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x514: {  // SetupCamera_PerspectiveD -> r_int
        double _a0 = code_getdd( 0.0 );
        s_ret_i = SetupCamera_PerspectiveD( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x515: {  // SetupCamera_Ortho -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetupCamera_Ortho( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x516: {  // SetupCamera_OrthoD -> r_int
        double _a0 = code_getdd( 0.0 );
        s_ret_i = SetupCamera_OrthoD( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x517: {  // SetCameraDotAspect -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetCameraDotAspect( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x518: {  // SetCameraDotAspectD -> r_int
        double _a0 = code_getdd( 0.0 );
        s_ret_i = SetCameraDotAspectD( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x519: {  // GetCameraNear -> r_float
        s_ret_d = (double)(GetCameraNear(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x51a: {  // GetCameraNearD -> r_double
        s_ret_d = GetCameraNearD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x51b: {  // GetCameraFar -> r_float
        s_ret_d = (double)(GetCameraFar(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x51c: {  // GetCameraFarD -> r_double
        s_ret_d = GetCameraFarD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x51d: {  // GetCameraAngleHRotate -> r_float
        s_ret_d = (double)(GetCameraAngleHRotate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x51e: {  // GetCameraAngleHRotateD -> r_double
        s_ret_d = GetCameraAngleHRotateD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x51f: {  // GetCameraAngleVRotate -> r_float
        s_ret_d = (double)(GetCameraAngleVRotate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x520: {  // GetCameraAngleVRotateD -> r_double
        s_ret_d = GetCameraAngleVRotateD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x521: {  // GetCameraAngleTRotate -> r_float
        s_ret_d = (double)(GetCameraAngleTRotate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x522: {  // GetCameraAngleTRotateD -> r_double
        s_ret_d = GetCameraAngleTRotateD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x523: {  // GetCameraFov -> r_float
        s_ret_d = (double)(GetCameraFov(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x524: {  // GetCameraFovD -> r_double
        s_ret_d = GetCameraFovD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x525: {  // GetCameraSize -> r_float
        s_ret_d = (double)(GetCameraSize(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x526: {  // GetCameraSizeD -> r_double
        s_ret_d = GetCameraSizeD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x527: {  // GetCameraDotAspect -> r_float
        s_ret_d = (double)(GetCameraDotAspect(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x528: {  // GetCameraDotAspectD -> r_double
        s_ret_d = GetCameraDotAspectD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x529: {  // SetUseLighting -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseLighting( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52a: {  // SetMaterialUseVertDifColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaterialUseVertDifColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52b: {  // SetMaterialUseVertSpcColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaterialUseVertSpcColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52c: {  // SetUseSpecular -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseSpecular( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52d: {  // SetUseLightAngleAttenuation -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseLightAngleAttenuation( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52e: {  // SetUseHalfLambertLighting -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseHalfLambertLighting( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52f: {  // GetLightType -> r_int
        s_ret_i = GetLightType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x530: {  // SetLightEnable -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLightEnable( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x531: {  // GetLightEnable -> r_int
        s_ret_i = GetLightEnable(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x532: {  // SetLightRangeAtten -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        s_ret_i = SetLightRangeAtten( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x533: {  // SetLightAngle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetLightAngle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x534: {  // SetLightUseShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLightUseShadowMap( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x535: {  // DeleteLightHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteLightHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x536: {  // DeleteLightHandleAll -> r_int
        s_ret_i = DeleteLightHandleAll(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x537: {  // SetLightTypeHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLightTypeHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x538: {  // SetLightEnableHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLightEnableHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x539: {  // SetLightRangeAttenHandle -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        s_ret_i = SetLightRangeAttenHandle( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53a: {  // SetLightAngleHandle -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = SetLightAngleHandle( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53b: {  // SetLightUseShadowMapHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetLightUseShadowMapHandle( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53c: {  // GetLightTypeHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetLightTypeHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53d: {  // GetLightEnableHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetLightEnableHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53e: {  // GetEnableLightHandleNum -> r_int
        s_ret_i = GetEnableLightHandleNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53f: {  // GetEnableLightHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetEnableLightHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x540: {  // CreateMaskScreen -> r_int
        s_ret_i = CreateMaskScreen(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x541: {  // DeleteMaskScreen -> r_int
        s_ret_i = DeleteMaskScreen(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x542: {  // SetUseMaskScreenFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseMaskScreenFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x543: {  // GetUseMaskScreenFlag -> r_int
        s_ret_i = GetUseMaskScreenFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x544: {  // FillMaskScreen -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FillMaskScreen( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x545: {  // SetMaskScreenGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaskScreenGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x546: {  // InitMask -> r_int
        s_ret_i = InitMask(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x547: {  // MakeMask -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeMask( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x548: {  // DeleteMask -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteMask( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x549: {  // LoadMask -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadMask( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54a: {  // DrawMask -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawMask( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54b: {  // DrawStringMask -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        const char *_a3_u8 = code_gets();
        static wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
        s_ret_i = DrawStringMask( _a0, _a1, _a2, _a3_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54c: {  // DrawStringMaskToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        s_ret_i = DrawStringMaskToHandle( _a0, _a1, _a2, _a3, _a4_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54d: {  // DrawFillMask -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = DrawFillMask( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54e: {  // SetMaskReverseEffectFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaskReverseEffectFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54f: {  // GetMaskScreenData -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = GetMaskScreenData( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x550: {  // GetMaskUseFlag -> r_int
        s_ret_i = GetMaskUseFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x551: {  // EnumFontName -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 1 );
        s_ret_i = EnumFontName( _a0_w, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x552: {  // InitFontToHandle -> r_int
        s_ret_i = InitFontToHandle(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x553: {  // CreateFontToHandle -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( -1 );
        int _a5 = code_getdi( -1 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( -1 );
        s_ret_i = CreateFontToHandle( _a0_w, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x554: {  // LoadFontDataToHandle -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = LoadFontDataToHandle( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x555: {  // SetFontSpaceToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetFontSpaceToHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x556: {  // SetFontLineSpaceToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetFontLineSpaceToHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x557: {  // DeleteFontToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteFontToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x558: {  // AddFontImageToHandle -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = AddFontImageToHandle( _a0, _a1_w, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x559: {  // SubFontImageToHandle -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = SubFontImageToHandle( _a0, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55a: {  // AddSubstitutionFontToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = AddSubstitutionFontToHandle( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55b: {  // SubSubstitutionFontToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SubSubstitutionFontToHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55c: {  // ChangeFontFromHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ChangeFontFromHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55d: {  // ChangeFontType -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ChangeFontType( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55e: {  // SetFontSize -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontSize( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55f: {  // GetFontSize -> r_int
        s_ret_i = GetFontSize(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x560: {  // GetFontEdgeSize -> r_int
        s_ret_i = GetFontEdgeSize(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x561: {  // SetFontThickness -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontThickness( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x562: {  // SetFontSpace -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontSpace( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x563: {  // GetFontSpace -> r_int
        s_ret_i = GetFontSpace(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x564: {  // SetFontLineSpace -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontLineSpace( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x565: {  // GetFontLineSpace -> r_int
        s_ret_i = GetFontLineSpace(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x566: {  // SetDefaultFontState -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( -1 );
        int _a5 = code_getdi( -1 );
        int _a6 = code_getdi( 0 );
        s_ret_i = SetDefaultFontState( _a0_w, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x567: {  // GetDefaultFontHandle -> r_int
        s_ret_i = GetDefaultFontHandle(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x568: {  // GetFontMaxCacheCharNum -> r_int
        s_ret_i = GetFontMaxCacheCharNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x569: {  // GetFontMaxWidth -> r_int
        s_ret_i = GetFontMaxWidth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56a: {  // GetFontAscent -> r_int
        s_ret_i = GetFontAscent(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56b: {  // GetDrawStringWidth -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = GetDrawStringWidth( _a0_w, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56c: {  // GetDrawExtendStringWidth -> r_int
        double _a0 = code_getdd( 0.0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = GetDrawExtendStringWidth( _a0, _a1_w, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56d: {  // GetFontMaxCacheCharNumToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontMaxCacheCharNumToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56e: {  // GetFontMaxWidthToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontMaxWidthToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56f: {  // GetFontAscentToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontAscentToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x570: {  // GetFontSizeToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontSizeToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x571: {  // GetFontEdgeSizeToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontEdgeSizeToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x572: {  // GetFontSpaceToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontSpaceToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x573: {  // GetFontLineSpaceToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontLineSpaceToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x574: {  // GetDrawStringWidthToHandle -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = GetDrawStringWidthToHandle( _a0_w, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x575: {  // GetDrawExtendStringWidthToHandle -> r_int
        double _a0 = code_getdd( 0.0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = GetDrawExtendStringWidthToHandle( _a0, _a1_w, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x576: {  // CheckFontCacheToTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckFontCacheToTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x577: {  // CheckFontChacheToTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckFontChacheToTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x578: {  // CheckFontHandleValid -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckFontHandleValid( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x579: {  // ClearFontCacheToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ClearFontCacheToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57a: {  // SetFontCacheToTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontCacheToTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57b: {  // GetFontCacheToTextureFlag -> r_int
        s_ret_i = GetFontCacheToTextureFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57c: {  // SetFontChacheToTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontChacheToTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57d: {  // GetFontChacheToTextureFlag -> r_int
        s_ret_i = GetFontChacheToTextureFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57e: {  // SetFontCacheTextureColorBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontCacheTextureColorBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57f: {  // GetFontCacheTextureColorBitDepth -> r_int
        s_ret_i = GetFontCacheTextureColorBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x580: {  // SetFontCacheCharNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontCacheCharNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x581: {  // GetFontCacheCharNum -> r_int
        s_ret_i = GetFontCacheCharNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x582: {  // SetFontCacheUsePremulAlphaFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontCacheUsePremulAlphaFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x583: {  // GetFontCacheUsePremulAlphaFlag -> r_int
        s_ret_i = GetFontCacheUsePremulAlphaFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x584: {  // SetFontUseAdjustSizeFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontUseAdjustSizeFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x585: {  // GetFontUseAdjustSizeFlag -> r_int
        s_ret_i = GetFontUseAdjustSizeFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x586: {  // SetFontOnlyDrawType -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontOnlyDrawType( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x587: {  // GetFontOnlyDrawType -> r_int
        s_ret_i = GetFontOnlyDrawType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x588: {  // SetFontIgnoreLFFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontIgnoreLFFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x589: {  // GetFontIgnoreLFFlag -> r_int
        s_ret_i = GetFontIgnoreLFFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58a: {  // DrawString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawString( _a0, _a1, _a2_w, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58b: {  // DrawVString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawVString( _a0, _a1, _a2_w, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58c: {  // DrawExtendString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendString( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58d: {  // DrawExtendVString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendVString( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58e: {  // DrawRotaString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        double _a6 = code_getdd( 0.0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a8 = (unsigned int)code_getdi( (int)(0) );
        int _a9 = code_getdi( 0 );
        const char *_a10_u8 = code_gets();
        static wchar_t _a10_w[1024];
        hsp3dx_utf8_to_wide( _a10_u8, _a10_w, 1024 );
        s_ret_i = DrawRotaString( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58f: {  // DrawModiString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        unsigned int _a8 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a9 = (unsigned int)code_getdi( (int)(0) );
        int _a10 = code_getdi( 0 );
        const char *_a11_u8 = code_gets();
        static wchar_t _a11_w[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_w, 1024 );
        s_ret_i = DrawModiString( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x590: {  // DrawStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawStringF( _a0, _a1, _a2_w, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x591: {  // DrawVStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawVStringF( _a0, _a1, _a2_w, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x592: {  // DrawExtendStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendStringF( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x593: {  // DrawExtendVStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendVStringF( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x594: {  // DrawRotaStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        double _a6 = code_getdd( 0.0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a8 = (unsigned int)code_getdi( (int)(0) );
        int _a9 = code_getdi( 0 );
        const char *_a10_u8 = code_gets();
        static wchar_t _a10_w[1024];
        hsp3dx_utf8_to_wide( _a10_u8, _a10_w, 1024 );
        s_ret_i = DrawRotaStringF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x595: {  // DrawModiStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        unsigned int _a8 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a9 = (unsigned int)code_getdi( (int)(0) );
        int _a10 = code_getdi( 0 );
        const char *_a11_u8 = code_gets();
        static wchar_t _a11_w[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_w, 1024 );
        s_ret_i = DrawModiStringF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x596: {  // DrawNumberToI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberToI( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x597: {  // DrawNumberToF -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberToF( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x598: {  // DrawNumberPlusToI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberPlusToI( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x599: {  // DrawNumberPlusToF -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        double _a3 = code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberPlusToF( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59a: {  // DrawStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawStringToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59b: {  // DrawVStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawVStringToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59c: {  // DrawExtendStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        int _a8 = code_getdi( 0 );
        s_ret_i = DrawExtendStringToHandle( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59d: {  // DrawExtendVStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendVStringToHandle( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59e: {  // DrawRotaStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        double _a6 = code_getdd( 0.0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        int _a8 = code_getdi( 0 );
        unsigned int _a9 = (unsigned int)code_getdi( (int)(0) );
        int _a10 = code_getdi( 0 );
        const char *_a11_u8 = code_gets();
        static wchar_t _a11_w[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_w, 1024 );
        s_ret_i = DrawRotaStringToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59f: {  // DrawModiStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        unsigned int _a8 = (unsigned int)code_getdi( (int)(0) );
        int _a9 = code_getdi( 0 );
        unsigned int _a10 = (unsigned int)code_getdi( (int)(0) );
        int _a11 = code_getdi( 0 );
        const char *_a12_u8 = code_gets();
        static wchar_t _a12_w[1024];
        hsp3dx_utf8_to_wide( _a12_u8, _a12_w, 1024 );
        s_ret_i = DrawModiStringToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a0: {  // DrawStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawStringFToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a1: {  // DrawVStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawVStringFToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a2: {  // DrawExtendStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        int _a8 = code_getdi( 0 );
        s_ret_i = DrawExtendStringFToHandle( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a3: {  // DrawExtendVStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
        static wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendVStringFToHandle( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a4: {  // DrawRotaStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        double _a4 = code_getdd( 0.0 );
        double _a5 = code_getdd( 0.0 );
        double _a6 = code_getdd( 0.0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        int _a8 = code_getdi( 0 );
        unsigned int _a9 = (unsigned int)code_getdi( (int)(0) );
        int _a10 = code_getdi( 0 );
        const char *_a11_u8 = code_gets();
        static wchar_t _a11_w[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_w, 1024 );
        s_ret_i = DrawRotaStringFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a5: {  // DrawModiStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        unsigned int _a8 = (unsigned int)code_getdi( (int)(0) );
        int _a9 = code_getdi( 0 );
        unsigned int _a10 = (unsigned int)code_getdi( (int)(0) );
        int _a11 = code_getdi( 0 );
        const char *_a12_u8 = code_gets();
        static wchar_t _a12_w[1024];
        hsp3dx_utf8_to_wide( _a12_u8, _a12_w, 1024 );
        s_ret_i = DrawModiStringFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a6: {  // DrawNumberToIToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 0 );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberToIToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a7: {  // DrawNumberToFToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        int _a3 = code_getdi( 0 );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        int _a5 = code_getdi( 0 );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberToFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a8: {  // DrawNumberPlusToIToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberPlusToIToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a9: {  // DrawNumberPlusToFToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        double _a3 = code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberPlusToFToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5aa: {  // SetUseFastLoadFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseFastLoadFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ab: {  // GetGraphDataShavedMode -> r_int
        s_ret_i = GetGraphDataShavedMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ac: {  // SetUsePremulAlphaConvertLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePremulAlphaConvertLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ad: {  // GetUsePremulAlphaConvertLoad -> r_int
        s_ret_i = GetUsePremulAlphaConvertLoad(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ae: {  // SetUseConvertNormalFormatLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseConvertNormalFormatLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5af: {  // GetUseConvertNormalFormatLoad -> r_int
        s_ret_i = GetUseConvertNormalFormatLoad(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b0: {  // GetColor -> r_uint
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = (int)(GetColor( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b1: {  // InitSoftImage -> r_int
        s_ret_i = InitSoftImage(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b2: {  // LoadSoftImage -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadSoftImage( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b3: {  // LoadARGB8ColorSoftImage -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadARGB8ColorSoftImage( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b4: {  // LoadXRGB8ColorSoftImage -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadXRGB8ColorSoftImage( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b5: {  // MakeSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b6: {  // MakeARGBF32ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeARGBF32ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b7: {  // MakeARGBF16ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeARGBF16ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b8: {  // MakeXRGB8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeXRGB8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b9: {  // MakeARGB8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeARGB8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ba: {  // MakeRGBA8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeRGBA8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5bb: {  // MakeABGR8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeABGR8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5bc: {  // MakeBGRA8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeBGRA8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5bd: {  // MakeARGB4ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeARGB4ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5be: {  // MakeA1R5G5B5ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeA1R5G5B5ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5bf: {  // MakeX1R5G5B5ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeX1R5G5B5ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c0: {  // MakeR5G5B5A1ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeR5G5B5A1ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c1: {  // MakeR5G6B5ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeR5G6B5ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c2: {  // MakeRGB8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeRGB8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c3: {  // MakePAL8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MakePAL8ColorSoftImage( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c4: {  // DeleteSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c5: {  // CheckPaletteSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckPaletteSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c6: {  // CheckAlphaSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckAlphaSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c7: {  // CheckPixelAlphaSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckPixelAlphaSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c8: {  // GetDrawScreenSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = GetDrawScreenSoftImage( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c9: {  // GetDrawScreenSoftImageDestPos -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        s_ret_i = GetDrawScreenSoftImageDestPos( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ca: {  // FillSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = FillSoftImage( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5cb: {  // ClearRectSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = ClearRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5cc: {  // SetPaletteSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = SetPaletteSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5cd: {  // DrawPixelPalCodeSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawPixelPalCodeSoftImage( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ce: {  // GetPixelPalCodeSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = GetPixelPalCodeSoftImage( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5cf: {  // GetPitchSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetPitchSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d0: {  // DrawPixelSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawPixelSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d1: {  // DrawPixelSoftImageF -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        s_ret_i = DrawPixelSoftImageF( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d2: {  // DrawLineSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        s_ret_i = DrawLineSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d3: {  // DrawCircleSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 1 );
        s_ret_i = DrawCircleSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d4: {  // BltSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        s_ret_i = BltSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d5: {  // BltSoftImageWithTransColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 0 );
        int _a9 = code_getdi( 0 );
        int _a10 = code_getdi( 0 );
        int _a11 = code_getdi( 0 );
        s_ret_i = BltSoftImageWithTransColor( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d6: {  // BltSoftImageWithAlphaBlend -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 255 );
        s_ret_i = BltSoftImageWithAlphaBlend( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d7: {  // ReverseSoftImageH -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ReverseSoftImageH( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d8: {  // ReverseSoftImageV -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ReverseSoftImageV( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d9: {  // ReverseSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ReverseSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5da: {  // ConvertPremulAlphaSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ConvertPremulAlphaSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5db: {  // ConvertInterpAlphaSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ConvertInterpAlphaSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5dc: {  // BltStringSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( -1 );
        int _a5 = code_getdi( 0 );
        s_ret_i = BltStringSoftImage( _a0, _a1, _a2_w, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5dd: {  // DrawSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = DrawSoftImage( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5de: {  // SaveSoftImageToBmp -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SaveSoftImageToBmp( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5df: {  // SaveSoftImageToDds -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SaveSoftImageToDds( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e0: {  // SaveSoftImageToPng -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SaveSoftImageToPng( _a0_w, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e1: {  // SaveSoftImageToJpeg -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SaveSoftImageToJpeg( _a0_w, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e2: {  // InitSoundMem -> r_int
        s_ret_i = InitSoundMem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e3: {  // AddSoundData -> r_int
        int _a0 = code_getdi( -1 );
        s_ret_i = AddSoundData( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e4: {  // AddStreamSoundMemToFile -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( -1 );
        s_ret_i = AddStreamSoundMemToFile( _a0_w, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e5: {  // SetupStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetupStreamSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e6: {  // PlayStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( DX_PLAYTYPE_LOOP );
        int _a2 = code_getdi( 1 );
        s_ret_i = PlayStreamSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e7: {  // CheckStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckStreamSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e8: {  // StopStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = StopStreamSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e9: {  // SetStreamSoundCurrentPosition -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetStreamSoundCurrentPosition( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ea: {  // GetStreamSoundCurrentPosition -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetStreamSoundCurrentPosition( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5eb: {  // SetStreamSoundCurrentTime -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetStreamSoundCurrentTime( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ec: {  // GetStreamSoundCurrentTime -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetStreamSoundCurrentTime( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5ed: {  // ProcessStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ProcessStreamSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ee: {  // ProcessStreamSoundMemAll -> r_int
        s_ret_i = ProcessStreamSoundMemAll(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ef: {  // LoadSoundMem2 -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = LoadSoundMem2( _a0_w, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f0: {  // LoadBGM -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadBGM( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f1: {  // LoadSoundMemBase -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( -1 );
        s_ret_i = LoadSoundMemBase( _a0_w, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f2: {  // LoadSoundMem -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 3 );
        int _a2 = code_getdi( -1 );
        s_ret_i = LoadSoundMem( _a0_w, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f3: {  // LoadSoundMemToBufNumSitei -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = LoadSoundMemToBufNumSitei( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f4: {  // DuplicateSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 3 );
        s_ret_i = DuplicateSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f5: {  // LoadSoundMemFromSoftSound -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 3 );
        s_ret_i = LoadSoundMemFromSoftSound( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f6: {  // DeleteSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f7: {  // PlaySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 1 );
        s_ret_i = PlaySoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f8: {  // StopSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = StopSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f9: {  // CheckSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fa: {  // SetPanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetPanSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fb: {  // ChangePanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangePanSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fc: {  // GetPanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetPanSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fd: {  // SetVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fe: {  // ChangeVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangeVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ff: {  // GetVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetVolumeSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x600: {  // GetVolumeSoundMem2 -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetVolumeSoundMem2( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x601: {  // SetChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetChannelVolumeSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x602: {  // ChangeChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = ChangeChannelVolumeSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x603: {  // GetChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetChannelVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x604: {  // GetChannelVolumeSoundMem2 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetChannelVolumeSoundMem2( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x605: {  // SetFrequencySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetFrequencySoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x606: {  // GetFrequencySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFrequencySoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x607: {  // ResetFrequencySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ResetFrequencySoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x608: {  // SetNextPlayPanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetNextPlayPanSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x609: {  // ChangeNextPlayPanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangeNextPlayPanSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60a: {  // SetNextPlayVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetNextPlayVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60b: {  // ChangeNextPlayVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangeNextPlayVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60c: {  // SetNextPlayChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60d: {  // ChangeNextPlayChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = ChangeNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60e: {  // SetNextPlayFrequencySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetNextPlayFrequencySoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60f: {  // SetCurrentPositionSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetCurrentPositionSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x610: {  // GetCurrentPositionSoundMem -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetCurrentPositionSoundMem( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x611: {  // SetSoundCurrentPosition -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetSoundCurrentPosition( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x612: {  // GetSoundCurrentPosition -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoundCurrentPosition( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x613: {  // SetSoundCurrentTime -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetSoundCurrentTime( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x614: {  // GetSoundCurrentTime -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoundCurrentTime( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x615: {  // GetSoundTotalSample -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoundTotalSample( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x616: {  // GetSoundTotalTime -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoundTotalTime( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x617: {  // SetLoopPosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopPosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x618: {  // SetLoopTimePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopTimePosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x619: {  // SetLoopSamplePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopSamplePosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61a: {  // SetLoopStartTimePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopStartTimePosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61b: {  // SetLoopStartSamplePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopStartSamplePosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61c: {  // SetLoopAreaTimePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = code_getdi( 0 );
        s_ret_i = SetLoopAreaTimePosSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61d: {  // SetLoopAreaSamplePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = code_getdi( 0 );
        s_ret_i = SetLoopAreaSamplePosSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61e: {  // SetPlayFinishDeleteSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetPlayFinishDeleteSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61f: {  // Set3DRadiusSoundMem -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = Set3DRadiusSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x620: {  // SetNextPlay3DRadiusSoundMem -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetNextPlay3DRadiusSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x621: {  // GetOggCommentNum -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = GetOggCommentNum( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x622: {  // SetCreateSoundDataType -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateSoundDataType( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x623: {  // GetCreateSoundDataType -> r_int
        s_ret_i = GetCreateSoundDataType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x624: {  // SetCreateSoundPitchRate -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetCreateSoundPitchRate( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x625: {  // GetCreateSoundPitchRate -> r_float
        s_ret_d = (double)(GetCreateSoundPitchRate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x626: {  // SetCreateSoundTimeStretchRate -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetCreateSoundTimeStretchRate( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x627: {  // GetCreateSoundTimeStretchRate -> r_float
        s_ret_d = (double)(GetCreateSoundTimeStretchRate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x628: {  // SetCreateSoundLoopAreaTimePos -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        s_ret_i = SetCreateSoundLoopAreaTimePos( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x629: {  // SetCreateSoundLoopAreaSamplePos -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        s_ret_i = SetCreateSoundLoopAreaSamplePos( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62a: {  // SetCreateSoundIgnoreLoopAreaInfo -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateSoundIgnoreLoopAreaInfo( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62b: {  // GetCreateSoundIgnoreLoopAreaInfo -> r_int
        s_ret_i = GetCreateSoundIgnoreLoopAreaInfo(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62c: {  // SetDisableReadSoundFunctionMask -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDisableReadSoundFunctionMask( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62d: {  // GetDisableReadSoundFunctionMask -> r_int
        s_ret_i = GetDisableReadSoundFunctionMask(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62e: {  // SetEnableSoundCaptureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetEnableSoundCaptureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62f: {  // SetUseOldVolumeCalcFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseOldVolumeCalcFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x630: {  // GetSoundCurrentTimeType -> r_int
        s_ret_i = GetSoundCurrentTimeType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x631: {  // SetCreate3DSoundFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreate3DSoundFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x632: {  // Set3DSoundOneMetre -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = Set3DSoundOneMetre( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x633: {  // Set3DSoundListenerConeAngle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = Set3DSoundListenerConeAngle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x634: {  // Set3DSoundListenerConeVolume -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = Set3DSoundListenerConeVolume( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x635: {  // SetBeepFrequency -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetBeepFrequency( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x636: {  // PlayBeep -> r_int
        s_ret_i = PlayBeep(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x637: {  // StopBeep -> r_int
        s_ret_i = StopBeep(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x638: {  // PlaySoundFile -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = PlaySoundFile( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x639: {  // PlaySound -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = PlaySound( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63a: {  // PlaySoundDX -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = PlaySoundDX( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63b: {  // CheckSoundFile -> r_int
        s_ret_i = CheckSoundFile(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63c: {  // CheckSound -> r_int
        s_ret_i = CheckSound(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63d: {  // StopSoundFile -> r_int
        s_ret_i = StopSoundFile(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63e: {  // StopSound -> r_int
        s_ret_i = StopSound(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63f: {  // SetVolumeSoundFile -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetVolumeSoundFile( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x640: {  // SetVolumeSound -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetVolumeSound( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x641: {  // InitSoftSound -> r_int
        s_ret_i = InitSoftSound(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x642: {  // LoadSoftSound -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadSoftSound( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x643: {  // MakeSoftSound -> r_int
        int _a0 = code_getdi( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x644: {  // MakeSoftSound2Ch16Bit44KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound2Ch16Bit44KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x645: {  // MakeSoftSound2Ch16Bit22KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound2Ch16Bit22KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x646: {  // MakeSoftSound2Ch8Bit44KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound2Ch8Bit44KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x647: {  // MakeSoftSound2Ch8Bit22KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound2Ch8Bit22KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x648: {  // MakeSoftSound1Ch16Bit44KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound1Ch16Bit44KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x649: {  // MakeSoftSound1Ch16Bit22KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound1Ch16Bit22KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64a: {  // MakeSoftSound1Ch8Bit44KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound1Ch8Bit44KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64b: {  // MakeSoftSound1Ch8Bit22KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound1Ch8Bit22KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64c: {  // MakeSoftSoundCustom -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        LONGLONG _a3 = (LONGLONG)code_geti64();
        int _a4 = code_getdi( 0 );
        s_ret_i = MakeSoftSoundCustom( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64d: {  // DeleteSoftSound -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSoftSound( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64e: {  // SaveSoftSound -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = SaveSoftSound( _a0, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64f: {  // GetSoftSoundSampleNum -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoftSoundSampleNum( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x650: {  // WriteSoftSoundData -> r_int
        int _a0 = code_getdi( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = WriteSoftSoundData( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x651: {  // WriteSoftSoundDataF -> r_int
        int _a0 = code_getdi( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        s_ret_i = WriteSoftSoundDataF( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x652: {  // WriteTimeStretchSoftSoundData -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = WriteTimeStretchSoftSoundData( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x653: {  // WritePitchShiftSoftSoundData -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = WritePitchShiftSoftSoundData( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x654: {  // InitSoftSoundPlayer -> r_int
        s_ret_i = InitSoftSoundPlayer(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x655: {  // MakeSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MakeSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x656: {  // MakeSoftSoundPlayer2Ch16Bit44KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer2Ch16Bit44KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x657: {  // MakeSoftSoundPlayer2Ch16Bit22KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer2Ch16Bit22KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x658: {  // MakeSoftSoundPlayer2Ch8Bit44KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer2Ch8Bit44KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x659: {  // MakeSoftSoundPlayer2Ch8Bit22KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer2Ch8Bit22KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65a: {  // MakeSoftSoundPlayer1Ch16Bit44KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer1Ch16Bit44KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65b: {  // MakeSoftSoundPlayer1Ch16Bit22KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer1Ch16Bit22KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65c: {  // MakeSoftSoundPlayer1Ch8Bit44KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer1Ch8Bit44KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65d: {  // MakeSoftSoundPlayer1Ch8Bit22KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer1Ch8Bit22KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65e: {  // MakeSoftSoundPlayerCustom -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MakeSoftSoundPlayerCustom( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65f: {  // DeleteSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x660: {  // AddDataSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        LONGLONG _a2 = (LONGLONG)code_geti64();
        int _a3 = code_getdi( 0 );
        s_ret_i = AddDataSoftSoundPlayer( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x661: {  // AddOneDataSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = AddOneDataSoftSoundPlayer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x662: {  // StartSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = StartSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x663: {  // CheckStartSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckStartSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x664: {  // StopSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = StopSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x665: {  // ResetSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ResetSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x666: {  // CheckSoftSoundPlayerNoneData -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckSoftSoundPlayerNoneData( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x667: {  // DeleteMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteMusicMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x668: {  // LoadMusicMem -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = LoadMusicMem( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x669: {  // PlayMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = PlayMusicMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66a: {  // StopMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = StopMusicMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66b: {  // CheckMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckMusicMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66c: {  // SetVolumeMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetVolumeMusicMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66d: {  // GetMusicMemPosition -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMusicMemPosition( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66e: {  // InitMusicMem -> r_int
        s_ret_i = InitMusicMem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66f: {  // ProcessMusicMem -> r_int
        s_ret_i = ProcessMusicMem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x670: {  // PlayMusic -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = PlayMusic( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x671: {  // SetVolumeMusic -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetVolumeMusic( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x672: {  // StopMusic -> r_int
        s_ret_i = StopMusic(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x673: {  // CheckMusic -> r_int
        s_ret_i = CheckMusic(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x674: {  // GetMusicPosition -> r_int
        s_ret_i = GetMusicPosition(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x675: {  // SelectMidiMode -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SelectMidiMode( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x676: {  // SetUseDXArchiveFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDXArchiveFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x677: {  // SetDXArchivePriority -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDXArchivePriority( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x678: {  // SetDXArchiveExtension -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = SetDXArchiveExtension( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x679: {  // SetDXArchiveKeyString -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = SetDXArchiveKeyString( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67a: {  // DXArchivePreLoad -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = code_getdi( 0 );
        s_ret_i = DXArchivePreLoad( _a0_w, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67b: {  // DXArchiveCheckIdle -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = DXArchiveCheckIdle( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67c: {  // DXArchiveRelease -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = DXArchiveRelease( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67d: {  // DXArchiveCheckFile -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = DXArchiveCheckFile( _a0_w, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67e: {  // MV1LoadModel -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = MV1LoadModel( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67f: {  // MV1DuplicateModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1DuplicateModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x680: {  // MV1CreateCloneModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1CreateCloneModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x681: {  // MV1DeleteModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1DeleteModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x682: {  // MV1InitModel -> r_int
        s_ret_i = MV1InitModel(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x683: {  // MV1SetLoadModelReMakeNormal -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelReMakeNormal( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x684: {  // MV1SetLoadModelReMakeNormalSmoothingAngle -> r_int
        float _a0 = (float)code_getdd( 1.562069 );
        s_ret_i = MV1SetLoadModelReMakeNormalSmoothingAngle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x685: {  // MV1SetLoadModelIgnoreScaling -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelIgnoreScaling( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x686: {  // MV1SetLoadModelPositionOptimize -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelPositionOptimize( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x687: {  // MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x688: {  // MV1SetLoadModelPhysicsWorldGravity -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetLoadModelPhysicsWorldGravity( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x689: {  // MV1GetLoadModelPhysicsWorldGravity -> r_float
        s_ret_d = (double)(MV1GetLoadModelPhysicsWorldGravity(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x68a: {  // MV1SetLoadModelPhysicsCalcPrecision -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelPhysicsCalcPrecision( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x68b: {  // MV1AddLoadModelDisablePhysicsNameWord -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = MV1AddLoadModelDisablePhysicsNameWord( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x68c: {  // MV1ResetLoadModelDisablePhysicsNameWord -> r_int
        s_ret_i = MV1ResetLoadModelDisablePhysicsNameWord(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x68d: {  // MV1SetLoadModelAnimFilePath -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = MV1SetLoadModelAnimFilePath( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x68e: {  // MV1SetLoadModelUsePackDraw -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelUsePackDraw( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x68f: {  // MV1SetLoadModelTriangleListUseMaxBoneNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelTriangleListUseMaxBoneNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x690: {  // MV1SetLoadModelTextureLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelTextureLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x691: {  // MV1SetLoadModelIgnoreIK -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelIgnoreIK( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x692: {  // MV1SaveModelToMV1File -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( MV1_SAVETYPE_NORMAL );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( 1 );
        int _a5 = code_getdi( 1 );
        int _a6 = code_getdi( 1 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 1 );
        s_ret_i = MV1SaveModelToMV1File( _a0, _a1_w, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x693: {  // MV1SaveModelToXFile -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( MV1_SAVETYPE_NORMAL );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( 1 );
        s_ret_i = MV1SaveModelToXFile( _a0, _a1_w, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x694: {  // MV1DrawModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1DrawModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x695: {  // MV1DrawFrame -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1DrawFrame( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x696: {  // MV1DrawMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1DrawMesh( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x697: {  // MV1DrawTriangleList -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1DrawTriangleList( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x698: {  // MV1DrawModelDebug -> r_int
        int _a0 = code_getdi( 0 );
        unsigned int _a1 = (unsigned int)code_getdi( (int)(0) );
        int _a2 = code_getdi( 0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = MV1DrawModelDebug( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x699: {  // MV1SetUseOrigShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetUseOrigShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69a: {  // MV1SetVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69b: {  // MV1GetVisible -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetVisible( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69c: {  // MV1SetMeshCategoryVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshCategoryVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69d: {  // MV1GetMeshCategoryVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshCategoryVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69e: {  // MV1GetSemiTransState -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetSemiTransState( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69f: {  // MV1SetOpacityRate -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetOpacityRate( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a0: {  // MV1GetOpacityRate -> r_float
        int _a0 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetOpacityRate( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6a1: {  // MV1SetUseDrawMulAlphaColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseDrawMulAlphaColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a2: {  // MV1GetUseDrawMulAlphaColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetUseDrawMulAlphaColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a3: {  // MV1SetUseZBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseZBuffer( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a4: {  // MV1SetWriteZBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetWriteZBuffer( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a5: {  // MV1SetZBias -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetZBias( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a6: {  // MV1SetUseVertDifColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseVertDifColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a7: {  // MV1SetUseVertSpcColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseVertSpcColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a8: {  // MV1SetSampleFilterMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetSampleFilterMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a9: {  // MV1SetMaxAnisotropy -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaxAnisotropy( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6aa: {  // MV1SetWireFrameDrawFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetWireFrameDrawFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ab: {  // MV1RefreshVertColorFromMaterial -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1RefreshVertColorFromMaterial( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ac: {  // MV1PhysicsCalculation -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = MV1PhysicsCalculation( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ad: {  // MV1PhysicsResetState -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1PhysicsResetState( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ae: {  // MV1SetPrioritizePhysicsOverAnimFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetPrioritizePhysicsOverAnimFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6af: {  // MV1SetUseShapeFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseShapeFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b0: {  // MV1GetMaterialNumberOrderFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialNumberOrderFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b1: {  // MV1AttachAnim -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( -1 );
        int _a3 = code_getdi( 1 );
        s_ret_i = MV1AttachAnim( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b2: {  // MV1DetachAnim -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1DetachAnim( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b3: {  // MV1SetAttachAnimTime -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetAttachAnimTime( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b4: {  // MV1GetAttachAnimTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimTime( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6b5: {  // MV1GetAttachAnimTotalTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimTotalTime( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6b6: {  // MV1SetAttachAnimBlendRate -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 1.0 );
        s_ret_i = MV1SetAttachAnimBlendRate( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b7: {  // MV1GetAttachAnimBlendRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimBlendRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6b8: {  // MV1SetAttachAnimBlendRateToFrame -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 1 );
        s_ret_i = MV1SetAttachAnimBlendRateToFrame( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b9: {  // MV1GetAttachAnimBlendRateToFrame -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimBlendRateToFrame( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6ba: {  // MV1SetAttachAnimTimeToFrame -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        float _a3 = (float)code_getdd( 0.0 );
        int _a4 = code_getdi( 1 );
        s_ret_i = MV1SetAttachAnimTimeToFrame( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6bb: {  // MV1GetAttachAnimTimeToFrame -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimTimeToFrame( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6bc: {  // MV1GetAttachAnim -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAttachAnim( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6bd: {  // MV1SetAttachAnimUseShapeFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetAttachAnimUseShapeFlag( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6be: {  // MV1GetAttachAnimUseShapeFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAttachAnimUseShapeFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6bf: {  // MV1GetAnimNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetAnimNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c0: {  // MV1SetAnimName -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        s_ret_i = MV1SetAnimName( _a0, _a1, _a2_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c1: {  // MV1GetAnimIndex -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = MV1GetAnimIndex( _a0, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c2: {  // MV1GetAnimTotalTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAnimTotalTime( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6c3: {  // MV1GetAnimTargetFrameNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimTargetFrameNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c4: {  // MV1GetAnimTargetFrame -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetAnimTargetFrame( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c5: {  // MV1GetAnimTargetFrameKeySetNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetAnimTargetFrameKeySetNum( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c6: {  // MV1GetAnimTargetFrameKeySet -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1GetAnimTargetFrameKeySet( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c7: {  // MV1GetAnimKeySetNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c8: {  // MV1GetAnimKeySetType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c9: {  // MV1GetAnimKeySetDataType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetDataType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ca: {  // MV1GetAnimKeySetTimeType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetTimeType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6cb: {  // MV1GetAnimKeySetDataNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetDataNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6cc: {  // MV1GetAnimKeyDataTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAnimKeyDataTime( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6cd: {  // MV1GetAnimKeyDataIndexFromTime -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1GetAnimKeyDataIndexFromTime( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ce: {  // MV1GetAnimKeyDataToFlat -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAnimKeyDataToFlat( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6cf: {  // MV1GetAnimKeyDataToFlatFromTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_d = (double)(MV1GetAnimKeyDataToFlatFromTime( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6d0: {  // MV1GetAnimKeyDataToLinear -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAnimKeyDataToLinear( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6d1: {  // MV1GetAnimKeyDataToLinearFromTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_d = (double)(MV1GetAnimKeyDataToLinearFromTime( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6d2: {  // MV1GetMaterialNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d3: {  // MV1SetMaterialTypeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialTypeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d4: {  // MV1SetMaterialType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialType( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d5: {  // MV1GetMaterialType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d6: {  // MV1SetMaterialSpcPower -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialSpcPower( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d7: {  // MV1GetMaterialSpcPower -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetMaterialSpcPower( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6d8: {  // MV1SetMaterialDifMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDifMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d9: {  // MV1GetMaterialDifMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDifMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6da: {  // MV1SetMaterialSubDifMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSubDifMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6db: {  // MV1GetMaterialSubDifMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSubDifMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6dc: {  // MV1SetMaterialSpcMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSpcMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6dd: {  // MV1GetMaterialSpcMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSpcMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6de: {  // MV1SetMaterialNormalMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialNormalMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6df: {  // MV1GetMaterialNormalMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialNormalMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e0: {  // MV1SetMaterialDifGradTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDifGradTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e1: {  // MV1GetMaterialDifGradTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDifGradTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e2: {  // MV1SetMaterialSpcGradTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSpcGradTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e3: {  // MV1GetMaterialSpcGradTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSpcGradTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e4: {  // MV1SetMaterialSphereMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSphereMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e5: {  // MV1GetMaterialSphereMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSphereMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e6: {  // MV1SetMaterialDifGradBlendTypeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDifGradBlendTypeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e7: {  // MV1SetMaterialDifGradBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDifGradBlendType( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e8: {  // MV1GetMaterialDifGradBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDifGradBlendType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e9: {  // MV1SetMaterialSpcGradBlendTypeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSpcGradBlendTypeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ea: {  // MV1SetMaterialSpcGradBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSpcGradBlendType( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6eb: {  // MV1GetMaterialSpcGradBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSpcGradBlendType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ec: {  // MV1SetMaterialSphereMapBlendTypeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSphereMapBlendTypeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ed: {  // MV1SetMaterialSphereMapBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSphereMapBlendType( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ee: {  // MV1GetMaterialSphereMapBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSphereMapBlendType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ef: {  // MV1SetMaterialOutLineWidthAll -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialOutLineWidthAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f0: {  // MV1SetMaterialOutLineWidth -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialOutLineWidth( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f1: {  // MV1GetMaterialOutLineWidth -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetMaterialOutLineWidth( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6f2: {  // MV1SetMaterialOutLineDotWidthAll -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialOutLineDotWidthAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f3: {  // MV1SetMaterialOutLineDotWidth -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialOutLineDotWidth( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f4: {  // MV1GetMaterialOutLineDotWidth -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetMaterialOutLineDotWidth( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6f5: {  // MV1SetMaterialDrawBlendModeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawBlendModeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f6: {  // MV1SetMaterialDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawBlendMode( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f7: {  // MV1GetMaterialDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawBlendMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f8: {  // MV1SetMaterialDrawBlendParamAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawBlendParamAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f9: {  // MV1SetMaterialDrawBlendParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawBlendParam( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fa: {  // MV1GetMaterialDrawBlendParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawBlendParam( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fb: {  // MV1SetMaterialDrawAlphaTestAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawAlphaTestAll( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fc: {  // MV1SetMaterialDrawAlphaTest -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawAlphaTest( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fd: {  // MV1GetMaterialDrawAlphaTestEnable -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawAlphaTestEnable( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fe: {  // MV1GetMaterialDrawAlphaTestMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawAlphaTestMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ff: {  // MV1GetMaterialDrawAlphaTestParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawAlphaTestParam( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x700: {  // MV1SetMaterialDrawAddColorAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawAddColorAll( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x701: {  // MV1SetMaterialDrawAddColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawAddColor( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x702: {  // MV1GetTextureNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetTextureNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x703: {  // MV1SetTextureColorFilePath -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        s_ret_i = MV1SetTextureColorFilePath( _a0, _a1, _a2_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x704: {  // MV1SetTextureAlphaFilePath -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        s_ret_i = MV1SetTextureAlphaFilePath( _a0, _a1, _a2_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x705: {  // MV1SetTextureGraphHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1SetTextureGraphHandle( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x706: {  // MV1GetTextureGraphHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureGraphHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x707: {  // MV1SetTextureAddressMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1SetTextureAddressMode( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x708: {  // MV1GetTextureAddressModeU -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureAddressModeU( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x709: {  // MV1GetTextureAddressModeV -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureAddressModeV( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x70a: {  // MV1GetTextureWidth -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureWidth( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x70b: {  // MV1GetTextureHeight -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureHeight( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x70c: {  // MV1GetTextureSemiTransState -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureSemiTransState( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x70d: {  // MV1SetTextureBumpImageFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetTextureBumpImageFlag( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x70e: {  // MV1GetTextureBumpImageFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureBumpImageFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x70f: {  // MV1SetTextureBumpImageNextPixelLength -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetTextureBumpImageNextPixelLength( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x710: {  // MV1GetTextureBumpImageNextPixelLength -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetTextureBumpImageNextPixelLength( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x711: {  // MV1SetTextureSampleFilterMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetTextureSampleFilterMode( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x712: {  // MV1GetTextureSampleFilterMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureSampleFilterMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x713: {  // MV1AddTextureGraphHandle -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( DX_TEXADDRESS_WRAP );
        int _a5 = code_getdi( DX_TEXADDRESS_WRAP );
        int _a6 = code_getdi( DX_DRAWMODE_ANISOTROPIC );
        s_ret_i = MV1AddTextureGraphHandle( _a0, _a1_w, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x714: {  // MV1LoadTexture -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = MV1LoadTexture( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x715: {  // MV1GetFrameNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetFrameNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x716: {  // MV1SearchFrame -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = MV1SearchFrame( _a0, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x717: {  // MV1SearchFrameChild -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        s_ret_i = MV1SearchFrameChild( _a0, _a1, _a2_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x718: {  // MV1GetFrameName2 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
        static wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        s_ret_i = MV1GetFrameName2( _a0, _a1, _a2_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x719: {  // MV1GetFrameParent -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameParent( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x71a: {  // MV1GetFrameChildNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        s_ret_i = MV1GetFrameChildNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x71b: {  // MV1GetFrameChild -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetFrameChild( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x71c: {  // MV1ResetFrameUserLocalMatrix -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1ResetFrameUserLocalMatrix( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x71d: {  // MV1ResetFrameUserLocalWorldMatrix -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1ResetFrameUserLocalWorldMatrix( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x71e: {  // MV1GetFrameVertexNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameVertexNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x71f: {  // MV1GetFrameTriangleNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameTriangleNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x720: {  // MV1GetFrameMeshNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameMeshNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x721: {  // MV1GetFrameMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetFrameMesh( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x722: {  // MV1SetFrameVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetFrameVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x723: {  // MV1GetFrameVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x724: {  // MV1GetFrameSemiTransState -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameSemiTransState( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x725: {  // MV1SetFrameOpacityRate -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetFrameOpacityRate( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x726: {  // MV1GetFrameOpacityRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetFrameOpacityRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x727: {  // MV1SetFrameBaseVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetFrameBaseVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x728: {  // MV1GetFrameBaseVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameBaseVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x729: {  // MV1SetFrameTextureAddressTransform -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        float _a4 = (float)code_getdd( 0.0 );
        float _a5 = (float)code_getdd( 0.0 );
        float _a6 = (float)code_getdd( 0.0 );
        float _a7 = (float)code_getdd( 0.0 );
        float _a8 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetFrameTextureAddressTransform( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x72a: {  // MV1ResetFrameTextureAddressTransform -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1ResetFrameTextureAddressTransform( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x72b: {  // MV1GetMeshNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetMeshNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x72c: {  // MV1GetMeshMaterial -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshMaterial( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x72d: {  // MV1GetMeshVertexNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshVertexNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x72e: {  // MV1GetMeshTriangleNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshTriangleNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x72f: {  // MV1SetMeshVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x730: {  // MV1GetMeshVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x731: {  // MV1SetMeshOpacityRate -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMeshOpacityRate( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x732: {  // MV1GetMeshOpacityRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetMeshOpacityRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x733: {  // MV1SetMeshDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshDrawBlendMode( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x734: {  // MV1SetMeshDrawBlendParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshDrawBlendParam( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x735: {  // MV1GetMeshDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshDrawBlendMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x736: {  // MV1GetMeshDrawBlendParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshDrawBlendParam( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x737: {  // MV1SetMeshBaseVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshBaseVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x738: {  // MV1GetMeshBaseVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshBaseVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x739: {  // MV1SetMeshBackCulling -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshBackCulling( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x73a: {  // MV1GetMeshBackCulling -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshBackCulling( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x73b: {  // MV1GetMeshTListNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshTListNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x73c: {  // MV1GetMeshTList -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetMeshTList( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x73d: {  // MV1GetMeshSemiTransState -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshSemiTransState( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x73e: {  // MV1SetMeshUseVertDifColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshUseVertDifColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x73f: {  // MV1SetMeshUseVertSpcColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshUseVertSpcColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x740: {  // MV1GetMeshUseVertDifColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshUseVertDifColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x741: {  // MV1GetMeshUseVertSpcColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshUseVertSpcColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x742: {  // MV1GetMeshShapeFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshShapeFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x743: {  // MV1GetShapeNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetShapeNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x744: {  // MV1SearchShape -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = MV1SearchShape( _a0, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x745: {  // MV1GetShapeTargetMeshNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetShapeTargetMeshNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x746: {  // MV1GetShapeTargetMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetShapeTargetMesh( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x747: {  // MV1SetShapeRate -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        int _a3 = code_getdi( DX_MV1_SHAPERATE_ADD );
        s_ret_i = MV1SetShapeRate( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x748: {  // MV1GetShapeRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetShapeRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x749: {  // MV1GetShapeApplyRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetShapeApplyRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x74a: {  // MV1GetTriangleListNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x74b: {  // MV1GetTriangleListVertexType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListVertexType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x74c: {  // MV1GetTriangleListPolygonNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListPolygonNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x74d: {  // MV1GetTriangleListVertexNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListVertexNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x74e: {  // MV1GetTriangleListLocalWorldMatrixNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListLocalWorldMatrixNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x74f: {  // MV1GetTriangleListUseMaterial -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListUseMaterial( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x750: {  // MV1SetupCollInfo -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        int _a2 = code_getdi( 32 );
        int _a3 = code_getdi( 8 );
        int _a4 = code_getdi( 32 );
        int _a5 = code_getdi( -1 );
        s_ret_i = MV1SetupCollInfo( _a0, _a1, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x751: {  // MV1TerminateCollInfo -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        int _a2 = code_getdi( -1 );
        s_ret_i = MV1TerminateCollInfo( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x752: {  // MV1RefreshCollInfo -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        int _a2 = code_getdi( -1 );
        s_ret_i = MV1RefreshCollInfo( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x753: {  // MV1SetupReferenceMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( -1 );
        s_ret_i = MV1SetupReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x754: {  // MV1TerminateReferenceMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( -1 );
        s_ret_i = MV1TerminateReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x755: {  // MV1RefreshReferenceMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( -1 );
        s_ret_i = MV1RefreshReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x756: {  // Live2D_SetCubism4CoreDLLPath -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = Live2D_SetCubism4CoreDLLPath( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x757: {  // Live2D_SetCubism3CoreDLLPath -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = Live2D_SetCubism3CoreDLLPath( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x758: {  // Live2D_RenderBegin -> r_int
        s_ret_i = Live2D_RenderBegin(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x759: {  // Live2D_RenderEnd -> r_int
        s_ret_i = Live2D_RenderEnd(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x75a: {  // Live2D_LoadModel -> r_int
        const char *_a0_u8 = code_gets();
        static wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        s_ret_i = Live2D_LoadModel( _a0_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x75b: {  // Live2D_DeleteModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_DeleteModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x75c: {  // Live2D_InitModel -> r_int
        s_ret_i = Live2D_InitModel(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x75d: {  // Live2D_SetUseAutoScaling -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_SetUseAutoScaling( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x75e: {  // Live2D_SetUseAutoCentering -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_SetUseAutoCentering( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x75f: {  // Live2D_SetUseReverseYAxis -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_SetUseReverseYAxis( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x760: {  // Live2D_Model_Update -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = Live2D_Model_Update( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x761: {  // Live2D_Model_SetTranslate -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = Live2D_Model_SetTranslate( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x762: {  // Live2D_Model_SetExtendRate -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = Live2D_Model_SetExtendRate( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x763: {  // Live2D_Model_SetRotate -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = Live2D_Model_SetRotate( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x764: {  // Live2D_Model_Draw -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_Draw( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x765: {  // Live2D_Model_StartMotion -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        float _a3 = (float)code_getdd( -1.0 );
        float _a4 = (float)code_getdd( -1.0 );
        int _a5 = code_getdi( 1 );
        s_ret_i = Live2D_Model_StartMotion( _a0, _a1_w, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x766: {  // Live2D_Model_GetLastPlayMotionNo -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_GetLastPlayMotionNo( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x767: {  // Live2D_Model_IsMotionFinished -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_IsMotionFinished( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x768: {  // Live2D_Model_GetMotionPlayTime -> r_float
        int _a0 = code_getdi( 0 );
        s_ret_d = (double)(Live2D_Model_GetMotionPlayTime( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x769: {  // Live2D_Model_SetExpression -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = Live2D_Model_SetExpression( _a0, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x76a: {  // Live2D_Model_HitTest -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        s_ret_i = Live2D_Model_HitTest( _a0, _a1_w, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x76b: {  // Live2D_Model_GetParameterCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_GetParameterCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x76c: {  // Live2D_Model_GetParameterValue -> r_float
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_d = (double)(Live2D_Model_GetParameterValue( _a0, _a1_w ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x76d: {  // Live2D_Model_SetParameterValue -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = Live2D_Model_SetParameterValue( _a0, _a1_w, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x76e: {  // Live2D_Model_GetHitAreasCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_GetHitAreasCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x76f: {  // Live2D_Model_GetExpressionCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_GetExpressionCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x770: {  // Live2D_Model_GetMotionGroupCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_GetMotionGroupCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x771: {  // Live2D_Model_GetMotionCount -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        s_ret_i = Live2D_Model_GetMotionCount( _a0, _a1_w );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x772: {  // Live2D_Model_GetMotionFadeInTimeValue -> r_float
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(Live2D_Model_GetMotionFadeInTimeValue( _a0, _a1_w, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x773: {  // Live2D_Model_GetMotionFadeOutTimeValue -> r_float
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
        static wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(Live2D_Model_GetMotionFadeOutTimeValue( _a0, _a1_w, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x774: {  // Live2D_Model_GetEyeBlinkParameterCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_GetEyeBlinkParameterCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x775: {  // Live2D_Model_GetLipSyncParameterCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = Live2D_Model_GetLipSyncParameterCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x776: {  // Live2D_Model_GetCanvasWidth -> r_float
        int _a0 = code_getdi( 0 );
        s_ret_d = (double)(Live2D_Model_GetCanvasWidth( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x777: {  // Live2D_Model_GetCanvasHeight -> r_float
        int _a0 = code_getdi( 0 );
        s_ret_d = (double)(Live2D_Model_GetCanvasHeight( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    }
    return 0;
}
