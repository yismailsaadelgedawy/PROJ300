module CU_counter_tb;

// parameters
parameter opcode_bits=4, N=6;

// internal wires

// in
logic clk, rst, clr;
logic load, inc;
logic [1:0] sel_bits;
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
    .sel_bits(sel_bits),
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
    sel_bits = 2'b00;
    opcode = 'd0; // nop

    #7ns;
    assert (q == 'd0) $display("passed reset (FETCH1)"); else $error("failed clear (FETCH1)");
    #3ns;


    // clr state
    rst = 0;
    clr = 1;
    load = 0;
    inc = 0;
    sel_bits = 2'b00;
    opcode = 'd0; // nop

    #7ns;
    assert (q == 'd0) $display("passed clear (FETCH1)"); else $error("failed clear (FETCH1)");
    #3ns;

    
    // loading opcodes
    clr = 0;
    load = 1;

    opcode = 'd0;   // nop

    #7ns;
    assert (q == 'd3) $display("passed nop1"); else $error("failed nop1");
    #3ns;

    opcode = 'd1;   // mov

    #7ns;
    assert (q == 'd4) $display("passed mov1"); else $error("failed mov1");
    #3ns;

    sel_bits = 2'b01;

    #7ns;
    assert (q == 'd5) $display("passed mov1"); else $error("failed mov1");
    #3ns;

    opcode = 'd2;   // ldr
    sel_bits = 2'b00;

    #7ns;
    assert (q == 'd7) $display("passed ldr1"); else $error("failed ldr1");
    #3ns;

    sel_bits = 2'b01; // ALTldr

    #7ns;
    assert (q == 'd9) $display("passed ALTldr1"); else $error("failed ALTldr1");
    #3ns;

    opcode = 'd3;
    sel_bits = 2'b00;

    #7ns;
    assert (q == 'd13) $display("passed str1"); else $error("failed str1");
    #3ns;

    sel_bits = 2'b01;

    #7ns;
    assert (q == 'd17) $display("passed ALTstr1"); else $error("failed ALTstr1");
    #3ns;

    sel_bits = 2'b00;

    opcode = 'd4;

    #7ns;
    assert (q == 'd21) $display("passed cmp1"); else $error("failed cmp1");
    #3ns;

    opcode = 'd5;

    #7ns;
    assert (q == 'd22) $display("passed b1"); else $error("failed b1");
    #3ns;

    opcode = 'd6;

    #7ns;
    assert (q == 'd23) $display("passed bgt1"); else $error("failed bgt1");
    #3ns;

    opcode = 'd7;

    #7ns;
    assert (q == 'd24) $display("passed blt1"); else $error("failed blt1");
    #3ns;

    opcode = 'd8;

    #7ns;
    assert (q == 'd25) $display("passed beq1"); else $error("failed beq1");
    #3ns;

    opcode = 'd9;

    #7ns;
    assert (q == 'd26) $display("passed add1"); else $error("failed add1");
    #3ns;

    opcode = 'd10;

    #7ns;
    assert (q == 'd28) $display("passed sub1"); else $error("failed sub1");
    #3ns;

    opcode = 'd11;

    #7ns;
    assert (q == 'd30) $display("passed mul1"); else $error("failed mul1");
    #3ns;

    opcode = 'd12;

    #7ns;
    assert (q == 'd32) $display("passed lsr1"); else $error("failed lsr1");
    #3ns;

    opcode = 'd13;

    #7ns;
    assert (q == 'd34) $display("passed and1"); else $error("failed and1");
    #3ns;

    opcode = 'd14;

    #7ns;
    assert (q == 'd36) $display("passed or1"); else $error("failed or1");
    #3ns;

    opcode = 'd15;

    #7ns;
    assert (q == 'd38) $display("passed mvn1"); else $error("failed mvn1");
    #3ns;

    // latching conditions
    load = 0; inc = 0;

    #7ns;
    assert (q == 'd38) $display("passed latching 1"); else $error("failed latching 1");
    #3ns;

    load = 1; inc = 1;

    #7ns;
    assert (q == 'd38) $display("passed latching 2"); else $error("failed latching 2");
    #3ns;



    $stop;

end



endmodule