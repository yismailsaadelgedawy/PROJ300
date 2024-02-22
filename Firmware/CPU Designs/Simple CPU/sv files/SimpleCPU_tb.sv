module SimpleCPU_tb;

// internal wires
logic CLK, RST;

// wiring
SimpleCPU dut (

    .CLK(CLK),
    .RST(RST)

);

// clock
always begin

    CLK = 1;
    #5ns;
    CLK = 0;
    #5ns;

end

// testing
initial begin

    RST = 1;
    #10ns;

    // run for a bit
    RST = 0;
    #1000ns;

    $stop;


end



endmodule