;PROGRAM 1.5: sum of two BCD numbers

data segment
x db 04h                ; X = 4
y db 56h                ; Y = 56
sum db 1 dup(0)         ; SUM = 0
data ends

code segment
assume cs:code, ds:data

start:
	mov ax, data
	mov ds, ax

        mov al, x       ; al = 4

        add al, y       ; al = al + y = 4 + 56 = 5A
        daa             ; al = 60
        mov sum, al     ; sum = 60

	mov ah, 4ch
	int 21h
	code ends
end start
