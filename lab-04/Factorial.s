			; LAB #4 ASSIGNMENT 2
			; DONE BY YIMAN ALTYNBEK UULU, AMI-19	
			; COMPUTER ARCHITECTURE & ORGANIZATION
			; INSTRUCTOR MELIS OSMONOV
			
			AREA Factorial, CODE, READONLY
				
			ENTRY
			
			LDR SP, =INITIAL_MSP
			MOV R0, #1					; result - N!
			
			LDR R1, N 					; number - N
			
			PUSH {R0}					; push 1 onto stack
			
			
			BL FACTORIAL				; procedure call
			
Stop		B	Stop					; infinite loop - terminaton of program

			;-----------------------------------memory----------------------------------------------------------------
			
			AREA Factorial, DATA, READWRITE
				
			ALIGN
			
N 			DCD	7						; number whose factorial is to be found
	
INITIAL_MSP EQU 0x00009000  			; Initial Main Stack Pointer Value
			
			;---------------------------factorial-definiton-----------------------------------------------------------
			
FACTORIAL 	PROC						; procedure
							
loop
			POP {R0}					; pop a number from stack
		
			MUL R2, R0, R1				; R2 = R0 * R1
			
			MOV R0, R2					; R0 = R2

			PUSH {R0}					; push the product onto stack
			
			SUBS R1, R1, #1				; R1-- and set flag
			
			BNE loop					; continue if != 0
			
			POP {R0}					; R0 = N!

			BX LR						; return
				
			ENDP						; end of the procedure
		
			END							; end of the program
			
			
			









			
			





