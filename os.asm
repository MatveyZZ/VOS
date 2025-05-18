org 0x7c00

jmp pre_boot

pre_boot:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    
    mov ah, 0x02
    mov al, 7   ; ������⢮ ᥪ�஢ �� �⥭��
    mov ch, 0x00
    mov cl, 0x02
    mov dh, 0x00
    mov dl, 0x80
    mov bx, 0x7e00
    int 0x13       ; ���뢠��� �⥭�� ᥪ��
    jc read_error

    jmp 0x7e00    ; ���室 � ����㦥����� ����

read_error:
    mov ah, 0x0e
    mov al, 'R'
    int 0x10
    mov al, 'E'
    int 0x10
    mov al, 'A'
    int 0x10
    mov al, 'D'
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 'E'
    int 0x10
    mov al, 'R'
    int 0x10
    mov al, 'R'
    int 0x10
    mov al, 'O'
    int 0x10
    mov al, 'R'
    int 0x10
    mov al, '!'
    int 0x10

    jmp $

times 510 - ($- $$) db 0
dw 0xAA55

jmp boot

boot:
    call cls
    call IBM_WELCOME_WINDOW
    call cls
    mov si, welcome
    call out_string
    jmp input_loop

IBM_WELCOME_WINDOW:
    mov si, IBM_WELCOME
    call out_string

    mov ax, 0x8600
    mov cx, 30
    int 0x15
    ret

input_loop:

    mov si, buffer
    mov bx, 255
    call clear_buffer

    mov si, prompt
    call out_string

    mov si, buffer
    call in_string

    jmp OS_callback

    jmp input_loop

OS_callback:
    mov si, help_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_HELP

    mov si, cls_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_CLS

    mov si, info_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_INFO

    mov si, reboot_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_REBOOT

    mov si, echo_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_ECHO

    mov si, fuck_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_FUCK

    mov si, game_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_GAME

    jne Callback_WRONG
    jmp input_loop

Callback_HELP:
    mov si, help_out
    call out_string
    jmp input_loop
Callback_CLS:
    call cls
    jmp input_loop

Callback_WRONG:
    mov si, wrong_command_1
    call out_string
    mov si, buffer
    call out_string
    mov si, wrong_command_2
    call out_string
    jmp input_loop

Callback_INFO:
    mov si, info_out
    call out_string
    jmp input_loop

Callback_REBOOT:
    mov ah, 0
    int 0x19
    jmp $

Callback_ECHO:
    mov si, echo_out
    call out_string
    mov si, buffer
    call in_string

    mov si, buffer
    call out_string

    call new_line
    
    jmp input_loop

Callback_FUCK:
    mov si, fuck_out
    call out_string
    jmp input_loop

Callback_GAME:
    call _start
    jmp input_loop

%include "io.asm"
%include "game.asm"
;welcome db "Welcome to FuckingOS!", 0x0a, 0x0d, "Type 'help' to get fucking command list!", 0x0a, 0x0d, 0
welcome db "Welcome to FuckingOS!", 0x0a, 0x0d, "P.S. -I fucked in my mouth doing this OS:(", 0x0a, 0x0d, "Type 'help' to get fucking command list!", 0x0a, 0x0d, 0
prompt db "WTF@cd:>", 0

wrong_command_1 db "FuckingCommand: '", 0
wrong_command_2 db "' not found. Type 'help' to get all fucking commands", 0x0a, 0x0d, 0
echo_out db "Echo: ", 0

help_in db "help", 0
cls_in db "cls", 0
info_in db "info", 0
reboot_in db "reboot", 0
echo_in db "echo", 0
fuck_in db "fuck", 0
game_in db "game", 0

