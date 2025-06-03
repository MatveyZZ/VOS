; ============================================================================
; Библиотека для ввода/вывода текстовой информации, с помощью прерываний BIOS
; ============================================================================
global cls          ; void cls();
global out_char     ; void out_char(char bl);
global out_string   ; void out_string(char* si);

global in_char      ; char in_char() return char al;
global in_string    ; void in_string(char[]* si);

global comapre_strs ; int (const char* first_word[] si, const char* last_word[] bx) return cx (1 - равны, 0 - не равны);

global clear_buffer ; void (const char* buf_address[] si, int buf_size bx);

global new_line ; void new_line();

section .text

new_line:        ; Перевод каретки на новую строку
    push ax      ; Сохраняем значение регистра ax в стеке
    mov ah, 0x0e ; Номер функции прерывания 0x10. Вывод
    mov al, 0x0a ; Символ перевода каретки в начало
    int 0x10     ; Вызов прерывания для работы с видеосервисом
    mov al, 0x0d ; Символ перевода строки
    int 0x10
    pop ax       ; Восстанавливаем значение в регистре ax
    ret          ; Выходим из функции

cls:
    push ax      ; Сохраняем значение ax
    mov ah, 0x00 ; Номер функции прерывания 0x10. Изменение видеорежима
    mov al, 0x03 ; Номер видеорежима. 0x03 - текстовый видеорежим.
    int 0x10     
    pop ax       ; Восстанавливаем значение регистра ax
    ret          ; Выходим из функции

out_char:        ; Вывод символа на экран
    push ax
    mov ah, 0x0e
    mov al, bl   ; В регистр bl мы заранее положили символ на вывод
    int 0x10
    pop ax
    ret

out_string:      ; Вывод строки на экран
    push ax
    mov ah, 0x0e
    call __out_string_next_char
    pop ax
    ret
__out_string_next_char:
    mov al, [si]        ; В регистре si храниться адрес начала строки. Помещаем значение из адреса si в al
    cmp al, 0           ; Затем сравниваем al с 0
    jz __out_string_if_zero  ; если al = 0 значит строка закончилась
    int 0x10                 ; если al != 0 значит, по этому адресу что-то есть, выводим символ на экран
    inc si                   ; Увеличиваем si на 1
    jmp __out_string_next_char ; Выполняем функцию снова
__out_string_if_zero:
    ret                    ; Покидаем функцию

in_char:        ; Пользовательский ввод символа
    push bx
    mov ah, 0
    int 0x16    ; Символ сохранён в регистр al
    mov ah, 0x0e
    mov bh, 0
    mov bl, 0x07
    int 0x10    ; Вывод введённого символа на экран
    pop bx
    ret


comapre_strs:       ; Сравнивание строк
    push si
    push bx
    push ax
__comapre_strs_comp:
    mov ah, [bx]
    cmp [si], ah
    jne __comapre_strs_first_zero
    inc si
    inc bx
    jmp __comapre_strs_comp
__comapre_strs_first_zero:
    cmp byte [bx], 0
    jne __comapre_strs_not_equal
    mov cx, 1
    pop si
    pop bx
    pop ax
    ret
__comapre_strs_not_equal:
    mov cx, 0
    pop si
    pop bx
    pop ax
    ret


clear_buffer:
    ; si - Адрес буфера
    ; bx - Количество байт на очистку
    push cx
    mov cx, 0
__clear_buffer_loop:
    cmp cx, bx
    je __clear_buffer_end_loop
    mov byte [si], 0
    inc si
    inc cx
    jmp __clear_buffer_loop
__clear_buffer_end_loop:
    pop cx
    ret



in_string:             ; Пользовательский ввод строки. Адрес буфера хранится в si
    push ax
    push cx
    xor cx, cx
__input_string_loop:
    mov ah, 0
    int 0x16
    cmp al, 0x0d            ; Если пользователь нажал Enter, то обрабатываем это событие
    je __input_string_enter
    cmp al, 0x08            ; Если пользователь нажал Backspace, то обрабатываем это событие
    je __input_string_backspace

    mov [si], al
    inc si
    inc cx

    mov ah, 0x0e
    mov bh, 0
    mov bl, 0x07
    int 0x10
    cmp cx, 255               ; Если Пользователь ввёл 255 символов
    je __input_string_enter   ; То прыгаем в событие нажатия на Enter
    jmp __input_string_loop
__input_string_enter:
    mov ah, 0x0e ; Номер функции int 0x10 - вывод символа 
    mov al, 0x0d ; Перевод каретки на новую строку
    mov bh, 0
    mov bl, 0x07 ; Цвет выводимого символа 0 - чёрный фон 7 - белый символ
    int 0x10
    mov al, 0xa  ; Перевод каретки в начало строки
    int 0x10

    mov byte [si], 0 ; Помещаем в конец строки 0
    pop cx
    pop ax
    ret
__input_string_backspace:
    cmp cx, 0         ; Проверка номера символа по счёту. Если это 0 символ - значит нужно запретить стирание символа, потому что, пользователь может случайно стереть выводимую ОС информацию.
    je __input_string_loop ; Если это 0 символ, то возвращаемся в цикл ввода
    mov ah, 0x0e            ; Иначе, эмулируем нажатия на Backspace, Пробел, Backspace
    mov al, 0x08            ; Backspace
    int 0x10
    mov al, 0x20            ; Пробел
    int 0x10
    mov al, 0x08            ; Backspace
    int 0x10

    mov byte [si], 0
    dec si                 ; Уменьшаем si на 1. si - адрес cx - номер введённого символа. Уменьшаем два этих регистра на один
    dec cx
    jmp __input_string_loop ; Возвращаемся в цикл ввода