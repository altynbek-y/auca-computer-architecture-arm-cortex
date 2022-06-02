		; LAB #2 ASSIGNMENT 1
		; DONE BY YIMAN ALTYNBEK UULU, AMI-19	
		; COMPUTER ARCHITECTURE & ORGANIZATION
		; INSTRUCTOR MELIS OSMONOV
		
		AREA CountVowelsOne, CODE, READONLY
		ENTRY
		
		ADR R0, text 		; address of a character in the string
		ADR R4, vowels		; address of a vowel character in the string
		MOV R1, #0 			; counter for vowels
		MOV R2, #0 			; counter for non-vowels
		
loop		
		LDRB R3, [R0] 		; load the character from the address R0
		
		CMP R3, #0			; compare with 0
		
		BEQ Stop 			; if it is zero terminate
				
		;-----------------------------check-for-letters-----------------------------------------------------------

		CMP R3, #0x41		; compare r3 with 'A'
		BLT next			; r3 is not an alphabetic symbol get the next character
		
		CMP R3, #0x5A		; compare r3 with 'Z'
		ADDLE R3,R3,#0x20	; convert character to lower case
		BLE continue		; if r3 <= 'Z' continue to the main program
		
		CMP R3, #0x61		; compare r3 with 'a'
		BLT next			; r3 is not an alphabetic symbol get the next character
		
		CMP R3, #0x7A		; compare r3 with 'z'
		; BLE continue		; if r3 <= 'z' continue to the main program
		BGT next			; r3 is not an alphabetic symbol get the next character
		
continue		

		;------------------------------------instructions---------------------------------------------------------
				
countVowelAndConsonant	

		LDRB R6, [R4]		; load the character from the address R4
		
		CMP R6, #0			; compare with 0
		ADDEQ R2, #1		; increment counter of non-vowels
		
		BEQ next 			; exit loop
		
		CMP R6, R3 			; compare a vowel with a character from text
		ADDEQ R1, #1 		; increment counter of vowels
	
		BEQ next 			; exit loop
		
		ADD R4, #1 			; increment index to the next vowel
		
		B countVowelAndConsonant
				
		;------------------------------------instructions---------------------------------------------------------
next
		LDR R4, =vowels		; address of a vowel character in the string

		ADD R0, #1 			; increment index to the next character
		
		B loop				; main loop
		
Stop	B	Stop			; infinite loop - terminaton of program


		;-----------------------------------memory----------------------------------------------------------------
		AREA CountVowelsOne, DATA, READWRITE
			
		ALIGN
text
		DCB "ARM assembley language is important to learn!", 0 			; string in the memory
		
vowels
		DCB "aeiouy", 0													; list of vowels
		
		END																; end of the program
			
			
			





