.model small
.stack
.code
start:
mov cx,0008h
mov ax,0001h
l1:     mul cx
        dec cx
        jnz l1

mov bx,10
mov cx,0000h

l2:     mov dx,00h
        inc cx
        div bx
        push dx
        cmp ax,00h
        jne l2
l3:     pop dx
        add dl,30h
        mov ah,02h
       int 21h
       loop l3

mov ah,4ch
int 21h


end start
