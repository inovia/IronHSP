;
; hspdxlib_macro.as - HSP-friendly convenience macros for DxLib
; Auto-generated from DxDLLW.cs (DxLib 3.24f)
;
; Usage: #include "hspdxlib.as"
;        #include "hspdxlib_macro.as"
;

#ifndef __HSPDXLIB_MACRO__
#define global __HSPDXLIB_MACRO__

; --- HSP-friendly short aliases ---
#define global dxinit DxLib_Init	; DXライブラリの初期化
#define global dxend DxLib_End	; DXライブラリの終了処理
#define global dxmsg ProcessMessage	; メッセージ処理
#define global dxflip ScreenFlip	; 画面フリップ
#define global dxcls ClearDrawScreen	; 描画画面クリア
#define global dxscreen SetDrawScreen	; 描画先設定
#define global dxwait WaitTimer	; ウェイト
#define global dxdraw DrawGraph	; 画像描画
#define global dxdrawex DrawExtendGraph	; 画像拡大縮小描画
#define global dxdrawrota DrawRotaGraph	; 画像回転描画
#define global dxload LoadGraph	; 画像読込
#define global dxfree DeleteGraph	; 画像解放
#define global dxcolor GetColor	; 色コード取得
#define global dxtitle SetMainWindowText	; タイトル設定
#define global dxwindow ChangeWindowMode	; ウィンドウモード変更
#define global dxmode SetGraphMode	; 画面モード設定
#define global dxkey CheckHitKey	; キー入力チェック
#define global dxmouse GetMousePoint	; マウス座標取得
#define global dxclick GetMouseInput	; マウスボタン取得
#define global dxloadsnd LoadSoundMem	; 音声読込
#define global dxplaysnd PlaySoundMem	; 音声再生
#define global dxstopsnd StopSoundMem	; 音声停止
#define global dxfreesnd DeleteSoundMem	; 音声解放
#define global dxfontsize SetFontSize	; フォントサイズ設定
#define global dxbox DrawBox	; 矩形描画
#define global dxline DrawLine	; 線描画
#define global dxcircle DrawCircle	; 円描画
#define global dxpset DrawPixel	; 点描画
#define global dxbgcolor SetBackgroundColor	; 背景色設定
#define global dxblend SetDrawBlendMode	; ブレンドモード設定
#define global dxpad GetJoypadInputState	; パッド入力取得

; --- Vector helper macros ---
; VGet: Create a VECTOR in a buffer
; Usage: dxvec buf, 1.0, 2.0, 3.0
#define global dxvec(%1,%2,%3,%4) sdim %1, VECTOR_SIZE : memcpy_f %1, VECTOR_x, %2 : memcpy_f %1, VECTOR_y, %3 : memcpy_f %1, VECTOR_z, %4

; --- Convenience initialization ---
; dxinit_window: Initialize with window mode
; Usage: dxinit_window "My Game", 800, 600
#define global dxinit_window(%1,%2,%3) ChangeWindowMode TRUE : SetGraphMode %2, %3, 32 : SetMainWindowText %1 : DxLib_Init : SetDrawScreen DX_SCREEN_BACK

; --- Main loop helpers ---
; Usage:
;   dxinit_window "Test", 640, 480
;   *main
;   ClearDrawScreen
;   ; ... draw ...
;   ScreenFlip
;   if ProcessMessage() == 0 : goto *main
;   DxLib_End

#endif ; __HSPDXLIB_MACRO__
