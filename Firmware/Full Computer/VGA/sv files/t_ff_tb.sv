`timescale 1ns/1ns
module t_ff_tb;

// internal signals

// inputs
logic t;
logic rst;
logic clk;

// outputs
logic q;


// wiring
t_ff dut (

    // inputs
    .t(t),
    .rst(rst),
    .clk(clk),

    // outputs
    .q(q)


);


// clock - simulated actual values!
always begin

    clk = 1;
    #10ns;
    clk = 0;
    #10ns;

    // time period is 20ns (50MHz)

end



// testing
initial begin

    t = 1;
    rst = 1;
    
    #15ns; // do NOT test on rising edge!
    assert (q == 0) $display("passed reset condition"); else $error("failed reset condition");
    #5ns; // clock period

    rst = 0;

    #15ns;
    assert (q == 1) $display("passed toggling 1"); else $error("failed toggling 1");
    #5ns;

    #15ns;
    assert (q == 0) $display("passed toggling 2"); else $error("failed toggling 2");
    #5ns;

    #15ns;
    assert (q == 1) $display("passed toggling 3"); else $error("failed toggling 3");
    #5ns;

    t = 0;
    
    #15ns;
    assert (q == 1) $display("passed memory condition"); else $error("failed memory condition");
    #5ns;

    rst = 1;

    #15ns;
    assert (q == 0) $display("passed reset condition"); else $error("failed reset condition");
    #5ns;


    

    $stop;



end

endmodule