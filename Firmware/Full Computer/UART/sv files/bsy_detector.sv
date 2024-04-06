module bsy_detector (

    output logic [7:0] data_out,
    output logic eot,   // end of transmission flag (stop bit) 

    input logic [7:0] data_in, 
    input logic bsy, rst

);

// detects bsy pulse from ps2 device

always_latch begin
 
    if (rst) begin

        data_out <= 'd0;

    end

    // only read if bsy flag is low
    else if(!bsy) begin

        data_out <= data_in;
        eot <= 1;
  

    end

    else eot <= 0;
    


end




endmodule