module testROM #(parameter DATA_WIDTH=38, ADDR_WIDTH=12) (

    output logic [DATA_WIDTH-1:0] instruction,
    input logic [ADDR_WIDTH-1:0] address

);

parameter number_of_test_instructions = 169;
// Asycnhronous ROM to hold instructions to test the CPU
// 6 address bits; 8 data bits

// this stores the following assembly code
// 0 INC
// 1 JMP0 (i.e. goto address 0)

// max 64 bytes of memory
// this stores 2 instructions/bytes for now
// care of significance (first mem location is the lowest address)


// Generally, the word structure is: OPCODE s[1..0] a[15..0] b[15..0]
// "bit" datatype to avoid z and x when address is out of bounds
bit [DATA_WIDTH-1:0] rom [0:number_of_test_instructions-1] = '{

    /////// nop ///////
    {4'b0000,2'b00,16'h0000,16'h0000},      // 0 : nop

    /////// mov ///////
    {4'b0001,2'b00,16'h0000,16'h0001},      // 1 : mov r0,   #1
    {4'b0001,2'b00,16'h1000,16'h0002},      // 2 : mov r1,   #2
    {4'b0001,2'b00,16'h2000,16'h0003},      // 3 : mov r2,   #3
    {4'b0001,2'b00,16'h3000,16'h0004},      // 4 : mov r3,   #4
    {4'b0001,2'b00,16'h4000,16'h0005},      // 5 : mov r4,   #5
    {4'b0001,2'b00,16'h5000,16'h0006},      // 6 : mov r5,   #6
    {4'b0001,2'b00,16'h6000,16'h0007},      // 7 : mov r6,   #7
    {4'b0001,2'b00,16'h7000,16'h0008},      // 8 : mov r7,   #8
    {4'b0001,2'b00,16'h8000,16'h0009},      // 9 : mov r8,   #9
    {4'b0001,2'b00,16'h9000,16'h000A},      // 10 : mov r9,  #10
    {4'b0001,2'b00,16'hA000,16'h000B},      // 11 : mov r10, #11
    {4'b0001,2'b00,16'hB000,16'h000C},      // 12 : mov r11, #12
    {4'b0001,2'b00,16'hC000,16'h000D},      // 13 : mov r12, #13

    {4'b0001,2'b01,16'h0000,16'h1000},      // 14 : mov r0,  r1
    {4'b0001,2'b01,16'h1000,16'h2000},      // 15 : mov r1,  r2
    {4'b0001,2'b01,16'h2000,16'h3000},      // 16 : mov r2,  r3
    {4'b0001,2'b01,16'h3000,16'h4000},      // 17 : mov r3,  r4
    {4'b0001,2'b01,16'h4000,16'h5000},      // 18 : mov r4,  r5
    {4'b0001,2'b01,16'h5000,16'h6000},      // 19 : mov r5,  r6
    {4'b0001,2'b01,16'h6000,16'h7000},      // 20 : mov r6,  r7
    {4'b0001,2'b01,16'h7000,16'h8000},      // 21 : mov r7,  r8
    {4'b0001,2'b01,16'h8000,16'h9000},      // 22 : mov r8,  r9
    {4'b0001,2'b01,16'h9000,16'hA000},      // 23 : mov r9,  r10
    {4'b0001,2'b01,16'hA000,16'hB000},      // 24 : mov r10, r11
    {4'b0001,2'b01,16'hB000,16'hC000},      // 25 : mov r11, r12
    {4'b0001,2'b01,16'hC000,16'h0000},      // 26 : mov r12, r0

    /////// str ///////
    {4'b0011,2'b00,16'h0000,16'h044C},      // 27 : str r0,  0x44C
    {4'b0011,2'b00,16'h1000,16'h044D},      // 28 : str r1,  0x44D
    {4'b0011,2'b00,16'h2000,16'h044E},      // 29 : str r2,  0x44E
    {4'b0011,2'b00,16'h3000,16'h044F},      // 30 : str r3,  0x44F
    {4'b0011,2'b00,16'h4000,16'h0450},      // 31 : str r4,  0x450
    {4'b0011,2'b00,16'h5000,16'h0451},      // 32 : str r5,  0x451
    {4'b0011,2'b00,16'h6000,16'h0452},      // 33 : str r6,  0x452
    {4'b0011,2'b00,16'h7000,16'h0453},      // 34 : str r7,  0x453
    {4'b0011,2'b00,16'h8000,16'h0454},      // 35 : str r8,  0x454
    {4'b0011,2'b00,16'h9000,16'h0455},      // 36 : str r9,  0x455
    {4'b0011,2'b00,16'hA000,16'h0456},      // 37 : str r10, 0x456
    {4'b0011,2'b00,16'hB000,16'h0457},      // 38 : str r11, 0x457
    {4'b0011,2'b00,16'hC000,16'h0458},      // 39 : str r12, 0x458

    {4'b0011,2'b01,16'h0001,16'h0459},      // 40 : str #1,  0x459
    {4'b0011,2'b01,16'h0002,16'h045A},      // 41 : str #2,  0x45A
    {4'b0011,2'b01,16'h0003,16'h045B},      // 42 : str #3,  0x45B
    {4'b0011,2'b01,16'h0004,16'h045C},      // 43 : str #4,  0x45C
    {4'b0011,2'b01,16'h0005,16'h045D},      // 44 : str #5,  0x45D
    {4'b0011,2'b01,16'h0006,16'h045E},      // 45 : str #6,  0x45E
    {4'b0011,2'b01,16'h0007,16'h045F},      // 46 : str #7,  0x45F
    {4'b0011,2'b01,16'h0008,16'h0460},      // 47 : str #8,  0x460
    {4'b0011,2'b01,16'h0009,16'h0461},      // 48 : str #9,  0x461
    {4'b0011,2'b01,16'h000A,16'h0462},      // 49 : str #10, 0x462
    {4'b0011,2'b01,16'h000B,16'h0463},      // 50 : str #11, 0x463
    {4'b0011,2'b01,16'h000C,16'h0464},      // 51 : str #12, 0x464
    {4'b0011,2'b01,16'h000D,16'h0465},      // 52 : str #13, 0x465

    /////// ldr ///////
    {4'b0010,2'b00,16'h0000,16'h0459},      // 53 : ldr r0,  0x459
    {4'b0010,2'b00,16'h1000,16'h045A},      // 54 : ldr r1,  0x45A
    {4'b0010,2'b00,16'h2000,16'h045B},      // 55 : ldr r2,  0x45B
    {4'b0010,2'b00,16'h3000,16'h045C},      // 56 : ldr r3,  0x45C
    {4'b0010,2'b00,16'h4000,16'h045D},      // 57 : ldr r4,  0x45D
    {4'b0010,2'b00,16'h5000,16'h045E},      // 58 : ldr r5,  0x45E
    {4'b0010,2'b00,16'h6000,16'h045F},      // 59 : ldr r6,  0x45F
    {4'b0010,2'b00,16'h7000,16'h0460},      // 60 : ldr r7,  0x460
    {4'b0010,2'b00,16'h8000,16'h0461},      // 61 : ldr r8,  0x461
    {4'b0010,2'b00,16'h9000,16'h0462},      // 62 : ldr r9,  0x462
    {4'b0010,2'b00,16'hA000,16'h0463},      // 63 : ldr r10, 0x463
    {4'b0010,2'b00,16'hB000,16'h0464},      // 64 : ldr r11, 0x464
    {4'b0010,2'b00,16'hC000,16'h0465},      // 65 : ldr r12, 0x465

    {4'b0010,2'b01,16'h0000,16'h0459},      // 66 : ldr r0,  [0x459]
    {4'b0010,2'b01,16'h1000,16'h045A},      // 67 : ldr r1,  [0x45A]
    {4'b0010,2'b01,16'h2000,16'h045B},      // 68 : ldr r2,  [0x45B]
    {4'b0010,2'b01,16'h3000,16'h045C},      // 69 : ldr r3,  [0x45C]
    {4'b0010,2'b01,16'h4000,16'h045D},      // 70 : ldr r4,  [0x45D]
    {4'b0010,2'b01,16'h5000,16'h045E},      // 71 : ldr r5,  [0x45E]
    {4'b0010,2'b01,16'h6000,16'h045F},      // 72 : ldr r6,  [0x45F]
    {4'b0010,2'b01,16'h7000,16'h0460},      // 73 : ldr r7,  [0x460]
    {4'b0010,2'b01,16'h8000,16'h0461},      // 74 : ldr r8,  [0x461]
    {4'b0010,2'b01,16'h9000,16'h0462},      // 75 : ldr r9,  [0x462]
    {4'b0010,2'b01,16'hA000,16'h0463},      // 76 : ldr r10, [0x463]
    {4'b0010,2'b01,16'hB000,16'h0464},      // 77 : ldr r11, [0x464]
    {4'b0010,2'b01,16'hC000,16'h0465},      // 78 : ldr r12, [0x465]

    /////// cmp ///////
    {4'b0100,2'b10,16'h0000,16'h0001},      // 79 : cmp r0, #1
    {4'b0100,2'b10,16'h1000,16'h0001},      // 80 : cmp r1, #1
    {4'b0100,2'b10,16'h2000,16'h0001},      // 81 : cmp r2, #1
    {4'b0100,2'b10,16'h3000,16'h0001},      // 82 : cmp r3, #1
    {4'b0100,2'b10,16'h4000,16'h0001},      // 83 : cmp r4, #1
    {4'b0100,2'b10,16'h5000,16'h0001},      // 84 : cmp r5, #1
    {4'b0100,2'b10,16'h6000,16'h0001},      // 85 : cmp r6, #1
    {4'b0100,2'b10,16'h7000,16'h0001},      // 86 : cmp r7, #1
    {4'b0100,2'b10,16'h8000,16'h0001},      // 87 : cmp r8, #1
    {4'b0100,2'b10,16'h9000,16'h0001},      // 88 : cmp r9, #1
    {4'b0100,2'b10,16'hA000,16'h0001},      // 89 : cmp r10, #1
    {4'b0100,2'b10,16'hB000,16'h0001},      // 90 : cmp r11, #1
    {4'b0100,2'b10,16'hC000,16'h0001},      // 91 : cmp r12, #1

    {4'b0100,2'b11,16'h0000,16'h1000},      // 92 : cmp r0, r1
    {4'b0100,2'b11,16'h1000,16'h2000},      // 93 : cmp r1, r2
    {4'b0100,2'b11,16'h2000,16'h3000},      // 94 : cmp r2, r3
    {4'b0100,2'b11,16'h3000,16'h4000},      // 95 : cmp r3, r4
    {4'b0100,2'b11,16'h4000,16'h5000},      // 96 : cmp r4, r5
    {4'b0100,2'b11,16'h5000,16'h6000},      // 97 : cmp r5, r6
    {4'b0100,2'b11,16'h6000,16'h7000},      // 98 : cmp r6, r7
    {4'b0100,2'b11,16'h7000,16'h8000},      // 99 : cmp r7, r8
    {4'b0100,2'b11,16'h8000,16'h9000},      // 100 : cmp r8, r9
    {4'b0100,2'b11,16'h9000,16'hA000},      // 101 : cmp r9, r10
    {4'b0100,2'b11,16'hA000,16'hB000},      // 102 : cmp r10, r11
    {4'b0100,2'b11,16'hB000,16'hC000},      // 103 : cmp r11, r12
    {4'b0100,2'b11,16'hC000,16'h0000},      // 104 : cmp r12, r0

    /////// bgt ///////
    {4'b0001,2'b00,16'h0000,16'h0001},      // 105 : mov r0, #1
    {4'b0001,2'b00,16'h1000,16'h0002},      // 106 : mov r1, #2
    {4'b0100,2'b11,16'h1000,16'h0000},      // 107 : cmp r1, r0

    {4'b0110,2'b00,16'h0000,16'h006E},      // 108 : bgt if (addr 110)

    {4'b0001,2'b00,16'h0000,16'h000A},      // 109 : mov r0, #10

    // if:
    {4'b0001,2'b00,16'h0000,16'h000F},      // 110 : mov r0, #15

    {4'b0001,2'b00,16'h0000,16'h0001},      // 111 : mov r0, #1
    {4'b0001,2'b00,16'h1000,16'h0002},      // 112 : mov r1, #2
    {4'b0100,2'b11,16'h0000,16'h1000},      // 113 : cmp r0, r1

    {4'b0110,2'b00,16'h0000,16'h0074},      // 114 : bgt if (addr 116)
    
    {4'b0101,2'b00,16'h0000,16'h0075},      // 115 : b else (addr 117)


    // if:
    {4'b0001,2'b00,16'h0000,16'h000F},      // 116 : mov r0, #15

    // else:
    {4'b0001,2'b00,16'h0000,16'h000B},      // 117 : mov r0, #11


    /////// blt ///////
    {4'b0001,2'b00,16'h0000,16'h0001},      // 118 : mov r0, #1
    {4'b0001,2'b00,16'h1000,16'h0002},      // 119 : mov r1, #2
    {4'b0100,2'b11,16'h0000,16'h1000},      // 120 : cmp r0, r1

    {4'b0111,2'b00,16'h0000,16'h007B},      // 121 : blt if (addr 123)

    {4'b0001,2'b00,16'h0000,16'h000A},      // 122 : mov r0, #10

    // if:
    {4'b0001,2'b00,16'h0000,16'h006F},      // 123 : mov r0, #15

    {4'b0001,2'b00,16'h0000,16'h0001},      // 124 : mov r0, #1
    {4'b0001,2'b00,16'h1000,16'h0002},      // 125 : mov r1, #2
    {4'b0100,2'b11,16'h1000,16'h0000},      // 126 : cmp r1, r0

    {4'b0111,2'b00,16'h0000,16'h0081},      // 127 : blt if (addr 129)
    
    {4'b0101,2'b00,16'h0000,16'h0082},      // 128 : b else (addr 130)


    // if:
    {4'b0001,2'b00,16'h0000,16'h000F},      // 129 : mov r0, #15

    // else:
    {4'b0001,2'b00,16'h0000,16'h000B},      // 130 : mov r0, #11

    /////// beq ///////
    {4'b0001,2'b00,16'h0000,16'h0001},      // 131 : mov r0, #1
    {4'b0001,2'b00,16'h1000,16'h0001},      // 132 : mov r1, #1
    {4'b0100,2'b11,16'h0000,16'h1000},      // 133 : cmp r0, r1

    {4'b1000,2'b00,16'h0000,16'h0088},      // 134 : beq if (addr 136)

    {4'b0001,2'b00,16'h0000,16'h000A},      // 135 : mov r0, #10

    // if:
    {4'b0001,2'b00,16'h0000,16'h006F},      // 136 : mov r0, #15

    {4'b0001,2'b00,16'h0000,16'h0001},      // 137 : mov r0, #1
    {4'b0001,2'b00,16'h1000,16'h0002},      // 138 : mov r1, #2
    {4'b0100,2'b11,16'h1000,16'h0000},      // 139 : cmp r1, r0

    {4'b1000,2'b00,16'h0000,16'h008E},      // 140 : beq if (addr 142)
    
    {4'b0101,2'b00,16'h0000,16'h008F},      // 141 : b else (addr 143)


    // if:
    {4'b0001,2'b00,16'h0000,16'h000F},      // 142 : mov r0, #15

    // else:
    {4'b0001,2'b00,16'h0000,16'h000B},      // 143 : mov r0, #11


    /////// add ///////
    {4'b0001,2'b00,16'h0000,16'h000B},      // 144 : mov r0, #11
    {4'b0001,2'b00,16'h1000,16'h000A},      // 145 : mov r1, #10

    {4'b1001,2'b00,16'h200B,16'h000A},      // 146 : add r2, #11,#10
    {4'b1001,2'b01,16'h200B,16'h0000},      // 147 : add r2, #11,r0
    {4'b1001,2'b10,16'h2100,16'h000A},      // 148 : add r2, r1,#10
    {4'b1001,2'b11,16'h2000,16'h0100},      // 149 : add r2, r0,r1

    /////// sub ///////
    {4'b1010,2'b00,16'h200B,16'h000A},      // 150 : sub r2, #11,#10
    {4'b1010,2'b01,16'h200B,16'h0000},      // 151 : sub r2, #11,r0
    {4'b1010,2'b10,16'h2100,16'h000A},      // 152 : sub r2, r1,#10
    {4'b1010,2'b11,16'h2000,16'h0100},      // 153 : sub r2, r0,r1

    /////// mul ///////
    {4'b1011,2'b00,16'h200B,16'h000A},      // 153 : mul r2, #11,#10
    {4'b1011,2'b01,16'h200B,16'h0000},      // 155 : mul r2, #11,r0
    {4'b1011,2'b10,16'h2100,16'h000A},      // 156 : mul r2, r1,#10
    {4'b1011,2'b11,16'h2000,16'h0100},      // 157 : mul r2, r0,r1

    /////// lsr ///////
    {4'b1100,2'b10,16'h2100,16'h0001},      // 158 : lsr r2, r1,#1

    /////// and ///////
    {4'b1101,2'b00,16'h200B,16'h000A},      // 159 : and r2, #11,#10
    {4'b1101,2'b01,16'h200B,16'h0000},      // 160 : and r2, #11,r0
    {4'b1101,2'b10,16'h2100,16'h000A},      // 161 : and r2, r1,#10
    {4'b1101,2'b11,16'h2000,16'h0100},      // 162 : and r2, r0,r1

    /////// or ///////
    {4'b1110,2'b00,16'h200B,16'h000A},      // 163 : or r2, #11,#10
    {4'b1110,2'b01,16'h200B,16'h0000},      // 164 : or r2, #11,r0
    {4'b1110,2'b10,16'h2100,16'h000A},      // 165 : or r2, r1,#10
    {4'b1110,2'b11,16'h2000,16'h0100},      // 166 : or r2, r0,r1

    /////// mvn ///////
    {4'b1111,2'b00,16'h2000,16'h0001},      // 167 : mvn r2, #1
    {4'b1111,2'b01,16'h2000,16'h1000}       // 168 : mvn r2, r1



};

always_comb begin

    instruction = rom[address];

end








endmodule