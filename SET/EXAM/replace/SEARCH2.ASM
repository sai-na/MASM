print macro s
mov ah,09h
lea dx,s
int 21h
endm

.model small
.stack
.data
msg db 0ah,0dh,"Enter a string: $"
msg2 db 0ah,0dh,"Enter the character to be replaced: $"
msg3 db 0ah,0dh,"Enter the character to replace: $"
msg4 db 0ah,0dh,"The replaced string is : $"
str1 db 50 dup("$")
.code
start:
      mov ax,@data
      mov ds,ax
      
      print msg
      
      lea dx,str1
      mov ah,3fh
      int 21h
      
      print msg2
      mov ah,01h
      int 21h
      mov bl,al
      
      print msg3
      mov ah,01h
      int 21h
      mov cl,al
      
      mov si,0
      
      
      loop1: 
      		cmp str1[si],"$"
      		je exit
      		cmp str1[si],bl
      		je replace
      		inc si
      		jmp loop1
      		
      replace: mov str1[si],cl
      		 inc si
      		 jmp loop1
      		 
      exit:
      	print msg4
      	print str1
      
      			mov ah,4ch
      			int 21h
      		
     
end start
      
