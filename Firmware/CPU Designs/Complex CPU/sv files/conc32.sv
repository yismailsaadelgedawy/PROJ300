module conc32 (

    output logic [32:0] data_out,

    input logic [31:0] data_in,
    input logic LOAD
);

// a simple concatenator
// to be connected to selectors

assign data_out = {data_in,LOAD};



endmodule