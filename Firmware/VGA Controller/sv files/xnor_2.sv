module xnor_2 (output logic q, input logic a, b);

always_comb begin

    if (a != b) begin

        q = 0;

    end

    else begin

        q = 1;

    end


end



endmodule