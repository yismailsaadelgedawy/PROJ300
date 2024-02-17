module fine_clk_divN_tb;

// internals

// in
logic clk_in;
logic rst;


// out
logic clk_out;


// wiring
fine_clk_divN dut (

    // in
    .clk_in(clk_in),
    .rst(rst),

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

    #15ns;
    assert (clk_out == 0) $display("passed reset"); else $error("failed reset");
    #5ns;

    rst = 0;

    #4ms;



    $stop;
end





endmodule