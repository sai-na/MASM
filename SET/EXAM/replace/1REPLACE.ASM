read macro x
mov dx,offset x
mov ah,3fh
int 21h
endm

display macro x
mov dx,offset x
mov ah,09h
int 21h
endm

.model small
.stack
.data

msg1 db 0ah,0dh,"ENTER THE STRING:$"
msg2 db 0ah,0dh,"ENTER THE CHARACTER TO BE REPLACED:$"
msg3 db 0ah,0dh,"ENTER THE CHARACTER TO BE REPLACED WITH:$"
msg4 db 0ah,0dh,"NEW STRING IS:$"
str1 db 100 dup("$")

.code

start: 
      mov ax,@data
      mov ds,ax

      display msg1
      read str1
      display msg2
      mov ah,01h
      int 21h
      mov bl,al
      display msg3
      mov ah,01h
      int 21h
      mov cl,al
      mov si,00h


   L0:
      cmp str1[si],'$'
      je L3
   L1:
      cmp str1[si],bl
      je L2
      inc si
      jmp L0
   L2:
      mov str1[si],cl
      inc si
      jmp L0
   L3:
      display msg4
      display str1
  END START
