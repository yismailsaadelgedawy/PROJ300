`timescale 1ns/1ns
module WS2812B_controller_tb;

// params
parameter N=32;
parameter colour = 24'hFF0000;

// internal wires

// in
logic clk_50, rst;
logic [N-1:0] data_in;

// out
logic data_out;

// inst and wiring
WS2812B_controller dut (

    // in
    .clk_50(clk_50),
    .rst(rst),
    .data_in(data_in),

    // out
    .data_out(data_out)

);

// 50MHz clk (T=20ns)
always begin

    clk_50 = 1;
    #10ns;
    clk_50 = 0;
    #10ns;

end

// testing
initial begin

    // rst
    rst = 1;
    data_in = 32'b10101010101010101010101010101010;
    #1us;

    rst = 0;

    #500us;       // account for possible reset code initially
    #921600ns;   //24*(400ns+800ns)*32LEDs

    #1000us;    // test eot condition

    // data change
    data_in = 32'b11110010101010101010101010101010;
    #500us;    
    #921600ns;

    #1000us;    // test eot condition


    $stop;



end



endmodule