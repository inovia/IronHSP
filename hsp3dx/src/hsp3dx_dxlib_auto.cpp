//
//  hsp3dx_dxlib_auto.cpp — Phase 5.3 自動生成 DxLib binding dispatcher
//  DO NOT EDIT — tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py で再生成
//  関数数: 1628
//
//  hsp3dx_extcmd.cpp の cmdfunc_extcmd() から以下で呼ばれる:
//      if ( hsp3dx_dxlib_auto_dispatch( cmd, ctx ) ) return RUNMODE_RUN;
//
#include <stdio.h>
#include <string.h>
#ifdef _WIN32
#include <windows.h>
#endif
#include "hsp3dx_compat.h"
#include "../../hsp3/hsp3config.h"
#include "../../hsp3/hsp3struct.h"  // PVal / APTR (struct 引数用)
#include "../../hsp3/hsp3code.h"
#include "../../hsp3/hsp3debug.h"
#include "DxLib.h"
#include "hsp3dx_console.h"    // utf8_to_wide

//  本ファイル専用のユーティリティ (console.h の公開関数を使う)
static int hsp3dx_auto_geti(int def) { return code_getdi(def); }
static double hsp3dx_auto_getd(double def) { return code_getdd(def); }
static const char *hsp3dx_auto_gets() { return code_gets(); }

