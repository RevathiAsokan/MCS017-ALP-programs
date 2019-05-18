; program to search for character in a given string
; calculate the number of occurrences of the character in the given string
data segment
    msg1 db 10,13,'enter any string :- $'
    msg2 db 10,13,'enter any character :- $'
    msg3 db 10,13,' $'
    msg4 db 10,13,'entered character not found in the given string $' 
    msg5 db ' time(s), the entered character is found in the given string $'
    char db ?
    count db 0
    p1 label byte
    m1 db 0ffh
    l1 db ?
    p11 db 0ffh dup ('$')   
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
       
        mov ah,1
        int 21h
        mov char,al                           
       
        disp msg3
       
        lea si,p11
                      
        mov cl,l1
        mov ch,0
       
check:
        mov al,[si]
        cmp char,al
        jne skip
        inc count       
skip:       
        inc si
        loop check
             
        cmp count,0
        je notfound
             
        disp msg3
       
        mov dl,count
        add dl,30h
        mov ah,2
        int 21h 
               
        disp msg5
        jmp exit 
notfound:      
        disp msg4
               
exit:   mov ah,4ch
        int 21h
code ends
end start          
