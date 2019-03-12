section .text:
	global _start

_start:
	mov rcx, 'h'
	call print_char
	call wrap_up

print_char:
	mov rax, 1 ;sys_write
	mov rdi, 1 ;std_out
	push rcx ;char
	mov rsi, rsp ;rsp now points to char on stack that just got pushed
	mov rdx, 1
	syscall
	pop rcx ;remove char from stack that we've pushed earlier
	ret

wrap_up:
	mov rax, 60 ;sys_exit
	mov rdi, 0 ;exit code 0
	syscall
	ret
