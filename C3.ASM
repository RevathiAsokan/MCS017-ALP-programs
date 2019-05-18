; program to reverse a given string

data segment
    msg1 db 10,13,'enter any string :- $'
    msg2 db 10,13,'length of string is :- $'
    msg3 db 10,13,'reverse of entered string is :- $' 
   
    p1 label byte
    m1 db 0ffh
    l1 db ?
    p11 db 0ffh dup ('$')
    p22 db 0ffh dup ('$')
   
data ends
disp macro msg
    mov ah,9
    lea dx,msg
    int 21h
endm   
code segment
    assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax                
               
        disp msg1
       
        lea dx,p1
        mov ah,0ah    
        int 21h
               
        disp msg2
       
        mov dl,l1
        add dl,30h
        mov ah,2
        int 21h
       
        disp msg3
               
        lea si,p11
        lea di,p22
       
        mov dl,l1
        dec dl
        mov dh,0
        add si,dx
        mov cl,l1
        mov ch,0
       
reverse:
        mov al,[si]
        mov [di],al
        inc di
        dec si
        loop reverse
       
        disp p22
                      
        lea si,p11
        lea di,p22   
       
        mov cl,l1
        mov ch,0
                       
        mov ah,4ch
        int 21h
code ends
end start          
