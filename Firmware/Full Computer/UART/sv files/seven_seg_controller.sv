module seven_seg_controller (output logic [0:6] disp0, disp1, input logic [7:0] data);

// this is just for two displays for now

logic [3:0] disp0_reg;
logic [3:0] disp1_reg;
int i;


always_comb begin

   disp0_reg = data[3:0];
   disp1_reg = data[7:4];


end

// disp0 block
always_comb begin

   case(disp0_reg)


   4'd0 : begin

    disp0 = 7'b1111110; // all except 6

   end

   4'd1 : begin

    disp0 = 7'b0110000; // 1 and 2

   end

   4'd2 : begin

    disp0 = 7'b1101101; // 0, 1, 6, 4 and 3

   end

   4'd3 : begin

    disp0 = 7'b1111001; // 0 1 2 3 6

   end

   4'd4 : begin

    disp0 = 7'b0110011; // 1 2 5 6

   end

   4'd5 : begin

    disp0 = 7'b1011011; // 0 2 3 5 6

   end

   4'd6 : begin

    disp0 = 7'b1011111; // all except 1

   end

   4'd7 : begin

    disp0 = 7'b1110000; // 0 1 2

   end

   4'd8 : begin

    disp0 = 7'b1111111; // all

   end

   4'd9 : begin

    disp0 = 7'b1110011; // 0 1 2 5 6

   end

   4'd10 : begin

    disp0 = 7'b1110111; // all except 3

   end

   4'd11 : begin

    disp0 = 7'b0011111; // all except 0 and 1

   end

   4'd12 : begin

    disp0 = 7'b1001110; // 0 3 4 5

   end

   4'd13 : begin

    disp0 = 7'b0111101; // all except 0 and 5

   end

   4'd14 : begin

    disp0 = 7'b1001111; // all except 1 and 2

   end

   4'd15 : begin

    disp0 = 7'b1000111; // 0 4 5 6

   end

   endcase
    
end




// disp1 block
always_comb begin

   case(disp1_reg)


   4'd0 : begin

    disp1 = 7'b1111110;

   end

   4'd1 : begin

    disp1 = 7'b0110000; // 1 and 2

   end

   4'd2 : begin

    disp1 = 7'b1101101; // 0, 1, 6, 4 and 3

   end

   4'd3 : begin

    disp1 = 7'b1111001; // 0 1 2 3 6

   end

   4'd4 : begin

    disp1 = 7'b0110011; // 1 2 5 6

   end

   4'd5 : begin

    disp1 = 7'b1011011; // 0 2 3 5 6

   end

   4'd6 : begin

    disp1 = 7'b1011111; // all except 1

   end

   4'd7 : begin

    disp1 = 7'b1110000; // 0 1 2

   end

   4'd8 : begin

    disp1 = 7'b1111111; // all

   end

   4'd9 : begin

    disp1 = 7'b1110011; // 0 1 2 5 6

   end

   4'd10 : begin

    disp1 = 7'b1110111; // all except 3

   end

   4'd11 : begin

    disp1 = 7'b0011111; // all except 0 and 1

   end

   4'd12 : begin

    disp1 = 7'b1001110; // 0 3 4 5

   end

   4'd13 : begin

    disp1 = 7'b0111101; // all except 0 and 5

   end

   4'd14 : begin

    disp1 = 7'b1001111; // all except 1 and 2

   end

   4'd15 : begin

    disp1 = 7'b1000111; // 0 4 5 6

   end

   endcase
    
end




endmodule