ASSUME CS:CODE,DS:DATA
DATA SEGMENT
MSG DB "HELLO WORLD $"
DATA ENDS
CODE SEGMENT
START:MOV AX,DATA
MOV DS,AX
MOV DX,OFFSET MSG
MOV AH,09
INT 21H
CODE ENDS
END START
