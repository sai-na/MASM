.MODEL SMALL
.DATA
STR1 DB "ENTER FIRST NUMBER : $"
STR2 DB 13,10, "ENTER SECOND NUMBER : $"
STR3 DB 13,10, "THE SUM IS:  $"
.CODE

MAIN PROC
MOV AX,@DATA
MOV DS,AX
LEA DX,STR1
MOV AH,09
INT 21H
MOV AH,01
INT 21H
MOV BL,AL
LEA DX,STR2
MOV AH,09
INT 21H
MOV AH,01
INT 21H
MOV BH,AL
SUB BH,48
SUB BL,48
LEA DX,STR3
MOV AH,09
INT 21H
ADD BH,BL
ADD BH,48
MOV DL,BH
MOV AH,02
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
