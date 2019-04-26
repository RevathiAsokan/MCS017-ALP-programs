;Program 10: To find average of three numbers stored in memory

data segment
a db 10h
b db 20h
c db 30h
n db 03h
avg db ?
data ends

code segment
assume cs:code, ds:data
start:
        mov ax, data
        mov ds, ax

        mov al, a       ; al = 10
        add al, b       ; al = 30
        add al, c       ; al = 60
        mov ah, 00      ; ah = 00, req when byte/byte division is performed

        div n           ; al = 60/03 = 20

        mov avg, al     ; avg = 20

        mov ah, 4ch
        int 21h

        code ends
end start
