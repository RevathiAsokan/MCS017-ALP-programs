; program to arrange  given N numbers in descending order
data segment
arr db 47h, 58h, 89h, 76h       ; array of 4 numbers 47, 58, 89, 76
len dw ($-arr)                  ; length of array, len = 4
data ends

code segment
assume cs:code,ds:data          ; initialize cs and ds

start:	
        mov ax,data             ; initialize ds with address of data
        mov ds,ax

        mov bx,len              ; move len to bx, bx = len
        dec bx                  ; decrement bx, bx = bx -1

outloop:	
        mov cx,bx               ; move bx to cx, cx = bx
        mov si,00h              ; initialize si = 0

inloop: 	
        mov al,arr[si]          ; move arr[si] to al
        inc si                  ; increment si = si + 1
        cmp al,arr[si]          ; compare al and arr[si]
        jnc next                ; jump on not carry to next

        xchg al,arr[si]         ; exchange al and arr[si]
        mov arr[si-1],al        ; move al to arr[si-1]

  next: 
        loop inloop             ; loop until cx=0
        dec bx                  ; decrement bx
        jnz outloop             ; jump on not zero to outloop
		
        mov ah,4ch              ; program terminate function
        int 21h

        code ends               ; end of segment
end start                       ; end of program
