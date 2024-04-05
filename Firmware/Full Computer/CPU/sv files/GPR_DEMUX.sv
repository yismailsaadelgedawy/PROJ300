module GPR_DEMUX (

    output logic [32:0] rA,rB,rC,rD,rE,rF,rG,rH,rI,rJ,rK,rL,rM,  // packed arrays causes problems when wiring :(

    input logic [32:0] data_in,
    input logic [3:0] sel
    
);

always_comb begin

    case(sel)

    // each case must address ALL outputs to infer purely comb logic
    // otherwise - latch!
    4'd0 : begin
        rA = data_in;
        {rB,rC,rD,rE,rF,rG,rH,rI,rJ,rK,rL,rM} = 'd0;
    end

    4'd1 : begin
        rB = data_in;
        {rA,rC,rD,rE,rF,rG,rH,rI,rJ,rK,rL,rM} = 'd0;
    end

    4'd2 : begin
        rC = data_in;
        {rA,rB,rD,rE,rF,rG,rH,rI,rJ,rK,rL,rM} = 'd0;
    end

    4'd3 : begin
        rD = data_in;
        {rA,rB,rC,rE,rF,rG,rH,rI,rJ,rK,rL,rM} = 'd0;
    end

    4'd4 : begin
        rE = data_in;
        {rA,rB,rC,rD,rF,rG,rH,rI,rJ,rK,rL,rM} = 'd0;
    end

    4'd5 : begin
        rF = data_in;
        {rA,rB,rC,rD,rE,rG,rH,rI,rJ,rK,rL,rM} = 'd0;
    end

    4'd6 : begin
        rG = data_in;
        {rA,rB,rC,rD,rE,rF,rH,rI,rJ,rK,rL,rM} = 'd0;
    end

    4'd7 : begin
        rH = data_in;
        {rA,rB,rC,rD,rE,rF,rG,rI,rJ,rK,rL,rM} = 'd0;
    end

    4'd8 : begin
        rI = data_in;
        {rA,rB,rC,rD,rE,rF,rG,rH,rJ,rK,rL,rM} = 'd0;
    end

    4'd9 : begin
        rJ = data_in;
        {rA,rB,rC,rD,rE,rF,rG,rH,rI,rK,rL,rM} = 'd0;
    end

    4'd10 : begin
        rK = data_in;
        {rA,rB,rC,rD,rE,rF,rG,rH,rI,rJ,rL,rM} = 'd0;
    end

    4'd11 : begin
        rL = data_in;
        {rA,rB,rC,rD,rE,rF,rG,rH,rI,rJ,rK,rM} = 'd0;
    end
    
    4'd12 : begin
        rM = data_in;
        {rA,rB,rC,rD,rE,rF,rG,rH,rI,rJ,rK,rL} = 'd0;
    end
    

    default : begin
        {rA,rB,rC,rD,rE,rF,rG,rH,rI,rJ,rK,rL,rM} = 'd0;
    end

    endcase
    
end



endmodule