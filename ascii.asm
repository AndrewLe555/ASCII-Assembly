
SECTION .bss

outputBuf:
	resb 80			; Given amount of bytes to reserve
	
SECTION .data
	
inputBuf:
	db 0x83, 0x6A, 0x88, 0xDE, 0x9A, 0xC3, 0x54, 0x9A ; Given hex values to print

SECTION .text
	
global _start
	
_start:	
	mov ESI, inputBuf 	; Create the input buffer pointer
	mov EDI, outputBuf	; Create the output buffer pointer
	mov CL, 0		; Create a counter for the loop
	call loop		; Start the loop

loop:	
	mov AL, [ESI]		; Gets the first binary values of the input Buffer
	mov BL, AL		; Create a variable to manipulate
	and BL, 0xF0		; Get the first 4 binary digits
	shr BL, 4		; Shift the binary to the right by 4 bits
	cmp BL, 9		; Check to see if it's a number
	jle getFirstNumber	; It's a number, get the ASCII value for number
	add BL, 55		; It's a letter, get the ASCII value for letter
	mov [EDI], BL		; Put the value in BL into the output buffer
	inc EDI			; Make EDI the next address
	jmp continue    	; Go to the next part of the loop

continue:
	mov BL, AL		; Reset the value of BL
	and BL, 0x0F		; Get the second half of the binary digits
	cmp BL, 9		; Check to see if it's a number
	jle getSecondNumber	; It's a number, get the ASCII value for a number
	add BL, 55		; It's a letter, get the ASCII value for a letter
	mov [EDI], BL		; Put the value in BL into the output buffer
	inc EDI			; Make EDI the next address
	jmp checkLoop	        ; Check if the loop should be continued

checkLoop:
	mov BL, 32		; Set the BL register to a space in ASCII
	mov [EDI], BL 		; Add a space
	inc EDI			; Go to the next address
	inc ESI			; Make ESI he next given hex value
	inc CL			; Increment the counter
	cmp CL, 7		; Check to see if loop should be continued
	jle loop		; It's less than 7, continue the loop

	mov BL, 10		; Set the BL register to a newline in ASCII
	mov [EDI], BL		; Add the newline character
	inc EDI			; Go to the next address

	mov EAX, 4		; Invokes the SYS_WRITE
	mov EBX, 1		; Write to the STDOUT file
	mov ECX, outputBuf	; Print out the outputBuf
	mov EDX, 80		; Size of the outputBuf
	int 0x80		; Make a system call

	mov EAX, 1		; Invoke the SYS_EXIT
	mov EBX, 0		; There are no errors
	int 0x80		; Make a system call

getFirstNumber:
	add BL, 48		; Add 48 to get the ASCII for the number
	mov [EDI], BL		; Put the value in BL into the output buffer
	inc EDI			; Go to the next address
	jmp continue    	; Continue with the next part of the loop

getSecondNumber:
	add BL, 48		; add 48 to get the ASCII for the number
	mov [EDI], BL		; Put the value in BL into the output buffer
	inc EDI			; Go to the next address
	jmp checkLoop    	; Check if the loop should be continued
