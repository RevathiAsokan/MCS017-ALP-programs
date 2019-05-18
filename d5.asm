; program to accept one character from console at 10 second intervals
; and stores each character in one array of characters
disp macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm

data segment
msg1 db 10,13,"delay program, wait for 10 secs $"
msg2 db 10,13,"enter a character to store in array or 0 to exit : $"
msg3 db 10,13,"Terminating the program $"
arr db 2 dup(0)
data ends

code segment
assume cs:code,ds:data

start:  
		mov ax,data
        mov ds,ax
		
		lea si, arr
		
accept: disp msg1
		call delay1
		
		disp msg2
		mov ah, 01h
		int 21h
		
		sub al, 30h
		cmp al, 0h
		je skip
		add al, 30h
		mov [si], al
		inc si
		jmp accept

skip:		
        disp msg3
        mov ah,4ch
        int 21h
        
delay1 proc
        push cx
        push ax
        mov cx,0fffh
   l2:  mov ax,0fffh
   l1:  dec ax
        jnz l1
        loop l2
        pop ax
        pop cx
        ret
		delay1 endp
		code ends
end start