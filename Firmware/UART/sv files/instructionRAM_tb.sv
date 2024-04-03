module instructionRAM_tb;

// parameters
parameter ADDR_WIDTH=10, MAX_ADDRESS=(2**ADDR_WIDTH)-1;


// internal wires

// in
logic clk, rst, DEBUG;
logic [1:0] MODE;
logic [ADDR_WIDTH-1:0] address;
logic [7:0] data_in;


// out
logic [37:0] data_out;


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

// this component runs at a higher frequency that the UART module, so the delays are > 1 cycles
// as the data will be held for more than one cycle

// testing -- writing MUST be done first
initial begin

    // reset state
    rst = 1;
    MODE = 2'd0; // write mode by default
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

    MODE = 2'd0; // write mode
    DEBUG = 0; // ignored
    address = 'd0; // ignored


    data_in = 'd0; // simulating idle before MCU sends data
    #80ns;

    // will now send 6 bytes representing the CPU instruction (0x01 0x01 0x00 0x02 0x00 0x03)
    

    data_in = 'h01; // opcode
    #80ns;
    data_in = 'h24; // next address byte
    #80ns;
    data_in = 'h01; // sel
    #80ns;
    data_in = 'h24;
    #80ns;
    data_in = 'h00; // op1h
    #80ns;
    data_in = 'h24;
    #80ns;
    data_in = 'h02; // op1l
    #80ns;
    data_in = 'h24;
    #80ns;
    data_in = 'h00; // op2h
    #80ns;
    data_in = 'h24;
    #80ns;
    data_in = 'h03; // op2l
    #80ns;
    data_in = 'h24;
    #80ns;

    // and again...
    data_in = 'h02; // opcode
    #80ns;                              
    data_in = 'h24; // next address byte
    #80ns;
    data_in = 'h01; // sel
    #80ns;
    data_in = 'h24;
    #80ns;
    data_in = 'h00; // op1h
    #80ns;
    data_in = 'h24;
    #80ns;
    data_in = 'h02; // op1l
    #80ns;
    data_in = 'h24;
    #80ns;
    data_in = 'h00; // op2h
    #80ns;
    data_in = 'h24;
    #80ns;
    data_in = 'h03; // op2l
    #80ns;
    data_in = 'h24;
    #80ns;


    #300ns;


    $display("\n////////////// DEBUGGING FROM RAM //////////////\n");


    // address and DEBUG should be ignored
    MODE = 2'd1; // debug mode
    DEBUG = 0;
    address = 'd0; // ignored
    data_in = 'd0; // ignored

    #15ns;
    assert (data_out == {'h01,'h01,'h00,'h02,'h00,'h03}) $display("passed debug 1..."); else $error("failed debug 1...");
    #5ns;

    DEBUG = 1; #20ns; // button press
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == {'h02,'h01,'h00,'h02,'h00,'h03}) $display("passed debug 2..."); else $error("failed debug 2...");
    #5ns;

    

    ////// pressing btn few more times to stress test //////


    $display("\n////// pressing btn few more times to stress test //////\n");


    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == {'h02,'h01,'h00,'h02,'h00,'h03}) $display("passed debug: end of instructions"); else $error("failed debug: end of instructions");
    #5ns;

    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == {'h02,'h01,'h00,'h02,'h00,'h03}) $display("passed debug: end of instructions"); else $error("failed debug: end of instructions");
    #5ns;


    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == {'h02,'h01,'h00,'h02,'h00,'h03}) $display("passed debug: end of instructions"); else $error("failed debug: end of instructions");
    #5ns;

    DEBUG = 1; #20ns; // button press, wait a clock cycle
    DEBUG = 0;
    #20ns; // wait a cycle

    #15ns;
    assert (data_out == {'h02,'h01,'h00,'h02,'h00,'h03}) $display("passed debug: end of instructions"); else $error("failed debug: end of instructions");
    #5ns;


    $display(" ");
    $display("////////////// RANDOM ACCESS FETCH FROM RAM //////////////");
    $display(" ");

    // only 'address' is relevant here
    MODE = 2'd2; // random access mode
    DEBUG = 0; // ignored
    address = 'd0; // first byte stored
    data_in = 'd0; // ignored

    #15ns;
    assert (data_out == {'h01,'h01,'h00,'h02,'h00,'h03}) $display("passed fetch 1"); else $error("failed fetch 1");
    #5ns;

    address = 'd1; // second byte stored

    #15ns;
    assert (data_out == {'h02,'h01,'h00,'h02,'h00,'h03}) $display("passed fetch 2"); else $error("failed fetch 2");
    #5ns;    



    $stop;

end

endmodule