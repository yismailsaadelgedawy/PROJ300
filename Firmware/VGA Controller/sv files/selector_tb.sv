module selector_tb;


// internal signals

// inputs
logic[11:0] a;
logic[11:0] b;

// outputs
logic s;

// wiring
selector dut (

    // inputs
    .a(a),
    .b(b),

    // outputs
    .s(s)

);


// testing
initial begin

    a = 12'h000;
    b = 12'h000;
    
    #10ns;
    assert (s == 0) $display("passed 1"); else $error("failed 1");

    a = 12'h0A0;
    b = 12'h000;

    #10ns;
    assert (s == 0) $display("passed 2"); else $error("failed 2");

    a = 12'h000;
    b = 12'hFFF;

    #10ns;
    assert (s == 1) $display("passed 3"); else $error("failed 3");

    a = 12'h000;
    b = 12'h000;

    #10ns;
    assert (s == 0) $display("passed 4"); else $error("failed 4");

    


    $stop;


end





endmodule