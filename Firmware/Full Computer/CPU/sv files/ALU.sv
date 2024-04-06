module ALU #(parameter N=32) (
    
    output logic [N-1:0] q,

    input logic [N-1:0] op1, op2,
    input logic [2:0] ALUSEL // 3-bits

);

// op1 - operand 1
// op2 - operand 2


always_comb begin

    case (ALUSEL)

    3'd0 : begin

        q = op1 + op2;

    end

    3'd1 : begin

        q = op1 - op2;

    end

    3'd2 : begin

        q = op1 * op2;

    end

    3'd3 : begin

        q = op1 >> op2;

    end

    3'd4 : begin

        q = op1 & op2;

    end
    
    3'd5 : begin

        q = op1 | op2;

    end

    3'd6 : begin

        q = ~op2;

    end


    // needed otherwise will not be realisable with comb logic!
    default : begin

        q = op1 + op2;  // addition by default (does not really matter what goes here)


    end





    endcase

  


end





endmodule