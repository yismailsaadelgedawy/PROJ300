module FPGA_counter #(parameter NUMBER_OF_DEVICES=4)(

    output logic [4:0] q,

    input logic LE, rst    

);

// 5-bit FPGA counter
// up to 32 devices to show on the PCB

logic [4:0] cnt_reg;

assign q = cnt_reg;


always_ff @(posedge LE) begin

    if(rst) cnt_reg <= 0;

    else  begin

        cnt_reg <= cnt_reg + 1;
        if(cnt_reg == NUMBER_OF_DEVICES-1) cnt_reg <= 0;        
        
    end

    

end


endmodule