.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "ENTER THE FIRST DIGIT : $$ "
MSG2 DB 0DH,0AH,"ENTER THE SECND DIGIT : $$ "
MSG3 DB 0DH,0AH, "THE SUMMATION IS : "
MSG4 DB ?, "$$"
.CODE
START : 
        MAIN PROC
        MOV AX,@DATA
        MOV DS,AX

        LEA DX,MSG1
        MOV AH,9
        INT 21H

        MOV AH,1
        INT 21H

        MOV CH,AL

        LEA DX,MSG2
        MOV AH,9
        INT 21H

        MOV AH,1
        INT 21H

        ADD AL,CH
        SUB AL,30H
        MOV MSG4,AL

        LEA DX,MSG3
        MOV AH,9
        INT 21H

        END START
        .END
