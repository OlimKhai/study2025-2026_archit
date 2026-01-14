; hello64.asm
SECTION .data
hello: DB 'Hello world!',10
helloLen: EQU $-hello

SECTION .text
GLOBAL _start

_start:
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, hello      ; адрес строки
    mov rdx, helloLen   ; длина строки
    syscall             ; вызов ядра

    mov rax, 60         ; sys_exit
    mov rdi, 0          ; код выхода
    syscall             ; вызов ядра
