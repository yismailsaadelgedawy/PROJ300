module bsy_reader_tb;

// internal wires

// in
logic clk;
logic rst;
logic bsy;
logic [7:0] data_in;


// out
logic [7:0] data_out;

// wiring
bsy_reader dut(

    // in
    .clk(clk),
    .rst(rst),
    .bsy(bsy),
    .data_in(data_in),

    // out
    .data_out(data_out)
);


// 15kHz clock
// T = 66.66us
always begin

    clk = 1;
    #33.33us;
    clk = 0;
    #33.33us;


end


// testing
initial begin

    rst = 1;
    data_in = 7'haa; // garbage data, do not read yet
    bsy = 1;
   
    #66us;
    assert (data_out == 'd0) $display("passed reset"); else $error("failed reset");
    #0.66us;

    rst = 0;
    data_in = 7'h15; // the letter Q
    bsy = 0; // falling edge
    
    #66us;
    assert (data_out == data_in) $display("passed not busy; may read"); else $error("failed not busy; may read");
    #0.66us;

    bsy = 1;
    data_in = 7'haa; // garbage data, do not read yet

    #66us;
    assert (data_out == 7'h15) $display("passed latch"); else $error("failed latch");
    #0.66us;


    bsy = 0;
    data_in = 7'h33; // the letter H

    #66us;
    assert (data_out == data_in) $display("passed latch"); else $error("failed latch");
    #0.66us;


    bsy = 1;
    rst = 1;

    #66us;
    assert (data_out == 'd0) $display("passed reset"); else $error("failed reset");
    #0.66us;


    $stop;


end




endmodule