module rgbMUX_tb;

// internal signals

// inputs
logic[11:0] A;
logic[11:0] B;

// outputs
logic[11:0] colour_data;

// wiring
rgbMUX dut (

    // in
    .A(A),
    .B(B),

    // out
    .colour_data(colour_data)


);


// testing
initial begin

    A = 12'h000;
    B = 12'h000;
    
    #10ns;
    assert (colour_data == A) $display("passed zeros"); else $error("failed zeros");

    A = 12'hFFF;
    B = 12'h000;
    
    #10ns;
    assert (colour_data == A) $display("passed 1"); else $error("failed 1");


    A = 12'h000;
    B = 12'hFAF;
    
    #10ns;
    assert (colour_data == B) $display("passed 2"); else $error("failed 2");    



end




endmodule