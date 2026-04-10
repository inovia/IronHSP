; 64-bit 'CallFunc'
;
; LICENCE: Public domain

OPTION CASEMAP: NONE

PUBLIC CallFunc64
PUBLIC CallFunc64_Double
PUBLIC CallFunc64_Float

.CODE

; [CallFunc64]
;
; The 'CallFunc64' function calls the sppecified function with the specified array as arguments.
;
; [Syntax]
;
; INT_PTR CallFunc64(INT_PTR const *arguments, FARPROC external_function, int number_Of_arguments);
; INT32 CallFunc64(INT_PTR const *arguments, FARPROC external_function, int number_Of_arguments);
; double CallFunc64(INT_PTR const *arguments, FARPROC external_function, int number_of_arguments);
;
; [Parameters]
;
; INT_PTR const *arguments [in, optional]
;     Points to the array used as arguments to the function of 'externalFunction'. If 'numberOfArguments' is set to a negative value or zero, the function makes no use of the parameter.
;
; FARPROC external_function [in]
;     Points to the function to call with the array of 'arguments' as arguments.
;
; int number_of_arguments [in]
;     Represents the number of elements in the array of 'arguments'.
;
; [Return value]
;
; The return value is directly from the function of 'externalFunction'.
;
; [Remarks]
;
; If 'numberOfParameters' is set to a negative value, the behavior is the same as when the parameter is set to zero; the function of 'externalFunction' is then assumed not to receive any parameter.
; The behavior is undefined if the array of 'arguments' is not proper as arguments for the function of 'externalFunction'.

CallFunc64 PROC FRAME

    mov rax, rdx ; Save the value of 'external_function' to rax

    ; Directly go to the function of 'external_function' if it does not receive any parameter

    mov edx, r8d
    test edx, edx
    jg short @has_args

        jmp rax

    @has_args:

    push rbp
    .PUSHREG rbp

    mov rbp, rsp
    .SETFRAME rbp, 0

    .ENDPROLOG

    sal edx, 3 ; edx = number_of_arguments * sizeof(INT_PTR)

    ; Align the stack to 16 bytes and allocate at least 32 bytes

    sub edx, 8 * 4
    @if00:
    jge short @else00

        neg edx
        jmp short @end_if00

    @else00:

        and edx, 8

    @end_if00:

    sub rsp, rdx

    ; Prepare arguments

    @do00:

       dec r8d
       push qword ptr [rcx + r8 * 8]

       jg @do00

    @until00:

    pop rcx
    pop rdx
    pop r8
    pop r9

    movd xmm0, rcx
    movd xmm1, rdx
    movd xmm2, r8
    movd xmm3, r9

    ; cmp rsp, rbp

    ; Call the function of 'external_function'

    sub rsp, 8 * 4
    call rax

    leave
    ret

CallFunc64 ENDP


; CallFunc64_Double: double 戻り値の DLL 関数を呼び出す
; XMM0 の double ビットパターンを RAX に転送して返す
CallFunc64_Double PROC FRAME

    mov rax, rdx
    mov edx, r8d
    test edx, edx
    jg short @d_has_args

        jmp rax

    @d_has_args:

    push rbp
    .PUSHREG rbp
    mov rbp, rsp
    .SETFRAME rbp, 0
    .ENDPROLOG

    sal edx, 3
    sub edx, 8 * 4
    @d_if00:
    jge short @d_else00
        neg edx
        jmp short @d_end_if00
    @d_else00:
        and edx, 8
    @d_end_if00:
    sub rsp, rdx

    @d_do00:
       dec r8d
       push qword ptr [rcx + r8 * 8]
       jg @d_do00
    @d_until00:

    pop rcx
    pop rdx
    pop r8
    pop r9
    movd xmm0, rcx
    movd xmm1, rdx
    movd xmm2, r8
    movd xmm3, r9

    sub rsp, 8 * 4
    call rax

    ; double 戻り値: XMM0 → RAX
    movq rax, xmm0

    leave
    ret

CallFunc64_Double ENDP


; CallFunc64_Float: float 戻り値の DLL 関数を呼び出す
; XMM0 の float ビットパターンを EAX に転送して返す
CallFunc64_Float PROC FRAME

    mov rax, rdx
    mov edx, r8d
    test edx, edx
    jg short @f_has_args

        jmp rax

    @f_has_args:

    push rbp
    .PUSHREG rbp
    mov rbp, rsp
    .SETFRAME rbp, 0
    .ENDPROLOG

    sal edx, 3
    sub edx, 8 * 4
    @f_if00:
    jge short @f_else00
        neg edx
        jmp short @f_end_if00
    @f_else00:
        and edx, 8
    @f_end_if00:
    sub rsp, rdx

    @f_do00:
       dec r8d
       push qword ptr [rcx + r8 * 8]
       jg @f_do00
    @f_until00:

    pop rcx
    pop rdx
    pop r8
    pop r9
    movd xmm0, rcx
    movd xmm1, rdx
    movd xmm2, r8
    movd xmm3, r9

    sub rsp, 8 * 4
    call rax

    ; float 戻り値: XMM0 → EAX (下位32bit)
    movd eax, xmm0

    leave
    ret

CallFunc64_Float ENDP


END