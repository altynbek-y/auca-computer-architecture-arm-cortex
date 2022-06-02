		; LAB #1 ASSIGNMENT 1
		; DONE BY YIMAN ALTYNBEK UULU, AMI-19	
		; COMPUTER ARCHITECTURE & ORGANIZATION
		; MELIS OSMONOV
		
		AREA convertF2CandC2F, CODE, READONLY
		ENTRY
		
;---------------Fahrenheit to Celsius-------------------
		
		LDR r0, F 			; F = 85
		LDR r5, E
		MOV r1, #5  		; multiply by 5
		SUB r0, r0, #32 	; F - 32
		MUL r2, r1, r0 		; 5*(F - 32)
		
		MOV r1, #0 			; initialize counter
		MOV r0, #9 			; divide by 9
		
subtr1
		SUBS 	r2, r2, r0	; r2 = r2-r0
		ADD		r1, r1, #1	; increment r1
		
		BHI 	subtr1		; loop
							; result is in r1

;----------------Celsius to Fahrenheit------------------
		
		LDR r2, C			; C = 32
		MOV r3, #9			; multiply by 9
		MUL r4, r2, r3		; 9*C
		
		MOV r3, #0 			; initialize counter
		MOV r0, #5 			; divide by 5
		
subtr2

		SUBS 	r4, r4, r0	; r4 = r4-r0
		ADD		r3, r3, #1	; increment r0
		
		BHI 	subtr2		; loop
							; result is in r3
		ADD r3, r3, #32

		ALIGN
S		B	S

		AREA convertF2CandC2F, DATA, READWRITE
F		DCD 85				; F = 85
C		DCD 32				; C = 32
;E		DCD 56

		END					; end of program
		
		