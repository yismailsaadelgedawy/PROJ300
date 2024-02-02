module sprite_ROM_square_tb;


// internal signals

// inputs
logic [9+1:0] row;
logic [9+1:0] column;
logic [9+1:0] row_offset;
logic [9+1:0] column_offset;

// outputs
logic[11:0] q;

// wiring
sprite_ROM_square dut(

    // inputs
    .row(row),
    .column(column),
    .row_offset(row_offset),
    .column_offset(column_offset),

    // outputs
    .q(q)
);



initial begin

    row_offset = -11'sd50;
    column_offset = 11'sd50;

    {row,column} = {11'sd0,11'sd0};

    #10ns;
    assert (q == 12'h000) $display("passed 1"); else $error("failed 1");


    {row,column} = {11'sd700,11'sd500};

    #10ns;
    assert (q == 12'h000) $display("passed 2"); else $error("failed 2");


    {row,column} = {11'sd100,11'sd100};

    #10ns;
    assert (q == 12'hF00) $display("passed red"); else $error("failed red");

    {row,column} = {11'sd100,11'sd101};

    #10ns;
    assert (q == 12'h0F0) $display("passed green"); else $error("failed green");

    {row,column} = {11'sd101,11'sd100};

    #10ns;
    assert (q == 12'h0F0) $display("passed green"); else $error("failed green");

    {row,column} = {11'sd101,11'sd101};

    #10ns;
    assert (q == 12'hF00) $display("passed red"); else $error("failed red");


    // testing offsets

    {row,column} = {11'sd100 + row_offset, 11'sd100 + column_offset};

    #10ns;
    assert (q == 12'hF00) $display("passed red"); else $error("failed red");

    {row,column} = {11'sd100 + row_offset, 11'sd101 + column_offset};

    #10ns;
    assert (q == 12'h0F0) $display("passed green"); else $error("failed green");

    {row,column} = {11'sd101 + row_offset, 11'sd100 + column_offset};

    #10ns;
    assert (q == 12'h0F0) $display("passed green"); else $error("failed green");

    {row,column} = {11'sd101 + row_offset, 11'sd101 + column_offset};

    #10ns;
    assert (q == 12'hF00) $display("passed red"); else $error("failed red");

    $stop;




end


endmodule