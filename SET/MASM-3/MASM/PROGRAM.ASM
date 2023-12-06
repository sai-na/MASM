.model small
.data
str1 db "enter first number: $"
str2 db 13,10,"enter the second number: $"
str3 db 13,10,"the sum is : $"
.code
start:
    mov ax,@data
    mov ds,ax
    lea dx,str1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    lea dx,str2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bh,al
    sub bh,48
    sub bl,48

    lea dx,str3
    mov ah,9
    int 21h
    add bl,bh
    mov bh,0
    mov ax,bx
    mov cx,10
    div cx
    add ax,48
    add dx,48
    add ax,dx
    mov al,bh
    add al,48
    mov dl,bh
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
  end start
  .end

