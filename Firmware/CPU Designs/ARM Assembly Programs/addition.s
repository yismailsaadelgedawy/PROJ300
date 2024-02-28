.global _start
_start:
	
	// this program retrieves "num1" and "num2", adds them, and stores
	// the result in "result"
	
	// addresses of the variables on the stack
	ldr r0, =num1
	ldr r1, =num2
	ldr r2, =result
	
	// dereferencing to retrieve values
	ldr r3, [r0] // holds 12
	ldr r4, [r1] // holds 15
	
	// performing arithmetic	
	add r5, r3, r4 // r5 = r3 + r4 = num1 + num2
	str r5, [r2]
	
	// checking that it worked
	ldr r6, [r2]
	
	// can re-use registers now
	mov r0, #15
	
	cmp r0, r6 // this does r6 - r0 in hardware, and sets flags
	
	blt if // if r0 < r6, goto "if"
	bgt else // else, goto "else"

// label
if:

	mov r0, #0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	mov r4, #0
	mov r5, #0
	mov r6, #0
	
	b default // goto "default" label
	
else:

	mov r0, #1
	mov r1, #1
	mov r2, #1
	mov r3, #1
	mov r4, #1
	mov r5, #1
	mov r6, #1
	
	b default
	
default:

	// while(1) loop
	b _start
	
	


	
// variables section	
.data
num1:
	.word 12

num2:
	.word 15
	
result:
	.word 0
	
test:
	.word 1
	