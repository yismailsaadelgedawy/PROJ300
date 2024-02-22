module testROM_tb;

// params
parameter DATA_WIDTH=8, ADDR_WIDTH=6;

// internal wires

// in
logic [ADDR_WIDTH-1:0] address;

// out
logic [DATA_WIDTH-1:0] instruction;


// wiring
testROM dut (

    // in
    .address(address),

    // out
    .instruction(instruction)

);


// testing
initial begin

    address = 'd0;
    #10ns;

    assert (instruction == 8'b11000000) $display("passed INC"); else $error("failed INC");

    address = 'd1;
    #10ns;

    assert (instruction == 8'b10000000) $display("passed JMP0"); else $error("failed JMP0");


end




endmodule