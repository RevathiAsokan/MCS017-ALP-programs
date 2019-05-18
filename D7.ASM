; program to implement character array, store only character values and using this array
; reverse a string (hint: palindrome)
data segment
arry db 10 dup(0)
msg1 db 10,13,"Enter 10 characters: $"
msg2 db 10,13,"The reverse is $"
data ends

code segment
assume cs:code, ds:data

start:
        mov ax,data
        mov ds,ax
        mov cx,0ah
        mov si,offset arry
		
		lea dx, msg1
		mov ah, 09h
		int 21h
		
next:   call readkb
        mov [si],al
        inc si
        loop next
        
		mov cx,0ah
        dec si
		
		lea dx, msg2
		mov ah, 09h
		int 21h
		
back:   mov dl,[si]
        mov ah,02h
        int 21h
		
        dec si
        dec cx
        jnz back
		
        mov ah,4ch
        int 21h

readkb proc
	mov ah,01h
	int 21h
	ret
	readkb endp

    code ends
end start
