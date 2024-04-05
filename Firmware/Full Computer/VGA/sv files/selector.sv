module selector (output logic s, input logic[11:0] a,b);

// selector chip that controls the logic for the MUX select bus
// always selects the non-zero colour data


always_comb begin

    casez({a,b})

    // this condition should take precedence
    {12'h000 , 12'h000} : begin

        s = 0;    // selects a if both are zero

    end

    {12'h000 , 12'h???} : begin

        s = 1;    // selects b if a is zero

    end

    {12'h??? , 12'h000} : begin

        s = 0;    // selects a if b is zero

    end


    default : begin

        s = 0;    // by default, select a

    end

    endcase



end




endmodule