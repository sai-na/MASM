.model smal
.stack

.data
d1 db 100 dup("$")
d2 db 0ah,0dh,"Enter the string: $"
d3 db 0ah,0dh,"String is palindrome $"
d4 db 0ah,0dh,"Not palindrome $"

.code
start:
      mov ax,@data
      mov ds,ax

      lea dx,d2
      mov ah,09h
      int 21h

      lea dx,d1
      mov ah,3fh
      int 21h

      sub ax,02h
      mov si,ax
      dec si
      mov cx,ax
      mov di,00h

      l1 : mov ah,d1[di]
           cmp ah,d1[si]
           jne l2
           inc di
           dec si
          loop l1

      lea dx,d3
      mov ah,09h
      int 21h
      jmp l3

      l2: lea dx,d4
          mov ah,09h
          int 21h

      l3: mov ah,4ch
          int 21h
 end start



