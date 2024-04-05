module systemBus_muxN_tb;

// parameters
parameter N=38;

// internal wires

// in
logic [3:0] sel;
logic [N-1:0] PC,DR,AR,AC,MEM,TR,rop1,rop2,GPR1;


// out
logic [N-1:0] q;

// wiring
systemBus_muxN dut (

    // in
    .sel(sel),
    .PC(PC),
    .DR(DR),
    .AR(AR),
    .AC(AC),
    .MEM(MEM),
    .TR(TR),
    .rop1(rop1),
    .rop2(rop2),
    .GPR1(GPR1),

    // out
    .q(q)

);


// testing
initial begin

    sel = 'd0;
    PC = 12'd0;
    DR = 38'd1;
    AR = 12'd2;
    AC = 32'd3;
    MEM = 38'd4;
    TR = 32'd5;
    rop1 = 32'd6;
    rop2 = 32'd7;
    GPR1 = 32'd8;
    #10ns;

    assert (q == PC) $display("passed PC"); else $error("failed PC");

    sel = 'd1;
    #10ns;

    assert (q == DR) $display("passed DR"); else $error("failed DR");

    sel = 'd2;
    #10ns;

    assert (q == AR) $display("passed AR"); else $error("failed AR");

    sel = 'd3;
    #10ns;

    assert (q == AC) $display("passed AC"); else $error("failed AC");

    sel = 'd4;
    #10ns;

    assert (q == MEM) $display("passed MEM"); else $error("failed MEM");

    sel = 'd5;
    #10ns;

    assert (q == TR) $display("passed TR"); else $error("failed TR");

    sel = 'd6;
    #10ns;

    assert (q == rop1) $display("passed rop1"); else $error("failed rop1");

    sel = 'd7;
    #10ns;

    assert (q == rop2) $display("passed rop2"); else $error("failed rop2");

    sel = 'd8;
    #10ns;

    assert (q == GPR1) $display("passed GPR1"); else $error("failed GPR1");

    sel = 'd9;
    #10ns;

    assert (q == 'd0) $display("passed default"); else $error("failed default");
    


end


endmodule