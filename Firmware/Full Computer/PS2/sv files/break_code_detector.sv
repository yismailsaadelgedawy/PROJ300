module break_code_detector (output logic release_flag, input logic [7:0] data, input logic clk);

logic released = 0; // flags whether key released or not
logic [24:0] counter = 0; // used as a timer


// PS2 clock is between 15kHz-16kHz
// longest case: 11 bits * 1/15kHz = 733us frame time

always_comb begin

    release_flag = released;

end

// 50MHz clock input
// if clock used is slower than ps2 clock, you will miss the event!
always_ff @(posedge clk) begin

    // break code upon key release is 2 bytes
    // (0xF0, make code)
    if (data == 8'hF0) begin

        released <= 1;


    end

    // begin timer...
    if (released == 1) begin

        counter <= counter + 1;


    end

    // Tpulse = N/50MHz
    // 5ms timer to reset output back to zero when releasing key
    // holds the flag high for 5ms (longer than data frame)
    // as reset is pulsed between the two bytes, it is CRUCIAL that
    // the reset pulse time > data frame
    if (counter == 'd250000) begin

        released <= 'd0;
        counter <= 'd0;


    end



end




endmodule