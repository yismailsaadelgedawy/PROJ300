module ps2_controller (output logic [7:0] data_out, output logic bsy, input logic data_in, clk, rst);

logic [3:0] count_reg;
int i;



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

            count_reg <= 'd0;
            data_out <= 'd0; // not necessary, but nice to reset back to zero at EoT
            

        end


    end

    


end





endmodule