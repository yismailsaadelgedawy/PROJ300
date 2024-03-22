module M_MUX (

    output logic [37:0] data,

    input logic [37:0] instruction,
    input logic [31:0] mmr,stack,
    input logic [1:0] sel  
    
    
);

always_comb begin

    case(sel)

    // each case must address ALL outputs to infer purely comb logic
    // otherwise - latch!
    2'd0 : begin
        data = instruction;
    end

    2'd1 : begin
        data = {6'd0,mmr};  // clears remaining top bits to be safe
    end

    2'd2 : begin
        data = {6'd0,stack};
    end

    default : begin
        data = 'd0;
    end

    

    endcase


end


endmodule