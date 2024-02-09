module ps2_controller (output logic [7:0] data_out, output logic bsy, input logic data_in, clk, rst);

logic [3:0] count_reg;
int i;

// PS/2 protocol (11-bit frame):
// 1 start bit (0)
// 8 data bits
// odd parity bit
// stop bit (1)

// This module counts each falling edge of the clock
// to keep track of what bit is being sent
// So each frame, counter will reach 11


// asyncrhonous reset line
always_ff @(negedge clk or posedge rst) begin

    if (rst) begin

        count_reg <= 'd0;
        data_out <= 'd0;
        bsy <= 1;

    end

    else begin

        count_reg <= count_reg + 1;
        bsy <= 1;

        // data frame
        if (count_reg >= 'd1 && count_reg <= 'd8) begin

            data_out[7] <= data_in;

            for (i=6; i>-1; i--) begin

                data_out[i] <= data_out[i+1];        


            end


        end

        // busy flag low at the end of transmission
        // can read this safely now
        if (count_reg == 'd10) begin

            bsy <= 0;

        end


        if (count_reg == 'd11) begin

            count_reg <= 'd1;
            data_out <= 'd0; // not necessary, but nice to reset back to zero at EoT
            

        end


    end

    


end





endmodule