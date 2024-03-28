module demux1x32_tb;

// internal wires

// in
logic	in;
logic	[4:0] A;


// out
logic	[7:0] bankA;
logic	[7:0] bankB;
logic	[7:0] bankC;
logic	[7:0] bankD;


// inst and wiring
demux1x32 dut (

    // in
    .in(in),
    .A(A),

    // out
    .bankA(bankA),
    .bankB(bankB),
    .bankC(bankC),
    .bankD(bankD)


);

// loop var
int unsigned i;


// testing
initial begin

    in = 1;

    for(i=0;i<2**5;i++) begin

        A = i[4:0]; // relevant bit extraction
        #10ns;

    end
    

end


endmodule