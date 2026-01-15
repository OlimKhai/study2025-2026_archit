SECTION .date
	msg: DB 'Введите строчку:',10
	msgLen: EQU $-msg

SECTION .bss
	buf1 RESB 80

SECTION .text
	GLOBAL _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, msgLen
	int 80h
	
	mov eax, 3
	mov ebx, 0
	mov ecx, buf1
	mov edx, 80
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov edx, eax
	int 0x80
	
	mov eax, 
	xor ebx, ebx
	int 0x80
