section .data
    hello db 'Hello, World!', 0  ; Строка для вывода, нуль-терминированная

section .text
    global _start                  ; Точка входа

_start:
    ; Вывод строки на экран
    mov eax, 4                    ; Системный вызов для sys_write
    mov ebx, 1                    ; Дескриптор файла 1 (stdout)
    mov ecx, hello                ; Указатель на строку
    mov edx, 13                   ; Длина строки
    int 0x80                      ; Вызов ядра

    ; Завершение программы
    mov eax, 1                    ; Системный вызов для sys_exit
    xor ebx, ebx                  ; Код возврата 0
    int 0x80                      ; Вызов ядра