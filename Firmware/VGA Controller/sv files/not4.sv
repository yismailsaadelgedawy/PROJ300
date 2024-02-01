module not4 (output logic [3:0] q, input logic [3:0] a);

// 4-input NOT gate for the switches
// as they are active low

always_comb begin

    q = ~a;

end

endmodule