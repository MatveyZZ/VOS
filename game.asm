section .data
    hello db 'Hello, World!', 0x0D, 0x0A, '$'  ; строка для вывода с символами новой строки и конца строки

section .text
    global game_start

game_start:
    ; Вывод строки
    mov ah, 09h                     ; функция DOS для вывода строки
    lea dx, [hello]                 ; загрузка адреса строки в DX
    int 21h                         ; вызов DOS

    ; Завершение программы
    mov ax, 4C00h                   ; функция DOS для выхода
    int 21h                         ; вызов DOS