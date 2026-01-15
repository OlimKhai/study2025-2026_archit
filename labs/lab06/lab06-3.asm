%include 'in_out.asm'	; подключение внешнего файла
SECTION .data

div:	DB 'Результат: ',0
rem:	DB 'Результат: ',0

SECTION .text
GLOBAL _start

_start:
; ---- Вычисление поражения
mov eax,4 ; EAX=4
mov ebx,6 ; EBX=6
mul ebx ; EAX=EAX*EBX
add eax,2 ; EAX=EAX+2
xor edx,edx ; обнуляем EDX для корректной работы div
mov ebx,5 ; EBX=5
div ebx	; EAX=EAX/5, EDX=остаток от деления
mov edi,eax ; запись результата вычисления в 'edi'
; ---- Вывод результата на экран
mov eax, div        ; сообщение 'Результат: '
call sprint
mov eax, eax        ; значение результата (уже в EAX)
call iprintLF       ; выводим число из EAX
mov eax, rem        ; сообщение 'Остаток от деления: '
call sprint
mov eax, edx        ; значение остатка (в EDX)
call iprintLF       ; выводим число из EDX

call quit           ; завершение программы
