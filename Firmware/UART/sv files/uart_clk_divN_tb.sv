module uart_clk_divN_tb;

// internals

// in
logic clk_in;
logic rst;
logic transmission_state;


// out
logic clk_out;


// wiring
uart_clk_divN dut (

    // in
    .clk_in(clk_in),
    .rst(rst),
    .transmission_state(transmission_state),

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
    
    // reset state
    rst = 1;
    transmission_state = 0;

    #15ns;
    assert (clk_out == 0) $display("passed reset"); else $error("failed reset");
    #5ns;

    // idle state
    rst = 0;
    transmission_state = 0;

    #2ms;

    // transmission state
    transmission_state = 1;

    #1ms; // run for 10 bits = 10*1/9600 = 1ms
    

    // back to idle state
    transmission_state = 0;

    #2ms;   

    $stop;

end





endmodule