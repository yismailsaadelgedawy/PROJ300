// mimicking memory mapped registers
// same address space as the stack
// assume all registers are 32-bits wide
.equ vga_colour_reg,			 0x100
.equ vga_offset_row_reg,		 0x110
.equ vga_offset_column_reg,	 	 0x120
.equ pos_row1,					 0x130 // top px
.equ pos_row2,					 0x140 // bottom px
.equ pos_column1,				 0x150 // left px
.equ pos_column2,				 0x160 // right px
.equ button_reg,				 0xff200050	// assume 4-bits for the 4 push buttons

.global _start
_start:

	// this program increments/decrements the offset counter based on button inputs //
	
	// storing addresses
	ldr r0, =vga_offset_row_reg
	ldr r1, =vga_offset_column_reg
	ldr r2, =button_reg
	
	// read only 
	ldr r3, =pos_row1
	ldr r4, =pos_row2
	ldr r5, =pos_column1
	ldr r6, =pos_column2
	
	// storing values
	// register re-use!
	ldr r3, [r3]
	ldr r4, [r4]
	ldr r5, [r5]
	ldr r6, [r6]
		
	// counters
	mov r11, #0	// row counter
	mov r12, #0	// column counter

	
	// reading button_reg and comparing
	// to determine which button has been pressed
	ldr r7, [r2]
	
	// 0001
	cmp r7, #0x01	// can take immediates; saves registers!
	beq button1
	
	// 0010
	cmp r7, #0x02
	beq button2
	
	// 0100
	cmp r7, #0x04
	beq button3
	
	// 1000
	cmp r7, #0x08
	beq button4

    b default
	
// move px up
button1:

	// comparison register (re-used to conserve register use!)
	// cmp and mov limited to 8-bit values
	// this is a workaround for cmp
	// use movw for 16-bit immediate moves
	mov r8, #-1

	// edge detection
	cmp r3, r8
	beq true1
	
	true1:
	
		add r11, r11, #1 // r11++ (get it back to 0)
		b false1
	
	false1:
		
		sub r11, r11, #1 // r11--
		str r11, [r0]
		b default
	

// move px down
button2:

	// comparison register
	movw r8, #481

	// edge detection
	cmp r4, r8
	beq true2
	
	true2:
	
		sub r11, r11, #1 // r11-- (get it back to 480)
		b false2
	
	false2:
	
		add r11, r11, #1 // r11++
		str r11, [r0]
		b default
	

// move px left
button3:

	// comparison register
	mov r8, #-1

	
	// edge detection
	cmp r5, r8
	beq true3
	
	true3:
	
	add r12, r12, #1 // r12++
	b false3
	
	false3:
		
		sub r12, r12, #1 // r12--
		str r12, [r1]
		b default

// move px right
button4:

	// comparison register
	movw r8, #641

	// edge detection
	cmp r6, r8
	beq true4
	
	true4:
	
	sub r12, r12, #1 // r12--
	b false4
	
	false4:
		
		add r12, r12, #1 // r12++
		str r12, [r1] 
		b default


default:

	b _start // while(1){} loop
	
	
	