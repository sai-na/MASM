.MODEL SMALL
.STACK 100H
.DATA
DIGIT1 DB 0AH,0DH,"ENTER THE FIRST DIGIT : $"
DIGIT2 DB 0AH,0DH, "ENTER THE SECOMND DIGIT : $"
RESULT DB 0AH,0DH, "RESULT : $"
.CODE
        START :
                MOV AX,@DATA
                MOV DS,AX
                LEA DX,DIGIT1
                MOV AH,09H
                INT 21H
                MOV AH,01H
                INT 21H
                SUB AL,30H
                MOV BH,AL
                MOV AH,01H
                INT 21H
                SUB AL,30H
                MOV BL,AL
                LEA DX,DIGIT2
                MOV AH,09H
                INT 21H
                MOV AH,01H
                INT 21H
                SUB AL,30H
                MOV CH,AL
                MOV AH,01H
                INT 21H
                SUB AL,30H
                MOV CL,AL
                ADD BL,CL
                MOV AL,BL
                MOV AH,00H
                AAA
                MOV CL,AL
                MOV BL,AH
                ADD BL,BH
                ADD BL,CH
                MOV AL,BL
                MOV AH,00H
                MOV BX,AX
                MOV DX,OFFSET RESULT
                MOV AH,09H
                INT 21H
                MOV DL,BH
                ADD DL,30H
                MOV AH,02H
                INT 21H
                MOV DL,BL
                ADD DL,30H
                MOV AH,02H
                INT 21H
                MOV DL,CL
                ADD DL,30H
                MOV AH,02H
                INT 21H
                END START
                .END


