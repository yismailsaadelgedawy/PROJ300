module testROM #(parameter DATA_WIDTH=38, ADDR_WIDTH=12) (

    output logic [DATA_WIDTH-1:0] instruction,
    input logic [ADDR_WIDTH-1:0] address

);


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
bit [DATA_WIDTH-1:0] rom [0:1] = '{

    {4'b0001,2'b00,16'h0000,16'h000F},        // 0 : mov r0, #0x000F
    {4'b0001,2'b00,16'h1000,16'h00FF}         // 1 : mov r1, #0x00FF

};

always_comb begin

    instruction = rom[address];

end








endmodule