org 0x7c00

jmp pre_boot

pre_boot:
    cli         ; Запрещаем прерывания
    xor ax, ax  ; Зануляем регистры
    mov ds, ax  ; Зануляем регистры
    mov es, ax  ; Зануляем регистры
    mov ss, ax  ; Зануляем регистры
    mov sp, 0x7c00
    ; Чтение и размещение операционной системы в ОЗУ
    mov ah, 0x02; Функция 0x02 - Работа с жёстким диском
    mov al, 15   ; Количество секторов на чтение.
    mov ch, 0x00   ; Номер цилиндра
    mov cl, 0x02   ; Номер начального сектора 2. 1 сектор - загрузчик, 2 сектор - ОС.
    mov dh, 0x00   ; Сторона диска
    mov dl, 0x80   ; Номер устройства. Начинается с 0x80 - 0, 0x81 - 1, ...
    mov bx, 0x7e00 ; Адрес загрузки данных
    int 0x13       ; Прерывание чтения сектора
    jc read_error  ; Если возникает ошибка, переходим к выполнению куска кода read_error.

    jmp 0x7e00    ; Если ошибок не возникло, то переходим к загруженному коду. 0x7c00 + 512 = 0x7e00

read_error:
    mov ah, 0x0e ; Номер функции в прерывании 0x10, вывод символа на экран.
    mov al, 'R'  ; Загружаем символ
    int 0x10     ; Выводим символ
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

    jmp $        ; Бесконечный переход к этой метке. Зависаем на месте с выводом ошибки.

times 510 - ($ - $$) db 0 ; Заполняем оставшуюся часть кода нулями.
dw 0xaa55 ; Магическое число в конце сектора.

jmp boot

boot:
    call cls                 ; Очищаем экран
    call IBM_WELCOME_WINDOW  ; Вызываем функцию вывода логотипа IBM
    call cls                 ; Очищаем экран
    mov si, welcome
    call out_string          ; Выводим приветственное сообщение
    jmp input_loop           ; Переходим к выполнению цикла пользовательского ввода

IBM_WELCOME_WINDOW:
    mov si, IBM_WELCOME
    call out_string

    mov ax, 0x8600  ; Время ожидания, в мс
    mov cx, 30      ; Номер функции 30 - ожидание
    int 0x15        ; Вызываем 0x15 прерывание для ожидания
    ret

input_loop:

    mov si, buffer
    mov bx, 512 ;256
    call clear_buffer ; Очищаем буфер от пользовательского ввода

    mov si, prompt  
    call out_string   ; Выводим live@cd>

    mov si, buffer    
    call in_string    ; Даём пользователю возможность ввода команды

    jmp OS_callback   ; Проверяем что ввёл пользователь

    jmp input_loop    ; Повторяем цикл

OS_callback:
    mov si, help_in
    mov bx, buffer
    call comapre_strs   ; Проверяем пользовательский ввод с help
    cmp cx, 1
    je Callback_HELP    ; Если пользователь ввёл help, то прыгаем в Callback_HELP

    mov si, cls_in      ; Проверяем пользовательский ввод с cls
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_CLS     ; Если пользователь ввёл cls, то прыгаем в Callback_CLS

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

    mov si, background_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_BACKGROUND

    mov si, color_Blue_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Blue

    mov si, color_Green_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Green

    mov si, color_Cyan_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Cyan

    mov si, color_Red_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Red

    mov si, color_Magenta_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Magenta

    mov si, color_Light_Gray_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Light_Gray

    mov si, color_Dark_Gray_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Dark_Gray

    mov si, color_Light_Blue_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Light_Blue

    mov si, color_Light_Green_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Light_Green

    mov si, color_Light_Cyan_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Light_Cyan

    mov si, color_Light_Red_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Light_Red

    mov si, color_Light_Magenta_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Light_Magenta

    mov si, color_Brown_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Brown

    mov si, color_Yellow_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_color_Yellow

    mov si, zodiac_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_ZODIAC

    mov si, Aries_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Aries

    mov si, Taurus_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Taurus

    mov si, Gemini_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Gemini

    mov si, Cancer_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Cancer

    mov si, Leo_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Leo

    mov si, Virgo_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Virgo

    mov si, Libra_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Libra

    mov si, Scorpius_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Scorpius

    mov si, Sagittarius_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Sagittarius

    mov si, Capricorn_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Capricorn

    mov si, Aquarius_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Aquarius

    mov si, Pisces_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_Pisces

    mov si, draw_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_DRAW
    
    mov si, time_in
    mov bx, buffer
    call comapre_strs
    cmp cx, 1
    je Callback_TIME

    jne Callback_WRONG  ; Если ни одна команда не подошла, то сообщаем, что команда введена неправильно
    jmp input_loop

