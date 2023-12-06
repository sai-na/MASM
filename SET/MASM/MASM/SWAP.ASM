print macro s
mov ah,09h
lea dx,s
int 21h
endm

.model small
.stack
.data
msg1 db 0ah,0dh,"Enter a string : $"
msg2 db 0ah,0dh,"The sorted string is : $"
str db 50 dup("$")
.code
start:
mov ax,@data
mov ds,ax

print msg1

lea dx,str
mov ah,3fh
int 21h

mov si,0
dec si
sub ax,02h

outerloop:
inc si
cmp si,ax
je exit
mov di,0
innerloop:

cmp di,ax
je outerloop
mov cl,str[di]
cmp cl,str[di+1]
jge swap
comeback:inc di
jmp innerloop

swap:mov bh,str[di+1]
mov bl,str[di]
mov str[di+1],bl
mov str[di],bh
jmp comeback
exit:print str

mov ah,4ch
int 21h
end start

