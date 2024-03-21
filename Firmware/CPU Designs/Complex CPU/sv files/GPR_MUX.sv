module GPR_MUX (

    output logic [31:0] data_out,

    input logic [31:0] rA,rB,rC,rD,rE,rF,rG,rH,rI,rJ,rK,rL,rM,
    input logic [3:0] sel
    
);

always_comb begin

    case(sel)

    4'd0 : begin
        data_out = rA;
        
    end

    4'd1 : begin
        data_out = rB;
        
    end

    4'd2 : begin
        data_out = rC;
        
    end

    4'd3 : begin
        data_out = rD;
        
    end

    4'd4 : begin
        data_out = rE;
        
    end

    4'd5 : begin
        data_out = rF;
        
    end

    4'd6 : begin
        data_out = rG;
        
    end

    4'd7 : begin
        data_out = rH;
        
    end

    4'd8 : begin
        data_out = rI;
        
    end

    4'd9 : begin
        data_out = rJ;
        
    end

    4'd10 : begin
        data_out = rK;
        
    end

    4'd11 : begin
        data_out = rL;
        
    end
    
    4'd12 : begin
        data_out = rM;
        
    end
    

    default : begin
        data_out = 'd0;
    end

    endcase

end



endmodule