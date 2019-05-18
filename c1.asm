; program to concatenate string
data segment
    msg1 db 10,13,'enter first string :- $'
    msg2 db 10,13,'enter second string :- $'
    msg3 db 10,13,'concatenated string is :- $' 
   
    p1 label byte
    m1 db 0ffh
    l1 db ?
    p11 db 0ffh dup ('$')
   
    p2 label byte
    m2 db 0ffh
    l2 db ?
    p22 db 0ffh dup ('$')
   
    p3 label byte
    m3 db 0ffh
    l3 db ?
    p33 db 0ffh dup ('$')
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
       
        lea dx,p2
        mov ah,0ah    
        int 21h
       
        disp msg3
               
        lea si,p11
        lea di,p33
               
        mov cl,l1
        mov ch,0
       
copy1:  mov al,[si]
        mov [di],al
  
        inc di
        inc si
        loop copy1
       
        lea si,p22
                       
        mov cl,l2
        mov ch,0
       
copy2:  mov al,[si]
        mov [di],al
  
        inc di
        inc si
        loop copy2           
                  
        disp p33
       
        mov ah,4ch
        int 21h
code ends
end start
