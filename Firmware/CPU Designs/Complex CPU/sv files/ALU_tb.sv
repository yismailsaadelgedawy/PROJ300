module ALU_tb;

// parameters
parameter N=32;

// internal wires

// in
logic [2:0] ALUSEL;
logic [N-1:0] op1, op2;


// out
logic [N-1:0] q;

// wiring
ALU dut (

    // in
    .ALUSEL(ALUSEL),
    .op1(op1),
    .op2(op2),

    // out
    .q(q)

);


// testing
initial begin

    // ADD
    ALUSEL = 'd0;
    op1 = 'd30;     // 11110
    op2 = 'd20;     // 10100
    #10ns;

    assert (q == 'd50) $display("passed ADD"); else $error("failed ADD");

    // SUB
    ALUSEL = 'd1;
    #10ns;

    assert (q == 'd10) $display("passed SUB"); else $error("failed SUB");

    // MUL
    ALUSEL = 'd2;
    #10ns;

    assert (q == 'd600) $display("passed MUL"); else $error("failed MUL");

    // DIV
    op2 = 'd1;
    ALUSEL = 'd3;
    #10ns;

    assert (q == 'd15) $display("passed DIV"); else $error("failed DIV");

    // AND
    op2 = 'd20;
    ALUSEL = 'd4;
    #10ns;

    assert (q == 'b10100) $display("passed AND"); else $error("failed AND");

    // OR
    ALUSEL = 'd5;
    #10ns;

    assert (q == 'b11110) $display("passed OR"); else $error("failed OR");

    // NOT
    op1 = (2**N) - 1;
    ALUSEL = 'd6;
    #10ns;

    assert (q == 'd0) $display("passed NOT"); else $error("failed NOT");

    // DEFAULT
    op1 = 'd30;
    ALUSEL = 'd7;
    #10ns;

    assert (q == 'd50) $display("passed DEFAULT"); else $error("failed DEFAULT");


end


endmodule