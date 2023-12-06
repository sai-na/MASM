print macro s
mov ah,09h
lea dx,s
int 21h
endm

.model small
.stack
.data
msg db "Enter a string: $"
msg2 db "Enter a word to search: $"
msg_y db "Word found $"
msg_n db "Word not found $"
nl db 0dh,0ah, "$"
str1 db 50 dup("$")
str2 db 50 dup("$")
.code
start:
      mov ax,@data
      mov ds,ax

      print msg

      lea dx,str1
      mov ah,3fh
      int 21h

      print msg2

      lea dx,str2
      mov ah,3fh
      int 21h

      mov si,0
      mov di,0

      loop1:
            cmp str2[di],"$"
            je present
            cmp str1[si],"$"
            je notpresent
            mov bl,str1[di]
            cmp str2[si],bl
            jne notequal
            inc di
            inc si
            jmp loop1

      notequal:
             mov di,0
             inc si
             jmp loop1

      present:
              print msg_y
              jmp skip

      notpresent:
              print msg_n

      skip:
      
            mov ah,4ch
            int 21h
end start
