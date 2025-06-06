section .text
Blue:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x01      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Blue
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Green:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x02      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Green
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Cyan:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x03      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Cyan
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Red:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x04      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Red
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Magenta:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x05      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Magenta
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Brown:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x06      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Brown
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Light_Gray:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x07      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Light_Gray
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Dark_Gray:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x08      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Dark_Gray
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Light_Blue:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x09      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Light_Blue
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Light_Green:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x0A      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Light_Green
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Light_Cyan:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x0B      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Light_Cyan
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Light_Red:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x0C      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Light_Red
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Light_Magenta:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x0D      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Light_Magenta
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret
Yellow:
    mov ah, 0x0B      ; Функция установки цвета текста
    mov bh, 0x00      ; Номер страницы (обычно 0)
    mov bl, 0x0E      ; Цвет текста (02 - темно-зеленый)
    int 0x10          ; Вызов BIOS
    mov si, color_Yellow
    mov ax, 0x4C00    ; Завершение программы
    int 0x21          ; Вызов DOS
    ret

section .data
color_Blue db "The background color has been changed to blue!", 0x0a, 0x0d, 0 
color_Green db "The background color has been changed to green!", 0x0a, 0x0d, 0 
color_Cyan db "The background color has been changed to cyan!", 0x0a, 0x0d, 0 
color_Red db "The background color has been changed to red!", 0x0a, 0x0d, 0 
color_Magenta db "The background color has been changed to magenta!", 0x0a, 0x0d, 0 
color_Light_Gray db "The background color has been changed to light gray!", 0x0a, 0x0d, 0 
color_Dark_Gray db "The background color has been changed to dark gray!", 0x0a, 0x0d, 0 
color_Light_Blue db "The background color has been changed to light blue!", 0x0a, 0x0d, 0 
color_Light_Green db "The background color has been changed to light green!", 0x0a, 0x0d, 0 
color_Light_Cyan db "The background color has been changed to light cyan!", 0x0a, 0x0d, 0 
color_Light_Red db "The background color has been changed to light red!", 0x0a, 0x0d, 0 
color_Light_Magenta db "The background color has been changed to light magenta!", 0x0a, 0x0d, 0 
color_Brown db "The background color has been changed to brown!", 0x0a, 0x0d, 0 
color_Yellow db "The background color has been changed to yellow!", 0x0a, 0x0d, 0 

color_Blue_in db "blue", 0 
color_Green_in db "green", 0 
color_Cyan_in db "cyan", 0 
color_Red_in db "red", 0 
color_Magenta_in db "magenta", 0 
color_Light_Gray_in db "light-gray", 0 
color_Dark_Gray_in db "dark-gray", 0 
color_Light_Blue_in db "light-blue", 0 
color_Light_Green_in db "light-green", 0 
color_Light_Cyan_in db "light-cyan", 0 
color_Light_Red_in db "light-red", 0 
color_Light_Magenta_in db "light-magenta", 0 
color_Brown_in db "brown", 0 
color_Yellow_in db "yellow", 0 

Callback_color_Blue:
    call Blue
    call out_string
    jmp input_loop
Callback_color_Green:
    call Green
    call out_string
    jmp input_loop
Callback_color_Cyan:
    call Cyan
    call out_string
    jmp input_loop
Callback_color_Red:
    call Red
    call out_string
    jmp input_loop
Callback_color_Magenta:
    call Magenta
    call out_string
    jmp input_loop
Callback_color_Brown:
    call Brown
    call out_string
    jmp input_loop
Callback_color_Light_Gray:
    call Light_Gray
    call out_string
    jmp input_loop
Callback_color_Dark_Gray:
    call Dark_Gray
    call out_string
    jmp input_loop
Callback_color_Light_Blue:
    call Light_Blue
    call out_string
    jmp input_loop
Callback_color_Light_Green:
    call Light_Green
    call out_string
    jmp input_loop
Callback_color_Light_Cyan:
    call Light_Cyan
    call out_string
    jmp input_loop
Callback_color_Light_Red:
    call Light_Red
    call out_string
    jmp input_loop
Callback_color_Light_Magenta:
    call Light_Magenta
    call out_string
    jmp input_loop
Callback_color_Yellow:
    call Yellow
    call out_string
    jmp input_loop

;DRAW_CALLBACK_OC:
    