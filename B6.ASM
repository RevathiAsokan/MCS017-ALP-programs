; program to find the hcf of two 16 bit unsigned integers
data segment
num1 dw 0006            ; num1 = 06
num2 dw 0003            ; num2 = 03
hcf dw ?                ; hcfs
data ends

code segment
assume cs:code, ds:data ; initialize cs and ds

start:
        mov ax, data    ; initialize ds with address of data
        mov ds, ax
	
        mov ax, num1    ; ax = num1
        mov bx, num2    ; bx = num2

while: 
        mov dx, 0       ; intialize dx = 0
        mov cx, bx      ; cx = bx
	
        div bx          ; ax = ax / bx , ax=quotient, dx= remainder
	
        mov bx, dx      ; bx = dx
        mov ax, cx      ; ax = ax
	
        cmp bx, 0       ; compare bx, 0
        jne while       ; jump on not equal to while
	

        mov hcf, ax     ; hcf = ax

        mov ah, 4ch     ; program terminate function
	int 21h
	
        code ends       ; end of segment
	
end start               ; end of program
