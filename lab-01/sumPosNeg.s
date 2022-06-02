		; LAB #1 ASSIGNMENT 2
		; DONE BY YIMAN ALTYNBEK UULU, AMI-19	
		; COMPUTER ARCHITECTURE & ORGANIZATION
		; MELIS OSMONOV
		
		AREA SUM_POS_NEG, CODE, READONLY
		ENTRY		
		
		MOV r0, #0						; i = 0
		ADR r1, NUMBERS					; address of array
		
		ADR r2, POS_SUM					; address of variable
		ADR r3, NEG_SUM					; address of variable
		
		LDR r4, [r2]					; load inital value
		LDR r5, [r3]					; load inital value
				
LOOP	
		LDR r6, [r1, r0, lsl #2]		; load value from memory
		
		CMP r6, #0						; r < 0?
				
		BEQ FINISH						; is it 0? exit on sentinel (0) encounter
					
		ADDGT r4, r4, r6				; sum positive numbers

		ADDLT r5, r5, r6				; sum negative numbers
		
		ADD r0,r0,#1					; i = i + 1          
		
		B	LOOP
FINISH

		STR r4, [r2]					; save the result in memory
		STR r5, [r3]					; save the result in memory
		
		LDR r7, POS_SUM					; the saved result
		LDR r8, NEG_SUM					; the saved result

S		B S								; terminate program

		AREA SUM_POS_NEG, DATA, READWRITE
		ALIGN
NUMBERS DCD 20, -8, -35, 10, 15, -7, 0	; array
POS_SUM DCD 0							; sum of positive values only
NEG_SUM DCD 0							; sum of negative values only
	
		END
		






		
