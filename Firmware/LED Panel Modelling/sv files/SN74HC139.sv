module SN74HC139 (

    output logic [3:0] Y,

    input logic E,
    input logic [1:0] A

);


// 1x4 demux (active low)

always_comb begin

    if(E) {Y[3],Y[2],Y[1],Y[0]} = 4'b1111;

    else begin

        case(A)

        'd0 : begin
            {Y[3],Y[2],Y[1]} = 3'b111;
            Y[0] = E;
        end

        'd1 : begin
            {Y[3],Y[2],Y[0]} = 3'b111;
            Y[1] = E;
        end

        'd2 : begin
            {Y[3],Y[1],Y[0]} = 3'b111;
            Y[2] = E;
        end

        'd3 : begin
            {Y[2],Y[1],Y[0]} = 3'b111;
            Y[3] = E;
        end


        endcase


    end

    


end


endmodule