module uart_clk_divN_tb;

// internals

// in
logic clk_in;
logic rst;
logic sense, bsy;


// out
logic clk_out;


// wiring
uart_clk_divN dut (

    // in
    .clk_in(clk_in),
    .rst(rst),
    .sense(sense),
    .bsy(bsy),

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
    sense = 1;
    bsy = 1;
    

    #15ns;
    assert (clk_out == 0) $display("passed reset"); else $error("failed reset");
    #5ns;

    // idle state
    rst = 0;
    
    #2ms;

    // transmission state
    sense = 0; // start bit
    #0.5ms;

    sense = 1; // data frame
    #0.5ms;
    sense = 0;
    #0.5ms;
    sense = 0;
    #0.5ms;
    sense = 1;
    #0.5ms;
    sense = 0;
    #0.5ms;
    sense = 0;
    #0.5ms;
    sense = 1;
    #0.5ms;
    sense = 0;
    #0.5ms;

    sense = 1; // stop bit
    bsy = 0;
    #0.5ms;

    
    bsy = 1;
    

    // back to idle state
    

    #2ms;




    // transmission state #2
    sense = 0; // start bit
    #0.5ms;

    sense = 1; // data frame
    #0.5ms;
    sense = 0;
    #0.5ms;
    sense = 0;
    #0.5ms;
    sense = 1;
    #0.5ms;
    sense = 0;
    #0.5ms;
    sense = 0;
    #0.5ms;
    sense = 1;
    #0.5ms;
    sense = 0;
    #0.5ms;

    sense = 1; // stop bit
    bsy = 0;
    #0.5ms;

    
    bsy = 1;
    

    // back to idle state
    

    #2ms;      

    $stop;

end





endmodule