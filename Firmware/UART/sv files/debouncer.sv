module debouncer (output logic q, input logic d, clk, rst);

// this register stores the current state we are in
// There are 3 states:
// 0 : idle
// 1 : pressed
// 2 : released
logic [1:0] state_reg = 'd0;
logic [24:0] counter_reg = 'd0;

// N = Ttoggle * clk
int unsigned N = 0.1 * 50000000;   // debounce for 100ms

// takse 50MHz clock
always_ff @(posedge clk or posedge rst) begin

    if (rst) begin

        state_reg <= 'd0;
        counter_reg <= 'd0;
        q <= 0;


    end

    else begin

        case(state_reg)

        // idle state
        2'd0 : begin

            if (d) begin
                state_reg <= 'd1;   // go to next state
            end


        end

        // pressed state
        2'd1 : begin

            // wait for 100ms
            // can't use parameters in logical expressions
            // use unsigned int instead
            if (counter_reg != N) begin

                counter_reg <=  counter_reg + 1;

            end

            // then, do this
            else begin

                q <= 1;

                if (!d) begin
                    state_reg <= 'd2;   // go to next state
                    counter_reg <= 'd0;
                end

            end



        end


        // released state
        2'd2 : begin

            // wait for 100ms
            if (counter_reg != N) begin

                counter_reg <=  counter_reg + 1;

            end

            // then, do this
            else begin

                q <= 0;
                counter_reg <= 'd0;
                state_reg <= 'd0;   //  loop back to idle state
               

            end


        end




        endcase




    end






end




endmodule