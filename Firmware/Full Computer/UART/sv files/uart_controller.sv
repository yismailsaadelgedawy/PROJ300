module uart_controller (output logic [7:0] data_out, output logic bsy, input logic clk, rst, data_in);



logic [7:0] shift_reg;
logic [3:0] counter_reg;
int i;

always_comb begin

    data_out = shift_reg;

end


// sampling on negedge of the clk
// clk must = the baud rate
// so if baud = 9600, clk should be 9600Hz
// this is such that the negedge aligns with the middle of the bit period

always_ff @(negedge clk or posedge rst) begin

    if(rst) begin

        shift_reg <= 'd0;
        counter_reg <= 'd0;
        bsy <= 1;


    end

    else begin


        counter_reg <= counter_reg + 1;
        bsy <= 1;   // bsy is high by default

        // data frame is 10 bits
        // bit 1: start bit (0)
        // bits 2-9: data frame (LSB first)
        // bit 10: stop bit (1)


        // store bits 2-9
        if (counter_reg >= 'd1 && counter_reg < 'd9) begin

            shift_reg[7] <= data_in;

            // shifting logic

            for (i=6; i>-1; i--) begin

                shift_reg[i] <= shift_reg[i+1];

            end



        end

        // bit 10 (stop bit)
        // remember this will execute the next edge
        if (counter_reg == 'd9) begin

            bsy <= 0;   // pulse bsy low

        end

        // bit 11
        if (counter_reg == 'd10) begin


            counter_reg <= 'd0;
            shift_reg <= 'd0;   // not needed, but looks nice


        end





    end



end







endmodule