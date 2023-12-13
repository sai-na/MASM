display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

clear_reg macro
xor bx,bx
xor dx,dx
xor cx,cx
xor ax,ax
endm

input macro
clear_reg
mov ax,num1
mov bx,num2
endm

output macro num
clear_reg
mov ax,num
call disp
endm

.model small
.stack
.data
msg1 db 0ah,0dh,"Enter the first number: $"
msg2 db 0ah,0dh,"Enter the second number: $"
msg3 db 0ah,0dh,"Sum: $"
msg4 db 0ah,0dh,"Difference: $"
msg5 db 0ah,0dh,"Product: $"
msg6 db 0ah,0dh,"Quotient: $"
msg7 db 0ah,0dh,"Remainder: $"

num1 dw ?
num2 dw ?
temp dw 0
sum dw 0
diff dw 0
prd1 dw 0
quo dw 0
rem dw 0

.code
start:
        mov ax,@data
        mov ds,ax
        display msg1
        call read
        mov num1,ax
        display msg2
        call read
        mov num2,ax
        input
        add ax,bx
        mov sum,ax
        input
        sub ax,bx
        mov diff,ax
        input
        mul bx
        mov prd1,ax
        input
        div bx
        mov quo,ax
        mov rem,dx
        display msg3
        output sum
        display msg4
        output diff
        display msg5
        output prd1
        display msg6
        output quo
        display msg7
        output rem
        mov ah,4ch
        int 21h


read proc
mov ax,00
mov cx,04h
l1: mov dl,10
mul dx
mov temp,ax
mov ah,01h
int 21h
sub al,30h
mov ah,00
mov bx,temp
add ax,bx
loop l1
ret
read endp

disp proc
mov bx,10
mov cx,00h
l2:mov dx,00h
inc cx
div bx
push dx
cmp ax,00h
jne l2
l3: pop dx
add dl,30h
mov ah,02h
int 21h
loop l3
ret
disp endp

end start


