`timescale 1ns/1ns
module TopLevel_tb;

// internal wires

// in
logic rst;
logic clk;
logic OE;
logic [31:0] rA;
logic [31:0] rB;
logic [31:0] rC;
logic [31:0] rD;

// out -- MSB sent first through A to D
wire	[7:0] out_A;
wire	[7:0] out_B;
wire	[7:0] out_C;
wire	[7:0] out_D;

wire	[7:0] out_E;
wire	[7:0] out_F;
wire	[7:0] out_G;
wire	[7:0] out_H;

wire	[7:0] out_I;
wire	[7:0] out_J;
wire	[7:0] out_K;
wire	[7:0] out_L;

wire	[7:0] out_M;
wire	[7:0] out_N;
wire	[7:0] out_O;
wire	[7:0] out_P;





// inst and wiring
TopLevel dut (
    // inputs
    .rst(rst),
    .clk(clk),
    .OE(OE),
    .rA(rA),
    .rB(rB),
    .rC(rC),
    .rD(rD),
    
    // outputs
    .out_A(out_A),
    .out_B(out_B),
    .out_C(out_C),
    .out_D(out_D),
    .out_E(out_E),
    .out_F(out_F),
    .out_G(out_G),
    .out_H(out_H),
    .out_I(out_I),
    .out_J(out_J),
    .out_K(out_K),
    .out_L(out_L),
    .out_M(out_M),
    .out_N(out_N),
    .out_O(out_O),
    .out_P(out_P)
);



// shift register clock
always begin

    clk = 1;
    #5ns;
    clk = 0;
    #5ns;

end



// testing
initial begin

    // data to be sent to PCB
    rA = 32'b1011;
    rB = 32'b1011;
    rC = 32'b1011;
    rD = 32'b1011;
    

    // rst
    rst = 1; // treat as if active high
    OE = 0; // output always enabled

    #7ns;
    assert ({out_D,out_C,out_B,out_A} == 'd0) $display("passed rst"); else $error("failed rst");
    #3ns;

    // de-assert rst
    rst = 0;
    #10ns;


    // data transmssion start! //

    #370ns;  // 37 clock cycles
    
    // assert ({out_D,out_C,out_B,out_A} == {8'd0,8'd0,8'd0,8'b1011}) $display("passed device 1 on"); else $error("failed device 1 on");
    // assert ({out_D34,out_C33,out_B32,out_A31} == 'd0) $display("passed device 2 off"); else $error("failed device 2 off");


    #370ns;  // 37 clock cycles

    // assert ({out_D,out_C,out_B,out_A} == 'd0) $display("passed device 1 off"); else $error("failed device 1 off");
    // assert ({out_D34,out_C33,out_B32,out_A31} == {8'd0,8'd0,8'd0,8'b1001}) $display("passed device 2 on"); else $error("failed device 2 on");

    #370ns;  // 37 clock cycles
    #370ns;  // 37 clock cycles


    #10000ns;    // run for a while and observe...

    $stop;



end





endmodule