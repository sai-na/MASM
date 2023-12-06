data segment
string1 db 11h,22h,33h,44h,55h
msg1 db "found$"
msg2 db "not found$"
se db 44h
data ends
print macro msg
mov ah,09h
lea dx,msg
int 21h


endm
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov al,se
lea si,string1
mov cx,04h
up:mov bl,[si]
cmp al,bl
jz fo
inc si
dec cx
jnz up
print msg2




jmp end1
fo:
print msg1


end1:
mov ah,4ch
int 21h
                                                                     
code ends
end start
