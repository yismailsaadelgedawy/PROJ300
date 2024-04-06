module not4_tb;

// internal signals
logic [3:0] a;
logic [3:0] q;

// wiring
not4 dut(
    .a(a),
    .q(q)
);

// testing
initial begin

    a = 4'b1111;
    #10ns;
    assert(q == 4'b0000) $display("passed"); else $error("failed");

end



endmodule