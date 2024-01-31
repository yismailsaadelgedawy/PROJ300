module sprite_ROM_square_tb;

// internal signals

// inputs
logic[9:0] row;
logic[9:0] column;

// outputs
logic[11:0] q;

// wiring
sprite_ROM_square dut(

    // inputs
    .row(row),
    .column(column),

    // outputs
    .q(q)
);



initial begin

    {row,column} = {10'd0,10'd0};

    #10ns;
    assert (q == 12'h000) $display("passed 1"); else $error("failed 1");


    {row,column} = {10'd700,10'd500};

    #10ns;
    assert (q == 12'h000) $display("passed 2"); else $error("failed 2");


    {row,column} = {10'd100,10'd100};

    #10ns;
    assert (q == 12'hF00) $display("passed red"); else $error("failed red");

    {row,column} = {10'd100,10'd101};

    #10ns;
    assert (q == 12'h0F0) $display("passed green"); else $error("failed green");

    {row,column} = {10'd101,10'd100};

    #10ns;
    assert (q == 12'h0F0) $display("passed green"); else $error("failed green");

    {row,column} = {10'd101,10'd101};

    #10ns;
    assert (q == 12'hF00) $display("passed red"); else $error("failed red");

    $stop;




end


endmodule