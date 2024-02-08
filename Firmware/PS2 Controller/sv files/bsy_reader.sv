module bsy_reader (output logic [7:0] data_out, input logic [7:0] data_in, input logic bsy, rst);


always_ff @(posedge rst or negedge bsy) begin
 
    if (rst) begin

        data_out <= 'd0;

    end

    else if(!bsy) begin

        data_out <= data_in;
  

    end
    


end




endmodule