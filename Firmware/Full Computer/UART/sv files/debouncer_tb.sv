module debouncer_tb;

// internal wires

// in
logic clk, rst, d;


// out
logic q;

// wiring
debouncer dut(

    // in
    .clk(clk),
    .rst(rst),
    .d(d),

    // out
    .q(q)

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
    assert (q == 0) $display("passed reset"); else $error("failed reset");
    #5ns;


    $display("");
    $display("//////// press and release 1 ////////");

    // idle state
    rst = 0;
    d = 0;
    
    #15ns;
    assert (q == 0) $display("passed idle"); else $error("failed idle");
    #5ns;

    // pressed state
    d = 1;
    #20ns; // wait a clock cycle
    #110ms // then wait a bit more than 100 ms debounce time

    assert (q == 1) $display("passed pressed"); else $error("failed pressed");


    // released state
    d = 0;
    #20ns; // wait a clock cycle
    #110ms // then wait a bit more than 100 ms debounce time

    assert (q == 0) $display("passed released"); else $error("failed released");



    $display("");
    $display("//////// press and release 2 ////////");

    // pressed state
    d = 1;
    #20ns; // wait a clock cycle
    #110ms // then wait a bit more than 100 ms debounce time

    assert (q == 1) $display("passed pressed"); else $error("failed pressed");


    // released state
    d = 0;
    #20ns; // wait a clock cycle
    #110ms // then wait a bit more than 100 ms debounce time

    assert (q == 0) $display("passed released"); else $error("failed released");

    $stop;

end



endmodule