extern "C" int hsp3dx_dxlib_auto_dispatch( int cmd, HSPCTX *ctx )
{
    switch ( cmd ) {
    case 0x200: {  // DxLib_GlobalStructInitialize  -> r_int
        ctx->stat = DxLib_GlobalStructInitialize(  );
        return 1;
    }
    case 0x201: {  // DxLib_IsInit  -> r_int
        ctx->stat = DxLib_IsInit(  );
        return 1;
    }
    case 0x202: {  // GetLastErrorCode  -> r_int
        ctx->stat = GetLastErrorCode(  );
        return 1;
    }
    case 0x203: {  // GetLastErrorMessage  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLastErrorMessage( _a0_t, _a1 );
        return 1;
    }
    case 0x204: {  // SetAlwaysRunFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetAlwaysRunFlag( _a0 );
        return 1;
    }
    case 0x205: {  // WaitTimer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = WaitTimer( _a0 );
        return 1;
    }
    case 0x206: {  // WaitKey  -> r_int
        ctx->stat = WaitKey(  );
        return 1;
    }
    case 0x207: {  // SleepThread  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SleepThread( _a0 );
        return 1;
    }
    case 0x208: {  // GetNowCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetNowCount( _a0 );
        return 1;
    }
    case 0x209: {  // GetNowHiPerformanceCount  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetNowHiPerformanceCount( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x20a: {  // GetNowSysPerformanceCount  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _ret = GetNowSysPerformanceCount(  );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x20b: {  // GetSysPerformanceFrequency  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _ret = GetSysPerformanceFrequency(  );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x20c: {  // ConvSysPerformanceCountToSeconds  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        ULONGLONG _ret = ConvSysPerformanceCountToSeconds( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x20d: {  // ConvSysPerformanceCountToMilliSeconds  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        ULONGLONG _ret = ConvSysPerformanceCountToMilliSeconds( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x20e: {  // ConvSysPerformanceCountToMicroSeconds  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        ULONGLONG _ret = ConvSysPerformanceCountToMicroSeconds( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x20f: {  // ConvSysPerformanceCountToNanoSeconds  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        ULONGLONG _ret = ConvSysPerformanceCountToNanoSeconds( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x210: {  // ConvSecondsToSysPerformanceCount  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        ULONGLONG _ret = ConvSecondsToSysPerformanceCount( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x211: {  // ConvMilliSecondsToSysPerformanceCount  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        ULONGLONG _ret = ConvMilliSecondsToSysPerformanceCount( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x212: {  // ConvMicroSecondsToSysPerformanceCount  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        ULONGLONG _ret = ConvMicroSecondsToSysPerformanceCount( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x213: {  // ConvNanoSecondsToSysPerformanceCount  -> r_uint64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        ULONGLONG _a0 = (ULONGLONG)code_geti64();
        ULONGLONG _ret = ConvNanoSecondsToSysPerformanceCount( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x214: {  // GetRand  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetRand( _a0 );
        return 1;
    }
    case 0x215: {  // SRand  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SRand( _a0 );
        return 1;
    }
    case 0x216: {  // GetBatteryLifePercent  -> r_int
        ctx->stat = GetBatteryLifePercent(  );
        return 1;
    }
    case 0x217: {  // GetClipboardText  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = GetClipboardText( _a0_t, _a1 );
        return 1;
    }
    case 0x218: {  // SetClipboardText  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = SetClipboardText( _a0_t );
        return 1;
    }
    case 0x219: {  // LogFileAdd  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LogFileAdd( _a0_t );
        return 1;
    }
    case 0x21a: {  // LogFileTabAdd  -> r_int
        ctx->stat = LogFileTabAdd(  );
        return 1;
    }
    case 0x21b: {  // LogFileTabSub  -> r_int
        ctx->stat = LogFileTabSub(  );
        return 1;
    }
    case 0x21c: {  // ErrorLogAdd  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = ErrorLogAdd( _a0_t );
        return 1;
    }
    case 0x21d: {  // ErrorLogTabAdd  -> r_int
        ctx->stat = ErrorLogTabAdd(  );
        return 1;
    }
    case 0x21e: {  // ErrorLogTabSub  -> r_int
        ctx->stat = ErrorLogTabSub(  );
        return 1;
    }
    case 0x21f: {  // SetUseTimeStampFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTimeStampFlag( _a0 );
        return 1;
    }
    case 0x220: {  // SetOutApplicationLogValidFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetOutApplicationLogValidFlag( _a0 );
        return 1;
    }
    case 0x221: {  // SetOutApplicationSystemLogValidFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetOutApplicationSystemLogValidFlag( _a0 );
        return 1;
    }
    case 0x222: {  // SetApplicationLogFileName  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = SetApplicationLogFileName( _a0_t );
        return 1;
    }
    case 0x223: {  // SetApplicationLogSaveDirectory  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = SetApplicationLogSaveDirectory( _a0_t );
        return 1;
    }
    case 0x224: {  // SetUseDateNameLogFile  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDateNameLogFile( _a0 );
        return 1;
    }
    case 0x225: {  // SetLogDrawOutFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLogDrawOutFlag( _a0 );
        return 1;
    }
    case 0x226: {  // GetLogDrawFlag  -> r_int
        ctx->stat = GetLogDrawFlag(  );
        return 1;
    }
    case 0x227: {  // SetLogFontSize  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLogFontSize( _a0 );
        return 1;
    }
    case 0x228: {  // SetLogFontHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLogFontHandle( _a0 );
        return 1;
    }
    case 0x229: {  // SetLogDrawArea  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLogDrawArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x22a: {  // putsDx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 1 );
        ctx->stat = putsDx( _a0_t, _a1 );
        return 1;
    }
    case 0x22b: {  // clsDx  -> r_int
        ctx->stat = clsDx(  );
        return 1;
    }
    case 0x22c: {  // setPrintColorDx  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = setPrintColorDx( _a0, _a1 );
        return 1;
    }
    case 0x22d: {  // SetUseASyncLoadFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseASyncLoadFlag( _a0 );
        return 1;
    }
    case 0x22e: {  // GetUseASyncLoadFlag  -> r_int
        ctx->stat = GetUseASyncLoadFlag(  );
        return 1;
    }
    case 0x22f: {  // CheckHandleASyncLoad  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckHandleASyncLoad( _a0 );
        return 1;
    }
    case 0x230: {  // GetHandleASyncLoadResult  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetHandleASyncLoadResult( _a0 );
        return 1;
    }
    case 0x231: {  // SetASyncLoadFinishDeleteFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetASyncLoadFinishDeleteFlag( _a0 );
        return 1;
    }
    case 0x232: {  // WaitHandleASyncLoad  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = WaitHandleASyncLoad( _a0 );
        return 1;
    }
    case 0x233: {  // WaitHandleASyncLoadAll  -> r_int
        ctx->stat = WaitHandleASyncLoadAll(  );
        return 1;
    }
    case 0x234: {  // GetASyncLoadNum  -> r_int
        ctx->stat = GetASyncLoadNum(  );
        return 1;
    }
    case 0x235: {  // SetASyncLoadThreadNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetASyncLoadThreadNum( _a0 );
        return 1;
    }
    case 0x236: {  // SetDeleteHandleFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = SetDeleteHandleFlag( _a0, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x237: {  // SetMouseDispFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMouseDispFlag( _a0 );
        return 1;
    }
    case 0x238: {  // SetMouseDispIgnoreMenuFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMouseDispIgnoreMenuFlag( _a0 );
        return 1;
    }
    case 0x239: {  // GetMousePoint  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetMousePoint( &_a0, &_a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x23a: {  // SetMousePoint  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMousePoint( _a0, _a1 );
        return 1;
    }
    case 0x23b: {  // GetMouseInput  -> r_int
        ctx->stat = GetMouseInput(  );
        return 1;
    }
    case 0x23c: {  // GetMouseWheelRotVol  -> r_int
        int _a0 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetMouseWheelRotVol( _a0 );
        return 1;
    }
    case 0x23d: {  // GetMouseHWheelRotVol  -> r_int
        int _a0 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetMouseHWheelRotVol( _a0 );
        return 1;
    }
    case 0x23e: {  // GetMouseWheelRotVolF  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 1 );
        float _ret = GetMouseWheelRotVolF( _a0 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x23f: {  // GetMouseHWheelRotVolF  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 1 );
        float _ret = GetMouseHWheelRotVolF( _a0 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x240: {  // GetMouseInputLog  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetMouseInputLog( &_a0, &_a1, &_a2, _a3 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x241: {  // GetMouseInputLog2  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetMouseInputLog2( &_a0, &_a1, &_a2, &_a3, _a4 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        return 1;
    }
    case 0x242: {  // GetTouchInputNum  -> r_int
        ctx->stat = GetTouchInputNum(  );
        return 1;
    }
    case 0x243: {  // GetTouchInput  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        float _a5 = 0.0f;
        ctx->stat = GetTouchInput( _a0, &_a1, &_a2, &_a3, &_a4, &_a5 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        double _a5_d = (double)_a5;
        code_setva( _a5_pv, _a5_ap, TYPE_DNUM, &_a5_d );
        return 1;
    }
    case 0x244: {  // GetTouchInputLogNum  -> r_int
        ctx->stat = GetTouchInputLogNum(  );
        return 1;
    }
    case 0x245: {  // ClearTouchInputLog  -> r_int
        ctx->stat = ClearTouchInputLog(  );
        return 1;
    }
    case 0x246: {  // GetTouchInputDownLogNum  -> r_int
        ctx->stat = GetTouchInputDownLogNum(  );
        return 1;
    }
    case 0x247: {  // ClearTouchInputDownLog  -> r_int
        ctx->stat = ClearTouchInputDownLog(  );
        return 1;
    }
    case 0x248: {  // GetTouchInputUpLogNum  -> r_int
        ctx->stat = GetTouchInputUpLogNum(  );
        return 1;
    }
    case 0x249: {  // ClearTouchInputUpLog  -> r_int
        ctx->stat = ClearTouchInputUpLog(  );
        return 1;
    }
    case 0x24a: {  // DxSetAllocPrintFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocPrintFlag( _a0 );
        return 1;
    }
    case 0x24b: {  // DxGetAllocNum  -> r_int
        ctx->stat = DxGetAllocNum(  );
        return 1;
    }
    case 0x24c: {  // DxErrorCheckAlloc  -> r_int
        ctx->stat = DxErrorCheckAlloc(  );
        return 1;
    }
    case 0x24d: {  // DxSetAllocSizeOutFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocSizeOutFlag( _a0 );
        return 1;
    }
    case 0x24e: {  // DxSetAllocMemoryErrorCheckFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocMemoryErrorCheckFlag( _a0 );
        return 1;
    }
    case 0x24f: {  // GetUseCharCodeFormat  -> r_int
        ctx->stat = GetUseCharCodeFormat(  );
        return 1;
    }
    case 0x250: {  // Get_wchar_t_CharCodeFormat  -> r_int
        ctx->stat = Get_wchar_t_CharCodeFormat(  );
        return 1;
    }
    case 0x251: {  // strcmpDx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = strcmpDx( _a0_t, _a1_t );
        return 1;
    }
    case 0x252: {  // stricmpDx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = stricmpDx( _a0_t, _a1_t );
        return 1;
    }
    case 0x253: {  // strncmpDx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = strncmpDx( _a0_t, _a1_t, _a2 );
        return 1;
    }
    case 0x254: {  // strncmp2Dx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = strncmp2Dx( _a0_t, _a1_t, _a2 );
        return 1;
    }
    case 0x255: {  // strpncmpDx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = strpncmpDx( _a0_t, _a1_t, _a2, _a3 );
        return 1;
    }
    case 0x256: {  // strpncmp2Dx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = strpncmp2Dx( _a0_t, _a1_t, _a2, _a3 );
        return 1;
    }
    case 0x257: {  // strstr2Dx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = strstr2Dx( _a0_t, _a1_t );
        return 1;
    }
    case 0x258: {  // strrstr2Dx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = strrstr2Dx( _a0_t, _a1_t );
        return 1;
    }
    case 0x259: {  // atoiDx  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = atoiDx( _a0_t );
        return 1;
    }
    case 0x25a: {  // atofDx  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        double _ret = atofDx( _a0_t );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x25b: {  // ClearInputCharBuf  -> r_int
        ctx->stat = ClearInputCharBuf(  );
        return 1;
    }
    case 0x25c: {  // GetOneChar  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetOneChar( _a0_t, _a1 );
        return 1;
    }
    case 0x25d: {  // GetOneCharWait  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetOneCharWait( _a0_t, _a1 );
        return 1;
    }
    case 0x25e: {  // DrawIMEInputString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawIMEInputString( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x25f: {  // DrawIMEInputExtendString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawIMEInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x260: {  // SetUseIMEFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseIMEFlag( _a0 );
        return 1;
    }
    case 0x261: {  // GetUseIMEFlag  -> r_int
        ctx->stat = GetUseIMEFlag(  );
        return 1;
    }
    case 0x262: {  // SetInputStringMaxLengthIMESync  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetInputStringMaxLengthIMESync( _a0 );
        return 1;
    }
    case 0x263: {  // SetIMEInputStringMaxLength  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetIMEInputStringMaxLength( _a0 );
        return 1;
    }
    case 0x264: {  // GetStringPoint  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetStringPoint( _a0_t, _a1 );
        return 1;
    }
    case 0x265: {  // GetStringPoint2  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetStringPoint2( _a0_t, _a1 );
        return 1;
    }
    case 0x266: {  // GetStringLength  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = GetStringLength( _a0_t );
        return 1;
    }
    case 0x267: {  // DrawObtainsString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( -1 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0xffffffff) );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a9 = (unsigned int)hsp3dx_auto_geti( (int)(0xffffffff) );
        int _a10 = hsp3dx_auto_geti( -1 );
        int _a11 = hsp3dx_auto_geti( -1 );
        PVal *_a12_pv; APTR _a12_ap;
        _a12_ap = code_getva( &_a12_pv );
        int _a12 = 0;
        ctx->stat = DrawObtainsString( _a0, _a1, _a2, _a3_t, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, &_a12 );
        code_setva( _a12_pv, _a12_ap, TYPE_INUM, &_a12 );
        return 1;
    }
    case 0x268: {  // DrawObtainsString_CharClip  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( -1 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0xffffffff) );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a9 = (unsigned int)hsp3dx_auto_geti( (int)(0xffffffff) );
        int _a10 = hsp3dx_auto_geti( -1 );
        int _a11 = hsp3dx_auto_geti( -1 );
        PVal *_a12_pv; APTR _a12_ap;
        _a12_ap = code_getva( &_a12_pv );
        int _a12 = 0;
        ctx->stat = DrawObtainsString_CharClip( _a0, _a1, _a2, _a3_t, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, &_a12 );
        code_setva( _a12_pv, _a12_ap, TYPE_INUM, &_a12 );
        return 1;
    }
    case 0x269: {  // DrawObtainsString_WordClip  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( -1 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0xffffffff) );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a9 = (unsigned int)hsp3dx_auto_geti( (int)(0xffffffff) );
        int _a10 = hsp3dx_auto_geti( -1 );
        int _a11 = hsp3dx_auto_geti( -1 );
        PVal *_a12_pv; APTR _a12_ap;
        _a12_ap = code_getva( &_a12_pv );
        int _a12 = 0;
        ctx->stat = DrawObtainsString_WordClip( _a0, _a1, _a2, _a3_t, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, &_a12 );
        code_setva( _a12_pv, _a12_ap, TYPE_INUM, &_a12 );
        return 1;
    }
    case 0x26a: {  // GetObtainsStringCharPosition  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        int _a4 = hsp3dx_auto_geti( 0 );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( -1 );
        PVal *_a8_pv; APTR _a8_ap;
        _a8_ap = code_getva( &_a8_pv );
        int _a8 = 0;
        ctx->stat = GetObtainsStringCharPosition( _a0, _a1, _a2, _a3_t, _a4, &_a5, &_a6, _a7, &_a8 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a8_pv, _a8_ap, TYPE_INUM, &_a8 );
        return 1;
    }
    case 0x26b: {  // GetObtainsStringCharPosition_CharClip  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        int _a4 = hsp3dx_auto_geti( 0 );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( -1 );
        PVal *_a8_pv; APTR _a8_ap;
        _a8_ap = code_getva( &_a8_pv );
        int _a8 = 0;
        ctx->stat = GetObtainsStringCharPosition_CharClip( _a0, _a1, _a2, _a3_t, _a4, &_a5, &_a6, _a7, &_a8 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a8_pv, _a8_ap, TYPE_INUM, &_a8 );
        return 1;
    }
    case 0x26c: {  // GetObtainsStringCharPosition_WordClip  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        int _a4 = hsp3dx_auto_geti( 0 );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( -1 );
        PVal *_a8_pv; APTR _a8_ap;
        _a8_ap = code_getva( &_a8_pv );
        int _a8 = 0;
        ctx->stat = GetObtainsStringCharPosition_WordClip( _a0, _a1, _a2, _a3_t, _a4, &_a5, &_a6, _a7, &_a8 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a8_pv, _a8_ap, TYPE_INUM, &_a8 );
        return 1;
    }
    case 0x26d: {  // DrawObtainsBox  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawObtainsBox( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x26e: {  // KeyInputNumber  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = KeyInputNumber( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x26f: {  // GetIMEInputModeStr  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = GetIMEInputModeStr( _a0_t );
        return 1;
    }
    case 0x270: {  // SetIMEInputString  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = SetIMEInputString( _a0_t );
        return 1;
    }
    case 0x271: {  // SetKeyInputStringFont  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputStringFont( _a0 );
        return 1;
    }
    case 0x272: {  // DrawKeyInputModeString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawKeyInputModeString( _a0, _a1 );
        return 1;
    }
    case 0x273: {  // InitKeyInput  -> r_int
        ctx->stat = InitKeyInput(  );
        return 1;
    }
    case 0x274: {  // DeleteKeyInput  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteKeyInput( _a0 );
        return 1;
    }
    case 0x275: {  // SetActiveKeyInput  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetActiveKeyInput( _a0 );
        return 1;
    }
    case 0x276: {  // GetActiveKeyInput  -> r_int
        ctx->stat = GetActiveKeyInput(  );
        return 1;
    }
    case 0x277: {  // CheckKeyInput  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckKeyInput( _a0 );
        return 1;
    }
    case 0x278: {  // ReStartKeyInput  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReStartKeyInput( _a0 );
        return 1;
    }
    case 0x279: {  // ProcessActKeyInput  -> r_int
        ctx->stat = ProcessActKeyInput(  );
        return 1;
    }
    case 0x27a: {  // DrawKeyInputString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawKeyInputString( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x27b: {  // DrawKeyInputExtendString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawKeyInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x27c: {  // SetKeyInputDrawArea  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputDrawArea( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x27d: {  // SetKeyInputSelectArea  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputSelectArea( _a0, _a1, _a2 );
        return 1;
    }
    case 0x27e: {  // GetKeyInputSelectArea  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputSelectArea( &_a0, &_a1, _a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x27f: {  // SetKeyInputDrawStartPos  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputDrawStartPos( _a0, _a1 );
        return 1;
    }
    case 0x280: {  // GetKeyInputDrawStartPos  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputDrawStartPos( _a0 );
        return 1;
    }
    case 0x281: {  // SetKeyInputCursorBrinkTime  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorBrinkTime( _a0 );
        return 1;
    }
    case 0x282: {  // SetKeyInputCursorBrinkFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorBrinkFlag( _a0 );
        return 1;
    }
    case 0x283: {  // SetKeyInputString  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputString( _a0_t, _a1 );
        return 1;
    }
    case 0x284: {  // SetKeyInputNumber  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputNumber( _a0, _a1 );
        return 1;
    }
    case 0x285: {  // SetKeyInputNumberToFloat  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputNumberToFloat( _a0, _a1 );
        return 1;
    }
    case 0x286: {  // GetKeyInputString  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputString( _a0_t, _a1 );
        return 1;
    }
    case 0x287: {  // GetKeyInputNumber  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputNumber( _a0 );
        return 1;
    }
    case 0x288: {  // GetKeyInputNumberToFloat  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        float _ret = GetKeyInputNumberToFloat( _a0 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x289: {  // SetKeyInputCursorPosition  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorPosition( _a0, _a1 );
        return 1;
    }
    case 0x28a: {  // GetKeyInputCursorPosition  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputCursorPosition( _a0 );
        return 1;
    }
    case 0x28b: {  // FileRead_open  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_open( _a0_t, _a1 );
        return 1;
    }
    case 0x28c: {  // FileRead_size  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        LONGLONG _ret = FileRead_size( _a0_t );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x28d: {  // FileRead_size_handle  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = FileRead_size_handle( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x28e: {  // FileRead_close  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_close( _a0 );
        return 1;
    }
    case 0x28f: {  // FileRead_tell  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = FileRead_tell( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x290: {  // FileRead_seek  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_seek( _a0, _a1, _a2 );
        return 1;
    }
    case 0x291: {  // FileRead_idle_chk  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_idle_chk( _a0 );
        return 1;
    }
    case 0x292: {  // FileRead_eof  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_eof( _a0 );
        return 1;
    }
    case 0x293: {  // FileRead_gets  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_gets( _a0_t, _a1, _a2 );
        return 1;
    }
    case 0x294: {  // FileRead_fullyLoad  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = FileRead_fullyLoad( _a0_t );
        return 1;
    }
    case 0x295: {  // FileRead_fullyLoad_delete  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_fullyLoad_delete( _a0 );
        return 1;
    }
    case 0x296: {  // FileRead_fullyLoad_getSize  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = FileRead_fullyLoad_getSize( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x297: {  // GetStreamFunctionDefault  -> r_int
        ctx->stat = GetStreamFunctionDefault(  );
        return 1;
    }
    case 0x298: {  // ConvertFullPath  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        ctx->stat = ConvertFullPath( _a0_t, _a1_t, _a2_t );
        return 1;
    }
    case 0x299: {  // CheckHitKey  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckHitKey( _a0 );
        return 1;
    }
    case 0x29a: {  // CheckHitKeyAll  -> r_int
        int _a0 = hsp3dx_auto_geti( DX_CHECKINPUT_ALL );
        ctx->stat = CheckHitKeyAll( _a0 );
        return 1;
    }
    case 0x29b: {  // GetHitKeyStateAllEx  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        ctx->stat = GetHitKeyStateAllEx( &_a0 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        return 1;
    }
    case 0x29c: {  // GetJoypadNum  -> r_int
        ctx->stat = GetJoypadNum(  );
        return 1;
    }
    case 0x29d: {  // GetJoypadButtonNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadButtonNum( _a0 );
        return 1;
    }
    case 0x29e: {  // GetJoypadInputState  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadInputState( _a0 );
        return 1;
    }
    case 0x29f: {  // GetJoypadAnalogInput  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadAnalogInput( &_a0, &_a1, _a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x2a0: {  // GetJoypadAnalogInputRight  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadAnalogInputRight( &_a0, &_a1, _a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x2a1: {  // CheckJoypadXInput  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckJoypadXInput( _a0 );
        return 1;
    }
    case 0x2a2: {  // GetJoypadType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadType( _a0 );
        return 1;
    }
    case 0x2a3: {  // SetJoypadInputToKeyInput  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetJoypadInputToKeyInput( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x2a4: {  // SetJoypadDeadZone  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetJoypadDeadZone( _a0, _a1 );
        return 1;
    }
    case 0x2a5: {  // GetJoypadDeadZone  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        double _ret = GetJoypadDeadZone( _a0 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x2a6: {  // SetJoypadDefaultDeadZoneAll  -> r_int
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetJoypadDefaultDeadZoneAll( _a0 );
        return 1;
    }
    case 0x2a7: {  // GetJoypadDefaultDeadZoneAll  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetJoypadDefaultDeadZoneAll(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x2a8: {  // StartJoypadVibration  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        ctx->stat = StartJoypadVibration( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x2a9: {  // StopJoypadVibration  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = StopJoypadVibration( _a0, _a1 );
        return 1;
    }
    case 0x2aa: {  // GetJoypadPOVState  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadPOVState( _a0, _a1 );
        return 1;
    }
    case 0x2ab: {  // ReSetupJoypad  -> r_int
        ctx->stat = ReSetupJoypad(  );
        return 1;
    }
    case 0x2ac: {  // ReSetupInputSystem  -> r_int
        ctx->stat = ReSetupInputSystem(  );
        return 1;
    }
    case 0x2ad: {  // SetUseJoypadVibrationFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseJoypadVibrationFlag( _a0 );
        return 1;
    }
    case 0x2ae: {  // MakeGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2af: {  // MakeScreen  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeScreen( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2b0: {  // DerivationGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DerivationGraph( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2b1: {  // DerivationGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DerivationGraphF( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2b2: {  // DeleteGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteGraph( _a0 );
        return 1;
    }
    case 0x2b3: {  // DeleteSharingGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSharingGraph( _a0 );
        return 1;
    }
    case 0x2b4: {  // GetGraphNum  -> r_int
        ctx->stat = GetGraphNum(  );
        return 1;
    }
    case 0x2b5: {  // FillGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 255 );
        ctx->stat = FillGraph( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2b6: {  // FillRectGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 255 );
        ctx->stat = FillRectGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x2b7: {  // SetGraphLostFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = SetGraphLostFlag( _a0, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x2b8: {  // InitGraph  -> r_int
        ctx->stat = InitGraph(  );
        return 1;
    }
    case 0x2b9: {  // ReloadFileGraphAll  -> r_int
        ctx->stat = ReloadFileGraphAll(  );
        return 1;
    }
    case 0x2ba: {  // MakeShadowMap  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x2bb: {  // DeleteShadowMap  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShadowMap( _a0 );
        return 1;
    }
    case 0x2bc: {  // SetShadowMapLightDirection  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetShadowMapLightDirection( _a0, _a1 );
        return 1;
    }
    case 0x2bd: {  // ShadowMap_DrawSetup  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ShadowMap_DrawSetup( _a0 );
        return 1;
    }
    case 0x2be: {  // ShadowMap_DrawEnd  -> r_int
        ctx->stat = ShadowMap_DrawEnd(  );
        return 1;
    }
    case 0x2bf: {  // SetUseShadowMap  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x2c0: {  // SetShadowMapDrawArea  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetShadowMapDrawArea( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2c1: {  // ResetShadowMapDrawArea  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetShadowMapDrawArea( _a0 );
        return 1;
    }
    case 0x2c2: {  // SetShadowMapAdjustDepth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetShadowMapAdjustDepth( _a0, _a1 );
        return 1;
    }
    case 0x2c3: {  // GetShadowMapViewProjectionMatrix  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = GetShadowMapViewProjectionMatrix( _a0, _a1 );
        return 1;
    }
    case 0x2c4: {  // TestDrawShadowMap  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = TestDrawShadowMap( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2c5: {  // LoadBmpToGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( DX_MOVIESURFACE_NORMAL );
        ctx->stat = LoadBmpToGraph( _a0_t, _a1, _a2, _a3 );
        return 1;
    }
    case 0x2c6: {  // LoadGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadGraph( _a0_t, _a1 );
        return 1;
    }
    case 0x2c7: {  // LoadReverseGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadReverseGraph( _a0_t, _a1 );
        return 1;
    }
    case 0x2c8: {  // LoadDivGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadDivGraph( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2c9: {  // LoadDivGraphF  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        float _a8 = (float)hsp3dx_auto_getd( 0 );
        float _a9 = (float)hsp3dx_auto_getd( 0 );
        ctx->stat = LoadDivGraphF( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2ca: {  // LoadDivBmpToGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadDivBmpToGraph( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9, _a10 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2cb: {  // LoadDivBmpToGraphF  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        float _a9 = (float)hsp3dx_auto_getd( 0 );
        float _a10 = (float)hsp3dx_auto_getd( 0 );
        ctx->stat = LoadDivBmpToGraphF( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9, _a10 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2cc: {  // LoadReverseDivGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadReverseDivGraph( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2cd: {  // LoadReverseDivGraphF  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        float _a8 = (float)hsp3dx_auto_getd( 0 );
        float _a9 = (float)hsp3dx_auto_getd( 0 );
        ctx->stat = LoadReverseDivGraphF( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2ce: {  // LoadBlendGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadBlendGraph( _a0_t );
        return 1;
    }
    case 0x2cf: {  // CreateBlendGraphFromSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateBlendGraphFromSoftImage( _a0 );
        return 1;
    }
    case 0x2d0: {  // CreateGraphFromSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateGraphFromSoftImage( _a0 );
        return 1;
    }
    case 0x2d1: {  // CreateGraphFromRectSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2d2: {  // ReCreateGraphFromSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReCreateGraphFromSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x2d3: {  // ReCreateGraphFromRectSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReCreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x2d4: {  // CreateDivGraphFromSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = CreateDivGraphFromSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2d5: {  // CreateDivGraphFFromSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = CreateDivGraphFFromSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2d6: {  // ReCreateDivGraphFromSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = ReCreateDivGraphFromSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2d7: {  // ReCreateDivGraphFFromSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = ReCreateDivGraphFFromSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2d8: {  // ReloadGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadGraph( _a0_t, _a1, _a2 );
        return 1;
    }
    case 0x2d9: {  // ReloadDivGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadDivGraph( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6, _a7 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2da: {  // ReloadDivGraphF  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadDivGraphF( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6, _a7 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2db: {  // ReloadReverseGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadReverseGraph( _a0_t, _a1 );
        return 1;
    }
    case 0x2dc: {  // ReloadReverseDivGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = ReloadReverseDivGraph( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2dd: {  // ReloadReverseDivGraphF  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = ReloadReverseDivGraphF( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2de: {  // SetGraphColorBitDepth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphColorBitDepth( _a0 );
        return 1;
    }
    case 0x2df: {  // GetGraphColorBitDepth  -> r_int
        ctx->stat = GetGraphColorBitDepth(  );
        return 1;
    }
    case 0x2e0: {  // SetCreateGraphColorBitDepth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphColorBitDepth( _a0 );
        return 1;
    }
    case 0x2e1: {  // GetCreateGraphColorBitDepth  -> r_int
        ctx->stat = GetCreateGraphColorBitDepth(  );
        return 1;
    }
    case 0x2e2: {  // SetCreateGraphChannelBitDepth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphChannelBitDepth( _a0 );
        return 1;
    }
    case 0x2e3: {  // GetCreateGraphChannelBitDepth  -> r_int
        ctx->stat = GetCreateGraphChannelBitDepth(  );
        return 1;
    }
    case 0x2e4: {  // SetCreateGraphInitGraphDelete  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphInitGraphDelete( _a0 );
        return 1;
    }
    case 0x2e5: {  // GetCreateGraphInitGraphDelete  -> r_int
        ctx->stat = GetCreateGraphInitGraphDelete(  );
        return 1;
    }
    case 0x2e6: {  // SetCreateGraphHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphHandle( _a0 );
        return 1;
    }
    case 0x2e7: {  // GetCreateGraphHandle  -> r_int
        ctx->stat = GetCreateGraphHandle(  );
        return 1;
    }
    case 0x2e8: {  // SetCreateDivGraphHandle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDivGraphHandle( &_a0, _a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        return 1;
    }
    case 0x2e9: {  // GetCreateDivGraphHandle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        ctx->stat = GetCreateDivGraphHandle( &_a0 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        return 1;
    }
    case 0x2ea: {  // SetDrawValidGraphCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2eb: {  // GetDrawValidGraphCreateFlag  -> r_int
        ctx->stat = GetDrawValidGraphCreateFlag(  );
        return 1;
    }
    case 0x2ec: {  // SetDrawValidFlagOf3DGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidFlagOf3DGraph( _a0 );
        return 1;
    }
    case 0x2ed: {  // SetLeftUpColorIsTransColorFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLeftUpColorIsTransColorFlag( _a0 );
        return 1;
    }
    case 0x2ee: {  // SetUsePaletteGraphFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePaletteGraphFlag( _a0 );
        return 1;
    }
    case 0x2ef: {  // SetUseBlendGraphCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseBlendGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2f0: {  // GetUseBlendGraphCreateFlag  -> r_int
        ctx->stat = GetUseBlendGraphCreateFlag(  );
        return 1;
    }
    case 0x2f1: {  // SetUseAlphaTestGraphCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaTestGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2f2: {  // GetUseAlphaTestGraphCreateFlag  -> r_int
        ctx->stat = GetUseAlphaTestGraphCreateFlag(  );
        return 1;
    }
    case 0x2f3: {  // SetUseAlphaTestFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaTestFlag( _a0 );
        return 1;
    }
    case 0x2f4: {  // GetUseAlphaTestFlag  -> r_int
        ctx->stat = GetUseAlphaTestFlag(  );
        return 1;
    }
    case 0x2f5: {  // SetCubeMapTextureCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCubeMapTextureCreateFlag( _a0 );
        return 1;
    }
    case 0x2f6: {  // GetCubeMapTextureCreateFlag  -> r_int
        ctx->stat = GetCubeMapTextureCreateFlag(  );
        return 1;
    }
    case 0x2f7: {  // SetUseNoBlendModeParam  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNoBlendModeParam( _a0 );
        return 1;
    }
    case 0x2f8: {  // SetDrawValidAlphaChannelGraphCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidAlphaChannelGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2f9: {  // GetDrawValidAlphaChannelGraphCreateFlag  -> r_int
        ctx->stat = GetDrawValidAlphaChannelGraphCreateFlag(  );
        return 1;
    }
    case 0x2fa: {  // SetDrawValidFloatTypeGraphCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidFloatTypeGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2fb: {  // GetDrawValidFloatTypeGraphCreateFlag  -> r_int
        ctx->stat = GetDrawValidFloatTypeGraphCreateFlag(  );
        return 1;
    }
    case 0x2fc: {  // SetDrawValidGraphCreateZBufferFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidGraphCreateZBufferFlag( _a0 );
        return 1;
    }
    case 0x2fd: {  // GetDrawValidGraphCreateZBufferFlag  -> r_int
        ctx->stat = GetDrawValidGraphCreateZBufferFlag(  );
        return 1;
    }
    case 0x2fe: {  // SetCreateDrawValidGraphZBufferBitDepth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphZBufferBitDepth( _a0 );
        return 1;
    }
    case 0x2ff: {  // GetCreateDrawValidGraphZBufferBitDepth  -> r_int
        ctx->stat = GetCreateDrawValidGraphZBufferBitDepth(  );
        return 1;
    }
    case 0x300: {  // SetCreateDrawValidGraphMipLevels  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphMipLevels( _a0 );
        return 1;
    }
    case 0x301: {  // GetCreateDrawValidGraphMipLevels  -> r_int
        ctx->stat = GetCreateDrawValidGraphMipLevels(  );
        return 1;
    }
    case 0x302: {  // SetCreateDrawValidGraphChannelNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphChannelNum( _a0 );
        return 1;
    }
    case 0x303: {  // GetCreateDrawValidGraphChannelNum  -> r_int
        ctx->stat = GetCreateDrawValidGraphChannelNum(  );
        return 1;
    }
    case 0x304: {  // SetCreateDrawValidGraphMultiSample  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphMultiSample( _a0, _a1 );
        return 1;
    }
    case 0x305: {  // SetDrawValidMultiSample  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidMultiSample( _a0, _a1 );
        return 1;
    }
    case 0x306: {  // GetMultiSampleQuality  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMultiSampleQuality( _a0 );
        return 1;
    }
    case 0x307: {  // SetUseTransColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTransColor( _a0 );
        return 1;
    }
    case 0x308: {  // SetUseTransColorGraphCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTransColorGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x309: {  // SetUseGraphAlphaChannel  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGraphAlphaChannel( _a0 );
        return 1;
    }
    case 0x30a: {  // GetUseGraphAlphaChannel  -> r_int
        ctx->stat = GetUseGraphAlphaChannel(  );
        return 1;
    }
    case 0x30b: {  // SetUseAlphaChannelGraphCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaChannelGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x30c: {  // GetUseAlphaChannelGraphCreateFlag  -> r_int
        ctx->stat = GetUseAlphaChannelGraphCreateFlag(  );
        return 1;
    }
    case 0x30d: {  // SetUseNotManageTextureFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNotManageTextureFlag( _a0 );
        return 1;
    }
    case 0x30e: {  // GetUseNotManageTextureFlag  -> r_int
        ctx->stat = GetUseNotManageTextureFlag(  );
        return 1;
    }
    case 0x30f: {  // SetUsePlatformTextureFormat  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePlatformTextureFormat( _a0 );
        return 1;
    }
    case 0x310: {  // GetUsePlatformTextureFormat  -> r_int
        ctx->stat = GetUsePlatformTextureFormat(  );
        return 1;
    }
    case 0x311: {  // SetTransColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetTransColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x312: {  // GetTransColor  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetTransColor( &_a0, &_a1, &_a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x313: {  // SetUseDivGraphFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDivGraphFlag( _a0 );
        return 1;
    }
    case 0x314: {  // SetUseAlphaImageLoadFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaImageLoadFlag( _a0 );
        return 1;
    }
    case 0x315: {  // SetUseMaxTextureSize  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseMaxTextureSize( _a0 );
        return 1;
    }
    case 0x316: {  // SetUseGraphBaseDataBackup  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGraphBaseDataBackup( _a0 );
        return 1;
    }
    case 0x317: {  // GetUseGraphBaseDataBackup  -> r_int
        ctx->stat = GetUseGraphBaseDataBackup(  );
        return 1;
    }
    case 0x318: {  // SetUseSystemMemGraphCreateFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSystemMemGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x319: {  // GetUseSystemMemGraphCreateFlag  -> r_int
        ctx->stat = GetUseSystemMemGraphCreateFlag(  );
        return 1;
    }
    case 0x31a: {  // SetUseLoadDivGraphSizeCheckFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLoadDivGraphSizeCheckFlag( _a0 );
        return 1;
    }
    case 0x31b: {  // GetUseLoadDivGraphSizeCheckFlag  -> r_int
        ctx->stat = GetUseLoadDivGraphSizeCheckFlag(  );
        return 1;
    }
    case 0x31c: {  // GraphUnLock  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GraphUnLock( _a0 );
        return 1;
    }
    case 0x31d: {  // SetUseGraphZBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetUseGraphZBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x31e: {  // CopyGraphZBufferImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = CopyGraphZBufferImage( _a0, _a1 );
        return 1;
    }
    case 0x31f: {  // SetDeviceLostDeleteGraphFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDeviceLostDeleteGraphFlag( _a0, _a1 );
        return 1;
    }
    case 0x320: {  // GetGraphSize  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetGraphSize( _a0, &_a1, &_a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x321: {  // GetGraphSizeF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        ctx->stat = GetGraphSizeF( _a0, &_a1, &_a2 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        return 1;
    }
    case 0x322: {  // GetGraphTextureSize  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetGraphTextureSize( _a0, &_a1, &_a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x323: {  // GetGraphUseBaseGraphArea  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        ctx->stat = GetGraphUseBaseGraphArea( _a0, &_a1, &_a2, &_a3, &_a4 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        return 1;
    }
    case 0x324: {  // GetGraphMipmapCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetGraphMipmapCount( _a0 );
        return 1;
    }
    case 0x325: {  // GetGraphFilePath  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = GetGraphFilePath( _a0, _a1_t );
        return 1;
    }
    case 0x326: {  // CheckDrawValidGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckDrawValidGraph( _a0 );
        return 1;
    }
    case 0x327: {  // GetMaxGraphTextureSize  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetMaxGraphTextureSize( &_a0, &_a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x328: {  // GetValidRestoreShredPoint  -> r_int
        ctx->stat = GetValidRestoreShredPoint(  );
        return 1;
    }
    case 0x329: {  // GetGraphPalette  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        ctx->stat = GetGraphPalette( _a0, _a1, &_a2, &_a3, &_a4 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        return 1;
    }
    case 0x32a: {  // GetGraphOriginalPalette  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        ctx->stat = GetGraphOriginalPalette( _a0, _a1, &_a2, &_a3, &_a4 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        return 1;
    }
    case 0x32b: {  // SetGraphPalette  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        unsigned int _a2 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = SetGraphPalette( _a0, _a1, _a2 );
        return 1;
    }
    case 0x32c: {  // ResetGraphPalette  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetGraphPalette( _a0 );
        return 1;
    }
    case 0x32d: {  // DrawLine  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawLine( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x32e: {  // DrawLineAA  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        float _a5 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = DrawLineAA( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x32f: {  // DrawBox  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawBox( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x330: {  // DrawBoxAA  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        float _a6 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = DrawBoxAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x331: {  // DrawFillBox  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawFillBox( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x332: {  // DrawLineBox  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawLineBox( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x333: {  // DrawCircle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 1 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawCircle( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x334: {  // DrawCircleAA  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 1 );
        float _a6 = (float)hsp3dx_auto_getd( 1.0 );
        double _a7 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = DrawCircleAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x335: {  // DrawOval  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawOval( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x336: {  // DrawOvalAA  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        float _a7 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = DrawOvalAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x337: {  // DrawOval_Rect  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawOval_Rect( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x338: {  // DrawTriangle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTriangle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x339: {  // DrawTriangleAA  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a7 = hsp3dx_auto_geti( 0 );
        float _a8 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = DrawTriangleAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x33a: {  // DrawQuadrangle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawQuadrangle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x33b: {  // DrawQuadrangleAA  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a9 = hsp3dx_auto_geti( 0 );
        float _a10 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = DrawQuadrangleAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        return 1;
    }
    case 0x33c: {  // DrawRoundRect  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRoundRect( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x33d: {  // DrawRoundRectAA  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a8 = hsp3dx_auto_geti( 0 );
        float _a9 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = DrawRoundRectAA( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x33e: {  // BeginAADraw  -> r_int
        ctx->stat = BeginAADraw(  );
        return 1;
    }
    case 0x33f: {  // EndAADraw  -> r_int
        ctx->stat = EndAADraw(  );
        return 1;
    }
    case 0x340: {  // DrawPixel  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        unsigned int _a2 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawPixel( _a0, _a1, _a2 );
        return 1;
    }
    case 0x341: {  // DrawPixel3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        unsigned int _a1 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawPixel3D( _a0, _a1 );
        return 1;
    }
    case 0x342: {  // DrawPixel3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        unsigned int _a1 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawPixel3DD( _a0, _a1 );
        return 1;
    }
    case 0x343: {  // DrawLine3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        unsigned int _a2 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawLine3D( _a0, _a1, _a2 );
        return 1;
    }
    case 0x344: {  // DrawLine3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        unsigned int _a2 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawLine3DD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x345: {  // DrawTriangle3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTriangle3D( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x346: {  // DrawTriangle3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTriangle3DD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x347: {  // DrawCube3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        unsigned int _a2 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCube3D( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x348: {  // DrawCube3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        unsigned int _a2 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCube3DD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x349: {  // DrawSphere3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawSphere3D( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x34a: {  // DrawSphere3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawSphere3DD( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x34b: {  // DrawCapsule3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCapsule3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x34c: {  // DrawCapsule3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCapsule3DD( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x34d: {  // DrawCylinder3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCylinder3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x34e: {  // DrawCylinder3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCylinder3DD( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x34f: {  // DrawTube3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTube3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x350: {  // DrawTube3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTube3DD( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x351: {  // DrawCone3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCone3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x352: {  // DrawCone3DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCone3DD( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x353: {  // LoadGraphScreen  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadGraphScreen( _a0, _a1, _a2_t, _a3 );
        return 1;
    }
    case 0x354: {  // DrawGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraph( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x355: {  // DrawExtendGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x356: {  // DrawRotaGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x357: {  // DrawRotaGraph2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraph2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x358: {  // DrawRotaGraph3  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraph3( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        return 1;
    }
    case 0x359: {  // DrawRotaGraphFast  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraphFast( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x35a: {  // DrawRotaGraphFast2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraphFast2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x35b: {  // DrawRotaGraphFast3  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraphFast3( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        return 1;
    }
    case 0x35c: {  // DrawModiGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawModiGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x35d: {  // DrawTurnGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTurnGraph( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x35e: {  // DrawReverseGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawReverseGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x35f: {  // DrawGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraphF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x360: {  // DrawExtendGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x361: {  // DrawRotaGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x362: {  // DrawRotaGraph2F  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraph2F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x363: {  // DrawRotaGraph3F  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraph3F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        return 1;
    }
    case 0x364: {  // DrawRotaGraphFastF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraphFastF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x365: {  // DrawRotaGraphFast2F  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraphFast2F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x366: {  // DrawRotaGraphFast3F  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraphFast3F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        return 1;
    }
    case 0x367: {  // DrawModiGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawModiGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x368: {  // DrawTurnGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTurnGraphF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x369: {  // DrawReverseGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawReverseGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x36a: {  // DrawChipMap  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        PVal *_a7_pv; APTR _a7_ap;
        _a7_ap = code_getva( &_a7_pv );
        int _a7 = 0;
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawChipMap( _a0, _a1, _a2, _a3, &_a4, _a5, _a6, &_a7, _a8 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a7_pv, _a7_ap, TYPE_INUM, &_a7 );
        return 1;
    }
    case 0x36b: {  // DrawChipMap2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        int _a3 = hsp3dx_auto_geti( 0 );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawChipMap2( _a0, _a1, &_a2, _a3, &_a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        return 1;
    }
    case 0x36c: {  // DrawTile  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        double _a7 = hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTile( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x36d: {  // DrawRectGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x36e: {  // DrawRectExtendGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectExtendGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x36f: {  // DrawRectRotaGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        double _a7 = hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        return 1;
    }
    case 0x370: {  // DrawRectRotaGraph2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        double _a8 = hsp3dx_auto_getd( 0.0 );
        double _a9 = hsp3dx_auto_getd( 0.0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraph2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        return 1;
    }
    case 0x371: {  // DrawRectRotaGraph3  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        double _a8 = hsp3dx_auto_getd( 0.0 );
        double _a9 = hsp3dx_auto_getd( 0.0 );
        double _a10 = hsp3dx_auto_getd( 0.0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        int _a14 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraph3( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13, _a14 );
        return 1;
    }
    case 0x372: {  // DrawRectRotaGraphFast  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraphFast( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        return 1;
    }
    case 0x373: {  // DrawRectRotaGraphFast2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        float _a8 = (float)hsp3dx_auto_getd( 0.0 );
        float _a9 = (float)hsp3dx_auto_getd( 0.0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraphFast2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        return 1;
    }
    case 0x374: {  // DrawRectRotaGraphFast3  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        float _a8 = (float)hsp3dx_auto_getd( 0.0 );
        float _a9 = (float)hsp3dx_auto_getd( 0.0 );
        float _a10 = (float)hsp3dx_auto_getd( 0.0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        int _a14 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraphFast3( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13, _a14 );
        return 1;
    }
    case 0x375: {  // DrawRectModiGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectModiGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        return 1;
    }
    case 0x376: {  // DrawRectGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x377: {  // DrawRectGraphF2  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectGraphF2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x378: {  // DrawRectExtendGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectExtendGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x379: {  // DrawRectExtendGraphF2  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectExtendGraphF2( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x37a: {  // DrawRectRotaGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        double _a7 = hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        return 1;
    }
    case 0x37b: {  // DrawRectRotaGraph2F  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        double _a8 = hsp3dx_auto_getd( 0.0 );
        double _a9 = hsp3dx_auto_getd( 0.0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraph2F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        return 1;
    }
    case 0x37c: {  // DrawRectRotaGraph3F  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        double _a8 = hsp3dx_auto_getd( 0.0 );
        double _a9 = hsp3dx_auto_getd( 0.0 );
        double _a10 = hsp3dx_auto_getd( 0.0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        int _a14 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraph3F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13, _a14 );
        return 1;
    }
    case 0x37d: {  // DrawRectRotaGraphFastF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraphFastF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        return 1;
    }
    case 0x37e: {  // DrawRectRotaGraphFast2F  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        float _a8 = (float)hsp3dx_auto_getd( 0.0 );
        float _a9 = (float)hsp3dx_auto_getd( 0.0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraphFast2F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        return 1;
    }
    case 0x37f: {  // DrawRectRotaGraphFast3F  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        float _a8 = (float)hsp3dx_auto_getd( 0.0 );
        float _a9 = (float)hsp3dx_auto_getd( 0.0 );
        float _a10 = (float)hsp3dx_auto_getd( 0.0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        int _a14 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectRotaGraphFast3F( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13, _a14 );
        return 1;
    }
    case 0x380: {  // DrawRectModiGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        int _a12 = hsp3dx_auto_geti( 0 );
        int _a13 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRectModiGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12, _a13 );
        return 1;
    }
    case 0x381: {  // DrawBlendGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawBlendGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x382: {  // DrawBlendGraphF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawBlendGraphF( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x383: {  // DrawBlendGraphPos  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawBlendGraphPos( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x384: {  // DrawCircleGauge  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 1.0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCircleGauge( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x385: {  // DrawCircleGaugeF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 1.0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawCircleGaugeF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x386: {  // DrawPolygon3D_UseVertexBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygon3D_UseVertexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x387: {  // DrawPolygonIndexed3D_UseVertexBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygonIndexed3D_UseVertexBuffer( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x388: {  // DrawGraph3D  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraph3D( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x389: {  // DrawExtendGraph3D  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendGraph3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x38a: {  // DrawRotaGraph3D  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRotaGraph3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x38b: {  // DrawRota2Graph3D  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        double _a7 = hsp3dx_auto_getd( 0.0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawRota2Graph3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        return 1;
    }
    case 0x38c: {  // DrawModiBillboard3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        float _a8 = (float)hsp3dx_auto_getd( 0.0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawModiBillboard3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10 );
        return 1;
    }
    case 0x38d: {  // DrawBillboard3D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawBillboard3D( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x38e: {  // SetDrawMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawMode( _a0 );
        return 1;
    }
    case 0x38f: {  // GetDrawMode  -> r_int
        ctx->stat = GetDrawMode(  );
        return 1;
    }
    case 0x390: {  // SetDrawBlendMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawBlendMode( _a0, _a1 );
        return 1;
    }
    case 0x391: {  // GetDrawBlendMode  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetDrawBlendMode( &_a0, &_a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x392: {  // GetDrawCustomBlendMode  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        PVal *_a7_pv; APTR _a7_ap;
        _a7_ap = code_getva( &_a7_pv );
        int _a7 = 0;
        ctx->stat = GetDrawCustomBlendMode( &_a0, &_a1, &_a2, &_a3, &_a4, &_a5, &_a6, &_a7 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a7_pv, _a7_ap, TYPE_INUM, &_a7 );
        return 1;
    }
    case 0x393: {  // SetDrawAlphaTest  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawAlphaTest( _a0, _a1 );
        return 1;
    }
    case 0x394: {  // GetDrawAlphaTest  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetDrawAlphaTest( &_a0, &_a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x395: {  // SetBlendGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBlendGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x396: {  // SetBlendGraphPosition  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBlendGraphPosition( _a0, _a1 );
        return 1;
    }
    case 0x397: {  // SetDrawBright  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawBright( _a0, _a1, _a2 );
        return 1;
    }
    case 0x398: {  // GetDrawBright  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetDrawBright( &_a0, &_a1, &_a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x399: {  // SetDrawAddColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawAddColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x39a: {  // GetDrawAddColor  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetDrawAddColor( &_a0, &_a1, &_a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x39b: {  // SetWriteAlphaChannelFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteAlphaChannelFlag( _a0 );
        return 1;
    }
    case 0x39c: {  // GetWriteAlphaChannelFlag  -> r_int
        ctx->stat = GetWriteAlphaChannelFlag(  );
        return 1;
    }
    case 0x39d: {  // CheckSeparateAlphaBlendEnable  -> r_int
        ctx->stat = CheckSeparateAlphaBlendEnable(  );
        return 1;
    }
    case 0x39e: {  // SetIgnoreDrawGraphColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetIgnoreDrawGraphColor( _a0 );
        return 1;
    }
    case 0x39f: {  // GetIgnoreDrawGraphColor  -> r_int
        ctx->stat = GetIgnoreDrawGraphColor(  );
        return 1;
    }
    case 0x3a0: {  // SetMaxAnisotropy  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaxAnisotropy( _a0 );
        return 1;
    }
    case 0x3a1: {  // GetMaxAnisotropy  -> r_int
        ctx->stat = GetMaxAnisotropy(  );
        return 1;
    }
    case 0x3a2: {  // SetUseLarge3DPositionSupport  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLarge3DPositionSupport( _a0 );
        return 1;
    }
    case 0x3a3: {  // SetUseZBufferFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseZBufferFlag( _a0 );
        return 1;
    }
    case 0x3a4: {  // SetWriteZBufferFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteZBufferFlag( _a0 );
        return 1;
    }
    case 0x3a5: {  // SetZBias  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBias( _a0 );
        return 1;
    }
    case 0x3a6: {  // SetUseZBuffer3D  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseZBuffer3D( _a0 );
        return 1;
    }
    case 0x3a7: {  // SetWriteZBuffer3D  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteZBuffer3D( _a0 );
        return 1;
    }
    case 0x3a8: {  // SetZBias3D  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBias3D( _a0 );
        return 1;
    }
    case 0x3a9: {  // SetDrawZ  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetDrawZ( _a0 );
        return 1;
    }
    case 0x3aa: {  // SetUseReversedZ  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseReversedZ( _a0 );
        return 1;
    }
    case 0x3ab: {  // SetDrawArea  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3ac: {  // SetDrawAreaFull  -> r_int
        ctx->stat = SetDrawAreaFull(  );
        return 1;
    }
    case 0x3ad: {  // SetDraw3DScale  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetDraw3DScale( _a0 );
        return 1;
    }
    case 0x3ae: {  // RunRestoreShred  -> r_int
        ctx->stat = RunRestoreShred(  );
        return 1;
    }
    case 0x3af: {  // SetTransformTo2D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformTo2D( _a0 );
        return 1;
    }
    case 0x3b0: {  // SetTransformTo2DD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformTo2DD( _a0 );
        return 1;
    }
    case 0x3b1: {  // ResetTransformTo2D  -> r_int
        ctx->stat = ResetTransformTo2D(  );
        return 1;
    }
    case 0x3b2: {  // SetTransformToWorld  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToWorld( _a0 );
        return 1;
    }
    case 0x3b3: {  // SetTransformToWorldD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToWorldD( _a0 );
        return 1;
    }
    case 0x3b4: {  // GetTransformToWorldMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToWorldMatrix( _a0 );
        return 1;
    }
    case 0x3b5: {  // GetTransformToWorldMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToWorldMatrixD( _a0 );
        return 1;
    }
    case 0x3b6: {  // SetTransformToView  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToView( _a0 );
        return 1;
    }
    case 0x3b7: {  // SetTransformToViewD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToViewD( _a0 );
        return 1;
    }
    case 0x3b8: {  // GetTransformToViewMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToViewMatrix( _a0 );
        return 1;
    }
    case 0x3b9: {  // GetTransformToViewMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToViewMatrixD( _a0 );
        return 1;
    }
    case 0x3ba: {  // SetTransformToProjection  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToProjection( _a0 );
        return 1;
    }
    case 0x3bb: {  // SetTransformToProjectionD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToProjectionD( _a0 );
        return 1;
    }
    case 0x3bc: {  // GetTransformToProjectionMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToProjectionMatrix( _a0 );
        return 1;
    }
    case 0x3bd: {  // GetTransformToProjectionMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToProjectionMatrixD( _a0 );
        return 1;
    }
    case 0x3be: {  // SetTransformToViewport  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToViewport( _a0 );
        return 1;
    }
    case 0x3bf: {  // SetTransformToViewportD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToViewportD( _a0 );
        return 1;
    }
    case 0x3c0: {  // GetTransformToViewportMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToViewportMatrix( _a0 );
        return 1;
    }
    case 0x3c1: {  // GetTransformToViewportMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToViewportMatrixD( _a0 );
        return 1;
    }
    case 0x3c2: {  // GetTransformToAPIViewportMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToAPIViewportMatrix( _a0 );
        return 1;
    }
    case 0x3c3: {  // GetTransformToAPIViewportMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToAPIViewportMatrixD( _a0 );
        return 1;
    }
    case 0x3c4: {  // SetDefTransformMatrix  -> r_int
        ctx->stat = SetDefTransformMatrix(  );
        return 1;
    }
    case 0x3c5: {  // GetTransformPosition  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        ctx->stat = GetTransformPosition( _a0, &_a1, &_a2 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        return 1;
    }
    case 0x3c6: {  // GetTransformPositionD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        double _a2 = 0.0;
        ctx->stat = GetTransformPositionD( _a0, &_a1, &_a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2 );
        return 1;
    }
    case 0x3c7: {  // GetBillboardPixelSize  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _ret = GetBillboardPixelSize( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x3c8: {  // GetBillboardPixelSizeD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _ret = GetBillboardPixelSizeD( _a0, _a1 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x3c9: {  // ConvWorldPosToViewPos  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        VECTOR _ret = ConvWorldPosToViewPos( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x3ca: {  // ConvWorldPosToViewPosD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        VECTOR_D _ret = ConvWorldPosToViewPosD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x3cb: {  // ConvWorldPosToScreenPos  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        VECTOR _ret = ConvWorldPosToScreenPos( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x3cc: {  // ConvWorldPosToScreenPosD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        VECTOR_D _ret = ConvWorldPosToScreenPosD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x3cd: {  // ConvWorldPosToScreenPosPlusW  -> r_FLOAT4
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        FLOAT4 _ret = ConvWorldPosToScreenPosPlusW( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(FLOAT4) );
        return 1;
    }
    case 0x3ce: {  // ConvScreenPosToWorldPos  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        VECTOR _ret = ConvScreenPosToWorldPos( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x3cf: {  // ConvScreenPosToWorldPosD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        VECTOR_D _ret = ConvScreenPosToWorldPosD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x3d0: {  // ConvScreenPosToWorldPos_ZLinear  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        VECTOR _ret = ConvScreenPosToWorldPos_ZLinear( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x3d1: {  // ConvScreenPosToWorldPos_ZLinearD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        VECTOR_D _ret = ConvScreenPosToWorldPos_ZLinearD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x3d2: {  // SetUseCullingFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseCullingFlag( _a0 );
        return 1;
    }
    case 0x3d3: {  // GetUseBackCulling  -> r_int
        ctx->stat = GetUseBackCulling(  );
        return 1;
    }
    case 0x3d4: {  // SetUseRightHandClippingProcess  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseRightHandClippingProcess( _a0 );
        return 1;
    }
    case 0x3d5: {  // GetUseRightHandClippingProcess  -> r_int
        ctx->stat = GetUseRightHandClippingProcess(  );
        return 1;
    }
    case 0x3d6: {  // SetTextureAddressModeUV  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetTextureAddressModeUV( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3d7: {  // SetTextureAddressTransform  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetTextureAddressTransform( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x3d8: {  // SetTextureAddressTransformMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetTextureAddressTransformMatrix( _a0 );
        return 1;
    }
    case 0x3d9: {  // ResetTextureAddressTransform  -> r_int
        ctx->stat = ResetTextureAddressTransform(  );
        return 1;
    }
    case 0x3da: {  // SetFogEnable  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFogEnable( _a0 );
        return 1;
    }
    case 0x3db: {  // GetFogEnable  -> r_int
        ctx->stat = GetFogEnable(  );
        return 1;
    }
    case 0x3dc: {  // GetFogMode  -> r_int
        ctx->stat = GetFogMode(  );
        return 1;
    }
    case 0x3dd: {  // SetFogColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFogColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3de: {  // GetFogColor  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetFogColor( &_a0, &_a1, &_a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x3df: {  // SetFogStartEnd  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetFogStartEnd( _a0, _a1 );
        return 1;
    }
    case 0x3e0: {  // GetFogStartEnd  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        float _a0 = 0.0f;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        ctx->stat = GetFogStartEnd( &_a0, &_a1 );
        double _a0_d = (double)_a0;
        code_setva( _a0_pv, _a0_ap, TYPE_DNUM, &_a0_d );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        return 1;
    }
    case 0x3e1: {  // SetFogDensity  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetFogDensity( _a0 );
        return 1;
    }
    case 0x3e2: {  // GetFogDensity  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetFogDensity(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x3e3: {  // SetVerticalFogEnable  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVerticalFogEnable( _a0 );
        return 1;
    }
    case 0x3e4: {  // GetVerticalFogEnable  -> r_int
        ctx->stat = GetVerticalFogEnable(  );
        return 1;
    }
    case 0x3e5: {  // GetVerticalFogMode  -> r_int
        ctx->stat = GetVerticalFogMode(  );
        return 1;
    }
    case 0x3e6: {  // SetVerticalFogColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVerticalFogColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3e7: {  // GetVerticalFogColor  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetVerticalFogColor( &_a0, &_a1, &_a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x3e8: {  // SetVerticalFogStartEnd  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVerticalFogStartEnd( _a0, _a1 );
        return 1;
    }
    case 0x3e9: {  // GetVerticalFogStartEnd  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        float _a0 = 0.0f;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        ctx->stat = GetVerticalFogStartEnd( &_a0, &_a1 );
        double _a0_d = (double)_a0;
        code_setva( _a0_pv, _a0_ap, TYPE_DNUM, &_a0_d );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        return 1;
    }
    case 0x3ea: {  // SetVerticalFogDensity  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVerticalFogDensity( _a0, _a1 );
        return 1;
    }
    case 0x3eb: {  // GetVerticalFogDensity  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        float _a0 = 0.0f;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        ctx->stat = GetVerticalFogDensity( &_a0, &_a1 );
        double _a0_d = (double)_a0;
        code_setva( _a0_pv, _a0_ap, TYPE_DNUM, &_a0_d );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        return 1;
    }
    case 0x3ec: {  // GetPixel  -> r_uint
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        unsigned int _ret = GetPixel( _a0, _a1 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        ctx->stat = (int)_ret;
        return 1;
    }
    case 0x3ed: {  // GetPixelDX  -> r_uint
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        unsigned int _ret = GetPixelDX( _a0, _a1 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        ctx->stat = (int)_ret;
        return 1;
    }
    case 0x3ee: {  // GetPixelF  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = GetPixelF( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x3ef: {  // SetBackgroundColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBackgroundColor( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3f0: {  // GetBackgroundColor  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        ctx->stat = GetBackgroundColor( &_a0, &_a1, &_a2, &_a3 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        return 1;
    }
    case 0x3f1: {  // GetDrawScreenGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetDrawScreenGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x3f2: {  // BltDrawValidGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = BltDrawValidGraph( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x3f3: {  // ScreenFlip  -> r_int
        ctx->stat = ScreenFlip(  );
        return 1;
    }
    case 0x3f4: {  // ScreenCopy  -> r_int
        ctx->stat = ScreenCopy(  );
        return 1;
    }
    case 0x3f5: {  // WaitVSync  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = WaitVSync( _a0 );
        return 1;
    }
    case 0x3f6: {  // ClsDrawScreen  -> r_int
        ctx->stat = ClsDrawScreen(  );
        return 1;
    }
    case 0x3f7: {  // SetDrawScreen  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawScreen( _a0 );
        return 1;
    }
    case 0x3f8: {  // GetDrawScreen  -> r_int
        ctx->stat = GetDrawScreen(  );
        return 1;
    }
    case 0x3f9: {  // GetActiveGraph  -> r_int
        ctx->stat = GetActiveGraph(  );
        return 1;
    }
    case 0x3fa: {  // SetUseSetDrawScreenSettingReset  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSetDrawScreenSettingReset( _a0 );
        return 1;
    }
    case 0x3fb: {  // GetUseSetDrawScreenSettingReset  -> r_int
        ctx->stat = GetUseSetDrawScreenSettingReset(  );
        return 1;
    }
    case 0x3fc: {  // SetDrawZBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawZBuffer( _a0 );
        return 1;
    }
    case 0x3fd: {  // SetGraphMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 60 );
        ctx->stat = SetGraphMode( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3fe: {  // GetFullScreenResolutionMode  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetFullScreenResolutionMode( &_a0, &_a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x3ff: {  // GetUseFullScreenResolutionMode  -> r_int
        ctx->stat = GetUseFullScreenResolutionMode(  );
        return 1;
    }
    case 0x400: {  // SetEmulation320x240  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetEmulation320x240( _a0 );
        return 1;
    }
    case 0x401: {  // SetZBufferSize  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBufferSize( _a0, _a1 );
        return 1;
    }
    case 0x402: {  // SetZBufferBitDepth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBufferBitDepth( _a0 );
        return 1;
    }
    case 0x403: {  // SetWaitVSyncFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWaitVSyncFlag( _a0 );
        return 1;
    }
    case 0x404: {  // GetWaitVSyncFlag  -> r_int
        ctx->stat = GetWaitVSyncFlag(  );
        return 1;
    }
    case 0x405: {  // SetFullSceneAntiAliasingMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFullSceneAntiAliasingMode( _a0, _a1 );
        return 1;
    }
    case 0x406: {  // SetGraphDisplayArea  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphDisplayArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x407: {  // SetChangeScreenModeGraphicsSystemResetFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetChangeScreenModeGraphicsSystemResetFlag( _a0 );
        return 1;
    }
    case 0x408: {  // GetScreenState  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetScreenState( &_a0, &_a1, &_a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x409: {  // GetDrawScreenSize  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetDrawScreenSize( &_a0, &_a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x40a: {  // GetScreenBitDepth  -> r_int
        ctx->stat = GetScreenBitDepth(  );
        return 1;
    }
    case 0x40b: {  // GetColorBitDepth  -> r_int
        ctx->stat = GetColorBitDepth(  );
        return 1;
    }
    case 0x40c: {  // GetChangeDisplayFlag  -> r_int
        ctx->stat = GetChangeDisplayFlag(  );
        return 1;
    }
    case 0x40d: {  // GetVideoMemorySize  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetVideoMemorySize( &_a0, &_a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x40e: {  // GetRefreshRate  -> r_int
        ctx->stat = GetRefreshRate(  );
        return 1;
    }
    case 0x40f: {  // GetDisplayNum  -> r_int
        ctx->stat = GetDisplayNum(  );
        return 1;
    }
    case 0x410: {  // GetDisplayInfo  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = GetDisplayInfo( _a0, &_a1, &_a2, &_a3, &_a4, &_a5, &_a6 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x411: {  // GetDisplayModeNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDisplayModeNum( _a0 );
        return 1;
    }
    case 0x412: {  // GetDisplayMaxResolution  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDisplayMaxResolution( &_a0, &_a1, _a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x413: {  // GetMultiDrawScreenNum  -> r_int
        ctx->stat = GetMultiDrawScreenNum(  );
        return 1;
    }
    case 0x414: {  // GetDrawFloatCoordType  -> r_int
        ctx->stat = GetDrawFloatCoordType(  );
        return 1;
    }
    case 0x415: {  // SetUseNormalDrawShader  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNormalDrawShader( _a0 );
        return 1;
    }
    case 0x416: {  // SetUseSoftwareRenderModeFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSoftwareRenderModeFlag( _a0 );
        return 1;
    }
    case 0x417: {  // SetNotUse3DFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNotUse3DFlag( _a0 );
        return 1;
    }
    case 0x418: {  // SetUse3DFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUse3DFlag( _a0 );
        return 1;
    }
    case 0x419: {  // GetUse3DFlag  -> r_int
        ctx->stat = GetUse3DFlag(  );
        return 1;
    }
    case 0x41a: {  // SetScreenMemToVramFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetScreenMemToVramFlag( _a0 );
        return 1;
    }
    case 0x41b: {  // GetScreenMemToSystemMemFlag  -> r_int
        ctx->stat = GetScreenMemToSystemMemFlag(  );
        return 1;
    }
    case 0x41c: {  // RestoreGraphSystem  -> r_int
        ctx->stat = RestoreGraphSystem(  );
        return 1;
    }
    case 0x41d: {  // SetUseHardwareVertexProcessing  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseHardwareVertexProcessing( _a0 );
        return 1;
    }
    case 0x41e: {  // SetUsePixelLighting  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePixelLighting( _a0 );
        return 1;
    }
    case 0x41f: {  // SetUseOldDrawModiGraphCodeFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseOldDrawModiGraphCodeFlag( _a0 );
        return 1;
    }
    case 0x420: {  // SetUseVramFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseVramFlag( _a0 );
        return 1;
    }
    case 0x421: {  // GetUseVramFlag  -> r_int
        ctx->stat = GetUseVramFlag(  );
        return 1;
    }
    case 0x422: {  // SetBasicBlendFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBasicBlendFlag( _a0 );
        return 1;
    }
    case 0x423: {  // SetUseBasicGraphDraw3DDeviceMethodFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseBasicGraphDraw3DDeviceMethodFlag( _a0 );
        return 1;
    }
    case 0x424: {  // SetUseDisplayIndex  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDisplayIndex( _a0 );
        return 1;
    }
    case 0x425: {  // RenderVertex  -> r_int
        ctx->stat = RenderVertex(  );
        return 1;
    }
    case 0x426: {  // GetDrawCallCount  -> r_int
        ctx->stat = GetDrawCallCount(  );
        return 1;
    }
    case 0x427: {  // GetFPS  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetFPS(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x428: {  // SaveDrawScreen  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        int _a5 = hsp3dx_auto_geti( DX_IMAGESAVETYPE_BMP );
        int _a6 = hsp3dx_auto_geti( 80 );
        int _a7 = hsp3dx_auto_geti( 1 );
        int _a8 = hsp3dx_auto_geti( -1 );
        ctx->stat = SaveDrawScreen( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x429: {  // SaveDrawScreenToBMP  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        ctx->stat = SaveDrawScreenToBMP( _a0, _a1, _a2, _a3, _a4_t );
        return 1;
    }
    case 0x42a: {  // SaveDrawScreenToDDS  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        ctx->stat = SaveDrawScreenToDDS( _a0, _a1, _a2, _a3, _a4_t );
        return 1;
    }
    case 0x42b: {  // SaveDrawScreenToJPEG  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        int _a5 = hsp3dx_auto_geti( 80 );
        int _a6 = hsp3dx_auto_geti( 1 );
        ctx->stat = SaveDrawScreenToJPEG( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        return 1;
    }
    case 0x42c: {  // SaveDrawScreenToPNG  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = SaveDrawScreenToPNG( _a0, _a1, _a2, _a3, _a4_t, _a5 );
        return 1;
    }
    case 0x42d: {  // SaveDrawValidGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        int _a6 = hsp3dx_auto_geti( DX_IMAGESAVETYPE_BMP );
        int _a7 = hsp3dx_auto_geti( 80 );
        int _a8 = hsp3dx_auto_geti( 1 );
        int _a9 = hsp3dx_auto_geti( -1 );
        ctx->stat = SaveDrawValidGraph( _a0, _a1, _a2, _a3, _a4, _a5_t, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x42e: {  // SaveDrawValidGraphToBMP  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        ctx->stat = SaveDrawValidGraphToBMP( _a0, _a1, _a2, _a3, _a4, _a5_t );
        return 1;
    }
    case 0x42f: {  // SaveDrawValidGraphToDDS  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        ctx->stat = SaveDrawValidGraphToDDS( _a0, _a1, _a2, _a3, _a4, _a5_t );
        return 1;
    }
    case 0x430: {  // SaveDrawValidGraphToJPEG  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        int _a6 = hsp3dx_auto_geti( 80 );
        int _a7 = hsp3dx_auto_geti( 1 );
        ctx->stat = SaveDrawValidGraphToJPEG( _a0, _a1, _a2, _a3, _a4, _a5_t, _a6, _a7 );
        return 1;
    }
    case 0x431: {  // SaveDrawValidGraphToPNG  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        int _a6 = hsp3dx_auto_geti( -1 );
        ctx->stat = SaveDrawValidGraphToPNG( _a0, _a1, _a2, _a3, _a4, _a5_t, _a6 );
        return 1;
    }
    case 0x432: {  // DeleteVertexBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteVertexBuffer( _a0 );
        return 1;
    }
    case 0x433: {  // InitVertexBuffer  -> r_int
        ctx->stat = InitVertexBuffer(  );
        return 1;
    }
    case 0x434: {  // UpdateVertexBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateVertexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x435: {  // DeleteIndexBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteIndexBuffer( _a0 );
        return 1;
    }
    case 0x436: {  // InitIndexBuffer  -> r_int
        ctx->stat = InitIndexBuffer(  );
        return 1;
    }
    case 0x437: {  // UpdateIndexBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateIndexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x438: {  // GetMaxPrimitiveCount  -> r_int
        ctx->stat = GetMaxPrimitiveCount(  );
        return 1;
    }
    case 0x439: {  // GetMaxVertexIndex  -> r_int
        ctx->stat = GetMaxVertexIndex(  );
        return 1;
    }
    case 0x43a: {  // GetValidShaderVersion  -> r_int
        ctx->stat = GetValidShaderVersion(  );
        return 1;
    }
    case 0x43b: {  // LoadVertexShader  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadVertexShader( _a0_t );
        return 1;
    }
    case 0x43c: {  // LoadGeometryShader  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadGeometryShader( _a0_t );
        return 1;
    }
    case 0x43d: {  // LoadPixelShader  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadPixelShader( _a0_t );
        return 1;
    }
    case 0x43e: {  // DeleteShader  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShader( _a0 );
        return 1;
    }
    case 0x43f: {  // InitShader  -> r_int
        ctx->stat = InitShader(  );
        return 1;
    }
    case 0x440: {  // GetConstIndexToShader  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetConstIndexToShader( _a0_t, _a1 );
        return 1;
    }
    case 0x441: {  // GetConstCountToShader  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetConstCountToShader( _a0_t, _a1 );
        return 1;
    }
    case 0x442: {  // SetVSConstSF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVSConstSF( _a0, _a1 );
        return 1;
    }
    case 0x443: {  // SetVSConstF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        FLOAT4 _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(FLOAT4) );
        ctx->stat = SetVSConstF( _a0, _a1 );
        return 1;
    }
    case 0x444: {  // SetVSConstFMtx  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetVSConstFMtx( _a0, _a1 );
        return 1;
    }
    case 0x445: {  // SetVSConstFMtxT  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetVSConstFMtxT( _a0, _a1 );
        return 1;
    }
    case 0x446: {  // SetVSConstSI  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstSI( _a0, _a1 );
        return 1;
    }
    case 0x447: {  // SetVSConstSFArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstSFArray( _a0, &_a1, _a2 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        return 1;
    }
    case 0x448: {  // SetVSConstFArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        FLOAT4 *_a1 = (FLOAT4 *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstFArray( _a0, _a1, _a2 );
        return 1;
    }
    case 0x449: {  // SetVSConstFMtxArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstFMtxArray( _a0, _a1, _a2 );
        return 1;
    }
    case 0x44a: {  // SetVSConstFMtxTArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstFMtxTArray( _a0, _a1, _a2 );
        return 1;
    }
    case 0x44b: {  // SetVSConstSIArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstSIArray( _a0, &_a1, _a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x44c: {  // ResetVSConstF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstF( _a0, _a1 );
        return 1;
    }
    case 0x44d: {  // ResetVSConstI  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstI( _a0, _a1 );
        return 1;
    }
    case 0x44e: {  // ResetVSConstB  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstB( _a0, _a1 );
        return 1;
    }
    case 0x44f: {  // SetPSConstSF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetPSConstSF( _a0, _a1 );
        return 1;
    }
    case 0x450: {  // SetPSConstF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        FLOAT4 _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(FLOAT4) );
        ctx->stat = SetPSConstF( _a0, _a1 );
        return 1;
    }
    case 0x451: {  // SetPSConstFMtx  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetPSConstFMtx( _a0, _a1 );
        return 1;
    }
    case 0x452: {  // SetPSConstFMtxT  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetPSConstFMtxT( _a0, _a1 );
        return 1;
    }
    case 0x453: {  // SetPSConstSI  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstSI( _a0, _a1 );
        return 1;
    }
    case 0x454: {  // SetPSConstSFArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstSFArray( _a0, &_a1, _a2 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        return 1;
    }
    case 0x455: {  // SetPSConstFArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        FLOAT4 *_a1 = (FLOAT4 *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstFArray( _a0, _a1, _a2 );
        return 1;
    }
    case 0x456: {  // SetPSConstFMtxArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstFMtxArray( _a0, _a1, _a2 );
        return 1;
    }
    case 0x457: {  // SetPSConstFMtxTArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstFMtxTArray( _a0, _a1, _a2 );
        return 1;
    }
    case 0x458: {  // SetPSConstSIArray  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstSIArray( _a0, &_a1, _a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x459: {  // ResetPSConstF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstF( _a0, _a1 );
        return 1;
    }
    case 0x45a: {  // ResetPSConstI  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstI( _a0, _a1 );
        return 1;
    }
    case 0x45b: {  // ResetPSConstB  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstB( _a0, _a1 );
        return 1;
    }
    case 0x45c: {  // SetRenderTargetToShader  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetRenderTargetToShader( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x45d: {  // SetUseTextureToShader  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTextureToShader( _a0, _a1 );
        return 1;
    }
    case 0x45e: {  // SetUseVertexShader  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseVertexShader( _a0 );
        return 1;
    }
    case 0x45f: {  // SetUseGeometryShader  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGeometryShader( _a0 );
        return 1;
    }
    case 0x460: {  // SetUsePixelShader  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePixelShader( _a0 );
        return 1;
    }
    case 0x461: {  // DrawBillboard3DToShader  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawBillboard3DToShader( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x462: {  // DrawPolygon3DToShader_UseVertexBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygon3DToShader_UseVertexBuffer( _a0 );
        return 1;
    }
    case 0x463: {  // DrawPolygonIndexed3DToShader_UseVertexBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygonIndexed3DToShader_UseVertexBuffer( _a0, _a1 );
        return 1;
    }
    case 0x464: {  // InitShaderConstantBuffer  -> r_int
        ctx->stat = InitShaderConstantBuffer(  );
        return 1;
    }
    case 0x465: {  // CreateShaderConstantBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x466: {  // DeleteShaderConstantBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x467: {  // UpdateShaderConstantBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x468: {  // SetGraphBlendScalingFilterMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphBlendScalingFilterMode( _a0 );
        return 1;
    }
    case 0x469: {  // PlayMovie  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMovie( _a0_t, _a1, _a2 );
        return 1;
    }
    case 0x46a: {  // GetMovieImageSize_File  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetMovieImageSize_File( _a0_t, &_a1, &_a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x46b: {  // OpenMovieToGraph  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 1 );
        ctx->stat = OpenMovieToGraph( _a0_t, _a1 );
        return 1;
    }
    case 0x46c: {  // PlayMovieToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( DX_PLAYTYPE_BACK );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMovieToGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x46d: {  // PauseMovieToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PauseMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x46e: {  // AddMovieFrameToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        unsigned int _a1 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = AddMovieFrameToGraph( _a0, _a1 );
        return 1;
    }
    case 0x46f: {  // SeekMovieToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SeekMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x470: {  // SetPlaySpeedRateMovieToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetPlaySpeedRateMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x471: {  // GetMovieStateToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieStateToGraph( _a0 );
        return 1;
    }
    case 0x472: {  // SetMovieVolumeToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieVolumeToGraph( _a0, _a1 );
        return 1;
    }
    case 0x473: {  // GetMovieVolumeToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieVolumeToGraph( _a0 );
        return 1;
    }
    case 0x474: {  // ChangeMovieVolumeToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeMovieVolumeToGraph( _a0, _a1 );
        return 1;
    }
    case 0x475: {  // GetMovieVolumeToGraph2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieVolumeToGraph2( _a0 );
        return 1;
    }
    case 0x476: {  // GetMovieTotalFrameToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieTotalFrameToGraph( _a0 );
        return 1;
    }
    case 0x477: {  // TellMovieToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = TellMovieToGraph( _a0 );
        return 1;
    }
    case 0x478: {  // TellMovieToGraphToFrame  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = TellMovieToGraphToFrame( _a0 );
        return 1;
    }
    case 0x479: {  // SeekMovieToGraphToFrame  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SeekMovieToGraphToFrame( _a0, _a1 );
        return 1;
    }
    case 0x47a: {  // GetOneFrameTimeMovieToGraph  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetOneFrameTimeMovieToGraph( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x47b: {  // GetLastUpdateTimeMovieToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLastUpdateTimeMovieToGraph( _a0 );
        return 1;
    }
    case 0x47c: {  // UpdateMovieToGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateMovieToGraph( _a0 );
        return 1;
    }
    case 0x47d: {  // SetMovieRightImageAlphaFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieRightImageAlphaFlag( _a0 );
        return 1;
    }
    case 0x47e: {  // SetMovieColorA8R8G8B8Flag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieColorA8R8G8B8Flag( _a0 );
        return 1;
    }
    case 0x47f: {  // SetMovieUseYUVFormatSurfaceFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieUseYUVFormatSurfaceFlag( _a0 );
        return 1;
    }
    case 0x480: {  // SetCameraNearFar  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraNearFar( _a0, _a1 );
        return 1;
    }
    case 0x481: {  // SetCameraNearFarD  -> r_int
        double _a0 = hsp3dx_auto_getd( 0.0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraNearFarD( _a0, _a1 );
        return 1;
    }
    case 0x482: {  // SetCameraPositionAndTarget_UpVecY  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetCameraPositionAndTarget_UpVecY( _a0, _a1 );
        return 1;
    }
    case 0x483: {  // SetCameraPositionAndTarget_UpVecYD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = SetCameraPositionAndTarget_UpVecYD( _a0, _a1 );
        return 1;
    }
    case 0x484: {  // SetCameraPositionAndTargetAndUpVec  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetCameraPositionAndTargetAndUpVec( _a0, _a1, _a2 );
        return 1;
    }
    case 0x485: {  // SetCameraPositionAndTargetAndUpVecD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = SetCameraPositionAndTargetAndUpVecD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x486: {  // SetCameraPositionAndAngle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraPositionAndAngle( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x487: {  // SetCameraPositionAndAngleD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraPositionAndAngleD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x488: {  // SetCameraViewMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetCameraViewMatrix( _a0 );
        return 1;
    }
    case 0x489: {  // SetCameraViewMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = SetCameraViewMatrixD( _a0 );
        return 1;
    }
    case 0x48a: {  // SetCameraScreenCenter  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraScreenCenter( _a0, _a1 );
        return 1;
    }
    case 0x48b: {  // SetCameraScreenCenterD  -> r_int
        double _a0 = hsp3dx_auto_getd( 0.0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraScreenCenterD( _a0, _a1 );
        return 1;
    }
    case 0x48c: {  // SetupCamera_Perspective  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_Perspective( _a0 );
        return 1;
    }
    case 0x48d: {  // SetupCamera_PerspectiveD  -> r_int
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_PerspectiveD( _a0 );
        return 1;
    }
    case 0x48e: {  // SetupCamera_Ortho  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_Ortho( _a0 );
        return 1;
    }
    case 0x48f: {  // SetupCamera_OrthoD  -> r_int
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_OrthoD( _a0 );
        return 1;
    }
    case 0x490: {  // SetupCamera_ProjectionMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetupCamera_ProjectionMatrix( _a0 );
        return 1;
    }
    case 0x491: {  // SetupCamera_ProjectionMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = SetupCamera_ProjectionMatrixD( _a0 );
        return 1;
    }
    case 0x492: {  // SetCameraDotAspect  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraDotAspect( _a0 );
        return 1;
    }
    case 0x493: {  // SetCameraDotAspectD  -> r_int
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraDotAspectD( _a0 );
        return 1;
    }
    case 0x494: {  // CheckCameraViewClip  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CheckCameraViewClip( _a0 );
        return 1;
    }
    case 0x495: {  // CheckCameraViewClipD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = CheckCameraViewClipD( _a0 );
        return 1;
    }
    case 0x496: {  // CheckCameraViewClip_Dir  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CheckCameraViewClip_Dir( _a0 );
        return 1;
    }
    case 0x497: {  // CheckCameraViewClip_DirD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = CheckCameraViewClip_DirD( _a0 );
        return 1;
    }
    case 0x498: {  // CheckCameraViewClip_Box  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CheckCameraViewClip_Box( _a0, _a1 );
        return 1;
    }
    case 0x499: {  // CheckCameraViewClip_BoxD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = CheckCameraViewClip_BoxD( _a0, _a1 );
        return 1;
    }
    case 0x49a: {  // GetCameraNear  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCameraNear(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x49b: {  // GetCameraNearD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetCameraNearD(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x49c: {  // GetCameraFar  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCameraFar(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x49d: {  // GetCameraFarD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetCameraFarD(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x49e: {  // GetCameraPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetCameraPosition(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x49f: {  // GetCameraPositionD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _ret = GetCameraPositionD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x4a0: {  // GetCameraTarget  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetCameraTarget(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4a1: {  // GetCameraTargetD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _ret = GetCameraTargetD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x4a2: {  // GetCameraUpVector  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetCameraUpVector(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4a3: {  // GetCameraUpVectorD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _ret = GetCameraUpVectorD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x4a4: {  // GetCameraDownVector  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetCameraDownVector(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4a5: {  // GetCameraDownVectorD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _ret = GetCameraDownVectorD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x4a6: {  // GetCameraRightVector  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetCameraRightVector(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4a7: {  // GetCameraRightVectorD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _ret = GetCameraRightVectorD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x4a8: {  // GetCameraLeftVector  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetCameraLeftVector(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4a9: {  // GetCameraLeftVectorD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _ret = GetCameraLeftVectorD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x4aa: {  // GetCameraFrontVector  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetCameraFrontVector(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4ab: {  // GetCameraFrontVectorD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _ret = GetCameraFrontVectorD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x4ac: {  // GetCameraBackVector  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetCameraBackVector(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4ad: {  // GetCameraBackVectorD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _ret = GetCameraBackVectorD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x4ae: {  // GetCameraAngleHRotate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCameraAngleHRotate(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x4af: {  // GetCameraAngleHRotateD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetCameraAngleHRotateD(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x4b0: {  // GetCameraAngleVRotate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCameraAngleVRotate(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x4b1: {  // GetCameraAngleVRotateD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetCameraAngleVRotateD(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x4b2: {  // GetCameraAngleTRotate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCameraAngleTRotate(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x4b3: {  // GetCameraAngleTRotateD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetCameraAngleTRotateD(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x4b4: {  // GetCameraViewMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _ret = GetCameraViewMatrix(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x4b5: {  // GetCameraViewMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _ret = GetCameraViewMatrixD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x4b6: {  // GetCameraBillboardMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _ret = GetCameraBillboardMatrix(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x4b7: {  // GetCameraBillboardMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _ret = GetCameraBillboardMatrixD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x4b8: {  // GetCameraScreenCenter  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        float _a0 = 0.0f;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        ctx->stat = GetCameraScreenCenter( &_a0, &_a1 );
        double _a0_d = (double)_a0;
        code_setva( _a0_pv, _a0_ap, TYPE_DNUM, &_a0_d );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        return 1;
    }
    case 0x4b9: {  // GetCameraScreenCenterD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        double _a0 = 0.0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        ctx->stat = GetCameraScreenCenterD( &_a0, &_a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_DNUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        return 1;
    }
    case 0x4ba: {  // GetCameraFov  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCameraFov(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x4bb: {  // GetCameraFovD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetCameraFovD(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x4bc: {  // GetCameraSize  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCameraSize(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x4bd: {  // GetCameraSizeD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetCameraSizeD(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x4be: {  // GetCameraProjectionMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _ret = GetCameraProjectionMatrix(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x4bf: {  // GetCameraProjectionMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _ret = GetCameraProjectionMatrixD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x4c0: {  // GetCameraDotAspect  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCameraDotAspect(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x4c1: {  // GetCameraDotAspectD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        double _ret = GetCameraDotAspectD(  );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x4c2: {  // GetCameraViewportMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _ret = GetCameraViewportMatrix(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x4c3: {  // GetCameraViewportMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _ret = GetCameraViewportMatrixD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x4c4: {  // GetCameraAPIViewportMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _ret = GetCameraAPIViewportMatrix(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x4c5: {  // GetCameraAPIViewportMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _ret = GetCameraAPIViewportMatrixD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x4c6: {  // SetUseLighting  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLighting( _a0 );
        return 1;
    }
    case 0x4c7: {  // SetMaterialUseVertDifColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaterialUseVertDifColor( _a0 );
        return 1;
    }
    case 0x4c8: {  // SetMaterialUseVertSpcColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaterialUseVertSpcColor( _a0 );
        return 1;
    }
    case 0x4c9: {  // SetUseSpecular  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSpecular( _a0 );
        return 1;
    }
    case 0x4ca: {  // SetGlobalAmbientLight  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetGlobalAmbientLight( _a0 );
        return 1;
    }
    case 0x4cb: {  // SetUseLightAngleAttenuation  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLightAngleAttenuation( _a0 );
        return 1;
    }
    case 0x4cc: {  // SetUseHalfLambertLighting  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseHalfLambertLighting( _a0 );
        return 1;
    }
    case 0x4cd: {  // ChangeLightTypeDir  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = ChangeLightTypeDir( _a0 );
        return 1;
    }
    case 0x4ce: {  // ChangeLightTypeSpot  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = ChangeLightTypeSpot( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x4cf: {  // ChangeLightTypePoint  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = ChangeLightTypePoint( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x4d0: {  // GetLightType  -> r_int
        ctx->stat = GetLightType(  );
        return 1;
    }
    case 0x4d1: {  // SetLightEnable  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightEnable( _a0 );
        return 1;
    }
    case 0x4d2: {  // GetLightEnable  -> r_int
        ctx->stat = GetLightEnable(  );
        return 1;
    }
    case 0x4d3: {  // SetLightDifColor  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightDifColor( _a0 );
        return 1;
    }
    case 0x4d4: {  // GetLightDifColor  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _ret = GetLightDifColor(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x4d5: {  // SetLightSpcColor  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightSpcColor( _a0 );
        return 1;
    }
    case 0x4d6: {  // GetLightSpcColor  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _ret = GetLightSpcColor(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x4d7: {  // SetLightAmbColor  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightAmbColor( _a0 );
        return 1;
    }
    case 0x4d8: {  // GetLightAmbColor  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _ret = GetLightAmbColor(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x4d9: {  // SetLightDirection  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetLightDirection( _a0 );
        return 1;
    }
    case 0x4da: {  // GetLightDirection  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetLightDirection(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4db: {  // SetLightPosition  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetLightPosition( _a0 );
        return 1;
    }
    case 0x4dc: {  // GetLightPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _ret = GetLightPosition(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4dd: {  // SetLightRangeAtten  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightRangeAtten( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x4de: {  // GetLightRangeAtten  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        float _a0 = 0.0f;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        ctx->stat = GetLightRangeAtten( &_a0, &_a1, &_a2, &_a3 );
        double _a0_d = (double)_a0;
        code_setva( _a0_pv, _a0_ap, TYPE_DNUM, &_a0_d );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x4df: {  // SetLightAngle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightAngle( _a0, _a1 );
        return 1;
    }
    case 0x4e0: {  // GetLightAngle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        float _a0 = 0.0f;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        ctx->stat = GetLightAngle( &_a0, &_a1 );
        double _a0_d = (double)_a0;
        code_setva( _a0_pv, _a0_ap, TYPE_DNUM, &_a0_d );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        return 1;
    }
    case 0x4e1: {  // SetLightUseShadowMap  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightUseShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x4e2: {  // CreateDirLightHandle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CreateDirLightHandle( _a0 );
        return 1;
    }
    case 0x4e3: {  // CreateSpotLightHandle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateSpotLightHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x4e4: {  // CreatePointLightHandle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreatePointLightHandle( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x4e5: {  // DeleteLightHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteLightHandle( _a0 );
        return 1;
    }
    case 0x4e6: {  // DeleteLightHandleAll  -> r_int
        ctx->stat = DeleteLightHandleAll(  );
        return 1;
    }
    case 0x4e7: {  // SetLightTypeHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightTypeHandle( _a0, _a1 );
        return 1;
    }
    case 0x4e8: {  // SetLightEnableHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightEnableHandle( _a0, _a1 );
        return 1;
    }
    case 0x4e9: {  // SetLightDifColorHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightDifColorHandle( _a0, _a1 );
        return 1;
    }
    case 0x4ea: {  // SetLightSpcColorHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightSpcColorHandle( _a0, _a1 );
        return 1;
    }
    case 0x4eb: {  // SetLightAmbColorHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightAmbColorHandle( _a0, _a1 );
        return 1;
    }
    case 0x4ec: {  // SetLightDirectionHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetLightDirectionHandle( _a0, _a1 );
        return 1;
    }
    case 0x4ed: {  // SetLightPositionHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetLightPositionHandle( _a0, _a1 );
        return 1;
    }
    case 0x4ee: {  // SetLightRangeAttenHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightRangeAttenHandle( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x4ef: {  // SetLightAngleHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightAngleHandle( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4f0: {  // SetLightUseShadowMapHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightUseShadowMapHandle( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4f1: {  // GetLightTypeHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLightTypeHandle( _a0 );
        return 1;
    }
    case 0x4f2: {  // GetLightEnableHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLightEnableHandle( _a0 );
        return 1;
    }
    case 0x4f3: {  // GetLightDifColorHandle  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = GetLightDifColorHandle( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x4f4: {  // GetLightSpcColorHandle  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = GetLightSpcColorHandle( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x4f5: {  // GetLightAmbColorHandle  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = GetLightAmbColorHandle( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x4f6: {  // GetLightDirectionHandle  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = GetLightDirectionHandle( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4f7: {  // GetLightPositionHandle  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = GetLightPositionHandle( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x4f8: {  // GetLightRangeAttenHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        float _a4 = 0.0f;
        ctx->stat = GetLightRangeAttenHandle( _a0, &_a1, &_a2, &_a3, &_a4 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        double _a4_d = (double)_a4;
        code_setva( _a4_pv, _a4_ap, TYPE_DNUM, &_a4_d );
        return 1;
    }
    case 0x4f9: {  // GetLightAngleHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        ctx->stat = GetLightAngleHandle( _a0, &_a1, &_a2 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        return 1;
    }
    case 0x4fa: {  // GetEnableLightHandleNum  -> r_int
        ctx->stat = GetEnableLightHandleNum(  );
        return 1;
    }
    case 0x4fb: {  // GetEnableLightHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetEnableLightHandle( _a0 );
        return 1;
    }
    case 0x4fc: {  // CreateMaskScreen  -> r_int
        ctx->stat = CreateMaskScreen(  );
        return 1;
    }
    case 0x4fd: {  // DeleteMaskScreen  -> r_int
        ctx->stat = DeleteMaskScreen(  );
        return 1;
    }
    case 0x4fe: {  // SetUseMaskScreenFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseMaskScreenFlag( _a0 );
        return 1;
    }
    case 0x4ff: {  // GetUseMaskScreenFlag  -> r_int
        ctx->stat = GetUseMaskScreenFlag(  );
        return 1;
    }
    case 0x500: {  // FillMaskScreen  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FillMaskScreen( _a0 );
        return 1;
    }
    case 0x501: {  // SetMaskScreenGraph  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaskScreenGraph( _a0 );
        return 1;
    }
    case 0x502: {  // InitMask  -> r_int
        ctx->stat = InitMask(  );
        return 1;
    }
    case 0x503: {  // MakeMask  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeMask( _a0, _a1 );
        return 1;
    }
    case 0x504: {  // GetMaskSize  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMaskSize( &_a0, &_a1, _a2 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x505: {  // DeleteMask  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteMask( _a0 );
        return 1;
    }
    case 0x506: {  // LoadMask  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadMask( _a0_t );
        return 1;
    }
    case 0x507: {  // LoadDivMask  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = LoadDivMask( _a0_t, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x508: {  // DrawMask  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawMask( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x509: {  // DrawStringMask  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        ctx->stat = DrawStringMask( _a0, _a1, _a2, _a3_t );
        return 1;
    }
    case 0x50a: {  // DrawStringMaskToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        ctx->stat = DrawStringMaskToHandle( _a0, _a1, _a2, _a3, _a4_t );
        return 1;
    }
    case 0x50b: {  // DrawFillMask  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawFillMask( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x50c: {  // SetMaskReverseEffectFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaskReverseEffectFlag( _a0 );
        return 1;
    }
    case 0x50d: {  // GetMaskScreenData  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMaskScreenData( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x50e: {  // GetMaskUseFlag  -> r_int
        ctx->stat = GetMaskUseFlag(  );
        return 1;
    }
    case 0x50f: {  // EnumFontName  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 1 );
        ctx->stat = EnumFontName( _a0_t, _a1, _a2 );
        return 1;
    }
    case 0x510: {  // InitFontToHandle  -> r_int
        ctx->stat = InitFontToHandle(  );
        return 1;
    }
    case 0x511: {  // CreateFontToHandle  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( -1 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( -1 );
        ctx->stat = CreateFontToHandle( _a0_t, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x512: {  // LoadFontDataToHandle  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadFontDataToHandle( _a0_t, _a1 );
        return 1;
    }
    case 0x513: {  // SetFontSpaceToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontSpaceToHandle( _a0, _a1 );
        return 1;
    }
    case 0x514: {  // SetFontLineSpaceToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontLineSpaceToHandle( _a0, _a1 );
        return 1;
    }
    case 0x515: {  // DeleteFontToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteFontToHandle( _a0 );
        return 1;
    }
    case 0x516: {  // SetFontLostFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = SetFontLostFlag( _a0, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x517: {  // AddFontImageToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddFontImageToHandle( _a0, _a1_t, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x518: {  // SubFontImageToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = SubFontImageToHandle( _a0, _a1_t );
        return 1;
    }
    case 0x519: {  // AddSubstitutionFontToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddSubstitutionFontToHandle( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x51a: {  // SubSubstitutionFontToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SubSubstitutionFontToHandle( _a0, _a1 );
        return 1;
    }
    case 0x51b: {  // ChangeFontFromHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeFontFromHandle( _a0 );
        return 1;
    }
    case 0x51c: {  // ChangeFontType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeFontType( _a0 );
        return 1;
    }
    case 0x51d: {  // SetFontSize  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontSize( _a0 );
        return 1;
    }
    case 0x51e: {  // GetFontSize  -> r_int
        ctx->stat = GetFontSize(  );
        return 1;
    }
    case 0x51f: {  // GetFontEdgeSize  -> r_int
        ctx->stat = GetFontEdgeSize(  );
        return 1;
    }
    case 0x520: {  // SetFontThickness  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontThickness( _a0 );
        return 1;
    }
    case 0x521: {  // SetFontSpace  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontSpace( _a0 );
        return 1;
    }
    case 0x522: {  // GetFontSpace  -> r_int
        ctx->stat = GetFontSpace(  );
        return 1;
    }
    case 0x523: {  // SetFontLineSpace  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontLineSpace( _a0 );
        return 1;
    }
    case 0x524: {  // GetFontLineSpace  -> r_int
        ctx->stat = GetFontLineSpace(  );
        return 1;
    }
    case 0x525: {  // SetDefaultFontState  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( -1 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDefaultFontState( _a0_t, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x526: {  // GetDefaultFontHandle  -> r_int
        ctx->stat = GetDefaultFontHandle(  );
        return 1;
    }
    case 0x527: {  // GetFontMaxCacheCharNum  -> r_int
        ctx->stat = GetFontMaxCacheCharNum(  );
        return 1;
    }
    case 0x528: {  // GetFontMaxWidth  -> r_int
        ctx->stat = GetFontMaxWidth(  );
        return 1;
    }
    case 0x529: {  // GetFontAscent  -> r_int
        ctx->stat = GetFontAscent(  );
        return 1;
    }
    case 0x52a: {  // GetDrawStringWidth  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringWidth( _a0_t, _a1, _a2 );
        return 1;
    }
    case 0x52b: {  // GetDrawExtendStringWidth  -> r_int
        double _a0 = hsp3dx_auto_getd( 0.0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringWidth( _a0, _a1_t, _a2, _a3 );
        return 1;
    }
    case 0x52c: {  // GetDrawStringSize  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringSize( &_a0, &_a1, &_a2, _a3_t, _a4, _a5 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x52d: {  // GetDrawExtendStringSize  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringSize( &_a0, &_a1, &_a2, _a3, _a4, _a5_t, _a6, _a7 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x52e: {  // GetDrawStringKerningPairInfo  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetDrawStringKerningPairInfo( _a0_t, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x52f: {  // GetFontMaxCacheCharNumToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontMaxCacheCharNumToHandle( _a0 );
        return 1;
    }
    case 0x530: {  // GetFontMaxWidthToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontMaxWidthToHandle( _a0 );
        return 1;
    }
    case 0x531: {  // GetFontAscentToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontAscentToHandle( _a0 );
        return 1;
    }
    case 0x532: {  // GetFontSizeToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontSizeToHandle( _a0 );
        return 1;
    }
    case 0x533: {  // GetFontEdgeSizeToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontEdgeSizeToHandle( _a0 );
        return 1;
    }
    case 0x534: {  // GetFontSpaceToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontSpaceToHandle( _a0 );
        return 1;
    }
    case 0x535: {  // GetFontLineSpaceToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontLineSpaceToHandle( _a0 );
        return 1;
    }
    case 0x536: {  // GetFontCharInfo  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = GetFontCharInfo( _a0, _a1_t, &_a2, &_a3, &_a4, &_a5, &_a6 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x537: {  // GetDrawStringWidthToHandle  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringWidthToHandle( _a0_t, _a1, _a2, _a3 );
        return 1;
    }
    case 0x538: {  // GetDrawExtendStringWidthToHandle  -> r_int
        double _a0 = hsp3dx_auto_getd( 0.0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringWidthToHandle( _a0, _a1_t, _a2, _a3, _a4 );
        return 1;
    }
    case 0x539: {  // GetDrawStringSizeToHandle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        const char *_a3_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a3_t[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_t, 1024 );
#else
        const char *_a3_t = _a3_u8;
#endif
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringSizeToHandle( &_a0, &_a1, &_a2, _a3_t, _a4, _a5, _a6 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x53a: {  // GetDrawExtendStringSizeToHandle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a5_t[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_t, 1024 );
#else
        const char *_a5_t = _a5_u8;
#endif
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringSizeToHandle( &_a0, &_a1, &_a2, _a3, _a4, _a5_t, _a6, _a7, _a8 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x53b: {  // GetDrawStringKerningPairInfoToHandle  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringKerningPairInfoToHandle( _a0_t, &_a1, _a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x53c: {  // GetFontStateToHandle  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        int _a3 = hsp3dx_auto_geti( 0 );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        PVal *_a7_pv; APTR _a7_ap;
        _a7_ap = code_getva( &_a7_pv );
        int _a7 = 0;
        ctx->stat = GetFontStateToHandle( _a0_t, &_a1, &_a2, _a3, &_a4, &_a5, &_a6, &_a7 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a7_pv, _a7_ap, TYPE_INUM, &_a7 );
        return 1;
    }
    case 0x53d: {  // CheckFontCacheToTextureFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontCacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x53e: {  // CheckFontChacheToTextureFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontChacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x53f: {  // CheckFontHandleValid  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontHandleValid( _a0 );
        return 1;
    }
    case 0x540: {  // ClearFontCacheToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ClearFontCacheToHandle( _a0 );
        return 1;
    }
    case 0x541: {  // SetFontCacheToTextureFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x542: {  // GetFontCacheToTextureFlag  -> r_int
        ctx->stat = GetFontCacheToTextureFlag(  );
        return 1;
    }
    case 0x543: {  // SetFontChacheToTextureFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontChacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x544: {  // GetFontChacheToTextureFlag  -> r_int
        ctx->stat = GetFontChacheToTextureFlag(  );
        return 1;
    }
    case 0x545: {  // SetFontCacheTextureColorBitDepth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheTextureColorBitDepth( _a0 );
        return 1;
    }
    case 0x546: {  // GetFontCacheTextureColorBitDepth  -> r_int
        ctx->stat = GetFontCacheTextureColorBitDepth(  );
        return 1;
    }
    case 0x547: {  // SetFontCacheCharNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheCharNum( _a0 );
        return 1;
    }
    case 0x548: {  // GetFontCacheCharNum  -> r_int
        ctx->stat = GetFontCacheCharNum(  );
        return 1;
    }
    case 0x549: {  // SetFontCacheUsePremulAlphaFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheUsePremulAlphaFlag( _a0 );
        return 1;
    }
    case 0x54a: {  // GetFontCacheUsePremulAlphaFlag  -> r_int
        ctx->stat = GetFontCacheUsePremulAlphaFlag(  );
        return 1;
    }
    case 0x54b: {  // SetFontUseAdjustSizeFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontUseAdjustSizeFlag( _a0 );
        return 1;
    }
    case 0x54c: {  // GetFontUseAdjustSizeFlag  -> r_int
        ctx->stat = GetFontUseAdjustSizeFlag(  );
        return 1;
    }
    case 0x54d: {  // SetFontOnlyDrawType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontOnlyDrawType( _a0 );
        return 1;
    }
    case 0x54e: {  // GetFontOnlyDrawType  -> r_int
        ctx->stat = GetFontOnlyDrawType(  );
        return 1;
    }
    case 0x54f: {  // SetFontIgnoreLFFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontIgnoreLFFlag( _a0 );
        return 1;
    }
    case 0x550: {  // GetFontIgnoreLFFlag  -> r_int
        ctx->stat = GetFontIgnoreLFFlag(  );
        return 1;
    }
    case 0x551: {  // DrawString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawString( _a0, _a1, _a2_t, _a3, _a4 );
        return 1;
    }
    case 0x552: {  // DrawVString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawVString( _a0, _a1, _a2_t, _a3, _a4 );
        return 1;
    }
    case 0x553: {  // DrawExtendString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendString( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        return 1;
    }
    case 0x554: {  // DrawExtendVString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendVString( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        return 1;
    }
    case 0x555: {  // DrawRotaString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a9 = hsp3dx_auto_geti( 0 );
        const char *_a10_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a10_t[1024];
        hsp3dx_utf8_to_wide( _a10_u8, _a10_t, 1024 );
#else
        const char *_a10_t = _a10_u8;
#endif
        ctx->stat = DrawRotaString( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10_t );
        return 1;
    }
    case 0x556: {  // DrawModiString  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a9 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a10 = hsp3dx_auto_geti( 0 );
        const char *_a11_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a11_t[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_t, 1024 );
#else
        const char *_a11_t = _a11_u8;
#endif
        ctx->stat = DrawModiString( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_t );
        return 1;
    }
    case 0x557: {  // DrawStringF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawStringF( _a0, _a1, _a2_t, _a3, _a4 );
        return 1;
    }
    case 0x558: {  // DrawVStringF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawVStringF( _a0, _a1, _a2_t, _a3, _a4 );
        return 1;
    }
    case 0x559: {  // DrawExtendStringF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendStringF( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        return 1;
    }
    case 0x55a: {  // DrawExtendVStringF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendVStringF( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6 );
        return 1;
    }
    case 0x55b: {  // DrawRotaStringF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a9 = hsp3dx_auto_geti( 0 );
        const char *_a10_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a10_t[1024];
        hsp3dx_utf8_to_wide( _a10_u8, _a10_t, 1024 );
#else
        const char *_a10_t = _a10_u8;
#endif
        ctx->stat = DrawRotaStringF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10_t );
        return 1;
    }
    case 0x55c: {  // DrawModiStringF  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a9 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a10 = hsp3dx_auto_geti( 0 );
        const char *_a11_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a11_t[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_t, 1024 );
#else
        const char *_a11_t = _a11_u8;
#endif
        ctx->stat = DrawModiStringF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_t );
        return 1;
    }
    case 0x55d: {  // DrawNumberToI  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberToI( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x55e: {  // DrawNumberToF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberToF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x55f: {  // DrawNumberPlusToI  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberPlusToI( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x560: {  // DrawNumberPlusToF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberPlusToF( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x561: {  // DrawStringToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawStringToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x562: {  // DrawVStringToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawVStringToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5 );
        return 1;
    }
    case 0x563: {  // DrawExtendStringToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendStringToHandle( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x564: {  // DrawExtendVStringToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendVStringToHandle( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7 );
        return 1;
    }
    case 0x565: {  // DrawRotaStringToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a8 = hsp3dx_auto_geti( 0 );
        unsigned int _a9 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a10 = hsp3dx_auto_geti( 0 );
        const char *_a11_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a11_t[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_t, 1024 );
#else
        const char *_a11_t = _a11_u8;
#endif
        ctx->stat = DrawRotaStringToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_t );
        return 1;
    }
    case 0x566: {  // DrawModiStringToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a9 = hsp3dx_auto_geti( 0 );
        unsigned int _a10 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a11 = hsp3dx_auto_geti( 0 );
        const char *_a12_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a12_t[1024];
        hsp3dx_utf8_to_wide( _a12_u8, _a12_t, 1024 );
#else
        const char *_a12_t = _a12_u8;
#endif
        ctx->stat = DrawModiStringToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12_t );
        return 1;
    }
    case 0x567: {  // DrawStringFToHandle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawStringFToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x568: {  // DrawVStringFToHandle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawVStringFToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5 );
        return 1;
    }
    case 0x569: {  // DrawExtendStringFToHandle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendStringFToHandle( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x56a: {  // DrawExtendVStringFToHandle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a4_t[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_t, 1024 );
#else
        const char *_a4_t = _a4_u8;
#endif
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendVStringFToHandle( _a0, _a1, _a2, _a3, _a4_t, _a5, _a6, _a7 );
        return 1;
    }
    case 0x56b: {  // DrawRotaStringFToHandle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        double _a6 = hsp3dx_auto_getd( 0.0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a8 = hsp3dx_auto_geti( 0 );
        unsigned int _a9 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a10 = hsp3dx_auto_geti( 0 );
        const char *_a11_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a11_t[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_t, 1024 );
#else
        const char *_a11_t = _a11_u8;
#endif
        ctx->stat = DrawRotaStringFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_t );
        return 1;
    }
    case 0x56c: {  // DrawModiStringFToHandle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        unsigned int _a8 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a9 = hsp3dx_auto_geti( 0 );
        unsigned int _a10 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a11 = hsp3dx_auto_geti( 0 );
        const char *_a12_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a12_t[1024];
        hsp3dx_utf8_to_wide( _a12_u8, _a12_t, 1024 );
#else
        const char *_a12_t = _a12_u8;
#endif
        ctx->stat = DrawModiStringFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12_t );
        return 1;
    }
    case 0x56d: {  // DrawNumberToIToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberToIToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x56e: {  // DrawNumberToFToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberToFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x56f: {  // DrawNumberPlusToIToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberPlusToIToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x570: {  // DrawNumberPlusToFToHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberPlusToFToHandle( _a0, _a1, _a2_t, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x571: {  // ConvertMatrixFtoD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = ConvertMatrixFtoD( _a0, _a1 );
        return 1;
    }
    case 0x572: {  // ConvertMatrixDtoF  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a1 = (MATRIX_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = ConvertMatrixDtoF( _a0, _a1 );
        return 1;
    }
    case 0x573: {  // CreateIdentityMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = CreateIdentityMatrix( _a0 );
        return 1;
    }
    case 0x574: {  // CreateIdentityMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = CreateIdentityMatrixD( _a0 );
        return 1;
    }
    case 0x575: {  // CreateLookAtMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a2 = (VECTOR *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a3 = (VECTOR *)(_a3_pv->pt + _a3_ap * _a3_pv->len[0]);
        ctx->stat = CreateLookAtMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x576: {  // CreateLookAtMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a2 = (VECTOR_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a3 = (VECTOR_D *)(_a3_pv->pt + _a3_ap * _a3_pv->len[0]);
        ctx->stat = CreateLookAtMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x577: {  // CreateLookAtMatrix2  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateLookAtMatrix2( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x578: {  // CreateLookAtMatrix2D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateLookAtMatrix2D( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x579: {  // CreateLookAtMatrixRH  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a2 = (VECTOR *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a3 = (VECTOR *)(_a3_pv->pt + _a3_ap * _a3_pv->len[0]);
        ctx->stat = CreateLookAtMatrixRH( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x57a: {  // CreateLookAtMatrixRHD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a2 = (VECTOR_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a3 = (VECTOR_D *)(_a3_pv->pt + _a3_ap * _a3_pv->len[0]);
        ctx->stat = CreateLookAtMatrixRHD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x57b: {  // CreateMultiplyMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a2 = (MATRIX *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = CreateMultiplyMatrix( _a0, _a1, _a2 );
        return 1;
    }
    case 0x57c: {  // CreateMultiplyMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a1 = (MATRIX_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a2 = (MATRIX_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = CreateMultiplyMatrixD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x57d: {  // CreatePerspectiveFovMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( -1.0 );
        ctx->stat = CreatePerspectiveFovMatrix( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x57e: {  // CreatePerspectiveFovMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( -1.0f );
        ctx->stat = CreatePerspectiveFovMatrixD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x57f: {  // CreatePerspectiveFovMatrixRH  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( -1.0 );
        ctx->stat = CreatePerspectiveFovMatrixRH( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x580: {  // CreatePerspectiveFovMatrixRHD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( -1.0f );
        ctx->stat = CreatePerspectiveFovMatrixRHD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x581: {  // CreateOrthoMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( -1.0 );
        ctx->stat = CreateOrthoMatrix( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x582: {  // CreateOrthoMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( -1.0f );
        ctx->stat = CreateOrthoMatrixD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x583: {  // CreateOrthoMatrixRH  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( -1.0 );
        ctx->stat = CreateOrthoMatrixRH( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x584: {  // CreateOrthoMatrixRHD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( -1.0f );
        ctx->stat = CreateOrthoMatrixRHD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x585: {  // CreateScalingMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateScalingMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x586: {  // CreateScalingMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateScalingMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x587: {  // CreateRotationXMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationXMatrix( _a0, _a1 );
        return 1;
    }
    case 0x588: {  // CreateRotationXMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationXMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x589: {  // CreateRotationYMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationYMatrix( _a0, _a1 );
        return 1;
    }
    case 0x58a: {  // CreateRotationYMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationYMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x58b: {  // CreateRotationZMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationZMatrix( _a0, _a1 );
        return 1;
    }
    case 0x58c: {  // CreateRotationZMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationZMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x58d: {  // CreateTranslationMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateTranslationMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x58e: {  // CreateTranslationMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateTranslationMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x58f: {  // CreateTransposeMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = CreateTransposeMatrix( _a0, _a1 );
        return 1;
    }
    case 0x590: {  // CreateTransposeMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a1 = (MATRIX_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = CreateTransposeMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x591: {  // CreateInverseMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = CreateInverseMatrix( _a0, _a1 );
        return 1;
    }
    case 0x592: {  // CreateInverseMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a1 = (MATRIX_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = CreateInverseMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x593: {  // CreateViewportMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateViewportMatrix( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x594: {  // CreateViewportMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateViewportMatrixD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x595: {  // CreateRotationXYZMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationXYZMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x596: {  // CreateRotationXYZMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationXYZMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x597: {  // CreateRotationXZYMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationXZYMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x598: {  // CreateRotationXZYMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationXZYMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x599: {  // CreateRotationYXZMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationYXZMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x59a: {  // CreateRotationYXZMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationYXZMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x59b: {  // CreateRotationYZXMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationYZXMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x59c: {  // CreateRotationYZXMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationYZXMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x59d: {  // CreateRotationZXYMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationZXYMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x59e: {  // CreateRotationZXYMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationZXYMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x59f: {  // CreateRotationZYXMatrix  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationZYXMatrix( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5a0: {  // CreateRotationZYXMatrixD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationZYXMatrixD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5a1: {  // GetMatrixXYZRotation  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        ctx->stat = GetMatrixXYZRotation( _a0, &_a1, &_a2, &_a3 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x5a2: {  // GetMatrixXYZRotationD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        double _a2 = 0.0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        double _a3 = 0.0;
        ctx->stat = GetMatrixXYZRotationD( _a0, &_a1, &_a2, &_a3 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3 );
        return 1;
    }
    case 0x5a3: {  // GetMatrixXZYRotation  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        ctx->stat = GetMatrixXZYRotation( _a0, &_a1, &_a2, &_a3 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x5a4: {  // GetMatrixXZYRotationD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        double _a2 = 0.0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        double _a3 = 0.0;
        ctx->stat = GetMatrixXZYRotationD( _a0, &_a1, &_a2, &_a3 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3 );
        return 1;
    }
    case 0x5a5: {  // GetMatrixYXZRotation  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        ctx->stat = GetMatrixYXZRotation( _a0, &_a1, &_a2, &_a3 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x5a6: {  // GetMatrixYXZRotationD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        double _a2 = 0.0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        double _a3 = 0.0;
        ctx->stat = GetMatrixYXZRotationD( _a0, &_a1, &_a2, &_a3 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3 );
        return 1;
    }
    case 0x5a7: {  // GetMatrixYZXRotation  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        ctx->stat = GetMatrixYZXRotation( _a0, &_a1, &_a2, &_a3 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x5a8: {  // GetMatrixYZXRotationD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        double _a2 = 0.0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        double _a3 = 0.0;
        ctx->stat = GetMatrixYZXRotationD( _a0, &_a1, &_a2, &_a3 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3 );
        return 1;
    }
    case 0x5a9: {  // GetMatrixZXYRotation  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        ctx->stat = GetMatrixZXYRotation( _a0, &_a1, &_a2, &_a3 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x5aa: {  // GetMatrixZXYRotationD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        double _a2 = 0.0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        double _a3 = 0.0;
        ctx->stat = GetMatrixZXYRotationD( _a0, &_a1, &_a2, &_a3 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3 );
        return 1;
    }
    case 0x5ab: {  // GetMatrixZYXRotation  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        ctx->stat = GetMatrixZYXRotation( _a0, &_a1, &_a2, &_a3 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x5ac: {  // GetMatrixZYXRotationD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        double _a2 = 0.0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        double _a3 = 0.0;
        ctx->stat = GetMatrixZYXRotationD( _a0, &_a1, &_a2, &_a3 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3 );
        return 1;
    }
    case 0x5ad: {  // VectorConvertFtoD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = VectorConvertFtoD( _a0, _a1 );
        return 1;
    }
    case 0x5ae: {  // VectorConvertDtoF  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = VectorConvertDtoF( _a0, _a1 );
        return 1;
    }
    case 0x5af: {  // VectorNormalize  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = VectorNormalize( _a0, _a1 );
        return 1;
    }
    case 0x5b0: {  // VectorNormalizeD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = VectorNormalizeD( _a0, _a1 );
        return 1;
    }
    case 0x5b1: {  // VectorScale  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = VectorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b2: {  // VectorScaleD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = VectorScaleD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b3: {  // VectorMultiply  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a2 = (VECTOR *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorMultiply( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b4: {  // VectorMultiplyD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a2 = (VECTOR_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorMultiplyD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b5: {  // VectorSub  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a2 = (VECTOR *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorSub( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b6: {  // VectorSubD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a2 = (VECTOR_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorSubD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b7: {  // VectorAdd  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a2 = (VECTOR *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorAdd( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b8: {  // VectorAddD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a2 = (VECTOR_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorAddD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b9: {  // VectorOuterProduct  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a2 = (VECTOR *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorOuterProduct( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5ba: {  // VectorOuterProductD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a2 = (VECTOR_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorOuterProductD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5bb: {  // VectorInnerProduct  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        float _ret = VectorInnerProduct( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5bc: {  // VectorInnerProductD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _ret = VectorInnerProductD( _a0, _a1 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5bd: {  // VectorRotationX  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = VectorRotationX( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5be: {  // VectorRotationXD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = VectorRotationXD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5bf: {  // VectorRotationY  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = VectorRotationY( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c0: {  // VectorRotationYD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = VectorRotationYD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c1: {  // VectorRotationZ  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = VectorRotationZ( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c2: {  // VectorRotationZD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        double _a2 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = VectorRotationZD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c3: {  // VectorTransform  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a2 = (MATRIX *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorTransform( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c4: {  // VectorTransformD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a2 = (MATRIX_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorTransformD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c5: {  // VectorTransformSR  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a1 = (VECTOR *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a2 = (MATRIX *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorTransformSR( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c6: {  // VectorTransformSRD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a1 = (VECTOR_D *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a2 = (MATRIX_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        ctx->stat = VectorTransformSRD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c7: {  // VectorTransform4  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a0 = (VECTOR *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        float _a1 = 0.0f;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a2 = (VECTOR *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a4 = (MATRIX *)(_a4_pv->pt + _a4_ap * _a4_pv->len[0]);
        ctx->stat = VectorTransform4( _a0, &_a1, _a2, &_a3, _a4 );
        double _a1_d = (double)_a1;
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x5c8: {  // VectorTransform4D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a0 = (VECTOR_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        double _a1 = 0.0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D *_a2 = (VECTOR_D *)(_a2_pv->pt + _a2_ap * _a2_pv->len[0]);
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        double _a3 = 0.0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a4 = (MATRIX_D *)(_a4_pv->pt + _a4_ap * _a4_pv->len[0]);
        ctx->stat = VectorTransform4D( _a0, &_a1, _a2, &_a3, _a4 );
        code_setva( _a1_pv, _a1_ap, TYPE_DNUM, &_a1 );
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3 );
        return 1;
    }
    case 0x5c9: {  // Segment_Segment_MinLength  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        float _ret = Segment_Segment_MinLength( _a0, _a1, _a2, _a3 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5ca: {  // Segment_Segment_MinLengthD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Segment_Segment_MinLengthD( _a0, _a1, _a2, _a3 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5cb: {  // Segment_Segment_MinLength_Square  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        float _ret = Segment_Segment_MinLength_Square( _a0, _a1, _a2, _a3 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5cc: {  // Segment_Segment_MinLength_SquareD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Segment_Segment_MinLength_SquareD( _a0, _a1, _a2, _a3 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5cd: {  // Segment_Triangle_MinLength  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        float _ret = Segment_Triangle_MinLength( _a0, _a1, _a2, _a3, _a4 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5ce: {  // Segment_Triangle_MinLengthD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Segment_Triangle_MinLengthD( _a0, _a1, _a2, _a3, _a4 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5cf: {  // Segment_Triangle_MinLength_Square  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        float _ret = Segment_Triangle_MinLength_Square( _a0, _a1, _a2, _a3, _a4 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5d0: {  // Segment_Triangle_MinLength_SquareD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Segment_Triangle_MinLength_SquareD( _a0, _a1, _a2, _a3, _a4 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5d1: {  // Segment_Point_MinLength  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        float _ret = Segment_Point_MinLength( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5d2: {  // Segment_Point_MinLengthD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Segment_Point_MinLengthD( _a0, _a1, _a2 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5d3: {  // Segment_Point_MinLength_Square  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        float _ret = Segment_Point_MinLength_Square( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5d4: {  // Segment_Point_MinLength_SquareD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Segment_Point_MinLength_SquareD( _a0, _a1, _a2 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5d5: {  // Triangle_Point_MinLength  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        float _ret = Triangle_Point_MinLength( _a0, _a1, _a2, _a3 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5d6: {  // Triangle_Point_MinLengthD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Triangle_Point_MinLengthD( _a0, _a1, _a2, _a3 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5d7: {  // Triangle_Point_MinLength_Square  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        float _ret = Triangle_Point_MinLength_Square( _a0, _a1, _a2, _a3 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5d8: {  // Triangle_Point_MinLength_SquareD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Triangle_Point_MinLength_SquareD( _a0, _a1, _a2, _a3 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5d9: {  // Triangle_Triangle_MinLength  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR) );
        float _ret = Triangle_Triangle_MinLength( _a0, _a1, _a2, _a3, _a4, _a5 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5da: {  // Triangle_Triangle_MinLengthD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Triangle_Triangle_MinLengthD( _a0, _a1, _a2, _a3, _a4, _a5 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5db: {  // Triangle_Triangle_MinLength_Square  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR) );
        float _ret = Triangle_Triangle_MinLength_Square( _a0, _a1, _a2, _a3, _a4, _a5 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5dc: {  // Triangle_Triangle_MinLength_SquareD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Triangle_Triangle_MinLength_SquareD( _a0, _a1, _a2, _a3, _a4, _a5 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5dd: {  // Plane_Point_MinLength_Position  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        VECTOR _ret = Plane_Point_MinLength_Position( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x5de: {  // Plane_Point_MinLength_PositionD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        VECTOR_D _ret = Plane_Point_MinLength_PositionD( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x5df: {  // Plane_Point_MinLength  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        float _ret = Plane_Point_MinLength( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x5e0: {  // Plane_Point_MinLengthD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        double _ret = Plane_Point_MinLengthD( _a0, _a1, _a2 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x5e1: {  // HitCheck_Triangle_Triangle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR) );
        ctx->stat = HitCheck_Triangle_Triangle( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x5e2: {  // HitCheck_Triangle_TriangleD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = HitCheck_Triangle_TriangleD( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x5e3: {  // HitCheck_Triangle_Triangle_2D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR) );
        ctx->stat = HitCheck_Triangle_Triangle_2D( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x5e4: {  // HitCheck_Triangle_TriangleD_2D  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = HitCheck_Triangle_TriangleD_2D( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x5e5: {  // HitCheck_Point_Cone  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Point_Cone( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5e6: {  // HitCheck_Point_ConeD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Point_ConeD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5e7: {  // HitCheck_Line_Sphere  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Line_Sphere( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5e8: {  // HitCheck_Line_SphereD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Line_SphereD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5e9: {  // HitCheck_Sphere_Sphere  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Sphere_Sphere( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5ea: {  // HitCheck_Sphere_SphereD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Sphere_SphereD( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5eb: {  // HitCheck_Sphere_Capsule  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Sphere_Capsule( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5ec: {  // HitCheck_Sphere_CapsuleD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        double _a4 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Sphere_CapsuleD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5ed: {  // HitCheck_Sphere_Triangle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        ctx->stat = HitCheck_Sphere_Triangle( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5ee: {  // HitCheck_Sphere_TriangleD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = HitCheck_Sphere_TriangleD( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5ef: {  // HitCheck_Capsule_Capsule  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Capsule_Capsule( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x5f0: {  // HitCheck_Capsule_CapsuleD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        double _a5 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = HitCheck_Capsule_CapsuleD( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x5f1: {  // HitCheck_Capsule_Triangle  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR) );
        ctx->stat = HitCheck_Capsule_Triangle( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x5f2: {  // HitCheck_Capsule_TriangleD  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        if ( _a4_pv->pt == nullptr || _a4_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a4;
        memcpy( &_a4, _a4_pv->pt + _a4_ap * _a4_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        if ( _a5_pv->pt == nullptr || _a5_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a5;
        memcpy( &_a5, _a5_pv->pt + _a5_ap * _a5_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = HitCheck_Capsule_TriangleD( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x5f3: {  // MGetIdent  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _ret = MGetIdent(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x5f4: {  // MGetIdentD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _ret = MGetIdentD(  );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x5f5: {  // MMult  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX) );
        MATRIX _ret = MMult( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x5f6: {  // MMultD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX_D) );
        MATRIX_D _ret = MMultD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x5f7: {  // MScale  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        MATRIX _ret = MScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x5f8: {  // MScaleD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        MATRIX_D _ret = MScaleD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x5f9: {  // MAdd  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX) );
        MATRIX _ret = MAdd( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x5fa: {  // MAddD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX_D) );
        MATRIX_D _ret = MAddD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x5fb: {  // MGetScale  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        MATRIX _ret = MGetScale( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x5fc: {  // MGetScaleD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        MATRIX_D _ret = MGetScaleD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x5fd: {  // MGetRotX  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        MATRIX _ret = MGetRotX( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x5fe: {  // MGetRotXD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        double _a0 = hsp3dx_auto_getd( 0.0 );
        MATRIX_D _ret = MGetRotXD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x5ff: {  // MGetRotY  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        MATRIX _ret = MGetRotY( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x600: {  // MGetRotYD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        double _a0 = hsp3dx_auto_getd( 0.0 );
        MATRIX_D _ret = MGetRotYD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x601: {  // MGetRotZ  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        MATRIX _ret = MGetRotZ( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x602: {  // MGetRotZD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        double _a0 = hsp3dx_auto_getd( 0.0 );
        MATRIX_D _ret = MGetRotZD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x603: {  // MGetRotAxis  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        MATRIX _ret = MGetRotAxis( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x604: {  // MGetRotAxisD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        MATRIX_D _ret = MGetRotAxisD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x605: {  // MGetRotVec2  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        MATRIX _ret = MGetRotVec2( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x606: {  // MGetRotVec2D  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        MATRIX_D _ret = MGetRotVec2D( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x607: {  // MGetTranslate  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        MATRIX _ret = MGetTranslate( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x608: {  // MGetTranslateD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        MATRIX_D _ret = MGetTranslateD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x609: {  // MGetAxis1  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        MATRIX _ret = MGetAxis1( _a0, _a1, _a2, _a3 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x60a: {  // MGetAxis1D  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        MATRIX_D _ret = MGetAxis1D( _a0, _a1, _a2, _a3 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x60b: {  // MGetAxis2  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR) );
        MATRIX _ret = MGetAxis2( _a0, _a1, _a2, _a3 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x60c: {  // MGetAxis2D  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a3;
        memcpy( &_a3, _a3_pv->pt + _a3_ap * _a3_pv->len[0], sizeof(VECTOR_D) );
        MATRIX_D _ret = MGetAxis2D( _a0, _a1, _a2, _a3 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x60d: {  // MTranspose  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        MATRIX _ret = MTranspose( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x60e: {  // MTransposeD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        MATRIX_D _ret = MTransposeD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x60f: {  // MInverse  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        MATRIX _ret = MInverse( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x610: {  // MInverseD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        MATRIX_D _ret = MInverseD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x611: {  // MGetSize  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        VECTOR _ret = MGetSize( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x612: {  // MGetSizeD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        VECTOR_D _ret = MGetSizeD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x613: {  // MGetRotElem  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        MATRIX _ret = MGetRotElem( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x614: {  // MGetRotElemD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        MATRIX_D _ret = MGetRotElemD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x615: {  // VNorm  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        VECTOR _ret = VNorm( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x616: {  // VNormD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        VECTOR_D _ret = VNormD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x617: {  // VSize  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _ret = VSize( _a0 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x618: {  // VSizeD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        double _ret = VSizeD( _a0 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x619: {  // VCos  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _ret = VCos( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x61a: {  // VCosD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _ret = VCosD( _a0, _a1 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x61b: {  // VRad  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _ret = VRad( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x61c: {  // VRadD  -> r_double
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _ret = VRadD( _a0, _a1 );
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret );
        return 1;
    }
    case 0x61d: {  // QTRot  -> r_FLOAT4
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        FLOAT4 _ret = QTRot( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(FLOAT4) );
        return 1;
    }
    case 0x61e: {  // VRotQ  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        VECTOR _ret = VRotQ( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x61f: {  // VRotQD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        VECTOR_D _ret = VRotQD( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x620: {  // GetImageSize_File  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetImageSize_File( _a0_t, &_a1, &_a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x621: {  // SetUseFastLoadFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseFastLoadFlag( _a0 );
        return 1;
    }
    case 0x622: {  // GetGraphDataShavedMode  -> r_int
        ctx->stat = GetGraphDataShavedMode(  );
        return 1;
    }
    case 0x623: {  // SetUsePremulAlphaConvertLoad  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePremulAlphaConvertLoad( _a0 );
        return 1;
    }
    case 0x624: {  // GetUsePremulAlphaConvertLoad  -> r_int
        ctx->stat = GetUsePremulAlphaConvertLoad(  );
        return 1;
    }
    case 0x625: {  // SetUseConvertNormalFormatLoad  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseConvertNormalFormatLoad( _a0 );
        return 1;
    }
    case 0x626: {  // GetUseConvertNormalFormatLoad  -> r_int
        ctx->stat = GetUseConvertNormalFormatLoad(  );
        return 1;
    }
    case 0x627: {  // GetColorF  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        COLOR_F _ret = GetColorF( _a0, _a1, _a2, _a3 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x628: {  // GetColorU8  -> r_COLOR_U8
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 4 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        COLOR_U8 _ret = GetColorU8( _a0, _a1, _a2, _a3 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_U8) );
        return 1;
    }
    case 0x629: {  // GetColor  -> r_uint
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        unsigned int _ret = GetColor( _a0, _a1, _a2 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        ctx->stat = (int)_ret;
        return 1;
    }
    case 0x62a: {  // GetColor2  -> r_int
        unsigned int _a0 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        ctx->stat = GetColor2( _a0, &_a1, &_a2, &_a3 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        return 1;
    }
    case 0x62b: {  // InitSoftImage  -> r_int
        ctx->stat = InitSoftImage(  );
        return 1;
    }
    case 0x62c: {  // LoadSoftImage  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadSoftImage( _a0_t );
        return 1;
    }
    case 0x62d: {  // LoadARGB8ColorSoftImage  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadARGB8ColorSoftImage( _a0_t );
        return 1;
    }
    case 0x62e: {  // LoadXRGB8ColorSoftImage  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadXRGB8ColorSoftImage( _a0_t );
        return 1;
    }
    case 0x62f: {  // MakeSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x630: {  // MakeARGBF32ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGBF32ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x631: {  // MakeARGBF16ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGBF16ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x632: {  // MakeXRGB8ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeXRGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x633: {  // MakeARGB8ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x634: {  // MakeRGBA8ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeRGBA8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x635: {  // MakeABGR8ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeABGR8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x636: {  // MakeBGRA8ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeBGRA8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x637: {  // MakeARGB4ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGB4ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x638: {  // MakeA1R5G5B5ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeA1R5G5B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x639: {  // MakeX1R5G5B5ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeX1R5G5B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x63a: {  // MakeR5G5B5A1ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeR5G5B5A1ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x63b: {  // MakeR5G6B5ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeR5G6B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x63c: {  // MakeRGB8ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeRGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x63d: {  // MakePAL8ColorSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakePAL8ColorSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x63e: {  // DeleteSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftImage( _a0 );
        return 1;
    }
    case 0x63f: {  // GetSoftImageSize  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetSoftImageSize( _a0, &_a1, &_a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x640: {  // CheckPaletteSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckPaletteSoftImage( _a0 );
        return 1;
    }
    case 0x641: {  // CheckAlphaSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x642: {  // CheckPixelAlphaSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckPixelAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x643: {  // GetDrawScreenSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawScreenSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x644: {  // GetDrawScreenSoftImageDestPos  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawScreenSoftImageDestPos( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x645: {  // FillSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = FillSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x646: {  // ClearRectSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = ClearRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x647: {  // GetPaletteSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        ctx->stat = GetPaletteSoftImage( _a0, _a1, &_a2, &_a3, &_a4, &_a5 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        return 1;
    }
    case 0x648: {  // SetPaletteSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPaletteSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x649: {  // DrawPixelPalCodeSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPixelPalCodeSoftImage( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x64a: {  // GetPixelPalCodeSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPixelPalCodeSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x64b: {  // GetPitchSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPitchSoftImage( _a0 );
        return 1;
    }
    case 0x64c: {  // DrawPixelSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPixelSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x64d: {  // DrawPixelSoftImageF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = DrawPixelSoftImageF( _a0, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x64e: {  // GetPixelSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        int _a5 = 0;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = GetPixelSoftImage( _a0, _a1, _a2, &_a3, &_a4, &_a5, &_a6 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x64f: {  // GetPixelSoftImageF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        float _a4 = 0.0f;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        float _a5 = 0.0f;
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        float _a6 = 0.0f;
        ctx->stat = GetPixelSoftImageF( _a0, _a1, _a2, &_a3, &_a4, &_a5, &_a6 );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        double _a4_d = (double)_a4;
        code_setva( _a4_pv, _a4_ap, TYPE_DNUM, &_a4_d );
        double _a5_d = (double)_a5;
        code_setva( _a5_pv, _a5_ap, TYPE_DNUM, &_a5_d );
        double _a6_d = (double)_a6;
        code_setva( _a6_pv, _a6_ap, TYPE_DNUM, &_a6_d );
        return 1;
    }
    case 0x650: {  // DrawLineSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawLineSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x651: {  // DrawCircleSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawCircleSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x652: {  // BltSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = BltSoftImage( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x653: {  // BltSoftImageWithTransColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        int _a9 = hsp3dx_auto_geti( 0 );
        int _a10 = hsp3dx_auto_geti( 0 );
        int _a11 = hsp3dx_auto_geti( 0 );
        ctx->stat = BltSoftImageWithTransColor( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11 );
        return 1;
    }
    case 0x654: {  // BltSoftImageWithAlphaBlend  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 255 );
        ctx->stat = BltSoftImageWithAlphaBlend( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x655: {  // ReverseSoftImageH  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImageH( _a0 );
        return 1;
    }
    case 0x656: {  // ReverseSoftImageV  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImageV( _a0 );
        return 1;
    }
    case 0x657: {  // ReverseSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImage( _a0 );
        return 1;
    }
    case 0x658: {  // ConvertPremulAlphaSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ConvertPremulAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x659: {  // ConvertInterpAlphaSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ConvertInterpAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x65a: {  // BltStringSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = BltStringSoftImage( _a0, _a1, _a2_t, _a3, _a4, _a5 );
        return 1;
    }
    case 0x65b: {  // DrawSoftImage  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x65c: {  // SaveSoftImageToBmp  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToBmp( _a0_t, _a1 );
        return 1;
    }
    case 0x65d: {  // SaveSoftImageToDds  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToDds( _a0_t, _a1 );
        return 1;
    }
    case 0x65e: {  // SaveSoftImageToPng  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToPng( _a0_t, _a1, _a2 );
        return 1;
    }
    case 0x65f: {  // SaveSoftImageToJpeg  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToJpeg( _a0_t, _a1, _a2, _a3 );
        return 1;
    }
    case 0x660: {  // InitSoundMem  -> r_int
        ctx->stat = InitSoundMem(  );
        return 1;
    }
    case 0x661: {  // AddSoundData  -> r_int
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = AddSoundData( _a0 );
        return 1;
    }
    case 0x662: {  // AddStreamSoundMemToFile  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = AddStreamSoundMemToFile( _a0_t, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x663: {  // SetupStreamSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetupStreamSoundMem( _a0 );
        return 1;
    }
    case 0x664: {  // PlayStreamSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( DX_PLAYTYPE_LOOP );
        int _a2 = hsp3dx_auto_geti( 1 );
        ctx->stat = PlayStreamSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x665: {  // CheckStreamSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckStreamSoundMem( _a0 );
        return 1;
    }
    case 0x666: {  // StopStreamSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopStreamSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x667: {  // SetStreamSoundCurrentPosition  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetStreamSoundCurrentPosition( _a0, _a1 );
        return 1;
    }
    case 0x668: {  // GetStreamSoundCurrentPosition  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetStreamSoundCurrentPosition( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x669: {  // SetStreamSoundCurrentTime  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetStreamSoundCurrentTime( _a0, _a1 );
        return 1;
    }
    case 0x66a: {  // GetStreamSoundCurrentTime  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetStreamSoundCurrentTime( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x66b: {  // ProcessStreamSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ProcessStreamSoundMem( _a0 );
        return 1;
    }
    case 0x66c: {  // ProcessStreamSoundMemAll  -> r_int
        ctx->stat = ProcessStreamSoundMemAll(  );
        return 1;
    }
    case 0x66d: {  // LoadSoundMem2  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = LoadSoundMem2( _a0_t, _a1_t );
        return 1;
    }
    case 0x66e: {  // LoadBGM  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadBGM( _a0_t );
        return 1;
    }
    case 0x66f: {  // LoadSoundMemBase  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = LoadSoundMemBase( _a0_t, _a1, _a2 );
        return 1;
    }
    case 0x670: {  // LoadSoundMem  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 3 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = LoadSoundMem( _a0_t, _a1, _a2 );
        return 1;
    }
    case 0x671: {  // LoadSoundMemToBufNumSitei  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadSoundMemToBufNumSitei( _a0_t, _a1 );
        return 1;
    }
    case 0x672: {  // DuplicateSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 3 );
        ctx->stat = DuplicateSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x673: {  // LoadSoundMemFromSoftSound  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 3 );
        ctx->stat = LoadSoundMemFromSoftSound( _a0, _a1 );
        return 1;
    }
    case 0x674: {  // DeleteSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoundMem( _a0 );
        return 1;
    }
    case 0x675: {  // PlaySoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 1 );
        ctx->stat = PlaySoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x676: {  // StopSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x677: {  // CheckSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckSoundMem( _a0 );
        return 1;
    }
    case 0x678: {  // SetPanSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x679: {  // ChangePanSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangePanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x67a: {  // GetPanSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPanSoundMem( _a0 );
        return 1;
    }
    case 0x67b: {  // SetVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x67c: {  // ChangeVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x67d: {  // GetVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetVolumeSoundMem( _a0 );
        return 1;
    }
    case 0x67e: {  // GetVolumeSoundMem2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetVolumeSoundMem2( _a0 );
        return 1;
    }
    case 0x67f: {  // SetChannelVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x680: {  // ChangeChannelVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x681: {  // GetChannelVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetChannelVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x682: {  // GetChannelVolumeSoundMem2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetChannelVolumeSoundMem2( _a0, _a1 );
        return 1;
    }
    case 0x683: {  // SetFrequencySoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFrequencySoundMem( _a0, _a1 );
        return 1;
    }
    case 0x684: {  // GetFrequencySoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFrequencySoundMem( _a0 );
        return 1;
    }
    case 0x685: {  // ResetFrequencySoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetFrequencySoundMem( _a0 );
        return 1;
    }
    case 0x686: {  // SetNextPlayPanSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayPanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x687: {  // ChangeNextPlayPanSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayPanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x688: {  // SetNextPlayVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x689: {  // ChangeNextPlayVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x68a: {  // SetNextPlayChannelVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x68b: {  // ChangeNextPlayChannelVolumeSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x68c: {  // SetNextPlayFrequencySoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayFrequencySoundMem( _a0, _a1 );
        return 1;
    }
    case 0x68d: {  // SetCurrentPositionSoundMem  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCurrentPositionSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x68e: {  // GetCurrentPositionSoundMem  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetCurrentPositionSoundMem( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x68f: {  // SetSoundCurrentPosition  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetSoundCurrentPosition( _a0, _a1 );
        return 1;
    }
    case 0x690: {  // GetSoundCurrentPosition  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetSoundCurrentPosition( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x691: {  // SetSoundCurrentTime  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetSoundCurrentTime( _a0, _a1 );
        return 1;
    }
    case 0x692: {  // GetSoundCurrentTime  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetSoundCurrentTime( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x693: {  // GetSoundTotalSample  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetSoundTotalSample( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x694: {  // GetSoundTotalTime  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetSoundTotalTime( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x695: {  // SetLoopPosSoundMem  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopPosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x696: {  // SetLoopTimePosSoundMem  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopTimePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x697: {  // SetLoopSamplePosSoundMem  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopSamplePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x698: {  // SetLoopStartTimePosSoundMem  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopStartTimePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x699: {  // SetLoopStartSamplePosSoundMem  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopStartSamplePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x69a: {  // SetLoopAreaTimePosSoundMem  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopAreaTimePosSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x69b: {  // SetLoopAreaSamplePosSoundMem  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopAreaSamplePosSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x69c: {  // SetPlayFinishDeleteSoundMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPlayFinishDeleteSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x69d: {  // Set3DPositionSoundMem  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = Set3DPositionSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x69e: {  // Set3DRadiusSoundMem  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = Set3DRadiusSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x69f: {  // Set3DVelocitySoundMem  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = Set3DVelocitySoundMem( _a0, _a1 );
        return 1;
    }
    case 0x6a0: {  // SetNextPlay3DPositionSoundMem  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlay3DPositionSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x6a1: {  // SetNextPlay3DRadiusSoundMem  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlay3DRadiusSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x6a2: {  // SetNextPlay3DVelocitySoundMem  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlay3DVelocitySoundMem( _a0, _a1 );
        return 1;
    }
    case 0x6a3: {  // GetOggCommentNum  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = GetOggCommentNum( _a0_t );
        return 1;
    }
    case 0x6a4: {  // SetCreateSoundDataType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateSoundDataType( _a0 );
        return 1;
    }
    case 0x6a5: {  // GetCreateSoundDataType  -> r_int
        ctx->stat = GetCreateSoundDataType(  );
        return 1;
    }
    case 0x6a6: {  // SetCreateSoundPitchRate  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCreateSoundPitchRate( _a0 );
        return 1;
    }
    case 0x6a7: {  // GetCreateSoundPitchRate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCreateSoundPitchRate(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x6a8: {  // SetCreateSoundTimeStretchRate  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCreateSoundTimeStretchRate( _a0 );
        return 1;
    }
    case 0x6a9: {  // GetCreateSoundTimeStretchRate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = GetCreateSoundTimeStretchRate(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x6aa: {  // SetCreateSoundLoopAreaTimePos  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = SetCreateSoundLoopAreaTimePos( _a0, _a1 );
        return 1;
    }
    case 0x6ab: {  // SetCreateSoundLoopAreaSamplePos  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = SetCreateSoundLoopAreaSamplePos( _a0, _a1 );
        return 1;
    }
    case 0x6ac: {  // SetCreateSoundIgnoreLoopAreaInfo  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateSoundIgnoreLoopAreaInfo( _a0 );
        return 1;
    }
    case 0x6ad: {  // GetCreateSoundIgnoreLoopAreaInfo  -> r_int
        ctx->stat = GetCreateSoundIgnoreLoopAreaInfo(  );
        return 1;
    }
    case 0x6ae: {  // SetDisableReadSoundFunctionMask  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDisableReadSoundFunctionMask( _a0 );
        return 1;
    }
    case 0x6af: {  // GetDisableReadSoundFunctionMask  -> r_int
        ctx->stat = GetDisableReadSoundFunctionMask(  );
        return 1;
    }
    case 0x6b0: {  // SetEnableSoundCaptureFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetEnableSoundCaptureFlag( _a0 );
        return 1;
    }
    case 0x6b1: {  // SetUseOldVolumeCalcFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseOldVolumeCalcFlag( _a0 );
        return 1;
    }
    case 0x6b2: {  // GetSoundCurrentTimeType  -> r_int
        ctx->stat = GetSoundCurrentTimeType(  );
        return 1;
    }
    case 0x6b3: {  // SetCreate3DSoundFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreate3DSoundFlag( _a0 );
        return 1;
    }
    case 0x6b4: {  // Set3DSoundOneMetre  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundOneMetre( _a0 );
        return 1;
    }
    case 0x6b5: {  // Set3DSoundListenerPosAndFrontPos_UpVecY  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = Set3DSoundListenerPosAndFrontPos_UpVecY( _a0, _a1 );
        return 1;
    }
    case 0x6b6: {  // Set3DSoundListenerPosAndFrontPosAndUpVec  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        ctx->stat = Set3DSoundListenerPosAndFrontPosAndUpVec( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6b7: {  // Set3DSoundListenerVelocity  -> r_int
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = Set3DSoundListenerVelocity( _a0 );
        return 1;
    }
    case 0x6b8: {  // Set3DSoundListenerConeAngle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundListenerConeAngle( _a0, _a1 );
        return 1;
    }
    case 0x6b9: {  // Set3DSoundListenerConeVolume  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundListenerConeVolume( _a0, _a1 );
        return 1;
    }
    case 0x6ba: {  // SetBeepFrequency  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBeepFrequency( _a0 );
        return 1;
    }
    case 0x6bb: {  // PlayBeep  -> r_int
        ctx->stat = PlayBeep(  );
        return 1;
    }
    case 0x6bc: {  // StopBeep  -> r_int
        ctx->stat = StopBeep(  );
        return 1;
    }
    case 0x6bd: {  // PlaySoundFile  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySoundFile( _a0_t, _a1 );
        return 1;
    }
    case 0x6be: {  // PlaySound  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySound( _a0_t, _a1 );
        return 1;
    }
    case 0x6bf: {  // PlaySoundDX  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySoundDX( _a0_t, _a1 );
        return 1;
    }
    case 0x6c0: {  // CheckSoundFile  -> r_int
        ctx->stat = CheckSoundFile(  );
        return 1;
    }
    case 0x6c1: {  // CheckSound  -> r_int
        ctx->stat = CheckSound(  );
        return 1;
    }
    case 0x6c2: {  // StopSoundFile  -> r_int
        ctx->stat = StopSoundFile(  );
        return 1;
    }
    case 0x6c3: {  // StopSound  -> r_int
        ctx->stat = StopSound(  );
        return 1;
    }
    case 0x6c4: {  // SetVolumeSoundFile  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeSoundFile( _a0 );
        return 1;
    }
    case 0x6c5: {  // SetVolumeSound  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeSound( _a0 );
        return 1;
    }
    case 0x6c6: {  // InitSoftSound  -> r_int
        ctx->stat = InitSoftSound(  );
        return 1;
    }
    case 0x6c7: {  // LoadSoftSound  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadSoftSound( _a0_t );
        return 1;
    }
    case 0x6c8: {  // MakeSoftSound  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound( _a0, _a1 );
        return 1;
    }
    case 0x6c9: {  // MakeSoftSound2Ch16Bit44KHz  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch16Bit44KHz( _a0 );
        return 1;
    }
    case 0x6ca: {  // MakeSoftSound2Ch16Bit22KHz  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch16Bit22KHz( _a0 );
        return 1;
    }
    case 0x6cb: {  // MakeSoftSound2Ch8Bit44KHz  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch8Bit44KHz( _a0 );
        return 1;
    }
    case 0x6cc: {  // MakeSoftSound2Ch8Bit22KHz  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch8Bit22KHz( _a0 );
        return 1;
    }
    case 0x6cd: {  // MakeSoftSound1Ch16Bit44KHz  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch16Bit44KHz( _a0 );
        return 1;
    }
    case 0x6ce: {  // MakeSoftSound1Ch16Bit22KHz  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch16Bit22KHz( _a0 );
        return 1;
    }
    case 0x6cf: {  // MakeSoftSound1Ch8Bit44KHz  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch8Bit44KHz( _a0 );
        return 1;
    }
    case 0x6d0: {  // MakeSoftSound1Ch8Bit22KHz  -> r_int
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch8Bit22KHz( _a0 );
        return 1;
    }
    case 0x6d1: {  // MakeSoftSoundCustom  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        LONGLONG _a3 = (LONGLONG)code_geti64();
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundCustom( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x6d2: {  // DeleteSoftSound  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftSound( _a0 );
        return 1;
    }
    case 0x6d3: {  // SaveSoftSound  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = SaveSoftSound( _a0, _a1_t );
        return 1;
    }
    case 0x6d4: {  // GetSoftSoundSampleNum  -> r_int64
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _ret = GetSoftSoundSampleNum( _a0 );
        int _ret_i = (int)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_INUM, &_ret_i );
        return 1;
    }
    case 0x6d5: {  // GetSoftSoundFormat  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        ctx->stat = GetSoftSoundFormat( _a0, &_a1, &_a2, &_a3, &_a4 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        return 1;
    }
    case 0x6d6: {  // ReadSoftSoundData  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        ctx->stat = ReadSoftSoundData( _a0, _a1, &_a2, &_a3 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        return 1;
    }
    case 0x6d7: {  // ReadSoftSoundDataF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        float _a2 = 0.0f;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        float _a3 = 0.0f;
        ctx->stat = ReadSoftSoundDataF( _a0, _a1, &_a2, &_a3 );
        double _a2_d = (double)_a2;
        code_setva( _a2_pv, _a2_ap, TYPE_DNUM, &_a2_d );
        double _a3_d = (double)_a3;
        code_setva( _a3_pv, _a3_ap, TYPE_DNUM, &_a3_d );
        return 1;
    }
    case 0x6d8: {  // WriteSoftSoundData  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = WriteSoftSoundData( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x6d9: {  // WriteSoftSoundDataF  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = WriteSoftSoundDataF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x6da: {  // WriteTimeStretchSoftSoundData  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = WriteTimeStretchSoftSoundData( _a0, _a1 );
        return 1;
    }
    case 0x6db: {  // WritePitchShiftSoftSoundData  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = WritePitchShiftSoftSoundData( _a0, _a1 );
        return 1;
    }
    case 0x6dc: {  // GetFFTVibrationSoftSound  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        LONGLONG _a2 = (LONGLONG)code_geti64();
        int _a3 = hsp3dx_auto_geti( 0 );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        float _a4 = 0.0f;
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFFTVibrationSoftSound( _a0, _a1, _a2, _a3, &_a4, _a5 );
        double _a4_d = (double)_a4;
        code_setva( _a4_pv, _a4_ap, TYPE_DNUM, &_a4_d );
        return 1;
    }
    case 0x6dd: {  // GetFFTVibrationSoftSoundBase  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        LONGLONG _a2 = (LONGLONG)code_geti64();
        int _a3 = hsp3dx_auto_geti( 0 );
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        float _a4 = 0.0f;
        PVal *_a5_pv; APTR _a5_ap;
        _a5_ap = code_getva( &_a5_pv );
        float _a5 = 0.0f;
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFFTVibrationSoftSoundBase( _a0, _a1, _a2, _a3, &_a4, &_a5, _a6 );
        double _a4_d = (double)_a4;
        code_setva( _a4_pv, _a4_ap, TYPE_DNUM, &_a4_d );
        double _a5_d = (double)_a5;
        code_setva( _a5_pv, _a5_ap, TYPE_DNUM, &_a5_d );
        return 1;
    }
    case 0x6de: {  // InitSoftSoundPlayer  -> r_int
        ctx->stat = InitSoftSoundPlayer(  );
        return 1;
    }
    case 0x6df: {  // MakeSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x6e0: {  // MakeSoftSoundPlayer2Ch16Bit44KHz  -> r_int
        ctx->stat = MakeSoftSoundPlayer2Ch16Bit44KHz(  );
        return 1;
    }
    case 0x6e1: {  // MakeSoftSoundPlayer2Ch16Bit22KHz  -> r_int
        ctx->stat = MakeSoftSoundPlayer2Ch16Bit22KHz(  );
        return 1;
    }
    case 0x6e2: {  // MakeSoftSoundPlayer2Ch8Bit44KHz  -> r_int
        ctx->stat = MakeSoftSoundPlayer2Ch8Bit44KHz(  );
        return 1;
    }
    case 0x6e3: {  // MakeSoftSoundPlayer2Ch8Bit22KHz  -> r_int
        ctx->stat = MakeSoftSoundPlayer2Ch8Bit22KHz(  );
        return 1;
    }
    case 0x6e4: {  // MakeSoftSoundPlayer1Ch16Bit44KHz  -> r_int
        ctx->stat = MakeSoftSoundPlayer1Ch16Bit44KHz(  );
        return 1;
    }
    case 0x6e5: {  // MakeSoftSoundPlayer1Ch16Bit22KHz  -> r_int
        ctx->stat = MakeSoftSoundPlayer1Ch16Bit22KHz(  );
        return 1;
    }
    case 0x6e6: {  // MakeSoftSoundPlayer1Ch8Bit44KHz  -> r_int
        ctx->stat = MakeSoftSoundPlayer1Ch8Bit44KHz(  );
        return 1;
    }
    case 0x6e7: {  // MakeSoftSoundPlayer1Ch8Bit22KHz  -> r_int
        ctx->stat = MakeSoftSoundPlayer1Ch8Bit22KHz(  );
        return 1;
    }
    case 0x6e8: {  // MakeSoftSoundPlayerCustom  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundPlayerCustom( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6e9: {  // DeleteSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x6ea: {  // AddDataSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        LONGLONG _a2 = (LONGLONG)code_geti64();
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddDataSoftSoundPlayer( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x6eb: {  // AddOneDataSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddOneDataSoftSoundPlayer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6ec: {  // GetSoftSoundPlayerFormat  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        ctx->stat = GetSoftSoundPlayerFormat( _a0, &_a1, &_a2, &_a3 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        return 1;
    }
    case 0x6ed: {  // StartSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StartSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x6ee: {  // CheckStartSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckStartSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x6ef: {  // StopSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x6f0: {  // ResetSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x6f1: {  // GetStockDataLengthSoftSoundPlayer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetStockDataLengthSoftSoundPlayer( _a0, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x6f2: {  // CheckSoftSoundPlayerNoneData  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckSoftSoundPlayerNoneData( _a0 );
        return 1;
    }
    case 0x6f3: {  // DeleteMusicMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteMusicMem( _a0 );
        return 1;
    }
    case 0x6f4: {  // LoadMusicMem  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = LoadMusicMem( _a0_t );
        return 1;
    }
    case 0x6f5: {  // PlayMusicMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMusicMem( _a0, _a1 );
        return 1;
    }
    case 0x6f6: {  // StopMusicMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopMusicMem( _a0 );
        return 1;
    }
    case 0x6f7: {  // CheckMusicMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckMusicMem( _a0 );
        return 1;
    }
    case 0x6f8: {  // SetVolumeMusicMem  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeMusicMem( _a0, _a1 );
        return 1;
    }
    case 0x6f9: {  // GetMusicMemPosition  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMusicMemPosition( _a0 );
        return 1;
    }
    case 0x6fa: {  // InitMusicMem  -> r_int
        ctx->stat = InitMusicMem(  );
        return 1;
    }
    case 0x6fb: {  // ProcessMusicMem  -> r_int
        ctx->stat = ProcessMusicMem(  );
        return 1;
    }
    case 0x6fc: {  // PlayMusic  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMusic( _a0_t, _a1 );
        return 1;
    }
    case 0x6fd: {  // SetVolumeMusic  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeMusic( _a0 );
        return 1;
    }
    case 0x6fe: {  // StopMusic  -> r_int
        ctx->stat = StopMusic(  );
        return 1;
    }
    case 0x6ff: {  // CheckMusic  -> r_int
        ctx->stat = CheckMusic(  );
        return 1;
    }
    case 0x700: {  // GetMusicPosition  -> r_int
        ctx->stat = GetMusicPosition(  );
        return 1;
    }
    case 0x701: {  // SelectMidiMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SelectMidiMode( _a0 );
        return 1;
    }
    case 0x702: {  // SetUseDXArchiveFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDXArchiveFlag( _a0 );
        return 1;
    }
    case 0x703: {  // SetDXArchivePriority  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDXArchivePriority( _a0 );
        return 1;
    }
    case 0x704: {  // SetDXArchiveExtension  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = SetDXArchiveExtension( _a0_t );
        return 1;
    }
    case 0x705: {  // SetDXArchiveKeyString  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = SetDXArchiveKeyString( _a0_t );
        return 1;
    }
    case 0x706: {  // DXArchivePreLoad  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DXArchivePreLoad( _a0_t, _a1 );
        return 1;
    }
    case 0x707: {  // DXArchiveCheckIdle  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = DXArchiveCheckIdle( _a0_t );
        return 1;
    }
    case 0x708: {  // DXArchiveRelease  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = DXArchiveRelease( _a0_t );
        return 1;
    }
    case 0x709: {  // DXArchiveCheckFile  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = DXArchiveCheckFile( _a0_t, _a1_t );
        return 1;
    }
    case 0x70a: {  // MV1LoadModel  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = MV1LoadModel( _a0_t );
        return 1;
    }
    case 0x70b: {  // MV1DuplicateModel  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DuplicateModel( _a0 );
        return 1;
    }
    case 0x70c: {  // MV1CreateCloneModel  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1CreateCloneModel( _a0 );
        return 1;
    }
    case 0x70d: {  // MV1DeleteModel  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DeleteModel( _a0 );
        return 1;
    }
    case 0x70e: {  // MV1InitModel  -> r_int
        ctx->stat = MV1InitModel(  );
        return 1;
    }
    case 0x70f: {  // MV1SetLoadModelReMakeNormal  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelReMakeNormal( _a0 );
        return 1;
    }
    case 0x710: {  // MV1SetLoadModelReMakeNormalSmoothingAngle  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 1.562069 );
        ctx->stat = MV1SetLoadModelReMakeNormalSmoothingAngle( _a0 );
        return 1;
    }
    case 0x711: {  // MV1SetLoadModelIgnoreScaling  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelIgnoreScaling( _a0 );
        return 1;
    }
    case 0x712: {  // MV1SetLoadModelPositionOptimize  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelPositionOptimize( _a0 );
        return 1;
    }
    case 0x713: {  // MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon( _a0 );
        return 1;
    }
    case 0x714: {  // MV1SetLoadModelPhysicsWorldGravity  -> r_int
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetLoadModelPhysicsWorldGravity( _a0 );
        return 1;
    }
    case 0x715: {  // MV1GetLoadModelPhysicsWorldGravity  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        float _ret = MV1GetLoadModelPhysicsWorldGravity(  );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x716: {  // MV1SetLoadCalcPhysicsWorldGravity  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = MV1SetLoadCalcPhysicsWorldGravity( _a0, _a1 );
        return 1;
    }
    case 0x717: {  // MV1GetLoadCalcPhysicsWorldGravity  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetLoadCalcPhysicsWorldGravity( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x718: {  // MV1SetLoadModelPhysicsCalcPrecision  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelPhysicsCalcPrecision( _a0 );
        return 1;
    }
    case 0x719: {  // MV1AddLoadModelDisablePhysicsNameWord  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = MV1AddLoadModelDisablePhysicsNameWord( _a0_t );
        return 1;
    }
    case 0x71a: {  // MV1ResetLoadModelDisablePhysicsNameWord  -> r_int
        ctx->stat = MV1ResetLoadModelDisablePhysicsNameWord(  );
        return 1;
    }
    case 0x71b: {  // MV1SetLoadModelAnimFilePath  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = MV1SetLoadModelAnimFilePath( _a0_t );
        return 1;
    }
    case 0x71c: {  // MV1SetLoadModelUsePackDraw  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelUsePackDraw( _a0 );
        return 1;
    }
    case 0x71d: {  // MV1SetLoadModelTriangleListUseMaxBoneNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelTriangleListUseMaxBoneNum( _a0 );
        return 1;
    }
    case 0x71e: {  // MV1SetLoadModelTextureLoad  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelTextureLoad( _a0 );
        return 1;
    }
    case 0x71f: {  // MV1SetLoadModelIgnoreIK  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelIgnoreIK( _a0 );
        return 1;
    }
    case 0x720: {  // MV1SaveModelToMV1File  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( MV1_SAVETYPE_NORMAL );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( 1 );
        int _a5 = hsp3dx_auto_geti( 1 );
        int _a6 = hsp3dx_auto_geti( 1 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SaveModelToMV1File( _a0, _a1_t, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x721: {  // MV1SaveModelToXFile  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( MV1_SAVETYPE_NORMAL );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SaveModelToXFile( _a0, _a1_t, _a2, _a3, _a4 );
        return 1;
    }
    case 0x722: {  // MV1DrawModel  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawModel( _a0 );
        return 1;
    }
    case 0x723: {  // MV1DrawFrame  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawFrame( _a0, _a1 );
        return 1;
    }
    case 0x724: {  // MV1DrawMesh  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawMesh( _a0, _a1 );
        return 1;
    }
    case 0x725: {  // MV1DrawTriangleList  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawTriangleList( _a0, _a1 );
        return 1;
    }
    case 0x726: {  // MV1DrawModelDebug  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        unsigned int _a1 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawModelDebug( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x727: {  // MV1SetUseOrigShader  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseOrigShader( _a0 );
        return 1;
    }
    case 0x728: {  // MV1GetLocalWorldMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetLocalWorldMatrix( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x729: {  // MV1GetLocalWorldMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        MATRIX_D _ret = MV1GetLocalWorldMatrixD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x72a: {  // MV1SetPosition  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = MV1SetPosition( _a0, _a1 );
        return 1;
    }
    case 0x72b: {  // MV1SetPositionD  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = MV1SetPositionD( _a0, _a1 );
        return 1;
    }
    case 0x72c: {  // MV1GetPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetPosition( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x72d: {  // MV1GetPositionD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        VECTOR_D _ret = MV1GetPositionD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x72e: {  // MV1SetScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = MV1SetScale( _a0, _a1 );
        return 1;
    }
    case 0x72f: {  // MV1GetScale  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetScale( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x730: {  // MV1SetRotationXYZ  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = MV1SetRotationXYZ( _a0, _a1 );
        return 1;
    }
    case 0x731: {  // MV1GetRotationXYZ  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetRotationXYZ( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x732: {  // MV1SetRotationZYAxis  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(VECTOR) );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetRotationZYAxis( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x733: {  // MV1SetRotationYUseDir  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetRotationYUseDir( _a0, _a1, _a2 );
        return 1;
    }
    case 0x734: {  // MV1SetRotationMatrix  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX) );
        ctx->stat = MV1SetRotationMatrix( _a0, _a1 );
        return 1;
    }
    case 0x735: {  // MV1GetRotationMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetRotationMatrix( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x736: {  // MV1SetMatrix  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX) );
        ctx->stat = MV1SetMatrix( _a0, _a1 );
        return 1;
    }
    case 0x737: {  // MV1SetMatrixD  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = MV1SetMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x738: {  // MV1GetMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetMatrix( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x739: {  // MV1GetMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        MATRIX_D _ret = MV1GetMatrixD( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x73a: {  // MV1SetVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetVisible( _a0, _a1 );
        return 1;
    }
    case 0x73b: {  // MV1GetVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetVisible( _a0 );
        return 1;
    }
    case 0x73c: {  // MV1SetMeshCategoryVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshCategoryVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x73d: {  // MV1GetMeshCategoryVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshCategoryVisible( _a0, _a1 );
        return 1;
    }
    case 0x73e: {  // MV1SetDifColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetDifColorScale( _a0, _a1 );
        return 1;
    }
    case 0x73f: {  // MV1GetDifColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetDifColorScale( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x740: {  // MV1SetSpcColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetSpcColorScale( _a0, _a1 );
        return 1;
    }
    case 0x741: {  // MV1GetSpcColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetSpcColorScale( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x742: {  // MV1SetEmiColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetEmiColorScale( _a0, _a1 );
        return 1;
    }
    case 0x743: {  // MV1GetEmiColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetEmiColorScale( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x744: {  // MV1SetAmbColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetAmbColorScale( _a0, _a1 );
        return 1;
    }
    case 0x745: {  // MV1GetAmbColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetAmbColorScale( _a0 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x746: {  // MV1GetSemiTransState  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetSemiTransState( _a0 );
        return 1;
    }
    case 0x747: {  // MV1SetOpacityRate  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetOpacityRate( _a0, _a1 );
        return 1;
    }
    case 0x748: {  // MV1GetOpacityRate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetOpacityRate( _a0 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x749: {  // MV1SetUseDrawMulAlphaColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseDrawMulAlphaColor( _a0, _a1 );
        return 1;
    }
    case 0x74a: {  // MV1GetUseDrawMulAlphaColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetUseDrawMulAlphaColor( _a0 );
        return 1;
    }
    case 0x74b: {  // MV1SetUseZBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseZBuffer( _a0, _a1 );
        return 1;
    }
    case 0x74c: {  // MV1SetWriteZBuffer  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetWriteZBuffer( _a0, _a1 );
        return 1;
    }
    case 0x74d: {  // MV1SetZBias  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetZBias( _a0, _a1 );
        return 1;
    }
    case 0x74e: {  // MV1SetUseVertDifColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseVertDifColor( _a0, _a1 );
        return 1;
    }
    case 0x74f: {  // MV1SetUseVertSpcColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseVertSpcColor( _a0, _a1 );
        return 1;
    }
    case 0x750: {  // MV1SetSampleFilterMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetSampleFilterMode( _a0, _a1 );
        return 1;
    }
    case 0x751: {  // MV1SetMaxAnisotropy  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaxAnisotropy( _a0, _a1 );
        return 1;
    }
    case 0x752: {  // MV1SetWireFrameDrawFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetWireFrameDrawFlag( _a0, _a1 );
        return 1;
    }
    case 0x753: {  // MV1RefreshVertColorFromMaterial  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1RefreshVertColorFromMaterial( _a0 );
        return 1;
    }
    case 0x754: {  // MV1SetPhysicsWorldGravity  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(VECTOR) );
        ctx->stat = MV1SetPhysicsWorldGravity( _a0, _a1 );
        return 1;
    }
    case 0x755: {  // MV1PhysicsCalculation  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1PhysicsCalculation( _a0, _a1 );
        return 1;
    }
    case 0x756: {  // MV1PhysicsResetState  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1PhysicsResetState( _a0 );
        return 1;
    }
    case 0x757: {  // MV1SetPrioritizePhysicsOverAnimFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetPrioritizePhysicsOverAnimFlag( _a0, _a1 );
        return 1;
    }
    case 0x758: {  // MV1SetUseShapeFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x759: {  // MV1GetMaterialNumberOrderFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNumberOrderFlag( _a0 );
        return 1;
    }
    case 0x75a: {  // MV1AttachAnim  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1AttachAnim( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x75b: {  // MV1DetachAnim  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DetachAnim( _a0, _a1 );
        return 1;
    }
    case 0x75c: {  // MV1SetAttachAnimTime  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetAttachAnimTime( _a0, _a1, _a2 );
        return 1;
    }
    case 0x75d: {  // MV1GetAttachAnimTime  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAttachAnimTime( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x75e: {  // MV1GetAttachAnimTotalTime  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAttachAnimTotalTime( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x75f: {  // MV1SetAttachAnimBlendRate  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = MV1SetAttachAnimBlendRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x760: {  // MV1GetAttachAnimBlendRate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAttachAnimBlendRate( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x761: {  // MV1SetAttachAnimBlendRateToFrame  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SetAttachAnimBlendRateToFrame( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x762: {  // MV1GetAttachAnimBlendRateToFrame  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAttachAnimBlendRateToFrame( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x763: {  // MV1SetAttachAnimTimeToFrame  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SetAttachAnimTimeToFrame( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x764: {  // MV1GetAttachAnimTimeToFrame  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAttachAnimTimeToFrame( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x765: {  // MV1GetAttachAnim  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAttachAnim( _a0, _a1 );
        return 1;
    }
    case 0x766: {  // MV1SetAttachAnimUseShapeFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetAttachAnimUseShapeFlag( _a0, _a1, _a2 );
        return 1;
    }
    case 0x767: {  // MV1GetAttachAnimUseShapeFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAttachAnimUseShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x768: {  // MV1GetAttachAnimFrameLocalPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetAttachAnimFrameLocalPosition( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x769: {  // MV1GetAttachAnimFrameLocalMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetAttachAnimFrameLocalMatrix( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x76a: {  // MV1GetAnimNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimNum( _a0 );
        return 1;
    }
    case 0x76b: {  // MV1SetAnimName  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        ctx->stat = MV1SetAnimName( _a0, _a1, _a2_t );
        return 1;
    }
    case 0x76c: {  // MV1GetAnimIndex  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = MV1GetAnimIndex( _a0, _a1_t );
        return 1;
    }
    case 0x76d: {  // MV1GetAnimTotalTime  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAnimTotalTime( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x76e: {  // MV1GetAnimTargetFrameNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameNum( _a0, _a1 );
        return 1;
    }
    case 0x76f: {  // MV1GetAnimTargetFrame  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrame( _a0, _a1, _a2 );
        return 1;
    }
    case 0x770: {  // MV1GetAnimTargetFrameKeySetNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameKeySetNum( _a0, _a1, _a2 );
        return 1;
    }
    case 0x771: {  // MV1GetAnimTargetFrameKeySet  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameKeySet( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x772: {  // MV1GetAnimKeySetNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetNum( _a0 );
        return 1;
    }
    case 0x773: {  // MV1GetAnimKeySetType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetType( _a0, _a1 );
        return 1;
    }
    case 0x774: {  // MV1GetAnimKeySetDataType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetDataType( _a0, _a1 );
        return 1;
    }
    case 0x775: {  // MV1GetAnimKeySetTimeType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetTimeType( _a0, _a1 );
        return 1;
    }
    case 0x776: {  // MV1GetAnimKeySetDataNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetDataNum( _a0, _a1 );
        return 1;
    }
    case 0x777: {  // MV1GetAnimKeyDataTime  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAnimKeyDataTime( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x778: {  // MV1GetAnimKeyDataIndexFromTime  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1GetAnimKeyDataIndexFromTime( _a0, _a1, _a2 );
        return 1;
    }
    case 0x779: {  // MV1GetAnimKeyDataToQuaternion  -> r_FLOAT4
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        FLOAT4 _ret = MV1GetAnimKeyDataToQuaternion( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(FLOAT4) );
        return 1;
    }
    case 0x77a: {  // MV1GetAnimKeyDataToQuaternionFromTime  -> r_FLOAT4
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        FLOAT4 _ret = MV1GetAnimKeyDataToQuaternionFromTime( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(FLOAT4) );
        return 1;
    }
    case 0x77b: {  // MV1GetAnimKeyDataToVector  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetAnimKeyDataToVector( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x77c: {  // MV1GetAnimKeyDataToVectorFromTime  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        VECTOR _ret = MV1GetAnimKeyDataToVectorFromTime( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x77d: {  // MV1GetAnimKeyDataToMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetAnimKeyDataToMatrix( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x77e: {  // MV1GetAnimKeyDataToMatrixFromTime  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        MATRIX _ret = MV1GetAnimKeyDataToMatrixFromTime( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x77f: {  // MV1GetAnimKeyDataToFlat  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAnimKeyDataToFlat( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x780: {  // MV1GetAnimKeyDataToFlatFromTime  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _ret = MV1GetAnimKeyDataToFlatFromTime( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x781: {  // MV1GetAnimKeyDataToLinear  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetAnimKeyDataToLinear( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x782: {  // MV1GetAnimKeyDataToLinearFromTime  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _ret = MV1GetAnimKeyDataToLinearFromTime( _a0, _a1, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x783: {  // MV1GetMaterialNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNum( _a0 );
        return 1;
    }
    case 0x784: {  // MV1SetMaterialTypeAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x785: {  // MV1SetMaterialType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x786: {  // MV1GetMaterialType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialType( _a0, _a1 );
        return 1;
    }
    case 0x787: {  // MV1SetMaterialDifColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMaterialDifColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x788: {  // MV1GetMaterialDifColor  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMaterialDifColor( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x789: {  // MV1SetMaterialSpcColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMaterialSpcColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x78a: {  // MV1GetMaterialSpcColor  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMaterialSpcColor( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x78b: {  // MV1SetMaterialEmiColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMaterialEmiColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x78c: {  // MV1GetMaterialEmiColor  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMaterialEmiColor( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x78d: {  // MV1SetMaterialAmbColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMaterialAmbColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x78e: {  // MV1GetMaterialAmbColor  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMaterialAmbColor( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x78f: {  // MV1SetMaterialSpcPower  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialSpcPower( _a0, _a1, _a2 );
        return 1;
    }
    case 0x790: {  // MV1GetMaterialSpcPower  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetMaterialSpcPower( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x791: {  // MV1SetMaterialDifMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x792: {  // MV1GetMaterialDifMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x793: {  // MV1SetMaterialSubDifMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSubDifMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x794: {  // MV1GetMaterialSubDifMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSubDifMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x795: {  // MV1SetMaterialSpcMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x796: {  // MV1GetMaterialSpcMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x797: {  // MV1SetMaterialNormalMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialNormalMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x798: {  // MV1GetMaterialNormalMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNormalMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x799: {  // MV1SetMaterialDifGradTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x79a: {  // MV1GetMaterialDifGradTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifGradTexture( _a0, _a1 );
        return 1;
    }
    case 0x79b: {  // MV1SetMaterialSpcGradTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x79c: {  // MV1GetMaterialSpcGradTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcGradTexture( _a0, _a1 );
        return 1;
    }
    case 0x79d: {  // MV1SetMaterialSphereMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x79e: {  // MV1GetMaterialSphereMapTexture  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSphereMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x79f: {  // MV1SetMaterialDifGradBlendTypeAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x7a0: {  // MV1SetMaterialDifGradBlendType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7a1: {  // MV1GetMaterialDifGradBlendType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifGradBlendType( _a0, _a1 );
        return 1;
    }
    case 0x7a2: {  // MV1SetMaterialSpcGradBlendTypeAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x7a3: {  // MV1SetMaterialSpcGradBlendType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7a4: {  // MV1GetMaterialSpcGradBlendType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcGradBlendType( _a0, _a1 );
        return 1;
    }
    case 0x7a5: {  // MV1SetMaterialSphereMapBlendTypeAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x7a6: {  // MV1SetMaterialSphereMapBlendType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7a7: {  // MV1GetMaterialSphereMapBlendType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSphereMapBlendType( _a0, _a1 );
        return 1;
    }
    case 0x7a8: {  // MV1SetMaterialOutLineWidthAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineWidthAll( _a0, _a1 );
        return 1;
    }
    case 0x7a9: {  // MV1SetMaterialOutLineWidth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineWidth( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7aa: {  // MV1GetMaterialOutLineWidth  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetMaterialOutLineWidth( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x7ab: {  // MV1SetMaterialOutLineDotWidthAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineDotWidthAll( _a0, _a1 );
        return 1;
    }
    case 0x7ac: {  // MV1SetMaterialOutLineDotWidth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineDotWidth( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7ad: {  // MV1GetMaterialOutLineDotWidth  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetMaterialOutLineDotWidth( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x7ae: {  // MV1SetMaterialOutLineColorAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a1;
        memcpy( &_a1, _a1_pv->pt + _a1_ap * _a1_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMaterialOutLineColorAll( _a0, _a1 );
        return 1;
    }
    case 0x7af: {  // MV1SetMaterialOutLineColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMaterialOutLineColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7b0: {  // MV1GetMaterialOutLineColor  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMaterialOutLineColor( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x7b1: {  // MV1SetMaterialDrawBlendModeAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendModeAll( _a0, _a1 );
        return 1;
    }
    case 0x7b2: {  // MV1SetMaterialDrawBlendMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7b3: {  // MV1GetMaterialDrawBlendMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawBlendMode( _a0, _a1 );
        return 1;
    }
    case 0x7b4: {  // MV1SetMaterialDrawBlendParamAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendParamAll( _a0, _a1 );
        return 1;
    }
    case 0x7b5: {  // MV1SetMaterialDrawBlendParam  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendParam( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7b6: {  // MV1GetMaterialDrawBlendParam  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawBlendParam( _a0, _a1 );
        return 1;
    }
    case 0x7b7: {  // MV1SetMaterialDrawAlphaTestAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAlphaTestAll( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x7b8: {  // MV1SetMaterialDrawAlphaTest  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAlphaTest( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x7b9: {  // MV1GetMaterialDrawAlphaTestEnable  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestEnable( _a0, _a1 );
        return 1;
    }
    case 0x7ba: {  // MV1GetMaterialDrawAlphaTestMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestMode( _a0, _a1 );
        return 1;
    }
    case 0x7bb: {  // MV1GetMaterialDrawAlphaTestParam  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestParam( _a0, _a1 );
        return 1;
    }
    case 0x7bc: {  // MV1SetMaterialDrawAddColorAll  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAddColorAll( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x7bd: {  // MV1SetMaterialDrawAddColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAddColor( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x7be: {  // MV1GetMaterialDrawAddColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        int _a3 = 0;
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        int _a4 = 0;
        ctx->stat = MV1GetMaterialDrawAddColor( _a0, _a1, &_a2, &_a3, &_a4 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        return 1;
    }
    case 0x7bf: {  // MV1GetTextureNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureNum( _a0 );
        return 1;
    }
    case 0x7c0: {  // MV1SetTextureColorFilePath  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        ctx->stat = MV1SetTextureColorFilePath( _a0, _a1, _a2_t );
        return 1;
    }
    case 0x7c1: {  // MV1SetTextureAlphaFilePath  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        ctx->stat = MV1SetTextureAlphaFilePath( _a0, _a1, _a2_t );
        return 1;
    }
    case 0x7c2: {  // MV1SetTextureGraphHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureGraphHandle( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x7c3: {  // MV1GetTextureGraphHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureGraphHandle( _a0, _a1 );
        return 1;
    }
    case 0x7c4: {  // MV1SetTextureAddressMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureAddressMode( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x7c5: {  // MV1GetTextureAddressModeU  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureAddressModeU( _a0, _a1 );
        return 1;
    }
    case 0x7c6: {  // MV1GetTextureAddressModeV  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureAddressModeV( _a0, _a1 );
        return 1;
    }
    case 0x7c7: {  // MV1GetTextureWidth  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureWidth( _a0, _a1 );
        return 1;
    }
    case 0x7c8: {  // MV1GetTextureHeight  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureHeight( _a0, _a1 );
        return 1;
    }
    case 0x7c9: {  // MV1GetTextureSemiTransState  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x7ca: {  // MV1SetTextureBumpImageFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureBumpImageFlag( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7cb: {  // MV1GetTextureBumpImageFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureBumpImageFlag( _a0, _a1 );
        return 1;
    }
    case 0x7cc: {  // MV1SetTextureBumpImageNextPixelLength  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetTextureBumpImageNextPixelLength( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7cd: {  // MV1GetTextureBumpImageNextPixelLength  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetTextureBumpImageNextPixelLength( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x7ce: {  // MV1SetTextureSampleFilterMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureSampleFilterMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7cf: {  // MV1GetTextureSampleFilterMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureSampleFilterMode( _a0, _a1 );
        return 1;
    }
    case 0x7d0: {  // MV1AddTextureGraphHandle  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( DX_TEXADDRESS_WRAP );
        int _a5 = hsp3dx_auto_geti( DX_TEXADDRESS_WRAP );
        int _a6 = hsp3dx_auto_geti( DX_DRAWMODE_ANISOTROPIC );
        ctx->stat = MV1AddTextureGraphHandle( _a0, _a1_t, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x7d1: {  // MV1LoadTexture  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = MV1LoadTexture( _a0_t );
        return 1;
    }
    case 0x7d2: {  // MV1GetFrameNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameNum( _a0 );
        return 1;
    }
    case 0x7d3: {  // MV1SearchFrame  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = MV1SearchFrame( _a0, _a1_t );
        return 1;
    }
    case 0x7d4: {  // MV1SearchFrameChild  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        ctx->stat = MV1SearchFrameChild( _a0, _a1, _a2_t );
        return 1;
    }
    case 0x7d5: {  // MV1GetFrameName2  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a2_t[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_t, 1024 );
#else
        const char *_a2_t = _a2_u8;
#endif
        ctx->stat = MV1GetFrameName2( _a0, _a1, _a2_t );
        return 1;
    }
    case 0x7d6: {  // MV1GetFrameParent  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameParent( _a0, _a1 );
        return 1;
    }
    case 0x7d7: {  // MV1GetFrameChildNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1GetFrameChildNum( _a0, _a1 );
        return 1;
    }
    case 0x7d8: {  // MV1GetFrameChild  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameChild( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7d9: {  // MV1GetFramePosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetFramePosition( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x7da: {  // MV1GetFramePositionD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR_D _ret = MV1GetFramePositionD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x7db: {  // MV1GetFrameBaseLocalMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetFrameBaseLocalMatrix( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x7dc: {  // MV1GetFrameBaseLocalMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        MATRIX_D _ret = MV1GetFrameBaseLocalMatrixD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x7dd: {  // MV1GetFrameLocalMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetFrameLocalMatrix( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x7de: {  // MV1GetFrameLocalMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        MATRIX_D _ret = MV1GetFrameLocalMatrixD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x7df: {  // MV1GetFrameLocalWorldMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetFrameLocalWorldMatrix( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x7e0: {  // MV1GetFrameLocalWorldMatrixD  -> r_MATRIX_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        MATRIX_D _ret = MV1GetFrameLocalWorldMatrixD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX_D) );
        return 1;
    }
    case 0x7e1: {  // MV1SetFrameUserLocalMatrix  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(MATRIX) );
        ctx->stat = MV1SetFrameUserLocalMatrix( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7e2: {  // MV1SetFrameUserLocalMatrixD  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = MV1SetFrameUserLocalMatrixD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7e3: {  // MV1ResetFrameUserLocalMatrix  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameUserLocalMatrix( _a0, _a1 );
        return 1;
    }
    case 0x7e4: {  // MV1SetFrameUserLocalWorldMatrix  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(MATRIX) );
        ctx->stat = MV1SetFrameUserLocalWorldMatrix( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7e5: {  // MV1SetFrameUserLocalWorldMatrixD  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = MV1SetFrameUserLocalWorldMatrixD( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7e6: {  // MV1ResetFrameUserLocalWorldMatrix  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameUserLocalWorldMatrix( _a0, _a1 );
        return 1;
    }
    case 0x7e7: {  // MV1GetFrameMaxVertexLocalPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetFrameMaxVertexLocalPosition( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x7e8: {  // MV1GetFrameMaxVertexLocalPositionD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR_D _ret = MV1GetFrameMaxVertexLocalPositionD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x7e9: {  // MV1GetFrameMinVertexLocalPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetFrameMinVertexLocalPosition( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x7ea: {  // MV1GetFrameMinVertexLocalPositionD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR_D _ret = MV1GetFrameMinVertexLocalPositionD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x7eb: {  // MV1GetFrameAvgVertexLocalPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetFrameAvgVertexLocalPosition( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x7ec: {  // MV1GetFrameAvgVertexLocalPositionD  -> r_VECTOR_D
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR_D _ret = MV1GetFrameAvgVertexLocalPositionD( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR_D) );
        return 1;
    }
    case 0x7ed: {  // MV1GetFrameVertexNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x7ee: {  // MV1GetFrameTriangleNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameTriangleNum( _a0, _a1 );
        return 1;
    }
    case 0x7ef: {  // MV1GetFrameMeshNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameMeshNum( _a0, _a1 );
        return 1;
    }
    case 0x7f0: {  // MV1GetFrameMesh  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameMesh( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7f1: {  // MV1SetFrameVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetFrameVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7f2: {  // MV1GetFrameVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameVisible( _a0, _a1 );
        return 1;
    }
    case 0x7f3: {  // MV1SetFrameDifColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetFrameDifColorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7f4: {  // MV1SetFrameSpcColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetFrameSpcColorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7f5: {  // MV1SetFrameEmiColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetFrameEmiColorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7f6: {  // MV1SetFrameAmbColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetFrameAmbColorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7f7: {  // MV1GetFrameDifColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetFrameDifColorScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x7f8: {  // MV1GetFrameSpcColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetFrameSpcColorScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x7f9: {  // MV1GetFrameEmiColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetFrameEmiColorScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x7fa: {  // MV1GetFrameAmbColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetFrameAmbColorScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x7fb: {  // MV1GetFrameSemiTransState  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x7fc: {  // MV1SetFrameOpacityRate  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetFrameOpacityRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7fd: {  // MV1GetFrameOpacityRate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetFrameOpacityRate( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x7fe: {  // MV1SetFrameBaseVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetFrameBaseVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x7ff: {  // MV1GetFrameBaseVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameBaseVisible( _a0, _a1 );
        return 1;
    }
    case 0x800: {  // MV1SetFrameTextureAddressTransform  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        float _a6 = (float)hsp3dx_auto_getd( 0.0 );
        float _a7 = (float)hsp3dx_auto_getd( 0.0 );
        float _a8 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetFrameTextureAddressTransform( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x801: {  // MV1SetFrameTextureAddressTransformMatrix  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(MATRIX) );
        ctx->stat = MV1SetFrameTextureAddressTransformMatrix( _a0, _a1, _a2 );
        return 1;
    }
    case 0x802: {  // MV1ResetFrameTextureAddressTransform  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameTextureAddressTransform( _a0, _a1 );
        return 1;
    }
    case 0x803: {  // MV1GetMeshNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshNum( _a0 );
        return 1;
    }
    case 0x804: {  // MV1GetMeshMaterial  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshMaterial( _a0, _a1 );
        return 1;
    }
    case 0x805: {  // MV1GetMeshVertexNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x806: {  // MV1GetMeshTriangleNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTriangleNum( _a0, _a1 );
        return 1;
    }
    case 0x807: {  // MV1SetMeshVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x808: {  // MV1GetMeshVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshVisible( _a0, _a1 );
        return 1;
    }
    case 0x809: {  // MV1SetMeshDifColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMeshDifColorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x80a: {  // MV1SetMeshSpcColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMeshSpcColorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x80b: {  // MV1SetMeshEmiColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMeshEmiColorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x80c: {  // MV1SetMeshAmbColorScale  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        if ( _a2_pv->pt == nullptr || _a2_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a2;
        memcpy( &_a2, _a2_pv->pt + _a2_ap * _a2_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = MV1SetMeshAmbColorScale( _a0, _a1, _a2 );
        return 1;
    }
    case 0x80d: {  // MV1GetMeshDifColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMeshDifColorScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x80e: {  // MV1GetMeshSpcColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMeshSpcColorScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x80f: {  // MV1GetMeshEmiColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMeshEmiColorScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x810: {  // MV1GetMeshAmbColorScale  -> r_COLOR_F
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        COLOR_F _ret = MV1GetMeshAmbColorScale( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(COLOR_F) );
        return 1;
    }
    case 0x811: {  // MV1SetMeshOpacityRate  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMeshOpacityRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x812: {  // MV1GetMeshOpacityRate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetMeshOpacityRate( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x813: {  // MV1SetMeshDrawBlendMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshDrawBlendMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x814: {  // MV1SetMeshDrawBlendParam  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshDrawBlendParam( _a0, _a1, _a2 );
        return 1;
    }
    case 0x815: {  // MV1GetMeshDrawBlendMode  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshDrawBlendMode( _a0, _a1 );
        return 1;
    }
    case 0x816: {  // MV1GetMeshDrawBlendParam  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshDrawBlendParam( _a0, _a1 );
        return 1;
    }
    case 0x817: {  // MV1SetMeshBaseVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshBaseVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x818: {  // MV1GetMeshBaseVisible  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshBaseVisible( _a0, _a1 );
        return 1;
    }
    case 0x819: {  // MV1SetMeshBackCulling  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshBackCulling( _a0, _a1, _a2 );
        return 1;
    }
    case 0x81a: {  // MV1GetMeshBackCulling  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshBackCulling( _a0, _a1 );
        return 1;
    }
    case 0x81b: {  // MV1GetMeshMaxPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetMeshMaxPosition( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x81c: {  // MV1GetMeshMinPosition  -> r_VECTOR
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        VECTOR _ret = MV1GetMeshMinPosition( _a0, _a1 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(VECTOR) );
        return 1;
    }
    case 0x81d: {  // MV1GetMeshTListNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTListNum( _a0, _a1 );
        return 1;
    }
    case 0x81e: {  // MV1GetMeshTList  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTList( _a0, _a1, _a2 );
        return 1;
    }
    case 0x81f: {  // MV1GetMeshSemiTransState  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x820: {  // MV1SetMeshUseVertDifColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshUseVertDifColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x821: {  // MV1SetMeshUseVertSpcColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshUseVertSpcColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x822: {  // MV1GetMeshUseVertDifColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshUseVertDifColor( _a0, _a1 );
        return 1;
    }
    case 0x823: {  // MV1GetMeshUseVertSpcColor  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshUseVertSpcColor( _a0, _a1 );
        return 1;
    }
    case 0x824: {  // MV1GetMeshShapeFlag  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x825: {  // MV1GetShapeNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeNum( _a0 );
        return 1;
    }
    case 0x826: {  // MV1SearchShape  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = MV1SearchShape( _a0, _a1_t );
        return 1;
    }
    case 0x827: {  // MV1GetShapeTargetMeshNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeTargetMeshNum( _a0, _a1 );
        return 1;
    }
    case 0x828: {  // MV1GetShapeTargetMesh  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeTargetMesh( _a0, _a1, _a2 );
        return 1;
    }
    case 0x829: {  // MV1SetShapeRate  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( DX_MV1_SHAPERATE_ADD );
        ctx->stat = MV1SetShapeRate( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x82a: {  // MV1GetShapeRate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetShapeRate( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x82b: {  // MV1GetShapeApplyRate  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _ret = MV1GetShapeApplyRate( _a0, _a1 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x82c: {  // MV1GetTriangleListNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListNum( _a0 );
        return 1;
    }
    case 0x82d: {  // MV1GetTriangleListVertexType  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListVertexType( _a0, _a1 );
        return 1;
    }
    case 0x82e: {  // MV1GetTriangleListPolygonNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListPolygonNum( _a0, _a1 );
        return 1;
    }
    case 0x82f: {  // MV1GetTriangleListVertexNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x830: {  // MV1GetTriangleListLocalWorldMatrixNum  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListLocalWorldMatrixNum( _a0, _a1 );
        return 1;
    }
    case 0x831: {  // MV1GetTriangleListLocalWorldMatrix  -> r_MATRIX
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        if ( _ret_pv->pt == nullptr || _ret_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        MATRIX _ret = MV1GetTriangleListLocalWorldMatrix( _a0, _a1, _a2 );
        memcpy( _ret_pv->pt + _ret_ap * _ret_pv->len[0], &_ret, sizeof(MATRIX) );
        return 1;
    }
    case 0x832: {  // MV1GetTriangleListPolygonVertexPosition  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        PVal *_a3_pv; APTR _a3_ap;
        _a3_ap = code_getva( &_a3_pv );
        if ( _a3_pv->pt == nullptr || _a3_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR *_a3 = (VECTOR *)(_a3_pv->pt + _a3_ap * _a3_pv->len[0]);
        PVal *_a4_pv; APTR _a4_ap;
        _a4_ap = code_getva( &_a4_pv );
        float _a4 = 0.0f;
        ctx->stat = MV1GetTriangleListPolygonVertexPosition( _a0, _a1, _a2, _a3, &_a4 );
        double _a4_d = (double)_a4;
        code_setva( _a4_pv, _a4_ap, TYPE_DNUM, &_a4_d );
        return 1;
    }
    case 0x833: {  // MV1GetTriangleListUseMaterial  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListUseMaterial( _a0, _a1 );
        return 1;
    }
    case 0x834: {  // MV1SetupCollInfo  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( 32 );
        int _a3 = hsp3dx_auto_geti( 8 );
        int _a4 = hsp3dx_auto_geti( 32 );
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1SetupCollInfo( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x835: {  // MV1TerminateCollInfo  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1TerminateCollInfo( _a0, _a1, _a2 );
        return 1;
    }
    case 0x836: {  // MV1RefreshCollInfo  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1RefreshCollInfo( _a0, _a1, _a2 );
        return 1;
    }
    case 0x837: {  // MV1SetupReferenceMesh  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1SetupReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x838: {  // MV1TerminateReferenceMesh  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1TerminateReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x839: {  // MV1RefreshReferenceMesh  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1RefreshReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x83a: {  // Live2D_SetCubism4CoreDLLPath  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = Live2D_SetCubism4CoreDLLPath( _a0_t );
        return 1;
    }
    case 0x83b: {  // Live2D_SetCubism3CoreDLLPath  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = Live2D_SetCubism3CoreDLLPath( _a0_t );
        return 1;
    }
    case 0x83c: {  // Live2D_RenderBegin  -> r_int
        ctx->stat = Live2D_RenderBegin(  );
        return 1;
    }
    case 0x83d: {  // Live2D_RenderEnd  -> r_int
        ctx->stat = Live2D_RenderEnd(  );
        return 1;
    }
    case 0x83e: {  // Live2D_LoadModel  -> r_int
        const char *_a0_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a0_t[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_t, 1024 );
#else
        const char *_a0_t = _a0_u8;
#endif
        ctx->stat = Live2D_LoadModel( _a0_t );
        return 1;
    }
    case 0x83f: {  // Live2D_DeleteModel  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_DeleteModel( _a0 );
        return 1;
    }
    case 0x840: {  // Live2D_InitModel  -> r_int
        ctx->stat = Live2D_InitModel(  );
        return 1;
    }
    case 0x841: {  // Live2D_SetUseAutoScaling  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseAutoScaling( _a0 );
        return 1;
    }
    case 0x842: {  // Live2D_SetUseAutoCentering  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseAutoCentering( _a0 );
        return 1;
    }
    case 0x843: {  // Live2D_SetUseReverseYAxis  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseReverseYAxis( _a0 );
        return 1;
    }
    case 0x844: {  // Live2D_Model_Update  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_Update( _a0, _a1 );
        return 1;
    }
    case 0x845: {  // Live2D_Model_SetTranslate  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetTranslate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x846: {  // Live2D_Model_SetExtendRate  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetExtendRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x847: {  // Live2D_Model_SetRotate  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetRotate( _a0, _a1 );
        return 1;
    }
    case 0x848: {  // Live2D_Model_Draw  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_Draw( _a0 );
        return 1;
    }
    case 0x849: {  // Live2D_Model_StartMotion  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( -1.0 );
        float _a4 = (float)hsp3dx_auto_getd( -1.0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = Live2D_Model_StartMotion( _a0, _a1_t, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x84a: {  // Live2D_Model_GetLastPlayMotionNo  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetLastPlayMotionNo( _a0 );
        return 1;
    }
    case 0x84b: {  // Live2D_Model_IsMotionFinished  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_IsMotionFinished( _a0 );
        return 1;
    }
    case 0x84c: {  // Live2D_Model_GetMotionPlayTime  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        float _ret = Live2D_Model_GetMotionPlayTime( _a0 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x84d: {  // Live2D_Model_SetExpression  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = Live2D_Model_SetExpression( _a0, _a1_t );
        return 1;
    }
    case 0x84e: {  // Live2D_Model_HitTest  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_HitTest( _a0, _a1_t, _a2, _a3 );
        return 1;
    }
    case 0x84f: {  // Live2D_Model_GetParameterCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetParameterCount( _a0 );
        return 1;
    }
    case 0x850: {  // Live2D_Model_GetParameterValue  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        float _ret = Live2D_Model_GetParameterValue( _a0, _a1_t );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x851: {  // Live2D_Model_SetParameterValue  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetParameterValue( _a0, _a1_t, _a2 );
        return 1;
    }
    case 0x852: {  // Live2D_Model_GetHitAreasCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetHitAreasCount( _a0 );
        return 1;
    }
    case 0x853: {  // Live2D_Model_GetExpressionCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetExpressionCount( _a0 );
        return 1;
    }
    case 0x854: {  // Live2D_Model_GetMotionGroupCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetMotionGroupCount( _a0 );
        return 1;
    }
    case 0x855: {  // Live2D_Model_GetMotionCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        ctx->stat = Live2D_Model_GetMotionCount( _a0, _a1_t );
        return 1;
    }
    case 0x856: {  // Live2D_Model_GetMotionFadeInTimeValue  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        float _ret = Live2D_Model_GetMotionFadeInTimeValue( _a0, _a1_t, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x857: {  // Live2D_Model_GetMotionFadeOutTimeValue  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
#ifdef _WIN32
        wchar_t _a1_t[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_t, 1024 );
#else
        const char *_a1_t = _a1_u8;
#endif
        int _a2 = hsp3dx_auto_geti( 0 );
        float _ret = Live2D_Model_GetMotionFadeOutTimeValue( _a0, _a1_t, _a2 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x858: {  // Live2D_Model_GetEyeBlinkParameterCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetEyeBlinkParameterCount( _a0 );
        return 1;
    }
    case 0x859: {  // Live2D_Model_GetLipSyncParameterCount  -> r_int
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetLipSyncParameterCount( _a0 );
        return 1;
    }
    case 0x85a: {  // Live2D_Model_GetCanvasWidth  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        float _ret = Live2D_Model_GetCanvasWidth( _a0 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    case 0x85b: {  // Live2D_Model_GetCanvasHeight  -> r_float
        PVal *_ret_pv; APTR _ret_ap;
        _ret_ap = code_getva( &_ret_pv );
        int _a0 = hsp3dx_auto_geti( 0 );
        float _ret = Live2D_Model_GetCanvasHeight( _a0 );
        double _ret_d = (double)_ret;
        code_setva( _ret_pv, _ret_ap, TYPE_DNUM, &_ret_d );
        return 1;
    }
    }
    return 0;   // 未処理 → 呼び出し側で HSPERR_UNSUPPORTED_FUNCTION 投げる
}
