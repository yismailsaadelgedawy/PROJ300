module instructionRAM_tb;

// parameters
parameter DATA_WIDTH=8, MAX_ADDRESS=255;


// internal wires

// in
logic clk, rst, DEBUG;
logic [1:0] MODE;
logic [DATA_WIDTH-1:0] address;
logic [DATA_WIDTH-1:0] data_in;


// out
logic [DATA_WIDTH-1:0] data_out;


// wiring
instructionRAM dut (

    // in
    .clk(clk),
    .rst(rst),
    .DEBUG(DEBUG),
    .MODE(MODE),
    .address(address),
    .data_in(data_in),

    // out
    .data_out(data_out)


);


// 50MHz clock
// T = 20ns
always begin

    clk = 1;
    #10ns;
    clk = 0;
    #10ns;

end

// testing -- writing MUST be done first
initial begin

    // reset state
    rst = 1;
    MODE = 2'd1; // write mode by default
    DEBUG = 0; // debug button not pressed
    address = 'd0;
    data_in = 'd0;

    #15ns;
    assert (data_out == 'd0) $display("passed reset"); else $error("failed reset");
    #5ns;
    
    rst = 0;

    $display(" ");
    $display("////////////// WRITING TO RAM //////////////");
    $display(" ");

    // data_out should stay 0

    MODE = 2'd1; // write mode by default
    DEBUG = 0; // ignored
    address = 'd0; // ignored



    data_in = 'd0; // simulating idle before MCU sends data
    #80ns;

    data_in = 'h4A;
    #80ns;  // data will be held the same value for more than one clock cycle (this is where it breaks!)

    // next address byte
    data_in = 'h24;
    #80ns;

    data_in = 'h4B;
    #80ns;

    data_in = 'h24;
    #80ns;

    data_in = 'h4C;
    #80ns;

    data_in = 'h24;
    #80ns;

    data_in = 'h4D;
    #80ns;

    data_in = 'h24;
    #80ns;



    $display(" ");
    $display("////////////// READING FROM RAM //////////////");
    $display(" ");

    MODE = 2'd0; // read mode
    DEBUG = 0; // ignored
    address = 'd0; // ignored
    data_in = 'd0; // ignored

    // #15ns;
    // assert (data_out == 'h4A) $display("passed reading 1..."); else $error("failed reading 1...");
    // #5ns;

    // #15ns;
    // assert (data_out == 'h4B) $display("passed reading 2..."); else $error("failed reading 2...");
    // #5ns;

    // #15ns;
    // assert (data_out == 'h4C) $display("passed reading 3..."); else $error("failed reading 3...");
    // #5ns;

    // #15ns;
    // assert (data_out == 'h4D) $display("passed reading 4..."); else $error("failed reading 4...");
    // #5ns;



    #500ns;  // run for a bit




    $display(" ");
    $display("////////////// DEBUGGING FROM RAM //////////////");
    $display(" ");

    // address and DEBUG should be ignored
    MODE = 2'd2; // debug mode
    DEBUG = 0;
    address = 'd0; // ignored
    data_in = 'd0; // ignored

    #15ns;
    assert (data_out == 'h4A) $display("passed debug 1..."); else $error("failed debug 1...");
    #5ns;

    DEBUG = 1; #20ns; // button press
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == 'h4B) $display("passed debug 2..."); else $error("failed debug 2...");
    #5ns;

    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == 'h4C) $display("passed debug 3..."); else $error("failed debug 3...");
    #5ns;

    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == 'h4D) $display("passed debug 4..."); else $error("failed debug 4..");
    #5ns;



    ////// pressing btn few more times to stress test //////

    $display(" ");
    $display("////// pressing btn few more times to stress test //////");
    $display(" ");

    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == 'h4D) $display("passed debug: end of instructions"); else $error("failed passed debug: end of instructions");
    #5ns;

    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == 'h4D) $display("passed debug: end of instructions"); else $error("failed passed debug: end of instructions");
    #5ns;


    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == 'h4D) $display("passed debug: end of instructions"); else $error("failed passed debug: end of instructions");
    #5ns;

    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == 'h4D) $display("passed debug: end of instructions"); else $error("failed passed debug: end of instructions");
    #5ns;



    $stop;

end

endmodule