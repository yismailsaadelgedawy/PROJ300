module encoder_tb;


// internal wires

// in
logic [3-1:0] data;

// out
logic [2-1:0] q;


// wiring
encoder dut(

    // in
    .data(data),

    // out
    .q(q)

);

// testing
initial begin

    data = 3'b000;
    #10ns;
    assert(q == 'd0) $display("passed 1"); else $error("failed 1");

    data = 3'b001;
    #10ns;
    assert(q == 'd1) $display("passed 2"); else $error("failed 2");

    data = 3'b010;
    #10ns;
    assert(q == 'd2) $display("passed 3"); else $error("failed 3");

    data = 3'b100;
    #10ns;
    assert(q == 'd3) $display("passed 4"); else $error("failed 4");



end


endmodule