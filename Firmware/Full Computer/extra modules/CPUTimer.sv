module CPUTimer (

    output logic rdy,

    input logic [12:0] Tms,
    input logic clk, rst
);

////// calculations based off 50MHz clock //////

// max value is 4294 million (4294 million seconds max delay)
logic [27:0] count_reg = 'd0;

// 28-bits: max delay ~5.36s
logic [27:0] N;

// N is not static, so use an always comb block
// not logic [27:0] N = ...
// or parameter N = ...
// as both of the above are static!
always_comb begin

    // Tms is the required delay, in ms
    N = Tms*50000;

end

always_ff @(posedge clk) begin

    if(rst) begin
        rdy <= 0;
        count_reg <= 'd0;
        
    end

    else begin       

        // timer stop
        if(Tms == 'd0) begin

            rdy <= 0;
            count_reg <= 'd0;

        end

        // timer start
        else begin

            if(count_reg != N) begin

                count_reg <= count_reg + 1;
                // not rdy <= 0; here
                // the CPU may miss it for whatever reason
                // instead, have it latch until the CPU stops the timer


            end

            else begin
                rdy <= 1;
                count_reg <= 'd0;   // doesn't matter as CPU will stop and reset timer by sending 0 anyways
            end

        


        end


    end


end




endmodule