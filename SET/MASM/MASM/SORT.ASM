.model small
.stack
.data
list db 5h,1h,2h,3h
.code
mov ax,@data
mov ds,ax
mov dx,03h
again2:mov cx,dx
mov si,offset list
again1:mov al,[si]
cmp al,[si+1]
jl pr1
xchg [si+1],al
xchg [si],al
pr1:
add si,01h
loop again1
dec dx
jnz again2
mov cx,04h
mov si,offset list
alpha:mov dl,[si]
add dl,30h
mov ah,02h
int 21h
add si,01h
dec cx
jnz alpha
mov ah,4ch
int 21h
end

