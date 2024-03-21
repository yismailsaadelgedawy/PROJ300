module GPR_MUX_tb;

// internal wires

// in
logic [3:0] sel;
logic [31:0] rA, rB, rC, rD, rE, rF, rG, rH, rI, rJ, rK, rL, rM;


// out
logic [31:0] data_out;

// inst and wiring
GPR_MUX dut (

    // in
    .sel(sel),
    .rA(rA),
    .rB(rB),
    .rC(rC),
    .rD(rD),
    .rE(rE),
    .rF(rF),
    .rG(rG),
    .rH(rH),
    .rI(rI),
    .rJ(rJ),
    .rK(rK),
    .rL(rL),
    .rM(rM),

    // out
    .data_out(data_out)

);

// loop var
int unsigned i;

// testing
initial begin

    sel = 'd0;
    rA = 'd1;
    rB = 'd2;
    rC = 'd3;
    rD = 'd4;
    rE = 'd5;
    rF = 'd6;
    rG = 'd7;
    rH = 'd8;
    rI = 'd9;
    rJ = 'd10;
    rK = 'd11;
    rL = 'd12;
    rM = 'd13;  
    
    for(i=0; i<2**4; i=i+1) begin

        sel = i[3:0];   // relevant bit extraction
        #10ns;

    end

end

endmodule
