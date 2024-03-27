module trisateN #(parameter N=8) (

    output logic [N-1:0] q,

    input logic [N-1:0] d,
    input logic OE

);

assign q = (!OE) ? d : 'dz;


endmodule