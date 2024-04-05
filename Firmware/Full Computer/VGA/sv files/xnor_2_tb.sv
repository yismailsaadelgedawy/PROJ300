module xnor_2_tb;

// internal signals

// inputs
logic a;
logic b;

// outputs
logic q;


// wiring
xnor_2 dut (

    // inputs
    .a(a),
    .b(b),

    // outputs
    .q(q)


);



initial begin

    {a,b} = 2'b00;

    #10ns;

    assert (q == 1) $display("passed 1"); else $error("failed 1");


    {a,b} = 2'b01;

    #10ns;

    assert (q == 0) $display("passed porch 1"); else $error("failed porch 1");


    {a,b} = 2'b10;

    #10ns;

    assert (q == 0) $display("passed porch 2"); else $error("failed porch 2");


    {a,b} = 2'b11;

    #10ns;

    assert (q == 1) $display("passed active region"); else $error("failed active region");



end



endmodule