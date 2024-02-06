module bsy_reader (output logic [7:0] data_out, input logic [7:0] data_in, input logic clk, bsy, rst);

always_ff @(negedge clk or posedge rst) begin
 
    if (rst) begin

        data_out <= 'd0;

    end

    else if(!bsy) begin

        data_out = data_in;

    end
    

end


endmodule