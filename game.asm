global game_start

section .text
game_start:       
    mov si, game_out   
    ret

game_out db "Hello World!", 0x0a, 0x0d, 0 