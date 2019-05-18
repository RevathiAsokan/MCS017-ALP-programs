; program to convert ASCII number to decimal

data segment
msg1 db 10,13,"Enter a ASCII character: $"
msg2 db 10,13,"It's decimal equivalent is: "
res db 10 dup ("$")
data ends

code segment            ; intialize cs and ds
assume cs:code, ds:data

start:
        mov ax, data    ; initialize ds with address of data
        mov ds, ax

        lea dx, msg1    ; load effective address of msg1
        mov ah, 09h     ; print msg1
        int 21h

        mov ah, 01h     ; accept number
        int 21h

        mov ah, 0h      ; intialize ah = 0

        lea si, res     ; load effective address of res to si
        call hex2dec    ; call hex2dec procedure

        lea dx, msg2    ; load effective address of msg2 
        mov ah, 09h     ; print msg2
        int 21h

        mov ah, 4ch     ; program terminate function
        int 21h

hex2dec proc            ; hex2dec procedure
        mov cx, 0       ; initalize cx = 0
        mov bx, 10      ; intialize bx = 10

 loop1: mov dx, 0       ; initialize dx = 0
        div bx          ; ax =  ax / bx
        add dl, 30h     ; dl =  dl + 30h

        push dx         ; push value in dx to stack
        inc cx          ; cx = cx + 1

        cmp ax, 9       ; compare ax > 9
        jg loop1        ; jump on greater to loop1

        add al, 30h     ; al =  al + 30h
        mov [si], al    ; move al to [si]

 loop2: pop ax          ; pop value in stack to ax
        inc si          ; si = si + 1
        mov [si], al    ; move al to [si]
        loop loop2      ; repeat loop2 until cx = 0
        ret             ; return
hex2dec endp            ; end of procedure hex2dec

        code ends       ; end of segment
end start               ; end of program
