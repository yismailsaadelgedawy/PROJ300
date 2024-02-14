module uart_clk_divN #(parameter baud=9600) (output logic clk_out, input logic clk_in, rst, sense, bsy);

// a custom version of fine_clk_divN the module // 
// bsy comes from the uart_controller chip //

// transmission_state: flag to indicate state of transmission state (from uart_controller)
// 1: sot (start of transmission)
// 0: eot (end of transmission)

logic transmission_state = 0;

logic bsy_posedge_waiting = 0;

// 25 bits
logic [24:0] counter_reg;

// connected to the 50MHz clock (FPGA PIN_M9)
parameter N=(50000000)/(2*baud);
logic [24:0] value = N;


always_ff @(posedge clk_in) begin

    case(rst)

    1 : begin

        
        counter_reg <= value - 1;   // this is such that the clk_out is high as soon as transmission starts!
        clk_out <= 0;


    end

    0 : begin

        // no longer idle
        // this takes precedence
        if (!sense) begin

            transmission_state <= 1;    // sot

        end

        else if (!bsy) begin

            bsy_posedge_waiting <= 1;


        end


        if (bsy_posedge_waiting == 1 && bsy == 1) begin

            transmission_state <= 0;    // eot
            bsy_posedge_waiting <= 0;
            


        end


        if (transmission_state == 1) begin


            if (counter_reg != value) begin

                counter_reg <= counter_reg + 1;

            end

            else begin

                clk_out <= ~clk_out;
                counter_reg <= 'd0;


            end



        end

        else begin
            
            counter_reg <= value - 1;
            clk_out <= 'd0;

        end

        

    end

    endcase



end


endmodule