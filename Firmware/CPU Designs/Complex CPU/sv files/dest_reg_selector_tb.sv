module dest_reg_selector_tb;

// internal wires

// in
logic [39:0] state;
logic [3:0] rop1;
logic [3:0] rop2;
logic [3:0] rop1_AL;
logic [3:0] rop2_AL;


// out
logic [3:0] GPR_sel1;
logic [3:0] GPR_sel2;

// inst and wiring
dest_reg_selector dut (

    // in
    .state(state),
    .rop1(rop1),
    .rop2(rop2),
    .rop1_AL(rop1_AL),
    .rop2_AL(rop2_AL),

    // out
    .GPR_sel1(GPR_sel1),
    .GPR_sel2(GPR_sel2)

);

// loop vars
int unsigned i=0;


// testing
initial begin

    rop1 = 4'h1;     // r1
    rop1_AL = 4'h2;  // r2

    rop2 = 4'h3;     // r3
    rop2_AL = 4'h4;  // r4

    for(i=0;i<40;i++) begin

        state = 1<<i;
        #10ns;

        if(state == 2**26 || state == 2**28 || state == 2**30 || state == 2**32 || state == 2**34 || state == 2**36) begin
            assert(GPR_sel1 == rop1_AL && GPR_sel2 == rop2_AL) $display("passed AL state %d",i); else $error("failed AL state %d",i);
        end

        else begin
            assert(GPR_sel1 == rop1 && GPR_sel2 == rop2) else $error("failed rest of states %d",i);
        end        


    end


end




endmodule