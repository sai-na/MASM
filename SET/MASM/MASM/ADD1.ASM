.model small
.stack 100h
.data
op1 dw ?
op2 dw ?
res  dw? 
carry dw ?
.code
start:mov ax,@data
mov ds,ax
mov ax,0000h
mov ax,op1
mov bx,op2
add ax,bx
jnc li
inc cx
li:mov res,ax
mov ax,cx
mov carry,ax
mov ah,4ch
int 21h
end


