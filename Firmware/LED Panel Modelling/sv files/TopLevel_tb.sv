module TopLevel_tb;

// internal wires

// in
logic rst;
logic sw_load;
logic SHCP;
logic STCP;
logic OE;
logic [31:0] rA;
logic [31:0] rB;

// out
logic	[7:0] out_A;            // MSB
logic	[7:0] out_B;
logic	[7:0] out_C;
logic	[7:0] out_D;            // LSB

logic	[7:0] out_A31;
logic	[7:0] out_B32;
logic	[7:0] out_C33;
logic	[7:0] out_D34;





// inst and wiring
TopLevel dut (
    // inputs
    .sw_load(sw_load),
    .rst(rst),
    .SHCP(SHCP),
    .STCP(STCP),
    .OE(OE),
    .rA(rA),
    .rB(rB),
    
    // outputs
    .out_D(out_D),
    .out_C(out_C),
    .out_B(out_B),
    .out_A(out_A),    
    .out_D34(out_D34),
    .out_C33(out_C33),
    .out_B32(out_B32),
    .out_A31(out_A31)
);


// shift register clock
always begin

    SHCP = 1;
    STCP = 1;
    #5ns;
    SHCP = 0;
    STCP = 0;
    #5ns;

end



// testing
initial begin

    // data to be sent to PCB
    rA = 32'b1011;
    rB = 32'b1001;

    // rst
    sw_load = 1;
    rst = 1; // treat as if active high
    OE = 0; // output always enabled

    #7ns;
    assert ({out_D,out_C,out_B,out_A} == 'd0) $display("passed rst"); else $error("failed rst");
    #3ns;

    // de-assert rst and load data
    rst = 0;
    #10ns;
    sw_load = 0;
    #10ns;

    // data transmssion start! //

    #370ns;  // 37 clock cycles
    
    assert ({out_D,out_C,out_B,out_A} == {8'd0,8'd0,8'd0,8'b1011}) $display("passed device 1 on"); else $error("failed device 1 on");
    assert ({out_D34,out_C33,out_B32,out_A31} == 'd0) $display("passed device 2 off"); else $error("failed device 2 off");


    #370ns;  // 37 clock cycles

    assert ({out_D,out_C,out_B,out_A} == 'd0) $display("passed device 1 off"); else $error("failed device 1 off");
    assert ({out_D34,out_C33,out_B32,out_A31} == {8'd0,8'd0,8'd0,8'b1001}) $display("passed device 2 on"); else $error("failed device 2 on");


    $stop;



end





endmodule