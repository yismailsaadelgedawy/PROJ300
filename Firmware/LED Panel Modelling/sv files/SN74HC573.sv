module SN74HC573 (

    output logic [7:0] q,

    input logic OE,
    input logic [7:0] d,
    input logic LE


);

// octal D-latch

logic [7:0] internal_reg = 'd0;

always_comb begin

    if(OE) q = 'dz; // active low
    else q = internal_reg;    

end


always_latch begin

    if(LE) internal_reg = d;
    
end



endmodule