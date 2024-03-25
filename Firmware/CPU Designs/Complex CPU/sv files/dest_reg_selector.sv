module dest_reg_selector (

    output logic [3:0] GPR_sel1,
    output logic [3:0] GPR_sel2,

    input logic [39:0] state,
    input logic [3:0] rop1,     // 15..12 (default)
    input logic [3:0] rop2,     //
    input logic [3:0] rop1_AL,  // 11..8
    input logic [3:0] rop2_AL   // 11..8

);

always_comb begin

    // add1, sub1, mul1, lsr1, add1, or1
    // 2**n = 1<<n
    if(state == 2**26 || state == 2**28 || state == 2**30 || state == 2**32 || state == 2**34 || state == 2**36) begin
        GPR_sel1 = rop1_AL;
        GPR_sel2 = rop2_AL;
    end

    // ALTmov1
    else if(state == 2**5) begin
        GPR_sel1 = rop2; // passes operand2 bits; so the operand register is stored in TR
        GPR_sel2 = rop2;
    end

    else begin
        GPR_sel1 = rop1;
        GPR_sel2 = rop2;
    end



end


endmodule