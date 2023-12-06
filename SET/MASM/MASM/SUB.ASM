 .model small
 .stack 100h
 .data
        text1 db 'Hello World'
        text2 db 13 dup(?)
        count dw 13
.code
begin :mov ax,@data
        mov ds,ax
        mov es,ax
        mov cx,count    
        mov si,0
        mov di,0
        add di,count
        mov text2[di],'$'
        dec di
again:  mov al,text1[si]
        mov text2[di],al
        inc si
        dec di
        loop again
        lea dx,text2
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
        end begin
