module pulse_gen_tb;

// internal wires

// in
logic clk, rst, d;


// out
logic q;

// wiring
pulse_gen dut(

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

    // reset 
    rst = 1;
    d = 0;
    
    #15ns;
    assert (q == 0) $display("passed reset"); else $error("failed reset");
    #5ns;

    rst = 0;

    #60ns; // wait a few cycles


    // input change
    d = 1;
    #20ns; // wait 1 clock cycle

    #15ns;
    assert (q == 1) $display("passed pulse high"); else $error("failed pulse high");
    #5ns;

    #15ns;
    assert (q == 0) $display("passed pulse low"); else $error("failed pulse low");
    #5ns;

    #60ns; // wait a few cycles


   // input change
    d = 0;
    #20ns; // wait 1 clock cycle

    #15ns;
    assert (q == 1) $display("passed pulse high"); else $error("failed pulse high");
    #5ns;

    #15ns;
    assert (q == 0) $display("passed pulse low"); else $error("failed pulse low");
    #5ns;


    #60ns; // wait a few cycles



    $stop;




end



endmodule