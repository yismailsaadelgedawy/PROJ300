module M_mmr_MUX (

    output logic [31:0] data_out,

    input logic [31:0] mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM,
    input logic [3:0] sel
    
);

// repurposed GPR_MUX code

always_comb begin

    case(sel)

    4'd0 : begin
        data_out = mmrA;
        
    end

    4'd1 : begin
        data_out = mmrB;
        
    end

    4'd2 : begin
        data_out = mmrC;
        
    end

    4'd3 : begin
        data_out = mmrD;
        
    end

    4'd4 : begin
        data_out = mmrE;
        
    end

    4'd5 : begin
        data_out = mmrF;
        
    end

    4'd6 : begin
        data_out = mmrG;
        
    end

    4'd7 : begin
        data_out = mmrH;
        
    end

    4'd8 : begin
        data_out = mmrI;
        
    end

    4'd9 : begin
        data_out = mmrJ;
        
    end

    4'd10 : begin
        data_out = mmrK;
        
    end

    4'd11 : begin
        data_out = mmrL;
        
    end
    
    4'd12 : begin
        data_out = mmrM;
        
    end
    

    default : begin
        data_out = 'd0;
    end

    endcase

end



endmodule