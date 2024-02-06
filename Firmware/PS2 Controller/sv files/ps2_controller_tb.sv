module ps2_controller_tb;


// internal wires

// in
logic clk;
logic rst;
logic data_in;

// out
logic [7:0] data_out;
logic bsy;


// wiring
ps2_controller dut(

    // in
    .clk(clk),
    .rst(rst),
    .data_in(data_in),

    // out
    .data_out(data_out),
    .bsy(bsy)


);


// 15kHz clock
// T = 33.36us
// always begin

//     clk = 1;
//     #33.33us;
//     clk = 0;
//     #33.33us;


// end

// testing
initial begin

    // simulating the letter
    // 10010101 = 7'h95

    // reset state
    rst = 1;
    clk = 1;
    data_in = 1;
    

    #66us;
    assert (data_out == 'd0) $display("passed reset"); else $error("failed reset");
    assert (bsy == 1) $display("passed busy flag high"); else $error("failed busy flag high");
    #0.66us;

    rst = 0;

    // idle state
    clk = 1;
    data_in = 1;
    #500us;


    // start of frame

    $display("Pressing the 'Q' key");
    
    // start bit (0)
    clk = 0;
    data_in = 0;
    #33.3us;
    clk = 1;
    #33.3us;
   

    // data start - LSB first

    data_in = 1;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 1;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 1;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    // data end


    // odd parity bit (0 in this case)
    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    // stop bit (1)
    data_in = 1;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;

    assert(data_out == 7'h15) $display("passed data"); else $error("failed data");
    assert (bsy == 0) $display("passed busy flag low"); else $error("failed busy flag low");
    

    // back to idle state
    

    #500us;







    // idle state
    clk = 1;
    data_in = 1;
    #500us;


    // start of frame

    $display("Pressing the 'Q' key");
    
    // start bit (0)
    clk = 0;
    data_in = 0;
    #33.3us;
    clk = 1;
    #33.3us;
   

    // data start - LSB first

    data_in = 1;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 1;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 1;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    // data end


    // odd parity bit (0 in this case)
    data_in = 0;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;
    #33.3us;

    // stop bit (1)
    data_in = 1;
    #5us;
    clk = 0;
    #33.3us;
    clk = 1;

    assert(data_out == 7'h15) $display("passed data"); else $error("failed data");
    assert (bsy == 0) $display("passed busy flag low"); else $error("failed busy flag low");
    

    // back to idle state
    

    #500us;
    
    


    


    $stop;

end










endmodule