module systemBus_muxN #(parameter N=38) (

    output logic [N-1:0] q,

    input logic [N-1:0] PC,DR,AR,AC,MEM,TR,rop1,rop2,GPR1,
    input logic [3:0] sel


);


always_comb begin

    case(sel)

    4'd0 : begin

        q = PC;

    end

    4'd1 : begin

        q = DR;

    end

    4'd2 : begin

        q = AR;

    end

    4'd3 : begin

        q = AC;

    end

    4'd4 : begin

        q = MEM;

    end

    4'd5 : begin

        q = TR;

    end

    4'd6 : begin

        q = rop1;

    end

    4'd7 : begin

        q = rop2;

    end

    4'd8 : begin

        q = GPR1;

    end

    default : begin

        q = 'd0;    // does not matter what the output is here

    end


    endcase


end



endmodule