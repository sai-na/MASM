ASSUME CS:CODE,DS:DATA
DATA SEGMENT
OPR1 DW 0033H
OPR2 DW 0054H
MSG DB "The sum is $"
DATA ENDS
CODE SEGMENT
START  :  MOV AX,DATA
          MOV DS,AX
          MOV DX,OFFSET MSG
          MOV AH,09
          INT 21H
          MOV AX,BX
          MOV BL,AL
          MOV BH,BL
          AND BL,00F0H
          MOV CL,04
          ROR BL,CL
          MOV DL,BL
          CODE ENDS
          END START
