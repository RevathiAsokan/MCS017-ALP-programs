; program to determine a given string is a palindrome or not

data segment
    msg1 db 10,13,'enter any string :- $'
    msg2 db 10,13,'entered string is :- $'
    msg3 db 10,13,'length of string is :- $'
    msg4 db 10,13,'the given string is not a palindrome $' 
    msg5 db 10,13,'the given string is a palindrome $'
    msg6 db 10,13,'reverse of entered string is :- $' 
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
       
        disp p11
       
        disp msg3
       
        mov dl,l1
        add dl,30h
        mov ah,2
        int 21h
       
        disp msg6
               
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
       
check:
        mov al,[si]
        cmp [di],al
        jne notpalin
        inc di
        inc si
        loop check
     
       
        disp msg5
        jmp exit
notpalin:
        disp msg4
               
exit:   mov ah,4ch
        int 21h
code ends
end start