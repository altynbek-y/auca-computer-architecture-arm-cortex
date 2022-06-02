		; LAB #3 ASSIGNMENT 1
		; DONE BY YIMAN ALTYNBEK UULU, AMI-19	
		; COMPUTER ARCHITECTURE & ORGANIZATION
		; MELIS OSMONOV
		
		AREA AddGT, CODE, READONLY
		ENTRY
		
		MOV R0, #0						; i = 0
		
		MOV R1, #0 						; j = 0
		
		LDR R2, N						; size of number array
				
		LDR R3, POINTER					; address of first item of array
				
		LDR R4, SUMP					; pointer to sum
		
		LDR R6, [R4]					; sum = 0
				
LOOP 	CMP R1, R2 						; j < N ?

		BGE DONE 						; if j >= N (7), finish
		
;--------------------------instructions---------------------------------

		LDR R5, [R3, R0, LSL #2]		; load value from memory
				
		CMP R5, #5						; compare with 5
		
		ADDGT R6, R5					; add up values greater than 5
		
		ADD R0, #1						; i++

		ADD R1, #1 						; j++
	
;-----------------------------------------------------------------------
		
		B LOOP
DONE 

		STR R6, [R4] 					; store sum in memory

STOP 	B STOP
		
		AREA AddGT, DATA, READWRITE
			
SUM 	DCD 0
	
SUMP 	DCD SUM
	
N 		DCD 7
	
NUM1 	DCD 3, -7, 2, -2, 10, 20, 30
	
POINTER DCD NUM1
	
		END 							; End of the program
			
			
			; 2^4 = 16, 30 - 16 = 14, 2^3 14 - 8 = 6, 2^2 = 4, 6 - 4 = 2 2^1 
			; 0001 1110 = 1E
			
			
			
			
			
			
			
			
			
			
			
				;MOV R0, R0, LSL #2
		
		;LDR R7, [R4]					
		
		;ADD R4, #0x4