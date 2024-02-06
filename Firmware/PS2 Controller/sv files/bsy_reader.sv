module bsy_reader (output logic [7:0] data_out, input logic [7:0] data_in, input logic bsy);

always_comb begin

    if (!bsy) begin

        data_out = data_in;

    end

    else begin

        data_out = 'd0;

    end


end


endmodule