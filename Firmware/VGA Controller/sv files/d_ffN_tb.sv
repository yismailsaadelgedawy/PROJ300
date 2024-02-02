module d_ffN_tb;

// parameters
parameter N=11;

// internal signals

// inputs
logic clk;
logic rst;
logic en;
logic [N-1:0] d;

// outputs
logic [N-1:0] q;

// wiring
d_ffN dut(

    // in
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(d),

    // out
    .q(q)

);


// 25MHz clock (should be 50MHz but whatever)
// time period is 40ns
always begin

    clk = 1;
    #20ns;
    clk = 0;
    #20ns;

end


// testing
initial begin

    rst = 1;
    d = 11'd250;
    en = 0;

    #35ns;
    assert (q == 'd0) $display("passed reset"); else $error("failed reset");
    #5ns;

    rst = 0;

    #35ns;
    assert (q == 'd0) $display("passed 1"); else $error("failed 1");
    #5ns;

    en = 1;

    #35ns;
    assert (q == d) $display("passed 2"); else $error("failed 2");
    #5ns;

    en = 0;

    #35ns;
    assert (q == 'd250) $display("passed memory"); else $error("failed memory");
    #5ns;

    en = 1;
    d = 'd100;
    #80ns; // 2 cycles

    d = 'd300;
    #80ns; // 2 cycles

    rst = 1;
    #35ns;
    assert (q == 'd0) $display("passed reset"); else $error("failed reset");
    #5ns;




    $stop;

end


endmodule