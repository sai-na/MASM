ASSUME CS:CODE, DS:DATA
DATA SEGMENT

	MSG1 DB "ENTER A STRING $"
	MSG2 DB 13, 10, "REVERSE STRING IS $"
	STR  DB 100 DUP(?)


DATA ENDS

CODE SEGMENT

	START:MOV AX, DATA
	      MOV DS, AX
	
	      LEA DX, OFFSET MSG1
	      MOV AH, 09H
	      INT 21H
	      MOV BX, 00H
	
	
	UP:   MOV AH, 01H
	      INT 21H
	      CMP AL, 0DH
	      JE  DOWN
	      MOV [STR+BX], AL
	
	      INC BX
	      JMP UP
	
	
	DOWN: DEC BX
	      LEA DX, OFFSET MSG2
	      MOV AH, 09H
	      INT 21H
	
	PRINT:MOV DL, [STR+BX]
	      MOV AH, 02H
	      INT 21H
	      DEC BX
	
	      CMP BX, 00H
	      JNZ PRINT
	      MOV DL, [STR+BX]
	      MOV AH, 02H
	      INT 21H
	
	      MOV AH, 4CH
	      INT 21H

CODE ENDS
END START
