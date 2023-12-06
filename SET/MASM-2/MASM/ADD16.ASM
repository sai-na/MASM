data segment
n1 db 02h
n2 db 05h
data ends
code segment
assume cs:code,es:data
start:
mov ax,data
mov es,ax
mov al,n1
mov bl,n2
add al,bl
add al,30h
mov dl,al
mov ah,02h
int 21h
mov ah,4ch
int 21h
code ends
end start

