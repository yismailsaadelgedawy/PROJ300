module ALU #(parameter N=8) (
    
    output logic [N-1:0] q,

    input logic [N-1:0] AC, AR,
    input logic ALUSEL

);

// AC - accumulator
// AR - address reg


// ALU with 2 mathematical operations
// ADD -- overflow CAN occur (flaw!)
// AND

always_comb begin

    if (!ALUSEL) begin

        q = AC + AR;

    end

    else begin

        q = AC & AR;

    end


end





endmodule