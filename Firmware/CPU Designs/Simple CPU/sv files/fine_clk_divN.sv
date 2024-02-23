module fine_clk_divN #(parameter f=500) (output logic clk_out, input logic clk_in, rst);

// a more finely controlled clock divider (1Hz to 25MHz) //

// N is the value the counter will count up to before resetting
// upon reaching N, clk_out will toggle state
// Tout = 2*N/clk_in -> clk_out = clk_in/2*N = 50MHz/2*N
// e.g. for N=100 and clk_in = 2Hz -> Tout = 2*100/2 = 100 seconds


// 25 bits
logic [24:0] counter_reg = 'd0;

// clk_out = 50MHz/2*N -> N = 50MHz/2*f
// where f = clk_out (desired output frequency)
// solving for (2^25 - 1) = 50MHz/2*f
// -> lowest frequency attainable with 25-bits is 0.745Hz
parameter N=(50000000)/(2*f);
logic [24:0] value = N;


always_ff @(posedge clk_in) begin

    case(rst)

    1 : begin

        counter_reg <= 'd0;
        clk_out <= 0;


    end

    0 : begin

        if (counter_reg != value) begin

            counter_reg <= counter_reg + 1;


        end

        else begin

            clk_out <= ~clk_out;
            counter_reg <= 'd0;

        end

    end

    endcase



end


endmodule