module rgb_controller (output logic[3:0] r, g, b, input logic[9:0] row, column, input logic[11:0] colour_data, input logic rst, en, clk);

logic[9:0] row_reg;
logic[9:0] column_reg;
logic[11:0] colour_reg;

always_comb begin

    row_reg = row;
    column_reg = column;
    

    r = colour_reg[11:8];
    g = colour_reg[7:4];
    b = colour_reg[3:0];


end


always_ff @(posedge clk) begin

    casez({rst, en})

    2'b1? : begin

        colour_reg = 12'h000;

    end


    2'b00 : begin

        colour_reg = 12'h000;

    end


    default : begin

        colour_reg = colour_data;

    end




    endcase

    

end




endmodule