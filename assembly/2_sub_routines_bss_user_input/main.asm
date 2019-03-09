; tutorial: https://www.youtube.com/watch?v=VAy4FGHDx1I&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn&index=4
; nasm -f elf64 main.asm -o main.o
; ld main.o -o main
; ./main

section .data
	mess_1 db "Your Name: "
	mess_2 db "Hello "

section .bss
	name resb 64

section .text
	global _start

_start:
	call print_mess_1
	call take_input
	call print_mess_2
	call print_name
	call wrap_up

print_mess_1:
	mov rax, 1 ;sys_write
	mov rdi, 1 ;std_out
	mov rsi, mess_1
	mov rdx, 11 ;length of mess_1
	syscall
	ret

take_input:
	mov rax, 0 ;sys_read
	mov rdi, 0 ;std_in
	mov rsi, name
	mov rdx, 64 ;length of name
	syscall
	ret

print_mess_2:
	mov rax, 1 ;sys_write
	mov rdi, 1 ;std_out
	mov rsi, mess_2
	mov rdx, 6 ;length of mess_2
	syscall
	ret

print_name:
	mov rax, 1 ;sys_write
	mov rdi, 1 ;std_out
	mov rsi, name
	mov rdx, 64 ;length of name
	syscall
	ret

wrap_up:
	mov rax, 60 ;sys_exit
	mov rdi, 0 ;exit_code
	syscall
	ret

