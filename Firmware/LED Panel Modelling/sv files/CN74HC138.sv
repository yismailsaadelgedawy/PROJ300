module CN74HC138 (

    output logic [7:0] Y,

    input logic E1,E2,E3,
    input logic [2:0] A

);


// 1x8 demux (active low)

always_comb begin

    if(E1 || E2) {Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]} = 8'b11111111;

    else begin

        case(A)

        'd0 : begin
            {Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1]} = 7'b1111111;
            Y[0] = ~E3;
        end

        'd1 : begin
            {Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[0]} = 7'b1111111;
            Y[1] = ~E3;
        end

        'd2 : begin
            {Y[7],Y[6],Y[5],Y[4],Y[3],Y[1],Y[0]} = 7'b1111111;
            Y[2] = ~E3;
        end

        'd3 : begin
            {Y[7],Y[6],Y[5],Y[4],Y[2],Y[1],Y[0]} = 7'b1111111;
            Y[3] = ~E3;
        end

        'd4 : begin
            {Y[7],Y[6],Y[5],Y[3],Y[2],Y[1],Y[0]} = 7'b1111111;
            Y[4] = ~E3;
        end

        'd5 : begin
            {Y[7],Y[6],Y[4],Y[3],Y[2],Y[1],Y[0]} = 7'b1111111;
            Y[5] = ~E3;
        end

        'd6 : begin
            {Y[7],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]} = 7'b1111111;
            Y[6] = ~E3;
        end

        'd7 : begin
            {Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]} = 7'b1111111;
            Y[7] = ~E3;
        end


        endcase


    end

    


end


endmodule