;sring Reverse-8086
.model small
.stack 100h
.data
        text1 db 'hello world'
        text2 db 13 dup(?)
.code
begin:  mov ax,@data
        mov ds,ax
        mov es,ax
        mov cx,count;   cx=13
        mov si,0
        mov di,0
        add di,count;
        dec di
again:  mov al,text1[si]
        mov text2[di],al
        inc si
        dec di
        loop again
        mov ah,4ch;     service number
        int 21h;        exit to dos
        end begin

