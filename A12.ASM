;Program 1.12 to evaluate an equation based on flag
; flag = 1, evaluate 3(x^3) + 4(x) + 5
; flag = 0, evaluate 7(x) + 8
.model small
.stack 10h
.data
flag equ 1              ; flag is set to 1
x dw 0002h              ; x = 2         
res dw 2 dup(0)         ; res to store output
.code
start:
        mov ax, @data
        MOV DS, ax

        if flag         ; flag = 1, evaluate first expression
        mov ax, x       ; ax = 02
        mul x           ; al = 04
        mul x           ; al = 08
        mov bx, 03h     ; bx = 03
        mul bx          ; ax = 24 (stored as 18)

        mov res, ax     ; res = 18
        mov bx, 04h     ; bx = 04
        mov ax, x       ; ax = 02
        mul bx          ; ax = 08

        add ax, 05h     ; ax = 08 + 05 = 13 (stored as D)
        add RES, AX     ; res = 18 + D (24 + 13 = 37) = 25

        else            ; if flag = 0, evaluate second expression, x=0
        mov bx, 07h     ; bx = 07  
        mov ax, x       ; ax = 00
        mul bx          ; ax = 07 x 00 = 00

        add ax, 08h     ; ax = 00 + 08 = 08
        mov res, ax     ; res = 08
        endif

        mov ah, 4ch
        int 21h
end
