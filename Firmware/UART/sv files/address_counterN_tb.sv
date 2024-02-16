module address_counterN_tb;

// parameters
parameter N=2, MAX_ADDRESS=3;

// internal wires

// in
logic clk, rst, d;


// out
logic [N-1:0] address;

// wiring
address_counterN dut(

    // in
    .clk(clk),
    .rst(rst),
    .d(d),

    // out
    .address(address)

);

// 50MHz clock
// time period is 20ns
always begin

    clk = 1;
    #10ns;
    clk = 0;
    #10ns;

end



// testing
initial begin

    // reset state
    rst = 1;
    d = 0;

    #15ns;
    assert (address == 0) $display("passed reset"); else $error("failed reset");
    #5ns;

    rst = 0;

    #40ns; // wait a bit

    // 
    d = 1;
    #20ns; // wait a clock cycle

    #15ns;
    assert (address == 1) $display("passed 1"); else $error("failed 1");
    #5ns;

    d = 0;
    #20ns; // wait a clock cycle

    #15ns;
    assert (address == 1) $display("passed 2"); else $error("failed 2");
    #5ns;
    // d END


    // 
    d = 1;
    #20ns; // wait a clock cycle

    #15ns;
    assert (address == 2) $display("passed 3"); else $error("failed 3");
    #5ns;

    d = 0;
    #20ns; // wait a clock cycle

    #15ns;
    assert (address == 2) $display("passed 4"); else $error("failed 4");
    #5ns;
    // d END



    // 
    d = 1;
    #20ns; // wait a clock cycle

    #15ns;
    assert (address == 3) $display("passed 5"); else $error("failed 5");
    #5ns;

    d = 0;
    #20ns; // wait a clock cycle

    #15ns;
    assert (address == 3) $display("passed 6"); else $error("failed 6");
    #5ns;
    // d END




    // 
    d = 1;
    #20ns; // wait a clock cycle

    #15ns;
    assert (address == 0) $display("passed 7"); else $error("failed 7");
    #5ns;

    d = 0;
    #20ns; // wait a clock cycle

    #15ns;
    assert (address == 0) $display("passed 8"); else $error("failed 8");
    #5ns;
    //

    d = 1;

    #100ns;


    $stop;



end




endmodule