module sprite_MUX_tb;

// parameters
parameter M=2; 
parameter B=$clog2(M);

// internal signals

// inputs
logic[11:0] a;
logic[11:0] b;
logic[B-1:0] s;

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

    s = 'd0; // a
    a = 12'hFFF;
    b = 12'h000;
    
    #10ns;
    assert (colour_data == a) $display("passed 1"); else $error("failed 1");

    s = 'd1; // b
    a = 12'hFFF;
    b = 12'h000;
    
    #10ns;
    assert (colour_data == b) $display("passed 2"); else $error("failed 2");

end


endmodule