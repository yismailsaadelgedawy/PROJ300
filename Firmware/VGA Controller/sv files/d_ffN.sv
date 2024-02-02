module d_ffN #(parameter N=11) (output logic [N-1:0] q, input logic [N-1:0] d, input logic clk, rst, en);


always_ff @(posedge clk) begin

    casez({rst,en})

    {1'b1,1'b?} : begin

        q <= '0;

    end

    {1'b0,1'b1} : begin

        q <= d;

    end

    // implied memory condition



    endcase



end





endmodule