global color_start

section .text
color_start:
    ; Устанавливаем цвет текста (зеленый)
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x0A      ; Цвет текста (0A - зеленый)
    int 0x10          ; Вызов BIOS

    ; Выводим строку "Hello World!"
    mov si, color_out

    ; Завершение программы
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS

    ret


section .data
color_out db "The background color has been changed to green!", 0x0a, 0x0d, 0 