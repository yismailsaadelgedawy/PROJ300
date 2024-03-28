module FPGA_counter (

    output logic [4:0] q,

    input logic LE, rst    

);

// 4-bit FPGA counter

logic [4:0] cnt_reg;

assign q = cnt_reg;


always_ff @(posedge LE or posedge rst) begin

    if(rst) cnt_reg <= 0;

    else cnt_reg <= cnt_reg + 1;

end


endmodule