module pixel_offset_controller_tb;

// internal signals

//inputs
logic clk;
logic rst;
logic [3:0] key;
logic [9+1:0] pixel1_row_pos;
logic [9+1:0] pixel2_row_pos;
logic [9+1:0] pixel3_column_pos;
logic [9+1:0] pixel4_column_pos;


// outputs
logic [9+1:0] row_offset;
logic [9+1:0] column_offset;


// wiring
pixel_offset_controller dut(

    // in
    .clk(clk),
    .rst(rst),
    .key(key),
    .pixel1_row_pos(pixel1_row_pos),
    .pixel2_row_pos(pixel2_row_pos),
    .pixel3_column_pos(pixel3_column_pos),
    .pixel4_column_pos(pixel4_column_pos),

    // out
    .row_offset(row_offset),
    .column_offset(column_offset)


);


// clock

// input will be an 18-bit clock div
// so clk = 190.7Hz = 5.24ms
// this will allow a pixel to cross from column 0 to column 639
// in 640/190.7 = 3.36s
always begin

    clk = 1;
    #2.62ms;
    clk = 0;
    #2.62ms;

end


// testing
initial begin

    rst = 1;
    key = 4'b0000;
    pixel1_row_pos = 'd0;
    pixel2_row_pos = 'd0;
    pixel3_column_pos = 'd0;
    pixel4_column_pos = 'd0;

    #3ms;
    assert({row_offset,column_offset} == {11'd0,11'd0}) $display("passed reset"); else $error("failed reset");
    #2.24ms;

    rst = 0;

    #3ms;
    assert({row_offset,column_offset} == {11'd0,11'd0}) $display("passed 1"); else $error("failed 1");
    #2.24ms;

    key = 4'b1000;

    #3ms;
    assert({row_offset,column_offset} == {-11'sd1,11'd0}) $display("passed 2"); else $error("failed 2");
    #2.24ms;

    key = 4'b0100;

    #3ms;
    assert({row_offset,column_offset} == {11'd0,11'd0}) $display("passed 3"); else $error("failed 3");
    #2.24ms;


    key = 4'b0010;

    #3ms;
    assert({row_offset,column_offset} == {11'd0,-11'sd1}) $display("passed 4"); else $error("failed 4");
    #2.24ms;


    key = 4'b0001;

    #3ms;
    assert({row_offset,column_offset} == {11'd0,11'd0}) $display("passed 5"); else $error("failed 5");
    #2.24ms;

    // testing single button inputs

    key = 4'b1000;
    #52.4ms; // 10 cycles

    key = 4'b0100;
    #78.6ms; // 15 cycles


    key = 4'b0010;
    #52.4ms; // 10 cycles

    key = 4'b0001;
    #78.6ms; // 15 cycles


    // testing multipe button inputs

    key = 4'b1010;
    #52.4ms; // 10 cycles

    


    $stop;




end

endmodule