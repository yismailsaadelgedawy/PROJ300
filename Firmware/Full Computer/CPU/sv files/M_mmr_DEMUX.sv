module M_mmr_DEMUX (

    output logic [32:0] mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM,  // packed arrays causes problems when wiring :(

    input logic [32:0] data_in,
    input logic [3:0] sel
    
);

// repurposed GPR_DEMUX code

always_comb begin

    case(sel)

    // each case must address ALL outputs to infer purely comb logic
    // otherwise - latch!
    4'd0 : begin
        mmrA = data_in;
        {mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd1 : begin
        mmrB = data_in;
        {mmrA,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd2 : begin
        mmrC = data_in;
        {mmrA,mmrB,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd3 : begin
        mmrD = data_in;
        {mmrA,mmrB,mmrC,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd4 : begin
        mmrE = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd5 : begin
        mmrF = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd6 : begin
        mmrG = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd7 : begin
        mmrH = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd8 : begin
        mmrI = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd9 : begin
        mmrJ = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrK,mmrL,mmrM} = 'd0;
    end

    4'd10 : begin
        mmrK = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrL,mmrM} = 'd0;
    end

    4'd11 : begin
        mmrL = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrM} = 'd0;
    end
    
    4'd12 : begin
        mmrM = data_in;
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL} = 'd0;
    end
    

    default : begin
        {mmrA,mmrB,mmrC,mmrD,mmrE,mmrF,mmrG,mmrH,mmrI,mmrJ,mmrK,mmrL,mmrM} = 'd0;
    end

    endcase
    
end



endmodule