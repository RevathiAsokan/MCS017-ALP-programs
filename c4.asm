; program to convert string to its ASCII value adn store in array

data segment
    msg1 db 10,13,'enter first string :- $'
   
    array db 50 dup ('$')
   
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
                            
        lea si,p11
        lea di,array
               
        mov cl,l1
        mov ch,0
       
copy1:  mov al,[si]
        mov [di],al
  
        inc di
        inc si
        loop copy1                    
      
        mov ah,4ch
        int 21h
code ends
end start          
