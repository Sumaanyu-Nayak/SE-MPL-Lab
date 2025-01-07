%macro output 2
	mov rax,1
	mov rdi,1
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro
%macro input 2
	mov rax,0
	mov rdi,0
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro
%macro exit 0
	mov rax,60
	mov rdi,0
	syscall
%endmacro
section .data
	msg1 db "Enter Your Name:",20H
	msg1len equ $-msg1
	msg2 db "Your name is: ", 20H
	msg2len equ $-msg2

section .bss
	nm resb 20
	len resb 1

section .code
	global _start
	_start:
		output msg1,msg1len
		input nm,20
		
		mov [len],rax
		
		output msg2,msg2len
		output nm,[len] 
		
		exit
