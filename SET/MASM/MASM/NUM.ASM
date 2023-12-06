.model small
.data
arr1 db 5h,89h,3h,56h,1h
len1 equ $-arr1
.code
start:mov ax,@data
mov ds,ax

mov   cl,len1-1
agn1:mov cl,ch
mov si,offset arr1
rept1:mov al,[si]
inc si
cmp al,[si]
jbe next1
xchg al,[si]
mov [si-1],al
next1:dec cl
jnz rept1
dec ch
jnz agn1
int 3
end start
