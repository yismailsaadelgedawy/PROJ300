module sprite_ROM_square2 #(parameter M=2) (output logic[11:0] q, input logic[9:0] row, column);

// internal registers
logic[9:0] row_reg;
logic[9:0] column_reg;
logic[9:0] offset_reg;

// ROM for a 4 pixel square
logic [11:0] memory [2**M-1:0] = '{

    12'hF00, 12'h0F0,
    12'h0F0, 12'hF00

};


// connections to registers
always_comb begin

    row_reg = row;
    column_reg = column;


end


// output logic
always_comb begin

    case({row_reg, column_reg})

    {10'd200, 10'd200} : begin

        q = memory[0];

    end

    {10'd200, 10'd201} : begin

        q = memory[1];

    end

    {10'd201, 10'd200} : begin

        q = memory[2];

    end

    {10'd201, 10'd201} : begin

        q = memory[3];

    end

    default : begin

        q = 12'h000;

    end


    endcase

    


end








endmodule