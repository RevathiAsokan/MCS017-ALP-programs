;program 1.7: convert ascii code to its bcd equivalent
data segment
        msg1 db 13, 10, "Enter a ASCII code: $"
        msg2 db 13, 10, "It's BCD equivalent is: $"
data ends

code segment
assume cs:code, ds:data

start:
        mov ax, data
        mov ds, ax

        lea dx, msg1    ; print msg1
        mov ah, 09h
        int 21h

        mov ah, 01h     ; accept first digit (3), stored as 33
        int 21h
        sub al, 30h     ; al = 03

        mov bl, al      ; bl = 03

        mov ah, 01h     ; accept second digit (6), stored as 36
        int 21h
        sub al, 30h     ; al = 06

        and bl, 0fh     ; mask upper nibble
        and al, 0fh     ; mask upper nibble

        mov cl, 04h     ; cl = 04

        rol bl, cl      ; bl = 03, cl=04, after rol -> bl = 30
        or al, bl       ; al = 06, bl =30, after or -> al = 36


        mov bl, al      ; bl = 36

        lea dx, msg2    ; print msg2
        mov ah, 09h
        int 21h

        mov dl, bl      ; dl = 36
        mov ah, 02h     ; print 
        int 21h

        mov ah, 4ch
        int 21h

        code ends
end start
