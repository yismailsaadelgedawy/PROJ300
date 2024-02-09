module bsy_reader_tb;

// internal wires

// in
logic rst;
logic bsy;
logic [7:0] data_in;


// out
logic [7:0] data_out;


// wiring
bsy_reader dut(

    // in
    .rst(rst),
    .bsy(bsy),
    .data_in(data_in),

    // out
    .data_out(data_out)

);


// 15kHz clock
// T = 66.66us
// always begin

//     clk = 1;
//     #33.33us;
//     clk = 0;
//     #33.33us;


// end


// testing
initial begin

    $display("////// pressing 'Q' //////");
    rst = 1;
    data_in = 8'h00; // garbage data, do not read yet
    bsy = 1;
   
    #66us;
    assert (data_out == 'd0) $display("passed reset"); else $error("failed reset");
    #0.66us;

    rst = 0;
    data_in = 8'h15; // the letter Q
    bsy = 0; // falling edge
    
    #66us;
    assert (data_out == data_in) $display("passed make code 0x15"); else $error("failed make code 0x15");
    #0.66us;

    bsy = 1;
    data_in = 8'h00; // garbage data, do not read yet

    #66us;
    assert (data_out == 8'h15) $display("passed latch"); else $error("failed latch");
    #0.66us;




    $display("////// releasing 'Q' //////");
    bsy = 0;
    data_in = 8'hF0; // break code

    #66us;
    assert (data_out == data_in) $display("passed break code 0xF0"); else $error("failed break code 0xF0");
    #0.66us;


    bsy = 1;
    data_in = 8'h00; // garbage data, do not read yet

    #66us;
    assert (data_out == 8'hF0) $display("passed latch"); else $error("failed latch");
    #0.66us;


    bsy = 0;
    data_in = 8'h15; // the Q

    #66us;
    assert (data_out == data_in) $display("passed break code 0x15"); else $error("failed break code 0x15");
    #0.66us;


    // no more data
    bsy = 1;
    data_in = 8'h00;

    #100us;


    $stop;


end




endmodule