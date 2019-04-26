;program 1.3 to read 10 chars from console

code segment
assume cs:code

start:

        mov cx, 10

    l1: mov ah, 1
        int 21h

        loop l1

        mov ah, 4ch
	int 21h

	code ends
end start
