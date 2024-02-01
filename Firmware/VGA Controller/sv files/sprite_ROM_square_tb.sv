module sprite_ROM_square_tb;


// offset registers
logic signed[9+1:0] offset_row_reg = -'sd10;
logic signed[9+1:0] offset_column_reg = -'sd10;

// internal signals

// inputs
logic [9+1:0] row;
logic [9+1:0] column;

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

    {row,column} = {11'sd100 + offset_row_reg, 11'sd100 + offset_column_reg};

    #10ns;
    assert (q == 12'hF00) $display("passed red"); else $error("failed red");

    {row,column} = {11'sd100 + offset_row_reg, 11'sd101 + offset_column_reg};

    #10ns;
    assert (q == 12'h0F0) $display("passed green"); else $error("failed green");

    {row,column} = {11'sd101 + offset_row_reg, 11'sd100 + offset_column_reg};

    #10ns;
    assert (q == 12'h0F0) $display("passed green"); else $error("failed green");

    {row,column} = {11'sd101 + offset_row_reg, 11'sd101 + offset_column_reg};

    #10ns;
    assert (q == 12'hF00) $display("passed red"); else $error("failed red");

    $stop;




end


endmodule