; program to genearte interrupt when there is a division by zero
data segment
msg1 db 10,13, "Enter first number: $"
msg2 db 10,13, "Enter second number: $"
msg3 db 10,13, "Division by zero error $"
msg4 db 10, 13, "No division by zero error $"
data ends

code segment
assume cs:code, ds:data

start:
        mov ax, data
        mov ds, ax

        lea dx, msg1
        mov ah, 09h
        int 21h

        mov ah, 01h
        int 21h

        sub al, 30h
        mov bl, al

        lea dx, msg2
        mov ah, 09h
        int 21h

        mov ah, 01h
        int 21h

        sub al, 30h
        cmp al, 0
        je skip

        lea dx, msg4
        mov ah, 09h
        int 21h

        mov ah, 4ch
        int 21h

        
skip:
        lea dx, msg3
        mov ah, 09h
        int 21h

        mov ah, 4ch
        int 21h

        code ends
        end start
