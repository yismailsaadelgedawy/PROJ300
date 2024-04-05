module M_DEMUX_tb;

// internal wires

// in
logic [1:0] sel;
logic [11:0] addr;

// out
logic [11:0] instruction,mmr,stack;

// inst and wiring
M_DEMUX dut (

    // in
    .sel(sel),
    .addr(addr),

    // out
    .instruction(instruction),
    .mmr(mmr),
    .stack(stack)
    
);

// loop var
int unsigned i;

// testing
initial begin

    addr = 33'd501;
    
    for(i=0; i<2**2; i=i+1) begin

        sel = i[3:0];   // relevant bit extraction
        #10ns;

        if(sel == 'd0) begin
            assert (instruction == addr && mmr == 'd0 && stack == 'd0) $display("passed 1"); else $error("failed 1"); 
        end

        if(sel == 'd1) begin
            assert (instruction == 'd0 && mmr == addr && stack == 'd0) $display("passed 2"); else $error("failed 2"); 
        end

        if(sel == 'd2) begin
            assert (instruction == 'd0 && mmr == 'd0 && stack == addr) $display("passed 3"); else $error("failed 3"); 
        end

        if(sel == 'd3) begin
            assert (instruction == 'd0 && mmr == 'd0 && stack == 'd0) $display("passed 4"); else $error("failed 4"); 
        end        

    end
  
  
end

endmodule
