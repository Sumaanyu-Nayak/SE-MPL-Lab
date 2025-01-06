section .data
	msg1 db "Enter Your Name:",20H
	msg1len equ $-msg1
	msg2 db "Your Name:",20h
	msg2len equ $-msg2

section .bss
	nm resb 20
	len resb 1

section .code
	global _start
	_start:
		mov rax,1
		mov rdi,1
		mov rsi,msg1
		mov rdx,msg1len
		syscall
		
		
		mov rax,0
		mov rdi,0
		mov rsi,nm
		mov rdx,20
		syscall
		
		mov [len],rax
		
		
		mov rax,1
		mov rdi,1
		mov rsi,msg2
		mov rdx,msg2len
		syscall
		
		mov rax,1
		mov rdi,1
		mov rsi,nm
		mov rdx, [len]
		syscall
		
		
		mov rax,60
		mov rdi,0
		syscall
