global game_start
  
game_start:              ; start label from where our code starts  
  
    xor ax,ax           ; set ax register to 0  
    mov ds,ax           ; set data segment(ds) to 0  
    mov es,ax           ; set extra segment(es) to 0  
    mov bx,0x7e00 
  
    mov si, hello_world              ; point hello_world to source index  
    call print_string                      ; call print different color string function  
  
    hello_world db  'Hello World!', 0x0a, 0x0d, 0 
  
print_string:  
    mov ah, 0x0E            ; value to tell interrupt handler that take value from al & print it 
  
.repeat_next_char:  
    lodsb                ; get character from string  
    cmp al, 0                    ; cmp al with end of string  
    je .done_print               ; if char is zero, end of string  
    int 0x10                     ; otherwise, print it  
    jmp .repeat_next_char        ; jmp to .repeat_next_char if not 0  
  
.done_print:  
    ret                         ;return  