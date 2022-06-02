		; LAB #3 ASSIGNMENT 2
		; DONE BY YIMAN ALTYNBEK UULU, AMI-19	
		; COMPUTER ARCHITECTURE & ORGANIZATION
		; MELIS OSMONOV
		
		AREA MinMax, CODE, READONLY
		ENTRY
		
		MOV R0, #0						; i = 0
		
		MOV R1, #0 						; j = 0
		
		LDR R2, N						; size of number array
		
		LDR R3, POINTER					; address of first item in array
		
		LDR R4, MaxP					; pointer to max
			
		LDR R5, MinP					; pointer to min
		
		LDR R7, [R4]					; max = 0
		
		LDR R8, [R5]					; min = 0
		
LOOP 	CMP R1, R2 						; j < N ?

		BGE DONE 						; if j >= N (12), finish

;---------------------------instructions--------------------------------
		
		LDR R6, [R3, R0, LSL #2]		; load value from memory
		
		CMP R6, R7						; compare with min
		
		MOVGT R7, R6					; update max if a R6> max 
		
		CMP R6, R8						; compare with min
		
		MOVLT R8, R6					; update min if R6 < min 
		
		ADD R0, #1						; i++

		ADD R1, #1 						; j++
		
;-----------------------------------------------------------------------
		
		B LOOP
DONE 

		STR R7, [R4]					; store max in memory
		
		STR R8, [R5]					; store min in memory
		
STOP 	B STOP

		AREA MinMax, DATA, READWRITE
			
Max 	DCD 0
			
MaxP 	DCD Max
			
Min 	DCD 0
			
MinP 	DCD Min
			
N 		DCD 12
			
NUM1 	DCD 3, -7, 2, -2, 10, 20, 30, 15, 32, 8, 64, 66
			
POINTER DCD NUM1
			
		END 							; End of the program