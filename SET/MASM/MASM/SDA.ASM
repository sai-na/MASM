.MODEL SMALL
.DATA
STR1 DB "ENTER FIRST NUMBER : $"
STR2 DB 13,10, "ENTER SECOND NUMBER : $"
STR3 DB 13,10, "THE SUM IS:  $"
.CODE
PRINT MACRO MSG
LEA DX,MSG
MOV AH,09
INT 21H
ENDM

INPUT MACRO
MOV AH,01
INT 21H
ENDM

MAIN PROC
MOV AX,@DATA
MOV DS,AX
PRINT STR1
INPUT
MOV BL,AL
PRINT STR2
INPUT
MOV BH,AL
SUB BH,48
SUB BL,48
PRINT STR3
ADD BH,BL
ADD BH,48
MOV DL,BH
MOV AH,02
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
