module encoder (output logic [2-1:0] q, input logic [3-1:0] data);


// 3 buttons will be connected to this module
// key[2:0]

always_comb begin

    case(data)

    3'b000 : begin

        q = 'd0;

    end

    3'b001 : begin

        q = 'd1;

    end

    3'b010 : begin

        q = 'd2;

    end

    3'b100 : begin

        q = 'd3;

    end

    default : begin

        q = 'd0;

    end


    endcase


end




endmodule