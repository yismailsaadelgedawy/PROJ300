module ALU_tb;

// parameters
parameter N=8;

// internal wires

// in
logic ALUSEL;
logic [N-1:0] AC, AR;


// out
logic [N-1:0] q;

// wiring
ALU dut (

    // in
    .ALUSEL(ALUSEL),
    .AC(AC),
    .AR(AR),

    // out
    .q(q)

);


// testing
initial begin

    // ADD
    ALUSEL = 0;
    AC = 8'd20;
    AR = 8'd30;
    
    #10ns;

    assert (q == 'd50) $display("passed ADD"); else $error("failed ADD");

    // AND
    ALUSEL = 1;

    #10ns;

    assert (q == 'b00010100) $display("passed AND"); else $error("failed AND");


end


endmodule