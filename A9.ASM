;program to read two decimal numbers and print out the smaller in decimal
data segment
msg1 db 10,13, "Enter a decimal number: $"
msg2 db 10,13, "The smallest number is: $"
data ends

code segment
assume cs:code, ds:data

start:
        mov ax, data
        mov ds, ax

        lea dx, msg1    ; print msg
        mov ah, 09h
        int 21h
                       
        mov ah, 01h     ; accept first number (5) , al = 35  
        int 21h
        sub al, 30h     ; al = 05

        mov bl, al      ; bl = 05

        lea dx, msg1    ; print msg 
        mov ah, 09h
        int 21h

        mov ah, 01h     ; accept second number (2), al=32
        int 21h
        sub al, 30h     ; al = 02

        cmp al, bl      ; (02 < 05) , cf = 1
        jnc l1          ; jump to l1 only if cf = 0

        mov cl, al      ; cl = 02
        jmp disp        ; jump to display

    l1: mov cl, bl
 
  disp: lea dx, msg2    ; print msg
        mov ah, 09h
        int 21h

        mov dl, cl      ; dl = 02
        add dl, 30h     ; dl = 32
        mov ah, 02h     ; print output
        int 21h

        mov ah, 4ch
        int 21h

        code ends
end start
