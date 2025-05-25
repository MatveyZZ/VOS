section .data
kol db 80
wiersz db 24
kolor db 1111b

section .text
kursor:
    ; Установка начальной позиции курсора
    mov ah, 2
    mov bh, 0
    mov dh, byte [wiersz]
    mov dl, byte [kol]
    int 10h

petla:
    ; Get keystroke
    mov ah, 0
    int 16h
    ; AL = ASCII code, AH = BIOS scan code
    cmp al, 1Bh          ; Проверка на ESC
    je exit_program

    cmp ah, 48h
    je gora
    cmp ah, 50h
    je dol
    cmp ah, 4Bh
    je lewo
    cmp ah, 4Dh
    je prawo
    cmp ah, 3Bh
    je F1
    cmp ah, 3Ch
    je F2
    cmp ah, 3Dh
    je F3
    cmp ah, 3Eh
    je F4
    cmp ah, 3Fh
    je F5

    jmp petla  ; loop until Esc is pressed

exit_program:
    mov ax, 0x4C00 
    int 0x21
    ret

gora:
    sub byte [wiersz], 1
    mov ah, 2
    mov bh, 0
    mov dh, byte [wiersz]
    mov dl, byte [kol]
    int 10h
    mov ah, 09h
    mov al, 219
    mov cx, 1
    int 10h
    jmp petla

dol:
    add byte [wiersz], 1
    mov ah, 2
    mov bh, 0
    mov dh, byte [wiersz]
    mov dl, byte [kol]
    int 10h
    mov ah, 09h
    mov al, 219
    mov bl, [kolor]
    mov cx, 1
    int 10h
    jmp petla

lewo:
    sub byte [kol], 1
    mov ah, 2
    mov bh, 0
    mov dh, byte [wiersz]
    mov dl, byte [kol]
    int 10h
    mov ah, 09h
    mov al, 219
    mov bl, [kolor]
    mov cx, 1
    int 10h
    jmp petla

prawo:
    add byte [kol], 1
    mov ah, 2
    mov bh, 0
    mov dh, byte [wiersz]
    mov dl, byte [kol]
    int 10h
    mov ah, 09h
    mov al, 219
    mov bl, [kolor]
    mov cx, 1
    int 10h
    jmp petla

F1:
    mov byte [kolor], 0111b
    jmp petla
F2:
    mov byte [kolor], 1001b
    jmp petla
F3:
    mov byte [kolor], 0010b
    jmp petla
F4:
    mov byte [kolor], 1011b
    jmp petla
F5:
    mov byte [kolor], 1100b
    jmp petla
Esc:     
    jmp 0000:0500h      ;возвращаемся во второй сектор

DRAW_CALLBACK_OC:
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