;Program 1.13: to convert centigrate to farenheit
; c = (f-32)*5/9  ie., f =(c*9/5) + 32

data segment
res db 10 dup('$')
msg1 db "Enter temperature in celsius (only in 2 digits) : $"
msg2 db 10, 13, "Coverted into fahrenheit : $"
data ends

code segment
assume cs: code, ds:data
start:
        mov ax, data
        mov ds, ax

        lea dx, msg1            ; print input msg
        mov ah, 09h
        int 21h

        mov ah, 01h             ; accept first digit of input 2, al = 32
        int 21h
        sub al, 30h             ; al = 02

        mov ah, 0               ; ah = 00
        mov bl, 10              ; bl = 10 (stored as A)
        mul bl                  ; al = al * bl = 2 * 10 = 20 (stored as 14)
        mov bl, al              ; bl = 20 (stored as 14)

        mov ah, 01h             ; accept second digit of input 0, al =30
        int 21h
        sub al, 30h             ; al = 00

        mov ah, 00              ; ah = 00
        add al, bl              ; al = 00 + 20 = 20 (stored as 14)

        mov dl, 9               ; dl = 09
        mul dl                  ; al = 20 * 09 = 180 (sotred as B4)

        mov bl, 5               ; bl = 05
        div bl                  ; al = 180/5 = 36 (sotred as 24)

        mov ah, 0               ; ah = 0
        add al, 32              ; al = 36 + 32 = 68 (stored as 44)

        lea si, res             ; load effective address of res to si register
        call hex2dec            ; call to convert hexadecimal number 44 to decimal 68

        lea dx, msg2            ; print output msg
        mov ah, 09h
        int 21h

        lea dx, res             ; print result
        mov ah, 09
        int 21h

        mov ah, 4ch             ; call dos prompt
        int 21h                         

hex2dec proc                    ; to convert hexadecimal to decimal
        mov cx, 0
        mov bx, 10
 loop1: mov dx, 0
        div bx
        add dl, 30h
        push dx
        inc cx

        cmp ax, 9
        jg loop1

        add al, 30h
        mov [si], al
 loop2: pop ax
        inc si
        mov [si], al
        loop loop2
        ret
        hex2dec endp

        code ends
end start
