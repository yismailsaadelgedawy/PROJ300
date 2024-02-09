module special_key_detector (output logic enter_toggle, rshift_toggle, input logic [7:0] data, input logic clk);

// This module detects special keys via Sticky Keys (toggling)
// this module detects:
// Enter
// Rshift

logic enter_flag = 0;
logic rshift_flag = 0;

always_comb begin

    enter_toggle = enter_flag;
    rshift_toggle = rshift_flag;


end

// ps2 clock
// so it toggles once per key press
always_ff @(negedge clk) begin

  
    // Enter - sharp notes toggle
    if (data == 8'h5A) begin

        enter_flag = ~enter_flag;


    end

    // Rshift - octave toggle
    if (data == 8'h59) begin

        rshift_flag = ~rshift_flag;


    end



end




endmodule