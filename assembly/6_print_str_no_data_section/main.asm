section .text:
	global _start

_start:
	call print_string
	call wrap_up

print_string:
	mov rax, 1 ;sys_write
	mov rdi, 1 ;std_out
	mov rcx,  0x000a6f6c6c6568 ;ascii of '\0\nolleh' to print 'hello\n\0'
	push rcx
	mov rsi, rsp ;rsp now points to the ascii that we've just pushed onto stack
	mov rdx, 7 ;length of data
	syscall
	pop rcx ;remove ascii from stack
	ret

wrap_up:
	mov rax, 60 ;sys_exit
	mov rdi, 0 ;exit code 0
	syscall
	ret
