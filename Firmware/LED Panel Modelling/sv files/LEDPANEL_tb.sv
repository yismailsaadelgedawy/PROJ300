module LEDPANEL_tb;

// internal wires

// in
logic DS;
logic rst;
logic SHCP;
logic STCP;
logic OE;

// out
logic [7:0] out_D;
logic [7:0] out_C;
logic [7:0] out_B;
logic [7:0] out_A;


// inst and wiring
LEDPANEL dut (

    // in
    .DS(DS),
    .rst(rst),
    .SHCP(SHCP),
    .STCP(STCP),
    .OE(OE),

    // out
    .out_A(out_A),
    .out_B(out_B),
    .out_C(out_C),
    .out_D(out_D)

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

    // rst
    rst = 1; // treat as if active high
    DS = 0;
    OE = 0; // output always enabled

    #7ns;
    assert ({dut.shiftD,dut.shiftC,dut.shiftB,dut.shiftA} == 'd0 && {out_D,out_C,out_B,out_A} == 'd0) $display("passed rst"); else $error("failed rst");
    #3ns;

    rst = 0;
    DS = 1;
    #370ns;  // 32+5 clock cycles
    
    assert ({out_D,out_C,out_B,out_A} == {8'd255,8'd255,8'd255,8'd255}) $display("passed data out"); else $error("failed data out");


    #7ns;
    assert ({dut.shiftD,dut.shiftC,dut.shiftB,dut.shiftA} == 'd0) $display("passed back to rst"); else $error("failed back to rst");
    #3ns;


    $stop;



end





endmodule