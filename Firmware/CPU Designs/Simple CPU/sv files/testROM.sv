module testROM #(parameter DATA_WIDTH=8, ADDR_WIDTH=6) (

    output logic [DATA_WIDTH-1:0] instruction,
    input logic [ADDR_WIDTH-1:0] address

);


// Asycnhronous ROM to hold instructions to test the Simple CPU
// 6 address bits; 8 data bits

// this stores the following assembly code
// 0 INC
// 1 JMP0 (i.e. goto address 0)

// max 64 bytes of memory
// this stores 2 instructions/bytes for now
// care of significance (first mem location is the lowest address)
logic [DATA_WIDTH-1:0] rom [0:1] = '{

    8'b00000011,        // 0 : ADD3 (operand bits = 3)
    8'b10000000        // 1 : JMP0

};

always_comb begin

    instruction = rom[address];

end








endmodule