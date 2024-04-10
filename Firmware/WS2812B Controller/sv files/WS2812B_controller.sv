module WS2812B_controller #(parameter N=32, GRB_colour = 24'hFF0000) (

    output logic data_out,

    input logic [N-1:0] data_in,
    input logic clk_50, rst

);

// total time taken to light up N LEDs:
// 24*(400ns+800ns)*NLEDs
// N = 32 -> 1ms; so cannot sample input data @f > 1kHz
// sampling will be controlled by D-ff connected to desired fsampling
// whose output is the controller's input!

// register to hold data
logic [N-1:0] data_reg;
logic [N-1:0] prev_data_reg;

// register to hold colour data for A SINGLE LED
// drawback: each strip will be the same colour
logic [23:0] GRB_reg = GRB_colour;  // green by default
logic [23:0] OFF_reg = 24'h000000; // off

// register timers
logic [5:0] counter1_reg;
logic [5:0] counter2_reg;
logic [11:0] counter_reset_reg;

// counter that counts from 24
// each led needs 24 bits of data (GRB) - MSB FIRST
logic [4:0] counterGRB_reg = 23;
logic [4:0] curr_reg;
logic [4:0] prev_reg;

// index counter that counts from N
logic [5:0] idx_reg = (N-1);

// time taken to reach value, T = value/fclk
// thus value = T*fclk = T*50M
// two times we care about: 0.4us, 0.8us and 55us so,
// value(0.4us) = 20
// value(0.8us) = 40
parameter N_400ns = 20;
parameter N_800ns = 40;
parameter N_55us = 2750;
logic rst_flag = 0;


// 50MHz clk
always_ff @(posedge clk_50) begin
    
    if(rst) begin
        
        rst_flag <= 0;
        data_reg <= 'd0;
        counter1_reg <= 'd0; counter2_reg <= 'd0; counter_reset_reg <='d0; counterGRB_reg <= 'd23; idx_reg <= (N-1);   // all the counters
        curr_reg <= 'd0; prev_reg <= 'd0;
        prev_data_reg <= 'd0;
        data_out <= 0;

    end

    else begin

        // store input
        data_reg <= data_in;
        prev_data_reg <= data_reg;

        // if there is an input change (see max sampling frequency note above)....
        // then set flag
        if(data_reg != prev_data_reg) begin

            rst_flag <= 1;

            // clear counters
            counter1_reg <= 'd0; counter2_reg <= 'd0; counter_reset_reg <='d0; counterGRB_reg <= 'd23; idx_reg <= (N-1);   // all the counters
            
            
        end

        // reset code
        if(rst_flag) begin

            if(counter_reset_reg != N_55us) begin

                data_out <= 0;
                counter_reset_reg <= counter_reset_reg + 1;
            end

            else begin

                rst_flag <= 0;
                counter_reset_reg <= 'd0; // reset timer

            end

        end

        else begin

            // both high and low codes: high voltage comes first
            // also MSB SENT FIRST (in order of: GRB)           

            // LED will be on a certain colour
            if(data_reg[idx_reg]) begin

                // low code
                if(!GRB_reg[counterGRB_reg]) begin

                    // T0H = 0.4us
                    if(counter1_reg != N_400ns && counter2_reg == 'd0) begin

                        counter2_reg <= 'd0; // reset other timer

                        data_out <= 1;
                        counter1_reg <= counter1_reg + 1;

                    end

                    // when first timer completed...
                    // T0L = 0.8us
                    else if(counter2_reg != N_800ns) begin    

                        counter1_reg <= 'd0; // reset other timer                

                        data_out <= 0;
                        counter2_reg <= counter2_reg + 1;

                    end

                    // whens second timer completed...
                    else begin

                        counter2_reg <= 'd0; // reset other timer
                        counterGRB_reg <= counterGRB_reg - 1;

                    end


                end

                // high code
                else begin

                    // T0H = 0.8us
                    if(counter1_reg != N_800ns && counter2_reg == 'd0) begin

                        counter2_reg <= 'd0; // reset other timer

                        data_out <= 1;
                        counter1_reg <= counter1_reg + 1;

                    end

                    // when first timer completed...
                    // T0L = 0.4us
                    else if(counter2_reg != N_400ns) begin    

                        counter1_reg <= 'd0; // reset other timer                

                        data_out <= 0;
                        counter2_reg <= counter2_reg + 1;

                    end

                    // whens second timer completed...
                    else begin

                        counter2_reg <= 'd0; // reset other timer
                        counterGRB_reg <= counterGRB_reg - 1;

                    end


                end



                curr_reg <= counterGRB_reg;
                prev_reg <= curr_reg;

                // underflow check
                // syntax note: == -sd1, despite being equivalent, won't work
                // since the datatype of the register is not signed...
                if(counterGRB_reg == 'd31 && (curr_reg != prev_reg)) begin

                    counterGRB_reg <= 'd23;
                    idx_reg <= idx_reg - 1;
                    

                end

                if(idx_reg == 'd2**6-1) idx_reg <= (N-1); // underflow check


            end

            // LED will be off
            else begin

                // low code
                if(!OFF_reg[counterGRB_reg]) begin

                    // T0H = 0.4us
                    if(counter1_reg != N_400ns && counter2_reg == 'd0) begin

                        counter2_reg <= 'd0; // reset other timer

                        data_out <= 1;
                        counter1_reg <= counter1_reg + 1;

                    end

                    // when first timer completed...
                    // T0L = 0.8us
                    else if(counter2_reg != N_800ns) begin    

                        counter1_reg <= 'd0; // reset other timer                

                        data_out <= 0;
                        counter2_reg <= counter2_reg + 1;

                    end

                    // whens second timer completed...
                    else begin

                        counter2_reg <= 'd0; // reset other timer
                        counterGRB_reg <= counterGRB_reg - 1;

                    end


                end



                curr_reg <= counterGRB_reg;
                prev_reg <= curr_reg;
                
                // underflow check
                if(counterGRB_reg == 'd31 && (curr_reg != prev_reg)) begin

                    counterGRB_reg <= 'd23;
                    idx_reg <= idx_reg - 1;            

                end

                if(idx_reg == 'd2**6-1) idx_reg <= (N-1); // underflow check

            end

        end



    end



end


endmodule