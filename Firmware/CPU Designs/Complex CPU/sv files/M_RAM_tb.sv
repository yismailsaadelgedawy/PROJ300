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
    address = 'd0;
    load = 0;
    #400ns;

    // $display("load disabled \n");
    // for(i=0;i<(2**ADDR_WIDTH)-1;i++) begin
    //     address = i;
    //     #10ns;
    //     assert(data_out == 'd0) else $error("failed address %d",i);
        
    // end

    // $display("load enabled \n");
    // for(i=0;i<(2**ADDR_WIDTH)-1;i++) begin
    //     load = 1;
    //     address = i;
    //     #10ns;
    //     assert(data_out == data_in) else $error("failed address %d",i);
    //     load = 0;
    //     #10ns;
    //     data_in++;
    // end

    $display("\nTEST\n");

    data_in = 32'd212;
    address = 32'd0;
    load = 0;
    #10ns;
   

    data_in = 32'd300;
    address = 32'd1100;
    load = 1;
    #10ns;
    assert(data_out == data_in) else $error("failed address final test");



end



endmodule