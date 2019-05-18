;program to add two 5 - byte numbers (stored in array)

data segment
num1 db 01h, 01h, 27h, 42h, 11h ; array of 5 byte numbers
num2 db 55h, 44h, 22h, 41h, 03h ; array of 5 byte numbers
res db 5 dup(0)
data ends

code segment                    ; intialize ds and cs
assume cs:code,ds:data
start:
        mov ax, data            ; intialize ds with address of data
        mov ds, ax

        lea si, num1            ; load effective address of num1 to si
        lea di, num2            ; load effective address of num2 to di
        lea bx, res             ; load effective address of res to bx

        mov cx, 5               ; cx = 5

 loop1:
        mov al, [si]            ; [si] = al

        add al, [di]            ; al = al + [di]
        mov [bx], al            ; [bx] = [bx] + al

        inc bx                  ; bx = bx + 1
        inc si                  ; si = si + 1
        inc di                  ; di = di + 1

        loop loop1              ; repeat loop1 until cx = 5

        mov ah, 4ch             ; program terminate function
        int 21h

        code ends               ; end of segment
end start                       ; end of program
