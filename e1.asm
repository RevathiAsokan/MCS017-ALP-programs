; program to implement c++ program
data segment                   
msg1 db "Enter a number: $"
msg2 db 10,13,"The Sum is  $"
sum dw 1 dup(0)
data ends
CODE SEGMENT
assume cs:code,ds:data
start:
	mov ax, data
	mov ds, ax
	
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	mov ah, 01h
	int 21h
	
	sub al, 30h
	
	mov cl, al
	mov al, 0h
	
loop1: 
	add al, cl
	loop loop1
	
    aam             ; ascii adjust after multiplication

    add ax, 3030h   ; add 3030h to ax, ax = ax + 3030h
    mov bx, ax      ; move ax to bx, bx = ax
	
	lea dx,msg2
	mov ah, 09h
	int 21h
	
	mov dl, bh      ; move bh to dl, dl = bh
    mov ah, 02h     ; print value stored in dl
    int 21h

    mov dl, bl      ; move bl to dl, dl = bh
    mov ah, 02h     ; print value stored in dl
    int 21h
	
	mov ah, 4ch
	int 21h
	
	code ends
end start