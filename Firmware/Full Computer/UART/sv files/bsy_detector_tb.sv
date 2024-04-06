module bsy_detector_tb;

// internal wires

// in
logic rst;
logic [7:0] data_in;
logic bsy;

// out
logic [7:0] data_out;
logic eot;


// inst and wiring
bsy_detector dut (
    
    // in
    .rst(rst),
    .data_in(data_in),
    .bsy(bsy),

    // out
    .data_out(data_out),
    .eot(eot)


);


// testing
initial begin

    // rst
    rst = 1;
    data_in = 'd200;
    bsy = 1;    // high by default
    #10ns;

    assert(data_out == 'd0 && eot == 0) $display("passed rst"); else $error("failed rst");

    // busy...
    rst = 0;
    data_in = 'd200;
    bsy = 1;    // high by default
    #10ns;

    assert(data_out == 'd0 && eot == 0) $display("passed bsy - do not read"); else $error("failed bsy - do not read");

    // ready!
    rst = 0;
    data_in = 'd200;
    bsy = 0;    // high by default
    #10ns;

    assert(data_out == data_in && eot == 1) $display("passed ready - read!"); else $error("failed ready - read!");

    bsy = 1;
    #10ns;

    assert(data_out == data_in && eot == 0) $display("passed latch and flag low"); else $error("failed latch and flag low");


end











endmodule