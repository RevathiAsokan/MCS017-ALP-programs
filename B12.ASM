; program to perform the following operation z=((a-b)/10*c)**2
; check
data segment
a db 40h        ; a = 40h
b db 20h        ; b = 20h
c db 02h        ; c = 02h
z dw ?          ; z 
data ends

code segment            ; intialize cs and ds
assume cs:code, ds:data

start:
        mov ax, data    ; intialize ds with address of data
        mov ds, ax

        mov ah, 0       ; intialize ah = 0
        mov al, a       ; al = a
        sub al, b       ; al = al - b

        mov bl, 10h     ; intiazlie ah = 10h
        div bl          ; al = al / bl
                  
        mul c           ; al = al * c

        mul al          ; al = al * al

        mov z, ax       ; z = ax
     
        mov ah, 4ch     ; program terminate function
        int 21h

        code ends       ; end of segment
end start               ; end of program




























