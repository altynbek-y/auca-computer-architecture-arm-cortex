			; LAB #4 ASSIGNMENT 1
			; DONE BY YIMAN ALTYNBEK UULU, AMI-19	
			; COMPUTER ARCHITECTURE & ORGANIZATION
			; INSTRUCTOR MELIS OSMONOV
		
			AREA CountVowelsTwo, CODE, READONLY
				
			ENTRY				
						
			ADR R0, TEXT 		; address of a character in the string
			
			ADR R1, VOWELS		; address of a vowel character in the string
			
			MOV R2, #0 			; counter for vowels
			
			MOV R3, #0 			; counter for non-vowels
					
			;----------------------------------main-program-----------------------------------------------------------
						
			BL COUNTFUNC		; call the subroutine
		
Stop		B	Stop			; terminaton of program
			
			;----------------------------------procedures-------------------------------------------------------------			
		
COUNTFUNC 	PROC
	
			LDRB R4, [R0] 		; load the character from the address R0 - text
			
			CMP R4, #0			; compare with 0
			
			BEQ ENDFUNC 		; terminate the procedure
			
			;-----------------------------check-for-letters-----------------------------------------------------------

			CMP R4, #0x41		; compare with 'A'
			
			BLT LOOPVOWEL		; next character
			
			CMP R4, #0x5A		; compare with 'Z'
			
			ADDLE R4, #0x20		; convert character to lower case
			
			BLE continue		; all is fine
			
			CMP R4, #0x61		; compare with 'a'
			
			BLT LOOPVOWEL		; next character
			
			CMP R4, #0x7A		; compare with 'z'
			
			BGT LOOPVOWEL		; next character

continue
	
			LDRB R6, [R1]		; load the character from the address R5 - vowel
		
			CMP R6, #0			; compare with 0
			
			ADDEQ R3, #1		; increment counter of non-vowels
		
			BEQ LOOPVOWEL 	
			
			CMP R6, R4 			; compare a vowel with a character from text
					
			BEQ VOWEL 			; count a vowel
			
			ADD R1, #1 			; increment index to the next vowel
			
			B COUNTFUNC

ENDFUNC    

			BX LR
				
			ENDP

VOWEL

			ADD R2, #1    
			
			B LOOPVOWEL
    
LOOPVOWEL

			ADR R1, VOWELS		; reiniate address of R1 to the start of vowels
			
			ADD R0, #1 			; next character
			
			B COUNTFUNC

			;-----------------------------------memory----------------------------------------------------------------
			
			AREA CountVowelsTwo, DATA, READWRITE
				
			ALIGN

TEXT
			DCB "ARM assembley language is important to learn!", 0 			; string in the memory
		
VOWELS
			DCB "aeiouy", 0													; list of vowels
		
			END																; end of the program
			
			
			
			
			
			
			
			
			
			
			