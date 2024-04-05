module GPR_DEMUX_tb;

// internal wires

// in
logic [3:0] sel;
logic [32:0] data_in;

// out
logic [32:0] rA, rB, rC, rD, rE, rF, rG, rH, rI, rJ, rK, rL, rM;

// inst and wiring
GPR_DEMUX dut (

    // in
    .sel(sel),
    .data_in(data_in),

    // out
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
    .rM(rM)

);

// loop var
int unsigned i;

// testing
initial begin

    data_in = 33'd501;
    
    for(i=0; i<2**4; i=i+1) begin

        sel = i[3:0];   // relevant bit extraction
        #10ns;        

    end

    data_in = 33'd502;
    
    for(i=0; i<2**4; i=i+1) begin

        sel = i[3:0];   // relevant bit extraction
        #10ns;        

    end
  
end

endmodule
