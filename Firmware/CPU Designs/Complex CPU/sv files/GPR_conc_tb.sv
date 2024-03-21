module GPR_conc_tb;

// internal signals

// in
logic [31:0] data_in;
logic GPRLOAD;

// out
logic [32:0] data_out;

// inst and wiring
GPR_conc dut (

    // in
    .data_in(data_in),
    .GPRLOAD(GPRLOAD),

    // out
    .data_out(data_out)

);

// testing
initial begin

    data_in = 32'd255;
    GPRLOAD = 0;
    #10ns;

    assert (data_out == {data_in,GPRLOAD}) $display("passed 1"); else $error("failed 1");

    data_in = 32'd255;
    GPRLOAD = 1;
    #10ns;

    assert (data_out == {data_in,GPRLOAD}) $display("passed 2"); else $error("failed 2");


end



endmodule