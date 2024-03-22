module M_addr_checker (

    output logic [1:0] sel,
    output logic load_mmr, load_stack,

    input logic [11:0] addr,
    input logic MEMLOAD

);

// to be connected to a demux

typedef enum logic [1:0] {instructions=0,mmr,stack} state_t;

state_t state;



always_comb begin

    // Instructions
    if (addr >= 12'h000 && addr <= 12'h400) begin
        sel = 'd0;
        {load_mmr,load_stack} = 2'b00;
        state = instructions;
    end

    // Memory mapped registers
    else if (addr >= 12'h401 && addr <= 12'h44B) begin
        sel = 'd1;
        {load_mmr,load_stack} = {MEMLOAD,1'b0};
        state = mmr;
    end

    // Stack memory
    else if (addr >= 12'h44C && addr <= 12'hFFF) begin
        sel = 'd2;
        {load_mmr,load_stack} = {1'b0,MEMLOAD};
        state = stack;
    end


end



endmodule