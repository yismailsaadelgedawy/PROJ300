module muxN_tb;

// parameters
parameter N=4;
parameter M=$clog2(N);

// internal wires

// in
logic [N-1:0] data; 
logic [M-1:0] sel;

// out
logic q;

// wiring
muxN dut(

    // in
    .data(data),
    .sel(sel),

    // out
    .q(q)


);


// testing
initial begin

    sel = 'd0;
    data = 4'b1010;
    #10ns;
    assert (q == 0) $display("passed 1"); else $error("failed 1");

    sel = 'd1;
    #10ns;
    assert (q == 1) $display("passed 2"); else $error("failed 2");

    sel = 'd2;
    #10ns;
    assert (q == 0) $display("passed 3"); else $error("failed 3");

    sel = 'd3;
    #10ns;
    assert (q == 1) $display("passed 4"); else $error("failed 4");


end


endmodule