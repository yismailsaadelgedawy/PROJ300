module break_code_detector (output logic q, input logic [7:0] data, input logic clk);

logic temp = 0;
logic [24:0] counter = 0;

always_comb begin

    q = temp;


end

// 50MHz clock input
always_ff @(posedge clk) begin

  
    if (data == 8'hF0) begin

        temp <= 1;


    end


    if (temp == 1) begin

        counter <= counter + 1;


    end

    // 10ms timer
    // holds the flag high for 10ms (longer than data frame)
    // to reset output back to zero when releasing key
    if (counter == 'd250000) begin

        temp <= 'd0;
        counter <= 'd0;


    end



end




endmodule