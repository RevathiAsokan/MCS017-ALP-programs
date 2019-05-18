;program to display the sum of square of digits of 4 digit number
data segment
msg1 db "Enter a 4 digit number: $"
msg2 db 10,13, "Result : $"
res db 10 dup('$')
data ends

code segment            ; intialize cs and ds
assume cs:code, ds:data

start:
        mov ax, data    ; intialize ds with address of data
        mov ds, ax

        lea dx, msg1    ; load effective address of msg1 to dx
        mov ah, 09h     ; print msg1
        int 21h

        mov cl, 04h     ; cl = 04h

calc:  mov ah, 01h      ; accept a number
        int 21h

        sub al, 30h     ; al = al - 30h
        mov ah, 0       ; ah = 0
        mul al          ; al = al * al

        add bl, al      ; bl = bl + al
        loop calc       ; repeat calc until cx = 0

        mov al, bl      ; al = bl

        lea si, res     ; load effective address of res to si
        call hex2dec    ; call hex2dec procedure

        lea dx, msg2    ; load effective address of msg2 to dx
        mov ah, 09h     ; print msg2
        int 21h

        lea dx, res     ; load effective address of res to dx
        mov ah, 09h     ; print res
        int 21h

        mov ah, 4ch     ; program terminate function
        int 21h

hex2dec proc            ; hex2dec procedure
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
  loop2:
        pop ax
        inc si

        mov [si], al
        loop loop2
        ret

        hex2dec endp

        code ends
end start
