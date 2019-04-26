;program 1.14: add sales tax in price list and replace price list with a new list
data segment
price db 52h, 45h, 36h, 25h     ; price list of 4 products
tax db 0ah                      ; tax = 10
data ends

code segment
assume ds:data, cs:code
start:
        mov ax, data
        mov ds, ax

        lea dx, price           ; load effective address of price to dx
        mov cx, 04              ; cx = 04 (no. of products)

 loop1: mov al, [bx]            ; move price list one by one to al = 52h
        add al, tax             ; al = 52 + 10 = 62
        daa                     ; decimal adjust after addition
        mov [bx], al            ; replace the new price to the price list
        inc bx                  ; increment bx
        dec cx                  ; decrement cx
        jnz loop1               ; jump on non zero ie., jump if zf = 1

        mov ah, 4ch
        int 21h

        code ends
end start
