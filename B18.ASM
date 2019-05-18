; program to conduct a binary search on sorted array of 16 bit unsigned integers

data segment
array dw 1111h, 2222h, 3333h, 4455h, 5544h, 6106h, 7770h        ; a is an array of 7 words
len dw($-array)/2                                               ; length of the array is calculated
skey equ 2222h                                                  ; search key is equated to 4455h
msg1 db "Element is found at "                                  ; if search is successful display msg and result
result db ' st/nd/rd/th position', 13,10, "$"
msg2 db "element is not found $"                                ; if search is unsuccessful display the msg
data ends

code segment
assume cs: code, ds:data    

start:
        mov ax, data    ; initialize data segment with starting  address of data
        mov ds, ax

        mov bx, 00h     ; bx contains the low value
        mov dx, len     ; dx contains the high value
        mov cx, skey    ; key to be searched is moved to count register

 again:
        cmp bx, dx      ; compare lower and higher indices
        ja failure      ; if low>high jump to failure lable

        mov ax, bx      ; else move low value to ax
        add ax, dx      ; add low and high indices and store in ax

        shr ax, 01      ; divide the sum by 2 to get the mid value

        mov si, ax      ; store mid value in index register
        add si, si      ; double to get the mid element
        cmp cx, array[si] ; if key greater than or equal to array's mid element

        jae bigger      ; jump to bigger lable
        dec ax          ; else get new higher index
        mov dx, ax      ; store in dex reg
        jmp again       ; continue process from label again

 bigger:
        je success      ; continue process from label again
        inc ax          ; else find new lower index

        mov bx, ax      ; store it in bx reg
        jmp again       ; go to label again to repeat process
                        

 success:               
        add al, 01h     ; to get position of element
        add al, '0'     ; convert to ascii   

        mov result, al  ; store position in result

        lea dx, msg1    ; load effective address of msg1 to dx
        jmp disp        ; jump to label disp

  failure:              
        lea dx, msg2    ; if unsuccessful load effective address of msg2 to dx

  disp:
        mov ah, 09h     ; to interrupt display
        int 21h         ; dos prompt to terminate the program

        mov ah, 4ch     ; and go back to prompt
        int 21h         ; interrupt to os

        code ends       ; end of code segment
end start               ; physical end of program
        
