module CU_counter_tb;

// parameters
parameter opcode_bits=2, N=4;

// internal wires

// in
logic clk, rst, clr;
logic load, inc;
logic [opcode_bits-1:0] opcode;


// out
logic [N-1:0] q;


// wiring
CU_counter dut (

    // in
    .clk(clk),
    .rst(rst),
    .clr(clr),
    .load(load),
    .inc(inc),
    .opcode(opcode),

    // out
    .q(q)


);


// clock
always begin

    clk <= 1;
    #5ns;
    clk <= 0;
    #5ns;

end

// testing
initial begin

    // reset state
    rst = 1;
    clr = 0;
    load = 0;
    inc = 0;
    opcode = 'b00; // INC instruction

    #7ns;
    assert (q == 'd0) $display("passed clear (FETCH1)"); else $error("failed clear (FETCH1)");
    #3ns;


    // clr state
    rst = 0;
    clr = 1;
    load = 0;
    inc = 0;
    opcode = 'b00; // INC instruction

    #7ns;
    assert (q == 'd0) $display("passed clear (FETCH1)"); else $error("failed clear (FETCH1)");
    #3ns;


    // latching -- 00
    clr = 0;
    
    #7ns;
    assert (q == 'd0) $display("passed latching 1"); else $error("failed latching 1");
    #3ns;


    // loading opcodes
    load = 1;
    opcode = 'b00;

    #7ns;
    assert (q == 'd3) $display("passed AND1"); else $error("failed AND1");
    #3ns;

    load = 1;
    opcode = 'b01;

    #7ns;
    assert (q == 'd5) $display("passed ADD1"); else $error("failed ADD1");
    #3ns;


    load = 1;
    opcode = 'b10;

    #7ns;
    assert (q == 'd7) $display("passed JMP1"); else $error("failed JMP1");
    #3ns;

    load = 1;
    opcode = 'b11;

    #7ns;
    assert (q == 'd8) $display("passed INC1"); else $error("failed INC1");
    #3ns;


    // increments
    load = 0;
    inc = 1;

    #7ns;
    assert (q == 'd9) $display("passed increment 1"); else $error("failed increment 1");
    #3ns;

    #7ns;
    assert (q == 'd10) $display("passed increment 2"); else $error("failed increment 2");
    #3ns;


    // latching -- 11
    load = 1;

    #7ns;
    assert (q == 'd10) $display("passed latching 2"); else $error("failed latching 2");
    #3ns;


    // back to clear (FETCH1)
    inc = 0;
    clr = 1;

    #7ns;
    assert (q == 'd0) $display("passed clear (FETCH1)"); else $error("failed clear (FETCH1)");
    #3ns;


    $stop;

end



endmodule