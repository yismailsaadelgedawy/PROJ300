module M_addr_checker_tb;

// internal wires

// in
logic [11:0] addr;
logic MEMLOAD;

// out
logic [1:0] sel;
logic load_mmr, load_stack;

// inst and wiring
M_addr_checker dut (

    // in
    .addr(addr),
    .MEMLOAD(MEMLOAD),

    // out
    .sel(sel),
    .load_mmr(load_mmr),
    .load_stack(load_stack)

);

// loop var
int unsigned i;

// testing
initial begin

    MEMLOAD = 1;

    for(i=0;i<(2**12)-1;i++) begin
        addr = i[11:0];
        #10ns;

        // Instructions
        if (addr >= 12'h000 && addr <= 12'h400) begin
            assert(sel == 'd0 || {load_mmr,load_stack} == {1'b0,1'b0}) $display("passed instructions %d",i);
        end

        // Memory mapped registers
        else if (addr >= 12'h401 && addr <= 12'h44B) begin
            assert(sel == 'd1 || {load_mmr,load_stack} == {MEMLOAD,1'b0}) $display("passed mmr %d",i);
        end

        // Stack memory
        else if (addr >= 12'h44C && addr <= 12'hFFF) begin
            assert(sel == 'd2 || {load_mmr,load_stack} == {1'b0,MEMLOAD}) $display("passed stack %d",i);
        end


    end

end



endmodule