Callback_HELP:
    mov si, help_out
    call out_string     ; Выводим справку по командам
    jmp input_loop
Callback_CLS:
    call cls            ; Вызываем функцию очистки экрана
    jmp input_loop

Callback_WRONG:         ; Неверная команда
    mov si, wrong_command_1
    call out_string           ; Выводим первую часть сообщения: Command '
    mov si, buffer            ; 
    call out_string           ; Выводим то, что ввёл пользователь
    mov si, wrong_command_2   ; 
    call out_string           ; Выводим выводим вторую часть сообщения: ' not found. Type 'help' to get all commands
    jmp input_loop            ; Переходим в цикл пользовательского ввода

Callback_INFO:
    mov si, info_out
    call out_string           ; Тот же алгоритм, что и help
    jmp input_loop

Callback_REBOOT:
    mov ah, 0                 ; Номер функции 0 - "тёплая" перезагрузка
    int 0x19                  ; Выполняем 0x19 прерывание
    jmp $                     ; Зависаем. Можно не добавлять, на всякий случай добавил

Callback_ECHO:
    mov si, echo_out          
    call out_string           ; Выводим просьбу ввести слово, которое затем выведем 
    mov si, buffer            
    call in_string            ; Ожидаем пользовательский ввод

    mov si, buffer
    call out_string           ; Выводим введённое слово

    call new_line             ; Переходим на новую строку
    
    jmp input_loop            ; Возвращаемся в цикл ввода

Callback_FUCK:
    mov si, fuck_out
    call out_string
    jmp input_loop

Callback_BACKGROUND:
    mov si, background_out
    call out_string       
    jmp input_loop   

Callback_ZODIAC:
    mov si, zodiac_out
    call out_string
    jmp input_loop

Callback_DRAW:
    call cls
    mov si, draw_out
    call out_string
    call kursor
    ;call _start
    call cls
    call out_string
    jmp input_loop

Callback_TIME:
    ; mov si, date_msg
    ; call out_string
    ; mov si, time_msg
    call _main
    call out_string
    jmp input_loop

%include "io.asm"
%include "color.asm"
%include "zodiac.asm"
%include "draw.asm"
%include "time-data.asm"

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
background_in db "color", 0
zodiac_in db "zodiac", 0
draw_in db "draw", 0
time_in db "time", 0

