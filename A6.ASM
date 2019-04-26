;program 1.6: to read two decimal numbers and display their product
data segment
        msg1 db 13, 10, "Enter first no: $"
        msg2 db 13, 10, "Enter second no: $"
        msg3 db 13, 10, "Product: $"
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
;       AND cl, 0fh             ; convert ascii to digit , cl = 39 & 15 = 9
                                      ; to print msg2
        SUB CL, 30H

        lea dx, msg2
        mov ah, 09h
        int 21h

        mov ah, 01h             ; to accept second number
        int 21h                 ; 5 is entered
      ;  and al, 0fh             ; al = 35 & 15 = 5

        SUB AL, 30H

        mul cl                  ; al = al * cl = 5 * 9 = 2D
        aam                     ; ah = 04, al=05  i.e., ax=0405

        mov bx, ax              ; bx = 0405
        or bx, 3030h            ; bh = 34, bl = 35

        lea dx, msg3            ; print msg3
        mov ah, 09h
        int 21h
       
        mov dl, bh              ; mov bh = 04 to dl and print
        mov ah, 02h
        int 21h

        mov dl, bl              ; mov bl = 05 to dl and print
        mov ah, 02h
        int 21h

        mov ah, 4ch             ; call dos
        int 21h                 ; terminate

        code ends
end start

