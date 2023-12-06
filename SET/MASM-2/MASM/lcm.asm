  print macro msg
        lea dx,msg
        mov ah,09h
        int 21h
    endm

    read macro n,j1,j2
        mov cx,0ah
    j1:mov ah,01h
        int 21h                     
        cmp al,0dh
        je j2
        sub al,30h
        mov bl,al
        mov ax,n
        mul cx
        xor bh,bh
        add ax,bx
        mov n,ax
        jmp j1
    j2 :nop
    endm

    .model small
    .stack 100h

    .data
        msg1 db 10,13,'Enter the 1st number: $'
        msg2 db 10,13,'Enter the 2nd number: $'
        msg3 db 10,13,'The LCM= $'
        data1 dw 0
        data2 dw 0
        dat1 dw 0
        dat2 dw 0
    
    .code
    main proc

        mov ax,@data
        mov ds,ax
        print msg1
    
        ;reading 1st multidigit number
        read data1,jump1,jump2
    
        print msg2
        ;reading 2nd multidigit number
        read data2,jump3,jump4
     
        ;copy the data1 and data2 to dat1& dat2
        mov bx,data1
        mov dat1,bx
    
        mov cx,data2
        mov dat2,cx
    
        ;Algorithm for finding lcm
        ;if(dat1=dat2) then  finish, lcm=dat1 or dat2
        ;elseif(dat1<dat2) then  dat1=dat1+data1
        ;else dat2=dat2+data2
        ;repeat 
    loop1:mov ax,dat1
        cmp ax,dat2
        je jump5
        jc jump6
     
        mov ax,dat2
        add ax,cx
        mov dat2,ax
        jmp loop1

    jump6:mov ax,dat1
        add ax,bx
        mov dat1,ax
        jmp loop1
     
        ;printing LCM
    jump5:mov bx,0ah
        xor cx,cx
    
        ;push into stack
    p1:xor dx,dx
        div bx
        push dx
        inc cx
        cmp ax,00h
        jne p1

        print msg3
        ;pop from stack
    display:pop dx
        add dl,30h
        mov ah,02h
        int 21h
        loop display
        mov ah,4ch
        int 21h

    main endp

    end
