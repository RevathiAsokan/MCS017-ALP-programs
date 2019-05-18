;program to convert 4 digits bcd into its binary
data segment
     bcd dw 1234h               ;  bcd = 1234h
     temp db ?                  ; temp
     res  db 17 dup ('$')       ; res
data ends

code segment                    ; intialize cs and ds
assume ds:data,cs:code
start:       
    mov ax,data                 ; intialize ds with address of data
    mov ds,ax
   
    mov ax,bcd                  ; ax = bcd
    mov bl,al                   ; al = bl
     
    and al,0f0h                 
    and bl,0fh
     
    mov cl,04h
    rol al,cl
     
    mov cl,10
    mul cl
     
    add al,bl
    mov temp,al
   
    mov ax,bcd
    mov al,ah
    mov ah,0
    mov bl,al
     
    and al,0f0h
    and bl,0fh
     
    mov cl,04h
    rol al,cl
     
    mov cl,10
    mul cl
     
    add al,bl
   
    mov cl,100
    mul cl
   
    mov bl,temp
    mov bh,0
    add ax,bx   
      
    lea si,res
    call hex2bin
   
    lea dx,res
    mov ah,9
    int 21h 
            
    mov ah,4ch
    int 21h        

hex2bin proc near
    mov cx,0
    mov bx,2
   
loop1: mov dx,0
       div bx
       add dl,30h
       push dx
       inc cx
       cmp ax,1
       jg loop1
     
       add al,30h
       mov [si],al
     
loop2: pop ax
       inc si
       mov [si],al
       loop loop2
       ret
hex2bin endp           
code ends
end start
