module t_ff (output logic q, input logic t, rst, clk);

// T ff to divide the 50MHz by 2
// 25MHz is the pixel clock for the VGA controller

always_ff @(posedge clk) begin

    casez({rst, t})

    2'b1? : begin

        q <= 0;

    end

    2'b01 : begin

        q <= ~q;

    end

    // latching condition 00 implied!


    endcase


end



endmodule
