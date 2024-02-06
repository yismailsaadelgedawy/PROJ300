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
// T = 66.66us
always begin

    clk = 1;
    #33.33us;
    clk = 0;
    #33.33us;


end

// testing
initial begin

    // simulating the letter 'Q'
    // 00010101 = 7'h15

    // reset state
    rst = 1;
    data_in = 1;

    #66us;
    assert (data_out == 'd0) $display("passed reset"); else $error("failed reset");
    assert (bsy == 1) $display("passed busy flag high"); else $error("failed busy flag high");
    #0.66us;

    // start of frame

    $display(" ");
    $display("Pressing the 'Q' key");
    
    // start bit (0)
    rst = 0;
    data_in = 0;
    #66.6us;
   

    // data start - LSB first

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    // data end


    // odd parity bit (0 in this case)
    data_in = 0;
    #66.6us;

    // stop bit (1)
    data_in = 1;

    #66us;
    assert(data_out == 7'h15) $display("passed data"); else $error("failed data");
    assert (bsy == 0) $display("passed busy flag low"); else $error("failed busy flag low");
    #0.66us;

    #100us; // run for a bit





    // simulating the letter 'H'
    // 00110011 = 7'h33


    // start of frame

    $display(" ");
    $display("Pressing the 'H' key");
    
    // start bit (0)
    rst = 0;
    data_in = 0;
    #66.6us;
   

    // data start - LSB first

    data_in = 1;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    // data end


    // odd parity bit (1 in this case)
    data_in = 1;
    #66.6us;

    // stop bit (1)
    data_in = 1;

    #66us;
    assert(data_out == 7'h33) $display("passed data"); else $error("failed data");
    assert (bsy == 0) $display("passed busy flag low"); else $error("failed busy flag low");
    #0.66us;

    #100us; // run for a bit






    ///////////////// holding down the 'Q' key /////////////////

    // start of frame

    $display(" ");
    $display("///////////////// holding down the 'Q' key /////////////////");
    $display(" ");
    $display("Pressing the 'Q' key");
    
    // start bit (0)
    rst = 0;
    data_in = 0;
    #66.6us;
   

    // data start - LSB first

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    // data end


    // odd parity bit (0 in this case)
    data_in = 0;
    #66.6us;

    // stop bit (1)
    data_in = 1;

    #66us;
    assert(data_out == 7'h15) $display("passed data"); else $error("failed data");
    assert (bsy == 0) $display("passed busy flag low"); else $error("failed busy flag low");
    #0.66us;

    /////////////////

    

    // start of frame

    $display(" ");
    $display("Pressing the 'Q' key");
    
    // start bit (0)
    rst = 0;
    data_in = 0;
    #66.6us;
   

    // data start - LSB first

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    // data end


    // odd parity bit (1 in this case)
    data_in = 0;
    #66.6us;

    // stop bit (1)
    data_in = 1;

    #66us;
    assert(data_out == 7'h15) $display("passed data"); else $error("failed data");
    assert (bsy == 0) $display("passed busy flag low"); else $error("failed busy flag low");
    #0.66us;


    /////////////////
    
    

    // start of frame

    $display(" ");
    $display("Pressing the 'Q' key");
    
    // start bit (0)
    rst = 0;
    data_in = 0;
    #66.6us;
   

    // data start - LSB first

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    // data end


    // odd parity bit (0 in this case)
    data_in = 0;
    #66.6us;

    // stop bit (1)
    data_in = 1;

    #66us;
    assert(data_out == 7'h15) $display("passed data"); else $error("failed data");
    assert (bsy == 0) $display("passed busy flag low"); else $error("failed busy flag low");
    #0.66us;



    ////////////////////

    // start of frame

    $display(" ");
    $display("Pressing the 'Q' key");
    
    // start bit (0)
    rst = 0;
    data_in = 0;
    #66.6us;
   

    // data start - LSB first

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 1;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    data_in = 0;
    #66.6us;

    // data end


    // odd parity bit (0 in this case)
    data_in = 0;
    #66.6us;

    // stop bit (1)
    data_in = 1;

    #66us;
    assert(data_out == 7'h15) $display("passed data"); else $error("failed data");
    assert (bsy == 0) $display("passed busy flag low"); else $error("failed busy flag low");
    #0.66us;


    ///////////////// release Q /////////////////



    


    $stop;

end










endmodule