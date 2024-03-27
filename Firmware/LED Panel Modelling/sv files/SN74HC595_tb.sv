module SN74HC595_tb;

// internal wires

// in
logic	DS;
logic	MR;
logic	SHCP;
logic	STCP;
logic   OE;
// out
logic	[7:0] data_out;

// inst and wiring
SN74HC595 dut (

    // in
    .DS(DS),
    .MR(MR),
    .SHCP(SHCP),
    .STCP(STCP),
    .OE(OE),
    
    // out
    .data_out(data_out)


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
    MR = 0; // active low
    DS = 0;
    OE = 0; // output enabled

    #7ns;
    assert (data_out == 'd0) $display("passed rst"); else $error("failed rst");
    #3ns;

    MR = 1;
    DS = 1;
    #80ns;  // 8 clock cycles

    #10ns; // 1 more cycle
    assert (data_out == 'd255) $display("passed data out"); else $error("failed data out");


    $stop;



end





endmodule