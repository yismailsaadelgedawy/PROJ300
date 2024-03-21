module operand_MUX_tb;

// internal wires

// in
logic sel;
logic [11:0] rop;
logic [31:0] GPR;


// out
logic [31:0] data_out;

// inst and wiring
operand_MUX dut (

    // in
    .sel(sel),
    .rop(rop),
    .GPR(GPR),

    // out
    .data_out(data_out)

);

// loop var
int unsigned i;

// testing
initial begin

    sel = 0;
    rop = 12'd4095;
    GPR = 32'd2**32-1;
    #10ns;

    assert (data_out == rop) $display("passed 1"); else $error("failed 1");

    sel = 1;
    #10ns;

    assert (data_out == GPR) $display("passed 2"); else $error("failed 2");

    sel = 0;
    #10ns;

    assert (data_out == rop) $display("passed 3"); else $error("failed 3");

end

endmodule
