; program to sort a given set of 16-bit unsigned integers into descending order
data segment
arr dw 1111h, 5555h, 9999h, 6666h       ; array of 4 numbers
len dw ($-arr)                       ; length of array
data ends

code segment                    ; intialize cs and ds
assume cs:code, ds:data

start:
        mov ax, data            ; intialize ds with address of data
        mov ds, ax
                                ; perform (len/2)-1
        mov ax, len
        mov dx, 0
        mov bx, 2
        div bx
        dec ax

        mov len, 0              ; len = 0;

outloop:
        mov cx, ax              ; cx = ax (len is stored)
        mov si, 00h             ; initialize si=0

inloop:
        mov ax, arr[si]         ; move arr[si] to ax
        inc si                  ; increment si
        inc si                  ; increment si
        cmp ax, arr[si]         ; compare ax and arr[si]
        jnc next                ; jump on not carry to next

        xchg ax, arr[si]        ; exchange ax and arr[si]
        mov arr[si-2], ax       ; move ax to arr[si-2] 

next: loop inloop               ; loop until cx=0
      dec bx                    ; decrement bx
      jnz outloop               ; jump on not zero to outloop

        mov ah, 4ch             ; program terminate function
        int 21h

        code ends               ; end of segment
end start                       ; end of program
