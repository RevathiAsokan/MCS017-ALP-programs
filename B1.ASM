; program 2.1: find factorial of decimal number given by user
data segment
num db 4h                       ; number = 4
fact dw 1 dup(0)                ; fact = 0
data ends

code segment                    ; initialize cs and ds
assume ds:data, cs:code         
start:
        mov ax, data            ; initialize ds with address of data
        mov ds, ax

        mov ax, 01              ; initialize ax = 1
        mov bl, num             ; move num to bl, bl=num
 loop1: mul bl                  ; multiply bl, al = al * bl
        dec bl                  ; decrement bl, bl = bl - 1
        jnz loop1               ; jump on non zero
        mov fact, ax            ; move ax to fact, fact = ax

        mov ah, 4ch             ; program terminate function
        int 21h

        code ends               ; end of segment
end start                       ; end of program
