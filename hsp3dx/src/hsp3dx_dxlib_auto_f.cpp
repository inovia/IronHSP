//  hsp3dx_dxlib_auto_f.cpp — 関数形式 DxLib binding (#ccmd)
//  DO NOT EDIT — gen_dxlib_bindings.py で再生成
//  関数数: 1039
#include <stdio.h>
#include <string.h>
#ifdef _WIN32
#include <windows.h>
#endif
#include "hsp3dx_compat.h"
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
    case 0x303: {  // SetAlwaysRunFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetAlwaysRunFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x304: {  // WaitTimer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = WaitTimer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x305: {  // WaitKey -> r_int
        s_ret_i = WaitKey(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x306: {  // SleepThread -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SleepThread( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x307: {  // GetNowCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetNowCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x308: {  // GetNowHiPerformanceCount -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetNowHiPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x309: {  // GetNowSysPerformanceCount -> r_uint64
        s_ret_i64 = (LONGLONG)(GetNowSysPerformanceCount(  ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30a: {  // GetSysPerformanceFrequency -> r_uint64
        s_ret_i64 = (LONGLONG)(GetSysPerformanceFrequency(  ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30b: {  // ConvSysPerformanceCountToSeconds -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSysPerformanceCountToSeconds( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30c: {  // ConvSysPerformanceCountToMilliSeconds -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSysPerformanceCountToMilliSeconds( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30d: {  // ConvSysPerformanceCountToMicroSeconds -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSysPerformanceCountToMicroSeconds( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30e: {  // ConvSysPerformanceCountToNanoSeconds -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSysPerformanceCountToNanoSeconds( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x30f: {  // ConvSecondsToSysPerformanceCount -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvSecondsToSysPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x310: {  // ConvMilliSecondsToSysPerformanceCount -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvMilliSecondsToSysPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x311: {  // ConvMicroSecondsToSysPerformanceCount -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvMicroSecondsToSysPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x312: {  // ConvNanoSecondsToSysPerformanceCount -> r_uint64
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        s_ret_i64 = (LONGLONG)(ConvNanoSecondsToSysPerformanceCount( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x313: {  // GetRand -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetRand( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x314: {  // SRand -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SRand( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x315: {  // GetBatteryLifePercent -> r_int
        s_ret_i = GetBatteryLifePercent(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x316: {  // SetClipboardText -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = SetClipboardText( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x317: {  // LogFileAdd -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LogFileAdd( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x318: {  // LogFileTabAdd -> r_int
        s_ret_i = LogFileTabAdd(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x319: {  // LogFileTabSub -> r_int
        s_ret_i = LogFileTabSub(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31a: {  // ErrorLogAdd -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = ErrorLogAdd( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31b: {  // ErrorLogTabAdd -> r_int
        s_ret_i = ErrorLogTabAdd(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31c: {  // ErrorLogTabSub -> r_int
        s_ret_i = ErrorLogTabSub(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31d: {  // SetUseTimeStampFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseTimeStampFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31e: {  // SetOutApplicationLogValidFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetOutApplicationLogValidFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x31f: {  // SetOutApplicationSystemLogValidFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetOutApplicationSystemLogValidFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x320: {  // SetApplicationLogFileName -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = SetApplicationLogFileName( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x321: {  // SetApplicationLogSaveDirectory -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = SetApplicationLogSaveDirectory( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x322: {  // SetUseDateNameLogFile -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDateNameLogFile( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x323: {  // SetLogDrawOutFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLogDrawOutFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x324: {  // GetLogDrawFlag -> r_int
        s_ret_i = GetLogDrawFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x325: {  // SetLogFontSize -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLogFontSize( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x326: {  // SetLogFontHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLogFontHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x327: {  // SetLogDrawArea -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetLogDrawArea( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x328: {  // putsDx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 1 );
        s_ret_i = putsDx( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x329: {  // clsDx -> r_int
        s_ret_i = clsDx(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32a: {  // setPrintColorDx -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = setPrintColorDx( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32b: {  // SetUseASyncLoadFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseASyncLoadFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32c: {  // GetUseASyncLoadFlag -> r_int
        s_ret_i = GetUseASyncLoadFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32d: {  // CheckHandleASyncLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckHandleASyncLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32e: {  // GetHandleASyncLoadResult -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetHandleASyncLoadResult( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x32f: {  // SetASyncLoadFinishDeleteFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetASyncLoadFinishDeleteFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x330: {  // WaitHandleASyncLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = WaitHandleASyncLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x331: {  // WaitHandleASyncLoadAll -> r_int
        s_ret_i = WaitHandleASyncLoadAll(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x332: {  // GetASyncLoadNum -> r_int
        s_ret_i = GetASyncLoadNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x333: {  // SetASyncLoadThreadNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetASyncLoadThreadNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x334: {  // SetMousePoint -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetMousePoint( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x335: {  // GetMouseInput -> r_int
        s_ret_i = GetMouseInput(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x336: {  // GetMouseWheelRotVol -> r_int
        int _a0 = code_getdi( 1 );
        s_ret_i = GetMouseWheelRotVol( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x337: {  // GetMouseHWheelRotVol -> r_int
        int _a0 = code_getdi( 1 );
        s_ret_i = GetMouseHWheelRotVol( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x338: {  // GetMouseWheelRotVolF -> r_float
        int _a0 = code_getdi( 1 );
        s_ret_d = (double)(GetMouseWheelRotVolF( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x339: {  // GetMouseHWheelRotVolF -> r_float
        int _a0 = code_getdi( 1 );
        s_ret_d = (double)(GetMouseHWheelRotVolF( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x33a: {  // GetTouchInputNum -> r_int
        s_ret_i = GetTouchInputNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33b: {  // GetTouchInputLogNum -> r_int
        s_ret_i = GetTouchInputLogNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33c: {  // ClearTouchInputLog -> r_int
        s_ret_i = ClearTouchInputLog(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33d: {  // GetTouchInputDownLogNum -> r_int
        s_ret_i = GetTouchInputDownLogNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33e: {  // ClearTouchInputDownLog -> r_int
        s_ret_i = ClearTouchInputDownLog(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x33f: {  // GetTouchInputUpLogNum -> r_int
        s_ret_i = GetTouchInputUpLogNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x340: {  // ClearTouchInputUpLog -> r_int
        s_ret_i = ClearTouchInputUpLog(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x341: {  // DxSetAllocPrintFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DxSetAllocPrintFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x342: {  // DxGetAllocNum -> r_int
        s_ret_i = DxGetAllocNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x343: {  // DxErrorCheckAlloc -> r_int
        s_ret_i = DxErrorCheckAlloc(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x344: {  // DxSetAllocSizeOutFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DxSetAllocSizeOutFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x345: {  // DxSetAllocMemoryErrorCheckFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DxSetAllocMemoryErrorCheckFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x346: {  // GetUseCharCodeFormat -> r_int
        s_ret_i = GetUseCharCodeFormat(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x347: {  // Get_wchar_t_CharCodeFormat -> r_int
        s_ret_i = Get_wchar_t_CharCodeFormat(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x348: {  // strcmpDx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = strcmpDx( _a0_t, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x349: {  // stricmpDx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = stricmpDx( _a0_t, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34a: {  // strncmpDx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( 0 );
        s_ret_i = strncmpDx( _a0_t, _a1_t, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34b: {  // strncmp2Dx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( 0 );
        s_ret_i = strncmp2Dx( _a0_t, _a1_t, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34c: {  // strpncmpDx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = strpncmpDx( _a0_t, _a1_t, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34d: {  // strpncmp2Dx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = strpncmp2Dx( _a0_t, _a1_t, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34e: {  // strstr2Dx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = strstr2Dx( _a0_t, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x34f: {  // strrstr2Dx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = strrstr2Dx( _a0_t, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x350: {  // atoiDx -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = atoiDx( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x351: {  // atofDx -> r_double
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_d = atofDx( _a0_t );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x352: {  // GetStringPoint -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = GetStringPoint( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x353: {  // GetStringPoint2 -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = GetStringPoint2( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x354: {  // GetStringLength -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = GetStringLength( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x355: {  // DrawObtainsBox -> r_int
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
    case 0x356: {  // FileRead_open -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = FileRead_open( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x357: {  // FileRead_size -> r_int64
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i64 = (LONGLONG)(FileRead_size( _a0_t ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x358: {  // FileRead_size_handle -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(FileRead_size_handle( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x359: {  // FileRead_close -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FileRead_close( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35a: {  // FileRead_tell -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(FileRead_tell( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x35b: {  // FileRead_seek -> r_int
        int _a0 = code_getdi( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = code_getdi( 0 );
        s_ret_i = FileRead_seek( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35c: {  // FileRead_idle_chk -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FileRead_idle_chk( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35d: {  // FileRead_eof -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FileRead_eof( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35e: {  // FileRead_fullyLoad -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = FileRead_fullyLoad( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x35f: {  // FileRead_fullyLoad_delete -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FileRead_fullyLoad_delete( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x360: {  // FileRead_fullyLoad_getSize -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(FileRead_fullyLoad_getSize( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x361: {  // GetStreamFunctionDefault -> r_int
        s_ret_i = GetStreamFunctionDefault(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x362: {  // CheckHitKey -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckHitKey( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x363: {  // CheckHitKeyAll -> r_int
        int _a0 = code_getdi( DX_CHECKINPUT_ALL );
        s_ret_i = CheckHitKeyAll( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x364: {  // GetJoypadNum -> r_int
        s_ret_i = GetJoypadNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x365: {  // GetJoypadButtonNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetJoypadButtonNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x366: {  // GetJoypadInputState -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetJoypadInputState( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x367: {  // CheckJoypadXInput -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckJoypadXInput( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x368: {  // GetJoypadType -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetJoypadType( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x369: {  // SetJoypadInputToKeyInput -> r_int
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
    case 0x36a: {  // SetJoypadDeadZone -> r_int
        int _a0 = code_getdi( 0 );
        double _a1 = code_getdd( 0.0 );
        s_ret_i = SetJoypadDeadZone( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36b: {  // GetJoypadDeadZone -> r_double
        int _a0 = code_getdi( 0 );
        s_ret_d = GetJoypadDeadZone( _a0 );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x36c: {  // SetJoypadDefaultDeadZoneAll -> r_int
        double _a0 = code_getdd( 0.0 );
        s_ret_i = SetJoypadDefaultDeadZoneAll( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36d: {  // GetJoypadDefaultDeadZoneAll -> r_double
        s_ret_d = GetJoypadDefaultDeadZoneAll(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x36e: {  // StartJoypadVibration -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( -1 );
        s_ret_i = StartJoypadVibration( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x36f: {  // StopJoypadVibration -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        s_ret_i = StopJoypadVibration( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x370: {  // GetJoypadPOVState -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetJoypadPOVState( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x371: {  // ReSetupJoypad -> r_int
        s_ret_i = ReSetupJoypad(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x372: {  // ReSetupInputSystem -> r_int
        s_ret_i = ReSetupInputSystem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x373: {  // SetUseJoypadVibrationFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseJoypadVibrationFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x374: {  // MakeGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MakeGraph( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x375: {  // MakeScreen -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MakeScreen( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x376: {  // DerivationGraph -> r_int
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
    case 0x377: {  // DerivationGraphF -> r_int
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
    case 0x378: {  // DeleteGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x379: {  // DeleteSharingGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSharingGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37a: {  // GetGraphNum -> r_int
        s_ret_i = GetGraphNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37b: {  // FillGraph -> r_int
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
    case 0x37c: {  // FillRectGraph -> r_int
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
    case 0x37d: {  // InitGraph -> r_int
        s_ret_i = InitGraph(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37e: {  // ReloadFileGraphAll -> r_int
        s_ret_i = ReloadFileGraphAll(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x37f: {  // MakeShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeShadowMap( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x380: {  // DeleteShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteShadowMap( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x381: {  // ShadowMap_DrawSetup -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ShadowMap_DrawSetup( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x382: {  // ShadowMap_DrawEnd -> r_int
        s_ret_i = ShadowMap_DrawEnd(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x383: {  // SetUseShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetUseShadowMap( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x384: {  // ResetShadowMapDrawArea -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ResetShadowMapDrawArea( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x385: {  // SetShadowMapAdjustDepth -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetShadowMapAdjustDepth( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x386: {  // TestDrawShadowMap -> r_int
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
    case 0x387: {  // LoadBmpToGraph -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( DX_MOVIESURFACE_NORMAL );
        s_ret_i = LoadBmpToGraph( _a0_t, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x388: {  // LoadGraph -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = LoadGraph( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x389: {  // LoadReverseGraph -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = LoadReverseGraph( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38a: {  // LoadBlendGraph -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadBlendGraph( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38b: {  // CreateBlendGraphFromSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CreateBlendGraphFromSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38c: {  // CreateGraphFromSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CreateGraphFromSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38d: {  // CreateGraphFromRectSoftImage -> r_int
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
    case 0x38e: {  // ReCreateGraphFromSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ReCreateGraphFromSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x38f: {  // ReCreateGraphFromRectSoftImage -> r_int
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
    case 0x390: {  // ReloadGraph -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = ReloadGraph( _a0_t, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x391: {  // ReloadReverseGraph -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = ReloadReverseGraph( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x392: {  // SetGraphColorBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetGraphColorBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x393: {  // GetGraphColorBitDepth -> r_int
        s_ret_i = GetGraphColorBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x394: {  // SetCreateGraphColorBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateGraphColorBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x395: {  // GetCreateGraphColorBitDepth -> r_int
        s_ret_i = GetCreateGraphColorBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x396: {  // SetCreateGraphChannelBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateGraphChannelBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x397: {  // GetCreateGraphChannelBitDepth -> r_int
        s_ret_i = GetCreateGraphChannelBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x398: {  // SetCreateGraphInitGraphDelete -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateGraphInitGraphDelete( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x399: {  // GetCreateGraphInitGraphDelete -> r_int
        s_ret_i = GetCreateGraphInitGraphDelete(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39a: {  // SetCreateGraphHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateGraphHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39b: {  // GetCreateGraphHandle -> r_int
        s_ret_i = GetCreateGraphHandle(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39c: {  // SetDrawValidGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39d: {  // GetDrawValidGraphCreateFlag -> r_int
        s_ret_i = GetDrawValidGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39e: {  // SetDrawValidFlagOf3DGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidFlagOf3DGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x39f: {  // SetLeftUpColorIsTransColorFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLeftUpColorIsTransColorFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a0: {  // SetUsePaletteGraphFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePaletteGraphFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a1: {  // SetUseBlendGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseBlendGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a2: {  // GetUseBlendGraphCreateFlag -> r_int
        s_ret_i = GetUseBlendGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a3: {  // SetUseAlphaTestGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseAlphaTestGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a4: {  // GetUseAlphaTestGraphCreateFlag -> r_int
        s_ret_i = GetUseAlphaTestGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a5: {  // SetUseAlphaTestFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseAlphaTestFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a6: {  // GetUseAlphaTestFlag -> r_int
        s_ret_i = GetUseAlphaTestFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a7: {  // SetCubeMapTextureCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCubeMapTextureCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a8: {  // GetCubeMapTextureCreateFlag -> r_int
        s_ret_i = GetCubeMapTextureCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3a9: {  // SetUseNoBlendModeParam -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseNoBlendModeParam( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3aa: {  // SetDrawValidAlphaChannelGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidAlphaChannelGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ab: {  // GetDrawValidAlphaChannelGraphCreateFlag -> r_int
        s_ret_i = GetDrawValidAlphaChannelGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ac: {  // SetDrawValidFloatTypeGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidFloatTypeGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ad: {  // GetDrawValidFloatTypeGraphCreateFlag -> r_int
        s_ret_i = GetDrawValidFloatTypeGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ae: {  // SetDrawValidGraphCreateZBufferFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawValidGraphCreateZBufferFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3af: {  // GetDrawValidGraphCreateZBufferFlag -> r_int
        s_ret_i = GetDrawValidGraphCreateZBufferFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b0: {  // SetCreateDrawValidGraphZBufferBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateDrawValidGraphZBufferBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b1: {  // GetCreateDrawValidGraphZBufferBitDepth -> r_int
        s_ret_i = GetCreateDrawValidGraphZBufferBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b2: {  // SetCreateDrawValidGraphMipLevels -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateDrawValidGraphMipLevels( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b3: {  // GetCreateDrawValidGraphMipLevels -> r_int
        s_ret_i = GetCreateDrawValidGraphMipLevels(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b4: {  // SetCreateDrawValidGraphChannelNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateDrawValidGraphChannelNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b5: {  // GetCreateDrawValidGraphChannelNum -> r_int
        s_ret_i = GetCreateDrawValidGraphChannelNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b6: {  // SetCreateDrawValidGraphMultiSample -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetCreateDrawValidGraphMultiSample( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b7: {  // SetDrawValidMultiSample -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetDrawValidMultiSample( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b8: {  // GetMultiSampleQuality -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMultiSampleQuality( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3b9: {  // SetUseTransColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseTransColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ba: {  // SetUseTransColorGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseTransColorGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3bb: {  // SetUseGraphAlphaChannel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseGraphAlphaChannel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3bc: {  // GetUseGraphAlphaChannel -> r_int
        s_ret_i = GetUseGraphAlphaChannel(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3bd: {  // SetUseAlphaChannelGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseAlphaChannelGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3be: {  // GetUseAlphaChannelGraphCreateFlag -> r_int
        s_ret_i = GetUseAlphaChannelGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3bf: {  // SetUseNotManageTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseNotManageTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c0: {  // GetUseNotManageTextureFlag -> r_int
        s_ret_i = GetUseNotManageTextureFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c1: {  // SetUsePlatformTextureFormat -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePlatformTextureFormat( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c2: {  // GetUsePlatformTextureFormat -> r_int
        s_ret_i = GetUsePlatformTextureFormat(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c3: {  // SetTransColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetTransColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c4: {  // SetUseDivGraphFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDivGraphFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c5: {  // SetUseAlphaImageLoadFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseAlphaImageLoadFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c6: {  // SetUseMaxTextureSize -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseMaxTextureSize( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c7: {  // SetUseGraphBaseDataBackup -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseGraphBaseDataBackup( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c8: {  // GetUseGraphBaseDataBackup -> r_int
        s_ret_i = GetUseGraphBaseDataBackup(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3c9: {  // SetUseSystemMemGraphCreateFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseSystemMemGraphCreateFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ca: {  // GetUseSystemMemGraphCreateFlag -> r_int
        s_ret_i = GetUseSystemMemGraphCreateFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3cb: {  // SetUseLoadDivGraphSizeCheckFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseLoadDivGraphSizeCheckFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3cc: {  // GetUseLoadDivGraphSizeCheckFlag -> r_int
        s_ret_i = GetUseLoadDivGraphSizeCheckFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3cd: {  // GraphUnLock -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GraphUnLock( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ce: {  // SetUseGraphZBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( -1 );
        s_ret_i = SetUseGraphZBuffer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3cf: {  // CopyGraphZBufferImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = CopyGraphZBufferImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d0: {  // SetDeviceLostDeleteGraphFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetDeviceLostDeleteGraphFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d1: {  // GetGraphMipmapCount -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetGraphMipmapCount( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d2: {  // CheckDrawValidGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckDrawValidGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d3: {  // GetValidRestoreShredPoint -> r_int
        s_ret_i = GetValidRestoreShredPoint(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d4: {  // SetGraphPalette -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        unsigned int _a2 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = SetGraphPalette( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d5: {  // ResetGraphPalette -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ResetGraphPalette( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3d6: {  // DrawLine -> r_int
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
    case 0x3d7: {  // DrawLineAA -> r_int
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
    case 0x3d8: {  // DrawBox -> r_int
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
    case 0x3d9: {  // DrawBoxAA -> r_int
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
    case 0x3da: {  // DrawFillBox -> r_int
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
    case 0x3db: {  // DrawLineBox -> r_int
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
    case 0x3dc: {  // DrawCircle -> r_int
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
    case 0x3dd: {  // DrawCircleAA -> r_int
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
    case 0x3de: {  // DrawOval -> r_int
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
    case 0x3df: {  // DrawOvalAA -> r_int
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
    case 0x3e0: {  // DrawOval_Rect -> r_int
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
    case 0x3e1: {  // DrawTriangle -> r_int
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
    case 0x3e2: {  // DrawTriangleAA -> r_int
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
    case 0x3e3: {  // DrawQuadrangle -> r_int
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
    case 0x3e4: {  // DrawQuadrangleAA -> r_int
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
    case 0x3e5: {  // DrawRoundRect -> r_int
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
    case 0x3e6: {  // DrawRoundRectAA -> r_int
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
    case 0x3e7: {  // BeginAADraw -> r_int
        s_ret_i = BeginAADraw(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e8: {  // EndAADraw -> r_int
        s_ret_i = EndAADraw(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3e9: {  // DrawPixel -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        unsigned int _a2 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawPixel( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ea: {  // LoadGraphScreen -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        int _a3 = code_getdi( 0 );
        s_ret_i = LoadGraphScreen( _a0, _a1, _a2_t, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3eb: {  // DrawGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawGraph( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3ec: {  // DrawExtendGraph -> r_int
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
    case 0x3ed: {  // DrawRotaGraph -> r_int
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
    case 0x3ee: {  // DrawRotaGraph2 -> r_int
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
    case 0x3ef: {  // DrawRotaGraph3 -> r_int
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
    case 0x3f0: {  // DrawRotaGraphFast -> r_int
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
    case 0x3f1: {  // DrawRotaGraphFast2 -> r_int
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
    case 0x3f2: {  // DrawRotaGraphFast3 -> r_int
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
    case 0x3f3: {  // DrawModiGraph -> r_int
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
    case 0x3f4: {  // DrawTurnGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawTurnGraph( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f5: {  // DrawReverseGraph -> r_int
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
    case 0x3f6: {  // DrawGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawGraphF( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x3f7: {  // DrawExtendGraphF -> r_int
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
    case 0x3f8: {  // DrawRotaGraphF -> r_int
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
    case 0x3f9: {  // DrawRotaGraph2F -> r_int
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
    case 0x3fa: {  // DrawRotaGraph3F -> r_int
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
    case 0x3fb: {  // DrawRotaGraphFastF -> r_int
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
    case 0x3fc: {  // DrawRotaGraphFast2F -> r_int
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
    case 0x3fd: {  // DrawRotaGraphFast3F -> r_int
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
    case 0x3fe: {  // DrawModiGraphF -> r_int
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
    case 0x3ff: {  // DrawTurnGraphF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawTurnGraphF( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x400: {  // DrawReverseGraphF -> r_int
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
    case 0x401: {  // DrawTile -> r_int
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
    case 0x402: {  // DrawRectGraph -> r_int
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
    case 0x403: {  // DrawRectExtendGraph -> r_int
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
    case 0x404: {  // DrawRectRotaGraph -> r_int
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
    case 0x405: {  // DrawRectRotaGraph2 -> r_int
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
    case 0x406: {  // DrawRectRotaGraph3 -> r_int
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
    case 0x407: {  // DrawRectRotaGraphFast -> r_int
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
    case 0x408: {  // DrawRectRotaGraphFast2 -> r_int
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
    case 0x409: {  // DrawRectRotaGraphFast3 -> r_int
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
    case 0x40a: {  // DrawRectModiGraph -> r_int
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
    case 0x40b: {  // DrawRectGraphF -> r_int
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
    case 0x40c: {  // DrawRectGraphF2 -> r_int
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
    case 0x40d: {  // DrawRectExtendGraphF -> r_int
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
    case 0x40e: {  // DrawRectExtendGraphF2 -> r_int
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
    case 0x40f: {  // DrawRectRotaGraphF -> r_int
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
    case 0x410: {  // DrawRectRotaGraph2F -> r_int
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
    case 0x411: {  // DrawRectRotaGraph3F -> r_int
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
    case 0x412: {  // DrawRectRotaGraphFastF -> r_int
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
    case 0x413: {  // DrawRectRotaGraphFast2F -> r_int
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
    case 0x414: {  // DrawRectRotaGraphFast3F -> r_int
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
    case 0x415: {  // DrawRectModiGraphF -> r_int
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
    case 0x416: {  // DrawBlendGraph -> r_int
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
    case 0x417: {  // DrawBlendGraphF -> r_int
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
    case 0x418: {  // DrawBlendGraphPos -> r_int
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
    case 0x419: {  // DrawCircleGauge -> r_int
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
    case 0x41a: {  // DrawCircleGaugeF -> r_int
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
    case 0x41b: {  // DrawPolygon3D_UseVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = DrawPolygon3D_UseVertexBuffer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x41c: {  // DrawPolygonIndexed3D_UseVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawPolygonIndexed3D_UseVertexBuffer( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x41d: {  // DrawGraph3D -> r_int
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
    case 0x41e: {  // DrawExtendGraph3D -> r_int
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
    case 0x41f: {  // DrawRotaGraph3D -> r_int
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
    case 0x420: {  // DrawRota2Graph3D -> r_int
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
    case 0x421: {  // SetDrawMode -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawMode( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x422: {  // GetDrawMode -> r_int
        s_ret_i = GetDrawMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x423: {  // SetDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetDrawBlendMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x424: {  // SetDrawAlphaTest -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetDrawAlphaTest( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x425: {  // SetBlendGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetBlendGraph( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x426: {  // SetBlendGraphPosition -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetBlendGraphPosition( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x427: {  // SetDrawBright -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetDrawBright( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x428: {  // SetDrawAddColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetDrawAddColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x429: {  // SetWriteAlphaChannelFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetWriteAlphaChannelFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42a: {  // GetWriteAlphaChannelFlag -> r_int
        s_ret_i = GetWriteAlphaChannelFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42b: {  // CheckSeparateAlphaBlendEnable -> r_int
        s_ret_i = CheckSeparateAlphaBlendEnable(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42c: {  // SetIgnoreDrawGraphColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetIgnoreDrawGraphColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42d: {  // GetIgnoreDrawGraphColor -> r_int
        s_ret_i = GetIgnoreDrawGraphColor(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42e: {  // SetMaxAnisotropy -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaxAnisotropy( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x42f: {  // GetMaxAnisotropy -> r_int
        s_ret_i = GetMaxAnisotropy(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x430: {  // SetUseLarge3DPositionSupport -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseLarge3DPositionSupport( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x431: {  // SetUseZBufferFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseZBufferFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x432: {  // SetWriteZBufferFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetWriteZBufferFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x433: {  // SetZBias -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetZBias( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x434: {  // SetUseZBuffer3D -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseZBuffer3D( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x435: {  // SetWriteZBuffer3D -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetWriteZBuffer3D( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x436: {  // SetZBias3D -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetZBias3D( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x437: {  // SetDrawZ -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetDrawZ( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x438: {  // SetUseReversedZ -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseReversedZ( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x439: {  // SetDrawArea -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetDrawArea( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43a: {  // SetDrawAreaFull -> r_int
        s_ret_i = SetDrawAreaFull(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43b: {  // SetDraw3DScale -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetDraw3DScale( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43c: {  // RunRestoreShred -> r_int
        s_ret_i = RunRestoreShred(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43d: {  // ResetTransformTo2D -> r_int
        s_ret_i = ResetTransformTo2D(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43e: {  // SetDefTransformMatrix -> r_int
        s_ret_i = SetDefTransformMatrix(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x43f: {  // SetUseCullingFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseCullingFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x440: {  // GetUseBackCulling -> r_int
        s_ret_i = GetUseBackCulling(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x441: {  // SetUseRightHandClippingProcess -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseRightHandClippingProcess( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x442: {  // GetUseRightHandClippingProcess -> r_int
        s_ret_i = GetUseRightHandClippingProcess(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x443: {  // SetTextureAddressModeUV -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( -1 );
        s_ret_i = SetTextureAddressModeUV( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x444: {  // SetTextureAddressTransform -> r_int
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
    case 0x445: {  // ResetTextureAddressTransform -> r_int
        s_ret_i = ResetTextureAddressTransform(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x446: {  // SetFogEnable -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFogEnable( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x447: {  // GetFogEnable -> r_int
        s_ret_i = GetFogEnable(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x448: {  // GetFogMode -> r_int
        s_ret_i = GetFogMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x449: {  // SetFogColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetFogColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44a: {  // SetFogStartEnd -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetFogStartEnd( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44b: {  // SetFogDensity -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetFogDensity( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44c: {  // GetFogDensity -> r_float
        s_ret_d = (double)(GetFogDensity(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x44d: {  // SetVerticalFogEnable -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetVerticalFogEnable( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44e: {  // GetVerticalFogEnable -> r_int
        s_ret_i = GetVerticalFogEnable(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x44f: {  // GetVerticalFogMode -> r_int
        s_ret_i = GetVerticalFogMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x450: {  // SetVerticalFogColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetVerticalFogColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x451: {  // SetVerticalFogStartEnd -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetVerticalFogStartEnd( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x452: {  // SetVerticalFogDensity -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetVerticalFogDensity( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x453: {  // GetPixel -> r_uint
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = (int)(GetPixel( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x454: {  // GetPixelDX -> r_uint
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = (int)(GetPixelDX( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x455: {  // SetBackgroundColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetBackgroundColor( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x456: {  // GetDrawScreenGraph -> r_int
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
    case 0x457: {  // BltDrawValidGraph -> r_int
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
    case 0x458: {  // ScreenFlip -> r_int
        s_ret_i = ScreenFlip(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x459: {  // ScreenCopy -> r_int
        s_ret_i = ScreenCopy(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45a: {  // WaitVSync -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = WaitVSync( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45b: {  // ClsDrawScreen -> r_int
        s_ret_i = ClsDrawScreen(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45c: {  // SetDrawScreen -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawScreen( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45d: {  // GetDrawScreen -> r_int
        s_ret_i = GetDrawScreen(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45e: {  // GetActiveGraph -> r_int
        s_ret_i = GetActiveGraph(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x45f: {  // SetUseSetDrawScreenSettingReset -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseSetDrawScreenSettingReset( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x460: {  // GetUseSetDrawScreenSettingReset -> r_int
        s_ret_i = GetUseSetDrawScreenSettingReset(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x461: {  // SetDrawZBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDrawZBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x462: {  // SetGraphMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 60 );
        s_ret_i = SetGraphMode( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x463: {  // GetUseFullScreenResolutionMode -> r_int
        s_ret_i = GetUseFullScreenResolutionMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x464: {  // SetEmulation320x240 -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetEmulation320x240( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x465: {  // SetZBufferSize -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetZBufferSize( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x466: {  // SetZBufferBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetZBufferBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x467: {  // SetWaitVSyncFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetWaitVSyncFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x468: {  // GetWaitVSyncFlag -> r_int
        s_ret_i = GetWaitVSyncFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x469: {  // SetFullSceneAntiAliasingMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetFullSceneAntiAliasingMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46a: {  // SetGraphDisplayArea -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetGraphDisplayArea( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46b: {  // SetChangeScreenModeGraphicsSystemResetFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetChangeScreenModeGraphicsSystemResetFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46c: {  // GetScreenBitDepth -> r_int
        s_ret_i = GetScreenBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46d: {  // GetColorBitDepth -> r_int
        s_ret_i = GetColorBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46e: {  // GetChangeDisplayFlag -> r_int
        s_ret_i = GetChangeDisplayFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x46f: {  // GetRefreshRate -> r_int
        s_ret_i = GetRefreshRate(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x470: {  // GetDisplayNum -> r_int
        s_ret_i = GetDisplayNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x471: {  // GetDisplayModeNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetDisplayModeNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x472: {  // GetMultiDrawScreenNum -> r_int
        s_ret_i = GetMultiDrawScreenNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x473: {  // GetDrawFloatCoordType -> r_int
        s_ret_i = GetDrawFloatCoordType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x474: {  // SetUseNormalDrawShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseNormalDrawShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x475: {  // SetUseSoftwareRenderModeFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseSoftwareRenderModeFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x476: {  // SetNotUse3DFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetNotUse3DFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x477: {  // SetUse3DFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUse3DFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x478: {  // GetUse3DFlag -> r_int
        s_ret_i = GetUse3DFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x479: {  // SetScreenMemToVramFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetScreenMemToVramFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47a: {  // GetScreenMemToSystemMemFlag -> r_int
        s_ret_i = GetScreenMemToSystemMemFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47b: {  // RestoreGraphSystem -> r_int
        s_ret_i = RestoreGraphSystem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47c: {  // SetUseHardwareVertexProcessing -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseHardwareVertexProcessing( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47d: {  // SetUsePixelLighting -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePixelLighting( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47e: {  // SetUseOldDrawModiGraphCodeFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseOldDrawModiGraphCodeFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x47f: {  // SetUseVramFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseVramFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x480: {  // GetUseVramFlag -> r_int
        s_ret_i = GetUseVramFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x481: {  // SetBasicBlendFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetBasicBlendFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x482: {  // SetUseBasicGraphDraw3DDeviceMethodFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseBasicGraphDraw3DDeviceMethodFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x483: {  // SetUseDisplayIndex -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDisplayIndex( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x484: {  // RenderVertex -> r_int
        s_ret_i = RenderVertex(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x485: {  // GetDrawCallCount -> r_int
        s_ret_i = GetDrawCallCount(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x486: {  // GetFPS -> r_float
        s_ret_d = (double)(GetFPS(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x487: {  // SaveDrawScreen -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        int _a5 = code_getdi( DX_IMAGESAVETYPE_BMP );
        int _a6 = code_getdi( 80 );
        int _a7 = code_getdi( 1 );
        int _a8 = code_getdi( -1 );
        s_ret_i = SaveDrawScreen( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x488: {  // SaveDrawScreenToBMP -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        s_ret_i = SaveDrawScreenToBMP( _a0, _a1, _a2, _a3, _a4_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x489: {  // SaveDrawScreenToDDS -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        s_ret_i = SaveDrawScreenToDDS( _a0, _a1, _a2, _a3, _a4_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48a: {  // SaveDrawScreenToJPEG -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        int _a5 = code_getdi( 80 );
        int _a6 = code_getdi( 1 );
        s_ret_i = SaveDrawScreenToJPEG( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48b: {  // SaveDrawScreenToPNG -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        int _a5 = code_getdi( -1 );
        s_ret_i = SaveDrawScreenToPNG( _a0, _a1, _a2, _a3, _a4_t, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48c: {  // SaveDrawValidGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        int _a6 = code_getdi( DX_IMAGESAVETYPE_BMP );
        int _a7 = code_getdi( 80 );
        int _a8 = code_getdi( 1 );
        int _a9 = code_getdi( -1 );
        s_ret_i = SaveDrawValidGraph( _a0, _a1, _a2, _a3, _a4, _a5_t, _a6, _a7, _a8, _a9 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48d: {  // SaveDrawValidGraphToBMP -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        s_ret_i = SaveDrawValidGraphToBMP( _a0, _a1, _a2, _a3, _a4, _a5_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48e: {  // SaveDrawValidGraphToDDS -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        s_ret_i = SaveDrawValidGraphToDDS( _a0, _a1, _a2, _a3, _a4, _a5_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x48f: {  // SaveDrawValidGraphToJPEG -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        int _a6 = code_getdi( 80 );
        int _a7 = code_getdi( 1 );
        s_ret_i = SaveDrawValidGraphToJPEG( _a0, _a1, _a2, _a3, _a4, _a5_t, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x490: {  // SaveDrawValidGraphToPNG -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        const char *_a5_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        int _a6 = code_getdi( -1 );
        s_ret_i = SaveDrawValidGraphToPNG( _a0, _a1, _a2, _a3, _a4, _a5_t, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x491: {  // DeleteVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteVertexBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x492: {  // InitVertexBuffer -> r_int
        s_ret_i = InitVertexBuffer(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x493: {  // UpdateVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = UpdateVertexBuffer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x494: {  // DeleteIndexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteIndexBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x495: {  // InitIndexBuffer -> r_int
        s_ret_i = InitIndexBuffer(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x496: {  // UpdateIndexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = UpdateIndexBuffer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x497: {  // GetMaxPrimitiveCount -> r_int
        s_ret_i = GetMaxPrimitiveCount(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x498: {  // GetMaxVertexIndex -> r_int
        s_ret_i = GetMaxVertexIndex(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x499: {  // GetValidShaderVersion -> r_int
        s_ret_i = GetValidShaderVersion(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49a: {  // LoadVertexShader -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadVertexShader( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49b: {  // LoadGeometryShader -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadGeometryShader( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49c: {  // LoadPixelShader -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadPixelShader( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49d: {  // DeleteShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49e: {  // InitShader -> r_int
        s_ret_i = InitShader(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x49f: {  // GetConstIndexToShader -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = GetConstIndexToShader( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a0: {  // GetConstCountToShader -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = GetConstCountToShader( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a1: {  // SetVSConstSF -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetVSConstSF( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a2: {  // SetVSConstSI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetVSConstSI( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a3: {  // ResetVSConstF -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetVSConstF( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a4: {  // ResetVSConstI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetVSConstI( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a5: {  // ResetVSConstB -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetVSConstB( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a6: {  // SetPSConstSF -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetPSConstSF( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a7: {  // SetPSConstSI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetPSConstSI( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a8: {  // ResetPSConstF -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetPSConstF( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4a9: {  // ResetPSConstI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetPSConstI( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4aa: {  // ResetPSConstB -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ResetPSConstB( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ab: {  // SetRenderTargetToShader -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SetRenderTargetToShader( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ac: {  // SetUseTextureToShader -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetUseTextureToShader( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ad: {  // SetUseVertexShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseVertexShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ae: {  // SetUseGeometryShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseGeometryShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4af: {  // SetUsePixelShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePixelShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b0: {  // DrawPolygon3DToShader_UseVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DrawPolygon3DToShader_UseVertexBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b1: {  // DrawPolygonIndexed3DToShader_UseVertexBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = DrawPolygonIndexed3DToShader_UseVertexBuffer( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b2: {  // InitShaderConstantBuffer -> r_int
        s_ret_i = InitShaderConstantBuffer(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b3: {  // CreateShaderConstantBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CreateShaderConstantBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b4: {  // DeleteShaderConstantBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteShaderConstantBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b5: {  // UpdateShaderConstantBuffer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = UpdateShaderConstantBuffer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b6: {  // SetGraphBlendScalingFilterMode -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetGraphBlendScalingFilterMode( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b7: {  // PlayMovie -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = PlayMovie( _a0_t, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b8: {  // OpenMovieToGraph -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 1 );
        s_ret_i = OpenMovieToGraph( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4b9: {  // PlayMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( DX_PLAYTYPE_BACK );
        int _a2 = code_getdi( 0 );
        s_ret_i = PlayMovieToGraph( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ba: {  // PauseMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = PauseMovieToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4bb: {  // AddMovieFrameToGraph -> r_int
        int _a0 = code_getdi( 0 );
        unsigned int _a1 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = AddMovieFrameToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4bc: {  // SeekMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SeekMovieToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4bd: {  // SetPlaySpeedRateMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        double _a1 = code_getdd( 0.0 );
        s_ret_i = SetPlaySpeedRateMovieToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4be: {  // GetMovieStateToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMovieStateToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4bf: {  // SetMovieVolumeToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetMovieVolumeToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c0: {  // GetMovieVolumeToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMovieVolumeToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c1: {  // ChangeMovieVolumeToGraph -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangeMovieVolumeToGraph( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c2: {  // GetMovieVolumeToGraph2 -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMovieVolumeToGraph2( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c3: {  // GetMovieTotalFrameToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMovieTotalFrameToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c4: {  // TellMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = TellMovieToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c5: {  // TellMovieToGraphToFrame -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = TellMovieToGraphToFrame( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c6: {  // SeekMovieToGraphToFrame -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SeekMovieToGraphToFrame( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c7: {  // GetOneFrameTimeMovieToGraph -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetOneFrameTimeMovieToGraph( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x4c8: {  // GetLastUpdateTimeMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetLastUpdateTimeMovieToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4c9: {  // UpdateMovieToGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = UpdateMovieToGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ca: {  // SetMovieRightImageAlphaFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMovieRightImageAlphaFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4cb: {  // SetMovieColorA8R8G8B8Flag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMovieColorA8R8G8B8Flag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4cc: {  // SetMovieUseYUVFormatSurfaceFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMovieUseYUVFormatSurfaceFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4cd: {  // SetCameraNearFar -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetCameraNearFar( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ce: {  // SetCameraNearFarD -> r_int
        double _a0 = code_getdd( 0.0 );
        double _a1 = code_getdd( 0.0 );
        s_ret_i = SetCameraNearFarD( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4cf: {  // SetCameraScreenCenter -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetCameraScreenCenter( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d0: {  // SetCameraScreenCenterD -> r_int
        double _a0 = code_getdd( 0.0 );
        double _a1 = code_getdd( 0.0 );
        s_ret_i = SetCameraScreenCenterD( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d1: {  // SetupCamera_Perspective -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetupCamera_Perspective( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d2: {  // SetupCamera_PerspectiveD -> r_int
        double _a0 = code_getdd( 0.0 );
        s_ret_i = SetupCamera_PerspectiveD( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d3: {  // SetupCamera_Ortho -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetupCamera_Ortho( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d4: {  // SetupCamera_OrthoD -> r_int
        double _a0 = code_getdd( 0.0 );
        s_ret_i = SetupCamera_OrthoD( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d5: {  // SetCameraDotAspect -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetCameraDotAspect( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d6: {  // SetCameraDotAspectD -> r_int
        double _a0 = code_getdd( 0.0 );
        s_ret_i = SetCameraDotAspectD( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4d7: {  // GetCameraNear -> r_float
        s_ret_d = (double)(GetCameraNear(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4d8: {  // GetCameraNearD -> r_double
        s_ret_d = GetCameraNearD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4d9: {  // GetCameraFar -> r_float
        s_ret_d = (double)(GetCameraFar(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4da: {  // GetCameraFarD -> r_double
        s_ret_d = GetCameraFarD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4db: {  // GetCameraAngleHRotate -> r_float
        s_ret_d = (double)(GetCameraAngleHRotate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4dc: {  // GetCameraAngleHRotateD -> r_double
        s_ret_d = GetCameraAngleHRotateD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4dd: {  // GetCameraAngleVRotate -> r_float
        s_ret_d = (double)(GetCameraAngleVRotate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4de: {  // GetCameraAngleVRotateD -> r_double
        s_ret_d = GetCameraAngleVRotateD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4df: {  // GetCameraAngleTRotate -> r_float
        s_ret_d = (double)(GetCameraAngleTRotate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4e0: {  // GetCameraAngleTRotateD -> r_double
        s_ret_d = GetCameraAngleTRotateD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4e1: {  // GetCameraFov -> r_float
        s_ret_d = (double)(GetCameraFov(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4e2: {  // GetCameraFovD -> r_double
        s_ret_d = GetCameraFovD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4e3: {  // GetCameraSize -> r_float
        s_ret_d = (double)(GetCameraSize(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4e4: {  // GetCameraSizeD -> r_double
        s_ret_d = GetCameraSizeD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4e5: {  // GetCameraDotAspect -> r_float
        s_ret_d = (double)(GetCameraDotAspect(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4e6: {  // GetCameraDotAspectD -> r_double
        s_ret_d = GetCameraDotAspectD(  );
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x4e7: {  // SetUseLighting -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseLighting( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e8: {  // SetMaterialUseVertDifColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaterialUseVertDifColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4e9: {  // SetMaterialUseVertSpcColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaterialUseVertSpcColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ea: {  // SetUseSpecular -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseSpecular( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4eb: {  // SetUseLightAngleAttenuation -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseLightAngleAttenuation( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ec: {  // SetUseHalfLambertLighting -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseHalfLambertLighting( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ed: {  // GetLightType -> r_int
        s_ret_i = GetLightType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ee: {  // SetLightEnable -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetLightEnable( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ef: {  // GetLightEnable -> r_int
        s_ret_i = GetLightEnable(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f0: {  // SetLightRangeAtten -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        s_ret_i = SetLightRangeAtten( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f1: {  // SetLightAngle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = SetLightAngle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f2: {  // SetLightUseShadowMap -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLightUseShadowMap( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f3: {  // DeleteLightHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteLightHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f4: {  // DeleteLightHandleAll -> r_int
        s_ret_i = DeleteLightHandleAll(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f5: {  // SetLightTypeHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLightTypeHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f6: {  // SetLightEnableHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLightEnableHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f7: {  // SetLightRangeAttenHandle -> r_int
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
    case 0x4f8: {  // SetLightAngleHandle -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = SetLightAngleHandle( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4f9: {  // SetLightUseShadowMapHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetLightUseShadowMapHandle( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fa: {  // GetLightTypeHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetLightTypeHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fb: {  // GetLightEnableHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetLightEnableHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fc: {  // GetEnableLightHandleNum -> r_int
        s_ret_i = GetEnableLightHandleNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fd: {  // GetEnableLightHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetEnableLightHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4fe: {  // CreateMaskScreen -> r_int
        s_ret_i = CreateMaskScreen(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x4ff: {  // DeleteMaskScreen -> r_int
        s_ret_i = DeleteMaskScreen(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x500: {  // SetUseMaskScreenFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseMaskScreenFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x501: {  // GetUseMaskScreenFlag -> r_int
        s_ret_i = GetUseMaskScreenFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x502: {  // FillMaskScreen -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = FillMaskScreen( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x503: {  // SetMaskScreenGraph -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaskScreenGraph( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x504: {  // InitMask -> r_int
        s_ret_i = InitMask(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x505: {  // MakeMask -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeMask( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x506: {  // DeleteMask -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteMask( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x507: {  // LoadMask -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadMask( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x508: {  // DrawMask -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawMask( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x509: {  // DrawStringMask -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        const char *_a3_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        s_ret_i = DrawStringMask( _a0, _a1, _a2, _a3_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50a: {  // DrawStringMaskToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        s_ret_i = DrawStringMaskToHandle( _a0, _a1, _a2, _a3, _a4_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50b: {  // DrawFillMask -> r_int
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
    case 0x50c: {  // SetMaskReverseEffectFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetMaskReverseEffectFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50d: {  // GetMaskScreenData -> r_int
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
    case 0x50e: {  // GetMaskUseFlag -> r_int
        s_ret_i = GetMaskUseFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x50f: {  // InitFontToHandle -> r_int
        s_ret_i = InitFontToHandle(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x510: {  // CreateFontToHandle -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( -1 );
        int _a5 = code_getdi( -1 );
        int _a6 = code_getdi( 0 );
        int _a7 = code_getdi( -1 );
        s_ret_i = CreateFontToHandle( _a0_t, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x511: {  // LoadFontDataToHandle -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = LoadFontDataToHandle( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x512: {  // SetFontSpaceToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetFontSpaceToHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x513: {  // SetFontLineSpaceToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetFontLineSpaceToHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x514: {  // DeleteFontToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteFontToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x515: {  // AddFontImageToHandle -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        int _a5 = code_getdi( 0 );
        s_ret_i = AddFontImageToHandle( _a0, _a1_t, _a2, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x516: {  // SubFontImageToHandle -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = SubFontImageToHandle( _a0, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x517: {  // AddSubstitutionFontToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = AddSubstitutionFontToHandle( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x518: {  // SubSubstitutionFontToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SubSubstitutionFontToHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x519: {  // ChangeFontFromHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ChangeFontFromHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x51a: {  // ChangeFontType -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ChangeFontType( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x51b: {  // SetFontSize -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontSize( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x51c: {  // GetFontSize -> r_int
        s_ret_i = GetFontSize(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x51d: {  // GetFontEdgeSize -> r_int
        s_ret_i = GetFontEdgeSize(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x51e: {  // SetFontThickness -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontThickness( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x51f: {  // SetFontSpace -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontSpace( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x520: {  // GetFontSpace -> r_int
        s_ret_i = GetFontSpace(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x521: {  // SetFontLineSpace -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontLineSpace( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x522: {  // GetFontLineSpace -> r_int
        s_ret_i = GetFontLineSpace(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x523: {  // SetDefaultFontState -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( -1 );
        int _a5 = code_getdi( -1 );
        int _a6 = code_getdi( 0 );
        s_ret_i = SetDefaultFontState( _a0_t, _a1, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x524: {  // GetDefaultFontHandle -> r_int
        s_ret_i = GetDefaultFontHandle(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x525: {  // GetFontMaxCacheCharNum -> r_int
        s_ret_i = GetFontMaxCacheCharNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x526: {  // GetFontMaxWidth -> r_int
        s_ret_i = GetFontMaxWidth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x527: {  // GetFontAscent -> r_int
        s_ret_i = GetFontAscent(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x528: {  // GetDrawStringWidth -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = GetDrawStringWidth( _a0_t, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x529: {  // GetDrawExtendStringWidth -> r_int
        double _a0 = code_getdd( 0.0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = GetDrawExtendStringWidth( _a0, _a1_t, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52a: {  // GetFontMaxCacheCharNumToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontMaxCacheCharNumToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52b: {  // GetFontMaxWidthToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontMaxWidthToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52c: {  // GetFontAscentToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontAscentToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52d: {  // GetFontSizeToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontSizeToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52e: {  // GetFontEdgeSizeToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontEdgeSizeToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x52f: {  // GetFontSpaceToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontSpaceToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x530: {  // GetFontLineSpaceToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFontLineSpaceToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x531: {  // GetDrawStringWidthToHandle -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = GetDrawStringWidthToHandle( _a0_t, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x532: {  // GetDrawExtendStringWidthToHandle -> r_int
        double _a0 = code_getdd( 0.0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        s_ret_i = GetDrawExtendStringWidthToHandle( _a0, _a1_t, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x533: {  // CheckFontCacheToTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckFontCacheToTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x534: {  // CheckFontChacheToTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckFontChacheToTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x535: {  // CheckFontHandleValid -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckFontHandleValid( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x536: {  // ClearFontCacheToHandle -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ClearFontCacheToHandle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x537: {  // SetFontCacheToTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontCacheToTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x538: {  // GetFontCacheToTextureFlag -> r_int
        s_ret_i = GetFontCacheToTextureFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x539: {  // SetFontChacheToTextureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontChacheToTextureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53a: {  // GetFontChacheToTextureFlag -> r_int
        s_ret_i = GetFontChacheToTextureFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53b: {  // SetFontCacheTextureColorBitDepth -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontCacheTextureColorBitDepth( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53c: {  // GetFontCacheTextureColorBitDepth -> r_int
        s_ret_i = GetFontCacheTextureColorBitDepth(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53d: {  // SetFontCacheCharNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontCacheCharNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53e: {  // GetFontCacheCharNum -> r_int
        s_ret_i = GetFontCacheCharNum(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x53f: {  // SetFontCacheUsePremulAlphaFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontCacheUsePremulAlphaFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x540: {  // GetFontCacheUsePremulAlphaFlag -> r_int
        s_ret_i = GetFontCacheUsePremulAlphaFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x541: {  // SetFontUseAdjustSizeFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontUseAdjustSizeFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x542: {  // GetFontUseAdjustSizeFlag -> r_int
        s_ret_i = GetFontUseAdjustSizeFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x543: {  // SetFontOnlyDrawType -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontOnlyDrawType( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x544: {  // GetFontOnlyDrawType -> r_int
        s_ret_i = GetFontOnlyDrawType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x545: {  // SetFontIgnoreLFFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetFontIgnoreLFFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x546: {  // GetFontIgnoreLFFlag -> r_int
        s_ret_i = GetFontIgnoreLFFlag(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x547: {  // DrawString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawString( _a0, _a1, _a2_t, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x548: {  // DrawVString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawVString( _a0, _a1, _a2_t, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x549: {  // DrawExtendString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendString( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54a: {  // DrawExtendVString -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendVString( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54b: {  // DrawRotaString -> r_int
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
#ifdef _WIN32
        static wchar_t _a10_t[1024];
        hsp3dx_utf8_to_wide( _a10_u8, _a10_t, 1024 );
#else
        const char *_a10_t = _a10_u8;
#endif
        s_ret_i = DrawRotaString( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54c: {  // DrawModiString -> r_int
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
#ifdef _WIN32
        static wchar_t _a11_t[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_t, 1024 );
#else
        const char *_a11_t = _a11_u8;
#endif
        s_ret_i = DrawModiString( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54d: {  // DrawStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawStringF( _a0, _a1, _a2_t, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54e: {  // DrawVStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a4 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawVStringF( _a0, _a1, _a2_t, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x54f: {  // DrawExtendStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendStringF( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x550: {  // DrawExtendVStringF -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendVStringF( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x551: {  // DrawRotaStringF -> r_int
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
#ifdef _WIN32
        static wchar_t _a10_t[1024];
        hsp3dx_utf8_to_wide( _a10_u8, _a10_t, 1024 );
#else
        const char *_a10_t = _a10_u8;
#endif
        s_ret_i = DrawRotaStringF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x552: {  // DrawModiStringF -> r_int
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
#ifdef _WIN32
        static wchar_t _a11_t[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_t, 1024 );
#else
        const char *_a11_t = _a11_u8;
#endif
        s_ret_i = DrawModiStringF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x553: {  // DrawNumberToI -> r_int
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
    case 0x554: {  // DrawNumberToF -> r_int
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
    case 0x555: {  // DrawNumberPlusToI -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberPlusToI( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x556: {  // DrawNumberPlusToF -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        double _a3 = code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        unsigned int _a6 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberPlusToF( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x557: {  // DrawStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawStringToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x558: {  // DrawVStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawVStringToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x559: {  // DrawExtendStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        int _a8 = code_getdi( 0 );
        s_ret_i = DrawExtendStringToHandle( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55a: {  // DrawExtendVStringToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendVStringToHandle( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55b: {  // DrawRotaStringToHandle -> r_int
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
#ifdef _WIN32
        static wchar_t _a11_t[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_t, 1024 );
#else
        const char *_a11_t = _a11_u8;
#endif
        s_ret_i = DrawRotaStringToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55c: {  // DrawModiStringToHandle -> r_int
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
#ifdef _WIN32
        static wchar_t _a12_t[1024];
        hsp3dx_utf8_to_wide( _a12_u8, _a12_t, 1024 );
#else
        const char *_a12_t = _a12_u8;
#endif
        s_ret_i = DrawModiStringToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55d: {  // DrawStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        s_ret_i = DrawStringFToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55e: {  // DrawVStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)code_getdi( (int)(0) );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawVStringFToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x55f: {  // DrawExtendStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        int _a8 = code_getdi( 0 );
        s_ret_i = DrawExtendStringFToHandle( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x560: {  // DrawExtendVStringFToHandle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        double _a2 = code_getdd( 0.0 );
        double _a3 = code_getdd( 0.0 );
        const char *_a4_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawExtendVStringFToHandle( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x561: {  // DrawRotaStringFToHandle -> r_int
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
#ifdef _WIN32
        static wchar_t _a11_t[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_t, 1024 );
#else
        const char *_a11_t = _a11_u8;
#endif
        s_ret_i = DrawRotaStringFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x562: {  // DrawModiStringFToHandle -> r_int
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
#ifdef _WIN32
        static wchar_t _a12_t[1024];
        hsp3dx_utf8_to_wide( _a12_u8, _a12_t, 1024 );
#else
        const char *_a12_t = _a12_u8;
#endif
        s_ret_i = DrawModiStringFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x563: {  // DrawNumberToIToHandle -> r_int
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
    case 0x564: {  // DrawNumberToFToHandle -> r_int
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
    case 0x565: {  // DrawNumberPlusToIToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberPlusToIToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x566: {  // DrawNumberPlusToFToHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        double _a3 = code_getdd( 0.0 );
        int _a4 = code_getdi( 0 );
        unsigned int _a5 = (unsigned int)code_getdi( (int)(0) );
        int _a6 = code_getdi( 0 );
        unsigned int _a7 = (unsigned int)code_getdi( (int)(0) );
        s_ret_i = DrawNumberPlusToFToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6, _a7 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x567: {  // SetUseFastLoadFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseFastLoadFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x568: {  // GetGraphDataShavedMode -> r_int
        s_ret_i = GetGraphDataShavedMode(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x569: {  // SetUsePremulAlphaConvertLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUsePremulAlphaConvertLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56a: {  // GetUsePremulAlphaConvertLoad -> r_int
        s_ret_i = GetUsePremulAlphaConvertLoad(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56b: {  // SetUseConvertNormalFormatLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseConvertNormalFormatLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56c: {  // GetUseConvertNormalFormatLoad -> r_int
        s_ret_i = GetUseConvertNormalFormatLoad(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56d: {  // GetColor -> r_uint
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = (int)(GetColor( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56e: {  // InitSoftImage -> r_int
        s_ret_i = InitSoftImage(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x56f: {  // LoadSoftImage -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadSoftImage( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x570: {  // LoadARGB8ColorSoftImage -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadARGB8ColorSoftImage( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x571: {  // LoadXRGB8ColorSoftImage -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadXRGB8ColorSoftImage( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x572: {  // MakeSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x573: {  // MakeARGBF32ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeARGBF32ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x574: {  // MakeARGBF16ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeARGBF16ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x575: {  // MakeXRGB8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeXRGB8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x576: {  // MakeARGB8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeARGB8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x577: {  // MakeRGBA8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeRGBA8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x578: {  // MakeABGR8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeABGR8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x579: {  // MakeBGRA8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeBGRA8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57a: {  // MakeARGB4ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeARGB4ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57b: {  // MakeA1R5G5B5ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeA1R5G5B5ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57c: {  // MakeX1R5G5B5ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeX1R5G5B5ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57d: {  // MakeR5G5B5A1ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeR5G5B5A1ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57e: {  // MakeR5G6B5ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeR5G6B5ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x57f: {  // MakeRGB8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MakeRGB8ColorSoftImage( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x580: {  // MakePAL8ColorSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MakePAL8ColorSoftImage( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x581: {  // DeleteSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x582: {  // CheckPaletteSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckPaletteSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x583: {  // CheckAlphaSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckAlphaSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x584: {  // CheckPixelAlphaSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckPixelAlphaSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x585: {  // GetDrawScreenSoftImage -> r_int
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
    case 0x586: {  // GetDrawScreenSoftImageDestPos -> r_int
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
    case 0x587: {  // FillSoftImage -> r_int
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
    case 0x588: {  // ClearRectSoftImage -> r_int
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
    case 0x589: {  // SetPaletteSoftImage -> r_int
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
    case 0x58a: {  // DrawPixelPalCodeSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = DrawPixelPalCodeSoftImage( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58b: {  // GetPixelPalCodeSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = GetPixelPalCodeSoftImage( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58c: {  // GetPitchSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetPitchSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x58d: {  // DrawPixelSoftImage -> r_int
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
    case 0x58e: {  // DrawPixelSoftImageF -> r_int
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
    case 0x58f: {  // DrawLineSoftImage -> r_int
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
    case 0x590: {  // DrawCircleSoftImage -> r_int
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
    case 0x591: {  // BltSoftImage -> r_int
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
    case 0x592: {  // BltSoftImageWithTransColor -> r_int
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
    case 0x593: {  // BltSoftImageWithAlphaBlend -> r_int
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
    case 0x594: {  // ReverseSoftImageH -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ReverseSoftImageH( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x595: {  // ReverseSoftImageV -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ReverseSoftImageV( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x596: {  // ReverseSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ReverseSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x597: {  // ConvertPremulAlphaSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ConvertPremulAlphaSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x598: {  // ConvertInterpAlphaSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ConvertInterpAlphaSoftImage( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x599: {  // BltStringSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( -1 );
        int _a5 = code_getdi( 0 );
        s_ret_i = BltStringSoftImage( _a0, _a1, _a2_t, _a3, _a4, _a5 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59a: {  // DrawSoftImage -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = DrawSoftImage( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59b: {  // SaveSoftImageToBmp -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = SaveSoftImageToBmp( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59c: {  // SaveSoftImageToDds -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = SaveSoftImageToDds( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59d: {  // SaveSoftImageToPng -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SaveSoftImageToPng( _a0_t, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59e: {  // SaveSoftImageToJpeg -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = SaveSoftImageToJpeg( _a0_t, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x59f: {  // InitSoundMem -> r_int
        s_ret_i = InitSoundMem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a0: {  // AddSoundData -> r_int
        int _a0 = code_getdi( -1 );
        s_ret_i = AddSoundData( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a1: {  // AddStreamSoundMemToFile -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( -1 );
        s_ret_i = AddStreamSoundMemToFile( _a0_t, _a1, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a2: {  // SetupStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetupStreamSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a3: {  // PlayStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( DX_PLAYTYPE_LOOP );
        int _a2 = code_getdi( 1 );
        s_ret_i = PlayStreamSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a4: {  // CheckStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckStreamSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a5: {  // StopStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = StopStreamSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a6: {  // SetStreamSoundCurrentPosition -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetStreamSoundCurrentPosition( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a7: {  // GetStreamSoundCurrentPosition -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetStreamSoundCurrentPosition( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5a8: {  // SetStreamSoundCurrentTime -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetStreamSoundCurrentTime( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5a9: {  // GetStreamSoundCurrentTime -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetStreamSoundCurrentTime( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5aa: {  // ProcessStreamSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ProcessStreamSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ab: {  // ProcessStreamSoundMemAll -> r_int
        s_ret_i = ProcessStreamSoundMemAll(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ac: {  // LoadSoundMem2 -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = LoadSoundMem2( _a0_t, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ad: {  // LoadBGM -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadBGM( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ae: {  // LoadSoundMemBase -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( -1 );
        s_ret_i = LoadSoundMemBase( _a0_t, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5af: {  // LoadSoundMem -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 3 );
        int _a2 = code_getdi( -1 );
        s_ret_i = LoadSoundMem( _a0_t, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b0: {  // LoadSoundMemToBufNumSitei -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = LoadSoundMemToBufNumSitei( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b1: {  // DuplicateSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 3 );
        s_ret_i = DuplicateSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b2: {  // LoadSoundMemFromSoftSound -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 3 );
        s_ret_i = LoadSoundMemFromSoftSound( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b3: {  // DeleteSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b4: {  // PlaySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 1 );
        s_ret_i = PlaySoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b5: {  // StopSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = StopSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b6: {  // CheckSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b7: {  // SetPanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetPanSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b8: {  // ChangePanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangePanSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5b9: {  // GetPanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetPanSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ba: {  // SetVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5bb: {  // ChangeVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangeVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5bc: {  // GetVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetVolumeSoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5bd: {  // GetVolumeSoundMem2 -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetVolumeSoundMem2( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5be: {  // SetChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetChannelVolumeSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5bf: {  // ChangeChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = ChangeChannelVolumeSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c0: {  // GetChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetChannelVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c1: {  // GetChannelVolumeSoundMem2 -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = GetChannelVolumeSoundMem2( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c2: {  // SetFrequencySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetFrequencySoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c3: {  // GetFrequencySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetFrequencySoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c4: {  // ResetFrequencySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ResetFrequencySoundMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c5: {  // SetNextPlayPanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetNextPlayPanSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c6: {  // ChangeNextPlayPanSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangeNextPlayPanSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c7: {  // SetNextPlayVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetNextPlayVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c8: {  // ChangeNextPlayVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = ChangeNextPlayVolumeSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5c9: {  // SetNextPlayChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = SetNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ca: {  // ChangeNextPlayChannelVolumeSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = ChangeNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5cb: {  // SetNextPlayFrequencySoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetNextPlayFrequencySoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5cc: {  // SetCurrentPositionSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetCurrentPositionSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5cd: {  // GetCurrentPositionSoundMem -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetCurrentPositionSoundMem( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5ce: {  // SetSoundCurrentPosition -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetSoundCurrentPosition( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5cf: {  // GetSoundCurrentPosition -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoundCurrentPosition( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5d0: {  // SetSoundCurrentTime -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetSoundCurrentTime( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d1: {  // GetSoundCurrentTime -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoundCurrentTime( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5d2: {  // GetSoundTotalSample -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoundTotalSample( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5d3: {  // GetSoundTotalTime -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoundTotalTime( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x5d4: {  // SetLoopPosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopPosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d5: {  // SetLoopTimePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopTimePosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d6: {  // SetLoopSamplePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopSamplePosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d7: {  // SetLoopStartTimePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopStartTimePosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d8: {  // SetLoopStartSamplePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = code_getdi( 0 );
        s_ret_i = SetLoopStartSamplePosSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5d9: {  // SetLoopAreaTimePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = code_getdi( 0 );
        s_ret_i = SetLoopAreaTimePosSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5da: {  // SetLoopAreaSamplePosSoundMem -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = code_getdi( 0 );
        s_ret_i = SetLoopAreaSamplePosSoundMem( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5db: {  // SetPlayFinishDeleteSoundMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetPlayFinishDeleteSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5dc: {  // Set3DRadiusSoundMem -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = Set3DRadiusSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5dd: {  // SetNextPlay3DRadiusSoundMem -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetNextPlay3DRadiusSoundMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5de: {  // GetOggCommentNum -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = GetOggCommentNum( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5df: {  // SetCreateSoundDataType -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateSoundDataType( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e0: {  // GetCreateSoundDataType -> r_int
        s_ret_i = GetCreateSoundDataType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e1: {  // SetCreateSoundPitchRate -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetCreateSoundPitchRate( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e2: {  // GetCreateSoundPitchRate -> r_float
        s_ret_d = (double)(GetCreateSoundPitchRate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x5e3: {  // SetCreateSoundTimeStretchRate -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = SetCreateSoundTimeStretchRate( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e4: {  // GetCreateSoundTimeStretchRate -> r_float
        s_ret_d = (double)(GetCreateSoundTimeStretchRate(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x5e5: {  // SetCreateSoundLoopAreaTimePos -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        s_ret_i = SetCreateSoundLoopAreaTimePos( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e6: {  // SetCreateSoundLoopAreaSamplePos -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        s_ret_i = SetCreateSoundLoopAreaSamplePos( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e7: {  // SetCreateSoundIgnoreLoopAreaInfo -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreateSoundIgnoreLoopAreaInfo( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e8: {  // GetCreateSoundIgnoreLoopAreaInfo -> r_int
        s_ret_i = GetCreateSoundIgnoreLoopAreaInfo(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5e9: {  // SetDisableReadSoundFunctionMask -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDisableReadSoundFunctionMask( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ea: {  // GetDisableReadSoundFunctionMask -> r_int
        s_ret_i = GetDisableReadSoundFunctionMask(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5eb: {  // SetEnableSoundCaptureFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetEnableSoundCaptureFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ec: {  // SetUseOldVolumeCalcFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseOldVolumeCalcFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ed: {  // GetSoundCurrentTimeType -> r_int
        s_ret_i = GetSoundCurrentTimeType(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ee: {  // SetCreate3DSoundFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetCreate3DSoundFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ef: {  // Set3DSoundOneMetre -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = Set3DSoundOneMetre( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f0: {  // Set3DSoundListenerConeAngle -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = Set3DSoundListenerConeAngle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f1: {  // Set3DSoundListenerConeVolume -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = Set3DSoundListenerConeVolume( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f2: {  // PlaySoundFile -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = PlaySoundFile( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f3: {  // PlaySound -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = PlaySound( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f4: {  // PlaySoundDX -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = PlaySoundDX( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f5: {  // CheckSoundFile -> r_int
        s_ret_i = CheckSoundFile(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f6: {  // CheckSound -> r_int
        s_ret_i = CheckSound(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f7: {  // StopSoundFile -> r_int
        s_ret_i = StopSoundFile(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f8: {  // StopSound -> r_int
        s_ret_i = StopSound(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5f9: {  // SetVolumeSoundFile -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetVolumeSoundFile( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fa: {  // SetVolumeSound -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetVolumeSound( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fb: {  // InitSoftSound -> r_int
        s_ret_i = InitSoftSound(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fc: {  // LoadSoftSound -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadSoftSound( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fd: {  // MakeSoftSound -> r_int
        int _a0 = code_getdi( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5fe: {  // MakeSoftSound2Ch16Bit44KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound2Ch16Bit44KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x5ff: {  // MakeSoftSound2Ch16Bit22KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound2Ch16Bit22KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x600: {  // MakeSoftSound2Ch8Bit44KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound2Ch8Bit44KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x601: {  // MakeSoftSound2Ch8Bit22KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound2Ch8Bit22KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x602: {  // MakeSoftSound1Ch16Bit44KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound1Ch16Bit44KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x603: {  // MakeSoftSound1Ch16Bit22KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound1Ch16Bit22KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x604: {  // MakeSoftSound1Ch8Bit44KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound1Ch8Bit44KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x605: {  // MakeSoftSound1Ch8Bit22KHz -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        s_ret_i = MakeSoftSound1Ch8Bit22KHz( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x606: {  // MakeSoftSoundCustom -> r_int
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
    case 0x607: {  // DeleteSoftSound -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSoftSound( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x608: {  // SaveSoftSound -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = SaveSoftSound( _a0, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x609: {  // GetSoftSoundSampleNum -> r_int64
        int _a0 = code_getdi( 0 );
        s_ret_i64 = (LONGLONG)(GetSoftSoundSampleNum( _a0 ));
        *type_res = HSPVAR_FLAG_INT64;
        *ptr_out = &s_ret_i64;
        return 1;
    }
    case 0x60a: {  // WriteSoftSoundData -> r_int
        int _a0 = code_getdi( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = WriteSoftSoundData( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60b: {  // WriteSoftSoundDataF -> r_int
        int _a0 = code_getdi( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        float _a2 = (float)code_getdd( 0.0 );
        float _a3 = (float)code_getdd( 0.0 );
        s_ret_i = WriteSoftSoundDataF( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60c: {  // WriteTimeStretchSoftSoundData -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = WriteTimeStretchSoftSoundData( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60d: {  // WritePitchShiftSoftSoundData -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = WritePitchShiftSoftSoundData( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60e: {  // InitSoftSoundPlayer -> r_int
        s_ret_i = InitSoftSoundPlayer(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x60f: {  // MakeSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MakeSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x610: {  // MakeSoftSoundPlayer2Ch16Bit44KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer2Ch16Bit44KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x611: {  // MakeSoftSoundPlayer2Ch16Bit22KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer2Ch16Bit22KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x612: {  // MakeSoftSoundPlayer2Ch8Bit44KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer2Ch8Bit44KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x613: {  // MakeSoftSoundPlayer2Ch8Bit22KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer2Ch8Bit22KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x614: {  // MakeSoftSoundPlayer1Ch16Bit44KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer1Ch16Bit44KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x615: {  // MakeSoftSoundPlayer1Ch16Bit22KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer1Ch16Bit22KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x616: {  // MakeSoftSoundPlayer1Ch8Bit44KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer1Ch8Bit44KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x617: {  // MakeSoftSoundPlayer1Ch8Bit22KHz -> r_int
        s_ret_i = MakeSoftSoundPlayer1Ch8Bit22KHz(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x618: {  // MakeSoftSoundPlayerCustom -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MakeSoftSoundPlayerCustom( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x619: {  // DeleteSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61a: {  // AddDataSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        LONGLONG _a2 = (LONGLONG)code_geti64();
        int _a3 = code_getdi( 0 );
        s_ret_i = AddDataSoftSoundPlayer( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61b: {  // AddOneDataSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = AddOneDataSoftSoundPlayer( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61c: {  // StartSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = StartSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61d: {  // CheckStartSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckStartSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61e: {  // StopSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = StopSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x61f: {  // ResetSoftSoundPlayer -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = ResetSoftSoundPlayer( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x620: {  // CheckSoftSoundPlayerNoneData -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckSoftSoundPlayerNoneData( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x621: {  // DeleteMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = DeleteMusicMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x622: {  // LoadMusicMem -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = LoadMusicMem( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x623: {  // PlayMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = PlayMusicMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x624: {  // StopMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = StopMusicMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x625: {  // CheckMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = CheckMusicMem( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x626: {  // SetVolumeMusicMem -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = SetVolumeMusicMem( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x627: {  // GetMusicMemPosition -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = GetMusicMemPosition( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x628: {  // InitMusicMem -> r_int
        s_ret_i = InitMusicMem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x629: {  // ProcessMusicMem -> r_int
        s_ret_i = ProcessMusicMem(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62a: {  // PlayMusic -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = PlayMusic( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62b: {  // SetVolumeMusic -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetVolumeMusic( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62c: {  // StopMusic -> r_int
        s_ret_i = StopMusic(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62d: {  // CheckMusic -> r_int
        s_ret_i = CheckMusic(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62e: {  // GetMusicPosition -> r_int
        s_ret_i = GetMusicPosition(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x62f: {  // SelectMidiMode -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SelectMidiMode( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x630: {  // SetUseDXArchiveFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetUseDXArchiveFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x631: {  // SetDXArchivePriority -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = SetDXArchivePriority( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x632: {  // SetDXArchiveExtension -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = SetDXArchiveExtension( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x633: {  // SetDXArchiveKeyString -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = SetDXArchiveKeyString( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x634: {  // DXArchivePreLoad -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = code_getdi( 0 );
        s_ret_i = DXArchivePreLoad( _a0_t, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x635: {  // DXArchiveCheckIdle -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = DXArchiveCheckIdle( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x636: {  // DXArchiveRelease -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = DXArchiveRelease( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x637: {  // DXArchiveCheckFile -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = DXArchiveCheckFile( _a0_t, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x638: {  // MV1LoadModel -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = MV1LoadModel( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x639: {  // MV1DuplicateModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1DuplicateModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63a: {  // MV1CreateCloneModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1CreateCloneModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63b: {  // MV1DeleteModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1DeleteModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63c: {  // MV1InitModel -> r_int
        s_ret_i = MV1InitModel(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63d: {  // MV1SetLoadModelReMakeNormal -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelReMakeNormal( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63e: {  // MV1SetLoadModelReMakeNormalSmoothingAngle -> r_int
        float _a0 = (float)code_getdd( 1.562069 );
        s_ret_i = MV1SetLoadModelReMakeNormalSmoothingAngle( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x63f: {  // MV1SetLoadModelIgnoreScaling -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelIgnoreScaling( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x640: {  // MV1SetLoadModelPositionOptimize -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelPositionOptimize( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x641: {  // MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x642: {  // MV1SetLoadModelPhysicsWorldGravity -> r_int
        float _a0 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetLoadModelPhysicsWorldGravity( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x643: {  // MV1GetLoadModelPhysicsWorldGravity -> r_float
        s_ret_d = (double)(MV1GetLoadModelPhysicsWorldGravity(  ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x644: {  // MV1SetLoadModelPhysicsCalcPrecision -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelPhysicsCalcPrecision( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x645: {  // MV1AddLoadModelDisablePhysicsNameWord -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = MV1AddLoadModelDisablePhysicsNameWord( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x646: {  // MV1ResetLoadModelDisablePhysicsNameWord -> r_int
        s_ret_i = MV1ResetLoadModelDisablePhysicsNameWord(  );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x647: {  // MV1SetLoadModelAnimFilePath -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = MV1SetLoadModelAnimFilePath( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x648: {  // MV1SetLoadModelUsePackDraw -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelUsePackDraw( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x649: {  // MV1SetLoadModelTriangleListUseMaxBoneNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelTriangleListUseMaxBoneNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64a: {  // MV1SetLoadModelTextureLoad -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelTextureLoad( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64b: {  // MV1SetLoadModelIgnoreIK -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetLoadModelIgnoreIK( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64c: {  // MV1SaveModelToMV1File -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( MV1_SAVETYPE_NORMAL );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( 1 );
        int _a5 = code_getdi( 1 );
        int _a6 = code_getdi( 1 );
        int _a7 = code_getdi( 0 );
        int _a8 = code_getdi( 1 );
        s_ret_i = MV1SaveModelToMV1File( _a0, _a1_t, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64d: {  // MV1SaveModelToXFile -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( MV1_SAVETYPE_NORMAL );
        int _a3 = code_getdi( -1 );
        int _a4 = code_getdi( 1 );
        s_ret_i = MV1SaveModelToXFile( _a0, _a1_t, _a2, _a3, _a4 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64e: {  // MV1DrawModel -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1DrawModel( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x64f: {  // MV1DrawFrame -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1DrawFrame( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x650: {  // MV1DrawMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1DrawMesh( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x651: {  // MV1DrawTriangleList -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1DrawTriangleList( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x652: {  // MV1DrawModelDebug -> r_int
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
    case 0x653: {  // MV1SetUseOrigShader -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1SetUseOrigShader( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x654: {  // MV1SetVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x655: {  // MV1GetVisible -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetVisible( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x656: {  // MV1SetMeshCategoryVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshCategoryVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x657: {  // MV1GetMeshCategoryVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshCategoryVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x658: {  // MV1GetSemiTransState -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetSemiTransState( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x659: {  // MV1SetOpacityRate -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetOpacityRate( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65a: {  // MV1GetOpacityRate -> r_float
        int _a0 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetOpacityRate( _a0 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x65b: {  // MV1SetUseDrawMulAlphaColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseDrawMulAlphaColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65c: {  // MV1GetUseDrawMulAlphaColor -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetUseDrawMulAlphaColor( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65d: {  // MV1SetUseZBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseZBuffer( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65e: {  // MV1SetWriteZBuffer -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetWriteZBuffer( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x65f: {  // MV1SetZBias -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetZBias( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x660: {  // MV1SetUseVertDifColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseVertDifColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x661: {  // MV1SetUseVertSpcColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseVertSpcColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x662: {  // MV1SetSampleFilterMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetSampleFilterMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x663: {  // MV1SetMaxAnisotropy -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaxAnisotropy( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x664: {  // MV1SetWireFrameDrawFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetWireFrameDrawFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x665: {  // MV1RefreshVertColorFromMaterial -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1RefreshVertColorFromMaterial( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x666: {  // MV1PhysicsCalculation -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = MV1PhysicsCalculation( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x667: {  // MV1PhysicsResetState -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1PhysicsResetState( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x668: {  // MV1SetPrioritizePhysicsOverAnimFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetPrioritizePhysicsOverAnimFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x669: {  // MV1SetUseShapeFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetUseShapeFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66a: {  // MV1GetMaterialNumberOrderFlag -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialNumberOrderFlag( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66b: {  // MV1AttachAnim -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( -1 );
        int _a3 = code_getdi( 1 );
        s_ret_i = MV1AttachAnim( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66c: {  // MV1DetachAnim -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1DetachAnim( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66d: {  // MV1SetAttachAnimTime -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetAttachAnimTime( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x66e: {  // MV1GetAttachAnimTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimTime( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x66f: {  // MV1GetAttachAnimTotalTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimTotalTime( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x670: {  // MV1SetAttachAnimBlendRate -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 1.0 );
        s_ret_i = MV1SetAttachAnimBlendRate( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x671: {  // MV1GetAttachAnimBlendRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimBlendRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x672: {  // MV1SetAttachAnimBlendRateToFrame -> r_int
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
    case 0x673: {  // MV1GetAttachAnimBlendRateToFrame -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimBlendRateToFrame( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x674: {  // MV1SetAttachAnimTimeToFrame -> r_int
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
    case 0x675: {  // MV1GetAttachAnimTimeToFrame -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAttachAnimTimeToFrame( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x676: {  // MV1GetAttachAnim -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAttachAnim( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x677: {  // MV1SetAttachAnimUseShapeFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetAttachAnimUseShapeFlag( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x678: {  // MV1GetAttachAnimUseShapeFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAttachAnimUseShapeFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x679: {  // MV1GetAnimNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetAnimNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67a: {  // MV1SetAnimName -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        s_ret_i = MV1SetAnimName( _a0, _a1, _a2_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67b: {  // MV1GetAnimIndex -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = MV1GetAnimIndex( _a0, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67c: {  // MV1GetAnimTotalTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAnimTotalTime( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x67d: {  // MV1GetAnimTargetFrameNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimTargetFrameNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67e: {  // MV1GetAnimTargetFrame -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetAnimTargetFrame( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x67f: {  // MV1GetAnimTargetFrameKeySetNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetAnimTargetFrameKeySetNum( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x680: {  // MV1GetAnimTargetFrameKeySet -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1GetAnimTargetFrameKeySet( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x681: {  // MV1GetAnimKeySetNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x682: {  // MV1GetAnimKeySetType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x683: {  // MV1GetAnimKeySetDataType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetDataType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x684: {  // MV1GetAnimKeySetTimeType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetTimeType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x685: {  // MV1GetAnimKeySetDataNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetAnimKeySetDataNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x686: {  // MV1GetAnimKeyDataTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAnimKeyDataTime( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x687: {  // MV1GetAnimKeyDataIndexFromTime -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1GetAnimKeyDataIndexFromTime( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x688: {  // MV1GetAnimKeyDataToFlat -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAnimKeyDataToFlat( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x689: {  // MV1GetAnimKeyDataToFlatFromTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_d = (double)(MV1GetAnimKeyDataToFlatFromTime( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x68a: {  // MV1GetAnimKeyDataToLinear -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetAnimKeyDataToLinear( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x68b: {  // MV1GetAnimKeyDataToLinearFromTime -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_d = (double)(MV1GetAnimKeyDataToLinearFromTime( _a0, _a1, _a2 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x68c: {  // MV1GetMaterialNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x68d: {  // MV1SetMaterialTypeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialTypeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x68e: {  // MV1SetMaterialType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialType( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x68f: {  // MV1GetMaterialType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x690: {  // MV1SetMaterialSpcPower -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialSpcPower( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x691: {  // MV1GetMaterialSpcPower -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetMaterialSpcPower( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x692: {  // MV1SetMaterialDifMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDifMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x693: {  // MV1GetMaterialDifMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDifMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x694: {  // MV1SetMaterialSubDifMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSubDifMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x695: {  // MV1GetMaterialSubDifMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSubDifMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x696: {  // MV1SetMaterialSpcMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSpcMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x697: {  // MV1GetMaterialSpcMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSpcMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x698: {  // MV1SetMaterialNormalMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialNormalMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x699: {  // MV1GetMaterialNormalMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialNormalMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69a: {  // MV1SetMaterialDifGradTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDifGradTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69b: {  // MV1GetMaterialDifGradTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDifGradTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69c: {  // MV1SetMaterialSpcGradTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSpcGradTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69d: {  // MV1GetMaterialSpcGradTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSpcGradTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69e: {  // MV1SetMaterialSphereMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSphereMapTexture( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x69f: {  // MV1GetMaterialSphereMapTexture -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSphereMapTexture( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a0: {  // MV1SetMaterialDifGradBlendTypeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDifGradBlendTypeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a1: {  // MV1SetMaterialDifGradBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDifGradBlendType( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a2: {  // MV1GetMaterialDifGradBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDifGradBlendType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a3: {  // MV1SetMaterialSpcGradBlendTypeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSpcGradBlendTypeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a4: {  // MV1SetMaterialSpcGradBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSpcGradBlendType( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a5: {  // MV1GetMaterialSpcGradBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSpcGradBlendType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a6: {  // MV1SetMaterialSphereMapBlendTypeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSphereMapBlendTypeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a7: {  // MV1SetMaterialSphereMapBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialSphereMapBlendType( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a8: {  // MV1GetMaterialSphereMapBlendType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialSphereMapBlendType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6a9: {  // MV1SetMaterialOutLineWidthAll -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialOutLineWidthAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6aa: {  // MV1SetMaterialOutLineWidth -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialOutLineWidth( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ab: {  // MV1GetMaterialOutLineWidth -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetMaterialOutLineWidth( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6ac: {  // MV1SetMaterialOutLineDotWidthAll -> r_int
        int _a0 = code_getdi( 0 );
        float _a1 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialOutLineDotWidthAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ad: {  // MV1SetMaterialOutLineDotWidth -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMaterialOutLineDotWidth( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ae: {  // MV1GetMaterialOutLineDotWidth -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetMaterialOutLineDotWidth( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6af: {  // MV1SetMaterialDrawBlendModeAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawBlendModeAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b0: {  // MV1SetMaterialDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawBlendMode( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b1: {  // MV1GetMaterialDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawBlendMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b2: {  // MV1SetMaterialDrawBlendParamAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawBlendParamAll( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b3: {  // MV1SetMaterialDrawBlendParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawBlendParam( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b4: {  // MV1GetMaterialDrawBlendParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawBlendParam( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b5: {  // MV1SetMaterialDrawAlphaTestAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawAlphaTestAll( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b6: {  // MV1SetMaterialDrawAlphaTest -> r_int
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
    case 0x6b7: {  // MV1GetMaterialDrawAlphaTestEnable -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawAlphaTestEnable( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b8: {  // MV1GetMaterialDrawAlphaTestMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawAlphaTestMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6b9: {  // MV1GetMaterialDrawAlphaTestParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMaterialDrawAlphaTestParam( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ba: {  // MV1SetMaterialDrawAddColorAll -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1SetMaterialDrawAddColorAll( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6bb: {  // MV1SetMaterialDrawAddColor -> r_int
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
    case 0x6bc: {  // MV1GetTextureNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetTextureNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6bd: {  // MV1SetTextureColorFilePath -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        s_ret_i = MV1SetTextureColorFilePath( _a0, _a1, _a2_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6be: {  // MV1SetTextureAlphaFilePath -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        s_ret_i = MV1SetTextureAlphaFilePath( _a0, _a1, _a2_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6bf: {  // MV1SetTextureGraphHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1SetTextureGraphHandle( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c0: {  // MV1GetTextureGraphHandle -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureGraphHandle( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c1: {  // MV1SetTextureAddressMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        s_ret_i = MV1SetTextureAddressMode( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c2: {  // MV1GetTextureAddressModeU -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureAddressModeU( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c3: {  // MV1GetTextureAddressModeV -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureAddressModeV( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c4: {  // MV1GetTextureWidth -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureWidth( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c5: {  // MV1GetTextureHeight -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureHeight( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c6: {  // MV1GetTextureSemiTransState -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureSemiTransState( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c7: {  // MV1SetTextureBumpImageFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetTextureBumpImageFlag( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c8: {  // MV1GetTextureBumpImageFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureBumpImageFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6c9: {  // MV1SetTextureBumpImageNextPixelLength -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetTextureBumpImageNextPixelLength( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ca: {  // MV1GetTextureBumpImageNextPixelLength -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetTextureBumpImageNextPixelLength( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6cb: {  // MV1SetTextureSampleFilterMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetTextureSampleFilterMode( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6cc: {  // MV1GetTextureSampleFilterMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTextureSampleFilterMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6cd: {  // MV1AddTextureGraphHandle -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = code_getdi( 0 );
        int _a3 = code_getdi( 0 );
        int _a4 = code_getdi( DX_TEXADDRESS_WRAP );
        int _a5 = code_getdi( DX_TEXADDRESS_WRAP );
        int _a6 = code_getdi( DX_DRAWMODE_ANISOTROPIC );
        s_ret_i = MV1AddTextureGraphHandle( _a0, _a1_t, _a2, _a3, _a4, _a5, _a6 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ce: {  // MV1LoadTexture -> r_int
        const char *_a0_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        s_ret_i = MV1LoadTexture( _a0_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6cf: {  // MV1GetFrameNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetFrameNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d0: {  // MV1SearchFrame -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = MV1SearchFrame( _a0, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d1: {  // MV1SearchFrameChild -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        const char *_a2_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        s_ret_i = MV1SearchFrameChild( _a0, _a1, _a2_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d2: {  // MV1GetFrameParent -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameParent( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d3: {  // MV1GetFrameChildNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        s_ret_i = MV1GetFrameChildNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d4: {  // MV1GetFrameChild -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetFrameChild( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d5: {  // MV1ResetFrameUserLocalMatrix -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1ResetFrameUserLocalMatrix( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d6: {  // MV1ResetFrameUserLocalWorldMatrix -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1ResetFrameUserLocalWorldMatrix( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d7: {  // MV1GetFrameVertexNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameVertexNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d8: {  // MV1GetFrameTriangleNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameTriangleNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6d9: {  // MV1GetFrameMeshNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameMeshNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6da: {  // MV1GetFrameMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetFrameMesh( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6db: {  // MV1SetFrameVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetFrameVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6dc: {  // MV1GetFrameVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6dd: {  // MV1GetFrameSemiTransState -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameSemiTransState( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6de: {  // MV1SetFrameOpacityRate -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetFrameOpacityRate( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6df: {  // MV1GetFrameOpacityRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetFrameOpacityRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6e0: {  // MV1SetFrameBaseVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetFrameBaseVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e1: {  // MV1GetFrameBaseVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetFrameBaseVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e2: {  // MV1SetFrameTextureAddressTransform -> r_int
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
    case 0x6e3: {  // MV1ResetFrameTextureAddressTransform -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1ResetFrameTextureAddressTransform( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e4: {  // MV1GetMeshNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetMeshNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e5: {  // MV1GetMeshMaterial -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshMaterial( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e6: {  // MV1GetMeshVertexNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshVertexNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e7: {  // MV1GetMeshTriangleNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshTriangleNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e8: {  // MV1SetMeshVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6e9: {  // MV1GetMeshVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ea: {  // MV1SetMeshOpacityRate -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        s_ret_i = MV1SetMeshOpacityRate( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6eb: {  // MV1GetMeshOpacityRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetMeshOpacityRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x6ec: {  // MV1SetMeshDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshDrawBlendMode( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ed: {  // MV1SetMeshDrawBlendParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshDrawBlendParam( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ee: {  // MV1GetMeshDrawBlendMode -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshDrawBlendMode( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ef: {  // MV1GetMeshDrawBlendParam -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshDrawBlendParam( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f0: {  // MV1SetMeshBaseVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshBaseVisible( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f1: {  // MV1GetMeshBaseVisible -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshBaseVisible( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f2: {  // MV1SetMeshBackCulling -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshBackCulling( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f3: {  // MV1GetMeshBackCulling -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshBackCulling( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f4: {  // MV1GetMeshTListNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshTListNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f5: {  // MV1GetMeshTList -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetMeshTList( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f6: {  // MV1GetMeshSemiTransState -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshSemiTransState( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f7: {  // MV1SetMeshUseVertDifColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshUseVertDifColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f8: {  // MV1SetMeshUseVertSpcColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1SetMeshUseVertSpcColor( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6f9: {  // MV1GetMeshUseVertDifColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshUseVertDifColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fa: {  // MV1GetMeshUseVertSpcColor -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshUseVertSpcColor( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fb: {  // MV1GetMeshShapeFlag -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetMeshShapeFlag( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fc: {  // MV1GetShapeNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetShapeNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fd: {  // MV1SearchShape -> r_int
        int _a0 = code_getdi( 0 );
        const char *_a1_u8 = code_gets();
#ifdef _WIN32
        static wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        s_ret_i = MV1SearchShape( _a0, _a1_t );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6fe: {  // MV1GetShapeTargetMeshNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetShapeTargetMeshNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x6ff: {  // MV1GetShapeTargetMesh -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        int _a2 = code_getdi( 0 );
        s_ret_i = MV1GetShapeTargetMesh( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x700: {  // MV1SetShapeRate -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        float _a2 = (float)code_getdd( 0.0 );
        int _a3 = code_getdi( DX_MV1_SHAPERATE_ADD );
        s_ret_i = MV1SetShapeRate( _a0, _a1, _a2, _a3 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x701: {  // MV1GetShapeRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetShapeRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x702: {  // MV1GetShapeApplyRate -> r_float
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_d = (double)(MV1GetShapeApplyRate( _a0, _a1 ));
        *type_res = HSPVAR_FLAG_DOUBLE;
        *ptr_out = &s_ret_d;
        return 1;
    }
    case 0x703: {  // MV1GetTriangleListNum -> r_int
        int _a0 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListNum( _a0 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x704: {  // MV1GetTriangleListVertexType -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListVertexType( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x705: {  // MV1GetTriangleListPolygonNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListPolygonNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x706: {  // MV1GetTriangleListVertexNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListVertexNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x707: {  // MV1GetTriangleListLocalWorldMatrixNum -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListLocalWorldMatrixNum( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x708: {  // MV1GetTriangleListUseMaterial -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( 0 );
        s_ret_i = MV1GetTriangleListUseMaterial( _a0, _a1 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x709: {  // MV1SetupCollInfo -> r_int
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
    case 0x70a: {  // MV1TerminateCollInfo -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        int _a2 = code_getdi( -1 );
        s_ret_i = MV1TerminateCollInfo( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x70b: {  // MV1RefreshCollInfo -> r_int
        int _a0 = code_getdi( 0 );
        int _a1 = code_getdi( -1 );
        int _a2 = code_getdi( -1 );
        s_ret_i = MV1RefreshCollInfo( _a0, _a1, _a2 );
        *type_res = HSPVAR_FLAG_INT;
        *ptr_out = &s_ret_i;
        return 1;
    }
    case 0x70c: {  // MV1SetupReferenceMesh -> r_int
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
    case 0x70d: {  // MV1TerminateReferenceMesh -> r_int
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
    case 0x70e: {  // MV1RefreshReferenceMesh -> r_int
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
    }
    return 0;
}
