module SN74LS74 (

    output logic q, n_q,

    input logic d,
    input logic PRE, CLR, clk


);

// (dual) D-type flip-flop


always_ff @(posedge clk or negedge PRE or negedge CLR) begin

    casez({PRE,CLR})

    2'b01 : {q,n_q} <= 2'b10;

    2'b10 : {q,n_q} <= 2'b01;

    2'b00 : {q,n_q} <= 2'b11;

    2'b11 : begin

        q <= d;
        n_q <= ~d;

    end 


    endcase



end




endmodule