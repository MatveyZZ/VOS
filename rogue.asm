section .data
    prompt db "Click 'q' + Enter to exit the game", 10, 0
    defeat_msg db "You've defeated a goblin and got %d gold!", 10, 0
    gold_msg db "Gold: %d", 10, 0
    wall_symbol db '#'
    player_symbol db '@'
    goblin_symbol db 't'
    map db 21*11 dup(' ')
    gold_total dq 0

section .bss
    xx resb 1
    yy resb 1
    tx resb 1
    ty resb 1
    action resb 1
    gold resb 1
    defeat_flag resb 1

section .text
    extern printf, system, rand, getch
    global _start

_start:
    ; Инициализация координат игрока и гоблина
    mov byte [xx], 5
    mov byte [yy], 5
    mov byte [tx], 11
    mov byte [ty], 7

main_loop:
    ; Очистка экрана
    mov rdi, prompt
    call system

    ; Управление и проверка стен
    movzx rax, byte [action]
    cmp rax, 'w'
    je move_up
    cmp rax, 's'
    je move_down
    cmp rax, 'a'
    je move_left
    cmp rax, 'd'
    je move_right

move_up:
    movzx rax, byte [yy]
    cmp rax, 0
    je skip_move_up
    dec byte [yy]
skip_move_up:
    jmp check_goblin

move_down:
    movzx rax, byte [yy]
    cmp rax, 10
    je skip_move_down
    inc byte [yy]
skip_move_down:
    jmp check_goblin

move_left:
    movzx rax, byte [xx]
    cmp rax, 0
    je skip_move_left
    dec byte [xx]
skip_move_left:
    jmp check_goblin

move_right:
    movzx rax, byte [xx]
    cmp rax, 20
    je skip_move_right
    inc byte [xx]
skip_move_right:
    jmp check_goblin

check_goblin:
    movzx rax, byte [xx]
    cmp rax, [tx]
    jne not_fight
    movzx rax, byte [yy]
    cmp rax, [ty]
    jne not_fight

    ; Бой с гоблином
    call rand
    and rax, 0x0F ; Получаем золото
    mov [gold], al
    call rand
    and rax, 0x0F ; Новые координаты гоблина
    mov [tx], al
    call rand
    and rax, 0x0F
    mov [ty], al
    mov byte [defeat_flag], 1
    jmp print_map

not_fight:
    mov byte [defeat_flag], 0

print_map:
    ; Здесь нужно реализовать логику печати карты, игрока и гоблина
    ; Для упрощения пропустим эту часть

    ; Печать сообщения о золоте
    mov rax, [gold_total]
    add rax, [gold]
    mov [gold_total], rax
    mov rdi, gold_msg
    mov rsi, rax
    call printf

    ; Получение ввода пользователя
    call getch
    mov [action], al

    ; Проверка условия выхода
    cmp byte [action], 'q'
    je exit_game

    jmp main_loop

exit_game:
    ; Завершение программы
    ret