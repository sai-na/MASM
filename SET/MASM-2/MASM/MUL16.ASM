data segment
str1 db "Enter the first number: $"
str2 db 13,10, "Enter the second number: $"
str3 db 13,10, "The product is: $"
print macro
        mov dl,al
        add dl,30h
        mov ah,02h
        int 21h
endm
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        lea dx,str1
        mov ah,9
        int 21h
        call read
        mov si,1000
        mov [si],ax
        lea dx,str2
        mov ah,9
        int 21h
        call read
        add ax,[si]
        mov [si],ax
pt1:
        lea dx,str3
        mov ah,9
        int 21h
        mov cx,0000h
        mov ax,[si]
        mov bx,000ah
pt2:
        mov dx,0000h
        div bx
        push dx
        inc cx
        cmp ax,bx
        jge pt2
        print
pt3:
        pop ax
        print
        loop pt3
        mov ah,4ch
        int 21h
read proc
        mov ah,1
        int 21h
        sub al,30h
        mov ah,00h
        mov bx,000ah
        mul bx
        mul bx
        mul bx
        mov cx,ax
        mov ah,1
        int 21h
        sub al,30h
        mov ah,00h
        mov bx,000ah
        mul bx
        mul bx
        add ax,cx
        mov cx,ax
        mov ah,1
        int 21h
        sub al,30h
        mov ah,00h
        mov bx,000ah
        mul bx
        add ax,cx
        mov cx,ax
        mov ah,1
        int 21h
        sub al,30h
        mov ah,00h
        add ax,cx
        mov cx,ax
        ret
        read endp
        mov ah,4ch
        int 21h
        code ends
        end start

