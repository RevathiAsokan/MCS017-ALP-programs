;Program 11: to find the volume of sphere using v = (4/3)pir^3 formular
data segment
r dw ?                          ; copy of radius value
res dw 10 dup('$')              ; array res[10], default value=$(new line)   
msg1 db "enter radius : $"      ; input msg
msg2 db 10, 13, "volume : $"    ; output msg
data ends

code segment
assume cs:code, ds:data

start:
        mov ax, data
        mov ds, ax

        lea dx, msg1            ; print msg to input
        mov ah, 09h
        int 21h

        mov ah, 1               ; accept radius (2) , al = 32
        int 21h

        sub al, 30h             ; al =02
        mov ah, 0
        mov r, ax              ; r = 02

        mov ah, 0               ; ah = 00

        mul r                   ; al = al * r = 2 * 2 = 4
        mul r                   ; al = 4 * 2 = 8
        mov dl, 88              ; dl = 88 (stored as 58)
        mul dx                  ; ax = ax * dx = 88*8 = 704

        mov dx, 0               ; dx = 0, required to perform byte/byte division
        mov bx, 21              ; bx = 21 (stored as 15)
        div bx                  ; ax = ax / bx = 704/21 = 33 (stored as 21)

        lea si, res             ; load effective address of res to si register
        call hex2dec            ; to convert 21 to decimal number

        lea dx, msg2            ; print output msg
        mov ah, 09h
        int 21h

        lea dx, res             ; print result
        mov ah, 09h
        int 21h

        mov ah, 4ch             ; call dos prompt
        int 21h

hex2dec proc
        mov cx, 0               ; cx = 0
        mov bx, 10              ; bx = 10, to divide ax till the quotient is zero
 loop1: mov dx, 0               ; dx = 0, required to perform byte/byte division
        div bx                  ; ax = ax/bx = 21/10, al = 03, dl = 03
        add dl, 30h             ; dl = 33
        push dx                 ; push to stack
        inc cx                  ; cx = 1
        cmp ax, 9               ; cmp (03, 09) - less - no further division
        jg loop1                ; skipped as the above is not greater

        add al, 30h             ; al = 33
        mov [si], al            ; 33 is moved to res array
 loop2: pop ax                  ; 33 stored in stack is moved, ax = 33
        inc si                  
        mov [si], al            ; 33 is moved to res array
                                ; array has 33 and 33 ie., 33
                                ; 21 in hexadecimal = 33 in decimal
        loop loop2
        ret
        hex2dec endp

        code ends
end start
