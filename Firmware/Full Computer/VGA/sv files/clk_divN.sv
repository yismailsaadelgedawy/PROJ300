module clk_divN #(parameter N=18) (output logic clk_out, input logic clk_in, rst);

// input will be 50MHz
// 18-bit divider -> clk_out = 190.7Hz = 5.24ms
// this will allow a pixel to cross from column 0 to column 639
// in 640/190.7 = 3.36s

logic [N-1:0] counter;

always_comb begin

    clk_out = counter[N-1];

end

always_ff @(posedge clk_in) begin

    if (rst) begin

        counter <= 'd0;

    end

    else begin

        counter <= counter + 1;     // the ++ and -- operators are blocking; take care!!!

    end



end




endmodule