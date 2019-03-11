section .data
	text1 db "thinkpad", 10, 0
	text2 db "sky", 10, 0
	text3 db 0

section .text
	global _start

_start:
	mov rsi, text1
	call print_str
	mov rsi, text2
	call print_str
	mov rsi, text3
	call print_str
	call wrap_up

print_str:
	mov rdx, 0 ;stores length of string
	push rsi ;need it in the future
	; if no ret is mentioned then next label is executed without explicitly calling it
my_loop:
	inc rdx ;rdx = rdx + 1
	inc rsi ;rsi = rsi + 1
	mov cl, [rsi] ;move 1 byte of data to cl
	cmp cl, 0 ;compare if cl == 0
	jne my_loop ;jump if not equals to (w.r.t cmp)
	; print str and its len
	mov rax, 1 ;sys_write
	mov rdi, 1 ;std_out
	pop rsi ;string that we pushed earlier
	; rdx has length already
	syscall
	ret

wrap_up:
	mov rax, 60 ;sys_exit
	mov rdi, 0 ;exit status 0
	syscall
	ret

