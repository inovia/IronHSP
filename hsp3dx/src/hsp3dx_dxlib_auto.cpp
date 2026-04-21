//
//  hsp3dx_dxlib_auto.cpp — Phase 5.3 自動生成 DxLib binding dispatcher
//  DO NOT EDIT — tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py で再生成
//  関数数: 1333
//
//  hsp3dx_extcmd.cpp の cmdfunc_extcmd() から以下で呼ばれる:
//      if ( hsp3dx_dxlib_auto_dispatch( cmd, ctx ) ) return RUNMODE_RUN;
//
#include <stdio.h>
#include <string.h>
#include <windows.h>
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
    case 0x200: {  // DxLib_GlobalStructInitialize
        ctx->stat = DxLib_GlobalStructInitialize(  );
        return 1;
    }
    case 0x201: {  // DxLib_IsInit
        ctx->stat = DxLib_IsInit(  );
        return 1;
    }
    case 0x202: {  // GetLastErrorCode
        ctx->stat = GetLastErrorCode(  );
        return 1;
    }
    case 0x203: {  // GetLastErrorMessage
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLastErrorMessage( _a0_w, _a1 );
        return 1;
    }
    case 0x204: {  // SetAlwaysRunFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetAlwaysRunFlag( _a0 );
        return 1;
    }
    case 0x205: {  // WaitTimer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = WaitTimer( _a0 );
        return 1;
    }
    case 0x206: {  // WaitKey
        ctx->stat = WaitKey(  );
        return 1;
    }
    case 0x207: {  // SleepThread
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SleepThread( _a0 );
        return 1;
    }
    case 0x208: {  // GetNowCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetNowCount( _a0 );
        return 1;
    }
    case 0x209: {  // GetRand
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetRand( _a0 );
        return 1;
    }
    case 0x20a: {  // SRand
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SRand( _a0 );
        return 1;
    }
    case 0x20b: {  // GetBatteryLifePercent
        ctx->stat = GetBatteryLifePercent(  );
        return 1;
    }
    case 0x20c: {  // GetClipboardText
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = GetClipboardText( _a0_w, _a1 );
        return 1;
    }
    case 0x20d: {  // SetClipboardText
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetClipboardText( _a0_w );
        return 1;
    }
    case 0x20e: {  // LogFileAdd
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LogFileAdd( _a0_w );
        return 1;
    }
    case 0x20f: {  // LogFileTabAdd
        ctx->stat = LogFileTabAdd(  );
        return 1;
    }
    case 0x210: {  // LogFileTabSub
        ctx->stat = LogFileTabSub(  );
        return 1;
    }
    case 0x211: {  // ErrorLogAdd
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = ErrorLogAdd( _a0_w );
        return 1;
    }
    case 0x212: {  // ErrorLogTabAdd
        ctx->stat = ErrorLogTabAdd(  );
        return 1;
    }
    case 0x213: {  // ErrorLogTabSub
        ctx->stat = ErrorLogTabSub(  );
        return 1;
    }
    case 0x214: {  // SetUseTimeStampFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTimeStampFlag( _a0 );
        return 1;
    }
    case 0x215: {  // SetOutApplicationLogValidFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetOutApplicationLogValidFlag( _a0 );
        return 1;
    }
    case 0x216: {  // SetOutApplicationSystemLogValidFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetOutApplicationSystemLogValidFlag( _a0 );
        return 1;
    }
    case 0x217: {  // SetApplicationLogFileName
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetApplicationLogFileName( _a0_w );
        return 1;
    }
    case 0x218: {  // SetApplicationLogSaveDirectory
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetApplicationLogSaveDirectory( _a0_w );
        return 1;
    }
    case 0x219: {  // SetUseDateNameLogFile
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDateNameLogFile( _a0 );
        return 1;
    }
    case 0x21a: {  // SetLogDrawOutFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLogDrawOutFlag( _a0 );
        return 1;
    }
    case 0x21b: {  // GetLogDrawFlag
        ctx->stat = GetLogDrawFlag(  );
        return 1;
    }
    case 0x21c: {  // SetLogFontSize
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLogFontSize( _a0 );
        return 1;
    }
    case 0x21d: {  // SetLogFontHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLogFontHandle( _a0 );
        return 1;
    }
    case 0x21e: {  // SetLogDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLogDrawArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x21f: {  // putsDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 1 );
        ctx->stat = putsDx( _a0_w, _a1 );
        return 1;
    }
    case 0x220: {  // clsDx
        ctx->stat = clsDx(  );
        return 1;
    }
    case 0x221: {  // setPrintColorDx
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = setPrintColorDx( _a0, _a1 );
        return 1;
    }
    case 0x222: {  // SetUseASyncLoadFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseASyncLoadFlag( _a0 );
        return 1;
    }
    case 0x223: {  // GetUseASyncLoadFlag
        ctx->stat = GetUseASyncLoadFlag(  );
        return 1;
    }
    case 0x224: {  // CheckHandleASyncLoad
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckHandleASyncLoad( _a0 );
        return 1;
    }
    case 0x225: {  // GetHandleASyncLoadResult
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetHandleASyncLoadResult( _a0 );
        return 1;
    }
    case 0x226: {  // SetASyncLoadFinishDeleteFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetASyncLoadFinishDeleteFlag( _a0 );
        return 1;
    }
    case 0x227: {  // WaitHandleASyncLoad
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = WaitHandleASyncLoad( _a0 );
        return 1;
    }
    case 0x228: {  // WaitHandleASyncLoadAll
        ctx->stat = WaitHandleASyncLoadAll(  );
        return 1;
    }
    case 0x229: {  // GetASyncLoadNum
        ctx->stat = GetASyncLoadNum(  );
        return 1;
    }
    case 0x22a: {  // SetASyncLoadThreadNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetASyncLoadThreadNum( _a0 );
        return 1;
    }
    case 0x22b: {  // SetDeleteHandleFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = SetDeleteHandleFlag( _a0, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x22c: {  // SetMouseDispFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMouseDispFlag( _a0 );
        return 1;
    }
    case 0x22d: {  // SetMouseDispIgnoreMenuFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMouseDispIgnoreMenuFlag( _a0 );
        return 1;
    }
    case 0x22e: {  // GetMouseWheelRotVol
        int _a0 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetMouseWheelRotVol( _a0 );
        return 1;
    }
    case 0x22f: {  // GetMouseHWheelRotVol
        int _a0 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetMouseHWheelRotVol( _a0 );
        return 1;
    }
    case 0x230: {  // GetMouseInputLog
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
    case 0x231: {  // GetMouseInputLog2
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
    case 0x232: {  // GetTouchInputNum
        ctx->stat = GetTouchInputNum(  );
        return 1;
    }
    case 0x233: {  // GetTouchInput
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
    case 0x234: {  // GetTouchInputLogNum
        ctx->stat = GetTouchInputLogNum(  );
        return 1;
    }
    case 0x235: {  // ClearTouchInputLog
        ctx->stat = ClearTouchInputLog(  );
        return 1;
    }
    case 0x236: {  // GetTouchInputDownLogNum
        ctx->stat = GetTouchInputDownLogNum(  );
        return 1;
    }
    case 0x237: {  // ClearTouchInputDownLog
        ctx->stat = ClearTouchInputDownLog(  );
        return 1;
    }
    case 0x238: {  // GetTouchInputUpLogNum
        ctx->stat = GetTouchInputUpLogNum(  );
        return 1;
    }
    case 0x239: {  // ClearTouchInputUpLog
        ctx->stat = ClearTouchInputUpLog(  );
        return 1;
    }
    case 0x23a: {  // DxSetAllocPrintFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocPrintFlag( _a0 );
        return 1;
    }
    case 0x23b: {  // DxGetAllocNum
        ctx->stat = DxGetAllocNum(  );
        return 1;
    }
    case 0x23c: {  // DxErrorCheckAlloc
        ctx->stat = DxErrorCheckAlloc(  );
        return 1;
    }
    case 0x23d: {  // DxSetAllocSizeOutFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocSizeOutFlag( _a0 );
        return 1;
    }
    case 0x23e: {  // DxSetAllocMemoryErrorCheckFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocMemoryErrorCheckFlag( _a0 );
        return 1;
    }
    case 0x23f: {  // GetUseCharCodeFormat
        ctx->stat = GetUseCharCodeFormat(  );
        return 1;
    }
    case 0x240: {  // Get_wchar_t_CharCodeFormat
        ctx->stat = Get_wchar_t_CharCodeFormat(  );
        return 1;
    }
    case 0x241: {  // strcmpDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = strcmpDx( _a0_w, _a1_w );
        return 1;
    }
    case 0x242: {  // stricmpDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = stricmpDx( _a0_w, _a1_w );
        return 1;
    }
    case 0x243: {  // strncmpDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = strncmpDx( _a0_w, _a1_w, _a2 );
        return 1;
    }
    case 0x244: {  // strncmp2Dx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = strncmp2Dx( _a0_w, _a1_w, _a2 );
        return 1;
    }
    case 0x245: {  // strpncmpDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = strpncmpDx( _a0_w, _a1_w, _a2, _a3 );
        return 1;
    }
    case 0x246: {  // strpncmp2Dx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = strpncmp2Dx( _a0_w, _a1_w, _a2, _a3 );
        return 1;
    }
    case 0x247: {  // strstr2Dx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = strstr2Dx( _a0_w, _a1_w );
        return 1;
    }
    case 0x248: {  // strrstr2Dx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = strrstr2Dx( _a0_w, _a1_w );
        return 1;
    }
    case 0x249: {  // atoiDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = atoiDx( _a0_w );
        return 1;
    }
    case 0x24a: {  // ProcessNetMessage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ProcessNetMessage( _a0 );
        return 1;
    }
    case 0x24b: {  // PreparationListenNetWork
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = PreparationListenNetWork( _a0 );
        return 1;
    }
    case 0x24c: {  // PreparationListenNetWork_IPv6
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = PreparationListenNetWork_IPv6( _a0 );
        return 1;
    }
    case 0x24d: {  // StopListenNetWork
        ctx->stat = StopListenNetWork(  );
        return 1;
    }
    case 0x24e: {  // CloseNetWork
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CloseNetWork( _a0 );
        return 1;
    }
    case 0x24f: {  // GetNetWorkAcceptState
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetNetWorkAcceptState( _a0 );
        return 1;
    }
    case 0x250: {  // GetNetWorkDataLength
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetNetWorkDataLength( _a0 );
        return 1;
    }
    case 0x251: {  // GetNetWorkSendDataLength
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetNetWorkSendDataLength( _a0 );
        return 1;
    }
    case 0x252: {  // GetNewAcceptNetWork
        ctx->stat = GetNewAcceptNetWork(  );
        return 1;
    }
    case 0x253: {  // GetLostNetWork
        ctx->stat = GetLostNetWork(  );
        return 1;
    }
    case 0x254: {  // SetConnectTimeOutWait
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetConnectTimeOutWait( _a0 );
        return 1;
    }
    case 0x255: {  // SetUseDXNetWorkProtocol
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDXNetWorkProtocol( _a0 );
        return 1;
    }
    case 0x256: {  // GetUseDXNetWorkProtocol
        ctx->stat = GetUseDXNetWorkProtocol(  );
        return 1;
    }
    case 0x257: {  // SetUseDXProtocol
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDXProtocol( _a0 );
        return 1;
    }
    case 0x258: {  // GetUseDXProtocol
        ctx->stat = GetUseDXProtocol(  );
        return 1;
    }
    case 0x259: {  // SetNetWorkCloseAfterLostFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNetWorkCloseAfterLostFlag( _a0 );
        return 1;
    }
    case 0x25a: {  // GetNetWorkCloseAfterLostFlag
        ctx->stat = GetNetWorkCloseAfterLostFlag(  );
        return 1;
    }
    case 0x25b: {  // NetWorkRecvBufferClear
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = NetWorkRecvBufferClear( _a0 );
        return 1;
    }
    case 0x25c: {  // MakeUDPSocket
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = MakeUDPSocket( _a0 );
        return 1;
    }
    case 0x25d: {  // MakeUDPSocket_IPv6
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = MakeUDPSocket_IPv6( _a0 );
        return 1;
    }
    case 0x25e: {  // DeleteUDPSocket
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteUDPSocket( _a0 );
        return 1;
    }
    case 0x25f: {  // CheckNetWorkRecvUDP
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckNetWorkRecvUDP( _a0 );
        return 1;
    }
    case 0x260: {  // ClearInputCharBuf
        ctx->stat = ClearInputCharBuf(  );
        return 1;
    }
    case 0x261: {  // GetOneChar
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetOneChar( _a0_w, _a1 );
        return 1;
    }
    case 0x262: {  // GetOneCharWait
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetOneCharWait( _a0_w, _a1 );
        return 1;
    }
    case 0x263: {  // DrawIMEInputString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawIMEInputString( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x264: {  // DrawIMEInputExtendString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawIMEInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x265: {  // SetUseIMEFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseIMEFlag( _a0 );
        return 1;
    }
    case 0x266: {  // GetUseIMEFlag
        ctx->stat = GetUseIMEFlag(  );
        return 1;
    }
    case 0x267: {  // SetInputStringMaxLengthIMESync
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetInputStringMaxLengthIMESync( _a0 );
        return 1;
    }
    case 0x268: {  // SetIMEInputStringMaxLength
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetIMEInputStringMaxLength( _a0 );
        return 1;
    }
    case 0x269: {  // GetStringPoint
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetStringPoint( _a0_w, _a1 );
        return 1;
    }
    case 0x26a: {  // GetStringPoint2
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetStringPoint2( _a0_w, _a1 );
        return 1;
    }
    case 0x26b: {  // GetStringLength
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = GetStringLength( _a0_w );
        return 1;
    }
    case 0x26c: {  // DrawObtainsString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
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
        ctx->stat = DrawObtainsString( _a0, _a1, _a2, _a3_w, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, &_a12 );
        code_setva( _a12_pv, _a12_ap, TYPE_INUM, &_a12 );
        return 1;
    }
    case 0x26d: {  // DrawObtainsString_CharClip
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
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
        ctx->stat = DrawObtainsString_CharClip( _a0, _a1, _a2, _a3_w, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, &_a12 );
        code_setva( _a12_pv, _a12_ap, TYPE_INUM, &_a12 );
        return 1;
    }
    case 0x26e: {  // DrawObtainsString_WordClip
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
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
        ctx->stat = DrawObtainsString_WordClip( _a0, _a1, _a2, _a3_w, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, &_a12 );
        code_setva( _a12_pv, _a12_ap, TYPE_INUM, &_a12 );
        return 1;
    }
    case 0x26f: {  // GetObtainsStringCharPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
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
        ctx->stat = GetObtainsStringCharPosition( _a0, _a1, _a2, _a3_w, _a4, &_a5, &_a6, _a7, &_a8 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a8_pv, _a8_ap, TYPE_INUM, &_a8 );
        return 1;
    }
    case 0x270: {  // GetObtainsStringCharPosition_CharClip
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
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
        ctx->stat = GetObtainsStringCharPosition_CharClip( _a0, _a1, _a2, _a3_w, _a4, &_a5, &_a6, _a7, &_a8 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a8_pv, _a8_ap, TYPE_INUM, &_a8 );
        return 1;
    }
    case 0x271: {  // GetObtainsStringCharPosition_WordClip
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
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
        ctx->stat = GetObtainsStringCharPosition_WordClip( _a0, _a1, _a2, _a3_w, _a4, &_a5, &_a6, _a7, &_a8 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a8_pv, _a8_ap, TYPE_INUM, &_a8 );
        return 1;
    }
    case 0x272: {  // DrawObtainsBox
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
    case 0x273: {  // KeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = KeyInputNumber( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x274: {  // GetIMEInputModeStr
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = GetIMEInputModeStr( _a0_w );
        return 1;
    }
    case 0x275: {  // SetIMEInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetIMEInputString( _a0_w );
        return 1;
    }
    case 0x276: {  // SetKeyInputStringFont
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputStringFont( _a0 );
        return 1;
    }
    case 0x277: {  // DrawKeyInputModeString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawKeyInputModeString( _a0, _a1 );
        return 1;
    }
    case 0x278: {  // InitKeyInput
        ctx->stat = InitKeyInput(  );
        return 1;
    }
    case 0x279: {  // DeleteKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteKeyInput( _a0 );
        return 1;
    }
    case 0x27a: {  // SetActiveKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetActiveKeyInput( _a0 );
        return 1;
    }
    case 0x27b: {  // GetActiveKeyInput
        ctx->stat = GetActiveKeyInput(  );
        return 1;
    }
    case 0x27c: {  // CheckKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckKeyInput( _a0 );
        return 1;
    }
    case 0x27d: {  // ReStartKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReStartKeyInput( _a0 );
        return 1;
    }
    case 0x27e: {  // ProcessActKeyInput
        ctx->stat = ProcessActKeyInput(  );
        return 1;
    }
    case 0x27f: {  // DrawKeyInputString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawKeyInputString( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x280: {  // DrawKeyInputExtendString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawKeyInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x281: {  // SetKeyInputDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputDrawArea( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x282: {  // SetKeyInputSelectArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputSelectArea( _a0, _a1, _a2 );
        return 1;
    }
    case 0x283: {  // GetKeyInputSelectArea
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
    case 0x284: {  // SetKeyInputDrawStartPos
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputDrawStartPos( _a0, _a1 );
        return 1;
    }
    case 0x285: {  // GetKeyInputDrawStartPos
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputDrawStartPos( _a0 );
        return 1;
    }
    case 0x286: {  // SetKeyInputCursorBrinkTime
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorBrinkTime( _a0 );
        return 1;
    }
    case 0x287: {  // SetKeyInputCursorBrinkFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorBrinkFlag( _a0 );
        return 1;
    }
    case 0x288: {  // SetKeyInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputString( _a0_w, _a1 );
        return 1;
    }
    case 0x289: {  // SetKeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputNumber( _a0, _a1 );
        return 1;
    }
    case 0x28a: {  // SetKeyInputNumberToFloat
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputNumberToFloat( _a0, _a1 );
        return 1;
    }
    case 0x28b: {  // GetKeyInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputString( _a0_w, _a1 );
        return 1;
    }
    case 0x28c: {  // GetKeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputNumber( _a0 );
        return 1;
    }
    case 0x28d: {  // SetKeyInputCursorPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorPosition( _a0, _a1 );
        return 1;
    }
    case 0x28e: {  // GetKeyInputCursorPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputCursorPosition( _a0 );
        return 1;
    }
    case 0x28f: {  // FileRead_open
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_open( _a0_w, _a1 );
        return 1;
    }
    case 0x290: {  // FileRead_close
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_close( _a0 );
        return 1;
    }
    case 0x291: {  // FileRead_seek
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_seek( _a0, _a1, _a2 );
        return 1;
    }
    case 0x292: {  // FileRead_idle_chk
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_idle_chk( _a0 );
        return 1;
    }
    case 0x293: {  // FileRead_eof
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_eof( _a0 );
        return 1;
    }
    case 0x294: {  // FileRead_gets
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_gets( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x295: {  // FileRead_fullyLoad
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = FileRead_fullyLoad( _a0_w );
        return 1;
    }
    case 0x296: {  // FileRead_fullyLoad_delete
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_fullyLoad_delete( _a0 );
        return 1;
    }
    case 0x297: {  // GetStreamFunctionDefault
        ctx->stat = GetStreamFunctionDefault(  );
        return 1;
    }
    case 0x298: {  // ConvertFullPath
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = ConvertFullPath( _a0_w, _a1_w, _a2_w );
        return 1;
    }
    case 0x299: {  // CheckHitKeyAll
        int _a0 = hsp3dx_auto_geti( DX_CHECKINPUT_ALL );
        ctx->stat = CheckHitKeyAll( _a0 );
        return 1;
    }
    case 0x29a: {  // GetHitKeyStateAllEx
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        ctx->stat = GetHitKeyStateAllEx( &_a0 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        return 1;
    }
    case 0x29b: {  // GetJoypadNum
        ctx->stat = GetJoypadNum(  );
        return 1;
    }
    case 0x29c: {  // GetJoypadButtonNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadButtonNum( _a0 );
        return 1;
    }
    case 0x29d: {  // GetJoypadAnalogInputRight
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
    case 0x29e: {  // CheckJoypadXInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckJoypadXInput( _a0 );
        return 1;
    }
    case 0x29f: {  // GetJoypadType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadType( _a0 );
        return 1;
    }
    case 0x2a0: {  // SetJoypadInputToKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetJoypadInputToKeyInput( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x2a1: {  // SetJoypadDeadZone
        int _a0 = hsp3dx_auto_geti( 0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetJoypadDeadZone( _a0, _a1 );
        return 1;
    }
    case 0x2a2: {  // SetJoypadDefaultDeadZoneAll
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetJoypadDefaultDeadZoneAll( _a0 );
        return 1;
    }
    case 0x2a3: {  // StartJoypadVibration
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        ctx->stat = StartJoypadVibration( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x2a4: {  // StopJoypadVibration
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = StopJoypadVibration( _a0, _a1 );
        return 1;
    }
    case 0x2a5: {  // GetJoypadPOVState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadPOVState( _a0, _a1 );
        return 1;
    }
    case 0x2a6: {  // ReSetupJoypad
        ctx->stat = ReSetupJoypad(  );
        return 1;
    }
    case 0x2a7: {  // ReSetupInputSystem
        ctx->stat = ReSetupInputSystem(  );
        return 1;
    }
    case 0x2a8: {  // SetUseJoypadVibrationFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseJoypadVibrationFlag( _a0 );
        return 1;
    }
    case 0x2a9: {  // MakeGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2aa: {  // DerivationGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DerivationGraph( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2ab: {  // DerivationGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DerivationGraphF( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2ac: {  // DeleteSharingGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSharingGraph( _a0 );
        return 1;
    }
    case 0x2ad: {  // GetGraphNum
        ctx->stat = GetGraphNum(  );
        return 1;
    }
    case 0x2ae: {  // FillGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 255 );
        ctx->stat = FillGraph( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2af: {  // FillRectGraph
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
    case 0x2b0: {  // SetGraphLostFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = SetGraphLostFlag( _a0, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x2b1: {  // InitGraph
        ctx->stat = InitGraph(  );
        return 1;
    }
    case 0x2b2: {  // ReloadFileGraphAll
        ctx->stat = ReloadFileGraphAll(  );
        return 1;
    }
    case 0x2b3: {  // MakeShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x2b4: {  // DeleteShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShadowMap( _a0 );
        return 1;
    }
    case 0x2b5: {  // SetShadowMapLightDirection
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
    case 0x2b6: {  // ShadowMap_DrawSetup
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ShadowMap_DrawSetup( _a0 );
        return 1;
    }
    case 0x2b7: {  // ShadowMap_DrawEnd
        ctx->stat = ShadowMap_DrawEnd(  );
        return 1;
    }
    case 0x2b8: {  // SetUseShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x2b9: {  // SetShadowMapDrawArea
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
    case 0x2ba: {  // ResetShadowMapDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetShadowMapDrawArea( _a0 );
        return 1;
    }
    case 0x2bb: {  // SetShadowMapAdjustDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetShadowMapAdjustDepth( _a0, _a1 );
        return 1;
    }
    case 0x2bc: {  // GetShadowMapViewProjectionMatrix
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        if ( _a1_pv->pt == nullptr || _a1_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a1 = (MATRIX *)(_a1_pv->pt + _a1_ap * _a1_pv->len[0]);
        ctx->stat = GetShadowMapViewProjectionMatrix( _a0, _a1 );
        return 1;
    }
    case 0x2bd: {  // TestDrawShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = TestDrawShadowMap( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2be: {  // LoadBmpToGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( DX_MOVIESURFACE_NORMAL );
        ctx->stat = LoadBmpToGraph( _a0_w, _a1, _a2, _a3 );
        return 1;
    }
    case 0x2bf: {  // LoadReverseGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadReverseGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x2c0: {  // LoadDivGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
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
        ctx->stat = LoadDivGraph( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2c1: {  // LoadDivGraphF
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
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
        ctx->stat = LoadDivGraphF( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2c2: {  // LoadDivBmpToGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
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
        ctx->stat = LoadDivBmpToGraph( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9, _a10 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2c3: {  // LoadDivBmpToGraphF
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
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
        ctx->stat = LoadDivBmpToGraphF( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9, _a10 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2c4: {  // LoadReverseDivGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
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
        ctx->stat = LoadReverseDivGraph( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2c5: {  // LoadReverseDivGraphF
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
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
        ctx->stat = LoadReverseDivGraphF( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6, _a7, _a8, _a9 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2c6: {  // LoadBlendGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadBlendGraph( _a0_w );
        return 1;
    }
    case 0x2c7: {  // CreateBlendGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateBlendGraphFromSoftImage( _a0 );
        return 1;
    }
    case 0x2c8: {  // CreateGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateGraphFromSoftImage( _a0 );
        return 1;
    }
    case 0x2c9: {  // CreateGraphFromRectSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2ca: {  // ReCreateGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReCreateGraphFromSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x2cb: {  // ReCreateGraphFromRectSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReCreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x2cc: {  // CreateDivGraphFromSoftImage
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
    case 0x2cd: {  // CreateDivGraphFFromSoftImage
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
    case 0x2ce: {  // ReCreateDivGraphFromSoftImage
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
    case 0x2cf: {  // ReCreateDivGraphFFromSoftImage
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
    case 0x2d0: {  // ReloadGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadGraph( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x2d1: {  // ReloadDivGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadDivGraph( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6, _a7 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2d2: {  // ReloadDivGraphF
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadDivGraphF( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6, _a7 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2d3: {  // ReloadReverseGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadReverseGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x2d4: {  // ReloadReverseDivGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = ReloadReverseDivGraph( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2d5: {  // ReloadReverseDivGraphF
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        float _a5 = (float)hsp3dx_auto_getd( 0.0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = ReloadReverseDivGraphF( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x2d6: {  // SetGraphColorBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphColorBitDepth( _a0 );
        return 1;
    }
    case 0x2d7: {  // GetGraphColorBitDepth
        ctx->stat = GetGraphColorBitDepth(  );
        return 1;
    }
    case 0x2d8: {  // SetCreateGraphColorBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphColorBitDepth( _a0 );
        return 1;
    }
    case 0x2d9: {  // GetCreateGraphColorBitDepth
        ctx->stat = GetCreateGraphColorBitDepth(  );
        return 1;
    }
    case 0x2da: {  // SetCreateGraphChannelBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphChannelBitDepth( _a0 );
        return 1;
    }
    case 0x2db: {  // GetCreateGraphChannelBitDepth
        ctx->stat = GetCreateGraphChannelBitDepth(  );
        return 1;
    }
    case 0x2dc: {  // SetCreateGraphInitGraphDelete
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphInitGraphDelete( _a0 );
        return 1;
    }
    case 0x2dd: {  // GetCreateGraphInitGraphDelete
        ctx->stat = GetCreateGraphInitGraphDelete(  );
        return 1;
    }
    case 0x2de: {  // SetCreateGraphHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphHandle( _a0 );
        return 1;
    }
    case 0x2df: {  // GetCreateGraphHandle
        ctx->stat = GetCreateGraphHandle(  );
        return 1;
    }
    case 0x2e0: {  // SetCreateDivGraphHandle
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDivGraphHandle( &_a0, _a1 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        return 1;
    }
    case 0x2e1: {  // GetCreateDivGraphHandle
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        int _a0 = 0;
        ctx->stat = GetCreateDivGraphHandle( &_a0 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        return 1;
    }
    case 0x2e2: {  // SetDrawValidGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2e3: {  // GetDrawValidGraphCreateFlag
        ctx->stat = GetDrawValidGraphCreateFlag(  );
        return 1;
    }
    case 0x2e4: {  // SetDrawValidFlagOf3DGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidFlagOf3DGraph( _a0 );
        return 1;
    }
    case 0x2e5: {  // SetLeftUpColorIsTransColorFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLeftUpColorIsTransColorFlag( _a0 );
        return 1;
    }
    case 0x2e6: {  // SetUsePaletteGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePaletteGraphFlag( _a0 );
        return 1;
    }
    case 0x2e7: {  // SetUseBlendGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseBlendGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2e8: {  // GetUseBlendGraphCreateFlag
        ctx->stat = GetUseBlendGraphCreateFlag(  );
        return 1;
    }
    case 0x2e9: {  // SetUseAlphaTestGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaTestGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2ea: {  // GetUseAlphaTestGraphCreateFlag
        ctx->stat = GetUseAlphaTestGraphCreateFlag(  );
        return 1;
    }
    case 0x2eb: {  // SetUseAlphaTestFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaTestFlag( _a0 );
        return 1;
    }
    case 0x2ec: {  // GetUseAlphaTestFlag
        ctx->stat = GetUseAlphaTestFlag(  );
        return 1;
    }
    case 0x2ed: {  // SetCubeMapTextureCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCubeMapTextureCreateFlag( _a0 );
        return 1;
    }
    case 0x2ee: {  // GetCubeMapTextureCreateFlag
        ctx->stat = GetCubeMapTextureCreateFlag(  );
        return 1;
    }
    case 0x2ef: {  // SetUseNoBlendModeParam
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNoBlendModeParam( _a0 );
        return 1;
    }
    case 0x2f0: {  // SetDrawValidAlphaChannelGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidAlphaChannelGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2f1: {  // GetDrawValidAlphaChannelGraphCreateFlag
        ctx->stat = GetDrawValidAlphaChannelGraphCreateFlag(  );
        return 1;
    }
    case 0x2f2: {  // SetDrawValidFloatTypeGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidFloatTypeGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2f3: {  // GetDrawValidFloatTypeGraphCreateFlag
        ctx->stat = GetDrawValidFloatTypeGraphCreateFlag(  );
        return 1;
    }
    case 0x2f4: {  // SetDrawValidGraphCreateZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidGraphCreateZBufferFlag( _a0 );
        return 1;
    }
    case 0x2f5: {  // GetDrawValidGraphCreateZBufferFlag
        ctx->stat = GetDrawValidGraphCreateZBufferFlag(  );
        return 1;
    }
    case 0x2f6: {  // SetCreateDrawValidGraphZBufferBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphZBufferBitDepth( _a0 );
        return 1;
    }
    case 0x2f7: {  // GetCreateDrawValidGraphZBufferBitDepth
        ctx->stat = GetCreateDrawValidGraphZBufferBitDepth(  );
        return 1;
    }
    case 0x2f8: {  // SetCreateDrawValidGraphMipLevels
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphMipLevels( _a0 );
        return 1;
    }
    case 0x2f9: {  // GetCreateDrawValidGraphMipLevels
        ctx->stat = GetCreateDrawValidGraphMipLevels(  );
        return 1;
    }
    case 0x2fa: {  // SetCreateDrawValidGraphChannelNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphChannelNum( _a0 );
        return 1;
    }
    case 0x2fb: {  // GetCreateDrawValidGraphChannelNum
        ctx->stat = GetCreateDrawValidGraphChannelNum(  );
        return 1;
    }
    case 0x2fc: {  // SetCreateDrawValidGraphMultiSample
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphMultiSample( _a0, _a1 );
        return 1;
    }
    case 0x2fd: {  // SetDrawValidMultiSample
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidMultiSample( _a0, _a1 );
        return 1;
    }
    case 0x2fe: {  // GetMultiSampleQuality
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMultiSampleQuality( _a0 );
        return 1;
    }
    case 0x2ff: {  // SetUseTransColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTransColor( _a0 );
        return 1;
    }
    case 0x300: {  // SetUseTransColorGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTransColorGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x301: {  // SetUseGraphAlphaChannel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGraphAlphaChannel( _a0 );
        return 1;
    }
    case 0x302: {  // GetUseGraphAlphaChannel
        ctx->stat = GetUseGraphAlphaChannel(  );
        return 1;
    }
    case 0x303: {  // SetUseAlphaChannelGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaChannelGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x304: {  // GetUseAlphaChannelGraphCreateFlag
        ctx->stat = GetUseAlphaChannelGraphCreateFlag(  );
        return 1;
    }
    case 0x305: {  // SetUseNotManageTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNotManageTextureFlag( _a0 );
        return 1;
    }
    case 0x306: {  // GetUseNotManageTextureFlag
        ctx->stat = GetUseNotManageTextureFlag(  );
        return 1;
    }
    case 0x307: {  // SetUsePlatformTextureFormat
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePlatformTextureFormat( _a0 );
        return 1;
    }
    case 0x308: {  // GetUsePlatformTextureFormat
        ctx->stat = GetUsePlatformTextureFormat(  );
        return 1;
    }
    case 0x309: {  // SetTransColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetTransColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x30a: {  // GetTransColor
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
    case 0x30b: {  // SetUseDivGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDivGraphFlag( _a0 );
        return 1;
    }
    case 0x30c: {  // SetUseAlphaImageLoadFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaImageLoadFlag( _a0 );
        return 1;
    }
    case 0x30d: {  // SetUseMaxTextureSize
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseMaxTextureSize( _a0 );
        return 1;
    }
    case 0x30e: {  // SetUseGraphBaseDataBackup
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGraphBaseDataBackup( _a0 );
        return 1;
    }
    case 0x30f: {  // GetUseGraphBaseDataBackup
        ctx->stat = GetUseGraphBaseDataBackup(  );
        return 1;
    }
    case 0x310: {  // SetUseSystemMemGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSystemMemGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x311: {  // GetUseSystemMemGraphCreateFlag
        ctx->stat = GetUseSystemMemGraphCreateFlag(  );
        return 1;
    }
    case 0x312: {  // SetUseLoadDivGraphSizeCheckFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLoadDivGraphSizeCheckFlag( _a0 );
        return 1;
    }
    case 0x313: {  // GetUseLoadDivGraphSizeCheckFlag
        ctx->stat = GetUseLoadDivGraphSizeCheckFlag(  );
        return 1;
    }
    case 0x314: {  // GraphUnLock
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GraphUnLock( _a0 );
        return 1;
    }
    case 0x315: {  // SetUseGraphZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetUseGraphZBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x316: {  // CopyGraphZBufferImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = CopyGraphZBufferImage( _a0, _a1 );
        return 1;
    }
    case 0x317: {  // SetDeviceLostDeleteGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDeviceLostDeleteGraphFlag( _a0, _a1 );
        return 1;
    }
    case 0x318: {  // GetGraphSizeF
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
    case 0x319: {  // GetGraphTextureSize
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
    case 0x31a: {  // GetGraphUseBaseGraphArea
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
    case 0x31b: {  // GetGraphMipmapCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetGraphMipmapCount( _a0 );
        return 1;
    }
    case 0x31c: {  // GetGraphFilePath
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = GetGraphFilePath( _a0, _a1_w );
        return 1;
    }
    case 0x31d: {  // CheckDrawValidGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckDrawValidGraph( _a0 );
        return 1;
    }
    case 0x31e: {  // GetMaxGraphTextureSize
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
    case 0x31f: {  // GetValidRestoreShredPoint
        ctx->stat = GetValidRestoreShredPoint(  );
        return 1;
    }
    case 0x320: {  // GetGraphPalette
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
    case 0x321: {  // GetGraphOriginalPalette
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
    case 0x322: {  // SetGraphPalette
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        unsigned int _a2 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = SetGraphPalette( _a0, _a1, _a2 );
        return 1;
    }
    case 0x323: {  // ResetGraphPalette
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetGraphPalette( _a0 );
        return 1;
    }
    case 0x324: {  // DrawFillBox
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawFillBox( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x325: {  // DrawLineBox
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawLineBox( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x326: {  // DrawOval
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
    case 0x327: {  // DrawOvalAA
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
    case 0x328: {  // DrawOval_Rect
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawOval_Rect( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x329: {  // DrawTriangleAA
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
    case 0x32a: {  // DrawQuadrangle
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
    case 0x32b: {  // DrawQuadrangleAA
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
    case 0x32c: {  // DrawRoundRect
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
    case 0x32d: {  // DrawRoundRectAA
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
    case 0x32e: {  // BeginAADraw
        ctx->stat = BeginAADraw(  );
        return 1;
    }
    case 0x32f: {  // EndAADraw
        ctx->stat = EndAADraw(  );
        return 1;
    }
    case 0x330: {  // DrawPixel3D
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
    case 0x331: {  // DrawPixel3DD
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
    case 0x332: {  // DrawLine3DD
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
    case 0x333: {  // DrawTriangle3DD
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
    case 0x334: {  // DrawCube3DD
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
    case 0x335: {  // DrawSphere3DD
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
    case 0x336: {  // DrawCapsule3DD
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
    case 0x337: {  // DrawCylinder3D
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
    case 0x338: {  // DrawCylinder3DD
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
    case 0x339: {  // DrawTube3D
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
    case 0x33a: {  // DrawTube3DD
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
    case 0x33b: {  // DrawCone3DD
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
    case 0x33c: {  // LoadGraphScreen
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadGraphScreen( _a0, _a1, _a2_w, _a3 );
        return 1;
    }
    case 0x33d: {  // DrawRotaGraph2
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
    case 0x33e: {  // DrawRotaGraph3
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
    case 0x33f: {  // DrawRotaGraphFast
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
    case 0x340: {  // DrawRotaGraphFast2
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
    case 0x341: {  // DrawRotaGraphFast3
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
    case 0x342: {  // DrawTurnGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTurnGraph( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x343: {  // DrawReverseGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawReverseGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x344: {  // DrawGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraphF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x345: {  // DrawExtendGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x346: {  // DrawRotaGraphF
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
    case 0x347: {  // DrawRotaGraph2F
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
    case 0x348: {  // DrawRotaGraph3F
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
    case 0x349: {  // DrawRotaGraphFastF
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
    case 0x34a: {  // DrawRotaGraphFast2F
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
    case 0x34b: {  // DrawRotaGraphFast3F
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
    case 0x34c: {  // DrawModiGraphF
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
    case 0x34d: {  // DrawTurnGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTurnGraphF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x34e: {  // DrawReverseGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawReverseGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x34f: {  // DrawChipMap
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
    case 0x350: {  // DrawChipMap2
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
    case 0x351: {  // DrawTile
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
    case 0x352: {  // DrawRectExtendGraph
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
    case 0x353: {  // DrawRectRotaGraph2
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
    case 0x354: {  // DrawRectRotaGraph3
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
    case 0x355: {  // DrawRectRotaGraphFast
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
    case 0x356: {  // DrawRectRotaGraphFast2
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
    case 0x357: {  // DrawRectRotaGraphFast3
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
    case 0x358: {  // DrawRectModiGraph
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
    case 0x359: {  // DrawRectGraphF
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
    case 0x35a: {  // DrawRectGraphF2
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
    case 0x35b: {  // DrawRectExtendGraphF
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
    case 0x35c: {  // DrawRectExtendGraphF2
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
    case 0x35d: {  // DrawRectRotaGraphF
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
    case 0x35e: {  // DrawRectRotaGraph2F
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
    case 0x35f: {  // DrawRectRotaGraph3F
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
    case 0x360: {  // DrawRectRotaGraphFastF
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
    case 0x361: {  // DrawRectRotaGraphFast2F
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
    case 0x362: {  // DrawRectRotaGraphFast3F
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
    case 0x363: {  // DrawRectModiGraphF
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
    case 0x364: {  // DrawBlendGraph
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
    case 0x365: {  // DrawBlendGraphF
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
    case 0x366: {  // DrawBlendGraphPos
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
    case 0x367: {  // DrawCircleGauge
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
    case 0x368: {  // DrawCircleGaugeF
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
    case 0x369: {  // DrawPolygon3D_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygon3D_UseVertexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x36a: {  // DrawPolygonIndexed3D_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygonIndexed3D_UseVertexBuffer( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x36b: {  // DrawGraph3D
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraph3D( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x36c: {  // DrawExtendGraph3D
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
    case 0x36d: {  // DrawRotaGraph3D
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
    case 0x36e: {  // DrawRota2Graph3D
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
    case 0x36f: {  // DrawModiBillboard3D
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
    case 0x370: {  // DrawBillboard3D
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
    case 0x371: {  // GetDrawMode
        ctx->stat = GetDrawMode(  );
        return 1;
    }
    case 0x372: {  // GetDrawBlendMode
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
    case 0x373: {  // GetDrawCustomBlendMode
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
    case 0x374: {  // SetDrawAlphaTest
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawAlphaTest( _a0, _a1 );
        return 1;
    }
    case 0x375: {  // GetDrawAlphaTest
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
    case 0x376: {  // SetBlendGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBlendGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x377: {  // SetBlendGraphPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBlendGraphPosition( _a0, _a1 );
        return 1;
    }
    case 0x378: {  // GetDrawBright
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
    case 0x379: {  // SetDrawAddColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawAddColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x37a: {  // GetDrawAddColor
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
    case 0x37b: {  // SetWriteAlphaChannelFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteAlphaChannelFlag( _a0 );
        return 1;
    }
    case 0x37c: {  // GetWriteAlphaChannelFlag
        ctx->stat = GetWriteAlphaChannelFlag(  );
        return 1;
    }
    case 0x37d: {  // CheckSeparateAlphaBlendEnable
        ctx->stat = CheckSeparateAlphaBlendEnable(  );
        return 1;
    }
    case 0x37e: {  // SetIgnoreDrawGraphColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetIgnoreDrawGraphColor( _a0 );
        return 1;
    }
    case 0x37f: {  // GetIgnoreDrawGraphColor
        ctx->stat = GetIgnoreDrawGraphColor(  );
        return 1;
    }
    case 0x380: {  // SetMaxAnisotropy
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaxAnisotropy( _a0 );
        return 1;
    }
    case 0x381: {  // GetMaxAnisotropy
        ctx->stat = GetMaxAnisotropy(  );
        return 1;
    }
    case 0x382: {  // SetUseLarge3DPositionSupport
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLarge3DPositionSupport( _a0 );
        return 1;
    }
    case 0x383: {  // SetUseZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseZBufferFlag( _a0 );
        return 1;
    }
    case 0x384: {  // SetWriteZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteZBufferFlag( _a0 );
        return 1;
    }
    case 0x385: {  // SetZBias
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBias( _a0 );
        return 1;
    }
    case 0x386: {  // SetZBias3D
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBias3D( _a0 );
        return 1;
    }
    case 0x387: {  // SetDrawZ
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetDrawZ( _a0 );
        return 1;
    }
    case 0x388: {  // SetUseReversedZ
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseReversedZ( _a0 );
        return 1;
    }
    case 0x389: {  // SetDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x38a: {  // SetDrawAreaFull
        ctx->stat = SetDrawAreaFull(  );
        return 1;
    }
    case 0x38b: {  // SetDraw3DScale
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetDraw3DScale( _a0 );
        return 1;
    }
    case 0x38c: {  // RunRestoreShred
        ctx->stat = RunRestoreShred(  );
        return 1;
    }
    case 0x38d: {  // SetTransformTo2D
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformTo2D( _a0 );
        return 1;
    }
    case 0x38e: {  // SetTransformTo2DD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformTo2DD( _a0 );
        return 1;
    }
    case 0x38f: {  // ResetTransformTo2D
        ctx->stat = ResetTransformTo2D(  );
        return 1;
    }
    case 0x390: {  // SetTransformToWorld
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToWorld( _a0 );
        return 1;
    }
    case 0x391: {  // SetTransformToWorldD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToWorldD( _a0 );
        return 1;
    }
    case 0x392: {  // GetTransformToWorldMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToWorldMatrix( _a0 );
        return 1;
    }
    case 0x393: {  // GetTransformToWorldMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToWorldMatrixD( _a0 );
        return 1;
    }
    case 0x394: {  // SetTransformToView
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToView( _a0 );
        return 1;
    }
    case 0x395: {  // SetTransformToViewD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToViewD( _a0 );
        return 1;
    }
    case 0x396: {  // GetTransformToViewMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToViewMatrix( _a0 );
        return 1;
    }
    case 0x397: {  // GetTransformToViewMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToViewMatrixD( _a0 );
        return 1;
    }
    case 0x398: {  // SetTransformToProjection
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToProjection( _a0 );
        return 1;
    }
    case 0x399: {  // SetTransformToProjectionD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToProjectionD( _a0 );
        return 1;
    }
    case 0x39a: {  // GetTransformToProjectionMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToProjectionMatrix( _a0 );
        return 1;
    }
    case 0x39b: {  // GetTransformToProjectionMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToProjectionMatrixD( _a0 );
        return 1;
    }
    case 0x39c: {  // SetTransformToViewport
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToViewport( _a0 );
        return 1;
    }
    case 0x39d: {  // SetTransformToViewportD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = SetTransformToViewportD( _a0 );
        return 1;
    }
    case 0x39e: {  // GetTransformToViewportMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToViewportMatrix( _a0 );
        return 1;
    }
    case 0x39f: {  // GetTransformToViewportMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToViewportMatrixD( _a0 );
        return 1;
    }
    case 0x3a0: {  // GetTransformToAPIViewportMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToAPIViewportMatrix( _a0 );
        return 1;
    }
    case 0x3a1: {  // GetTransformToAPIViewportMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = GetTransformToAPIViewportMatrixD( _a0 );
        return 1;
    }
    case 0x3a2: {  // SetDefTransformMatrix
        ctx->stat = SetDefTransformMatrix(  );
        return 1;
    }
    case 0x3a3: {  // GetTransformPosition
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
    case 0x3a4: {  // GetTransformPositionD
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
    case 0x3a5: {  // SetUseCullingFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseCullingFlag( _a0 );
        return 1;
    }
    case 0x3a6: {  // GetUseBackCulling
        ctx->stat = GetUseBackCulling(  );
        return 1;
    }
    case 0x3a7: {  // SetUseRightHandClippingProcess
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseRightHandClippingProcess( _a0 );
        return 1;
    }
    case 0x3a8: {  // GetUseRightHandClippingProcess
        ctx->stat = GetUseRightHandClippingProcess(  );
        return 1;
    }
    case 0x3a9: {  // SetTextureAddressModeUV
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetTextureAddressModeUV( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3aa: {  // SetTextureAddressTransform
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
    case 0x3ab: {  // SetTextureAddressTransformMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetTextureAddressTransformMatrix( _a0 );
        return 1;
    }
    case 0x3ac: {  // ResetTextureAddressTransform
        ctx->stat = ResetTextureAddressTransform(  );
        return 1;
    }
    case 0x3ad: {  // SetFogEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFogEnable( _a0 );
        return 1;
    }
    case 0x3ae: {  // GetFogEnable
        ctx->stat = GetFogEnable(  );
        return 1;
    }
    case 0x3af: {  // GetFogMode
        ctx->stat = GetFogMode(  );
        return 1;
    }
    case 0x3b0: {  // SetFogColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFogColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3b1: {  // GetFogColor
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
    case 0x3b2: {  // SetFogStartEnd
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetFogStartEnd( _a0, _a1 );
        return 1;
    }
    case 0x3b3: {  // GetFogStartEnd
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
    case 0x3b4: {  // SetFogDensity
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetFogDensity( _a0 );
        return 1;
    }
    case 0x3b5: {  // SetVerticalFogEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVerticalFogEnable( _a0 );
        return 1;
    }
    case 0x3b6: {  // GetVerticalFogEnable
        ctx->stat = GetVerticalFogEnable(  );
        return 1;
    }
    case 0x3b7: {  // GetVerticalFogMode
        ctx->stat = GetVerticalFogMode(  );
        return 1;
    }
    case 0x3b8: {  // SetVerticalFogColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVerticalFogColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3b9: {  // GetVerticalFogColor
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
    case 0x3ba: {  // SetVerticalFogStartEnd
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVerticalFogStartEnd( _a0, _a1 );
        return 1;
    }
    case 0x3bb: {  // GetVerticalFogStartEnd
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
    case 0x3bc: {  // SetVerticalFogDensity
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVerticalFogDensity( _a0, _a1 );
        return 1;
    }
    case 0x3bd: {  // GetVerticalFogDensity
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
    case 0x3be: {  // GetBackgroundColor
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
    case 0x3bf: {  // GetDrawScreenGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetDrawScreenGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x3c0: {  // BltDrawValidGraph
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
    case 0x3c1: {  // ScreenCopy
        ctx->stat = ScreenCopy(  );
        return 1;
    }
    case 0x3c2: {  // WaitVSync
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = WaitVSync( _a0 );
        return 1;
    }
    case 0x3c3: {  // ClsDrawScreen
        ctx->stat = ClsDrawScreen(  );
        return 1;
    }
    case 0x3c4: {  // GetDrawScreen
        ctx->stat = GetDrawScreen(  );
        return 1;
    }
    case 0x3c5: {  // GetActiveGraph
        ctx->stat = GetActiveGraph(  );
        return 1;
    }
    case 0x3c6: {  // SetUseSetDrawScreenSettingReset
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSetDrawScreenSettingReset( _a0 );
        return 1;
    }
    case 0x3c7: {  // GetUseSetDrawScreenSettingReset
        ctx->stat = GetUseSetDrawScreenSettingReset(  );
        return 1;
    }
    case 0x3c8: {  // SetDrawZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawZBuffer( _a0 );
        return 1;
    }
    case 0x3c9: {  // GetFullScreenResolutionMode
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
    case 0x3ca: {  // GetUseFullScreenResolutionMode
        ctx->stat = GetUseFullScreenResolutionMode(  );
        return 1;
    }
    case 0x3cb: {  // SetEmulation320x240
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetEmulation320x240( _a0 );
        return 1;
    }
    case 0x3cc: {  // SetZBufferSize
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBufferSize( _a0, _a1 );
        return 1;
    }
    case 0x3cd: {  // SetZBufferBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBufferBitDepth( _a0 );
        return 1;
    }
    case 0x3ce: {  // GetWaitVSyncFlag
        ctx->stat = GetWaitVSyncFlag(  );
        return 1;
    }
    case 0x3cf: {  // SetFullSceneAntiAliasingMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFullSceneAntiAliasingMode( _a0, _a1 );
        return 1;
    }
    case 0x3d0: {  // SetGraphDisplayArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphDisplayArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3d1: {  // SetChangeScreenModeGraphicsSystemResetFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetChangeScreenModeGraphicsSystemResetFlag( _a0 );
        return 1;
    }
    case 0x3d2: {  // GetScreenState
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
    case 0x3d3: {  // GetDrawScreenSize
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
    case 0x3d4: {  // GetScreenBitDepth
        ctx->stat = GetScreenBitDepth(  );
        return 1;
    }
    case 0x3d5: {  // GetColorBitDepth
        ctx->stat = GetColorBitDepth(  );
        return 1;
    }
    case 0x3d6: {  // GetChangeDisplayFlag
        ctx->stat = GetChangeDisplayFlag(  );
        return 1;
    }
    case 0x3d7: {  // GetVideoMemorySize
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
    case 0x3d8: {  // GetRefreshRate
        ctx->stat = GetRefreshRate(  );
        return 1;
    }
    case 0x3d9: {  // GetDisplayNum
        ctx->stat = GetDisplayNum(  );
        return 1;
    }
    case 0x3da: {  // GetDisplayInfo
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
    case 0x3db: {  // GetDisplayModeNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDisplayModeNum( _a0 );
        return 1;
    }
    case 0x3dc: {  // GetDisplayMaxResolution
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
    case 0x3dd: {  // GetMultiDrawScreenNum
        ctx->stat = GetMultiDrawScreenNum(  );
        return 1;
    }
    case 0x3de: {  // GetDrawFloatCoordType
        ctx->stat = GetDrawFloatCoordType(  );
        return 1;
    }
    case 0x3df: {  // SetUseNormalDrawShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNormalDrawShader( _a0 );
        return 1;
    }
    case 0x3e0: {  // SetUseSoftwareRenderModeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSoftwareRenderModeFlag( _a0 );
        return 1;
    }
    case 0x3e1: {  // SetNotUse3DFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNotUse3DFlag( _a0 );
        return 1;
    }
    case 0x3e2: {  // SetUse3DFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUse3DFlag( _a0 );
        return 1;
    }
    case 0x3e3: {  // GetUse3DFlag
        ctx->stat = GetUse3DFlag(  );
        return 1;
    }
    case 0x3e4: {  // SetScreenMemToVramFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetScreenMemToVramFlag( _a0 );
        return 1;
    }
    case 0x3e5: {  // GetScreenMemToSystemMemFlag
        ctx->stat = GetScreenMemToSystemMemFlag(  );
        return 1;
    }
    case 0x3e6: {  // RestoreGraphSystem
        ctx->stat = RestoreGraphSystem(  );
        return 1;
    }
    case 0x3e7: {  // SetUseHardwareVertexProcessing
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseHardwareVertexProcessing( _a0 );
        return 1;
    }
    case 0x3e8: {  // SetUsePixelLighting
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePixelLighting( _a0 );
        return 1;
    }
    case 0x3e9: {  // SetUseOldDrawModiGraphCodeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseOldDrawModiGraphCodeFlag( _a0 );
        return 1;
    }
    case 0x3ea: {  // SetUseVramFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseVramFlag( _a0 );
        return 1;
    }
    case 0x3eb: {  // GetUseVramFlag
        ctx->stat = GetUseVramFlag(  );
        return 1;
    }
    case 0x3ec: {  // SetBasicBlendFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBasicBlendFlag( _a0 );
        return 1;
    }
    case 0x3ed: {  // SetUseBasicGraphDraw3DDeviceMethodFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseBasicGraphDraw3DDeviceMethodFlag( _a0 );
        return 1;
    }
    case 0x3ee: {  // SetUseDisplayIndex
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDisplayIndex( _a0 );
        return 1;
    }
    case 0x3ef: {  // RenderVertex
        ctx->stat = RenderVertex(  );
        return 1;
    }
    case 0x3f0: {  // GetDrawCallCount
        ctx->stat = GetDrawCallCount(  );
        return 1;
    }
    case 0x3f1: {  // SaveDrawScreenToBMP
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        ctx->stat = SaveDrawScreenToBMP( _a0, _a1, _a2, _a3, _a4_w );
        return 1;
    }
    case 0x3f2: {  // SaveDrawScreenToDDS
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        ctx->stat = SaveDrawScreenToDDS( _a0, _a1, _a2, _a3, _a4_w );
        return 1;
    }
    case 0x3f3: {  // SaveDrawScreenToJPEG
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        int _a5 = hsp3dx_auto_geti( 80 );
        int _a6 = hsp3dx_auto_geti( 1 );
        ctx->stat = SaveDrawScreenToJPEG( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        return 1;
    }
    case 0x3f4: {  // SaveDrawScreenToPNG
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = SaveDrawScreenToPNG( _a0, _a1, _a2, _a3, _a4_w, _a5 );
        return 1;
    }
    case 0x3f5: {  // SaveDrawValidGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
        wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        int _a6 = hsp3dx_auto_geti( DX_IMAGESAVETYPE_BMP );
        int _a7 = hsp3dx_auto_geti( 80 );
        int _a8 = hsp3dx_auto_geti( 1 );
        int _a9 = hsp3dx_auto_geti( -1 );
        ctx->stat = SaveDrawValidGraph( _a0, _a1, _a2, _a3, _a4, _a5_w, _a6, _a7, _a8, _a9 );
        return 1;
    }
    case 0x3f6: {  // SaveDrawValidGraphToBMP
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
        wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        ctx->stat = SaveDrawValidGraphToBMP( _a0, _a1, _a2, _a3, _a4, _a5_w );
        return 1;
    }
    case 0x3f7: {  // SaveDrawValidGraphToDDS
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
        wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        ctx->stat = SaveDrawValidGraphToDDS( _a0, _a1, _a2, _a3, _a4, _a5_w );
        return 1;
    }
    case 0x3f8: {  // SaveDrawValidGraphToJPEG
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
        wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        int _a6 = hsp3dx_auto_geti( 80 );
        int _a7 = hsp3dx_auto_geti( 1 );
        ctx->stat = SaveDrawValidGraphToJPEG( _a0, _a1, _a2, _a3, _a4, _a5_w, _a6, _a7 );
        return 1;
    }
    case 0x3f9: {  // SaveDrawValidGraphToPNG
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        const char *_a5_u8 = hsp3dx_auto_gets();
        wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        int _a6 = hsp3dx_auto_geti( -1 );
        ctx->stat = SaveDrawValidGraphToPNG( _a0, _a1, _a2, _a3, _a4, _a5_w, _a6 );
        return 1;
    }
    case 0x3fa: {  // DeleteVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteVertexBuffer( _a0 );
        return 1;
    }
    case 0x3fb: {  // InitVertexBuffer
        ctx->stat = InitVertexBuffer(  );
        return 1;
    }
    case 0x3fc: {  // UpdateVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateVertexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3fd: {  // DeleteIndexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteIndexBuffer( _a0 );
        return 1;
    }
    case 0x3fe: {  // InitIndexBuffer
        ctx->stat = InitIndexBuffer(  );
        return 1;
    }
    case 0x3ff: {  // UpdateIndexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateIndexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x400: {  // GetMaxPrimitiveCount
        ctx->stat = GetMaxPrimitiveCount(  );
        return 1;
    }
    case 0x401: {  // GetMaxVertexIndex
        ctx->stat = GetMaxVertexIndex(  );
        return 1;
    }
    case 0x402: {  // GetValidShaderVersion
        ctx->stat = GetValidShaderVersion(  );
        return 1;
    }
    case 0x403: {  // LoadVertexShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadVertexShader( _a0_w );
        return 1;
    }
    case 0x404: {  // LoadGeometryShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadGeometryShader( _a0_w );
        return 1;
    }
    case 0x405: {  // LoadPixelShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadPixelShader( _a0_w );
        return 1;
    }
    case 0x406: {  // DeleteShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShader( _a0 );
        return 1;
    }
    case 0x407: {  // InitShader
        ctx->stat = InitShader(  );
        return 1;
    }
    case 0x408: {  // GetConstIndexToShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetConstIndexToShader( _a0_w, _a1 );
        return 1;
    }
    case 0x409: {  // GetConstCountToShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetConstCountToShader( _a0_w, _a1 );
        return 1;
    }
    case 0x40a: {  // SetVSConstSF
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVSConstSF( _a0, _a1 );
        return 1;
    }
    case 0x40b: {  // SetVSConstF
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
    case 0x40c: {  // SetVSConstFMtx
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
    case 0x40d: {  // SetVSConstFMtxT
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
    case 0x40e: {  // SetVSConstSI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstSI( _a0, _a1 );
        return 1;
    }
    case 0x40f: {  // SetVSConstSFArray
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
    case 0x410: {  // SetVSConstFArray
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
    case 0x411: {  // SetVSConstFMtxArray
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
    case 0x412: {  // SetVSConstFMtxTArray
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
    case 0x413: {  // SetVSConstSIArray
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstSIArray( _a0, &_a1, _a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x414: {  // ResetVSConstF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstF( _a0, _a1 );
        return 1;
    }
    case 0x415: {  // ResetVSConstI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstI( _a0, _a1 );
        return 1;
    }
    case 0x416: {  // ResetVSConstB
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstB( _a0, _a1 );
        return 1;
    }
    case 0x417: {  // SetPSConstSF
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetPSConstSF( _a0, _a1 );
        return 1;
    }
    case 0x418: {  // SetPSConstF
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
    case 0x419: {  // SetPSConstFMtx
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
    case 0x41a: {  // SetPSConstFMtxT
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
    case 0x41b: {  // SetPSConstSI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstSI( _a0, _a1 );
        return 1;
    }
    case 0x41c: {  // SetPSConstSFArray
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
    case 0x41d: {  // SetPSConstFArray
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
    case 0x41e: {  // SetPSConstFMtxArray
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
    case 0x41f: {  // SetPSConstFMtxTArray
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
    case 0x420: {  // SetPSConstSIArray
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstSIArray( _a0, &_a1, _a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x421: {  // ResetPSConstF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstF( _a0, _a1 );
        return 1;
    }
    case 0x422: {  // ResetPSConstI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstI( _a0, _a1 );
        return 1;
    }
    case 0x423: {  // ResetPSConstB
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstB( _a0, _a1 );
        return 1;
    }
    case 0x424: {  // SetRenderTargetToShader
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetRenderTargetToShader( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x425: {  // SetUseTextureToShader
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTextureToShader( _a0, _a1 );
        return 1;
    }
    case 0x426: {  // SetUseVertexShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseVertexShader( _a0 );
        return 1;
    }
    case 0x427: {  // SetUseGeometryShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGeometryShader( _a0 );
        return 1;
    }
    case 0x428: {  // SetUsePixelShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePixelShader( _a0 );
        return 1;
    }
    case 0x429: {  // DrawBillboard3DToShader
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
    case 0x42a: {  // DrawPolygon3DToShader_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygon3DToShader_UseVertexBuffer( _a0 );
        return 1;
    }
    case 0x42b: {  // DrawPolygonIndexed3DToShader_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygonIndexed3DToShader_UseVertexBuffer( _a0, _a1 );
        return 1;
    }
    case 0x42c: {  // InitShaderConstantBuffer
        ctx->stat = InitShaderConstantBuffer(  );
        return 1;
    }
    case 0x42d: {  // CreateShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x42e: {  // DeleteShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x42f: {  // UpdateShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x430: {  // SetGraphBlendScalingFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphBlendScalingFilterMode( _a0 );
        return 1;
    }
    case 0x431: {  // PlayMovie
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMovie( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x432: {  // GetMovieImageSize_File
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetMovieImageSize_File( _a0_w, &_a1, &_a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x433: {  // OpenMovieToGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 1 );
        ctx->stat = OpenMovieToGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x434: {  // AddMovieFrameToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        unsigned int _a1 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = AddMovieFrameToGraph( _a0, _a1 );
        return 1;
    }
    case 0x435: {  // SeekMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SeekMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x436: {  // SetPlaySpeedRateMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetPlaySpeedRateMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x437: {  // GetMovieStateToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieStateToGraph( _a0 );
        return 1;
    }
    case 0x438: {  // SetMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieVolumeToGraph( _a0, _a1 );
        return 1;
    }
    case 0x439: {  // GetMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieVolumeToGraph( _a0 );
        return 1;
    }
    case 0x43a: {  // ChangeMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeMovieVolumeToGraph( _a0, _a1 );
        return 1;
    }
    case 0x43b: {  // GetMovieVolumeToGraph2
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieVolumeToGraph2( _a0 );
        return 1;
    }
    case 0x43c: {  // GetMovieTotalFrameToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieTotalFrameToGraph( _a0 );
        return 1;
    }
    case 0x43d: {  // TellMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = TellMovieToGraph( _a0 );
        return 1;
    }
    case 0x43e: {  // TellMovieToGraphToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = TellMovieToGraphToFrame( _a0 );
        return 1;
    }
    case 0x43f: {  // SeekMovieToGraphToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SeekMovieToGraphToFrame( _a0, _a1 );
        return 1;
    }
    case 0x440: {  // GetLastUpdateTimeMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLastUpdateTimeMovieToGraph( _a0 );
        return 1;
    }
    case 0x441: {  // UpdateMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateMovieToGraph( _a0 );
        return 1;
    }
    case 0x442: {  // SetMovieRightImageAlphaFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieRightImageAlphaFlag( _a0 );
        return 1;
    }
    case 0x443: {  // SetMovieColorA8R8G8B8Flag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieColorA8R8G8B8Flag( _a0 );
        return 1;
    }
    case 0x444: {  // SetMovieUseYUVFormatSurfaceFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieUseYUVFormatSurfaceFlag( _a0 );
        return 1;
    }
    case 0x445: {  // SetCameraNearFar
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraNearFar( _a0, _a1 );
        return 1;
    }
    case 0x446: {  // SetCameraNearFarD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraNearFarD( _a0, _a1 );
        return 1;
    }
    case 0x447: {  // SetCameraPositionAndTarget_UpVecYD
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
    case 0x448: {  // SetCameraPositionAndTargetAndUpVec
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
    case 0x449: {  // SetCameraPositionAndTargetAndUpVecD
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
    case 0x44a: {  // SetCameraPositionAndAngle
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
    case 0x44b: {  // SetCameraPositionAndAngleD
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
    case 0x44c: {  // SetCameraViewMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetCameraViewMatrix( _a0 );
        return 1;
    }
    case 0x44d: {  // SetCameraViewMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = SetCameraViewMatrixD( _a0 );
        return 1;
    }
    case 0x44e: {  // SetCameraScreenCenter
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraScreenCenter( _a0, _a1 );
        return 1;
    }
    case 0x44f: {  // SetCameraScreenCenterD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraScreenCenterD( _a0, _a1 );
        return 1;
    }
    case 0x450: {  // SetupCamera_PerspectiveD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_PerspectiveD( _a0 );
        return 1;
    }
    case 0x451: {  // SetupCamera_Ortho
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_Ortho( _a0 );
        return 1;
    }
    case 0x452: {  // SetupCamera_OrthoD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_OrthoD( _a0 );
        return 1;
    }
    case 0x453: {  // SetupCamera_ProjectionMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetupCamera_ProjectionMatrix( _a0 );
        return 1;
    }
    case 0x454: {  // SetupCamera_ProjectionMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = SetupCamera_ProjectionMatrixD( _a0 );
        return 1;
    }
    case 0x455: {  // SetCameraDotAspect
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraDotAspect( _a0 );
        return 1;
    }
    case 0x456: {  // SetCameraDotAspectD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraDotAspectD( _a0 );
        return 1;
    }
    case 0x457: {  // CheckCameraViewClip
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CheckCameraViewClip( _a0 );
        return 1;
    }
    case 0x458: {  // CheckCameraViewClipD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = CheckCameraViewClipD( _a0 );
        return 1;
    }
    case 0x459: {  // CheckCameraViewClip_Dir
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CheckCameraViewClip_Dir( _a0 );
        return 1;
    }
    case 0x45a: {  // CheckCameraViewClip_DirD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = CheckCameraViewClip_DirD( _a0 );
        return 1;
    }
    case 0x45b: {  // CheckCameraViewClip_Box
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
    case 0x45c: {  // CheckCameraViewClip_BoxD
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
    case 0x45d: {  // GetCameraScreenCenter
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
    case 0x45e: {  // GetCameraScreenCenterD
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
    case 0x45f: {  // SetMaterialUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaterialUseVertDifColor( _a0 );
        return 1;
    }
    case 0x460: {  // SetMaterialUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaterialUseVertSpcColor( _a0 );
        return 1;
    }
    case 0x461: {  // SetUseSpecular
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSpecular( _a0 );
        return 1;
    }
    case 0x462: {  // SetGlobalAmbientLight
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetGlobalAmbientLight( _a0 );
        return 1;
    }
    case 0x463: {  // SetUseLightAngleAttenuation
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLightAngleAttenuation( _a0 );
        return 1;
    }
    case 0x464: {  // SetUseHalfLambertLighting
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseHalfLambertLighting( _a0 );
        return 1;
    }
    case 0x465: {  // ChangeLightTypeDir
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = ChangeLightTypeDir( _a0 );
        return 1;
    }
    case 0x466: {  // ChangeLightTypeSpot
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
    case 0x467: {  // ChangeLightTypePoint
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
    case 0x468: {  // GetLightType
        ctx->stat = GetLightType(  );
        return 1;
    }
    case 0x469: {  // SetLightEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightEnable( _a0 );
        return 1;
    }
    case 0x46a: {  // GetLightEnable
        ctx->stat = GetLightEnable(  );
        return 1;
    }
    case 0x46b: {  // SetLightDifColor
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightDifColor( _a0 );
        return 1;
    }
    case 0x46c: {  // SetLightSpcColor
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightSpcColor( _a0 );
        return 1;
    }
    case 0x46d: {  // SetLightAmbColor
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightAmbColor( _a0 );
        return 1;
    }
    case 0x46e: {  // SetLightPosition
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetLightPosition( _a0 );
        return 1;
    }
    case 0x46f: {  // SetLightRangeAtten
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightRangeAtten( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x470: {  // GetLightRangeAtten
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
    case 0x471: {  // SetLightAngle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightAngle( _a0, _a1 );
        return 1;
    }
    case 0x472: {  // GetLightAngle
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
    case 0x473: {  // SetLightUseShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightUseShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x474: {  // CreateDirLightHandle
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CreateDirLightHandle( _a0 );
        return 1;
    }
    case 0x475: {  // CreateSpotLightHandle
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
    case 0x476: {  // CreatePointLightHandle
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
    case 0x477: {  // DeleteLightHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteLightHandle( _a0 );
        return 1;
    }
    case 0x478: {  // DeleteLightHandleAll
        ctx->stat = DeleteLightHandleAll(  );
        return 1;
    }
    case 0x479: {  // SetLightTypeHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightTypeHandle( _a0, _a1 );
        return 1;
    }
    case 0x47a: {  // SetLightEnableHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightEnableHandle( _a0, _a1 );
        return 1;
    }
    case 0x47b: {  // SetLightDifColorHandle
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
    case 0x47c: {  // SetLightSpcColorHandle
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
    case 0x47d: {  // SetLightAmbColorHandle
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
    case 0x47e: {  // SetLightDirectionHandle
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
    case 0x47f: {  // SetLightPositionHandle
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
    case 0x480: {  // SetLightRangeAttenHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightRangeAttenHandle( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x481: {  // SetLightAngleHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightAngleHandle( _a0, _a1, _a2 );
        return 1;
    }
    case 0x482: {  // SetLightUseShadowMapHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightUseShadowMapHandle( _a0, _a1, _a2 );
        return 1;
    }
    case 0x483: {  // GetLightTypeHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLightTypeHandle( _a0 );
        return 1;
    }
    case 0x484: {  // GetLightEnableHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLightEnableHandle( _a0 );
        return 1;
    }
    case 0x485: {  // GetLightRangeAttenHandle
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
    case 0x486: {  // GetLightAngleHandle
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
    case 0x487: {  // GetEnableLightHandleNum
        ctx->stat = GetEnableLightHandleNum(  );
        return 1;
    }
    case 0x488: {  // GetEnableLightHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetEnableLightHandle( _a0 );
        return 1;
    }
    case 0x489: {  // CreateMaskScreen
        ctx->stat = CreateMaskScreen(  );
        return 1;
    }
    case 0x48a: {  // DeleteMaskScreen
        ctx->stat = DeleteMaskScreen(  );
        return 1;
    }
    case 0x48b: {  // SetUseMaskScreenFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseMaskScreenFlag( _a0 );
        return 1;
    }
    case 0x48c: {  // GetUseMaskScreenFlag
        ctx->stat = GetUseMaskScreenFlag(  );
        return 1;
    }
    case 0x48d: {  // FillMaskScreen
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FillMaskScreen( _a0 );
        return 1;
    }
    case 0x48e: {  // SetMaskScreenGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaskScreenGraph( _a0 );
        return 1;
    }
    case 0x48f: {  // InitMask
        ctx->stat = InitMask(  );
        return 1;
    }
    case 0x490: {  // MakeMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeMask( _a0, _a1 );
        return 1;
    }
    case 0x491: {  // GetMaskSize
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
    case 0x492: {  // DeleteMask
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteMask( _a0 );
        return 1;
    }
    case 0x493: {  // LoadMask
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadMask( _a0_w );
        return 1;
    }
    case 0x494: {  // LoadDivMask
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        PVal *_a6_pv; APTR _a6_ap;
        _a6_ap = code_getva( &_a6_pv );
        int _a6 = 0;
        ctx->stat = LoadDivMask( _a0_w, _a1, _a2, _a3, _a4, _a5, &_a6 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x495: {  // DrawMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawMask( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x496: {  // DrawStringMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
        ctx->stat = DrawStringMask( _a0, _a1, _a2, _a3_w );
        return 1;
    }
    case 0x497: {  // DrawStringMaskToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        ctx->stat = DrawStringMaskToHandle( _a0, _a1, _a2, _a3, _a4_w );
        return 1;
    }
    case 0x498: {  // DrawFillMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawFillMask( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x499: {  // SetMaskReverseEffectFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaskReverseEffectFlag( _a0 );
        return 1;
    }
    case 0x49a: {  // GetMaskScreenData
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMaskScreenData( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x49b: {  // GetMaskUseFlag
        ctx->stat = GetMaskUseFlag(  );
        return 1;
    }
    case 0x49c: {  // EnumFontName
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 1 );
        ctx->stat = EnumFontName( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x49d: {  // InitFontToHandle
        ctx->stat = InitFontToHandle(  );
        return 1;
    }
    case 0x49e: {  // LoadFontDataToHandle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadFontDataToHandle( _a0_w, _a1 );
        return 1;
    }
    case 0x49f: {  // SetFontSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontSpaceToHandle( _a0, _a1 );
        return 1;
    }
    case 0x4a0: {  // SetFontLineSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontLineSpaceToHandle( _a0, _a1 );
        return 1;
    }
    case 0x4a1: {  // DeleteFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteFontToHandle( _a0 );
        return 1;
    }
    case 0x4a2: {  // SetFontLostFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = SetFontLostFlag( _a0, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x4a3: {  // AddFontImageToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddFontImageToHandle( _a0, _a1_w, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x4a4: {  // SubFontImageToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = SubFontImageToHandle( _a0, _a1_w );
        return 1;
    }
    case 0x4a5: {  // AddSubstitutionFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddSubstitutionFontToHandle( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x4a6: {  // SubSubstitutionFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SubSubstitutionFontToHandle( _a0, _a1 );
        return 1;
    }
    case 0x4a7: {  // ChangeFontFromHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeFontFromHandle( _a0 );
        return 1;
    }
    case 0x4a8: {  // ChangeFontType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeFontType( _a0 );
        return 1;
    }
    case 0x4a9: {  // GetFontSize
        ctx->stat = GetFontSize(  );
        return 1;
    }
    case 0x4aa: {  // GetFontEdgeSize
        ctx->stat = GetFontEdgeSize(  );
        return 1;
    }
    case 0x4ab: {  // SetFontSpace
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontSpace( _a0 );
        return 1;
    }
    case 0x4ac: {  // GetFontSpace
        ctx->stat = GetFontSpace(  );
        return 1;
    }
    case 0x4ad: {  // SetFontLineSpace
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontLineSpace( _a0 );
        return 1;
    }
    case 0x4ae: {  // GetFontLineSpace
        ctx->stat = GetFontLineSpace(  );
        return 1;
    }
    case 0x4af: {  // SetDefaultFontState
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( -1 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDefaultFontState( _a0_w, _a1, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x4b0: {  // GetDefaultFontHandle
        ctx->stat = GetDefaultFontHandle(  );
        return 1;
    }
    case 0x4b1: {  // GetFontMaxCacheCharNum
        ctx->stat = GetFontMaxCacheCharNum(  );
        return 1;
    }
    case 0x4b2: {  // GetFontMaxWidth
        ctx->stat = GetFontMaxWidth(  );
        return 1;
    }
    case 0x4b3: {  // GetFontAscent
        ctx->stat = GetFontAscent(  );
        return 1;
    }
    case 0x4b4: {  // GetDrawStringWidth
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringWidth( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x4b5: {  // GetDrawExtendStringWidth
        double _a0 = hsp3dx_auto_getd( 0.0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringWidth( _a0, _a1_w, _a2, _a3 );
        return 1;
    }
    case 0x4b6: {  // GetDrawStringSize
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
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringSize( &_a0, &_a1, &_a2, _a3_w, _a4, _a5 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x4b7: {  // GetDrawExtendStringSize
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
        wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringSize( &_a0, &_a1, &_a2, _a3, _a4, _a5_w, _a6, _a7 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x4b8: {  // GetDrawStringKerningPairInfo
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetDrawStringKerningPairInfo( _a0_w, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x4b9: {  // GetFontMaxCacheCharNumToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontMaxCacheCharNumToHandle( _a0 );
        return 1;
    }
    case 0x4ba: {  // GetFontMaxWidthToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontMaxWidthToHandle( _a0 );
        return 1;
    }
    case 0x4bb: {  // GetFontAscentToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontAscentToHandle( _a0 );
        return 1;
    }
    case 0x4bc: {  // GetFontSizeToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontSizeToHandle( _a0 );
        return 1;
    }
    case 0x4bd: {  // GetFontEdgeSizeToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontEdgeSizeToHandle( _a0 );
        return 1;
    }
    case 0x4be: {  // GetFontSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontSpaceToHandle( _a0 );
        return 1;
    }
    case 0x4bf: {  // GetFontLineSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontLineSpaceToHandle( _a0 );
        return 1;
    }
    case 0x4c0: {  // GetFontCharInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
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
        ctx->stat = GetFontCharInfo( _a0, _a1_w, &_a2, &_a3, &_a4, &_a5, &_a6 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a3_pv, _a3_ap, TYPE_INUM, &_a3 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        return 1;
    }
    case 0x4c1: {  // GetDrawStringWidthToHandle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringWidthToHandle( _a0_w, _a1, _a2, _a3 );
        return 1;
    }
    case 0x4c2: {  // GetDrawExtendStringWidthToHandle
        double _a0 = hsp3dx_auto_getd( 0.0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringWidthToHandle( _a0, _a1_w, _a2, _a3, _a4 );
        return 1;
    }
    case 0x4c3: {  // GetDrawStringSizeToHandle
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
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringSizeToHandle( &_a0, &_a1, &_a2, _a3_w, _a4, _a5, _a6 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x4c4: {  // GetDrawExtendStringSizeToHandle
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
        wchar_t _a5_w[1024];
        hsp3dx_utf8_to_wide( _a5_u8, _a5_w, 1024 );
        int _a6 = hsp3dx_auto_geti( 0 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringSizeToHandle( &_a0, &_a1, &_a2, _a3, _a4, _a5_w, _a6, _a7, _a8 );
        code_setva( _a0_pv, _a0_ap, TYPE_INUM, &_a0 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x4c5: {  // GetDrawStringKerningPairInfoToHandle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringKerningPairInfoToHandle( _a0_w, &_a1, _a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x4c6: {  // GetFontStateToHandle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
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
        ctx->stat = GetFontStateToHandle( _a0_w, &_a1, &_a2, _a3, &_a4, &_a5, &_a6, &_a7 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        code_setva( _a4_pv, _a4_ap, TYPE_INUM, &_a4 );
        code_setva( _a5_pv, _a5_ap, TYPE_INUM, &_a5 );
        code_setva( _a6_pv, _a6_ap, TYPE_INUM, &_a6 );
        code_setva( _a7_pv, _a7_ap, TYPE_INUM, &_a7 );
        return 1;
    }
    case 0x4c7: {  // CheckFontCacheToTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontCacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x4c8: {  // CheckFontChacheToTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontChacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x4c9: {  // CheckFontHandleValid
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontHandleValid( _a0 );
        return 1;
    }
    case 0x4ca: {  // ClearFontCacheToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ClearFontCacheToHandle( _a0 );
        return 1;
    }
    case 0x4cb: {  // SetFontCacheToTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x4cc: {  // GetFontCacheToTextureFlag
        ctx->stat = GetFontCacheToTextureFlag(  );
        return 1;
    }
    case 0x4cd: {  // SetFontChacheToTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontChacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x4ce: {  // GetFontChacheToTextureFlag
        ctx->stat = GetFontChacheToTextureFlag(  );
        return 1;
    }
    case 0x4cf: {  // SetFontCacheTextureColorBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheTextureColorBitDepth( _a0 );
        return 1;
    }
    case 0x4d0: {  // GetFontCacheTextureColorBitDepth
        ctx->stat = GetFontCacheTextureColorBitDepth(  );
        return 1;
    }
    case 0x4d1: {  // SetFontCacheCharNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheCharNum( _a0 );
        return 1;
    }
    case 0x4d2: {  // GetFontCacheCharNum
        ctx->stat = GetFontCacheCharNum(  );
        return 1;
    }
    case 0x4d3: {  // SetFontCacheUsePremulAlphaFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheUsePremulAlphaFlag( _a0 );
        return 1;
    }
    case 0x4d4: {  // GetFontCacheUsePremulAlphaFlag
        ctx->stat = GetFontCacheUsePremulAlphaFlag(  );
        return 1;
    }
    case 0x4d5: {  // SetFontUseAdjustSizeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontUseAdjustSizeFlag( _a0 );
        return 1;
    }
    case 0x4d6: {  // GetFontUseAdjustSizeFlag
        ctx->stat = GetFontUseAdjustSizeFlag(  );
        return 1;
    }
    case 0x4d7: {  // SetFontOnlyDrawType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontOnlyDrawType( _a0 );
        return 1;
    }
    case 0x4d8: {  // GetFontOnlyDrawType
        ctx->stat = GetFontOnlyDrawType(  );
        return 1;
    }
    case 0x4d9: {  // SetFontIgnoreLFFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontIgnoreLFFlag( _a0 );
        return 1;
    }
    case 0x4da: {  // GetFontIgnoreLFFlag
        ctx->stat = GetFontIgnoreLFFlag(  );
        return 1;
    }
    case 0x4db: {  // DrawVString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawVString( _a0, _a1, _a2_w, _a3, _a4 );
        return 1;
    }
    case 0x4dc: {  // DrawExtendString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendString( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        return 1;
    }
    case 0x4dd: {  // DrawExtendVString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendVString( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        return 1;
    }
    case 0x4de: {  // DrawRotaString
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
        wchar_t _a10_w[1024];
        hsp3dx_utf8_to_wide( _a10_u8, _a10_w, 1024 );
        ctx->stat = DrawRotaString( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10_w );
        return 1;
    }
    case 0x4df: {  // DrawModiString
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
        wchar_t _a11_w[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_w, 1024 );
        ctx->stat = DrawModiString( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_w );
        return 1;
    }
    case 0x4e0: {  // DrawStringF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawStringF( _a0, _a1, _a2_w, _a3, _a4 );
        return 1;
    }
    case 0x4e1: {  // DrawVStringF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawVStringF( _a0, _a1, _a2_w, _a3, _a4 );
        return 1;
    }
    case 0x4e2: {  // DrawExtendStringF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendStringF( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        return 1;
    }
    case 0x4e3: {  // DrawExtendVStringF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendVStringF( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6 );
        return 1;
    }
    case 0x4e4: {  // DrawRotaStringF
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
        wchar_t _a10_w[1024];
        hsp3dx_utf8_to_wide( _a10_u8, _a10_w, 1024 );
        ctx->stat = DrawRotaStringF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10_w );
        return 1;
    }
    case 0x4e5: {  // DrawModiStringF
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
        wchar_t _a11_w[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_w, 1024 );
        ctx->stat = DrawModiStringF( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_w );
        return 1;
    }
    case 0x4e6: {  // DrawNumberToI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberToI( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x4e7: {  // DrawNumberToF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberToF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x4e8: {  // DrawNumberPlusToI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberPlusToI( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x4e9: {  // DrawNumberPlusToF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a6 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberPlusToF( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x4ea: {  // DrawStringToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawStringToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x4eb: {  // DrawVStringToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawVStringToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5 );
        return 1;
    }
    case 0x4ec: {  // DrawExtendStringToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendStringToHandle( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x4ed: {  // DrawExtendVStringToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendVStringToHandle( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7 );
        return 1;
    }
    case 0x4ee: {  // DrawRotaStringToHandle
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
        wchar_t _a11_w[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_w, 1024 );
        ctx->stat = DrawRotaStringToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_w );
        return 1;
    }
    case 0x4ef: {  // DrawModiStringToHandle
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
        wchar_t _a12_w[1024];
        hsp3dx_utf8_to_wide( _a12_u8, _a12_w, 1024 );
        ctx->stat = DrawModiStringToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12_w );
        return 1;
    }
    case 0x4f0: {  // DrawStringFToHandle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawStringFToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x4f1: {  // DrawVStringFToHandle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        unsigned int _a3 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawVStringFToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5 );
        return 1;
    }
    case 0x4f2: {  // DrawExtendStringFToHandle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a8 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendStringFToHandle( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x4f3: {  // DrawExtendVStringFToHandle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        const char *_a4_u8 = hsp3dx_auto_gets();
        wchar_t _a4_w[1024];
        hsp3dx_utf8_to_wide( _a4_u8, _a4_w, 1024 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawExtendVStringFToHandle( _a0, _a1, _a2, _a3, _a4_w, _a5, _a6, _a7 );
        return 1;
    }
    case 0x4f4: {  // DrawRotaStringFToHandle
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
        wchar_t _a11_w[1024];
        hsp3dx_utf8_to_wide( _a11_u8, _a11_w, 1024 );
        ctx->stat = DrawRotaStringFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11_w );
        return 1;
    }
    case 0x4f5: {  // DrawModiStringFToHandle
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
        wchar_t _a12_w[1024];
        hsp3dx_utf8_to_wide( _a12_u8, _a12_w, 1024 );
        ctx->stat = DrawModiStringFToHandle( _a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7, _a8, _a9, _a10, _a11, _a12_w );
        return 1;
    }
    case 0x4f6: {  // DrawNumberToIToHandle
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
    case 0x4f7: {  // DrawNumberToFToHandle
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
    case 0x4f8: {  // DrawNumberPlusToIToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberPlusToIToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x4f9: {  // DrawNumberPlusToFToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a6 = hsp3dx_auto_geti( 0 );
        unsigned int _a7 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberPlusToFToHandle( _a0, _a1, _a2_w, _a3, _a4, _a5, _a6, _a7 );
        return 1;
    }
    case 0x4fa: {  // ConvertMatrixFtoD
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
    case 0x4fb: {  // ConvertMatrixDtoF
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
    case 0x4fc: {  // CreateIdentityMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = CreateIdentityMatrix( _a0 );
        return 1;
    }
    case 0x4fd: {  // CreateIdentityMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        ctx->stat = CreateIdentityMatrixD( _a0 );
        return 1;
    }
    case 0x4fe: {  // CreateLookAtMatrix
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
    case 0x4ff: {  // CreateLookAtMatrixD
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
    case 0x500: {  // CreateLookAtMatrix2
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
    case 0x501: {  // CreateLookAtMatrix2D
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
    case 0x502: {  // CreateLookAtMatrixRH
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
    case 0x503: {  // CreateLookAtMatrixRHD
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
    case 0x504: {  // CreateMultiplyMatrix
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
    case 0x505: {  // CreateMultiplyMatrixD
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
    case 0x506: {  // CreatePerspectiveFovMatrix
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
    case 0x507: {  // CreatePerspectiveFovMatrixD
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
    case 0x508: {  // CreatePerspectiveFovMatrixRH
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
    case 0x509: {  // CreatePerspectiveFovMatrixRHD
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
    case 0x50a: {  // CreateOrthoMatrix
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
    case 0x50b: {  // CreateOrthoMatrixD
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
    case 0x50c: {  // CreateOrthoMatrixRH
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
    case 0x50d: {  // CreateOrthoMatrixRHD
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
    case 0x50e: {  // CreateScalingMatrix
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
    case 0x50f: {  // CreateScalingMatrixD
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
    case 0x510: {  // CreateRotationXMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationXMatrix( _a0, _a1 );
        return 1;
    }
    case 0x511: {  // CreateRotationXMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationXMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x512: {  // CreateRotationYMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationYMatrix( _a0, _a1 );
        return 1;
    }
    case 0x513: {  // CreateRotationYMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationYMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x514: {  // CreateRotationZMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX *_a0 = (MATRIX *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationZMatrix( _a0, _a1 );
        return 1;
    }
    case 0x515: {  // CreateRotationZMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D *_a0 = (MATRIX_D *)(_a0_pv->pt + _a0_ap * _a0_pv->len[0]);
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = CreateRotationZMatrixD( _a0, _a1 );
        return 1;
    }
    case 0x516: {  // CreateTranslationMatrix
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
    case 0x517: {  // CreateTranslationMatrixD
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
    case 0x518: {  // CreateTransposeMatrix
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
    case 0x519: {  // CreateTransposeMatrixD
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
    case 0x51a: {  // CreateInverseMatrix
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
    case 0x51b: {  // CreateInverseMatrixD
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
    case 0x51c: {  // CreateViewportMatrix
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
    case 0x51d: {  // CreateViewportMatrixD
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
    case 0x51e: {  // CreateRotationXYZMatrix
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
    case 0x51f: {  // CreateRotationXYZMatrixD
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
    case 0x520: {  // CreateRotationXZYMatrix
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
    case 0x521: {  // CreateRotationXZYMatrixD
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
    case 0x522: {  // CreateRotationYXZMatrix
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
    case 0x523: {  // CreateRotationYXZMatrixD
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
    case 0x524: {  // CreateRotationYZXMatrix
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
    case 0x525: {  // CreateRotationYZXMatrixD
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
    case 0x526: {  // CreateRotationZXYMatrix
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
    case 0x527: {  // CreateRotationZXYMatrixD
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
    case 0x528: {  // CreateRotationZYXMatrix
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
    case 0x529: {  // CreateRotationZYXMatrixD
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
    case 0x52a: {  // GetMatrixXYZRotation
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
    case 0x52b: {  // GetMatrixXYZRotationD
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
    case 0x52c: {  // GetMatrixXZYRotation
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
    case 0x52d: {  // GetMatrixXZYRotationD
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
    case 0x52e: {  // GetMatrixYXZRotation
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
    case 0x52f: {  // GetMatrixYXZRotationD
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
    case 0x530: {  // GetMatrixYZXRotation
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
    case 0x531: {  // GetMatrixYZXRotationD
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
    case 0x532: {  // GetMatrixZXYRotation
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
    case 0x533: {  // GetMatrixZXYRotationD
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
    case 0x534: {  // GetMatrixZYXRotation
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
    case 0x535: {  // GetMatrixZYXRotationD
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
    case 0x536: {  // VectorConvertFtoD
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
    case 0x537: {  // VectorConvertDtoF
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
    case 0x538: {  // VectorNormalize
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
    case 0x539: {  // VectorNormalizeD
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
    case 0x53a: {  // VectorScale
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
    case 0x53b: {  // VectorScaleD
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
    case 0x53c: {  // VectorMultiply
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
    case 0x53d: {  // VectorMultiplyD
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
    case 0x53e: {  // VectorSub
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
    case 0x53f: {  // VectorSubD
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
    case 0x540: {  // VectorAdd
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
    case 0x541: {  // VectorAddD
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
    case 0x542: {  // VectorOuterProduct
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
    case 0x543: {  // VectorOuterProductD
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
    case 0x544: {  // VectorRotationX
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
    case 0x545: {  // VectorRotationXD
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
    case 0x546: {  // VectorRotationY
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
    case 0x547: {  // VectorRotationYD
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
    case 0x548: {  // VectorRotationZ
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
    case 0x549: {  // VectorRotationZD
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
    case 0x54a: {  // VectorTransform
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
    case 0x54b: {  // VectorTransformD
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
    case 0x54c: {  // VectorTransformSR
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
    case 0x54d: {  // VectorTransformSRD
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
    case 0x54e: {  // VectorTransform4
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
    case 0x54f: {  // VectorTransform4D
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
    case 0x550: {  // HitCheck_Triangle_Triangle
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
    case 0x551: {  // HitCheck_Triangle_TriangleD
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
    case 0x552: {  // HitCheck_Triangle_Triangle_2D
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
    case 0x553: {  // HitCheck_Triangle_TriangleD_2D
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
    case 0x554: {  // HitCheck_Point_Cone
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
    case 0x555: {  // HitCheck_Point_ConeD
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
    case 0x556: {  // HitCheck_Line_Sphere
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
    case 0x557: {  // HitCheck_Line_SphereD
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
    case 0x558: {  // HitCheck_Sphere_Sphere
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
    case 0x559: {  // HitCheck_Sphere_SphereD
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
    case 0x55a: {  // HitCheck_Sphere_Capsule
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
    case 0x55b: {  // HitCheck_Sphere_CapsuleD
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
    case 0x55c: {  // HitCheck_Sphere_Triangle
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
    case 0x55d: {  // HitCheck_Sphere_TriangleD
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
    case 0x55e: {  // HitCheck_Capsule_Capsule
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
    case 0x55f: {  // HitCheck_Capsule_CapsuleD
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
    case 0x560: {  // HitCheck_Capsule_Triangle
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
    case 0x561: {  // HitCheck_Capsule_TriangleD
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
    case 0x562: {  // GetImageSize_File
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        PVal *_a2_pv; APTR _a2_ap;
        _a2_ap = code_getva( &_a2_pv );
        int _a2 = 0;
        ctx->stat = GetImageSize_File( _a0_w, &_a1, &_a2 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        code_setva( _a2_pv, _a2_ap, TYPE_INUM, &_a2 );
        return 1;
    }
    case 0x563: {  // SetUseFastLoadFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseFastLoadFlag( _a0 );
        return 1;
    }
    case 0x564: {  // GetGraphDataShavedMode
        ctx->stat = GetGraphDataShavedMode(  );
        return 1;
    }
    case 0x565: {  // SetUsePremulAlphaConvertLoad
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePremulAlphaConvertLoad( _a0 );
        return 1;
    }
    case 0x566: {  // GetUsePremulAlphaConvertLoad
        ctx->stat = GetUsePremulAlphaConvertLoad(  );
        return 1;
    }
    case 0x567: {  // SetUseConvertNormalFormatLoad
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseConvertNormalFormatLoad( _a0 );
        return 1;
    }
    case 0x568: {  // GetUseConvertNormalFormatLoad
        ctx->stat = GetUseConvertNormalFormatLoad(  );
        return 1;
    }
    case 0x569: {  // GetColor2
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
    case 0x56a: {  // InitSoftImage
        ctx->stat = InitSoftImage(  );
        return 1;
    }
    case 0x56b: {  // LoadSoftImage
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadSoftImage( _a0_w );
        return 1;
    }
    case 0x56c: {  // LoadARGB8ColorSoftImage
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadARGB8ColorSoftImage( _a0_w );
        return 1;
    }
    case 0x56d: {  // LoadXRGB8ColorSoftImage
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadXRGB8ColorSoftImage( _a0_w );
        return 1;
    }
    case 0x56e: {  // MakeSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x56f: {  // MakeARGBF32ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGBF32ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x570: {  // MakeARGBF16ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGBF16ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x571: {  // MakeXRGB8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeXRGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x572: {  // MakeARGB8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x573: {  // MakeRGBA8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeRGBA8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x574: {  // MakeABGR8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeABGR8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x575: {  // MakeBGRA8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeBGRA8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x576: {  // MakeARGB4ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGB4ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x577: {  // MakeA1R5G5B5ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeA1R5G5B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x578: {  // MakeX1R5G5B5ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeX1R5G5B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x579: {  // MakeR5G5B5A1ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeR5G5B5A1ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x57a: {  // MakeR5G6B5ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeR5G6B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x57b: {  // MakeRGB8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeRGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x57c: {  // MakePAL8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakePAL8ColorSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x57d: {  // DeleteSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftImage( _a0 );
        return 1;
    }
    case 0x57e: {  // GetSoftImageSize
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
    case 0x57f: {  // CheckPaletteSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckPaletteSoftImage( _a0 );
        return 1;
    }
    case 0x580: {  // CheckAlphaSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x581: {  // CheckPixelAlphaSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckPixelAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x582: {  // GetDrawScreenSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawScreenSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x583: {  // GetDrawScreenSoftImageDestPos
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
    case 0x584: {  // FillSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = FillSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x585: {  // ClearRectSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = ClearRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x586: {  // GetPaletteSoftImage
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
    case 0x587: {  // SetPaletteSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPaletteSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x588: {  // DrawPixelPalCodeSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPixelPalCodeSoftImage( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x589: {  // GetPixelPalCodeSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPixelPalCodeSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x58a: {  // GetPitchSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPitchSoftImage( _a0 );
        return 1;
    }
    case 0x58b: {  // DrawPixelSoftImage
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
    case 0x58c: {  // DrawPixelSoftImageF
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
    case 0x58d: {  // GetPixelSoftImage
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
    case 0x58e: {  // GetPixelSoftImageF
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
    case 0x58f: {  // DrawLineSoftImage
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
    case 0x590: {  // DrawCircleSoftImage
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
    case 0x591: {  // BltSoftImage
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
    case 0x592: {  // BltSoftImageWithTransColor
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
    case 0x593: {  // BltSoftImageWithAlphaBlend
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
    case 0x594: {  // ReverseSoftImageH
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImageH( _a0 );
        return 1;
    }
    case 0x595: {  // ReverseSoftImageV
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImageV( _a0 );
        return 1;
    }
    case 0x596: {  // ReverseSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImage( _a0 );
        return 1;
    }
    case 0x597: {  // ConvertPremulAlphaSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ConvertPremulAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x598: {  // ConvertInterpAlphaSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ConvertInterpAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x599: {  // BltStringSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = BltStringSoftImage( _a0, _a1, _a2_w, _a3, _a4, _a5 );
        return 1;
    }
    case 0x59a: {  // DrawSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x59b: {  // SaveSoftImageToBmp
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToBmp( _a0_w, _a1 );
        return 1;
    }
    case 0x59c: {  // SaveSoftImageToDds
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToDds( _a0_w, _a1 );
        return 1;
    }
    case 0x59d: {  // SaveSoftImageToPng
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToPng( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x59e: {  // SaveSoftImageToJpeg
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToJpeg( _a0_w, _a1, _a2, _a3 );
        return 1;
    }
    case 0x59f: {  // InitSoundMem
        ctx->stat = InitSoundMem(  );
        return 1;
    }
    case 0x5a0: {  // AddSoundData
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = AddSoundData( _a0 );
        return 1;
    }
    case 0x5a1: {  // AddStreamSoundMemToFile
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = AddStreamSoundMemToFile( _a0_w, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5a2: {  // SetupStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetupStreamSoundMem( _a0 );
        return 1;
    }
    case 0x5a3: {  // PlayStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( DX_PLAYTYPE_LOOP );
        int _a2 = hsp3dx_auto_geti( 1 );
        ctx->stat = PlayStreamSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5a4: {  // CheckStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckStreamSoundMem( _a0 );
        return 1;
    }
    case 0x5a5: {  // StopStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopStreamSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5a6: {  // SetStreamSoundCurrentPosition
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetStreamSoundCurrentPosition( _a0, _a1 );
        return 1;
    }
    case 0x5a7: {  // SetStreamSoundCurrentTime
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetStreamSoundCurrentTime( _a0, _a1 );
        return 1;
    }
    case 0x5a8: {  // ProcessStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ProcessStreamSoundMem( _a0 );
        return 1;
    }
    case 0x5a9: {  // ProcessStreamSoundMemAll
        ctx->stat = ProcessStreamSoundMemAll(  );
        return 1;
    }
    case 0x5aa: {  // LoadSoundMem2
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = LoadSoundMem2( _a0_w, _a1_w );
        return 1;
    }
    case 0x5ab: {  // LoadBGM
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadBGM( _a0_w );
        return 1;
    }
    case 0x5ac: {  // LoadSoundMemBase
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = LoadSoundMemBase( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x5ad: {  // LoadSoundMemToBufNumSitei
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadSoundMemToBufNumSitei( _a0_w, _a1 );
        return 1;
    }
    case 0x5ae: {  // DuplicateSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 3 );
        ctx->stat = DuplicateSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5af: {  // LoadSoundMemFromSoftSound
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 3 );
        ctx->stat = LoadSoundMemFromSoftSound( _a0, _a1 );
        return 1;
    }
    case 0x5b0: {  // ChangePanSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangePanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5b1: {  // GetPanSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPanSoundMem( _a0 );
        return 1;
    }
    case 0x5b2: {  // ChangeVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5b3: {  // GetVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetVolumeSoundMem( _a0 );
        return 1;
    }
    case 0x5b4: {  // GetVolumeSoundMem2
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetVolumeSoundMem2( _a0 );
        return 1;
    }
    case 0x5b5: {  // SetChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b6: {  // ChangeChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b7: {  // GetChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetChannelVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5b8: {  // GetChannelVolumeSoundMem2
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetChannelVolumeSoundMem2( _a0, _a1 );
        return 1;
    }
    case 0x5b9: {  // SetFrequencySoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFrequencySoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5ba: {  // GetFrequencySoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFrequencySoundMem( _a0 );
        return 1;
    }
    case 0x5bb: {  // ResetFrequencySoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetFrequencySoundMem( _a0 );
        return 1;
    }
    case 0x5bc: {  // SetNextPlayPanSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayPanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5bd: {  // ChangeNextPlayPanSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayPanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5be: {  // SetNextPlayVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5bf: {  // ChangeNextPlayVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5c0: {  // SetNextPlayChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c1: {  // ChangeNextPlayChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c2: {  // SetNextPlayFrequencySoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayFrequencySoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5c3: {  // SetCurrentPositionSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCurrentPositionSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5c4: {  // SetSoundCurrentPosition
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetSoundCurrentPosition( _a0, _a1 );
        return 1;
    }
    case 0x5c5: {  // SetSoundCurrentTime
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetSoundCurrentTime( _a0, _a1 );
        return 1;
    }
    case 0x5c6: {  // SetLoopPosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopPosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5c7: {  // SetLoopTimePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopTimePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5c8: {  // SetLoopSamplePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopSamplePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5c9: {  // SetLoopStartTimePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopStartTimePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5ca: {  // SetLoopStartSamplePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopStartSamplePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5cb: {  // SetLoopAreaTimePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopAreaTimePosSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5cc: {  // SetLoopAreaSamplePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopAreaSamplePosSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5cd: {  // SetPlayFinishDeleteSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPlayFinishDeleteSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5ce: {  // Set3DPositionSoundMem
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
    case 0x5cf: {  // Set3DRadiusSoundMem
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = Set3DRadiusSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5d0: {  // Set3DVelocitySoundMem
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
    case 0x5d1: {  // SetNextPlay3DPositionSoundMem
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
    case 0x5d2: {  // SetNextPlay3DRadiusSoundMem
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlay3DRadiusSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x5d3: {  // SetNextPlay3DVelocitySoundMem
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
    case 0x5d4: {  // GetOggCommentNum
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = GetOggCommentNum( _a0_w );
        return 1;
    }
    case 0x5d5: {  // SetCreateSoundDataType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateSoundDataType( _a0 );
        return 1;
    }
    case 0x5d6: {  // GetCreateSoundDataType
        ctx->stat = GetCreateSoundDataType(  );
        return 1;
    }
    case 0x5d7: {  // SetCreateSoundPitchRate
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCreateSoundPitchRate( _a0 );
        return 1;
    }
    case 0x5d8: {  // SetCreateSoundTimeStretchRate
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCreateSoundTimeStretchRate( _a0 );
        return 1;
    }
    case 0x5d9: {  // SetCreateSoundLoopAreaTimePos
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = SetCreateSoundLoopAreaTimePos( _a0, _a1 );
        return 1;
    }
    case 0x5da: {  // SetCreateSoundLoopAreaSamplePos
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = SetCreateSoundLoopAreaSamplePos( _a0, _a1 );
        return 1;
    }
    case 0x5db: {  // SetCreateSoundIgnoreLoopAreaInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateSoundIgnoreLoopAreaInfo( _a0 );
        return 1;
    }
    case 0x5dc: {  // GetCreateSoundIgnoreLoopAreaInfo
        ctx->stat = GetCreateSoundIgnoreLoopAreaInfo(  );
        return 1;
    }
    case 0x5dd: {  // SetDisableReadSoundFunctionMask
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDisableReadSoundFunctionMask( _a0 );
        return 1;
    }
    case 0x5de: {  // GetDisableReadSoundFunctionMask
        ctx->stat = GetDisableReadSoundFunctionMask(  );
        return 1;
    }
    case 0x5df: {  // SetEnableSoundCaptureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetEnableSoundCaptureFlag( _a0 );
        return 1;
    }
    case 0x5e0: {  // SetUseOldVolumeCalcFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseOldVolumeCalcFlag( _a0 );
        return 1;
    }
    case 0x5e1: {  // GetSoundCurrentTimeType
        ctx->stat = GetSoundCurrentTimeType(  );
        return 1;
    }
    case 0x5e2: {  // SetCreate3DSoundFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreate3DSoundFlag( _a0 );
        return 1;
    }
    case 0x5e3: {  // Set3DSoundOneMetre
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundOneMetre( _a0 );
        return 1;
    }
    case 0x5e4: {  // Set3DSoundListenerPosAndFrontPos_UpVecY
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
    case 0x5e5: {  // Set3DSoundListenerPosAndFrontPosAndUpVec
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
    case 0x5e6: {  // Set3DSoundListenerVelocity
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = Set3DSoundListenerVelocity( _a0 );
        return 1;
    }
    case 0x5e7: {  // Set3DSoundListenerConeAngle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundListenerConeAngle( _a0, _a1 );
        return 1;
    }
    case 0x5e8: {  // Set3DSoundListenerConeVolume
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundListenerConeVolume( _a0, _a1 );
        return 1;
    }
    case 0x5e9: {  // SetBeepFrequency
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBeepFrequency( _a0 );
        return 1;
    }
    case 0x5ea: {  // PlayBeep
        ctx->stat = PlayBeep(  );
        return 1;
    }
    case 0x5eb: {  // StopBeep
        ctx->stat = StopBeep(  );
        return 1;
    }
    case 0x5ec: {  // PlaySoundFile
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySoundFile( _a0_w, _a1 );
        return 1;
    }
    case 0x5ed: {  // PlaySound
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySound( _a0_w, _a1 );
        return 1;
    }
    case 0x5ee: {  // PlaySoundDX
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySoundDX( _a0_w, _a1 );
        return 1;
    }
    case 0x5ef: {  // CheckSoundFile
        ctx->stat = CheckSoundFile(  );
        return 1;
    }
    case 0x5f0: {  // CheckSound
        ctx->stat = CheckSound(  );
        return 1;
    }
    case 0x5f1: {  // StopSoundFile
        ctx->stat = StopSoundFile(  );
        return 1;
    }
    case 0x5f2: {  // StopSound
        ctx->stat = StopSound(  );
        return 1;
    }
    case 0x5f3: {  // SetVolumeSoundFile
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeSoundFile( _a0 );
        return 1;
    }
    case 0x5f4: {  // SetVolumeSound
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeSound( _a0 );
        return 1;
    }
    case 0x5f5: {  // InitSoftSound
        ctx->stat = InitSoftSound(  );
        return 1;
    }
    case 0x5f6: {  // LoadSoftSound
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadSoftSound( _a0_w );
        return 1;
    }
    case 0x5f7: {  // MakeSoftSound
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound( _a0, _a1 );
        return 1;
    }
    case 0x5f8: {  // MakeSoftSound2Ch16Bit44KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch16Bit44KHz( _a0 );
        return 1;
    }
    case 0x5f9: {  // MakeSoftSound2Ch16Bit22KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch16Bit22KHz( _a0 );
        return 1;
    }
    case 0x5fa: {  // MakeSoftSound2Ch8Bit44KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch8Bit44KHz( _a0 );
        return 1;
    }
    case 0x5fb: {  // MakeSoftSound2Ch8Bit22KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch8Bit22KHz( _a0 );
        return 1;
    }
    case 0x5fc: {  // MakeSoftSound1Ch16Bit44KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch16Bit44KHz( _a0 );
        return 1;
    }
    case 0x5fd: {  // MakeSoftSound1Ch16Bit22KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch16Bit22KHz( _a0 );
        return 1;
    }
    case 0x5fe: {  // MakeSoftSound1Ch8Bit44KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch8Bit44KHz( _a0 );
        return 1;
    }
    case 0x5ff: {  // MakeSoftSound1Ch8Bit22KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch8Bit22KHz( _a0 );
        return 1;
    }
    case 0x600: {  // MakeSoftSoundCustom
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        LONGLONG _a3 = (LONGLONG)code_geti64();
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundCustom( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x601: {  // DeleteSoftSound
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftSound( _a0 );
        return 1;
    }
    case 0x602: {  // SaveSoftSound
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = SaveSoftSound( _a0, _a1_w );
        return 1;
    }
    case 0x603: {  // GetSoftSoundFormat
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
    case 0x604: {  // ReadSoftSoundData
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
    case 0x605: {  // ReadSoftSoundDataF
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
    case 0x606: {  // WriteSoftSoundData
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = WriteSoftSoundData( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x607: {  // WriteSoftSoundDataF
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = WriteSoftSoundDataF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x608: {  // WriteTimeStretchSoftSoundData
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = WriteTimeStretchSoftSoundData( _a0, _a1 );
        return 1;
    }
    case 0x609: {  // WritePitchShiftSoftSoundData
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = WritePitchShiftSoftSoundData( _a0, _a1 );
        return 1;
    }
    case 0x60a: {  // GetFFTVibrationSoftSound
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
    case 0x60b: {  // GetFFTVibrationSoftSoundBase
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
    case 0x60c: {  // InitSoftSoundPlayer
        ctx->stat = InitSoftSoundPlayer(  );
        return 1;
    }
    case 0x60d: {  // MakeSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x60e: {  // MakeSoftSoundPlayer2Ch16Bit44KHz
        ctx->stat = MakeSoftSoundPlayer2Ch16Bit44KHz(  );
        return 1;
    }
    case 0x60f: {  // MakeSoftSoundPlayer2Ch16Bit22KHz
        ctx->stat = MakeSoftSoundPlayer2Ch16Bit22KHz(  );
        return 1;
    }
    case 0x610: {  // MakeSoftSoundPlayer2Ch8Bit44KHz
        ctx->stat = MakeSoftSoundPlayer2Ch8Bit44KHz(  );
        return 1;
    }
    case 0x611: {  // MakeSoftSoundPlayer2Ch8Bit22KHz
        ctx->stat = MakeSoftSoundPlayer2Ch8Bit22KHz(  );
        return 1;
    }
    case 0x612: {  // MakeSoftSoundPlayer1Ch16Bit44KHz
        ctx->stat = MakeSoftSoundPlayer1Ch16Bit44KHz(  );
        return 1;
    }
    case 0x613: {  // MakeSoftSoundPlayer1Ch16Bit22KHz
        ctx->stat = MakeSoftSoundPlayer1Ch16Bit22KHz(  );
        return 1;
    }
    case 0x614: {  // MakeSoftSoundPlayer1Ch8Bit44KHz
        ctx->stat = MakeSoftSoundPlayer1Ch8Bit44KHz(  );
        return 1;
    }
    case 0x615: {  // MakeSoftSoundPlayer1Ch8Bit22KHz
        ctx->stat = MakeSoftSoundPlayer1Ch8Bit22KHz(  );
        return 1;
    }
    case 0x616: {  // MakeSoftSoundPlayerCustom
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundPlayerCustom( _a0, _a1, _a2 );
        return 1;
    }
    case 0x617: {  // DeleteSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x618: {  // AddDataSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        LONGLONG _a2 = (LONGLONG)code_geti64();
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddDataSoftSoundPlayer( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x619: {  // AddOneDataSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddOneDataSoftSoundPlayer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x61a: {  // GetSoftSoundPlayerFormat
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
    case 0x61b: {  // StartSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StartSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x61c: {  // CheckStartSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckStartSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x61d: {  // StopSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x61e: {  // ResetSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x61f: {  // GetStockDataLengthSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        PVal *_a1_pv; APTR _a1_ap;
        _a1_ap = code_getva( &_a1_pv );
        int _a1 = 0;
        ctx->stat = GetStockDataLengthSoftSoundPlayer( _a0, &_a1 );
        code_setva( _a1_pv, _a1_ap, TYPE_INUM, &_a1 );
        return 1;
    }
    case 0x620: {  // CheckSoftSoundPlayerNoneData
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckSoftSoundPlayerNoneData( _a0 );
        return 1;
    }
    case 0x621: {  // DeleteMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteMusicMem( _a0 );
        return 1;
    }
    case 0x622: {  // LoadMusicMem
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadMusicMem( _a0_w );
        return 1;
    }
    case 0x623: {  // PlayMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMusicMem( _a0, _a1 );
        return 1;
    }
    case 0x624: {  // StopMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopMusicMem( _a0 );
        return 1;
    }
    case 0x625: {  // CheckMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckMusicMem( _a0 );
        return 1;
    }
    case 0x626: {  // SetVolumeMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeMusicMem( _a0, _a1 );
        return 1;
    }
    case 0x627: {  // GetMusicMemPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMusicMemPosition( _a0 );
        return 1;
    }
    case 0x628: {  // InitMusicMem
        ctx->stat = InitMusicMem(  );
        return 1;
    }
    case 0x629: {  // ProcessMusicMem
        ctx->stat = ProcessMusicMem(  );
        return 1;
    }
    case 0x62a: {  // PlayMusic
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMusic( _a0_w, _a1 );
        return 1;
    }
    case 0x62b: {  // SetVolumeMusic
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeMusic( _a0 );
        return 1;
    }
    case 0x62c: {  // StopMusic
        ctx->stat = StopMusic(  );
        return 1;
    }
    case 0x62d: {  // CheckMusic
        ctx->stat = CheckMusic(  );
        return 1;
    }
    case 0x62e: {  // GetMusicPosition
        ctx->stat = GetMusicPosition(  );
        return 1;
    }
    case 0x62f: {  // SelectMidiMode
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SelectMidiMode( _a0 );
        return 1;
    }
    case 0x630: {  // SetUseDXArchiveFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDXArchiveFlag( _a0 );
        return 1;
    }
    case 0x631: {  // SetDXArchivePriority
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDXArchivePriority( _a0 );
        return 1;
    }
    case 0x632: {  // SetDXArchiveExtension
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetDXArchiveExtension( _a0_w );
        return 1;
    }
    case 0x633: {  // SetDXArchiveKeyString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetDXArchiveKeyString( _a0_w );
        return 1;
    }
    case 0x634: {  // DXArchivePreLoad
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DXArchivePreLoad( _a0_w, _a1 );
        return 1;
    }
    case 0x635: {  // DXArchiveCheckIdle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = DXArchiveCheckIdle( _a0_w );
        return 1;
    }
    case 0x636: {  // DXArchiveRelease
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = DXArchiveRelease( _a0_w );
        return 1;
    }
    case 0x637: {  // DXArchiveCheckFile
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = DXArchiveCheckFile( _a0_w, _a1_w );
        return 1;
    }
    case 0x638: {  // MV1DuplicateModel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DuplicateModel( _a0 );
        return 1;
    }
    case 0x639: {  // MV1CreateCloneModel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1CreateCloneModel( _a0 );
        return 1;
    }
    case 0x63a: {  // MV1InitModel
        ctx->stat = MV1InitModel(  );
        return 1;
    }
    case 0x63b: {  // MV1SetLoadModelReMakeNormal
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelReMakeNormal( _a0 );
        return 1;
    }
    case 0x63c: {  // MV1SetLoadModelReMakeNormalSmoothingAngle
        float _a0 = (float)hsp3dx_auto_getd( 1.562069 );
        ctx->stat = MV1SetLoadModelReMakeNormalSmoothingAngle( _a0 );
        return 1;
    }
    case 0x63d: {  // MV1SetLoadModelIgnoreScaling
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelIgnoreScaling( _a0 );
        return 1;
    }
    case 0x63e: {  // MV1SetLoadModelPositionOptimize
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelPositionOptimize( _a0 );
        return 1;
    }
    case 0x63f: {  // MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon( _a0 );
        return 1;
    }
    case 0x640: {  // MV1SetLoadModelPhysicsWorldGravity
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetLoadModelPhysicsWorldGravity( _a0 );
        return 1;
    }
    case 0x641: {  // MV1SetLoadCalcPhysicsWorldGravity
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
    case 0x642: {  // MV1SetLoadModelPhysicsCalcPrecision
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelPhysicsCalcPrecision( _a0 );
        return 1;
    }
    case 0x643: {  // MV1AddLoadModelDisablePhysicsNameWord
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = MV1AddLoadModelDisablePhysicsNameWord( _a0_w );
        return 1;
    }
    case 0x644: {  // MV1ResetLoadModelDisablePhysicsNameWord
        ctx->stat = MV1ResetLoadModelDisablePhysicsNameWord(  );
        return 1;
    }
    case 0x645: {  // MV1SetLoadModelAnimFilePath
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = MV1SetLoadModelAnimFilePath( _a0_w );
        return 1;
    }
    case 0x646: {  // MV1SetLoadModelUsePackDraw
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelUsePackDraw( _a0 );
        return 1;
    }
    case 0x647: {  // MV1SetLoadModelTriangleListUseMaxBoneNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelTriangleListUseMaxBoneNum( _a0 );
        return 1;
    }
    case 0x648: {  // MV1SetLoadModelTextureLoad
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelTextureLoad( _a0 );
        return 1;
    }
    case 0x649: {  // MV1SetLoadModelIgnoreIK
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelIgnoreIK( _a0 );
        return 1;
    }
    case 0x64a: {  // MV1SaveModelToMV1File
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( MV1_SAVETYPE_NORMAL );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( 1 );
        int _a5 = hsp3dx_auto_geti( 1 );
        int _a6 = hsp3dx_auto_geti( 1 );
        int _a7 = hsp3dx_auto_geti( 0 );
        int _a8 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SaveModelToMV1File( _a0, _a1_w, _a2, _a3, _a4, _a5, _a6, _a7, _a8 );
        return 1;
    }
    case 0x64b: {  // MV1SaveModelToXFile
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( MV1_SAVETYPE_NORMAL );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SaveModelToXFile( _a0, _a1_w, _a2, _a3, _a4 );
        return 1;
    }
    case 0x64c: {  // MV1DrawFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawFrame( _a0, _a1 );
        return 1;
    }
    case 0x64d: {  // MV1DrawMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawMesh( _a0, _a1 );
        return 1;
    }
    case 0x64e: {  // MV1DrawTriangleList
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawTriangleList( _a0, _a1 );
        return 1;
    }
    case 0x64f: {  // MV1DrawModelDebug
        int _a0 = hsp3dx_auto_geti( 0 );
        unsigned int _a1 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawModelDebug( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x650: {  // MV1SetUseOrigShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseOrigShader( _a0 );
        return 1;
    }
    case 0x651: {  // MV1SetPositionD
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
    case 0x652: {  // MV1SetRotationZYAxis
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
    case 0x653: {  // MV1SetRotationYUseDir
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
    case 0x654: {  // MV1SetRotationMatrix
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
    case 0x655: {  // MV1SetMatrix
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
    case 0x656: {  // MV1SetMatrixD
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
    case 0x657: {  // MV1SetVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetVisible( _a0, _a1 );
        return 1;
    }
    case 0x658: {  // MV1GetVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetVisible( _a0 );
        return 1;
    }
    case 0x659: {  // MV1SetMeshCategoryVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshCategoryVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x65a: {  // MV1GetMeshCategoryVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshCategoryVisible( _a0, _a1 );
        return 1;
    }
    case 0x65b: {  // MV1SetDifColorScale
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
    case 0x65c: {  // MV1SetSpcColorScale
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
    case 0x65d: {  // MV1SetEmiColorScale
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
    case 0x65e: {  // MV1SetAmbColorScale
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
    case 0x65f: {  // MV1GetSemiTransState
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetSemiTransState( _a0 );
        return 1;
    }
    case 0x660: {  // MV1SetOpacityRate
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetOpacityRate( _a0, _a1 );
        return 1;
    }
    case 0x661: {  // MV1SetUseDrawMulAlphaColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseDrawMulAlphaColor( _a0, _a1 );
        return 1;
    }
    case 0x662: {  // MV1GetUseDrawMulAlphaColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetUseDrawMulAlphaColor( _a0 );
        return 1;
    }
    case 0x663: {  // MV1SetUseZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseZBuffer( _a0, _a1 );
        return 1;
    }
    case 0x664: {  // MV1SetWriteZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetWriteZBuffer( _a0, _a1 );
        return 1;
    }
    case 0x665: {  // MV1SetZBias
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetZBias( _a0, _a1 );
        return 1;
    }
    case 0x666: {  // MV1SetUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseVertDifColor( _a0, _a1 );
        return 1;
    }
    case 0x667: {  // MV1SetUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseVertSpcColor( _a0, _a1 );
        return 1;
    }
    case 0x668: {  // MV1SetSampleFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetSampleFilterMode( _a0, _a1 );
        return 1;
    }
    case 0x669: {  // MV1SetMaxAnisotropy
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaxAnisotropy( _a0, _a1 );
        return 1;
    }
    case 0x66a: {  // MV1SetWireFrameDrawFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetWireFrameDrawFlag( _a0, _a1 );
        return 1;
    }
    case 0x66b: {  // MV1RefreshVertColorFromMaterial
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1RefreshVertColorFromMaterial( _a0 );
        return 1;
    }
    case 0x66c: {  // MV1SetPhysicsWorldGravity
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
    case 0x66d: {  // MV1PhysicsCalculation
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1PhysicsCalculation( _a0, _a1 );
        return 1;
    }
    case 0x66e: {  // MV1PhysicsResetState
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1PhysicsResetState( _a0 );
        return 1;
    }
    case 0x66f: {  // MV1SetPrioritizePhysicsOverAnimFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetPrioritizePhysicsOverAnimFlag( _a0, _a1 );
        return 1;
    }
    case 0x670: {  // MV1SetUseShapeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x671: {  // MV1GetMaterialNumberOrderFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNumberOrderFlag( _a0 );
        return 1;
    }
    case 0x672: {  // MV1AttachAnim
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1AttachAnim( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x673: {  // MV1DetachAnim
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DetachAnim( _a0, _a1 );
        return 1;
    }
    case 0x674: {  // MV1SetAttachAnimTime
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetAttachAnimTime( _a0, _a1, _a2 );
        return 1;
    }
    case 0x675: {  // MV1SetAttachAnimBlendRate
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = MV1SetAttachAnimBlendRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x676: {  // MV1SetAttachAnimBlendRateToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SetAttachAnimBlendRateToFrame( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x677: {  // MV1SetAttachAnimTimeToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SetAttachAnimTimeToFrame( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x678: {  // MV1GetAttachAnim
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAttachAnim( _a0, _a1 );
        return 1;
    }
    case 0x679: {  // MV1SetAttachAnimUseShapeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetAttachAnimUseShapeFlag( _a0, _a1, _a2 );
        return 1;
    }
    case 0x67a: {  // MV1GetAttachAnimUseShapeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAttachAnimUseShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x67b: {  // MV1GetAnimNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimNum( _a0 );
        return 1;
    }
    case 0x67c: {  // MV1SetAnimName
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1SetAnimName( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x67d: {  // MV1GetAnimIndex
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = MV1GetAnimIndex( _a0, _a1_w );
        return 1;
    }
    case 0x67e: {  // MV1GetAnimTargetFrameNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameNum( _a0, _a1 );
        return 1;
    }
    case 0x67f: {  // MV1GetAnimTargetFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrame( _a0, _a1, _a2 );
        return 1;
    }
    case 0x680: {  // MV1GetAnimTargetFrameKeySetNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameKeySetNum( _a0, _a1, _a2 );
        return 1;
    }
    case 0x681: {  // MV1GetAnimTargetFrameKeySet
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameKeySet( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x682: {  // MV1GetAnimKeySetNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetNum( _a0 );
        return 1;
    }
    case 0x683: {  // MV1GetAnimKeySetType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetType( _a0, _a1 );
        return 1;
    }
    case 0x684: {  // MV1GetAnimKeySetDataType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetDataType( _a0, _a1 );
        return 1;
    }
    case 0x685: {  // MV1GetAnimKeySetTimeType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetTimeType( _a0, _a1 );
        return 1;
    }
    case 0x686: {  // MV1GetAnimKeySetDataNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetDataNum( _a0, _a1 );
        return 1;
    }
    case 0x687: {  // MV1GetAnimKeyDataIndexFromTime
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1GetAnimKeyDataIndexFromTime( _a0, _a1, _a2 );
        return 1;
    }
    case 0x688: {  // MV1GetMaterialNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNum( _a0 );
        return 1;
    }
    case 0x689: {  // MV1SetMaterialTypeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x68a: {  // MV1SetMaterialType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x68b: {  // MV1GetMaterialType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialType( _a0, _a1 );
        return 1;
    }
    case 0x68c: {  // MV1SetMaterialDifColor
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
    case 0x68d: {  // MV1SetMaterialSpcColor
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
    case 0x68e: {  // MV1SetMaterialEmiColor
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
    case 0x68f: {  // MV1SetMaterialAmbColor
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
    case 0x690: {  // MV1SetMaterialSpcPower
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialSpcPower( _a0, _a1, _a2 );
        return 1;
    }
    case 0x691: {  // MV1SetMaterialDifMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x692: {  // MV1GetMaterialDifMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x693: {  // MV1SetMaterialSubDifMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSubDifMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x694: {  // MV1GetMaterialSubDifMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSubDifMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x695: {  // MV1SetMaterialSpcMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x696: {  // MV1GetMaterialSpcMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x697: {  // MV1SetMaterialNormalMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialNormalMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x698: {  // MV1GetMaterialNormalMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNormalMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x699: {  // MV1SetMaterialDifGradTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x69a: {  // MV1GetMaterialDifGradTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifGradTexture( _a0, _a1 );
        return 1;
    }
    case 0x69b: {  // MV1SetMaterialSpcGradTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x69c: {  // MV1GetMaterialSpcGradTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcGradTexture( _a0, _a1 );
        return 1;
    }
    case 0x69d: {  // MV1SetMaterialSphereMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x69e: {  // MV1GetMaterialSphereMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSphereMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x69f: {  // MV1SetMaterialDifGradBlendTypeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x6a0: {  // MV1SetMaterialDifGradBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6a1: {  // MV1GetMaterialDifGradBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifGradBlendType( _a0, _a1 );
        return 1;
    }
    case 0x6a2: {  // MV1SetMaterialSpcGradBlendTypeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x6a3: {  // MV1SetMaterialSpcGradBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6a4: {  // MV1GetMaterialSpcGradBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcGradBlendType( _a0, _a1 );
        return 1;
    }
    case 0x6a5: {  // MV1SetMaterialSphereMapBlendTypeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x6a6: {  // MV1SetMaterialSphereMapBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6a7: {  // MV1GetMaterialSphereMapBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSphereMapBlendType( _a0, _a1 );
        return 1;
    }
    case 0x6a8: {  // MV1SetMaterialOutLineWidthAll
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineWidthAll( _a0, _a1 );
        return 1;
    }
    case 0x6a9: {  // MV1SetMaterialOutLineWidth
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineWidth( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6aa: {  // MV1SetMaterialOutLineDotWidthAll
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineDotWidthAll( _a0, _a1 );
        return 1;
    }
    case 0x6ab: {  // MV1SetMaterialOutLineDotWidth
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineDotWidth( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6ac: {  // MV1SetMaterialOutLineColorAll
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
    case 0x6ad: {  // MV1SetMaterialOutLineColor
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
    case 0x6ae: {  // MV1SetMaterialDrawBlendModeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendModeAll( _a0, _a1 );
        return 1;
    }
    case 0x6af: {  // MV1SetMaterialDrawBlendMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6b0: {  // MV1GetMaterialDrawBlendMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawBlendMode( _a0, _a1 );
        return 1;
    }
    case 0x6b1: {  // MV1SetMaterialDrawBlendParamAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendParamAll( _a0, _a1 );
        return 1;
    }
    case 0x6b2: {  // MV1SetMaterialDrawBlendParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendParam( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6b3: {  // MV1GetMaterialDrawBlendParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawBlendParam( _a0, _a1 );
        return 1;
    }
    case 0x6b4: {  // MV1SetMaterialDrawAlphaTestAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAlphaTestAll( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x6b5: {  // MV1SetMaterialDrawAlphaTest
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAlphaTest( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x6b6: {  // MV1GetMaterialDrawAlphaTestEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestEnable( _a0, _a1 );
        return 1;
    }
    case 0x6b7: {  // MV1GetMaterialDrawAlphaTestMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestMode( _a0, _a1 );
        return 1;
    }
    case 0x6b8: {  // MV1GetMaterialDrawAlphaTestParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestParam( _a0, _a1 );
        return 1;
    }
    case 0x6b9: {  // MV1SetMaterialDrawAddColorAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAddColorAll( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x6ba: {  // MV1SetMaterialDrawAddColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAddColor( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x6bb: {  // MV1GetMaterialDrawAddColor
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
    case 0x6bc: {  // MV1GetTextureNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureNum( _a0 );
        return 1;
    }
    case 0x6bd: {  // MV1SetTextureColorFilePath
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1SetTextureColorFilePath( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x6be: {  // MV1SetTextureAlphaFilePath
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1SetTextureAlphaFilePath( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x6bf: {  // MV1SetTextureGraphHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureGraphHandle( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x6c0: {  // MV1GetTextureGraphHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureGraphHandle( _a0, _a1 );
        return 1;
    }
    case 0x6c1: {  // MV1SetTextureAddressMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureAddressMode( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x6c2: {  // MV1GetTextureAddressModeU
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureAddressModeU( _a0, _a1 );
        return 1;
    }
    case 0x6c3: {  // MV1GetTextureAddressModeV
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureAddressModeV( _a0, _a1 );
        return 1;
    }
    case 0x6c4: {  // MV1GetTextureWidth
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureWidth( _a0, _a1 );
        return 1;
    }
    case 0x6c5: {  // MV1GetTextureHeight
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureHeight( _a0, _a1 );
        return 1;
    }
    case 0x6c6: {  // MV1GetTextureSemiTransState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x6c7: {  // MV1SetTextureBumpImageFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureBumpImageFlag( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6c8: {  // MV1GetTextureBumpImageFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureBumpImageFlag( _a0, _a1 );
        return 1;
    }
    case 0x6c9: {  // MV1SetTextureBumpImageNextPixelLength
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetTextureBumpImageNextPixelLength( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6ca: {  // MV1SetTextureSampleFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureSampleFilterMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6cb: {  // MV1GetTextureSampleFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureSampleFilterMode( _a0, _a1 );
        return 1;
    }
    case 0x6cc: {  // MV1AddTextureGraphHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( DX_TEXADDRESS_WRAP );
        int _a5 = hsp3dx_auto_geti( DX_TEXADDRESS_WRAP );
        int _a6 = hsp3dx_auto_geti( DX_DRAWMODE_ANISOTROPIC );
        ctx->stat = MV1AddTextureGraphHandle( _a0, _a1_w, _a2, _a3, _a4, _a5, _a6 );
        return 1;
    }
    case 0x6cd: {  // MV1LoadTexture
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = MV1LoadTexture( _a0_w );
        return 1;
    }
    case 0x6ce: {  // MV1GetFrameNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameNum( _a0 );
        return 1;
    }
    case 0x6cf: {  // MV1SearchFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = MV1SearchFrame( _a0, _a1_w );
        return 1;
    }
    case 0x6d0: {  // MV1SearchFrameChild
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1SearchFrameChild( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x6d1: {  // MV1GetFrameName2
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1GetFrameName2( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x6d2: {  // MV1GetFrameParent
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameParent( _a0, _a1 );
        return 1;
    }
    case 0x6d3: {  // MV1GetFrameChildNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1GetFrameChildNum( _a0, _a1 );
        return 1;
    }
    case 0x6d4: {  // MV1GetFrameChild
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameChild( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6d5: {  // MV1SetFrameUserLocalMatrix
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
    case 0x6d6: {  // MV1SetFrameUserLocalMatrixD
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
    case 0x6d7: {  // MV1ResetFrameUserLocalMatrix
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameUserLocalMatrix( _a0, _a1 );
        return 1;
    }
    case 0x6d8: {  // MV1SetFrameUserLocalWorldMatrix
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
    case 0x6d9: {  // MV1SetFrameUserLocalWorldMatrixD
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
    case 0x6da: {  // MV1ResetFrameUserLocalWorldMatrix
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameUserLocalWorldMatrix( _a0, _a1 );
        return 1;
    }
    case 0x6db: {  // MV1GetFrameVertexNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x6dc: {  // MV1GetFrameTriangleNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameTriangleNum( _a0, _a1 );
        return 1;
    }
    case 0x6dd: {  // MV1GetFrameMeshNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameMeshNum( _a0, _a1 );
        return 1;
    }
    case 0x6de: {  // MV1GetFrameMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameMesh( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6df: {  // MV1SetFrameVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetFrameVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6e0: {  // MV1GetFrameVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameVisible( _a0, _a1 );
        return 1;
    }
    case 0x6e1: {  // MV1SetFrameDifColorScale
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
    case 0x6e2: {  // MV1SetFrameSpcColorScale
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
    case 0x6e3: {  // MV1SetFrameEmiColorScale
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
    case 0x6e4: {  // MV1SetFrameAmbColorScale
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
    case 0x6e5: {  // MV1GetFrameSemiTransState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x6e6: {  // MV1SetFrameOpacityRate
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetFrameOpacityRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6e7: {  // MV1SetFrameBaseVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetFrameBaseVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6e8: {  // MV1GetFrameBaseVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameBaseVisible( _a0, _a1 );
        return 1;
    }
    case 0x6e9: {  // MV1SetFrameTextureAddressTransform
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
    case 0x6ea: {  // MV1SetFrameTextureAddressTransformMatrix
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
    case 0x6eb: {  // MV1ResetFrameTextureAddressTransform
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameTextureAddressTransform( _a0, _a1 );
        return 1;
    }
    case 0x6ec: {  // MV1GetMeshNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshNum( _a0 );
        return 1;
    }
    case 0x6ed: {  // MV1GetMeshMaterial
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshMaterial( _a0, _a1 );
        return 1;
    }
    case 0x6ee: {  // MV1GetMeshVertexNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x6ef: {  // MV1GetMeshTriangleNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTriangleNum( _a0, _a1 );
        return 1;
    }
    case 0x6f0: {  // MV1SetMeshVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6f1: {  // MV1GetMeshVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshVisible( _a0, _a1 );
        return 1;
    }
    case 0x6f2: {  // MV1SetMeshDifColorScale
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
    case 0x6f3: {  // MV1SetMeshSpcColorScale
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
    case 0x6f4: {  // MV1SetMeshEmiColorScale
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
    case 0x6f5: {  // MV1SetMeshAmbColorScale
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
    case 0x6f6: {  // MV1SetMeshOpacityRate
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMeshOpacityRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6f7: {  // MV1SetMeshDrawBlendMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshDrawBlendMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6f8: {  // MV1SetMeshDrawBlendParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshDrawBlendParam( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6f9: {  // MV1GetMeshDrawBlendMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshDrawBlendMode( _a0, _a1 );
        return 1;
    }
    case 0x6fa: {  // MV1GetMeshDrawBlendParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshDrawBlendParam( _a0, _a1 );
        return 1;
    }
    case 0x6fb: {  // MV1SetMeshBaseVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshBaseVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6fc: {  // MV1GetMeshBaseVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshBaseVisible( _a0, _a1 );
        return 1;
    }
    case 0x6fd: {  // MV1SetMeshBackCulling
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshBackCulling( _a0, _a1, _a2 );
        return 1;
    }
    case 0x6fe: {  // MV1GetMeshBackCulling
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshBackCulling( _a0, _a1 );
        return 1;
    }
    case 0x6ff: {  // MV1GetMeshTListNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTListNum( _a0, _a1 );
        return 1;
    }
    case 0x700: {  // MV1GetMeshTList
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTList( _a0, _a1, _a2 );
        return 1;
    }
    case 0x701: {  // MV1GetMeshSemiTransState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x702: {  // MV1SetMeshUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshUseVertDifColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x703: {  // MV1SetMeshUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshUseVertSpcColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x704: {  // MV1GetMeshUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshUseVertDifColor( _a0, _a1 );
        return 1;
    }
    case 0x705: {  // MV1GetMeshUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshUseVertSpcColor( _a0, _a1 );
        return 1;
    }
    case 0x706: {  // MV1GetMeshShapeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x707: {  // MV1GetShapeNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeNum( _a0 );
        return 1;
    }
    case 0x708: {  // MV1SearchShape
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = MV1SearchShape( _a0, _a1_w );
        return 1;
    }
    case 0x709: {  // MV1GetShapeTargetMeshNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeTargetMeshNum( _a0, _a1 );
        return 1;
    }
    case 0x70a: {  // MV1GetShapeTargetMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeTargetMesh( _a0, _a1, _a2 );
        return 1;
    }
    case 0x70b: {  // MV1SetShapeRate
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( DX_MV1_SHAPERATE_ADD );
        ctx->stat = MV1SetShapeRate( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x70c: {  // MV1GetTriangleListNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListNum( _a0 );
        return 1;
    }
    case 0x70d: {  // MV1GetTriangleListVertexType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListVertexType( _a0, _a1 );
        return 1;
    }
    case 0x70e: {  // MV1GetTriangleListPolygonNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListPolygonNum( _a0, _a1 );
        return 1;
    }
    case 0x70f: {  // MV1GetTriangleListVertexNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x710: {  // MV1GetTriangleListLocalWorldMatrixNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListLocalWorldMatrixNum( _a0, _a1 );
        return 1;
    }
    case 0x711: {  // MV1GetTriangleListPolygonVertexPosition
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
    case 0x712: {  // MV1GetTriangleListUseMaterial
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListUseMaterial( _a0, _a1 );
        return 1;
    }
    case 0x713: {  // MV1SetupCollInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( 32 );
        int _a3 = hsp3dx_auto_geti( 8 );
        int _a4 = hsp3dx_auto_geti( 32 );
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1SetupCollInfo( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x714: {  // MV1TerminateCollInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1TerminateCollInfo( _a0, _a1, _a2 );
        return 1;
    }
    case 0x715: {  // MV1RefreshCollInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1RefreshCollInfo( _a0, _a1, _a2 );
        return 1;
    }
    case 0x716: {  // MV1SetupReferenceMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1SetupReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x717: {  // MV1TerminateReferenceMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1TerminateReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x718: {  // MV1RefreshReferenceMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1RefreshReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x719: {  // Live2D_SetCubism4CoreDLLPath
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = Live2D_SetCubism4CoreDLLPath( _a0_w );
        return 1;
    }
    case 0x71a: {  // Live2D_SetCubism3CoreDLLPath
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = Live2D_SetCubism3CoreDLLPath( _a0_w );
        return 1;
    }
    case 0x71b: {  // Live2D_RenderBegin
        ctx->stat = Live2D_RenderBegin(  );
        return 1;
    }
    case 0x71c: {  // Live2D_RenderEnd
        ctx->stat = Live2D_RenderEnd(  );
        return 1;
    }
    case 0x71d: {  // Live2D_LoadModel
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = Live2D_LoadModel( _a0_w );
        return 1;
    }
    case 0x71e: {  // Live2D_DeleteModel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_DeleteModel( _a0 );
        return 1;
    }
    case 0x71f: {  // Live2D_InitModel
        ctx->stat = Live2D_InitModel(  );
        return 1;
    }
    case 0x720: {  // Live2D_SetUseAutoScaling
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseAutoScaling( _a0 );
        return 1;
    }
    case 0x721: {  // Live2D_SetUseAutoCentering
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseAutoCentering( _a0 );
        return 1;
    }
    case 0x722: {  // Live2D_SetUseReverseYAxis
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseReverseYAxis( _a0 );
        return 1;
    }
    case 0x723: {  // Live2D_Model_Update
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_Update( _a0, _a1 );
        return 1;
    }
    case 0x724: {  // Live2D_Model_SetTranslate
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetTranslate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x725: {  // Live2D_Model_SetExtendRate
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetExtendRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x726: {  // Live2D_Model_SetRotate
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetRotate( _a0, _a1 );
        return 1;
    }
    case 0x727: {  // Live2D_Model_Draw
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_Draw( _a0 );
        return 1;
    }
    case 0x728: {  // Live2D_Model_StartMotion
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( -1.0 );
        float _a4 = (float)hsp3dx_auto_getd( -1.0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = Live2D_Model_StartMotion( _a0, _a1_w, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x729: {  // Live2D_Model_GetLastPlayMotionNo
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetLastPlayMotionNo( _a0 );
        return 1;
    }
    case 0x72a: {  // Live2D_Model_IsMotionFinished
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_IsMotionFinished( _a0 );
        return 1;
    }
    case 0x72b: {  // Live2D_Model_SetExpression
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = Live2D_Model_SetExpression( _a0, _a1_w );
        return 1;
    }
    case 0x72c: {  // Live2D_Model_HitTest
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_HitTest( _a0, _a1_w, _a2, _a3 );
        return 1;
    }
    case 0x72d: {  // Live2D_Model_GetParameterCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetParameterCount( _a0 );
        return 1;
    }
    case 0x72e: {  // Live2D_Model_SetParameterValue
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetParameterValue( _a0, _a1_w, _a2 );
        return 1;
    }
    case 0x72f: {  // Live2D_Model_GetHitAreasCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetHitAreasCount( _a0 );
        return 1;
    }
    case 0x730: {  // Live2D_Model_GetExpressionCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetExpressionCount( _a0 );
        return 1;
    }
    case 0x731: {  // Live2D_Model_GetMotionGroupCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetMotionGroupCount( _a0 );
        return 1;
    }
    case 0x732: {  // Live2D_Model_GetMotionCount
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = Live2D_Model_GetMotionCount( _a0, _a1_w );
        return 1;
    }
    case 0x733: {  // Live2D_Model_GetEyeBlinkParameterCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetEyeBlinkParameterCount( _a0 );
        return 1;
    }
    case 0x734: {  // Live2D_Model_GetLipSyncParameterCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetLipSyncParameterCount( _a0 );
        return 1;
    }
    }
    return 0;   // 未処理 → 呼び出し側で HSPERR_UNSUPPORTED_FUNCTION 投げる
}
