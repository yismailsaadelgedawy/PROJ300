module pixel_offset_controller (
    
    output logic [9+1:0] row_offset, column_offset,
    input logic [3:0] key, 
    input logic [43:0] pixel_pos, // 4*11-bit pixel data
    input logic rst, clk
);


// registers

// offsets for pixel movement
logic signed [9+1:0] row_offset_reg;
logic signed [9+1:0] column_offset_reg;


always_comb begin

    row_offset = row_offset_reg;
    column_offset = column_offset_reg;


end


always_ff @(posedge clk) begin

    casez({rst,key})

    {1'b1,4'b????} : begin

        row_offset_reg <= 0;
        column_offset_reg <= 0;

    end

    {1'b0,4'b1000} : begin

        // pixel2_row_pos
        if (pixel_pos[21:11] != 11'sd0) begin

            row_offset_reg <= row_offset_reg - 1;               // up

        end
        

    end

    {1'b0,4'b0100} : begin

        // pixel1_row_pos
        if (pixel_pos[10:0] != 11'sd479) begin

            row_offset_reg <= row_offset_reg + 1;               // down

        end
    end

    {1'b0,4'b0010} : begin

        // pixel3_column_pos
        if (pixel_pos[32:22] != 11'sd0) begin

            column_offset_reg <= column_offset_reg - 1;         // left

        end

    end

    {1'b0,4'b0001} : begin

        // pixel4_column_pos
        if (pixel_pos[43:33] != 11'sd639) begin

            column_offset_reg <= column_offset_reg + 1;         // right

        end

    end


    // any other condition is a memory condition
    // so if more than one button is pressed, reg values do not change :)



    endcase


end



endmodule