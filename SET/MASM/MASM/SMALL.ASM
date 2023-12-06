.model small
.data
str1 db "enter first no: $"
str2 db 13,10, "enter second no:$"
str3 db 13,10, "the sum is :$"
.code
main proc
mov ax,@data
        mov ds,ax
        lea dx,str1
        mov ah,9
        int 21h
        mov ah,1
        int 21h
        mov bh,al
        lea dx,str2
        mov ah,9
        int 21h
        mov ah,1
        int 21h
        mov bl,al
        sub bh,48
        sub bl,48
        lea dx,str3
        mov ah,9
        int 21h
        add bh,bl
        mov al,bh

        mov bh,0AH
       MOV AH,00H
       MOV DX,00H
        div bh
        MOV CX,AX
        add Cl,48
        mov dl,Cl
        MOV AH,02H
        int 21h
        
        add Ch,48
        mov dl,Ch
        MOV AH,02H
        int 21h
                                                           
       
       
        mov ah,4Ch
        int 21h
   main endp
end main
