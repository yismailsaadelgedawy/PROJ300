module sprite_ROM_square #(parameter M=2) (

    output logic [11:0] q,
    output logic [9+1:0] pixel1_row_pos,
    output logic [9+1:0] pixel2_row_pos,
    output logic [9+1:0] pixel3_column_pos,
    output logic [9+1:0] pixel4_column_pos, 
    input logic[9+1:0] row, column, row_offset, column_offset
    
);

// internal registers
logic signed[9+1:0] row_reg;
logic signed[9+1:0] column_reg;

// offset registers
logic signed[9+1:0] offset_row_reg;
logic signed[9+1:0] offset_column_reg;


// ROM for a 4 pixel square //

// coordinates (row,column)
// (100,100) (100,101)
// (101,100) (101,101)

// colours
// red green
// green red
logic [11:0] memory [2**M-1:0] = '{

    12'hF00, 12'h0F0,
    12'h0F0, 12'hF00

};


// connections to registers
always_comb begin

    row_reg = row;
    column_reg = column;

    offset_row_reg = row_offset;
    offset_column_reg = column_offset;

    pixel1_row_pos = 11'sd100 + offset_row_reg;
    pixel2_row_pos = 11'sd101 + offset_row_reg;
    pixel3_column_pos = 11'sd100 + offset_column_reg;
    pixel4_column_pos = 11'sd101 + offset_column_reg;


end


// output logic
always_comb begin

    case({row_reg, column_reg})

    {11'sd100 + offset_row_reg, 11'sd100 + offset_column_reg} : begin

        q = memory[0];

    end

    {11'sd100 + offset_row_reg, 11'sd101 + offset_column_reg} : begin

        q = memory[1];

    end

    {11'sd101 + offset_row_reg, 11'sd100 + offset_column_reg} : begin

        q = memory[2];

    end

    {11'sd101 + offset_row_reg, 11'sd101 + offset_column_reg} : begin

        q = memory[3];

    end

    default : begin

        q = 12'h000;

    end


    endcase

    


end








endmodule