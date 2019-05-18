; program to convert a string in uppercase to lowercase or lowercase to uppercase
disp macro msg
    lea dx,msg
	mov ah, 09h
    int 21h
endm 

data segment
    msg1 db 10,13,'enter any string :- $'
    msg2 db 10,13,'entered string is :- $'
    msg3 db 10,13,'converted string is : $'
   
    p1 label byte
    m1 db 0ffh
    l1 db ?
    p11 db 0ffh dup ('$')
data ends
 
code segment
assume cs:code, ds:data
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
               
        lea si,p11
              
        mov cl,l1
        mov ch,0       
check:
        cmp byte ptr[si],41h
        jb done
       
        cmp byte ptr[si],5bh
        jb lwr
       
        cmp byte ptr[si],61h
        jb done
       
        cmp byte ptr[si],7bh
        jg done
       
upr:    sub byte ptr[si],20h
        jmp done
lwr:    add byte ptr[si],20h
            
done:   inc si
        loop check
               
        disp p11
                               
        mov ah,4ch
        int 21h
code ends
end start