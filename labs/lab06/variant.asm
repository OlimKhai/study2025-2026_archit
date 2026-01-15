%include 'in_out.asm'

SECTION .data
msg: DB 'Введите № студенческого билета: ',0
rem: DB 'Ваш вариант: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax, msg
    call sprintLF

    mov ecx, x
    mov edx, 80
    call sread          ;

    mov eax, x          ; передаём адрес строки
    call atoi           ; преобразуем в число

    xor edx, edx        ; обнуляем EDX
    mov ebx, 20
    div ebx             ; EAX = EAX / 20, EDX = остаток

    mov eax, rem
    call sprint
    mov eax, edx        ; выводим остаток
    call iprintLF

    call quit
