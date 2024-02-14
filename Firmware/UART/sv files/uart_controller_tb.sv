module uart_controller_tb;


// internal wires

// in
logic rst, clk, data_in;


// out
logic [7:0] data_out;
logic bsy;

// wiring
uart_controller dut(

    // in
    .clk(clk),
    .rst(rst),
    .data_in(data_in),

    // out
    .data_out(data_out),
    .bsy(bsy)

);

// fast clock used to reduce memory consumption
// T = 10ns

// assume a bit period of 20ns

// testing
initial begin

    rst = 1;
    data_in = 1;
    clk = 0;
    #10ns;

    // idle for a bit
    rst = 0;
    data_in = 1;
    #100ns;


    ////////// begin transmission #1 //////////


    // start bit (0)
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)


    // start of data frame - sending 'J' = 0x4A = 01001010 (LSB first) //

    // bit 0
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 1
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 2
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 3
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 4
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 5
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 6
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 7
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)


    // end of data frame  //


    // stop bit (1)
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)


    ////////// end transmission //////////



    // idle
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns;

    // run for a bit
    #100ns;








    ////////// begin transmission #2 //////////


    // start bit (0)
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)


    // start of data frame - sending 'J' = 0x4A = 01001010 (LSB first) //

    // bit 0
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 1
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 2
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 3
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 4
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 5
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 6
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)

    // bit 7
    clk = 1;
    data_in = 0;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)


    // end of data frame  //


    // stop bit (1)
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns; // 20ns passed (bit period)


    ////////// end transmission //////////



    // idle
    clk = 1;
    data_in = 1;
    #10ns;
    clk = 0;
    #10ns;

    // run for a bit
    #100ns;




    $stop;


end





endmodule
