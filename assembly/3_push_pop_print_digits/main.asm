section .data
	digit db 0, 10 ;10 represents new line

section .text
	global _start

_start:
	push 1
	push 2
	push 3
	pop rax
	call print_digit
	pop rax
	call print_digit
	pop rax
	call print_digit
	call wrap_up

print_digit:
	add rax, 48
	mov [digit], al ; 8 least significant bits of rax are moved to the address stored in digit
	mov rax, 1 ;sys_write
	mov rdi, 1 ;std_out
	mov rsi, digit
	mov rdx, 2 ;no.of bytes of digit
	syscall
	ret

wrap_up:
	mov rax, 60 ;sys_exit
	mov rdi, 0 ;exit code 0
	syscall
	ret
