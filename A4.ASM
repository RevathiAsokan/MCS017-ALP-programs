;Program 4: exchange two memory variables using MOV and XCHG

data segment
x db 05h                ; x = 5
y db 04h                 ; y = 4
data ends

code segment
assume cs:code, ds:data

start:
	mov ax, data
	mov ds, ax

        mov al, x       ; al = 5

        xchg y, al      ; y=5, al=4
        mov x, al       ; x=4

	mov ah, 4ch
	int 21h
	code ends
end start
