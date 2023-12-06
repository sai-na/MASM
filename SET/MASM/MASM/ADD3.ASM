data segment
 n1 db 1h
 n2 db 2h
data ends
code segment
assume cs:code, ds:data
start:
    mov ax,data
    mov ds,ax
    mov al,n1
    mov bl,n2
    add al,bl
    mov dl,al
    next:
       mov bl,2
       div bl
       add ah,30h
       mov ah,02h
       int 21h
       loop next
       
code ends
end start
