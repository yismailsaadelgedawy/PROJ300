module sprite_ROM_square3 #(parameter M=4) (output logic[11:0] q, input logic[9:0] row, column);

// internal registers
logic[9:0] row_reg;
logic[9:0] column_reg;


// ROM for a 16 pixel square
// from (100,100) to (100,103) and
// from (100,100) to (103,100)
logic [11:0] memory [2**M-1:0] = '{

    12'hF00, 12'hF00, 12'h0F0, 12'h0F0,
    12'hF00, 12'hF00, 12'h0F0, 12'h0F0,
    12'h0F0, 12'h0F0, 12'hF00, 12'hF00,
    12'h0F0, 12'h0F0, 12'hF00, 12'hF00
    

};


// connections to registers
always_comb begin

    row_reg = row;
    column_reg = column;


end


// output logic
always_comb begin

    case({row_reg, column_reg})

    // row 1

    {10'd100, 10'd100} : begin

        q = memory[0];

    end

    {10'd100, (10'd100 + 10'd1)} : begin

        q = memory[1];

    end

    {10'd100, 10'd102} : begin

        q = memory[2];

    end

    {10'd100, 10'd103} : begin

        q = memory[3];

    end


    // row 2
    
    {10'd101, 10'd100} : begin

        q = memory[4];

    end

    {10'd101, 10'd101} : begin

        q = memory[5];

    end

    {10'd101, 10'd102} : begin

        q = memory[6];

    end

    {10'd101, 10'd103} : begin

        q = memory[7];

    end

    // row 3
    
    {10'd102, 10'd100} : begin

        q = memory[8];

    end

    {10'd102, 10'd101} : begin

        q = memory[9];

    end

    {10'd102, 10'd102} : begin

        q = memory[10];

    end

    {10'd102, 10'd103} : begin

        q = memory[11];

    end


    // row 4
    
    {10'd103, 10'd100} : begin

        q = memory[12];

    end

    {10'd103, 10'd101} : begin

        q = memory[13];

    end

    {10'd103, 10'd102} : begin

        q = memory[14];

    end

    {10'd103, 10'd103} : begin

        q = memory[15];

    end
    

    default : begin

        q = 12'h000;

    end


    endcase

    


end








endmodule