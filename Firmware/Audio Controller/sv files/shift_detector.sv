module shift_detector (output logic sharp_toggle, octave_toggle, input logic [7:0] data, input logic clk);

logic temp = 0;
logic temp2 = 0;

always_comb begin

    sharp_toggle = temp;
    octave_toggle = temp2;


end

// ps2 clock
// so it toggles once per key press
always_ff @(negedge clk) begin

  
    // Enter - sharp notes toggle
    if (data == 8'h5A) begin

        temp = ~temp;


    end

    // Rshift - octave toggle
    if (data == 8'h59) begin

        temp2 = ~temp2;


    end


    




end




endmodule