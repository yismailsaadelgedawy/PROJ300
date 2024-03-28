module FPGA_LED_PSSR_tb;

// internal wires

// in
logic clk,rst,load;
logic [31:0] rA,rB;
logic sel;


// out
logic data_out;


// inst and wiring
FPGA_LED_PSSR dut (

    // in
    .clk(clk),
    .rst(rst),
    .load(load),
    .rA(rA),
    .rB(rB),
    .sel(sel),

    // out
    .data_out(data_out)


);


// clock
always begin

    clk <= 1;
    #5ns;
    clk <= 0;
    #5ns;

end


// testing
initial begin

    // rst
    rst = 1;
    load = 1;
    rA = 32'b1011;
    rB = 32'b1001;
    sel = 0;
    #50ns;

    rst = 0;

    // load data
    //load = 1;             -- already high!!!
    #10ns;
    load = 0;

    #320ns;
    
    sel = 1;

    #320ns;

    $stop;


end



endmodule