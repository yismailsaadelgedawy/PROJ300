module CD4024 (

    output logic [6:0] q,

    input logic clk, rst    

);

// 7-bit counter

logic [6:0] cnt_reg;

assign q = cnt_reg;


// this IC counts on the falling edge of the clock
always_ff @(negedge clk or posedge rst) begin

    if(rst) cnt_reg <= 0;

    else cnt_reg <= cnt_reg + 1;

end


endmodule