module selector #(parameter M=2, B=$clog2(M)) (output logic [B-1:0] s, input logic[11:0] a,b);

// selector chip that controls the logic for the MUX select bus
// M -> number of ROMs used (rounded up to the next power of 2)
// B -> number of bits on the select bus


always_comb begin

    casez({a,b})

    // this condition should take precedence
    {12'h000 , 12'h000} : begin

        s = 'd0;    // selects a if both are zero

    end

    {12'h000 , 12'h???} : begin

        s = 'd1;    // selects b if a is zero

    end

    {12'h??? , 12'h000} : begin

        s = 'd0;    // selects a if b is zero

    end


    default : begin

        s = 'd0;    // by default, select a

    end

    endcase



end




endmodule