module sprite_MUX_tb;



// internal signals

// inputs
logic[11:0] a;
logic[11:0] b;
logic s;

// outputs
logic [11:0] colour_data;

// wiring
sprite_MUX dut(

    // in
    .a(a),
    .b(b),
    .s(s),

    // out
    .colour_data(colour_data)

);


// testing
initial begin

    s = 0; // a
    a = 12'hFFF;
    b = 12'h000;
    
    #10ns;
    assert (colour_data == a) $display("passed 1"); else $error("failed 1");

    s = 1; // b
    a = 12'hFFF;
    b = 12'h000;
    
    #10ns;
    assert (colour_data == b) $display("passed 2"); else $error("failed 2");

end


endmodule