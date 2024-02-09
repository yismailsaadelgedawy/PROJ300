module shift_detector (output logic q, input logic [7:0] data, input logic clk);

logic temp = 0;

always_comb begin

    q = temp;


end

// ps2 clock
// so it toggles once per key press
always_ff @(negedge clk) begin

  
    if (data == 8'h12) begin

        temp = ~temp;


    end




end




endmodule