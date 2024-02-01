module hsync_cnt_tb;

// internal signals

// inputs
logic clk;
logic rst;


// outputs
logic hsync;
logic rgb_en;
logic[10:0] column;


// wiring
hsync_cnt dut (

    // inputs
    .clk(clk),
    .rst(rst),

    // outputs
    .hsync(hsync),
    .rgb_en(rgb_en),
    .column(column)


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
    
    #35ns;
    assert (column == 11'd0) $display("passed reset condition"); else $error("failed reset condition");
    assert (hsync == 1) $display("passed reset condition"); else $error("failed reset condition");
    assert (rgb_en == 1) $display("passed reset condition"); else $error("failed reset condition");
    #5ns;

    rst = 0;

    #40000ns; // counts 1000 times (1000*40ns = 40000ns)



    $stop;

end




endmodule