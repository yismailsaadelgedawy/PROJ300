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

// typedef
typedef enum logic [1:0] {instructions=2'd0,mmr,stack} state_t;

// loop var
int unsigned i;

bit err_flag = 0;

// testing
// you can access and assert internal signals via hierarchies e.g. dut.INTERNAL_SIGNAL_NAME
// typedefs need to be placed in the tb file as well to be used
initial begin

    MEMLOAD = 1;

    for(i=0;i<(2**12)-1;i++) begin
        addr = i[11:0];
        #10ns;

        // Instructions
        if (addr >= 12'h000 && addr <= 12'h400) begin
            assert(sel == 'd0 && {load_mmr,load_stack} == {1'b0,1'b0}) else begin $error("failed instructions %d",i); err_flag=1; end
            assert(dut.state == instructions) else begin $error("failed instructions %d",i); err_flag=1; end
        end

        // Memory mapped registers
        else if (addr >= 12'h401 && addr <= 12'h44B) begin
            assert(sel == 'd1 && {load_mmr,load_stack} == {MEMLOAD,1'b0}) else begin $error("failed mmr %d",i); err_flag=1; end
            assert(dut.state == mmr) else begin $error("failed mmr %d",i); err_flag=1; end
        end

        // Stack memory
        else if (addr >= 12'h44C && addr <= 12'hFFF) begin
            assert(sel == 'd2 && {load_mmr,load_stack} == {1'b0,MEMLOAD}) else begin $error("failed stack %d",i); err_flag=1; end
            assert(dut.state == stack) else begin $error("failed stack %d",i); err_flag=1; end
        end


    end


    if(!err_flag) $display("\n///// ALL TESTS PASSED /////");
    else $display("\n///// SOME TESTS FAILED /////");


end



endmodule