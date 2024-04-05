module operand_MUX (

    output logic [31:0] data_out,

    input logic [11:0] rop,
    input logic [31:0] GPR,
    input logic sel
    
);

always_comb begin

    if(!sel) begin
        data_out = {20'd0,rop}; // clears the top 20 bits just to be safe
    end

    else begin
        data_out = GPR;
    end
    

end



endmodule