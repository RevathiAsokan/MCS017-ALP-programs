;program to find the largest number in an array of 10 elements

data segment
arr db 1,4,2,3,9,8,6,7,6,10     ; array of 10 numbers
max db ?                        ; max to store the largest number
data ends

code segment                    ; initialize ds and cs
assume cs:code, ds:data
start:
        mov ax, data            ; initialize ds with address of data
        mov ds, ax

        lea si, arr             ; load effective address of arr to si register
        mov al, arr[si]         ; al = arr[si]

        mov max, al             ; max = al
        mov cx, 0ah             ; cx = 10h

repeat:
        mov al, arr[si]         ; al = arr[si]

        cmp max, al             ; compare max, al
        jg nochange             ; jump on greater than to nochange

        mov max, al             ; max = al

nochange:
        inc si                  ; increment si
        loop repeat             ; repeat loop until cx=0

        mov ah, 4ch             ; program terminate function
        int 21h

        code ends               ; end of segment
end start                       ; end of program
        
code ends
end start


