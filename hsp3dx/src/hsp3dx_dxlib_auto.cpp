//
//  hsp3dx_dxlib_auto.cpp — Phase 5.3 自動生成 DxLib binding dispatcher
//  DO NOT EDIT — tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py で再生成
//  関数数: 1129
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
    case 0x22b: {  // SetMouseDispFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMouseDispFlag( _a0 );
        return 1;
    }
    case 0x22c: {  // SetMouseDispIgnoreMenuFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMouseDispIgnoreMenuFlag( _a0 );
        return 1;
    }
    case 0x22d: {  // GetMouseWheelRotVol
        int _a0 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetMouseWheelRotVol( _a0 );
        return 1;
    }
    case 0x22e: {  // GetMouseHWheelRotVol
        int _a0 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetMouseHWheelRotVol( _a0 );
        return 1;
    }
    case 0x22f: {  // GetTouchInputNum
        ctx->stat = GetTouchInputNum(  );
        return 1;
    }
    case 0x230: {  // GetTouchInputLogNum
        ctx->stat = GetTouchInputLogNum(  );
        return 1;
    }
    case 0x231: {  // ClearTouchInputLog
        ctx->stat = ClearTouchInputLog(  );
        return 1;
    }
    case 0x232: {  // GetTouchInputDownLogNum
        ctx->stat = GetTouchInputDownLogNum(  );
        return 1;
    }
    case 0x233: {  // ClearTouchInputDownLog
        ctx->stat = ClearTouchInputDownLog(  );
        return 1;
    }
    case 0x234: {  // GetTouchInputUpLogNum
        ctx->stat = GetTouchInputUpLogNum(  );
        return 1;
    }
    case 0x235: {  // ClearTouchInputUpLog
        ctx->stat = ClearTouchInputUpLog(  );
        return 1;
    }
    case 0x236: {  // DxSetAllocPrintFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocPrintFlag( _a0 );
        return 1;
    }
    case 0x237: {  // DxGetAllocNum
        ctx->stat = DxGetAllocNum(  );
        return 1;
    }
    case 0x238: {  // DxErrorCheckAlloc
        ctx->stat = DxErrorCheckAlloc(  );
        return 1;
    }
    case 0x239: {  // DxSetAllocSizeOutFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocSizeOutFlag( _a0 );
        return 1;
    }
    case 0x23a: {  // DxSetAllocMemoryErrorCheckFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DxSetAllocMemoryErrorCheckFlag( _a0 );
        return 1;
    }
    case 0x23b: {  // GetUseCharCodeFormat
        ctx->stat = GetUseCharCodeFormat(  );
        return 1;
    }
    case 0x23c: {  // Get_wchar_t_CharCodeFormat
        ctx->stat = Get_wchar_t_CharCodeFormat(  );
        return 1;
    }
    case 0x23d: {  // strcmpDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = strcmpDx( _a0_w, _a1_w );
        return 1;
    }
    case 0x23e: {  // stricmpDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = stricmpDx( _a0_w, _a1_w );
        return 1;
    }
    case 0x23f: {  // strncmpDx
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
    case 0x240: {  // strncmp2Dx
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
    case 0x241: {  // strpncmpDx
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
    case 0x242: {  // strpncmp2Dx
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
    case 0x243: {  // strstr2Dx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = strstr2Dx( _a0_w, _a1_w );
        return 1;
    }
    case 0x244: {  // strrstr2Dx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = strrstr2Dx( _a0_w, _a1_w );
        return 1;
    }
    case 0x245: {  // atoiDx
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = atoiDx( _a0_w );
        return 1;
    }
    case 0x246: {  // ProcessNetMessage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ProcessNetMessage( _a0 );
        return 1;
    }
    case 0x247: {  // PreparationListenNetWork
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = PreparationListenNetWork( _a0 );
        return 1;
    }
    case 0x248: {  // PreparationListenNetWork_IPv6
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = PreparationListenNetWork_IPv6( _a0 );
        return 1;
    }
    case 0x249: {  // StopListenNetWork
        ctx->stat = StopListenNetWork(  );
        return 1;
    }
    case 0x24a: {  // CloseNetWork
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CloseNetWork( _a0 );
        return 1;
    }
    case 0x24b: {  // GetNetWorkAcceptState
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetNetWorkAcceptState( _a0 );
        return 1;
    }
    case 0x24c: {  // GetNetWorkDataLength
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetNetWorkDataLength( _a0 );
        return 1;
    }
    case 0x24d: {  // GetNetWorkSendDataLength
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetNetWorkSendDataLength( _a0 );
        return 1;
    }
    case 0x24e: {  // GetNewAcceptNetWork
        ctx->stat = GetNewAcceptNetWork(  );
        return 1;
    }
    case 0x24f: {  // GetLostNetWork
        ctx->stat = GetLostNetWork(  );
        return 1;
    }
    case 0x250: {  // SetConnectTimeOutWait
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetConnectTimeOutWait( _a0 );
        return 1;
    }
    case 0x251: {  // SetUseDXNetWorkProtocol
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDXNetWorkProtocol( _a0 );
        return 1;
    }
    case 0x252: {  // GetUseDXNetWorkProtocol
        ctx->stat = GetUseDXNetWorkProtocol(  );
        return 1;
    }
    case 0x253: {  // SetUseDXProtocol
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDXProtocol( _a0 );
        return 1;
    }
    case 0x254: {  // GetUseDXProtocol
        ctx->stat = GetUseDXProtocol(  );
        return 1;
    }
    case 0x255: {  // SetNetWorkCloseAfterLostFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNetWorkCloseAfterLostFlag( _a0 );
        return 1;
    }
    case 0x256: {  // GetNetWorkCloseAfterLostFlag
        ctx->stat = GetNetWorkCloseAfterLostFlag(  );
        return 1;
    }
    case 0x257: {  // NetWorkRecvBufferClear
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = NetWorkRecvBufferClear( _a0 );
        return 1;
    }
    case 0x258: {  // MakeUDPSocket
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = MakeUDPSocket( _a0 );
        return 1;
    }
    case 0x259: {  // MakeUDPSocket_IPv6
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = MakeUDPSocket_IPv6( _a0 );
        return 1;
    }
    case 0x25a: {  // DeleteUDPSocket
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteUDPSocket( _a0 );
        return 1;
    }
    case 0x25b: {  // CheckNetWorkRecvUDP
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckNetWorkRecvUDP( _a0 );
        return 1;
    }
    case 0x25c: {  // ClearInputCharBuf
        ctx->stat = ClearInputCharBuf(  );
        return 1;
    }
    case 0x25d: {  // GetOneChar
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetOneChar( _a0_w, _a1 );
        return 1;
    }
    case 0x25e: {  // GetOneCharWait
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetOneCharWait( _a0_w, _a1 );
        return 1;
    }
    case 0x25f: {  // DrawIMEInputString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawIMEInputString( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x260: {  // DrawIMEInputExtendString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawIMEInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x261: {  // SetUseIMEFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseIMEFlag( _a0 );
        return 1;
    }
    case 0x262: {  // GetUseIMEFlag
        ctx->stat = GetUseIMEFlag(  );
        return 1;
    }
    case 0x263: {  // SetInputStringMaxLengthIMESync
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetInputStringMaxLengthIMESync( _a0 );
        return 1;
    }
    case 0x264: {  // SetIMEInputStringMaxLength
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetIMEInputStringMaxLength( _a0 );
        return 1;
    }
    case 0x265: {  // GetStringPoint
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetStringPoint( _a0_w, _a1 );
        return 1;
    }
    case 0x266: {  // GetStringPoint2
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetStringPoint2( _a0_w, _a1 );
        return 1;
    }
    case 0x267: {  // GetStringLength
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = GetStringLength( _a0_w );
        return 1;
    }
    case 0x268: {  // DrawObtainsBox
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
    case 0x269: {  // KeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = KeyInputNumber( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x26a: {  // GetIMEInputModeStr
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = GetIMEInputModeStr( _a0_w );
        return 1;
    }
    case 0x26b: {  // SetIMEInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetIMEInputString( _a0_w );
        return 1;
    }
    case 0x26c: {  // SetKeyInputStringFont
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputStringFont( _a0 );
        return 1;
    }
    case 0x26d: {  // DrawKeyInputModeString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawKeyInputModeString( _a0, _a1 );
        return 1;
    }
    case 0x26e: {  // InitKeyInput
        ctx->stat = InitKeyInput(  );
        return 1;
    }
    case 0x26f: {  // DeleteKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteKeyInput( _a0 );
        return 1;
    }
    case 0x270: {  // SetActiveKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetActiveKeyInput( _a0 );
        return 1;
    }
    case 0x271: {  // GetActiveKeyInput
        ctx->stat = GetActiveKeyInput(  );
        return 1;
    }
    case 0x272: {  // CheckKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckKeyInput( _a0 );
        return 1;
    }
    case 0x273: {  // ReStartKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReStartKeyInput( _a0 );
        return 1;
    }
    case 0x274: {  // ProcessActKeyInput
        ctx->stat = ProcessActKeyInput(  );
        return 1;
    }
    case 0x275: {  // DrawKeyInputString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawKeyInputString( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x276: {  // DrawKeyInputExtendString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawKeyInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x277: {  // SetKeyInputDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputDrawArea( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x278: {  // SetKeyInputSelectArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputSelectArea( _a0, _a1, _a2 );
        return 1;
    }
    case 0x279: {  // SetKeyInputDrawStartPos
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputDrawStartPos( _a0, _a1 );
        return 1;
    }
    case 0x27a: {  // GetKeyInputDrawStartPos
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputDrawStartPos( _a0 );
        return 1;
    }
    case 0x27b: {  // SetKeyInputCursorBrinkTime
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorBrinkTime( _a0 );
        return 1;
    }
    case 0x27c: {  // SetKeyInputCursorBrinkFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorBrinkFlag( _a0 );
        return 1;
    }
    case 0x27d: {  // SetKeyInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputString( _a0_w, _a1 );
        return 1;
    }
    case 0x27e: {  // SetKeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputNumber( _a0, _a1 );
        return 1;
    }
    case 0x27f: {  // SetKeyInputNumberToFloat
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputNumberToFloat( _a0, _a1 );
        return 1;
    }
    case 0x280: {  // GetKeyInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputString( _a0_w, _a1 );
        return 1;
    }
    case 0x281: {  // GetKeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputNumber( _a0 );
        return 1;
    }
    case 0x282: {  // SetKeyInputCursorPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorPosition( _a0, _a1 );
        return 1;
    }
    case 0x283: {  // GetKeyInputCursorPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputCursorPosition( _a0 );
        return 1;
    }
    case 0x284: {  // FileRead_open
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_open( _a0_w, _a1 );
        return 1;
    }
    case 0x285: {  // FileRead_close
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_close( _a0 );
        return 1;
    }
    case 0x286: {  // FileRead_seek
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_seek( _a0, _a1, _a2 );
        return 1;
    }
    case 0x287: {  // FileRead_idle_chk
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_idle_chk( _a0 );
        return 1;
    }
    case 0x288: {  // FileRead_eof
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_eof( _a0 );
        return 1;
    }
    case 0x289: {  // FileRead_gets
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_gets( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x28a: {  // FileRead_fullyLoad
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = FileRead_fullyLoad( _a0_w );
        return 1;
    }
    case 0x28b: {  // FileRead_fullyLoad_delete
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_fullyLoad_delete( _a0 );
        return 1;
    }
    case 0x28c: {  // GetStreamFunctionDefault
        ctx->stat = GetStreamFunctionDefault(  );
        return 1;
    }
    case 0x28d: {  // ConvertFullPath
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
    case 0x28e: {  // CheckHitKeyAll
        int _a0 = hsp3dx_auto_geti( DX_CHECKINPUT_ALL );
        ctx->stat = CheckHitKeyAll( _a0 );
        return 1;
    }
    case 0x28f: {  // GetJoypadNum
        ctx->stat = GetJoypadNum(  );
        return 1;
    }
    case 0x290: {  // GetJoypadButtonNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadButtonNum( _a0 );
        return 1;
    }
    case 0x291: {  // CheckJoypadXInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckJoypadXInput( _a0 );
        return 1;
    }
    case 0x292: {  // GetJoypadType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadType( _a0 );
        return 1;
    }
    case 0x293: {  // SetJoypadInputToKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetJoypadInputToKeyInput( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x294: {  // SetJoypadDeadZone
        int _a0 = hsp3dx_auto_geti( 0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetJoypadDeadZone( _a0, _a1 );
        return 1;
    }
    case 0x295: {  // SetJoypadDefaultDeadZoneAll
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetJoypadDefaultDeadZoneAll( _a0 );
        return 1;
    }
    case 0x296: {  // StartJoypadVibration
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        ctx->stat = StartJoypadVibration( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x297: {  // StopJoypadVibration
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = StopJoypadVibration( _a0, _a1 );
        return 1;
    }
    case 0x298: {  // GetJoypadPOVState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadPOVState( _a0, _a1 );
        return 1;
    }
    case 0x299: {  // ReSetupJoypad
        ctx->stat = ReSetupJoypad(  );
        return 1;
    }
    case 0x29a: {  // ReSetupInputSystem
        ctx->stat = ReSetupInputSystem(  );
        return 1;
    }
    case 0x29b: {  // SetUseJoypadVibrationFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseJoypadVibrationFlag( _a0 );
        return 1;
    }
    case 0x29c: {  // MakeGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x29d: {  // DerivationGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DerivationGraph( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x29e: {  // DerivationGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DerivationGraphF( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x29f: {  // DeleteSharingGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSharingGraph( _a0 );
        return 1;
    }
    case 0x2a0: {  // GetGraphNum
        ctx->stat = GetGraphNum(  );
        return 1;
    }
    case 0x2a1: {  // FillGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 255 );
        ctx->stat = FillGraph( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2a2: {  // FillRectGraph
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
    case 0x2a3: {  // InitGraph
        ctx->stat = InitGraph(  );
        return 1;
    }
    case 0x2a4: {  // ReloadFileGraphAll
        ctx->stat = ReloadFileGraphAll(  );
        return 1;
    }
    case 0x2a5: {  // MakeShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x2a6: {  // DeleteShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShadowMap( _a0 );
        return 1;
    }
    case 0x2a7: {  // SetShadowMapLightDirection
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
    case 0x2a8: {  // ShadowMap_DrawSetup
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ShadowMap_DrawSetup( _a0 );
        return 1;
    }
    case 0x2a9: {  // ShadowMap_DrawEnd
        ctx->stat = ShadowMap_DrawEnd(  );
        return 1;
    }
    case 0x2aa: {  // SetUseShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x2ab: {  // SetShadowMapDrawArea
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
    case 0x2ac: {  // ResetShadowMapDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetShadowMapDrawArea( _a0 );
        return 1;
    }
    case 0x2ad: {  // SetShadowMapAdjustDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetShadowMapAdjustDepth( _a0, _a1 );
        return 1;
    }
    case 0x2ae: {  // TestDrawShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = TestDrawShadowMap( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2af: {  // LoadBmpToGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( DX_MOVIESURFACE_NORMAL );
        ctx->stat = LoadBmpToGraph( _a0_w, _a1, _a2, _a3 );
        return 1;
    }
    case 0x2b0: {  // LoadReverseGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadReverseGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x2b1: {  // LoadBlendGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadBlendGraph( _a0_w );
        return 1;
    }
    case 0x2b2: {  // CreateBlendGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateBlendGraphFromSoftImage( _a0 );
        return 1;
    }
    case 0x2b3: {  // CreateGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateGraphFromSoftImage( _a0 );
        return 1;
    }
    case 0x2b4: {  // CreateGraphFromRectSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2b5: {  // ReCreateGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReCreateGraphFromSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x2b6: {  // ReCreateGraphFromRectSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReCreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x2b7: {  // ReloadGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadGraph( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x2b8: {  // ReloadReverseGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadReverseGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x2b9: {  // SetGraphColorBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphColorBitDepth( _a0 );
        return 1;
    }
    case 0x2ba: {  // GetGraphColorBitDepth
        ctx->stat = GetGraphColorBitDepth(  );
        return 1;
    }
    case 0x2bb: {  // SetCreateGraphColorBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphColorBitDepth( _a0 );
        return 1;
    }
    case 0x2bc: {  // GetCreateGraphColorBitDepth
        ctx->stat = GetCreateGraphColorBitDepth(  );
        return 1;
    }
    case 0x2bd: {  // SetCreateGraphChannelBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphChannelBitDepth( _a0 );
        return 1;
    }
    case 0x2be: {  // GetCreateGraphChannelBitDepth
        ctx->stat = GetCreateGraphChannelBitDepth(  );
        return 1;
    }
    case 0x2bf: {  // SetCreateGraphInitGraphDelete
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphInitGraphDelete( _a0 );
        return 1;
    }
    case 0x2c0: {  // GetCreateGraphInitGraphDelete
        ctx->stat = GetCreateGraphInitGraphDelete(  );
        return 1;
    }
    case 0x2c1: {  // SetCreateGraphHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphHandle( _a0 );
        return 1;
    }
    case 0x2c2: {  // GetCreateGraphHandle
        ctx->stat = GetCreateGraphHandle(  );
        return 1;
    }
    case 0x2c3: {  // SetDrawValidGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2c4: {  // GetDrawValidGraphCreateFlag
        ctx->stat = GetDrawValidGraphCreateFlag(  );
        return 1;
    }
    case 0x2c5: {  // SetDrawValidFlagOf3DGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidFlagOf3DGraph( _a0 );
        return 1;
    }
    case 0x2c6: {  // SetLeftUpColorIsTransColorFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLeftUpColorIsTransColorFlag( _a0 );
        return 1;
    }
    case 0x2c7: {  // SetUsePaletteGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePaletteGraphFlag( _a0 );
        return 1;
    }
    case 0x2c8: {  // SetUseBlendGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseBlendGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2c9: {  // GetUseBlendGraphCreateFlag
        ctx->stat = GetUseBlendGraphCreateFlag(  );
        return 1;
    }
    case 0x2ca: {  // SetUseAlphaTestGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaTestGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2cb: {  // GetUseAlphaTestGraphCreateFlag
        ctx->stat = GetUseAlphaTestGraphCreateFlag(  );
        return 1;
    }
    case 0x2cc: {  // SetUseAlphaTestFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaTestFlag( _a0 );
        return 1;
    }
    case 0x2cd: {  // GetUseAlphaTestFlag
        ctx->stat = GetUseAlphaTestFlag(  );
        return 1;
    }
    case 0x2ce: {  // SetCubeMapTextureCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCubeMapTextureCreateFlag( _a0 );
        return 1;
    }
    case 0x2cf: {  // GetCubeMapTextureCreateFlag
        ctx->stat = GetCubeMapTextureCreateFlag(  );
        return 1;
    }
    case 0x2d0: {  // SetUseNoBlendModeParam
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNoBlendModeParam( _a0 );
        return 1;
    }
    case 0x2d1: {  // SetDrawValidAlphaChannelGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidAlphaChannelGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2d2: {  // GetDrawValidAlphaChannelGraphCreateFlag
        ctx->stat = GetDrawValidAlphaChannelGraphCreateFlag(  );
        return 1;
    }
    case 0x2d3: {  // SetDrawValidFloatTypeGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidFloatTypeGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2d4: {  // GetDrawValidFloatTypeGraphCreateFlag
        ctx->stat = GetDrawValidFloatTypeGraphCreateFlag(  );
        return 1;
    }
    case 0x2d5: {  // SetDrawValidGraphCreateZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidGraphCreateZBufferFlag( _a0 );
        return 1;
    }
    case 0x2d6: {  // GetDrawValidGraphCreateZBufferFlag
        ctx->stat = GetDrawValidGraphCreateZBufferFlag(  );
        return 1;
    }
    case 0x2d7: {  // SetCreateDrawValidGraphZBufferBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphZBufferBitDepth( _a0 );
        return 1;
    }
    case 0x2d8: {  // GetCreateDrawValidGraphZBufferBitDepth
        ctx->stat = GetCreateDrawValidGraphZBufferBitDepth(  );
        return 1;
    }
    case 0x2d9: {  // SetCreateDrawValidGraphMipLevels
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphMipLevels( _a0 );
        return 1;
    }
    case 0x2da: {  // GetCreateDrawValidGraphMipLevels
        ctx->stat = GetCreateDrawValidGraphMipLevels(  );
        return 1;
    }
    case 0x2db: {  // SetCreateDrawValidGraphChannelNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphChannelNum( _a0 );
        return 1;
    }
    case 0x2dc: {  // GetCreateDrawValidGraphChannelNum
        ctx->stat = GetCreateDrawValidGraphChannelNum(  );
        return 1;
    }
    case 0x2dd: {  // SetCreateDrawValidGraphMultiSample
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphMultiSample( _a0, _a1 );
        return 1;
    }
    case 0x2de: {  // SetDrawValidMultiSample
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidMultiSample( _a0, _a1 );
        return 1;
    }
    case 0x2df: {  // GetMultiSampleQuality
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMultiSampleQuality( _a0 );
        return 1;
    }
    case 0x2e0: {  // SetUseTransColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTransColor( _a0 );
        return 1;
    }
    case 0x2e1: {  // SetUseTransColorGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTransColorGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2e2: {  // SetUseGraphAlphaChannel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGraphAlphaChannel( _a0 );
        return 1;
    }
    case 0x2e3: {  // GetUseGraphAlphaChannel
        ctx->stat = GetUseGraphAlphaChannel(  );
        return 1;
    }
    case 0x2e4: {  // SetUseAlphaChannelGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaChannelGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2e5: {  // GetUseAlphaChannelGraphCreateFlag
        ctx->stat = GetUseAlphaChannelGraphCreateFlag(  );
        return 1;
    }
    case 0x2e6: {  // SetUseNotManageTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNotManageTextureFlag( _a0 );
        return 1;
    }
    case 0x2e7: {  // GetUseNotManageTextureFlag
        ctx->stat = GetUseNotManageTextureFlag(  );
        return 1;
    }
    case 0x2e8: {  // SetUsePlatformTextureFormat
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePlatformTextureFormat( _a0 );
        return 1;
    }
    case 0x2e9: {  // GetUsePlatformTextureFormat
        ctx->stat = GetUsePlatformTextureFormat(  );
        return 1;
    }
    case 0x2ea: {  // SetTransColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetTransColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2eb: {  // SetUseDivGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDivGraphFlag( _a0 );
        return 1;
    }
    case 0x2ec: {  // SetUseAlphaImageLoadFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaImageLoadFlag( _a0 );
        return 1;
    }
    case 0x2ed: {  // SetUseMaxTextureSize
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseMaxTextureSize( _a0 );
        return 1;
    }
    case 0x2ee: {  // SetUseGraphBaseDataBackup
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGraphBaseDataBackup( _a0 );
        return 1;
    }
    case 0x2ef: {  // GetUseGraphBaseDataBackup
        ctx->stat = GetUseGraphBaseDataBackup(  );
        return 1;
    }
    case 0x2f0: {  // SetUseSystemMemGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSystemMemGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2f1: {  // GetUseSystemMemGraphCreateFlag
        ctx->stat = GetUseSystemMemGraphCreateFlag(  );
        return 1;
    }
    case 0x2f2: {  // SetUseLoadDivGraphSizeCheckFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLoadDivGraphSizeCheckFlag( _a0 );
        return 1;
    }
    case 0x2f3: {  // GetUseLoadDivGraphSizeCheckFlag
        ctx->stat = GetUseLoadDivGraphSizeCheckFlag(  );
        return 1;
    }
    case 0x2f4: {  // GraphUnLock
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GraphUnLock( _a0 );
        return 1;
    }
    case 0x2f5: {  // SetUseGraphZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetUseGraphZBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2f6: {  // CopyGraphZBufferImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = CopyGraphZBufferImage( _a0, _a1 );
        return 1;
    }
    case 0x2f7: {  // SetDeviceLostDeleteGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDeviceLostDeleteGraphFlag( _a0, _a1 );
        return 1;
    }
    case 0x2f8: {  // GetGraphMipmapCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetGraphMipmapCount( _a0 );
        return 1;
    }
    case 0x2f9: {  // GetGraphFilePath
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = GetGraphFilePath( _a0, _a1_w );
        return 1;
    }
    case 0x2fa: {  // CheckDrawValidGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckDrawValidGraph( _a0 );
        return 1;
    }
    case 0x2fb: {  // GetValidRestoreShredPoint
        ctx->stat = GetValidRestoreShredPoint(  );
        return 1;
    }
    case 0x2fc: {  // SetGraphPalette
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        unsigned int _a2 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = SetGraphPalette( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2fd: {  // ResetGraphPalette
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetGraphPalette( _a0 );
        return 1;
    }
    case 0x2fe: {  // DrawFillBox
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawFillBox( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2ff: {  // DrawLineBox
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawLineBox( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x300: {  // DrawOval
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
    case 0x301: {  // DrawOvalAA
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
    case 0x302: {  // DrawOval_Rect
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawOval_Rect( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x303: {  // DrawTriangleAA
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
    case 0x304: {  // DrawQuadrangle
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
    case 0x305: {  // DrawQuadrangleAA
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
    case 0x306: {  // DrawRoundRect
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
    case 0x307: {  // DrawRoundRectAA
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
    case 0x308: {  // BeginAADraw
        ctx->stat = BeginAADraw(  );
        return 1;
    }
    case 0x309: {  // EndAADraw
        ctx->stat = EndAADraw(  );
        return 1;
    }
    case 0x30a: {  // DrawPixel3D
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
    case 0x30b: {  // DrawPixel3DD
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
    case 0x30c: {  // DrawLine3D
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
    case 0x30d: {  // DrawLine3DD
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
    case 0x30e: {  // DrawTriangle3D
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
    case 0x30f: {  // DrawTriangle3DD
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
    case 0x310: {  // DrawCube3DD
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
    case 0x311: {  // DrawSphere3DD
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
    case 0x312: {  // DrawCapsule3D
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
    case 0x313: {  // DrawCapsule3DD
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
    case 0x314: {  // DrawCylinder3D
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
    case 0x315: {  // DrawCylinder3DD
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
    case 0x316: {  // DrawTube3D
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
    case 0x317: {  // DrawTube3DD
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
    case 0x318: {  // DrawCone3D
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
    case 0x319: {  // DrawCone3DD
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
    case 0x31a: {  // LoadGraphScreen
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadGraphScreen( _a0, _a1, _a2_w, _a3 );
        return 1;
    }
    case 0x31b: {  // DrawRotaGraph2
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
    case 0x31c: {  // DrawRotaGraph3
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
    case 0x31d: {  // DrawRotaGraphFast
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
    case 0x31e: {  // DrawRotaGraphFast2
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
    case 0x31f: {  // DrawRotaGraphFast3
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
    case 0x320: {  // DrawTurnGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTurnGraph( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x321: {  // DrawReverseGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawReverseGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x322: {  // DrawGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraphF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x323: {  // DrawExtendGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x324: {  // DrawRotaGraphF
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
    case 0x325: {  // DrawRotaGraph2F
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
    case 0x326: {  // DrawRotaGraph3F
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
    case 0x327: {  // DrawRotaGraphFastF
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
    case 0x328: {  // DrawRotaGraphFast2F
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
    case 0x329: {  // DrawRotaGraphFast3F
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
    case 0x32a: {  // DrawModiGraphF
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
    case 0x32b: {  // DrawTurnGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTurnGraphF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x32c: {  // DrawReverseGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawReverseGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x32d: {  // DrawTile
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
    case 0x32e: {  // DrawRectExtendGraph
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
    case 0x32f: {  // DrawRectRotaGraph2
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
    case 0x330: {  // DrawRectRotaGraph3
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
    case 0x331: {  // DrawRectRotaGraphFast
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
    case 0x332: {  // DrawRectRotaGraphFast2
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
    case 0x333: {  // DrawRectRotaGraphFast3
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
    case 0x334: {  // DrawRectModiGraph
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
    case 0x335: {  // DrawRectGraphF
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
    case 0x336: {  // DrawRectGraphF2
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
    case 0x337: {  // DrawRectExtendGraphF
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
    case 0x338: {  // DrawRectExtendGraphF2
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
    case 0x339: {  // DrawRectRotaGraphF
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
    case 0x33a: {  // DrawRectRotaGraph2F
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
    case 0x33b: {  // DrawRectRotaGraph3F
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
    case 0x33c: {  // DrawRectRotaGraphFastF
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
    case 0x33d: {  // DrawRectRotaGraphFast2F
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
    case 0x33e: {  // DrawRectRotaGraphFast3F
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
    case 0x33f: {  // DrawRectModiGraphF
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
    case 0x340: {  // DrawBlendGraph
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
    case 0x341: {  // DrawBlendGraphF
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
    case 0x342: {  // DrawBlendGraphPos
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
    case 0x343: {  // DrawCircleGauge
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
    case 0x344: {  // DrawCircleGaugeF
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
    case 0x345: {  // DrawPolygon3D_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygon3D_UseVertexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x346: {  // DrawPolygonIndexed3D_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygonIndexed3D_UseVertexBuffer( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x347: {  // DrawGraph3D
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraph3D( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x348: {  // DrawExtendGraph3D
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
    case 0x349: {  // DrawRotaGraph3D
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
    case 0x34a: {  // DrawRota2Graph3D
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
    case 0x34b: {  // DrawModiBillboard3D
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
    case 0x34c: {  // DrawBillboard3D
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
    case 0x34d: {  // GetDrawMode
        ctx->stat = GetDrawMode(  );
        return 1;
    }
    case 0x34e: {  // SetDrawAlphaTest
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawAlphaTest( _a0, _a1 );
        return 1;
    }
    case 0x34f: {  // SetBlendGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBlendGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x350: {  // SetBlendGraphPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBlendGraphPosition( _a0, _a1 );
        return 1;
    }
    case 0x351: {  // SetDrawAddColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawAddColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x352: {  // SetWriteAlphaChannelFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteAlphaChannelFlag( _a0 );
        return 1;
    }
    case 0x353: {  // GetWriteAlphaChannelFlag
        ctx->stat = GetWriteAlphaChannelFlag(  );
        return 1;
    }
    case 0x354: {  // CheckSeparateAlphaBlendEnable
        ctx->stat = CheckSeparateAlphaBlendEnable(  );
        return 1;
    }
    case 0x355: {  // SetIgnoreDrawGraphColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetIgnoreDrawGraphColor( _a0 );
        return 1;
    }
    case 0x356: {  // GetIgnoreDrawGraphColor
        ctx->stat = GetIgnoreDrawGraphColor(  );
        return 1;
    }
    case 0x357: {  // SetMaxAnisotropy
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaxAnisotropy( _a0 );
        return 1;
    }
    case 0x358: {  // GetMaxAnisotropy
        ctx->stat = GetMaxAnisotropy(  );
        return 1;
    }
    case 0x359: {  // SetUseLarge3DPositionSupport
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLarge3DPositionSupport( _a0 );
        return 1;
    }
    case 0x35a: {  // SetUseZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseZBufferFlag( _a0 );
        return 1;
    }
    case 0x35b: {  // SetWriteZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteZBufferFlag( _a0 );
        return 1;
    }
    case 0x35c: {  // SetZBias
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBias( _a0 );
        return 1;
    }
    case 0x35d: {  // SetZBias3D
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBias3D( _a0 );
        return 1;
    }
    case 0x35e: {  // SetDrawZ
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetDrawZ( _a0 );
        return 1;
    }
    case 0x35f: {  // SetUseReversedZ
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseReversedZ( _a0 );
        return 1;
    }
    case 0x360: {  // SetDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x361: {  // SetDrawAreaFull
        ctx->stat = SetDrawAreaFull(  );
        return 1;
    }
    case 0x362: {  // SetDraw3DScale
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetDraw3DScale( _a0 );
        return 1;
    }
    case 0x363: {  // RunRestoreShred
        ctx->stat = RunRestoreShred(  );
        return 1;
    }
    case 0x364: {  // ResetTransformTo2D
        ctx->stat = ResetTransformTo2D(  );
        return 1;
    }
    case 0x365: {  // SetDefTransformMatrix
        ctx->stat = SetDefTransformMatrix(  );
        return 1;
    }
    case 0x366: {  // SetUseCullingFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseCullingFlag( _a0 );
        return 1;
    }
    case 0x367: {  // GetUseBackCulling
        ctx->stat = GetUseBackCulling(  );
        return 1;
    }
    case 0x368: {  // SetUseRightHandClippingProcess
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseRightHandClippingProcess( _a0 );
        return 1;
    }
    case 0x369: {  // GetUseRightHandClippingProcess
        ctx->stat = GetUseRightHandClippingProcess(  );
        return 1;
    }
    case 0x36a: {  // SetTextureAddressModeUV
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetTextureAddressModeUV( _a0, _a1, _a2 );
        return 1;
    }
    case 0x36b: {  // SetTextureAddressTransform
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
    case 0x36c: {  // SetTextureAddressTransformMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetTextureAddressTransformMatrix( _a0 );
        return 1;
    }
    case 0x36d: {  // ResetTextureAddressTransform
        ctx->stat = ResetTextureAddressTransform(  );
        return 1;
    }
    case 0x36e: {  // SetFogEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFogEnable( _a0 );
        return 1;
    }
    case 0x36f: {  // GetFogEnable
        ctx->stat = GetFogEnable(  );
        return 1;
    }
    case 0x370: {  // GetFogMode
        ctx->stat = GetFogMode(  );
        return 1;
    }
    case 0x371: {  // SetFogColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFogColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x372: {  // SetFogStartEnd
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetFogStartEnd( _a0, _a1 );
        return 1;
    }
    case 0x373: {  // SetFogDensity
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetFogDensity( _a0 );
        return 1;
    }
    case 0x374: {  // SetVerticalFogEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVerticalFogEnable( _a0 );
        return 1;
    }
    case 0x375: {  // GetVerticalFogEnable
        ctx->stat = GetVerticalFogEnable(  );
        return 1;
    }
    case 0x376: {  // GetVerticalFogMode
        ctx->stat = GetVerticalFogMode(  );
        return 1;
    }
    case 0x377: {  // SetVerticalFogColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVerticalFogColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x378: {  // SetVerticalFogStartEnd
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVerticalFogStartEnd( _a0, _a1 );
        return 1;
    }
    case 0x379: {  // SetVerticalFogDensity
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVerticalFogDensity( _a0, _a1 );
        return 1;
    }
    case 0x37a: {  // GetDrawScreenGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetDrawScreenGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x37b: {  // BltDrawValidGraph
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
    case 0x37c: {  // ScreenCopy
        ctx->stat = ScreenCopy(  );
        return 1;
    }
    case 0x37d: {  // WaitVSync
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = WaitVSync( _a0 );
        return 1;
    }
    case 0x37e: {  // ClsDrawScreen
        ctx->stat = ClsDrawScreen(  );
        return 1;
    }
    case 0x37f: {  // GetDrawScreen
        ctx->stat = GetDrawScreen(  );
        return 1;
    }
    case 0x380: {  // GetActiveGraph
        ctx->stat = GetActiveGraph(  );
        return 1;
    }
    case 0x381: {  // SetUseSetDrawScreenSettingReset
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSetDrawScreenSettingReset( _a0 );
        return 1;
    }
    case 0x382: {  // GetUseSetDrawScreenSettingReset
        ctx->stat = GetUseSetDrawScreenSettingReset(  );
        return 1;
    }
    case 0x383: {  // SetDrawZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawZBuffer( _a0 );
        return 1;
    }
    case 0x384: {  // GetUseFullScreenResolutionMode
        ctx->stat = GetUseFullScreenResolutionMode(  );
        return 1;
    }
    case 0x385: {  // SetEmulation320x240
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetEmulation320x240( _a0 );
        return 1;
    }
    case 0x386: {  // SetZBufferSize
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBufferSize( _a0, _a1 );
        return 1;
    }
    case 0x387: {  // SetZBufferBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBufferBitDepth( _a0 );
        return 1;
    }
    case 0x388: {  // GetWaitVSyncFlag
        ctx->stat = GetWaitVSyncFlag(  );
        return 1;
    }
    case 0x389: {  // SetFullSceneAntiAliasingMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFullSceneAntiAliasingMode( _a0, _a1 );
        return 1;
    }
    case 0x38a: {  // SetGraphDisplayArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphDisplayArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x38b: {  // SetChangeScreenModeGraphicsSystemResetFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetChangeScreenModeGraphicsSystemResetFlag( _a0 );
        return 1;
    }
    case 0x38c: {  // GetScreenBitDepth
        ctx->stat = GetScreenBitDepth(  );
        return 1;
    }
    case 0x38d: {  // GetColorBitDepth
        ctx->stat = GetColorBitDepth(  );
        return 1;
    }
    case 0x38e: {  // GetChangeDisplayFlag
        ctx->stat = GetChangeDisplayFlag(  );
        return 1;
    }
    case 0x38f: {  // GetRefreshRate
        ctx->stat = GetRefreshRate(  );
        return 1;
    }
    case 0x390: {  // GetDisplayNum
        ctx->stat = GetDisplayNum(  );
        return 1;
    }
    case 0x391: {  // GetDisplayModeNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDisplayModeNum( _a0 );
        return 1;
    }
    case 0x392: {  // GetMultiDrawScreenNum
        ctx->stat = GetMultiDrawScreenNum(  );
        return 1;
    }
    case 0x393: {  // GetDrawFloatCoordType
        ctx->stat = GetDrawFloatCoordType(  );
        return 1;
    }
    case 0x394: {  // SetUseNormalDrawShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNormalDrawShader( _a0 );
        return 1;
    }
    case 0x395: {  // SetUseSoftwareRenderModeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSoftwareRenderModeFlag( _a0 );
        return 1;
    }
    case 0x396: {  // SetNotUse3DFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNotUse3DFlag( _a0 );
        return 1;
    }
    case 0x397: {  // SetUse3DFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUse3DFlag( _a0 );
        return 1;
    }
    case 0x398: {  // GetUse3DFlag
        ctx->stat = GetUse3DFlag(  );
        return 1;
    }
    case 0x399: {  // SetScreenMemToVramFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetScreenMemToVramFlag( _a0 );
        return 1;
    }
    case 0x39a: {  // GetScreenMemToSystemMemFlag
        ctx->stat = GetScreenMemToSystemMemFlag(  );
        return 1;
    }
    case 0x39b: {  // RestoreGraphSystem
        ctx->stat = RestoreGraphSystem(  );
        return 1;
    }
    case 0x39c: {  // SetUseHardwareVertexProcessing
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseHardwareVertexProcessing( _a0 );
        return 1;
    }
    case 0x39d: {  // SetUsePixelLighting
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePixelLighting( _a0 );
        return 1;
    }
    case 0x39e: {  // SetUseOldDrawModiGraphCodeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseOldDrawModiGraphCodeFlag( _a0 );
        return 1;
    }
    case 0x39f: {  // SetUseVramFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseVramFlag( _a0 );
        return 1;
    }
    case 0x3a0: {  // GetUseVramFlag
        ctx->stat = GetUseVramFlag(  );
        return 1;
    }
    case 0x3a1: {  // SetBasicBlendFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBasicBlendFlag( _a0 );
        return 1;
    }
    case 0x3a2: {  // SetUseBasicGraphDraw3DDeviceMethodFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseBasicGraphDraw3DDeviceMethodFlag( _a0 );
        return 1;
    }
    case 0x3a3: {  // SetUseDisplayIndex
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDisplayIndex( _a0 );
        return 1;
    }
    case 0x3a4: {  // RenderVertex
        ctx->stat = RenderVertex(  );
        return 1;
    }
    case 0x3a5: {  // GetDrawCallCount
        ctx->stat = GetDrawCallCount(  );
        return 1;
    }
    case 0x3a6: {  // SaveDrawScreenToBMP
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
    case 0x3a7: {  // SaveDrawScreenToDDS
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
    case 0x3a8: {  // SaveDrawScreenToJPEG
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
    case 0x3a9: {  // SaveDrawScreenToPNG
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
    case 0x3aa: {  // SaveDrawValidGraph
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
    case 0x3ab: {  // SaveDrawValidGraphToBMP
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
    case 0x3ac: {  // SaveDrawValidGraphToDDS
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
    case 0x3ad: {  // SaveDrawValidGraphToJPEG
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
    case 0x3ae: {  // SaveDrawValidGraphToPNG
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
    case 0x3af: {  // DeleteVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteVertexBuffer( _a0 );
        return 1;
    }
    case 0x3b0: {  // InitVertexBuffer
        ctx->stat = InitVertexBuffer(  );
        return 1;
    }
    case 0x3b1: {  // UpdateVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateVertexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3b2: {  // DeleteIndexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteIndexBuffer( _a0 );
        return 1;
    }
    case 0x3b3: {  // InitIndexBuffer
        ctx->stat = InitIndexBuffer(  );
        return 1;
    }
    case 0x3b4: {  // UpdateIndexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateIndexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3b5: {  // GetMaxPrimitiveCount
        ctx->stat = GetMaxPrimitiveCount(  );
        return 1;
    }
    case 0x3b6: {  // GetMaxVertexIndex
        ctx->stat = GetMaxVertexIndex(  );
        return 1;
    }
    case 0x3b7: {  // GetValidShaderVersion
        ctx->stat = GetValidShaderVersion(  );
        return 1;
    }
    case 0x3b8: {  // LoadVertexShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadVertexShader( _a0_w );
        return 1;
    }
    case 0x3b9: {  // LoadGeometryShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadGeometryShader( _a0_w );
        return 1;
    }
    case 0x3ba: {  // LoadPixelShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadPixelShader( _a0_w );
        return 1;
    }
    case 0x3bb: {  // DeleteShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShader( _a0 );
        return 1;
    }
    case 0x3bc: {  // InitShader
        ctx->stat = InitShader(  );
        return 1;
    }
    case 0x3bd: {  // GetConstIndexToShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetConstIndexToShader( _a0_w, _a1 );
        return 1;
    }
    case 0x3be: {  // GetConstCountToShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetConstCountToShader( _a0_w, _a1 );
        return 1;
    }
    case 0x3bf: {  // SetVSConstSF
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVSConstSF( _a0, _a1 );
        return 1;
    }
    case 0x3c0: {  // SetVSConstF
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
    case 0x3c1: {  // SetVSConstFMtx
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
    case 0x3c2: {  // SetVSConstFMtxT
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
    case 0x3c3: {  // SetVSConstSI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstSI( _a0, _a1 );
        return 1;
    }
    case 0x3c4: {  // ResetVSConstF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstF( _a0, _a1 );
        return 1;
    }
    case 0x3c5: {  // ResetVSConstI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstI( _a0, _a1 );
        return 1;
    }
    case 0x3c6: {  // ResetVSConstB
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstB( _a0, _a1 );
        return 1;
    }
    case 0x3c7: {  // SetPSConstSF
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetPSConstSF( _a0, _a1 );
        return 1;
    }
    case 0x3c8: {  // SetPSConstF
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
    case 0x3c9: {  // SetPSConstFMtx
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
    case 0x3ca: {  // SetPSConstFMtxT
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
    case 0x3cb: {  // SetPSConstSI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstSI( _a0, _a1 );
        return 1;
    }
    case 0x3cc: {  // ResetPSConstF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstF( _a0, _a1 );
        return 1;
    }
    case 0x3cd: {  // ResetPSConstI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstI( _a0, _a1 );
        return 1;
    }
    case 0x3ce: {  // ResetPSConstB
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstB( _a0, _a1 );
        return 1;
    }
    case 0x3cf: {  // SetRenderTargetToShader
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetRenderTargetToShader( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3d0: {  // SetUseTextureToShader
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTextureToShader( _a0, _a1 );
        return 1;
    }
    case 0x3d1: {  // SetUseVertexShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseVertexShader( _a0 );
        return 1;
    }
    case 0x3d2: {  // SetUseGeometryShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGeometryShader( _a0 );
        return 1;
    }
    case 0x3d3: {  // SetUsePixelShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePixelShader( _a0 );
        return 1;
    }
    case 0x3d4: {  // DrawBillboard3DToShader
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
    case 0x3d5: {  // DrawPolygon3DToShader_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygon3DToShader_UseVertexBuffer( _a0 );
        return 1;
    }
    case 0x3d6: {  // DrawPolygonIndexed3DToShader_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygonIndexed3DToShader_UseVertexBuffer( _a0, _a1 );
        return 1;
    }
    case 0x3d7: {  // InitShaderConstantBuffer
        ctx->stat = InitShaderConstantBuffer(  );
        return 1;
    }
    case 0x3d8: {  // CreateShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x3d9: {  // DeleteShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x3da: {  // UpdateShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x3db: {  // SetGraphBlendScalingFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphBlendScalingFilterMode( _a0 );
        return 1;
    }
    case 0x3dc: {  // PlayMovie
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMovie( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x3dd: {  // OpenMovieToGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 1 );
        ctx->stat = OpenMovieToGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x3de: {  // AddMovieFrameToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        unsigned int _a1 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = AddMovieFrameToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3df: {  // SeekMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SeekMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3e0: {  // SetPlaySpeedRateMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetPlaySpeedRateMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3e1: {  // GetMovieStateToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieStateToGraph( _a0 );
        return 1;
    }
    case 0x3e2: {  // SetMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieVolumeToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3e3: {  // GetMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieVolumeToGraph( _a0 );
        return 1;
    }
    case 0x3e4: {  // ChangeMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeMovieVolumeToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3e5: {  // GetMovieVolumeToGraph2
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieVolumeToGraph2( _a0 );
        return 1;
    }
    case 0x3e6: {  // GetMovieTotalFrameToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieTotalFrameToGraph( _a0 );
        return 1;
    }
    case 0x3e7: {  // TellMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = TellMovieToGraph( _a0 );
        return 1;
    }
    case 0x3e8: {  // TellMovieToGraphToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = TellMovieToGraphToFrame( _a0 );
        return 1;
    }
    case 0x3e9: {  // SeekMovieToGraphToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SeekMovieToGraphToFrame( _a0, _a1 );
        return 1;
    }
    case 0x3ea: {  // GetLastUpdateTimeMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLastUpdateTimeMovieToGraph( _a0 );
        return 1;
    }
    case 0x3eb: {  // UpdateMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateMovieToGraph( _a0 );
        return 1;
    }
    case 0x3ec: {  // SetMovieRightImageAlphaFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieRightImageAlphaFlag( _a0 );
        return 1;
    }
    case 0x3ed: {  // SetMovieColorA8R8G8B8Flag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieColorA8R8G8B8Flag( _a0 );
        return 1;
    }
    case 0x3ee: {  // SetMovieUseYUVFormatSurfaceFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieUseYUVFormatSurfaceFlag( _a0 );
        return 1;
    }
    case 0x3ef: {  // SetCameraNearFar
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraNearFar( _a0, _a1 );
        return 1;
    }
    case 0x3f0: {  // SetCameraNearFarD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraNearFarD( _a0, _a1 );
        return 1;
    }
    case 0x3f1: {  // SetCameraPositionAndTarget_UpVecYD
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
    case 0x3f2: {  // SetCameraPositionAndTargetAndUpVec
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
    case 0x3f3: {  // SetCameraPositionAndTargetAndUpVecD
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
    case 0x3f4: {  // SetCameraPositionAndAngle
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
    case 0x3f5: {  // SetCameraPositionAndAngleD
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
    case 0x3f6: {  // SetCameraViewMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetCameraViewMatrix( _a0 );
        return 1;
    }
    case 0x3f7: {  // SetCameraViewMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = SetCameraViewMatrixD( _a0 );
        return 1;
    }
    case 0x3f8: {  // SetCameraScreenCenter
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraScreenCenter( _a0, _a1 );
        return 1;
    }
    case 0x3f9: {  // SetCameraScreenCenterD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraScreenCenterD( _a0, _a1 );
        return 1;
    }
    case 0x3fa: {  // SetupCamera_PerspectiveD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_PerspectiveD( _a0 );
        return 1;
    }
    case 0x3fb: {  // SetupCamera_Ortho
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_Ortho( _a0 );
        return 1;
    }
    case 0x3fc: {  // SetupCamera_OrthoD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_OrthoD( _a0 );
        return 1;
    }
    case 0x3fd: {  // SetupCamera_ProjectionMatrix
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 64 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX) );
        ctx->stat = SetupCamera_ProjectionMatrix( _a0 );
        return 1;
    }
    case 0x3fe: {  // SetupCamera_ProjectionMatrixD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 128 )
            throw HSPERR_TYPE_MISMATCH;
        MATRIX_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(MATRIX_D) );
        ctx->stat = SetupCamera_ProjectionMatrixD( _a0 );
        return 1;
    }
    case 0x3ff: {  // SetCameraDotAspect
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraDotAspect( _a0 );
        return 1;
    }
    case 0x400: {  // SetCameraDotAspectD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraDotAspectD( _a0 );
        return 1;
    }
    case 0x401: {  // CheckCameraViewClip
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CheckCameraViewClip( _a0 );
        return 1;
    }
    case 0x402: {  // CheckCameraViewClipD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = CheckCameraViewClipD( _a0 );
        return 1;
    }
    case 0x403: {  // CheckCameraViewClip_Dir
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CheckCameraViewClip_Dir( _a0 );
        return 1;
    }
    case 0x404: {  // CheckCameraViewClip_DirD
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 24 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR_D _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR_D) );
        ctx->stat = CheckCameraViewClip_DirD( _a0 );
        return 1;
    }
    case 0x405: {  // CheckCameraViewClip_Box
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
    case 0x406: {  // CheckCameraViewClip_BoxD
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
    case 0x407: {  // SetMaterialUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaterialUseVertDifColor( _a0 );
        return 1;
    }
    case 0x408: {  // SetMaterialUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaterialUseVertSpcColor( _a0 );
        return 1;
    }
    case 0x409: {  // SetUseSpecular
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSpecular( _a0 );
        return 1;
    }
    case 0x40a: {  // SetGlobalAmbientLight
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetGlobalAmbientLight( _a0 );
        return 1;
    }
    case 0x40b: {  // SetUseLightAngleAttenuation
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLightAngleAttenuation( _a0 );
        return 1;
    }
    case 0x40c: {  // SetUseHalfLambertLighting
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseHalfLambertLighting( _a0 );
        return 1;
    }
    case 0x40d: {  // ChangeLightTypeDir
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = ChangeLightTypeDir( _a0 );
        return 1;
    }
    case 0x40e: {  // ChangeLightTypeSpot
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
    case 0x40f: {  // ChangeLightTypePoint
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
    case 0x410: {  // GetLightType
        ctx->stat = GetLightType(  );
        return 1;
    }
    case 0x411: {  // SetLightEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightEnable( _a0 );
        return 1;
    }
    case 0x412: {  // GetLightEnable
        ctx->stat = GetLightEnable(  );
        return 1;
    }
    case 0x413: {  // SetLightDifColor
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightDifColor( _a0 );
        return 1;
    }
    case 0x414: {  // SetLightSpcColor
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightSpcColor( _a0 );
        return 1;
    }
    case 0x415: {  // SetLightAmbColor
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 16 )
            throw HSPERR_TYPE_MISMATCH;
        COLOR_F _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(COLOR_F) );
        ctx->stat = SetLightAmbColor( _a0 );
        return 1;
    }
    case 0x416: {  // SetLightPosition
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = SetLightPosition( _a0 );
        return 1;
    }
    case 0x417: {  // SetLightRangeAtten
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightRangeAtten( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x418: {  // SetLightAngle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightAngle( _a0, _a1 );
        return 1;
    }
    case 0x419: {  // SetLightUseShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightUseShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x41a: {  // CreateDirLightHandle
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = CreateDirLightHandle( _a0 );
        return 1;
    }
    case 0x41b: {  // CreateSpotLightHandle
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
    case 0x41c: {  // CreatePointLightHandle
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
    case 0x41d: {  // DeleteLightHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteLightHandle( _a0 );
        return 1;
    }
    case 0x41e: {  // DeleteLightHandleAll
        ctx->stat = DeleteLightHandleAll(  );
        return 1;
    }
    case 0x41f: {  // SetLightTypeHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightTypeHandle( _a0, _a1 );
        return 1;
    }
    case 0x420: {  // SetLightEnableHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightEnableHandle( _a0, _a1 );
        return 1;
    }
    case 0x421: {  // SetLightDifColorHandle
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
    case 0x422: {  // SetLightSpcColorHandle
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
    case 0x423: {  // SetLightAmbColorHandle
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
    case 0x424: {  // SetLightDirectionHandle
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
    case 0x425: {  // SetLightPositionHandle
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
    case 0x426: {  // SetLightRangeAttenHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightRangeAttenHandle( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x427: {  // SetLightAngleHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightAngleHandle( _a0, _a1, _a2 );
        return 1;
    }
    case 0x428: {  // SetLightUseShadowMapHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightUseShadowMapHandle( _a0, _a1, _a2 );
        return 1;
    }
    case 0x429: {  // GetLightTypeHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLightTypeHandle( _a0 );
        return 1;
    }
    case 0x42a: {  // GetLightEnableHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLightEnableHandle( _a0 );
        return 1;
    }
    case 0x42b: {  // GetEnableLightHandleNum
        ctx->stat = GetEnableLightHandleNum(  );
        return 1;
    }
    case 0x42c: {  // GetEnableLightHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetEnableLightHandle( _a0 );
        return 1;
    }
    case 0x42d: {  // CreateMaskScreen
        ctx->stat = CreateMaskScreen(  );
        return 1;
    }
    case 0x42e: {  // DeleteMaskScreen
        ctx->stat = DeleteMaskScreen(  );
        return 1;
    }
    case 0x42f: {  // SetUseMaskScreenFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseMaskScreenFlag( _a0 );
        return 1;
    }
    case 0x430: {  // GetUseMaskScreenFlag
        ctx->stat = GetUseMaskScreenFlag(  );
        return 1;
    }
    case 0x431: {  // FillMaskScreen
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FillMaskScreen( _a0 );
        return 1;
    }
    case 0x432: {  // SetMaskScreenGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaskScreenGraph( _a0 );
        return 1;
    }
    case 0x433: {  // InitMask
        ctx->stat = InitMask(  );
        return 1;
    }
    case 0x434: {  // MakeMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeMask( _a0, _a1 );
        return 1;
    }
    case 0x435: {  // DeleteMask
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteMask( _a0 );
        return 1;
    }
    case 0x436: {  // LoadMask
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadMask( _a0_w );
        return 1;
    }
    case 0x437: {  // DrawMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawMask( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x438: {  // DrawStringMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
        ctx->stat = DrawStringMask( _a0, _a1, _a2, _a3_w );
        return 1;
    }
    case 0x439: {  // DrawStringMaskToHandle
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
    case 0x43a: {  // DrawFillMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawFillMask( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x43b: {  // SetMaskReverseEffectFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaskReverseEffectFlag( _a0 );
        return 1;
    }
    case 0x43c: {  // GetMaskScreenData
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMaskScreenData( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x43d: {  // GetMaskUseFlag
        ctx->stat = GetMaskUseFlag(  );
        return 1;
    }
    case 0x43e: {  // EnumFontName
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 1 );
        ctx->stat = EnumFontName( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x43f: {  // InitFontToHandle
        ctx->stat = InitFontToHandle(  );
        return 1;
    }
    case 0x440: {  // LoadFontDataToHandle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadFontDataToHandle( _a0_w, _a1 );
        return 1;
    }
    case 0x441: {  // SetFontSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontSpaceToHandle( _a0, _a1 );
        return 1;
    }
    case 0x442: {  // SetFontLineSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontLineSpaceToHandle( _a0, _a1 );
        return 1;
    }
    case 0x443: {  // DeleteFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteFontToHandle( _a0 );
        return 1;
    }
    case 0x444: {  // AddFontImageToHandle
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
    case 0x445: {  // SubFontImageToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = SubFontImageToHandle( _a0, _a1_w );
        return 1;
    }
    case 0x446: {  // AddSubstitutionFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddSubstitutionFontToHandle( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x447: {  // SubSubstitutionFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SubSubstitutionFontToHandle( _a0, _a1 );
        return 1;
    }
    case 0x448: {  // ChangeFontFromHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeFontFromHandle( _a0 );
        return 1;
    }
    case 0x449: {  // ChangeFontType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeFontType( _a0 );
        return 1;
    }
    case 0x44a: {  // GetFontSize
        ctx->stat = GetFontSize(  );
        return 1;
    }
    case 0x44b: {  // GetFontEdgeSize
        ctx->stat = GetFontEdgeSize(  );
        return 1;
    }
    case 0x44c: {  // SetFontSpace
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontSpace( _a0 );
        return 1;
    }
    case 0x44d: {  // GetFontSpace
        ctx->stat = GetFontSpace(  );
        return 1;
    }
    case 0x44e: {  // SetFontLineSpace
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontLineSpace( _a0 );
        return 1;
    }
    case 0x44f: {  // GetFontLineSpace
        ctx->stat = GetFontLineSpace(  );
        return 1;
    }
    case 0x450: {  // SetDefaultFontState
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
    case 0x451: {  // GetDefaultFontHandle
        ctx->stat = GetDefaultFontHandle(  );
        return 1;
    }
    case 0x452: {  // GetFontMaxCacheCharNum
        ctx->stat = GetFontMaxCacheCharNum(  );
        return 1;
    }
    case 0x453: {  // GetFontMaxWidth
        ctx->stat = GetFontMaxWidth(  );
        return 1;
    }
    case 0x454: {  // GetFontAscent
        ctx->stat = GetFontAscent(  );
        return 1;
    }
    case 0x455: {  // GetDrawStringWidth
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringWidth( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x456: {  // GetDrawExtendStringWidth
        double _a0 = hsp3dx_auto_getd( 0.0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawExtendStringWidth( _a0, _a1_w, _a2, _a3 );
        return 1;
    }
    case 0x457: {  // GetFontMaxCacheCharNumToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontMaxCacheCharNumToHandle( _a0 );
        return 1;
    }
    case 0x458: {  // GetFontMaxWidthToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontMaxWidthToHandle( _a0 );
        return 1;
    }
    case 0x459: {  // GetFontAscentToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontAscentToHandle( _a0 );
        return 1;
    }
    case 0x45a: {  // GetFontSizeToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontSizeToHandle( _a0 );
        return 1;
    }
    case 0x45b: {  // GetFontEdgeSizeToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontEdgeSizeToHandle( _a0 );
        return 1;
    }
    case 0x45c: {  // GetFontSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontSpaceToHandle( _a0 );
        return 1;
    }
    case 0x45d: {  // GetFontLineSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFontLineSpaceToHandle( _a0 );
        return 1;
    }
    case 0x45e: {  // GetDrawStringWidthToHandle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawStringWidthToHandle( _a0_w, _a1, _a2, _a3 );
        return 1;
    }
    case 0x45f: {  // GetDrawExtendStringWidthToHandle
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
    case 0x460: {  // CheckFontCacheToTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontCacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x461: {  // CheckFontChacheToTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontChacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x462: {  // CheckFontHandleValid
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckFontHandleValid( _a0 );
        return 1;
    }
    case 0x463: {  // ClearFontCacheToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ClearFontCacheToHandle( _a0 );
        return 1;
    }
    case 0x464: {  // SetFontCacheToTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x465: {  // GetFontCacheToTextureFlag
        ctx->stat = GetFontCacheToTextureFlag(  );
        return 1;
    }
    case 0x466: {  // SetFontChacheToTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontChacheToTextureFlag( _a0 );
        return 1;
    }
    case 0x467: {  // GetFontChacheToTextureFlag
        ctx->stat = GetFontChacheToTextureFlag(  );
        return 1;
    }
    case 0x468: {  // SetFontCacheTextureColorBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheTextureColorBitDepth( _a0 );
        return 1;
    }
    case 0x469: {  // GetFontCacheTextureColorBitDepth
        ctx->stat = GetFontCacheTextureColorBitDepth(  );
        return 1;
    }
    case 0x46a: {  // SetFontCacheCharNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheCharNum( _a0 );
        return 1;
    }
    case 0x46b: {  // GetFontCacheCharNum
        ctx->stat = GetFontCacheCharNum(  );
        return 1;
    }
    case 0x46c: {  // SetFontCacheUsePremulAlphaFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontCacheUsePremulAlphaFlag( _a0 );
        return 1;
    }
    case 0x46d: {  // GetFontCacheUsePremulAlphaFlag
        ctx->stat = GetFontCacheUsePremulAlphaFlag(  );
        return 1;
    }
    case 0x46e: {  // SetFontUseAdjustSizeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontUseAdjustSizeFlag( _a0 );
        return 1;
    }
    case 0x46f: {  // GetFontUseAdjustSizeFlag
        ctx->stat = GetFontUseAdjustSizeFlag(  );
        return 1;
    }
    case 0x470: {  // SetFontOnlyDrawType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontOnlyDrawType( _a0 );
        return 1;
    }
    case 0x471: {  // GetFontOnlyDrawType
        ctx->stat = GetFontOnlyDrawType(  );
        return 1;
    }
    case 0x472: {  // SetFontIgnoreLFFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontIgnoreLFFlag( _a0 );
        return 1;
    }
    case 0x473: {  // GetFontIgnoreLFFlag
        ctx->stat = GetFontIgnoreLFFlag(  );
        return 1;
    }
    case 0x474: {  // DrawVString
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
    case 0x475: {  // DrawExtendString
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
    case 0x476: {  // DrawExtendVString
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
    case 0x477: {  // DrawRotaString
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
    case 0x478: {  // DrawModiString
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
    case 0x479: {  // DrawStringF
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
    case 0x47a: {  // DrawVStringF
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
    case 0x47b: {  // DrawExtendStringF
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
    case 0x47c: {  // DrawExtendVStringF
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
    case 0x47d: {  // DrawRotaStringF
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
    case 0x47e: {  // DrawModiStringF
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
    case 0x47f: {  // DrawNumberToI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberToI( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x480: {  // DrawNumberToF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        unsigned int _a4 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        unsigned int _a5 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        ctx->stat = DrawNumberToF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x481: {  // DrawNumberPlusToI
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
    case 0x482: {  // DrawNumberPlusToF
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
    case 0x483: {  // DrawStringToHandle
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
    case 0x484: {  // DrawVStringToHandle
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
    case 0x485: {  // DrawExtendStringToHandle
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
    case 0x486: {  // DrawExtendVStringToHandle
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
    case 0x487: {  // DrawRotaStringToHandle
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
    case 0x488: {  // DrawModiStringToHandle
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
    case 0x489: {  // DrawStringFToHandle
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
    case 0x48a: {  // DrawVStringFToHandle
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
    case 0x48b: {  // DrawExtendStringFToHandle
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
    case 0x48c: {  // DrawExtendVStringFToHandle
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
    case 0x48d: {  // DrawRotaStringFToHandle
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
    case 0x48e: {  // DrawModiStringFToHandle
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
    case 0x48f: {  // DrawNumberToIToHandle
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
    case 0x490: {  // DrawNumberToFToHandle
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
    case 0x491: {  // DrawNumberPlusToIToHandle
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
    case 0x492: {  // DrawNumberPlusToFToHandle
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
    case 0x493: {  // HitCheck_Triangle_Triangle
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
    case 0x494: {  // HitCheck_Triangle_TriangleD
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
    case 0x495: {  // HitCheck_Triangle_Triangle_2D
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
    case 0x496: {  // HitCheck_Triangle_TriangleD_2D
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
    case 0x497: {  // HitCheck_Point_Cone
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
    case 0x498: {  // HitCheck_Point_ConeD
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
    case 0x499: {  // HitCheck_Line_Sphere
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
    case 0x49a: {  // HitCheck_Line_SphereD
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
    case 0x49b: {  // HitCheck_Sphere_Sphere
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
    case 0x49c: {  // HitCheck_Sphere_SphereD
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
    case 0x49d: {  // HitCheck_Sphere_Capsule
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
    case 0x49e: {  // HitCheck_Sphere_CapsuleD
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
    case 0x49f: {  // HitCheck_Sphere_Triangle
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
    case 0x4a0: {  // HitCheck_Sphere_TriangleD
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
    case 0x4a1: {  // HitCheck_Capsule_Capsule
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
    case 0x4a2: {  // HitCheck_Capsule_CapsuleD
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
    case 0x4a3: {  // HitCheck_Capsule_Triangle
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
    case 0x4a4: {  // HitCheck_Capsule_TriangleD
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
    case 0x4a5: {  // SetUseFastLoadFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseFastLoadFlag( _a0 );
        return 1;
    }
    case 0x4a6: {  // GetGraphDataShavedMode
        ctx->stat = GetGraphDataShavedMode(  );
        return 1;
    }
    case 0x4a7: {  // SetUsePremulAlphaConvertLoad
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePremulAlphaConvertLoad( _a0 );
        return 1;
    }
    case 0x4a8: {  // GetUsePremulAlphaConvertLoad
        ctx->stat = GetUsePremulAlphaConvertLoad(  );
        return 1;
    }
    case 0x4a9: {  // SetUseConvertNormalFormatLoad
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseConvertNormalFormatLoad( _a0 );
        return 1;
    }
    case 0x4aa: {  // GetUseConvertNormalFormatLoad
        ctx->stat = GetUseConvertNormalFormatLoad(  );
        return 1;
    }
    case 0x4ab: {  // InitSoftImage
        ctx->stat = InitSoftImage(  );
        return 1;
    }
    case 0x4ac: {  // LoadSoftImage
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadSoftImage( _a0_w );
        return 1;
    }
    case 0x4ad: {  // LoadARGB8ColorSoftImage
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadARGB8ColorSoftImage( _a0_w );
        return 1;
    }
    case 0x4ae: {  // LoadXRGB8ColorSoftImage
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadXRGB8ColorSoftImage( _a0_w );
        return 1;
    }
    case 0x4af: {  // MakeSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b0: {  // MakeARGBF32ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGBF32ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b1: {  // MakeARGBF16ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGBF16ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b2: {  // MakeXRGB8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeXRGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b3: {  // MakeARGB8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b4: {  // MakeRGBA8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeRGBA8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b5: {  // MakeABGR8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeABGR8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b6: {  // MakeBGRA8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeBGRA8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b7: {  // MakeARGB4ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeARGB4ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b8: {  // MakeA1R5G5B5ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeA1R5G5B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4b9: {  // MakeX1R5G5B5ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeX1R5G5B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4ba: {  // MakeR5G5B5A1ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeR5G5B5A1ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4bb: {  // MakeR5G6B5ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeR5G6B5ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4bc: {  // MakeRGB8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeRGB8ColorSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x4bd: {  // MakePAL8ColorSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakePAL8ColorSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4be: {  // DeleteSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftImage( _a0 );
        return 1;
    }
    case 0x4bf: {  // CheckPaletteSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckPaletteSoftImage( _a0 );
        return 1;
    }
    case 0x4c0: {  // CheckAlphaSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x4c1: {  // CheckPixelAlphaSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckPixelAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x4c2: {  // GetDrawScreenSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDrawScreenSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x4c3: {  // GetDrawScreenSoftImageDestPos
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
    case 0x4c4: {  // FillSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = FillSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x4c5: {  // ClearRectSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = ClearRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x4c6: {  // SetPaletteSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPaletteSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x4c7: {  // DrawPixelPalCodeSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPixelPalCodeSoftImage( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x4c8: {  // GetPixelPalCodeSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPixelPalCodeSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4c9: {  // GetPitchSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPitchSoftImage( _a0 );
        return 1;
    }
    case 0x4ca: {  // DrawPixelSoftImage
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
    case 0x4cb: {  // DrawPixelSoftImageF
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
    case 0x4cc: {  // DrawLineSoftImage
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
    case 0x4cd: {  // DrawCircleSoftImage
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
    case 0x4ce: {  // BltSoftImage
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
    case 0x4cf: {  // BltSoftImageWithTransColor
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
    case 0x4d0: {  // BltSoftImageWithAlphaBlend
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
    case 0x4d1: {  // ReverseSoftImageH
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImageH( _a0 );
        return 1;
    }
    case 0x4d2: {  // ReverseSoftImageV
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImageV( _a0 );
        return 1;
    }
    case 0x4d3: {  // ReverseSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReverseSoftImage( _a0 );
        return 1;
    }
    case 0x4d4: {  // ConvertPremulAlphaSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ConvertPremulAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x4d5: {  // ConvertInterpAlphaSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ConvertInterpAlphaSoftImage( _a0 );
        return 1;
    }
    case 0x4d6: {  // BltStringSoftImage
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
    case 0x4d7: {  // DrawSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawSoftImage( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4d8: {  // SaveSoftImageToBmp
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToBmp( _a0_w, _a1 );
        return 1;
    }
    case 0x4d9: {  // SaveSoftImageToDds
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToDds( _a0_w, _a1 );
        return 1;
    }
    case 0x4da: {  // SaveSoftImageToPng
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToPng( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x4db: {  // SaveSoftImageToJpeg
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SaveSoftImageToJpeg( _a0_w, _a1, _a2, _a3 );
        return 1;
    }
    case 0x4dc: {  // InitSoundMem
        ctx->stat = InitSoundMem(  );
        return 1;
    }
    case 0x4dd: {  // AddSoundData
        int _a0 = hsp3dx_auto_geti( -1 );
        ctx->stat = AddSoundData( _a0 );
        return 1;
    }
    case 0x4de: {  // AddStreamSoundMemToFile
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
    case 0x4df: {  // SetupStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetupStreamSoundMem( _a0 );
        return 1;
    }
    case 0x4e0: {  // PlayStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( DX_PLAYTYPE_LOOP );
        int _a2 = hsp3dx_auto_geti( 1 );
        ctx->stat = PlayStreamSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4e1: {  // CheckStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckStreamSoundMem( _a0 );
        return 1;
    }
    case 0x4e2: {  // StopStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopStreamSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4e3: {  // SetStreamSoundCurrentPosition
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetStreamSoundCurrentPosition( _a0, _a1 );
        return 1;
    }
    case 0x4e4: {  // SetStreamSoundCurrentTime
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetStreamSoundCurrentTime( _a0, _a1 );
        return 1;
    }
    case 0x4e5: {  // ProcessStreamSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ProcessStreamSoundMem( _a0 );
        return 1;
    }
    case 0x4e6: {  // ProcessStreamSoundMemAll
        ctx->stat = ProcessStreamSoundMemAll(  );
        return 1;
    }
    case 0x4e7: {  // LoadSoundMem2
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = LoadSoundMem2( _a0_w, _a1_w );
        return 1;
    }
    case 0x4e8: {  // LoadBGM
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadBGM( _a0_w );
        return 1;
    }
    case 0x4e9: {  // LoadSoundMemBase
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = LoadSoundMemBase( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x4ea: {  // LoadSoundMemToBufNumSitei
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadSoundMemToBufNumSitei( _a0_w, _a1 );
        return 1;
    }
    case 0x4eb: {  // DuplicateSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 3 );
        ctx->stat = DuplicateSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4ec: {  // LoadSoundMemFromSoftSound
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 3 );
        ctx->stat = LoadSoundMemFromSoftSound( _a0, _a1 );
        return 1;
    }
    case 0x4ed: {  // ChangePanSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangePanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4ee: {  // GetPanSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetPanSoundMem( _a0 );
        return 1;
    }
    case 0x4ef: {  // ChangeVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4f0: {  // GetVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetVolumeSoundMem( _a0 );
        return 1;
    }
    case 0x4f1: {  // GetVolumeSoundMem2
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetVolumeSoundMem2( _a0 );
        return 1;
    }
    case 0x4f2: {  // SetChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4f3: {  // ChangeChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4f4: {  // GetChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetChannelVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4f5: {  // GetChannelVolumeSoundMem2
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetChannelVolumeSoundMem2( _a0, _a1 );
        return 1;
    }
    case 0x4f6: {  // SetFrequencySoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFrequencySoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4f7: {  // GetFrequencySoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetFrequencySoundMem( _a0 );
        return 1;
    }
    case 0x4f8: {  // ResetFrequencySoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetFrequencySoundMem( _a0 );
        return 1;
    }
    case 0x4f9: {  // SetNextPlayPanSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayPanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4fa: {  // ChangeNextPlayPanSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayPanSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4fb: {  // SetNextPlayVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4fc: {  // ChangeNextPlayVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayVolumeSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x4fd: {  // SetNextPlayChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4fe: {  // ChangeNextPlayChannelVolumeSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeNextPlayChannelVolumeSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x4ff: {  // SetNextPlayFrequencySoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlayFrequencySoundMem( _a0, _a1 );
        return 1;
    }
    case 0x500: {  // SetCurrentPositionSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCurrentPositionSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x501: {  // SetSoundCurrentPosition
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetSoundCurrentPosition( _a0, _a1 );
        return 1;
    }
    case 0x502: {  // SetSoundCurrentTime
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetSoundCurrentTime( _a0, _a1 );
        return 1;
    }
    case 0x503: {  // SetLoopPosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopPosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x504: {  // SetLoopTimePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopTimePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x505: {  // SetLoopSamplePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopSamplePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x506: {  // SetLoopStartTimePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopStartTimePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x507: {  // SetLoopStartSamplePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopStartSamplePosSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x508: {  // SetLoopAreaTimePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopAreaTimePosSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x509: {  // SetLoopAreaSamplePosSoundMem
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLoopAreaSamplePosSoundMem( _a0, _a1, _a2 );
        return 1;
    }
    case 0x50a: {  // SetPlayFinishDeleteSoundMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPlayFinishDeleteSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x50b: {  // Set3DPositionSoundMem
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
    case 0x50c: {  // Set3DRadiusSoundMem
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = Set3DRadiusSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x50d: {  // Set3DVelocitySoundMem
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
    case 0x50e: {  // SetNextPlay3DPositionSoundMem
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
    case 0x50f: {  // SetNextPlay3DRadiusSoundMem
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNextPlay3DRadiusSoundMem( _a0, _a1 );
        return 1;
    }
    case 0x510: {  // SetNextPlay3DVelocitySoundMem
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
    case 0x511: {  // GetOggCommentNum
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = GetOggCommentNum( _a0_w );
        return 1;
    }
    case 0x512: {  // SetCreateSoundDataType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateSoundDataType( _a0 );
        return 1;
    }
    case 0x513: {  // GetCreateSoundDataType
        ctx->stat = GetCreateSoundDataType(  );
        return 1;
    }
    case 0x514: {  // SetCreateSoundPitchRate
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCreateSoundPitchRate( _a0 );
        return 1;
    }
    case 0x515: {  // SetCreateSoundTimeStretchRate
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCreateSoundTimeStretchRate( _a0 );
        return 1;
    }
    case 0x516: {  // SetCreateSoundLoopAreaTimePos
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = SetCreateSoundLoopAreaTimePos( _a0, _a1 );
        return 1;
    }
    case 0x517: {  // SetCreateSoundLoopAreaSamplePos
        LONGLONG _a0 = (LONGLONG)code_geti64();
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = SetCreateSoundLoopAreaSamplePos( _a0, _a1 );
        return 1;
    }
    case 0x518: {  // SetCreateSoundIgnoreLoopAreaInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateSoundIgnoreLoopAreaInfo( _a0 );
        return 1;
    }
    case 0x519: {  // GetCreateSoundIgnoreLoopAreaInfo
        ctx->stat = GetCreateSoundIgnoreLoopAreaInfo(  );
        return 1;
    }
    case 0x51a: {  // SetDisableReadSoundFunctionMask
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDisableReadSoundFunctionMask( _a0 );
        return 1;
    }
    case 0x51b: {  // GetDisableReadSoundFunctionMask
        ctx->stat = GetDisableReadSoundFunctionMask(  );
        return 1;
    }
    case 0x51c: {  // SetEnableSoundCaptureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetEnableSoundCaptureFlag( _a0 );
        return 1;
    }
    case 0x51d: {  // SetUseOldVolumeCalcFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseOldVolumeCalcFlag( _a0 );
        return 1;
    }
    case 0x51e: {  // GetSoundCurrentTimeType
        ctx->stat = GetSoundCurrentTimeType(  );
        return 1;
    }
    case 0x51f: {  // SetCreate3DSoundFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreate3DSoundFlag( _a0 );
        return 1;
    }
    case 0x520: {  // Set3DSoundOneMetre
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundOneMetre( _a0 );
        return 1;
    }
    case 0x521: {  // Set3DSoundListenerPosAndFrontPos_UpVecY
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
    case 0x522: {  // Set3DSoundListenerPosAndFrontPosAndUpVec
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
    case 0x523: {  // Set3DSoundListenerVelocity
        PVal *_a0_pv; APTR _a0_ap;
        _a0_ap = code_getva( &_a0_pv );
        if ( _a0_pv->pt == nullptr || _a0_pv->len[0] < 12 )
            throw HSPERR_TYPE_MISMATCH;
        VECTOR _a0;
        memcpy( &_a0, _a0_pv->pt + _a0_ap * _a0_pv->len[0], sizeof(VECTOR) );
        ctx->stat = Set3DSoundListenerVelocity( _a0 );
        return 1;
    }
    case 0x524: {  // Set3DSoundListenerConeAngle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundListenerConeAngle( _a0, _a1 );
        return 1;
    }
    case 0x525: {  // Set3DSoundListenerConeVolume
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Set3DSoundListenerConeVolume( _a0, _a1 );
        return 1;
    }
    case 0x526: {  // SetBeepFrequency
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBeepFrequency( _a0 );
        return 1;
    }
    case 0x527: {  // PlayBeep
        ctx->stat = PlayBeep(  );
        return 1;
    }
    case 0x528: {  // StopBeep
        ctx->stat = StopBeep(  );
        return 1;
    }
    case 0x529: {  // PlaySoundFile
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySoundFile( _a0_w, _a1 );
        return 1;
    }
    case 0x52a: {  // PlaySound
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySound( _a0_w, _a1 );
        return 1;
    }
    case 0x52b: {  // PlaySoundDX
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlaySoundDX( _a0_w, _a1 );
        return 1;
    }
    case 0x52c: {  // CheckSoundFile
        ctx->stat = CheckSoundFile(  );
        return 1;
    }
    case 0x52d: {  // CheckSound
        ctx->stat = CheckSound(  );
        return 1;
    }
    case 0x52e: {  // StopSoundFile
        ctx->stat = StopSoundFile(  );
        return 1;
    }
    case 0x52f: {  // StopSound
        ctx->stat = StopSound(  );
        return 1;
    }
    case 0x530: {  // SetVolumeSoundFile
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeSoundFile( _a0 );
        return 1;
    }
    case 0x531: {  // SetVolumeSound
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeSound( _a0 );
        return 1;
    }
    case 0x532: {  // InitSoftSound
        ctx->stat = InitSoftSound(  );
        return 1;
    }
    case 0x533: {  // LoadSoftSound
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadSoftSound( _a0_w );
        return 1;
    }
    case 0x534: {  // MakeSoftSound
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound( _a0, _a1 );
        return 1;
    }
    case 0x535: {  // MakeSoftSound2Ch16Bit44KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch16Bit44KHz( _a0 );
        return 1;
    }
    case 0x536: {  // MakeSoftSound2Ch16Bit22KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch16Bit22KHz( _a0 );
        return 1;
    }
    case 0x537: {  // MakeSoftSound2Ch8Bit44KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch8Bit44KHz( _a0 );
        return 1;
    }
    case 0x538: {  // MakeSoftSound2Ch8Bit22KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound2Ch8Bit22KHz( _a0 );
        return 1;
    }
    case 0x539: {  // MakeSoftSound1Ch16Bit44KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch16Bit44KHz( _a0 );
        return 1;
    }
    case 0x53a: {  // MakeSoftSound1Ch16Bit22KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch16Bit22KHz( _a0 );
        return 1;
    }
    case 0x53b: {  // MakeSoftSound1Ch8Bit44KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch8Bit44KHz( _a0 );
        return 1;
    }
    case 0x53c: {  // MakeSoftSound1Ch8Bit22KHz
        LONGLONG _a0 = (LONGLONG)code_geti64();
        ctx->stat = MakeSoftSound1Ch8Bit22KHz( _a0 );
        return 1;
    }
    case 0x53d: {  // MakeSoftSoundCustom
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        LONGLONG _a3 = (LONGLONG)code_geti64();
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundCustom( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x53e: {  // DeleteSoftSound
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftSound( _a0 );
        return 1;
    }
    case 0x53f: {  // SaveSoftSound
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = SaveSoftSound( _a0, _a1_w );
        return 1;
    }
    case 0x540: {  // WriteSoftSoundData
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = WriteSoftSoundData( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x541: {  // WriteSoftSoundDataF
        int _a0 = hsp3dx_auto_geti( 0 );
        LONGLONG _a1 = (LONGLONG)code_geti64();
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = WriteSoftSoundDataF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x542: {  // WriteTimeStretchSoftSoundData
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = WriteTimeStretchSoftSoundData( _a0, _a1 );
        return 1;
    }
    case 0x543: {  // WritePitchShiftSoftSoundData
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = WritePitchShiftSoftSoundData( _a0, _a1 );
        return 1;
    }
    case 0x544: {  // InitSoftSoundPlayer
        ctx->stat = InitSoftSoundPlayer(  );
        return 1;
    }
    case 0x545: {  // MakeSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x546: {  // MakeSoftSoundPlayer2Ch16Bit44KHz
        ctx->stat = MakeSoftSoundPlayer2Ch16Bit44KHz(  );
        return 1;
    }
    case 0x547: {  // MakeSoftSoundPlayer2Ch16Bit22KHz
        ctx->stat = MakeSoftSoundPlayer2Ch16Bit22KHz(  );
        return 1;
    }
    case 0x548: {  // MakeSoftSoundPlayer2Ch8Bit44KHz
        ctx->stat = MakeSoftSoundPlayer2Ch8Bit44KHz(  );
        return 1;
    }
    case 0x549: {  // MakeSoftSoundPlayer2Ch8Bit22KHz
        ctx->stat = MakeSoftSoundPlayer2Ch8Bit22KHz(  );
        return 1;
    }
    case 0x54a: {  // MakeSoftSoundPlayer1Ch16Bit44KHz
        ctx->stat = MakeSoftSoundPlayer1Ch16Bit44KHz(  );
        return 1;
    }
    case 0x54b: {  // MakeSoftSoundPlayer1Ch16Bit22KHz
        ctx->stat = MakeSoftSoundPlayer1Ch16Bit22KHz(  );
        return 1;
    }
    case 0x54c: {  // MakeSoftSoundPlayer1Ch8Bit44KHz
        ctx->stat = MakeSoftSoundPlayer1Ch8Bit44KHz(  );
        return 1;
    }
    case 0x54d: {  // MakeSoftSoundPlayer1Ch8Bit22KHz
        ctx->stat = MakeSoftSoundPlayer1Ch8Bit22KHz(  );
        return 1;
    }
    case 0x54e: {  // MakeSoftSoundPlayerCustom
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeSoftSoundPlayerCustom( _a0, _a1, _a2 );
        return 1;
    }
    case 0x54f: {  // DeleteSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x550: {  // AddDataSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        LONGLONG _a2 = (LONGLONG)code_geti64();
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddDataSoftSoundPlayer( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x551: {  // AddOneDataSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddOneDataSoftSoundPlayer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x552: {  // StartSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StartSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x553: {  // CheckStartSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckStartSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x554: {  // StopSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x555: {  // ResetSoftSoundPlayer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetSoftSoundPlayer( _a0 );
        return 1;
    }
    case 0x556: {  // CheckSoftSoundPlayerNoneData
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckSoftSoundPlayerNoneData( _a0 );
        return 1;
    }
    case 0x557: {  // DeleteMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteMusicMem( _a0 );
        return 1;
    }
    case 0x558: {  // LoadMusicMem
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadMusicMem( _a0_w );
        return 1;
    }
    case 0x559: {  // PlayMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMusicMem( _a0, _a1 );
        return 1;
    }
    case 0x55a: {  // StopMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = StopMusicMem( _a0 );
        return 1;
    }
    case 0x55b: {  // CheckMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckMusicMem( _a0 );
        return 1;
    }
    case 0x55c: {  // SetVolumeMusicMem
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeMusicMem( _a0, _a1 );
        return 1;
    }
    case 0x55d: {  // GetMusicMemPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMusicMemPosition( _a0 );
        return 1;
    }
    case 0x55e: {  // InitMusicMem
        ctx->stat = InitMusicMem(  );
        return 1;
    }
    case 0x55f: {  // ProcessMusicMem
        ctx->stat = ProcessMusicMem(  );
        return 1;
    }
    case 0x560: {  // PlayMusic
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMusic( _a0_w, _a1 );
        return 1;
    }
    case 0x561: {  // SetVolumeMusic
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVolumeMusic( _a0 );
        return 1;
    }
    case 0x562: {  // StopMusic
        ctx->stat = StopMusic(  );
        return 1;
    }
    case 0x563: {  // CheckMusic
        ctx->stat = CheckMusic(  );
        return 1;
    }
    case 0x564: {  // GetMusicPosition
        ctx->stat = GetMusicPosition(  );
        return 1;
    }
    case 0x565: {  // SelectMidiMode
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SelectMidiMode( _a0 );
        return 1;
    }
    case 0x566: {  // SetUseDXArchiveFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDXArchiveFlag( _a0 );
        return 1;
    }
    case 0x567: {  // SetDXArchivePriority
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDXArchivePriority( _a0 );
        return 1;
    }
    case 0x568: {  // SetDXArchiveExtension
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetDXArchiveExtension( _a0_w );
        return 1;
    }
    case 0x569: {  // SetDXArchiveKeyString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetDXArchiveKeyString( _a0_w );
        return 1;
    }
    case 0x56a: {  // DXArchivePreLoad
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DXArchivePreLoad( _a0_w, _a1 );
        return 1;
    }
    case 0x56b: {  // DXArchiveCheckIdle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = DXArchiveCheckIdle( _a0_w );
        return 1;
    }
    case 0x56c: {  // DXArchiveRelease
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = DXArchiveRelease( _a0_w );
        return 1;
    }
    case 0x56d: {  // DXArchiveCheckFile
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = DXArchiveCheckFile( _a0_w, _a1_w );
        return 1;
    }
    case 0x56e: {  // MV1DuplicateModel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DuplicateModel( _a0 );
        return 1;
    }
    case 0x56f: {  // MV1CreateCloneModel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1CreateCloneModel( _a0 );
        return 1;
    }
    case 0x570: {  // MV1InitModel
        ctx->stat = MV1InitModel(  );
        return 1;
    }
    case 0x571: {  // MV1SetLoadModelReMakeNormal
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelReMakeNormal( _a0 );
        return 1;
    }
    case 0x572: {  // MV1SetLoadModelReMakeNormalSmoothingAngle
        float _a0 = (float)hsp3dx_auto_getd( 1.562069 );
        ctx->stat = MV1SetLoadModelReMakeNormalSmoothingAngle( _a0 );
        return 1;
    }
    case 0x573: {  // MV1SetLoadModelIgnoreScaling
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelIgnoreScaling( _a0 );
        return 1;
    }
    case 0x574: {  // MV1SetLoadModelPositionOptimize
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelPositionOptimize( _a0 );
        return 1;
    }
    case 0x575: {  // MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon( _a0 );
        return 1;
    }
    case 0x576: {  // MV1SetLoadModelPhysicsWorldGravity
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetLoadModelPhysicsWorldGravity( _a0 );
        return 1;
    }
    case 0x577: {  // MV1SetLoadCalcPhysicsWorldGravity
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
    case 0x578: {  // MV1SetLoadModelPhysicsCalcPrecision
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelPhysicsCalcPrecision( _a0 );
        return 1;
    }
    case 0x579: {  // MV1AddLoadModelDisablePhysicsNameWord
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = MV1AddLoadModelDisablePhysicsNameWord( _a0_w );
        return 1;
    }
    case 0x57a: {  // MV1ResetLoadModelDisablePhysicsNameWord
        ctx->stat = MV1ResetLoadModelDisablePhysicsNameWord(  );
        return 1;
    }
    case 0x57b: {  // MV1SetLoadModelAnimFilePath
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = MV1SetLoadModelAnimFilePath( _a0_w );
        return 1;
    }
    case 0x57c: {  // MV1SetLoadModelUsePackDraw
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelUsePackDraw( _a0 );
        return 1;
    }
    case 0x57d: {  // MV1SetLoadModelTriangleListUseMaxBoneNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelTriangleListUseMaxBoneNum( _a0 );
        return 1;
    }
    case 0x57e: {  // MV1SetLoadModelTextureLoad
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelTextureLoad( _a0 );
        return 1;
    }
    case 0x57f: {  // MV1SetLoadModelIgnoreIK
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetLoadModelIgnoreIK( _a0 );
        return 1;
    }
    case 0x580: {  // MV1SaveModelToMV1File
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
    case 0x581: {  // MV1SaveModelToXFile
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
    case 0x582: {  // MV1DrawFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawFrame( _a0, _a1 );
        return 1;
    }
    case 0x583: {  // MV1DrawMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawMesh( _a0, _a1 );
        return 1;
    }
    case 0x584: {  // MV1DrawTriangleList
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawTriangleList( _a0, _a1 );
        return 1;
    }
    case 0x585: {  // MV1DrawModelDebug
        int _a0 = hsp3dx_auto_geti( 0 );
        unsigned int _a1 = (unsigned int)hsp3dx_auto_geti( (int)(0) );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DrawModelDebug( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x586: {  // MV1SetUseOrigShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseOrigShader( _a0 );
        return 1;
    }
    case 0x587: {  // MV1SetPositionD
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
    case 0x588: {  // MV1SetRotationZYAxis
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
    case 0x589: {  // MV1SetRotationYUseDir
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
    case 0x58a: {  // MV1SetRotationMatrix
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
    case 0x58b: {  // MV1SetMatrix
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
    case 0x58c: {  // MV1SetMatrixD
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
    case 0x58d: {  // MV1SetVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetVisible( _a0, _a1 );
        return 1;
    }
    case 0x58e: {  // MV1GetVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetVisible( _a0 );
        return 1;
    }
    case 0x58f: {  // MV1SetMeshCategoryVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshCategoryVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x590: {  // MV1GetMeshCategoryVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshCategoryVisible( _a0, _a1 );
        return 1;
    }
    case 0x591: {  // MV1SetDifColorScale
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
    case 0x592: {  // MV1SetSpcColorScale
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
    case 0x593: {  // MV1SetEmiColorScale
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
    case 0x594: {  // MV1SetAmbColorScale
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
    case 0x595: {  // MV1GetSemiTransState
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetSemiTransState( _a0 );
        return 1;
    }
    case 0x596: {  // MV1SetOpacityRate
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetOpacityRate( _a0, _a1 );
        return 1;
    }
    case 0x597: {  // MV1SetUseDrawMulAlphaColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseDrawMulAlphaColor( _a0, _a1 );
        return 1;
    }
    case 0x598: {  // MV1GetUseDrawMulAlphaColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetUseDrawMulAlphaColor( _a0 );
        return 1;
    }
    case 0x599: {  // MV1SetUseZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseZBuffer( _a0, _a1 );
        return 1;
    }
    case 0x59a: {  // MV1SetWriteZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetWriteZBuffer( _a0, _a1 );
        return 1;
    }
    case 0x59b: {  // MV1SetZBias
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetZBias( _a0, _a1 );
        return 1;
    }
    case 0x59c: {  // MV1SetUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseVertDifColor( _a0, _a1 );
        return 1;
    }
    case 0x59d: {  // MV1SetUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseVertSpcColor( _a0, _a1 );
        return 1;
    }
    case 0x59e: {  // MV1SetSampleFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetSampleFilterMode( _a0, _a1 );
        return 1;
    }
    case 0x59f: {  // MV1SetMaxAnisotropy
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaxAnisotropy( _a0, _a1 );
        return 1;
    }
    case 0x5a0: {  // MV1SetWireFrameDrawFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetWireFrameDrawFlag( _a0, _a1 );
        return 1;
    }
    case 0x5a1: {  // MV1RefreshVertColorFromMaterial
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1RefreshVertColorFromMaterial( _a0 );
        return 1;
    }
    case 0x5a2: {  // MV1SetPhysicsWorldGravity
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
    case 0x5a3: {  // MV1PhysicsCalculation
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1PhysicsCalculation( _a0, _a1 );
        return 1;
    }
    case 0x5a4: {  // MV1PhysicsResetState
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1PhysicsResetState( _a0 );
        return 1;
    }
    case 0x5a5: {  // MV1SetPrioritizePhysicsOverAnimFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetPrioritizePhysicsOverAnimFlag( _a0, _a1 );
        return 1;
    }
    case 0x5a6: {  // MV1SetUseShapeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetUseShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x5a7: {  // MV1GetMaterialNumberOrderFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNumberOrderFlag( _a0 );
        return 1;
    }
    case 0x5a8: {  // MV1AttachAnim
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1AttachAnim( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5a9: {  // MV1DetachAnim
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1DetachAnim( _a0, _a1 );
        return 1;
    }
    case 0x5aa: {  // MV1SetAttachAnimTime
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetAttachAnimTime( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5ab: {  // MV1SetAttachAnimBlendRate
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 1.0 );
        ctx->stat = MV1SetAttachAnimBlendRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5ac: {  // MV1SetAttachAnimBlendRateToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SetAttachAnimBlendRateToFrame( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5ad: {  // MV1SetAttachAnimTimeToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 1 );
        ctx->stat = MV1SetAttachAnimTimeToFrame( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5ae: {  // MV1GetAttachAnim
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAttachAnim( _a0, _a1 );
        return 1;
    }
    case 0x5af: {  // MV1SetAttachAnimUseShapeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetAttachAnimUseShapeFlag( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b0: {  // MV1GetAttachAnimUseShapeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAttachAnimUseShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x5b1: {  // MV1GetAnimNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimNum( _a0 );
        return 1;
    }
    case 0x5b2: {  // MV1SetAnimName
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1SetAnimName( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x5b3: {  // MV1GetAnimIndex
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = MV1GetAnimIndex( _a0, _a1_w );
        return 1;
    }
    case 0x5b4: {  // MV1GetAnimTargetFrameNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameNum( _a0, _a1 );
        return 1;
    }
    case 0x5b5: {  // MV1GetAnimTargetFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrame( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b6: {  // MV1GetAnimTargetFrameKeySetNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameKeySetNum( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5b7: {  // MV1GetAnimTargetFrameKeySet
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimTargetFrameKeySet( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5b8: {  // MV1GetAnimKeySetNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetNum( _a0 );
        return 1;
    }
    case 0x5b9: {  // MV1GetAnimKeySetType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetType( _a0, _a1 );
        return 1;
    }
    case 0x5ba: {  // MV1GetAnimKeySetDataType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetDataType( _a0, _a1 );
        return 1;
    }
    case 0x5bb: {  // MV1GetAnimKeySetTimeType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetTimeType( _a0, _a1 );
        return 1;
    }
    case 0x5bc: {  // MV1GetAnimKeySetDataNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetAnimKeySetDataNum( _a0, _a1 );
        return 1;
    }
    case 0x5bd: {  // MV1GetAnimKeyDataIndexFromTime
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1GetAnimKeyDataIndexFromTime( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5be: {  // MV1GetMaterialNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNum( _a0 );
        return 1;
    }
    case 0x5bf: {  // MV1SetMaterialTypeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x5c0: {  // MV1SetMaterialType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c1: {  // MV1GetMaterialType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialType( _a0, _a1 );
        return 1;
    }
    case 0x5c2: {  // MV1SetMaterialDifColor
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
    case 0x5c3: {  // MV1SetMaterialSpcColor
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
    case 0x5c4: {  // MV1SetMaterialEmiColor
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
    case 0x5c5: {  // MV1SetMaterialAmbColor
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
    case 0x5c6: {  // MV1SetMaterialSpcPower
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialSpcPower( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c7: {  // MV1SetMaterialDifMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5c8: {  // MV1GetMaterialDifMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x5c9: {  // MV1SetMaterialSubDifMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSubDifMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5ca: {  // MV1GetMaterialSubDifMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSubDifMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x5cb: {  // MV1SetMaterialSpcMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5cc: {  // MV1GetMaterialSpcMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x5cd: {  // MV1SetMaterialNormalMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialNormalMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5ce: {  // MV1GetMaterialNormalMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialNormalMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x5cf: {  // MV1SetMaterialDifGradTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5d0: {  // MV1GetMaterialDifGradTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifGradTexture( _a0, _a1 );
        return 1;
    }
    case 0x5d1: {  // MV1SetMaterialSpcGradTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5d2: {  // MV1GetMaterialSpcGradTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcGradTexture( _a0, _a1 );
        return 1;
    }
    case 0x5d3: {  // MV1SetMaterialSphereMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapTexture( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5d4: {  // MV1GetMaterialSphereMapTexture
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSphereMapTexture( _a0, _a1 );
        return 1;
    }
    case 0x5d5: {  // MV1SetMaterialDifGradBlendTypeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x5d6: {  // MV1SetMaterialDifGradBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDifGradBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5d7: {  // MV1GetMaterialDifGradBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDifGradBlendType( _a0, _a1 );
        return 1;
    }
    case 0x5d8: {  // MV1SetMaterialSpcGradBlendTypeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x5d9: {  // MV1SetMaterialSpcGradBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSpcGradBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5da: {  // MV1GetMaterialSpcGradBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSpcGradBlendType( _a0, _a1 );
        return 1;
    }
    case 0x5db: {  // MV1SetMaterialSphereMapBlendTypeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapBlendTypeAll( _a0, _a1 );
        return 1;
    }
    case 0x5dc: {  // MV1SetMaterialSphereMapBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialSphereMapBlendType( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5dd: {  // MV1GetMaterialSphereMapBlendType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialSphereMapBlendType( _a0, _a1 );
        return 1;
    }
    case 0x5de: {  // MV1SetMaterialOutLineWidthAll
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineWidthAll( _a0, _a1 );
        return 1;
    }
    case 0x5df: {  // MV1SetMaterialOutLineWidth
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineWidth( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5e0: {  // MV1SetMaterialOutLineDotWidthAll
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineDotWidthAll( _a0, _a1 );
        return 1;
    }
    case 0x5e1: {  // MV1SetMaterialOutLineDotWidth
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMaterialOutLineDotWidth( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5e2: {  // MV1SetMaterialOutLineColorAll
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
    case 0x5e3: {  // MV1SetMaterialOutLineColor
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
    case 0x5e4: {  // MV1SetMaterialDrawBlendModeAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendModeAll( _a0, _a1 );
        return 1;
    }
    case 0x5e5: {  // MV1SetMaterialDrawBlendMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5e6: {  // MV1GetMaterialDrawBlendMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawBlendMode( _a0, _a1 );
        return 1;
    }
    case 0x5e7: {  // MV1SetMaterialDrawBlendParamAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendParamAll( _a0, _a1 );
        return 1;
    }
    case 0x5e8: {  // MV1SetMaterialDrawBlendParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawBlendParam( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5e9: {  // MV1GetMaterialDrawBlendParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawBlendParam( _a0, _a1 );
        return 1;
    }
    case 0x5ea: {  // MV1SetMaterialDrawAlphaTestAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAlphaTestAll( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5eb: {  // MV1SetMaterialDrawAlphaTest
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAlphaTest( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5ec: {  // MV1GetMaterialDrawAlphaTestEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestEnable( _a0, _a1 );
        return 1;
    }
    case 0x5ed: {  // MV1GetMaterialDrawAlphaTestMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestMode( _a0, _a1 );
        return 1;
    }
    case 0x5ee: {  // MV1GetMaterialDrawAlphaTestParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMaterialDrawAlphaTestParam( _a0, _a1 );
        return 1;
    }
    case 0x5ef: {  // MV1SetMaterialDrawAddColorAll
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAddColorAll( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5f0: {  // MV1SetMaterialDrawAddColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMaterialDrawAddColor( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x5f1: {  // MV1GetTextureNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureNum( _a0 );
        return 1;
    }
    case 0x5f2: {  // MV1SetTextureColorFilePath
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1SetTextureColorFilePath( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x5f3: {  // MV1SetTextureAlphaFilePath
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1SetTextureAlphaFilePath( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x5f4: {  // MV1SetTextureGraphHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureGraphHandle( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5f5: {  // MV1GetTextureGraphHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureGraphHandle( _a0, _a1 );
        return 1;
    }
    case 0x5f6: {  // MV1SetTextureAddressMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureAddressMode( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x5f7: {  // MV1GetTextureAddressModeU
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureAddressModeU( _a0, _a1 );
        return 1;
    }
    case 0x5f8: {  // MV1GetTextureAddressModeV
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureAddressModeV( _a0, _a1 );
        return 1;
    }
    case 0x5f9: {  // MV1GetTextureWidth
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureWidth( _a0, _a1 );
        return 1;
    }
    case 0x5fa: {  // MV1GetTextureHeight
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureHeight( _a0, _a1 );
        return 1;
    }
    case 0x5fb: {  // MV1GetTextureSemiTransState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x5fc: {  // MV1SetTextureBumpImageFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureBumpImageFlag( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5fd: {  // MV1GetTextureBumpImageFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureBumpImageFlag( _a0, _a1 );
        return 1;
    }
    case 0x5fe: {  // MV1SetTextureBumpImageNextPixelLength
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetTextureBumpImageNextPixelLength( _a0, _a1, _a2 );
        return 1;
    }
    case 0x5ff: {  // MV1SetTextureSampleFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetTextureSampleFilterMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x600: {  // MV1GetTextureSampleFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTextureSampleFilterMode( _a0, _a1 );
        return 1;
    }
    case 0x601: {  // MV1AddTextureGraphHandle
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
    case 0x602: {  // MV1LoadTexture
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = MV1LoadTexture( _a0_w );
        return 1;
    }
    case 0x603: {  // MV1GetFrameNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameNum( _a0 );
        return 1;
    }
    case 0x604: {  // MV1SearchFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = MV1SearchFrame( _a0, _a1_w );
        return 1;
    }
    case 0x605: {  // MV1SearchFrameChild
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1SearchFrameChild( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x606: {  // MV1GetFrameName2
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        ctx->stat = MV1GetFrameName2( _a0, _a1, _a2_w );
        return 1;
    }
    case 0x607: {  // MV1GetFrameParent
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameParent( _a0, _a1 );
        return 1;
    }
    case 0x608: {  // MV1GetFrameChildNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1GetFrameChildNum( _a0, _a1 );
        return 1;
    }
    case 0x609: {  // MV1GetFrameChild
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameChild( _a0, _a1, _a2 );
        return 1;
    }
    case 0x60a: {  // MV1SetFrameUserLocalMatrix
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
    case 0x60b: {  // MV1SetFrameUserLocalMatrixD
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
    case 0x60c: {  // MV1ResetFrameUserLocalMatrix
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameUserLocalMatrix( _a0, _a1 );
        return 1;
    }
    case 0x60d: {  // MV1SetFrameUserLocalWorldMatrix
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
    case 0x60e: {  // MV1SetFrameUserLocalWorldMatrixD
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
    case 0x60f: {  // MV1ResetFrameUserLocalWorldMatrix
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameUserLocalWorldMatrix( _a0, _a1 );
        return 1;
    }
    case 0x610: {  // MV1GetFrameVertexNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x611: {  // MV1GetFrameTriangleNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameTriangleNum( _a0, _a1 );
        return 1;
    }
    case 0x612: {  // MV1GetFrameMeshNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameMeshNum( _a0, _a1 );
        return 1;
    }
    case 0x613: {  // MV1GetFrameMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameMesh( _a0, _a1, _a2 );
        return 1;
    }
    case 0x614: {  // MV1SetFrameVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetFrameVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x615: {  // MV1GetFrameVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameVisible( _a0, _a1 );
        return 1;
    }
    case 0x616: {  // MV1SetFrameDifColorScale
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
    case 0x617: {  // MV1SetFrameSpcColorScale
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
    case 0x618: {  // MV1SetFrameEmiColorScale
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
    case 0x619: {  // MV1SetFrameAmbColorScale
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
    case 0x61a: {  // MV1GetFrameSemiTransState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x61b: {  // MV1SetFrameOpacityRate
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetFrameOpacityRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x61c: {  // MV1SetFrameBaseVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetFrameBaseVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x61d: {  // MV1GetFrameBaseVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetFrameBaseVisible( _a0, _a1 );
        return 1;
    }
    case 0x61e: {  // MV1SetFrameTextureAddressTransform
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
    case 0x61f: {  // MV1SetFrameTextureAddressTransformMatrix
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
    case 0x620: {  // MV1ResetFrameTextureAddressTransform
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1ResetFrameTextureAddressTransform( _a0, _a1 );
        return 1;
    }
    case 0x621: {  // MV1GetMeshNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshNum( _a0 );
        return 1;
    }
    case 0x622: {  // MV1GetMeshMaterial
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshMaterial( _a0, _a1 );
        return 1;
    }
    case 0x623: {  // MV1GetMeshVertexNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x624: {  // MV1GetMeshTriangleNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTriangleNum( _a0, _a1 );
        return 1;
    }
    case 0x625: {  // MV1SetMeshVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x626: {  // MV1GetMeshVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshVisible( _a0, _a1 );
        return 1;
    }
    case 0x627: {  // MV1SetMeshDifColorScale
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
    case 0x628: {  // MV1SetMeshSpcColorScale
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
    case 0x629: {  // MV1SetMeshEmiColorScale
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
    case 0x62a: {  // MV1SetMeshAmbColorScale
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
    case 0x62b: {  // MV1SetMeshOpacityRate
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = MV1SetMeshOpacityRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x62c: {  // MV1SetMeshDrawBlendMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshDrawBlendMode( _a0, _a1, _a2 );
        return 1;
    }
    case 0x62d: {  // MV1SetMeshDrawBlendParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshDrawBlendParam( _a0, _a1, _a2 );
        return 1;
    }
    case 0x62e: {  // MV1GetMeshDrawBlendMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshDrawBlendMode( _a0, _a1 );
        return 1;
    }
    case 0x62f: {  // MV1GetMeshDrawBlendParam
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshDrawBlendParam( _a0, _a1 );
        return 1;
    }
    case 0x630: {  // MV1SetMeshBaseVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshBaseVisible( _a0, _a1, _a2 );
        return 1;
    }
    case 0x631: {  // MV1GetMeshBaseVisible
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshBaseVisible( _a0, _a1 );
        return 1;
    }
    case 0x632: {  // MV1SetMeshBackCulling
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshBackCulling( _a0, _a1, _a2 );
        return 1;
    }
    case 0x633: {  // MV1GetMeshBackCulling
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshBackCulling( _a0, _a1 );
        return 1;
    }
    case 0x634: {  // MV1GetMeshTListNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTListNum( _a0, _a1 );
        return 1;
    }
    case 0x635: {  // MV1GetMeshTList
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshTList( _a0, _a1, _a2 );
        return 1;
    }
    case 0x636: {  // MV1GetMeshSemiTransState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshSemiTransState( _a0, _a1 );
        return 1;
    }
    case 0x637: {  // MV1SetMeshUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshUseVertDifColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x638: {  // MV1SetMeshUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1SetMeshUseVertSpcColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x639: {  // MV1GetMeshUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshUseVertDifColor( _a0, _a1 );
        return 1;
    }
    case 0x63a: {  // MV1GetMeshUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshUseVertSpcColor( _a0, _a1 );
        return 1;
    }
    case 0x63b: {  // MV1GetMeshShapeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetMeshShapeFlag( _a0, _a1 );
        return 1;
    }
    case 0x63c: {  // MV1GetShapeNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeNum( _a0 );
        return 1;
    }
    case 0x63d: {  // MV1SearchShape
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = MV1SearchShape( _a0, _a1_w );
        return 1;
    }
    case 0x63e: {  // MV1GetShapeTargetMeshNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeTargetMeshNum( _a0, _a1 );
        return 1;
    }
    case 0x63f: {  // MV1GetShapeTargetMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetShapeTargetMesh( _a0, _a1, _a2 );
        return 1;
    }
    case 0x640: {  // MV1SetShapeRate
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( DX_MV1_SHAPERATE_ADD );
        ctx->stat = MV1SetShapeRate( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x641: {  // MV1GetTriangleListNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListNum( _a0 );
        return 1;
    }
    case 0x642: {  // MV1GetTriangleListVertexType
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListVertexType( _a0, _a1 );
        return 1;
    }
    case 0x643: {  // MV1GetTriangleListPolygonNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListPolygonNum( _a0, _a1 );
        return 1;
    }
    case 0x644: {  // MV1GetTriangleListVertexNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListVertexNum( _a0, _a1 );
        return 1;
    }
    case 0x645: {  // MV1GetTriangleListLocalWorldMatrixNum
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListLocalWorldMatrixNum( _a0, _a1 );
        return 1;
    }
    case 0x646: {  // MV1GetTriangleListUseMaterial
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MV1GetTriangleListUseMaterial( _a0, _a1 );
        return 1;
    }
    case 0x647: {  // MV1SetupCollInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( 32 );
        int _a3 = hsp3dx_auto_geti( 8 );
        int _a4 = hsp3dx_auto_geti( 32 );
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1SetupCollInfo( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x648: {  // MV1TerminateCollInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1TerminateCollInfo( _a0, _a1, _a2 );
        return 1;
    }
    case 0x649: {  // MV1RefreshCollInfo
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1RefreshCollInfo( _a0, _a1, _a2 );
        return 1;
    }
    case 0x64a: {  // MV1SetupReferenceMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1SetupReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x64b: {  // MV1TerminateReferenceMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1TerminateReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x64c: {  // MV1RefreshReferenceMesh
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( -1 );
        ctx->stat = MV1RefreshReferenceMesh( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x64d: {  // Live2D_SetCubism4CoreDLLPath
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = Live2D_SetCubism4CoreDLLPath( _a0_w );
        return 1;
    }
    case 0x64e: {  // Live2D_SetCubism3CoreDLLPath
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = Live2D_SetCubism3CoreDLLPath( _a0_w );
        return 1;
    }
    case 0x64f: {  // Live2D_RenderBegin
        ctx->stat = Live2D_RenderBegin(  );
        return 1;
    }
    case 0x650: {  // Live2D_RenderEnd
        ctx->stat = Live2D_RenderEnd(  );
        return 1;
    }
    case 0x651: {  // Live2D_LoadModel
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = Live2D_LoadModel( _a0_w );
        return 1;
    }
    case 0x652: {  // Live2D_DeleteModel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_DeleteModel( _a0 );
        return 1;
    }
    case 0x653: {  // Live2D_InitModel
        ctx->stat = Live2D_InitModel(  );
        return 1;
    }
    case 0x654: {  // Live2D_SetUseAutoScaling
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseAutoScaling( _a0 );
        return 1;
    }
    case 0x655: {  // Live2D_SetUseAutoCentering
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseAutoCentering( _a0 );
        return 1;
    }
    case 0x656: {  // Live2D_SetUseReverseYAxis
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_SetUseReverseYAxis( _a0 );
        return 1;
    }
    case 0x657: {  // Live2D_Model_Update
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_Update( _a0, _a1 );
        return 1;
    }
    case 0x658: {  // Live2D_Model_SetTranslate
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetTranslate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x659: {  // Live2D_Model_SetExtendRate
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetExtendRate( _a0, _a1, _a2 );
        return 1;
    }
    case 0x65a: {  // Live2D_Model_SetRotate
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetRotate( _a0, _a1 );
        return 1;
    }
    case 0x65b: {  // Live2D_Model_Draw
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_Draw( _a0 );
        return 1;
    }
    case 0x65c: {  // Live2D_Model_StartMotion
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
    case 0x65d: {  // Live2D_Model_GetLastPlayMotionNo
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetLastPlayMotionNo( _a0 );
        return 1;
    }
    case 0x65e: {  // Live2D_Model_IsMotionFinished
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_IsMotionFinished( _a0 );
        return 1;
    }
    case 0x65f: {  // Live2D_Model_SetExpression
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = Live2D_Model_SetExpression( _a0, _a1_w );
        return 1;
    }
    case 0x660: {  // Live2D_Model_HitTest
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_HitTest( _a0, _a1_w, _a2, _a3 );
        return 1;
    }
    case 0x661: {  // Live2D_Model_GetParameterCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetParameterCount( _a0 );
        return 1;
    }
    case 0x662: {  // Live2D_Model_SetParameterValue
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = Live2D_Model_SetParameterValue( _a0, _a1_w, _a2 );
        return 1;
    }
    case 0x663: {  // Live2D_Model_GetHitAreasCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetHitAreasCount( _a0 );
        return 1;
    }
    case 0x664: {  // Live2D_Model_GetExpressionCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetExpressionCount( _a0 );
        return 1;
    }
    case 0x665: {  // Live2D_Model_GetMotionGroupCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetMotionGroupCount( _a0 );
        return 1;
    }
    case 0x666: {  // Live2D_Model_GetMotionCount
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = Live2D_Model_GetMotionCount( _a0, _a1_w );
        return 1;
    }
    case 0x667: {  // Live2D_Model_GetEyeBlinkParameterCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetEyeBlinkParameterCount( _a0 );
        return 1;
    }
    case 0x668: {  // Live2D_Model_GetLipSyncParameterCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = Live2D_Model_GetLipSyncParameterCount( _a0 );
        return 1;
    }
    }
    return 0;   // 未処理 → 呼び出し側で HSPERR_UNSUPPORTED_FUNCTION 投げる
}
