module M_DEMUX (

    output logic [11:0] instruction,mmr,stack,  // packed arrays causes problems when wiring :(

    input logic [11:0] addr,
    input logic [1:0] sel
    
);

always_comb begin

    case(sel)

    // each case must address ALL outputs to infer purely comb logic
    // otherwise - latch!
    2'd0 : begin
        instruction = addr;
        {mmr,stack} = 'd0;
    end

    2'd1 : begin
        mmr = addr;
        {instruction,stack} = 'd0;
    end

    2'd2 : begin
        stack = addr;
        {instruction,mmr} = 'd0;
    end

    default : begin
        {instruction,mmr,stack} = 'd0;
    end

    

    endcase


end


endmodule