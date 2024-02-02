module clk_divN_tb;


// in
logic rst;
logic clk_in;

// out
logic clk_out;

// wiring
clk_divN dut(

    // in
    .rst(rst),
    .clk_in(clk_in),

    // out
    .clk_out(clk_out)


);

// 50MHz clock
// time period is 20ns
always begin

    clk_in = 1;
    #10ns;
    clk_in = 0;
    #10ns;

end


// testing
initial begin

    rst = 1;

    #35ns;
    assert (clk_out == 0) $display("passed reset"); else $error("failed reset");
    #5ns;

    rst = 0;

    // run for a bit
    #15ms;


    $stop;


end


endmodule