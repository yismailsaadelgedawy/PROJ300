module CPU_regN_tb;

// parameters
parameter N=8;

// internal wires

// in
logic clk, rst;
logic inc, load;
logic [N-1:0] d;

// out
logic [N-1:0] q;

// wiring
CPU_regN dut (

    // in
    .clk(clk),
    .rst(rst),
    .inc(inc),
    .load(load),
    .d(d),

    // out
    .q(q)

);


// clock
always begin

    clk <= 1;
    #5ns;
    clk <= 0;
    #5ns;

end


// testing
initial begin

    // reset state
    rst = 1;
    inc = 0;
    load = 0;
    d = 'd3;

    #7ns;
    assert (q == 'd0) $display("passed reset"); else $error("failed reset");
    #3ns;

    // latching condition
    rst = 0;

    #7ns;
    assert (q == 'd0) $display("passed latching 1"); else $error("failed latching 1");
    #3ns;

    // inc
    inc = 1;
    load = 0;

    #7ns;
    assert (q == 'd1) $display("passed increment"); else $error("failed increment");
    #3ns;

    // loading
    inc = 0;
    load = 1;

    #7ns;
    assert (q == d) $display("passed load"); else $error("failed load");
    #3ns;

    // latching condition
    inc = 1;
    load = 1;

    #7ns;
    assert (q == d) $display("passed latching 2"); else $error("failed latching 2");
    #3ns;






    $stop;

end



endmodule
