module M_RAM #(parameter ADDR_WIDTH=12, DATA_WIDTH=32) (

    output logic [DATA_WIDTH-1:0] data_out,

    input logic [DATA_WIDTH-1:0] data_in,
    input logic [ADDR_WIDTH-1:0] address,
    input logic load

);


// asyncrhonous BRAM module
// "bit" data type is bi-state (0 or 1) where z and x = 0
// "logic" is quad-state (0,1,z,x)
bit [DATA_WIDTH-1:0] RAM [0:(2**ADDR_WIDTH)-1];

assign data_out = RAM[address];


// always_ff causes a weird bug when this is wired with everything else
// no idea why...
always_latch begin
    if(load) RAM[address] <= data_in;
    
end


endmodule