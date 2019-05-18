; program b8: program to sort a given set of 8 bit unsigned integers into ascending order

data segment
arr db 47h, 58h, 89h, 76h       ; array of 4 nubers
len dw($-arr)                   ; length of the array
data ends

code segment            ; initialize cs and ds
assume cs:code, ds:data

start:
        mov ax, data    ; initialize ds with address of data
        mov ds, ax

        mov bx, len     ; move len to bx, bx = len
        dec bx          ; decrement bx, bx = bx - 1

outloop:
        mov cx, bx      ; move bx to cx, cx = bx
        mov si, 00h     ; intialize si = 0

inloop: mov al, arr[si] ; move arr[si] to al
        inc si          ; increment si
        cmp al, arr[si] ; compare al and arr[si]
        jb next         ; jump on below to next

        xchg al, arr[si]        ; exchange al and arr[si]
        mov arr[si-1], al       ; move al to arr[si-1]

next:   loop inloop             ; loop until cx=0
        dec bx                  ; decrement bx
        jnz outloop             ; jump on not zero to outloop

        mov ah, 4ch             ; program terminate function
        int 21h

        code ends               ; end of segment
end start                       ; end of program
