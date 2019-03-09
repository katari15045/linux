;tutorial: https://www.youtube.com/watch?v=BWRR3Hecjao&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn&index=2
;nasm -f elf64 main.asm -o main.o
;ld main.o -o main
;./main

section .data
	message db "hello world", 10 ;message - name of variable | db - define bytes | 10 - new line

section .text
	global _start

_start:
	mov rax, 1 ;sys_write
	mov rdi, 1 ;stdout
	mov rsi, message
	mov rdx, 12 ;length of message
	syscall
	
	mov rax, 60 ;sys_exit
	mov rdi, 0 ;exit code 0
	syscall
