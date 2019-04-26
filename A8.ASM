;program 1.8: to read two decimal numbers and display their SUM
data segment
        msg1 db 13, 10, "Enter first no: $"
        msg2 db 13, 10, "Enter second no: $"
        msg3 db 13, 10, "SUM: $"
data ends

code segment
assume cs:code, ds:data

start:
        mov ax, data
        mov ds, ax
                                ; to print msg1 
        lea dx, msg1    
        mov ah, 09h
        int 21h
                                ; to accept first number
        mov ah, 01h             ; 9 is entered
        int 21h

        mov cl, al              ; 39 is moved to cl 
        SUB CL, 30H

        lea dx, msg2
        mov ah, 09h
        int 21h

        mov ah, 01h             ; to accept second number
        int 21h                 ; 8 is entered

        SUB AL, 30H

        ADD AL, CL              ; al = al +  cl = 8 + 9 = 11D, AX=0111
        MOV AH, 0
        AAA

        mov bx, ax              ; bx = 0107
        or bx, 3030h            ; bh = 31, bl = 37

        lea dx, msg3            ; print msg3
        mov ah, 09h
        int 21h
       
        mov dl, bh              ; mov bH to dl and print
        mov ah, 02h
        int 21h

        mov dl, bl              ; mov bL to dl and print
        mov ah, 02h
        int 21h

        mov ah, 4ch             ; call dos
        int 21h                 ; terminate

        code ends
end start

