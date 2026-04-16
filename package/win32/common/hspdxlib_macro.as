;
; hspdxlib_macro.as — DxLib 用 HSP 便利マクロ
; DxDLLW.cs (DxLib 3.24f) から自動生成
;
; Usage: #include "hspdxlib.as"
;        #include "hspdxlib_macro.as"
;

#ifndef __HSPDXLIB_MACRO__
#define global __HSPDXLIB_MACRO__

; --- HSP-friendly short aliases ---
#define global dxinit DxLib_Init	; DX���C�u�����̏�����
#define global dxend DxLib_End	; DX���C�u�����̏I������
#define global dxmsg ProcessMessage	; ���b�Z�[�W����
#define global dxflip ScreenFlip	; ��ʃt���b�v
#define global dxcls ClearDrawScreen	; �`���ʃN���A
#define global dxscreen SetDrawScreen	; �`���ݒ�
#define global dxwait WaitTimer	; �E�F�C�g
#define global dxdraw DrawGraph	; �摜�`��
#define global dxdrawex DrawExtendGraph	; �摜�g��k���`��
#define global dxdrawrota DrawRotaGraph	; �摜��]�`��
#define global dxload LoadGraph	; �摜�Ǎ�
#define global dxdel DeleteGraph	; �摜���
#define global dxcolor GetColor	; �F�R�[�h�擾
#define global dxtitle SetMainWindowText	; �^�C�g���ݒ�
#define global dxwindow ChangeWindowMode	; �E�B���h�E���[�h�ύX
#define global dxmode SetGraphMode	; ��ʃ��[�h�ݒ�
#define global dxkey CheckHitKey	; �L�[���̓`�F�b�N
#define global dxmouse GetMousePoint	; �}�E�X���W�擾
#define global dxclick GetMouseInput	; �}�E�X�{�^���擾
#define global dxloadsnd LoadSoundMem	; �����Ǎ�
#define global dxplaysnd PlaySoundMem	; �����Đ�
#define global dxstopsnd StopSoundMem	; ������~
#define global dxfreesnd DeleteSoundMem	; �������
#define global dxfontsize SetFontSize	; �t�H���g�T�C�Y�ݒ�
#define global dxbox DrawBox	; ��`�`��
#define global dxline DrawLine	; ���`��
#define global dxcircle DrawCircle	; �~�`��
#define global dxpset DrawPixel	; �_�`��
#define global dxbgcolor SetBackgroundColor	; �w�i�F�ݒ�
#define global dxblend SetDrawBlendMode	; �u�����h���[�h�ݒ�
#define global dxpad GetJoypadInputState	; �p�b�h���͎擾

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
