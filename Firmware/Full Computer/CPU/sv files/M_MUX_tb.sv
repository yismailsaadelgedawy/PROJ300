module M_MUX_tb;

// internal wires

// in
logic [37:0] instruction;
logic [31:0] mmr,stack;
logic [1:0] sel;


// out
logic [37:0] data;

// inst and wiring
M_MUX dut (

    // in
    .instruction(instruction),
    .mmr(mmr),
    .stack(stack),
    .sel(sel),

    // out
    .data(data)

);

// loop var
int unsigned i;

// testing
initial begin

    
    instruction = 38'd2**38-1;
    mmr = 32'd2**32-1;
    stack = 32'd200;

    
    for(i=0; i<2**2; i=i+1) begin

        sel = i[3:0];   // relevant bit extraction
        #10ns;

        if(sel == 'd0) begin
            assert (data == instruction) $display("passed 1"); else $error("failed 1"); 
        end

        if(sel == 'd1) begin
            assert (data == mmr) $display("passed 2"); else $error("failed 2"); 
        end

        if(sel == 'd2) begin
            assert (data == stack) $display("passed 3"); else $error("failed 3"); 
        end

        if(sel == 'd3) begin
            assert (data == 'd0) $display("passed 4"); else $error("failed 4"); 
        end

        

    end

end

endmodule
