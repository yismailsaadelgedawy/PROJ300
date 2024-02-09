module octave_mux (output logic [12:0] q, input logic [12:0] octave_hi, octave_lo, input logic sel);

// 13 different notes of two octaves (III and IV) may be chosen


always_comb begin

   case(sel)

   0 : begin

    q = octave_hi;

   end

   1 : begin

    q = octave_lo;


   end


   endcase

end


endmodule