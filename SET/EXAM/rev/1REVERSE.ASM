.model small
.stack
.data
        msg1 db 0ah,0dh,"Enter the string:$"
        msg2 db 0ah,0dh,"The reversed string is: $"
        str1 db 100 dup('$')

.code
        start:
              mov ax,@data
              mov ds,ax
              lea dx,msg1
              mov ah,09h
              int 21h
              lea dx,str1
              mov ah,3fh
              int 21h
              lea dx,msg2
              mov ah,09h
              int 21h
              mov si,00h
        l2:   cmp str1[si],"$"
              je  l1
              inc si
              jmp l2
        l1:   dec si
              mov dl,str1[si]
              mov ah,02h
              int 21h
              jnz l1
              mov ah,4ch
              int 21h
end start
