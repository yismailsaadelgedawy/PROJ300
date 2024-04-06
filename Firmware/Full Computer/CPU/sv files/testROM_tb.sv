module testROM_tb;

// params
parameter DATA_WIDTH=38, ADDR_WIDTH=12;

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

    assert (instruction == {4'b0001,2'b00,16'h0000,16'h000F}) $display("passed mov r0, #0x000F"); else $error("failed mov r0, #0x000F");

    address = 'd1;
    #10ns;

    assert (instruction == {4'b0001,2'b00,16'h1000,16'h00FF}) $display("passed mov r1, #0x00FF"); else $error("failed mov r1, #0x00FF");

    address = 'd2;
    #10ns;

    assert (instruction == 'd0) $display("passed out of bounds"); else $error("failed out of bounds");

end




endmodule