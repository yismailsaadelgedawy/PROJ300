module SimpleCPU_tb;

// internal wires
logic CLK, CLK_HALF, RST;

// wiring
SimpleCPU dut (

    .CLK(CLK),
    .CLK_HALF(CLK_HALF),
    .RST(RST)

);

// clock
always begin

    CLK = 1;
    #5ns;
    CLK = 0;
    #5ns;

end

// clock half
always begin

    CLK_HALF = 1;
    #10ns;
    CLK_HALF = 0;
    #10ns;

end

// testing
initial begin

    RST = 1;
    #20ns;

    // run for a bit
    RST = 0;
    #1000ns;

    $stop;


end



endmodule