//
//  hsp3dx_dxlib_auto.cpp — Phase 5.3 自動生成 DxLib binding dispatcher
//  DO NOT EDIT — tools/hsp3dx_dxlib_gen/gen_dxlib_bindings.py で再生成
//  関数数: 512
//
//  hsp3dx_extcmd.cpp の cmdfunc_extcmd() から以下で呼ばれる:
//      if ( hsp3dx_dxlib_auto_dispatch( cmd, ctx ) ) return RUNMODE_RUN;
//
#include <stdio.h>
#include <string.h>
#include <windows.h>
#include "../../hsp3/hsp3config.h"
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
    case 0x268: {  // KeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = KeyInputNumber( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x269: {  // GetIMEInputModeStr
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = GetIMEInputModeStr( _a0_w );
        return 1;
    }
    case 0x26a: {  // SetIMEInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = SetIMEInputString( _a0_w );
        return 1;
    }
    case 0x26b: {  // SetKeyInputStringFont
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputStringFont( _a0 );
        return 1;
    }
    case 0x26c: {  // DrawKeyInputModeString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawKeyInputModeString( _a0, _a1 );
        return 1;
    }
    case 0x26d: {  // InitKeyInput
        ctx->stat = InitKeyInput(  );
        return 1;
    }
    case 0x26e: {  // DeleteKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteKeyInput( _a0 );
        return 1;
    }
    case 0x26f: {  // SetActiveKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetActiveKeyInput( _a0 );
        return 1;
    }
    case 0x270: {  // GetActiveKeyInput
        ctx->stat = GetActiveKeyInput(  );
        return 1;
    }
    case 0x271: {  // CheckKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckKeyInput( _a0 );
        return 1;
    }
    case 0x272: {  // ReStartKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReStartKeyInput( _a0 );
        return 1;
    }
    case 0x273: {  // ProcessActKeyInput
        ctx->stat = ProcessActKeyInput(  );
        return 1;
    }
    case 0x274: {  // DrawKeyInputString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawKeyInputString( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x275: {  // DrawKeyInputExtendString
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        double _a2 = hsp3dx_auto_getd( 0.0 );
        double _a3 = hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = DrawKeyInputExtendString( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x276: {  // SetKeyInputDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputDrawArea( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x277: {  // SetKeyInputSelectArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputSelectArea( _a0, _a1, _a2 );
        return 1;
    }
    case 0x278: {  // SetKeyInputDrawStartPos
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputDrawStartPos( _a0, _a1 );
        return 1;
    }
    case 0x279: {  // GetKeyInputDrawStartPos
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputDrawStartPos( _a0 );
        return 1;
    }
    case 0x27a: {  // SetKeyInputCursorBrinkTime
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorBrinkTime( _a0 );
        return 1;
    }
    case 0x27b: {  // SetKeyInputCursorBrinkFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorBrinkFlag( _a0 );
        return 1;
    }
    case 0x27c: {  // SetKeyInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputString( _a0_w, _a1 );
        return 1;
    }
    case 0x27d: {  // SetKeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputNumber( _a0, _a1 );
        return 1;
    }
    case 0x27e: {  // SetKeyInputNumberToFloat
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputNumberToFloat( _a0, _a1 );
        return 1;
    }
    case 0x27f: {  // GetKeyInputString
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputString( _a0_w, _a1 );
        return 1;
    }
    case 0x280: {  // GetKeyInputNumber
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputNumber( _a0 );
        return 1;
    }
    case 0x281: {  // SetKeyInputCursorPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetKeyInputCursorPosition( _a0, _a1 );
        return 1;
    }
    case 0x282: {  // GetKeyInputCursorPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetKeyInputCursorPosition( _a0 );
        return 1;
    }
    case 0x283: {  // FileRead_open
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_open( _a0_w, _a1 );
        return 1;
    }
    case 0x284: {  // FileRead_close
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_close( _a0 );
        return 1;
    }
    case 0x285: {  // FileRead_idle_chk
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_idle_chk( _a0 );
        return 1;
    }
    case 0x286: {  // FileRead_eof
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_eof( _a0 );
        return 1;
    }
    case 0x287: {  // FileRead_gets
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_gets( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x288: {  // FileRead_fullyLoad
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = FileRead_fullyLoad( _a0_w );
        return 1;
    }
    case 0x289: {  // FileRead_fullyLoad_delete
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FileRead_fullyLoad_delete( _a0 );
        return 1;
    }
    case 0x28a: {  // GetStreamFunctionDefault
        ctx->stat = GetStreamFunctionDefault(  );
        return 1;
    }
    case 0x28b: {  // ConvertFullPath
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
    case 0x28c: {  // CheckHitKeyAll
        int _a0 = hsp3dx_auto_geti( DX_CHECKINPUT_ALL );
        ctx->stat = CheckHitKeyAll( _a0 );
        return 1;
    }
    case 0x28d: {  // GetJoypadNum
        ctx->stat = GetJoypadNum(  );
        return 1;
    }
    case 0x28e: {  // GetJoypadButtonNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadButtonNum( _a0 );
        return 1;
    }
    case 0x28f: {  // CheckJoypadXInput
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckJoypadXInput( _a0 );
        return 1;
    }
    case 0x290: {  // GetJoypadType
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadType( _a0 );
        return 1;
    }
    case 0x291: {  // SetJoypadInputToKeyInput
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        int _a4 = hsp3dx_auto_geti( -1 );
        int _a5 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetJoypadInputToKeyInput( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x292: {  // SetJoypadDeadZone
        int _a0 = hsp3dx_auto_geti( 0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetJoypadDeadZone( _a0, _a1 );
        return 1;
    }
    case 0x293: {  // SetJoypadDefaultDeadZoneAll
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetJoypadDefaultDeadZoneAll( _a0 );
        return 1;
    }
    case 0x294: {  // StartJoypadVibration
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( -1 );
        ctx->stat = StartJoypadVibration( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x295: {  // StopJoypadVibration
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( -1 );
        ctx->stat = StopJoypadVibration( _a0, _a1 );
        return 1;
    }
    case 0x296: {  // GetJoypadPOVState
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetJoypadPOVState( _a0, _a1 );
        return 1;
    }
    case 0x297: {  // ReSetupJoypad
        ctx->stat = ReSetupJoypad(  );
        return 1;
    }
    case 0x298: {  // ReSetupInputSystem
        ctx->stat = ReSetupInputSystem(  );
        return 1;
    }
    case 0x299: {  // SetUseJoypadVibrationFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseJoypadVibrationFlag( _a0 );
        return 1;
    }
    case 0x29a: {  // MakeGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x29b: {  // DerivationGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DerivationGraph( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x29c: {  // DerivationGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DerivationGraphF( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x29d: {  // DeleteSharingGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteSharingGraph( _a0 );
        return 1;
    }
    case 0x29e: {  // GetGraphNum
        ctx->stat = GetGraphNum(  );
        return 1;
    }
    case 0x29f: {  // FillGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 255 );
        ctx->stat = FillGraph( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2a0: {  // FillRectGraph
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
    case 0x2a1: {  // InitGraph
        ctx->stat = InitGraph(  );
        return 1;
    }
    case 0x2a2: {  // ReloadFileGraphAll
        ctx->stat = ReloadFileGraphAll(  );
        return 1;
    }
    case 0x2a3: {  // MakeShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x2a4: {  // DeleteShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShadowMap( _a0 );
        return 1;
    }
    case 0x2a5: {  // ShadowMap_DrawSetup
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ShadowMap_DrawSetup( _a0 );
        return 1;
    }
    case 0x2a6: {  // ShadowMap_DrawEnd
        ctx->stat = ShadowMap_DrawEnd(  );
        return 1;
    }
    case 0x2a7: {  // SetUseShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x2a8: {  // ResetShadowMapDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetShadowMapDrawArea( _a0 );
        return 1;
    }
    case 0x2a9: {  // SetShadowMapAdjustDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetShadowMapAdjustDepth( _a0, _a1 );
        return 1;
    }
    case 0x2aa: {  // TestDrawShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = TestDrawShadowMap( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2ab: {  // LoadBmpToGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( DX_MOVIESURFACE_NORMAL );
        ctx->stat = LoadBmpToGraph( _a0_w, _a1, _a2, _a3 );
        return 1;
    }
    case 0x2ac: {  // LoadReverseGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadReverseGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x2ad: {  // LoadBlendGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadBlendGraph( _a0_w );
        return 1;
    }
    case 0x2ae: {  // CreateBlendGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateBlendGraphFromSoftImage( _a0 );
        return 1;
    }
    case 0x2af: {  // CreateGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateGraphFromSoftImage( _a0 );
        return 1;
    }
    case 0x2b0: {  // CreateGraphFromRectSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x2b1: {  // ReCreateGraphFromSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReCreateGraphFromSoftImage( _a0, _a1 );
        return 1;
    }
    case 0x2b2: {  // ReCreateGraphFromRectSoftImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReCreateGraphFromRectSoftImage( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x2b3: {  // ReloadGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadGraph( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x2b4: {  // ReloadReverseGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ReloadReverseGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x2b5: {  // SetGraphColorBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphColorBitDepth( _a0 );
        return 1;
    }
    case 0x2b6: {  // GetGraphColorBitDepth
        ctx->stat = GetGraphColorBitDepth(  );
        return 1;
    }
    case 0x2b7: {  // SetCreateGraphColorBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphColorBitDepth( _a0 );
        return 1;
    }
    case 0x2b8: {  // GetCreateGraphColorBitDepth
        ctx->stat = GetCreateGraphColorBitDepth(  );
        return 1;
    }
    case 0x2b9: {  // SetCreateGraphChannelBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphChannelBitDepth( _a0 );
        return 1;
    }
    case 0x2ba: {  // GetCreateGraphChannelBitDepth
        ctx->stat = GetCreateGraphChannelBitDepth(  );
        return 1;
    }
    case 0x2bb: {  // SetCreateGraphInitGraphDelete
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphInitGraphDelete( _a0 );
        return 1;
    }
    case 0x2bc: {  // GetCreateGraphInitGraphDelete
        ctx->stat = GetCreateGraphInitGraphDelete(  );
        return 1;
    }
    case 0x2bd: {  // SetCreateGraphHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateGraphHandle( _a0 );
        return 1;
    }
    case 0x2be: {  // GetCreateGraphHandle
        ctx->stat = GetCreateGraphHandle(  );
        return 1;
    }
    case 0x2bf: {  // SetDrawValidGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2c0: {  // GetDrawValidGraphCreateFlag
        ctx->stat = GetDrawValidGraphCreateFlag(  );
        return 1;
    }
    case 0x2c1: {  // SetDrawValidFlagOf3DGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidFlagOf3DGraph( _a0 );
        return 1;
    }
    case 0x2c2: {  // SetLeftUpColorIsTransColorFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLeftUpColorIsTransColorFlag( _a0 );
        return 1;
    }
    case 0x2c3: {  // SetUsePaletteGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePaletteGraphFlag( _a0 );
        return 1;
    }
    case 0x2c4: {  // SetUseBlendGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseBlendGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2c5: {  // GetUseBlendGraphCreateFlag
        ctx->stat = GetUseBlendGraphCreateFlag(  );
        return 1;
    }
    case 0x2c6: {  // SetUseAlphaTestGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaTestGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2c7: {  // GetUseAlphaTestGraphCreateFlag
        ctx->stat = GetUseAlphaTestGraphCreateFlag(  );
        return 1;
    }
    case 0x2c8: {  // SetUseAlphaTestFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaTestFlag( _a0 );
        return 1;
    }
    case 0x2c9: {  // GetUseAlphaTestFlag
        ctx->stat = GetUseAlphaTestFlag(  );
        return 1;
    }
    case 0x2ca: {  // SetCubeMapTextureCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCubeMapTextureCreateFlag( _a0 );
        return 1;
    }
    case 0x2cb: {  // GetCubeMapTextureCreateFlag
        ctx->stat = GetCubeMapTextureCreateFlag(  );
        return 1;
    }
    case 0x2cc: {  // SetUseNoBlendModeParam
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNoBlendModeParam( _a0 );
        return 1;
    }
    case 0x2cd: {  // SetDrawValidAlphaChannelGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidAlphaChannelGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2ce: {  // GetDrawValidAlphaChannelGraphCreateFlag
        ctx->stat = GetDrawValidAlphaChannelGraphCreateFlag(  );
        return 1;
    }
    case 0x2cf: {  // SetDrawValidFloatTypeGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidFloatTypeGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2d0: {  // GetDrawValidFloatTypeGraphCreateFlag
        ctx->stat = GetDrawValidFloatTypeGraphCreateFlag(  );
        return 1;
    }
    case 0x2d1: {  // SetDrawValidGraphCreateZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidGraphCreateZBufferFlag( _a0 );
        return 1;
    }
    case 0x2d2: {  // GetDrawValidGraphCreateZBufferFlag
        ctx->stat = GetDrawValidGraphCreateZBufferFlag(  );
        return 1;
    }
    case 0x2d3: {  // SetCreateDrawValidGraphZBufferBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphZBufferBitDepth( _a0 );
        return 1;
    }
    case 0x2d4: {  // GetCreateDrawValidGraphZBufferBitDepth
        ctx->stat = GetCreateDrawValidGraphZBufferBitDepth(  );
        return 1;
    }
    case 0x2d5: {  // SetCreateDrawValidGraphMipLevels
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphMipLevels( _a0 );
        return 1;
    }
    case 0x2d6: {  // GetCreateDrawValidGraphMipLevels
        ctx->stat = GetCreateDrawValidGraphMipLevels(  );
        return 1;
    }
    case 0x2d7: {  // SetCreateDrawValidGraphChannelNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphChannelNum( _a0 );
        return 1;
    }
    case 0x2d8: {  // GetCreateDrawValidGraphChannelNum
        ctx->stat = GetCreateDrawValidGraphChannelNum(  );
        return 1;
    }
    case 0x2d9: {  // SetCreateDrawValidGraphMultiSample
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetCreateDrawValidGraphMultiSample( _a0, _a1 );
        return 1;
    }
    case 0x2da: {  // SetDrawValidMultiSample
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawValidMultiSample( _a0, _a1 );
        return 1;
    }
    case 0x2db: {  // GetMultiSampleQuality
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMultiSampleQuality( _a0 );
        return 1;
    }
    case 0x2dc: {  // SetUseTransColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTransColor( _a0 );
        return 1;
    }
    case 0x2dd: {  // SetUseTransColorGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTransColorGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2de: {  // SetUseGraphAlphaChannel
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGraphAlphaChannel( _a0 );
        return 1;
    }
    case 0x2df: {  // GetUseGraphAlphaChannel
        ctx->stat = GetUseGraphAlphaChannel(  );
        return 1;
    }
    case 0x2e0: {  // SetUseAlphaChannelGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaChannelGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2e1: {  // GetUseAlphaChannelGraphCreateFlag
        ctx->stat = GetUseAlphaChannelGraphCreateFlag(  );
        return 1;
    }
    case 0x2e2: {  // SetUseNotManageTextureFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNotManageTextureFlag( _a0 );
        return 1;
    }
    case 0x2e3: {  // GetUseNotManageTextureFlag
        ctx->stat = GetUseNotManageTextureFlag(  );
        return 1;
    }
    case 0x2e4: {  // SetUsePlatformTextureFormat
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePlatformTextureFormat( _a0 );
        return 1;
    }
    case 0x2e5: {  // GetUsePlatformTextureFormat
        ctx->stat = GetUsePlatformTextureFormat(  );
        return 1;
    }
    case 0x2e6: {  // SetTransColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetTransColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2e7: {  // SetUseDivGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDivGraphFlag( _a0 );
        return 1;
    }
    case 0x2e8: {  // SetUseAlphaImageLoadFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseAlphaImageLoadFlag( _a0 );
        return 1;
    }
    case 0x2e9: {  // SetUseMaxTextureSize
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseMaxTextureSize( _a0 );
        return 1;
    }
    case 0x2ea: {  // SetUseGraphBaseDataBackup
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGraphBaseDataBackup( _a0 );
        return 1;
    }
    case 0x2eb: {  // GetUseGraphBaseDataBackup
        ctx->stat = GetUseGraphBaseDataBackup(  );
        return 1;
    }
    case 0x2ec: {  // SetUseSystemMemGraphCreateFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSystemMemGraphCreateFlag( _a0 );
        return 1;
    }
    case 0x2ed: {  // GetUseSystemMemGraphCreateFlag
        ctx->stat = GetUseSystemMemGraphCreateFlag(  );
        return 1;
    }
    case 0x2ee: {  // SetUseLoadDivGraphSizeCheckFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLoadDivGraphSizeCheckFlag( _a0 );
        return 1;
    }
    case 0x2ef: {  // GetUseLoadDivGraphSizeCheckFlag
        ctx->stat = GetUseLoadDivGraphSizeCheckFlag(  );
        return 1;
    }
    case 0x2f0: {  // GraphUnLock
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GraphUnLock( _a0 );
        return 1;
    }
    case 0x2f1: {  // SetUseGraphZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetUseGraphZBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x2f2: {  // CopyGraphZBufferImage
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = CopyGraphZBufferImage( _a0, _a1 );
        return 1;
    }
    case 0x2f3: {  // SetDeviceLostDeleteGraphFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDeviceLostDeleteGraphFlag( _a0, _a1 );
        return 1;
    }
    case 0x2f4: {  // GetGraphMipmapCount
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetGraphMipmapCount( _a0 );
        return 1;
    }
    case 0x2f5: {  // GetGraphFilePath
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = GetGraphFilePath( _a0, _a1_w );
        return 1;
    }
    case 0x2f6: {  // CheckDrawValidGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CheckDrawValidGraph( _a0 );
        return 1;
    }
    case 0x2f7: {  // GetValidRestoreShredPoint
        ctx->stat = GetValidRestoreShredPoint(  );
        return 1;
    }
    case 0x2f8: {  // ResetGraphPalette
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetGraphPalette( _a0 );
        return 1;
    }
    case 0x2f9: {  // BeginAADraw
        ctx->stat = BeginAADraw(  );
        return 1;
    }
    case 0x2fa: {  // EndAADraw
        ctx->stat = EndAADraw(  );
        return 1;
    }
    case 0x2fb: {  // LoadGraphScreen
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        const char *_a2_u8 = hsp3dx_auto_gets();
        wchar_t _a2_w[1024];
        hsp3dx_utf8_to_wide( _a2_u8, _a2_w, 1024 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadGraphScreen( _a0, _a1, _a2_w, _a3 );
        return 1;
    }
    case 0x2fc: {  // DrawRotaGraph2
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
    case 0x2fd: {  // DrawRotaGraph3
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
    case 0x2fe: {  // DrawRotaGraphFast
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
    case 0x2ff: {  // DrawRotaGraphFast2
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
    case 0x300: {  // DrawRotaGraphFast3
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
    case 0x301: {  // DrawTurnGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTurnGraph( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x302: {  // DrawReverseGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawReverseGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x303: {  // DrawGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraphF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x304: {  // DrawExtendGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawExtendGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x305: {  // DrawRotaGraphF
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
    case 0x306: {  // DrawRotaGraph2F
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
    case 0x307: {  // DrawRotaGraph3F
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
    case 0x308: {  // DrawRotaGraphFastF
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
    case 0x309: {  // DrawRotaGraphFast2F
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
    case 0x30a: {  // DrawRotaGraphFast3F
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
    case 0x30b: {  // DrawModiGraphF
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
    case 0x30c: {  // DrawTurnGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawTurnGraphF( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x30d: {  // DrawReverseGraphF
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawReverseGraphF( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x30e: {  // DrawTile
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
    case 0x30f: {  // DrawRectExtendGraph
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
    case 0x310: {  // DrawRectRotaGraph2
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
    case 0x311: {  // DrawRectRotaGraph3
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
    case 0x312: {  // DrawRectRotaGraphFast
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
    case 0x313: {  // DrawRectRotaGraphFast2
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
    case 0x314: {  // DrawRectRotaGraphFast3
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
    case 0x315: {  // DrawRectModiGraph
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
    case 0x316: {  // DrawRectGraphF
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
    case 0x317: {  // DrawRectGraphF2
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
    case 0x318: {  // DrawRectExtendGraphF
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
    case 0x319: {  // DrawRectExtendGraphF2
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
    case 0x31a: {  // DrawRectRotaGraphF
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
    case 0x31b: {  // DrawRectRotaGraph2F
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
    case 0x31c: {  // DrawRectRotaGraph3F
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
    case 0x31d: {  // DrawRectRotaGraphFastF
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
    case 0x31e: {  // DrawRectRotaGraphFast2F
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
    case 0x31f: {  // DrawRectRotaGraphFast3F
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
    case 0x320: {  // DrawRectModiGraphF
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
    case 0x321: {  // DrawBlendGraph
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
    case 0x322: {  // DrawBlendGraphF
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
    case 0x323: {  // DrawBlendGraphPos
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
    case 0x324: {  // DrawCircleGauge
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
    case 0x325: {  // DrawCircleGaugeF
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
    case 0x326: {  // DrawPolygon3D_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygon3D_UseVertexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x327: {  // DrawPolygonIndexed3D_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygonIndexed3D_UseVertexBuffer( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x328: {  // DrawGraph3D
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawGraph3D( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x329: {  // DrawExtendGraph3D
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
    case 0x32a: {  // DrawRotaGraph3D
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
    case 0x32b: {  // DrawRota2Graph3D
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
    case 0x32c: {  // GetDrawMode
        ctx->stat = GetDrawMode(  );
        return 1;
    }
    case 0x32d: {  // SetDrawAlphaTest
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawAlphaTest( _a0, _a1 );
        return 1;
    }
    case 0x32e: {  // SetBlendGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBlendGraph( _a0, _a1, _a2 );
        return 1;
    }
    case 0x32f: {  // SetBlendGraphPosition
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBlendGraphPosition( _a0, _a1 );
        return 1;
    }
    case 0x330: {  // SetDrawAddColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawAddColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x331: {  // SetWriteAlphaChannelFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteAlphaChannelFlag( _a0 );
        return 1;
    }
    case 0x332: {  // GetWriteAlphaChannelFlag
        ctx->stat = GetWriteAlphaChannelFlag(  );
        return 1;
    }
    case 0x333: {  // CheckSeparateAlphaBlendEnable
        ctx->stat = CheckSeparateAlphaBlendEnable(  );
        return 1;
    }
    case 0x334: {  // SetIgnoreDrawGraphColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetIgnoreDrawGraphColor( _a0 );
        return 1;
    }
    case 0x335: {  // GetIgnoreDrawGraphColor
        ctx->stat = GetIgnoreDrawGraphColor(  );
        return 1;
    }
    case 0x336: {  // SetMaxAnisotropy
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaxAnisotropy( _a0 );
        return 1;
    }
    case 0x337: {  // GetMaxAnisotropy
        ctx->stat = GetMaxAnisotropy(  );
        return 1;
    }
    case 0x338: {  // SetUseLarge3DPositionSupport
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLarge3DPositionSupport( _a0 );
        return 1;
    }
    case 0x339: {  // SetUseZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseZBufferFlag( _a0 );
        return 1;
    }
    case 0x33a: {  // SetWriteZBufferFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetWriteZBufferFlag( _a0 );
        return 1;
    }
    case 0x33b: {  // SetZBias
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBias( _a0 );
        return 1;
    }
    case 0x33c: {  // SetZBias3D
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBias3D( _a0 );
        return 1;
    }
    case 0x33d: {  // SetDrawZ
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetDrawZ( _a0 );
        return 1;
    }
    case 0x33e: {  // SetUseReversedZ
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseReversedZ( _a0 );
        return 1;
    }
    case 0x33f: {  // SetDrawArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x340: {  // SetDrawAreaFull
        ctx->stat = SetDrawAreaFull(  );
        return 1;
    }
    case 0x341: {  // SetDraw3DScale
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetDraw3DScale( _a0 );
        return 1;
    }
    case 0x342: {  // RunRestoreShred
        ctx->stat = RunRestoreShred(  );
        return 1;
    }
    case 0x343: {  // ResetTransformTo2D
        ctx->stat = ResetTransformTo2D(  );
        return 1;
    }
    case 0x344: {  // SetDefTransformMatrix
        ctx->stat = SetDefTransformMatrix(  );
        return 1;
    }
    case 0x345: {  // SetUseCullingFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseCullingFlag( _a0 );
        return 1;
    }
    case 0x346: {  // GetUseBackCulling
        ctx->stat = GetUseBackCulling(  );
        return 1;
    }
    case 0x347: {  // SetUseRightHandClippingProcess
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseRightHandClippingProcess( _a0 );
        return 1;
    }
    case 0x348: {  // GetUseRightHandClippingProcess
        ctx->stat = GetUseRightHandClippingProcess(  );
        return 1;
    }
    case 0x349: {  // SetTextureAddressModeUV
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( -1 );
        ctx->stat = SetTextureAddressModeUV( _a0, _a1, _a2 );
        return 1;
    }
    case 0x34a: {  // SetTextureAddressTransform
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
    case 0x34b: {  // ResetTextureAddressTransform
        ctx->stat = ResetTextureAddressTransform(  );
        return 1;
    }
    case 0x34c: {  // SetFogEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFogEnable( _a0 );
        return 1;
    }
    case 0x34d: {  // GetFogEnable
        ctx->stat = GetFogEnable(  );
        return 1;
    }
    case 0x34e: {  // GetFogMode
        ctx->stat = GetFogMode(  );
        return 1;
    }
    case 0x34f: {  // SetFogColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFogColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x350: {  // SetFogStartEnd
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetFogStartEnd( _a0, _a1 );
        return 1;
    }
    case 0x351: {  // SetFogDensity
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetFogDensity( _a0 );
        return 1;
    }
    case 0x352: {  // SetVerticalFogEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVerticalFogEnable( _a0 );
        return 1;
    }
    case 0x353: {  // GetVerticalFogEnable
        ctx->stat = GetVerticalFogEnable(  );
        return 1;
    }
    case 0x354: {  // GetVerticalFogMode
        ctx->stat = GetVerticalFogMode(  );
        return 1;
    }
    case 0x355: {  // SetVerticalFogColor
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVerticalFogColor( _a0, _a1, _a2 );
        return 1;
    }
    case 0x356: {  // SetVerticalFogStartEnd
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVerticalFogStartEnd( _a0, _a1 );
        return 1;
    }
    case 0x357: {  // SetVerticalFogDensity
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVerticalFogDensity( _a0, _a1 );
        return 1;
    }
    case 0x358: {  // GetDrawScreenGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        int _a5 = hsp3dx_auto_geti( 1 );
        ctx->stat = GetDrawScreenGraph( _a0, _a1, _a2, _a3, _a4, _a5 );
        return 1;
    }
    case 0x359: {  // BltDrawValidGraph
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
    case 0x35a: {  // ScreenCopy
        ctx->stat = ScreenCopy(  );
        return 1;
    }
    case 0x35b: {  // WaitVSync
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = WaitVSync( _a0 );
        return 1;
    }
    case 0x35c: {  // ClsDrawScreen
        ctx->stat = ClsDrawScreen(  );
        return 1;
    }
    case 0x35d: {  // GetDrawScreen
        ctx->stat = GetDrawScreen(  );
        return 1;
    }
    case 0x35e: {  // GetActiveGraph
        ctx->stat = GetActiveGraph(  );
        return 1;
    }
    case 0x35f: {  // SetUseSetDrawScreenSettingReset
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSetDrawScreenSettingReset( _a0 );
        return 1;
    }
    case 0x360: {  // GetUseSetDrawScreenSettingReset
        ctx->stat = GetUseSetDrawScreenSettingReset(  );
        return 1;
    }
    case 0x361: {  // SetDrawZBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetDrawZBuffer( _a0 );
        return 1;
    }
    case 0x362: {  // GetUseFullScreenResolutionMode
        ctx->stat = GetUseFullScreenResolutionMode(  );
        return 1;
    }
    case 0x363: {  // SetEmulation320x240
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetEmulation320x240( _a0 );
        return 1;
    }
    case 0x364: {  // SetZBufferSize
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBufferSize( _a0, _a1 );
        return 1;
    }
    case 0x365: {  // SetZBufferBitDepth
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetZBufferBitDepth( _a0 );
        return 1;
    }
    case 0x366: {  // GetWaitVSyncFlag
        ctx->stat = GetWaitVSyncFlag(  );
        return 1;
    }
    case 0x367: {  // SetFullSceneAntiAliasingMode
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFullSceneAntiAliasingMode( _a0, _a1 );
        return 1;
    }
    case 0x368: {  // SetGraphDisplayArea
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphDisplayArea( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x369: {  // SetChangeScreenModeGraphicsSystemResetFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetChangeScreenModeGraphicsSystemResetFlag( _a0 );
        return 1;
    }
    case 0x36a: {  // GetScreenBitDepth
        ctx->stat = GetScreenBitDepth(  );
        return 1;
    }
    case 0x36b: {  // GetColorBitDepth
        ctx->stat = GetColorBitDepth(  );
        return 1;
    }
    case 0x36c: {  // GetChangeDisplayFlag
        ctx->stat = GetChangeDisplayFlag(  );
        return 1;
    }
    case 0x36d: {  // GetRefreshRate
        ctx->stat = GetRefreshRate(  );
        return 1;
    }
    case 0x36e: {  // GetDisplayNum
        ctx->stat = GetDisplayNum(  );
        return 1;
    }
    case 0x36f: {  // GetDisplayModeNum
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetDisplayModeNum( _a0 );
        return 1;
    }
    case 0x370: {  // GetMultiDrawScreenNum
        ctx->stat = GetMultiDrawScreenNum(  );
        return 1;
    }
    case 0x371: {  // GetDrawFloatCoordType
        ctx->stat = GetDrawFloatCoordType(  );
        return 1;
    }
    case 0x372: {  // SetUseNormalDrawShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseNormalDrawShader( _a0 );
        return 1;
    }
    case 0x373: {  // SetUseSoftwareRenderModeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSoftwareRenderModeFlag( _a0 );
        return 1;
    }
    case 0x374: {  // SetNotUse3DFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetNotUse3DFlag( _a0 );
        return 1;
    }
    case 0x375: {  // SetUse3DFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUse3DFlag( _a0 );
        return 1;
    }
    case 0x376: {  // GetUse3DFlag
        ctx->stat = GetUse3DFlag(  );
        return 1;
    }
    case 0x377: {  // SetScreenMemToVramFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetScreenMemToVramFlag( _a0 );
        return 1;
    }
    case 0x378: {  // GetScreenMemToSystemMemFlag
        ctx->stat = GetScreenMemToSystemMemFlag(  );
        return 1;
    }
    case 0x379: {  // RestoreGraphSystem
        ctx->stat = RestoreGraphSystem(  );
        return 1;
    }
    case 0x37a: {  // SetUseHardwareVertexProcessing
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseHardwareVertexProcessing( _a0 );
        return 1;
    }
    case 0x37b: {  // SetUsePixelLighting
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePixelLighting( _a0 );
        return 1;
    }
    case 0x37c: {  // SetUseOldDrawModiGraphCodeFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseOldDrawModiGraphCodeFlag( _a0 );
        return 1;
    }
    case 0x37d: {  // SetUseVramFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseVramFlag( _a0 );
        return 1;
    }
    case 0x37e: {  // GetUseVramFlag
        ctx->stat = GetUseVramFlag(  );
        return 1;
    }
    case 0x37f: {  // SetBasicBlendFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetBasicBlendFlag( _a0 );
        return 1;
    }
    case 0x380: {  // SetUseBasicGraphDraw3DDeviceMethodFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseBasicGraphDraw3DDeviceMethodFlag( _a0 );
        return 1;
    }
    case 0x381: {  // SetUseDisplayIndex
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseDisplayIndex( _a0 );
        return 1;
    }
    case 0x382: {  // RenderVertex
        ctx->stat = RenderVertex(  );
        return 1;
    }
    case 0x383: {  // GetDrawCallCount
        ctx->stat = GetDrawCallCount(  );
        return 1;
    }
    case 0x384: {  // SaveDrawScreenToBMP
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
    case 0x385: {  // SaveDrawScreenToDDS
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
    case 0x386: {  // SaveDrawScreenToJPEG
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
    case 0x387: {  // SaveDrawScreenToPNG
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
    case 0x388: {  // SaveDrawValidGraph
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
    case 0x389: {  // SaveDrawValidGraphToBMP
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
    case 0x38a: {  // SaveDrawValidGraphToDDS
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
    case 0x38b: {  // SaveDrawValidGraphToJPEG
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
    case 0x38c: {  // SaveDrawValidGraphToPNG
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
    case 0x38d: {  // DeleteVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteVertexBuffer( _a0 );
        return 1;
    }
    case 0x38e: {  // InitVertexBuffer
        ctx->stat = InitVertexBuffer(  );
        return 1;
    }
    case 0x38f: {  // UpdateVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateVertexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x390: {  // DeleteIndexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteIndexBuffer( _a0 );
        return 1;
    }
    case 0x391: {  // InitIndexBuffer
        ctx->stat = InitIndexBuffer(  );
        return 1;
    }
    case 0x392: {  // UpdateIndexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateIndexBuffer( _a0, _a1, _a2 );
        return 1;
    }
    case 0x393: {  // GetMaxPrimitiveCount
        ctx->stat = GetMaxPrimitiveCount(  );
        return 1;
    }
    case 0x394: {  // GetMaxVertexIndex
        ctx->stat = GetMaxVertexIndex(  );
        return 1;
    }
    case 0x395: {  // GetValidShaderVersion
        ctx->stat = GetValidShaderVersion(  );
        return 1;
    }
    case 0x396: {  // LoadVertexShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadVertexShader( _a0_w );
        return 1;
    }
    case 0x397: {  // LoadGeometryShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadGeometryShader( _a0_w );
        return 1;
    }
    case 0x398: {  // LoadPixelShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadPixelShader( _a0_w );
        return 1;
    }
    case 0x399: {  // DeleteShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShader( _a0 );
        return 1;
    }
    case 0x39a: {  // InitShader
        ctx->stat = InitShader(  );
        return 1;
    }
    case 0x39b: {  // GetConstIndexToShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetConstIndexToShader( _a0_w, _a1 );
        return 1;
    }
    case 0x39c: {  // GetConstCountToShader
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetConstCountToShader( _a0_w, _a1 );
        return 1;
    }
    case 0x39d: {  // SetVSConstSF
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetVSConstSF( _a0, _a1 );
        return 1;
    }
    case 0x39e: {  // SetVSConstSI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetVSConstSI( _a0, _a1 );
        return 1;
    }
    case 0x39f: {  // ResetVSConstF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstF( _a0, _a1 );
        return 1;
    }
    case 0x3a0: {  // ResetVSConstI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstI( _a0, _a1 );
        return 1;
    }
    case 0x3a1: {  // ResetVSConstB
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetVSConstB( _a0, _a1 );
        return 1;
    }
    case 0x3a2: {  // SetPSConstSF
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetPSConstSF( _a0, _a1 );
        return 1;
    }
    case 0x3a3: {  // SetPSConstSI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetPSConstSI( _a0, _a1 );
        return 1;
    }
    case 0x3a4: {  // ResetPSConstF
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstF( _a0, _a1 );
        return 1;
    }
    case 0x3a5: {  // ResetPSConstI
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstI( _a0, _a1 );
        return 1;
    }
    case 0x3a6: {  // ResetPSConstB
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ResetPSConstB( _a0, _a1 );
        return 1;
    }
    case 0x3a7: {  // SetRenderTargetToShader
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetRenderTargetToShader( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3a8: {  // SetUseTextureToShader
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseTextureToShader( _a0, _a1 );
        return 1;
    }
    case 0x3a9: {  // SetUseVertexShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseVertexShader( _a0 );
        return 1;
    }
    case 0x3aa: {  // SetUseGeometryShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseGeometryShader( _a0 );
        return 1;
    }
    case 0x3ab: {  // SetUsePixelShader
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUsePixelShader( _a0 );
        return 1;
    }
    case 0x3ac: {  // DrawPolygon3DToShader_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygon3DToShader_UseVertexBuffer( _a0 );
        return 1;
    }
    case 0x3ad: {  // DrawPolygonIndexed3DToShader_UseVertexBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawPolygonIndexed3DToShader_UseVertexBuffer( _a0, _a1 );
        return 1;
    }
    case 0x3ae: {  // InitShaderConstantBuffer
        ctx->stat = InitShaderConstantBuffer(  );
        return 1;
    }
    case 0x3af: {  // CreateShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = CreateShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x3b0: {  // DeleteShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x3b1: {  // UpdateShaderConstantBuffer
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateShaderConstantBuffer( _a0 );
        return 1;
    }
    case 0x3b2: {  // SetGraphBlendScalingFilterMode
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetGraphBlendScalingFilterMode( _a0 );
        return 1;
    }
    case 0x3b3: {  // PlayMovie
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = PlayMovie( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x3b4: {  // OpenMovieToGraph
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 1 );
        ctx->stat = OpenMovieToGraph( _a0_w, _a1 );
        return 1;
    }
    case 0x3b5: {  // SeekMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SeekMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3b6: {  // SetPlaySpeedRateMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetPlaySpeedRateMovieToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3b7: {  // GetMovieStateToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieStateToGraph( _a0 );
        return 1;
    }
    case 0x3b8: {  // SetMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieVolumeToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3b9: {  // GetMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieVolumeToGraph( _a0 );
        return 1;
    }
    case 0x3ba: {  // ChangeMovieVolumeToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeMovieVolumeToGraph( _a0, _a1 );
        return 1;
    }
    case 0x3bb: {  // GetMovieVolumeToGraph2
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieVolumeToGraph2( _a0 );
        return 1;
    }
    case 0x3bc: {  // GetMovieTotalFrameToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMovieTotalFrameToGraph( _a0 );
        return 1;
    }
    case 0x3bd: {  // TellMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = TellMovieToGraph( _a0 );
        return 1;
    }
    case 0x3be: {  // TellMovieToGraphToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = TellMovieToGraphToFrame( _a0 );
        return 1;
    }
    case 0x3bf: {  // SeekMovieToGraphToFrame
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SeekMovieToGraphToFrame( _a0, _a1 );
        return 1;
    }
    case 0x3c0: {  // GetLastUpdateTimeMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLastUpdateTimeMovieToGraph( _a0 );
        return 1;
    }
    case 0x3c1: {  // UpdateMovieToGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = UpdateMovieToGraph( _a0 );
        return 1;
    }
    case 0x3c2: {  // SetMovieRightImageAlphaFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieRightImageAlphaFlag( _a0 );
        return 1;
    }
    case 0x3c3: {  // SetMovieColorA8R8G8B8Flag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieColorA8R8G8B8Flag( _a0 );
        return 1;
    }
    case 0x3c4: {  // SetMovieUseYUVFormatSurfaceFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMovieUseYUVFormatSurfaceFlag( _a0 );
        return 1;
    }
    case 0x3c5: {  // SetCameraNearFar
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraNearFar( _a0, _a1 );
        return 1;
    }
    case 0x3c6: {  // SetCameraNearFarD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraNearFarD( _a0, _a1 );
        return 1;
    }
    case 0x3c7: {  // SetCameraScreenCenter
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraScreenCenter( _a0, _a1 );
        return 1;
    }
    case 0x3c8: {  // SetCameraScreenCenterD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        double _a1 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraScreenCenterD( _a0, _a1 );
        return 1;
    }
    case 0x3c9: {  // SetupCamera_PerspectiveD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_PerspectiveD( _a0 );
        return 1;
    }
    case 0x3ca: {  // SetupCamera_Ortho
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_Ortho( _a0 );
        return 1;
    }
    case 0x3cb: {  // SetupCamera_OrthoD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetupCamera_OrthoD( _a0 );
        return 1;
    }
    case 0x3cc: {  // SetCameraDotAspect
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraDotAspect( _a0 );
        return 1;
    }
    case 0x3cd: {  // SetCameraDotAspectD
        double _a0 = hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetCameraDotAspectD( _a0 );
        return 1;
    }
    case 0x3ce: {  // SetMaterialUseVertDifColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaterialUseVertDifColor( _a0 );
        return 1;
    }
    case 0x3cf: {  // SetMaterialUseVertSpcColor
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaterialUseVertSpcColor( _a0 );
        return 1;
    }
    case 0x3d0: {  // SetUseSpecular
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseSpecular( _a0 );
        return 1;
    }
    case 0x3d1: {  // SetUseLightAngleAttenuation
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseLightAngleAttenuation( _a0 );
        return 1;
    }
    case 0x3d2: {  // SetUseHalfLambertLighting
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseHalfLambertLighting( _a0 );
        return 1;
    }
    case 0x3d3: {  // GetLightType
        ctx->stat = GetLightType(  );
        return 1;
    }
    case 0x3d4: {  // SetLightEnable
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightEnable( _a0 );
        return 1;
    }
    case 0x3d5: {  // GetLightEnable
        ctx->stat = GetLightEnable(  );
        return 1;
    }
    case 0x3d6: {  // SetLightRangeAtten
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightRangeAtten( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3d7: {  // SetLightAngle
        float _a0 = (float)hsp3dx_auto_getd( 0.0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightAngle( _a0, _a1 );
        return 1;
    }
    case 0x3d8: {  // SetLightUseShadowMap
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightUseShadowMap( _a0, _a1 );
        return 1;
    }
    case 0x3d9: {  // DeleteLightHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteLightHandle( _a0 );
        return 1;
    }
    case 0x3da: {  // DeleteLightHandleAll
        ctx->stat = DeleteLightHandleAll(  );
        return 1;
    }
    case 0x3db: {  // SetLightTypeHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightTypeHandle( _a0, _a1 );
        return 1;
    }
    case 0x3dc: {  // SetLightEnableHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightEnableHandle( _a0, _a1 );
        return 1;
    }
    case 0x3dd: {  // SetLightRangeAttenHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        float _a3 = (float)hsp3dx_auto_getd( 0.0 );
        float _a4 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightRangeAttenHandle( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x3de: {  // SetLightAngleHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        float _a1 = (float)hsp3dx_auto_getd( 0.0 );
        float _a2 = (float)hsp3dx_auto_getd( 0.0 );
        ctx->stat = SetLightAngleHandle( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3df: {  // SetLightUseShadowMapHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetLightUseShadowMapHandle( _a0, _a1, _a2 );
        return 1;
    }
    case 0x3e0: {  // GetLightTypeHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLightTypeHandle( _a0 );
        return 1;
    }
    case 0x3e1: {  // GetLightEnableHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetLightEnableHandle( _a0 );
        return 1;
    }
    case 0x3e2: {  // GetEnableLightHandleNum
        ctx->stat = GetEnableLightHandleNum(  );
        return 1;
    }
    case 0x3e3: {  // GetEnableLightHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetEnableLightHandle( _a0 );
        return 1;
    }
    case 0x3e4: {  // CreateMaskScreen
        ctx->stat = CreateMaskScreen(  );
        return 1;
    }
    case 0x3e5: {  // DeleteMaskScreen
        ctx->stat = DeleteMaskScreen(  );
        return 1;
    }
    case 0x3e6: {  // SetUseMaskScreenFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetUseMaskScreenFlag( _a0 );
        return 1;
    }
    case 0x3e7: {  // GetUseMaskScreenFlag
        ctx->stat = GetUseMaskScreenFlag(  );
        return 1;
    }
    case 0x3e8: {  // FillMaskScreen
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = FillMaskScreen( _a0 );
        return 1;
    }
    case 0x3e9: {  // SetMaskScreenGraph
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaskScreenGraph( _a0 );
        return 1;
    }
    case 0x3ea: {  // InitMask
        ctx->stat = InitMask(  );
        return 1;
    }
    case 0x3eb: {  // MakeMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = MakeMask( _a0, _a1 );
        return 1;
    }
    case 0x3ec: {  // DeleteMask
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteMask( _a0 );
        return 1;
    }
    case 0x3ed: {  // LoadMask
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        ctx->stat = LoadMask( _a0_w );
        return 1;
    }
    case 0x3ee: {  // DrawMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawMask( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3ef: {  // DrawStringMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        const char *_a3_u8 = hsp3dx_auto_gets();
        wchar_t _a3_w[1024];
        hsp3dx_utf8_to_wide( _a3_u8, _a3_w, 1024 );
        ctx->stat = DrawStringMask( _a0, _a1, _a2, _a3_w );
        return 1;
    }
    case 0x3f0: {  // DrawStringMaskToHandle
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
    case 0x3f1: {  // DrawFillMask
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = DrawFillMask( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x3f2: {  // SetMaskReverseEffectFlag
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetMaskReverseEffectFlag( _a0 );
        return 1;
    }
    case 0x3f3: {  // GetMaskScreenData
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        int _a4 = hsp3dx_auto_geti( 0 );
        ctx->stat = GetMaskScreenData( _a0, _a1, _a2, _a3, _a4 );
        return 1;
    }
    case 0x3f4: {  // GetMaskUseFlag
        ctx->stat = GetMaskUseFlag(  );
        return 1;
    }
    case 0x3f5: {  // EnumFontName
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 1 );
        ctx->stat = EnumFontName( _a0_w, _a1, _a2 );
        return 1;
    }
    case 0x3f6: {  // InitFontToHandle
        ctx->stat = InitFontToHandle(  );
        return 1;
    }
    case 0x3f7: {  // LoadFontDataToHandle
        const char *_a0_u8 = hsp3dx_auto_gets();
        wchar_t _a0_w[1024];
        hsp3dx_utf8_to_wide( _a0_u8, _a0_w, 1024 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = LoadFontDataToHandle( _a0_w, _a1 );
        return 1;
    }
    case 0x3f8: {  // SetFontSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontSpaceToHandle( _a0, _a1 );
        return 1;
    }
    case 0x3f9: {  // SetFontLineSpaceToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SetFontLineSpaceToHandle( _a0, _a1 );
        return 1;
    }
    case 0x3fa: {  // DeleteFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = DeleteFontToHandle( _a0 );
        return 1;
    }
    case 0x3fb: {  // AddFontImageToHandle
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
    case 0x3fc: {  // SubFontImageToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        const char *_a1_u8 = hsp3dx_auto_gets();
        wchar_t _a1_w[1024];
        hsp3dx_utf8_to_wide( _a1_u8, _a1_w, 1024 );
        ctx->stat = SubFontImageToHandle( _a0, _a1_w );
        return 1;
    }
    case 0x3fd: {  // AddSubstitutionFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        int _a2 = hsp3dx_auto_geti( 0 );
        int _a3 = hsp3dx_auto_geti( 0 );
        ctx->stat = AddSubstitutionFontToHandle( _a0, _a1, _a2, _a3 );
        return 1;
    }
    case 0x3fe: {  // SubSubstitutionFontToHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        int _a1 = hsp3dx_auto_geti( 0 );
        ctx->stat = SubSubstitutionFontToHandle( _a0, _a1 );
        return 1;
    }
    case 0x3ff: {  // ChangeFontFromHandle
        int _a0 = hsp3dx_auto_geti( 0 );
        ctx->stat = ChangeFontFromHandle( _a0 );
        return 1;
    }
    }
    return 0;   // 未処理 → 呼び出し側で HSPERR_UNSUPPORTED_FUNCTION 投げる
}
