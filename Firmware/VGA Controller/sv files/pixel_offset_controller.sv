module pixel_offset_controller (
    
    output logic [9+1:0] row_offset, column_offset,
    input logic [3:0] key, 
    input logic [9+1:0] pixel1_row_pos,
    input logic [9+1:0] pixel2_row_pos,
    input logic [9+1:0] pixel3_column_pos,
    input logic [9+1:0] pixel4_column_pos, 
    input logic rst, clk
);


// registers

// offsets for pixel movement
logic signed [9+1:0] row_offset_reg;
logic signed [9+1:0] column_offset_reg;

// 4-pixel positions for edge detection
logic signed [9+1:0] pixel1_row_pos_reg;
logic signed [9+1:0] pixel2_row_pos_reg;
logic signed [9+1:0] pixel3_column_pos_reg;
logic signed [9+1:0] pixel4_column_pos_reg;



always_comb begin

    row_offset = row_offset_reg;
    column_offset = column_offset_reg;

    pixel1_row_pos_reg = pixel1_row_pos;
    pixel2_row_pos_reg = pixel2_row_pos;
    pixel3_column_pos_reg = pixel3_column_pos;
    pixel4_column_pos_reg = pixel4_column_pos;


end


always_ff @(posedge clk) begin

    casez({rst,key})

    {1'b1,4'b????} : begin

        row_offset_reg <= 0;
        column_offset_reg <= 0;

    end

    {1'b0,4'b1000} : begin

        row_offset_reg <= row_offset_reg - 1;               // up

    end

    {1'b0,4'b0100} : begin

        row_offset_reg <= row_offset_reg + 1;               // down

    end

    {1'b0,4'b0010} : begin

        column_offset_reg <= column_offset_reg - 1;         // left

    end

    {1'b0,4'b0001} : begin

        column_offset_reg <= column_offset_reg + 1;         // right

    end


    // any other condition is a memory condition
    // so if more than one button is pressed, reg values do not change :)



    endcase


end



endmodule