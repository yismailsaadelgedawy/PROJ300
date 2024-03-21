module GPR_conc (

    output logic [32:0] data_out,

    input logic [31:0] data_in,
    input logic GPRLOAD
);

// a simple concatenator
// to be connected to "GPR_selector"

assign data_out = {data_in,GPRLOAD};



endmodule