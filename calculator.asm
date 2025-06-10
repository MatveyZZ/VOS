section .data
    prompt1 db 'Enter the first number: ', 0
    prompt2 db 'Enter the second number: ', 0
    prompt3 db 'Enter the operation (+, -, *, /): ', 0
    result_msg db 'Result: ', 0
    num1 db 0
    num2 db 0
    operation db 0
    result db 0

section .bss
    input resb 10

section .text
    global _start

_start:
    ; Запрос первого числа
    mov ah, 09h
    lea dx, [prompt1]
    int 21h

    ; Чтение первого числа
    call read_number
    mov [num1], al

    ; Запрос второго числа
    mov ah, 09h
    lea dx, [prompt2]
    int 21h

    ; Чтение второго числа
    call read_number
    mov [num2], al

    ; Запрос операции
    mov ah, 09h
    lea dx, [prompt3]
    int 21h

    ; Чтение операции
    call read_operation
    mov [operation], al

    ; Выполнение операции
    mov al, [num1]
    mov bl, [num2]

    cmp byte [operation], '+'
    je add
    cmp byte [operation], '-'
    je sub
    cmp byte [operation], '*'
    je mul
    cmp byte [operation], '/'
    je div

    jmp end_program

add:
    add al, bl
    jmp store_result

sub:
    sub al, bl
    jmp store_result

mul:
    mov ah, 0
    mul bl
    jmp store_result

div:
    xor ah, ah
    div bl
    jmp store_result

store_result:
    mov [result], al

    ; Вывод результата
    mov ah, 09h
    lea dx, [result_msg]
    int 21h

    ; Преобразование результата в строку и вывод
    call print_result

end_program:
    ; Завершение программы
    mov ax, 4C00h
    int 21h

; Подпрограмма для чтения числа
read_number:
    mov ah, 01h
    int 21h
    sub al, '0' ; Преобразование символа в число
    ret

; Подпрограмма для чтения операции
read_operation:
    mov ah, 01h
    int 21h
    ret

; Подпрограмма для вывода результата
print_result:
    mov ax, [result]
    add ax, '0' ; Преобразование числа в символ
    mov ah, 02h
    int 21h
    ret