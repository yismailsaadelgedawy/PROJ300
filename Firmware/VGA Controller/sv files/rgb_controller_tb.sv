module rgb_controller_tb;

// internal signals

// inputs
logic clk;
logic rst;
logic en;
logic[9:0] row;
logic[9:0] column;

// outputs
logic[3:0] r;
logic[3:0] g;
logic[3:0] b;


// wiring
rgb_controller dut (

    // inputs
    .clk(clk),
    .rst(rst),
    .en(en),
    .row(row),
    .column(column),

    // outputs
    .r(r),
    .g(g),
    .b(b)

);


// 25MHz clock
// time period is 40ns
always begin

    clk = 1;
    #20ns;
    clk = 0;
    #20ns;

end


initial begin

    rst = 1;
    en = 1; // active region
    row = 10'd200;  // max 479
    column = 10'd300;  // max 639

    #35ns;
    assert (r == 0) $display("passed reset condition"); else $error("failed reset condition");
    assert (g == 0) $display("passed reset condition"); else $error("failed reset condition");
    assert (b == 0) $display("passed reset condition"); else $error("failed reset condition");
    #5ns;

    rst = 0;

    #35ns;
    assert (r == 4'hF) $display("passed red fully on"); else $error("failed red fully on");
    assert (g == 4'h0) $display("passed green off"); else $error("failed green off");
    assert (b == 4'h0) $display("passed blue off"); else $error("failed blue off");
    #5ns;

    en = 0;

    #35ns;
    assert (r == 4'h0) $display("passed red fully on"); else $error("failed red fully on");
    assert (g == 4'h0) $display("passed green off"); else $error("failed green off");
    assert (b == 4'h0) $display("passed blue off"); else $error("failed blue off");
    #5ns;

    #80ns;


    $stop;


end





endmodule