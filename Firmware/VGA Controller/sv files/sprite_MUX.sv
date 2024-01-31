module sprite_MUX #(parameter M=2, B=$clog2(M)) (output logic [11:0] colour_data, input logic[11:0] a, b, input logic[B-1:0] s);

// MUX to be used with the selector chip connected to
// its select input, s

// a,b -> colour data input from the ROMs
// s -> select line bus
// colour_data -> output colour data


always_comb begin

    case(s)

    'd0 : begin

        colour_data = a;
    end

    'd1 : begin

        colour_data = b;
    end


    endcase

end



endmodule