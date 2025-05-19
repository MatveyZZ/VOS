global game_start
  
game_start:              ; метка начала программы
  
    xor ax, ax           ; обнуляем регистр ax  
    mov ds, ax           ; устанавливаем сегмент данных (ds) в 0  
    mov es, ax           ; устанавливаем дополнительный сегмент (es) в 0  
    mov bx, 0x7e00 
  
    mov si, hello_world              ; указываем hello_world как источник  
    call print_string                 ; вызываем функцию для вывода строки  
  
.loop_forever:              ; Бесконечный цикл, чтобы программа продолжала работать
    jmp .loop_forever              ; Переход к самому себе для создания бесконечного цикла

hello_world db 'Hello World!', 0x0a, 0x0d, 0 
  
print_string:  
    mov ah, 0x0E            ; значение для прерывания, чтобы вывести символ из al 
  
.repeat_next_char:  
    lodsb                   ; получаем символ из строки  
    cmp al, 0              ; сравниваем al с концом строки  
    je .done_print         ; если символ нулевой, конец строки  
    int 0x10              ; иначе, выводим символ  
    jmp .repeat_next_char  ; переходим к следующему символу  
  
.done_print:  
    ret                     ; возвращаемся  
