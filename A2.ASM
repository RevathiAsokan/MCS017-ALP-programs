;Program 1.2: read a character from console and echo it

code segment
assume cs:code

start:
        mov ah, 01h     ; accepts a character and stores in al
        int 21h        

        mov dl, al      ; copy contents in al to dl
        mov ah, 02h     ; prints characters stored in ah
	int 21h

        mov ah, 4ch     ; call to dos prompt
        int 21h         ; interrupt

	code ends
end start
