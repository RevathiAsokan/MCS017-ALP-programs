;program b13: add two binary numbers and display in binary
data segment
bin db 1, 0, 1, 1, 0, 1, 0, 1, 0, 1
len dw $-bin
res db ?
data ends

code segment            ; intialize cs and ds
assume cs:code, ds:data

start:
        mov ax, data    ; intialize ds with address of data
        mov ds, ax

        mov cx, len     ; cx = len
        mov al, 0       ; al = 0
        mov si, 0       ; si = 0

  next:
        cmp bin[si], 1  ; compare bin[si] != 1
        jne skip        ; jump on not equal to skip
        inc al          ; al = al + 1
  skip:
        inc si          ; si = si + 1
        loop next       ; repeat next untill cx = 0

        add al, 30h     ; al  = al + 30
        mov res, al     ; res = al

        mov ah, 4ch     ; program terminate function
        int 21h

        code ends       ; end of segment
end start               ; end of program
