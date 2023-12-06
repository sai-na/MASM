ASSUME CS:CODE,DS:DATA
DATA SEGMENT
OPR1 DW 0033H
OPR2 DW 0054H
RESULT DW 01 DUP(?)
DATA ENDS
CODE SEGMENT
START:    MOV AX,DATA
         MOV DS,AX
          MOV AX,OPR1
          MOV BX,OPR2
          CLC
          ADD AX,BX
          MOV BL,AL
          MOV BH,BL
          AND BL,00F0H
          MOV CL,04
          ROR BL,CL
          MOV DL,BL
          ADD DL,30H
          MOV AH,02H
          INT 21H
          MOV AH,4CH
          INT 21H
          CODE ENDS
          END START
          MOV DI,OFFSET RESULT
          MOV [DI],AX
          MOV AH,4CH
          INT 21H
CODE    ENDS
        END START
