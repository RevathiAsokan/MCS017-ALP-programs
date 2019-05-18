;program program to accept input till zero is entered and print its sum
data segment
msg1 db 10,13, "Enter numbers (1-9), enter 0 to stop: $"
msg2 db 10,13, "Sum: $"
data ends

code segment            ; initialize cs and ds
assume cs:code, ds:data 

start:
        mov ax, data    ; intialize ds with address of data
        mov ds, ax

        mov bl, 0       ; intialize bl = 0
                 
        lea dx, msg1    ; load effective address of msg1 to dx
        mov ah, 09h     ; print msg1
        int 21h

input:                  
        mov ah, 01h     ; accept number
        int 21h

        cmp al, 30h     ; compare al with 30h(ie., 0)
        je exit         ; jump on equal to exit

        sub al, 30h     ; subtract al by 30h, al = al -30
        add al, bl      ; add al and bl, al = al + bl
        mov bl, al      ; move al to bl, bl = al
        jmp input       ; jump to input (to accep the next number)

 exit:                  ; to exit if zero is entered and print sum
        lea dx, msg2    ; load effective address of msg2 to dx
        mov ah, 09h     ; print msg2
        int 21h

        mov al, bl      ; move bl to al, al = bl
        aam             ; ascii adjust after multiplication

        add ax, 3030h   ; add 3030h to ax, ax = ax + 3030h
        mov bx, ax      ; move ax to bx, bx = ax

        mov dl, bh      ; move bh to dl, dl = bh
        mov ah, 02h     ; print value stored in dl
        int 21h

        mov dl, bl      ; move bl to dl, dl = bh
        mov ah, 02h     ; print value stored in dl
        int 21h

        mov ah, 4ch     ; program terminate function
        int 21h

        code ends       ; end of segment
end start               ; end of program
