module PS2bsy_detector (output logic [7:0] data_out, input logic [7:0] data_in, input logic bsy, rst);

// detects bsy pulse from ps2 device

always_ff @(posedge rst or negedge bsy) begin
 
    if (rst) begin

        data_out <= 'd0;

    end

    // only read if bsy flag is low
    else if(!bsy) begin

        data_out <= data_in;
  

    end
    


end




endmodule