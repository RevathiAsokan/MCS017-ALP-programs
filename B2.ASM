; program 2.2 to find ncr for a given n and r
num macro
        push ax                 ; push value in ax to stack
        push bx                 ; push value in bx to stack
        call ncrpro             ; call ncrpro procedure
        pop bx                  ; pop value in stack to bx
        pop ax                  ; pop value in stack to ax
endm

data segment
n dw 0006h                      ; n = 6
r dw 0003h                      ; r = 3
ncr dw 1 dup(0)                 ; ncr = 0
data ends

code segment                    ; initialize cs and ds
assume cs:code, ds:data

start:
        mov ax, data            ; initialize ds with address of data
        mov ds, ax

        mov ax, n               ; move n to ax, ax = n
        mov bx, r               ; move r to bx, bx = r

        call ncrpro             ; call procedure ncrpro

        mov ah, 4ch             ; program terminate function
        int 21h

ncrpro proc                     ; ncr procedure
        cmp bx, ax              ; compare ax = bx
        je res1                 ; jump on equal to res1 
 
        cmp bx, 0               ; compare bx = 0                   
        je res1                 ; jump on equal to res1

        cmp bx, 01h             ; compare bx = 1
        je resn                 ; jump on equal to resn

        dec ax                  ; decrement ax
        cmp bx, ax              ; compare ax = bx
        je incncr               ; jump on equal to incncr

        num

        dec bx                  ; decrement bx
        num
        ret                     ; return

  res1: inc ncr                 ; increment ncr
        ret                     ; return

incncr: inc ncr                 ; increment ncr

  resn: add ncr, ax             ; add ncr = ncr + ax
        ret                     ; return
ncrpro endp                     ; end of procedure ncrpro

        code ends               ; end of segment
end start                       ; end of program
 