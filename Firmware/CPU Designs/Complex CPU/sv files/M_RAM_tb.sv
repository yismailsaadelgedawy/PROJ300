module M_RAM_tb;

// params
parameter ADDR_WIDTH=12, DATA_WIDTH=32;

// internal wires

// in
logic [DATA_WIDTH-1:0] data_in;
logic [ADDR_WIDTH-1:0] address;
logic load;

// out
logic [DATA_WIDTH-1:0] data_out;

// inst and wiring
M_RAM dut (
    
    // in
    .data_in(data_in),
    .address(address),
    .load(load),

    // out
    .data_out(data_out)

);

// loop var
int unsigned i;


// testing
initial begin
    data_in = 32'd200;
    load = 0;

    $display("load disabled \n");
    for(i=0;i<(2**ADDR_WIDTH)-1;i++) begin
        address = i;
        #10ns;
        assert(data_out == 'd0) $display("passed address %d",i); else $error("failed address %d",i);
    end

    $display("load enabled \n");
    for(i=0;i<(2**ADDR_WIDTH)-1;i++) begin
        load = 1;
        address = i;
        #10ns;
        assert(data_out == data_in) $display("passed address %d",i); else $error("failed address %d",i);
        load = 0;
        #10ns;
    end



end



endmodule