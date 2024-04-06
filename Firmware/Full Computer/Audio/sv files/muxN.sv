module muxN #(parameter N=4, M=$clog2(N)) (output logic q, input logic [N-1:0] data, input logic [M-1:0] sel);


always_comb begin

    q = data[sel];

end


endmodule