; info_out db "FuckingOS x16 (Terminal Operation System 16-bit) v.0.0:", 0x0a, 0x0d, "        It's an operating system under development, fuck, I'm already fucking sick of it..", 0x0a, 0x0d, "         Author: Fucking Matvey.", 0x0a, 0x0d, "          Made in Holy Russia!", 0x0a, 0x0d, 0
; help_out db "          cls - Clear screen", 0x0a, 0x0d, "         info - Get system info", 0x0a, 0x0d, "        reboot - Reboot computer", 0x0a, 0x0d, "       echo - Write text in screen", 0x0a, 0x0d, "       fuck - Fuck you", 0x0a, 0x0d, 0
info_out db "FuckingOS x16 (Terminal Operation System 16-bit) v.0.0:", 0x0a, 0x0d,"It's an operating system under development, fuck, I'm already fucking sick of it", 0x0a, 0x0d,"Author: Fucking Matvey.", 0x0a, 0x0d,"Made in Holy Russia!", 0x0a, 0x0d, 0
help_out db "          cls - Clear screen", 0x0a, 0x0d,"          info - Get system info", 0x0a, 0x0d,"          reboot - Reboot computer", 0x0a, 0x0d,"          echo - Write text in screen", 0x0a, 0x0d,"          fuck - Fuck you", 0x0a, 0x0d, "          game - play game", 0x0a, 0x0d, 0
fuck_out db "Fuck you, Chuvaaaaak!!!!!!! Говно", 0x0a, 0x0d, 0

;IBM_WELCOME db "                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"              ======== ========    ======          =======                     ", 0x0a, 0x0d,"              ======== =========   ========       ========                     ", 0x0a, 0x0d,"                ===       ==  ===    =======     =======                       ", 0x0a, 0x0d,"                ===       ======     ========   ========                       ", 0x0a, 0x0d,"                ===       ======     ==  ===== =====  ==                       ", 0x0a, 0x0d,"                ===       ==  ===    ==   =========   ==                       ", 0x0a, 0x0d,"              ======== =========  =====    =======    =====                    ", 0x0a, 0x0d,"              ======== ========   =====       =       =====                    ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d," (C) COPYRIGHT 1981, 1996 IBM CORPARATION - ALL RIGHTS RESERVED                ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d, 0
IBM_WELCOME db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@", 0x0a, 0x0d,"@1             1             1             1             1             1      @", 0x0a, 0x0d,"@ 2           2 2           2 2           2 2           2 2           2 2     @", 0x0a, 0x0d,"@  3         3   3         3   3         3   3         3   3         3   3    @", 0x0a, 0x0d,"@   4       4     4       4     4       4     4       4     4       4     4   @", 0x0a, 0x0d,"@    5     5       5     5       5     5       5     5       5     5       5  @", 0x0a, 0x0d,"@     6   6         6   6         6   6         6   6         6   6         6 @", 0x0a, 0x0d,"@      7 7           7 7           7 7           7 7           7 7           7@", 0x0a, 0x0d,"@       8             8             8             8             8             @", 0x0a, 0x0d,"@                                                                             @", 0x0a, 0x0d,"@                       ==         == ======== ========                       @", 0x0a, 0x0d,"@                       ==    =    == ======== ========                       @", 0x0a, 0x0d,"@                       ==   ===   ==    ==    ==                             @", 0x0a, 0x0d,"@                        ==  ===  ==     ==    ==                             @", 0x0a, 0x0d,"@                        == == == ==     ==    =====                          @", 0x0a, 0x0d,"@                        == == == ==     ==    =====                          @", 0x0a, 0x0d,"@                         ===   ===      ==    ==                             @", 0x0a, 0x0d,"@                         ===   ===      ==    ==                             @", 0x0a, 0x0d,"@                                                                             @", 0x0a, 0x0d,"@_____________________________________________________________________________@", 0x0a, 0x0d,"@-----(C) COPYRIGHT 1488, 2025 WTF CORPORATION - ALL RIGHTS ARE FUCKED UP-----@", 0x0a, 0x0d,"@_____________________________________________________________________________@", 0x0a, 0x0d,"@                                    8===D                                    @", 0x0a, 0x0d,"@                                    8===D                                    @", 0x0a, 0x0d,"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@", 0x0a, 0x0d, 0

buffer times 255 db 0