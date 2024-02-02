module sprite_ROM_square #(parameter M=2) (output logic[11:0] q, input logic[9+1:0] row, column);

// internal registers
logic signed[9+1:0] row_reg;
logic signed[9+1:0] column_reg;

// offset registers
logic signed[9+1:0] offset_row_reg = -'sd10;
logic signed[9+1:0] offset_column_reg = -'sd10;


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

int row_start_pos = 100;
int row_end_pos = 101;
int column_start_pos = 100;
int column_end_pos = 101;



// connections to registers
always_comb begin

    row_reg = row;
    column_reg = column;


end


// output logic
always_comb begin

    for (int address = 0; address < 2**M; address=address+1) begin
        
        for (int i1 = row_start_pos; i1 < row_end_pos + 1; i1=i1+1) begin

            for (int i2 = column_start_pos; i2 < column_end_pos + 1; i2=i2+1) begin

                case({row_reg,column_reg})

                {i1[10:0]+offset_row_reg,i2[10:0]+offset_column_reg} : begin    // stays F00; why?

                    q = memory[address];

                end

                // default : begin  // stays 0; why?

                //     q = 12'h000;

                // end


                endcase




            end

        end


    end


end

endmodule