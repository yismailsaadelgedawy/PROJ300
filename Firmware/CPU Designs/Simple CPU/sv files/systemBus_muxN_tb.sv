module systemBus_muxN_tb;

// parameters
parameter N=8;

// internal wires

// in
logic [1:0] sel;
logic [N-1:0] a,b,c;


// out
logic [N-1:0] q;

// wiring
systemBus_muxN dut (

    // in
    .sel(sel),
    .a(a),
    .b(b),
    .c(c),

    // out
    .q(q)

);


// testing
initial begin

    sel = 'd0;
    a = 6'd63; // PCBUS (max 6-bit value)
    b = 8'd80; // DRBUS
    c = 8'd100; // MEMBUS
    #10ns;

    assert (q == a) $display("passed PCBUS"); else $error("failed PCBUS");

    sel = 'd1;
    #10ns;

    assert (q == b) $display("passed DRBUS"); else $error("failed DRBUS");

    sel = 'd2;
    #10ns;

    assert (q == c) $display("passed MEMBUS"); else $error("failed MEMBUS");

    sel = 'd3;
    #10ns;

    assert (q == a) $display("passed PCBUS"); else $error("failed PCBUS");


end


endmodule