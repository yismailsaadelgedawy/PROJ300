module sprite_MUX (output logic [11:0] colour_data, input logic[11:0] a, b, input logic s);

// MUX to be used with the selector chip connected to
// its select input, s

// a,b -> colour data input from the ROMs
// s -> select line bus
// colour_data -> output colour data


always_comb begin

    case(s)

    0 : begin

        colour_data = a;
    end

    1 : begin

        colour_data = b;
    end


    endcase

end



endmodule