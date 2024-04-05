module mux12 (

    output logic [11:0] q,

    input logic [11:0] a,b,
    input logic sel
);

assign q = (!sel) ? a : b;


endmodule