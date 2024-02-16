module address_counterN #(parameter N=2, MAX_ADDRESS=3) (output logic [N-1:0] address, input logic d, clk, rst);

// to be connected to instruction RAM

logic [N-1:0] counter_reg;


// register to hold previous value
logic current_reg = 0;
logic prev_reg = 0;


always_comb begin

    address = counter_reg;

end

// sometimes asyncrhonous resets do not synthesise properly
// when debugged using LEDs, you get floating outputs
// if that happens, don't use it -- should fix the issue (idk why though)
always_ff @(posedge clk) begin

    case(rst)

    1 : begin

        counter_reg <= 'd0;
        current_reg <= 0;
        prev_reg <= 0;


    end

    0 : begin

        current_reg <= d; // clk cycle 1
        prev_reg <= current_reg; // clk cycle 2

        // rising edge detector
        if (current_reg && !prev_reg) begin

            counter_reg <= counter_reg + 1;

            if(counter_reg == MAX_ADDRESS) begin

                counter_reg <= 'd0;

            end

        end

      



    end


    endcase




end




endmodule