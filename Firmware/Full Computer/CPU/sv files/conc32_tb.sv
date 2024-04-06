module conc32_tb;

// internal signals

// in
logic [31:0] data_in;
logic LOAD;

// out
logic [32:0] data_out;

// inst and wiring
conc32 dut (

    // in
    .data_in(data_in),
    .LOAD(LOAD),

    // out
    .data_out(data_out)

);

// testing
initial begin

    data_in = 32'd255;
    LOAD = 0;
    #10ns;

    assert (data_out == {data_in,LOAD}) $display("passed 1"); else $error("failed 1");

    data_in = 32'd255;
    LOAD = 1;
    #10ns;

    assert (data_out == {data_in,LOAD}) $display("passed 2"); else $error("failed 2");


end



endmodule