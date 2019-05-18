;program to display date and time

data segment
msg1 db 10,13, "The current time is: "  ; msg to display time
hour db 2 dup(0), ':'                   ; hour variable to store 2 digit hours
min db 2 dup(0), ':'                    ; min variable to store 2 digit minutes
sec db 2 dup(0), '$'                    ; sec variable to store 2 digit seconds
data ends

code segment
assume cs:code, ds:data

start:
        mov ax, data
        mov ds, ax

        mov ah, 2ch             ; to get system time
        int 21h                 ; hours is stored in ch
                                ; minutes is stored in cl
                                ; seconds is stored in dh

        mov al, ch              ; move hours stored in ch to al
        aam                     ; ascii adjust after multiplication
        add ax, 3030h           ; add 
        mov hour, ah            ; move first digit of hours to hour variable
        mov hour+1, al          ; move second digit of hours to hour + 1 variable

        mov al, cl              ; move minutes stored in cl to al 
        aam                     ; ascii adjust after multiplication
        add ax, 3030h           ; add
        mov min, ah             ; move first digit of minutes to min variable
        mov min+1, al           ; move second digit of minutes to min + 1 variable

        mov al, dh              ; move seconds stored in dh to al
        aam                     ; ascii adjust afte multiplication
        add ax, 3030h           ; add
        mov sec, ah             ; move first digit of seconds to sec variable
        mov sec+1, al           ; move second digit of seconds to sec + 1 variable

        lea dx, msg1            ; load effective address of msg1 to dx
        mov ah, 09h             ; prints msg1
        int 21h

        mov ah, 4ch
        int 21h
        code ends
end start
