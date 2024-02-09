module PS2controller_tb;

// outdated - but I know it works //
// may update later //

// internal wires

// in
logic PS2_CLK;
logic rst;
logic PS2_DAT;

// out
logic [7:0] data_out;


// wiring
PS2controller dut(

    // in
    .PS2_CLK(PS2_CLK),
    .rst(rst),
    .PS2_DAT(PS2_DAT),

    // out
    .data_out(data_out)


);


// 15kHz clock
// T = 33.36us
// always begin

//     PS2_CLK = 1;
//     #33.33us;
//     PS2_CLK = 0;
//     #33.33us;


// end

// testing
initial begin

    // simulating the letter
    // 10010101 = 8'h95

    // reset state
    rst = 1;
    PS2_CLK = 1;
    PS2_DAT = 1;
    

    #66us;
    assert (data_out == 'd0) $display("passed reset"); else $error("failed reset");
    #0.66us;

    rst = 0;

    // idle state
    PS2_CLK = 1;
    PS2_DAT = 1;
    #500us;


    // start of frame

    $display("Pressing the 'Q' key");
    
    // start bit (0)
    PS2_CLK = 0;
    PS2_DAT = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;
   

    // data start - LSB first

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    // data end


    // odd parity bit (0 in this case)
    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    // stop bit (1)
    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;

    assert(data_out == 8'h15) $display("passed data"); else $error("failed data");
    

    // back to idle state


    // idle state
    PS2_CLK = 1;
    PS2_DAT = 1;
    #50us;


    // start of frame

    $display("Releasing the 'Q' key - 0xF0");  // will send 0xF0 = 11110000
    
    // start bit (0)
    PS2_CLK = 0;
    PS2_DAT = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;
   

    // data start - LSB first

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    // data end


    // odd parity bit (1 in this case)
    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    // stop bit (1)
    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;

    assert(data_out == 8'hF0) $display("passed data"); else $error("failed data");


    // idle state
    PS2_CLK = 1;
    PS2_DAT = 1;
    #50us;



    // start of frame

    $display("Releasing the 'Q' key - 0x15");
    
    // start bit (0)
    PS2_CLK = 0;
    PS2_DAT = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;
   

    // data start - LSB first

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    // data end


    // odd parity bit (0 in this case)
    PS2_DAT = 0;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;
    #33.3us;

    // stop bit (1)
    PS2_DAT = 1;
    #5us;
    PS2_CLK = 0;
    #33.3us;
    PS2_CLK = 1;

    assert(data_out == 8'h00) $display("passed released Q - output 0"); else $error("failed released Q - output 0");

   
   // back to idle
    

    #500us;
    
    


    


    $stop;

end










endmodule