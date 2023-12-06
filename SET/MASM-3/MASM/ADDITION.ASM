.model small
disp macro r
mov dl,r
add dl,30h
mov ah,02
int 21h
endm
.data
str1 db "Enter first number: $"
str2 db 13,10, "Enter second number: $"
str3 db 13,10, "The sum is: $"
.code
main proc
mov ax,@data
        mov ds,ax
        mov al,2
        disp al
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
        add bh,bl
        mov al,bh
        mov ah,00
        mov cl,0aH
        div cl
        mov cx,ax
        disp cl
        disp ch
        mov ah,4ch
        int 21h
        main endp
        end