; info_out db "FuckingOS x16 (Terminal Operation System 16-bit) v.0.0:", 0x0a, 0x0d, "        It's an operating system under development, fuck, I'm already fucking sick of it..", 0x0a, 0x0d, "         Author: Fucking Matvey.", 0x0a, 0x0d, "          Made in Holy Russia!", 0x0a, 0x0d, 0
; help_out db "          cls - Clear screen", 0x0a, 0x0d, "         info - Get system info", 0x0a, 0x0d, "        reboot - Reboot computer", 0x0a, 0x0d, "       echo - Write text in screen", 0x0a, 0x0d, "       fuck - Fuck you", 0x0a, 0x0d, 0
info_out db "FuckingOS x16 (Terminal Operation System 16-bit) v.0.0:", 0x0a, 0x0d,"It's an operating system under development, fuck, I'm already fuck sick of it", 0x0a, 0x0d,"Author: Fucking Matvey.", 0x0a, 0x0d,"Made in Holy Russia!", 0x0a, 0x0d, 0
help_out db "          cls - Clear screen", 0x0a, 0x0d,"          info - Get system info", 0x0a, 0x0d,"          reboot - Reboot computer", 0x0a, 0x0d,"          echo - Write text in screen", 0x0a, 0x0d,"          fuck - Fuck you", 0x0a, 0x0d, "          color - changing the background color", 0x0a, 0x0d,"          zodiac - drawing of the zodiac sign", 0x0a, 0x0d, "          draw - drawing of the paint", 0x0a, 0x0d, 0
fuck_out db "Fuck you, Chuvaaaaak!!!!!!!", 0x0a, 0x0d, 0
background_out db "Choose the desired color:", 0x0a, 0x0d, "blue, green, cyan, red, magenta, light-gray, dark-gray, light-blue,", 0x0a, 0x0d, "light-green, light-cyan, light-red, light-magenta, brown, yellow", 0x0a, 0x0d, 0
zodiac_out db "What is your zodiac sign?", 0x0a, 0x0d,"Aries, Taurus, Gemini, Cancer, Leo, Virgo,", 0x0a, 0x0d,"Libra, Scorpius, Sagittarius, Capricorn, Aquarius, Pisces", 0x0a, 0x0d, 0
draw_out db "You need to press F1, F2, F3, F4, F5 to change the text", 0x0a, 0x0d, " and ESC to exit the program.", 0x0a, 0x0d, "", 0x0a, 0x0d, 0

;IBM_WELCOME db "                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"              ======== ========    ======          =======                     ", 0x0a, 0x0d,"              ======== =========   ========       ========                     ", 0x0a, 0x0d,"                ===       ==  ===    =======     =======                       ", 0x0a, 0x0d,"                ===       ======     ========   ========                       ", 0x0a, 0x0d,"                ===       ======     ==  ===== =====  ==                       ", 0x0a, 0x0d,"                ===       ==  ===    ==   =========   ==                       ", 0x0a, 0x0d,"              ======== =========  =====    =======    =====                    ", 0x0a, 0x0d,"              ======== ========   =====       =       =====                    ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d," (C) COPYRIGHT 1981, 1996 IBM CORPARATION - ALL RIGHTS RESERVED                ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d,"                                                                               ", 0x0a, 0x0d, 0
IBM_WELCOME db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@", 0x0a, 0x0d,"@1             1             1             1             1             1      @", 0x0a, 0x0d,"@ 2           2 2           2 2           2 2           2 2           2 2     @", 0x0a, 0x0d,"@  3         3   3         3   3         3   3         3   3         3   3    @", 0x0a, 0x0d,"@   4       4     4       4     4       4     4       4     4       4     4   @", 0x0a, 0x0d,"@    5     5       5     5       5     5       5     5       5     5       5  @", 0x0a, 0x0d,"@     6   6         6   6         6   6         6   6         6   6         6 @", 0x0a, 0x0d,"@      7 7           7 7           7 7           7 7           7 7           7@", 0x0a, 0x0d,"@       8             8             8             8             8             @", 0x0a, 0x0d,"@                                                                             @", 0x0a, 0x0d,"@                       ==         == ======== ========                       @", 0x0a, 0x0d,"@                       ==    =    == ======== ========                       @", 0x0a, 0x0d,"@                       ==   ===   ==    ==    ==                             @", 0x0a, 0x0d,"@                        ==  ===  ==     ==    ==                             @", 0x0a, 0x0d,"@                        == == == ==     ==    =====                          @", 0x0a, 0x0d,"@                        == == == ==     ==    =====                          @", 0x0a, 0x0d,"@                         ===   ===      ==    ==                             @", 0x0a, 0x0d,"@                         ===   ===      ==    ==                             @", 0x0a, 0x0d,"@                                                                             @", 0x0a, 0x0d,"@_____________________________________________________________________________@", 0x0a, 0x0d,"@-----(C) COPYRIGHT 1488, 2025 WTF CORPORATION - ALL RIGHTS ARE FUCKED UP-----@", 0x0a, 0x0d,"@_____________________________________________________________________________@", 0x0a, 0x0d,"@                                    8===D                                    @", 0x0a, 0x0d,"@                                    8===D                                    @", 0x0a, 0x0d,"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@", 0x0a, 0x0d, 0

buffer times 512 db 0