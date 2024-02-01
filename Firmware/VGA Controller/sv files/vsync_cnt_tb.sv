`timescale 1ns/1ns
module vsync_cnt_tb;

// internal signals (in desired order of appearance)

// inputs 
logic clk;
logic rst;
logic[10:0] column;

// outputs
logic vsync;
logic rgb_en;
logic[10:0] row;


// wiring
vsync_cnt dut (

    // inputs
    .clk(clk),
    .rst(rst),
    .column(column),

    // outputs
    .vsync(vsync),
    .rgb_en(rgb_en),
    .row(row)

);


// 25MHz clock
// time period is 40ns
always begin

    clk = 1;
    #20ns;
    clk = 0;
    #20ns;

end


// testing
initial begin

    rst = 1;
    column = 11'd800;
    
    #35ns;
    assert (row == 11'd0) $display("passed reset condition"); else $error("failed reset condition");
    assert (vsync == 1) $display("passed reset condition"); else $error("failed reset condition");
    assert (rgb_en == 1) $display("passed reset condition"); else $error("failed reset condition");
    #5ns;

    rst = 0;

    #40000ns; // counts 650 times (650*40ns = 26000ns)



    $stop;

end





endmodule