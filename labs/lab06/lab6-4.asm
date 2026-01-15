%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
rem: DB 'Ответ: ',0

SECTION .bss
x_str_buffer: RESB 80
x_val: RESD 1        ; ← Исправлено!

SECTION .text
GLOBAL _start

_start:
    mov eax, msg
    call sprintLF

    mov ecx, x_str_buffer
    mov edx, 80
    call sread

    mov eax, x_str_buffer
    call atoi

    mov [x_val], eax    ; Сохраняем x в память

    mov eax, 12         ; EAX = 12
    imul eax, dword [x_val]  ; EAX = 12 * x
    add eax, 3          ; EAX = 12*x + 3

    mov ebx, 5          ; EBX = 5
    imul eax, ebx       ; EAX = 5 * (12*x + 3)

    mov eax, rem
    call sprint
    mov eax, eax        ; значение результата
    call iprintLF

    call quit
