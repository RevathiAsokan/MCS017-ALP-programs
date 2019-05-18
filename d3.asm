; program to produce 2 ms delay

data segment
msg1 db "delay program wait$"
msg2 db 10,13,"now terminating$"
data ends
code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
		
        lea dx,msg1
        mov ah,09h
        int 21h
		
        call delay1
		
        lea dx,msg2
        mov ah,09h
        int 21h
		
        mov ah,4ch
        int 21h
        
delay1 proc
        push cx
        push ax
        mov cx,0ffffh
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
