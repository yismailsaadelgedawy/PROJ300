module UART_tb;

// internal wires

// in
logic clk_50MHz;
logic SW0;
logic UART2_RX;


// out
logic [7:0] data_out;


// wiring
UART dut(

    // in 
    .clk_50MHz(clk_50MHz),
    .SW0(SW0),
    .UART2_RX(UART2_RX),

    // out
    .data_out(data_out)


);


// 50MHz clock
// time period is 20ns
always begin

    clk_50MHz = 1;
    #10ns;
    clk_50MHz = 0;
    #10ns;

end


// testing
// 9600 baud - bit period = 104.167us
initial begin

    SW0 = 1;
    UART2_RX = 1;
    
    #100us;

    // idle for a bit
    SW0 = 0;
    UART2_RX = 1;
    #200us;


    ////////// begin transmission #1 //////////


    // start bit (0)
    UART2_RX = 0;
    #104.167us;
    
    
    // start of data frame - sending 'J' = 0x4A = 01001010 (LSB first) //

    // bit 0
    UART2_RX = 0;
    #104.167us;
    
    // bit 1
    UART2_RX = 1;
    #104.167us;
    
    
    // bit 2
    UART2_RX = 0;
    #104.167us;
       

    // bit 3
    UART2_RX = 1;
    #104.167us;
    

    // bit 4
    UART2_RX = 0;
    #104.167us;
    
    
    // bit 5
    UART2_RX = 0;
    #104.167us;
       

    // bit 6
    UART2_RX = 1;
    #104.167us;
    
    
    // bit 7
    UART2_RX = 0;
    #104.167us;
    
    // end of data frame  //


    // stop bit (1)
    UART2_RX = 1;
    #104.167us;
    
    


    ////////// end transmission //////////



    // back to idle

    // run for a bit
    #200us;






    ////////// begin transmission #2 //////////


    // start bit (0)
    UART2_RX = 0;
    #104.167us;
    
    
    // start of data frame - sending 'J' = 0x4A = 01001010 (LSB first) //

    // bit 0
    UART2_RX = 0;
    #104.167us;
    
    // bit 1
    UART2_RX = 1;
    #104.167us;
    
    
    // bit 2
    UART2_RX = 0;
    #104.167us;
       

    // bit 3
    UART2_RX = 1;
    #104.167us;
    

    // bit 4
    UART2_RX = 0;
    #104.167us;
    
    
    // bit 5
    UART2_RX = 0;
    #104.167us;
       

    // bit 6
    UART2_RX = 1;
    #104.167us;
    
    
    // bit 7
    UART2_RX = 0;
    #104.167us;
    
    // end of data frame  //


    // stop bit (1)
    UART2_RX = 1;
    #104.167us;
    
    


    ////////// end transmission //////////



    // back to idle

    // run for a bit
    #200us;


    


    $stop;


end





endmodule