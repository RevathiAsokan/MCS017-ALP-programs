; Program 1.1: Add two numbers present in two consecutive memory

DATA segment
a db 48h                ; a = 48
b db 56h                ; b = 56
sum db 1 dup(0)         ; sum = 0
DATA ends

CODE segment
ASSUME cs: CODE, ds: DATA       ; initialize cs and ds to respective segments

START:
    mov ax, DATA        ; initialize ds 
    mov ds, ax

    mov al, a           ; al = a = 48
    add al, b           ; al = al + b (48 + 56) = 9F

    mov sum, al         ; sum = al = 9F

    mov ah, 4ch         ; program terminate function
    int 21h             ; call DOS service

    CODE ends           ; end of segment

end START               ; end of program
                                       
