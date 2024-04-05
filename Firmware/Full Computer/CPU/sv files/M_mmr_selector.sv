module M_mmr_selector (

    output logic [6:0] sel, // 7 bits to accomodate from 0 to 74 (128 max)

    input logic [11:0] addr

);

// to be connected to demux-mux pair
// chooses one of the 75 MMRs
// ref to "Memory Map.txt" for info

assign sel = addr-12'd1025;


endmodule