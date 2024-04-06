module M_mmr_selector_tb;

// interal wires

// in
logic [11:0] addr;

// out
logic [6:0] sel;

// inst and wiring
M_mmr_selector dut (

    // in
    .addr(addr),

    // out
    .sel(sel)

);

// loop var
int unsigned i;


// testing
initial begin
    
    // boundary addresses for MMRs
    for(i=1025;i<1100;i++) begin
        addr = i;
        #10ns;

        assert(sel == addr-12'd1025) $display("passed mmr %d",(i-1025)); else $error("failed %d",(i-1025));

    end


end

endmodule